Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF42F8217
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:22:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSgM6pPdzDsgf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ej+F/ta0; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyw26gfzDsj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:20 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id i7so6355960pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7BR0zvwJO7bVat/aEvyQpEj7sPpuAlkQ/ruo5bglt8=;
 b=ej+F/ta0prNpjzFLSu7qSL/h6gTpZBFwlxURHO4OslrQklm63pgFZOemINFKpKNk1M
 zpOa4gqc7JwOkSOJBktQygF62U0hXfQ1xhQakLKmLIyCL2RFsL6HdOpWr9QpXB+9UOHA
 W+mt3UPyHLKeY+jmJoNIrz3/oSoABtD/SKhsFHCTh3VXaf86gazvT7ENlChj//Tg+ANS
 zLXyHMOMWaIlHeNBWpqeXJIPkNWsLsrgoz/S/nhcWrLoUUtWGd8LvP9xrJkeIBN4ycPK
 cS9PN02VmqZTVWWW/Eb1LN61r3DsyChl4QOPTmVUZnxOYRcm1nfgU5sEKIw8aeOlUp8L
 fbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7BR0zvwJO7bVat/aEvyQpEj7sPpuAlkQ/ruo5bglt8=;
 b=pRv09LwVy3R4L/qVcHx5w1egEerWB0JXLp2aodIcjfRcoolOhMstE3abESxWTe5Un3
 GFunMpMo6x6hzHuqKGFl8gIRmrhcBzOGDgdlwKmvRMvp9h6U+0KDDdoe6lavHL5r+iR6
 vycGipu9X/1kcNK3XD75kk20tDl0JQOY34H2G4WyPOoJm1G3uznAPv+Z3/F/tu7ElXxF
 H2VRQ/EhgiFpernReCxaMjbZ8b9mm79IHiM3Ej5b/+eiJEiFGpu9rUno8Exn7G6eKqXE
 r43ya7oh/cv5bXQoLz2AtQwLUy/I6rt6q7qFEvRn+xmyTMExh/Ns0xdUx5Y6hp5qgo68
 C5Jg==
X-Gm-Message-State: AOAM530Cuygr5wfKQhgasheMH/llIjJFTzRyy/WMv6KRQ05ri48YtC9q
 MRot/p0tAfpPRtHhDLvz+YGuyX3PPpQ=
X-Google-Smtp-Source: ABdhPJx+mei07kqJRx1eij2Bix4mP0cDs972d9bqxPzG/X7rK+U7u/x9USQBf03qVpNxaw18Uj0Hdw==
X-Received: by 2002:aa7:954b:0:b029:19e:cb57:f3c with SMTP id
 w11-20020aa7954b0000b029019ecb570f3cmr13529394pfq.51.1610729473750; 
 Fri, 15 Jan 2021 08:51:13 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 12/39] powerpc/64s: slb comment update
Date: Sat, 16 Jan 2021 02:49:45 +1000
Message-Id: <20210115165012.1260253-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

This makes a small improvement to the description of the SLB interrupt
environment. Move the memory access restrictions into one paragraph,
and the interrupt restrictions into the next rather than mix them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/slb.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c581548b533f..14c62b685f0c 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -825,19 +825,21 @@ long do_slb_fault(struct pt_regs *regs)
 		return -EINVAL;
 
 	/*
-	 * SLB kernel faults must be very careful not to touch anything
-	 * that is not bolted. E.g., PACA and global variables are okay,
-	 * mm->context stuff is not.
-	 *
-	 * SLB user faults can access all of kernel memory, but must be
-	 * careful not to touch things like IRQ state because it is not
-	 * "reconciled" here. The difficulty is that we must use
-	 * fast_exception_return to return from kernel SLB faults without
-	 * looking at possible non-bolted memory. We could test user vs
-	 * kernel faults in the interrupt handler asm and do a full fault,
-	 * reconcile, ret_from_except for user faults which would make them
-	 * first class kernel code. But for performance it's probably nicer
-	 * if they go via fast_exception_return too.
+	 * SLB kernel faults must be very careful not to touch anything that is
+	 * not bolted. E.g., PACA and global variables are okay, mm->context
+	 * stuff is not. SLB user faults may access all of memory (and induce
+	 * one recursive SLB kernel fault), so the kernel fault must not
+	 * trample on the user fault state at those points.
+	 */
+
+	/*
+	 * The interrupt state is not reconciled, for performance, so that
+	 * fast_interrupt_return can be used. The handler must not touch local
+	 * irq state, or schedule. We could test for usermode and upgrade to a
+	 * normal process context (synchronous) interrupt for those, which
+	 * would make them first-class kernel code and able to be traced and
+	 * instrumented, although performance would suffer a bit, it would
+	 * probably be a good tradeoff.
 	 */
 	if (id >= LINEAR_MAP_REGION_ID) {
 		long err;
-- 
2.23.0

