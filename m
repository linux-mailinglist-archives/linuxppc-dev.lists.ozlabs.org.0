Return-Path: <linuxppc-dev+bounces-3423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C32D9D1B15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 23:25:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xshyd0T3cz2yYd;
	Tue, 19 Nov 2024 09:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731968713;
	cv=none; b=XX8msqbT/uQCvq9pxMo4Li+KcnRaK7+ZxL8XwvuJegzhqY7tvnZP28GJcHcFmAq+BMiMVRu2+xgRmqJiUfD1ms8snl2ZhOkQ4AAS4wxeyFXVj+KzoFBzUKecqBdZoI9Xcqk+eO2mLoZQZBbnm/i77WH42ynpgO5FaRO4r5zmHoiNI0tp6bEZ2r3xos2djXzDAq1uKZlY1IuodZGFRGhUJwH0+Qx0u3aBEn5ipaEhs943G5BuJX3DtfYMuaq9+McxZGIJKugvJh0L600NPhZnurdNXOQpGqjPVwc02R9TpfxkScrsLQPr8kT6lW+LClN/FY/NwokxhR8yOpb+QITP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731968713; c=relaxed/relaxed;
	bh=+oVoSOIAo5jejOLl6QY9uD9rxavecIwyvFv8t6ZtrJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtLA2imOQRGIi2fH6SF6p65TAx7MJSJDj1tyI+tLOdH76dKbO1Sz2veQsMhYxDZMfXY9h53vpoVa+RA6AxAQkvtgc0nX9xRV61O45mgLJ40OaBZ7Di19eCjCEqdfaRihEpLe4qGNvt0fPZY9rQppGioyHgLE7byRsZRxtCE4TUGU2toNg2sUiIegj/sP1UqaWxaD2KzxhwYcEySDI4QIS6tYLoT8C4ZPtxLynDVzVrDvH7EwJRnXpHlqfF9Vzt0vaPLPc2jhip99pb+2jHAlze2aBoghsz9UgkEKut2L6YN9jNLP+/o9cTK9BrHg3HioKSLzHJm8GijiNpsxOjwBsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CaEUs9iT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CaEUs9iT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xshyb2mrWz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 09:25:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C13635C59DF;
	Mon, 18 Nov 2024 22:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD972C4CECC;
	Mon, 18 Nov 2024 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731968707;
	bh=ddPu5M9TE4ztBRt5Cq5MpiKHQ4M9ux9latV4D7SSYOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaEUs9iTNyzwUIBl8ZmfjCwM/V2WWCvvSsaMht5tLzGoar3sKADM03eD7P3OBG+of
	 awp8UnXXTtN9vu4UoX6+c9RXU/AdkBkpeNcjZV8ercJa0wj9z80J7RzSYP+ZfXhOSW
	 y1KbcNY5/JgFidtHJbttFVj2sfzwYQCIHRzehexHZWrdXoq8KW3TDxiaYFOaKA/lMb
	 f6l1NcVEO5h42R3nKDIfYo5xwBZa3R/RqdMSaVTS7WV5QKVRqQR1Nw+qSaD7ZXgYdj
	 /hHpSQJVo6Av/4pl+ZfKNZf+aAZbhLYgacaQ+ydGYnWk3agBjY68P7U03H6NvkfulP
	 KxCI9kiryowuQ==
Date: Mon, 18 Nov 2024 14:25:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
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
In-Reply-To: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 02:38:13PM -0800, Luis Chamberlain wrote:
> The only thing left I think to test is the impact at runtime, and the
> only thing I can think of is first we use find_symbol() on resolve_symbol() 
> which it took me a while to review and realize that this just uses a
> completely different ELF section, the the ksymtab sections which are split up
> between the old and the gpl section.

Thinking about this some more, if we're going down enabling a new
option, it seems to beg the question if the old *two* ksymtab sections
could just be folded into the a new one where the "gpl only" thing
becomes just one "column" as you call it. Reasons I ask, it seems like
we're duplicating symbol names on ksymtab and for modeversions. Could
you review this a bit?

  Luis

