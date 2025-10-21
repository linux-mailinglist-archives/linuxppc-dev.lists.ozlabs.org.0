Return-Path: <linuxppc-dev+bounces-13127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2679BF82A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 20:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crhMx312qz30hN;
	Wed, 22 Oct 2025 05:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761072973;
	cv=none; b=DphpxcYxRYE/Z0ZvFX8yTyn36ywkCP1U+vV8kPJ9DbvQ6bnudfPWzxpVNTrWyJt0V+91ankAqaWmFo+LbCgnE9gSzJMgXgp8rV70b+oaauf90phb9HY2cec2AEU0/adGABZ8z0xmRIh0nZTjOkjrK93dEodIhjuBIuR1DVsIdxmLyhlD7MWnVTwH9245rfjL3nBacHNkz9MtapNL4qbODMUFPSkDV33N9Lk16umJEb53l9txq44DXehvhLtiuUIxl06DVhqnkgjDlhyWcHIkWbMBZZY1T1zhpFRqIC8O5OIg12nwrvSBGgFPPblrm9cUiaw6J3+n+Xgfb2vSCZ0y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761072973; c=relaxed/relaxed;
	bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsPDDKs6MGSqpSplL2ydZi7mxgMin5aUD365EwCQx3EsiKie/efjbUBYCyGHPR4FHI/ogaFkOMpXyYS7XWXJrRPnlAkYplgqoa3q3AnI8tsGQIWsIPMbQQLNW2oBb+em0Op2skf8kvX/p/DXmHGU4QgUoTdoc9wQCU9dbobdsDzVeEkrqSIAJG8jrgezx2XYrVz8aJkX/pe4cYGvN/yXapjW/uzxWto5tKl6Xbhs4Y1Z7ncPL+yoq5q+KkUZtaf8yVozg8pkjTjvsz7HlLpkUkUjD8TOEgiRY7WeBS85Qd8jNsLduZIQTzkIYUc5nzihCV7Ke0OAojKfCapMmTbC7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fXS5kx+N; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fXS5kx+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crhMq1Xczz30M0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 05:56:06 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3330535f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761072962; x=1761677762; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=;
        b=fXS5kx+NUysKB6cMXAU6mGCsnQL91M0Leqk1bi5fs8srFIQqWzJD08t29XAaYAFn4C
         0BKcOohZg1MBNkEHt8cLlm3lRUFHa+jOFQEftN7YFtDjzQeeboqsIXmSqgEhB38QWhOc
         y/SzdLZOnBZwl/km+ExT4VV8LQaCk87zfR+SCEJwFzDC8gtgYu7A2wJXx3+g4bJVbujG
         g/kldZdFF2jcv7OqecFucb67zJRT3pPPQsWtLQWsa8laQSADEiNKBpAgQkYQI9QYS+Sm
         LTO8UFRH8+ck5Zt4j6x45BvjaVGtzXPIGA7mEoup/PFjv6OxWuZhWcwbt9ZZhLecVkrx
         7cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761072962; x=1761677762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=;
        b=ObdNxn65NZ2JN73wF8ffizbYPo9ZGkM07HTmV60sOnW6M5I+1cTE5ed06lQTNz6Hav
         yTzGMc8omTa2fqyCHXu+nUO1W9vQjqez/NDrnfQqlOek4eDY5JDhFlbZ1upGuisHYHUK
         Civ+oJ+Q/vdIDdzLriaUOsApp3EkCdCDOu4Gi+rPZl6eNS1GltnUFFD6UBSubmlAeRL6
         QfWCBf+fVbTetfW9gwBEY+NNaqeoi5qjUvXRBNBLUdLJdXSqAP70lxR3nwsC15RxTxJq
         Pkrmunxw/zDfFkTc5Bv5VWaFT8zxJ7CRmkrkuw46aEO5gdi0gO0MU+b+gTLWYTPCCWlN
         VOqw==
X-Forwarded-Encrypted: i=1; AJvYcCUVy3gy7mrKs0DyIt9c+ctP0PHbHHzlVwzU+gJD2oQX+7u6V8jVB3VKnbhZR9owMt1JNjVwk72b/6jOouA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ9yRWydDIoXP3kcf7Wo6qHA43KkkKwSoJkCI9Na6CHUQpn5Yp
	GO67LNe77aP/wstgsYrq/PTfUVMPC+hnUHlfSCqV4nX0DxNHX7VL4w+O
X-Gm-Gg: ASbGnctNNJGxnYs7ztEVhM9EcHdIgtfV053sB4ZZgFe+xXAhUxDb4DDxzt6UfYawS7h
	7s45Zs31/z8HvzkvfwKVOImPirRYQuTAKCm0pT0+gmrw61Eqgzdo1MIikEL+VvhO9xticpuIswv
	8sBxDWtkL5025QYscQaJgpv49LJ7oB7BwIB1IX287FzXzNE545VQQEq4SXOpQkXmZC4Pz02TskX
	h21Trp6f5i8zzMqx/p8tsTlO2vS33dDh10meZJD58HB5AkPZyrwz3Az1jVvBAbECyJFh8h+0x3b
	tga9o+Ir2G1iolhPz3NYIWKO9WK+e+yceJry6Fp7aFPF4RrArRkbmVXJgmhR4wj4IFGgbbGGwho
	DbZOcY02X//BfvYu6bp2V1zoUIPr1xNmX7Vbd0WFbd1CjZ12wIq9CO7ucMYNWA3dmzO9ueHpx+Y
	hqTDw15RhMJ3U+1LbsGRL0YL9dnz5JVhVnm1e1i+BBuA==
X-Google-Smtp-Source: AGHT+IFjOxufFJONTpxys1bngEKe+lRcQqq+LVDgs/0okuT/Rc8W/l4ZwbhF8BXNqZX3cWqKXviWlw==
X-Received: by 2002:a05:6000:491d:b0:427:55b:cf6 with SMTP id ffacd0b85a97d-427055b0cf8mr13206929f8f.7.1761072961864;
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm19566507f8f.10.2025.10.21.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
Date: Tue, 21 Oct 2025 19:55:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021195559.4809c75a@pumpkin>
In-Reply-To: <877bwoz5sp.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
	<20251017093030.253004391@linutronix.de>
	<20251020192859.640d7f0a@pumpkin>
	<877bwoz5sp.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 21 Oct 2025 16:29:58 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> > On Fri, 17 Oct 2025 12:09:08 +0200 (CEST)
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> > That definitely looks better than the earlier versions.
> > Even if the implementation looks like an entry in the obfuscated C
> > competition.  
> 
> It has too many characters for that. The contest variant would be:
> 
> for(u8 s=0;!s;s=1)for(typeof(u) t= S(m,u,s,e);!s;s=1)for(C(u##m##a,c)(t);!s;s=1)for(const typeof(u) u=t;!s;s=1)
> 
> > I don't think you need the 'masked' in that name.
> > Since it works in all cases.
> >
> > (I don't like the word 'masked' at all, not sure where it came from.  
> 
> It's what Linus named it and I did not think about the name much so far.
> 
> > Probably because the first version used logical operators.
> > 'Masking' a user address ought to be the operation of removing high-order
> > address bits that the hardware is treating as 'don't care'.
> > The canonical operation here is uaddr = min(uaddr, guard_page) - likely to be
> > a conditional move.  
> 
> That's how it's implemented for x86:

I know - I suggested using cmov.

> 
> >>  b84:	48 b8 ef cd ab 89 67 45 23 01  movabs $0x123456789abcdef,%rax
> >>  b8e:	48 39 c7    	               cmp    %rax,%rdi
> >>  b91:	48 0f 47 f8          	       cmova  %rax,%rdi  
> 
> 0x123456789abcdef is a compile time placeholder for $USR_PTR_MAX which is
> replaced during early boot by the real user space topmost address. See below.
> 
> > I think that s/masked/sanitised/ would make more sense (the patch to do
> > that isn't very big at the moment). I might post it.)  
> 
> The real point is that it is optimized. It does not have to use the
> speculation fence if the architecture supports "masking" because the CPU
> can't speculate on the input address as the actual read/write address
> depends on the cmova. That's similar to the array_nospec() magic which
> masks the input index unconditionally so it's in the valid range before
> it can be used for speculatively accessing the array.
> 
> So yes, the naming is a bit awkward.
> 
> In principle most places which use user_$MODE_access_begin() could
> benefit from that. Also under the hood the scope magic actually falls
> back to that when the architecture does not support the "masked"
> variant.
> 
> So simply naming it scoped_user_$MODE_access() is probably the least
> confusing of all.
> 
> >> If masked user access is enabled on an architecture, then the pointer
> >> handed in to scoped_masked_user_$MODE_access() can be modified to point to
> >> a guaranteed faulting user address. This modification is only scope local
> >> as the pointer is aliased inside the scope. When the scope is left the
> >> alias is not longer in effect. IOW the original pointer value is preserved
> >> so it can be used e.g. for fixup or diagnostic purposes in the fault path.  
> >
> > I think you need to add (in the kerndoc somewhere):
> >
> > There is no requirement to do the accesses in strict memory order
> > (or to access the lowest address first).
> > The only constraint is that gaps must be significantly less than 4k.  
> 
> The requirement is that the access is not spilling over into the kernel
> address space, which means:
> 
>        USR_PTR_MAX <= address < (1U << 63)
> 
> USR_PTR_MAX on x86 is either
>             (1U << 47) - PAGE_SIZE (4-level page tables)
>          or (1U << 57) - PAGE_SIZE (5-level page tables)
> 
> Which means at least ~8 EiB of unmapped space in both cases.
> 
> The access order does not matter at all.

But consider the original x86-64 version.
While it relied on the guard page for accesses that started with a user
address, kernel addresses were converted to ~0.
While a byte access at ~0 fails because it isn't mapped, an access
at 'addr + 4' wraps to the bottom of userspace which can be mapped.
So the first access had to be at the requested address, although
subsequent ones only have to be 'reasonably sequential'.

Not all code that is an obvious candidate for this code accesses
the base address first.
So it is best to require that the implementations allow for this,
and then explicitly document that it is allowed behaviour.

The ppc patches do convert kernel addresses to the base on an
invalid page - so they are fine.
I've not seen patches for other architectures.

32bit x86 has a suitable guard page, but the code really needs 'cmov'
and the recent removal of old cpu (including the 486) didn't quite
go that far.


> 
> >> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\

Thinking about it there is no need for leading _ on #define parameter names.
It is only variables defined inside #define that have 'issues' if the caller
passes in the same name.

> >> +for (bool ____stop = false; !____stop; ____stop = true)						\
> >> +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\  
> >
> > Can you use 'auto' instead of typeof() ?  
> 
> Compilers are mightily unhappy about that unless I do typecasting on the
> assignment, which is not really buying anything.

ok - I did a very quick check and thought it might work.

If you can't use auto for the third definition, then I think tmpptr can be 'void _user *'.

	David

> 
> >> +	     !____stop; ____stop = true)							\
> >> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\
> >> +		     ____stop = true)					\
> >> +			/* Force modified pointer usage within the scope */			\
> >> +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\  
> >
> > gcc 15.1 also seems to support 'const auto _uptr = _tmpptr;'  
> 
> Older compilers not so much.
> 
> Thanks,
> 
>         tglx


