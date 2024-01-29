Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0948411FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 19:28:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=hlS3WfGN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNxdg0cv1z3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 05:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=hlS3WfGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2805::801; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2805::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNxcq1yZ1z3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 05:28:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlNT64FGOOyOBoszz9N5Ac93N4hKdLp8ezxw4nxu+anvMKOaLvvExZauuaBc47zAjMcOtHZBKiykEEnVIKHaz6WNK61AKLeYZxINqXnSr5KRhTjTuEK9bHdXghN59G/DfgWjx39YO0a3u6IZ+Ih/N0sRo/Z+sVdQGWQoF7N+fhPtvHG6NCzG0vzjkb77cymtc+PZQ+RVsiN+ZDVESQvEtHOh4SNIh1gEz/6U1ClD9MgxpkcHg2v3afQJPfp5txfEhl+nzqiD0oCVuItlzFKSyqYuj1QXZtyFimf/LYJXYHadnA6X4yYimySeZseFe9vBMx/fcY5P93DUKU8I1xzh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjMxWwuPQtMm7C9T4IqjJnUlv/VPPfxAPRGeKmPQz9s=;
 b=ggf6TzH9vXrbpybsDKAmvWd4BKQ8QwCgbiBcv27OYDrjGmgbnS8kp1rWC3fsmWpc6imRDggE93TpivcU5lVnly8JiyMm5ug2dk8hI9Mtpt7XMc9a9jHqIjSIR15UOssM128V0ZlmK5KPXITYZwobNnk0KictkdT93WBHkOjK4RlBaiewIvhwR2ZB8qBDH3CgNNJduEBN87zfrbz8L0Iy6Y1Twn5nSAMh+pOZdU5swTpzAz8SDqWb24qzdt+7t7yC59eaMJdovC0PP/yjWGZz2VQ0c9i5kAh+EkKOuST98xTknYE6tn367L8jhrkG7DUEEqr/fkcuq8La2FDVChetag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjMxWwuPQtMm7C9T4IqjJnUlv/VPPfxAPRGeKmPQz9s=;
 b=hlS3WfGN88q3XUjwUXn1ymDbF/O/kyjexWKP8fdzBo80MEGekqC78rJYKys3mlXwoS8cdJ4Q6VH2H6VmKyCvNbSu1eT3VxPnqH2XDVXrY9wZYWr7sz4ZOnpr6LBEcAgqJA8H/sPLyWdj6smmQoDq2UxN6PFAnSnWKxdMHiY5SNJ7tNV2Pxd6eObM+g6gbc50g64LlHQGmDy8sDNht6Xfhg8Z9A94GZAxX2mjBSBqFbPJXRyUvhquts5K4EYAsJPEoSnjTZv6gmcQcFSJx066IHGq3ZC9mOowp3BVAz8my4bblT0i8IDCzImUC3ipUtw5K88Rjb4ML/M6HhIn+BAGvg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ2PR02MB9341.namprd02.prod.outlook.com (2603:10b6:a03:4cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Mon, 29 Jan
 2024 18:27:44 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 18:27:44 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: RE: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Topic: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Index: AQHaUronjJlmGLvjNUqyTXz++ApJcbDxGaMg
Date: Mon, 29 Jan 2024 18:27:43 +0000
Message-ID:  <SN6PR02MB41571397201804BD486C6148D47E2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240129135033.157195-1-bhe@redhat.com>
In-Reply-To: <20240129135033.157195-1-bhe@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [CPkbIpZavqPDb2Hf7oilxwsHApVfhc0K]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ2PR02MB9341:EE_
x-ms-office365-filtering-correlation-id: 1f0f8b42-44a2-4e82-cc0f-08dc20f7fc2e
x-ms-exchange-slblob-mailprops:  yzXCV5TiOCq5Z3EDOs7Daa/bauyyHrFwBpmHh+e35t913RSS8m4pszjD/We3Xl80buzZlM1XcoLMLCX3Bl2QOOQNNNHXyYztpg78Jlo0qMAvBzbQbS8wZ1wMGx8y+pxWGbyZH+FNTg/msqnNzqSZODReTRBvLFENeq5NTglyo0AEg7oECUo0wVJuF3173QNHV/fJ8JyHCdP6Xm+6YeyFVTVtHmjOZi2zEAGhZyAuGLI7BA+dR9bIEq0UWSsq/SykMa3MeQ26hcymR2+9F+gK3ARkJMZ1oO/VirbnPuoRtEuMUXG7nv0l1wySTKDwPmZyf0w+VHJln++2wb5W0NVPG8ptDZtXLn/KBfVLZPV6ZbYpYwI1e8X+69mkuPoOceAKh62yquRS2gaU0gBQ507RbCYM0/WHYECsh7SskRpW8RHgc63pHGPoHt6/IkHIdJTQZEDisEb+JmU9R0vJp4C1q736q1v6Q4jl2biEhHfxp073ZKAAoZYeNKatmJ27S+C2cBJfXIN49TGa7Iaov+IkYMs7U6XW2Vjixjuh4jqKDcG6AupYDqJJ7BJ593dbXTOilwjEuxZVKM03qRTt5tOH7eapcN/e1Fwp5UoLK+xCoStTr+ymsQ8k3QSEFIvRv6ULWSq8BfLGpcNy7i5HxRCVJ6OKr4pDtpV6+RmznDUWsYfEi/gBnlNqn0CTx58FRDzOyuU7rgI7Jzl7cw35JUQkXosOyzdlt4NutBP//GNEoif6n8c6UOGoc6sFr5ZtC44i2F8OkFtuqt61y9ZndnqwFlK3jpyip+rCndEKahOBK74cu0CGo4YeSSdgW4b6OXKjxQh450Xug2OBY+h71Xrdc4CJXUXuRzCOjram8HS3lbj3yvqK5CXD5XZN2M/o+Rsvqm09Sv2FrJg=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fBu7hcaA+NdMNh6mjBwwyqyHB6KoOv6BoPv+JLvJ/PQqkojVF3vVwCTk9s90ubcVhYA1m/0l6hHtyKRroE0ESDTpqkvvrlL2wWZJrKJh+lRDym5nS94n6rX+7NpPM9HXXLSCRlywPherMoIyOY/vGRO/6ZaJtpEilmmgY6bkYPelxZVRZMbDIiCckN8Ie0K735yTO69e6sci/HjM0/CwrbXnKDAP+pCDTtrDarlmAwLmZIkEknoPfWlLoY3FVqQFXVMRgZSnnzOYJdLQFtmcmykAkPnbTdUsbkPrcDBZOAeILumWoxwQaNFLBY9SpO6h46RQRk4m/43Marv2mmGaxNRWav5m5Wx7+7LBe9+9JLrtCgKntv+BB4nymcQ90ihvySzMGnMN6IKh3pn0ztiuN0TD9mvIaHd9Ys1EQnlUCtO751RHx6qZtBTHLQKtcOBxsmJnFWkhvqYwwkh25YCxDkB/0+cYFQ/4CKKTnv8qKxoH2zLiq3/IKh+wSmoJrJmziOlRB60b27nu0DAi8413R0skbVuDBCeCth8SJTdPBsSWqO8/3yjLi/4/eJJEL/20QnNMFyMo45yHrKPhg8Sdc9dFC83BUj/VNmU+NbIIMGMqn9N8sJYhy0hNKgeSi5CLxHBn9IKnyDRN/xdd52arVw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?dIeZuifxIMxxVG54PLpVHugirvrswqLMSCv44bBBUL5Bv2JgEs3id+qJdS1G?=
 =?us-ascii?Q?hzEkkrrRtz3/8JOA9huQMet/glgQYx8bXH3HB/59xBlTmZcotMGCMd4vo1MA?=
 =?us-ascii?Q?ypgGtCkuoJPRWM8BiE3iYQocw9HfGEYQ6T5BOlr54y0/7cpSxmwL/eBL/DHS?=
 =?us-ascii?Q?5XE9Nw8v/Azl7hNNQn6eyN79DBnR097mmtt/sf2lS9S1diQXtwSH7DxN3o6R?=
 =?us-ascii?Q?a5wKHM/ArpeFpyB63FOP2Iw+kqhA6OaJxZQUBvtCumrkAIsu0hwp2LgyCi9m?=
 =?us-ascii?Q?0+W/Vw3ZaVngbNHOOyibUuR2n98Wzq2pfBoPMk/1RXBNVUBFW9E5x7mJDsPO?=
 =?us-ascii?Q?f9oJcGdYenfj1JtkGPe5h5AkM8Og50OjS90LEN+OhiRjLxzgANfbcyzHzqu0?=
 =?us-ascii?Q?IbCSwrAtDCrdEYDTh41ruLvsTWhwudVn/qKiTlzlxpke3ewDb+Fso7m4At0h?=
 =?us-ascii?Q?B+m8Ztac8FZz9TBiMKQI5jycKY1jjlEI00IQ7AT1GD2TjCAqmPLPwAmWSfzT?=
 =?us-ascii?Q?NLKWwJe1t9FkRKktqr52qwgTrR3VwiXcJ288eV5kOKgvGRJX/SviMLTci3S5?=
 =?us-ascii?Q?E9+8vAXtN/f8xpbJU42qcx4KLq/GINHUMmRmmzIZBLY45Or0Gl7+iohIKKmL?=
 =?us-ascii?Q?JNRqDT5zINF77PhqD5RUfgVJsMwLQ2n4DMyE5ToPj04rqrvfaqksC2sj2LSn?=
 =?us-ascii?Q?/2pRg7LbU7rWgmC3BVdgqUnOh9+Ce8ojjkqfLdDhGznLPxZS/LjrJQi3koZB?=
 =?us-ascii?Q?UPUKH6lZyxi8tXbUcCzx7TmqsD46cBJOJyMJeOT+QVo5X2TrkYD5fnC9mfJL?=
 =?us-ascii?Q?/3EL7PIeefCBgERkpunJp3+uQbiYP89GhE+7q0kTcd81NMQmPMjwBXi1Fd4s?=
 =?us-ascii?Q?2s19Df3rYibJoQZBp9IkzwVOQkyQlgzCXtyGaBpieVf+osBTjE9vzmPvzmJk?=
 =?us-ascii?Q?YemM+PWjoDARs0F4yRDzyBeS4EFqXy7IJoQ6BdcnwOJCW8ry9m1tP1SOJHRC?=
 =?us-ascii?Q?Q+nuprDkqSA1VtGHttooALZioTmlDHcEQkh0BhrO35e4Np60P38XXUJuABnA?=
 =?us-ascii?Q?ytkK2QycQRYBIcbxWYjFc9l8fX+a7XWxpRWS4EouCLlXz4YgBVeFhauGRctq?=
 =?us-ascii?Q?8YZphCQOciv4E8nupslPpDnUUcu96DjPMY2Nfd5BCxReCTBD5kLNcpD4T2Xm?=
 =?us-ascii?Q?vVJWpdfyCFnCxH4KpbetqvF3AYgt1/b+xaoRAQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0f8b42-44a2-4e82-cc0f-08dc20f7fc2e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 18:27:43.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9341
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baoquan He <bhe@redhat.com> Sent: Monday, January 29, 2024 5:51 AM
>=20
> Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
> arch/x86/xen/enlighten_hvm.c.

Did some words get left out in the above sentence?  It mentions the Xen
case, but not the Hyper-V case.  I'm not sure what you intended.

>=20
> Although the nesting works well too since CONFIG_CRASH_DUMP has
> dependency on CONFIG_KEXEC_CORE, it may cause confuse because there

s/confusion/confuse/

> are places where it's not nested, and people may think it need be nested

s/need be/needs to be/

> even though it doesn't have to.
>=20
> Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
> CONFIG_KEXEC_CODE ifdeffery scope.
>=20
> And also fix a building error Nathan reported as below by replacing
> CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.
>=20
> =3D=3D=3D=3D
> $ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/l=
inux-edge/config-edge.x86_64=20
> $ make -skj"$(nproc)" ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-linux-
> olddefconfig all
> ...
> x86_64-linux-ld: arch/x86/xen/mmu_pv.o: in function
> `paddr_vmcoreinfo_note':
> mmu_pv.c:(.text+0x3af3): undefined reference to `vmcoreinfo_note'
> =3D=3D=3D=3D
>=20
> Link: https://lore.kernel.org/all/SN6PR02MB4157931105FA68D72E3D3DB8D47B2@=
SN6PR02MB4157.namprd02.prod.outlook.com/T/#u
> Link: https://lore.kernel.org/all/20240126045551.GA126645@dev-arch.thelio=
-3990X/T/#u
> Signed-off-by: Baoquan He <bhe@redhat.com>

Modulo the commit message nits, LGTM.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

> ---
>  arch/x86/kernel/cpu/mshyperv.c | 10 ++++++----
>  arch/x86/kernel/reboot.c       |  2 +-
>  arch/x86/xen/enlighten_hvm.c   |  4 ++--
>  arch/x86/xen/mmu_pv.c          |  2 +-
>  4 files changed, 10 insertions(+), 8 deletions(-)
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
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 218773cfb009..e21974f2cf2d 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2520,7 +2520,7 @@ int xen_remap_pfn(struct vm_area_struct *vma,
> unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(xen_remap_pfn);
>=20
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_VMCORE_INFO
>  phys_addr_t paddr_vmcoreinfo_note(void)
>  {
>  	if (xen_pv_domain())
> --
> 2.41.0

