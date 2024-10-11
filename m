Return-Path: <linuxppc-dev+bounces-2130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13F99AE99
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 00:22:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQLhn4gkLz2yyR;
	Sat, 12 Oct 2024 09:22:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728685337;
	cv=none; b=M6OctaIW39s69QFj7yljzw0JzFeIJvbzzOUtUMCjJN+1dNk5yXfjfjWu3ubsexckB0XLx4ajJZ/GC7d1ywA4ZjAZ+NpGWLCKTi/qpGUxknrx5TPllmVIUb4DIiOEsru0Nx3vFFfvRM0JXHI+pguuwjiwa0Pg/1P1Ts8IvSlNmzhMfLm50FIv191s3ABk28l5/eUDFDiWw6IWzl42vpYEhDlIKW80Jejfs5/H1SqQ06x6hXnvGhIo1BQQ2TnBsUkZ3mpM6rvLmT9uWl0scSVAdSaEQITkg3Or0Iqvs696qdc3Mso3+xXcqbuXGTtgp8TFoeGjkp5JcWt92PD4oMZwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728685337; c=relaxed/relaxed;
	bh=PYuUckV0Vt7kO7QP3cQhItikolMhImELIUsNrHEBPFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl78bLiivsPY/a0zdObDxaEC1h9vvj8NGHsKK5LMlInk0eGKM5xKhV0JpzVwZnkpM4lDV9AZPUmXDJUvrUCnSfBMeOJpJ0+5TjEQGca6iJanFKXq0CCgzfvjNUQGw+yR+HMdV4G5Zcj50sTMhtdQhNIWXOtL6dBWLWMEh7KA5diXJm6CooGqUMQMEAmfH8da4/Hh2ZJmgz6eZok4Odn9RimjoDHtW8m5micLD0khdforeXqD6YGdH0mMeRuJKMSsDtvbe2Gdsd3+oB4ihk++aqMuOYNqTiMxgm7sNWgK8FQy/MoclsVnKVsxJ+K7IKUQZiLkZh7ep/nBxhuBJBI37w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pcN6ikuo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pcN6ikuo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQLhm4Sl9z2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 09:22:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13BFEA44C85;
	Fri, 11 Oct 2024 22:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA63BC4CEC3;
	Fri, 11 Oct 2024 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728685331;
	bh=5olLXSZ89FpxCn4+GMLE3sVaUDfyIAgUMN4KPakNJ3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcN6ikuoLar19vMRfs0vbt+MzJX5NNXLuD0WdJMnsLHRkqKdxaw5UoyC8kkpcQUDG
	 N/thjtFZnL2R7fry55PrFTl2tvxKrpcvbgK3Lvl1x7uoHDAhBEd4jrNhOOIx3zyp7r
	 qjLicXuLaqXdQB+xPmq4kkW3y/GX8xDsVq8KafbEBPJBMB7AzjtEzSoBnHUnkridqE
	 qYESZPVrpeLD5gsbTgyvkoEzEmYtfDN1rBaCbS1CpEPWankb6ObLoapBlyO81PnuM1
	 QYTRHJ7DJAblD0D9CGz/aZIJ8Tkn+4W1k/ltc7ZY+20gmDhHD7JxIkT2/XND1/Ck+M
	 nilw1JNGPsIkw==
Date: Fri, 11 Oct 2024 15:22:09 -0700
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
Message-ID: <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
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
In-Reply-To: <20240925233854.90072-15-mmaurer@google.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I'm all for the ELF validation work so far, all that was nice, thanks
for all that tidying up. This however is not considering when we really
need all this at all, and not making it specific to the build times when
such things are needed. That is, yes I'd like to see the need for this
clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
when this is needed. No need to extend a module with bloat if we don't
need it, likewise if a kernel was built without needing those things,
why bloat the modules with the extra information?

  Luis

