Return-Path: <linuxppc-dev+bounces-3689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A949E0EB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 23:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Hzn0cJVz2xgX;
	Tue,  3 Dec 2024 09:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733177461;
	cv=none; b=KIqciKt7ssdKyBlS67XMIbiCRgBvlQt+E5XSUj3FcelupQTzNjrch/tIJHr69d+tLadpOmKiI5vF3jJY9FJFL70x+vN1mp32TFIoyHqjwFi41r0i7+qxhfLQvANN0KK77BCc6FJ7MrEoP5kQ7uHj8zL+axyJE6yv03oQT2ca9v5+gSOV/Niu2NklOIkMIohakXQHk48uVfkUW+wKxkLvsdh6ZqDkHyDRalla9zW86i1oQ6VY9k1wwcwn2I8eoy/heHWfY1wDsyreowZGrtvGgbXDGt3oVL3In1g/BnBlOeUIBUohTntVtUJck0tI8pwKiIKB1BH8T3MrcB55uZX1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733177461; c=relaxed/relaxed;
	bh=Udtve7RvJAZk6YFm4+f46br4/lKQPF/waIiA2EK5Z6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4wzlaVNmQdPO6Hvgs30fIinpr3jHRTXPwBigdqCSorCsX78aBAvqQGMWZrQiCsQ1PZD/W4p0B8cU1D+2Tt37Gg2YLgypqBLhMZK8jC58aDT7CJNad5N23/HoI+R0LgICXLlwJGjBTaswuqJy/QxFyuO85U7Z4cC3g9GVsPz4CWuPa7wptZIrGEyBySrlJG8fqTTDnYhtxoqKPldoTUPBvFOruFh7ShNnagzRTidWvhAtpLL4Oy+Rjh3uft/i2QfkLLOX3wnUY25Wb2wiemJRpFfzm+Z32mnu3Z/VWuQTDJzG3vl6td0o+aarmx7FPkdKgtMhbfiBbHakMGP1m97Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Hzk1FFLz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 09:10:57 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4B2M4aRF010385;
	Mon, 2 Dec 2024 16:04:36 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4B2M4YP4010381;
	Mon, 2 Dec 2024 16:04:34 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 2 Dec 2024 16:04:34 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rob Herring <robh@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Saravana Kannan <saravanak@google.com>, linuxppc-dev@lists.ozlabs.org,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
Message-ID: <20241202220434.GU29862@gate.crashing.org>
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au> <87plmi7jjz.fsf@mpe.ellerman.id.au> <20241127214232.GQ29862@gate.crashing.org> <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:18:22AM -0600, Rob Herring wrote:
> On Wed, Nov 27, 2024 at 3:47 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > On Tue, Nov 26, 2024 at 02:36:32PM +1100, Michael Ellerman wrote:
> > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > > "Rob Herring (Arm)" <robh@kernel.org> writes:
> > > >> While OpenFirmware originally allowed walking parent nodes and default
> > > >> root values for #address-cells and #size-cells, FDT has long required
> > > >> explicit values. It's been a warning in dtc for the root node since the
> > > >> beginning (2005) and for any parent node since 2007. Of course, not all
> > > >> FDT uses dtc, but that should be the majority by far. The various
> > > >> extracted OF devicetrees I have dating back to the 1990s (various
> > > >> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
> > > >
> > > > I have various old device trees that have been given to me over the
> > > > years, and as far as I can tell they all have these properties (some of
> > > > them are partial trees so it's hard to be 100% sure).
> > > >
> > > > So LGTM.
> > >
> > > Turns out I was wrong.
> > >
> > > The warning about #size-cells hits on some powermacs, possible fixup
> > > patch here:
> > >
> > >   https://lore.kernel.org/linuxppc-dev/20241126025710.591683-1-mpe@ellerman.id.au/
> >
> > The Open Firmware specification is extremely clear that a "missing"
> > "#size-cells" property means this bus has the default value of 1.
> 
> And the default for #address-cells is 2, but yet every architecture
> except Sparc has that wrong.

?

Almost all architectures (that run Linux) use 64-bit addressing, both
32-bit and 64-bit architectures.

> If I have a node without #size-cells, is the default of 1 used or do
> we check parent nodes? My read of the spec would be the former, but
> the kernel does the latter.

The former is correct.  The latter makes no sense at all!  The whole
point of the "bus" abstraction is that you get a new addressing domain
there.

Yes, these days you numerically find it most often with PCI sub-domains,
but those are boring.  In most cases you *do* have different adressing
on your child busses, and even if the addressing is the same, addresses
on the child bus are not normally a subset of those on the parent bus.

> > https://www.openfirmware.info/data/docs/of1275.pdf (page 186).
> >
> > DTC or FDT might want to do things differently, but expecting decades
> > older stuff to conform to its ill-conceived unnecessarily super wordy
> > stuff is, well, not a plan that is likely to work very well :-)
> 
> That is not the intention. The intention is to identify what doesn't
> conform and exclude those systems from this check (or apply a fixup if
> that works).

So *always* use the OF definition, at least on OF systems?  Where
everything is meant to conform, but conform to OF, not conform to this
"OF-like-but-very-different-in-crucial-spots" thing :-)


Segher

