Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940D7F5AC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 10:06:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gZxE875+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbXL01j5Gz3dTJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:06:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gZxE875+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbXK546JKz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 20:06:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7FFD0B829FE;
	Thu, 23 Nov 2023 09:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C291C433C8;
	Thu, 23 Nov 2023 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700730355;
	bh=Lcd150vAerjkaRvtY0bS83Rte9WRMhTnKhCGePr/mKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZxE875+pb5Kx5SdnUy+1qJggwnPSULnHJZNmnyyWU1tZnEKd6+k+CLcxMCdL2SZI
	 dNU/1oTl+LESlR5MxF2sNxJ8zA+4gVVwUx3CVe6jBu7kI5fW4yMj35sj4acE7tqxMN
	 KaG2fJSM6oZZxOlC9JU9HsL7YAfrbLxHWJYBYuJ4=
Date: Thu, 23 Nov 2023 09:05:52 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
Message-ID: <2023112314-tubby-eligibly-007a@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 01:04:09PM -0800, Matthew Maurer wrote:
> > So, even if you enable CONFIG_MODVERSIONS,
> > nothing is checked for Rust.
> > Genksyms computes a CRC from "int foo", and
> > the module subsystem confirms it is a "int"
> > variable.
> >
> > We know this check always succeeds.
> >
> > Why is this useful?
> The reason this is immediately useful is that it allows us to have Rust
> in use with a kernel where C modules are able to benefit from MODVERSIONS
> checking. The check would effectively be a no-op for now, as you have correctly
> determined, but we could refine it to make it more restrictive later.
> Since the
> existing C approach errs on the side of "it could work" rather than "it will
> work", I thought being more permissive was the correct initial solution.

But it's just providing "fake" information to the CRC checker, which
means that the guarantee of a ABI check is not true at all.

So the ask for the user of "ensure that the ABI checking is correct" is
being circumvented here, and any change in the rust side can not be
detected at all.

The kernel is a "whole", either an option works for it, or it doesn't,
and you are splitting that guarantee here by saying "modversions will
only work for a portion of the kernel, not the whole thing" which is
going to cause problems for when people expect it to actually work
properly.

So, I'd strongly recommend fixing this for the rust code if you wish to
allow modversions to be enabled at all.

> With regards to future directions that likely won't work for loosening it:
> Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> teach genksyms to open it up and split out the pieces for specific functions.
> Extending genksyms to parse Rust would also not solve the situation -
> layouts are allowed to differ across compiler versions or even (in rare
> cases) seemingly unrelated code changes.

What do you mean by "layout" here?  Yes, the crcs can be different
across compiler versions and seemingly unrelated code changes (genksyms
is VERY fragile) but that's ok, that's not what you are checking here.
You want to know if the rust function signature changes or not from the
last time you built the code, with the same compiler and options, that's
all you are verifying.

> Future directions that might work for loosening it:
> * Generating crcs from debuginfo + compiler + flags
> * Adding a feature to the rust compiler to dump this information. This
> is likely to
>   get pushback because Rust's current stance is that there is no ability to load
>   object code built against a different library.

Why not parse the function signature like we do for C?

> Would setting up Rust symbols so that they have a crc built out of .rmeta be
> sufficient for you to consider this useful? If not, can you help me understand
> what level of precision would be required?

What exactly does .rmeta have to do with the function signature?  That's
all you care about here.

thanks,

greg k-h
