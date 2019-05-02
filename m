Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769461145E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 09:42:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vnL84Cb4zDqG9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="A2P5l8gh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H8jjEIVV"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vnH76p3kzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 17:40:19 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E211C689;
 Thu,  2 May 2019 03:40:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 02 May 2019 03:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9pZiVq15lplTU
 qpAlIk5Hr+1+O0njVS94GtHdTGr72s=; b=A2P5l8gh2gPH4sE/rCdppgB9aBPho
 t4FxHZXz6pD8GlVB4aG5Q+fSpux/vuAHGSItxdaPHRNKLZdCTooEwCXgkbwKCU6e
 t/kDwvFpz96xy44bL9t3hMsIVkSoFGkVMPdMIEBkxNtEGIX621NrRqsEZ9r1+Ssu
 46TjG48H7vLCwBX87AHe6LTjwvHTIkSw0hIp7BogAGMuwqXeNjgH0pX2Bvv0uWCg
 Dg7xtAn0EoNWTrnUPgfs2p3o6e8/NGMD39yq1t5UiKMr2oj/PiUBl+BBCx83cwrp
 /R1uvncPzVJQjf+AkNHHkV4uL5sxjTJqvaDC/yaaNKkIVVb1HwZ8OlPeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9pZiVq15lplTUqpAlIk5Hr+1+O0njVS94GtHdTGr72s=; b=H8jjEIVV
 CLQngfJ/m9xgDLxKpvjUXK4rY07UgVxGDfGEaBfB3H4JMypcFWp/gd0+hIEBzTV2
 smy0fNjdrJgWDqjkJw6o1+6L3+jdtro5Ir6OjROuTouZ/KxV+b8eiEdnwtdo1n6t
 v54fjoQtJ6BRdFco0Ak5+FjGv8CQajX30TvK9kT9oaSpsTyWpIWfv7V1B5MAlpCw
 MUp+cHaIqrZmCdjlu6B9cXFoeDMfUyWklInfbGlWvweqbJNLRC2m61cmT/pJsVdg
 5qvqcKak7Kw1gD8+THObJz15bsEeAxFQyMfv7L/sDXqtgp2Vt9DCgwxv0q/Ob1h3
 o5kbeOB+ZcHDFA==
X-ME-Sender: <xms:4J7KXE52zdfQrPxU8TYKUMBHyojbJ3edNXw3391_2uwcWDeqDY3boA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:4J7KXCX0PBK4scN-octo3sOWttXtbOSIG5qVoor_v_tZ54b-o02Xog>
 <xmx:4J7KXKt8R7pGv6hOloO1oRO0bWGSs0jnAxeN3qZTyHh4eNH7ClNYjw>
 <xmx:4J7KXPrSan82OKkbBAimr_1osqpC-oBwL2tV72QAfUDPI2pUJ4Q_nw>
 <xmx:4J7KXLv7uDRhc-PTfw3pSrUB2KqPYOg0NG-SDH7r4ny6BQU84a2eUg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDEA3103CB;
 Thu,  2 May 2019 03:40:13 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/mm: Warn if W+X pages found on boot
Date: Thu,  2 May 2019 17:39:47 +1000
Message-Id: <20190502073947.6481-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190502073947.6481-1-ruscur@russell.cc>
References: <20190502073947.6481-1-ruscur@russell.cc>
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

Implement code to walk all pages and warn if any are found to be both
writable and executable.  Depends on STRICT_KERNEL_RWX enabled, and is
behind the DEBUG_WX config option.

This only runs on boot and has no runtime performance implications.

Very heavily influenced (and in some cases copied verbatim) from the
ARM64 code written by Laura Abbott (thanks!), since our ptdump
infrastructure is similar.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: A myriad of fixes and cleanups thanks to Christophe Leroy

 arch/powerpc/Kconfig.debug         | 19 ++++++++++++++
 arch/powerpc/include/asm/pgtable.h |  6 +++++
 arch/powerpc/mm/pgtable_32.c       |  3 +++
 arch/powerpc/mm/pgtable_64.c       |  3 +++
 arch/powerpc/mm/ptdump/ptdump.c    | 41 +++++++++++++++++++++++++++++-
 5 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 4e00cb0a5464..9e8bcddd8b8f 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -361,6 +361,25 @@ config PPC_PTDUMP
 
 	  If you are unsure, say N.
 
+config PPC_DEBUG_WX
+	bool "Warn on W+X mappings at boot"
+	select PPC_PTDUMP
+	help
+	  Generate a warning if any W+X mappings are found at boot.
+
+	  This is useful for discovering cases where the kernel is leaving
+	  W+X mappings after applying NX, as such mappings are a security risk.
+
+	  Note that even if the check fails, your kernel is possibly
+	  still fine, as W+X mappings are not a security hole in
+	  themselves, what they do is that they make the exploitation
+	  of other unfixed kernel bugs easier.
+
+	  There is no runtime or memory usage effect of this option
+	  once the kernel has booted up - it's a one time check.
+
+	  If in doubt, say "Y".
+
 config PPC_FAST_ENDIAN_SWITCH
 	bool "Deprecated fast endian-switch syscall"
         depends on DEBUG_KERNEL && PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 505550fb2935..50c0d06fac2f 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -108,6 +108,12 @@ void mark_initmem_nx(void);
 static inline void mark_initmem_nx(void) { }
 #endif
 
+#ifdef CONFIG_PPC_DEBUG_WX
+void ptdump_check_wx(void);
+#else
+static inline void ptdump_check_wx(void) { }
+#endif
+
 /*
  * When used, PTE_FRAG_NR is defined in subarch pgtable.h
  * so we are sure it is included when arriving here.
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 6e56a6240bfa..6f919779ee06 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -384,6 +384,9 @@ void mark_rodata_ro(void)
 		   PFN_DOWN((unsigned long)__start_rodata);
 
 	change_page_attr(page, numpages, PAGE_KERNEL_RO);
+
+	// mark_initmem_nx() should have already run by now
+	ptdump_check_wx();
 }
 #endif
 
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index fb1375c07e8c..bfa18453625e 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -328,6 +328,9 @@ void mark_rodata_ro(void)
 		radix__mark_rodata_ro();
 	else
 		hash__mark_rodata_ro();
+
+	// mark_initmem_nx() should have already run by now
+	ptdump_check_wx();
 }
 
 void mark_initmem_nx(void)
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index a4a132f92810..e69b53a8a841 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -31,7 +31,7 @@
 #include "ptdump.h"
 
 #ifdef CONFIG_PPC32
-#define KERN_VIRT_START	0
+#define KERN_VIRT_START	PAGE_OFFSET
 #endif
 
 /*
@@ -68,6 +68,8 @@ struct pg_state {
 	unsigned long last_pa;
 	unsigned int level;
 	u64 current_flags;
+	bool check_wx;
+	unsigned long wx_pages;
 };
 
 struct addr_marker {
@@ -177,6 +179,20 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 
 }
 
+static void note_prot_wx(struct pg_state *st, unsigned long addr)
+{
+	if (!st->check_wx)
+		return;
+
+	if (!((st->current_flags & pgprot_val(PAGE_KERNEL_X)) == pgprot_val(PAGE_KERNEL_X)))
+		return;
+
+	WARN_ONCE(1, "powerpc/mm: Found insecure W+X mapping at address %p/%pS\n",
+		  (void *)st->start_address, (void *)st->start_address);
+
+	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
+}
+
 static void note_page(struct pg_state *st, unsigned long addr,
 	       unsigned int level, u64 val)
 {
@@ -206,6 +222,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 
 		/* Check the PTE flags */
 		if (st->current_flags) {
+			note_prot_wx(st, addr);
 			dump_addr(st, addr);
 
 			/* Dump all the flags */
@@ -378,6 +395,28 @@ static void build_pgtable_complete_mask(void)
 				pg_level[i].mask |= pg_level[i].flag[j].mask;
 }
 
+void ptdump_check_wx(void)
+{
+	struct pg_state st = {
+		.seq = NULL,
+		.marker = address_markers,
+		.check_wx = true,
+	};
+
+	if (radix_enabled())
+		st.start_address = PAGE_OFFSET;
+	else
+		st.start_address = KERN_VIRT_START;
+
+	walk_pagetables(&st);
+
+	if (st.wx_pages)
+		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found\n",
+			st.wx_pages);
+	else
+		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
+}
+
 static int ptdump_init(void)
 {
 	struct dentry *debugfs_file;
-- 
2.21.0

