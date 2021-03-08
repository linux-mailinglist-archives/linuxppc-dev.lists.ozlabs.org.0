Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBD53309C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 09:56:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvByW5FYkz3cmp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 19:56:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Jgv341mh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jgv341mh; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvBy52Kqfz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 19:55:40 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so2726335pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cKOElDbOOYhBWt4cAVGyc+iLTO7fKLi9zB1w5hJBFng=;
 b=Jgv341mhTEL+tx2Kss6dBvAaogi8STt8oajjXlV1clQaDZRyZ3pZjfbLE0HYTRrj+L
 5tK//c2IOhb/ZPVfJwtnTWZXcOCn3uqKQWf6gGLZc6Jta/+Idd2RNx89TgPoxyw30IzH
 V6m9XicPBsJDYzhTz45sUry0E9spF3LRnLu0zG8e5yUK4sNNGk61gUOk9w68fpopnIiq
 blqRU4LWvjsY6DAsOrLoubPpaCd85uOnH83+RIiaYaCn/C1/Fwgwpwi6tbKvex0QDZbt
 UTgybFILBttrCKKr7ySod08kX1vTe6Wk1VzfvNCWTihFxMnEeovmDOF5/78QpvNawXW3
 KHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cKOElDbOOYhBWt4cAVGyc+iLTO7fKLi9zB1w5hJBFng=;
 b=qwAHEMjD4INqtU87GB+mGUTWmBKL3Gm8V5rLe1kxbTX3QhPDZdPFfQQekj7qYcTgXw
 y2IkKigMRkVEIywctR46he7PdvhXUqt7ILY+5/PaBXM/79j4ovSm3JELAJQaqTjOHJBC
 RzBqZirXwDUo+QB2YNxsmo/fhF93OZp8I43gbu3X5EvYH0PDrsFedLlCwSAWESX//gSJ
 p4aoxKO/PBFaOr67tVWHqoW9r9yKaVVN7iFUjI3eM5AzA54ZRo3Puxq0GHdVOZhFWPl/
 QcHJJV5Z0CekGpcQZMuWLp0uOoz2GwYMGfCbG+wNZMNh+hshYsF90D2+OyHjDOOL6Tru
 3BrQ==
X-Gm-Message-State: AOAM533769Bv4Yoq1EPcdQcY+pd9Q6MdfDlAKJRS8rofGDva0+/IlrxD
 Ho/EBFqNw15sZbznD+XRrvyPNlLDylc=
X-Google-Smtp-Source: ABdhPJyn6gJvNuaWGr4Oxvrm94qH2C19ioESa3I7pUdUqJ22RMHnbazgIuMtf1AJynktsvx6Pl0yIA==
X-Received: by 2002:a17:90a:d48b:: with SMTP id
 s11mr23854899pju.67.1615193737671; 
 Mon, 08 Mar 2021 00:55:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 k63sm9809425pfd.48.2021.03.08.00.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 00:55:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: fix inverted SET_FULL_REGS bitop
Date: Mon,  8 Mar 2021 18:55:30 +1000
Message-Id: <20210308085530.3191843-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

This bit operation was inverted and set the low bit rather than cleared
it, breaking the ability to ptrace non-volatile GPRs after exec. Fix.

Fixes: feb9df3462e68 ("powerpc/64s: Always has full regs, so remove remnant checks")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Well this is embarrassing. Condition flags should be represented by the
bit set, rather than bit clear. That would have made the mistake obvious
even at a glance.

In this case, this stuff is going away soon so I won't bother to change
it around.

Thanks,
Nick

 arch/powerpc/include/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 975ba260006a..1499e928ea6a 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -195,7 +195,7 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 #define TRAP_FLAGS_MASK		0x11
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
+#define SET_FULL_REGS(regs)	((regs)->trap &= ~1)
 #endif
 #define CHECK_FULL_REGS(regs)	BUG_ON(!FULL_REGS(regs))
 #define NV_REG_POISON		0xdeadbeefdeadbeefUL
@@ -210,7 +210,7 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 #define TRAP_FLAGS_MASK		0x1F
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
+#define SET_FULL_REGS(regs)	((regs)->trap &= ~1)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
 #define IS_DEBUG_EXC(regs)	(((regs)->trap & 8) != 0)
-- 
2.23.0

