Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A811C390
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 08:58:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4537nq0r41zDqGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4537kN5qm8zDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 16:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="IafsnthS"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4537kN04wdz9sML;
 Tue, 14 May 2019 16:55:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1557816956;
 bh=96FspyHs/pmt88qYRLwS/ntIlLbDl8wqYBpDXF8y18Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=IafsnthS4u2Uz60Qj53IEyfBhsVK4FBiIE30OHRg0q9pZiwxPJdbPe9wptAT7sCt0
 wBaH9uQtEr5a20Rwpnun96NsIu7/CU3Q9bSV0IhNwtJ8Yy7DS4oCYWJW6Y9dsvncpQ
 rxgdIR/Wb1XGymPqjm5tPCH4NnO1dtys69l/BwIyFePm8siiOm7P14i1SeQIzXQu3X
 +t4YCZr+Fg7rAhAmn7W1VKosCx5U6LjMM3Emn7mq99kKCb6McPg6x89nl7zMdOccUD
 SOLn1/koRP5Plhd9GppLUq+PySIZXPtYxIh8IewdvVMZ0CTXwUeOsXvr59rj1TLf/7
 Hbjqj9vuOqaYA==
Received: by neuling.org (Postfix, from userid 1000)
 id DC3102A39E2; Tue, 14 May 2019 16:55:55 +1000 (AEST)
Message-ID: <eae1df7b0d329f2be6da0322210026c711d38bdc.camel@neuling.org>
Subject: Re: [PATCH v2] powerpc: Fix compile issue with force DAWR
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Tue, 14 May 2019 16:55:55 +1000
In-Reply-To: <2561c888-1ab5-1cd7-2fe2-509d8d71cae4@c-s.fr>
References: <20190513071703.25243-1-mikey@neuling.org>
 <f1015de7-faf1-ae6d-d1f9-9c904f19c58b@c-s.fr>
 <4ae1ab46779c5724d129bbeb62859e288ff7dffa.camel@neuling.org>
 <2561c888-1ab5-1cd7-2fe2-509d8d71cae4@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> > > > --
> > > > v2:
> > > >     Fixes based on Christophe Leroy's comments:
> > > >     - Fix commit message formatting
> > > >     - Move more DAWR code into dawr.c
> > > > ---
> > > >    arch/powerpc/Kconfig                     |  5 ++
> > > >    arch/powerpc/include/asm/hw_breakpoint.h | 20 ++++---
> > > >    arch/powerpc/kernel/Makefile             |  1 +
> > > >    arch/powerpc/kernel/dawr.c               | 75
> > > > ++++++++++++++++++++++++
> > > >    arch/powerpc/kernel/hw_breakpoint.c      | 56 ------------------
> > > >    arch/powerpc/kvm/Kconfig                 |  1 +
> > > >    6 files changed, 94 insertions(+), 64 deletions(-)
> > > >    create mode 100644 arch/powerpc/kernel/dawr.c
> > > >=20
> > > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > > index 2711aac246..f4b19e48cc 100644
> > > > --- a/arch/powerpc/Kconfig
> > > > +++ b/arch/powerpc/Kconfig
> > > > @@ -242,6 +242,7 @@ config PPC
> > > >    	select SYSCTL_EXCEPTION_TRACE
> > > >    	select THREAD_INFO_IN_TASK
> > > >    	select VIRT_TO_BUS			if !PPC64
> > > > +	select PPC_DAWR_FORCE_ENABLE		if PPC64 || PERF
> > >=20
> > > What's PERF ? Did you mean PERF_EVENTS ?
> > >=20
> > > Then what you mean is:
> > > - Selected all the time for PPC64
> > > - Selected for PPC32 when PERF is also selected.
> > >=20
> > > Is that what you want ? At first I thought it was linked to P9.
> >=20
> > This is wrong.  I think we just want PPC64. PERF is a red herring.
>=20
> Are you sure ? Michael suggested PERF || KVM as far as I remember.

It was mpe but I think it was wrong.

We could make it more selective with something like:
   PPC64 && (HW_BREAK || PPC_ADV_DEBUG_REGS || PERF)
but I think that will end up back in the larger mess of
  https://github.com/linuxppc/issues/issues/128

I don't think the minor size gain is is worth delving in that mess, hence I=
 made
it simply PPC64 which is hopefully an improvement on what we have since it
eliminates 32bit.

> > > >    #else	/* CONFIG_HAVE_HW_BREAKPOINT */
> > > >    static inline void hw_breakpoint_disable(void) { }
> > > >    static inline void thread_change_pc(struct task_struct *tsk,
> > > >    					struct pt_regs *regs) { }
> > > > -static inline bool dawr_enabled(void) { return false; }
> > > > +
> > > >    #endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> > > > +
> > > > +extern bool dawr_force_enable;
> > > > +
> > > > +#ifdef CONFIG_PPC_DAWR_FORCE_ENABLE
> > > > +extern bool dawr_enabled(void);
> > >=20
> > > Functions should not be 'extern'. I'm sure checkpatch --strict will t=
ell
> > > you.
> >=20
> > That's not what's currently being done in this header file.  I'm keepin=
g
> > with
> > the style of that file.
>=20
> style is not defined on a per file basis. There is the style from the=20
> past and the nowadays style. If you keep old style just because the file=
=20
> includes old style statements, then the code will never improve.
>=20
> All new patches should come with clean 'checkpatch' report and follow=20
> new style. Having mixed styles in a file is not a problem, that's the=20
> way to improvement. See arch/powerpc/mm/mmu_decl.h as an exemple.

I'm not sure that's mpe's policy.

mpe?

> > > > +
> > > > +static ssize_t dawr_write_file_bool(struct file *file,
> > > > +				    const char __user *user_buf,
> > > > +				    size_t count, loff_t *ppos)
> > > > +{
> > > > +	struct arch_hw_breakpoint null_brk =3D {0, 0, 0};
> > > > +	size_t rc;
> > > > +
> > > > +	/* Send error to user if they hypervisor won't allow us to write
> > > > DAWR */
> > > > +	if ((!dawr_force_enable) &&
> > > > +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> > > > +	    (set_dawr(&null_brk) !=3D H_SUCCESS))
> > >=20
> > > The above is not real clear.
> > > set_dabr() returns 0, H_SUCCESS is not used there.
> >=20
> > It pseries_set_dawr() will return a hcall number.
>=20
> Right, then it maybe means set_dawr() should be fixes ?

Sorry, I don't understand this.

> > This code hasn't changed. I'm just moving it.
>=20
> Right, but could be an improvment for another patch.
> As far as I remember you are the one who wrote that code at first place,=
=20
> arent't you ?

Yep, classic crap Mikey code :-)

Mikey
