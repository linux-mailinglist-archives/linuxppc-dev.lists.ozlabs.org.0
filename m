Return-Path: <linuxppc-dev+bounces-2894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE699BDC2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 03:16:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjpj92stqz2yF7;
	Wed,  6 Nov 2024 13:16:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730859373;
	cv=none; b=chNgxP3kIFCBVuimkyi+3TYvEUJEdGyArhO39OzMQ0rt5oqYV1p4xDfAutaetoWLrNqDi5zVwMx//a4QdKerOV68zE42jpLTSh7gyyycn1lo4vXz9gVvOxsCgdaAJM6ELmNK2RI6v/WdeEvGQllIzaK6iyex/Ppily4Y4ceoZHNtO06ynVd1oIZsBHM5UN+m182yCfrAx7ctpqqHV2Nu4hvSGzzcZDQAC0FG9qK3lbAQgRlPpFN1itbZGVd4x2gDBqvwmVFGkzZZJ8EkKYNrHMfZVwo4aJVex8kVT9GgK2ZuH7tOuJj4nbHlE9rbF9N1FwToz6LI9H7fsDzNVroR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730859373; c=relaxed/relaxed;
	bh=xK0KY8i8zC+5m7XjN1KGWENonmZR14U5NHbmNmLDZU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjemSarxNux2+O0YaGIoIbJhB5K5CH1HPhC2gg98/VDlYtvidfbA+4tccWl+MWFCiBTwNRFBlHmuXm/hiCXw8jt0cakFpNPkwBtPSswx7W30sPUaI/0K3jMvNqt+q9PQEOPhoolwnArcjjMXDiuCKYMd+vffsPi3HwFSWeQ1vhl3Ea0l+Oqc5hLqugoHyPHdk1dKmU2ARFwvYHwJf+U5//nqE948gn4Nc/twKGPMoj6BjrfsZJW2EBHm9pUdkSVy8CeFtWfA5RgsbzlgGVOeRyfhBLPr6k/c2ClxuL/ZhHHl63pSwotBBTiho8Cpz71vUuozGTmD7ITuEKIEM7p3Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MIhBZjsk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MIhBZjsk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjpj70ZBBz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 13:16:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 226A2A41AFF;
	Wed,  6 Nov 2024 02:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CBAC4CED1;
	Wed,  6 Nov 2024 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859363;
	bh=2ceZS9atdvYQglPAeHWkMwFTe23RRaA6HdpaUHEf2oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIhBZjsktrtesO5k1TPXMbC8XTanJSHPKWNM0vGLuOl1bFPdHdk7n8gm3zZowb5Ms
	 j32tLEsR3+YyNkxm9OWTUhs7yOStVihPojeRZG93G5LdAjLCsQVHrDmvnr1qTrY/lG
	 kc2RqvxU50wYh5cftvuGAdvuETv7RcoLj1Yu6lhwk63mW3Gqm9g/K7awIsb6HzCJ+T
	 dt8VZUHl0IFsTdAlEyuWyTf4FtZKW7jvUZsdMPvJqLQxG/S90yQP4FkYKIwQJ04qUd
	 Rh3b8+Ahy00Sir0NK1AIlbFhCBlWKtC9bHag0/Jg8Qbmx1K4OKxKSfj0c0tSPNC9K1
	 7OPXYta84teZQ==
Date: Tue, 5 Nov 2024 18:16:01 -0800
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
Message-ID: <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 05, 2024 at 04:26:51PM -0800, Matthew Maurer wrote:
> On Fri, Nov 1, 2024 at 2:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 01:00:28PM -0700, Matthew Maurer wrote:
> > > > The question is, if only extended moversions are used, what new tooling
> > > > requirements are there? Can you test using only extended modversions?
> > > >
> > > >   Luis
> > >
> > > I'm not sure precisely what you're asking for. Do you want:
> > > 1. A kconfig that suppresses the emission of today's MODVERSIONS
> > > format?
> >
> > Yes that's right, a brave new world, and with the warning of that.
> 
> OK, I can send another revision with a suppression config, perhaps
> CONFIG_NO_BASIC_MODVERSIONS

Great.

> > > This would be fairly easy to do, but I was leaving it enabled
> > > for compatibility's sake, at least until extended modversions become
> > > more common. This way existing `kmod` tools and kernels would continue
> > > to be able to load new-style modules.
> >
> > Sure, understood why we'd have both.
> >
> > > 2. libkmod support for parsing the new format? I can do that fairly
> > > easily too, but wanted the format actually decided on and accepted
> > > before I started modifying things that read modversions.
> >
> > This is implied, what I'd like is for an A vs B comparison to be able to
> > be done on even without rust modules, so that we can see if really
> > libkmod changes are all that's needed. Does boot fail without a new
> > libkmod for this? If so the Kconfig should specificy that for this new
> > brave new world.
> 
> libkmod changes are not needed for boot - the userspace tools do not
> examine this data for anything inline with boot at the moment, libkmod
> only looks at it for kmod_module_get_versions, and modprobe only looks
> at that with --show-modversions or --dump-modversions, which are not
> normally part of boot.
> 
> With the code as is, the only change will be that if a module with
> EXTENDED_MODVERSIONS set contains an over-length symbol (which
> wouldn't have been possible before), the overlong symbol's modversion
> data will not appear in --show-modversions. After patching `libkmod`
> in a follow-up patch, long symbols would appear as well. If booted
> against an old kernel, long symbols will not have their CRCs in the
> list to be checked. However, the old kernel could not export these
> symbols, so it will fail to resolve the symbol and fail the load
> regardless.

Thanks for checking all this. It is exactly what I was looking for.
All this should be part of the cover letter and Kconfig documentation.

> If we add and enable NO_BASIC_MODVERSIONS like you suggested above,
> today's --show-modversions will claim there is no modversions data.
> Applying a libkmod patch will result in modversions info being
> displayed by that command again. If booted against a new kernel,
> everything will be fine.

*This* is is the sort of information I was also looking for and I think
it would be good to make it clear for the upcoming NO_BASIC_MODVERSIONS.

> If booted against an old kernel, it will
> behave as though there is no modversions information.

Huh? This I don't get. If you have the new libkmod and boot
an old kernel, that should just not break becauase well, long
symbols were not ever supported properly anyway, so no regression.

I'm not quite sure I understood your last comment here though,
can you clarify what you meant?

Anyway, so now that this is all cleared up, the next question I have
is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
userspace requirements aren't large at all, what actual benefits does
using this new extended mod versions have? Why wouldn't a distro end
up preferring this for say a future release for all modules?

  Luis

