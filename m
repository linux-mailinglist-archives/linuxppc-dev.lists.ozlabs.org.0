Return-Path: <linuxppc-dev+bounces-1428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A297BA21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2024 11:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7tdn6F6Jz2xjw;
	Wed, 18 Sep 2024 19:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726651773;
	cv=none; b=VAnxg0SLllsH0G2XgamQPfI0heZBk+4b2exwO0iENLL3O5A9i0kEK38f+8WtImzu6Vuw+qr10wH/Z9PF931AcfN9sIc04p4W7OTU2ifnp1a60OXYCTZNRvAJO+BNfyMZF7wq4cMuTcq26ONP7NmWNs2yVjOi/lFm76fCNqQcS4MsXPHP+XlrrxiZEaWMl94gQz9vJ9x4e68HznTb7wf7Ru6L/goXIFyaL3TwLCfzIMJssTjrfu+0fDU5RApcsBzN08lTYHt+EkzCpn0ppkp4Gk96DDJIuSad34KF9yfYGub0vV12NBnPceDaPaHGUwWzm5EhrS45tps455eiXDLqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726651773; c=relaxed/relaxed;
	bh=mp4efiAKm7BsIkDJZ0BF2p+b8PmTSzLSCNJBr6Jwddk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbJQNQaIC+2DqGez2N/xnPovLX+B6DtRT2of3yJOcujSuHVznoDcsMLsq4BZwkdf7ofCGDlydDgkZPaRd7034LWKoWuJtFY4pkVYuXeg7h28nldq1K2R8DIR/IXLvcDl/Yt5OFEs2qpBF8ATkqp/3EwYFC6vOWb37kasgfkTjQZjE6EEObnBgxI2IzF25yqDN5H2rZDfWM7WnCCwPO5GmfZwgbY0hLYe7KEUkm/nrr4ppV5ZPUEnJDFCGSxdTdy9lvFe/1WyqpvpHQuu/1VokgYsePHs2L1ark6OcTGxTVCMK0Go4BR/IwK+svqDrUpGTswZi/KI6BF4muGd9C7y9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7tdm5s7fz2xPb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:29:32 +1000 (AEST)
X-QQ-mid: bizesmtp89t1726651683t84gv24a
X-QQ-Originating-IP: 2cSalAEC57Ir0tNB+adryuEtmrRLVj/FTop5tP6gk0g=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Sep 2024 17:28:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14219157519028918696
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
Date: Wed, 18 Sep 2024 17:25:16 +0800
Message-ID: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

From: Yu Luming <luming.yu@gmail.com>

ppc always do its own tracking for batch tlb. By trivially enabling
the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
common code in rmap and reduce overhead and do optimization it could not
have without a tlb flushing context at low architecture level.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig                |  1 +
 arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/powerpc/include/asm/tlbbatch.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e94e7e4bfd40..e6db84dd014a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -175,6 +175,7 @@ config PPC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
 	select ARCH_WEAK_RELEASE_ACQUIRE
diff --git a/arch/powerpc/include/asm/tlbbatch.h b/arch/powerpc/include/asm/tlbbatch.h
new file mode 100644
index 000000000000..484628460057
--- /dev/null
+++ b/arch/powerpc/include/asm/tlbbatch.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ARCH_PPC_TLBBATCH_H
+#define _ARCH_PPC_TLBBATCH_H
+
+struct arch_tlbflush_unmap_batch {
+	/*
+         *
+	 */
+};
+
+static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+}
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+						struct mm_struct *mm,
+						unsigned long uarddr)
+{
+}
+
+static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+	/*ppc always do tlb flush in batch*/
+	return false;
+}
+
+static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
+{
+}
+#endif /* _ARCH_PPC_TLBBATCH_H */
-- 
2.42.0.windows.2


