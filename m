Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281A109906
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:58:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MY9d2Hx4zDq8v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="psLL4Xbm"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNn72y8zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:23:05 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w7so7556550plz.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQysnXAmDB8s9jOx0CDhFVfHCIT898Liqb9f/1R7ERk=;
 b=psLL4XbmoaFkrCIiLud/KR5DFMFXRtNyQEzd8VZl4j0Km0Tf78NLnkKABGnXFY78gy
 M3HC7rVCmSRH68I8X0DIQTxNOWcuejua3RO/gWIen3N/z72wIEbx7FQ6gKQyWw6s0Tv9
 zyDInl6xW/BCeKYoJTjDue55FsPiewbvh+1hn85lERxfD1yYG4KVKXwzQCuRbCmwxniY
 GQM/HsAMxEK4y7qCW6BKEQG/jpIKpBoGEAfs/REDYCvI/Hnp7D1+zGe3EnW2mhZ1m9Af
 tMum+nYonFNRNjEXT+H1ZxLacn/EQTGtSI9E6Iu+mQ4PtDujDUNrLoMAO8g3ZsRtWN5R
 b5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQysnXAmDB8s9jOx0CDhFVfHCIT898Liqb9f/1R7ERk=;
 b=nRdSNmSZ4XamUNQJXEbB8XR87vgVJMsdSTOxi5gU3ELy7gI7A05v7GCvUqeJpfPMHk
 TTGBYD6ZIiuMtP3qNjhRXJP8yad+A1QBFNrNsLx7ajY3c8feECG8RboFZOH9/3z90Q7l
 rewtLq3N8CFFz6kunXb0/mpLVGxbjo4w1fLvxFSWUo4b88C+FhtWY2xtqioTwt0jGXup
 o7bfnwffU/0Lhrst2FHLa0EogvgkZ8JNGfFz8uKRbvCejfmXmFYOu2Q0hQk+tXU8DAAU
 5amgbDTq9Un2QlvjDdVFlfB5YZbXs62JNBE3nhXd41N2omGp11H4VcaKHaE8l7ZkZbii
 9wCQ==
X-Gm-Message-State: APjAAAWP+dspW8azxjATWqi+GD9chFKOwb+8QhN6/9Hrx5AZC5LtkqAy
 stOYK/hE/v+lvDF7oyNLJtcf04dh
X-Google-Smtp-Source: APXvYqxKsJpv0b46GywpGUihr2zhynmjXUbGB/hGXJpbItqJ5BSB9gPKxpSvFPtoPOp+BywPvgSa1Q==
X-Received: by 2002:a17:902:bf01:: with SMTP id
 bi1mr3087838plb.241.1574745783710; 
 Mon, 25 Nov 2019 21:23:03 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:23:03 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/18] powerpc: Add prefix support to
 mce_find_instr_ea_and_pfn()
Date: Tue, 26 Nov 2019 16:21:40 +1100
Message-Id: <20191126052141.28009-18-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mce_find_instr_ea_and_pfn analyses an instruction to determine the
effective address that caused the machine check. Update this to load and
pass the suffix to analyse_instr for prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/mce_power.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index d862bb549158..68e81fcbdf07 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -365,7 +365,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	 * in real-mode is tricky and can lead to recursive
 	 * faults
 	 */
-	int instr;
+	int instr, sufx = 0;
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
@@ -374,7 +374,9 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
 		instr = *(unsigned int *)(instr_addr);
-		if (!analyse_instr(&op, &tmp, instr, 0)) {
+		if (IS_PREFIX(instr))
+			sufx = *(unsigned int *)(instr_addr + 4);
+		if (!analyse_instr(&op, &tmp, instr, sufx)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
 			*phys_addr = (pfn << PAGE_SHIFT);
-- 
2.20.1

