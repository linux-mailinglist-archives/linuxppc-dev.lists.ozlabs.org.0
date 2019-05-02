Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC03211458
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 09:41:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vnJg3yzPzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="YVH6Db1/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sqVubO9i"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vnH80BPKzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 17:40:19 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8E83B6BF;
 Thu,  2 May 2019 03:40:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 02 May 2019 03:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=k4pXtm8xkHvUx4Scv5VFXn9Qq5
 qoA16qYXPG+Z0X1Qg=; b=YVH6Db1/ghTeJeLV4YTCyETcx79TzRj3DNFz5Dp7uk
 b5r/W2kUy9ulUZlmPonwzjkM9Puk9h3aM8gpQ3iPHadKSXw2PZPN9I9XGWC7e9HK
 IFXOpSPnNd7JtHSY8x/IQYSWDDG5tn7fCQTV0GnvNyKS6PRl2tNcNkyLTTUx44g/
 FdvASVfJGRxImWpU9YdkhV7bAghYzMLPzhIM6OwOL+ZRD2S9E6NQqX+Ha5A1Z1vP
 Y0Mf3lIiuoOhFN7Wgsg8Cs3n84d3dVJZgtOyw76ePd1LCdVLShUeru+5l/6djEAP
 2W54pw1CDeYl2eFfEGe42lts24IaxYilfahXIMt0GjGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k4pXtm8xkHvUx4Scv
 5VFXn9Qq5qoA16qYXPG+Z0X1Qg=; b=sqVubO9ihHFivF7BXLEVj0v5nVyN0DW4Q
 j8Lv2rXJVoc02TICNG/sWJJZI13gltrseuf5DA/g5xRSCT8KLOGYXYrXDDxkdasR
 FxlbMcSTA8HqThl0/+5qa7ftJPJOTSAheXNNfjA1dSdIBREP9BfaE7RlhCeneRLA
 gA1cSpUMi2CqWaEqeN/ut9A7PH7ouc7N5ZA4dCMnHXI9ws6DA+szoN/JX2XhVfSL
 Zpf4O6D/MBGN6mCiLXK5uYADd67aKIRmfw3htSeJa4jUVz8rrHb7AxhZN9Ze0CHL
 oFI4R6D6Kjmw2tiV39Mys1yS930+gWRjUC0ojOoStSTltm/ATtScw==
X-ME-Sender: <xms:3Z7KXLb38xPmfU-vccBj5e2moL4pevmAyArBdufzDVN7My6l9j96mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrd
 dutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgt
 tgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:3Z7KXOHv-3zOnVGJ-R21Qi_OpqNqfy-Fozp9KF793Kh_bIJyeSnNUA>
 <xmx:3Z7KXGmWrJk30zE-kCHtD6U1mfcXA8igsC6KMPkg8yvLYHTxJcywBg>
 <xmx:3Z7KXDCo6mTHb7PY-soZfEcYoUsTUIFSQS-njCqC2vehc-gGD7xw2A>
 <xmx:357KXGu1IuEP5y-OWW4XapWZhgpvMEjgWtdhTliAxG8sdUyR6cpq-A>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1794A10369;
 Thu,  2 May 2019 03:40:10 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/mm/ptdump: Wrap seq_printf() to handle NULL
 pointers
Date: Thu,  2 May 2019 17:39:46 +1000
Message-Id: <20190502073947.6481-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.21.0
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com,
 Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lovingly borrowed from the arch/arm64 ptdump code.

This doesn't seem to be an issue in practice, but is necessary for my
upcoming commit.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: Fix putc to actually putc thanks to Christophe Leroy

 arch/powerpc/mm/ptdump/ptdump.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 37138428ab55..a4a132f92810 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -104,6 +104,18 @@ static struct addr_marker address_markers[] = {
 	{ -1,	NULL },
 };
 
+#define pt_dump_seq_printf(m, fmt, args...)	\
+({						\
+	if (m)					\
+		seq_printf(m, fmt, ##args);	\
+})
+
+#define pt_dump_seq_putc(m, c)		\
+({					\
+	if (m)				\
+		seq_putc(m, c);		\
+})
+
 static void dump_flag_info(struct pg_state *st, const struct flag_info
 		*flag, u64 pte, int num)
 {
@@ -121,19 +133,19 @@ static void dump_flag_info(struct pg_state *st, const struct flag_info
 			val = pte & flag->val;
 			if (flag->shift)
 				val = val >> flag->shift;
-			seq_printf(st->seq, "  %s:%llx", flag->set, val);
+			pt_dump_seq_printf(st->seq, "  %s:%llx", flag->set, val);
 		} else {
 			if ((pte & flag->mask) == flag->val)
 				s = flag->set;
 			else
 				s = flag->clear;
 			if (s)
-				seq_printf(st->seq, "  %s", s);
+				pt_dump_seq_printf(st->seq, "  %s", s);
 		}
 		st->current_flags &= ~flag->mask;
 	}
 	if (st->current_flags != 0)
-		seq_printf(st->seq, "  unknown flags:%llx", st->current_flags);
+		pt_dump_seq_printf(st->seq, "  unknown flags:%llx", st->current_flags);
 }
 
 static void dump_addr(struct pg_state *st, unsigned long addr)
@@ -148,12 +160,12 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 #define REG		"0x%08lx"
 #endif
 
-	seq_printf(st->seq, REG "-" REG " ", st->start_address, addr - 1);
+	pt_dump_seq_printf(st->seq, REG "-" REG " ", st->start_address, addr - 1);
 	if (st->start_pa == st->last_pa && st->start_address + PAGE_SIZE != addr) {
-		seq_printf(st->seq, "[" REG "]", st->start_pa);
+		pt_dump_seq_printf(st->seq, "[" REG "]", st->start_pa);
 		delta = PAGE_SIZE >> 10;
 	} else {
-		seq_printf(st->seq, " " REG " ", st->start_pa);
+		pt_dump_seq_printf(st->seq, " " REG " ", st->start_pa);
 		delta = (addr - st->start_address) >> 10;
 	}
 	/* Work out what appropriate unit to use */
@@ -161,7 +173,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 		delta >>= 10;
 		unit++;
 	}
-	seq_printf(st->seq, "%9lu%c", delta, *unit);
+	pt_dump_seq_printf(st->seq, "%9lu%c", delta, *unit);
 
 }
 
@@ -178,7 +190,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		st->start_address = addr;
 		st->start_pa = pa;
 		st->last_pa = pa;
-		seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
+		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 	/*
 	 * Dump the section of virtual memory when:
 	 *   - the PTE flags from one entry to the next differs.
@@ -202,7 +214,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 					  st->current_flags,
 					  pg_level[st->level].num);
 
-			seq_putc(st->seq, '\n');
+			pt_dump_seq_putc(st->seq, '\n');
 		}
 
 		/*
@@ -211,7 +223,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		 */
 		while (addr >= st->marker[1].start_address) {
 			st->marker++;
-			seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
+			pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 		}
 		st->start_address = addr;
 		st->start_pa = pa;
-- 
2.21.0

