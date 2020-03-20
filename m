Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0518D308
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:36:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kSYc4J90zDr1V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:36:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YmE7iy4a; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kSNG4FzQzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:28:30 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id bo3so2591159pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLLQ++0knUhMedp4AQo++05sP9vGbHnyxzphUpjHuv8=;
 b=YmE7iy4asJVzh12APRLd1ZRD+778v91SRcp3FpCSm1zu9j387B2v2V2S8bYvv2cPha
 ZOrfkwR63wgrEc83/WUmWKzNuNwU9YbW6BOUgyINAJg75kosoaRLZvHtNj7W+GvNdXbn
 AeJFavRk0PEa15ustEuPWab91fUOQC5oXr6G/2E/UzXL8fzaYNlTYQEBpIyxDogvUqXr
 pnv5gR0CWu3JVa+4Dbmq/ptUhQ26IGd1q83DGaKITKvJC+T0Si1vcKO1I7aw1mj8VZOO
 EksqSygsT8rOC07kOQX4EOYSP7BwrUxqniMhtIlG5w/DySwW1FsV+LjAnJ0KGxKwJelw
 juQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLLQ++0knUhMedp4AQo++05sP9vGbHnyxzphUpjHuv8=;
 b=PNikz9CzYl9xcjnLhy96GeHe5nno9/hVD7XvEbxzUlVN80R0rGho5vtou7R5ke4ib0
 05oO7WQUg4b70BCmoIpbAiFM3lNKI+AJ39mopPKyEozdpstY1iA6HDGvchX874pRB8IC
 43E9cSTAYEawk1SZXHqn3YjpmNsyiKLS0eKWFLg9IOYZWRpOJ7WeBdILN6girnRkbH/H
 jcnwB9GYwx6fgQNAHIC1fEBTw2XZxAisi4ZL/ZNtweta+NBjiCDY5p27//9AU5fcA/p0
 /ZuEgpvMyZR15zNj3UQTE3gGAf1ir+IRe/ye0NueYsCVdYGjUlwC+hOVX9uFzcZ4M48n
 Qz5w==
X-Gm-Message-State: ANhLgQ09/jrU4ifLscDSzoptR20vtpsomsOKCvQwHxUT6EUhWxYajg+p
 pnBS8CDutgwd7kSOJZTgv/R3/U2D
X-Google-Smtp-Source: ADFU+vu4O+niwO6AFg33ibgT4iJdrtQI+gLS6+hLwm+MyWJmqYNgqYFdx4/6X82Iwg7w5ceS5U5ZHw==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17mr8875750pls.23.1584718106874; 
 Fri, 20 Mar 2020 08:28:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id 184sm5486580pgb.52.2020.03.20.08.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 08:28:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: ftrace don't trace real mode
Date: Sat, 21 Mar 2020 01:25:51 +1000
Message-Id: <20200320152551.1468983-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This warns and prevents tracing attempted in a real-mode context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/trace/ftrace.c            |  3 +++
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7ea0ca044b65..ef965815fcb9 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -949,6 +949,9 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 {
 	unsigned long return_hooker;
 
+	if (WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)))
+		goto out;
+
 	if (unlikely(ftrace_graph_is_dead()))
 		goto out;
 
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
index f9fd5f743eba..6205f15cb603 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -51,16 +51,21 @@ _GLOBAL(ftrace_regs_caller)
 	SAVE_10GPRS(12, r1)
 	SAVE_10GPRS(22, r1)
 
-	/* Save previous stack pointer (r1) */
-	addi	r8, r1, SWITCH_FRAME_SIZE
-	std	r8, GPR1(r1)
-
 	/* Load special regs for save below */
 	mfmsr   r8
 	mfctr   r9
 	mfxer   r10
 	mfcr	r11
 
+	/* Shouldn't be called in real mode */
+	andi.	r3,r8,(MSR_IR|MSR_DR)
+	cmpdi	r3,(MSR_IR|MSR_DR)
+	bne	ftrace_bad_realmode
+
+	/* Save previous stack pointer (r1) */
+	addi	r8, r1, SWITCH_FRAME_SIZE
+	std	r8, GPR1(r1)
+
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
 	/* Save it as pt_regs->nip */
@@ -141,6 +146,12 @@ _GLOBAL(ftrace_graph_stub)
 _GLOBAL(ftrace_stub)
 	blr
 
+ftrace_bad_realmode:
+	REST_4GPRS(8, r1)
+#ifdef CONFIG_BUG
+1:	trap
+	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+#endif
 ftrace_no_trace:
 	mflr	r3
 	mtctr	r3
-- 
2.23.0

