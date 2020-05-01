Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC541C0D29
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:21:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzbS4nD9zDqSh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZSj7Vf3G; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cyrp3bvvzDrJj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:48:10 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l12so1172464pgr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nIuK+TA0QgrR8kNEwkfMD7pgsvDsWyJLoI3RwqcRakA=;
 b=ZSj7Vf3GpeexKxgVra9AUU+jDpcMV/uM77PYgJ0tAC5C4CgKgxqCx1619ASslYeeMj
 naU3S3x4roiL/yS2RQcwH7p4TPyZMFrzQydLBZWYaGgx27D1/xgBUD9TjPY7A80afZaM
 FlU+Ey373peFOw+OspKIsp0LraJ5FwhjRhJOYQtW5vsEP/DPAvx0uHMWlZRop8cBG+dq
 AJ4niNBHGexibLTEsoajmaNGa5dE4isypGXUpMeXoZslNjoBs0hnsHM0o+yEDq65hrzN
 fh2gDmyEHl/w/UMcmqaf1NFmELGbArEJ3GlcScabtzmJpcjnK7OgM+CsJPfCA7KCAmtv
 LhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nIuK+TA0QgrR8kNEwkfMD7pgsvDsWyJLoI3RwqcRakA=;
 b=H5W9lm53qRz7PnXRFV4mKYC0sBY4Xt6OJt7FQkwqr/D4wQ/526ouGEb2B58UHkwHkC
 Hkld0GIyI4t/S9jX3SJSFad+XCKhUOlXboFjQ/V6L17b+wOrEpZrVQxWuoQ5vo54uqpn
 sujLvjCKOVk94w62O8NuWbahVGlVdwQShsQ7alVWjIFyFioN7fNJzW4+x7tYJ+0ZVItw
 o+j0Ah1nQB1bqwNf/SgXoBs0zx54R1S/fBJwy0pkeEVrsG7/WNoDHsFrLgSygG7vxecq
 rztxWgXpYWJ9ItA2TZrOmNzGQS9tBfOgkW6OOVYqQQ9y29gl9VUuwHwjN3RQ+s4IW6Sx
 f07g==
X-Gm-Message-State: AGi0PuYhp8GQacQ+ycI5MTooUZXaju3PfsAQDYum5EN+K9eFqNPld7+2
 rbcCV1rhMvdNHzoms6QUIGLgodGZDf296g==
X-Google-Smtp-Source: APiQypJ20TAWz7zJvJqGt/WjFVbGd4znWULQ2QtvHiIM6eJEJJDWpi3z6/TcvB2d3cUXdwHPu1cEQg==
X-Received: by 2002:a62:a10c:: with SMTP id b12mr2332908pff.14.1588304888307; 
 Thu, 30 Apr 2020 20:48:08 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:48:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 18/28] powerpc/xmon: Use a function for reading instructions
Date: Fri,  1 May 2020 13:42:10 +1000
Message-Id: <20200501034220.8982-19-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
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
v6: mread_instr(): correctly return error status
---
 arch/powerpc/xmon/xmon.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index cde733a82366..1947821e425d 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -122,6 +122,7 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
+static int mread_instr(unsigned long, struct ppc_inst *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -896,7 +897,7 @@ static void insert_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
 			continue;
-		if (mread(bp->address, &instr, 4) != 4) {
+		if (!mread_instr(bp->address, &instr)) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
@@ -946,7 +947,7 @@ static void remove_bpts(void)
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
-		if (mread(bp->address, &instr, 4) == 4
+		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
 			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
@@ -1162,7 +1163,7 @@ static int do_step(struct pt_regs *regs)
 	force_enable_xmon();
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
-		if (mread(regs->nip, &instr, 4) == 4) {
+		if (mread_instr(regs->nip, &instr)) {
 			stepped = emulate_step(regs, instr);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
@@ -1329,7 +1330,7 @@ static long check_bp_loc(unsigned long addr)
 		printf("Breakpoints may only be placed at kernel addresses\n");
 		return 0;
 	}
-	if (!mread(addr, &instr, sizeof(instr))) {
+	if (!mread_instr(addr, &instr)) {
 		printf("Can't read instruction at address %lx\n", addr);
 		return 0;
 	}
@@ -2122,6 +2123,25 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int
+mread_instr(unsigned long adrs, struct ppc_inst *instr)
+{
+	volatile int n;
+
+	n = 0;
+	if (setjmp(bus_error_jmp) == 0) {
+		catch_memory_errors = 1;
+		sync();
+		*instr = ppc_inst_read((struct ppc_inst *)adrs);
+		sync();
+		/* wait a little while to see if we get a machine check */
+		__delay(200);
+		n = ppc_inst_len(*instr);
+	}
+	catch_memory_errors = 0;
+	return n;
+}
+
 static int fault_type;
 static int fault_except;
 static char *fault_chars[] = { "--", "**", "##" };
-- 
2.17.1

