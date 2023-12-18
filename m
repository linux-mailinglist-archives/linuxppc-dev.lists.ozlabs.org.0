Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90481654F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 04:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StlV23W6fz3dBK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 14:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.65.219; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 399 seconds by postgrey-1.37 at boromir; Mon, 18 Dec 2023 14:21:02 AEDT
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StlTV2cL0z2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 14:21:02 +1100 (AEDT)
X-QQ-mid: bizesmtp71t1702869266tp6lsvnj
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Dec 2023 11:14:23 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: fmY4SgAPM3slIzyLYur0WBpW/RTrgfiYkLSU8cSt6wuysWhvu08Z99fSf9eWz
	bKG73zarUNRBOQvL6DiaJOscOyuPb1ZmFcFlLiJ/teAX/q10RRN9y80nvBtinp7zWe/ZIw0
	uHwE/HtMpgiVNFP8CMi61za4iP61BhvHx4uxpEJqZMUgpk9i34RgHoqSoS1WAsLM/wsKlRi
	yBt2cACO+mLQXY+IU4QlFrCo/3aMUgSTI46C8G+UkywtDtd9chmWXn1+33zcY+5fZnI5IlB
	FZWUEwFKStcaQFspg90PzopQaRpSsFK+8/qOdcSswKgl+P6aedSms2q5g0ZQbtr28haSefF
	wXq01TOM2x4vnSowTOm8LzRXNVC3EWgcNZ+3n7WrvkFQbFcPKKlFkvrKDd5M3ROUZHG21kB
	842HVHETayS4DY/5L1kVwQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 7532627385370386625
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 1/1] powerpc/io: enable dma-contiguous API
Date: Mon, 18 Dec 2023 11:14:19 +0800
Message-ID: <F73A5182F488C472+20231218031420.2112-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

enable HAVE_DMA_CONTIGUOUS for general use of
CMA on powerpc.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig               | 1 +
 arch/powerpc/kernel/setup-common.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b968068cc04a..e21f72bcb61f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -231,6 +231,7 @@ config PPC
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
+	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 9b142b9d5187..50d09363352d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -35,6 +35,7 @@
 #include <linux/of_irq.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
+#include <linux/dma-map-ops.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/processor.h>
@@ -975,6 +976,7 @@ void __init setup_arch(char **cmdline_p)
 	 */
 	kvm_cma_reserve();
 	gigantic_hugetlb_cma_reserve();
+	dma_contiguous_reserve(0);
 
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 
-- 
2.42.0.windows.2

