Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A88CE64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 10:28:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467jR10xdnzDqq3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 18:28:45 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="fFQfyfx1"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467jLs2M9mzDqhN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 18:25:07 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o13so52700063pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq56//6HrDlZTmG7xZZ0OM/lUfEFS8TPmLJ3glb0ZRc=;
 b=fFQfyfx1gvuLaz66mbXw10c/uuVHFxyNn6exq/4+mQWe5xXpgNgzlzU6G54J+uuTrG
 QlM0yD9S1zaz/HR3gZAyZy6OZTrPXpQUqsIB92ENbP7RXfLlxiz4JOvoh+sOR/V+dGcs
 m/QguiRd0Z/JelMhmX4oP3RFIlEgG2TByOEyfZ4vQ5VwnD305f9goK7Nu2j+nFCEiJO6
 6qUi5tRL+LYm7+REnj/1OZF/c1evO1TG3r+BkS+YMx36VFv1Wrnk+CGs3qtfKsFLUILK
 2pDI7q8uqghr6KtIS4AfPZzkeOobys+8o0M5dZ5h85rgHkDvG+BleLs32d1eBpfhgEHu
 Y8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qq56//6HrDlZTmG7xZZ0OM/lUfEFS8TPmLJ3glb0ZRc=;
 b=hm9i0ifbC5MQ9uQWyq+mDgHcZ4lZLq8Vv+U0jmTkZjx89i/gQzBoc7uZM1OYxhK3Ap
 rCoYeC2X2KWhVzZbhRb7PFbKwFYAHoay8n/rmKmly89ZV2hfeweGCZtBEBvwNyNAcf9k
 /anEj2/K+RJd85V60GDWKViMQi87zmyhnChD9WTYqkMac3UMfD5gyL/WPqDTSf0luarL
 sC74jYksoT7cURQplOh0GDwouliiLR/p28JlFaQfQHvE2XOGMFTXGlTYLXRRHPkXA+QL
 rBc6/AeOoYgGypohAFJ5bbCn/gQGbIHMElbpgyDpZ6AUW0C8atlW+bBYcOe8sGWN4Kj0
 O4Sg==
X-Gm-Message-State: APjAAAW2v/a5C/hyzPxVRVzRlrnbO+91wrmf5kj71G8/E/2REA4y6yQB
 jxnOGVzlaQKqfZOvDiYBL3F57qVuycI=
X-Google-Smtp-Source: APXvYqwEWgaClvN//YnT2jkTQOVdoTo5R0kzpXwDBlL/hNilPUcnXbp2vyTk4i5KtZBt95Yyjg0pUw==
X-Received: by 2002:a65:680b:: with SMTP id l11mr38042168pgt.35.1565771105626; 
 Wed, 14 Aug 2019 01:25:05 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.76])
 by smtp.gmail.com with ESMTPSA id y194sm124672463pfg.116.2019.08.14.01.25.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 01:25:05 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc/mce: Add MCE notification chain
Date: Wed, 14 Aug 2019 13:54:50 +0530
Message-Id: <20190814082452.28013-2-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814082452.28013-1-santosh@fossix.org>
References: <20190814082452.28013-1-santosh@fossix.org>
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
 Oliver O'Halloran <oohall@gmail.com>, Chandan Rajendra <chandan@linux.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is needed to report bad blocks for persistent memory.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/include/asm/mce.h |  3 +++
 arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index e1931c8c2743..b1c6363f924c 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -212,6 +212,9 @@ extern void machine_check_queue_event(void);
 extern void machine_check_print_event_info(struct machine_check_event *evt,
 					   bool user_mode, bool in_guest);
 unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr);
+int mce_register_notifier(struct notifier_block *nb);
+int mce_unregister_notifier(struct notifier_block *nb);
+
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index ec4b3e1087be..a78210ca6cd9 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -47,6 +47,20 @@ static struct irq_work mce_ue_event_irq_work = {
 
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
@@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	while (__this_cpu_read(mce_ue_count) > 0) {
 		index = __this_cpu_read(mce_ue_count) - 1;
 		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
 		 * This should probably queued elsewhere, but
-- 
2.21.0

