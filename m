Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9C1098F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:48:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXyB47LYzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d2q2sZsA"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNb3jwmzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:55 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id d199so3921795pfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EgqOnWOaJSHF9n1xkCEsMJ/XRSOW94YoCoP+NYVsfM=;
 b=d2q2sZsApVUiEG2UoAP7LqMczKb2XcTakY21tbgckx1kqL0D1cGOYzEP2w9EiJYIg6
 tMmgHtdcl2Y5Qu5q24q2JWAsoTziCR0Pc/XI/iPxweEVRSG5Me8NDKpKGgv807Ke8jMD
 7CBsjuTIXZ3/7QshYWBZDMrrTQVb/Ezi8/9QipzEVEJOYZzOo+ztaVV8xYwYxAzrHIuQ
 1tydNrMydeFTs0qQ5uJ74w7CWzigeFXCb5HkrYW/+QJVtSfG5OLJO0m414P6VfK4U8VS
 z/r4zEbZ+Bp2vFYBSvKTmmISdkNni+KPHCazaBNZoS9ky0s2/Ic5561dVICKOEKgsRbB
 qDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EgqOnWOaJSHF9n1xkCEsMJ/XRSOW94YoCoP+NYVsfM=;
 b=cU5jNd9wiurrUBa6j55BrM5P/8N10og13wBFLtnSwgSoIv30VLPkKqVpf5IquczwGr
 vSZmSQLb5JReGogmjKejBbjB00/cFsNfQC8RuBIdqTqCePzfEzr8bP/QfT9iHDtiWbjA
 cgG3JD85VRDGnsES4oLVZB2jKWjXBtQD0aStFYbdl34bpM8PHlaQ5XKchVb1FNteIJvd
 kc/B6q3F9Q08ZaqN2B/jGbp4HopuT3PL4ZFU0nhpz0l02YN7pFf2DLzXXmcVI30GKXdV
 4DtGaFgjICOMIPDa10QFhD1joBF7zl9GzJ3N2C61tccKBvfOkhEv7+83vFpLIf+CwFwZ
 jLmw==
X-Gm-Message-State: APjAAAUvhsW5sROtQhzAtxntbV0G6Hkc5+lhA+0RiNwXsVxI+iEwhNEF
 /g8oTOaew/5vDBHni+/9UWq3XtnC
X-Google-Smtp-Source: APXvYqx+bJYOjWIqP/n2/IF9vNF0+trM0hT+5GDVhfYkwoRgBFumubjJBsngQHjajvyBX7D0ZADMLg==
X-Received: by 2002:a63:fb15:: with SMTP id o21mr36234266pgh.193.1574745772412; 
 Mon, 25 Nov 2019 21:22:52 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:52 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/18] powerpc/xmon: Add initial support for prefixed
 instructions
Date: Tue, 26 Nov 2019 16:21:35 +1100
Message-Id: <20191126052141.28009-13-jniethe5@gmail.com>
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
 arch/powerpc/xmon/xmon.c | 82 ++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f47bd843dc52..93259a06eadc 100644
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
@@ -705,7 +708,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
-			int stepped = emulate_step(regs, bp->instr[0], 0);
+			int stepped = emulate_step(regs, bp->instr[0],
+						   bp->instr[1]);
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
@@ -760,8 +764,8 @@ static int xmon_bpt(struct pt_regs *regs)
 
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
-	if (bp != NULL && offset == 4) {
-		regs->nip = bp->address + 4;
+	if (bp != NULL && (offset == 4 || offset == 8)) {
+		regs->nip = bp->address + offset;
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
@@ -863,7 +867,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 		return NULL;
 	off %= sizeof(struct bpt);
 	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	    && off != offsetof(struct bpt, instr[1])
+	    && off != offsetof(struct bpt, instr[2]))
 		return NULL;
 	*offp = off - offsetof(struct bpt, instr[0]);
 	return (struct bpt *) (nip - off);
@@ -880,9 +885,18 @@ static struct bpt *new_breakpoint(unsigned long a)
 
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
@@ -894,13 +908,15 @@ static struct bpt *new_breakpoint(unsigned long a)
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
@@ -912,7 +928,33 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
+		/*
+		 * Check the address is not a suffix by looking for a prefix in
+		 * front of it.
+		 */
+		if ((mread(bp->address - 4, &prefix, 4) == 4) && IS_PREFIX(prefix)) {
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
@@ -1163,14 +1205,14 @@ static int do_step(struct pt_regs *regs)
  */
 static int do_step(struct pt_regs *regs)
 {
-	unsigned int instr;
+	unsigned int instr, sufx;
 	int stepped;
 
 	force_enable_xmon();
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
-		if (mread(regs->nip, &instr, 4) == 4) {
-			stepped = emulate_step(regs, instr, 0);
+		if (read_instr(regs->nip, &instr, &sufx)) {
+			stepped = emulate_step(regs, instr, sufx);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
 				       (IS_RFID(instr)? "rfid": "mtmsrd"));
@@ -2127,6 +2169,24 @@ mwrite(unsigned long adrs, void *buf, int size)
 	return n;
 }
 
+static int read_instr(unsigned long addr, unsigned int *instr,
+		      unsigned int *sufx)
+{
+	int r;
+
+	r = mread(addr, instr, 4);
+	if (r != 4)
+		return 0;
+	if (!IS_PREFIX(*instr))
+		return 4;
+	r = mread(addr + 4, sufx, 4);
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
2.20.1

