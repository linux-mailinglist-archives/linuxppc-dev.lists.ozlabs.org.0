Return-Path: <linuxppc-dev+bounces-2483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E589AA03D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 12:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXphS46zbz2yXm;
	Tue, 22 Oct 2024 21:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729593864;
	cv=none; b=TIXOYMWysLyg5QX3j42qBGFsDnAHp8IFxub/G6npbUoteLPjcEh4qLeF3MbpPQ5d9O16MuZLjZRLZ+ozbRGk+OemMgqdW3O3ocDbw1Vwp35n8YUAYCv5qvhNYLIfyAbRNr7vjtBHqz8LJ0LIYDOMtTuFlpUiP/CM3NYlnNmLS6dC59v6Dydl2OmPfj0NZ7dE8vvFGuedki5PhThLovIuCLHyzA1n/nKWEnAnX9O0dtY12pFMm4kdJ9ZDoycAjaHWgYxDkl0aql+oF5p7gaprif9OYCl/5ZxQwZyXr3SSNVBfxQpfY2FE1mjbkovSXk4hHmKvWdlc7oM48EdJ9xWZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729593864; c=relaxed/relaxed;
	bh=VTRKHl9z4ZLrRYUdty9UMJlLneAcsrqjsTf8+dG279U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqkUMRLxvvzNblhF24Jj7/jfrxzBWAHzBwyf5ZJamF6CRm7BT3LKitAAhzeQWIrXpRlGhH9eTKz5p+l1RyicHge+W85IPl0+QGkQeHjlOfIR3PpM6bsi3kv3lbhu9Hc63TM7OoJkKaE0LJ4X8Kjs+lcOH5K+ZdLSDB0NF2m1AodTbfQnyyDwP0rk5842MxAsDe21d4lU5EY3XUKObhxBqXHQDHU286y4sXX7rUJtPruzOJwYBTtlMkb2/gag1p2DHwTmiLAmc4Ts/z6QkzdHqJUfa7UDvaA03czPzapZ595FDvtAPusjjJ2qjBwAfVbX+7qLgZ/sGrUb29XirTFezA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=fxNF65WM; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fwHd6NkF; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=fxNF65WM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fwHd6NkF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXphR4cXGz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 21:44:23 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C1F6B25400FF;
	Tue, 22 Oct 2024 06:44:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 22 Oct 2024 06:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1729593860; x=
	1729680260; bh=VTRKHl9z4ZLrRYUdty9UMJlLneAcsrqjsTf8+dG279U=; b=f
	xNF65WMvIM/b3BAn0HwIuBcu0ajNg6YSX0Unyg634uyaWf7+rAy3t4DFyDyEc+NP
	mgKOxF1ZVmUWrtcKzAUMunhrY5CjL6POkHOFTk3KUjRvluvNDDGVHy5/vWNIdSMf
	K9RysIqUPUT4h9ZqvivsocrWw00+lULDRZuM2toe6a3WME82GLGoipaYCLY9AUlK
	UzR8Mz9g1ZqNZShK6c7qnoq6h1es8yc6S7jemvQkaZvKJKmBz80aICt1MLuTXcv1
	1VvTD6X6kHvuetYxCy4BIbCEDrYXnG87uGtm6R6lNwSupnDR1QzV0av50Pw3qJaB
	dPcNVQngpGZVvzHCga/Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729593860; x=1729680260; bh=VTRKHl9z4ZLrRYUdty9UMJlLneAc
	srqjsTf8+dG279U=; b=fwHd6NkFrxilwF5ZCFoVWLrYeGKKxuzvh5l9okt45B0Q
	oInQzxC45o84S8i4xFAel/kRSekOMaSd1IaYasLaVgE/+XMDdTWARVm49+mUX7ZK
	JE1XD8LJHzioKRVI9mVG2vRJTXzbhMxV4gr7xtJa27CFp5r8a+yjsDq73f/FbORk
	bIdlCwi8CPbR++O6blxBm5xgv6BYYbY1ReItvQsT60/30eTFi3eIYtGfQ/N2C4ma
	MkkysLBrr7ERO5z4dh4YZTI8qVcpyHrS78VdUqJlEGP0RZBg5o6sCmJ6rpTTfk4l
	XWtsDmX+w34AQU+t2T9lQamiSK4s4M79EAvfbVczMw==
X-ME-Sender: <xms:BIIXZ9wAu1OWCn-aTTPbdX9SaT6_dvrSygS3GP3Hc6_dSbiYGzjVmQ>
    <xme:BIIXZ9QhK4SVwO7cEbYJvt6hyzMWPfchrcdq9ysyyeGn7SOeTxKRf6XOJMwXsbPDg
    _uHa_gOwI8EnEfWllU>
X-ME-Received: <xmr:BIIXZ3U3kgU5c2l_zAuUinJmXZ_4fZ1AmqQfAZr69Pqj-4wNAyLHSppfH95fa1HzURApMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfhhfff
    veelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhv
    rdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehprgifrghnrdhkuhhmrghrrdhguhhpthgrsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonh
    drohhrghdprhgtphhtthhopehjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtth
    hopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhr
    ohhnihigrdguvgdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlohhnghhmrghn
    sehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:BIIXZ_gm1JewiKKGSoUI3KFsQuSAqFx9zwy2YrPQ_UnVMcGjGKV0Kg>
    <xmx:BIIXZ_ArO3ky1ZvHI7F4KcjJthhDY3TYQt00tZVCOQHwZftF66mEuw>
    <xmx:BIIXZ4Lx0ekEV-5oD88FcfxC0twoLpkQzONbysgIdLAQj_Z60yPKSw>
    <xmx:BIIXZ-Ax1P8CEqYgRKw-C6NY8JSxSuUmyVLYkjXd2N7p98qCkIxKdg>
    <xmx:BIIXZxTn2PU6LF6HUHaQI2CzXkVDzNNzJXCcHsrbo8iCshqTnkJCIs2y>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 06:44:15 -0400 (EDT)
Date: Tue, 22 Oct 2024 13:44:11 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <yco4ox4m6trl7vw2xf7me2e35t34xfn4uypnvawbbsbgtl2pbk@ab3kyrwocfzx>
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
 <20241022081658.pmf3j5dcxohsvr5e@desk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022081658.pmf3j5dcxohsvr5e@desk>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 22, 2024 at 01:16:58AM -0700, Pawan Gupta wrote:
> On Mon, Oct 21, 2024 at 01:48:15PM +0300, Kirill A. Shutemov wrote:
> > On Sun, Oct 20, 2024 at 03:59:25PM -0700, Linus Torvalds wrote:
> > > On Sun, 20 Oct 2024 at 15:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > >
> > > > Anyway, I'd really like to make forward progress on getting rid of the
> > > > LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
> > > > back from both vendors, how about we avoid noncanonical exceptions
> > > > altogether (along with the edge cases mentioned above) and do something
> > > > like the below?
> > > 
> > > That doesn't work for LAM at _all_.
> > > 
> > > So at a minimum, you need to then say "for LAM enabled CPU's we do the
> > > 'shift sign bit' trick".
> > > 
> > > Hopefully any LAM-capable CPU doesn't have this issue?
> > 
> > LAM brings own speculation issues[1] that is going to be addressed by
> > LASS[2]. There was a patch[3] to disable LAM until LASS is landed, but it
> > never got applied for some reason.
> 
> AIU, issue with LAM is it allows speculative translation of non-canonical
> user address. It does not allow data fetches from those addresses. SLAM
> attack uses LAM to form a TLB-based disclosure gadget. In essence, SLAM
> needs to chain another speculative vulnerability to form a successful
> attack. If the data accessed by a chained speculative vulnerability is
> interpreted as a pointer, LAM may allow the translation of non-canonical
> user address. This is specially true for ascii characters that have MSB
> masked off.

Right.

> I don't really know how this could be a problem for something like
> copy_from_user() that ensures the canonicality of bit 63.

It doesn't affect copy_from/to_user() and put/get_user(), but allows to
make other kernel code (outside STAC/CLAC block) to speculatively
translate addresses and reveal secrets this way.

> AFAIK, Sierra Forest, Lunar Lake and Arrow Lake support LAM. To be on safe
> side, it is better to keep LAM disabled until LASS arrives.

Dave has applied it to tip/urgent. I expect it to be merged soon.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

