Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA9F841B79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 06:38:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Q7aov1W3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPDTt0ySjz3c56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 16:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Q7aov1W3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2c18::801; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c18::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPDT23J57z30hF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 16:37:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvbsOir8cbsXIOhX6IacKgKxwtGlDvvCbmmCwDZDqsFp3zJ+hah7G14t4DnNsUAPZADsdbKcRzGODGnIg8ZkVcAJpK0zLygbuX9GjWzZoE28XfeMT4VGVT+xOnA/RRz/cRlgl3VJvt/A8KrQv4nyc36lbNTpYhYDo4eFAHWC0xQoatyqAWJBzpfIdSLfqNM680/OAWbSEoGXqlBYlUShn/pSTnRR1JRRzUR2ezGjDtO0+fLnehl7LgLjquwgQIWqkZ0llV4iwnZPBTdlN7t6dUQHGJjiCjMrujYEZ6MXHPXqoJAjm9CVZh8/CZrddTbPPOqDIFMsjE1JVMlx3VvAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePbyv4Cys6R9EWXnFliOFQTh/8OgQ8tkirzhniJ99GM=;
 b=ivXw+t8LVw179ZnQriHr6GMgwQDlEyHy7QkjiHqXDTV+jlsBxvWiVCt2M7o/K2X2/ga6OaABtscJudli4V7uaBoECoyVnACB5oETTAmf/bRfqGP9swHm0sklw2aqt45ZH5V64qsRNq+L63Qi0LKaSl0FJfpeRNYzt5mL74SxbMgreKwnkkeLvPw3W7HbD0+bfKUPLcCTR+6rvznVkbrZzX5d5oF6Kyl81TJpgL2jIwawAzXjyIAIJ5FwdGDWktNdpKDi3Lm+rYxnu5/qU6jXEEIwHiuMbRI7wOUCIoz/B+WeRyjwcrVa9g/3sLWCSgPJmRp5Ljv67gXXkB4ErAcz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePbyv4Cys6R9EWXnFliOFQTh/8OgQ8tkirzhniJ99GM=;
 b=Q7aov1W3ga/uFq1/3is2m/dij1IWXm4XYFdLaffQ5NFrs2Fs/RkyrHTlx/obkpcTI8KeWKcuS+EcJHnqusQfLj40ipBTnUgDHQZ1drMcfNoODd5lhZ/5VE6whtEXJHWxXxHTOCN2fB8JkFI6/GEVpSpeixWEdnMaEWsAqIwED6tDlqqUiVejbDvdm4+8NPeKdj/hmrfhP+vrLenuhgQf7LW79DNtAISjRR9Xv5FmgYG+39Ik0Y1eFVt33uyt2Y5fmHMZGYuXPSJ94Wqqr2QOo2hWczJjwD3Ykje5fsnbToqr/wFy9C2o4Bx9emziVrnkuPErreFRzJS1GoEJlMVskA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6728.namprd02.prod.outlook.com (2603:10b6:610:7e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 05:36:59 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 05:36:59 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: RE: [PATCH v2 linux-next 1/3] x86, crash: don't nest
 CONFIG_CRASH_DUMP ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Topic: [PATCH v2 linux-next 1/3] x86, crash: don't nest
 CONFIG_CRASH_DUMP ifdef inside CONFIG_KEXEC_CODE ifdef scope
Thread-Index: AQHaUyh40go+WQA5m0KtJmeFc8tkfrDx1bKw
Date: Tue, 30 Jan 2024 05:36:59 +0000
Message-ID:  <SN6PR02MB4157BA050EF4F9D9F58BC694D47D2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240129135033.157195-1-bhe@redhat.com>
 <ZbhmL/jQtZ7TFZqV@MiWiFi-R3L-srv>
In-Reply-To: <ZbhmL/jQtZ7TFZqV@MiWiFi-R3L-srv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [VDYORJ1NoFVwoncY4cx01ogrvBox94eG]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6728:EE_
x-ms-office365-filtering-correlation-id: f6328023-b16c-4bca-3cb0-08dc21557a96
x-ms-exchange-slblob-mailprops:  I89ikN2gb/9QbZtBpKkFdMk9gU7jZqZBTe7LPV7TAM+eVIUHrjlNRxn9SoJbiTKOEel6Zs9xDJ0eGGLvYsa1vpMfTjr/kYcziSbS5dQw2vEt9HnNh/WRyS1mE7oHyMLUo99xCzoCzlnY7tm+gI7Idx16W3VvMxqOqvLsJ5qKSwAhDlK5K3nWyHlRfL7ZJ/QMG0CR2xRXnM8A0VrzFcbZBhdt3hD9DLfYliVJt4Tq04GPSqrPAw+VTx9Ppfn7WIMSecnOriaKX8OSFlXsC7WwWL0Xny9wR7QaFN7ULKfDREMmWACMOqZ4jCyaLQdk8VT90NX0KilqwVeWMVabI6xo8PP9WhIQu9+FyFG2DL/iMnqSNmqdkcZlduLyTKK++/MjekbNGR9SQRWEgr714RGDkiaY7cCWWJKnOBtYtCzGlSS5gVj0D0dGoC9soCOC47zlvXiwEr5IEM66vws+4HnE/3HNNAMHevwH7scQnvKFA9+nCwvWcCpg6ZhtAct3lSHfZfrul+Cz2Hn4RQG9TsBnup3YR0K9ZoQKh7icGxmFNtjs+ZpkdtFDozxWYX87eIr39Qsi75gsytA/duiKUTIzbAKp+qwzYK0oFVO2sVzGPwl2d9eqq+G+CPTbz/aKMbQp2wqvMAUfeB71K3NDOC4lO1tQAyRJsFqWGxjoA9yBesdqsD1LOT7eU37jvGtfA7orCbI1Wv4qB+Ubs0KTIbpow2JiaJKWciyRMr8aLLAWdc90iTq3+V7F1JfwtR0yUvxZ05i+lOGI9lZ12fwZBRbDmjD8hyKKFDpLSvY6bGhzSZysimc5YzxtRnO0WXXe2xwkWlrOywRh4bIrwAlUrGHXlYvWjfNs81pYMBm/ZKmztJVph9A//RpU7cdvQteN3BwE64ZRq4dYqVI=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nEfAoiEFUwKWt8O37FmbSaXn4XOs2vOVebnZPji0gvNEthBzMKZNi4CklBO4Z4rJy5WKXTMKzWyvslXxa4YOKmcZREB+82QFdKL6fZIBGYRKmRf7yccXuodD61XrQS2mVQlGBoQq04b8ybrPuZ8038oUjALBAhW9vV0a7rICSBb9LUvqbeHXOpxNiB+lhegHjR9CpIg44+fXpm32d3rQNom5daQtJexK13Q3/RwThG70ed9nMNECh6Kwnjy67oUyUfJNx4b5XMySRchQq+7Jzf4AUjZaTZB2WpmP8kd+VK14z06lKqXHLyyeg1xR4JpjX1xjrds8DxffzEQFL2j7RaidfpnxEeNUDvyWPVORJIyWdwQom1adrrCRKoLvsbnPaIuNgm27VCIB20BXJofpz2i6PGnXPyPPz3JA+XWqGF5kzSbuLkwH4zR9rhb7bf3QmAi7EnDdN1cx3EO8Yrk8DRCm219cSBfWygeFpSYp9TvQuFShn7+vVYxdG6WKQW0kCfwB31TLNBWpTbOxWvYHARnHSwxJmv7tYgpPEpEb+Ryk6QWznQdTFVJT9Jhc1uRNgFbNZrZMngTjbaTbQ8IHSekvgVZdLgdYqR7IuPbq8NAnbn1uiWsiq9rMfy7t6FYbJPbgQVCKfIqxFLlfY3tc4A==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?yUhm9bN62hMTp6PwIbxaghVUECXBtPW1Lc30pSmY6HpQMrFaFLX+BLsX0uB6?=
 =?us-ascii?Q?jIF00WeBb1S5QlSdO4C7q0Ufsvf2rtiponsVLXznX12bIpI5HX7xaKuYX9od?=
 =?us-ascii?Q?auy9tiN/GnhOQheCLeg1U1WjFSXo9EucEakEphhjrDZm8T+LX4Fb2Ug910sz?=
 =?us-ascii?Q?ZXVm31DmIKtgl2zADzvvS6KQQ2c2M4HnZduQezk2sYWp8H/Q79znTyi2CQ2E?=
 =?us-ascii?Q?CD6o13TbrRM3iYb3NrFrpMAe3Yk2VMguoMB7nd7k7OxEiL2U4Onb5JcCkUSS?=
 =?us-ascii?Q?lPgaGqv0l7qTjLd84cMV1iRU/Yc5zgSbLCAsm+hSuUEh9aGDSCCPhxVdCxZ2?=
 =?us-ascii?Q?sjtPm1RALTZV5ZAwg7b+4cmnaV6vq/2IKRpnJSRbRxjsJxVAnVlbS/jekVTH?=
 =?us-ascii?Q?L0ujxsnD38hlaetMg/cw3ER5LBGfbzqTJWca0InsS/55hLhr4YU5Aq8cKLDj?=
 =?us-ascii?Q?06K2NJ+JnLd8CKIgLevKayjiw8/W66K9endcYefVcDoVfnOQUgJ5kDSvxxJ7?=
 =?us-ascii?Q?dILUTkU+E7yqu+tKp6BwDAhFnGrj6QT5R5QiN39TRCUaTENctuw9YF1xIvi8?=
 =?us-ascii?Q?W13olJIV6BtN0f3uAmpMbpQWK8nlWNogunOnW5z2poELl0YJY+wtyFykPL+2?=
 =?us-ascii?Q?YQ2ko3FP0/EEJciy26DqgRqd9RrQ8GO2a+M7EYQEeHAxtITDCCGvjDK0yv51?=
 =?us-ascii?Q?5jYLg1WsPQ82Zk86OGX99pwNqALF9WzV3Zrq4otkvXsvKpUqxC8UeyF+MAdg?=
 =?us-ascii?Q?w1c13QDCN0MONZtSSmaBYXodb+fCqSGikh6wPpAo15kvUAgmdHWOMVkCrjVC?=
 =?us-ascii?Q?fLGeeK1cKhsjq2a6iAHgb5bVPO3DSnOd7BAv+7BMNXDtK3GeqaXMLaYUKih+?=
 =?us-ascii?Q?mah8kcMk0jeHnA146obsusFpNygwntXZ2nLrwvrKyhPbTLb82CwcH5dg4E0Q?=
 =?us-ascii?Q?yzsV5Vp/6Fz5ZGzMEU6RN1J9Op5+H9zaPVLBJbUDieusqpsfHSgfByvsG2rV?=
 =?us-ascii?Q?ZsHa8a3vlSZY9oDELqXyRd9Wj3eafyDMCUkeWoqMAhVqOb25ZQMcVCC3nAi0?=
 =?us-ascii?Q?HMZnRo4W0jbawzGtiHH9rzbdF2yXAVV4rI1rfTxxZ9n/fJ2M0xzkoX/jqn3h?=
 =?us-ascii?Q?oD/gyicMqLPW4JWMjri+BI2GYYJ3MbBvhqT+dpiBEc+O3g89HUvTMAfdsd4j?=
 =?us-ascii?Q?bXVtCeISgi0t2KqIxY876I1RKrodqh34mgJ0Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f6328023-b16c-4bca-3cb0-08dc21557a96
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 05:36:59.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6728
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

From: Baoquan He <bhe@redhat.com> Sent: Monday, January 29, 2024 7:00 PM
>=20
> Michael pointed out that the CONFIG_CRASH_DUMP ifdef is nested inside
> CONFIG_KEXEC_CODE ifdef scope in some XEN, Hyper-V codes.
>=20
> Although the nesting works well too since CONFIG_CRASH_DUMP has
> dependency on CONFIG_KEXEC_CORE, it may cause confusion because there
> are places where it's not nested, and people may think it needs to be
> nested even though it doesn't have to.
>=20
> Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
> CONFIG_KEXEC_CODE ifdeffery scope.
>=20
> And also put function machine_crash_shutdown() definition inside
> CONFIG_CRASH_DUMP ifdef scope instead of CONFIG_KEXEC_CORE ifdef.
>=20
> And also fix a building error Nathan reported as below by replacing
> CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.
>=20
> =3D=3D=3D=3D
> $ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/l=
inux-edge/config-edge.x86_64
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
> ---
> v1->v2:
> - Add missing words and fix typos in patch log pointed out by Michael.
>=20
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

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

