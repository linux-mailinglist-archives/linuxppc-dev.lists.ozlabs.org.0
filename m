Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F309B4DFF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:09:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRYs4cN0zDq6J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="DkdKsOA9"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGw3G45zDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:24 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a186so2925704pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NePqvJdFkV+QQSFL654jH89dA/hc/y76jv2lyqdkRq8=;
 b=DkdKsOA9fXiODxUA1Ns+qhxyh65c5FdrVh6h4iA+c9Ds8MgDB2bFWKCr5F8NFPeBLD
 /OtAs/kBtZoZQpvcw2cElWXy1qWJ4U1+8CiMFj59bqSpAa2CqjKZp1Sb9n0M0fNlEcYd
 0UA0KbbkDAif8PTNUV0cqHgo1kbEQEGAO45xrehHE7Ow/R+lTYccdB5C09lbTOHAWyzd
 UNM45wUuMDLzt/vMvS58xVptSEl880UG68L8HKFyq+jL+yfnROcq9R87xJ2zHDEcR6tb
 abqJXpCT70euZkGrGzARBQYt43yELLAYmY53pfqqC0Wx4XM2cQ2g1vSmOr7tIbUg8UfL
 m81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NePqvJdFkV+QQSFL654jH89dA/hc/y76jv2lyqdkRq8=;
 b=g8hqnKsDspdK2SEHVqy+VWwI0ZB5isEKrRuLwnBOPAJXUd0IpzkjiO68cXtCsM86x6
 7I5X/iessUSaGvO3NOs3tPPheYPxL/TZIewsOifQDIRldH+/hbARi805wTIc9pmZNYyi
 NhSEF7r5oDymE8otiDmTBO9iTgPZ8ygXKysG6t9142+N98lwJwsGKlFgObS8G7/SXIYy
 3Hxe024ToUawv6PyNOE9Dmac7pbZxbJc91Xduel+5Z+dD+QbRNDgUYxHTfYo4C6vnHQ4
 TBni3ZmKuOO981y7wggyQGCC5Z670DoUq/0cp4feJLnetWgYW925t+69Hhqog/sDuJta
 s+4w==
X-Gm-Message-State: APjAAAUdZpGyPpW3ptmlwY1avFrpFfhrE14APDnAZ5G+PI/BOqRC0mXI
 rCc8sXiU4mQ3THJxsID+uMdVM3AvM3s3ZQ==
X-Google-Smtp-Source: APXvYqzQIRNGfU5HWafg6/V73ae294ImorAV9VkY1jH4ve8AsmQy0LOk0ZSQNhnKtmdSIoEJwkKcIg==
X-Received: by 2002:a17:90a:8a8e:: with SMTP id
 x14mr3784134pjn.103.1561092982309; 
 Thu, 20 Jun 2019 21:56:22 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:21 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 06/13] powerpc/mce: Do not process notifier-handled UE events
Date: Fri, 21 Jun 2019 10:25:48 +0530
Message-Id: <08981aac7984f7c6c4340d5ecf97924d57e47ace.1561020760.git.santosh@fossix.org>
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
 arch/powerpc/include/asm/mce.h | 3 ++-
 arch/powerpc/kernel/mce.c      | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 948bef579086..240dd1fdfe35 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -122,7 +122,8 @@ struct machine_check_event {
 			enum MCE_UeErrorType ue_error_type:8;
 			u8		effective_address_provided;
 			u8		physical_address_provided;
-			u8		reserved_1[5];
+			u8		process_event;
+			u8		reserved_1[4];
 			u64		effective_address;
 			u64		physical_address;
 			u8		reserved_2[8];
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 912efe58e0b1..2616f1f71734 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -157,6 +157,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
 		}
+
+		mce->u.ue_error.process_event = true;
 	}
 	return;
 }
@@ -241,6 +243,10 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
+	if (evt.error_type == MCE_ERROR_TYPE_UE &&
+	    !evt.u.ue_error.process_event)
+		return;
+
 	index = __this_cpu_inc_return(mce_queue_count) - 1;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
@@ -660,6 +666,9 @@ long machine_check_notify(struct pt_regs *regs)
 
 	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 	if (rc & NOTIFY_STOP_MASK) {
+		if (evt->error_type == MCE_ERROR_TYPE_UE)
+			evt->u.ue_error.process_event = false;
+
 		evt->disposition = MCE_DISPOSITION_RECOVERED;
 		regs->msr |= MSR_RI;
 
-- 
2.20.1

