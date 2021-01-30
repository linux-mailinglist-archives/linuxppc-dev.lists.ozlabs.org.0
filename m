Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 007803095AA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:01:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbTn1gh0zDrSg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:01:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rHEn3O09; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLh5CLFzDrVP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:04 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id o20so8040292pfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7BR0zvwJO7bVat/aEvyQpEj7sPpuAlkQ/ruo5bglt8=;
 b=rHEn3O09MnqGwglNzbigpiZyyc1Rsq4IA4K/ySgRv8t0mYQhuW4MSqj65Oe/i4CF2N
 TsTuWp9/xfO7YDTIT3L01lZsfWucmpSM9eXQYw07BVbpSI+hz4qnLw9eSFjqtJm/pMpr
 4UvMXmYIcD3kmvjPb5R9bs2DMUOEXCwv3ZnyQrbsDe8u3zhZQVGiT3JjSdZyIsJ2Dk3x
 xmbRdNp+nHq4xmh8sESUMp3q4OGcmTAqTPL47JCWybByt+8nLXMaTSmdP/NkNotwFGcc
 ZDu9XEN/pNKRieLM83jl58RruQ1W95xkeeGU78GiZmBrb+sx7UoSzAaYX7kX/xwzvoW/
 sHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7BR0zvwJO7bVat/aEvyQpEj7sPpuAlkQ/ruo5bglt8=;
 b=hYne6NC0fh6tkbZKM4plUDzck2O7QG50oYdGwP7znVLeEHIeNVnm2wn0A5t7XFhF0U
 uTxKPDdyS1Izg+J7Z56RJ/FFadM2La01qEZaQMdgeHvSiRVDtDuC0P67SIHKbFKIhRN/
 kFl6E+QWYu9ge0IpsA0dkTT/o7Hg7btL5X4h5fEIBCdmuw55KZtIkSER76EqSXETBHxX
 uimSliIAYcBegjMhynTp33oL8z2PIFMtPvwjQld+MN4PH1cOeEJZ7r4pNTOkrFjQpsoh
 RcqYR7Tv8SNqh0LW8DjGeTb3+egRkj2DhHzKbNkrptDbMauHnlqJQq4xREUXFyU+ziGT
 30Yg==
X-Gm-Message-State: AOAM530CxF6OkkjL6+GEjpSNWa0+Z6Ma+grghynNwWqVYRwyy6qDgvuV
 G80qBCDXPoQY7srBwcSLMM0Lc1Ub5HA=
X-Google-Smtp-Source: ABdhPJzSJEgQBCyHASaITG3kjTgBRY/awtJJ8lzRm5jzKtu1/KERiTTtKiNVapt/uXrUioQ5Ijot4g==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr9149534pgg.64.1612012201607; 
 Sat, 30 Jan 2021 05:10:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 17/42] powerpc/64s: slb comment update
Date: Sat, 30 Jan 2021 23:08:27 +1000
Message-Id: <20210130130852.2952424-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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

