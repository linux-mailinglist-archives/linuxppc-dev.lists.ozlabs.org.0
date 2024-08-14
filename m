Return-Path: <linuxppc-dev+bounces-88-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2AA951DFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 17:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkWjn1HP3z2yHT;
	Thu, 15 Aug 2024 01:03:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkWjm3f1Mz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 01:03:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08353CE1A16;
	Wed, 14 Aug 2024 15:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727D4C4AF0A;
	Wed, 14 Aug 2024 15:03:49 +0000 (UTC)
Date: Wed, 14 Aug 2024 16:03:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
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
Message-ID: <ZrzHU9et8L_0Tv_B@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <ZqJ2knGETfS4nfEA@e133380.arm.com>
 <20240801155441.GB841837@e124191.cambridge.arm.com>
 <Zqu2VYELikM5LFY/@e133380.arm.com>
 <20240806103532.GA1986436@e124191.cambridge.arm.com>
 <20240806143103.GB2017741@e124191.cambridge.arm.com>
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
In-Reply-To: <20240806143103.GB2017741@e124191.cambridge.arm.com>

Hi Joey,

On Tue, Aug 06, 2024 at 03:31:03PM +0100, Joey Gouly wrote:
> diff --git arch/arm64/kernel/signal.c arch/arm64/kernel/signal.c
> index 561986947530..ca7d4e0be275 100644
> --- arch/arm64/kernel/signal.c
> +++ arch/arm64/kernel/signal.c
> @@ -1024,7 +1025,10 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
>                         return err;
>         }
>  
> -       if (system_supports_poe()) {
> +       if (system_supports_poe() &&
> +                       (add_all ||
> +                        mm_pkey_allocation_map(current->mm) != 0x1 ||
> +                        read_sysreg_s(SYS_POR_EL0) != POR_EL0_INIT)) {
>                 err = sigframe_alloc(user, &user->poe_offset,
>                                      sizeof(struct poe_context));
>                 if (err)
> 
> 
> That is, we only save the POR_EL0 value if any pkeys have been allocated (other
> than pkey 0) *or* if POR_EL0 is a non-default value.

I had a chat with Dave as well on this and, in principle, we don't want
to add stuff to the signal frame unnecessarily, especially for old
binaries that have no clue of pkeys. OTOH, it looks like too complicated
for just 16 bytes. Also POR_EL0 all RWX is a valid combination, I don't
think we should exclude it.

If no pkey has been allocated, I guess we could skip this and it also
matches the x86 description of the PKRU being guaranteed to be preserved
only for the allocated keys. Do we reserve pkey 0 for arm64? I thought
that's only an x86 thing to emulate execute-only mappings.

Another corner case would be the signal handler doing a pkey_alloc() and
willing to populate POR_EL0 on sigreturn. It will have to find room in
the signal handler, though I don't think that's a problem.

-- 
Catalin

