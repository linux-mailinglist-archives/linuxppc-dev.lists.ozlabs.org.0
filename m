Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC431BB3B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4hq1fdNzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:04:43 +1000 (AEST)
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
 header.s=20161025 header.b=UOy37BFz; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4ZZ4dm2zDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:59:18 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a31so435774pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qe4/kvD45s16rLd/YZl8NBmQ4pgg9Fl0SfaOAgZBoQw=;
 b=UOy37BFzmxYa8X7iqfEwh9mrRu4mNwEduPZYnrkT4x91wu7yt4llq15knX7knVRuDY
 GTtoAaGPI2TeSqS3D1DYo+QDk3XNEqLbAb9j1pcjc+D0O52fjiJRJ7j941+jAjrYoJ+2
 O3VPorKAB3QXKOabMx3r41O7rCkTJ140lBW/0r8Qn+cO0G/hH9I2OFnMOCXgb5CnaUoI
 2PWMk9ip+39sgl3qG7jDzyhKc7EXgj//2DcBVGeiMMGc4oVQtoqrVcmTAKl+YDW2pnbN
 tCMDsO/3TEVHGrL23seqFFgbHP2wMkVfG4qrgfbHPWo9lQn6bXQm34uJMGmqDxcZ8HyJ
 Dufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qe4/kvD45s16rLd/YZl8NBmQ4pgg9Fl0SfaOAgZBoQw=;
 b=lxcVccH2BKIK8QLWpUGATyuY1mjPCclywke4WMXwvXiKpzJIZFGTnnqlz2xKQqnPlP
 cpgzdSuDREspMU6vOfdX/vDAqSn3t11VzKiMWGXCSY1BREb3hAFrozxYRUIBSt2LwrHd
 eMmR2BValrvAe2I5I98jH0tlifTv+b40jIj8dtRNXfTn4/H9Hyi5B3wArHuDkepqKR9F
 9F2gHz31Q6lkwKZ5YoDxz0SRhY2O6DxQtABQysvjwlevIZEXiBmThGtGME2WpFHUa5yz
 VwK2pXSvsQIYcJI9W73kqnvHYlLLWmI8gmm8wDpPru9qmOw1QugfpNwBHBDx+nwGaOdq
 x+wA==
X-Gm-Message-State: AGi0PuYFrKzH2YEMVi5lm5Xx6ixezicUWUVeju/OR+toIuSmjh33FKLD
 TpvQJYsgQQdHqH4Vge6nZdP/E2FKdOQ=
X-Google-Smtp-Source: APiQypLJiyVOY36XVRhvsaFH1VaBBY3vMFfGpvOB2DMvbxm6D7aseM7D4VmuGUkA4Pp/YTfOihILQg==
X-Received: by 2002:a17:902:b402:: with SMTP id
 x2mr14904353plr.42.1588039154958; 
 Mon, 27 Apr 2020 18:59:14 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:59:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 02/28] powerpc/xmon: Move breakpoint instructions to own
 array
Date: Tue, 28 Apr 2020 11:57:48 +1000
Message-Id: <20200428015814.15380-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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
number of supported breakpoints. A later patch will move this to the
text section.
Make struct bpt::instr a pointer to the instructions in bpt_table[]
associated with that breakpoint. This association is a simple mapping:
bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
the copied instruction followed by a trap, so 2 words per breakpoint.

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
index 02e3bd62cab4..a064392df1b8 100644
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
@@ -116,6 +116,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
+#define BPT_SIZE       (sizeof(unsigned int) * 2)
+#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
+static unsigned int bpt_table[NBPTS * BPT_WORDS];
+
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
@@ -853,15 +857,13 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 {
 	unsigned long off;
 
-	off = nip - (unsigned long) bpts;
-	if (off >= sizeof(bpts))
+	off = nip - (unsigned long) bpt_table;
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
@@ -876,7 +878,8 @@ static struct bpt *new_breakpoint(unsigned long a)
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

