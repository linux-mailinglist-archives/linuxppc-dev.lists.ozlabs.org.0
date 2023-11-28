Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B617FB39A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 09:06:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ao6BfKKi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfZlz3Rdcz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 19:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ao6BfKKi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfZl80HXSz3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 19:05:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57D61615C6;
	Tue, 28 Nov 2023 08:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B45C433C8;
	Tue, 28 Nov 2023 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701158729;
	bh=0Sd6/InjMmJxbg/WRoT45JmnNSyw/cM2gU/plxlLlnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ao6BfKKi7YES83Ny8zylvOjAjoiJj5W4xlyz/eWe85KivPIuytnW57Q55hTSC4b8c
	 kzfTY4UBr8bJ4G80m8V3tdRTArJn2ZhrX4DIALTciWeCmSquOmsBFZumbXBBP1wiOp
	 3uB72uKQE3l3VGMy29RzF5cAIOr4J9JWf3ca6Oy0=
Date: Tue, 28 Nov 2023 08:05:26 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
Message-ID: <2023112824-dispatch-wooing-39de@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
 <2023112314-tubby-eligibly-007a@gregkh>
 <CAK7LNAT-OcaCi6tqPRgZxPXOV6u+YbaO_0RxtfmrVXPzdrio0Q@mail.gmail.com>
 <2023112312-certified-substance-007c@gregkh>
 <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 27, 2023 at 11:27:07AM -0800, Matthew Maurer wrote:
> > > >
> > > > > With regards to future directions that likely won't work for loosening it:
> > > > > Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> > > > > teach genksyms to open it up and split out the pieces for specific functions.
> > > > > Extending genksyms to parse Rust would also not solve the situation -
> > > > > layouts are allowed to differ across compiler versions or even (in rare
> > > > > cases) seemingly unrelated code changes.
> > > >
> > > > What do you mean by "layout" here?  Yes, the crcs can be different
> > > > across compiler versions and seemingly unrelated code changes (genksyms
> > > > is VERY fragile) but that's ok, that's not what you are checking here.
> > > > You want to know if the rust function signature changes or not from the
> > > > last time you built the code, with the same compiler and options, that's
> > > > all you are verifying.
> What I mean by layout here is that if you write in Rust:
> struct Foo {
>   x: i32,
>   y: i32,
> }
> it is not guaranteed to have the same layout across different compilations, even
> within the same compiler. See
> https://doc.rust-lang.org/reference/type-layout.html#the-rust-representation

Then you are going to have big problems, sorry.

> Specifically, the compiler is allowed to arbitrarily insert padding,
> reorder fields, etc.
> on the same code as long as the overall alignment of the struct and individual
> alignment of the fields remains correct and non-overlapping.
> 
> This means the compiler is *explicitly* allowed to, for example, permute x and y
> as an optimization. In the above example this is unlikely, but if you
> instead consider
> struct Bar {
>   x: i8,
>   y: i64,
>   z: i8,
> }
> It's easy to see why the compiler might decide to structure this as
> y,x,z to reduce the
> size of the struct. Those optimization decisions may be affected by
> any other part of
> the code, PGO, etc.

Then you all need to figure out some way to determine how the compiler
layed out the structure after it compiled/optimized it and be able to
compare it to previous builds (or just generate a crc based on the
layout it chose.)

> > > > > Future directions that might work for loosening it:
> > > > > * Generating crcs from debuginfo + compiler + flags
> > > > > * Adding a feature to the rust compiler to dump this information. This
> > > > > is likely to
> > > > >   get pushback because Rust's current stance is that there is no ability to load
> > > > >   object code built against a different library.
> > > >
> > > > Why not parse the function signature like we do for C?
> Because the function signature is insufficient to check the ABI, see above.
> > > >
> > > > > Would setting up Rust symbols so that they have a crc built out of .rmeta be
> > > > > sufficient for you to consider this useful? If not, can you help me understand
> > > > > what level of precision would be required?
> > > >
> > > > What exactly does .rmeta have to do with the function signature?  That's
> > > > all you care about here.
> The .rmeta file contains the decisions the compiler made about layout
> in the crate
> you're interfacing with. For example, the choice to encode Bar
> with a yxz field order would be written into the .rmeta file.

Ok, then yes, can you parse the .rmeta file to get that information?

> > > rmeta is generated per crate.
> > >
> > > CRC is computed per symbol.
> > >
> > > They have different granularity.
> > > It is weird to refuse a module for incompatibility
> > > of a symbol that it is not using at all.
> >
> > I agree, this should be on a per-symbol basis, so the Rust
> > infrastructure in the kernel needs to be fixed up to support this
> > properly, not just ignored like this patchset does.
> I agree there is a divergence here, I tried to point it out so that it
> wouldn't be
> a surprise later. The .rmeta file itself (which is the only way we
> could know that
> the ABI actually matches, because layout decisions are in there) is an unstable
> format, which is why I would be reluctant to try to parse it and find only the
> relevant portions to hash. This isn't just a "technically unstable"
> format, but one
> in which the compiler essentially just serializes out relevant internal data
> structures, so any parser for it will involve significant alterations
> on compiler
> updates, which doesn't seem like a good plan.
> >
> > thanks,
> >
> > greg k-h
> Given the above additional information, would you be interested in a patchset
> which either:
> 
> A. Computes the CRC off the Rust type signature, knowing the compiler is
> allowed to change the ABI based on information not contained in the CRC.

No.

> B. Uses the CRC of the .rmeta file, knowing, as was pointed out, that this
> effectively contains the ABI of every symbol in the compilation unit, as well
> as inline functions and polymorphic functions.

No.

> If neither of these works, we likely can't turn on MODVERSIONS+RUST until
> further work is done upstream in the compiler to export some of this data in
> an at least semi-stable fashion.

Looks like you need something a bit more fine-grained, as pointed out
above.  why not parse the structure/function information in the .rmeta
file?  Is the format of that file not stable?

thanks,

greg k-h
