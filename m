Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A14DFF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:16:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRjp1Fy3zDqL4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:16:14 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="bVPBsxwI"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRH60WzhzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:33 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id cl9so2362193plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8U1R5t8nvePR8btUge41SYPUOrbrhEhFKqqrv/yEcDA=;
 b=bVPBsxwInGp7oWOQHFEQYyYATpkAuvbXiZaSZbivQXndiFbNm5PETPe6JvcR0jtKW0
 MfRO2LeN7V98BMbYK2RoEYk8AhWDcS17ksNp/kkAPwkPgalRmVyAIKRcgcLNOWJaL+gu
 L9LOq9oAX0hEnomtJTzyFZvOxvOFx7oF6l8oXDsqcIuuW7J3psSYCB7X15hQWrtvk5P2
 N1QzpIX4v3GKsPBe9ekfurR3jNN18owAeBw11V1M26p3KNdkSST0IPIll+rCZKu56l8y
 RbwYdvpGKm44h4ZvlZBrIsunFne8uxTnkStnTEsYxCDzNOKcW+prbGsTftL9ReMSlYS6
 8dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8U1R5t8nvePR8btUge41SYPUOrbrhEhFKqqrv/yEcDA=;
 b=kkVYsZZStJ0Ye/KU5yHSfktnSBK1DIrCjhsIAIxoyf3tb/vPW51s9vlHM2hpxj91nu
 3yN6PfS4tZ+QyWyW53k5LUSSWoT9BCj4MqKSqwi15iNi9SXTaqRGqBQc0+Ya7RiU0YjN
 QmpODhzqTfw5HgFl64HdKjftVyKI/ep9SxWy2QurerbMcg6619OKhm2ORlmjZI0SG2ZU
 9EvamkqGT7UveXzq6rt2O6Rr3NbjGzpkz91pokmv7B93PjnIn5cNPqz3WR/zGo+psmks
 U4wtZca/WYMGqrTvFOi12mFEu/nK0ZJgT96aTqzQhE9/iaSJtOLRXOsqF42onKmZ1iki
 JpQQ==
X-Gm-Message-State: APjAAAUs8Ct+fSWxbziJJP2z6UfdsbKGfNJf9GLKlH4o7uQ0EoJYVA3s
 f41XTyrCjTcFzDqGbSwfp1sQ+1pXUzEZ0g==
X-Google-Smtp-Source: APXvYqzI8EBTNMWy6AXWQ/VH5vzO6f2ta62ntjOKZlB3XQRUuMLPvk3LDMhCAIleU9ai+7bAl3G8NQ==
X-Received: by 2002:a17:902:bb85:: with SMTP id
 m5mr11925833pls.280.1561092991357; 
 Thu, 20 Jun 2019 21:56:31 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:30 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 09/13] powerpc/mce: Handle memcpy_mcsafe()
Date: Fri, 21 Jun 2019 10:25:51 +0530
Message-Id: <763f8912ed1b3a8ea5b11da934f98a38b1b51fc9.1561020760.git.santosh@fossix.org>
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

Add an mce notifier intended to service memcpy_mcsafe().

The notifier uses this heuristic; if a UE occurs when accessing device
memory, and the faulting instruction had a fixup entry, the callback
will return NOTIFY_STOP.

This causes the notification mechanism to consider the MCE handled and
continue execution at the fixup address, which returns -EFAULT from the
memcpy_mcsafe() call.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 8afda1ab7358..9cb5a731377b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -56,6 +56,40 @@ int mce_unregister_notifier(struct notifier_block *nb)
 	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
 }
 
+static int check_memcpy_mcsafe(struct notifier_block *nb, unsigned long val,
+			       void *data)
+{
+	struct machine_check_event *evt = data;
+	unsigned long pfn;
+	struct page *page;
+
+	if (evt->error_type != MCE_ERROR_TYPE_UE ||
+	    !evt->u.ue_error.physical_address_provided)
+		return NOTIFY_DONE;
+
+	pfn = evt->u.ue_error.physical_address >> PAGE_SHIFT;
+	page = pfn_to_page(pfn);
+	if (!page)
+		return NOTIFY_DONE;
+
+	/* HMM and PMEM */
+	if (is_zone_device_page(page) && evt->u.ue_error.fixup_address_provided)
+		return NOTIFY_STOP;
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block memcpy_mcsafe_nb = {
+	.notifier_call = check_memcpy_mcsafe
+};
+
+static int __init mce_mcsafe_register(void)
+{
+	mce_register_notifier(&memcpy_mcsafe_nb);
+	return 0;
+}
+arch_initcall(mce_mcsafe_register);
+
 static void mce_set_error_info(struct machine_check_event *mce,
 			       struct mce_error_info *mce_err)
 {
-- 
2.20.1

