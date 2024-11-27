Return-Path: <linuxppc-dev+bounces-3590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D439DAE61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 21:13:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xz9cd1Vdvz2xs0;
	Thu, 28 Nov 2024 07:13:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732738417;
	cv=none; b=gLkQgH847Q6qm42A35pgsfIOptHtpRGH1o784khraj3dxjzBztd9Lp/64FYnbQNCZ4JMiJUj19mRsq4LJp8Mxe/A0Ldz3mie9AwbcdjzccH6Bp8Ww212NYUW4xc8oh/F72zhPmlF4qC1W1+fXnZ/KuYiKrY8EvZ4AkcR+RL8eF7WjLGamU0rYSRH2Opub8pS2/N//52ZeleH07DAekW1T/9xBaP5alIqv9++dlAUxe9klh4wgKxOlS41wDZWzVQYWApDp7neyO7xMuP+/EBJtBwOpR8fNcPv2D2wkSe6iztzjh+K6ABJMP2RXFcD7eVXKJUvGIQTvvwZVc/SnnvVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732738417; c=relaxed/relaxed;
	bh=hGv3W/Ma2LfNkuoul/S2iSqH4wsA6106GvHp7/j8mmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtNHV0QVqa5DVvNmzi0E+tuGm3z0zRFSYYRXUPNTmHKel9On3rX5NEI/DRNm3DIB51FSjKEoJwtBKcwfQWh/8dcPsiAsNgBjatGcPw9hHJbUV3FYFkY24M2PmPQMh8kfXykA/bSPTJqQsg82vZsOWFUry7FPL/1WFlzp5tbAYYjufmRzg+tNE8s3pSbL3poeXQyehEOoIjNmLAbHZ5Z4Pw9uJWsp1uKbV9t9w6ZLCvMKtziooZvBWLVYjhNiImVacsfTDCjVYqfEq4it5vH05ujVqJ1RPGavgABKHd5Qu0lFfWkH36WZmNiUqi9f3/EJubS1+WT2F/Cs0A+51wFHTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xz9cZ47SXz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 07:13:34 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4ARKAHQb021080;
	Wed, 27 Nov 2024 14:10:17 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4ARKAGvl021078;
	Wed, 27 Nov 2024 14:10:16 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 27 Nov 2024 14:10:15 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Message-ID: <20241127201015.GO29862@gate.crashing.org>
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114210418.GM29862@gate.crashing.org> <87mshm7ixu.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mshm7ixu.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 26, 2024 at 02:49:49PM +1100, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Fri, Nov 15, 2024 at 12:11:04AM +1100, Michael Ellerman wrote:
> >> CHRP (Common Hardware Reference Platform) was a standard developed by
> >> IBM & Apple for PowerPC-based systems.
> >> 
> >> The standard was used in the development of some machines but never
> >> gained wide spread adoption.
> >> 
> >> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
> >> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
> >> some from Motorola? No Apple machines should be affected.
> >> 
> >> All of those mentioned above are over or nearing 20 years old, and seem
> >> to have no active users.
> >
> > This was used by all non-IBM 970 systems as well.  The last was SLOF on
> > JS20 and JS21, about 20 years ago yes, and I doubt anyone uses it still
> > (I don't).
> 
> By "this" you mean the CHRP standard?

I mean the "maple" stuff, and the whole "chrp" thing in PowerPC Linux.

> At least in Linux the "CHRP" platform has always been 32-bit only AFAIK.

No?  I've written stuff for it for years :-)

> My memory is that JS20/JS21 used the "maple" platform, which was a
> 64-bit only bare-metal platform, possibly it was actually == CHRP, but
> we didn't call it that in Linux.

Well, it is what it is called in the Open Firmware device trees!

It has a root "device_type" property that starts with the string "chrp".
But that really is only because Yaboot for some reason needs it to
behave reasonably, heh.  (I didn't remember the details, but I still
have the original SLOF open source release tarballs :-) )  So yeah it
wasn't anything "chrp" in Linux itself, aha.

> But maybe I'm wrong, you were more involved than me back than, and it
> was a long time ago :)

Very long ago.  Sad to see it go, but the Git tree will never forget :-)


Segher

