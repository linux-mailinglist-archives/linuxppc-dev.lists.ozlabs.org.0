Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 472047F6B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:21:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460R8h4dHtzDqxt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:21:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B4V8LjQ/"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNK3HdjzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:04 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f5so27077948pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mogfE0VLDYlunhvdXFwvMD3xvra3O8btWA/7cNbOVAU=;
 b=B4V8LjQ/9G5/sixecbHiXf4bO6dIHQq9V2JmZybt0zrVt/P8RMT+BBmN7Fted4M2Xb
 +kVaPzdiAc/7iSoPnU4FtWZ5cPo+6UEAf7Ya2uNe2KY2Nm6NHc4jLSgo1Of4+bb0C1xF
 kFesgBF+vKeKdqJ6vpyAW2686Lmxj+OK2ozZqQk8L0I2VDG7fxvbljz3gF5qXci7buTG
 zbI8jTom8RIKn9rBDu/WQYFCzFSxYclAZMiYWfAL5eX6j5oIGTWLkfbhS9Go417qkZ2C
 g6S+vSbvdoMIUKAsjB+t+Akwjdcc5bu24y4/C37Yu3g1gxdebZdbnaWbgfs7m7co6LlH
 DDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mogfE0VLDYlunhvdXFwvMD3xvra3O8btWA/7cNbOVAU=;
 b=G3QpkAUd07LkBxH/kuYKxfAwo/LJys47Y/+bLBDWq/gglRfSIflGDL0SZBNeMf/4Wu
 yTxIc2olEhYia3GC0Q6NprsHC0Ya8/VSaQQWf0txd8NR4Zdk1Jr/wP3fShRvVEM4KnUB
 63Hp6EcKLU70S3ZClkzWo4QtI5dxu4J2M0SiaoIF8X5ew8rrEyNBBUOC+GezNRey7PWS
 66UMVstlm1RD54ndJ3YXqjv7ZUOX5FkWDSxsypew0kc9AbekFlEY+Ko13C/s9pEM8INo
 a7hqAVKc5Wef8JNPaTJ9MaRcUKF3PUEUC1t98VS2Z+oPba53RP7lw37efZCBasGte+9v
 OtYQ==
X-Gm-Message-State: APjAAAUuTvj6ycU/BN5DYFgnZtTuEWShqSXwQmtXiW5kfJf/HIekVwXG
 pD+IFO7pufyXHYWCiQWaO7Cs2CTKWQk=
X-Google-Smtp-Source: APXvYqwW63wybTsJEv2lstxx3IBWjo7l0vkow6dybeETo3y6gK2liCtlNxlIaEwzla/s6Nbwq/itMg==
X-Received: by 2002:a63:2bd2:: with SMTP id
 r201mr121702072pgr.193.1564743660194; 
 Fri, 02 Aug 2019 04:01:00 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 34/44] powerpc/64s/exception: program check handler do not
 branch into a macro
Date: Fri,  2 Aug 2019 20:56:59 +1000
Message-Id: <20190802105709.27696-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is clever, but the small code saving is not worth the spaghetti of
jumping to a label in an expanded macro, particularly when the label
is just a number rather than a descriptive name.

So expand the INT_COMMON macro twice, once for the stack and no stack
cases, and branch to those. The slight code size increase is worth
the improved clarity of branches for this non-performance critical
code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5532923a9aac..3ebb39a4b9fa 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -533,11 +533,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
-	beq-	1f
+	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
-1:	tdgei	r1,-INT_FRAME_SIZE	/* trap if r1 is in userspace	*/
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0
-3:
+100:	tdgei	r1,-INT_FRAME_SIZE	/* trap if r1 is in userspace	*/
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,0
 	.endif
 
 	std	r9,_CCR(r1)		/* save CR in stackframe	*/
@@ -551,10 +550,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.if \kaup
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
-	beq	4f			/* if from kernel mode		*/
+	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
 	SAVE_PPR(\area, r9)
-4:
+101:
 	.else
 	.if \kaup
 	kuap_save_amr_and_lock r9, r10, cr1
@@ -1325,9 +1324,11 @@ EXC_COMMON_BEGIN(program_check_common)
 	mr	r10,r1			/* Save r1			*/
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-	b 3f				/* Jump into the macro !!	*/
+	INT_COMMON 0x700, PACA_EXGEN, 0, 1, 1, 0, 0
+	b 3f
 2:
 	INT_COMMON 0x700, PACA_EXGEN, 1, 1, 1, 0, 0
+3:
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-- 
2.22.0

