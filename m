Return-Path: <linuxppc-dev+bounces-9684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107FAE7148
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 23:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRcxT0z7rz2xlK;
	Wed, 25 Jun 2025 07:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750799309;
	cv=none; b=mJPLs2c8EWJP1CEpS7T/x7uUOu19XLgjnhxyDnAG8ddgwswQFAYl6/Yd61Dc/7b9NOto0FuRtzYnC3cFJFFTHeDta/edQlCO+W9uft8aTQB4zRA+FIGL3N3Rk/iFRb0ZHPcmk0dYWZxfwJEiGiQF3h7mf9KnOi6/qXCTSjCC9yrPhelprcf3scknAvwFSleQjRdBXRi3vRhX+CF5bQLNqOIE6hXt3m77fq1NLj7UNLLPY4EHP7Phkw6+gvXutAfK0t3Sb+OrgFZFdmuuGu8/w3xjJCjOrCVnYus3YLF6CRvD2X0F2WanuxfkZrc3xPGE1ijhOD0kdzQwXEr6zjE+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750799309; c=relaxed/relaxed;
	bh=itvx7IDSqd1Qu+kDl1q7+IKMKfpB6umE1igfQExJBWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmy1MnsJwe980b5rEWdWWCYemvhzyZlkKIUbHrMAHGUdQIQTtagh3jNximzsBfLqtj5dVa63vrPDYubUyIlDxXYLXJjlayn4c7BMb6fLw/BvgBLANd7FhBcYtkMIwy1+5wLPjgfU3xdYyMVsbiWoAa9Wa+C1nCTvZe+/gSCdd91QbR5SCiiGLFSAysU3h0PY499F8jWC1SeqJOB0bXXmciwnQeQUOMUTrkdxNApDQ9ghUu+mPaeh0BSwDSP/ApS6cFZ7au43PzPGuxFYTF6NOP4xwRhlFuz0QS42HxeYM29T6PhW0a4RlKlGiyvK6nbyeTfubQa9CaI3a9vvSHc+bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DorYBeo9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DorYBeo9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRcxR3Bt9z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 07:08:26 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3910662f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750799299; x=1751404099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itvx7IDSqd1Qu+kDl1q7+IKMKfpB6umE1igfQExJBWU=;
        b=DorYBeo9UQvLdfWXFcn3W1z0CT0sM/KMHS0Uk6lCLb8KSf513t2wutnmc8i0zb5f69
         7ORNxlIQH9Kaik0I31Re5RwNNFJXrRy+c/KXkC9BMQNbsGMULZlMxR60a66kxStTPdrr
         VtNXxhw+oQLLSNLg5EqGKy08mkGfnmII2TyTwyn80Isbi1uGUQHSVbhDkvHJN5eujGsX
         rY5AlhF/V6DxEKIsLruRwlAcKFeyvGf+gc1XpWq4hE8gyzmWG8MEgHAcDbGJEHuIT/Gh
         Q/ckjqZtmp6i3nvE5JhRdAZ3Ad3AjQjlnOUXnlCnhO1QWwduUsohb+T/m9YogOkQGtQd
         5BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799299; x=1751404099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itvx7IDSqd1Qu+kDl1q7+IKMKfpB6umE1igfQExJBWU=;
        b=jVM9vLFaAQQEG9uCr793lM+cEInlqEmIedgX2ldL73mFhdLnWX+rSJNfc1Z5UO0ph/
         AlmzbH7SvgxZSlFE2UFQZwcUVXDK31iRPhQODkQuxiWYu8PAnQlwTmTlVZVSQuyKP3/Y
         JQODDMCCGvfUt0t89B6ymEpBxGwzhi17LpYxOMNBHdPMCI0mKpax/oLzwWmM8Awb8J1k
         +iTuWZq9Tw7JTxv1o1dIydbg8kijypZW6rq258G2FVQ7WWquIYWYUAQ9HM2F6M7o+naw
         JN3fEaGF6V85rclbR0IWri6t+G3ARB2ytLJHkdPe0f1oFzuzA6Q+8+kzzaZ1rsusUbCG
         Jo+w==
X-Forwarded-Encrypted: i=1; AJvYcCXKjv0XqnKXjgWBAJJ1eOOLIJSyI1ofuNDf4o1q5nffm6Pu2zCE3X3PX32yJg69VXYopCRrV3Z6xEAbn+8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9CHpLMEuU8GgBeu3PhEVG9QX78Wu5Ou/1WS3oiqhOqyPCRr/x
	nO9U70DGp/so+foi0ltMchcXbSBg8rjC35jrFq6fwHIyjc4P8937oT0P
X-Gm-Gg: ASbGncvQyqhtZ7V9KLYXlQ/oMZT72xiUipTdtSRc+v/E3kL/O/IBwGkCt6vr7aQMxJC
	VS5zTkA2Bk/2YQBVsNKVAJSoMkaQqhXHL1+4Two7vnbXqUc1NqrOL8jkUbB8YdEpLO6/ZmsT7KT
	2Sw08dl7cnNTmG+644GwLHyJuJfdZZyE8M5VNu0gbeDs/x9Jd+2ohvSoRFvEEYpKkXKo0vMYNj2
	Brk2O+fI2m/aJfRSifhx/Z+uvpw5k7yRy/HPKcj/IQ5tY1L4VkIppGkbOiy5z4XTPHELBa19yBd
	89lVldJfZOw6k00boscedYc2nPKSP11QfexIWoIZ/OsduTL/5/gyYHQZNCBfiCd591N0MNQKd3w
	nz5PgTsb11tpyFxublvPCt+K/
X-Google-Smtp-Source: AGHT+IGwHH+3Fto7qgv3C8c/BdcTcAmM+Clmw2M+ojfy6KRjk/KACDvzw9BkPqhVjXarh8ndrQu0nQ==
X-Received: by 2002:a05:6000:2407:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3a6ed66a42amr135573f8f.31.1750799299081;
        Tue, 24 Jun 2025 14:08:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad186sm165755e9.21.2025.06.24.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 14:08:18 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:08:16 +0100
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
Message-ID: <20250624220816.078f960d@pumpkin>
In-Reply-To: <20250624182505.GH17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
	<20250624131714.GG17294@gate.crashing.org>
	<20250624175001.148a768f@pumpkin>
	<20250624182505.GH17294@gate.crashing.org>
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

On Tue, 24 Jun 2025 13:25:05 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> Hi!
> 
> On Tue, Jun 24, 2025 at 05:50:01PM +0100, David Laight wrote:
> > On Tue, 24 Jun 2025 08:17:14 -0500
> > Segher Boessenkool <segher@kernel.crashing.org> wrote:
> >   
> > > On Tue, Jun 24, 2025 at 07:27:47AM +0200, Christophe Leroy wrote:  
> > > > Ah ok, I overlooked that, I didn't know the cmove instruction, seem 
> > > > similar to the isel instruction on powerpc e500.    
> > > 
> > > cmove does a move (register or memory) when some condition is true.  
> > 
> > The destination of x86 'cmov' is always a register (only the source can be
> > memory - and is probably always read).  
> 
> Both source operands can be mem, right?  But probably not both at the
> same time.

It only has one 'real' source, but the implementation could easily
read the destination register and then decide which value to write
back - rather than doing a conditional write to the register file.
A conditional write would be a right PITA for the alu result
forwarding logic


> 
> > It is a also a computational instruction.  
> 
> Terminology...
> 
> x86 is not a RISC architecture, or more generally, a load/store
> architecture.

It sort of is these days.
The memory transfers are separate u-ops, so a 'reg += mem' instruction
is split into two be the decoder.
Although some u-ops get merged together and executed in one clock,
obvious example is some 'compare+branch' pairs.

> A computational instruction is one that doesn't touch memory or does a
> branch, or some system function, some supervisor or hypervisor
> instruction maybe.
> 
> x86 does not have many computational insns, most insns can touch
> memory :-)

Except that the memory 'bit' is executed separately from any alu 'stuff'.
So for a 'reg += mem' instruction the memory read can be started as soon
as the registers that contain the address are valid, the 'add' requires
the memory read have completed and the instruction that generated the
old value of 'reg' have completed - which could be waiting on all sorts
of things (like a divide). Once both values are ready the 'add' can be
executed (provided a suitable alu is available).

 
> (The important thing is that most computational insns do not ever cause
> exceptions, the only exceptions are if you divide by zero or
> similar :-) )
> 
> > It may well always do the register write - hard to detect.
> > 
> > There is a planned new instruction that would do a conditional write
> > to memory - but not on any cpu yet.  
> 
> Interesting!  Instructions like the atomic store insns we got for p9,
> maybe?  They can do minimum/maximum and various kinds of more generic
> reductions and similar.

I think they are only conditional stores.
But they do save a conditional branch.
A late disable of a memory write is far less problematic than a disabled
register file write. No one minds (too much) about slight delays between
writes and reads of the same location (reduced by a store to load forwarder)
but you don't want to lose clocks between adjacent simple alu instructions.

For my sins I re-implemented a soft cpu last year...
Which doesn't have a 'cmov' :-(

> 
> > > isel (which is base PowerPC, not something "e500" only) is a
> > > computational instruction, it copies one of two registers to a third,
> > > which of the two is decided by any bit in the condition register.  
> > 
> > Does that mean it could be used for all the ppc cpu variants?  
> 
> No, only things that implement architecture version of 2.03 or later.
> That is from 2006, so essentially everything that is still made
> implements it :-)
> 
> But ancient things do not.  Both 970 (Apple G5) and Cell BE do not yet
> have it (they are ISA 2.01 and 2.02 respectively).  And the older p5's
> do not have it yet either, but the newer ones do.
> 
> And all classic PowerPC is ISA 1.xx of course.  Medieval CPUs :-)

That make more sense than the list in patch 5/5.

> 
> > > But sure, seen from very far off both isel and cmove can be used to
> > > implement the ternary operator ("?:"), are similar in that way :-)  
> > 
> > Which is exactly what you want to avoid speculation.  
> 
> There are cheaper / simpler / more effective / better ways to get that,
> but sure, everything is better than a conditional branch, always :-)

Everything except a TLB miss :-)

And for access_ok() avoiding the conditional is a good enough reason
to use a 'conditional move' instruction.
Avoiding speculation is actually free.

> 
> 
> Segher


