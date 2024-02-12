namespace Session2p1
{
    public class PersonLocation
    {
        public string PersonCode { get; set; } = null!;
        public string PersonRole { get; set;} = null!;
        public string LastSecurityPointNumber { get; set; } = null!;
        public string LastSecurityPointDirection { get; set; } = null!;
        public DateTime LastSecurityPointTime { get; set; }
    }
}
