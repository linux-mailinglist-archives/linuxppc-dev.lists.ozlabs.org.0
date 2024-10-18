Return-Path: <linuxppc-dev+bounces-2369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADED9A391E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 10:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVJMw6kczz3bm7;
	Fri, 18 Oct 2024 19:51:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729241484;
	cv=none; b=PpeKvlH2F1Exm7O5NE/9ixlNsDKI8DNxgB3/2qX7XxOBxBzZXxONC7Auq+l00szQwVjI9qlGUZxMBXs4BsvHm2R7ixB98MGsK46IrLTWmN4t4URa0oEUpY6Gz0oYpsWpU/P0e5bS4bM7BcYlOfHqUNhosNvneldTpZtCMv2qoOi1epXB1dIX3gsi25tfNQOvgAIcFrLQe98tv/e10TR3qIgg5PK0CZKlo8rOl21dpba1mqOVYJzn0qa06aBXsLGDvTcG5DGXjINHjP77fMYa0iOOWVYE1ZuSEoaexPnwAsVzBYb02EHyofTX2Z1AlS8XaHR7uCFC037jv9RJwa2iCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729241484; c=relaxed/relaxed;
	bh=ujq12Rn1ZYuFrl0E2Y4gVr1fgaquKynz6QQkqj20W+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIFbosHxu4gozjfD3phHmvafBV2YbX1bIGR0KvsY+YT8DJbWHxVCuVTpDRfCKmr0fPDNaj1kQEU8pYYGULVyBynx8Dp0wwPWq4m568e1sduXMqKgCyswtfcVhhqGqAd+Gl6xjiwqi2ih+xrJByEoFhqe+kydDoCYvURU2tFjlE5RP0DoT8Fbw4NOpLhtD5bro36XtoSyoRQrFcDYmjeU8xUss5MiYTBUwGp4Pxc9PfBAiLCy29RUlPBGxDizCl8lktSDbNwZgaXh/VZSiCC6YDcd9qlZkcCrCuL4iX5PXeMOYC0m9r++qBs/OB+ZqJ4l7cjYgroGdgS7nWdBXqYnyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=Z3dLR58s; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ejJML6iW; dkim-atps=neutral; spf=pass (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=Z3dLR58s;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ejJML6iW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVJMs3Wk0z3blF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 19:51:20 +1100 (AEDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 971D01140193;
	Fri, 18 Oct 2024 04:51:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 18 Oct 2024 04:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1729241477; x=
	1729327877; bh=ujq12Rn1ZYuFrl0E2Y4gVr1fgaquKynz6QQkqj20W+0=; b=Z
	3dLR58snKKcCJZgZI3xeVE1wHwQdEhFcXogbDo3AZ9gydToFBWoKlvMNdW3k/uW6
	jCbmBS6p5qc3MNzRv9O0MH4FbMWnATsWlYwT/xu+NMD8Vy3206zBov19LsihtNoA
	5G7Qfo1A7R8SrUTivKRMGUsl917LkD2L0MC5Lc1WNScOM0WADNJlaoY8rzRFq0/t
	YydyrvyCUyRAjGTgjRhczBmGBSCEAcTowEjesgUcB/Cq8POTzcZgiFvXMHZ5SnpO
	SRsjVToGLmjHGCnE/DHje9zIw+qomL2+D3aQNC5D7wgNzuQMBLfaBnc6eblMXDTb
	4AryKgbnxwj0YKPNuiJMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729241477; x=1729327877; bh=ujq12Rn1ZYuFrl0E2Y4gVr1fgaqu
	Kynz6QQkqj20W+0=; b=ejJML6iWBsqgueuBT4fZuvsdujksEjLlVtrckefdgsrI
	Xa3bvEDZBt9GiFTgDWQK7q4AZuwIztZCiCo9PwMKcp33lokDnrIvsjtdcJoqAMme
	XdkKdIozTOxgDYolF4GlFiaFFPH89luiGJHwP6arft65XLKccD1chVmcTMsqnevL
	7HpBJEDDCMw6rJdyswhxup7SxIXrxuxD6wh1t9dqnSlTGbybyPJF3c/ezFtoVPhM
	DpVaYHXpErwN5stUMXGAOOuwkCmDXmezctQ3HlItD1ZhyvUT6tr9B9TnJq1cOYt2
	XURzh+eN50Mt2nAXAhOWiPuzyfXDkbjc+egK4gsAMQ==
X-ME-Sender: <xms:gyESZ6XSXpFEmaS-7geuqxyPc7tEhjHMImlRe461ajghgIdeWRQwEA>
    <xme:gyESZ2kKsqTZ3ESMyubcy5HTU4ObhKnCt37BkbE_8e6b1Zz73h6fsecWhSj0MigDw
    I3cJ5JPNUgxCqXbBX0>
X-ME-Received: <xmr:gyESZ-YcVbPyquP6e-_F1TyzjTV2ly6RhLx_pbLwIIbco9IbF4sbQTRVYYDn60dQOw5blA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehfedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutecurdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepuefhkeeiveegheev
    ledukeffheejfeeivdfgjeeukeehkefgvdeifeehvefggffhnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeei
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihig
    rdguvgdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehpvghtvg
    hriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprgifrghnrdhkuhhmrghr
    rdhguhhpthgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhonhhgmh
    grnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:gyESZxVeHzCRD6MAiqT2S6T207Wd3kzCe8Zfc5Ej44QKsFKILE-PXA>
    <xmx:gyESZ0mxgdkcEWjNKUEIx2l89WdjgL35BSRXD0HtleLh5TfcPMCBYg>
    <xmx:gyESZ2eusl9wn4Upuji7Eayx0BuCyhXnOirBUWRzJ4HorabHAperlg>
    <xmx:gyESZ2FdVtPX2R5ogsOIA_tr5uYKdf5owyjz2umGDCOl1wos0dbeuQ>
    <xmx:hSESZ4lkrKXKaV_5i95opjMMhO4ccmSeRUZGg3GphxIwdeo7Q1ziXh2k>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Oct 2024 04:51:10 -0400 (EDT)
Date: Fri, 18 Oct 2024 11:51:06 +0300
From: "Kirill A . Shutemov" <kirill@shutemov.name>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 3/6] x86/uaccess: Rearrange putuser.S
Message-ID: <srdcfvwgmm4aiyny5ex24puhi7u4rohy2sjb2htrzqhr7igekx@bh3c22loauzb>
References: <cover.1729201904.git.jpoimboe@kernel.org>
 <7818233ecd726628a3eb9cbb5ed0ba831e69af4b.1729201904.git.jpoimboe@kernel.org>
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
In-Reply-To: <7818233ecd726628a3eb9cbb5ed0ba831e69af4b.1729201904.git.jpoimboe@kernel.org>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 02:55:22PM -0700, Josh Poimboeuf wrote:
>  SYM_FUNC_START(__put_user_2)
>  	check_range size=2
>  	ASM_STAC
> -3:	movw %ax,(%_ASM_CX)
> +2:	movw %ax,(%_ASM_CX)
>  	xor %ecx,%ecx
>  	ASM_CLAC
>  	RET
>  SYM_FUNC_END(__put_user_2)
>  EXPORT_SYMBOL(__put_user_2)

This patch provides an opportunity to give these labels more meaningful
names, so that future rearrangements do not require as much boilerplate.

For example, we can rename this label 2: to .Luser_2 or something similar.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

