Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9631589E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:02:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gscw2vsjzDqHv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rfkyHpie; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs3l2SkPzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:37:23 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id b35so5083305pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4APAJa04OqQvBuPh8qOA4vaLQx6bRHVlMgJ4rnMsd4U=;
 b=rfkyHpiey7FOpfdmglnZDdVbKxwDOZpLJszUtFpY0chLKRR7RMkScEk1dA2qYTF4c6
 DHZskMF+VI8Ueuw7OWyx5dPhZ2bqGSYwzq3svLDjbszVktazFw82jlzs0sn0lVadY6cU
 srBlTwJjsbPGT1Aye1Hk7hmAEAoDQN2sSZf9DUaBK1YBXOGsbZ46YTeag5HwAduMNgC0
 fcdQg/45N9m2mskf2Q+nS5X2Y3HuoahswCwRsfAC/2IF2ioBQBA9vq5o2Jxs2ZecScq/
 fopp6zgXooyujoj17+yZ3KhN3qe2mDXRMP7iUTenzABhEyYHMwFOTTlo2u5mCpOPIV2A
 9OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4APAJa04OqQvBuPh8qOA4vaLQx6bRHVlMgJ4rnMsd4U=;
 b=UEOopu2wCmGMXwhGt/WnMsQS7j/VCSlmmTgkuX89Qvlv/XVAB/JcEsZH/K8B0jggs6
 8LIzQl7kBMNYy4p5cpjGvyZWg+Bkesenz1IY+OI+SrX7F+15VgXN1ypQFKB5iNBaTW+V
 XlxElo7hNtsCAm1szm+io0RAvqoJBYc2T5L3X1k9LupVifEkFWjnNubj2nFU+Hepb4Ga
 GeUMz8JEKneHA6d/bOMA/QjreZ5+9xgAcSzKelyUap5nPuKvCv5xaR4bLxhv8FRMkYX4
 2ta7NrHVrhTXjyBOG6dZ54g4RAtoQcuUcGLiRyfyXTcKUtaN15DRs1U950aEQMbCZ6WM
 glcw==
X-Gm-Message-State: APjAAAXgFNA5V0WDaTAwREUZAMfhMC0bt3ovhWu40UOvU9wvCGlja1wc
 Uq2Y8uVdd4nuxf97beCDHmEDLgtEENVKVg==
X-Google-Smtp-Source: APXvYqyG9wTLxDIvhi3npkM4a1QYKXCT1cfeEM3Qd0f8tEiK+qTedn233BijX4udeBC5PNDhtF9/iQ==
X-Received: by 2002:a65:420b:: with SMTP id c11mr1426389pgq.306.1581399440905; 
 Mon, 10 Feb 2020 21:37:20 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:37:20 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/13] powerpc: Add prefix support to
 mce_find_instr_ea_and_pfn()
Date: Tue, 11 Feb 2020 16:33:55 +1100
Message-Id: <20200211053355.21574-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mce_find_instr_ea_and_pfn analyses an instruction to determine the
effective address that caused the machine check. Update this to load and
pass the suffix to analyse_instr for prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Rename sufx to suffix
---
 arch/powerpc/kernel/mce_power.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 824eda536f5d..091bab4a5464 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -365,7 +365,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	 * in real-mode is tricky and can lead to recursive
 	 * faults
 	 */
-	int instr;
+	int instr, suffix = 0;
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
@@ -374,7 +374,9 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
 		instr = *(unsigned int *)(instr_addr);
-		if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
+		if (IS_PREFIX(instr))
+			suffix = *(unsigned int *)(instr_addr + 4);
+		if (!analyse_instr(&op, &tmp, instr, suffix)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
 			*phys_addr = (pfn << PAGE_SHIFT);
-- 
2.17.1

