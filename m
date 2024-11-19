Return-Path: <linuxppc-dev+bounces-3427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A39D1D60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 02:34:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsn8W1NQMz309h;
	Tue, 19 Nov 2024 12:34:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731980043;
	cv=none; b=JPFJmEbgxsFxkWIvC4yQhbju+ns5eMGpwFS+SvZmkk4AG65Wpb0t2HLVQnoOOeG9U/AQ8yugMgHEAnR9d0IdcHOe4cPIxFw3lBlampkhCZoBr03f15xM1Z6wxruRs5kjOpON6PgG2nRPuFOjlWktWxVtKdwUYoTM/yUatsOaaimtseVMdkBNPIHB8jsDgFkvkR31bdRv3HP5yhbK/n9VRfGxPPDFEdqzYGwbZMOSJXQ3lZgxOBkvZEf1RodZuhSTvfBhKA7UvsXo+dzxG+xYbbgi84wI/l4NlFzS2veke6fIkxmQVnXruOfByBpNS3C0Q0IMoY1hUOsvFmLaomyo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731980043; c=relaxed/relaxed;
	bh=1EcTt3LZ3/F9IgSOJCOoaPl1R159U4S9Mcj/0iOKYdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlshtXRtd+fM8WNkD5fy4fBXKBeNJQ1ar15Ngxrz+JkXOTeoNiAczG9n/mshI5fVxXZwcuSAlM1u0Hqx3Jd5cFLMZ/9mEk0BwpXvchwAHGO1iCZKp+jQJz4bpn0zMLgFGGetjVRWmseePkwgmIi2MaH3x9sSMJoooFdF53U0hLBLIDmiWRpHitXUCra0ZUNUJFjchv1uUZMZ/p3z3Wr1rmPijmsQmaz97hcm8lIkQHytxJyPwo5WWhK28OlkI8oY2XtStO1tr+x5uYojUleznC8bLfeVBRNMesd9bI7NNJEmkhuslxurfOT1o9SoVtZeIfaVhX87mxe8rUj6OpyLDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eem+nPyw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eem+nPyw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsn8V1D6Wz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 12:34:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBA23A42137;
	Tue, 19 Nov 2024 01:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA7DC4CECC;
	Tue, 19 Nov 2024 01:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731980038;
	bh=mNt8PlqqcC/OYquNFftD5zrdVAQF347e7lS7kQENIPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eem+nPywW0S2PDt91tSJR5p0NMCU+bTT5JOtCmT14pE/aJodu5jgVPqbKYtMScBTO
	 4a6oEr0BIwqu7ctxPRVl4gmjUfKuyKWzV3GIlqflmoxzJTtyF3khU+bFKzkBa4W7xn
	 uS/0+gnOstSaoY32KS80dPq19n77mZfH4F+fTO9puHA/NZT0q9IKxwGIOM8SNaQ3fT
	 aEUjEhlu2kI833TKd+EX80pn6Ajw7GdGwNBKwigJWaQB70jF4DZV7h+WkWYW1nrFLT
	 VhV6Ro96JpzGjR2ogkz0k1QY4DP8MjriuHWtibLjHrgQXjIoet+kamk0xEN0GtrJS2
	 CokaAdc0f2CMg==
Date: Mon, 18 Nov 2024 17:33:56 -0800
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
Message-ID: <ZzvrBDb9tRqaPxAa@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
 <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
 <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>
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
In-Reply-To: <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 04:09:34PM -0800, Matthew Maurer wrote:
> > Thinking about this some more, if we're going down enabling a new
> > option, it seems to beg the question if the old *two* ksymtab sections
> > could just be folded into the a new one where the "gpl only" thing
> > becomes just one "column" as you call it. Reasons I ask, it seems like
> > we're duplicating symbol names on ksymtab and for modeversions. Could
> > you review this a bit?
> 
>  Short answer: We could do this, but I don't necessarily think it's a good idea.

Thanks for your review on this. I agree the complexities you outline
don't yet justify the churn.

  Luis

