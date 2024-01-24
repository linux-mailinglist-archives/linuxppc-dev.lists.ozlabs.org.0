Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF083B654
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 02:01:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=jLZWvnNi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL2Zx6zJrz3vX7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:01:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=jLZWvnNi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2c16::801; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c16::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKzyb4WGZz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 10:03:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PepvoakWM74EeLPjj/LRAArRVY+IjpLX/FWpy/AnaKTHYeE1FOPgug5cWizZGf1wAlsH3nwxWALDe3etGDCfJGETYeOgBImp6Pa5Eqb1JvRvNHBMf22N9Y3WYG84/uPVKLHTLoEFgleHeRI7EjddOwT8T4Oc96CaZ9ezgjSwoOi87JOHDn+EX/WoKhXwoVvnZlJuDI05/oP+CEwdeQ4M0jqgdEOZRL4tZuvj6dj5h3mnpKJ12AqkQT5gs2RtQEBgZsEQR39rsxbhwpIE48XSPRQbmiOP2HYLmwZRPCOfUHMzx/cpWDgt0aLjDq8zEz9di4kGhPB6hpsa+NywafZ5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l6Ns8rTYdxWO1Ya2TTU0dhX0x/0LTN2nSiiDkHoKbs=;
 b=FYKx9YChlkpjzWaoAx9eCyI+4jfmc8cOpMZ3Ai08M5DjXwIPa6BEIZEwibWzukaILKA1HaTEI58UT8b7fCsT4OzQzYadca9cb3Uyr9IxISgLsCs752zSb/c+6rnE1P5Pwi+aiTkbH/nt+OsbV7zRSEohJCTrqhkk08loerShQjOFw3lDekOUNFrt1nu8y8oM1ibD6nclrXa+OSF2S1rZb9K0t/r7wJKgfMTXmLRL5Ex2sqTEjxkPetcAew3bIN/o3lzAObP5FOGkUOaF1EFHxPPIpuwSnvXYwPVsK690qkSps7wi68bbsgzw/IBM4pKfPRX4vg7ipv8FtC7IP3kQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4l6Ns8rTYdxWO1Ya2TTU0dhX0x/0LTN2nSiiDkHoKbs=;
 b=jLZWvnNiaD6PC3KYozx0QATx95YXv4qTfQQBy92TMr5paROYM5bRlsSaMIdgiO8Lq3Kg932jA6zLCc2EhschVFKz+CkxXfPcqVCYHYUpO/sfLiulRjDJ//Lusubh4a8vwtRZBWFXWV+wiVKs5K8gmxuDqAgC8AgnvSGpUatX5JYP7geQ1SGrOmHfUlT7nUMrDHD2fDzmVz0aVVrFRiwMadBuD8qWkMPNq3ZpxzFJU0eG+EpKqf3fXIuByQpteVhJMoz42HMEF9QyB3QzRzCrpX7L1eIkVJvJDReF2d222IolXGOb/WTEVQ7WFVjMj43S4+47pM8A74SR9DXPLHUd4A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB8834.namprd02.prod.outlook.com (2603:10b6:303:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 23:02:54 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 23:02:54 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Topic: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Index: AQHaToRG7EZBXaVit0yb4RXbyvoNjrDpkK1g
Date: Wed, 24 Jan 2024 23:02:54 +0000
Message-ID:  <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-7-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-7-bhe@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [op7zH1Au+oeYF86X+kKmdQs2MzIdeyA9]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB8834:EE_
x-ms-office365-filtering-correlation-id: 4b5968da-bb37-4619-e097-08dc1d309949
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ku3k2L/WLldwXurBOby3xSDRfdxLPUz4FK6zagX6zdtdUr7+PAoK8MXi2Ykd7amB3pdYUItfIDy0TJi/Vw+pzSPK9mAugL1zP6xpRELzDIGbvqyDxvxEvdqyrs9xTwtQeXCCnJImHCVmBuziO+5WDJ8DyvtK0Ycfk2DhyRgmLn8VYDopAT0DOWXfSVRUAe3zdUkZxvZLde38piBCsEAFbovRlshgfHrc8knWQ9I87ULQZytZHBy8H3kHM3r02/urmw+bohaG0mL5vrq9KlbtjSd4tq1jyGADy292bpE3h04X/mDHLHdZpQdVtg1vQJiARRmIRQ0fqXbcGVu8b9+plX7bMJD1mYwiTTftNoRdLZCE6IjbXARE3F874pImzRDXx1k2NzkrhTzGqckw1/a24BHjK3oAx791rZeVos4IGpxl6gBQeIxR2SNcrspQZoYvHVPzfuZAikmEE/b2zd8agIYpbLmxt2gdMxFMTa1JUQw8RUofvlJb8ZNcunlaIH6Tan1KuEUbaddG1g4RdH4jDiAuuPnc5LCmR68/vmIeUZTZUXYYbPT9y7bC71XSyzZ+
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?8i3Z4LI8SB7vkm6bFj40SG4cpXdkzFIElDGTjz9f4LPnUSJUz0PKcM2ELVst?=
 =?us-ascii?Q?R3Bvif3axS8xdX0wsr7jTveErDdeBbIrD0o13sJU1vncE0OH+Qn6MVi8P8tg?=
 =?us-ascii?Q?wjk9M6kVEBJjXrAhMgaFI5fVbV6ftS9S8EKe4wZ8rPDLSgyfMQrB/YR0/LwS?=
 =?us-ascii?Q?nls3w7cpyvAwx91ByWf3lXd+Lelrc5DM60Ab9rv+ZVW+VH/xafFODnKflIid?=
 =?us-ascii?Q?wIy51I/JsoCb6pvkg2WH563ZxMx6UfOAL1lo/jcmgPzgIaJmOq+V7v7cEo52?=
 =?us-ascii?Q?5KFdfuWRDdLkQ2fWdvcA5NA9UwkLh4nRdNUvJlxci4FUq+8NgvTBY8QNC0fr?=
 =?us-ascii?Q?eX42hISrIUXtMZYo1Fm10yUKpJp2QrxSCWl66svAzG3E47X/qW6NMOc5V8Xw?=
 =?us-ascii?Q?DWLL5BsyvJsUwHdfKtdFNoGThpS26XCLWczju3BMjnhlLmUetP4gKiozcisd?=
 =?us-ascii?Q?RAu4Si2OYp5XiRCtC0eS+i28xNr/cnuJKNE7fYDKhdxDaRR3vx+xUGEQowVN?=
 =?us-ascii?Q?vb4Ug5rY2nryKYV8yxAATnBoTwUFW5zxCdj0rU1TQOVBLy8rsAlZZvrI3XPZ?=
 =?us-ascii?Q?IevjWoFOqJ0dVsYtAhGlue5tSut8OQfOdzFGZGfwIo30vCHqhkFnuxjAfGIp?=
 =?us-ascii?Q?IY1gW6cktkJT3VVJwh9MhuqqBAe8THavM6dPLPcCL2oUPaPgdQjsgnkkMzz+?=
 =?us-ascii?Q?4UysoDGKodFPGeasOkrIRssvL8CAq2oYL8DtiEvVmzPw8VJ7no3tJUxyzF1n?=
 =?us-ascii?Q?eNuPwM5nI5qe+BKfnXqQkA4HffRWyDOLoZR1wf+Rw3UCZHdVOFZXSUsEsxSV?=
 =?us-ascii?Q?uu4J4/ZXhAmUoDTRKwwqquNIHlsXsw93WSO8PvpZt8U5WL015AdlVXt3cU3t?=
 =?us-ascii?Q?FxH9yX1DPKIPwc/sBHpD2ExAbdXe9oHs1f7HQbF3GZcMdYwq+b4R7AGAao5Y?=
 =?us-ascii?Q?7Fi0Zwix4zag5dvX108IPSUsirI6x8gThahayKQW4XqCbaoncBct5yYXyimy?=
 =?us-ascii?Q?ddHxZ25GP6kH2C0mBxOmBoL6uvFDl53GJK8YCynbSv4R28utM/uPOF3qe8B+?=
 =?us-ascii?Q?MxaT2SIV1msA1tOV+pY46w935RozxjRdd8uQ4kxq5JKkCulchNjYstDoO/wR?=
 =?us-ascii?Q?E3Q7vsYP46HaqtnaIpo3ZEAtHK6U79kx7Wv1k6QvQkJq6sq6/7cEwRHsI+QB?=
 =?us-ascii?Q?BGd++I1TVn4jzYTpZitqFyuU8PbLemqMeAc51Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5968da-bb37-4619-e097-08dc1d309949
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 23:02:54.6871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8834
X-Mailman-Approved-At: Thu, 25 Jan 2024 11:57:05 +1100
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "piliu@redhat.com" <piliu@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baoquan He <bhe@redhat.com>  Sent: Tuesday, January 23, 2024 9:13 PM
>=20
> Now crash codes under kernel/ folder has been split out from kexec
> code, crash dumping can be separated from kexec reboot in config
> items on x86 with some adjustments.
>=20
> Here, also change some ifdefs or IS_ENABLED() check to more appropriate
> ones, e,g
>  - #ifdef CONFIG_KEXEC_CORE -> #ifdef CONFIG_CRASH_DUMP
>  - (!IS_ENABLED(CONFIG_KEXEC_CORE)) - >
> (!IS_ENABLED(CONFIG_CRASH_RESERVE))
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  arch/x86/kernel/Makefile           | 4 ++--
>  arch/x86/kernel/cpu/mshyperv.c     | 4 ++++
>  arch/x86/kernel/kexec-bzimage64.c  | 4 ++++
>  arch/x86/kernel/kvm.c              | 4 ++--
>  arch/x86/kernel/machine_kexec_64.c | 3 +++
>  arch/x86/kernel/reboot.c           | 2 +-
>  arch/x86/kernel/setup.c            | 2 +-
>  arch/x86/kernel/smp.c              | 2 +-
>  arch/x86/xen/enlighten_hvm.c       | 4 ++++
>  9 files changed, 22 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 913d4022131e..3668b1edef2d 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -100,9 +100,9 @@ obj-$(CONFIG_TRACING)		+=3D trace.o
>  obj-$(CONFIG_RETHOOK)		+=3D rethook.o
>  obj-$(CONFIG_VMCORE_INFO)	+=3D vmcore_info_$(BITS).o
>  obj-$(CONFIG_KEXEC_CORE)	+=3D machine_kexec_$(BITS).o
> -obj-$(CONFIG_KEXEC_CORE)	+=3D relocate_kernel_$(BITS).o crash.o
> +obj-$(CONFIG_KEXEC_CORE)	+=3D relocate_kernel_$(BITS).o
>  obj-$(CONFIG_KEXEC_FILE)	+=3D kexec-bzimage64.o
> -obj-$(CONFIG_CRASH_DUMP)	+=3D crash_dump_$(BITS).o
> +obj-$(CONFIG_CRASH_DUMP)	+=3D crash_dump_$(BITS).o crash.o
>  obj-y				+=3D kprobes/
>  obj-$(CONFIG_MODULES)		+=3D module.o
>  obj-$(CONFIG_X86_32)		+=3D doublefault_32.o
> diff --git a/arch/x86/kernel/cpu/mshyperv.c
> b/arch/x86/kernel/cpu/mshyperv.c
> index 01fa06dd06b6..f8163a59026b 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
>  		hyperv_cleanup();
>  }
>=20
> +#ifdef CONFIG_CRASH_DUMP
>  static void hv_machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	if (hv_crash_handler)
> @@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct
> pt_regs *regs)
>  	/* Disable the hypercall page when there is only 1 active CPU. */
>  	hyperv_cleanup();
>  }
> +#endif
>  #endif /* CONFIG_KEXEC_CORE */

Note that the #ifdef CONFIG_CRASH_DUMP is nested inside
#ifdef CONFIG_KEXEC_CODE here, and in the other Hyper-V code
just below.   It's also nested in xen_hvm_guest_init() at the bottom
of this patch.  But the KVM case of setting crash_shutdown is
not nested -- you changed #ifdef CONFIG_KEXEC_CORE to #ifdef
CONFIG_CRASH_DUMP.

I think both approaches work because CONFIG_CRASH_DUMP implies
CONFIG_KEXEC_CORE, but I wonder if it would be better to *not* nest
in all cases.  I'd like to see the cases be consistent so in the future
someone doesn't wonder why there's a difference (unless there's
a reason for the difference that I missed).

>  #endif /* CONFIG_HYPERV */
>=20
> @@ -497,7 +499,9 @@ static void __init ms_hyperv_init_platform(void)
>=20
>  #if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
>  	machine_ops.shutdown =3D hv_machine_shutdown;
> +#ifdef CONFIG_CRASH_DUMP
>  	machine_ops.crash_shutdown =3D hv_machine_crash_shutdown;
> +#endif
>  #endif
>  	if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT) {
>  		/*
> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-
> bzimage64.c
> index 2a422e00ed4b..b55737b83a84 100644
> --- a/arch/x86/kernel/kexec-bzimage64.c
> +++ b/arch/x86/kernel/kexec-bzimage64.c
> @@ -263,11 +263,13 @@ setup_boot_parameters(struct kimage *image,
> struct boot_params *params,
>  	memset(&params->hd0_info, 0, sizeof(params->hd0_info));
>  	memset(&params->hd1_info, 0, sizeof(params->hd1_info));
>=20
> +#ifdef CONFIG_CRASH_DUMP
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>  		ret =3D crash_setup_memmap_entries(image, params);
>  		if (ret)
>  			return ret;
>  	} else
> +#endif
>  		setup_e820_entries(params);
>=20
>  	nr_e820_entries =3D params->e820_entries;
> @@ -433,12 +435,14 @@ static void *bzImage64_load(struct kimage *image, c=
har *kernel,
>  		return ERR_PTR(-EINVAL);
>  	}
>=20
> +#ifdef CONFIG_CRASH_DUMP
>  	/* Allocate and load backup region */
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>  		ret =3D crash_load_segments(image);
>  		if (ret)
>  			return ERR_PTR(ret);
>  	}
> +#endif
>=20
>  	/*
>  	 * Load purgatory. For 64bit entry point, purgatory  code can be
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index dfe9945b9bec..acfc2d3183bc 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -769,7 +769,7 @@ static struct notifier_block kvm_pv_reboot_nb =3D {
>   * won't be valid. In cases like kexec, in which you install a new kerne=
l, this
>   * means a random memory location will be kept being written.
>   */
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  static void kvm_crash_shutdown(struct pt_regs *regs)
>  {
>  	kvm_guest_cpu_offline(true);
> @@ -852,7 +852,7 @@ static void __init kvm_guest_init(void)
>  	kvm_guest_cpu_init();
>  #endif
>=20
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  	machine_ops.crash_shutdown =3D kvm_crash_shutdown;
>  #endif
>=20
> diff --git a/arch/x86/kernel/machine_kexec_64.c
> b/arch/x86/kernel/machine_kexec_64.c
> index bc0a5348b4a6..b180d8e497c3 100644
> --- a/arch/x86/kernel/machine_kexec_64.c
> +++ b/arch/x86/kernel/machine_kexec_64.c
> @@ -508,6 +508,8 @@ int arch_kimage_file_post_load_cleanup(struct
> kimage *image)
>  }
>  #endif /* CONFIG_KEXEC_FILE */
>=20
> +#ifdef CONFIG_CRASH_DUMP
> +
>  static int
>  kexec_mark_range(unsigned long start, unsigned long end, bool protect)
>  {
> @@ -552,6 +554,7 @@ void arch_kexec_unprotect_crashkres(void)
>  {
>  	kexec_mark_crashkres(false);
>  }
> +#endif
>=20
>  /*
>   * During a traditional boot under SME, SME will encrypt the kernel,
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 830425e6d38e..1287b0d5962f 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -796,7 +796,7 @@ struct machine_ops machine_ops __ro_after_init =3D {
>  	.emergency_restart =3D native_machine_emergency_restart,
>  	.restart =3D native_machine_restart,
>  	.halt =3D native_machine_halt,
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  	.crash_shutdown =3D native_machine_crash_shutdown,
>  #endif
>  };

Also in arch/x86/kernel/reboot.c, should the function
machine_crash_shutdown() be updated with
#ifdef CONFIG_CRASH_SHUTDOWN instead of #ifdef
CONFIG_KEXEC_CORE?

Michael

> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 84201071dfac..899d839a2954 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -471,7 +471,7 @@ static void __init arch_reserve_crashkernel(void)
>  	bool high =3D false;
>  	int ret;
>=20
> -	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
> +	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
>  		return;
>=20
>  	ret =3D parse_crashkernel(cmdline, memblock_phys_mem_size(),
> diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
> index 2908e063d7d8..18266cc3d98c 100644
> --- a/arch/x86/kernel/smp.c
> +++ b/arch/x86/kernel/smp.c
> @@ -286,7 +286,7 @@ struct smp_ops smp_ops =3D {
>  	.smp_cpus_done		=3D native_smp_cpus_done,
>=20
>  	.stop_other_cpus	=3D native_stop_other_cpus,
> -#if defined(CONFIG_KEXEC_CORE)
> +#if defined(CONFIG_CRASH_DUMP)
>  	.crash_stop_other_cpus	=3D kdump_nmi_shootdown_cpus,
>  #endif
>  	.smp_send_reschedule	=3D native_smp_send_reschedule,
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index 3f8c34707c50..09e3db7ff990 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -149,12 +149,14 @@ static void xen_hvm_shutdown(void)
>  		xen_reboot(SHUTDOWN_soft_reset);
>  }
>=20
> +#ifdef CONFIG_CRASH_DUMP
>  static void xen_hvm_crash_shutdown(struct pt_regs *regs)
>  {
>  	native_machine_crash_shutdown(regs);
>  	xen_reboot(SHUTDOWN_soft_reset);
>  }
>  #endif
> +#endif
>=20
>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  {
> @@ -236,8 +238,10 @@ static void __init xen_hvm_guest_init(void)
>=20
>  #ifdef CONFIG_KEXEC_CORE
>  	machine_ops.shutdown =3D xen_hvm_shutdown;
> +#ifdef CONFIG_CRASH_DUMP
>  	machine_ops.crash_shutdown =3D xen_hvm_crash_shutdown;
>  #endif
> +#endif
>  }
>=20
>  static __init int xen_parse_nopv(char *arg)
> --
> 2.41.0
>=20

