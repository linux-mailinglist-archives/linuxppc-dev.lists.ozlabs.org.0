Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE9A2C6F3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:12:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjjPC5lSmzF0jF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:12:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mTwFjmAF; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjHj4rcczDsPb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:07:45 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id e23so1148996pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N80fuMiX7GnX39J9dqIjia2qgdYXbL88FKJN1E8uzH8=;
 b=mTwFjmAFugrRYVxcBlxl1OjIndZly89Ec35Hea6qqRiCQI+pDVbK67kxd5TqwNA3Z4
 egTkS84pdfDtWaYW7KLmCG255Yk+nHIdsf7IkA9FQJutI8D/w+FQe9F7JDAY5lokzNUJ
 ZcsoB4mF38WfLauEnFDh7cW1mPxrqrmmVYotFBUW6FtRnMgFjeegQxkjGXwY/ma544Ez
 0sugmF4ctpi5DlUbQQDorligceSniIbDySvbt5UxHKglUFDt37z+wSWkJIY+EnDzdoWd
 8ngqf9qJcYIRup2VzYINyXyyMJgakStmPruPiQLyLBRCQo1dX/eVGPkHrg9E2cwMFyMa
 628Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N80fuMiX7GnX39J9dqIjia2qgdYXbL88FKJN1E8uzH8=;
 b=BXR/qVncYkG0rDYl39U1EA9jwx/pK6Mep3wO3tjesiA27udPwnAAkBFMRoNi9Rb6aq
 rddsvyct2Vx55YNHEckoJoXsiAY+tLm3swnq189xfzVbMhAqvChfr7y/ng5oHZKtgvq/
 MGxuBADVBjNu6dvmA/5P/PfWOKmTQHQOCQFgZwgVnjr2JMgaXQlUImhN3USpr5MjQ9T1
 j37xN41vJb3cNeBwKGNsn2REhKESbEs2CwiUkO1kebuJpm/FuaGjXxDbDsW+qIl801Gd
 yUXZ3mJyGK8PIwXLMsC1qL1mA/hxoIGGA9OUiKIM31FdJC86dwMb3HDiOQ1Q2hdjxeo1
 8KYQ==
X-Gm-Message-State: AOAM532JGaEM4UuzM0Y14MmJ9YZrlExpEurO4WqtYXyrJ/iCOnuS4c1B
 RtSlKFqgYHpWJgurAVs90OvgSdav0ig=
X-Google-Smtp-Source: ABdhPJw4tj75B+xa9a6wn+TUlX51xdcUPbY3nt4XL+aeRC38ohFU2qOg6vqNj7fwjhBw8adhlgjFNg==
X-Received: by 2002:a17:90a:9d8a:: with SMTP id
 k10mr14046861pjp.60.1606547262731; 
 Fri, 27 Nov 2020 23:07:42 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:07:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] powerpc/64s/powernv: Allow KVM to handle guest machine
 check details
Date: Sat, 28 Nov 2020 17:07:22 +1000
Message-Id: <20201128070728.825934-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM has strategies to perform machine check recovery. If a MCE hits
in a guest, have the low level handler just decode and save the MCE
but not try to recover anything, so KVM can deal with it.

The host does not own SLBs and does not need to report the SLB state
in case of a multi-hit for example, or know about the virtual memory
map of the guest.

UE and memory poisoning of guest pages in the host is one thing that
is possibly not completely robust at the moment, but this too needs
to go via KVM (possibly via the guest and back out to host via hcall)
rather than being handled at a low level in the host handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c       |  2 +-
 arch/powerpc/kernel/mce_power.c | 96 ++++++++++++++++++---------------
 2 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 63702c0badb9..8afe8d37b983 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -577,7 +577,7 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	/* Display faulty slb contents for SLB errors. */
-	if (evt->error_type == MCE_ERROR_TYPE_SLB)
+	if (evt->error_type == MCE_ERROR_TYPE_SLB && !in_guest)
 		slb_dump_contents(local_paca->mce_faulty_slbs);
 #endif
 }
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index b7e173754a2e..1372ce3f7bdd 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -62,6 +62,20 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 	return pfn;
 }
 
+static bool mce_in_guest(void)
+{
+#ifdef CONFIG_KVM_BOOK3S_HANDLER
+	/*
+	 * If machine check is hit when in guest context or low level KVM
+	 * code, avoid looking up any translations or making any attempts
+	 * to recover, just record the event and pass to KVM.
+	 */
+	if (get_paca()->kvm_hstate.in_guest)
+		return true;
+#endif
+	return false;
+}
+
 /* flush SLBs and reload */
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void)
@@ -69,14 +83,6 @@ void flush_and_reload_slb(void)
 	/* Invalidate all SLBs */
 	slb_flush_all_realmode();
 
-#ifdef CONFIG_KVM_BOOK3S_HANDLER
-	/*
-	 * If machine check is hit when in guest or in transition, we will
-	 * only flush the SLBs and continue.
-	 */
-	if (get_paca()->kvm_hstate.in_guest)
-		return;
-#endif
 	if (early_radix_enabled())
 		return;
 
@@ -490,19 +496,21 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		if ((srr1 & table[i].srr1_mask) != table[i].srr1_value)
 			continue;
 
-		/* attempt to correct the error */
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_SLB:
-			if (local_paca->in_mce == 1)
-				slb_save_contents(local_paca->mce_faulty_slbs);
-			handled = mce_flush(MCE_FLUSH_SLB);
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			handled = mce_flush(MCE_FLUSH_ERAT);
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			handled = mce_flush(MCE_FLUSH_TLB);
-			break;
+		if (!mce_in_guest()) {
+			/* attempt to correct the error */
+			switch (table[i].error_type) {
+			case MCE_ERROR_TYPE_SLB:
+				if (local_paca->in_mce == 1)
+					slb_save_contents(local_paca->mce_faulty_slbs);
+				handled = mce_flush(MCE_FLUSH_SLB);
+				break;
+			case MCE_ERROR_TYPE_ERAT:
+				handled = mce_flush(MCE_FLUSH_ERAT);
+				break;
+			case MCE_ERROR_TYPE_TLB:
+				handled = mce_flush(MCE_FLUSH_TLB);
+				break;
+			}
 		}
 
 		/* now fill in mce_error_info */
@@ -534,7 +542,7 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		mce_err->sync_error = table[i].sync_error;
 		mce_err->severity = table[i].severity;
 		mce_err->initiator = table[i].initiator;
-		if (table[i].nip_valid) {
+		if (table[i].nip_valid && !mce_in_guest()) {
 			*addr = regs->nip;
 			if (mce_err->sync_error &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
@@ -577,22 +585,24 @@ static int mce_handle_derror(struct pt_regs *regs,
 		if (!(dsisr & table[i].dsisr_value))
 			continue;
 
-		/* attempt to correct the error */
-		switch (table[i].error_type) {
-		case MCE_ERROR_TYPE_SLB:
-			if (local_paca->in_mce == 1)
-				slb_save_contents(local_paca->mce_faulty_slbs);
-			if (mce_flush(MCE_FLUSH_SLB))
-				handled = 1;
-			break;
-		case MCE_ERROR_TYPE_ERAT:
-			if (mce_flush(MCE_FLUSH_ERAT))
-				handled = 1;
-			break;
-		case MCE_ERROR_TYPE_TLB:
-			if (mce_flush(MCE_FLUSH_TLB))
-				handled = 1;
-			break;
+		if (!mce_in_guest()) {
+			/* attempt to correct the error */
+			switch (table[i].error_type) {
+			case MCE_ERROR_TYPE_SLB:
+				if (local_paca->in_mce == 1)
+					slb_save_contents(local_paca->mce_faulty_slbs);
+				if (mce_flush(MCE_FLUSH_SLB))
+					handled = 1;
+				break;
+			case MCE_ERROR_TYPE_ERAT:
+				if (mce_flush(MCE_FLUSH_ERAT))
+					handled = 1;
+				break;
+			case MCE_ERROR_TYPE_TLB:
+				if (mce_flush(MCE_FLUSH_TLB))
+					handled = 1;
+				break;
+			}
 		}
 
 		/*
@@ -634,7 +644,7 @@ static int mce_handle_derror(struct pt_regs *regs,
 		mce_err->initiator = table[i].initiator;
 		if (table[i].dar_valid)
 			*addr = regs->dar;
-		else if (mce_err->sync_error &&
+		else if (mce_err->sync_error && !mce_in_guest() &&
 				table[i].error_type == MCE_ERROR_TYPE_UE) {
 			/*
 			 * We do a maximum of 4 nested MCE calls, see
@@ -662,7 +672,8 @@ static int mce_handle_derror(struct pt_regs *regs,
 static long mce_handle_ue_error(struct pt_regs *regs,
 				struct mce_error_info *mce_err)
 {
-	long handled = 0;
+	if (mce_in_guest())
+		return 0;
 
 	mce_common_process_ue(regs, mce_err);
 	if (mce_err->ignore_event)
@@ -677,9 +688,10 @@ static long mce_handle_ue_error(struct pt_regs *regs,
 
 	if (ppc_md.mce_check_early_recovery) {
 		if (ppc_md.mce_check_early_recovery(regs))
-			handled = 1;
+			return 1;
 	}
-	return handled;
+
+	return 0;
 }
 
 static long mce_handle_error(struct pt_regs *regs,
-- 
2.23.0

