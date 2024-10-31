Return-Path: <linuxppc-dev+bounces-2743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2BD9B75B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 08:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfGNB1Sjbz2yNc;
	Thu, 31 Oct 2024 18:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730360954;
	cv=none; b=NDNNufQCS0PL4zMWEE5dvY7XorZ28SAHPl392EgdM4uUTtC+/3u14BWWzXZ/jWGAomxnzZqx9YIoXbV/GJIzc+sypXovwVy/WcKXGOBoDMi0qlMB2Uvh+VJ6GtuBhoVHuvYbhUpGHodG6Frn8tqfRtPltMPd80MLhbKw3ulWmdNaqgDaE9Z2X9gAk+PhdbUTE6epwe8syFfX0BRkn33njLF5bS1+cMS9UFbeS5OFiYWapCoJTUv77RVkXHujlkl6zoUTecfhvFUEl1LipCWeDObmq1DGYSoBAMuH+woGZ+KeL8nSvOfjC6UGZxQSFUj6/PQZt2AWtMSAkV/MOunKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730360954; c=relaxed/relaxed;
	bh=g8hs0ZoTJGZMFMfNCbBvSNJvzIpkRRMiGiuuzSShuqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTOYGunZAiZePrEtAIZ/meyuPob9PjiEnvLyp4x30iBXjk3n6Bul6cBwpWrRL/ltwr6967Sn6KuqbFFqjyXQdif0FAW9/h4l0rhKXTqBZUmsvSB8U1T1AqmqUIQwHWDN3Q9PVOnVrXPVai9kLrtEYITwyFVB8As+nTEnnFoANs19nwYfBO8Uc+W0yA8XyRy5kmqXAVeyMev4L0vQsmJK8rCkmKqUxl44FVkdr2PBSIAa4S89d05NOpAzj5OdPV+/EpOEmXe5KbymXeG1Hp/G22l0jHDPMucvZuK+Onoq2ubxcRq5ZVh9hqDazN1CFywFP7Eti70WmBJaXiI45hsXMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P9hUM9xG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P9hUM9xG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfGN86TNNz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 18:49:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A786A43A51;
	Thu, 31 Oct 2024 07:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A54C4CEC3;
	Thu, 31 Oct 2024 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360946;
	bh=EXHWSS4logdtrwKjIzfO9t3TjGTyP1RV6tB6ogIEHgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9hUM9xGJ0zGQcWn7D6lF6DXp3nsvhvg5D71xd8wf+NeK/96heOa7sPwBVgt1VqcO
	 1mWyYj2tTjsA9untrING3/jjazm1XncSIcPYushVUiwYGqcn1SYKmCi2/xBDo+/OJ1
	 DFRycFpSlEaaRQDfwJOKuMM4qsVDv3q8EBe2/nU+eUQwOrEzvEkijoUzsowb4QnaU5
	 OhIYJlvLKclpwOiBe3fORCxQjYxNVHufKvWwgWuZcde+0qIEEwiYUcYR84wK1WtAeN
	 Kp9jDhLZOmzYUKwHLYwy870NNJpWODbZrXd42m1jK6fzKc+34ahYwSoMU64m3Rbq4p
	 /vI3Gmz8ejWmQ==
Date: Thu, 31 Oct 2024 00:49:04 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
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
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
Message-ID: <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au>
 <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
 <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>
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
In-Reply-To: <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 10:06:12PM -0700, Matthew Maurer wrote:
> On Wed, Oct 30, 2024 at 9:37 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > > Matthew Maurer <mmaurer@google.com> writes:
> > > > Adds a new format for MODVERSIONS which stores each field in a separate
> > > > ELF section. This initially adds support for variable length names, but
> > > > could later be used to add additional fields to MODVERSIONS in a
> > > > backwards compatible way if needed. Any new fields will be ignored by
> > > > old user tooling, unlike the current format where user tooling cannot
> > > > tolerate adjustments to the format (for example making the name field
> > > > longer).
> > > >
> > > > Since PPC munges its version records to strip leading dots, we reproduce
> > > > the munging for the new format. Other architectures do not appear to
> > > > have architecture-specific usage of this information.
> > > >
> > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > ---
> > > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> > >
> > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > Michael, Matthew, why make everyone deal with this instead of just
> > making this an arch thing and ppc would be the only one doing it?
> >
> >   Luis
> >
> 
> I'm not sure I understand - the PPC changes are in an arch-specific
> directory, and triggered through the arch-implemented callback
> mod_frob_arch_sections. What would you like done to make it more of an
> arch-thing?

Sorry, yes, I see that now, that's what I get for late night patch
review. Nevermidn, this all looks good to me now.

  Luis

