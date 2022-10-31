Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20340613033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12rS6ZNYz3fWx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FtWw+2q+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FtWw+2q+;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SW3MBMz3cGZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:39 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id c24so9841304pls.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYrdAtRQBykBGkSkNidFsZnovZsStd7P2NkzdYVEjCo=;
        b=FtWw+2q+kSz9qWG/Eju6rn0sGE3XPx4CRx3Mqe3jYc7jfzxkWu4xBD6jRgnLrx4Hgg
         OBVAEieAiymPwGpjc402a+Lm7AeHT3v+ckQESSSolZKnQX6MGSrq54a6LiOSv6W/w1iN
         3GhGAn+GUKOefKNu9ou7MhZStJJNkAc/yGMyRQGDplHFIO8MlKizeAmf4Z6vg5qXjmxO
         DrEWJWO1ZEBPCWmj+ORQA339KDiYwFNRzrMBoqmCD7a/U+f5JafKmetbo+zx0TjG51uD
         QxaylLF5Vajxud2fkjPvlf3WgFk/72gh97c1qWZpPIoRmE/xanOKzxqnRx6xXVNWvo5u
         WkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYrdAtRQBykBGkSkNidFsZnovZsStd7P2NkzdYVEjCo=;
        b=ci2kte9it2dg7oNtRYgi7GJnAsLh1H+cg0PWOtzFU7U5NHcYLlXs6g/XWqYzZpeoNy
         vFaU/qWEYJaNSdErZgZRpS6YlEDNqIB2cZ+wfMivOIkZBryh+0hTitxZ5ltBCCsIq4MQ
         /Cdb5rSECKV2ek/d2kMYsMVVOK66+nUPSs+N8X1XtXI6hylN2OBur/yT1O32A74v3/us
         obz7bvWpWdb7LWM07boq0ROgkZBTJUYxC8qP7X0aHUS++tIDQ1DaEzns204GIVr1f908
         AzS0DrOI+RgoK2+5HvLARO3tn80wxGyzVUc2QBTnVsoc2ideR94lRI7Hvz/ld8LYU+E0
         Sj4Q==
X-Gm-Message-State: ACrzQf1E2ohfWSCfhMv6iW2Hxarj5YE4rrE8cTUanZJNFU/YLXH2xrJG
	B1dB+qswG4fL7egSEST/qHMKK5bqTbw=
X-Google-Smtp-Source: AMsMyM62tRzgdkXd3qK8DWE1Yu8JDrH0cUrn62UJFP9Yn2jFxAHP6QKmLkTcIN7mlS5z5Z/SqLylCg==
X-Received: by 2002:a17:903:18d:b0:186:9862:d15f with SMTP id z13-20020a170903018d00b001869862d15fmr12581207plg.6.1667195737028;
        Sun, 30 Oct 2022 22:55:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 19/19] powerpc/64: ELFv2 use reserved word in the stack frame for the regs marker
Date: Mon, 31 Oct 2022 15:54:40 +1000
Message-Id: <20221031055440.3594315-20-npiggin@gmail.com>
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

There are 4 unused bytes in the minimum frame in the ELFv2 ABI. At the
risk of causing a future ABI incompatibility, use this and save 16 bytes
from interrupt and switch frames.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index ab41d47761c9..cc308dce7ace 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -121,11 +121,16 @@ struct pt_regs
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
-#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
-#define STACK_INT_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
-#define STACK_INT_FRAME_MARKER	STACK_FRAME_MIN_SIZE
-#define STACK_SWITCH_FRAME_SIZE (sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
-#define STACK_SWITCH_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_INT_FRAME_REGS	STACK_FRAME_MIN_SIZE
+#define STACK_INT_FRAME_MARKER	12	/* Reserved word next to CR save word */
+
+/*
+ * The switch frame has to match the format of the int frames up to pt_regs,
+ * because fields are accessed with the int frame pt_regs offsets.
+ */
+#define STACK_SWITCH_FRAME_SIZE (sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
+#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_MIN_SIZE
 #else
 /*
  * The ELFv1 ABI specifies 48 bytes plus a minimum 64 byte parameter save
-- 
2.37.2

