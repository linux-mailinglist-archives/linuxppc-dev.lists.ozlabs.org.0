Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C5395A78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 14:23:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtvZg2WsWz3095
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 22:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com header.b=tULRj4D3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.243.62;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=tULRj4D3; dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtvZ63W0bz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 22:22:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNyhJTsf3pt/r/xJamo8CmEEtQ8PlpqlrxZtKV5/KRLbtROS00ndhXthrfTfEoU6o+TNla6Vsb0DxOAX2W2MF1aFmFC8hWk32XilicD576FX+GiikXXlq4Ng97l1O6bEaEotS5Jyvag5ypgZT/etcvPLK0PRf/sQKl/GytEg6c7A2TE9wtQE54O62y0Q474ijklDi9SC/qpS8krJW58Ki4ZEtmzNYCVWmUgpjmEP2uv/xrfEhSyIIwb9/m8rfObocwMivDjkrZ/IKbPFurOagXJMbAxlfNp+RI8KR6hQq7mq7u0L3w9uhZ8iljB5FCPMwPCLOkTrVyAlYEg1PSfqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS/QsdVDIzT8OPpGE0MNvbxd3Px81tbH99R4M1X8mI4=;
 b=Yix4qG2hYTGUGcJ+mGjY1jE1NdEiAFJmHnna7HSKhFhhm1gD1/5cN7/M/IBbj/8H9xtG4LJ7vf1ZspJwYrVE4Zm+bkUQGtm83riuo5NB+RGMeVT3uYUnaXiAKvG2Qu+9mun6xFJaGzoO41FU5JtdR4nvxXRMOqrpXuHpGiO4L7T1eXK3vogFdIcF2Yi2JQnOJAWW27TgqdeY+pgqsZk3jwwDE5jkv0XV3pIIVvX44rQsrMuK4b1xDWbxr225KYvW4c+yL4ejoP4Ayz0yVjL35iOdE50NA5VoVHbPBKUvPno1udw4NOt8YjmytvQR4Mim3SZwe6j3ZCSBlandRMRUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS/QsdVDIzT8OPpGE0MNvbxd3Px81tbH99R4M1X8mI4=;
 b=tULRj4D3zOCR1er2uvUfkkrbShd4TaZRYh0jXOpFcN/hDc/e1uYNNdjsszseyAjuS7yP0KJCI16H+wf+f8igyfyp++uOl0XCH38sZ9X8MJJ7XS4nbZnvjCnehTvyWmBseA2+iMCNhRnI/ZfApdT6zkQkH3Nk+z/m69D7w2R/d3Y=
Received: from BN6PR14CA0048.namprd14.prod.outlook.com (2603:10b6:404:13f::34)
 by CH2PR02MB6454.namprd02.prod.outlook.com (2603:10b6:610:10::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Mon, 31 May
 2021 12:22:28 +0000
Received: from BN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::63) by BN6PR14CA0048.outlook.office365.com
 (2603:10b6:404:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 12:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT018.mail.protection.outlook.com (10.13.3.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 12:22:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 05:22:27 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 05:22:27 -0700
Envelope-to: rppt@linux.ibm.com, linux@armlinux.org.uk, rth@twiddle.net,
 palmer@dabbelt.com, bp@alien8.de, mingo@redhat.com,
 davem@davemloft.net, tsbogend@alpha.franken.de,
 geert@linux-m68k.org, will@kernel.org, catalin.marinas@arm.com,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-ia64@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, wangkefeng.wang@huawei.com
Received: from [172.30.17.109] (port=59010)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1lngw6-0007Re-TG; Mon, 31 May 2021 05:22:27 -0700
Subject: Re: [PATCH v2] mm: generalize ZONE_[DMA|DMA32]
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
 <20210528074557.17768-1-wangkefeng.wang@huawei.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <67269724-625f-4e82-7c05-a52879bc94bd@xilinx.com>
Date: Mon, 31 May 2021 14:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527071dd-5cb3-4563-fdf7-08d9242ec17c
X-MS-TrafficTypeDiagnostic: CH2PR02MB6454:
X-Microsoft-Antispam-PRVS: <CH2PR02MB64548E9C7BA43828A70BB99EC63F9@CH2PR02MB6454.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/pg3xWFq6y3RPjkPGOiLaLW9Wji9CdPTwNTWe9CaVsvRMWZMMj6QBjCcA77bEYBz9I5D+0zqiF2j8dQaEYAM4CcAI4qrpZtICpeIr5a0Z29sxH5bnGkAyJw3+iyyumdB8VyXziwywdDNwR0zc0Y04Wvm7dDira4ALIlBSKvhjkdhlqN5BPsu6GSpQv7qM0fGXaUK7HzfrklLidpcbtLiFQB4Gha0XPPDwXKQSRFPHJpLzppjEq77Z8SwlIUVeIoXBy4L5jA2yaNbEWUQMIce7ai+aXSIqSYro0ECe1OLB4zunQBtZ/H3ivgTQJRIPSioqMRyG75cKmPx50ZpTo+xVZUKwlWR6nLBDRHjMm1w66izC/EGbNH/POi8bjCmJiNsroTdxvjP1kK7WK+aAQzl6BkZzp8OCWkp3ZRJnsnevlr4xBuCb+Yb4zz9BuRHxD6zDco6DWQctQDOzeJc9jfSmCboq4rc93kdFU29DcCJsMXZMP6+o+vnByrm99B54RyUSPMlIPwft5iFt93pFnT2pl+aWfhqkPlvdSKtQ10XfypwmdZ+H6rpW+QxovZRHSimxf/xMTPFTptFzpvJjNlTgFCr4DJ5nYpCOJaxR5cec5b1t0vXm4HGbnCsu51jBCO7kSwr+2PBzihAGNm4/y2r617R4UHhcrt8boxg+AFqnAIpNZtJW0hr9uQzXXimWaKGAcID2PgXhcyd6vcXBD4wKnw/F4fhvn9oLO8rGnGi6I=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(5660300002)(53546011)(426003)(2906002)(9786002)(47076005)(7416002)(36756003)(31696002)(2616005)(83380400001)(36860700001)(336012)(44832011)(4326008)(6666004)(70206006)(8936002)(316002)(8676002)(31686004)(70586007)(54906003)(356005)(7636003)(26005)(82740400003)(110136005)(478600001)(186003)(82310400003)(50156003)(83133001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 12:22:28.1446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 527071dd-5cb3-4563-fdf7-08d9242ec17c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6454
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
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-ia64@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/28/21 9:45 AM, Kefeng Wang wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
> 
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com> # for arm64
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # for m68k
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -i386 can't enable ZONE_DMA32, fix it.
> -make ZONE_DMA default y on X86 as before.
> -collect ACKs
> 
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +
>  arch/riscv/Kconfig                     |  5 +----
>  arch/s390/Kconfig                      |  4 +---
>  arch/sparc/Kconfig                     |  5 +----
>  arch/x86/Kconfig                       | 15 ++-------------
>  mm/Kconfig                             | 12 ++++++++++++
>  14 files changed, 23 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 5998106faa60..6a69a14c4825 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -40,6 +40,7 @@ config ALPHA
>  	select MMU_GATHER_NO_RANGE
>  	select SET_FS
>  	select SPARSEMEM_EXTREME if SPARSEMEM
> +	select ZONE_DMA
>  	help
>  	  The Alpha is a 64-bit general-purpose processor designed and
>  	  marketed by the Digital Equipment Corporation of blessed memory,
> @@ -65,10 +66,6 @@ config GENERIC_CALIBRATE_DELAY
>  	bool
>  	default y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config GENERIC_ISA_DMA
>  	bool
>  	default y
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24804f11302d..000c3f80b58e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -218,9 +218,6 @@ config GENERIC_CALIBRATE_DELAY
>  config ARCH_MAY_HAVE_PC_FDC
>  	bool
>  
> -config ZONE_DMA
> -	bool
> -
>  config ARCH_SUPPORTS_UPROBES
>  	def_bool y
>  
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 9f1d8566bbf9..42794474f37f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -42,6 +42,7 @@ config ARM64
>  	select ARCH_HAS_SYSCALL_WRAPPER
>  	select ARCH_HAS_TEARDOWN_DMA_OPS if IOMMU_SUPPORT
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> +	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_ELF_PROT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_INLINE_READ_LOCK if !PREEMPTION
> @@ -307,14 +308,6 @@ config GENERIC_CSUM
>  config GENERIC_CALIBRATE_DELAY
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool "Support DMA zone" if EXPERT
> -	default y
> -
> -config ZONE_DMA32
> -	bool "Support DMA32 zone" if EXPERT
> -	default y
> -
>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	def_bool y
>  
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 279252e3e0f7..fd8503a0088a 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -60,6 +60,7 @@ config IA64
>  	select NUMA if !FLATMEM
>  	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
>  	select SET_FS
> +	select ZONE_DMA32
>  	default y
>  	help
>  	  The Itanium Processor Family is Intel's 64-bit successor to
> @@ -72,9 +73,6 @@ config 64BIT
>  	select ATA_NONSTANDARD if ATA
>  	default y
>  
> -config ZONE_DMA32
> -	def_bool y
> -
>  config MMU
>  	bool
>  	default y
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 372e4e69c43a..05a729c6ad7f 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -34,6 +34,7 @@ config M68K
>  	select SET_FS
>  	select UACCESS_MEMCPY if !MMU
>  	select VIRT_TO_BUS
> +	select ZONE_DMA
>  
>  config CPU_BIG_ENDIAN
>  	def_bool y
> @@ -62,10 +63,6 @@ config TIME_LOW_RES
>  config NO_IOPORT_MAP
>  	def_bool y
>  
> -config ZONE_DMA
> -	bool
> -	default y
> -
>  config HZ
>  	int
>  	default 1000 if CLEOPATRA
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 0660f47012bc..14a67a42fcae 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -43,6 +43,7 @@ config MICROBLAZE
>  	select MMU_GATHER_NO_RANGE
>  	select SPARSE_IRQ
>  	select SET_FS
> +	select ZONE_DMA
>  
>  # Endianness selection
>  choice
> @@ -60,9 +61,6 @@ config CPU_LITTLE_ENDIAN
>  
>  endchoice
>  
> -config ZONE_DMA
> -	def_bool y
> -
>  config ARCH_HAS_ILOG2_U32
>  	def_bool n
>  


Acked-by: Michal Simek <michal.simek@xilinx.com> # for MB

Michal
