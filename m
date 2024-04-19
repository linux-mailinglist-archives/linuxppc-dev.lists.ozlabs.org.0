Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3DB8AB0DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:39:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SuC/adN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLcjg6L4sz3dHt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 00:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SuC/adN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLchw6f1Kz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 00:38:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48725CE1ACB;
	Fri, 19 Apr 2024 14:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAF7C072AA;
	Fri, 19 Apr 2024 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713537533;
	bh=HaHW8LOM7CzKYKcJLEDAbtk0kNe6pNRRkCefhatJTL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuC/adN8zf/JDG9shHoubRIOiGr8+e3T+cmz3cSQBxc1sRisROcD1PalPMEM1+H3W
	 Vd6BevhpgR7mhl7DO2NMfRRSe6BXR/wVujj42nN/4G+fL+JONDvCzJMP3wP579Fpsw
	 cgyJUtLLAQDxAvH3Ly3pt4v2Y2PgZvmwLa2RzXTuTudFsnoa2zaRHtz2XXKih66UlP
	 AzYaOEH6gkaaF7QE2I6XX8jPYiaeKRMWv0vdVDNTa9H4OgS/1y5ZwOXm7ndFEtt+2V
	 KCwi7ssV9O6ndE5yCOD0aFxRcFd2qz0vTgt5OnIE1YtwbPrH2KAMfKevsHFhvkTpH3
	 dHBYKIhHWK5ZA==
Date: Fri, 19 Apr 2024 15:38:46 +0100
From: Will Deacon <will@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default
 for SPECULATION_MITIGATIONS=n
Message-ID: <20240419143846.GA3508@willie-the-truck>
References: <20240409175108.1512861-1-seanjc@google.com>
 <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au>
 <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse>
 <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
 <Zh06O35yKIF2vNdE@google.com>
 <20240419140321.GF3148@willie-the-truck>
 <ZiJ6SDcbTBQjrG3r@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiJ6SDcbTBQjrG3r@google.com>
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

On Fri, Apr 19, 2024 at 07:06:00AM -0700, Sean Christopherson wrote:
> On Fri, Apr 19, 2024, Will Deacon wrote:
> > On Mon, Apr 15, 2024 at 07:31:23AM -0700, Sean Christopherson wrote:
> > > On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> > > Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't think
> > > of better solution than an on-by-default generic Kconfig, though can't that it
> > > more simply be:
> > > 
> > > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > > index 2b8fd6bb7da0..5930cb56ee29 100644
> > > --- a/drivers/base/Kconfig
> > > +++ b/drivers/base/Kconfig
> > > @@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
> > >  config GENERIC_CPU_VULNERABILITIES
> > >         bool
> > >  
> > > +config SPECULATION_MITIGATIONS
> > > +       def_bool !X86
> > > +
> > >  config SOC_BUS
> > >         bool
> > >         select GLOB
> > 
> > I can't see this in -next yet. Do you plan to post it as a proper patch
> > to collect acks etc?
> 
> Sorry, I neglected to Cc everyone.
> 
> https://lore.kernel.org/all/20240417001507.2264512-2-seanjc@google.com

Ah, thanks. I'll go Ack that...

Will
