Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF15C8C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:25:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCPG4DswzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="dRzJgqeU"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCH85PwZzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:04 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b7so8515970pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxNeZ5n8GD9oBiBsiXo4KrAZsRCItyrNkSZWmT1qLSc=;
 b=dRzJgqeUSMNPMlr5D/Zz85r4eHzuFvVMzeopJbFrKQREHlXF9dNLLLfvkdDMRnSj6B
 pp5PfChXdaJV1HeyN10sM3+zndZavkGHRRSeGXl2y5qP53Z7oBPant4l746zekZpwZjd
 lNwl+uei8Y2LvzuipkTlkfU+peqGP/FKXx85CAVppX4etAorKrKnYDJgipZG8tfuiWgY
 MhFCsRVbgAPgsSd3llvHdgoSpC1Jypie9BwBraOmC0tYIMYAOvozlMmZwtgTvUj4F46O
 lnr3z/n22UrYnboZFpbcd2OogRv5gvByLd3iSMcE+1GniqoS/GNO/gypYOR2rnfBO2Ow
 TdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxNeZ5n8GD9oBiBsiXo4KrAZsRCItyrNkSZWmT1qLSc=;
 b=Fo3zsmyXTk+9SCbVojIjSZ5wFQX6c2YM48PWep9TpI93nrBdCgS6O8IjgJv2eJQjHD
 2JT72HusTo2czCWOImXcfo3JPtrpDiCJFUhrYaLpGFicET6M0QED8X2LvbIk6gB3o+x+
 43GgJDW0isfcGThWA5AtKstMQRf80F2bO+UigUg2p/JPlHXhIShxSXdCKRRzZdYEZwUb
 p4GDAXM0s25SfHjjmNC55408IQil9tUr5Fcw6xAKKJUC3cYvktWYIBl18rOuwm4nRvbT
 upzhA4pY9/xOu+u53hF9rUjzhQBMm+0zBmRwGOU2TaKV3iRvlP0Oq7jDwsDFcacP3yzC
 2M+Q==
X-Gm-Message-State: APjAAAVwoDtFni6sQZKqdwNOYuaGPRPSPHhpZG+hMaAyS9jF7SWsq1k2
 rWazCe3lzoe+WGcl3LfqlFYjkIdMtuQBVQ==
X-Google-Smtp-Source: APXvYqyU+UqIeiEjw8iDrepg3r2P6SsQ5Y5aV8VD9W8jCiNFQkO/f6JBRE0HCjqS0bysEZGubQg2Uw==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr33981548plk.14.1562044802733; 
 Mon, 01 Jul 2019 22:20:02 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:02 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 06/12] powerpc/mce: Add fixup address to UE events
Date: Tue,  2 Jul 2019 10:49:26 +0530
Message-Id: <20190702051932.511-7-santosh@fossix.org>
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

If the instruction causing a UE has an exception table entry with fixup
address, save it in the machine_check_event struct.

If a machine check notifier callback returns NOTIFY_STOP to indicate it
has handled the error, set nip to continue execution from the fixup
address.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/include/asm/mce.h |  5 +++--
 arch/powerpc/kernel/mce.c      | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 240dd1fdfe35..9d9661747adf 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -122,11 +122,12 @@ struct machine_check_event {
 			enum MCE_UeErrorType ue_error_type:8;
 			u8		effective_address_provided;
 			u8		physical_address_provided;
+			u8		fixup_address_provided;
 			u8		process_event;
-			u8		reserved_1[4];
+			u8		reserved_1[3];
 			u64		effective_address;
 			u64		physical_address;
-			u8		reserved_2[8];
+			u64		fixup_address;
 		} ue_error;
 
 		struct {
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 4a37928ab30e..0233c0ee45ab 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -15,10 +15,12 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/irq_work.h>
+#include <linux/extable.h>
 
 #include <asm/machdep.h>
 #include <asm/mce.h>
 #include <asm/nmi.h>
+#include <asm/extable.h>
 
 static DEFINE_PER_CPU(int, mce_nest_count);
 static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT], mce_event);
@@ -151,6 +153,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		mce->u.link_error.effective_address_provided = true;
 		mce->u.link_error.effective_address = addr;
 	} else if (mce->error_type == MCE_ERROR_TYPE_UE) {
+		const struct exception_table_entry *entry;
+
 		mce->u.ue_error.effective_address_provided = true;
 		mce->u.ue_error.effective_address = addr;
 		if (phys_addr != ULONG_MAX) {
@@ -158,6 +162,12 @@ void save_mce_event(struct pt_regs *regs, long handled,
 			mce->u.ue_error.physical_address = phys_addr;
 		}
 
+		entry = search_exception_tables(regs->nip);
+		if (entry) {
+			mce->u.ue_error.fixup_address_provided = true;
+			mce->u.ue_error.fixup_address = extable_fixup(entry);
+		}
+
 		mce->u.ue_error.process_event = true;
 	}
 	return;
@@ -666,8 +676,12 @@ long machine_check_notify(struct pt_regs *regs)
 
 	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 	if (rc & NOTIFY_STOP_MASK) {
-		if (evt->error_type == MCE_ERROR_TYPE_UE)
+		if (evt->error_type == MCE_ERROR_TYPE_UE) {
+			if (evt->u.ue_error.fixup_address_provided)
+				regs->nip = evt->u.ue_error.fixup_address;
+
 			evt->u.ue_error.process_event = false;
+		}
 
 		if ((rc & NOTIFY_STOP_MASK) && (regs->msr & MSR_RI))
 			evt->disposition = MCE_DISPOSITION_RECOVERED;
-- 
2.20.1

