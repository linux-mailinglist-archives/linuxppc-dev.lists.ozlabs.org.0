Return-Path: <linuxppc-dev+bounces-5715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50BA23086
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 15:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkM8w5Bnlz30Th;
	Fri, 31 Jan 2025 01:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738247936;
	cv=none; b=VSFzvyQUa5zhykDabCEHiaAdHCGkhebGqhCvqdiIEIMasIieOaWp7S+wQeLIgTeQySRdiChApX+vKrImXhq0sOcTYFl14UASuDPeqf/KogkokM2fcpHyJ/0ZPabbSi/R7THf3dqiufESFVvML808sgt+XOizxnbSXHR0QPm+pzCyWUeu7GzwI05eaG5UWNQxdR1785aKdwkblvqNPwFhzxraTgCdFOeokNE2SueQ+aDEdsUf28mpWofdho2Nr92CNciOnDqNNjWnjyGMN7EtcGs1o3LRTuT6tzyyTBx2lIwv15PcaI539mtf7XeRmYDp6G8Z0KZcTfLaPBKRXkSxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738247936; c=relaxed/relaxed;
	bh=3koQwFtsYEj+sBiSRxwOt8Kdl4P9BIA497a/eImNeSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ewe5zVfb5X2sV/fEuEP+tdQByVpW2qBIsTwYjueGaDAPDGd/e/NWPND6gOv7ArFD8Sv5Cw3y4SPEAjnpwVTDEhkcm76c75HqT+tcywNNC9DwBUNnWc6swc+G5NCVE35c5xioo541eU9Bjz/KOSCYaw676cZEKXFFD3kZ3GpmsYsPVObB5QJdOSnCnUqxuBvDDTDdBifFWNJODxZOWfvReZ4tsfgBBP5Raq7gZW0BVCoQlbumVRRY41oxL2mLtevLWqJPBkj/G+/nKPeJU/5i/FEblqzdoTEdKTIXbVFnp6bWf6XhPW4pYePsBletv+u5yvXF8vWf5JrRsPXVF1I1TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkM8v482tz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 01:38:54 +1100 (AEDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51873e55d27so499906e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 06:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247930; x=1738852730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3koQwFtsYEj+sBiSRxwOt8Kdl4P9BIA497a/eImNeSg=;
        b=FNrwYZszoDlLmD4zB1RmAy9qVW21KFkmxVY5NnldMC/Nbk7wxiDU+ksfMTOXKPpXkm
         BanvlWF9mc8Ruey9nU0Z67xK0RfvHpmZ1LaMhJY+eJ00J9S2ch2NOHXsG/i/OtfZgvvA
         tSe/hbEWDaQBiIubWdkJi45MRg/BSDHkFGFQ4s7wo6UYE0Daydb/dkhyFYRPr9jhKth3
         +z5R3IO1x+6VUDImbL0M3X2dOlUIi0fjsza9SA15yZJOdk++OjyfTp8zpfyGQeNalzP/
         zcJKYIIxVtjGzlfmE1+xfCjdxD772jtXlPTGBGN++aPjcyGzxsWIjOF9uA1xjTKLl5XC
         xxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXppHu9tGldirUs0hMn6kvq/M8NJ6Y1PGSF2he8YeHB6SsiofMYY7/dYY6j8NGfHJ12bjawswKTLa7z6MY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztEByT6lzvfz/0jmMj6dVvxenmszafaIHgtk2bNMQR9LROgOrK
	u8PoVLzc1lXnHSZhLEUoZi763eEji8HJxa5+en2fSdcs7ETBhf5rBD+EUDJpZN0=
X-Gm-Gg: ASbGncs+s/SJOjIo5en3V4wYGJMCamFGSYH/HaOQbGTNmavEfj2C6XCbQ/uWh5RwfZj
	wFCa2RttmEkxUqAx5qEJGwlmCgPlTbxl/gbDnC59v3uyz2M0JmVGPfedL19qqKMzD2wYoWvYlHO
	oWl0KDf37ADgqRQ4ohlwvm0dXPciZFGcPlX8YdlMkr9XlzCHZ1T/Ygix/HV95d8seJe0gwz6pyA
	tYYi9cZ/rNCgfuKkNu03BU0Go9SBtNGk3SvIqW4EzAJiFFcsZtx4Bkz8DfZi0MFv8j2bMVee7dI
	n8ES3O71LL84HZfYpIXwtR6HdNzxlL7y1JeWJT7dsptyTwwk+LQ1ow==
X-Google-Smtp-Source: AGHT+IEHxkkncCcxfuHwQAC0HiEpKCs43QKdF5qxf7huLmgENihv8CietOcmB0rBNpehyDOiT4pdsQ==
X-Received: by 2002:ac5:c14f:0:b0:515:20e6:7861 with SMTP id 71dfb90a1353d-51eaefd11famr2768853e0c.2.1738247930110;
        Thu, 30 Jan 2025 06:38:50 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941da213sm256016241.22.2025.01.30.06.38.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b9486a15a0so974670137.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 06:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWABwd516SyxQRqGgh1vM5wnxrdqAjGSfq2f19voKQCoiiLvUYe/hMrWYNZx94Q2FEDOw/Rw5RW++v3KR0=@lists.ozlabs.org
X-Received: by 2002:a67:f318:0:b0:4af:d48d:5142 with SMTP id
 ada2fe7eead31-4b9b70f3a0bmr2755704137.3.1738247929070; Thu, 30 Jan 2025
 06:38:49 -0800 (PST)
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
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
In-Reply-To: <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
X-Gm-Features: AWEUYZmOwEzWB0gEceqhOwmudbYpt2s9uwC-1Re-pPG58BUZxS-FmbWZ_JWw55Q
Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Lorenzo,

On Thu, 30 Jan 2025 at 15:09, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Having written a ton of test code, I've unfortunately encountered a lot of
> this sort of push-back and it's HUGELY off-putting. Writing test code
> should be ENCOURAGED not litigated against.

I am not discouraging nor pushing back on any testing code (on the
contrary, I test every single new kunit test that appears upstream).
My apologies if I gave the impression.

> The truth is far too little kernel code is tested to any degree, and this
> is part of why.
>
> On kunit collaboration, I attended an in-person talk at LPC on kunit
> userland testing where it was broadly agreed that at this point in time,
> the xarray/radix tree tests weren't really suited to the framework.
>
> Therefore I think the healthy means of pushing forward with integration is
> in sensible discussion and if patches, RFC patches in collaboration with
> authors.

Good.

> The unhealthy approach is to needle one of the biggest contributors to core
> test code in the kernel on a thread because you don't seem to want to cd to
> a directory and run make.

My initial issue was that I could not find out where that is documented.

    $ make help
    ...
    Userspace tools targets:
      use "make tools/help"
      or  "cd tools; make help"

    $ make tools/help
    Possible targets:
    ...
    You can do:
      ...
      $ make tools/all

      builds all tools.

But that command does not build tools/testing/radix-tree, so I was
completely lost.

> Why is this relevant to me? I am the author of the VMA test suite, on which
> I spent countless hours + relied heavily on Liam's work to do so, and
> equally there you have to cd to a directory and run make.

Thanks for your work!  One suggestion for improvement: tools/testing/vma
does not seem to be built by "make tools/all" either.

> But at the same time in both cases, testability of key internal components
> is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
> coverage, really isolating functions for unit testing, enormously fast
> iteration speed, etc. etc.
>
> I ask you to weigh up the desire to enumerate your misgivings about the
> testing approach used here vs. all of the above.

I repeat: I am not against these tests.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

