Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404616CD2EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 09:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmdNQ1GZJz3fJK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:24:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lq5QhhYs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmdMZ66f9z3cML
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 18:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lq5QhhYs;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmdMZ55VWz4xDq;
	Wed, 29 Mar 2023 18:23:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680074634;
	bh=9Nt7fztvECqyTexwQ+AMG8AVeisSA2rv6ZuT58fiykA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Lq5QhhYsmRfSte4eg8Gf/5iNAuMwG36qeKzSA0eYnW46jdi5bu+kKJH7xOF5uXovw
	 3eimplNJw9ZoNUJlZfoouQh6x6lh9iRbJGf74svOanLRBgC3fiS8NFT5TWan7znV0A
	 iWUQweoy4WS22HyvdcZUeLmRMXYdTQcpox17jhjNKXYYZaTykM+stk+jLxAJrav5FU
	 +DZl9NqrW9dlRI8uAxW+IaU1sTIlZ/7CTNKpX0vT+kHbI/+6m6d3JrisTvTcSQjBdW
	 /dFD7jnf85CRalxSeR9WZpNc8yPskqpXJilLvB7yYxZZlre34OGQSTo1RBuWIIr8sd
	 M3BDNUPzCEWDA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/Makefile: Add generated defconfigs to help output
Date: Wed, 29 Mar 2023 18:23:34 +1100
Message-Id: <20230329072334.2023357-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329072334.2023357-1-mpe@ellerman.id.au>
References: <20230329072334.2023357-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently none of the generated defconfigs appear in the help output,
because the help text discovers defconfigs by looking for actual files
named "*_defconfig".

Collect the generated defconfig names into a variable and then print
those out in archhelp.

Output looks like eg:

  pseries_le_defconfig        - Build for pseries_le
  ppc64le_defconfig           - Build for ppc64le
  ppc64le_guest_defconfig     - Build for ppc64le_guest
  ...
  ppc64_randconfig            - Build for ppc64_randconfig

  adder875_defconfig          - Build for adder875
  amigaone_defconfig          - Build for amigaone

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index b9bfa9ac3f06..0a99aa425326 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -264,90 +264,92 @@ define merge_into_defconfig
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
 
-PHONY += pseries_le_defconfig
+generated_configs += pseries_le_defconfig
 pseries_le_defconfig:
 	$(call merge_into_defconfig,pseries_defconfig,le)
 
-PHONY += ppc64le_defconfig
+generated_configs += ppc64le_defconfig
 ppc64le_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,le)
 
-PHONY += ppc64le_guest_defconfig
+generated_configs += ppc64le_guest_defconfig
 ppc64le_guest_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,le guest)
 
-PHONY += ppc64_guest_defconfig
+generated_configs += ppc64_guest_defconfig
 ppc64_guest_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,be guest)
 
-PHONY += powernv_be_defconfig
+generated_configs += powernv_be_defconfig
 powernv_be_defconfig:
 	$(call merge_into_defconfig,powernv_defconfig,be)
 
-PHONY += mpc85xx_defconfig
+generated_configs += mpc85xx_defconfig
 mpc85xx_defconfig:
 	$(call merge_into_defconfig,mpc85xx_base.config,\
 		85xx-32bit 85xx-hw fsl-emb-nonhw)
 
-PHONY += mpc85xx_smp_defconfig
+generated_configs += mpc85xx_smp_defconfig
 mpc85xx_smp_defconfig:
 	$(call merge_into_defconfig,mpc85xx_base.config,\
 		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
 
-PHONY += corenet32_smp_defconfig
+generated_configs += corenet32_smp_defconfig
 corenet32_smp_defconfig:
 	$(call merge_into_defconfig,corenet_base.config,\
 		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw dpaa)
 
-PHONY += corenet64_smp_defconfig
+generated_configs += corenet64_smp_defconfig
 corenet64_smp_defconfig:
 	$(call merge_into_defconfig,corenet_base.config,\
 		85xx-64bit 85xx-smp altivec 85xx-hw fsl-emb-nonhw dpaa)
 
-PHONY += mpc86xx_defconfig
+generated_configs += mpc86xx_defconfig
 mpc86xx_defconfig:
 	$(call merge_into_defconfig,mpc86xx_base.config,\
 		86xx-hw fsl-emb-nonhw)
 
-PHONY += mpc86xx_smp_defconfig
+generated_configs += mpc86xx_smp_defconfig
 mpc86xx_smp_defconfig:
 	$(call merge_into_defconfig,mpc86xx_base.config,\
 		86xx-smp 86xx-hw fsl-emb-nonhw)
 
-PHONY += ppc32_allmodconfig
+generated_configs += ppc32_allmodconfig
 ppc32_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/book3s_32.config \
 		-f $(srctree)/Makefile allmodconfig
 
-PHONY += ppc_defconfig
+generated_configs += ppc_defconfig
 ppc_defconfig:
 	$(call merge_into_defconfig,book3s_32.config,)
 
-PHONY += ppc64le_allmodconfig
+generated_configs += ppc64le_allmodconfig
 ppc64le_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/le.config \
 		-f $(srctree)/Makefile allmodconfig
 
-PHONY += ppc64le_allnoconfig
+generated_configs += ppc64le_allnoconfig
 ppc64le_allnoconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/ppc64le.config \
 		-f $(srctree)/Makefile allnoconfig
 
-PHONY += ppc64_book3e_allmodconfig
+generated_configs += ppc64_book3e_allmodconfig
 ppc64_book3e_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-64bit.config \
 		-f $(srctree)/Makefile allmodconfig
 
-PHONY += ppc32_randconfig
+generated_configs += ppc32_randconfig
 ppc32_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/32-bit.config \
 		-f $(srctree)/Makefile randconfig
 
-PHONY += ppc64_randconfig
+generated_configs += ppc64_randconfig
 ppc64_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
 		-f $(srctree)/Makefile randconfig
 
+PHONY := $(generated_configs)
+
 define archhelp
   echo '* zImage          - Build default images selected by kernel config'
   echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
@@ -368,6 +370,9 @@ define archhelp
   echo '  support passing a device tree directly.  Replace <dt> with the'
   echo '  name of a dts file from the arch/$(ARCH)/boot/dts/ directory'
   echo '  (minus the .dts extension).'
+  echo 
+  $(foreach cfg,$(generated_configs),
+    printf "  %-27s - Build for %s\\n" $(cfg) $(subst _defconfig,,$(cfg));)
 endef
 
 PHONY += install
-- 
2.39.2

