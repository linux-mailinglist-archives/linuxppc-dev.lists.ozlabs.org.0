Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47221A148
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:54:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2d2X0yvdzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 23:54:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JdDpWzWO; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2d0B3F0pzDr61
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:52:24 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id ch3so1140992pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuZPoF/r4jPZYWYeI7FBUN3HTNwHOIFkOV1RM88dEtM=;
 b=JdDpWzWOd1F6f0axNZfD5fg2bWmmGBqQLd1gOTLif/88PNofEpCIem/TZx9mJP8ojn
 hfSAsDBrVZm4zKnF3N/MKculs0G1hHJjmsXASgxkzvbbhz7NuddkV1oIfMM+6DkxyiMA
 /swXEdbYDr4XXIDC+QlDcqIJ+Ot7Y31Sh0abV3krcR08g715R+EVIAEsjcwAt5v+GFil
 kVpDuz0iJQfxChOIHv4k8vJOHlo1WWRPsUD0r82pKR0qG7vfSzLipEKR2EuHd5TJtlpD
 HvNl5YUZ9zbUmsTNH4utyqYfS0+wfkmbio1XU+Q+nCafpvwsyP3kvQiSFMSmuFpjmBoN
 gl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuZPoF/r4jPZYWYeI7FBUN3HTNwHOIFkOV1RM88dEtM=;
 b=HoIpFJFMv3XbR2lML1vP6WjzgEZvnfs3Uirv3LUdubLe9nqwGRYv/FuqYZHlmj1ht4
 psXMwvi69TmySojC4ejVBrH9pTGvDPFC7GNvIxjlGi7T9sq/m7ughCUn9rv6Gn4ry52a
 u3dWEkOBOA/69qoN1jS9jpmAse9sXxtNlD50Y+ve8+DmEzOY5gBgbgkaZltdvGWfgA6w
 tVVIoeABFItQz910oy8p0CQSXWSzpF9mM8BIKTunvnoMU8Rg2+ww+OsnPmv3MIFFUas7
 qNb2z7JLJ6S4SvNq1/eMNaaVB37EuXt6Tc8IUDg4cCy20ZbHUzPsBwsaVlB6yOzxnI42
 gl3w==
X-Gm-Message-State: AOAM533uXRRehlPKHRv7STGjwJStkR5Jql3sFKPargebyFFw9qBxBarZ
 +iWipxKYdMIsRTsZo2FxSliPRdFWgAQ=
X-Google-Smtp-Source: ABdhPJyxdVSG01dqpA14wolnJEuPe2iW5/e/p5mLgQ69qaXaQ1x3HzFnqAyfFSjzDYGxSfDBQmaooA==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr98670pjq.1.1594302739984; 
 Thu, 09 Jul 2020 06:52:19 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id k100sm2878813pjb.57.2020.07.09.06.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 06:52:19 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 1/2] powerpc/mce: Add MCE notification chain
Date: Thu,  9 Jul 2020 19:21:41 +0530
Message-Id: <20200709135142.721504-1-santosh@fossix.org>
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
Cc: Oliver <oohall@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce notification chain which lets us know about uncorrected memory
errors(UE). This would help prospective users in pmem or nvdimm subsystem
to track bad blocks for better handling of persistent memory allocations.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/mce.h |  2 ++
 arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

v2: Address comments from Christophe.

RESEND: Sending the two patches together so the dependencies are clear. The
earlier patch reviews are here [1]; rebase the patches on top on 5.8-rc4

[1]: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 376a395daf329..7bdd0cd4f2de0 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -220,6 +220,8 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+int mce_register_notifier(struct notifier_block *nb);
+int mce_unregister_notifier(struct notifier_block *nb);
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

