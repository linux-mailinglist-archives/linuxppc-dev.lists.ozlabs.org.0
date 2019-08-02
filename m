Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F97EF88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 10:43:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460LKZ6bL1zDqwp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 18:43:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.72; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=diana.craciun@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="FBpyo0pR"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460LHl268tzDqsX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 18:41:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Won4CxpcJSkOjpNComDQwdIi5yKBDarnM1Bfg8MQbtzvq02oH/9kUTvvgASSjlkrIJK/dfnpjVeUvQVrJUmkrf7AI3XOYLwVf4E1gnsywSvWt0ObfwC7JLiu8ImV5Fri9gToY2vs62iiqbiXCH7LT6F5oqOJi6IHYeoog/67rgZfujxSFfjiyIBBq/jlue6N/QOqFJcpeupivnuPIzfFvG5SEyttrLky0mGOVXmPIWWvnZ1fRuJNNHMGOGUaMAENp1gNws2nwqL4akvTaKDQMpAPLvN5773mAIkCqfMv8TimM5z+Ot/bupX24WbFtI0nvtE1qS0uLKSRCdUqmvG+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpdyFPig6R2Z06i9vFKbp5xr0vkaLDccljo6zPGK2e0=;
 b=oSyxFCQxmqvUl/1VZKil8T2b3+Hb6JGNfR0W6AmqzETpswyh+uVuNWtKE3Fiy8AijDzsMjl+qPhjRScgn5BYL+P5zGqlAh0gW2drgqcHe08WoavyV7REcb24qL8+Q7nafIXI7Z/HBGcp1O+eIrdoHWHI60UmvxiXT1ccsD02mytkVEHkXECOm6DpOnTx3eGOw6N//I05y9uqEmAbmPwrfH0R+hJMN/8/lzpDzfMGOhGJaycEQ2sgV2Pflj/t+P25wyNv6Yk/4eaMjv/geVKFZZvXaETFiPTvFTIX/4vPDEJg+JRj8bU7oTLKwdTR8vOSKdZrRD1tgcp1ut/S3+GQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpdyFPig6R2Z06i9vFKbp5xr0vkaLDccljo6zPGK2e0=;
 b=FBpyo0pRtdzq3ecjFotZC1bC363D9j4SrsK681UsGEWfUTrB6P1BM+4Gmug+Mh6gTRZTLMA7wJnY+CBCVit1Qd1GP0trFA6mYQJpgeZFqDvwma5u+OhtAxNJHE4KjE0jT6rdKWhhYRAVQm0oezV3nSSYSOMH+21NAAQM63IWuMA=
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com (10.168.61.13) by
 VI1PR0401MB2432.eurprd04.prod.outlook.com (10.169.136.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 08:41:45 +0000
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::49dc:1671:b13b:e382]) by VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::49dc:1671:b13b:e382%9]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 08:41:45 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Jason Yan <yanaijie@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "christophe.leroy@c-s.fr"
 <christophe.leroy@c-s.fr>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "keescook@chromium.org"
 <keescook@chromium.org>, "kernel-hardening@lists.openwall.com"
 <kernel-hardening@lists.openwall.com>
Subject: Re: [PATCH v3 06/10] powerpc/fsl_booke/32: implement KASLR
 infrastructure
Thread-Topic: [PATCH v3 06/10] powerpc/fsl_booke/32: implement KASLR
 infrastructure
Thread-Index: AQHVR4I0njkKhpe8o0mqCq4ImCeR9A==
Date: Fri, 2 Aug 2019 08:41:45 +0000
Message-ID: <VI1PR0401MB24637B79618C29684168D831FFD90@VI1PR0401MB2463.eurprd04.prod.outlook.com>
References: <20190731094318.26538-1-yanaijie@huawei.com>
 <20190731094318.26538-7-yanaijie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 318cb938-6a43-41a1-08d2-08d717254021
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0401MB2432; 
x-ms-traffictypediagnostic: VI1PR0401MB2432:
x-microsoft-antispam-prvs: <VI1PR0401MB2432A902F2CCEA99D30EB996FFD90@VI1PR0401MB2432.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(189003)(199004)(81166006)(66556008)(66446008)(7736002)(66476007)(64756008)(55016002)(86362001)(81156014)(6436002)(8676002)(76176011)(33656002)(2501003)(6506007)(53546011)(25786009)(76116006)(5660300002)(229853002)(6246003)(53936002)(91956017)(74316002)(9686003)(8936002)(66946007)(2906002)(4326008)(102836004)(54906003)(110136005)(14454004)(99286004)(3846002)(52536014)(305945005)(68736007)(7416002)(6116002)(316002)(256004)(14444005)(66066001)(186003)(71190400001)(71200400001)(478600001)(486006)(446003)(476003)(26005)(7696005)(2201001)(2004002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB2432;
 H:VI1PR0401MB2463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z0/hDToGP/Tv39dh7N+RhpMftfSuwbY6KD+Zaor7ARpx1JvF9Zy6IOBSKZ8p1PYh9fGSTRCIIgtnEqgtEenbwfci57WUpYCLnu68/PH2Lw+khwxUWaIoZa5B9szxvbIH5HojA8oAtLYVqVuaRzOPg5X8wnQJFGM0nR2016vw97HTeSjUUJOfDlAYxiJu0GQYt827N7zsjFoBbm74KFpFm5NRyqrO4Df0x14yb+wqjAV0iqwSgNNoxHNxZgYvLF/NxeZLsaQL029+TzKL36iPkQb5gjqH7U2vNZUwYCm2/Sycgr/+mrl4z1qOwF9VUFaCw9DAOiSMU9At7e+/62dPgThWPAfevOMwqC5azmAyeuLYu/dvM1MzRBCoTpgB0VTZEmfEqIEQVgWSIKFwZsUemvYLiwy9og1EMHKJm1OsPZM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318cb938-6a43-41a1-08d2-08d717254021
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 08:41:45.1278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diana.craciun@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2432
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jingxiangfeng@huawei.com" <jingxiangfeng@huawei.com>,
 "zhaohongjiang@huawei.com" <zhaohongjiang@huawei.com>,
 "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
 "fanchengyang@huawei.com" <fanchengyang@huawei.com>,
 "yebin10@huawei.com" <yebin10@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/31/2019 12:27 PM, Jason Yan wrote:=0A=
> This patch add support to boot kernel from places other than KERNELBASE.=
=0A=
> Since CONFIG_RELOCATABLE has already supported, what we need to do is=0A=
> map or copy kernel to a proper place and relocate. Freescale Book-E=0A=
> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1=0A=
> entries are not suitable to map the kernel directly in a randomized=0A=
> region, so we chose to copy the kernel to a proper place and restart to=
=0A=
> relocate.=0A=
>=0A=
> The offset of the kernel was not randomized yet(a fixed 64M is set). We=
=0A=
> will randomize it in the next patch.=0A=
>=0A=
> Signed-off-by: Jason Yan <yanaijie@huawei.com>=0A=
> Cc: Diana Craciun <diana.craciun@nxp.com>=0A=
> Cc: Michael Ellerman <mpe@ellerman.id.au>=0A=
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>=0A=
> Cc: Paul Mackerras <paulus@samba.org>=0A=
> Cc: Nicholas Piggin <npiggin@gmail.com>=0A=
> Cc: Kees Cook <keescook@chromium.org>=0A=
> ---=0A=
>  arch/powerpc/Kconfig                          | 11 +++=0A=
>  arch/powerpc/kernel/Makefile                  |  1 +=0A=
>  arch/powerpc/kernel/early_32.c                |  2 +-=0A=
>  arch/powerpc/kernel/fsl_booke_entry_mapping.S | 13 ++-=0A=
>  arch/powerpc/kernel/head_fsl_booke.S          | 13 ++-=0A=
>  arch/powerpc/kernel/kaslr_booke.c             | 84 +++++++++++++++++++=
=0A=
>  arch/powerpc/mm/mmu_decl.h                    |  6 ++=0A=
>  arch/powerpc/mm/nohash/fsl_booke.c            |  7 +-=0A=
>  8 files changed, 124 insertions(+), 13 deletions(-)=0A=
>  create mode 100644 arch/powerpc/kernel/kaslr_booke.c=0A=
>=0A=
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig=0A=
> index 77f6ebf97113..755378887912 100644=0A=
> --- a/arch/powerpc/Kconfig=0A=
> +++ b/arch/powerpc/Kconfig=0A=
> @@ -548,6 +548,17 @@ config RELOCATABLE=0A=
>  	  setting can still be useful to bootwrappers that need to know the=0A=
>  	  load address of the kernel (eg. u-boot/mkimage).=0A=
>  =0A=
> +config RANDOMIZE_BASE=0A=
> +	bool "Randomize the address of the kernel image"=0A=
> +	depends on (FSL_BOOKE && FLATMEM && PPC32)=0A=
> +	select RELOCATABLE=0A=
> +	help=0A=
> +	  Randomizes the virtual address at which the kernel image is=0A=
> +	  loaded, as a security feature that deters exploit attempts=0A=
> +	  relying on knowledge of the location of kernel internals.=0A=
> +=0A=
> +	  If unsure, say N.=0A=
> +=0A=
>  config RELOCATABLE_TEST=0A=
>  	bool "Test relocatable kernel"=0A=
>  	depends on (PPC64 && RELOCATABLE)=0A=
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile=
=0A=
> index ea0c69236789..32f6c5b99307 100644=0A=
> --- a/arch/powerpc/kernel/Makefile=0A=
> +++ b/arch/powerpc/kernel/Makefile=0A=
> @@ -106,6 +106,7 @@ extra-$(CONFIG_PPC_8xx)		:=3D head_8xx.o=0A=
>  extra-y				+=3D vmlinux.lds=0A=
>  =0A=
>  obj-$(CONFIG_RELOCATABLE)	+=3D reloc_$(BITS).o=0A=
> +obj-$(CONFIG_RANDOMIZE_BASE)	+=3D kaslr_booke.o=0A=
>  =0A=
>  obj-$(CONFIG_PPC32)		+=3D entry_32.o setup_32.o early_32.o=0A=
>  obj-$(CONFIG_PPC64)		+=3D dma-iommu.o iommu.o=0A=
> diff --git a/arch/powerpc/kernel/early_32.c b/arch/powerpc/kernel/early_3=
2.c=0A=
> index 3482118ffe76..fe8347cdc07d 100644=0A=
> --- a/arch/powerpc/kernel/early_32.c=0A=
> +++ b/arch/powerpc/kernel/early_32.c=0A=
> @@ -32,5 +32,5 @@ notrace unsigned long __init early_init(unsigned long d=
t_ptr)=0A=
>  =0A=
>  	apply_feature_fixups();=0A=
>  =0A=
> -	return KERNELBASE + offset;=0A=
> +	return kimage_vaddr + offset;=0A=
>  }=0A=
> diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc=
/kernel/fsl_booke_entry_mapping.S=0A=
> index de0980945510..6d2967673ac7 100644=0A=
> --- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S=0A=
> +++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S=0A=
> @@ -161,17 +161,16 @@ skpinv:	addi	r6,r6,1				/* Increment */=0A=
>  	lis	r6,(MAS1_VALID|MAS1_IPROT)@h=0A=
>  	ori	r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l=0A=
>  	mtspr	SPRN_MAS1,r6=0A=
> -	lis	r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@h=0A=
> -	ori	r6,r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@l=0A=
> -	mtspr	SPRN_MAS2,r6=0A=
> +	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h=0A=
> +	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l=0A=
> +	and     r6,r6,r20=0A=
> +	ori	r6,r6,M_IF_NEEDED@l=0A=
> +	mtspr   SPRN_MAS2,r6=0A=
>  	mtspr	SPRN_MAS3,r8=0A=
>  	tlbwe=0A=
>  =0A=
>  /* 7. Jump to KERNELBASE mapping */=0A=
=0A=
The code has changed, but the comment reflects the old code (it no=0A=
longer jumps to KERNELBASE, but to kimage_vaddr). This is true for step=0A=
6 as well.=0A=
=0A=
> -	lis	r6,(KERNELBASE & ~0xfff)@h=0A=
> -	ori	r6,r6,(KERNELBASE & ~0xfff)@l=0A=
> -	rlwinm	r7,r25,0,0x03ffffff=0A=
> -	add	r6,r7,r6=0A=
> +	mr	r6,r20=0A=
>  =0A=
>  #elif defined(ENTRY_MAPPING_KEXEC_SETUP)=0A=
>  /*=0A=
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/h=
ead_fsl_booke.S=0A=
> index 2083382dd662..aa55832e7506 100644=0A=
> --- a/arch/powerpc/kernel/head_fsl_booke.S=0A=
> +++ b/arch/powerpc/kernel/head_fsl_booke.S=0A=
> @@ -155,6 +155,8 @@ _ENTRY(_start);=0A=
>   */=0A=
>  =0A=
>  _ENTRY(__early_start)=0A=
> +	LOAD_REG_ADDR_PIC(r20, kimage_vaddr)=0A=
> +	lwz     r20,0(r20)=0A=
>  =0A=
>  #define ENTRY_MAPPING_BOOT_SETUP=0A=
>  #include "fsl_booke_entry_mapping.S"=0A=
> @@ -277,8 +279,8 @@ set_ivor:=0A=
>  	ori	r6, r6, swapper_pg_dir@l=0A=
>  	lis	r5, abatron_pteptrs@h=0A=
>  	ori	r5, r5, abatron_pteptrs@l=0A=
> -	lis	r4, KERNELBASE@h=0A=
> -	ori	r4, r4, KERNELBASE@l=0A=
> +	lis     r3, kimage_vaddr@ha=0A=
> +	lwz     r4, kimage_vaddr@l(r3)=0A=
>  	stw	r5, 0(r4)	/* Save abatron_pteptrs at a fixed location */=0A=
>  	stw	r6, 0(r5)=0A=
>  =0A=
> @@ -1067,7 +1069,12 @@ __secondary_start:=0A=
>  	mr	r5,r25		/* phys kernel start */=0A=
>  	rlwinm	r5,r5,0,~0x3ffffff	/* aligned 64M */=0A=
>  	subf	r4,r5,r4	/* memstart_addr - phys kernel start */=0A=
> -	li	r5,0		/* no device tree */=0A=
> +	lis	r7,KERNELBASE@h=0A=
> +	ori	r7,r7,KERNELBASE@l=0A=
> +	cmpw	r20,r7		/* if kimage_vaddr !=3D KERNELBASE, randomized */=0A=
> +	beq	2f=0A=
> +	li	r4,0=0A=
> +2:	li	r5,0		/* no device tree */=0A=
>  	li	r6,0		/* not boot cpu */=0A=
>  	bl	restore_to_as0=0A=
>  =0A=
> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kasl=
r_booke.c=0A=
> new file mode 100644=0A=
> index 000000000000..30f84c0321b2=0A=
> --- /dev/null=0A=
> +++ b/arch/powerpc/kernel/kaslr_booke.c=0A=
> @@ -0,0 +1,84 @@=0A=
> +// SPDX-License-Identifier: GPL-2.0-only=0A=
> +/*=0A=
> + * Copyright (C) 2019 Jason Yan <yanaijie@huawei.com>=0A=
> + *=0A=
> + * This program is free software; you can redistribute it and/or modify=
=0A=
> + * it under the terms of the GNU General Public License version 2 as=0A=
> + * published by the Free Software Foundation.=0A=
> + */=0A=
> +=0A=
> +#include <linux/signal.h>=0A=
> +#include <linux/sched.h>=0A=
> +#include <linux/kernel.h>=0A=
> +#include <linux/errno.h>=0A=
> +#include <linux/string.h>=0A=
> +#include <linux/types.h>=0A=
> +#include <linux/ptrace.h>=0A=
> +#include <linux/mman.h>=0A=
> +#include <linux/mm.h>=0A=
> +#include <linux/swap.h>=0A=
> +#include <linux/stddef.h>=0A=
> +#include <linux/vmalloc.h>=0A=
> +#include <linux/init.h>=0A=
> +#include <linux/delay.h>=0A=
> +#include <linux/highmem.h>=0A=
> +#include <linux/memblock.h>=0A=
> +#include <asm/pgalloc.h>=0A=
> +#include <asm/prom.h>=0A=
> +#include <asm/io.h>=0A=
> +#include <asm/mmu_context.h>=0A=
> +#include <asm/pgtable.h>=0A=
> +#include <asm/mmu.h>=0A=
> +#include <linux/uaccess.h>=0A=
> +#include <asm/smp.h>=0A=
> +#include <asm/machdep.h>=0A=
> +#include <asm/setup.h>=0A=
> +#include <asm/paca.h>=0A=
> +#include <mm/mmu_decl.h>=0A=
> +=0A=
> +extern int is_second_reloc;=0A=
> +=0A=
> +static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_add=
r_t size,=0A=
> +						  unsigned long kernel_sz)=0A=
> +{=0A=
> +	/* return a fixed offset of 64M for now */=0A=
> +	return SZ_64M;=0A=
> +}=0A=
> +=0A=
> +/*=0A=
> + * To see if we need to relocate the kernel to a random offset=0A=
> + * void *dt_ptr - address of the device tree=0A=
> + * phys_addr_t size - size of the first memory block=0A=
> + */=0A=
> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)=0A=
> +{=0A=
> +	unsigned long tlb_virt;=0A=
> +	phys_addr_t tlb_phys;=0A=
> +	unsigned long offset;=0A=
> +	unsigned long kernel_sz;=0A=
> +=0A=
> +	kernel_sz =3D (unsigned long)_end - KERNELBASE;=0A=
> +=0A=
> +	offset =3D kaslr_choose_location(dt_ptr, size, kernel_sz);=0A=
> +=0A=
> +	if (offset =3D=3D 0)=0A=
> +		return;=0A=
> +=0A=
> +	kimage_vaddr +=3D offset;=0A=
> +	kernstart_addr +=3D offset;=0A=
> +=0A=
> +	is_second_reloc =3D 1;=0A=
> +=0A=
> +	if (offset >=3D SZ_64M) {=0A=
> +		tlb_virt =3D round_down(kimage_vaddr, SZ_64M);=0A=
> +		tlb_phys =3D round_down(kernstart_addr, SZ_64M);=0A=
> +=0A=
> +		/* Create kernel map to relocate in */=0A=
> +		create_tlb_entry(tlb_phys, tlb_virt, 1);=0A=
> +	}=0A=
> +=0A=
> +	/* Copy the kernel to it's new location and run */=0A=
> +	memcpy((void *)kimage_vaddr, (void *)KERNELBASE, kernel_sz);=0A=
> +=0A=
> +	reloc_kernel_entry(dt_ptr, kimage_vaddr);=0A=
> +}=0A=
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h=0A=
> index 804da298beb3..9332772c8a66 100644=0A=
> --- a/arch/powerpc/mm/mmu_decl.h=0A=
> +++ b/arch/powerpc/mm/mmu_decl.h=0A=
> @@ -148,6 +148,12 @@ void reloc_kernel_entry(void *fdt, int addr);=0A=
>  extern void loadcam_entry(unsigned int index);=0A=
>  extern void loadcam_multi(int first_idx, int num, int tmp_idx);=0A=
>  =0A=
> +#ifdef CONFIG_RANDOMIZE_BASE=0A=
> +void kaslr_early_init(void *dt_ptr, phys_addr_t size);=0A=
> +#else=0A=
> +static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}=
=0A=
> +#endif=0A=
> +=0A=
>  struct tlbcam {=0A=
>  	u32	MAS0;=0A=
>  	u32	MAS1;=0A=
> diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/=
fsl_booke.c=0A=
> index 556e3cd52a35..8d25a8dc965f 100644=0A=
> --- a/arch/powerpc/mm/nohash/fsl_booke.c=0A=
> +++ b/arch/powerpc/mm/nohash/fsl_booke.c=0A=
> @@ -263,7 +263,8 @@ void setup_initial_memory_limit(phys_addr_t first_mem=
block_base,=0A=
>  int __initdata is_second_reloc;=0A=
>  notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)=0A=
>  {=0A=
> -	unsigned long base =3D KERNELBASE;=0A=
> +	unsigned long base =3D kimage_vaddr;=0A=
> +	phys_addr_t size;=0A=
>  =0A=
>  	kernstart_addr =3D start;=0A=
>  	if (is_second_reloc) {=0A=
> @@ -291,7 +292,7 @@ notrace void __init relocate_init(u64 dt_ptr, phys_ad=
dr_t start)=0A=
>  	start &=3D ~0x3ffffff;=0A=
>  	base &=3D ~0x3ffffff;=0A=
>  	virt_phys_offset =3D base - start;=0A=
> -	early_get_first_memblock_info(__va(dt_ptr), NULL);=0A=
> +	early_get_first_memblock_info(__va(dt_ptr), &size);=0A=
>  	/*=0A=
>  	 * We now get the memstart_addr, then we should check if this=0A=
>  	 * address is the same as what the PAGE_OFFSET map to now. If=0A=
> @@ -316,6 +317,8 @@ notrace void __init relocate_init(u64 dt_ptr, phys_ad=
dr_t start)=0A=
>  		/* We should never reach here */=0A=
>  		panic("Relocation error");=0A=
>  	}=0A=
> +=0A=
> +	kaslr_early_init(__va(dt_ptr), size);=0A=
>  }=0A=
>  #endif=0A=
>  #endif=0A=
=0A=
