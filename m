Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B54DFF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:11:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRcc1QgbzDqDh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:11:44 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="dYObYEvf"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGz280WzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:27 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id p10so2753122pgn.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jiLlvZfig5O6cWMTJFICJPj20cIgYSg1THIYOYYtyI=;
 b=dYObYEvf65bDL172NJhIGLUZUQTuHuldVrzL1SLax3I3CySFcJugAbKp8WO8a72P7/
 u5vmOORphZ5BxENgyfJFSlrJx2Q6+wK/QRhDEq1LSppe8rHI71BM02ZwXmjj9m+M0tUO
 3vaYzp71C3eGLPcKsfE6ck4RO2K2cPAIEJCSvzBboyQuOX3MrUuPp2jRbouvI0yI/Rr9
 uQ5+gEjScNIZTVVuYXig+5U508uXMhrHDOJFZMce0Al2lUyCALAP2mMMr2ncjLFEZ3nb
 YGj3bE/whDP6Z67ZYt79jBo9G/H7Fq4eYKhvyEylmQirECkc8j87EpLLORZSXtS/1aTZ
 sljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jiLlvZfig5O6cWMTJFICJPj20cIgYSg1THIYOYYtyI=;
 b=qwb2qMZ/7OjD+PSUmGBrkXef9BYGF2We4B89A3WGcnShYD0E/5+hX9a1NR+rtaXmNr
 ZeEC6t1xctWSGaIiX27mVR1WtnIn/8/Kpi8mucBAzD4P6bAsMwxjDFl27APpkHc1LavM
 kmbN8rk4k64cLoOujLKKnZwph3wEJzQINJFxI8N3J9RoTHadlo7DNRxy/AyTePuda4dq
 UYWaBWQDJ6ZE1vTJ8WYT+KmnMPzS+pMBNdheoXgYH7AQhsS4Y2SJUYVoEvuw1v7h39CE
 i998CmxJJmSvzDPxmxY2yeF2bA4jGk02USJ9gAulfrv5OeF/ICKSPuMciJP+1ncQl6+s
 yjDA==
X-Gm-Message-State: APjAAAVs+VdadsZQ15QWEYk6GAdpv293YbOHyFoKecJpYnR9S42eznG/
 Exwbp2ofQytYmsROoDjNMUwR8fZnozIvBA==
X-Google-Smtp-Source: APXvYqyiOwkL3RdRZ02pzB5WCMWZSDSgPpJyd2OzExnXC3OjFiOYDOcyj4svcdpeBfcgvitJ23pTcQ==
X-Received: by 2002:a17:90a:d151:: with SMTP id
 t17mr3925315pjw.60.1561092985303; 
 Thu, 20 Jun 2019 21:56:25 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:24 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 07/13] powerpc/mce: Add fixup address to UE events
Date: Fri, 21 Jun 2019 10:25:49 +0530
Message-Id: <ae32e09b1c27ecbb774215bb9a818ef11a8d3882.1561020760.git.santosh@fossix.org>
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
index 2616f1f71734..8afda1ab7358 100644
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
 
 		evt->disposition = MCE_DISPOSITION_RECOVERED;
 		regs->msr |= MSR_RI;
-- 
2.20.1

