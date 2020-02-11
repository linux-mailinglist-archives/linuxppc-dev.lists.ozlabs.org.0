Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D077F1589C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:52:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsPF4C51zDqCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:52:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Elc+ifKy; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs2X1JP8zDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:36:20 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id d5so791326pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q1KYvS5w9cXG823BbVPAXWQF0SfvcxyycTeqzzVQy/E=;
 b=Elc+ifKyR/LJDwRnS/BSBI/qskGkhb5BsCwvPRIQgbieXRUU4PUDQGN61hJEv7zp64
 GeEcwW/1bJ/kQU/6Kw15dHH/fMerby3SaIeS3QEy83IzaCELY3ac48RP/TQsKubPmcBb
 sXCeqJvx89r6K8fL+YuPPfJBpKVnll5rmFcTLWsKilTbbJ3X1xTJpF+LN4rylNQqPdNv
 9Ik87y1mDKxriBTggsr5/THqfY35C/lGUh+v8QQCeGluF6IuX3o9eOuv1R5mKGw1WuBL
 emll4Lt+2VDb93dVTmbG6UVX6qIT149/XK5RsrsmMUe4j1IImk2aGRUubMR7+nwULso/
 CJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q1KYvS5w9cXG823BbVPAXWQF0SfvcxyycTeqzzVQy/E=;
 b=fWrSTJg/mLwWfD1ezaLx0PHVsncossaZbVlW2mAtEo5FnpDZcJTdH30f4IyV9d3Hsv
 ftTU2P8dolB2iXru6s2WaAOAJ/Eh4M+J6eOXZFj/Lm9fJMiWGXgUc48YuSBNx5145KqS
 H9pibJSR0PykjdmyUaphZA3fHhlyv80XtAwKSOPulf2XeDE7afwiVNbUcIwUdBZ0DOTQ
 ugKtwvwhICcQiVvg0Qm6rxnlaESBLH0LS6xP0N/OAuJD72WUXLqGMW7GhUVri3FguUCM
 qFbBhcolHc+bUWyOmptOrlZJoNKcQOiEFLjYxEraUMnr5r4r697g1Ar1E49hBhLwheET
 n4bQ==
X-Gm-Message-State: APjAAAW+KskhjZsTg0ie7iTXmcQp3jrp63LWSWzPPb+AaqrAd0kAnWEi
 JoJuEqBg1E4/DaGGVl9tR72RwQvd3nnxqg==
X-Google-Smtp-Source: APXvYqzE0IW584LanbYV7+og7JRr2FanjsPa4PEyG6MchsyAO2iL5Y8+sdCwU1RumXuhRaUmb3WoWg==
X-Received: by 2002:a17:902:aa96:: with SMTP id
 d22mr1573390plr.204.1581399377475; 
 Mon, 10 Feb 2020 21:36:17 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:36:17 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/13] powerpc/xmon: Add initial support for prefixed
 instructions
Date: Tue, 11 Feb 2020 16:33:50 +1100
Message-Id: <20200211053355.21574-9-jniethe5@gmail.com>
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
---
 arch/powerpc/xmon/xmon.c | 82 ++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 897e512c6379..0b085642bbe7 100644
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
@@ -113,6 +114,7 @@ static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
 static unsigned bpinstr = 0x7fe00008;	/* trap */
+static unsigned nopinstr = 0x60000000;	/* nop */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
@@ -120,6 +122,7 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
 static int mwrite(unsigned long, void *, int);
+static int read_instr(unsigned long, unsigned int *, unsigned int *);
 static int handle_fault(struct pt_regs *);
 static void byterev(unsigned char *, int);
 static void memex(void);
@@ -706,7 +709,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
 			int stepped = emulate_step(regs, bp->instr[0],
-						   PPC_NO_SUFFIX);
+						   bp->instr[1]);
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
@@ -761,8 +764,8 @@ static int xmon_bpt(struct pt_regs *regs)
 
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
-	if (bp != NULL && offset == 4) {
-		regs->nip = bp->address + 4;
+	if (bp != NULL && (offset == 4 || offset == 8)) {
+		regs->nip = bp->address + offset;
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
@@ -864,7 +867,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 		return NULL;
 	off %= sizeof(struct bpt);
 	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	    && off != offsetof(struct bpt, instr[1])
+	    && off != offsetof(struct bpt, instr[2]))
 		return NULL;
 	*offp = off - offsetof(struct bpt, instr[0]);
 	return (struct bpt *) (nip - off);
@@ -881,9 +885,18 @@ static struct bpt *new_breakpoint(unsigned long a)
 
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
+			/*
+			 * Prefixed instructions are two words, but regular
+			 * instructions are only one. Use a nop to pad out the
+			 * regular instructions so that we can place the trap
+			 * at the same plac. For prefixed instructions the nop
+			 * will get overwritten during insert_bpts().
+			 */
 			bp->address = a;
-			bp->instr[1] = bpinstr;
+			bp->instr[1] = nopinstr;
 			store_inst(&bp->instr[1]);
+			bp->instr[2] = bpinstr;
+			store_inst(&bp->instr[2]);
 			return bp;
 		}
 	}
@@ -895,13 +908,15 @@ static struct bpt *new_breakpoint(unsigned long a)
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
+		if (!read_instr(bp->address, &bp->instr[0],
+			       &bp->instr[1])) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
@@ -913,7 +928,34 @@ static void insert_bpts(void)
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
 		store_inst(&bp->instr[0]);
+		if (IS_PREFIX(bp->instr[0]))
+			store_inst(&bp->instr[1]);
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((unsigned int *)bp->address,
@@ -1164,14 +1206,14 @@ static int do_step(struct pt_regs *regs)
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
+		if (read_instr(regs->nip, &instr, &suffix)) {
+			stepped = emulate_step(regs, instr, suffix);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
 				       (IS_RFID(instr)? "rfid": "mtmsrd"));
@@ -2130,6 +2172,24 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int read_instr(unsigned long addr, unsigned int *instr,
+		      unsigned int *suffix)
+{
+	int r;
+
+	r = mread(addr, instr, 4);
+	if (r != 4)
+		return 0;
+	if (!IS_PREFIX(*instr))
+		return 4;
+	r = mread(addr + 4, suffix, 4);
+	if (r != 4)
+		return 0;
+
+	return 8;
+}
+
+
 static int fault_type;
 static int fault_except;
 static char *fault_chars[] = { "--", "**", "##" };
-- 
2.17.1

