Return-Path: <linuxppc-dev+bounces-2330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF879A15B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 00:13:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTQGr5RFrz2ypV;
	Thu, 17 Oct 2024 09:13:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729116836;
	cv=none; b=a5OloIKyvSBsztl40Kxu4QUqL86gZI7Q+6kKYX4NnWcQUAUKFjpA5Pp50LODvdlRUY69FE5rpYHyfUTgSxZAx+V6l+AJ/WuTOTtoeDw2TOCM8IVU1WIT03EuPu45e9h9IjmSwI+BIfv5xMSr4AcSG2nfm4S/iTMLzCVkJjWHHxNJza4zP/JS1yLJE3MyymXj1X52BcFikjUAXk9j2/OXpIHgeZmwL8CwA3ljPm1InjHBHjeMzEJ7tu+IGbIOFNiGd4IAca1anqA/QnZrcAX/men6mxcQZTwYU4VEJkdgUSVBrdkQgi2WX/BVU0NA2csvqnifXpFknvejopKunwa0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729116836; c=relaxed/relaxed;
	bh=vJm8n2YmRIPaPw/nOdyhIGA6XgU0ebMMWh7w9luAf/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsBbP1UeLXnRDGhRrQMw/enVlmOfZWvjD3M7aGDJqf6xjd6jlBG74rmoF0c0XLZW08X5Pr6NCa6C0Mssgd+5ISegoSUgz89YGYR0JoPblsvdXWOgemyfTpYL9XBhbIcKj3Ty40zBjaiwJNmgisoOj3RavIaWbwRUVAUAkxt60t6hDgw8jgUtmY+YLdsi+pBXZrePgpSAcmIyLIVrlEXGGoiz/e6lstB4JKQkqFsIHIPKQmCW4Bo+Fs1YNveDT6yf9GhVTp03yZQ72ztmZifkBCnaM3Ufo4i/XyphesC0+guSXghUqOooEjSF/m2fzVwO0r+GviYXKZ3bBO0ge+7aCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=MMQVYtfe; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mx+ydXXH; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=MMQVYtfe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mx+ydXXH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTQGn60Lpz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 09:13:52 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8079311400BC;
	Wed, 16 Oct 2024 18:13:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 16 Oct 2024 18:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1729116830; x=1729203230; bh=vJm8n2YmRIPaPw/nOdyhIGA6XgU0ebMM
	Wh7w9luAf/I=; b=MMQVYtfe7qVOegv4OtLz6BztejC5GUj5Z6/GL7WajiTFTcIK
	3wlixk/zXWY/mX9D0FyiUllX1QMfy4dnbCvSdaqpmCFOdRARNTeml39pjNOHkjNf
	6EZV3Po6ZFcAAS3JdFORwSWIdoCtYlYrKnkUGViOm31Pzm4Kbbmh+ctaWCSsw0jn
	rzpKlLI/3+JEDTH7DLSkmw3n2M8W7otItJ+wzTOMe0OvWFxm08agyo/wyMhXq/eG
	5PHjiFbZ9WOKouqnlMTh6DdnSJQFvZmZ7rVCaDo606NkcEecGkIahrs9iqBm8C8C
	6d0OKPs4Qn8GLltg5xA8V7E/hkC0piXr79e0dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729116830; x=
	1729203230; bh=vJm8n2YmRIPaPw/nOdyhIGA6XgU0ebMMWh7w9luAf/I=; b=m
	x+ydXXHoOzBxKVuytFFQ6YtXzhklHdmArPf2XpPWkpCWb6J/TruqSCrsOgOwnPSw
	Qmh4qC5/uURveFBCPx3yYvpXb/zvwIM2CWX+/rhHPvfwh67yPlmWU9v7qCMVQmPV
	cftpVy5FqEHy9odjtNVIQwYqSkJ/1KU5w4/TVGgx8r+zz5C57JIUP9WuNlrx6RcR
	Tmd4XuWLsbfOhV5p773PG7I+mBoP5A8wtGNvUF2rx/nkSyzvqOiMAuX6dkXJVREo
	Ur+r0NY3I6Xai7IbnMNxMFt49QAUQaBKFwlM++puD4kdbVBBD/XwgUWNqewEQt3f
	1f3b5jinAU8I43S02J8mw==
X-ME-Sender: <xms:nToQZ5rkYBujeWHsTz0BJvrEOQ6wt7iVjnufmhqa4k-vxJGOsexjyA>
    <xme:nToQZ7rNkUcdiLHRWEbrOma1R8qwcMBWystB5Wbg74NZwKMasst846Nj29i-mebpB
    LLeWVygwYHU78goBq8>
X-ME-Received: <xmr:nToQZ2MMwmLNzRe2LlEIx5R2y1IatAeCjt0zzIwRfrJJdLDCcmcZiwSYAPNgS5tDZZIO6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehtddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddttddu
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnheptefgveehkeehveeh
    teelvdetheevvdfgtddvleetffdtfffgheejhfdtjedukeehnecuffhomhgrihhnpehgvg
    htuhhsvghrrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthhtoh
    epudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhp
    vghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepthhorhhvrghlughssehlihhnuh
    igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehjphhoihhmsghovgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepsghpsegrlhhi
    vghnkedruggvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepphgrfigrnhdrkhhumhgrrhdrghhuphhtrgeslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:nToQZ06k5-37_mKAkUMMmybPQN_m-EuJnqkhEgO-PzM2m350L-a4-w>
    <xmx:nToQZ47NasGUrSXs0MPLdQCfbZKkep5h2MoSR7hwkdohNib7lj3xGw>
    <xmx:nToQZ8i19XJm0dReBUxI75P-anh6K9KhE4NHU40Pm7BpMA1G_vTLSQ>
    <xmx:nToQZ66n7SqKtr2QWm1vmqKXSDzXAXKc-4dPE_YmH20jbFnt-Rn7pw>
    <xmx:njoQZ3Sc28uJ1t2AYH7M0SBQaRfgaEO2tjXabL6ehz0fndYB1DPDYXz7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 18:13:44 -0400 (EDT)
Date: Thu, 17 Oct 2024 01:13:39 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 11:02:56PM +0100, Andrew Cooper wrote:
> On 16/10/2024 5:10 pm, Linus Torvalds wrote:
> >   --- a/arch/x86/lib/getuser.S
> >   +++ b/arch/x86/lib/getuser.S
> >   @@ -37,11 +37,14 @@
> >
> >    #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
> >
> >   +#define X86_CANONICAL_MASK ALTERNATIVE \
> >   +     "movq $0x80007fffffffffff,%rdx", \
> >   +     "movq $0x80ffffffffffffff,%rdx", X86_FEATURE_LA57
> >   +
> >    .macro check_range size:req
> >    .if IS_ENABLED(CONFIG_X86_64)
> >   -     mov %rax, %rdx
> >   -     sar $63, %rdx
> >   -     or %rdx, %rax
> >   +     X86_CANONICAL_MASK      /* mask into %rdx */
> >   +     and %rdx,%rax
> 
> That doesn't have the same semantics, does it?
> 
> Consider userspace passing an otherwise-good pointer with bit 60 set. 
> Previously that would have resulted in a failure, whereas now it will
> succeed.

It is worse than that. If we get LAM_SUP enabled (there's KASAN patchset
in works) this check will allow arbitrary kernel addresses.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

