Return-Path: <linuxppc-dev+bounces-9624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3191FAE31CE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 21:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQMKL30VZz30Vr;
	Mon, 23 Jun 2025 05:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750621878;
	cv=none; b=dN+YaeuTtdxZG7//FP+v5nMQ8V9DAQlD6n5aQ3niniIiFnxIEGYOt+pH9wUaMcqkaaifAn3O8cwzNeTE+LWNSexYgw+PSlmXMNt+bzEcWRVFMI0pHP/b4XrSCfzpzmB3QByCI6TLzTMkyB0uuOCC8h0zCxNj60hx9faoyXGBkJVZM9DnNsIg38EKJyJtJ8hPpEIo8GrJbT+DA2DjKqgseJRqTGCE4VC+MYawU2RD6RPy0X+z2HDJkqLC3w7G6gL7ulElM+kbsZI1wyzDMCcydsDSmDuyShi0Sn6rZOtAorrlFchZbwKf9J+yl6n/dwrv4zdEy6Jb5PMww6BfhYErug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750621878; c=relaxed/relaxed;
	bh=BUcrx2SGK4k7VspPrA1kZfeY9CvCdk1bQCrmf4AIFEs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPc/DSMwvYUookxGMBhEZzMkn551znB3NdgtvmeuWk9sdt/aoHRBRbbCHspM8L6sbQqILdfeXMW8MlL3SeFX1vL3175OTmpZS5Un5HAEC0WA5N61Pp9hUoSc177YYlgEGSz1SvSzeQWGvx4sqxW8+v4RHHBa+r+Mv50K4xwGZ6aIt82rfdgvReaYEeUVK/5JPSi8kA9BlNHgUZJXehXx93rHdDYQr8/m8p37yOsFmkR6arrWPAY4ApRDOIQr/mIUj2t6uXRi6Vdz++06ZDpiJsyFN4R6aE+oXHEXA+CfcGwuQDuFVoPenGSA7QSKP62KXi30V2vl3x7DNUp5awMeqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SsxrIF4p; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SsxrIF4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQMKJ5HQ8z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 05:51:15 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso27115175e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750621872; x=1751226672; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUcrx2SGK4k7VspPrA1kZfeY9CvCdk1bQCrmf4AIFEs=;
        b=SsxrIF4pJk/9s3GdE0oMjviQUkHrVxIAFrYpHlXO6ZLj+lkQEl4Euh5NJa009zAN2D
         vxYPkju45BWbmi3TRHTSofofo5TU8aA0UDHyNmTZdp1ry9yiB/y39hCE9i37r95oAspd
         4lh2QiCcR9a1YI/6aN/ziltEoF5uo3jWtChfSNfPKI8oeGNlZBFyALOum42PBxEogMVB
         /T+/XpacTw+toYOfcNG4C9dNgoiA4grr8ZB3itdCIExuNaR/c7rE4POGsHF4ASK8aeHJ
         fDchmm7GEM8CBLHPA0k9ND0yCTR0hfCJr6kCy/vh3qWoZAH7slwvSpFrKerPFpdxhzE0
         7KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750621872; x=1751226672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUcrx2SGK4k7VspPrA1kZfeY9CvCdk1bQCrmf4AIFEs=;
        b=xBp+yW4SiJkJGFpdhf9b95r70r1XqMEkhpdfMKUYH12wchE4SuwubaN+NxrB38GORA
         vnpmAnXOhXMKCyx7DYMeScoVxFdcolqAnIhNLtX8vQi9sLIstPBQPamnUrKNSGbMvZC0
         uVmxT3lfqh9ev5Dzyv/yv8SFYX1Eu4yJOqAmjnTjIm8QcaWUwi/DdwTZ3CqOQJLfTTPU
         1TTBWTUTny9h8YtEu2hR/yBCQoRc0IgwF10DNiAyMkYCV6ADzYVHWB/Jsr3o7BuCCuPg
         VheH4n/5ATWXRPfpARfacmkC5bLAeuykT9+oM6vPVIiXLO2zmhOU2OGXHnTcKuZCAuyM
         yQhw==
X-Forwarded-Encrypted: i=1; AJvYcCV63r6wjcOsjzbULFTyvb/AwBpFRBQi+Fdq3S8VEiZFh0F4/pj5WE4aNaNvMc2Y8FhB448rLqHdMOLcLr4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzV7LuYVLN688stb5+6aZtrp7FUmGVRPdGh0USLsOfOkL8bJj90
	TczHdzb7axfdcO9lYPvX1cpE7kgMSZXHUouehwPOAXLFgLD50Xa8AwEw
X-Gm-Gg: ASbGncvQ9TgEIoTzNIPQ4owMnB8qpUp/MkDhfWvtC8EETor27nPnEZCea2PY18APCh/
	2iKCs51hgZm5+4EckUJ0KRzcfNF+0DkASfApUUD9Z0J15XELG0RuAtrU5EioSYRBGm2BYxgzVUK
	FY4NtnabOPQ0tgNZCYZZ2LMCbcnv6/v0nui8f6BawwFc80AWNDip0jRXUqZQ1aZOLvEjcyf8X6Y
	0C/OdzCIE+L5rM2x8WEv0EYqVUHQKLwWNb8UbAURzEnPsL3lzN6TmUWY5mBqYGJSMYmhIIMr2W7
	MRYbyVryXHQi3j+GFvVat36YI0A/8W36HVnWpuv7Q+TTtiVK3LNyOxz32GdvDiEeGfXOJMc14lk
	wU8/eHrL96DpS40H1hzDoY372
X-Google-Smtp-Source: AGHT+IGpGhtjsFvWIO86ULzWqyw8BmK+94ZW8xAj21rG1ZHpB7Q2zU99nx35rnDAsbLQBVkLd2sxxQ==
X-Received: by 2002:a05:6000:4906:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a6d12e6a3emr7498266f8f.45.1750621872023;
        Sun, 22 Jun 2025 12:51:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c5f2sm7839533f8f.55.2025.06.22.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 12:51:11 -0700 (PDT)
Date: Sun, 22 Jun 2025 20:51:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
Message-ID: <20250622205109.02fd2ecb@pumpkin>
In-Reply-To: <CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622181351.08141b50@pumpkin>
	<CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 10:40:00 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 22 Jun 2025 at 10:13, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > Not checking the size is slightly orthogonal.
> > It really just depends on the accesses being 'reasonably sequential'.
> > That is probably always true since access_ok() covers a single copy.  
> 
> It is probably true in practice, but yeah, it's worth thinking about.
> Particularly for various user level structure accesses, we do end up
> often accessing the members individually and thus potentially out of
> order, but as you say "reasonable sequential" is still true: the
> accesses are within a reasonably small offset of each other.

I found one that did ptr[4] followed by ptr[0].
Which was potentially problematic if changed to use 'masked' accesses
before you changed the code to use cmov. 

> 
> And when we have potentially very big accesses with large offsets from
> the beginning (ie things like read/write() calls), we do them
> sequentially.
> 
> There *might* be odd ioctls and such that get offsets from user space,
> though. So any conversion to using 'masked_user_access_begin()' needs
> to have at least *some* thought and not be just a mindless conversion
> from access_ok().

True - but the ioctl (like) code is more likely to be using copy_to/from_user()
on the offsetted address rather than trying to be too clever.

> 
> We have this same issue in access_ok() itself, and on x86-64 that does
> 
>   static inline bool __access_ok(const void __user *ptr, unsigned long size)
>   {
>         if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
>                 return valid_user_address(ptr);
>         .. do the more careful one that actually uses the 'size' ...
> 
> so it turns access_ok() itself into just a simple single-ended
> comparison with the starting address for small sizes, because we know
> it's ok to overflow by a bit (because of how valid_user_address()
> works on x86).

IIRC there is a comment just below that the says the size could (probably)
just be ignored.
Given how few access_ok() there ought to be, checking them shouldn't be
a problem.
But I get either io_uring or bpf does something strange and unexpected
that is probably a bug waiting to be found.

Remembers some very strange code that has two iovec[] for reading data
from a second process.
I think I failed to find all the access_ok() tests.
IIRC it isn't used by anything 'important' and could be nuked on
security grounds.

	David

> 
>            Linus


