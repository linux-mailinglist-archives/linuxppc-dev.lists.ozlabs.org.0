Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B41C0CCA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:48:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cysf43CpzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:48:54 +1000 (AEST)
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
 header.s=20161025 header.b=rHnkMQeI; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cylj6nHjzDrMF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:43:45 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id a7so1905163pju.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4AJKHmEQYqBAYvu3VLcRKRRqWXQ3QXSaXBNHQ7k31DU=;
 b=rHnkMQeIPLFBw3sRLr5AV/gt8mr4yvAJR601Y/bSEZ+lyqs6fL8e8q7tYgzwAi0nmS
 cQ+7iZ4rzZRSXykoqv5Wk4Kxwhu7wSglZSvd5qL6kYO0eDvXP+K8PmEhWl8YcH8VxO6f
 5kDAaI31lv1k59zz2F595A+uHiZ830Jxn1Wva2qlpo/OQDKOCiuQSBbPeUwvIFfwl5G6
 7hf2zbQidxPVZ+Jt/MvXySNtQuBFmVpROUDuvX3yyD5JJzl8Cdm5c7UTRfMqHh5E73WG
 8+zfqZgT1DllOppWs4q44RV6QhgNtgP1ijm0ijLl+n/Vjdq5nb4UClsiOMioiOu95Vd1
 mQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4AJKHmEQYqBAYvu3VLcRKRRqWXQ3QXSaXBNHQ7k31DU=;
 b=H5hhHQKAWn3EMaLCSdS8zBoiuvjl4aT1sNvYCmAPcVBfDF8mM4C3bUcncI7kSOfRdb
 Izg8G/9fTjgY1qoI9OaniaLxljo5db12fTBBijurfoPNyOck/eVcHvqk9jjzUW6nL5HF
 odThoc7VBmz916JltoZhs2avOx2D6wFPL678tXbZ7oHvDMND6b42iGrgoX5PbSoYxejU
 32wqNWDu1odBBOBUEaXsMnkrOBHQYvXk0iSMalefPp7UcpSnxBreJ3YCXXh76R2kZCE4
 ZR2U+vciS7bzcmTPJJa3XPDuTCj/mBC3xj4LDpF1atRvp3K1AYwGIZq4Ka6sTj2Bv+LT
 pwUg==
X-Gm-Message-State: AGi0PuZaC1zzinSyRTkpa48BKNQ92hO2v5epqgEf5IYlhLtyz9sMzb41
 gDOEoedUfVtPj7n7Ktv2aezAjX03QvxCYQ==
X-Google-Smtp-Source: APiQypKMqkH+eElN32mOLg/OA8vjvsujIKwbN+kxgkUAqHYKSr/YbH2DGwAZZooNc40J+sXBk018LA==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr2510114pls.144.1588304623434; 
 Thu, 30 Apr 2020 20:43:43 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:43:43 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 02/28] powerpc/xmon: Move breakpoint instructions to own
 array
Date: Fri,  1 May 2020 13:41:54 +1000
Message-Id: <20200501034220.8982-3-jniethe5@gmail.com>
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
index f91ae2c9adbe..6ba7f66c1dd0 100644
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

