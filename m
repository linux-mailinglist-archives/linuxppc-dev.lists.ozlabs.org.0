Return-Path: <linuxppc-dev+bounces-104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA795301C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 15:39:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wl5nc21fbz2yZB;
	Thu, 15 Aug 2024 23:39:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wl5LD2fc5z2yZ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 23:18:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C896914BF;
	Thu, 15 Aug 2024 06:18:50 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52C343F6A8;
	Thu, 15 Aug 2024 06:18:21 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:18:15 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, bp@alien8.de, broonie@kernel.org,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, szabolcs.nagy@arm.com,
	tglx@linutronix.de, will@kernel.org, x86@kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <20240815131815.GA3657684@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <ZqJ2knGETfS4nfEA@e133380.arm.com>
 <20240801155441.GB841837@e124191.cambridge.arm.com>
 <Zqu2VYELikM5LFY/@e133380.arm.com>
 <20240806103532.GA1986436@e124191.cambridge.arm.com>
 <20240806143103.GB2017741@e124191.cambridge.arm.com>
 <ZrzHU9et8L_0Tv_B@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrzHU9et8L_0Tv_B@arm.com>

Hi Catalin,

On Wed, Aug 14, 2024 at 04:03:47PM +0100, Catalin Marinas wrote:
> Hi Joey,
> 
> On Tue, Aug 06, 2024 at 03:31:03PM +0100, Joey Gouly wrote:
> > diff --git arch/arm64/kernel/signal.c arch/arm64/kernel/signal.c
> > index 561986947530..ca7d4e0be275 100644
> > --- arch/arm64/kernel/signal.c
> > +++ arch/arm64/kernel/signal.c
> > @@ -1024,7 +1025,10 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
> >                         return err;
> >         }
> >  
> > -       if (system_supports_poe()) {
> > +       if (system_supports_poe() &&
> > +                       (add_all ||
> > +                        mm_pkey_allocation_map(current->mm) != 0x1 ||
> > +                        read_sysreg_s(SYS_POR_EL0) != POR_EL0_INIT)) {
> >                 err = sigframe_alloc(user, &user->poe_offset,
> >                                      sizeof(struct poe_context));
> >                 if (err)
> > 
> > 
> > That is, we only save the POR_EL0 value if any pkeys have been allocated (other
> > than pkey 0) *or* if POR_EL0 is a non-default value.
> 
> I had a chat with Dave as well on this and, in principle, we don't want
> to add stuff to the signal frame unnecessarily, especially for old
> binaries that have no clue of pkeys. OTOH, it looks like too complicated
> for just 16 bytes. Also POR_EL0 all RWX is a valid combination, I don't
> think we should exclude it.
> 
> If no pkey has been allocated, I guess we could skip this and it also
> matches the x86 description of the PKRU being guaranteed to be preserved
> only for the allocated keys. Do we reserve pkey 0 for arm64? I thought
> that's only an x86 thing to emulate execute-only mappings.

To make it less complicated, I could drop the POR_EL0 check and just do:

-       if (system_supports_poe()) {
+       if (system_supports_poe() &&
+                       (add_all ||
+                        mm_pkey_allocation_map(current->mm) != 0x1) {

This wouldn't preserve the value of POR_EL0 if no pkeys had been allocated, but
that is fine, as you said / the man pages say.

We don't preserve pkey 0, but it is the default for mappings and defaults to
RWX. So changing it probably will lead to unexpected things.

> 
> Another corner case would be the signal handler doing a pkey_alloc() and
> willing to populate POR_EL0 on sigreturn. It will have to find room in
> the signal handler, though I don't think that's a problem.

pkey_alloc() doesn't appear in the signal safety man page, but that might just
be an omission due to permission keys being newer, than actually saying
pkey_alloc() can't be used.

If POR_EL0 isn't in the sig context, I think the signal handler could just
write the POR_EL0 system register directly? The kernel wouldn't restore POR_EL0
in that case, so the value set in the signal handler would just be preserved.

The reason that trying to preserve the value of POR_EL0 without any pkeys
allocated (like in the patch in my previous e-mail had) doesn't really make
sense, is that when you do pkey_alloc() you have to pass an initial value for
the pkey, so that will overwite what you may have manually written into
POR_EL0. Also you can't pass an unallocated pkey value to pkey_mprotect().


That's a lot of words to say, or ask, do you agree with the approach of only
saving POR_EL0 in the signal frame if num_allocated_pkeys() > 1?

Thanks,
Joey

