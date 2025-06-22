Return-Path: <linuxppc-dev+bounces-9617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F743AE30BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 18:21:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQGfd6Qrgz30VR;
	Mon, 23 Jun 2025 02:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750609257;
	cv=none; b=l4klYhgAv60pTC6diseM/wVlIGp/NNILu8xl/OVBcZ4dU6EFknqn7oLYodhFKT3AqALpeMOLRPnif22PgSJHvgln47gbT3+s8peJ5+GrNLXiMMI/jARE+Qj51z7Q3H8zb8yWemqiXSLIyn0f2FRUhefmQxlw1vHDHxqdqNxpcQqt+rcpU9BcRjwXyOBiJZSPRbpR6mPkrYb3nK4TWkA90B7HelKiNddbZzjz1VQcAacCwtDAaktZoewocqqTyr+sVBSQWDD0KzRGYs2bdy4iM7zpNuKscOlhXlOy80Ryc/NJWXzJl1uqSE5FDIoSSduZolfPnVEkc4LBR2U4/ZrCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750609257; c=relaxed/relaxed;
	bh=h9UguERxuhFrRUQfvCGEwWcq0+7rxY/z2LNMvf2rwsc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZaGSfrmbDW+kbCWMKzkxfmlZ9mZzWjqlKeuH6efVKRWLCOAU4604bVAZhvY10jRtYcBaJNqQIbIUMRpWJ9CjC9q602DG+kTWUKtpoRLhuSLkLYLmePhXbtzoUVNDZxP3gmZd1JuflWulK+d4JOdpCbjsnyA0TZ4QFT9WuXzYrvp4v+vn+bjSWyZtk81wBtYGjMEartUZlO1S52b5D+lv/JjZ+a1CK3by3Q4KlKaslltAa8xLVOKwzQpiuJIafb0rC/K9bAVc946Y94X34+PrkiBYoCe852D2/xX4PtiHiDoGhvEjnGkIvTcGiTSRvqyvNARE5/ITlCqvs346y1UTRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MsKq70xP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MsKq70xP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQGfY6trZz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 02:20:53 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450cf214200so30757615e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750609247; x=1751214047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9UguERxuhFrRUQfvCGEwWcq0+7rxY/z2LNMvf2rwsc=;
        b=MsKq70xPqIOkrK5eYHQNBB3DeDAn3fY0+p3niv3zMhXH5jhmbAZPfkbibHrQ7UUeWj
         b+HqPO1wdv9pMhGF5UCPKRKfOKp2XITLFZMU7QIgE1YxssnaQkX7AClkll9JS+mGYBXS
         ZO7XUamiN/alS4JSXCNc3OenJ/VeVewn14sQKUxnLD/wN59uX17FU+/0QxAdo1G2D9E6
         rFk/jIhOTC5RKdVnEM1dOFwihtgE9sT04B2zUM5oa2yiECb4J0FqOmOtx1w/eo8fC7ho
         nWkConW8niLL1xjVmxsTXJO89qD1STLMEcnV86ZFsGSjRnJbCW+68QWE5tMMKBDIIAcG
         hFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750609247; x=1751214047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9UguERxuhFrRUQfvCGEwWcq0+7rxY/z2LNMvf2rwsc=;
        b=LjvAYclhumaAnofbi53oLsXowsFrGXUKy+TyVrOW0mO+rY5Cc1W/W7uoJe3f9JPwyL
         RdWtanqdbGCI4PrIbbdmoSBdfPGFvpYzWgZMG8YDdz9WdONqyUXthTpsz9SLjAhIeAay
         xPl5zpjFtO44PuR1UY9o0qjzNeYwdZUVy1e9M8ltjo4OfYvH4iTl4Ue/4RruuFizh0JC
         vjBcNx08W9TkTJYKWYxdZ8aKMF1aCWwqbzBdMNjXLJLS7UI62zIJ6ITlIZVHwM2ZeJq+
         qNZkY3d/w1BAeuayDilxl9lQdQCvqWpGIoECBtSc+6eFV8eo74PXFWp8iTqxImfxS8SF
         SJvw==
X-Forwarded-Encrypted: i=1; AJvYcCW1DhvmzMuSXufMuqIdim84XJDZLCa1kjn45lSTI7d6qEHEem+I3YovR7+W+JnmpTIbPAXSKABRlfh+o78=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxP9aHov6GY+OG88CJLCJ3z3WwIgP/1tzBVXR0nFnJlae07FS3s
	1k7zsdCTw15xXk7p8xq/RYh2HnLxrns0v+OHd/z+3Z+eNypUfQF5tt6I
X-Gm-Gg: ASbGnctp/f0NScxZfCYGlrTa/FquVWyFbcbjN+iijLJll8ejwZPWJswME7y3O9vmiz7
	Cstf0YZyabB2IXfpk7EuvwDx3TFhyQ2tHR2e34A6phxQk8clB03cW3Dip81LJ9I92+S9xoieIH1
	MPtDC/UXTaf1Hs2BLCZ2oI+mB67OulSZF/KvyRXW6SAdTMHKUPIDRq12US3lDLzqDGdBK7bVOV7
	zTZPRDe1wuOnkM0cB3BlQWqpTsrCwfbfqKugKoKR0RI8Oeu5/Hyl/ak9WK0fK1jKZQhikAopmY7
	Ou8ZvSJolM73f+zUz4BoDDO/l3cY6IK2Segoi+KlvDUh7I7WMeFxDpaJjXjodp5VA2AEWG5PZ4f
	Gosr10MwtXK0p6Q9cdvFsgrgi
X-Google-Smtp-Source: AGHT+IGm8Jkkiej/C+jG1pvkrtKONtBC9in64FwHFjGEl4tQBWrNcO7v48A3YibfheGLyTPhwgFPNg==
X-Received: by 2002:a05:600c:45cb:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-453659f8288mr77140725e9.26.1750609247175;
        Sun, 22 Jun 2025 09:20:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm85091375e9.1.2025.06.22.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 09:20:46 -0700 (PDT)
Date: Sun, 22 Jun 2025 17:20:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, "Andre Almeida" <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250622172043.3fb0e54c@pumpkin>
In-Reply-To: <cover.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
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

On Sun, 22 Jun 2025 11:52:38 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Masked user access avoids the address/size verification by access_ok().
> Allthough its main purpose is to skip the speculation in the
> verification of user address and size hence avoid the need of spec
> mitigation, it also has the advantage to reduce the amount of
> instructions needed so it also benefits to platforms that don't
> need speculation mitigation, especially when the size of the copy is
> not know at build time.

It also removes a conditional branch that is quite likely to be
statically predicted 'the wrong way'.

> Unlike x86_64 which masks the address to 'all bits set' when the
> user address is invalid, here the address is set to an address in
> the gap. It avoids relying on the zero page to catch offseted
> accesses. On book3s/32 it makes sure the opening remains on user
> segment. The overcost is a single instruction in the masking.

That isn't true (any more).
Linus changed the check to (approx):
	if (uaddr > TASK_SIZE)
		uaddr = TASK_SIZE;
(Implemented with a conditional move)
Replacing the original version that used cmp, sbb, or to get 'all bits set'.
Quite likely the comments are wrong!

I thought there was a second architecture that implemented it - and might
still set ~0u?
As you noted returning 'TASK_SIZE' (or, at least, the base of a page that
is guaranteed to fault) means that the caller only has to do 'reasonably
sequential' accesses, and not guarantee to read offset zero first.

As a separate patch, provided there is a guard page between user and kernel,
and user accesses are 'reasonably sequential' even access_ok() need not
check the transfer length. Linus wasn't that brave :-)

I think some of the 'API' is still based on the original 386 code where
the page tables had to be checked by hand for CoW.

	David

> 
> First patch adds masked_user_read_access_begin() and
> masked_user_write_access_begin() to match with user_read_access_end()
> and user_write_access_end().
> 
> Second patch adds speculation barrier to copy_from_user_iter() so that
> the barrier in powerpc raw_copy_from_user() which is redundant with
> the one in copy_from_user() can be removed.
> 
> Third patch removes the redundant barrier_nospec() in
> raw_copy_from_user().
> 
> Fourth patch removes the unused size parameter when enabling/disabling
> user access.
> 
> Last patch implements masked user access.
> 
> Christophe Leroy (5):
>   uaccess: Add masked_user_{read/write}_access_begin
>   uaccess: Add speculation barrier to copy_from_user_iter()
>   powerpc: Remove unused size parametre to KUAP enabling/disabling
>     functions
>   powerpc: Move barrier_nospec() out of allow_read_{from/write}_user()
>   powerpc: Implement masked user access
> 
>  arch/powerpc/Kconfig                         |   2 +-
>  arch/powerpc/include/asm/book3s/32/kup.h     |   2 +-
>  arch/powerpc/include/asm/book3s/64/kup.h     |   4 +-
>  arch/powerpc/include/asm/kup.h               |  24 ++--
>  arch/powerpc/include/asm/nohash/32/kup-8xx.h |   2 +-
>  arch/powerpc/include/asm/nohash/kup-booke.h  |   2 +-
>  arch/powerpc/include/asm/uaccess.h           | 140 ++++++++++++++++---
>  fs/select.c                                  |   2 +-
>  include/linux/uaccess.h                      |   8 ++
>  kernel/futex/futex.h                         |   4 +-
>  lib/iov_iter.c                               |   7 +
>  lib/strncpy_from_user.c                      |   2 +-
>  lib/strnlen_user.c                           |   2 +-
>  13 files changed, 158 insertions(+), 43 deletions(-)
> 


