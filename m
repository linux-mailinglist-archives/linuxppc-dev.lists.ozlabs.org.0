Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD28E234
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:54:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4687Jq32v2zDr0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="PyXYUjjf"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4687085Wk7zDqyH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:24 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id e11so474432pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8D/mgYwB1cSDaJo6hqPv0wHPE/wolrDPlQIzqU0/Zw=;
 b=PyXYUjjfu/j92jamVXgn2nFS8ShzzsHWO8oRMP7HqCWBjvlMHRS5IyzRgLSWFXkLJm
 n40XyOEpOapDpzyEkVEOaGKFGwNnqPPQC1mGFIVGD7yN1i+ewISggkI/PmfnzjbRNsAh
 CJiqoMuJ4enAW74XJfo/Tj0uN/sEDM4VasvRmNzlMNLx9TvNUd3XPZ7WjeaZw1gH3rNE
 NVcv/DFCACYagxnlVTrYxBmxZDnOT3WLj5NImmmXMibzBU8l4d9JndDz/1OKoaKbs6zb
 M1uvGDOWJsawPRLDn/dpqK/C5g/O06nwqtJt8ds9HWESx7MLscuwuVsaCwu4G/H8l37Y
 XvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8D/mgYwB1cSDaJo6hqPv0wHPE/wolrDPlQIzqU0/Zw=;
 b=O8XIjEz7Axq5+oa82g1FZZMIS/+ENL4CN0LWVg31tkD1xqV0W9iBIznweLHAsPSh/w
 byAguv+fkGUJSHvhlJds0H54ae+W6XAFqtIIUgIKHmNMwN09UvmtSxj+wMWluB3fuB95
 0DpoZmuJnJQh7gkT0ibUrpT95CfIuLDSTbtrv6bujbV7PA7yD+iuhknKlhmPq8oHi2kT
 aQJInoqVqF9aBbNGPzCiarcZ9H2aoSsnRNiyVsYibaj1XfCeICFEpVt3VXHjlsm/FCMW
 sJh7AnPA98yeoUT9VNq0rxYq9X6H/FDqUpWd9P97nmOloz/fJ27q7ywoi/8SScwQlyw/
 saVg==
X-Gm-Message-State: APjAAAV1P1yq7JwVdSYCcxcVd6npSzwfD0ElFXOof8rlPTqjs+6UZiWP
 nkvYE5he9wSGpWe8GOzIVInKm0msu2YvJA==
X-Google-Smtp-Source: APXvYqxUltO7G+usJOiiLTfp+VI0nxechFoX7ANxlU8rqxgdCn43VIGKE91zBN+eFu3X5bcXfHReeQ==
X-Received: by 2002:aa7:8a0a:: with SMTP id m10mr2855361pfa.100.1565829621485; 
 Wed, 14 Aug 2019 17:40:21 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.40.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:40:20 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
Date: Thu, 15 Aug 2019 06:09:40 +0530
Message-Id: <20190815003941.18655-7-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815003941.18655-1-santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balbir Singh <bsingharora@gmail.com>

If we take a UE on one of the instructions with a fixup entry, set nip
to continue execution at the fixup entry. Stop processing the event
further or print it.

Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/mce.h  |  4 +++-
 arch/powerpc/kernel/mce.c       | 16 ++++++++++++++++
 arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index f3a6036b6bc0..e1931c8c2743 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -122,7 +122,8 @@ struct machine_check_event {
 			enum MCE_UeErrorType ue_error_type:8;
 			u8		effective_address_provided;
 			u8		physical_address_provided;
-			u8		reserved_1[5];
+			u8		ignore_event;
+			u8		reserved_1[4];
 			u64		effective_address;
 			u64		physical_address;
 			u8		reserved_2[8];
@@ -193,6 +194,7 @@ struct mce_error_info {
 	enum MCE_Initiator	initiator:8;
 	enum MCE_ErrorClass	error_class:8;
 	bool			sync_error;
+	bool			ignore_event;
 };
 
 #define MAX_MC_EVT	100
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index a3b122a685a5..ec4b3e1087be 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -149,6 +149,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
+			mce->u.ue_error.ignore_event = mce_err->ignore_event;
 			machine_check_ue_event(mce);
 		}
 	}
@@ -266,8 +267,17 @@ static void machine_process_ue_event(struct work_struct *work)
 		/*
 		 * This should probably queued elsewhere, but
 		 * oh! well
+		 *
+		 * Don't report this machine check because the caller has a
+		 * asked us to ignore the event, it has a fixup handler which
+		 * will do the appropriate error handling and reporting.
 		 */
 		if (evt->error_type == MCE_ERROR_TYPE_UE) {
+			if (evt->u.ue_error.ignore_event) {
+				__this_cpu_dec(mce_ue_count);
+				continue;
+			}
+
 			if (evt->u.ue_error.physical_address_provided) {
 				unsigned long pfn;
 
@@ -301,6 +311,12 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	while (__this_cpu_read(mce_queue_count) > 0) {
 		index = __this_cpu_read(mce_queue_count) - 1;
 		evt = this_cpu_ptr(&mce_event_queue[index]);
+
+		if (evt->error_type == MCE_ERROR_TYPE_UE &&
+		    evt->u.ue_error.ignore_event) {
+			__this_cpu_dec(mce_queue_count);
+			continue;
+		}
 		machine_check_print_event_info(evt, false, false);
 		__this_cpu_dec(mce_queue_count);
 	}
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index e74816f045f8..1dd87f6f5186 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 #include <linux/ptrace.h>
+#include <linux/extable.h>
 #include <asm/mmu.h>
 #include <asm/mce.h>
 #include <asm/machdep.h>
@@ -18,6 +19,7 @@
 #include <asm/pte-walk.h>
 #include <asm/sstep.h>
 #include <asm/exception-64s.h>
+#include <asm/extable.h>
 
 /*
  * Convert an address related to an mm to a physical address.
@@ -559,9 +561,18 @@ static int mce_handle_derror(struct pt_regs *regs,
 	return 0;
 }
 
-static long mce_handle_ue_error(struct pt_regs *regs)
+static long mce_handle_ue_error(struct pt_regs *regs,
+				struct mce_error_info *mce_err)
 {
 	long handled = 0;
+	const struct exception_table_entry *entry;
+
+	entry = search_kernel_exception_table(regs->nip);
+	if (entry) {
+		mce_err->ignore_event = true;
+		regs->nip = extable_fixup(entry);
+		return 1;
+	}
 
 	/*
 	 * On specific SCOM read via MMIO we may get a machine check
@@ -594,7 +605,7 @@ static long mce_handle_error(struct pt_regs *regs,
 				&phys_addr);
 
 	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
-		handled = mce_handle_ue_error(regs);
+		handled = mce_handle_ue_error(regs, &mce_err);
 
 	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
 
-- 
2.21.0

