Return-Path: <linuxppc-dev+bounces-2132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131699AEB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 00:33:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQLxG5zB5z3btm;
	Sat, 12 Oct 2024 09:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728685986;
	cv=none; b=cH94HfMZFq9Vc0tMQPPgHGPQvJ8pY6UDOHMqcKtxvg6JEfytuQEYBndoR9XJcVDUWlVrzBOpPLHJjBYHAPCsStQ+a/xUj8bk+yiuoZlJeKi7EP8Ni/94Q5RT5XApK5ZSylnahH8dIfUxFIJTq+uaVENrb+FNsBF9nM58bOqQ+oXh4reXow9ZcH4ESGSzDxkFPQB6ZGV3rk8pjiRKS5flqsW3tnRgizagTlzgAUxdyXnv90RcLCcukWofYeqiiBSZBEb0A/Q1OGrGAS61bGJlNxiUVjom52bHfyNJOCmoS+0Pc6DtEED7q0Q6zGF0KPzXVWbYZ6LYUkolw1Ydtp0Jeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728685986; c=relaxed/relaxed;
	bh=2YoLX+DxpzfYbRom1j4yKgBd224Nf+QIppDlRNZFwnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ7NTFCEG+WwSgz55/1NJzhwwLg6+PwMEE5UcEc53r/quTl0BQoKDf/OzRjPXbBDI13P37+w5D4t5J7hgz/uFZFdF4qXfM3tqdHKXV5cX3r2GhdMpnDKVccJ5lz+KIOmvNkUFvElpsBqRXKpHxfXuoFu7b/e7vDJOJP/DHnXUVU//7O0LFKyLN8BhqaNL2SHGcQ16K6h6z3UX+nfsjIYl5/2OgX/wSi7fHJAmfH4jgfM21amWz1oK5PNDpD13efHCcgGc/lt6Ryxrc3tyFrX/kPh3p4q8bi5czotmZtR539tYERAdc6bF8AYC+vHxcnW59f6Jw9vUNBhLLJ8aGZF6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UltoW1bQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UltoW1bQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQLxF4gxdz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 09:33:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E466A44DD1;
	Fri, 11 Oct 2024 22:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBACC4CEC3;
	Fri, 11 Oct 2024 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728685982;
	bh=Flv0GRLdeQ1gSwjTyDQi9TrDRlUCwbdIuIXC2XemiYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UltoW1bQhYsLEoAMKIMx73Un2N6BQyTAqiDcMjWtFMWm+EC89r2nG3jWEDkIUitKx
	 xGmutP8SJsm2LRNo9e1HQMqCiPs9bwKHHzwni7XZ9+aVTj1WCClWpaFQ13670kp1aQ
	 WdkadD19Kz2UEXKDu6/gszCksgxGKQL2oO2VsAW5SX0tLOWKDnmLvDlrC58Hwfymls
	 e+RQxQlhH6O09tJfVGm/wowj2g/Kpcxu+1TiNujUaVEiSl3WWv0z72NHqYj1KjwTVy
	 Z8/3k+m0ngf3MKY28cuCVKRDFvkGY0LCBYST1yZuLhzNSgPpZzzWx2gsIT7eNhukYj
	 vH8ndhGsm2TPQ==
Date: Fri, 11 Oct 2024 15:33:00 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
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
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 03:27:30PM -0700, Matthew Maurer wrote:
> On Fri, Oct 11, 2024 at 3:22 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> > > Adds a new format for MODVERSIONS which stores each field in a separate
> > > ELF section. This initially adds support for variable length names, but
> > > could later be used to add additional fields to MODVERSIONS in a
> > > backwards compatible way if needed. Any new fields will be ignored by
> > > old user tooling, unlike the current format where user tooling cannot
> > > tolerate adjustments to the format (for example making the name field
> > > longer).
> > >
> > > Since PPC munges its version records to strip leading dots, we reproduce
> > > the munging for the new format. Other architectures do not appear to
> > > have architecture-specific usage of this information.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> >
> > I'm all for the ELF validation work so far, all that was nice, thanks
> > for all that tidying up. This however is not considering when we really
> > need all this at all, and not making it specific to the build times when
> > such things are needed. That is, yes I'd like to see the need for this
> > clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
> > when this is needed. No need to extend a module with bloat if we don't
> > need it, likewise if a kernel was built without needing those things,
> > why bloat the modules with the extra information?
> 
> To make sure I understand what you're asking for, are you suggesting:
> 1. A config flag for supporting parsing the extended format
> 2. A config flag for supporting parsing the existing format
> 3. A config flag for putting the extended format into produced modules
> 4. A config flag for putting the existing format into produced modules
> or some combination of the above?
> 
> I'm currently reading this as #3, but figured I'd ask to be certain.

3), but if your kernel build does not require these extra things, then
a simple if !(IS_ENABLED) sanity check could be put in place to avoid
processing the information if the kernel didn't need it. It's a one line
change. So at run time, we build the same kernel with all that code in,
but it makes no sense to be processing modules with that stuff if
kernels did not need it.

  Luis

