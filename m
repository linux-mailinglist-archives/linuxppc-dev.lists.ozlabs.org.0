Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE261C6671
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 05:48:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2cd1vfjzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j2gYNsUp; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2VG0RnhzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:42:45 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t16so6998plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=010HlnN7FrCVyH9tpOeNeWppYr4up5rTiRDGj7PDNUM=;
 b=j2gYNsUpp6FeKGwjFGOZshkMa09WnfPpwz9ClEhlAlvWkbCRBtt+0IIxJ4ok809yCj
 iiDltFqHagNm6jR8oI7v8RMGEIwrkQUsbXVIGHY/lMcwFzUTnexVdUvNrRa1OdHYePCk
 vBQeYxdq7tutqbs9tmqanZ1il/FnrkLuN0UAA5mfAXVL39su/Ia45f0HLeueTp4i1z4/
 ozVRoqBJkIE/ReXym8BOyaX0xh8Z+DrCnEL1449sjFDwUn1ok/W9FRAd27k1beCxKmgc
 cIwkKjmhUiHmchpKesevXM6cdD8kisE8vXyIx9dcfVAdY0RS8y2GS6YiZVpxkNpLLwrH
 YjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=010HlnN7FrCVyH9tpOeNeWppYr4up5rTiRDGj7PDNUM=;
 b=dbu9M2hB+mnKK71iM0ZdtnVgnvh2Dccj2vy+UOY4cUKmQzmSISGoocSGRjx/F8pCgl
 QXC1Y29bp5QHyMBEs2es3pPvyWg+OuGMuk/nLqKqDqfW2xymzOL4KaTA8d2zMo9OGEh8
 wOWM1hgH7djAPxrMJeGWD38jNXb5ppvn7DfWTB9QWZ8mErRmDMG0Gx3CUUOEx/o6flbS
 PXPkRUrg0Uvv56hruwxO/jLytYDJIr+eoMVi1pKteHZnQjYBYfjFzQ24xFsq8PqUUpSX
 X5J/22sB2DtIYdicYzauAfcGk4ltPgdc65CvFhR/4zKgmQEPjxY4R0duiGDSeBqXwFt+
 ndvg==
X-Gm-Message-State: AGi0PuYRd+O3NEde57CUnLjuK6EFiZ4wfJ0sOR0sfs7S8jKTc0yu+wSs
 cLUfwMx7hKxgVH74umwiTfoB6BvWv50VYw==
X-Google-Smtp-Source: APiQypIzAHY/e4o/W9OysMIZqCNDHNKTERyiVDwkyhkpHK2wglHtiYLb5ylQyaXImO2olCxxj8y5ig==
X-Received: by 2002:a17:90a:cc9:: with SMTP id 9mr6446455pjt.16.1588736560847; 
 Tue, 05 May 2020 20:42:40 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:42:40 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 02/30] powerpc/xmon: Move breakpoint instructions to own
 array
Date: Wed,  6 May 2020 13:40:22 +1000
Message-Id: <20200506034050.24806-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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

To execute an instruction out of line after a breakpoint, the NIP is set
to the address of struct bpt::instr. Here a copy of the instruction that
was replaced with a breakpoint is kept, along with a trap so normal flow
can be resumed after XOLing. The struct bpt's are located within the
data section. This is problematic as the data section may be marked as
no execute.

Instead of each struct bpt holding the instructions to be XOL'd, make a
new array, bpt_table[], with enough space to hold instructions for the
number of supported breakpoints. A later patch will move this to the
text section.
Make struct bpt::instr a pointer to the instructions in bpt_table[]
associated with that breakpoint. This association is a simple mapping:
bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
the copied instruction followed by a trap, so 2 words per breakpoint.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: - Do not use __section(), use a .space directive in .S file
    - Simplify in_breakpoint_table() calculation
    - Define BPT_SIZE
v6: - Seperate moving to text section
---
 arch/powerpc/xmon/xmon.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f91ae2c9adbe..14c578e0383a 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -98,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	unsigned int	instr[2];
+	unsigned int	*instr;
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -117,6 +117,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
+#define BPT_SIZE       (sizeof(unsigned int) * 2)
+#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
+static unsigned int bpt_table[NBPTS * BPT_WORDS];
+
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
@@ -854,15 +858,13 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 {
 	unsigned long off;
 
-	off = nip - (unsigned long) bpts;
-	if (off >= sizeof(bpts))
+	off = nip - (unsigned long)bpt_table;
+	if (off >= sizeof(bpt_table))
 		return NULL;
-	off %= sizeof(struct bpt);
-	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	*offp = off % BPT_SIZE;
+	if (*offp != 0 && *offp != 4)
 		return NULL;
-	*offp = off - offsetof(struct bpt, instr[0]);
-	return (struct bpt *) (nip - off);
+	return bpts + (off / BPT_SIZE);
 }
 
 static struct bpt *new_breakpoint(unsigned long a)
@@ -877,7 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
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

