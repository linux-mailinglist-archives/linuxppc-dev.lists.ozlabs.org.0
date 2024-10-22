Return-Path: <linuxppc-dev+bounces-2482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F129AA039
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 12:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXpcn3zZMz2yVM;
	Tue, 22 Oct 2024 21:41:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729593673;
	cv=none; b=B9rch2DsHvPc/krc62oH/mz2sV76xfygG6pr2gQGrMU/OgpPQso4KkMA2Nk5fA1quuJQBnoJdd4BlgICwUOFXETRSRoiRD0b9IPXpgyyZTY/CpsiO7x0ZcD2nZ14QVIGxmp4blBEmlbzJHnzGozhWBHWAEaulR7SuDeI4R3uZ2+X1RT99UO5D1rLunHqnVHwlvKi6kuENlTageMA00gqTc7+7/K+nEdvTfmKNSOjV+msNIBLnA2+p/HVOGdJKZ4808c/8KvBzwcCRPPHuYZ5e89GkwqOizSQJMe2Mv10S0FVFwHRI5hXPCKAoep7ZNdB6eDZL+kYhVk2m/Z74hDX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729593673; c=relaxed/relaxed;
	bh=FNfJ8dUmJg5X+LCsJgXshGfEo2a7ZO2pnQnnpHUMjCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpXCbkw4M01fTAwzAnf4W2ERpxCINGFAqNzUbT4lW3gopm5k/hwUyAr9b6WWkHX/K9aHsLRbBXWlYlFGWPGN9cOd/94kEM4IrzOc8LIG5QZF3k1lSuUytorW5FGw5bu2aJpAcmNirAF9W2h8LfsCZHifMLejoWM5JkNu9bWXwrLZPXsupadLUxmAckR/bftXGFK1CJecXfbRMF/slbFnH3oz1GgEppWKZtKnJqeu8isyhaJvfUQsONB45oGrTt2AZTNdMa+kwmqEk98LiLmgpGtPBAsXo7sTxxRrFieP80pylkGNQtkQJzGPHQfL0hmKxJR03+Heyx/wvNOPrzS1fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=f2/ytXxs; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EFm7jnLf; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=f2/ytXxs;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EFm7jnLf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
X-Greylist: delayed 444 seconds by postgrey-1.37 at boromir; Tue, 22 Oct 2024 21:41:08 AEDT
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXpch23fJz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 21:41:08 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E35011400A8;
	Tue, 22 Oct 2024 06:33:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 22 Oct 2024 06:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1729593220; x=1729679620; bh=FNfJ8dUmJg5X+LCsJgXshGfEo2a7ZO2p
	nQnnpHUMjCA=; b=f2/ytXxs+eas3Oz+HRWWi29ecN4AGKW2HMc5PP5qR75DbReU
	JU+ubEpyDWQXCecIJxeXIj/XnMXiIFL5nWOFpmr/pRqW0x01eMBCvZx/Jrt6R/6E
	6ayQ3egYAEuQvC/ouxOArvBaxi1kCeJzdQgLb3y/Bm7dhyBcEO4ytMElf7gBkZkZ
	0DCic8vhTp0lRnEyLgEaC5RFAlD4oAFS0ovDl/tJB4Y2tuDWhKgJZjrPR3Rt2BZc
	EIxotsprhty8oWH3274QhEK1L/KcIKRBpHKpEx8E5bZIJyvcjUsI9uW6GHOSuevS
	pHPnRlAsUf6yVo3sb7dw2wnXTtnGxrKPoHaiqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729593220; x=
	1729679620; bh=FNfJ8dUmJg5X+LCsJgXshGfEo2a7ZO2pnQnnpHUMjCA=; b=E
	Fm7jnLfFn2VQu4Sdt4xe3n3W7h7LXuEhQBSmrx24DZ0qtPiOwqW3ZXOJlwm+XTGN
	4AhGw7VyJw3K/LZmogcswUKq1rEZ5Int1WmA4V+JQkX6rN5dX2pSGrdZIY7LvXP5
	l3e/RSox4TXpPioSU5Jee+UFLQV82IH1KeDi7KgIZorCAc+qNi+/hUsmmFTBDVCf
	VhyTVKKqsIipkkfn8UBzi4MRft3mxoSKlliLCZlYevZXs/Jx3pbPeBQ6cURq20WL
	hLxUBXSWbmUM53Yw+EIaCOtMkzyTeRNwq9Mp52chyQ9iaYElEJkE+bDZB+WqZv7p
	HuVbNUlx6VoiJqWTbZ04A==
X-ME-Sender: <xms:g38XZ3KQZ8zFvZ8fG56bQInt6d167EiekdMhmwtN-soJCqEuPh-z6A>
    <xme:g38XZ7II7WB9NiPBEcv7_j-6diqnlHgFdywH_vgKKlPzv7VzPmURkCo-mPKmeMa2i
    KpgjvaZqC51mQqF8bk>
X-ME-Received: <xmr:g38XZ_v3NJKeMrrCjrOZrQ9fBO13hzl7N8sGPF2kRvtpFRS2TzbTeYpFZWS8H-dEgcy16g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddttddu
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepueejuedvudduudef
    vdeutdehgffhgeelvdejjedutefhgfeludffvddtjefgkeetnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigkeei
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrd
    guvgdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprgifrghnrdhkuhhmrghrrd
    hguhhpthgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgr
    nhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:g38XZwaEoGHK47KRx0MQyxvB4JcTPAfvVzGMtvgG4aKYN07zUjAiWw>
    <xmx:g38XZ-Zewe1N2SdvUSBuxt6d6CGx1D4gjeq9MHFV8Ohuc18DODFe5A>
    <xmx:g38XZ0CohmfxqM0SPAl8NDBf_4Ztws4l8-E75cRw4TNLogbDuABqvQ>
    <xmx:g38XZ8a0HB03DWER7ohAes51F4NC7cV8ob17Yf8oMuzfmT0dwQkr3g>
    <xmx:hH8XZzLvW8CJ4i2foOnxwVv2oZWH7nPcMYhrlc3E2-XVDTSeleBZ0On->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 06:33:34 -0400 (EDT)
Date: Tue, 22 Oct 2024 13:33:29 +0300
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
Message-ID: <w57vga52m3qyocwupwyvvscumdw47ajyvryys5id6afkqxbtkg@yxf2e4ky4ssj>
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
 <CAHk-=whPey51gZ1N_pBGAOfc=7uRf6vq9vxPFhYSCOT7Sc_Ogg@mail.gmail.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whPey51gZ1N_pBGAOfc=7uRf6vq9vxPFhYSCOT7Sc_Ogg@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024 at 07:36:50PM -0700, Linus Torvalds wrote:
> On Mon, 21 Oct 2024 at 03:48, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > LAM brings own speculation issues[1] that is going to be addressed by
> > LASS[2]. There was a patch[3] to disable LAM until LASS is landed, but it
> > never got applied for some reason.
> 
> Bah., I think the reason was that nobody knew what - if any - any hardware.
> 
> I did find an Intel "Product Brief" for "Intel® Xeon® 6 processors
> with E-cores" that claim both LASS and LAM, but that one puts LAM as a
> "security feature", so that seems a bit confused. That's Redwood Cove
> cores, I think.
> 
> I guess that should mean that Meteor Lake ("Core Ultra") should also
> have it? Or is it then turned off because the E cores don't do it?

No, Meteor Lake doesn't support neither LAM nor LASS.

So far, according to SDM, it is supported by Sierra Forest (E-core based
Xeons) and Lunar Lake.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

