Return-Path: <linuxppc-dev+bounces-10125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BEAFA1E7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 23:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZNMJ6k25z2y06;
	Sun,  6 Jul 2025 07:05:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751749548;
	cv=none; b=nBxq1CzzeO+N1zAyM3Yrniuujk0jpdQY6ygZL9/B/SDxfd21ZcThaflDQ7UgdJpMgS1DQ33qMdL6tgtk4EqV4oXyFvDRec0FOZBD1hQP5G3iNhzl1YoKjdqfH+FvoU1sqhLEqIQO9hkBKRDi531BkjhoNa1lVi66akZluNCzVwIT3rdQaWFyOgxbw5XNBQInjbzVpDMFsbu+JP2LeUqKmtKTu30twnT2h6suF1sr5nV7W4yCa/QdQloq/ezr9FtXmiFGv/uZ8ftv0BXKF+i+8Z+GJpZ8gL73kVjVOrke+7WxzycZ+3MSjrEDmrvkdxgDK7kcAiZbbZlUvWPuuVYqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751749548; c=relaxed/relaxed;
	bh=QNrGEXREXb+VRaOAxlii9StjIrHTh79zxrBn0vyAHzE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRf7XYw5I4V1umVPkr3R+PMtecu8cTcGEdkc07uNN9sHkHVqwIXyuB2dwrfFSK4eqK0jAnDJ+N1yCEQ9ibdUlKNree+tzp1NqVSd1fCFi45U0YA4SrEIyEXgCsyvQa3l67MM01Gw2iiv5oN1HEL7lEcglRepUnRg1JDiyl7MBzh+IitNB+Z3InN/y1qhIz2gwCwgjqLPSVH2TtBHyOBdEwZN3aTBAanQwC7N0OhpXvzCRGpncm5D7mnfNsePSG7tIPIj7NFZ1V+HUzaH42eXZXxybv4mIPVrMrEBwrq1TET+M2NPWGwCuapJJ8XtAt63fEpDfo/e0OnvEXgRHfZKFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dg0ucVpF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dg0ucVpF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bZNMH2tdgz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 07:05:46 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450ce671a08so9917935e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Jul 2025 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751749541; x=1752354341; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNrGEXREXb+VRaOAxlii9StjIrHTh79zxrBn0vyAHzE=;
        b=dg0ucVpFFvbkgZ2r82ws1X+ZgIO93d4gfEhLNC8EPS4Nl8ZGYBMuQhpdyJIX/K9BQO
         Acnjz7q59nxs4qVfAcZzJgk2oM4vhURXB9YI7Rw9DtEgSYX+y5WjLxOQp7OJJiTnwNZm
         jfVl/JsPvPhlPWtM40sdXBa+T4M6p9WAIFRbbfszsjTJXOfrmM9ykNRObW0Unf9mZ2jc
         ky6IKvE+Csul+c1otmOEKtiVAIeYI9lpbOctgyTbLsQsDdYyzCrfkUPw9uVHjkv/ER4V
         SjcGQoZ0/d7VW28NN1FLFgXbL7CHsx38C3Ami6UR8+0isvh2cUvPydQgaKYMYvGkXLUA
         FW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749541; x=1752354341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNrGEXREXb+VRaOAxlii9StjIrHTh79zxrBn0vyAHzE=;
        b=Zge5ymJfxQRwOVxdBKQtEoA+GBhjbuPj/JwWX0SXvXk5F1dhSNsCSNmIFH4EqlhJce
         p6cXbuRwqNoGdFk3+xxEgo0Gm29mF1X0eOSj22ESL1SFboinW2PLxrNwlA1DTZD8tlat
         g32BUcAmyAwhdKzFi/0nTYCz+H2z09cs0QkGXdyhv1zyoPpJNw31r7++4vg7k54ONBkQ
         eYU9PKT3T/4+NJxKk758wibSaT2oGecdyJCZAJ4kaxYupiR933dM+wVqm4rOVjoFemPn
         820yIsFjRjndldg90gVSX6zty0PY1A56HJpugtbaeIji0D9MRo2/iUL3zCFwN1Q/Y/sh
         l1WA==
X-Forwarded-Encrypted: i=1; AJvYcCVkAqYXWQC+Xo+GANwN3F416Eprw8Oby77/PbnctcrOCjXK5SsPHQ/cJQ5aS/lNW9R15DJ4aj2hB/MW2ik=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxbk5gNabEJTsQ9hGwsvaj++F4H+aMPRZks1dIlHsGYDF/A69KV
	KN5KQy6tRgJiPDhXZlPUqH+DffTBVh6EVgSvj8M2DU7RWIK8qiQNgrNp
X-Gm-Gg: ASbGncsGevIzzqA3vImiVNzW37ljSvywZpcfSkn+dbD7ZyK8Qkcx7Qy3Wb+hhrYijyH
	WtmYwOU4zzXVFxf63iGCYWV7ebxIgZZl62fsA3PcaCkyjd+rIIItLIssbl8ahEKGiFqW5D2M7WL
	SkDF2x98oM5NHuSnLaQUv3pR6kSVcmoQ9igG+edoArLXQ7EGU1CpyrFt9SWZ9jQCqc3GmrcHwUx
	VZM97lYjUbEhMbLbG1y4kTAIZFHYoM80ZN8rl0Pxg3rnmh1MkEc6NGsgh903FFNTDrrEq/rIqcg
	zSZ7eAvg9VZevSXS54dJ2BGvczU0Pf0LXUUaYPX3ZNKDBDRJN5iAVMevop+w8OhHdW3MAGcclNn
	EvQanpgEPp3UD3KwmCSnTHUM+bggP
X-Google-Smtp-Source: AGHT+IGT+GFP2/eh/DyGC1nE94xXBDFJpNvsPv3x+Wo4Su4HQLV99sMh/vey3UY2hxRw+Q3uWfEPyA==
X-Received: by 2002:a05:600c:3153:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-454b4ea5f53mr76967405e9.16.1751749541160;
        Sat, 05 Jul 2025 14:05:41 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a1705ed5sm66250775e9.2.2025.07.05.14.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 14:05:40 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:05:38 +0100
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
Message-ID: <20250705220538.1bbe5195@pumpkin>
In-Reply-To: <aGmH_Y4248gRRpoq@gate>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
	<20250624131714.GG17294@gate.crashing.org>
	<20250624175001.148a768f@pumpkin>
	<20250624182505.GH17294@gate.crashing.org>
	<20250624220816.078f960d@pumpkin>
	<83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
	<20250626220148.GR17294@gate.crashing.org>
	<20250705193332.251e0b1f@pumpkin>
	<aGmH_Y4248gRRpoq@gate>
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

On Sat, 5 Jul 2025 15:15:57 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

...
> The isel machine instruction is super expensive on p8: it is marked as
> first in an instruction group, and has latency 5 for the GPR sources,
> and 8 for the CR field source.
> 
> On p7 it wasn't great either, it was actually converted to a branch
> sequence internally!

Ugg...

You'd think they'd add instructions that can be implemented.
It isn't as though isel is any harder than 'add with carry'.

Not that uncommon, IIRC amd added adox/adcx (add carry using the
overflow/carry flag and without changing any other flags) as very
slow instructions. Intel invented them without making jcxz (dec %cx
and jump non-zero) fast - so you can't (easily) put them in a loop.
Not to mention all the AVX512 fubars. 

Conditional move is more of a problem with a mips-like cpu where
alu ops read two registers and write a third.
You don't want to do a conditional write because it messes up
the decision of whether to forward the alu result to the following
instruction.
So I think you might need to do 'cmov odd/even' and read the LSB
from a third copy (or third read port) of the registers indexed
by what would normally be the 'output' register number.
Then tweak the register numbers early in the pipeline so that the
result goes to one of the 'input' registers rather than the normal
'output' one.
Not really that hard - could add to the cpu I did in 1/2 a day :-)

	David

