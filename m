Return-Path: <linuxppc-dev+bounces-2212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBF99C98D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 13:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRwgs0Dmfz3bqB;
	Mon, 14 Oct 2024 22:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728907016;
	cv=none; b=lKxzwZeQFXPBKwtyIy5Q+pMpiRoaGFRkxXECrHoNrIlbSpb1ljPiUFWnpt7MhhnaRGRmAns6KfEAYT3alEPm/rgK0XyWomqjgIfN/G/aCDOZVjZFD7/6rtkMyX3klFrMxx0PT9ssswgfhcskbWERtDb2syjTj8oFDEJXHimSvEiAUcLLMoD7Ha9nUlQrFNVPqF9+IfDKNl1uJ/1qtEK5sov5/f3SDOHC2/Mk1wjZUdSt20XKzt+SJD+bEgZ+2sPZQWhnjybhmUmbcUZ9/PrKM+JdxBA1SSa6eJHa2dpj9suVdNbOEjb00B35tQuRClGGvbyjvVv7aZzvf0OjZzAMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728907016; c=relaxed/relaxed;
	bh=Q8Tj2Km+3RRkR81FyQxGHoKLsrVgqbc1oNQBdqAi3Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRwRYfaHm9oRBY9DP92zXT755Iq/hUlulaSznTAlx15SdRC4iUwuRQf/x+qcnBfEurmtKo8Kod3j4ny4vS8k7m5qOft9BeeFjTO2ePvmVNDfZQKWnaXbKe2UqaKv9tFjmtmzaYfx5aENhffFd7upey5GeWetMpYO7ogHavmOiTsd59ipV9druObclwa4H94evruHaZCdM7sjifMAXf3G5WQumLw5OquBbmVJA/91lK9yb8KitWOt1+GGEi2gMi7omCJdXdtZxe+2uRQdnmDBgHT0zmBY11H1lIHFuOwSqDPJiMO9YjTeVRxujss4DHXVpTtQM3lQArtlYG7LehvQ0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=EMKmkvP8; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jRBjaH4F; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=EMKmkvP8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jRBjaH4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRwgn0XNwz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 22:56:52 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1FE9B1140171;
	Mon, 14 Oct 2024 07:56:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 14 Oct 2024 07:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1728907009; x=
	1728993409; bh=Q8Tj2Km+3RRkR81FyQxGHoKLsrVgqbc1oNQBdqAi3Bo=; b=E
	MKmkvP8pmb8y1JrBDjuXaXxUBelaOETFMh+NJsKgNj2d8oo2LCxJuyQg7Xc8dj0d
	VSmUbFaou1B6kh7Hw1fPrPmDwsYsBebcrD2GaRp7QapcyuBacO45f0YI6Hv1H7ta
	nqHG2Zg2zghpSCQf5zJO4C8XG2qAG/0V3kLUAEPBnrI+h8d2khcBRpklHUjI7hzm
	kT+bESCdtVxMe0YZt6HSG+r/2/tdiRcQ4Cxfg6wQ1vRGMC+w4JlpcC4Foc5Yk/9C
	bBpmd0TQfa7Hb3QnETTwCKFjOt1FbGhv1uM/OyAWFSLVsXQek7Qq/ZZhd4vlMrbf
	21tlEUskRDdiTEN7chwaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728907009; x=1728993409; bh=Q8Tj2Km+3RRkR81FyQxGHoKLsrVg
	qbc1oNQBdqAi3Bo=; b=jRBjaH4FfVb8yjTFj4Yfk7TnJekeW1hqnA2mEDcaGPl1
	qsmKJlk/agPjXIQoWOYZCsxSzq+c1+qM4S/6YrV89GwaO6r5yEkCSEkeuok4T3W+
	ZOMpO1fvEaLXiQuN22FQkKOkjiOo63NCM8LtpcqiDp48pal3OVSsCryiETeHIF+E
	DHd6jSv+C9gr20SJz/UXW+czJozTea5Y/IQ+LNQYXV0MbYQwayogzoCN88zM8QrC
	Fo/0txtE/nS0hZ3j0Sy6HgtQBEFizX05saNuon176WsM//UxQbxKYwVdCsTr1lcf
	NafGovIrkVVmgmJ/nB/Xz2FAMghg//2lpBkxFWAdbw==
X-ME-Sender: <xms:_wYNZyOyO6UmCZQG21xrta7C_ZAbOo2MADKJYxlT5Q7d_YIhrk-0xw>
    <xme:_wYNZw9nsNaXJ4ekuR7jH8fVVU1x4bKgsC6lDgsD51ok4PjfG4gtPlc7zNSEy0DBv
    o79iIYY-JYKpv6fCBY>
X-ME-Received: <xmr:_wYNZ5Sz5-CNAbWTuUfTBP_v-XfxBEpOwAMlKAWAxmaK4jD0FdIiIEJJn5ixsFN67EDGwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfhhfff
    veelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhv
    rdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhr
    tghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtph
    htthhopehjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekiees
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhii
    sehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgrfigrnhdrkhhumhgrrhdrgh
    huphhtrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlohhnghhmrghn
    sehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:_wYNZyvaURdnKiwFstA__EBlbsDfxEGa1NlzhoEh-Y300LVlG_r6gQ>
    <xmx:_wYNZ6dKxB0Uk7uXqrHtIO8RZKeViEqqUCqe8kbLHu4YqccRUqJ_hA>
    <xmx:_wYNZ21vgCyF9IH4MnZkNmet9KdKkmjLmzuMBQevXx81yg4PjqS-HA>
    <xmx:_wYNZ-_w5AcFHTLMbDKlPaoyfVPuKrJrSwep9uU13B6cuXx1VWcQgg>
    <xmx:AQcNZ13uqXAVkihuJLEs7yNGUaQ3QG58JiNYwWGAVChFJNK64IMKD6pg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 07:56:43 -0400 (EDT)
Date: Mon, 14 Oct 2024 14:56:38 +0300
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
Message-ID: <4nypzjisje2poptiv2vp4e2dp2hbweumgwrxemm7d6zbzn2p5h@vfhklt25cs37>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
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
In-Reply-To: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12, 2024 at 05:53:19PM -0700, Linus Torvalds wrote:
> On Sat, 12 Oct 2024 at 10:44, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Anyway, what's the speculation window size like?
> 
> Note that this is important basically because we do *NOT* want to
> check the address against TASK_SIZE_MAX like we used to, because not
> only is TASK_SIZE_MAX not a compile-time constant, but with linear
> address masking, people actually *want* to use addresses that are in
> the non-canonical range.
> 
> IOW, see also
> 
>     arch/x86/include/asm/uaccess_64.h
> 
> and notice how the x86-64 __access_ok() check *also_ does the whole
> "top bit set" thing (iow, see __access_ok()).
> 
> IOW, this actually goes even further back than the commit I mentioned
> earlier - it goes back to commit 6014bc27561f ("x86-64: make
> access_ok() independent of LAM") because without the sign bit trick,
> LAM is a complete disaster.
> 
> So no, the address masking can not depend on things like
> __VIRTUAL_MASK_SHIFT, it would need to at least take LAM into account
> too. Not that I know if there are any CPU's out there that actually
> have LAM enabled.

Actually LAM is fine with the __VIRTUAL_MASK_SHIFT check. LAM enforces bit
47 (or 56 for 5-level paging) to be equal to bit 63. Otherwise it is
canonicality violation.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

