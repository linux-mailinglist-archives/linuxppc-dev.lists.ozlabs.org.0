Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57819F1A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:33:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkM43FqqzDr7G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CFVEHTez; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjs91sFJzDqsj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:37 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id k3so6125491pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b08rkcbpp/eTYJhg8lUaOwR5ABjm0Y2dSUOTMw6xZlk=;
 b=CFVEHTezScWfS8Ii/0CzDtEJhaNgLDWoLudtO7AFJpe2cjCgfyp1smXHdJOrSGG/8Q
 CkDfQ4J4GTvuH2a7Kq2H5IR/mlUxHtEL4uDjHGG8ZXpyt4p18yK3s5gWe2DEMtIEetqR
 fZHf82Sr+fgH2j8tWpiXrxNKdtztwxsl7WSMCWvlalB/9xjS9ReqnnBnzA5AO5SD09yx
 Vu9cIR8bD06X03/ts5jZpCJkh1ZTwl0/dD8sYBHy95JtTGpT8tNaOAdFkQscq1oBiK8q
 884yYuaLpPqnJU+lgLcErLNuT2aS+3PRqlKIZUQGZFTpoDV3hDYg56f66isde0YRdmZj
 1Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b08rkcbpp/eTYJhg8lUaOwR5ABjm0Y2dSUOTMw6xZlk=;
 b=Nj5HeDVoNSAGOg5rh/MNhPMrBQGNsaY+iGJT+5W+pBhaIdtbkWP6FLwpXrMBGGeVv1
 hcd3srdQzRf8p/hmnNUCFCKcmzxgxhQYWktR9lLezVKuGiBqxyMmDXEO32pRzBvMCuka
 SJac49U8W+YEBlkT9BDhGrJ9J5wCLa5vx08IH3arZ3X6NJUNimQ+5esCaVEPyxbqVr3X
 6syG4fJJ2jNQprmZhJdN7gUiCn80mZQgDC7gvu35Bhx9GclJ7DlPmw97wCASMN+awKmC
 zhpwSafygteKhZW5QdlsUXLTt7T8V/SOJFcs0fMPKZyDtwjJkG3oTy/B3PLNkCjLCPJH
 LJjQ==
X-Gm-Message-State: AGi0PuYXnynkGbG5flJrtboJxGXIoDbtfbyKNaeuo5C0LIkiY+esJLP1
 DU21p2O31fav4DolUCjSitCT6rXgT3c=
X-Google-Smtp-Source: APiQypK2zduz468gd1BSt6nWuX84ui3oR5PuljbgnG9hMK7u9sN6BR5TvLBRebYyZ4AWOm3Cmv2PCg==
X-Received: by 2002:a17:90a:db54:: with SMTP id
 u20mr25076013pjx.140.1586160635115; 
 Mon, 06 Apr 2020 01:10:35 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:34 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 11/21] powerpc: Define and use __get_user_instr{,
 inatomic}()
Date: Mon,  6 Apr 2020 18:09:26 +1000
Message-Id: <20200406080936.7180-12-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
index 66a6d1de7799..65cdfd41e3a1 100644
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
index bbf536e10902..c82ede46d71b 100644
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

