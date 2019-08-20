Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A629F9549E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:50:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFfQ4NPczDrKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="qjEdBKJm"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFCK1S8XzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:30:53 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m12so1921035plt.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 19:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq56//6HrDlZTmG7xZZ0OM/lUfEFS8TPmLJ3glb0ZRc=;
 b=qjEdBKJmbmtTZXx7oBzvY7DP6okIr1jo+AjkYULZIyflg/uE8NBJsYKa8QnlJTeuVv
 hBx4Dl4CHXpuRxBjhtOiT19wbE3/qPeFpfhlqWfqBjXofhUCeSEZRuJS4BqSV8gUaNXW
 W0n9fqtxuigxJgrSPVCA/hqRozypPmWt2h27jFmtfwri9nEvTtHFMusFOaDTeNzgKuOs
 UloaOzaxu4Rxas0KEx1nr6s759Mgk7qhHl73qUANPbASElrjMKtqOrCvzAzjByL1n+AT
 S45y10a+4JdZE2NZ5tbNO8mszadmeOsKqhQj9sgfYmJKDVGsFC+ccsnJ3lZrNe9yB07C
 VXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qq56//6HrDlZTmG7xZZ0OM/lUfEFS8TPmLJ3glb0ZRc=;
 b=YCPN4BzkQbaxRYgIjHtOYvjlfGvvFX7E/IIf9SfNbZ5F9jIPmCdZ1DbooEg4Dixubk
 QdKfLS3qEAk6y0dlL4WFmsNnpvPgFUSNLA253S/yR6LTBAUndHG6T6C/kzjJMR+c4McU
 0SMJ7o3jg9X29Do3fXEYj0LBv/zN7+RDwB8XQ1CwTHeto72kFLEWwaBUaI4qoa6oUMOA
 5ACsRE6G+bHfCHIcRrYEP/yMR6yH+bSRYGyP31qpzlKlIGN61xulLg9V6jSLF6E7Cknr
 f9OeBu7klnu3cdP1LeYkNlhyThQe28v1Pi2UKjMfIctkq3dwgdmPf78tQyguvr9kR8d2
 YwoQ==
X-Gm-Message-State: APjAAAVI//0cdJn36qnlyOTHeA72EJ0p2ZamaXzARthqGQhbZuRRL1ad
 HYgBeqGzMJhqHdxRYR0XfNAhBy1ojio=
X-Google-Smtp-Source: APXvYqzZUPl5UjLLKgmmtmxXBI73at06n0V8a8zTl1JYpi9Xb6V20JPQWPhStSbRUPRZ2NEHDvt/jQ==
X-Received: by 2002:a17:902:e48d:: with SMTP id
 cj13mr3112391plb.177.1566268249082; 
 Mon, 19 Aug 2019 19:30:49 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id j15sm17609220pfr.146.2019.08.19.19.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 19:30:48 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc/mce: Add MCE notification chain
Date: Tue, 20 Aug 2019 08:00:28 +0530
Message-Id: <20190820023030.18232-2-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820023030.18232-1-santosh@fossix.org>
References: <20190820023030.18232-1-santosh@fossix.org>
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
Cc: Chandan Rajendra <chandan@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
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

