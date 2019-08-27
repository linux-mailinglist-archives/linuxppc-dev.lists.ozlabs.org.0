Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A240A9DC06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:34:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZH026rCzDqvD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t7yYUtOs"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCC1ZsdzDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:46 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t14so11036168plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgJl0RoJ5CJqO90iMcqyp0FyFvd1BzQf3fB9Yvm2MUk=;
 b=t7yYUtOslDpm3Hf+u1NR7dNT+DHkDnzAaorU7ZvDWuZAuoyc08NPZG5AxpHm4kQtwz
 clAxvRF1SvzV41wjwxozBNGPXV5CoaDqHGlyS17pQXk+9Eb5jTcCy3KwdhdBPVUP4Rze
 RIHA1Znq0N1sdTkzTkvUkQmaZPRYN7ipfNu5z6uX98i96A97bK+incjwYvrCsjFbPL0I
 IcXXTcEvXvH11xIvqZ+6174a9cwT1SYaWgZGIpCMrp50/0FmYFZfvBrH5kjsxPA8WCGc
 BkxGebuk3DJtUR6wrz9GnTbx14jaC+geAjqHElikzIXDmJIyjOa2jRi2mNHLRECwhWuC
 IHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgJl0RoJ5CJqO90iMcqyp0FyFvd1BzQf3fB9Yvm2MUk=;
 b=W8viI86RAEhkZSnZeOv60MFqvYh2IJzTZqywLp+gGm6N0ecCscJZVM7vOCkmxNeb2i
 o8TDWc7PY0scnz9YJpl80BmdKEeKrSlQSPH6Ox0/UyuvxktTOqNhcIiIrljfsPrnPBPc
 WTh5YrSpY8KZEM7AxRBa0Ek8/H2FvT6qtlGP/mfkn22r7sYdEsHhr4wxWvtv0uplvN4b
 FxlD6++FKVZ8AaMLR7JX2Mj/Gi9lVZvq9FlGynxj334kc7PZBE1IIVoJ/K1hpFraw2ay
 SLEhqpBjmNpUgmz3B+doi+ZB1gaQjeCo5TiWWXpdQT3zGa1wg7HGyHiHA2mwV3bsVEOS
 vJjA==
X-Gm-Message-State: APjAAAVghx+BWQzKCcMyZ+jo38ZiTTlrcdTmhbGRYuizCAnFa3vVC6fe
 VXg5K8e7A01qGSH+PrTX0zyQrNPX
X-Google-Smtp-Source: APXvYqz//bmBcgqhjemqiByHKJfTC3U5fIsAz6padNtgAO7nKuAATZ6BWy5aZkP6MR8p0vN1yYaQEQ==
X-Received: by 2002:a17:902:524:: with SMTP id
 33mr22549692plf.27.1566876644604; 
 Mon, 26 Aug 2019 20:30:44 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc: convert to copy_thread_tls
Date: Tue, 27 Aug 2019 13:30:06 +1000
Message-Id: <20190827033010.28090-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827033010.28090-1-npiggin@gmail.com>
References: <20190827033010.28090-1-npiggin@gmail.com>
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

Commit 3033f14ab78c3 ("clone: support passing tls argument via C rather
than pt_regs magic") introduced the HAVE_COPY_THREAD_TLS option. Use it
to avoid a subtle assumption about the argument ordering of clone type
syscalls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig          | 1 +
 arch/powerpc/kernel/process.c | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d8dcd8820369..7477a3263225 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -182,6 +182,7 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
+	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22b4..24621e7e5033 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1600,8 +1600,9 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 /*
  * Copy architecture-specific thread state
  */
-int copy_thread(unsigned long clone_flags, unsigned long usp,
-		unsigned long kthread_arg, struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+		unsigned long kthread_arg, struct task_struct *p,
+		unsigned long tls)
 {
 	struct pt_regs *childregs, *kregs;
 	extern void ret_from_fork(void);
@@ -1642,10 +1643,10 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		if (clone_flags & CLONE_SETTLS) {
 #ifdef CONFIG_PPC64
 			if (!is_32bit_task())
-				childregs->gpr[13] = childregs->gpr[6];
+				childregs->gpr[13] = tls;
 			else
 #endif
-				childregs->gpr[2] = childregs->gpr[6];
+				childregs->gpr[2] = tls;
 		}
 
 		f = ret_from_fork;
-- 
2.22.0

