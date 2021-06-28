Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B13923B5A19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0Fw4jwtz3dZ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KhdjlCsT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KhdjlCsT; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BY24Xkz3bTF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:57 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id s14so12150815pfg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zx21pWSMKbU+RvB/IVMFXRQ+tjZfClA98U3zFPv8oJw=;
 b=KhdjlCsTHvh9JOZfn0ovjfpmCVJZpnUFZz5uP4cfFBfTtzHFtQTpMwFdrFp0eGz0NY
 GVRSD24WZRtd/Gk1ig3lruQ+KGpke9kFKaiiXgoo1Qmouth3X9Euq10lSiJyU+wAwe02
 wXnlbMzlZkU8y2D4FjaGhraothMpvYrqbfKKgvCG3LGpY72OdcKtgKxaTIytqvT4Px7g
 wd7UJWXwdnAwkB6IgcWOeyupIqlmcLYQNfFJyogmL0Desv+LhqAales7bR9p1S3n6W+i
 atS3+hjkFPG/TBpcJWg5Hu8vC5JjJh6K07Oc+xKOqj0ZZN81lsQiLo1Bm3TpOPyTpqo7
 ffPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zx21pWSMKbU+RvB/IVMFXRQ+tjZfClA98U3zFPv8oJw=;
 b=m+A84gL5xrIwdf6DRqzuguGWRPyh0qI7XNt8NbZge1A4HPIZUYTSSFXtrmw2spSmHk
 58CzMmuU2/3GXYyYzXo3Fy38iuJ+3VYrMCWbTqrziaLuxEVIZTXjvqKOjA+wm4YQRmmn
 IcM3g5hCIMCBNBDciAsZ0kRYIiroA7Pphs+6ZV0iY1h//1jMU7qz1LPLOIhZsb9AU7qG
 vwhM1vmLEDRM45ceFSINbtWQzTldmdRlyRg0x8jL7VB5nwwL+PXIPP5mdWFRJOmAuW4a
 w9bc31WHbYtzc7OvP27AX7phgfoiTbnwWdaQUO13Q47Vmjb27KSk03YsPk92IqKGzMhk
 cjYg==
X-Gm-Message-State: AOAM5329ILlsq7qSluCO6D2W05BvpiJ1UpgkKgrCJLllPQjm7NhYtDo7
 TPZUM3ZjZrbJhjnM/BUWam+C9pgsisY=
X-Google-Smtp-Source: ABdhPJytCCTfCkIHID/AsBjky665RCKg1LGaQCEbHnK7uYT1ZlmaZ1S8YfZZP02cyuThPuJUkvpHJQ==
X-Received: by 2002:a63:dc4e:: with SMTP id f14mr21726327pgj.378.1624866594719; 
 Mon, 28 Jun 2021 00:49:54 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/8] powerpc/64s/interrupt: clean up interrupt return labels
Date: Mon, 28 Jun 2021 17:49:31 +1000
Message-Id: <20210628074932.1499554-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210628074932.1499554-1-npiggin@gmail.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
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

