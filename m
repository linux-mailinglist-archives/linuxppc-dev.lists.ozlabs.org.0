Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEC5C8BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:23:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCM20qnrzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:23:26 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="PlNjRfhR"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCH54fVNzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:01 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i8so3878921pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTxRJjN3pTPMOz/LuyvMrNd6bnn7wmfAl4QIN2ZzQNE=;
 b=PlNjRfhR61wr/pBxo3O490uasub6KA8gK3idricPfUia6mCBtttURrhky0PAAQIQcd
 yMZLgmbmc8eVw4PcSoE0HUX080zoxiR6H8Ita3pmERdH8sqeNCjDSxUh8UECDVCOTaX+
 V60hZ1LcntSuw8UKo5lbTBAgHtVzDGscvmlAX+NVSAG4zgsRdcu7hvbZMAd1Swfa2LtT
 bzDEIdTPyrNYdvj37tAnJb7Fh4FNT92+kGRWWxOhNY+D+akrZze9xFEk7YttjTZf9g0E
 +jWZ/n87YSyK79NK5Edk0VYP1dUYIX95pkaH+oDZWGRaQnNS2gEZk0bDyAwGTTsygdDx
 yanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTxRJjN3pTPMOz/LuyvMrNd6bnn7wmfAl4QIN2ZzQNE=;
 b=gBQ6vK102KeDK9AEHsZ7jxm19+SrWrsF/2N74TWKzHxKpo9NqnIeUGo+koYh+9Rd0o
 iQxAAq1jdGlaCFkfawNOi3VS2GJfFMVNlVvLvo/F3MVhkv2wvSe1ODbGOad5VB+7XWDd
 KP+8WuDACmFS0gIN1+QJEBGQnste7RANvmFURJF1l/L7MHTvd1nR/DwJRz9Lqyc4cGTH
 UeVOBwFHfnFtOifhs113VcEviXhW21WML9PQ/3UxvCArn0+Z8C1/hNcnbejsG4GJ5Xm7
 DI2nf9bGXT9mz1sZZ1QY4eNpyR475jrVEX93FqQx8OvJK8xA/avgNZ01lNFRlvOASAF3
 HgGw==
X-Gm-Message-State: APjAAAUzdOJBKMm4nNJtpzbAdkM2n7KEeZd/oL9Qu58/zYzTPRmH/YCY
 wFlTmGFeknKaN0k+1Z1K7z77FHafMjJ2Ow==
X-Google-Smtp-Source: APXvYqzGWOI8L6L9hiZ0MjSD4G2DuIe7MS9vmoLpBc8Ya17KaPdFSSH7+7s0T8dLU9/Am4/Wi75e1g==
X-Received: by 2002:a63:2a83:: with SMTP id
 q125mr28233038pgq.102.1562044799561; 
 Mon, 01 Jul 2019 22:19:59 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 05/12] powerpc/mce: Allow notifier callback to handle MCE
Date: Tue,  2 Jul 2019 10:49:25 +0530
Message-Id: <20190702051932.511-6-santosh@fossix.org>
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

If a notifier returns NOTIFY_STOP, consider the MCE handled, just as we
do when machine_check_early() returns 1.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  2 +-
 arch/powerpc/include/asm/mce.h            |  3 +-
 arch/powerpc/kernel/exceptions-64s.S      |  3 ++
 arch/powerpc/kernel/mce.c                 | 37 ++++++++++++++++++-----
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index f66f26ef3ce0..49ee8f08de2a 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -72,7 +72,7 @@ void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
 long do_slb_fault(struct pt_regs *regs, unsigned long ea);
 void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
-void machine_check_notify(struct pt_regs *regs);
+long machine_check_notify(struct pt_regs *regs);
 
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
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
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2e56014fca21..c83e38a403fd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -460,6 +460,9 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_notify
+	ld	r11,RESULT(r1)
+	or	r3,r3,r11
+	std	r3,RESULT(r1)
 
 	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 0ab171b41ede..4a37928ab30e 100644
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
@@ -647,16 +653,31 @@ long hmi_exception_realmode(struct pt_regs *regs)
 	return 1;
 }
 
-void machine_check_notify(struct pt_regs *regs)
+long machine_check_notify(struct pt_regs *regs)
 {
-	struct machine_check_event evt;
+	int index = __this_cpu_read(mce_nest_count) - 1;
+	struct machine_check_event *evt;
+	int rc;
 
-	if (!get_mce_event(&evt, MCE_EVENT_DONTRELEASE))
-		return;
+	if (index < 0 || index >= MAX_MC_EVT)
+		return 0;
 
-	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
+	evt = this_cpu_ptr(&mce_event[index]);
 
-	if (evt.error_type == MCE_ERROR_TYPE_UE &&
-	    evt.u.ue_error.physical_address_provided)
-		machine_check_ue_event(&evt);
+	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
+	if (rc & NOTIFY_STOP_MASK) {
+		if (evt->error_type == MCE_ERROR_TYPE_UE)
+			evt->u.ue_error.process_event = false;
+
+		if ((rc & NOTIFY_STOP_MASK) && (regs->msr & MSR_RI))
+			evt->disposition = MCE_DISPOSITION_RECOVERED;
+
+		return 1;
+	}
+
+	if (evt->error_type == MCE_ERROR_TYPE_UE &&
+	    evt->u.ue_error.physical_address_provided)
+		machine_check_ue_event(evt);
+
+	return 0;
 }
-- 
2.20.1

