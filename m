Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD29742B7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 19:46:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gGXkUNR/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsQq72NWNz3bmq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 03:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gGXkUNR/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::618; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsQpD34JKz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 03:45:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXh5JU6+gYE+aTsVwVnzfxgp+2UrnsMqoeXh66WsyEBypP8RRRrGjG6EC5d9kiywCH5LXO8VDlQvHpzdHArAzOvDT1ApilZ4+G3Wz+HKZofsrqptbrs8TO0Eh0heZT1FTxLVjr1s0k84tZcF1tn8eKeXytxsiHgr91I4OjkzbKLDjr+M5E0bc5kyhJ2fLPF66Oy5xKOoyGS14Oud5vVzq/U7tLbf/9eZeXvCECWOXPG4Fl1b4bvfEZcg+d+WWl4cXCRoz/olT2ubFiNZvyS93gp32FbM+I1S0IDfQqhLs25FOAvkJnDHanNOcviEuY9RfAQsssXjp/XGKbs2dhxZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9lpN4BqNMr9rszDw/RbBBfjIKOfr4xrmeI1j8P4rE8=;
 b=RHbO5aZL806OnRz9AlQV+0F3CpXMcnnKTcTYnLI0e5Y5J33l7k9//gd4z2rIyVAGh/6bfieQ8U3Tj1sGZQGP2VgIooTN5JO+18Jpq8DDW43NB+wMeUjsc6roaYx+ILb7C24+HVG9KpYo1BIyVJ4qCKhgdlTqCMxhsf8QSgo+N4o4ajqzWKzBLiNmMk8W216TmgyAO9gYSdtr/yw7xwgTsZ3O+YCjNBnwpkZNH2s4iQSlFJtcT0g5t75NUWDzYOShuKgBi4Y4UB9Xa2CP8kaE9FtpX784oZIU3RpYN3OjF2/QDKrRrk022SAMqO/dOo5/u2Qj8GkCYI8xUHaHHTm+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9lpN4BqNMr9rszDw/RbBBfjIKOfr4xrmeI1j8P4rE8=;
 b=gGXkUNR/0ipQQorIczi4oktS373nnjQVOj3LHdwvDbD28E6FDGToLXLlAls+QILDMlW32FTg4vl9OBpAWr/64Wf9U7UPVxgYT9PyV7efFw0xJ2Er4j2uS3MitLxs5hpGVGPy0y4kPTT7w5IflApVbRV2j6qPthGrezKl3+7qSf0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Thu, 29 Jun
 2023 17:45:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 17:45:02 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: RE: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Thread-Topic: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Thread-Index: AQHZpQYzLgs+SZK7S0mjzkR6+Tm69a+W5EEAgAsp34CAAAN8UIAABrAAgAAAVtA=
Date: Thu, 29 Jun 2023 17:45:02 +0000
Message-ID:  <MN0PR12MB61012FB42B67E7A77A15CDD3E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse> <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
 <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
 <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
 <baqjq4zvfwte2y5rpsznu26qzapjjzhycydwgir34yvttbzvzq@z3pfby7pdjo7>
In-Reply-To: <baqjq4zvfwte2y5rpsznu26qzapjjzhycydwgir34yvttbzvzq@z3pfby7pdjo7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=57841338-780d-41e5-b4d6-bc21245ce8dc;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-29T17:44:23Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB5999:EE_
x-ms-office365-filtering-correlation-id: ef3e1cee-7fe8-4231-dc62-08db78c890de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Kzu+sqc0B1e0sp2C5YVUWwokOiPJx2Sl4Ich769vd4VWPFCfLniTCAbYmguqxMKyo7tA9Cs0EFoxVKy3rFcP1n1eoNJFA7YpdFXrJA8DKjWI07xIDrp7QQ+cJnDPOtiS+Tn5u2kQErzHvzUEh4AJmzZgGar8c+L4ybWtMoVGqu2C02BbOIZ7IplMHnV1V/eh+EZpsudDeXSQkMOHsk6t2p6Z1mYCPIjn7L/UaKkP4W/OG+49OVgcU4LaLxl80gQPvcftXIQ+6HabJdu9VigFM1HQqnnrAcem2cZjOh7KUMOyzHr9RTL0PFYof1Ch1EMCXLLG331vbt+5nDKbJpUEaTsn53xK1WP9Iyw0SNsLgUtygHnBXR/xQQwDdERisYDlqMUJXK5M/kCMMF6pUosn8qPQ7NKJlE75tYuTwH5puyPvF2q8AxSrzio6wo82XrZD6bw80WiiIaeTYTl71UOwPRYJN9xrdXaXlCKwfVwASwDyTGdMtPpBRckMKZqp7LVq738oBFKdu6GpGdmHUvqzBMIhjsYzFB3l3nB+0MBVYpJsxRioL6Fi6pRaJYITGyXtoyNb2Vqpg9ACBZyRcM2JdQql3ABsJ4rtBVSS6WC7vI8C+ExQXEE4l1XYm7vv3s/v
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199021)(7696005)(38100700002)(53546011)(71200400001)(122000001)(83380400001)(26005)(6506007)(186003)(9686003)(55016003)(54906003)(41300700001)(38070700005)(86362001)(316002)(2906002)(66556008)(33656002)(66476007)(6916009)(66446008)(76116006)(66946007)(64756008)(4326008)(5660300002)(52536014)(8676002)(8936002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?bENFeg/Jj9/sZaoo93tKHk9Ya6lIfg2DSNz0SQbz/XQUteiHwsB9hkrbwJCZ?=
 =?us-ascii?Q?WlzWGkMuk//4VVUMo/W3F7VVFVqHL2wFkxSQn194n5LKS9k67WgCDcugg4zu?=
 =?us-ascii?Q?es9M3/rSIfj/SjyCOwwLBhD/sPDXTbSD91lAF2sFNV3qIxfshZ/GI7wtg1X+?=
 =?us-ascii?Q?4MY9B2ZIY5saRTWZpeuCpspxWn2JglpnzbwrkzE7H5+fuCJLZvJKXplgrUvx?=
 =?us-ascii?Q?CbXnCaF2/SXqJ2GD5JOyYw1fw8LnedNoyH2MkHLcny/LO6s5ynYjEpJSYQ+8?=
 =?us-ascii?Q?dnOY/r0o1sybzGvihsCn2OuItnzcwEsVlsGf43OFUoKLR+dIssmCGTDGT8jx?=
 =?us-ascii?Q?J8JXtCbdcCV82R1U0gG5Jn+yqjQ257Vzwx8krSBbMFZJ1OOYWgPRlPCjzpkJ?=
 =?us-ascii?Q?2fDZaLUrtZEEYQfarTtVTm5ZUQdBdMXIfseChFwoPBWJrQ/bZs+Zx/OYjp2f?=
 =?us-ascii?Q?BNa/5R22nea07Ys3+nyfyrT+wekKDsFc6zyrEjR5KsGR5Ltdm2c/H44QhEuC?=
 =?us-ascii?Q?NBbDyG78U+Wgq70/EEIEhDTIs33QiIBEO9Pl5gZigYIYi/1REDNo/veJqPjW?=
 =?us-ascii?Q?zm1ePExS7SckCvysVP4lpAOC+gbeBRRgxaidbs7k++Czq1eAbWKf1hVyT+80?=
 =?us-ascii?Q?ON0cvHPvFdZjFgFUEUid/s+dKhRSuvo2N3Z4kk/foptOydBe8eKwRZEEMFpZ?=
 =?us-ascii?Q?IWzgVvetd0iR+epphfB/nnlGjbCeolulN3HUlCff0e6GwL870oIgSohskRQ5?=
 =?us-ascii?Q?GAXXr5YKX22hlx1teqwV30aTfiBDLZC0sqlU63r9qAQwA7fqumXuyZ/RtSj9?=
 =?us-ascii?Q?N0c5JklcFbKH4izhteOMXXNkv2P90umZNUU8tHIfPD7h15zo9ArlZMOMdTFE?=
 =?us-ascii?Q?yHkw74a2ma+0OjljgMxx5i4DjnsKPgag502Tukg7oQxnRReZxvQ1eRS3N10h?=
 =?us-ascii?Q?CD91cvC+0evaf6KwMeaZZUZsqC4uaGdYL6nob/CoHqwDW+5Dfy4ppM7ZofGR?=
 =?us-ascii?Q?9t+Xl4BGfhAKST5p/aOcLXBF5Rh556+lsXZY4uAZaeONIvB53fKHOFfhutUa?=
 =?us-ascii?Q?ZNlU3/Ozca9OEDE03uCJxKMeMznq3U0XeK/E0vd0jt5x2w47yuYbapPAGJf3?=
 =?us-ascii?Q?6npjbDolkYHgyeibg6ESrrR1VFBMpdGqoENHy70VrMx5O3wihwKKrnhDMCU1?=
 =?us-ascii?Q?e2AnuYzD8E9bEeYiJEojmYL90mY//vddCgJC6wyqpPylkcoZQOF8PkEirQ38?=
 =?us-ascii?Q?qIlNPpz+420Z4PqpNeLMdo8T7jCTM0VAFaRpJg1+pZ7YyWi3RpOUFE45/PA7?=
 =?us-ascii?Q?qYmS3lykadc9rdyLF9SQkqNAzIzLPMq3nmFouW+/P1sSlMazWIVrxRrXCcQP?=
 =?us-ascii?Q?/Xc9+38Aq4/SJqyeUovGjTynRPvkpSIcjMloIiCJByYF9JTxR9AFVZSoBuFs?=
 =?us-ascii?Q?nWicCLu04ygQqmOvSZaytX50y/rlue9zH4Zt0I+PE8l7RwX9J9qZGmIMiYb0?=
 =?us-ascii?Q?e+SV7Pdm860czaEEB6T3dM8p4jfPdbvegvxbII5ltQWsAKyjkqHvBDHAOR+/?=
 =?us-ascii?Q?4ESYsnVfhZu5+XBVmBY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3e1cee-7fe8-4231-dc62-08db78c890de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 17:45:02.1812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVQ6UMQbuRxm01maeFjfKITjB0p0sn9OWSxoxj+y7Fj/s0N9keb6EO77NDPkVOszBQ5K1JCXi/f5LNVG2leJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, "jarkko@kernel.org" <jarkko@kernel.org>, Sachin Sant <sachinp@linux.ibm.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Jerry Snitselaar <jsnitsel@redhat.com>
> Sent: Thursday, June 29, 2023 12:43 PM
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>; Linux regressions mailing list
> <regressions@lists.linux.dev>; Sachin Sant <sachinp@linux.ibm.com>; open
> list <linux-kernel@vger.kernel.org>; linuxppc-dev <linuxppc-
> dev@lists.ozlabs.org>; jarkko@kernel.org; linux-integrity@vger.kernel.org
> Subject: Re: [6.4-rc6] Crash during a kexec operation
> (tpm_amd_is_rng_defective)
>
> On Thu, Jun 29, 2023 at 05:28:58PM +0000, Limonciello, Mario wrote:
> > [Public]
> >
> > > -----Original Message-----
> > > From: Jerry Snitselaar <jsnitsel@redhat.com>
> > > Sent: Thursday, June 29, 2023 12:07 PM
> > > To: Limonciello, Mario <Mario.Limonciello@amd.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>; Linux regressions mailing =
list
> > > <regressions@lists.linux.dev>; Sachin Sant <sachinp@linux.ibm.com>;
> open
> > > list <linux-kernel@vger.kernel.org>; linuxppc-dev <linuxppc-
> > > dev@lists.ozlabs.org>; jarkko@kernel.org; linux-integrity@vger.kernel=
.org
> > > Subject: Re: [6.4-rc6] Crash during a kexec operation
> > > (tpm_amd_is_rng_defective)
> > >
> > > On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> > > >
> > > > On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > > > > "Linux regression tracking (Thorsten Leemhuis)"
> > > <regressions@leemhuis.info> writes:
> > > > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-p=
osting
> > > > > > for once, to make this easily accessible to everyone.
> > > > > >
> > > > > > As Linus will likely release 6.4 on this or the following Sunda=
y a quick
> > > > > > question: is there any hope this regression might be fixed any =
time
> > > > > > soon?
> > > > > No.
> > > > >
> > > > > I have added the author of the commit to Cc, maybe they can help?
> > > > >
> > > > > The immediate question is, is it expected for chip->ops to be NUL=
L in
> > > > > this path? Obviously on actual AMD systems that isn't the case,
> > > > > otherwise the code would crash there. But is the fact that chip->=
ops is
> > > > > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > > > > overlooked by the checking code.
> > > > >
> > > > > cheers
> > > >
> > > > All that code assumes that the TPM is still functional which
> > > > seems not to be the case for your TPM.
> > > >
> > > > This should fix it:
> > > >
> > > > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chi=
p.c
> > > > index 5be91591cb3b..7082b031741e 100644
> > > > --- a/drivers/char/tpm/tpm-chip.c
> > > > +++ b/drivers/char/tpm/tpm-chip.c
> > > > @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct
> > > tpm_chip
> > > > *chip)
> > > >         u64 version;
> > > >         int ret;
> > > >
> > > > +       if (!chip->ops)
> > > > +               return false;
> > > > +
> > > >         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
> > > >                 return false;
> > >
> > >
> > > Should tpm_amd_is_rng_defective compile to nothing on non-x86
> > > architectures? This code is all about
> > > working around an issue with the AMD fTPM, right?
> > >
> >
> > That's a good point.  Yes it could and that would also solve this probl=
em.
> >
> Or I guess more accurately for non-x86 it should be:
>
> static bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
> {
>       return false;
> }


Right, but it should be inline.  Would you mind sending something out for
your cleaner idea to supercede my other solution that still didn't merge?

