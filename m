Return-Path: <linuxppc-dev+bounces-2469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 889769A8FEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 21:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXQWc16h0z2yGd;
	Tue, 22 Oct 2024 06:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729539324;
	cv=none; b=KwAgqgYTsz47FITyct8n9H+HPEEB1eEEkseWQUPRMLeVTSsVG+YLHB5mXqFsUmjotDBb8se7JINXcJJ4cacAmBZj8guDJ3z4HQzAozaHTOTPBeZIzg/Jo6tAq4i2TlGjK9fjGUqsio36Fsna3dCoxw8h/hCdEqSOHuZDrj7kfK5weu9DkQp8qP0Qsuj0LWzvHe5EN2Z2At/lrL30SPmx0Ss5+WGKVIkERQdXNztUskihdmAm4dFikk2NgL1RaITqufASBBkR82MWDzgwRLLmKfvsdvhfzHbpiWGgWnl2pudQ8D7bmfSDFvn+2OT9Yk3iuy+Hb+CGqv3KqCYpvZKMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729539324; c=relaxed/relaxed;
	bh=3g8aVQixKnDjzfmZsk8cbWAQQrT1SpFFGLRDu0rhec4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4IuW1Swkt6uSYRg4/oPg4zqC0wBIwKWa+egtmIwqOQONtX9nObynr5rUd//esOv+8H9yCeGGPaEP2NTfGptlOctwcx9KbJRCs7KjNYomSwQO0Ub9sdJYykUGzHYH362lR60NWuIzm0naTnrHqGgxt3JKPCfXEpY1aToGxsJiHg9Yvd/9bXT9P5VIMNey+9VC3niztzq9JFI86qLfHrzEvW/bOo8XNIbD1FkBDWnVKbVO8TMGpiZyOhD3Ogrzlr8p7CCakxtgXD56m9EDGkXmTv1jC4Wf/AYXPHZMOD4TOtUTfwbzFi69F4e2KWxYZ+4m7HYJHv2btMWX08MVduaVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jM7+xStN; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jM7+xStN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXQWX0Ckvz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 06:35:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3g8aVQixKnDjzfmZsk8cbWAQQrT1SpFFGLRDu0rhec4=; b=jM7+xStN+R3o/R08nulj28qyg3
	ptfj+w+Rjjj6f4MQIl14DRerD+YkKc4BcBLat758xCORZKT1oDodd/xRA7ipvZ7etdyOmqXD8+VG6
	DZthBTFFSKWq8yYceBl++WW8jPxaaAukvWcrpTIWby3ZzIqhf3UGo7wNgX+myKyxHo9v8Vfit1MFW
	kIgvzy9xC0PQepVDJDHG6eJTfgrED0FoWOvc/oL8r1e9achMhsDCMIToW2O6wK4qwbsUSnourhuFQ
	v7mkeYBfZ9IaTHSrcKvy2wAXhZD4P82wEaDpF6dBxfjxX2BPLwogzySO4RIv7tw1VpC4Tuko4xV6N
	b2i777pg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t2yBJ-00000008SSH-1ApM;
	Mon, 21 Oct 2024 19:35:09 +0000
Date: Mon, 21 Oct 2024 12:35:09 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, masahiroy@kernel.org,
	ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
	Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <Zxas7TA5j8oKLa5x@bombadil.infradead.org>
References: <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
 <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
 <ZxQabNukxBo3utbh@bombadil.infradead.org>
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
In-Reply-To: <ZxQabNukxBo3utbh@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 19, 2024 at 01:45:35PM -0700, Luis Chamberlain wrote:
> On Thu, Oct 17, 2024 at 02:08:19PM +0200, Helge Deller wrote:
> > Hi Luis,
> > 
> > On 10/17/24 01:21, Luis Chamberlain wrote:
> > > That sounds great. Yeah, the above would be great to test. A while ago
> > > I wrote a new modules selftests in order to test possible improvements
> > > on find_symbol() but I also did this due to push the limits of the
> > > numbers of symbols we could support. I wrote all this to also test the
> > > possible 64-bit alignment benefits of __ksymtab_ sections on
> > > architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> > > ppc64le, parisc, s390x,...). [....]
> > > 
> > > I forget what we concluded on Helge Deller's alignement patches, I think
> > > there was an idea on how to address the alignment through other means.
> > > 
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab
> > 
> > I stumbled upon the unaligned-memory-access.rst document [1].
> > Please read it, as it is a really good document, and the section
> > "Why unaligned access is bad" states:
> > It should be obvious from the above that if your code causes unaligned
> > memory accesses to happen, your code will not work correctly on certain
> > platforms and will cause performance problems on others.
> > 
> > With this in mind, you really should apply both of my alignment
> > patches which you currently carry in [0].
> > 
> > For parisc I partly solved the issue by fixing the arch-specific kernel unalignment
> > handler, but every time module sections are stored unaligned, it triggers
> > performance degregation on parisc (and other sensitive platforms).
> > 
> > I suggest you apply them unconditionally.
> > 
> > Helge
> > 
> > [1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/unaligned-memory-access.rst
> 
> You're right, I've just referred to that doc and pushed to the new
> linux modules [2] modules-next branch. This is also great timing so
> that the work that is ongoing for Rust will take this into
> consideration as well. I'll just post the test I wrote as separate
> thing but it surely can be used to help test some of this later.
> 
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git

Helge,

I went down memory lane and noted Masahiro asked for this to be done
in asm so I droped your patches. Feel free to post a new iteration.

  Luis

