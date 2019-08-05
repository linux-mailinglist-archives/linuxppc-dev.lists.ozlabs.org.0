Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B876281265
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:37:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627NV72kgzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="DyTNWuBb"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4627424t4BzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:22:58 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b13so39080325pfo.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vBF5JTfDPD1eFNn26nmOgc2qt/ewQKezlZWhxI2nZg=;
 b=DyTNWuBb4kQvUn1ItwT8CNs4KhYeYQvuWYL2ITj7Q/UjJ75VR8Ph5+HXAEHPLHg8O1
 TbmqcgqRAdsoYI40VPkTwdEsCIDTjm/hRbSGuFU+6r8fL85PZHTDD6qNhHklkGsTui3O
 mZ0ySqOZ7h8o+i4iWUiob7HzWGPOEBvH0STYs3XJZITO14EADR7jAgBOpXwOS4ydqGtC
 Yx361gNWiRfEcCkGEB6wchEj57s3YCGInlRneNiKkhSg7BEb0cNcWyXESO6DTBi2YvgL
 lpfwJ0YduRXPK0mGdwK9piEAZHXeNCA8ejUZiim/V8zq41M155xjtqaNsVEwzHA586Zr
 F3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vBF5JTfDPD1eFNn26nmOgc2qt/ewQKezlZWhxI2nZg=;
 b=DfhewjH7ct6Vi8fS5oA2gjN4el+1DSncibmG/RUJniueuYOgvjJAyeKn6D/wMkgnTb
 vrZscAVsQF7Rn47BPE5HvEy27Y5kTa3ZLZehv5RiU8HZmeu/hAIdTXbyOnBK7DcMseW/
 d8Oz4DFGiF5KWFmFAtR82jPEw+Arw8d1syK2J7G2dr+kMQE7mYVbK+ZW5Gwb4aLUJTUU
 jFtClE0NW2nBPig/eWD0zaTkj4cnQvrX/4gZvZcfOxrEQF5x8U3cxB7XAi195WiHGZ+i
 sjxvAftSQj768w2zvG8PYOlwD711/aEaSkReqiE1OJ8MRc3/5dcfMHPJ/Fojfz/mkFrg
 NtMA==
X-Gm-Message-State: APjAAAWeHfNB+vY8/6vqwtwItnXCFLzquQTITZ5Qsy0lC5ZWW1pY7JIj
 OibGsVdP45br13AFTksXr//hXa22V5Y=
X-Google-Smtp-Source: APXvYqyy89fYUgNZK6OF1vscZW+pTf7gtiD+sHVJFBUHgbHjR6/Cj+jqTeTkGoziMfLWzbigC6/XAQ==
X-Received: by 2002:a63:e09:: with SMTP id d9mr18349434pgl.442.1564986176422; 
 Sun, 04 Aug 2019 23:22:56 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.66])
 by smtp.gmail.com with ESMTPSA id i14sm124680082pfk.0.2019.08.04.23.22.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 23:22:55 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
Date: Mon,  5 Aug 2019 11:52:24 +0530
Message-Id: <20190805062225.4354-7-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805062225.4354-1-santosh@fossix.org>
References: <20190805062225.4354-1-santosh@fossix.org>
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

If we take a UE on one of the instructions with a fixup entry, set nip
to continue execution at the fixup entry. Stop processing the event
further or print it.

Based-on-patch-by: Reza Arbab <arbab@linux.ibm.com>
Cc: Reza Arbab <arbab@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/include/asm/mce.h  |  4 +++-
 arch/powerpc/kernel/mce.c       | 13 +++++++++++--
 arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
 3 files changed, 27 insertions(+), 5 deletions(-)

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
index 8c0b471658a7..7a9a0bf6d614 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -144,6 +144,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
+			mce->u.ue_error.ignore_event = mce_err->ignore_event;
 		}
 	}
 	return;
@@ -256,8 +257,13 @@ static void machine_process_ue_event(struct work_struct *work)
 		/*
 		 * This should probably queued elsewhere, but
 		 * oh! well
+		 *
+		 * Don't report this machine check because the caller has a
+		 * asked us to ignore the event, it has a fixup handler which
+		 * will do the appropriate error handling and reporting.
 		 */
-		if (evt->error_type == MCE_ERROR_TYPE_UE) {
+		if (evt->error_type == MCE_ERROR_TYPE_UE &&
+		    !evt->u.ue_error.ignore_event) {
 			if (evt->u.ue_error.physical_address_provided) {
 				unsigned long pfn;
 
@@ -291,8 +297,11 @@ static void machine_check_process_queued_event(struct irq_work *work)
 		index = __this_cpu_read(mce_queue_count) - 1;
 		evt = this_cpu_ptr(&mce_event_queue[index]);
 
-		if (evt->error_type == MCE_ERROR_TYPE_UE)
+		if (evt->error_type == MCE_ERROR_TYPE_UE) {
 			machine_check_ue_event(evt);
+			if (evt->u.ue_error.ignore_event)
+				return;
+		}
 
 		machine_check_print_event_info(evt, false, false);
 		__this_cpu_dec(mce_queue_count);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index bed38a8e2e50..36ca45bbb273 100644
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
@@ -558,9 +560,18 @@ static int mce_handle_derror(struct pt_regs *regs,
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
@@ -593,7 +604,7 @@ static long mce_handle_error(struct pt_regs *regs,
 				&phys_addr);
 
 	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
-		handled = mce_handle_ue_error(regs);
+		handled = mce_handle_ue_error(regs, &mce_err);
 
 	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
 
-- 
2.20.1

