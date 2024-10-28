Return-Path: <linuxppc-dev+bounces-2642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D89B2EE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 12:29:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcWPg6nRdz2xy8;
	Mon, 28 Oct 2024 22:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730114967;
	cv=none; b=IvF+xAsmyKPBOlmQXuiTip1wapHSosTp19xRIko7llf9ckEwhjuAinexbNcELuuC5CoXHGeTYobZARq3CpwVTR1aLyLGOXENVOPstxxnWgM4YWXkfiTFzBoeEorZoPZGkRtVQg/yV7If7S1sBG7bsTPfs6HyAOEBWm1/Y6pDK/iSi1LI51NCkbl5YwUrFsDbTINPHohm8N/YM+cyiVD0r6h8VxFbY0Hugmgb3UGxxomFjz/RFsMOPnluC3w1gH80EhzrLGYWPK3zwQly/An5Z5xnZjr+ae+NFu2SxBTSirHakm51nGbB3UaSdhS0/OEN/TLUiK8630fiGr4HeToFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730114967; c=relaxed/relaxed;
	bh=qweeu+5IiYtQa7OyRW7ZjYmUI9p5diO6hCID4dNNfoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcFqsP8nqFVuKJ//l7ZV7a1MTzTFvDLK2DM0rjTx43vtXy9DJ0wKfgRx25cOrcvqld2W/KWYoW06KzVwfvMlQZ/E279xe+M4tugFmzMWc89GHWZUSvlQpaK4HOgJJGDEkZtuj2nG8OILgU4xboXZ2HZo1k+DE5iI5ppM4WR+lrujvESN5EU1pdb9bhKr57aDXIXapNC8gj/EGkSeHJ/bBU7xf1AUZqlFBRimCbTkW80SHUnTqqGDVilE2MdCkom8aUyWonHqqbdcsuodksatJAqR9vxiDfSMQUG+y+ynmYTRXEGeVDQK4obcWG2LG3DdP5mwrClvU5AA4FOblvkC6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=cfHO0jvb; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HM62LJ3F; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=cfHO0jvb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HM62LJ3F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcWPb5nYdz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 22:29:22 +1100 (AEDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 82C2C114011F;
	Mon, 28 Oct 2024 07:29:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 28 Oct 2024 07:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1730114959; x=
	1730201359; bh=qweeu+5IiYtQa7OyRW7ZjYmUI9p5diO6hCID4dNNfoI=; b=c
	fHO0jvbh8Mp7bNk55870N4ROSP5UZ1IZMMI+B7XFK+BjCXKxLv96WUGTa9Xzc09i
	RcEGL4fOCXqIuBUPuuBmYMFNWmSRlSzoiS+JzxBnpgWln2mxjmh38uX9z8oDFTO6
	RzoGX7AZMK3qBR3KOtAAFguJ2NCKs9f+r9Znjkzjx5jVEBjdh8DguinTFMo7VUQF
	lsw8qyI/oB2YkDd6T1kz8p/eowhopvo0VkqV0L4Qox1u4T+hvBC2bY/ZmyhSp5fj
	GMvMkZO8lLmlXgiTdGUwRogLMcjeW78eZBvIqRw73bHg5/vwvZpYBVzdnINSSTbK
	GgYfNZ5kFQ3Rt3SvQ8HOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730114959; x=1730201359; bh=qweeu+5IiYtQa7OyRW7ZjYmUI9p5
	diO6hCID4dNNfoI=; b=HM62LJ3F+c+XMD1HH/35nCkBNTUYDNMgPofFLna8qh3I
	bS/U9sP54HPoNSeNxHa7vYsiSXO5qSWFn6ucwCTH1vm9BiRy/QCRyCT/lw07s2RZ
	4GLUcuuIQln2zbahfvjQmKJ274xN9tUsp1oPg9ZWxMru1mYEjAuOihGgsNVn9T0v
	nJoiPsPD4zfApx+6sN8uZgHkveTB/OKJ9d1jT0Cd1DO+mycfVlkAYr/yuPkGuBRc
	Q8EzszB/yYTf50hq9mO87V3t+Hbq67h7FUOuCQaI2Od+xw6/6PIkvTzcu+F7BxeO
	vwxMj4iWZTf8X2wSbojBB1TCHvQSLshsdoK6t0tlLQ==
X-ME-Sender: <xms:jnUfZ6imqZ4sPFX3v7NdZYCtUKUuFcIO8rtsdOxaRng7zP2vBIPZgg>
    <xme:jnUfZ7ABzZSuhwN5CZepQyO3LAh0LXU2ENsWATJdB9cnj0_f9UNp-oD3uDgRgh83I
    A1x6L35z4sVJNfm42E>
X-ME-Received: <xmr:jnUfZyEwbrCYst-B84RueUO2Gm5OMr9GfVyIWUSI8paokuCqi5Xwa9VEpZpDbTs2Wty3Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpefhkedvhfehveefkedt
    vedvjeeuudevkeetiedtkeetteffgefhleduffffudehueenucffohhmrghinheplhgush
    drshgspdhgvghtuhhsvghrrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgdpnhgspg
    hrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgr
    lhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghnug
    hrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehjphhoihhm
    sghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohep
    sghpsegrlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepphgrfigrnhdrkhhumhgrrhdrghhuphhtrgeslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtg
    homh
X-ME-Proxy: <xmx:jnUfZzSQd191KoXtkA6nYGRe7Y_SKeOcyhVAm12DjH1Gl72aBhN0zw>
    <xmx:jnUfZ3ziqlU3s_aoKtNsSmrYmxlaY6O8FhzU8iijDj6YqbcsK2o6FA>
    <xmx:jnUfZx5zdNRI95KeLA5UfIl_Sept437Evt-SsJLJWQj0yy10KS0CKw>
    <xmx:jnUfZ0yJR6vhn2HsCJDpY74K3IR5OpcanQ-YdHlMh2Xr75bWcdXx4A>
    <xmx:j3UfZ8Jh-t7PHjzVKXZwpgG-6mo2E0VJkPEXghda6sOdidTIi1B39wlg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 07:29:14 -0400 (EDT)
Date: Mon, 28 Oct 2024 13:29:09 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <rjjwtpbxal4glznnkp6a65rtbynn3plrrcgwdg2ucaacmjrnqd@5otngejwtuzu>
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
 <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
 <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:34:11PM -0700, Linus Torvalds wrote:
> On Wed, 16 Oct 2024 at 15:13, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > It is worse than that. If we get LAM_SUP enabled (there's KASAN patchset
> > in works) this check will allow arbitrary kernel addresses.
> 
> Ugh. I haven't seen the LAM_SUP patches.
> 
> But yeah, I assume any LAM_SUP model would basically then make the GP
> fault due to non-canonical addresses go away.

Actually, I've got this wrong.

I based my comment about incompatibility with LAM_SUP on the approach
description that stated zeroing bits 48/57, but actual masks zeroing bits
47/56 which is compatible with all LAM modes. It will trigger #GP for
LAM_SUP too for kernel addresses: bit 63 has to be equal to bit 47/56.

I think it is worth looking at this approach again as it gets better
code: removes two instructions from get_user() and doesn't get flags
involved.

Below is patch on top of current mainline.

The mask only clears bit 47/56. It gets us stronger canonicality check on
machines with LAM off.

I am not entirely sure about my take on valid_user_address() here.

Any comments?

diff --git a/arch/x86/include/asm/runtime-const.h b/arch/x86/include/asm/runtime-const.h
index 6652ebddfd02..8d983cfd06ea 100644
--- a/arch/x86/include/asm/runtime-const.h
+++ b/arch/x86/include/asm/runtime-const.h
@@ -2,6 +2,18 @@
 #ifndef _ASM_RUNTIME_CONST_H
 #define _ASM_RUNTIME_CONST_H
 
+#ifdef __ASSEMBLY__
+
+.macro RUNTIME_CONST_PTR sym reg
+	movq	$0x0123456789abcdef, %\reg
+	1:
+	.pushsection runtime_ptr_\sym, "a"
+	.long	1b - 8 - .
+	.popsection
+.endm
+
+#else /* __ASSEMBLY__ */
+
 #define runtime_const_ptr(sym) ({				\
 	typeof(sym) __ret;					\
 	asm_inline("mov %1,%0\n1:\n"				\
@@ -58,4 +70,5 @@ static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	}
 }
 
+#endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index b0a887209400..77acef272b0d 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -16,9 +16,9 @@
 
 /*
  * Virtual variable: there's no actual backing store for this,
- * it can purely be used as 'runtime_const_ptr(USER_PTR_MAX)'
+ * it can purely be used as 'runtime_const_ptr(USER_CANONICAL_MASK)'
  */
-extern unsigned long USER_PTR_MAX;
+extern unsigned long USER_CANONICAL_MASK;
 
 #ifdef CONFIG_ADDRESS_MASKING
 /*
@@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
 #endif
 
 #define valid_user_address(x) \
-	((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
+	(!((__force unsigned long)(x) & ~runtime_const_ptr(USER_CANONICAL_MASK)))
 
 /*
  * Masking the user address is an alternative to a conditional
@@ -63,13 +63,8 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
  */
 static inline void __user *mask_user_address(const void __user *ptr)
 {
-	unsigned long mask;
-	asm("cmp %1,%0\n\t"
-	    "sbb %0,%0"
-		:"=r" (mask)
-		:"r" (ptr),
-		 "0" (runtime_const_ptr(USER_PTR_MAX)));
-	return (__force void __user *)(mask | (__force unsigned long)ptr);
+	unsigned long mask = runtime_const_ptr(USER_CANONICAL_MASK);
+	return (__force void __user *)(mask & (__force unsigned long)ptr);
 }
 #define masked_user_access_begin(x) ({				\
 	__auto_type __masked_ptr = (x);				\
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a5f221ea5688..9d25f4f146f4 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2390,14 +2390,9 @@ void __init arch_cpu_finalize_init(void)
 	alternative_instructions();
 
 	if (IS_ENABLED(CONFIG_X86_64)) {
-		unsigned long USER_PTR_MAX = TASK_SIZE_MAX-1;
+		unsigned long USER_CANONICAL_MASK = ~(1UL << __VIRTUAL_MASK_SHIFT);
 
-		/*
-		 * Enable this when LAM is gated on LASS support
-		if (cpu_feature_enabled(X86_FEATURE_LAM))
-			USER_PTR_MAX = (1ul << 63) - PAGE_SIZE - 1;
-		 */
-		runtime_const_init(ptr, USER_PTR_MAX);
+		runtime_const_init(ptr, USER_CANONICAL_MASK);
 
 		/*
 		 * Make sure the first 2MB area is not mapped by huge pages
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index b8c5741d2fb4..65d2f4cad0aa 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -358,7 +358,7 @@ SECTIONS
 #endif
 
 	RUNTIME_CONST_VARIABLES
-	RUNTIME_CONST(ptr, USER_PTR_MAX)
+	RUNTIME_CONST(ptr, USER_CANONICAL_MASK)
 
 	. = ALIGN(PAGE_SIZE);
 
diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 4357ec2a0bfc..b93f0282c6c9 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -32,6 +32,7 @@
 #include <asm/errno.h>
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
+#include <asm/runtime-const.h>
 #include <asm/asm.h>
 #include <asm/smap.h>
 
@@ -39,14 +40,8 @@
 
 .macro check_range size:req
 .if IS_ENABLED(CONFIG_X86_64)
-	movq $0x0123456789abcdef,%rdx
-  1:
-  .pushsection runtime_ptr_USER_PTR_MAX,"a"
-	.long 1b - 8 - .
-  .popsection
-	cmp %rax, %rdx
-	sbb %rdx, %rdx
-	or %rdx, %rax
+	RUNTIME_CONST_PTR sym=USER_CANONICAL_MASK reg=rdx
+	and %rdx, %rax
 .else
 	cmp $TASK_SIZE_MAX-\size+1, %eax
 	jae .Lbad_get_user
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

