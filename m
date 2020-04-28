Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F291BB404
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5LQ2MzTzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OyOmy/sX; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cW6xvczDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:00:59 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t7so1797542plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dc69IPWdmrPYrTH+5K+JgK3W+7mp0omw3EHNxasSae4=;
 b=OyOmy/sX2fzj5AbpA6nJbFJpwX6C7tBxTDsZrHTtxicREJHesKrtCr/RaMGRlvQrCY
 +ndPklxZQ7QoWSTsFNAQ8Y4i3HO7xErud/38Zvxg1ufwtb/gCX+90P1EAIaEHgxFfH1w
 cHW2En2TjANltK94i6k4BRo5dSk/RV3BHePJUm4SG1UGw06U3R+4JapOUe6Qysv80MGK
 X7/JkQtLkUFkFBYvl3GNYyyXhUp/cgS7aP0Y9VvaQEpMMQwjcI19CtoCl5QsfdbMzbAW
 YUCKo1JmCRfY0VsMrAJS+DmjCrNsQloZhCTnZ5+4cPtTnX3eHm3hvuDgHdOA0Z2QfAvz
 Ifyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dc69IPWdmrPYrTH+5K+JgK3W+7mp0omw3EHNxasSae4=;
 b=qudEVQkTCWFRAqoDARevqy/cqMTUpmHX8Llbo5xupxBwKAY7Tdqx5VAwBawqcunTbx
 WE4rLyETVwcTwMHICNmaiFh3xUzm+6M3g3Vg4us2yyRXeTrl/iqkAV5caoL3KF7FVTOl
 u+4kkOJLZQ4ypz/aVol5apa54DH+sDaasCe+DfF95EpkY0jgoCSCkI7c5XI7+H3ReZpR
 C7Zvrnpg5jk4Giue/0sYVpmglPmgsCV6iSxRvhca2Uct2erd3oCPxP72wZHTzxyJog8g
 zF7aY2fv1DUGQf/oeROd0b/4APKBVE/pdnHIh6jxBvS5IdMfVTgKFfuCjoEYvjUcVwSi
 5e3Q==
X-Gm-Message-State: AGi0PuZInCFSAXAaXka47TM4jun/kFBZNSuR3eFXPnHi1oeVbQB7sVze
 V3XYRJdOIgT15S2bYqyvdJvwiPuV8Vs=
X-Google-Smtp-Source: APiQypIVhhsU3GneT3DzElA4dqtgg3X4m14ZkgSwqZiPCyEj/EsVvmUnPmf95Y2nrs7I0g8M71RWBg==
X-Received: by 2002:a17:902:a413:: with SMTP id
 p19mr26477614plq.1.1588039256443; 
 Mon, 27 Apr 2020 19:00:56 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:00:56 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 16/28] powerpc: Define and use __get_user_instr{,
 inatomic}()
Date: Tue, 28 Apr 2020 11:58:02 +1000
Message-Id: <20200428015814.15380-17-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define specific __get_user_instr() and __get_user_instr_inatomic()
macros for reading instructions from user space.

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
index 542f65ccf68b..cebab14e2788 100644
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
index bb262707fb5c..adcdba6d534e 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
 	unsigned int va, vb, vc, vd;
 	vector128 *vrs;
 
-	if (get_user(instr.val, (unsigned int __user *) regs->nip))
+	if (__get_user_instr(instr, (void __user *) regs->nip))
 		return -EFAULT;
 
 	word = ppc_inst_val(instr);
-- 
2.17.1

