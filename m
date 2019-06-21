Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA34DFEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:03:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRRK501NzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="dqBiBwND"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGl52TDzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:15 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k35so1099106pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGnUeOD9q4vdMF4DDLffBmI8X+bOtxV4zPtktuX2RWM=;
 b=dqBiBwND9fynWKPgjwn2/GYWZolOGE/jk0d54+FFxd+E0WLffItGTtNZ5/WTObhOkQ
 eAsQbtH2wWxrldFp8vDA5m/G1uBHNnWAO52UiiqKlWRMu/3QBZVTS+L5VBlmUU7VcYhY
 0w0w0wNv739pwpovc70tXRTsNHG1gXz25aovDLmsfUcbmkaTnMFpuRVFwsUm/AoimaoW
 OEPa9abwFfeYRa26c8VqpJOj8MzTVsigysc579H7kZIssIZ1ZtQVYfLGT0VKIBVVfD7y
 e6r5Wj61PHdf1idJiABVYg3B9nZs/yIWpp3jluoAaCMFaYGuNUeMveG8cvURYnkTM2tf
 /tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGnUeOD9q4vdMF4DDLffBmI8X+bOtxV4zPtktuX2RWM=;
 b=J8My49M/iHRJ7qlo6mdmYofhCJVf99MdVm7AItQwAWJ40yIfOR+1ByTBB2vYBcY8Qw
 4QMSnU2ArQ8r0tHRWonaB5orNfjSdKW7+zQgTK1WOk8paSK6sG104rHb3dCHFsneCMK4
 2+ERZCthrkRMOD5s7MvKRa8TNX5A297QA4sWXE0TlqJyYqFJv8WXNO7j5wwKYMCOYI0T
 Hiwf5uM8DtJ0XvwWjYjG9KOTl1zLTDW2mbKPD5QTa3qoXQX0l8pFAwxsJ4otvHYwBomR
 owpkJ5SU/BUxf+laNDayOf3okx/2L+1azWtLhlPt95bUMMtOK6i43UIHUfIUuSfHtyam
 CtGA==
X-Gm-Message-State: APjAAAUBhwwQq9JQ7hxFe9QmGB7RGDe4qB2+T0YVJ0fZkoCPJDLZmVra
 uTzKi3bXQgR4Wev8E6fIQpMeZ1so8iGxlg==
X-Google-Smtp-Source: APXvYqx0zaquldGj/1NHBqgnsLjw/3JON/IH2L2hMCTYIhhkSzX2kxDnFaANqZ4KoLY8cw+/feaCUg==
X-Received: by 2002:a63:292:: with SMTP id 140mr15858711pgc.88.1561092973029; 
 Thu, 20 Jun 2019 21:56:13 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:12 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 03/13] powerpc/mce: Add MCE notification chain
Date: Fri, 21 Jun 2019 10:25:45 +0530
Message-Id: <72d5b22c37195bb8cb666fffc6127bb4693a8488.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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

