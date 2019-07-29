Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC7783D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 06:11:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xmTP1khLzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 14:11:21 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="JN5J/JHz"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xmF36JBDzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 14:00:39 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i18so27509822pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 21:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5YTrWVuxiWfhQF26mz6MMSBokY3Kigngu/jx2QbSR6Q=;
 b=JN5J/JHzmz98KSLX02MBCv1wEwmL8WgomgihIvOCWSeA3CzAVjz0LW14gWf5LxcSkL
 ULIFWAGF0VEGhI8S668HcHLpZOuANXQJ7ugyeV5W3dgBHRRnG7xb1Ev3ETYsiywSUa+0
 NVfEc+2XozNPRBKUW8s+KpOCOO8HyvkKyIyLCuIKlwIKPAKV2XKK0FcECVaQKAhIJodc
 b7qK1smKHwxzcu/trd07uH0tfLJ85kwhTILO86I2WVCmg/4SakoOa2K9y9wNUgWzQDYf
 56XCCXfPXSvi4aEGb2nv7m57+vpgaveGUiyzGVhhsY5ScGPCOarrTY83VeJmrojFIDeO
 hGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5YTrWVuxiWfhQF26mz6MMSBokY3Kigngu/jx2QbSR6Q=;
 b=K8k1IQKm9YX66+FRY4QIFxzYwZEEDN7dR/WEAI9IWf7W4/pJTuCs7VGyQg2/q6cato
 QMBvkIfZHmiGlnyFTFTha+tw+CGIvMBFrHh/XBTStUak/Wej+Uqbdes7ikbpiFWnxx/J
 vfvtpuSUQITOwcBk37bw0+PsA75Crl2WJEQYjKQBs1a7vg4FZ6xt1U1pxPAXl2WAl1Uy
 t4uQL0ACBFyLnAZNwnIhMo/+ru480xyW9zsMXUyicGILgWqziqXthev4df2BM4tAizAF
 0biaHl4dbDwUeBepQ1NDED/Bd/FQRAgBKug3XYay8eR6VzntFSRTuB4UUVZ4VTTmYPcG
 PJsA==
X-Gm-Message-State: APjAAAWlMWWnkHuNuZkqUl9DZ3vWnjs2t9q3NjzEW2aG2k1HrjPORwcd
 dE1xKOnidHrP5ya/Vo4GOWwPDb8uHmE=
X-Google-Smtp-Source: APXvYqyrJdiLZDO+ZB0UcS0kJ8qI7ng+128jsh40F8XIl6GLA8EoWxwxynujqhcrvfo3+NYMR3lxIg==
X-Received: by 2002:a62:5487:: with SMTP id i129mr35462353pfb.69.1564372837680; 
 Sun, 28 Jul 2019 21:00:37 -0700 (PDT)
Received: from santosiv.in.ibm.com ([183.82.17.52])
 by smtp.gmail.com with ESMTPSA id g1sm100033948pgg.27.2019.07.28.21.00.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 21:00:37 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v6 5/6] powerpc/mce: Handle UE event for memcpy_mcsafe
Date: Mon, 29 Jul 2019 09:30:10 +0530
Message-Id: <20190729040011.5086-6-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729040011.5086-1-santosh@fossix.org>
References: <20190729040011.5086-1-santosh@fossix.org>
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
 arch/powerpc/kernel/mce.c       | 12 +++++++++++-
 arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
 3 files changed, 27 insertions(+), 4 deletions(-)

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
index e78c4f18ea0a..2df132fe3354 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -144,7 +144,9 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
-			machine_check_ue_event(mce);
+			mce->u.ue_error.ignore_event = mce_err->ignore_event;
+			if (!mce->u.ue_error.ignore_event)
+				machine_check_ue_event(mce);
 		}
 	}
 	return;
@@ -230,6 +232,14 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
+	/*
+	 * Don't report this machine check because the caller has a asked us to
+	 * ignore the event, it has a fixup handler which will do the
+	 * appropriate error handling and reporting.
+	 */
+	if (evt.error_type == MCE_ERROR_TYPE_UE && evt.u.ue_error.ignore_event)
+		return;
+
 	index = __this_cpu_inc_return(mce_queue_count) - 1;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
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

