Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8FB95694
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 07:15:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CJrs4RwvzDr84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sA6LM1RP"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CJmT4K0SzDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 15:11:21 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id o70so2625387pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSz5k22Am9f6u1StSDfgyCgD3C1sU0I0HbQnoZCsjpI=;
 b=sA6LM1RPUEmRgHrMipytONhljD3V535gz+sPA6CMuZ4g3B0PYtA8F7T9ZB1FP2/26E
 6tZ4TsY4HxVUpoyndr0JA5yRssJcJen5ydBNyJDGGqbBGca6Lv9OX5BgOpA8iYb5ZvtH
 qNt769LhnFXQ0Z/sWWq2U6h6Jitwp9YLsqupEzxBLHQcJqb2GlWWlch8ypcx/SRAylU0
 fRNEiORav5KfXPcv87BysrNnqIpTaDo5yUcpep47ytzAx+sFd/6S2/V1eMKwFTgDnNK+
 q3T8sv2mlkbjaPrsELfmWvsVOUbiE1sUcqf1p+RiWGEl408gRQRhBBqyQQTptnwv1c7f
 9rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSz5k22Am9f6u1StSDfgyCgD3C1sU0I0HbQnoZCsjpI=;
 b=P+BCU+Kxwqc5JJwb8kDnBUF2PullsFwWy1PbtiXNKb4/mEOeBuVsisVXEDEFw22FC9
 B+ldZY11ba+PIuwkGjiOvxDZvsC9z8iDfshDfjC0EA0POUfXacAnw6ryYPLciFOkD7kB
 vW9GhrVZ6u1l2++CmCdcQP1GW/hsRKEP3uu2hTB4WsvyQC+tXmcHjUNxf4MBNikfuBEX
 hCLXr6nNzL89pnig89l027e0e1/dmGWQs2ZKThmDmtKvzdnWY2cbi1zANnS1i4rjoqCP
 +RAlhXGfFP9kR52g7/Dx1VB+dI8UpirTKj63OK/qycPTrTQlcwLjBfM8CMrpzaP+G+il
 2FBw==
X-Gm-Message-State: APjAAAVUQppatki//PzOk1VYD61fx9Fm7hDXwDqoNRYYIoIdDgXoN9qd
 2OeaPDCYVAaQCzXxcYDO5z8BzfVx
X-Google-Smtp-Source: APXvYqzr7pqfSmhz88sNqd4d8jWQRg8QuYnlXaR2Rdz/ROtXlyHBUIaKD93eOlSd+N4FyjSnuJzBVA==
X-Received: by 2002:aa7:8814:: with SMTP id c20mr27666462pfo.87.1566277878692; 
 Mon, 19 Aug 2019 22:11:18 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id ck8sm14814576pjb.25.2019.08.19.22.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 22:11:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: interrupt entry use isel to prevent
 untrusted speculative r1 values used by the kernel
Date: Tue, 20 Aug 2019 15:11:06 +1000
Message-Id: <20190820051106.15744-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820051106.15744-1-npiggin@gmail.com>
References: <20190820051106.15744-1-npiggin@gmail.com>
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

Interrupts may come from user or kernel, so the stack pointer needs to
be set to either the base of the kernel stack, or a new frame on the
existing kernel stack pointer, respectively.

Using a branch for this can lead to r1-indexed memory operations being
speculatively executed using a value of r1 controlled by userspace.
This is the first step to possible speculative execution vulnerability.

This does not appear to be a problem on its own, because loads from the
stack with this rogue address should only come from memory the kernel
previously stored to during the same speculative path, so they should
always be satisfied by the store buffers rather than exposing the
underlying memory contents.

There are some obscure cases where an r1-indexed load may be used in
other ways (e.g., stack unwinding), however they are rare and difficult
to control, and they still need to contain a sequence that subsequently
changes microarchitectural state based on the result of such a rogue
load, in a way that can be observed.

However it's safer to just close the concern at the first step, by
preventing untrusted speculative r1 value leaking into the kernel. Do
this by using isel to select the r1 value rather than a branch. isel
output is not predicted on POWER CPUs which support the instruction,
although this is not architecture.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 768f133de4f1..8282c01db83e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -393,15 +393,29 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
  * SRR1, and relocation is on.
+ *
+ * Using isel to select the r1 kernel stack depending on MSR_PR prevents
+ * speculative execution of memory ops with untrusted addresses (r1 from
+ * userspace) as a hardening measure, although there is no known vulnerability
+ * using a branch here instead. isel will not do value speculation on any POWER
+ * processor that implements it, although this is not currently documented.
  */
 #define EXCEPTION_COMMON(area, trap)					   \
 	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
 	mr	r10,r1;			/* Save r1			*/ \
+BEGIN_FTR_SECTION							   \
+	ld	r1,PACAKSAVE(r13);	/* base stack if from user	*/ \
+	addi	r1,r1,INT_FRAME_SIZE;	/* adjust for subi		*/ \
+	iseleq	r1,r10,r1;		/* original r1 if from kernel 	*/ \
+	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
+FTR_SECTION_ELSE							   \
 	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
 	beq-	1f;							   \
 	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;				   \
+1:									   \
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_207S)				   \
+2:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
+	EMIT_BUG_ENTRY 2b,__FILE__,__LINE__,0;				   \
 3:	EXCEPTION_PROLOG_COMMON_1();					   \
 	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
 	beq	4f;			/* if from kernel mode		*/ \
-- 
2.22.0

