Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E15C96A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:38:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dF241LhNzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="NJweHnYS"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCGy3vprzDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:19:54 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id b7so8515780pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGnUeOD9q4vdMF4DDLffBmI8X+bOtxV4zPtktuX2RWM=;
 b=NJweHnYSIJq0SALdEp1MHA7qgiorGjdQflvjVrvtUcDvTzBx7EGXprCrdujLBdNM70
 cPUyXs3lVbcrk8q+gYgTfvq+TH+0jZrI2A0OAUmkN5hJDllmWF9d04XuQ+0oyddEBnbP
 zIcJ8o5aJ7MiOG9Oh+71CeF/cDRoh6EkD7d09cp+oNH5tn5ckM9v7hOGDXeg23vizJiN
 oekYkcAfFseqtoiqLkcZvhqQ5QPV8ITJDqCq2B7AJ8mfm4mucjQLBOmfjync+HER94Nm
 s0eJLU4fs5b4kYO2g8UAh/11hFFV5V2MtAy7qSLRUiPzujBEDG6hoAG3yYdcTj8JvNgn
 0nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGnUeOD9q4vdMF4DDLffBmI8X+bOtxV4zPtktuX2RWM=;
 b=YRtug/fHBV2EC1vtae8AinCxtmbedmpFjC5nReupwRgTUbGXCVX+Pg8zpVU5BYCHak
 n+nH872s+6KT5cbkOY9j10T4S3s4fCT0hXCDw/F13/9hzq4bxUa4C/4SrivCggMBsM06
 OM/rjYpw8qNVwPdEpmZGUM2IfIwk8yLIeecB9ptQHJOQRsXAeg4FRV22O4u0ZNgtRY1F
 6eUzr0r6e4wPyieYp07yM6Y/DzjIilmyPEd6dyQNryAgUA5hB4VZYMUp1bHhvqTFS5+F
 WDi4O0G0+VZSN5jsd9+1A8CR+rpB+ZwGLivilqZMJi8GwSOnkQcWLnPX+ySa5bZ5ty3K
 jolw==
X-Gm-Message-State: APjAAAXgb0PyPr+rZudr/R8a4YwPaDXRtAw+ckxQXQ9tRmEP1Qt0VRCb
 kbeU87Z6JAZUPXBdPzslKSH7e4wN2Nr7lg==
X-Google-Smtp-Source: APXvYqwQtc+D6UgmbzkRLzocEyL+HaYjS/NpkAZcsImE375e5hZz0yWqyiL4k8b0kzbzJqGkSaZqOw==
X-Received: by 2002:a17:902:29a7:: with SMTP id
 h36mr33957559plb.158.1562044792613; 
 Mon, 01 Jul 2019 22:19:52 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:52 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 03/12] powerpc/mce: Add MCE notification chain
Date: Tue,  2 Jul 2019 10:49:23 +0530
Message-Id: <20190702051932.511-4-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/include/asm/mce.h            |  4 ++++
 arch/powerpc/kernel/exceptions-64s.S      |  4 ++++
 arch/powerpc/kernel/mce.c                 | 22 ++++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index ec1c97a8e8cb..f66f26ef3ce0 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -72,6 +72,7 @@ void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
 long do_slb_fault(struct pt_regs *regs, unsigned long ea);
 void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
+void machine_check_notify(struct pt_regs *regs);
 
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 94888a7025b3..948bef579086 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -214,4 +214,8 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr,
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
+
+int mce_register_notifier(struct notifier_block *nb);
+int mce_unregister_notifier(struct notifier_block *nb);
+
 #endif /* __ASM_PPC64_MCE_H__ */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6b86055e5251..2e56014fca21 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -457,6 +457,10 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
+
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	machine_check_notify
+
 	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
 	b	4f
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index e78c4f18ea0a..24d350a934e4 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -42,6 +42,18 @@ static struct irq_work mce_event_process_work = {
 
 DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
+static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
+
+int mce_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&mce_notifier_list, nb);
+}
+
+int mce_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
+}
+
 static void mce_set_error_info(struct machine_check_event *mce,
 			       struct mce_error_info *mce_err)
 {
@@ -635,3 +647,13 @@ long hmi_exception_realmode(struct pt_regs *regs)
 
 	return 1;
 }
+
+void machine_check_notify(struct pt_regs *regs)
+{
+	struct machine_check_event evt;
+
+	if (!get_mce_event(&evt, MCE_EVENT_DONTRELEASE))
+		return;
+
+	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
+}
-- 
2.20.1

