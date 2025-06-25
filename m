Return-Path: <linuxppc-dev+bounces-9729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CDCAE7A2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 10:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRw4q3Bvzz2xk5;
	Wed, 25 Jun 2025 18:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750840251;
	cv=none; b=Fq2HQquB6yjfWzrVKXMdf0kxkfaWRZ4woNhdEAXK92T+Xljmwtlj8qSjVqmwfsfJfSpoFvVAe983eOXINlCgpo5aA9A9Ka0fcVEYWgL/e3aouYkeLroFVY8q/7nGnmh60GwtOhWMQlqY42TlOq3oJZ/32KXwBtGB9DMFQVHMBg7/Qhoifp19HdaFMB/g0hXC6ltX25guOgNjcPLg18Hhj9qbsvYFqTOAW5F71znzLyZFs1kNVSE0RVhb/vY5xwNwMe0QHK4uV4x4b9pG9VHbAFB4dKD0AaYKS6cJCWdOzhGhYAigTXTJH+HqNN2IdAmuOo9H2jx4iztGRiHmmFihzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750840251; c=relaxed/relaxed;
	bh=HWZO9vBydLguvscfxtiLRMgmMbnzb9l8oTdYX/pGmn4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrY2TFB1NOGR81j/QWQEn9dA0SFTvxkKQoR1gxH2vwr4TSdtRG2MJe6+G1GERQYQyEKCgnw3CjnykCeJ625xyF/7UG5Xl2gQohtfU2mgg2ZN0RAN6J18kQHGPGaUqZzC30W/oOdjlASw8YwCNkcrTpSpRSnYii39djyc2KxbZCij2ZQ5wC5rCEMl+Nucc6jm9rs4TRQ4QDX2XoxuU6+pNABTjUCC8fLALUNRwxUtD4gzRUY8HQAMTa9dmM6p2cHlVzX4ccWwzJ64eT9qLfn8g7I7Oo/+OfwY18366L6vke2MI296bKdONDakM31WFa5ErujdnC1RCxWDRzTDbIDSIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PhzlPQWM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PhzlPQWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRw4m3MFCz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 18:30:47 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45363645a8eso10428375e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750840244; x=1751445044; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWZO9vBydLguvscfxtiLRMgmMbnzb9l8oTdYX/pGmn4=;
        b=PhzlPQWMGllKefgCsbPWNH98bB4OrkqnijwX9cb22jDiWkvdLaKeSrj8mSd9sIHZDP
         k+vb7LT1IS1VgVSNHACbnIlbe+S7bR3xANRcRWN9Z9eCtLKCo2jFHoa+lynnuVTGF6QO
         iPvdeKWX9TURkbTZMG621zkWYnhJrQFNsgbmKV/sgY3GGPjdJi073p8041hLj9c0U4SJ
         Y5TQyFEpY1C78sLW7RLozhwsa6wHh6iuTvgUFed+K8n0Bkhc3Jo4gvpSF0pMwv1pZ9xX
         kbinCTvUUavuHhLeysDWPhYovtXirMHLkj1BrXWEl4B9F+aD6ipiwUq3GW1hPoQvYNPA
         HuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750840244; x=1751445044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWZO9vBydLguvscfxtiLRMgmMbnzb9l8oTdYX/pGmn4=;
        b=wj5mLGNolevcSqaQooC9ksdosod9xVOOqDfe5Tu19cSZp6yfDUT0jmZ43UkZNWeuZT
         6Q7V1X81gT9ANymRtWefwTvQUmhXpio5N2WWb+WZeG/z8grmt5jdst7iwlenwMoCJYpT
         mUPk1NgwiGyw7bynkWb8l747Xs6E3rQO4Lc6xv6/gCjwMjbKNeDBa+Fi3E22erMKqP1F
         IoCmQxstN4CBAYiwd5G3bgS+Zv1yoomg33MtgFdfwJeD9k4hVQeXafXSWv/kD9xWKCUz
         SDz42utWcsJEjfteG0SKMZ3sbEClFdfZRpEN8pYxFDM4xzN5tA7v5t7+2m6ic1SE1h3I
         4KIA==
X-Forwarded-Encrypted: i=1; AJvYcCW5iCbH6F3kp9AArMMc7e46EkGniyTjqM4MtSJPT9B8h6o7Iy8nVYoznfnyUMom2fHRKPZQwVqm16QiiVc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCKlSWynHL686ABcmERgwpSB+mlnX/XZ7NADpOZAoocmyV48Mx
	VmLO2pZ1p26eIDC6NxAHQmiUWESIpwYeFAmMLaUfnu47TIkwFWGFri2l
X-Gm-Gg: ASbGncsntJBw8FFL0O+NCmMrp7OiRcbAzyH2sVpx2/QcY4A3eNDtJ/6bd9HbuIIlU5z
	o5hCOQlNqiq3rmDfyZAHxcsCori2NeHWZlddX4c0h0oHSGD3DezieRYOOpUIdD2zbXo9UHV4Zv5
	2/pIm7rVSaGqevyrofQtzI/5jf6k1nV/U2Zc6QH2+V2lQWrUFq0Nko3hX6Wzzykjfazexh2cZsa
	pvhm01dKNJ9sH77BV4Z3v+PPAwsZhSSNrgvNn3kRnH1qMsAahs3LIkumdhAVZ6WJNWuqGWlvtPk
	m2q4XeekC2esg/0MtSwSvBh762VC1sFK8uN00So5pJlhNLSvrwOJru5zTbBm9y+7pHEpCBaIC64
	P0a7G9ZmHnx0XVPdbR9QF7t9J
X-Google-Smtp-Source: AGHT+IE9XkEDDWe5avnMKVyJiktIxY/anhzBr2iUjPbEYXho5HvfSLdB5xhpcwci6yKEnr3ElCb9VQ==
X-Received: by 2002:a05:600c:4e02:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-45381add658mr19874775e9.13.1750840244055;
        Wed, 25 Jun 2025 01:30:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538327fed8sm4463545e9.1.2025.06.25.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:30:43 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:30:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250625093040.7a7eaf3e@pumpkin>
In-Reply-To: <20250624213712.GI17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
	<20250624093258.4906c0e0@pumpkin>
	<20250624213712.GI17294@gate.crashing.org>
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

On Tue, 24 Jun 2025 16:37:12 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> Hi!
> 
> On Tue, Jun 24, 2025 at 09:32:58AM +0100, David Laight wrote:
> > > So GCC uses the 'unlikely' variant of the branch instruction to force 
> > > the correct prediction, doesn't it ?  
> > 
> > Nope...
> > Most architectures don't have likely/unlikely variants of branches.  
> 
> In GCC, "likely" means 80%. "Very likely" means 99.95%.  Most things get
> something more appropriate than such coarse things predicted.
> 
> Most of the time GCC uses these predicted branch probabilities to lay
> out code in such a way that the fall-through path is the expected one.

That is fine provided the cpu doesn't predict the 'taken' path.
If you write:
	if (unlikely(x))
		continue;
gcc is very likely to generate a backwards conditional branch that
will get predicted taken (by a cpu without dynamic branch prediction).
You need to but something (an asm comment will do) before the 'continue'
to force gcc to generate a forwards (predicted not taken) branch to
the backwards jump.

> Target backends can do special things with it as well, but usually that
> isn't necessary.
> 
> There are many different predictors.  GCC usually can predict things
> not bad by just looking at the shape of the code, using various
> heuristics.  Things like profile-guided optimisation allow to use a
> profile from an actual execution to optimise the code such that it will
> work faster (assuming that future executions of the code will execute
> similarly!)

Without cpu instructions to force static prediction I don't see how that
helps as much as you might think.
Each time the code is loaded into the I-cache the branch predictor state
is likely to have been destroyed by other code.
So the branches get predicted by 'the other code' regardless of any layout.

> 
> You also can use __builtin_expect() in the source code, to put coarse
> static prediction in.  That is what the kernel "{un,}likely" macros do.
> 
> If the compiler knows some branch is not very predictable, it can
> optimise the code knowing that.  Like, it could use other strategies
> than conditional branches.
> 
> On old CPUs something like "this branch is taken 50% of the time" makes
> it a totally unpredictable branch.  But if say it branches exactly every
> second time, it is 100% predicted correctly by more advanced predictors,
> not just 50%.

Only once you are in a code loop.
Dynamic branch prediction is pretty hopeless for linear code.
The first time you execute a branch it is likely to be predicted taken
50% of the time.
(I guess a bit less than 50% - it will be percentage of branches that
are taken.)

> 
> To properly model modern branch predictors we need to record a "how
> predictable is this branch" score as well for every branch, not just a
> "how often does it branch instead of falling through" score.  We're not
> there yet.

If you are going to adjust the source code you want to determine correct
static prediction for most branches.
That probably requires an 'every other' static prediction.

I spent a lot of time optimising some code to minimise the worst case path,
the first thing I had to do was disable the dynamic branch prediction logic.

	David

> 
> 
> Segher


