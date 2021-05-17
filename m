Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68D382E2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:04:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLVB1ZG0z3bry
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 00:04:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JRL1b1aQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JRL1b1aQ; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLTf1zcdz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 00:04:03 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id 22so4627707pfv.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnE3cWDsdeZMAI6rTwJ+n/y7S4wuABxHn8JzxVmIETo=;
 b=JRL1b1aQEOCVzCujCWIqXpdALoWAdBi9XAxCGVINzUGO6DsXlSanWTD8uBUUYDgwTm
 WdWQB4dY2kO7GyXPQJRmFho6HJjhw8oqBlNkscOZKJA6hKOPMg3/jIO6dovEja52FCfg
 U/GCkBmq0lCHAdtkunvuicrBEhOBrjuF8sxd7N7tVLWkEURizQ7IOdnaDB6sF7uHcpOl
 qm82VVAJ9AC5kJLbUtMBvH9riY8rRAdN1GKPXhI5hWGNJF3CsUIPYXE0Eu3JoqWUjBCY
 0ElB6F75ZM1i/TpyGP6b48mxFOi3qRxKWdCsLTBT5n2DkOaUskmvA9oq0aLIRVHfnwuu
 qq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnE3cWDsdeZMAI6rTwJ+n/y7S4wuABxHn8JzxVmIETo=;
 b=CWhjfgxwYWbcuM2kwyKfdRvqIwloAyI527tyOrpFWcKpELqS78p6RVXtzBBainhzCV
 Qm3eWxigayCx/ByJXumiLu6iAvOQQb3Kjs/OS6fVuMzcxly21kLTSpJ4ug4F5kqeOfgu
 iHTJxlN9SsaeJda+Zg4DFmWEMIhHYrTYZSSgvtpPXEkuoqEuKmIkXijyVMegtWrDRs6T
 RHMthuK8gy5YjCNj5GmhJQJjE11453ilgaCWW4Ff9E4iZllub7QxhXJwNcLSjXuPm2TF
 6jcVaF9uCsHVJQM9hSbJui+SzPLAsH3QWBmIru1j/WVIlUt9s5pr7lLVVIEMoO4IJVWu
 5blA==
X-Gm-Message-State: AOAM530Fr6jkZELbsidjc7a1lEBoP7teclPmtM0arJ/sJ0g4wVgxYMf0
 N+U5N1JdMBM2gHxxYNx4UwoTC5tmGck=
X-Google-Smtp-Source: ABdhPJxMlDwTwvdGglOXYHgxXX7sFIjpk0jQiHZZy8HtBRUeDL8RPvaEYEi8o5T95qbZueYRzoVUJQ==
X-Received: by 2002:a63:ed41:: with SMTP id m1mr42196511pgk.252.1621260241211; 
 Mon, 17 May 2021 07:04:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id
 66sm11276646pgj.9.2021.05.17.07.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:04:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Fix machine check reporting of async store
 errors
Date: Tue, 18 May 2021 00:03:55 +1000
Message-Id: <20210517140355.2325406-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER9 and POWER10 asynchronous machine checks due to stores have their
cause reported in SRR1 but SRR1[42] is set, which in other cases
indicates DSISR cause.

Check for these cases and clear SRR1[42], so the cause matching uses
the i-side (SRR1) table.

Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Fixes: 7b9f71f974 ("powerpc/64s: POWER9 machine check handler")
Fixes: 201220bb0e ("powerpc/powernv: Machine check handler for POWER10")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce_power.c | 48 +++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 667104d4c455..2fff886c549d 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -481,12 +481,11 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	return -1;
 }
 
-static int mce_handle_ierror(struct pt_regs *regs,
+static int mce_handle_ierror(struct pt_regs *regs, unsigned long srr1,
 		const struct mce_ierror_table table[],
 		struct mce_error_info *mce_err, uint64_t *addr,
 		uint64_t *phys_addr)
 {
-	uint64_t srr1 = regs->msr;
 	int handled = 0;
 	int i;
 
@@ -695,19 +694,19 @@ static long mce_handle_ue_error(struct pt_regs *regs,
 }
 
 static long mce_handle_error(struct pt_regs *regs,
+		unsigned long srr1,
 		const struct mce_derror_table dtable[],
 		const struct mce_ierror_table itable[])
 {
 	struct mce_error_info mce_err = { 0 };
 	uint64_t addr, phys_addr = ULONG_MAX;
-	uint64_t srr1 = regs->msr;
 	long handled;
 
 	if (SRR1_MC_LOADSTORE(srr1))
 		handled = mce_handle_derror(regs, dtable, &mce_err, &addr,
 				&phys_addr);
 	else
-		handled = mce_handle_ierror(regs, itable, &mce_err, &addr,
+		handled = mce_handle_ierror(regs, srr1, itable, &mce_err, &addr,
 				&phys_addr);
 
 	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
@@ -723,16 +722,20 @@ long __machine_check_early_realmode_p7(struct pt_regs *regs)
 	/* P7 DD1 leaves top bits of DSISR undefined */
 	regs->dsisr &= 0x0000ffff;
 
-	return mce_handle_error(regs, mce_p7_derror_table, mce_p7_ierror_table);
+	return mce_handle_error(regs, regs->msr,
+			mce_p7_derror_table, mce_p7_ierror_table);
 }
 
 long __machine_check_early_realmode_p8(struct pt_regs *regs)
 {
-	return mce_handle_error(regs, mce_p8_derror_table, mce_p8_ierror_table);
+	return mce_handle_error(regs, regs->msr,
+			mce_p8_derror_table, mce_p8_ierror_table);
 }
 
 long __machine_check_early_realmode_p9(struct pt_regs *regs)
 {
+	unsigned long srr1 = regs->msr;
+
 	/*
 	 * On POWER9 DD2.1 and below, it's possible to get a machine check
 	 * caused by a paste instruction where only DSISR bit 25 is set. This
@@ -746,10 +749,39 @@ long __machine_check_early_realmode_p9(struct pt_regs *regs)
 	if (SRR1_MC_LOADSTORE(regs->msr) && regs->dsisr == 0x02000000)
 		return 1;
 
-	return mce_handle_error(regs, mce_p9_derror_table, mce_p9_ierror_table);
+	/*
+	 * Async machine check due to bad real address from store or foreign
+	 * link time out comes with the load/store bit (PPC bit 42) set in
+	 * SRR1, but the cause comes in SRR1 not DSISR. Clear bit 42 so we're
+	 * directed to the ierror table so it will find the cause (which
+	 * describes it correctly as a store error).
+	 */
+	if (SRR1_MC_LOADSTORE(srr1) &&
+			((srr1 & 0x081c0000) == 0x08140000 ||
+			 (srr1 & 0x081c0000) == 0x08180000)) {
+		srr1 &= ~PPC_BIT(42);
+	}
+
+	return mce_handle_error(regs, srr1,
+			mce_p9_derror_table, mce_p9_ierror_table);
 }
 
 long __machine_check_early_realmode_p10(struct pt_regs *regs)
 {
-	return mce_handle_error(regs, mce_p10_derror_table, mce_p10_ierror_table);
+	unsigned long srr1 = regs->msr;
+
+	/*
+	 * Async machine check due to bad real address from store comes with
+	 * the load/store bit (PPC bit 42) set in SRR1, but the cause comes in
+	 * SRR1 not DSISR. Clear bit 42 so we're directed to the ierror table
+	 * so it will find the cause (which describes it correctly as a store
+	 * error).
+	 */
+	if (SRR1_MC_LOADSTORE(srr1) &&
+			(srr1 & 0x081c0000) == 0x08140000) {
+		srr1 &= ~PPC_BIT(42);
+	}
+
+	return mce_handle_error(regs, srr1,
+			mce_p10_derror_table, mce_p10_ierror_table);
 }
-- 
2.23.0

