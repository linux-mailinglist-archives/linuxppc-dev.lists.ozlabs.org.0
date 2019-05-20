Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85522BDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:08:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456pNW67Z7zDqKt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:08:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+dfc7240828d5493a4f00+5748+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="tWllbJkM"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pDh5HnhzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:01:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ngUiwEDQptjC481jfdI3glduioMsRJldRZETJeFfRw8=; b=tWllbJkM0+gq/92RkxJXus5kXz
 QBnmf6zrANZ+wzjcxXpRuU6gO6nZk+96nOSFMFSwetj5SRvYCtkf0u5vjaKfuGCI4jqiyJePzpzic
 tdJuke4XxfyG+HKakDB+7bCKV0dqLZOONFeOUNGnudYJmjR6xGaXiQt7jwZd/a/ROkVaeXMrFtKMx
 HWP5BgtEyfy8J9kdrL1QB6L0QKQW0NS4z3KVckU5YR/6fFufanf1B0cc3AkDPWhWD16xBEco6syGX
 3//SUCrGccT/oqtjkGINSg+o9fx8tXw3PkWZALAdes/Ikb3QvA8WmHmk4G5SU7IDAvq5pvdc7eHgu
 0ouF+ouA==;
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSbMM-0001Z4-Fi; Mon, 20 May 2019 06:01:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Oleg Nesterov <oleg@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/5] sh: don't use asm-generic/ptrace.h
Date: Mon, 20 May 2019 08:00:16 +0200
Message-Id: <20190520060018.25569-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520060018.25569-1-hch@lst.de>
References: <20190520060018.25569-1-hch@lst.de>
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
 arch/sh/include/asm/ptrace.h | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/ptrace.h b/arch/sh/include/asm/ptrace.h
index 9143c7babcbe..6c89e3e04cee 100644
--- a/arch/sh/include/asm/ptrace.h
+++ b/arch/sh/include/asm/ptrace.h
@@ -16,8 +16,31 @@
 #define user_mode(regs)			(((regs)->sr & 0x40000000)==0)
 #define kernel_stack_pointer(_regs)	((unsigned long)(_regs)->regs[15])
 
-#define GET_FP(regs)	((regs)->regs[14])
-#define GET_USP(regs)	((regs)->regs[15])
+static inline unsigned long instruction_pointer(struct pt_regs *regs)
+{
+	return regs->pc;
+}
+static inline void instruction_pointer_set(struct pt_regs *regs,
+		unsigned long val)
+{
+	regs->pc = val;
+}
+
+static inline unsigned long frame_pointer(struct pt_regs *regs)
+{
+	return regs->regs[14];
+}
+
+static inline unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	return regs->regs[15];
+}
+
+static inline void user_stack_pointer_set(struct pt_regs *regs,
+		unsigned long val)
+{
+	regs->regs[15] = val;
+}
 
 #define arch_has_single_step()	(1)
 
@@ -112,7 +135,5 @@ static inline unsigned long profile_pc(struct pt_regs *regs)
 
 	return pc;
 }
-#define profile_pc profile_pc
 
-#include <asm-generic/ptrace.h>
 #endif /* __ASM_SH_PTRACE_H */
-- 
2.20.1

