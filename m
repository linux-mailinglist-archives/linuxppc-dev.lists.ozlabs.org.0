Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 799151C0D26
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzW91sTGzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d4N0EIZ2; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cyr915RvzDrN2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:47:36 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 18so1065507pfx.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8+HJaVWhQNJ4z4tMBwybAHwSbtz44xh5kGlPg+d71fg=;
 b=d4N0EIZ2aepBTMdGLoK/zdwfLDFc9aAi66k2/zwvKPJnyRGTLdAtUUo49r9wvPSgPf
 QwKzRz17q+iNLIpK4vrqsuI3yKyAPYPa9fNWXEdOlyQYMIvF1iajk5oVyNuPbsU73kAW
 glUg9ptl76mdLF3Ff0tZHKCil5b81etcd/2QbbxKWN02n2yPXTVvr2g4Gk+gupfCOgSs
 QfNiP+/ouGWADok3ZbOSd86ITK7P+8rvn3+OjSRo9hqRDCWDu3G7ZWL5ciundPRGujsa
 kdj0wmx9UoYOL78r+xDVRCFes7wizjOyZ5vTvzYyXMFJJ+cuexn4oIYekL5Y2J9KYN0l
 UnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8+HJaVWhQNJ4z4tMBwybAHwSbtz44xh5kGlPg+d71fg=;
 b=fyyz71j81Cx0Ajrz/6QlJ4VYF/5kznNdGJZC4AvR8AE0faeYZ8ygHFzYCrobMPJ/+x
 N1cfK8NEpl5TVXOScUQQ6yV7CRz0t03Uqb6gZBCuTRmYjitc7rDcWlton0+tn3e/zr61
 B7FbtmeaemlK/ktqNly7XoIhS94W5dzHYFb6bDYDHD9AiCCa9i76ItUEH5SKd/lPGTFy
 /YrH9AFCzMgnBaor5dSZpHXcVnDg5tICbJV/jCVww98EZLqiqJvON3SsAgB+okyJ3ZN8
 JPgOWHfq0kWDxjpmIwVmuQuOgfWaIFfZem0OpZysKJn17frz8IhL5Vl4CAJreGTNX8+q
 9UJw==
X-Gm-Message-State: AGi0PuaubpBACfEyvIaZOpPbLaoGPtfkf4CiHzMLGz/APiNr4H5GlYAe
 90ziY03vyZvhh8wJtNlMNw+5bklPU9yh8A==
X-Google-Smtp-Source: APiQypKrM5dmQuO2KwiTV/V5L20q9r4XAh44uFdY+OC5oAALcdLpdHtVaTusjQIX5sX2benrJC7oDw==
X-Received: by 2002:a63:d3:: with SMTP id 202mr2211125pga.378.1588304854849;
 Thu, 30 Apr 2020 20:47:34 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:47:34 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 16/28] powerpc: Define and use __get_user_instr{,
 inatomic}()
Date: Fri,  1 May 2020 13:42:08 +1000
Message-Id: <20200501034220.8982-17-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

