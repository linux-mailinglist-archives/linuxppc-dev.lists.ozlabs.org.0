Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1B8AB015
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:04:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WJrriT5J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLbwp6l4Jz3dK7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 00:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WJrriT5J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLbw33N1Rz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 00:03:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DCB0619D7;
	Fri, 19 Apr 2024 14:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72650C072AA;
	Fri, 19 Apr 2024 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713535409;
	bh=DU2Oh8nrRgXZi/yPndOQwhsltv4XMpBfwRnb1FWmP0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJrriT5J2X7hf4oYYUmstmlkPeq3DgvatCicCKVfFY05MHAXsGjIvsIH6c2UeFUCK
	 b1tQA9eFfPT9My24Bx5MwU3csOfL2xbVgwabrXecyWtYmZRKLwmjFTjcB9j5GYWGoy
	 bTMMwme5TOdiXtbdlz/weS3ViPl7AR23/VsdRSztQE4oWHicuv1Q1F6jzoDfRx6oFs
	 e91S/8iEAE+36zTfeMrMhg/6jsGIwDPTUf6JEt6bvmNpYbnQaXgYkrjgO5C+kCE1Jv
	 URoPOjT0e9X5jEpWoycpzzCiinEHMpKHGeCeKhjSjfGUKHI96+oFtwuokS//ELD+RL
	 Qpa7Bkn0p5REw==
Date: Fri, 19 Apr 2024 15:03:22 +0100
From: Will Deacon <will@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default
 for SPECULATION_MITIGATIONS=n
Message-ID: <20240419140321.GF3148@willie-the-truck>
References: <20240409175108.1512861-1-seanjc@google.com>
 <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au>
 <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse>
 <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
 <Zh06O35yKIF2vNdE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh06O35yKIF2vNdE@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024 at 07:31:23AM -0700, Sean Christopherson wrote:
> On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> > On Sat, Apr 13, 2024 at 11:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > > ...
> > > >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@google.com> wrote:
> > > ...
> > > >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> > > >>> index 8f6affd051f7..07ad53b7f119 100644
> > > >>> --- a/kernel/cpu.c
> > > >>> +++ b/kernel/cpu.c
> > > >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> > > >>>  };
> > > >>>
> > > >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =
> > > >>> -   CPU_MITIGATIONS_AUTO;
> > > >>> +   IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
> > > >>> +                                                CPU_MITIGATIONS_OFF;
> > > >>>
> > > >>>  static int __init mitigations_parse_cmdline(char *arg)
> > > >>>  {
> > >
> > > I think a minimal workaround/fix would be:
> > >
> > > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > > index 2b8fd6bb7da0..290be2f9e909 100644
> > > --- a/drivers/base/Kconfig
> > > +++ b/drivers/base/Kconfig
> > > @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
> > >  config GENERIC_CPU_VULNERABILITIES
> > >         bool
> > >
> > > +config SPECULATION_MITIGATIONS
> > > +       def_bool y
> > > +       depends on !X86
> > > +
> > >  config SOC_BUS
> > >         bool
> > >         select GLOB
> > 
> > Thanks, that works for me (on arm64), so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't think
> of better solution than an on-by-default generic Kconfig, though can't that it
> more simply be:
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 2b8fd6bb7da0..5930cb56ee29 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
>  config GENERIC_CPU_VULNERABILITIES
>         bool
>  
> +config SPECULATION_MITIGATIONS
> +       def_bool !X86
> +
>  config SOC_BUS
>         bool
>         select GLOB

I can't see this in -next yet. Do you plan to post it as a proper patch
to collect acks etc?

Cheers,

Will
