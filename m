Return-Path: <linuxppc-dev+bounces-2216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCD99CA22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 14:30:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRxQh5rQZz3bqp;
	Mon, 14 Oct 2024 23:30:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728909036;
	cv=none; b=hw6flRsELuMe5ZHp1UaB4y6A9omau/FU3Xc41fOy84Qh4+RnyLYOgTEVHzw9fTldHyYboyFMD2Jr0eYFAl4cWxrtjOMEPaqz0vyzPj9vRM79U8j5/ZcJEqYpX8gJoxCScAa69RTgBWOR/ntfLbsmoleCXTOQDR+fjCSqndSmNFHmvnQh0KF89myoK/XVxvd0FhimvpzAhDXjqYT6N1Cvwo9xNmsN7epOOBZOBaqG8dh3aaWpK7gJI4QrHWsrioOpIMvwUCGlY4yy8jyT2zBfbv+4u9rLB5DR6kcW34hMNh+zqrns72oT0vplP5lctDxz25hVMc4bppUwySwQXQRmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728909036; c=relaxed/relaxed;
	bh=CTrJu04xMeYUKFwbYulu/dsbMjtvqQObg51syBuZWy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHkJVVQVxYlCFOjlD0lwR7USiWRzNu5mSAteu8uxDGFGc0KJBEC9giqkDqLnsh1v+rW+DwhmXTUFFf0BlX0Uj1MfSYhj5fIScXIZDjX5CUnqqRs9LEy1kkl9VzdTNhaKz19N1q3s83cX04DR97ngTIt8p+9ZCttUJMQRz77TmSc+6JD4cWbkiSIcLm3aaj7e6tRO+UdUc1JuD/Vq/cutl/aS8FaBLp2N6cMyTVL0dYtuFrr76C1mz9GVIlf2vkknvdTZHDVEJWiwLqlzSjf3ozxcxJXcaBNrw75VP/ZttzIXn5PIC+bMJgSGHxSj0ojrdzNedexxbz0so+2oCrnhgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=TYh5paFm; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nRWRA1FE; dkim-atps=neutral; spf=pass (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=TYh5paFm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nRWRA1FE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRxQg58cSz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 23:30:35 +1100 (AEDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 8FABD138045C;
	Mon, 14 Oct 2024 08:30:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 14 Oct 2024 08:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1728909029; x=
	1728995429; bh=CTrJu04xMeYUKFwbYulu/dsbMjtvqQObg51syBuZWy4=; b=T
	Yh5paFmiBH62o1mBbhIqZqsUiiyKmhZXJ8aqH1VxgwwjamvqmUp3L0sW5NJq3S90
	WED49MRWPBM2XuenstqVJ/ofn/qw+iHvxJcQuPWyqX8RZolW5LBVmBqpVkg08VG5
	jwHUzyzBqo7FLdDeSroVFTdVMLQ5ogH7uE2UQnl2kQSbh7JqpEehjDszkby/YZ4n
	2G7WYx5fQMJx7ea81StXipktejj1c/HYrZtlXe+RjRjMmxEp8Pa+42gR+suQ3CAM
	QVyANcMkGJ2I3oyJCCPMGJOl43Eq7iEztAddfV7UVA8+VTFYXp8bUciZ4BYzzc7M
	UsLriqnpme2od5X33jfKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728909029; x=1728995429; bh=CTrJu04xMeYUKFwbYulu/dsbMjtv
	qQObg51syBuZWy4=; b=nRWRA1FErY7vICisDiOOe4CWjeg3y+n//JdnWUFcb5GQ
	u4LhOpTp58Px8Ye++I91XkCPJnGgZ7Kok5Qi9yST/g2oROw1NS/PKLLtNtar+n8N
	pfGcGC9NaWkp8YDxCM7wi3JLYv4vPBu0ZKbx8ZI2YZhHFC49Zcni2Gh/tiVo5hv6
	U5m1b594ZUPlsQAP5NMdZAm9q2QqkwPJ+ZTrdJPUFbAGDt5qjp1QKyJsAMUWP2M5
	CEGLZqnOUZwI3l8Fb0IlQ6fMQnvy4JbMD5W+/bUDp74p2yChyoKHVGvwUbn5I+bJ
	s4lDNQpgUwMpxllG/jkRLYTBGKHclBYrEo1ajWcXLg==
X-ME-Sender: <xms:5A4NZ2w1lZJY9YIQI7xLhZzn7tGzFVChu7o1jFnHy5u7Wh6bzGNlOQ>
    <xme:5A4NZyTjDKfXa5sAsOYBDfJHnqg9frSQPfdRSGEUsWtipQT5MyFV6v-5N-ZxkWyJy
    xe0s_shu-eAtwUtMN0>
X-ME-Received: <xmr:5A4NZ4VmH0mUXJmNUplzhbPv7l0loMEH9Qeh7Wyj7JXQIBl5Up9DQLzpVWM0P_RU-OYHcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeekieekieejiefgiedu
    teejteejvdetveefffeilefhhfevjeefiedtleevteeuhfenucffohhmrghinhepghgvth
    hushgvrhdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhope
    dugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhn
    uhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehjphhoihhmsghovgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihht
    rhhigidrtghomhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegsphesrghlihgv
    nhekrdguvgdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehprgifrghnrdhkuhhmrghrrdhguhhpthgrsehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:5A4NZ8iQ-XVLwyYtYzX6qoFLOLfNrcM2LpWyHvK3MDO2tYnQs8oMAA>
    <xmx:5Q4NZ4AZ-pcYITMuqV25yupdeTmmx9-vNFb2DedzMLb2SM40uNcIMQ>
    <xmx:5Q4NZ9J3TGujORbHaQieoOVawjdC6ehYyCKbFgWwqabNdo64v22t5Q>
    <xmx:5Q4NZ_BBa2eTRtAM-cnu6MHnCDwpky4tkGRc318M80uBDkZbAVLR6g>
    <xmx:5Q4NZwbetohL0bt6essn4oJsmbfQ06NjSWtT1-4ROpvCByb3Q8X-yLWS>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 08:30:24 -0400 (EDT)
Date: Mon, 14 Oct 2024 15:30:19 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 11:50:55PM -0700, Linus Torvalds wrote:
> Anyway, the attached patch
> 
> diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
> index d066aecf8aeb..7d5730aa18b8 100644
> --- a/arch/x86/lib/getuser.S
> +++ b/arch/x86/lib/getuser.S
> @@ -37,11 +37,17 @@
>  
>  #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
>  
> +#define X86_CANONICAL_MASK ALTERNATIVE \
> +	"movq $0x80007fffffffffff,%rdx", \
> +	"movq $0x80ffffffffffffff,%rdx", X86_FEATURE_LA57
> +
>  .macro check_range size:req
>  .if IS_ENABLED(CONFIG_X86_64)
>  	mov %rax, %rdx
>  	sar $63, %rdx
>  	or %rdx, %rax
> +	X86_CANONICAL_MASK
> +	and %rdx,%rax
>  .else
>  	cmp $TASK_SIZE_MAX-\size+1, %eax
>  	jae .Lbad_get_user

Given that LAM enforces bit 47/56 to be equal to bit 63 I think we can do
this unconditionally instead of masking:

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index d066aecf8aeb..86d4511520b1 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -37,9 +37,14 @@
 
 #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
 
+#define SHIFT_LEFT_TO_MSB ALTERNATIVE \
+	"shl $(64 - 48), %rdx", \
+	"shl $(64 - 57), %rdx", X86_FEATURE_LA57
+
 .macro check_range size:req
 .if IS_ENABLED(CONFIG_X86_64)
 	mov %rax, %rdx
+	SHIFT_LEFT_TO_MSB
 	sar $63, %rdx
 	or %rdx, %rax
 .else
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

