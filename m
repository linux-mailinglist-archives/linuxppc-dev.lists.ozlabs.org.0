Return-Path: <linuxppc-dev+bounces-6023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 139DFA2E5D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 08:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrxgJ1jgFz2yyT;
	Mon, 10 Feb 2025 18:54:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739174076;
	cv=none; b=dwRU8dmf4RFOLa69kkV26x3rZyZkbfzhlLvir6lsn0EgymHZcR5OasCcsrujTZGkd/WzRrRBZ0xTovWrlLH6/YIEW6wnk90zK8xUtZxV8L/uSQvG4VH2lyNs4Y5H4Cps8UvD2aTbw0FQ37UOIANyNoMHpEPMzqcZq1b4/IyBqfp/diZzLM5IBtgB4RrsXwNc7X7v+g8aGR3SRuT6S6BMKgDVw7yGl4tqnurlizPyNmCOQGW5qgsYo18pinv/+XIjbjw4/GoM5ibz0qJdnT5rqoFEEWewpvqejHZ9CzywmeaXMEYp57YYaEryNzCIMUkipGjBEWoF9SipjpdEq9mtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739174076; c=relaxed/relaxed;
	bh=6QVuU+Pj4WW7p8VfYDhUhfStFdnghuMaJHmBwZ02Z5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG8GA82mTOCdAi/wwVzg8JzZtW4SjWPK3OB7sO2zXSNkABayCKYWVkVmDeWlo1wASEaLLDK0v50/P4/kHnEPMEom45tyvZ690mV7hgwlIQezSduKLmrpJZbpAxQ1g/30lIexQr0vcuNk8Cr3DCwcsyRPMFuiM7b03ZwJhCnsXSgXPliw76H1/ysiiK6E9YZMvf4Ge6EAnDhKB7OzendnY1eqVP/ohAf0RShLYgUcxDK82rNWz9lwGbzmNPCFohqEqLyt2fQZKVJ1ejmaM9FnJ5oFB24Yl6tWFs8R3Qu46LRrvYJaiPR1rdKxgpipAqNLo3PCggUyQZiAMXI9Q58mzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.45; helo=mail-ua1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.45; helo=mail-ua1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrxgH24Vmz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 18:54:34 +1100 (AEDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8670fd79990so638250241.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 23:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739174070; x=1739778870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QVuU+Pj4WW7p8VfYDhUhfStFdnghuMaJHmBwZ02Z5o=;
        b=PLCVwslXbW8jZqWtYx2CqD4nWf9JwnB92pgOE2Y4NSPLY7ha5yw3iNYKNxbsuJmpgY
         /CHdHj53GNAyykQFzXo0xi+H18mJZV1JLv339Pq7LM/YgUI4sjiXMUcIrDXghEvG/nF/
         18Q0Vwi8Otq8B3fujMeXt1syF8+J053vt4GnMaG9QZIsSIXOmOfwuu0uPxiegUOx+XLR
         LvyIFS3Vy7vwBPCY1qNLsm0Q/Cib7xnd0SH9RKXtMRM2UcTBKbUTew9Egwfsxi0PcNM9
         ZX921acmMDm5q3YxD+8cMWswe1t5WUYscL8/PWM8AmdptKkFKJbQwxPU1q4I93aCU3Pk
         pfTg==
X-Forwarded-Encrypted: i=1; AJvYcCWGKcmWBamZV1JCgjtG99UjtqLCXRsSI2rLsuVhWaZ8q16JmVPYkzVxhn4vvCjo0t6FKGmzfRKpqlY7fFg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkK5jKKlRVQpnnFuQug48mwd/IhvhUeFOzTyb6FW0CA59XBpDx
	8XNwzhmsfrWhkzQG23V1AQ8ipdUNblQKTCZbflMGQV7kb9CGozQ6AEHqdqHU
X-Gm-Gg: ASbGncu37C8OmvWJ7ZoCRtbkOSTssp4/Z2vDjlIlf32D9EvVDgbEt1wDuiqBYxbxMCd
	5uaI3Wh+MlD+qc+BBBTooL0FqXnK0aGdb6ao1mDsUMzuamcrH7+9vaJS8FWRgArdQ4xoHMN+u0p
	55rk+i5YQ+0feM77dVTtfJtpyWnWClrhp6jOopBIcnItXdm9fubBbyL1tJ4ghaN96r0vg6rMAWF
	3+Rf0lGxw0dXy8LDkirOQQxVu6XQl5uFiI2COjNeRqsoUfEnIDUkctTfC1WVcraJK8MujOr7SeE
	l4rErbUR0lewxzI+VXsWOzxxPnwUwHgksO4q5esA3DYRapuhZxUCLg==
X-Google-Smtp-Source: AGHT+IGyFB69s4dMmsA6b8fHXghQincwUsGUTnvLWnghgAz2Xw3pIENpBsrfwCyR7jWd2nz4O2drKQ==
X-Received: by 2002:a05:6102:304e:b0:4bb:d7f0:6e65 with SMTP id ada2fe7eead31-4bbd7f06f3bmr269669137.2.1739174070313;
        Sun, 09 Feb 2025 23:54:30 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d922csm1586654241.22.2025.02.09.23.54.29
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:54:29 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b68cb2abacso942540137.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 23:54:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOaOKAkzHp+T6Fb90ANxpbRomSgZ0+iC3hzhhNWRTVyLOA+hEYqAVxBbC6BGkk1D2ehmOvQY3QBIOrDbU=@lists.ozlabs.org
X-Received: by 2002:a05:6102:41a0:b0:4ba:7b06:7e68 with SMTP id
 ada2fe7eead31-4ba85f54226mr8216593137.23.1739174069469; Sun, 09 Feb 2025
 23:54:29 -0800 (PST)
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
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <Z6eaDuXnT_rjVSNS@thinkpad>
In-Reply-To: <Z6eaDuXnT_rjVSNS@thinkpad>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 08:54:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
X-Gm-Features: AWEUYZm5Xr2vD3ubUCPEj8UL7Ai7XR-3LWBLYpLEYOvMDEsJZO3nw3gZxZYFUGk
Message-ID: <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Yuri,

On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > On 7/27/24 12:35 AM, Shuah Khan wrote:
> > > Please make sure you aren't taking away the ability to run these tests during
> > > boot.
> > >
> > > It doesn't make sense to convert every single test especially when it
> > > is intended to be run during boot without dependencies - not as a kunit test
> > > but a regression test during boot.
> > >
> > > bitmap is one example - pay attention to the config help test - bitmap
> > > one clearly states it runs regression testing during boot. Any test that
> > > says that isn't a candidate for conversion.
> > >
> > > I am going to nack any such conversions.
> >
> > The crux of the argument seems to be that the config help text is taken
> > to describe the author's intent with the fragment "at boot". I think

IMO, "at boot" is a misnomer, as most tests can be either builtin
or modular.

> KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to

I think distros should start setting CONFIG_KUNIT=m.

> boot-test bitmaps. Even worse, I'll be unable to build the standalone
> test from sources as a module and load it later.

If you could build the standalone test from sources as a module,
surely you can build the converted standalone test and KUNIT itself as
modules, and load both of them later?

> Or I misunderstand it, and there's a way to build some particular KUNIT
> test without enabling KUNIT in config and/or re-compiling the whole kernel?
> Please teach me, if so
>
> Unless you give me a way to build and run the test in true
> production environment, I'm not going with KUNITs. Sorry.

FTR, this is why I've been advocating for making all tests modular, and
for not letting any test select (possibly unwanted) extra functionality.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

