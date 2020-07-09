Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929D219A50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2T883FfTzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=La7p13Vu; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2T6S68Q6zDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 17:57:17 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u5so671052pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEmXy37JEicN4cTKZRbkE2IyXPs68CLYpwQcLHTwX/Y=;
 b=La7p13VuMSIH4upoGUYximCk251sUMp4QVkgl9Qu/uOgNvgBSQMBJCmC/UvMIR9LK6
 kXVyRbNm8BylRwUWYE1s5RbSvgT4eoSy0wF+yfUoElPmryzkVgQEVyclQekJQK4I8FvV
 I2KuxeAd2f5v7V/pntQe+WpFoTecqzb82tRiQJCUpRjbhUWTg38XgGZCBk+kxdelKt3b
 kDbvRk6ui8GeqHekONP6BKeQiONY01NMNMqe+e2MP3sRKH0g9Ed1GC1BLLPJSK8szR9J
 P8CWx+InqyxMZcTV6lchXVEv39Y0Raw0WTfKdj+3Mo/xotB6Q7lP8nQNLdQv3p9i8fvE
 tMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEmXy37JEicN4cTKZRbkE2IyXPs68CLYpwQcLHTwX/Y=;
 b=JWPY9bxG9dyHXAb6x6QkD6abvpyqE2z+auKV6B+tY9iqAk5PmTj7SVeXVcOgco4Y9N
 YOhLFvDp2UmS66qmFgfJ2LGH5ZuBTNe0VWAiQa/41KnSb94KvwxXtmQsR384eXNJtQih
 RJeDIV3VxLo8Vd8UdO4FPTPyFTOCBMajgykxpo+uu977yN3AKREGGyoZ95ELkM1aKjjb
 lpVrdDr5i7cg2LVJGs0ox6ram87Fzjjm0SjeZ7UircvWhAqqss2eTPmWXDnKrUiuluI9
 l2lTRlEzTnLGUZK0UxSYJkK2qigGPxHv90rAVIyTozC5sZfrq/VNuAkgC+MW5lRaS1rn
 nwaA==
X-Gm-Message-State: AOAM533/aItn4xFeTHtCqx9BmCzlc+3myiw15Ib77xJtdBHa1UtSUc6i
 FIOwt/C1rzB9XM0ybOf6rK3F0j+YLaxoVA==
X-Google-Smtp-Source: ABdhPJzXuK60bjoq4kZPkVf8k3+VvzNcDHm+js+s2yQzuw4inRbe57vn2h27Gvskpy/7wjlgb7AQ1w==
X-Received: by 2002:a62:82ce:: with SMTP id
 w197mr23002877pfd.322.1594281433387; 
 Thu, 09 Jul 2020 00:57:13 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id l22sm1635744pjq.20.2020.07.09.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 00:57:12 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RESEND 1/2] powerpc/mce: Add MCE notification chain
Date: Thu,  9 Jul 2020 13:26:34 +0530
Message-Id: <20200709075635.643740-1-santosh@fossix.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce notification chain which lets know about uncorrected memory
errors(UE). This would help prospective users in pmem or nvdimm subsystem
to track bad blocks for better handling of persistent memory allocations.

Signed-off-by: Santosh S <santosh@fossix.org>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/mce.h |  2 ++
 arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

Send the two patches together, so the dependencies are clear. The earlier patch reviews are
here: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/

Rebase the patches on top on 5.8-rc4

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 376a395daf329..a57b0772702a9 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -220,6 +220,8 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+extern int mce_register_notifier(struct notifier_block *nb);
+extern int mce_unregister_notifier(struct notifier_block *nb);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd90c0eda2290..b7b3ed4e61937 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -49,6 +49,20 @@ static struct irq_work mce_ue_event_irq_work = {
 
 DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
+static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
+
+int mce_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&mce_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(mce_register_notifier);
+
+int mce_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(mce_unregister_notifier);
+
 static void mce_set_error_info(struct machine_check_event *mce,
 			       struct mce_error_info *mce_err)
 {
@@ -278,6 +292,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	while (__this_cpu_read(mce_ue_count) > 0) {
 		index = __this_cpu_read(mce_ue_count) - 1;
 		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
 		 * This should probably queued elsewhere, but
-- 
2.26.2

