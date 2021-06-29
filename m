Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6AC3B7A65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:23:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzXF0cnwz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:23:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DW5QziYD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DW5QziYD; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSR6h4pz307g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:23 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id t9so124211pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zx21pWSMKbU+RvB/IVMFXRQ+tjZfClA98U3zFPv8oJw=;
 b=DW5QziYD+sGNqyXpQdv4bnBSioVnJDjXQ2DiJW++en/qo1ruoY3pLm7geMlkv3Dtx+
 VVQLYfFy/QxCqxTzBtKbnY9aKRpL+17qBZ3rgfSPtPir1EZeR/+qE8W5VlEKBtW3Jjhv
 z7stLNw2d43oAmpyAiqzJNU30YpcDs2ybqOj9SJlOuiFA279fs/A6FVg0mWn701O0Z00
 az6KA8sPUaVIUwN9pDGtcOHzoBd1OteUGhg3qqisr179HChqzoaoV8EnutCIpCCkzJmI
 BA9eUyz4ev2hblLnVAmMRie3/RPcLoy/LIi/wtunXCszzt/J53Zlh3fXYpeG4GZMQKId
 6dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zx21pWSMKbU+RvB/IVMFXRQ+tjZfClA98U3zFPv8oJw=;
 b=AkL0dMRBI19RIwXIrset1LhGcSRQZCmzDZbiEqIFU00w7QVrJMbH5OFxWCPRqhWquk
 idVIwz+hfknQa8lCdqIU65PAZ11Fu/NdNUXoBYt8LNsZPELFuKA+QnPqm9HCoRiPSJFi
 RtWyqQKLm4J7A02Fup+XT7LhGY+iZbbOHiy/PBiqc8vdLZhjP4LwX9RaIPe3cACRIduB
 M8JR5jy9IHpEuSX0MSNTBh+LKx5QTI70pgIM7xDJWuMwS7XBD9VEjDClHdTROMhqa0C0
 UhbornA4bQhEoMrUcQzZfDPYqh5dOTlEKdOYQaJYbAUXw9UYo7QfCjLbJYdYUOaievVB
 gpeA==
X-Gm-Message-State: AOAM5322Om/P1RTSk629qysyk0pO8R+i5sl0YnxHQhFL8+bbB3HiKk//
 TuSWc+8l1SQb3fKS4F4kfwKi8GQAngQ=
X-Google-Smtp-Source: ABdhPJyGREismH51ZdUuNh0sfRg03ad1zKgrGajU+athrN8ySI1xFa9rrpI20ETyR15kywIa18E1Bw==
X-Received: by 2002:aa7:9147:0:b029:30f:7bf3:64ed with SMTP id
 7-20020aa791470000b029030f7bf364edmr1211671pfi.51.1625005221582; 
 Tue, 29 Jun 2021 15:20:21 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 8/9] powerpc/64s/interrupt: clean up interrupt return labels
Date: Wed, 30 Jun 2021 08:19:56 +1000
Message-Id: <20210629221957.1947577-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210629221957.1947577-1-npiggin@gmail.com>
References: <20210629221957.1947577-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Normal kernel-interrupt exits can get interrupt_return_srr_user_restart
in their backtrace, which is an unusual and notable function, and it is
part of the user-interrupt exit path, which is doubly confusing.

Add symmetric non-local labels for user and kernel interrupt exit cases
to address this. Also get rid of an unused label.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 06244b4df719..795c105850e4 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -511,7 +511,9 @@ interrupt_return_\srr\():
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
-	beq	.Lkernel_interrupt_return_\srr
+	beq	interrupt_return_\srr\()_kernel
+interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
@@ -625,8 +627,8 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 #endif
 
 	.balign IFETCH_ALIGN_BYTES
-.Lkernel_interrupt_return_\srr\():
-.Linterrupt_return_\srr\()_kernel:
+interrupt_return_\srr\()_kernel:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
-- 
2.23.0

