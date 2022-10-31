Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBA61302F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:11:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12pR5w9Kz3fRX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:11:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e2V3vPA4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e2V3vPA4;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SQ2jGHz3cHm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:34 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id q71so9822066pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0jTAEUIuBTKAMfuaV/U/HZIm26gBH7Rr85iEaw8AZ0=;
        b=e2V3vPA4c0+GIQggoHUZnxlDkQgY6P/fB3AR6efq6jouBInZBdGkNuzVZ4htRJUyar
         tODAHDSfAuWoqhOA1Dspz1HwqvdhUakSjQa5VHUvTWr7RzR17tyS+KqnjK6NhWXy9N0w
         /daoSjoKnoUOjHgJBa39dC9E6QG3dHeh1VPup2/jTPP7v2G+7P6PbVQB+bOQKTHI+58a
         WoF6RwRNWrR82SvHZ6xo6RUO4KTnVENcCy8KJfzLg7QdS+bfv2X3wzolupBZOmnNtC32
         owzd0lNCkgLaGF6Vec+VjyKJ1lmQ/35H6/1erH79OGHKSbEqlps9dKGOxD1V9s7DhBj3
         9djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0jTAEUIuBTKAMfuaV/U/HZIm26gBH7Rr85iEaw8AZ0=;
        b=v1aIoMq9SlyJLDACB3SYqY1yMk3yTfx25HIHntg+GrqiSZVIHfJlp2B6tzie8mynyP
         lSaaRuXqQhp/2hK72CrsB8cbjzSp/8Gn9drURqrfg5WtAnG/XgPFqM9r+z6RJ4Z7CEBn
         Em+DN6lseWzB0nRfAMZFRQvfiTkSjo6L3RH1bcsT96aizYD8eVZzuODCtDM+wccORM8N
         D/iQtAo/R12EyBNqPLbNwtmetSnDwVCeDonfgKthn4BgxSd+fafsbm3BZUzuN8CzvcRv
         IwN9etLAkxZfCWkTSn29tbQoN9ixYrGA8z5PA7QH4UDYWUHm51OJtAORjgSmv3TVQixg
         4ySw==
X-Gm-Message-State: ACrzQf0YDhp3nIeP5nlrDphXf2YscEvFR+nP5l0Tb2VDmxii7QzUn9fK
	hC7UEOoUVITA1mQTVZnSD2hmtby86Wc=
X-Google-Smtp-Source: AMsMyM5pg5qpP2BxHxndHTGWt5fX041S1pvypbpbC3H4pWYQDaqIQFbRRImqo1zKTJXcnK3m+tmLKQ==
X-Received: by 2002:a62:1d52:0:b0:56b:f472:55e7 with SMTP id d79-20020a621d52000000b0056bf47255e7mr12894100pfd.63.1667195731749;
        Sun, 30 Oct 2022 22:55:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 17/19] powerpc: remove STACK_FRAME_OVERHEAD
Date: Mon, 31 Oct 2022 15:54:38 +1000
Message-Id: <20221031055440.3594315-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is equal to STACK_FRAME_MIN_SIZE on 32-bit and 64-bit ELFv1, and no
longer used in 64-bit ELFv2, so replace it with that constant.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index a9dfce62a5eb..a53c580388e2 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -117,7 +117,6 @@ struct pt_regs
 #define USER_REDZONE_SIZE	512
 #define KERNEL_REDZONE_SIZE	288
 
-#define STACK_FRAME_OVERHEAD	112	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
@@ -134,11 +133,11 @@ struct pt_regs
  * so the second from last one of those is used for the frame marker.
  */
 #define STACK_FRAME_MIN_SIZE	112
-#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
-#define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
-#define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
-#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
-#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_OVERHEAD
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_INT_FRAME_REGS	STACK_FRAME_MIN_SIZE
+#define STACK_INT_FRAME_MARKER	(STACK_FRAME_MIN_SIZE - 16)
+#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_MIN_SIZE
 #endif
 
 /* Size of dummy stack frame allocated when calling signal handler. */
@@ -149,14 +148,13 @@ struct pt_regs
 
 #define USER_REDZONE_SIZE	0
 #define KERNEL_REDZONE_SIZE	0
-#define STACK_FRAME_OVERHEAD	16	/* size of minimum stack frame */
+#define STACK_FRAME_MIN_SIZE	16
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
-#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
-#define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
-#define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 8)
-#define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
-#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
-#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_OVERHEAD
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_INT_FRAME_REGS	STACK_FRAME_MIN_SIZE
+#define STACK_INT_FRAME_MARKER	(STACK_FRAME_MIN_SIZE - 8)
+#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_MIN_SIZE
 
 /* Size of stack frame allocated when calling signal handler. */
 #define __SIGNAL_FRAMESIZE	64
-- 
2.37.2

