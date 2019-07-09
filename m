Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7BA63605
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:35:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhbw4yg5zDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:35:08 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="emMR6dBl"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jhB51mz9zDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:16:11 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id z75so9357613pgz.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62HM2vq6tYD24jSG4prB86KqqNJmUygRjGMJaSfwLY4=;
 b=emMR6dBlBkE4Jv1qP9rgX/blh+CxtnFKjdxACA6vogdi+c0r1UmojQ0W4JDgQuO5o/
 SinF/XmZjpblp9NGZohGA+OYJzrb1ohgudKzxgdmHkuoOe46I2jfSCQpb/N3VYslWhfA
 AhurRSIBcGbEU2HdSo4tZwd+nWf628gX01L5+s4wCCXFRByRzsBTWKi4irdzhMFsA6FU
 qbvyg0xhBNjL99sReY/mKCrOtVEyFFlJV5QzwLmY27Wpyal1deG3GS10Z+eEfrUNtaTA
 LCdwbjB/A/MFz0iudfYDxGgmPgYYfUgxtXLZPZE/dLku75rOpe579nhkp4KEz3GmOVZo
 pasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62HM2vq6tYD24jSG4prB86KqqNJmUygRjGMJaSfwLY4=;
 b=WtjovD1gv9hzURarKO8VNrJLl4H0M0qob0nwrjFNOS3AhBnn+Ze2d4G5sGOJuosV5a
 R0taEaZt4/lhULgli1Jg92SzzMpOd4PCZ78eSu8tAgPVp+WCcDo5epVXmx32UriGh/WZ
 UP4D4XmW+VZxSEHCFMw9gYmIkX/NmHPmuYH155ZCrU3qAO2xh1KwIcixba3fDks9RzTY
 sj0WXYKT90VLd/YTl9qE8NHvcXXwTi4BPIjT862L/ZzlCNCUd9WzBk8U9T5t0vkuu+Lj
 3dqwQrQ1AmPKZHigUIlUuUb4EV73GBQfWDGQXOhpnOduPNL+isnAP6HZnmxOKm1RkKOz
 UDgw==
X-Gm-Message-State: APjAAAUemuncIFv0PlTPfdgudjV7VBGV1eM5Yb3L5+mZ7Dor91WJOj9g
 f7k0MIwM3Hoj/A/NxT41Cvz0kFENKzVtunoV
X-Google-Smtp-Source: APXvYqyFc6JsuXYQGzcr2Z8+Og5MviTLjlV/G1/wixU9eskEO7AczpYsY6pnwPNTZJ3kXPRYVd0x7A==
X-Received: by 2002:a63:f4e:: with SMTP id 14mr30451043pgp.58.1562674568932;
 Tue, 09 Jul 2019 05:16:08 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.16.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:16:08 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 5/6] powerpc/mce: Handle UE event for memcpy_mcsafe
Date: Tue,  9 Jul 2019 17:45:23 +0530
Message-Id: <20190709121524.18762-6-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709121524.18762-1-santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
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

Nick, I didn't add has_fixup_handler in mce_event structure; if we do so we wil
have to access the mce_event from ue_handler code also. That is because Mahesh
did not want mce_event to be accessed outside of save_mce_event, get_mce_event
and remove_mce_event; that is why I added ignore_event in mce_err also.

I have added the comment you mentioned in your reply.

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 94888a7025b3..f74257eb013b 100644
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
index e78c4f18ea0a..092e6bbc603f 100644
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
+	 * Don't report this machine check because the caller has a asked us
+	 * to ignore the event, it has a fixup handler which will do the
+	 * appropriate error handling and reporting.
+	 */
+	if (evt.error_type == MCE_ERROR_TYPE_UE && evt.u.ue_error.ignore_event)
+		return;
+
 	index = __this_cpu_inc_return(mce_queue_count) - 1;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 04666c0b40a8..582a22b1acfb 100644
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
  * Convert an address related to an mm to a PFN. NOTE: we are in real
@@ -565,9 +567,18 @@ static int mce_handle_derror(struct pt_regs *regs,
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
@@ -600,7 +611,7 @@ static long mce_handle_error(struct pt_regs *regs,
 				&phys_addr);
 
 	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
-		handled = mce_handle_ue_error(regs);
+		handled = mce_handle_ue_error(regs, &mce_err);
 
 	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
 
-- 
2.20.1

