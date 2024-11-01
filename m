Return-Path: <linuxppc-dev+bounces-2765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D029B99E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 22:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgD6J69Q1z2xYw;
	Sat,  2 Nov 2024 08:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730495432;
	cv=none; b=Kba2gmyLyiuu5/CVi9Ko1tTAIf3g4FYFa3OQgVQHJgAigSw81ESGa53xUCq/zfevg30sYK0KV31HE7v4XRSQhC0Xi/E8mb8w/d78LBwng5oCb/6+7n+9ykcuPJUPlxA+d1PRmjNB9kyrYU4GD6IaRb7ac5MqrfiPv28vmSJ6cdRpaaRF2qObngQrKcGrTkvkZkXGSmuW8g9V832rXx71tJkUk86CbyNphp4AEX3f5iMvtyRaDmNqK6mPtqyWTaUGiJyUEgNaVDO6SW4sRwnRErofI35JSxIXfpg28KJW0F+0nGI4vJnPUkJNrYklt+JvkrccjWQpydcq6ZBjfUgvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730495432; c=relaxed/relaxed;
	bh=xQRjFvCv4qHBZz0wVXN72Bo7720ISlhIaI3QO2ZCilc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjhGaNcQm890/va/vMmUqNu+me+vRvC+ns3rb+We/kfvrlkHRFUcDK8EAO3PwjPAiATBrh+YoGj+E+Rp58p90evbL/YYoLoNuxdwPR4W6Eh4FSRA7FgXL3Fbj08lwCFvXXZAF0AaKEx++RCNnlILgamj0NnTaDMx+Oh0Fb5yY75H1kX20EXqUpF1V+u+eyYC1kuYw6tZbhuaG3LG5ecexZ87ZYqnsRoCo1KgQrpCQp8j1Wq2Yc3y3PMbwv7RpvNCAbPiFesWmXofWo2DJnFx0mpVkCUs9VuPF+rXEQAXAPPg7PCDREV2uwZ+3nDOUQnQNGn7VpoQWc8ZKRWZr2zgQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OnxqZhlL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OnxqZhlL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgD6H5Dbxz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 08:10:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B7645C5C69;
	Fri,  1 Nov 2024 21:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019BAC4CECD;
	Fri,  1 Nov 2024 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730495425;
	bh=iyoQ0SoznYC5xCs0wEiyKZlGiMYOyU/gfF8eEWA0h94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnxqZhlLQCm4F6jRIlfQHrp3HE9n+L+dOm9rbuBMf7OdYO8rKcf1IuXg5KqhdQg7x
	 xvXAzYTsxP5HhRtcZ2JzXmr7gBdf7Kb/DxBQW1G2Jz/Dxg3S0tlb/JOy0L4J06JkXF
	 sih+G67GeO3dZQpUW/pFFmjemzwtkZ3OscUle9QSxkGkH1WjHzuprWUyCBpGA7279K
	 uE1fMVVVDlN0tQ4qomSIx+10fe1fYLWLIuMzkUnaKLzQpCuU4z1qcIUgV7qzyygpLd
	 OcPlLj0Lhu+1k/dFDb/fd+w/xz7Md5vKJHywpsoREfDnn7501JrZDpOgSbnWID/ptY
	 z/PcsRO8UinZQ==
Date: Fri, 1 Nov 2024 14:10:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
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
In-Reply-To: <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 31, 2024 at 01:00:28PM -0700, Matthew Maurer wrote:
> > The question is, if only extended moversions are used, what new tooling
> > requirements are there? Can you test using only extended modversions?
> >
> >   Luis
> 
> I'm not sure precisely what you're asking for. Do you want:
> 1. A kconfig that suppresses the emission of today's MODVERSIONS
> format? 

Yes that's right, a brave new world, and with the warning of that.

> This would be fairly easy to do, but I was leaving it enabled
> for compatibility's sake, at least until extended modversions become
> more common. This way existing `kmod` tools and kernels would continue
> to be able to load new-style modules.

Sure, understood why we'd have both.

> 2. libkmod support for parsing the new format? I can do that fairly
> easily too, but wanted the format actually decided on and accepted
> before I started modifying things that read modversions.

This is implied, what I'd like is for an A vs B comparison to be able to
be done on even without rust modules, so that we can see if really
libkmod changes are all that's needed. Does boot fail without a new
libkmod for this? If so the Kconfig should specificy that for this new
brave new world.

If a distribution can leverage just one format, why would they not
consider it if they can ensure the proper tooling is in place. We
haven't itemized the differences in practice and this could help
with this. One clear difference so far is the kabi stuff, but that's
just evaluating one way of doing things so far, I suspect we'll get
more review on that from Petr soon.

  Luis

