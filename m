Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1DD1EB381
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:49:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bc2r0WKfzDqRq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:49:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bc0g12dzzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:48:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=mzteblk+; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49bc0f6B0cz9sSg; Tue,  2 Jun 2020 12:48:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 49bc0f4jd7z9sSc;
 Tue,  2 Jun 2020 12:48:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1591066082;
 bh=jpXxYr7PjBJu0XU8leahvXugfEReYy16pVBaEXyE3RM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=mzteblk+wE9eHo4JtHWdYnBTk34vduPI6EeBzPyi8/ZHEs387nuM0H8uXjFkQdjSF
 O+kS1ggrPRtvzD4mRAk35/O35OYvYFvUbS2gqdmniVmxplpvHl2kttwEC78FhSbq5h
 Jlop4QSg5xc2B/WZMRml2QiKbz2SXPKqvmO9+rlqHIvx8Lb/oA7DBN/ZuksxSLgUhZ
 k0TsmwGmHtDbPev97GE3SBQ8oJCYFUOAm60zA1pi6ccMkMBFLGoT5nb5iFIq3Zsi+w
 4lKSuKswIX+r7MicXMlVkCcz1xcug/LMnaaMx9iEIRuBMtd70XQSfTzL63Cp5Ue4yt
 /mrXkXC7+0fXw==
Received: by neuling.org (Postfix, from userid 1000)
 id 8232B2C0762; Tue,  2 Jun 2020 12:48:02 +1000 (AEST)
Message-ID: <97d490bc59e457f3bd6370e597c19bcd43947604.camel@neuling.org>
Subject: Re: [RFC PATCH 1/4] powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()
From: Michael Neuling <mikey@neuling.org>
To: Alistair Popple <alistair@popple.id.au>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Tue, 02 Jun 2020 12:48:02 +1000
In-Reply-To: <1626791.NDfB26j6xz@townsend>
References: <20200527145843.2761782-1-mpe@ellerman.id.au>
 <1626791.NDfB26j6xz@townsend>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@ozlabs.org, npiggin@gmail.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-05-29 at 11:24 +1000, Alistair Popple wrote:
> For what it's worth I tested this series on Mambo PowerNV and it seems to=
=20
> correctly enable/disable the prefix FSCR bit based on the cpu feature so =
feel=20
> free to add:
>=20
> Tested-by: Alistair Popple <alistair@popple.id.au>
>=20
> Mikey is going to test out pseries.

FWIW this worked for me in the P10 + powervm sim testing.

Tested-by: Michael Neuling <mikey@neuling.org>

>=20
> - Alistair
>=20
> On Thursday, 28 May 2020 12:58:40 AM AEST Michael Ellerman wrote:
> > __init_FSCR() was added originally in commit 2468dcf641e4 ("powerpc:
> > Add support for context switching the TAR register") (Feb 2013), and
> > only set FSCR_TAR.
> >=20
> > At that point FSCR (Facility Status and Control Register) was not
> > context switched, so the setting was permanent after boot.
> >=20
> > Later we added initialisation of FSCR_DSCR to __init_FSCR(), in commit
> > 54c9b2253d34 ("powerpc: Set DSCR bit in FSCR setup") (Mar 2013), again
> > that was permanent after boot.
> >=20
> > Then commit 2517617e0de6 ("powerpc: Fix context switch DSCR on
> > POWER8") (Aug 2013) added a limited context switch of FSCR, just the
> > FSCR_DSCR bit was context switched based on thread.dscr_inherit. That
> > commit said "This clears the H/FSCR DSCR bit initially", but it
> > didn't, it left the initialisation of FSCR_DSCR in __init_FSCR().
> > However the initial context switch from init_task to pid 1 would clear
> > FSCR_DSCR because thread.dscr_inherit was 0.
> >=20
> > That commit also introduced the requirement that FSCR_DSCR be clear
> > for user processes, so that we can take the facility unavailable
> > interrupt in order to manage dscr_inherit.
> >=20
> > Then in commit 152d523e6307 ("powerpc: Create context switch helpers
> > save_sprs() and restore_sprs()") (Dec 2015) FSCR was added to
> > thread_struct. However it still wasn't fully context switched, we just
> > took the existing value and set FSCR_DSCR if the new thread had
> > dscr_inherit set. FSCR was still initialised at boot to FSCR_DSCR |
> > FSCR_TAR, but that value was not propagated into the thread_struct, so
> > the initial context switch set FSCR_DSCR back to 0.
> >=20
> > Finally commit b57bd2de8c6c ("powerpc: Improve FSCR init and context
> > switching") (Jun 2016) added a full context switch of the FSCR, and
> > added an initialisation of init_task.thread.fscr to FSCR_TAR |
> > FSCR_EBB, but omitted FSCR_DSCR.
> >=20
> > The end result is that swapper runs with FSCR_DSCR set because of the
> > initialisation in __init_FSCR(), but no other processes do, they use
> > the value from init_task.thread.fscr.
> >=20
> > Having FSCR_DSCR set for swapper allows it to access SPR 3 from
> > userspace, but swapper never runs userspace, so it has no useful
> > effect. It's also confusing to have the value initialised in two
> > places to two different values.
> >=20
> > So remove FSCR_DSCR from __init_FSCR(), this at least gets us to the
> > point where there's a single value of FSCR, even if it's still set in
> > two places.
> >=20
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/kernel/cpu_setup_power.S | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/kernel/cpu_setup_power.S
> > b/arch/powerpc/kernel/cpu_setup_power.S index a460298c7ddb..f91ecb10d0a=
e
> > 100644
> > --- a/arch/powerpc/kernel/cpu_setup_power.S
> > +++ b/arch/powerpc/kernel/cpu_setup_power.S
> > @@ -184,7 +184,7 @@ _GLOBAL(__restore_cpu_power9)
> >=20
> >  __init_FSCR:
> >  	mfspr	r3,SPRN_FSCR
> > -	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
> > +	ori	r3,r3,FSCR_TAR|FSCR_EBB
> >  	mtspr	SPRN_FSCR,r3
> >  	blr
>=20
>=20
