Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D018C6CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:23:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kBy16vKfzDrNX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:23:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pNrUKXou; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBrx4q9qzDrTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:18:57 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id x7so2492598pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Za/HqvZ7ZH2R48HLp9KQlG4Fu2psoORjHVcl8a33Em4=;
 b=pNrUKXou/JUuRo8LxfwwlT4mAXcrSOTbJs+8PiFgU/+zHhgKpczilXA5tz347iE5tI
 46Ze6TuK35Ca5NHGn7KQHS57E+2RQBT405SJGQITHzCThw8Px0ME0nzPBhhGnrRywh3A
 F9OJvYeWm2a7Y3dmu+rygyR53w53RNA36f8yp8aSbIs09+iwnmUsG3PoyhWc4ujzA/bP
 f79SkZk1MZQzkYsWB3olc+9cn72hw3+HBxDHnGQaWKfNu57Rc7qKEItB0GdlB8Hylv4q
 M2E9kEyy5QrhQyw+w4e9fL16qRcPBphhDPW+edEzLHSueCQD7nToVSZXfDD649DAi6f7
 T8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Za/HqvZ7ZH2R48HLp9KQlG4Fu2psoORjHVcl8a33Em4=;
 b=fRyalbZ2fm9UHlL/c+ZfVABBNbxAla67i1move5U2IaXxN039eFNbnGDNHCHSHRrqz
 bW4B6syMNQ+Ga/4F0eq9JpeP8Y+uutdQ+aXM2zKISFe8pBc6XiOkcS15a+/6YXEs5a3o
 bhzahoVglTU3iyT8omwgLGI+Xr9mI6qIzx0vzePT5XiKgjb1WWhLidso/kW73CgilIbf
 Bnpg8CYpZ6FpfUSfcn2uGYqUtYJZwzNDhTrWAwS3Az/79WAGueac6BPbwGZi/euXk1EV
 CGZSsqQ6CCJJT0B29dZp8iAnDXoxGWdtsjXRlMMSda2VeH5vCFRMbiDQdmlzR5Ldcd/n
 D2Dw==
X-Gm-Message-State: ANhLgQ2p068K1nSgI0rvw3lBrJpvgWssyAtqfqmMQxmEB+KU3ywdgtCU
 YMyLyuEKIQk2YE4rsjKrWCsV3rLhI90=
X-Google-Smtp-Source: ADFU+vvbdaJx4zykaEthVzjRI6RcsiHcYt7I7uiqlM4OuLPJZJiovTFiQKo7iD16qJLZgfcJ8O2f1Q==
X-Received: by 2002:a63:2882:: with SMTP id o124mr6571696pgo.390.1584681535336; 
 Thu, 19 Mar 2020 22:18:55 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:18:54 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 02/16] xmon: Move out-of-line instructions to text section
Date: Fri, 20 Mar 2020 16:17:55 +1100
Message-Id: <20200320051809.24332-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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

To execute an instruction out of line after a breakpoint, the NIP is set
to the address of struct bpt::instr. Here a copy of the instruction that
was replaced with a breakpoint is kept, along with a trap so normal flow
can be resumed after XOLing. The struct bpt's are located within the
data section. This is problematic as the data section may be marked as
no execute.

Instead of each struct bpt holding the instructions to be XOL'd, make a
new array, bpt_table[], with enough space to hold instructions for the
number of supported breakpoints. Place this array in the text section.
Make struct bpt::instr a pointer to the instructions in bpt_table[]
associated with that breakpoint. This association is a simple mapping:
bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
the copied instruction followed by a trap, so 2 words per breakpoint.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/kernel/vmlinux.lds.S |  2 +-
 arch/powerpc/xmon/xmon.c          | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index b4c89a1acebb..e90845b8c300 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -86,7 +86,7 @@ SECTIONS
 		ALIGN_FUNCTION();
 #endif
 		/* careful! __ftr_alt_* sections need to be close to .text */
-		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .ref.text);
+		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .ref.text .text.xmon_bpts);
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.text);
 #endif
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 02e3bd62cab4..7875d1a37770 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -97,7 +97,7 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	unsigned int	instr[2];
+	unsigned int	*instr;
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -109,6 +109,7 @@ struct bpt {
 #define BP_DABR		4
 
 #define NBPTS	256
+#define BPT_WORDS	2
 static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
@@ -116,6 +117,8 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
+static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WORDS];
+
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
@@ -852,16 +855,16 @@ static struct bpt *at_breakpoint(unsigned long pc)
 static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 {
 	unsigned long off;
+	unsigned long bp_off;
 
-	off = nip - (unsigned long) bpts;
-	if (off >= sizeof(bpts))
+	off = nip - (unsigned long) bpt_table;
+	if (off >= sizeof(bpt_table))
 		return NULL;
-	off %= sizeof(struct bpt);
-	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	bp_off = off % (sizeof(unsigned int) * BPT_WORDS);
+	if (bp_off != 0 && bp_off != 4)
 		return NULL;
-	*offp = off - offsetof(struct bpt, instr[0]);
-	return (struct bpt *) (nip - off);
+	*offp = bp_off;
+	return bpts + ((off - bp_off) / (sizeof(unsigned int) * BPT_WORDS));
 }
 
 static struct bpt *new_breakpoint(unsigned long a)
@@ -876,7 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			patch_instruction(&bp->instr[1], bpinstr);
+			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
+			patch_instruction(bp->instr + 1, bpinstr);
 			return bp;
 		}
 	}
-- 
2.17.1

