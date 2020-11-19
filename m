Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C022B9E10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:23:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbM83mbmzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=GaEyLA30; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8j0pqSzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:13:56 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id v21so2564762plo.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvDSLuSefi2y8hPOjdmDqwP+zutM2qMDFJkXnSHP19g=;
 b=GaEyLA30fy4ViVyvP/qRBl8puDnS79RBAclW5Flb4zY8VtqONLh5AOSAio7AOHN7mE
 TI8CcXaB3E9fzMb/9iJkKZLjLXIsjQ1CzoTeGVe+OkEs7UDzQSiqJJ0xlOJWHda86Mkf
 LnTGnfI4nn8SilJGQMet4/GvydnamIlAu9Kq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvDSLuSefi2y8hPOjdmDqwP+zutM2qMDFJkXnSHP19g=;
 b=KYxfOngwwIT4JoTpILylWomxWsXA5AfnoZSBQBxlnCZ0BihOwAZnV+JVsKLutLh5/6
 pQZWZsuE5vqf/FnCSU6ULHEsSaCUHacAB4KHTgc3DEmUsyewtfnnaj80/TsLGfWr0sjj
 RmI4hKEsqvNHKGmTgBC0OlwEprmDY4JJ+4OhxyJPk/wJPDC9EUy9jKVXu7uxMVT2XJ+R
 /EK+YbYxcZll/YctYTjUGsjyJv+vHHA2r0tlWmYec/L9MHtrKxG89yWfisJqh4EjTvlW
 OyVgFjXhjC3kafLODkDaDrat/F6k20AVmPem+FmOJjEKtkEqlBrlGr6fb/vuqKLAxCUm
 0M0w==
X-Gm-Message-State: AOAM533HeHp/DaOy18taUpUA/qrU2dbk6uEr73w7SpYaldUJaXnTA+/p
 5FQR+UwdnRRjUm4JamRY+Y+4Io2xGDC7Kg==
X-Google-Smtp-Source: ABdhPJxCnw5/X1C79eca0rDXiG/6ZoIbrNuNwt8WebrNozSUPxzp7UUJtYEOqlOgpWXPr0btQm53zA==
X-Received: by 2002:a17:902:aa06:b029:d8:bc5b:612b with SMTP id
 be6-20020a170902aa06b02900d8bc5b612bmr11098632plb.50.1605827634028; 
 Thu, 19 Nov 2020 15:13:54 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id s6sm1100077pfh.9.2020.11.19.15.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:13:53 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc: Only include kup-radix.h for 64-bit Book3S
Date: Fri, 20 Nov 2020 10:13:30 +1100
Message-Id: <20201119231333.361771-5-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119231333.361771-1-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

In kup.h we currently include kup-radix.h for all 64-bit builds, which
includes Book3S and Book3E. The latter doesn't make sense, Book3E
never uses the Radix MMU.

This has worked up until now, but almost by accident, and the recent
uaccess flush changes introduced a build breakage on Book3E because of
the bad structure of the code.

So disentangle things so that we only use kup-radix.h for Book3S. This
requires some more stubs in kup.h and fixing an include in
syscall_64.c.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h |  4 ++--
 arch/powerpc/include/asm/kup.h                 | 11 ++++++++---
 arch/powerpc/kernel/syscall_64.c               |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 97c2394e7dea..28716e2f13e3 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -27,6 +27,7 @@
 #endif
 .endm
 
+#ifdef CONFIG_PPC_KUAP
 .macro kuap_check_amr gpr1, gpr2
 #ifdef CONFIG_PPC_KUAP_DEBUG
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
@@ -38,6 +39,7 @@
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
 #endif
 .endm
+#endif
 
 .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
 #ifdef CONFIG_PPC_KUAP
@@ -148,8 +150,6 @@ static inline unsigned long kuap_get_and_check_amr(void)
 	return 0UL;
 }
 
-static inline void kuap_check_amr(void) { }
-
 static inline unsigned long get_kuap(void)
 {
 	return AMR_KUAP_BLOCKED;
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 0f5c606ae057..0d93331d0fab 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -14,7 +14,7 @@
 #define KUAP_CURRENT_WRITE	8
 #define KUAP_CURRENT		(KUAP_CURRENT_READ | KUAP_CURRENT_WRITE)
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/kup-radix.h>
 #endif
 #ifdef CONFIG_PPC_8xx
@@ -35,6 +35,9 @@
 .macro kuap_check	current, gpr
 .endm
 
+.macro kuap_check_amr	gpr1, gpr2
+.endm
+
 #endif
 
 #else /* !__ASSEMBLY__ */
@@ -60,19 +63,21 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return false;
 }
 
+static inline void kuap_check_amr(void) { }
+
 /*
  * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
  * the L1D cache after user accesses. Only include the empty stubs for other
  * platforms.
  */
-#ifndef CONFIG_PPC64
+#ifndef CONFIG_PPC_BOOK3S_64
 static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir) { }
 static inline void prevent_user_access(void __user *to, const void __user *from,
 				       unsigned long size, unsigned long dir) { }
 static inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static inline void restore_user_access(unsigned long flags) { }
-#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 8e50818aa50b..310bcd768cd5 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -2,7 +2,7 @@
 
 #include <linux/err.h>
 #include <asm/asm-prototypes.h>
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/kup.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
 #include <asm/kprobes.h>
-- 
2.25.1

