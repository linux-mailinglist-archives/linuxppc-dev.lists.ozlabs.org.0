Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801060FAE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:55:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnBf5KWWzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:55:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ldjjH1xw"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn1c16n7zDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:47:16 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g15so5319946pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4/Az4zn4keY3WlLxDlpENnZC1yQSkZ8E58rBWj5n6c=;
 b=ldjjH1xwibBm6TF69iYh0UvydwwAiLl8OLFrBGIyGSSBde1/X0Ra221rcXsZAzE3tz
 QsUgmf4VCbwSumqGuzPXKEoQVSgaeDENdhkYDiGvF6PIDUP0ynb9kQUbT1LO6RnnqjgC
 hV2XNOsgqw2Z1Jt1kWTsr1GlU18vxtntR0ZvpPJhovTO9NZkFPu6LHpCz+Ki9UzBuSwI
 pDn72cnrxoXNK7M4lC66LnMnr+2sdbhXfR9pwfFn2Of2+3KZFnDI8WT4YX66wif/GrDq
 d4YemYGrVAGeq/ngub7BYCfosyri4D4dbcXIl6s0GSvUO69+1pIBQlizXcbKNszdn/ch
 dRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4/Az4zn4keY3WlLxDlpENnZC1yQSkZ8E58rBWj5n6c=;
 b=c7xIvvWCcc0IM3D+gcESBsYPIXO8Uknld7StY0oai6CzPSPzW93zxkUKwp34p9ujoD
 OSsNLP/DleoJdUaiMF3IOAWJ/qOea8G2rDZWFMyLJqLO+N+P2lE7/xZXKAq2O0K78b3B
 2HRo1dLWGprc4TZ7LUx3iJjkyEtCnIrPM+b5GwvM/fMPRoawlNRhnm0GCkpqsb4QN/og
 JF0KMzrP+J3TbtbXznpYD4ncJL/OoKwBospaWnYwImMEB3vi3btO4Q5mrC4MqgP9XxXB
 RoaHxlG7ScfOo+++C5enc4+Yl/2q5NVK6J/JZ4v93Gbs8LQBCmN9q1CGTz8IsRp2DEL7
 lZzg==
X-Gm-Message-State: APjAAAVPJu6Z6usddOgb68ztyWjmcbVzX5almFkNAe9sv6dljiFqhZ/0
 ytv9hfffMElPjECUelXQs2KCJ8cPUNw/hQ==
X-Google-Smtp-Source: APXvYqy7Dv0nWotoAlqv4Z2UJva69Vwe6dDkrDALhhBQg3CyLIJ41N/RNImTcTXAVnyaybCbOlBi8A==
X-Received: by 2002:a17:90a:7d09:: with SMTP id
 g9mr10572649pjl.38.1562406430828; 
 Sat, 06 Jul 2019 02:47:10 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id p23sm13493091pfn.10.2019.07.06.02.47.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:47:10 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v4 4/6] powerpc/mce: Handle UE event for memcpy_mcsafe
Date: Sat,  6 Jul 2019 15:16:45 +0530
Message-Id: <20190706094647.15427-5-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190706094647.15427-1-santosh@fossix.org>
References: <20190706094647.15427-1-santosh@fossix.org>
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
to continue exucution at the fixup entry. Stop processing the event
further or print it.

Based-on-patch-by: Reza Arbab <arbab@linux.ibm.com>
Cc: Reza Arbab <arbab@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/include/asm/mce.h  |  4 +++-
 arch/powerpc/kernel/mce.c       |  7 ++++++-
 arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
 3 files changed, 22 insertions(+), 4 deletions(-)

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
index e78c4f18ea0a..94f2bb307537 100644
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
@@ -230,6 +232,9 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
+	if (evt.error_type == MCE_ERROR_TYPE_UE && evt.u.ue_error.ignore_event)
+		return;
+
 	index = __this_cpu_inc_return(mce_queue_count) - 1;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 04666c0b40a8..db4aa98a23ac 100644
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
+	entry = search_exception_tables(regs->nip);
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

