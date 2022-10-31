Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F961302E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12nR1cTwz3dvK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:10:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZpeFlhGP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZpeFlhGP;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SM24LRz3cLT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:31 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso12138885pjn.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4sZf3CRjat1iVtvcQAERRqCftu3vUcYwyN75mfUhU4=;
        b=ZpeFlhGPSzIn5gl5BjcTiaKv9SZZ6818fozzu/7Xkxvv8Y22Sx5C1BpGwvcBylDV5B
         2WnnSaCYlk1PQ04sGE1DqfvyH97naTAxw8sYNSjwH25GYkw5byAN2FSZ0giIRXKzSnOt
         1mLItRzwbCp45ZP5l0X0h+yzXEgf5rO0AT3pYM1WpY4LB6FB1sD8VFsvBN1TrbCdY2tm
         5auDvdU2vnSATAMgMiCyjmUw8eMBaSV4mklvDu/WGZaze7KUM+sMbdmOUO+v+TXha6ia
         dvTBGsaD9N59g9I4LdBfcfMzQZaSbcLTlqDvFhOgMKjDD1+2RH7anaELSoV0MEz208/X
         tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4sZf3CRjat1iVtvcQAERRqCftu3vUcYwyN75mfUhU4=;
        b=KoQAViC7yFuymubTjKf/HbYUbVMqFg2nZXEeaPFjrzX4KkNmyuFy+6ffWJY0JvKRDw
         welzDRxWVQFJHZZkvaSY7GzhjNhLR+OyVxbuxvAwID0nPJXnTOI0qfyNVLJXio2O52dl
         NARoHoszBfb6tHznk3MCrkTjk8ZEiP9ONX23QoqoPJXi7SndPEM3PzE9VUjWtfaPkCp4
         MfTBU+y8ebEhzPP6DivD4Yq5z68fNQEyC6ZOyh5oKPeNzbkvxuCjl0uHxVZHibxtVMS/
         70ynUBVN/utVcJ/SqGqbpGsE8AjClI0UcOM3+JHlp7O+lRddzIadHBL6nyQMGOjqT8Pq
         0VJQ==
X-Gm-Message-State: ACrzQf2e02osy+zHsiMq/dBRJDk02lpBNjtXouG+w5D+PuKp38mL7LFc
	UIZfIj29sVEzhNLDmZGUg70zNoVY7eU=
X-Google-Smtp-Source: AMsMyM54EK9mOGiF6T7XdlxRWQWJICiz7SqFlHtLKXDTVjit64Oyc3Vm0iJMXksvZ9+i50hk8BDkFg==
X-Received: by 2002:a17:90b:1490:b0:212:68bf:fcc5 with SMTP id js16-20020a17090b149000b0021268bffcc5mr13266952pjb.52.1667195729431;
        Sun, 30 Oct 2022 22:55:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 16/19] powerpc/64: ELFv2 use minimal stack frames in int and switch frame sizes
Date: Mon, 31 Oct 2022 15:54:37 +1000
Message-Id: <20221031055440.3594315-17-npiggin@gmail.com>
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

This requires an extra 16 bytes beyond the minimum frame size for the
aligned regs marker for the int frame. The switch frame needs to match
that because they share some offset definitions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 412ef0749775..a9dfce62a5eb 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -96,7 +96,6 @@ struct pt_regs
 };
 #endif
 
-
 // Always displays as "REGS" in memory dumps
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define STACK_FRAME_REGS_MARKER	ASM_CONST(0x52454753)
@@ -120,16 +119,26 @@ struct pt_regs
 
 #define STACK_FRAME_OVERHEAD	112	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
+
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+#define STACK_FRAME_MIN_SIZE	32
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
+#define STACK_INT_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
+#define STACK_INT_FRAME_MARKER	STACK_FRAME_MIN_SIZE
+#define STACK_SWITCH_FRAME_SIZE (sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
+#define STACK_SWITCH_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
+#else
+/*
+ * The ELFv1 ABI specifies 48 bytes plus a minimum 64 byte parameter save
+ * area. This parameter area is not used by calls to C from interrupt entry,
+ * so the second from last one of those is used for the frame marker.
+ */
+#define STACK_FRAME_MIN_SIZE	112
 #define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
 #define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_SWITCH_FRAME_REGS	STACK_FRAME_OVERHEAD
-
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-#define STACK_FRAME_MIN_SIZE	32
-#else
-#define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
 #endif
 
 /* Size of dummy stack frame allocated when calling signal handler. */
-- 
2.37.2

