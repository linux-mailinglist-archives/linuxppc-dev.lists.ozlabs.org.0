Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A05621C669F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:13:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3BD5491zDrPy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:13:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qSiKzG+s; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2ZT4b5kzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:46:25 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id f8so1346plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E9P2mNpxH5qhso3XSAJS6bJLI96EsMrmJ4yFNnYsMks=;
 b=qSiKzG+sMsgiT4BptJ54Jn34qIgwgYJda80b0ZQgfMVsnQqiO1oZFXzzYfsp1VtC43
 Eq6td+NgF5h9zKvbpHiOf18gFwRijnvaUKbB2G4DGzrWUqp1xBeQORiGaCZMifdqsn2w
 bFCbmRddi6P4ku0fAIokHulQ1NqRZHlL//T691zFb66x6FeEiZLcYxGhEfKzyaRUsq/V
 L1BqqzC8I7V40kXCBQrOuA4E/BQgr1wW8YRZ8HBgJQ/f82kQiCdauNmW25NMDPvnJR/r
 tOKn6FRVoWhYICBHtuHV0NG70R4a+vMXUm/OpI0pJzSGFKvGVkqBxyAEVfGlatx89mvQ
 Nb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E9P2mNpxH5qhso3XSAJS6bJLI96EsMrmJ4yFNnYsMks=;
 b=dM7+BFtTkC5q+/3mFdEX++TryRl/Wh+mTVLPd17y01k+EIZzBeEIww64lWY5Jd+bUX
 +iVQp5oBV76lfb6wDYVkEVv31MFmGAtPTXId5qcGi8t4uW9A9cD1z0WW1XptrsMHQN4Y
 jklPTazzmsHQNPDPcwc8Lrgv4vpCZKFgl5g/XfpXX0AUR3BNoEaUut3gIHkJP/2KWCPZ
 35+5smMDZZJnsseZOd0YHgrN8Y6VDsmJVdG5O8+JBBfGcJOqJIzPFkx2blWBrdNBMqN8
 kuosIC/tzfDwxpCzSvl8+Fp5MHWnjj6uGUHNQcE6MUyQO29MwvVvjO5MVHRCIx9aZ+M1
 EvfA==
X-Gm-Message-State: AGi0PuZW/6/Hz9Dfs6mFRU4mUxbXDR1hq7FzVjN68oI41RLZxK6GCdGP
 /rx4ftQjM+IpwYkvW14FEnPVbOSqFNNxtw==
X-Google-Smtp-Source: APiQypLC6uEdMh/WcP2Q/S735nDS29zAl1gMjTHNEkPyN1UG8/b5w3xeq6BRLTRGuKZxRl7izGVF+A==
X-Received: by 2002:a17:902:9882:: with SMTP id
 s2mr6045213plp.184.1588736782887; 
 Tue, 05 May 2020 20:46:22 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:46:22 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 16/30] powerpc: Define and use __get_user_instr{,
 inatomic}()
Date: Wed,  6 May 2020 13:40:36 +1000
Message-Id: <20200506034050.24806-17-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define specific __get_user_instr() and __get_user_instr_inatomic()
macros for reading instructions from user space.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/uaccess.h  | 5 +++++
 arch/powerpc/kernel/align.c         | 2 +-
 arch/powerpc/kernel/hw_breakpoint.c | 2 +-
 arch/powerpc/kernel/vecemu.c        | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..c0a35e4586a5 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -105,6 +105,11 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __put_user_inatomic(x, ptr) \
 	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
+#define __get_user_instr(x, ptr) \
+	__get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
+
+#define __get_user_instr_inatomic(x, ptr) \
+	__get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
 extern long __put_user_bad(void);
 
 /*
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 9e66e6c62354..b8f56052c6fe 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -304,7 +304,7 @@ int fix_alignment(struct pt_regs *regs)
 	 */
 	CHECK_FULL_REGS(regs);
 
-	if (unlikely(__get_user(instr.val, (unsigned int __user *)regs->nip)))
+	if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
 		/* We don't handle PPC little-endian any more... */
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2db9a7ac7bcb..423603c92c0f 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -249,7 +249,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr.val, (unsigned int *)regs->nip))
+	if (__get_user_instr_inatomic(instr, (void __user *)regs->nip))
 		goto fail;
 
 	ret = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
index 3dd70eeb10c5..60ed5aea8d4e 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
 	unsigned int va, vb, vc, vd;
 	vector128 *vrs;
 
-	if (get_user(instr.val, (unsigned int __user *)regs->nip))
+	if (__get_user_instr(instr, (void __user *)regs->nip))
 		return -EFAULT;
 
 	word = ppc_inst_val(instr);
-- 
2.17.1

