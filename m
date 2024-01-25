Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740683C69E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 16:31:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=IsB3UrNz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLPvC2S0Gz3cWm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 02:31:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=IsB3UrNz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2c07::801; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c07::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLPtM6Kv8z3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 02:31:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi2W5EnWM5ImiRa0u3ZgYBv3psB5MjmVL7e8z7LXvboMv5qA9rV3ohntOcVM+0cpqbhjsYovoDDhqO8TEKuJ4uB+OSNa9qc2FFo80qPdpI4vm5FrYrdMRAbvlPet36rcyqe1OJjpoWzDkR2iyORDJ6iieHxmg54QUKnr8be15dAtSbxZh9WC5AD1tA0b/QM/BP1pMkQnOKpKOlrou7hno44gjFk3GKZSEZ3oeVZIHw3LswBSIoMqQLLkEHzDY5cuhpLzScYTtZ0kZ4ZBQEQP8V7Fdqvz6jKGTjG2euum7pUbcKo7ES4oYeFbPaByWFnffyY97aZ+/yzzWshoGhlfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW2alejqAOYT8WAjMai/jwWkVOYlVlzir8+fWHfLoG4=;
 b=KZduFnFM4kmyDwEwvMI1M8eJgwyGOExC/11Jx+u6UjbeQNotC6IVwL3CK4/nR4SojUtIuhpSlFpSf0LV1/C5RDSlZEmXPX5ip+07VwHVSXyH9aQzHkBP/O3dGu+X72kKuiatorFDtxeVvf2C/zegsssnE3ttw4V6y/3RR09hSnFa+YsD//WNjIvun3UsXgD5haUSuqznZq4Yd4D0sEiO780dJw+wzLOjEiWZS2q6+OFGCT+KMGdvBuKGtTwrvNbZrYNtiB9bGT92K/UwfWzfBKk9+3xQFzblFHU9R9WbmZWica6+Z0WG5JX32ohM9U+SsDnT+Egbi/Wtn2Ip1hq83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW2alejqAOYT8WAjMai/jwWkVOYlVlzir8+fWHfLoG4=;
 b=IsB3UrNzu5Xn0UgYLY+hFfk9v7sdqDOpsfIpP1TB01DdZalsNRyvOSFwBuhU/OhlKKKSMj8AZYhE/YopziPalbqobev+gp6ALcF+EKAAU/MR//7VPs4kDUCHdh1u6mxmcOEPo0l5iJ5l4d7ioFfDt+31Yd7fMRGNvcnxD+0DmsfWtStaxEFeVE2wNmlye6Ic7A1Z56DiwbIyBuUxjEcfGAuK6760BuZtv1UsYxIDFrSWYg0E8CIIxOWrEkIm1fEm2AqnUYyTsJXpDlCtzQA8Mp+7FLSuAq6QFxwj1IJ8pV332UiwNKR/9Bvu22OETDLykJNNx7zaMO2bPInd/LGijA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH7PR02MB8980.namprd02.prod.outlook.com (2603:10b6:510:1f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 15:30:46 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 15:30:46 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>
Subject: RE: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Topic: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Index: AQHaToRG7EZBXaVit0yb4RXbyvoNjrDpkK1ggABa6ACAAA/3oIAARgWAgABnw3A=
Date: Thu, 25 Jan 2024 15:30:45 +0000
Message-ID:  <SN6PR02MB41572FDAE703FC8A91974DFFD47A2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-7-bhe@redhat.com>
 <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ZbHfACpwqi2U9vmK@MiWiFi-R3L-srv>
 <SN6PR02MB4157E138C7EE4A281AB49C10D47A2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ZbInIQeIoPj6R0kY@MiWiFi-R3L-srv>
In-Reply-To: <ZbInIQeIoPj6R0kY@MiWiFi-R3L-srv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [kBPvbuH5eMbnBowZglgoIczCWf/e+Xu7]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH7PR02MB8980:EE_
x-ms-office365-filtering-correlation-id: 1dd18b5f-0428-4c59-dec9-08dc1dba99ba
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /aH4jkmyv0ty76k9LAS6MR4nv2cgpKsOzP6GwHd+HQssdpDIfaJhh/vVCXR5kQsb2qLVdNOmHcA5A7cc3WeT/SgMcCPlMmhwYjkRKD4tHIHtGgseWm+MC7WitVnT0aUobih0TORAKdGV+vqg/MO5y3tIcKCGDSGgPKNxUmKtPJ3GAWl4/tFlLqiCTSaxsRdzLm1sKNVavQWi7KEoyAfEnw65Znm499uxsLJx2yJIla2Tu1HKJBDlhpZ1EqRFABkCrxz8RuGHmF/PjYwZpWzC1OuQ8cD+CxLJo0jD9tQC6ieY2984Tb4kTRt61JHprgz97soQWkbDSkOJAxZX6iNK7tcV85Dyjfyzptjsn6I65hFK5OPc0ax5aIsl3IEV0LvMIWdPbPP0aepx8DWPcZjpnDiYK++kS0uYGGFLS2NYNOqMa9SiJ2gLdb/2GuxHUldXbRgK2bexasJt+VsH5ay2gPBnT+OzSikbsY8Dp87eDbumkyM4IpzryLc6ioDtc18yaHOH451Lt6sII2q9gw5/kEiziqNxO7EcLKrAG/Pznz0GoepHww6mbTx1sTPc0uoF
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?rDZlZD2CA0+HKZCv3KEDs5f1ygEjqFw7Le+0at86EcWCnClczxvKx2gWWXZh?=
 =?us-ascii?Q?JbXZBoacRbvSz0S9fsJbOF1HQ5pt1Ib5AwYgjpzrDMCmvHK/2UiPCnghx398?=
 =?us-ascii?Q?g/qp60CEmCbZclWstEjir0GGZus9cVAYEa0RiV84MiBKR85t0Pc0TgC3HRAf?=
 =?us-ascii?Q?PFUfGtzh3MXNZLZ8D719F5z5HVhgusVKAnDX9H14uGl8BgYbfRS5sZ4Y8/ww?=
 =?us-ascii?Q?0DkFC8qalh1O5XFdGj7hrJllMzk8CFLlUqjnRM8VHGGUwHCfNF3vqh0aSNAG?=
 =?us-ascii?Q?lLtAIRELT4IsacaRW0GOHFQZHDbl+dM0NmWA5lCv4ZZxtS76IBhxe55s55q1?=
 =?us-ascii?Q?2YdIvaxuvTjCgWkZ6TPIKFTKBxaxyAkSQE5IyWsmRGMoadyyDmpc9OYzYmRj?=
 =?us-ascii?Q?faZfO9KKf5xvzBBoy4UgjqNc8ncDfK8cA8exewsaH+GnwM8Omqq/av5h/v7n?=
 =?us-ascii?Q?9fBGovW5O0iSx5dbmmR3LpuiRbXsa3ZJin8+0KEPYaE29nLpFq8wYtTVKLmd?=
 =?us-ascii?Q?sRxm0Hn6GXn+CkqbRa3hz1vWu4TFvOZEtwv0yXZXnx5bXnUdGGBhC/0BR+bK?=
 =?us-ascii?Q?UFnxsvs1His8sEVC+92IQA2QXHh/idK9Ig+PAzA8RJe4NqDuU+B5FYnzZB3a?=
 =?us-ascii?Q?62kbTpJL0zZHePhkEtjTGrQVE8EPfjmpeBzHTrGULLJPlGOWvQmIYkgcnUOS?=
 =?us-ascii?Q?z/Lro/YRiqVPdu2AyO3S+BkrakpN8qf3oxkwXGeNPlDfquw3gvm6gITjm67Q?=
 =?us-ascii?Q?pxKl8IieqDV9/I0r4OC/18pFAauC/ka5PuZdzAm/xfYt4nQQxosh4iJ3FASs?=
 =?us-ascii?Q?3bFMn/VpX/hnEJ70ue5gQDmmy1vCT1k1/DIcqlJNNhkX0XsALsbEp1kNwU1H?=
 =?us-ascii?Q?kZcMKb88y4y18TWtb/4xo1XzDyOelY3iLVI4WE4u3o7wGA8QonVCPju9iEXG?=
 =?us-ascii?Q?QHdxH3p4bwS94RK0v4l34kQZI2TPsTy2Ce6sX/UzGgxFyaVCdBEzUqKY/8cE?=
 =?us-ascii?Q?zsISGi7fqdRCczg2ucuKHrAogLjBwq+/n3Cy1/YB2BHy7e7eyjGLJdCx8OQu?=
 =?us-ascii?Q?oubPCrqiLbaB0K5Me0Ev65m3brFPi+BrNKb2gqodosLxPnVymUrG64ceVvIu?=
 =?us-ascii?Q?of4og4ldjWPK70sCfx8Z8ky3MM1W5+40ir5tnA4unxxiJSXzirA/roTarfiP?=
 =?us-ascii?Q?6Ye4JHUgUp+GufrhQnN5JU+26xNBlYQ7tRYSaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd18b5f-0428-4c59-dec9-08dc1dba99ba
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 15:30:45.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8980
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "piliu@redhat.com" <piliu@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baoquan He <bhe@redhat.com> Sent: Thursday, January 25, 2024 1:17 AM
>=20
> On 01/25/24 at 05:12am, Michael Kelley wrote:
> > From: Baoquan He <bhe@redhat.com> Sent: Wednesday, January 24, 2024
> 8:10 PM
> > >
> > > On 01/24/24 at 11:02pm, Michael Kelley wrote:
> > > > > diff --git a/arch/x86/kernel/cpu/mshyperv.c
> > > > > b/arch/x86/kernel/cpu/mshyperv.c
> > > > > index 01fa06dd06b6..f8163a59026b 100644
> > > > > --- a/arch/x86/kernel/cpu/mshyperv.c
> > > > > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > > > > @@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
> > > > >  		hyperv_cleanup();
> > > > >  }
> > > > >
> > > > > +#ifdef CONFIG_CRASH_DUMP
> > > > >  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> > > > >  {
> > > > >  	if (hv_crash_handler)
> > > > > @@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct =
pt_regs *regs)
> > > > >  	/* Disable the hypercall page when there is only 1 active CPU. =
*/
> > > > >  	hyperv_cleanup();
> > > > >  }
> > > > > +#endif
> > > > >  #endif /* CONFIG_KEXEC_CORE */
> > > >
> > > > Note that the #ifdef CONFIG_CRASH_DUMP is nested inside
> > > > #ifdef CONFIG_KEXEC_CODE here, and in the other Hyper-V code
> > > > just below.   It's also nested in xen_hvm_guest_init() at the botto=
m
> > > > of this patch.  But the KVM case of setting crash_shutdown is
> > > > not nested -- you changed #ifdef CONFIG_KEXEC_CORE to #ifdef
> > > > CONFIG_CRASH_DUMP.
> > > >
> > > > I think both approaches work because CONFIG_CRASH_DUMP implies
> > > > CONFIG_KEXEC_CORE, but I wonder if it would be better to *not* nest
> > > > in all cases.  I'd like to see the cases be consistent so in the fu=
ture
> > > > someone doesn't wonder why there's a difference (unless there's
> > > > a reason for the difference that I missed).
> > >
> > > I agree with you, it's a great suggestion. Thanks.
> > >
> > > Do you think below draft patch includes all changes you are concerned
> > > about?
> >
> > Yes, these changes look good as a delta to your original patch.
> >
> > But also look at xen_hvm_guest_init().  It looks like your original pat=
ch
> > does nesting there as well, and it could probably be "un-nested".
>=20
> Right. I checked them all in arch/x86 this time, hope nothing is missed
> again. I can post a v4 to update this x86 patch later if no other
> concern. Thanks.

Yes -- everything looks good to me now.

Michael

>=20
> diff --git a/arch/x86/kernel/cpu/mshyperv.c
> b/arch/x86/kernel/cpu/mshyperv.c
> index f8163a59026b..2e8cd5a4ae85 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -209,6 +209,7 @@ static void hv_machine_shutdown(void)
>  	if (kexec_in_progress)
>  		hyperv_cleanup();
>  }
> +#endif /* CONFIG_KEXEC_CORE */
>=20
>  #ifdef CONFIG_CRASH_DUMP
>  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> @@ -222,8 +223,7 @@ static void hv_machine_crash_shutdown(struct
> pt_regs *regs)
>  	/* Disable the hypercall page when there is only 1 active CPU. */
>  	hyperv_cleanup();
>  }
> -#endif
> -#endif /* CONFIG_KEXEC_CORE */
> +#endif /* CONFIG_CRASH_DUMP */
>  #endif /* CONFIG_HYPERV */
>=20
>  static uint32_t  __init ms_hyperv_platform(void)
> @@ -497,9 +497,11 @@ static void __init ms_hyperv_init_platform(void)
>  	no_timer_check =3D 1;
>  #endif
>=20
> -#if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
> +#if IS_ENABLED(CONFIG_HYPERV)
> +#if defined(CONFIG_KEXEC_CORE)
>  	machine_ops.shutdown =3D hv_machine_shutdown;
> -#ifdef CONFIG_CRASH_DUMP
> +#endif
> +#if defined(CONFIG_CRASH_DUMP)
>  	machine_ops.crash_shutdown =3D hv_machine_crash_shutdown;
>  #endif
>  #endif
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 1287b0d5962f..f3130f762784 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -826,7 +826,7 @@ void machine_halt(void)
>  	machine_ops.halt();
>  }
>=20
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  void machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	machine_ops.crash_shutdown(regs);
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index 09e3db7ff990..0b367c1e086d 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -148,6 +148,7 @@ static void xen_hvm_shutdown(void)
>  	if (kexec_in_progress)
>  		xen_reboot(SHUTDOWN_soft_reset);
>  }
> +#endif
>=20
>  #ifdef CONFIG_CRASH_DUMP
>  static void xen_hvm_crash_shutdown(struct pt_regs *regs)
> @@ -156,7 +157,6 @@ static void xen_hvm_crash_shutdown(struct pt_regs
> *regs)
>  	xen_reboot(SHUTDOWN_soft_reset);
>  }
>  #endif
> -#endif
>=20
>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  {
> @@ -238,10 +238,10 @@ static void __init xen_hvm_guest_init(void)
>=20
>  #ifdef CONFIG_KEXEC_CORE
>  	machine_ops.shutdown =3D xen_hvm_shutdown;
> +#endif
>  #ifdef CONFIG_CRASH_DUMP
>  	machine_ops.crash_shutdown =3D xen_hvm_crash_shutdown;
>  #endif
> -#endif
>  }
>=20
>  static __init int xen_parse_nopv(char *arg)

