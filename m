Return-Path: <linuxppc-dev+bounces-2333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F309A1615
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 01:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTRnM3tYhz2xpl;
	Thu, 17 Oct 2024 10:21:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729120919;
	cv=none; b=LTWG7DEtLQ7hPgYZWty3NNpbwkM5AbxGjY2s+sOVs7zpuAPwKzghaCm1g0/oCN6Dw/fJK17hGftLt2ULCQFNxoyXvtxWI7IGgAGqa6tAoSyLJhQku6vLu6FQILjsR4FqZzwgz6A9knWCbi1jsaPPRaqaDSwZuxIhX4YPL29q62BDtlEA8pDnAvmeptSVzOitut5TW3ujvH6WlBSnasn9LgojgFkLvhYkjwBY4oY7zPD6rd2fsUe7YojyYHxoixWmIFLCHAknn1EfJlvMMwUL+VobYf5bl2W+yMXHMeDmac8jB4xmDExl8yMOJ1R2+DQrkvpVYRrfexRrsnGCWFb3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729120919; c=relaxed/relaxed;
	bh=0v5RcMcp8vH7a7Y01eTqs0bvpyj6bTOY4COXBwA46+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVV+v6E1KGiA8Q1lqrDMPFphs4TEVjIjHQ6jGdFPYFfNmtMYpnDKeze9NbWnyWsMu9bji/wfuRSYN3NcussV3fIMsBvbo0CEfA7nUbcrLUxNAKqzet2j5EocoIwQhGmp/UvNmrLam0FDIzaHygnxIt4/fyeQia4B3pUI0EYmg0gNSnIOoQppF/1dI5pSffnzzrer/0glAV/sir4skyKVcAHfuYPaKP4bL2EA9Ja+IGfLM9KJ2xlloro5Lh9zXwFesbRSyAkMyZA1k65kMD+6KR6VSloM8vJ7Br/ABOImaktXXNq97Hcnqom/rt07cW4/kDiK+7Y7i0pbwOcrphI6qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=af7Bah2k; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=af7Bah2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTRnK6Dlsz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 10:21:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E55EDA41DBE;
	Wed, 16 Oct 2024 23:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82CEC4CEC5;
	Wed, 16 Oct 2024 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729120914;
	bh=jj2l+z5z0T64UjsqbIKx9n9DA8OiXqjAqg3PCGZgsoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af7Bah2k2HGKpQSGvVX0//1Ci0GFMWdzohzgWvqZ9Ud5O2dzDbLEEIPrUPxCRrhl2
	 w+Bw0udf0cCZ3+n/WXZwh0KBAMGY/XvxgpJbH4cp7gV1tUKBQYdp0Ofc2ct7zdCh1Q
	 +wLXSNDXsYQuOQRZ1Ay85/IZyvUi/SWqSWbHVXsy6R62raD0HUR5Kql/usoTjVrzSy
	 hIR20HgR3CkCEFc+uVEIsmi56qZiILM87EB81FchDBLU7swQG6osrl3E/toanDh4R3
	 r+IGcCk9V4cWh5cZzCnD5mQ04fFBHzmI0IYUpnEUclr9BfO0qkkOo1Un3FPWT+scGP
	 FpHJUYW5QDvnw==
Date: Wed, 16 Oct 2024 16:21:52 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, Helge Deller <deller@gmx.de>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
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
In-Reply-To: <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 04:22:22PM -0700, Matthew Maurer wrote:
> So, the basic things I can think of to test here are:
> 
> 1. The kernel can still load the previous MODVERSIONS format
> 2. The kernel can load the new MODVERSIONS format
> 3. If we artificially tweak a CRC in the previous format, it will fail to load.
> 4. If we artificially tweak a CRC in the new format, it will fail to load.
> 5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
> load modules with long symbol names, with MODVERSIONS enabled.
> 
> Is there anything else you were thinking of here, or are those the
> kinds of checks you were envisioning?

That sounds great. Yeah, the above would be great to test. A while ago
I wrote a new modules selftests in order to test possible improvements
on find_symbol() but I also did this due to push the limits of the
numbers of symbols we could support. I wrote all this to also test the
possible 64-bit alignment benefits of __ksymtab_ sections on
architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
ppc64le, parisc, s390x,...). But come to think of it, you might be
able to easily leverage this to also just test long symbols by self
generated symbols as another test case. In case its useful to you I've
put this in a rebased branch 20241016-modules-symtab branch. Feel free
to use as you see fit.

I forget what we concluded on Helge Deller's alignement patches, I think
there was an idea on how to address the alignment through other means.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab

  Luis

