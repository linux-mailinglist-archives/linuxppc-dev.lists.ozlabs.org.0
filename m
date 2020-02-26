Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356116F671
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:28:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2qW14VfzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iljQkqOv; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2NT2WmhzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:41 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id e9so702514pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/Kv0KMoYBv98pHJyIRWtVhxLJiinGCIHEypQRvqFJQg=;
 b=iljQkqOv4MsgpQ0AWaPY9XoSf4RZTB8lHUEBaoeFhmPbFHUUwNMx6b3fBzvrKRlUIR
 3jmlzRU1tuslB2ec4pAEbr+N+1IAnrmwS/cV2d2taLve3JizDVgVb8unaV5Qgl6gCYLy
 1hBqbpeOBc7LssJgcA0KhIJ1xRBxTpl0LRLZ2r3Ufs3KMVNJy5G/yXRBEJFctTqPI3s6
 ucsYyAp5n4u/jNCIPMUw8H3KML1jd4/7zIxC98r8O17AJhhsZFKylkMbo2NrmgVtxVEy
 CXCBXj7x81NglKTrRdOdV//Aub3iTfartL1qBA8AJfvTFi+GslZuT5dfioVz/roY6kRE
 Ah/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/Kv0KMoYBv98pHJyIRWtVhxLJiinGCIHEypQRvqFJQg=;
 b=Kcf47+sDI4I7aws4UnjtFlrTvsTTKEUQSkWlE8jRqGjtK9A7VEfHG+kOhza0dQTKdH
 vqucwXzZxq/WIT/ovuO1N0A8Q3av13OpiT4OHo7RAEK6cgefPIJ0mN/z6w7Ku69uMuWZ
 QU8X1RCzOprJ80ngNRv3fh2xbzyiW09uWtaG73Fjdu/FYVz5u6Oo7rGkTZy6v0jwZLY+
 JyxkS14eIz3MFlX2fl8TUDTYAG6oZfFi+mV6Il4g7/Y6JxiZE+z4ENMl3gM93TsGxLd2
 v7sgnXPoy8OAXeVxjGdxvRdVso6npC3m5h1rVI9I9SrXbPDfc2tB0jxi4DPdYCo5K0Yl
 fxVw==
X-Gm-Message-State: APjAAAVxmUwXO+XPEFxWjoZC3H19riMJk000DzkiIpUiIx5suky0o6lO
 VS4+x8BUlJN8BtdCic3+KH7n8St7jmQ=
X-Google-Smtp-Source: APXvYqzaQahQk5YCqNFJKGiGUKkBgIFc98H4e8TareFUPYfALme/83Tvko4R3t8px+vC5WrMTZncoA==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr2030489plb.171.1582690118114; 
 Tue, 25 Feb 2020 20:08:38 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:37 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
 instructions
Date: Wed, 26 Feb 2020 15:07:11 +1100
Message-Id: <20200226040716.32395-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A prefixed instruction is composed of a word prefix and a word suffix.
It does not make sense to be able to have a breakpoint on the suffix of
a prefixed instruction, so make this impossible.

When leaving xmon_core() we check to see if we are currently at a
breakpoint. If this is the case, the breakpoint needs to be proceeded
from. Initially emulate_step() is tried, but if this fails then we need
to execute the saved instruction out of line. The NIP is set to the
address of bpt::instr[] for the current breakpoint.  bpt::instr[]
contains the instruction replaced by the breakpoint, followed by a trap
instruction.  After bpt::instr[0] is executed and we hit the trap we
enter back into xmon_bpt(). We know that if we got here and the offset
indicates we are at bpt::instr[1] then we have just executed out of line
so we can put the NIP back to the instruction after the breakpoint
location and continue on.

Adding prefixed instructions complicates this as the bpt::instr[1] needs
to be used to hold the suffix. To deal with this make bpt::instr[] big
enough for three word instructions.  bpt::instr[2] contains the trap,
and in the case of word instructions pad bpt::instr[1] with a noop.

No support for disassembling prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Rename sufx to suffix
v3: - Just directly use PPC_INST_NOP
    - Typo: plac -> place
    - Rename read_inst() to mread_inst(). Do not have it call mread().
---
 arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a673cf55641c..a73a35aa4a75 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	unsigned int	instr[2];
+	/* Prefixed instructions can not cross 64-byte boundaries */
+	unsigned int	instr[3] __aligned(64);
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -120,6 +121,7 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
+static int mread_instr(unsigned long, unsigned int *, unsigned int *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -701,7 +703,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
 			int stepped = emulate_step(regs, bp->instr[0],
-						   PPC_NO_SUFFIX);
+						   bp->instr[1]);
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
@@ -756,8 +758,8 @@ static int xmon_bpt(struct pt_regs *regs)
 
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
-	if (bp != NULL && offset == 4) {
-		regs->nip = bp->address + 4;
+	if (bp != NULL && (offset == 4 || offset == 8)) {
+		regs->nip = bp->address + offset;
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
@@ -858,8 +860,9 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 	if (off >= sizeof(bpts))
 		return NULL;
 	off %= sizeof(struct bpt);
-	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	if (off != offsetof(struct bpt, instr[0]) &&
+	    off != offsetof(struct bpt, instr[1]) &&
+	    off != offsetof(struct bpt, instr[2]))
 		return NULL;
 	*offp = off - offsetof(struct bpt, instr[0]);
 	return (struct bpt *) (nip - off);
@@ -876,8 +879,16 @@ static struct bpt *new_breakpoint(unsigned long a)
 
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
+			/*
+			 * Prefixed instructions are two words, but regular
+			 * instructions are only one. Use a nop to pad out the
+			 * regular instructions so that we can place the trap
+			 * at the same place. For prefixed instructions the nop
+			 * will get overwritten during insert_bpts().
+			 */
 			bp->address = a;
-			patch_instruction(&bp->instr[1], bpinstr);
+			patch_instruction(&bp->instr[1], PPC_INST_NOP);
+			patch_instruction(&bp->instr[2], bpinstr);
 			return bp;
 		}
 	}
@@ -889,13 +900,15 @@ static struct bpt *new_breakpoint(unsigned long a)
 static void insert_bpts(void)
 {
 	int i;
-	struct bpt *bp;
+	unsigned int prefix;
+	struct bpt *bp, *bp2;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
 			continue;
-		if (mread(bp->address, &bp->instr[0], 4) != 4) {
+		if (!mread_instr(bp->address, &bp->instr[0],
+				 &bp->instr[1])) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
@@ -907,7 +920,34 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
+		/*
+		 * Check the address is not a suffix by looking for a prefix in
+		 * front of it.
+		 */
+		if ((mread(bp->address - 4, &prefix, 4) == 4) &&
+		    IS_PREFIX(prefix)) {
+			printf("Breakpoint at %lx is on the second word of a "
+			       "prefixed instruction, disabling it\n",
+			       bp->address);
+			bp->enabled = 0;
+			continue;
+		}
+		/*
+		 * We might still be a suffix - if the prefix has already been
+		 * replaced by a breakpoint we won't catch it with the above
+		 * test.
+		 */
+		bp2 = at_breakpoint(bp->address - 4);
+		if (bp2 && IS_PREFIX(bp2->instr[0])) {
+			printf("Breakpoint at %lx is on the second word of a "
+			       "prefixed instruction, disabling it\n",
+			       bp->address);
+			bp->enabled = 0;
+			continue;
+		}
 		patch_instruction(&bp->instr[0], bp->instr[0]);
+		if (IS_PREFIX(bp->instr[0]))
+			patch_instruction(&bp->instr[1], bp->instr[1]);
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((unsigned int *)bp->address,
@@ -1155,14 +1195,14 @@ static int do_step(struct pt_regs *regs)
  */
 static int do_step(struct pt_regs *regs)
 {
-	unsigned int instr;
+	unsigned int instr, suffix;
 	int stepped;
 
 	force_enable_xmon();
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
-		if (mread(regs->nip, &instr, 4) == 4) {
-			stepped = emulate_step(regs, instr, PPC_NO_SUFFIX);
+		if (mread_instr(regs->nip, &instr, &suffix)) {
+			stepped = emulate_step(regs, instr, suffix);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
 				       (IS_RFID(instr)? "rfid": "mtmsrd"));
@@ -2121,6 +2161,32 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int
+mread_instr(unsigned long adrs, unsigned int *instr,
+	    unsigned int *suffix)
+{
+	int n;
+
+	n = 0;
+	if (setjmp(bus_error_jmp) == 0) {
+		catch_memory_errors = 1;
+		sync();
+		*instr = *(unsigned int *)adrs;
+		sync();
+		if (!IS_PREFIX(*instr)) {
+			n = 4;
+		} else {
+			*suffix = *(unsigned int *)(adrs + 4);
+			n = 8;
+		}
+		sync();
+		/* wait a little while to see if we get a machine check */
+		__delay(200);
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

