Return-Path: <linuxppc-dev+bounces-2460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2B9A6498
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 12:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXBqk2w0Xz2yVZ;
	Mon, 21 Oct 2024 21:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729507714;
	cv=none; b=HyDV+XGIserFeOvfUjn6F+ZVBpHJK1XiEKYIxqX6sXNu1x9M75ZtwCFC1puzjv7mdrWkfzAP2oxfE0N76p3LuTe/wq1pog22CMvmJYuEN/5BkMyNMyLQUSxG2DEwNkemlxkc97TTMjCUxsBBm45L/7UBD74ZD2X9URDmOqUAml/eowYlGFVrI6COcbAWcbjltTuqd4MXqYI3ixPfnJC3EuCiWi91p8exhHR32+4Tq2vnHTdOGuEMqcsQ5OZxzMaD+e8tw0o6Qvv6tL1luMXmqLL4t5MXMBcuELkFQ0uuwB/v4yvvifE04q0lZzjTdE/SRMTwWVd42mRAzUvBzJ2iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729507714; c=relaxed/relaxed;
	bh=4HpWctHkRalpYze26tUz0SzCYsDUyURgUHY7IKnlzG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQotS1Ii6c1rRtyAlXERTnZfAp3PRVLx7yDiyrrpj8KS1ww7q/pn2sosso8fZDVf41swFzXwIER8fyV+2UjY48ELmXIvlJITzRpDYp0ITvFOS/b/QoXT705SJ0j5dLXogLJJ2B9oQ/rlufg0NOIiYgcHSzkD2aS1XN9pzFZ6QzmS8gm4CKdeHQRjhLpHy0syxxeTDKpMG0PstaEk94FxOABxGa5eGIu8xKF1OaEQeHG28JBdhqSp2+SXqd7Dt7UcamDmlgzC8imAEcIhKf6kt4hBQdWMrkIlGLTYFulhPdGg+/PvCunxb0kN973EFiUi+rraVAKoP5JlA1cxFbNS+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=lq7Pulgv; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hwo45v/p; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=lq7Pulgv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hwo45v/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXBqf42DRz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 21:48:29 +1100 (AEDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 46C7C1140240;
	Mon, 21 Oct 2024 06:48:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Oct 2024 06:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1729507706; x=
	1729594106; bh=4HpWctHkRalpYze26tUz0SzCYsDUyURgUHY7IKnlzG8=; b=l
	q7PulgvLQtQYKk5P1jR+wrLZkim+f6i83NAe1dYO92I1jnROw/D++YNTrCV0LF8u
	HVcwiOTJ0U1hwPf4bdNQ6yxUgBAUL+dQST/gs8YNL8GJxXo51ohsEdMP6Fg7I3Gj
	0cFQaURlMevsfIiWxQ8IRlINz+hh4PrPrJALmwhex8RZMI+FZRK6G5P5LWuNlknU
	j8NFw1Htd2mdkhKc1hQnhg6TGn9O2ekUrErJz3j0Cyz0Br6D2uDNq2ftbEfujWqM
	gyz2Ize4u7urqDy/73kLno9ifMSgjn9DMj0DSAMm7IWZRlVzt5K553M5/pN956cN
	I7JyEtbkUm+zsjEDIdlhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729507706; x=1729594106; bh=4HpWctHkRalpYze26tUz0SzCYsDU
	yURgUHY7IKnlzG8=; b=hwo45v/pEGcew9v5sYm9oPmIx2aMzWWa2DMtZVnst1Ll
	gAG5hjR+lizetUYlo4bt+ynvN+L/xS/38CS0O4rQwAMxkQeVWOWqwhFYqou9vCLi
	+2OrihxMk9RgTZuMwdsHgj5PTGzXvOLCvOHF7zmovxMMNuMf9rAeHyFqiT1F3zH7
	653nfdJJOsMfd/qQ5iCM3sQY4nN1IKKyc8xy9Vv3xhiKNQJeRRikChC8eXa5yuYC
	Z/bzgQ4CVmq2RWBWaE7TL3nj176c6RgJPJ72zcvQyzzkBhkol+/BbgXOTLAxvn7K
	hHm5SOatVHnRygob2CNiSls72J+y2VZI4slGD1eBGw==
X-ME-Sender: <xms:eTEWZ_P7gbBz3z4Tb-aCFjn2uX8E4kVCjZh3V0AZfA-d0HGlDKcz1Q>
    <xme:eTEWZ5-0rjXE90qHvIs5Rava79Uax309v9E00Vl9h33IHeTtUoZEWUknpMxVi3Upp
    TpFtpAkAEWdsh9gLSo>
X-ME-Received: <xmr:eTEWZ-QZni1sV48fqbsXXI9uB8foP7Qmkpzj3EkJQvrKD-vr6OjeHq2Jl5BVx4MoI8i6eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehledgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpedtfedtkedvhfevhfei
    ffdtfeejvddtvddvjeevfeeiffelffeuueehgeehledujeenucffohhmrghinhepvhhush
    gvtgdrnhgvthdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    rhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgt
    ohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigkeeisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphht
    thhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehprgifrghnrdhkuhhmrghrrdhguhhpthgrsehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrg
    htrdgtohhm
X-ME-Proxy: <xmx:eTEWZztKp1JmRbHuy1EQUhU_SbPCDE0YvAs4dJkdxsauAd7nOUM5YQ>
    <xmx:eTEWZ3dhk1L-KHW1Cat5LTvVN6cqYqBPeP7cDLwGPgqp0WNfGS4apA>
    <xmx:eTEWZ_0F7B4A1JprCt3_Md0-SEAN6-EWPPYtJskhyVNP_glzxayMqw>
    <xmx:eTEWZz9suZX9cnR6LhaBiycUbczioxStw8-zoqCg36KcPSotJo67YQ>
    <xmx:ejEWZ_-IEBQQwVtNHbSApC-5wFE5NoCWOO8uK1IqX0yMhI9rfAnKvDdE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 06:48:20 -0400 (EDT)
Date: Mon, 21 Oct 2024 13:48:15 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
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
In-Reply-To: <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 20, 2024 at 03:59:25PM -0700, Linus Torvalds wrote:
> On Sun, 20 Oct 2024 at 15:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > Anyway, I'd really like to make forward progress on getting rid of the
> > LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
> > back from both vendors, how about we avoid noncanonical exceptions
> > altogether (along with the edge cases mentioned above) and do something
> > like the below?
> 
> That doesn't work for LAM at _all_.
> 
> So at a minimum, you need to then say "for LAM enabled CPU's we do the
> 'shift sign bit' trick".
> 
> Hopefully any LAM-capable CPU doesn't have this issue?

LAM brings own speculation issues[1] that is going to be addressed by
LASS[2]. There was a patch[3] to disable LAM until LASS is landed, but it
never got applied for some reason.

[1] https://download.vusec.net/papers/slam_sp24.pdf
[2] https://lore.kernel.org/all/20240710160655.3402786-1-alexander.shishkin@linux.intel.com
[3] https://lore.kernel.org/all/5373262886f2783f054256babdf5a98545dc986b.1706068222.git.pawan.kumar.gupta@linux.intel.com

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

