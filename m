Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61D10C51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:43:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vQjd0n1mzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 03:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+fbe6eae7536a933b5243+5729+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ureZ2uwF"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vQf31x1KzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 03:40:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uZ/wqe1yQaxeZGmSHgVR7vRObUy2Edj17fvVA3rSkc=; b=ureZ2uwFWAv0boJbaASFTLiLqo
 cwpQuz+6cntZPZhxbNRyJ7Mfey6+lMC0cOQ/CApHG9GmvXqk+WPg6on3YzgVD41ri9YMjVOfm2i03
 +uPrhV1/Q582cgjmdhb4dwul4/3FyEsZSbf1rv3kLEqYl/kN0xxinXjUPv7L51eHVHdIGKpfEyp50
 n1LjByrsWBCg2qUfEp7G3vDJaptHINPYajPTtGrMbdCrvfGw/FQ1XETWoOpltUITAihRHmXqTrfqn
 /4cPC29fHysyTA7VIph6f97d3jXmNj/NTG9MH/uhfkouNYoJX0rvQd54xtIHUOc+quhIrksQZxGWk
 WTNSl4mA==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLtDS-0005tm-QA; Wed, 01 May 2019 17:40:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Oleg Nesterov <oleg@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/5] arm64: don't use asm-generic/ptrace.h
Date: Wed,  1 May 2019 13:39:39 -0400
Message-Id: <20190501173943.5688-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190501173943.5688-1-hch@lst.de>
References: <20190501173943.5688-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doing the indirection through macros for the regs accessors just
makes them harder to read, so implement the helpers directly.

Note that only the helpers actually used are implemented now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/ptrace.h | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index ec60174c8c18..55c1fb25cf32 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -228,11 +228,12 @@ static inline void forget_syscall(struct pt_regs *regs)
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->pstate & PSR_F_BIT))
 
-#define GET_USP(regs) \
-	(!compat_user_mode(regs) ? (regs)->sp : (regs)->compat_sp)
-
-#define SET_USP(ptregs, value) \
-	(!compat_user_mode(regs) ? ((regs)->sp = value) : ((regs)->compat_sp = value))
+static inline unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	if (compat_user_mode(regs))
+		return regs->compat_sp;
+	return regs->sp;
+}
 
 extern int regs_query_register_offset(const char *name);
 extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
@@ -309,13 +310,20 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 struct task_struct;
 int valid_user_regs(struct user_pt_regs *regs, struct task_struct *task);
 
-#define GET_IP(regs)		((unsigned long)(regs)->pc)
-#define SET_IP(regs, value)	((regs)->pc = ((u64) (value)))
-
-#define GET_FP(ptregs)		((unsigned long)(ptregs)->regs[29])
-#define SET_FP(ptregs, value)	((ptregs)->regs[29] = ((u64) (value)))
+static inline unsigned long instruction_pointer(struct pt_regs *regs)
+{
+	return regs->pc;
+}
+static inline void instruction_pointer_set(struct pt_regs *regs,
+		unsigned long val)
+{
+	regs->pc = val;
+}
 
-#include <asm-generic/ptrace.h>
+static inline unsigned long frame_pointer(struct pt_regs *regs)
+{
+	return regs->regs[29];
+}
 
 #define procedure_link_pointer(regs)	((regs)->regs[30])
 
@@ -325,7 +333,6 @@ static inline void procedure_link_pointer_set(struct pt_regs *regs,
 	procedure_link_pointer(regs) = val;
 }
 
-#undef profile_pc
 extern unsigned long profile_pc(struct pt_regs *regs);
 
 #endif /* __ASSEMBLY__ */
-- 
2.20.1

