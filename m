Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F363419F1B0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:36:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkRS1m0bzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:36:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KWkHMnA+; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjsJ5087zDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:44 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id kx8so6116607pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LiWbbZ+NZy2lgfCL2p47sLMCwftqCoqt/aD3AlTT7ZA=;
 b=KWkHMnA+RpNCKBYpPJcrTR3568eEqAIjjNKnUsgSxhgdZo8LnU8J64n0uA9uW7oL5D
 00xSyhRxORpTXyD66ukOVUQkLK267+TVe5EWXyIrcMXwndMEjmiBEOICR6ZJg8N4yhEj
 iBSZ3sv5McvsHghFiHvveurYXXqfxNa4yUCGPnOTy3dkgGu5lvJjW4VvVblA9myoV8v6
 vr+LWVb74wh8UGwsfysEmvMGSzlsaEtNDIA+WvgiUIbQqdwKY8LHcsScLJRCuQKLwdV7
 bsEvRscwa1I47lt5iYDPEYyK2ZQpJ7nSlfHLbJJAnD28nvl4gR1NG+T4c6VSjzKHIFxz
 soLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LiWbbZ+NZy2lgfCL2p47sLMCwftqCoqt/aD3AlTT7ZA=;
 b=NaqYjQBNkIm+C0PdQLrV466OaBMB7pjd6VNyOFmplk7RGsaVc+nEmgw2iavGMBVQTH
 kCZX4qL42HRRQ9IgVP0MtWQ7oLOOdbrzgY90RiK2S/4t4aAAfqmkzHWm2QFAvhKCmtpA
 lQIzGLr728U3AhumkLSDNqaQqfkcX5uhHwCO8QRgx87kjL6wLCx+8dDbyq3EPQ9DE4Xz
 /xggpquT3RzdsOU0/SmxTv7UjU+ju1bdT6rxHJ1k6t82rmQNi5+HD6i2vUmxs4Vx86bq
 ZXLYXjwdbsdqn+ZDTMDPXbs3JvenEQQNubU47VoZ/SAOCAbG0Kr0JRj0NyCxYgXwTEu2
 IjmA==
X-Gm-Message-State: AGi0Pua1S4GIkOSB3DPe8ExvgqSq+XXiBTXQTM48DJGlCTOoIp5XXvBr
 fkNtXhhMboGGVpjjAvRWz3bwihh1LiI=
X-Google-Smtp-Source: APiQypI5fJgNZoU4mWPAKyEOyvj7P2yE4xRUsUNNmDFV626TZTQ8bPWu2GRZO5rilGYsJtEb9fyAgg==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr19097679plo.204.1586160642581; 
 Mon, 06 Apr 2020 01:10:42 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:42 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 13/21] powerpc/xmon: Use a function for reading instructions
Date: Mon,  6 Apr 2020 18:09:28 +1000
Message-Id: <20200406080936.7180-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in xmon, mread() is used for reading instructions. In
preparation for prefixed instructions, create and use a new function,
mread_instr(), especially for reading instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v5: New to series, seperated from "Add prefixed instructions to
instruction data type"
---
 arch/powerpc/xmon/xmon.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 5e3949322a6c..6f4cf01a58c1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -125,6 +125,7 @@ extern unsigned int bpt_table[NBPTS * BPT_WORDS];
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
+static int mread_instr(unsigned long, struct ppc_inst *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -899,7 +900,7 @@ static void insert_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
 			continue;
-		if (mread(bp->address, &instr, 4) != 4) {
+		if (!mread_instr(bp->address, &instr)) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
@@ -949,7 +950,7 @@ static void remove_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
-		if (mread(bp->address, &instr, 4) == 4
+		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
 			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
@@ -1165,7 +1166,7 @@ static int do_step(struct pt_regs *regs)
 	force_enable_xmon();
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
-		if (mread(regs->nip, &instr, 4) == 4) {
+		if (mread_instr(regs->nip, &instr)) {
 			stepped = emulate_step(regs, instr);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
@@ -1332,7 +1333,7 @@ static long check_bp_loc(unsigned long addr)
 		printf("Breakpoints may only be placed at kernel addresses\n");
 		return 0;
 	}
-	if (!mread(addr, &instr, sizeof(instr))) {
+	if (!mread_instr(addr, &instr)) {
 		printf("Can't read instruction at address %lx\n", addr);
 		return 0;
 	}
@@ -2125,6 +2126,21 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int
+mread_instr(unsigned long adrs, struct ppc_inst *instr)
+{
+	if (setjmp(bus_error_jmp) == 0) {
+		catch_memory_errors = 1;
+		sync();
+		*instr = ppc_inst_read((struct ppc_inst *)adrs);
+		sync();
+		/* wait a little while to see if we get a machine check */
+		__delay(200);
+	}
+	catch_memory_errors = 0;
+	return ppc_inst_len(*instr);
+}
+
 static int fault_type;
 static int fault_except;
 static char *fault_chars[] = { "--", "**", "##" };
-- 
2.17.1

