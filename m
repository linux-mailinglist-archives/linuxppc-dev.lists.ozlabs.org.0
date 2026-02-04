Return-Path: <linuxppc-dev+bounces-16574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHLDCijxgmmWfQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 08:11:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D349E28C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 08:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5Wjv20MKz2xJ5;
	Wed, 04 Feb 2026 18:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770185768;
	cv=none; b=G12pHcR2ChjsgGiKOysexH0uFlDtFvNThZ/N6mOHXlmybm+WjwqPzpSv2TZy+hPdRsxRvnzuHaodn3TAIo06m5fjoV+RDRyK2Jo4PNO3aGpltP7sN9AAbRVQsiDxwM3CyJSCspJccdnraLVXYwQqxzI+UiUN3MAzjkQrNORCcgwIt5IBVXZmmu20XBF9NtXDUr0jXugJDr2ecihRyi2KFFRPrjCSeLFOrDHGgAX4MMXERTxmLCDrqRmv5TTfA8D5abaLESgKwVdmFG+PMBuGdOV5SqquLGXUBrWliCLNVM70+JShSJl4t14f9c5vtcc1yUDb6IZjnZRwcCiTq8isZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770185768; c=relaxed/relaxed;
	bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2d1wDt1Unyqz/zzUxL8MroJOzzKlKuzrwddgO6iUavdequp25fovUnZgcCPTkliqHbt8dWvhVl5oRMnhtpjkNZKOJTeRqU7BEXBrBB1JrhYYmDllWsIQCGF2LiohiTZLcM1iRlxqwOaRKBHoMs3coOh8Lvfn0l5xKR548kQtLgCAMGofurftf5BlUWjA5KlkM0yJPS3GWEL/08Vkr+lZ48WLFs5VOTHHAgp8ysbep8OuyjyzNRD+gz0u8MJgsGCjKaZN7/1oQHvpBSkS711lFGEw+KoQSMs4IH+eiVk+RnjsZHmyUh6LCMlKS+ptsQCtZtcXTSx1wCE7RfkdWnZKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hV+BJpcK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132f; helo=mail-dy1-x132f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hV+BJpcK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132f; helo=mail-dy1-x132f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132f.google.com (mail-dy1-x132f.google.com [IPv6:2607:f8b0:4864:20::132f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5VTt6Lpcz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 17:16:01 +1100 (AEDT)
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b785801c93so4602000eec.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 22:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770185759; x=1770790559; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=hV+BJpcK40I/qJ+F65s+iwWVE3gkkbhpo0smbFeqIpTFBTPxefDviph5eimglJFuEG
         sCIGxbyyRui5chEXBL0mvJzGjT2iDZQpcrsiKYQ92Zp74FcqGr5mz3jFbhQJKCeyE8oN
         8jI1jMHg2AcrjIM7EVvzHXpCcCDhEXyRhsVaJpqp5f9dQy7JjsDvjNZi73Tu6bX+VwVS
         NCZCYvopl7Tg1m3KwF4uvlbpZBll4hR/z5rw1mFwfIv5HEsMS7w2376hGLcRx/pi7o8t
         mg3y6uz7Ed93CAW0H9cvFLeYsiphRdjckal0IIDDadhF6sxBud7eI1m7fs66Vk8c7dts
         WDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770185759; x=1770790559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=Sn7KxHv9PyHaP0ntWRSPvKpOUFrJZRtMfum68E1ZRRUmBuyT6oEJ/mmaK4KA8rnAMO
         TfHgKNzRwl8zDcgbW+NO7+SP73j49X/f/ZdbN7UAbqSzuy+XHduNgFfA0LgWt9bp2dKy
         /MmBD2YgWPitC1uqzzcM76JCaeDmZaWydNI8Lg25KWeKxZ6lP98HX4pdHDx8mP+LVHwp
         nGO7kq7+jd+Pt/MO8x4YNHJptH3sRhVou7lKBLJ7ei7JPQMBBPx35CP69oWTxfLLX0Tm
         bQX46jAR+tZ9d6Zheo8D+dGoEjFGkm0zLjdVaY5HPMXzywqIx19tzvHIEK4OwzhLHG4R
         Gddw==
X-Forwarded-Encrypted: i=1; AJvYcCVoiQezzr/DWipXeyfI7rjNgXGeweC2xYGaDDp8M5xUaC0g1gnBnQI9HM8TL2/TJOE2cNUbyogOylFVdGU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFk8jf6Vi2RVnMNgRYmsaivmkNZFtDSaGfS5VtZUhl+Yv5QAeE
	o8N2eg5lN+MuxiMwp1W4c85QZOJOlmBwibyty4+ynvDjhAV2Va9nBfgfyEGT+w==
X-Gm-Gg: AZuq6aLxhL7iuFJO65/sYuj1fu7WLPS2ywDX0VzYlqVPkh8SUxJZSFIXNBGwPmED+Ho
	7qQXr4E0EGw1fIVOgRv/2Zrsl8K8Khh26QXvc5l0RyLs3xE8NqkItfg+H4dCRA5ceDECHmwQxrL
	pI4d0gpAzOJp2c43AxlDtZD9Bd6LzmFB15Iw1H2dEhCVqpewu4HBQt+QykEbeMcJLLCfTUhkSs4
	6L46hRneqZU9euoMysX+L+sYf4/Mr9iCOyjjR+DCw3HQmw1W4//Q5tsCBTkeKJe3w/w17FTYv7H
	DMNzG/gO+fCPNWtcoUMMgn2UDnjw7Ph8LEO6xLTmtoEKf8Uh7HfYBZgrbZDXrg0N+UsCfkJmXAr
	NLGvHssXTkFGinfiNFsyY1JKiPShDKFxQAWsXcfocNOkW4y/xotPskSC08gE7+SeoeXpYo+dtST
	OSVimskOT4Dp+J6AY4dHeviU36eICF2LQ2mLoRQt1/ktffTilYke7bxQ9YG6eVfN3vruDFKg==
X-Received: by 2002:a17:90b:2889:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-3548720a3eamr1376264a91.32.1770179086053;
        Tue, 03 Feb 2026 20:24:46 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485eb8d4csm1017430a91.10.2026.02.03.20.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 20:24:45 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH] powerpc: Enable Rust for ppc64le
Date: Wed,  4 Feb 2026 09:54:17 +0530
Message-ID: <20260204042417.83903-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,goodmis.org,garyguo.net,protonmail.com,google.com,umich.edu,lists.ozlabs.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16574-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[high:email]
X-Rspamd-Queue-Id: 2D349E28C8
X-Rspamd-Action: no action

Enabling rust support for ppc64 only.

To support rust a new macro ARCH_STATIC_BRANCH_ASM in powerpc
is added to avoid duplication of inline asm between C and Rust.
This is inline with commit
aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/Makefile                 |  9 +++++----
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         |  1 +
 scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..e9b8d761ed52 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_RSEQ
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_RUST			if PPC64
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..7ad28cf0fd35 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
-KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
-KBUILD_CFLAGS	+= $(CFLAGS-y)
+KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
+KBUILD_AFLAGS		+= $(AFLAGS-y)
+KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
+KBUILD_CFLAGS		+= $(CFLAGS-y)
+KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..7a6daa822cbc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -390,6 +390,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 38b3416bb979..875579b37424 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -256,6 +256,30 @@ fn main() {
         }
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
+    } else if cfg.has("PPC64") {
+        ts.push("arch", "powerpc64");
+        ts.push(
+            "data-layout",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            } else {
+                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            },
+        );
+        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
+        ts.push(
+            "llvm-target",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "powerpc64le-linux-gnu"
+            } else {
+                "powerpc64-linux-gnu"
+            },
+        );
+        if cfg.rustc_version_atleast(1, 91, 0) {
+            ts.push("target-pointer-width", 64);
+        } else {
+            ts.push("target-pointer-width", "64");
+        }
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.52.0


