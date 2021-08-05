Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C23E1C30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 21:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgdWH6Nvsz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 05:11:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm1 header.b=GtL12Amd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lkUCbjUl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm1 header.b=GtL12Amd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=lkUCbjUl; 
 dkim-atps=neutral
X-Greylist: delayed 423 seconds by postgrey-1.36 at boromir;
 Fri, 06 Aug 2021 05:10:54 AEST
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgdVk6Dhmz30hc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 05:10:54 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3BAC5810B2;
 Thu,  5 Aug 2021 15:03:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 05 Aug 2021 15:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm1; bh=zNZUoCQxGeezK
 ynu9SXf7RK1yXXzs9UrsyBqx4F2Edk=; b=GtL12AmdeZNPHF6SApyO9wGXfEnlg
 wNhltluDSQzlmgtvgRRPULzc7FzojizjIvGqjq9l0WTHC8gjjwH0OPxXbGnrnUPm
 hDSMlGCd6ITo+xRpprv6J4fpF05Dz4iPpq0Q6YTMZ43f9noXHFhoA2ryB+1rwXso
 0xje1RyI2eOjiHlPqHk7sE8QpdSibrVzoNaw67a4doWQGdf2ABU4s86r8dg5LwQ8
 me86nda6dU5U9VRMEKgR+dFIaxddHn/vkrx5nqQt5s5YvdWVYAaeSBtnQyqaokgp
 5PjIXA1zjsCvdR3wQlwKJSjLLc4/gwwwSlV50rFq1ZqkR4cvvw3fC8rqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zNZUoCQxGeezKynu9SXf7RK1yXXzs9UrsyBqx4F2Edk=; b=lkUCbjUl
 PEdQRBtf816Ypmmn3nhNv7Sizw4AzYBiGnl0V9d227YL3157XWzt7AL5QCqGN7cL
 yqPnZEkLdbcz85N8RdldMN71v2KmRxsPUl7vsMVtamEYXDOPG3U6BvE+pr7+Yru4
 /FVQdwNbo4Ycp97k//hOBnZ2yca1DgKkAyOxemQjJQPVSeOqcrlkx7j0BGJaFUyS
 CWPBdaRML51ZDoxDH0rHuU7w62PfIe1ROCUo1cvMbBryWkG7nPr36V8nKMhl2XkD
 x4NfRrv0ZBtrGiGrKGOyx1ZKcrBy0Yhjm8JPiSOmYop6IZ1wOMqP+pqW7m9ryknq
 SMva7CVAvywnQA==
X-ME-Sender: <xms:EDYMYY-DL8P2bcvnLICbJUDwJSM9knPLJLgObnvHJpPeONvY18Y8zA>
 <xme:EDYMYQuaN103Gqpz6IVwl1J1TfPrOWCIdVik9xAJA4Ej6bJdqSxpwSdpWtrORcNJP
 zY1qpKdp_dodr_qwg>
X-ME-Received: <xmr:EDYMYeDQlih2rLrqdgd6jlVePFzv5Z5MhViPFAcjOwbSFYpGFZTVca5ZEJTqPcCHSvsAykOj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:EDYMYYebQ9uZTltrKTkpcJXLtFJiugbJgfdenr91RlXIpn-tUs0VXA>
 <xmx:EDYMYdNGPMj1jZn3czxOZ1YHev0_hyrR_EzZOrQpHCpjsp3MQtYpDg>
 <xmx:EDYMYSlWti7zMr_aZl-0ZjSHN1IURtnEK9-wZbzw1PspP32v-Um2OQ>
 <xmx:EjYMYVbHX95gn2qpP7YVlS5-XylZg9XCV-qdmTswerMFWoEkCpgRVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 15:03:43 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 02/15] arch: mm: rename FORCE_MAX_ZONEORDER to
 ARCH_FORCE_MAX_ORDER
Date: Thu,  5 Aug 2021 15:02:40 -0400
Message-Id: <20210805190253.2795604-3-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805190253.2795604-1-zi.yan@sent.com>
References: <20210805190253.2795604-1-zi.yan@sent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Michal Hocko <mhocko@kernel.org>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 sparclinux@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Matthew Wilcox <willy@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Vlastimil Babka <vbabka@suse.cz>,
 Zi Yan <ziy@nvidia.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

This Kconfig option is used by individual arch to set its desired
MAX_ORDER. Rename it to reflect its actual use.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Chris Zankel <chris@zankel.net>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-oxnas@groups.io
Cc: linux-csky@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arc/Kconfig                             | 2 +-
 arch/arm/Kconfig                             | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
 arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
 arch/arm/configs/oxnas_v6_defconfig          | 2 +-
 arch/arm/configs/sama7_defconfig             | 2 +-
 arch/arm64/Kconfig                           | 2 +-
 arch/csky/Kconfig                            | 2 +-
 arch/ia64/Kconfig                            | 2 +-
 arch/ia64/include/asm/sparsemem.h            | 6 +++---
 arch/m68k/Kconfig.cpu                        | 2 +-
 arch/mips/Kconfig                            | 2 +-
 arch/nios2/Kconfig                           | 2 +-
 arch/powerpc/Kconfig                         | 2 +-
 arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
 arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
 arch/sh/configs/ecovec24_defconfig           | 2 +-
 arch/sh/mm/Kconfig                           | 2 +-
 arch/sparc/Kconfig                           | 2 +-
 arch/xtensa/Kconfig                          | 2 +-
 include/linux/mmzone.h                       | 4 ++--
 21 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index b5bf68e74732..923ea4c31e59 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -583,7 +583,7 @@ config ARC_BUILTIN_DTB_NAME
=20
 endmenu	 # "ARC Architecture Configuration"
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if ARC_HUGEPAGE_16M
 	default "11"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2fb7012c3246..286854318fe5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1523,7 +1523,7 @@ config ARM_MODULE_PLTS
 	  Disabling this is usually safe for small single-platform
 	  configurations. If unsure, say y.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "12" if SOC_AM33XX
 	default "9" if SA1111
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6=
_v7_defconfig
index 079fcd8d1d11..802310d3ebf5 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -34,7 +34,7 @@ CONFIG_PCI_IMX6=3Dy
 CONFIG_SMP=3Dy
 CONFIG_ARM_PSCI=3Dy
 CONFIG_HIGHMEM=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D14
+CONFIG_ARCH_FORCE_MAX_ORDER=3D14
 CONFIG_CMDLINE=3D"noinitrd console=3Dttymxc0,115200"
 CONFIG_KEXEC=3Dy
 CONFIG_CPU_FREQ=3Dy
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/mi=
lbeaut_m10v_defconfig
index 7c07f9893a0f..06967243f74d 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -26,7 +26,7 @@ CONFIG_THUMB2_KERNEL=3Dy
 # CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11 is not set
 # CONFIG_ARM_PATCH_IDIV is not set
 CONFIG_HIGHMEM=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D12
+CONFIG_ARCH_FORCE_MAX_ORDER=3D12
 CONFIG_SECCOMP=3Dy
 CONFIG_KEXEC=3Dy
 CONFIG_EFI=3Dy
diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v=
6_defconfig
index cae0db6b4eaf..df8462272446 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -17,7 +17,7 @@ CONFIG_MACH_OX820=3Dy
 CONFIG_SMP=3Dy
 CONFIG_NR_CPUS=3D16
 CONFIG_CMA=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D12
+CONFIG_ARCH_FORCE_MAX_ORDER=3D12
 CONFIG_SECCOMP=3Dy
 CONFIG_ARM_APPENDED_DTB=3Dy
 CONFIG_ARM_ATAG_DTB_COMPAT=3Dy
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defc=
onfig
index 938aae4bd80b..f8683b87cb27 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -22,7 +22,7 @@ CONFIG_ATMEL_CLOCKSOURCE_TCB=3Dy
 # CONFIG_CACHE_L2X0 is not set
 # CONFIG_ARM_PATCH_IDIV is not set
 # CONFIG_CPU_SW_DOMAIN_PAN is not set
-CONFIG_FORCE_MAX_ZONEORDER=3D15
+CONFIG_ARCH_FORCE_MAX_ORDER=3D15
 CONFIG_UACCESS_WITH_MEMCPY=3Dy
 # CONFIG_ATAGS is not set
 CONFIG_CMDLINE=3D"console=3DttyS0,115200 earlyprintk ignore_loglevel"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5b13a932561..972d81f6bb2c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1152,7 +1152,7 @@ config XEN
 	help
 	  Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int
 	default "14" if ARM64_64K_PAGES
 	default "12" if ARM64_16K_PAGES
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 2716f6395ba7..0fd2333226b7 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -307,7 +307,7 @@ config HIGHMEM
 	select KMAP_LOCAL
 	default y
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
=20
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 4993c7ac7ff6..d1bd010ee7a5 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -200,7 +200,7 @@ config IA64_CYCLONE
 	  Say Y here to enable support for IBM EXA Cyclone time source.
 	  If you're unsure, answer N.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "MAX_ORDER (11 - 17)"  if !HUGETLB_PAGE
 	range 11 17  if !HUGETLB_PAGE
 	default "17" if HUGETLB_PAGE
diff --git a/arch/ia64/include/asm/sparsemem.h b/arch/ia64/include/asm/spar=
semem.h
index 42ed5248fae9..84e8ce387b69 100644
--- a/arch/ia64/include/asm/sparsemem.h
+++ b/arch/ia64/include/asm/sparsemem.h
@@ -11,10 +11,10 @@
=20
 #define SECTION_SIZE_BITS	(30)
 #define MAX_PHYSMEM_BITS	(50)
-#ifdef CONFIG_FORCE_MAX_ZONEORDER
-#if ((CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
+#ifdef CONFIG_ARCH_FORCE_MAX_ORDER
+#if ((CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
 #undef SECTION_SIZE_BITS
-#define SECTION_SIZE_BITS (CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT)
+#define SECTION_SIZE_BITS (CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT)
 #endif
 #endif
=20
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 29e946394fdb..c39157f3dd87 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -408,7 +408,7 @@ config SINGLE_MEMORY_CHUNK
 	  order" to save memory that could be wasted for unused memory map.
 	  Say N if not sure.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order" if ADVANCED
 	depends on !SINGLE_MEMORY_CHUNK
 	default "11"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6dfb27d531dd..0998f671ed7e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2284,7 +2284,7 @@ config PAGE_SIZE_64KB
=20
 endchoice
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 14 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
 	default "14" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index c24955c81c92..e5c300198e1f 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -50,7 +50,7 @@ menu "Kernel features"
=20
 source "kernel/Kconfig.hz"
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 9 20
 	default "11"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2e213ec6ec05..5edb48b363c4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -810,7 +810,7 @@ config DATA_SHIFT
 	  in that case. If PIN_TLB is selected, it must be aligned to 8M as
 	  8M pages will be pinned.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 8 9 if PPC64 && PPC_64K_PAGES
 	default "9" if PPC64 && PPC_64K_PAGES
diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/co=
nfigs/85xx/ge_imp3a_defconfig
index f29c166998af..e7672c186325 100644
--- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
+++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
@@ -30,7 +30,7 @@ CONFIG_PREEMPT=3Dy
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=3Dm
 CONFIG_MATH_EMULATION=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D17
+CONFIG_ARCH_FORCE_MAX_ORDER=3D17
 CONFIG_PCI=3Dy
 CONFIG_PCIEPORTBUS=3Dy
 CONFIG_PCI_MSI=3Dy
diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/confi=
gs/fsl-emb-nonhw.config
index df37efed0aec..521e7a530888 100644
--- a/arch/powerpc/configs/fsl-emb-nonhw.config
+++ b/arch/powerpc/configs/fsl-emb-nonhw.config
@@ -41,7 +41,7 @@ CONFIG_FIXED_PHY=3Dy
 CONFIG_FONT_8x16=3Dy
 CONFIG_FONT_8x8=3Dy
 CONFIG_FONTS=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D13
+CONFIG_ARCH_FORCE_MAX_ORDER=3D13
 CONFIG_FRAMEBUFFER_CONSOLE=3Dy
 CONFIG_FRAME_WARN=3D1024
 CONFIG_FTL=3Dy
diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_=
defconfig
index 03cb916819fa..4c09ca308d43 100644
--- a/arch/sh/configs/ecovec24_defconfig
+++ b/arch/sh/configs/ecovec24_defconfig
@@ -8,7 +8,7 @@ CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7724=3Dy
-CONFIG_FORCE_MAX_ZONEORDER=3D12
+CONFIG_ARCH_FORCE_MAX_ORDER=3D12
 CONFIG_MEMORY_SIZE=3D0x10000000
 CONFIG_FLATMEM_MANUAL=3Dy
 CONFIG_SH_ECOVEC=3Dy
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index ba569cfb4368..411fdc0901f7 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -18,7 +18,7 @@ config PAGE_OFFSET
 	default "0x80000000" if MMU
 	default "0x00000000"
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	range 9 64 if PAGE_SIZE_16KB
 	default "9" if PAGE_SIZE_16KB
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index f0c0f955e169..2206c99612ed 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -273,7 +273,7 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y if SPARC64
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "13"
 	help
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index b843902ad9fd..90784aa68cf8 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -709,7 +709,7 @@ config HIGHMEM
=20
 	  If unsure, say Y.
=20
-config FORCE_MAX_ZONEORDER
+config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "11"
 	help
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c1d914a72489..98e3297b9e09 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -24,10 +24,10 @@
 #include <asm/page.h>
=20
 /* Free memory management - zoned buddy allocator.  */
-#ifndef CONFIG_FORCE_MAX_ZONEORDER
+#ifndef CONFIG_ARCH_FORCE_MAX_ORDER
 #define MAX_ORDER 11
 #else
-#define MAX_ORDER CONFIG_FORCE_MAX_ZONEORDER
+#define MAX_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
 #endif
 #define MAX_ORDER_NR_PAGES (1 << (MAX_ORDER - 1))
=20
--=20
2.30.2

