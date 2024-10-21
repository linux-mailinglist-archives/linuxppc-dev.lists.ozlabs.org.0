Return-Path: <linuxppc-dev+bounces-2467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE639A7291
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 20:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXPP20xhjz2xy6;
	Tue, 22 Oct 2024 05:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729536278;
	cv=none; b=BLsZa1x0e0OG/9mAYJQzb4qod4pYzauI5BvgjOg/15SkpXJxlzvxO6iiK1UL6x5vadcrcuo1OlsPOg16wgXPUHSUZkKoi3vwXPcNaFK2lYxDxrPuJgewgFvezkO+TUFMe58zN+f2yLVFTBX50oUGtSt6NHghwiCgdblLBhXCHy4RnNjigj4B3I+oMgW3pjFKueVY0ixz3NrkJ3zi7FFvJK1Ze2QCgE/wDZI/TKOJwnuBDD16j/MDQTk/t52RgYoeV9kvT03klN8hCchxHCNDjgh0CP6Bh3+p8Abpl1p428vuetyXAjVB/m9O/VpgaSCDktVyfOfhWLKboEqdOmnwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729536278; c=relaxed/relaxed;
	bh=LXs4kPrcJruBKCChQeSJhGbS/oLr3Re5bD3RxfHm+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVyVkyH/DFLU133hECEqKq8+iT8HeVvU+99M8ntF8zYCSbGxxtwwyLFxTSpGqkl+ZDL/im8WBcK33LvzRxmmtCJXcgEaD0Avepra1wVb2LHP8LBJOaekL6cPc33l8BbLB1wr+0DRFpbqm7hzctbiZalgE1CtrXE5UirwbTL0IK7lcQeF4FGVozWpDbad+OnHZq0mRdTZEeDMU69w9R9ByHtr0VRJ/u/MaeFJ+avaihPulvgt1FH7iFGpWQKc+XzP49yKZZd4lBlUesxoA5fbBQIMIksTr+JVILdz0ajAxcase5MzLisuvDJQ8B+vWUuHRwZ6oQ0vp7Uw5JtI3xT9PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQm8I2/m; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQm8I2/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXPP11M4vz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 05:44:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7F545C56D7;
	Mon, 21 Oct 2024 18:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD8C4CEC3;
	Mon, 21 Oct 2024 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536273;
	bh=bm05TRGC4RzzFpXYGxFW46MniU6yPe/nV2EgssZ3oV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQm8I2/mGJAKd+fCK87nrxLPiQDaK4ssWWSN8AtsVfJfsZJYBETTy4TD4Lg9/gmSH
	 hoiL21kW+o/XAmDSTQ8tNq342QOM8lPrS6tuYDDikI9LJiS296jvO0p4cvpYt7UuvU
	 nAVor0ZqKOABGHFQihYG8Et7bzB7HIzG6RbybOz45oW4ovc6dWgfe96VTJeImuwY94
	 ZQm3dWCJ3sSaH+wwG7NmLAqwgF1e5p9D5RVrxWPxdapsYML2sFSpXy8cXJube3o23e
	 MI7iV280bp9k2Mt69U8gqMfZZJAM7taEhTBc8T496Tyq7JsgnoYn8cUEZuxCUd/6tC
	 jUcC4dayGgF4Q==
Date: Mon, 21 Oct 2024 11:44:30 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>, linuxppc-dev@lists.ozlabs.org
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Benjamin Gray <bgray@linux.ibm.com>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	samitolvanen@google.com, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 2/5] modules: Support extended MODVERSIONS info
Message-ID: <ZxahDv5ZKdM__0sZ@bombadil.infradead.org>
References: <20241015231925.3854230-1-mmaurer@google.com>
 <20241015231925.3854230-3-mmaurer@google.com>
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
In-Reply-To: <20241015231925.3854230-3-mmaurer@google.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 11:18:57PM +0000, Matthew Maurer wrote:
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

I'd like some PPC person to review this, and also please document
this under dedotify_ext_version_names().

  Luis

