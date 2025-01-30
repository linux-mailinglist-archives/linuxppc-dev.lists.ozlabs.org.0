Return-Path: <linuxppc-dev+bounces-5711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48570A22DB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 14:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkKY60M3Hz2ymg;
	Fri, 31 Jan 2025 00:26:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738243578;
	cv=none; b=U52C6I34Ir9vkS7vuqxaytj8s3k+Ee5aw+NeEPpAAbITHwQfkjji1Ehyzgl3vjrk/fwWhWi35HB9rQbAu846igMY6U5NF5hpOj4ZkYghxAKlvBEDVhI79xNG2GX696PogeBogQ9hhGIkj2e2NeIJqqNpqVWO4HG5S1MyHkp1wGiUGnSFIkLXy8TVS5ElHODfPmlxtUgnlZf4oMIdLmtHqyrMxXgWOxwDNtsMkK4YaagRdMV6qhgVnbQ+Es7v8iTb1iL95trIZUm/BKTNA6/uaAwm2GGc+lfO/tBBcMoqnbTsSL6EFB/WV1mW0p9aJwoxRMWRpNdaIadosPhzUY3yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738243578; c=relaxed/relaxed;
	bh=RcnCdea0Cg2xhZ905GiM0LEi2fn/A0TJy6vLZwAFU5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1HI4HeciuvJqf0Ulyl/W4eEqo/OrQpKfVdxbLEweYiRcySS5B0R+yqBjRFwE23BoNWpBrTlSLlNGsyns/oateC4gngk4ECeVDXktK4XN/+Hi/Hjtw+zX4jDRe4Y65ExbpVfBkRZH8YDlob7TOy+hLH7gK+W02GCY1vCPA4/NFs9KENDhROh5DAae7BzOCOPFllF8MhE4kWYadZT9WjdXISdC2408MyoZLPJIFZwtroOFKVG8EdytOtLPsvRkOS9VrokPXcSErG5We8ZaERDH9yaWSjAxzmdDj+rZKnFljWd4VrkJyzhxIbyaNy7ZhTyBoIKipyIB1FlXUjyOKfVcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.49; helo=mail-vs1-f49.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.49; helo=mail-vs1-f49.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkKY44MJ1z2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 00:26:16 +1100 (AEDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afde39e360so222990137.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 05:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243571; x=1738848371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcnCdea0Cg2xhZ905GiM0LEi2fn/A0TJy6vLZwAFU5g=;
        b=XFQjZzyvyqgjQ6DmyGKn2INckP0nI3591XWKEDcbydQ8ai6YPeDBKGeTz2KsBYx6Ix
         xp5/ZuD8xJPpDF5UMCxq8/+buHEPrFcgelmsmlrU3L/uaBB+76hr/uihTEZFTUdKLTsO
         bBauewPiPHrr1Y9dJxBXeuBvdtNC255pRHB4ZCEvSuUO829H/gBG2rO2gGHt+5rUlcmT
         VAT+nIWrcjZub0SNr09OgErYV8MlabC+Cg5zxYM8fQlEqdzOrbxO5USfXOOZuDM5KOP8
         dATCOHsQpkQxzOOfaHNSALfwTxb+LKteImd4NtXfpTaGvQKGKsrjD1I0DilrVHrnwcJ5
         nDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz3UuDMuy1HUJmNoGR28MUi/zy8FdD+M+4JICGrHaVFfCr69+ZmkMT0CMM0oaDA60Oo4rgsGcnGQ06Hfs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNMD0Cp8S7yJgcEIegGObnUVs9/N3hJSiW1l2kwfMPKrPLZb1I
	ksBDz1+mwUruzHOLxLeU1q4fuMs2UMZk2eqfWgfRdt9zAWJGDVUF4HfJlkjW
X-Gm-Gg: ASbGncvJKNw5F56Ogu6wFkB5D/QqNp4TTPB9PORfrI+VVdo9WqCsxKOu4JTVu/dXP0R
	jzTwVQx/RdF7SSHJVt37qozDMvK2kleJVYYJTS6k57ba5+kEcbCXUaZtImSa9joY58x4EfP0k4W
	WFYqkGXiWNlZ6qoVmd6YPOdV1SKW1/G3P538/imNWLq9uIBdQmnmP1ikXJ+ZLPqpURrCnt0VWeY
	uz3TiS7lADP40fadRHUWJ6Ns28GFqrzKS/ldT/ysmFM98i9qTExfeKPEqvZvsdR2u9OqCpNWgPj
	4Py6ak07ZlRr5RMnakn4MMcdGmD8hjK2KeSwBAO2cUwRcsI+yg3OmQ==
X-Google-Smtp-Source: AGHT+IEh5vYpwpkKRxQfOBiHVG+H99Q6ORpHbn2aCOc/yghl9LWURCuG4WVa2Scc2PoY8W/9O3xOGQ==
X-Received: by 2002:a05:6102:5f94:b0:4b9:bc52:e050 with SMTP id ada2fe7eead31-4b9bc52e316mr749431137.2.1738243571075;
        Thu, 30 Jan 2025 05:26:11 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa8e803sm214940137.10.2025.01.30.05.26.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 05:26:10 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afe70b41a8so259899137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 05:26:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZW0i49Re8/cmFjU2oIQx5Ede7LI3loVm9HWERH4jHw4sGXGmzag3ffp0ChHnP85G8Bhd7F8w5ThwTi/s=@lists.ozlabs.org
X-Received: by 2002:a05:6102:2ad3:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b9a4f499c9mr6186530137.11.1738243569336; Thu, 30 Jan 2025
 05:26:09 -0800 (PST)
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
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com> <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
In-Reply-To: <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 14:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
X-Gm-Features: AWEUYZn0su9wB3Rua7xZlN_jsLurJgHhePP-DQxZFLycHjingwrtS3E5xZdT-fo
Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Liam,

On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > I've never used the kunit testing of xarray and have used the userspace
> > > testing instead, so I can't speak to the obscure invocation as both
> > > commands seem insanely long and obscure to me.
> >
> > The long and obscure command line is a red herring: a simple
> > "modprobe test_xarray" is all it takes...
>
> That command worked before too...

Exactly, great!

> > > You should look at the userspace testing (that this broke) as it has
> > > been really useful in certain scenarios.
> >
> > BTW, how do I even build tools/testing/radix-tree?
> > "make tools/help" doesn't show the radix-tree test.
> > "make tools/all" doesn't seem to try to build it.
> > Same for "make kselftest-all".
>
> make

Where?

> Or look at the make file and stop guessing.  Considering how difficult

There is no Makefile referencing tools/testing/radix-tree or the
radix-tree subdir. That's why I asked...

Oh, I am supposed to run make in tools/testing/radix-tree/?
What a surprise!

Which is a pain when building in a separate output directory, as you
cannot just do "make -C tools/testing/radix-tree" there, but have to
type the full "make -C tools/testing/radix-tree O=..." (and optionally
ARCH=... and CROSS_COMPILE=...; oh wait, these are ignored :-( in the
source directory instead...

If these tests are not integrated into the normal build system (see
also [1]), I am not so surprised the auto-builders don't build them,
and breakages are introduced...

> it is to get m68k to build, you should probably know how to read a
> makefile.

Like all other kernel cross-compilation? Usually you don't even have
to know where your cross-compiler is living:

    make ARCH=m68k

> > When trying the above, and ignoring failures due to missing packages
> > on my host:
> >   - there are several weird build errors,
> >   - this doesn't play well with O=,
> >   - lots of scary warnings when building for 32-bit,
> >   - ...
> >
> > At least the kunit tests build (and run[1] ;-) most of the time...
>
> Do they?  How about you break something in xarray and then try to boot
> the kunit, or try to boot to load that module.

If you break the kernel beyond the point of booting, you can indeed
not run any test modules...

Which does _not_ mean the userspace tests are not useful, and that I
approve breaking the userspace tests...

[1] https://lore.kernel.org/all/CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

