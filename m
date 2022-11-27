Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FA639ACA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpjs6KxFz3fMb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:05:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ClPSG0+5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ClPSG0+5;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNj4sYfz3f3Y
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:29 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so6436863pjd.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjXkI2nhkopqgcOXMeb6Iajjdpsp7zCQ/Iuj0UeqngM=;
        b=ClPSG0+5SP2W7OH4ZChzRGFfo47Iv5dRgwoT72A0OD0as8qGaTFD9bBlJ9kFHVekRK
         Z/ksvcVJvTFX/WydDeFv2EqnD+pKl4YcTFYK/mCUrtrTfZ6fAs9YDAeBSMpmbAHJehmN
         DC2fGNcCKlrjES+c44TGRKWtMrHpXy8ofyktk3cIKOpqcZaSChV2QCsv5nucTQ3WHnYB
         n3qzdMDsH5LGqSSh4m6hvBYoZqVLnAym03fLUKv7wuU7dfneHQalmOiJBAVGRaB93ikH
         3P2ByJ1Fe1AZGnGbOEsC2GD3ufx0BxXRw/pp5rm5bXorUuFmkfWGf2N8ztW/qyyHWDrU
         FAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjXkI2nhkopqgcOXMeb6Iajjdpsp7zCQ/Iuj0UeqngM=;
        b=zGzA7vX95MeUa+wFLex7GMoWTxs0JWvyLqHZYUaBnbnpfxYiTMOS+eQl+3uXQEv7II
         7VezXA1PqSeUmeyu4XdXkdu5t1RIg47CuubhuEqV+bIkb+MTm7fr7SNxAdnBYAAEir0U
         3bVfDQKIaCd9XfzwPqRF1vc84IjlfskN2xq8aWuLtok/aitBgQxKykhdGEUYlbFxqw0l
         RFlV2Qi7jD17tIhGbq2USMIO+u18obeySxPxEzlknpOkLFuYISE3hAVUbCYV0vhgbqsW
         RpO4FGin8YbBHVEDC44dAEZOmjor7fsNn1vYreoZcKgb3ONtNVmKphFRKNn5dYha2+ys
         FY5Q==
X-Gm-Message-State: ANoB5pkHc0mAlVYxTkQvzTLY2GW1EDJjp1Xo/MQ2b5Ztgq49Ej+9rYXG
	BMw4M/ZZvHH8SMxYhDcFdmd1gicLn0NmAw==
X-Google-Smtp-Source: AA0mqf7GUaGpCxbIrofZLc4AhmPld6/BfmmQwX1iqujN9nnxitePiPTtX5gqLL78rd4RsNFVNlswaQ==
X-Received: by 2002:a17:90a:9f03:b0:211:59c6:6133 with SMTP id n3-20020a17090a9f0300b0021159c66133mr49682075pjp.238.1669553427316;
        Sun, 27 Nov 2022 04:50:27 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/17] powerpc/64: ELFv2 use minimal stack frames in int and switch frame sizes
Date: Sun, 27 Nov 2022 22:49:41 +1000
Message-Id: <20221127124942.1665522-17-npiggin@gmail.com>
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

Adjust the ELFv2 interrupt and switch frames to the minimum C ABI size,
plus pt_regs, plus 16 bytes for the aligned regs marker for the int
frame (and the switch frame needs to match that because it uses the same
regs offset as the int frame).

This saves 80 bytes of kernel stack per interrupt. It's the principle of
getting our accounting right that's more important than the practical
saving.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 412ef0749775..a9dfce62a5eb 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
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

