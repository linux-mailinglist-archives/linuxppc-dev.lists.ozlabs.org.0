Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE015A046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 05:52:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HS1445SSzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 15:52:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=n6PgVM4f; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HRz55XxZzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 15:50:25 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id e9so329944pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 20:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oVPvQYZ57JSkGJKBEtm8Vi5/NLPdNTgXIEbFWeOrRU=;
 b=n6PgVM4fCmQYjv9krDgVCuJcW0ipp3KCnktWO33+mxf3VLbEioZCXAWMlV9M+6yrHF
 lv3MDlmPGN6BO2DC++139K8lYJhAlP5NS6flJeh3KWsXg6k1hYYqNyYcBg4SCxJzEsDz
 QeaU0BQtHp2md0cJZTsKCCw3cdL/0n1RFPgRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oVPvQYZ57JSkGJKBEtm8Vi5/NLPdNTgXIEbFWeOrRU=;
 b=jaXW66dweP4Njgo49YS1Pe5PwPL8Z2aBBJpQXZFrZ9D2H58FZYspzn97QryWx1p3Eh
 FVThYVnsZAhcZ98E8wrfo44bwFdM/f20YRBWcuV9aUlasdFWvY91JNl3lad0OrMBeHvz
 DcUqtSFHj+h+DcDvmsjNn6cR+GZ7QxvNniYPL/q3fYs1YXVVxRsUX9XzVWe8QY2y4GPG
 ZWc/wCd1YeTb8GBoVl4iVdzvLn1IlRrRLAFyz9bd01SPJzpKIa6xchmUBS7yOaxiLVZ3
 pBTI4CyRUtX7tFq+kDFMSL6P67Kcb+Umr49a1MHIcschIfdUzCSS6W6UsUzBhrYxOxhA
 PqJA==
X-Gm-Message-State: APjAAAUgsEOK31JuyAd9soQMPnWuGZHN6joos43KZZpDlH6gtUCabewA
 Cz3iOVCaTBS0j7rNCoGGnWRwZgZxO8g=
X-Google-Smtp-Source: APXvYqwalH2M2BbZ8kkG363MMYIRki3NkQLSdxybD+zQ3Eixc4w7J0934Q633QKOvVXZyooLSZvwKg==
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr6394143pls.92.1581483021337; 
 Tue, 11 Feb 2020 20:50:21 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id x4sm6039430pff.143.2020.02.11.20.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 20:50:20 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: setup_64: hack around kcov + devicetree limitations
Date: Wed, 12 Feb 2020 15:50:14 +1100
Message-Id: <20200212045014.1678-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: ajd@linux.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
kernel/kcov.c. The compiler inserts these hooks into every basic block
unless kcov is disabled for that file.

We then have a deep call-chain:
 - __sanitizer_cov_trace_pc calls to check_kcov_mode()
 - check_kcov_mode() (kernel/kcov.c) calls in_task()
 - in_task() (include/linux/preempt.h) calls preempt_count().
 - preempt_count() (include/asm-generic/preempt.h) calls
     current_thread_info()
 - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
     (include/linux/thread_info.h) is defined to 'current'
 - current (arch/powerpc/include/asm/current.h) is defined to
     get_current().
 - get_current (same file) loads an offset of r13.
 - arch/powerpc/include/asm/paca.h makes r13 a register variable
     called local_paca - it is the PACA for the current CPU, so
     this has the effect of loading the current task from PACA.
 - get_current returns the current task from PACA,
 - current_thread_info returns the task cast to a thread_info
 - preempt_count dereferences the thread_info to load preempt_count
 - that value is used by in_task and so on up the chain

The problem is:

 - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c

 - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
   which should definitely have instrumentation enabled.

 - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.

 - It's not clear that we can move PACA setup before dt_cpu_ftrs_init as
   the PACA setup refers to CPU features - setup_paca() looks at
   early_cpu_has_feature(CPU_FTR_HVMODE)

 - If we don't set up a paca, r13 will contain unpredictable data.

 - In a zImage compiled with kcov and KASAN, we see r13 containing a value
   that leads to dereferencing invalid memory (something like
   912a72603d420015).

 - Weirdly, the same kernel as a vmlinux loaded directly by qemu does not
   crash. Investigating with gdb, it seems that in the vmlinux boot case,
   r13 is near enough to zero that we just happen to be able to read that
   part of memory (we're operating with translation off at this point) and
   the current pointer also happens to land in readable memory and
   everything just works.

There's no generic kill switch for kcov (as far as I can tell), and we
don't want to have to turn off instrumentation in the generic dt parsing
code (which lives outside arch/powerpc/) just because we don't have a real
paca or task yet.

So: create a fake task and preload it into our fake PACA. Load the paca
just into r13 (local_paca) before we call into dt_cpu_ftrs_init. This fake
task persists just for the first part of the setup process before we set
up the real PACAs.

Translations get switched on once we leave early_setup, so I think we'd
already catch any other cases where the PACA or task aren't set up.

Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

I haven't made the setup conditional on kcov being compiled in, but I
guess I could if we think it's worth it?
---
 arch/powerpc/kernel/setup_64.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..26f1b8539f8e 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -281,7 +281,18 @@ void __init record_spr_defaults(void)
 
 void __init early_setup(unsigned long dt_ptr)
 {
-	static __initdata struct paca_struct boot_paca;
+	/*
+	 * We need to get something valid into local_paca/r13 asap if we
+	 * are using kcov. dt_cpu_ftrs_init will call coverage-enabled code
+	 * in the generic dt library, and that will try to call in_task().
+	 * We need a minimal paca that at least provides a valid __current.
+	 * We can't use the usual initialise/setup/fixup path as that relies
+	 * on a CPU feature.
+	 */
+	static __initdata struct task_struct task = {};
+	static __initdata struct paca_struct boot_paca = { .__current = &task };
+
+	local_paca = &boot_paca;
 
 	/* -------- printk is _NOT_ safe to use here ! ------- */
 
-- 
2.20.1

