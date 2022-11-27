Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B6639ACB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpkt3YYGz3fWt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:06:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KmdPwE0G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KmdPwE0G;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNm19KFz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:32 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id k7so7772502pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNplP6Rypuxe4WObOy5GbURQb1CZMQaa/LwOjoenJtk=;
        b=KmdPwE0GYRjbSi+qHPlZrsWYx+sZPTRULN+fpy/HiKD21odb4gn3Skp7X1cXjZ1Rp+
         8APWpSoCy4VBKCUxx2s+TwVW745Kcu/5gVBp66AiXhkavQGnzFlPkt7G+VJF5FMbcTPk
         4ywRemvqmtIVV0CBeD+sc5j8GCbTaK3TWhIrMs/BXGMoggCAmIPji1ZpNDcQehh2nozF
         qEudiNlsFVHBqek9wMOOJajf2ifvj2DD8/aFHCG3d7hsn3Fu/81ulWxeJDCYOPlkrYgt
         +Czpv8oFaGs9PH2hTpe5gZd5d8z8hvGKSmBdLVFbSn2/9I9kYFxemvoelOHLQBn8jv/E
         Eqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNplP6Rypuxe4WObOy5GbURQb1CZMQaa/LwOjoenJtk=;
        b=J41GwzuISurC2l04FUHhc8dr0AIhxnMyzhA1kYoK48AQe1+QG+KL6eD32EOn08kWd2
         LQMDme1eE9LC6xRA1GqRqUA2lV1OMiGDfzfOFJwldpwMcshfjFiE1X3gD7bL8mouAUr6
         aTv8bPQQBMCTosDVbH0IwGhmJQphbMfsoPGils3NXeR/T02qLp8xRwOVRvxvwZuQ+c4X
         nPxlRDM2v6Wvl0hCzFYjHnOg/ykPQCv2hJjK75TnGDyGq2rwv/7OSNphhu935gR6oeSL
         0sDdEGfuTj6dsU3Wi0RTqe4EZpkMgibmuWKbMOImTu2uuPm8RVJCI5YjPTfax2zP0mcF
         Cyew==
X-Gm-Message-State: ANoB5pnP4zYFIGxl4cxjJPKmjhRxcdzcsyshjelNgb96bV/pJsH3BW0w
	Bhigv+CigAi9X/pyOVnsiEzfgUJxVVolIA==
X-Google-Smtp-Source: AA0mqf7EQy5cHzc2Kba2aCRDmDI2MAkCGVafIMg8Ulq69EM3DDr4mcyuLhzEw67YlP8epz0TMdEAAA==
X-Received: by 2002:a17:902:b40b:b0:188:75bb:36d4 with SMTP id x11-20020a170902b40b00b0018875bb36d4mr28356419plr.55.1669553429641;
        Sun, 27 Nov 2022 04:50:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/17] powerpc: remove STACK_FRAME_OVERHEAD
Date: Sun, 27 Nov 2022 22:49:42 +1000
Message-Id: <20221127124942.1665522-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
longer used in 64-bit ELFv2, so replace STACK_FRAME_OVERHEAD occurrences
with STACK_FRAME_MIN_SIZE.

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

