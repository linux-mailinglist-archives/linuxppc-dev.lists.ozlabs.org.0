Return-Path: <linuxppc-dev+bounces-6066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF8A2FC93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 23:02:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsJTl3kJLz304s;
	Tue, 11 Feb 2025 09:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739224955;
	cv=none; b=Zcrsi0iTXCmvZBkfDWAMpBOLQ07Q/vsEZNf/4F99NqMV4oKfjoI75aQ3FAApq1JchQxiFZMfj447ravxg8hGFm+GNvdtli24a/oKljqwRb434QINenbeoTYtQ9acHGKmz2SX4WotqZOqtN3rdq9Q+NITq+hJMiEFntgbo4Ha2j0TwIMHnVL48+r9ACOfhdtQ2i2cerMFwLl/OCDJgDTkw1P8vxANv9LfJz+tsDwgJpoUyfHm27rhCmLdahC0XIoq75Q25HcOWgfNpVzpWNkG+nk2EKckCY9khYl4G3j88g14duDsO358Lgd/6jF83m5GSqkhWGjRxLK7WU9S82LX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739224955; c=relaxed/relaxed;
	bh=gKBtxPY73vUN0je5NCWLQ8BOv+4GXPrXFhu2CsOugcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bB0Xcd24pFNbmujZF46Ajbrtgxb0DWOmonsYVu1/6x5ZviyGLpI3TvyzHdLuDFf41tWZ+a3apBtjTRp+K3o5RZd719kikdolWM0gHavsqitQKjwT+XowqPnWjjF6Pnhbh+Yr9y5Hlrleal6hTA42nHgsAwYvWMjSAaX7+kUxXBeTYBliYdi5PoODQrE6/JEJSHVGoD71/9Hxtgkwmmn5pR9rDMVGErG+NqmzPbPUFwP55GW9ROkQsGj84y/N3+V658wy7XFIMxja9h1laehGLaaMFSyvG9f48MSH7X5iKmtUtszowNrqvfkqLLOUigvMDWkxut/tE7bN8BujdwrVeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N7k4jIrg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N7k4jIrg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsJTj4GWrz2yNt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 09:02:32 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30738a717ffso44599071fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 14:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739224947; x=1739829747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKBtxPY73vUN0je5NCWLQ8BOv+4GXPrXFhu2CsOugcw=;
        b=N7k4jIrgbIN+JtEnJd6ybA4BcTvlA3gFOxeSKTF1hEZTn1dn0Eypw50xpYYD+ogn12
         iSo7W+82Oyv5+MF+OFRaodH9MrcC7gUtX9HEq+8kjUQjw66hJq0dfAkjyHQY7Cpkqq40
         rDoKAkS2MVEQxk2RNCLZ+ViQj9lSvjblSvchAlbqL/yOCX8a96G1LzCKXDhkRS2cx0Pv
         SMSuBhzFPznGvtztzPClWaFaUiZiO+gAwvoZqkLF6vezRIuQbDoJ4ede1c/CVUlUu+Jo
         VwlGkCS+M6i0K33885NTxw3DQruiRthjlLtkrt8WYQ1QRf+oxpB2E88yJ3+DapzVdZ+U
         ahmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739224947; x=1739829747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKBtxPY73vUN0je5NCWLQ8BOv+4GXPrXFhu2CsOugcw=;
        b=HaZen5Q6QOv1wUINHVMaSmw0oRkGZaTmU9YpTPb4uLhaVzhsemQ/K3HCGJ27GkXOJN
         scOxJfcx6VnkEN8EhGBxmqVXVVL40ZLbSqDf+8imj1qoIOpl25LBFOj3DdO6i0akKy4p
         OPnFQu8cyn6LjBv95c67kjXi7SKEl63ceIaD24EGHqqVdDSYmaYl4NrxxtF23dA8n6dn
         Q/YJ/N9n3ehxJl9tP72Z++IRlvjjVXUPZYuXtCIEs8ClFONAEMNNeUO6zkF/ZMAfCdFi
         HKlU8bYBVGCluMULvWn90Vv/kuCQLvah7xSICI070kfRZJ96YpEFPlYl87Xk0C33Oyql
         K9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDPXbMmWbaIw6dKrYYIduLQmriFPf/uGAA78XE5NINfvTvPLDA5H+UD0hB/3CpApUyRcaFquArrbXhwAE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6UuB3esIgiLQrGjmxY1YFyHoXOOfzEfh/joooRYPou0RT+i/t
	7k9g1IG7CzG5ImN33mx7mxEKqpJFv/Fl8m/LqxTzOVKJ6AvyPB8LEzCQv9kd6a0o8nXloazMU9g
	Zj4NYfxsRH7mtXxZXhJ9EqF4dzRE=
X-Gm-Gg: ASbGncsDBMGIS0Ex0v29+LjvAP6elxGI6vctk004umctB5qJ2zPYl0TG8H+QSQrWwSH
	fP67Bw49NkLc9L7+p2+/e2kNRTZz4tqurSaR94jg9AuPvkvuQdMmzZ1ZqhuDS+PuTGzSbkDDcW5
	yAemSW9PDAvq9C
X-Google-Smtp-Source: AGHT+IFXntGT+FjS//GtLsBee13n1feXxAcsDFdmGK/9Zc8xT57kBWrr/KSN97XqSWCXZ4WJpptogalCw+FV21qYtDM=
X-Received: by 2002:a2e:a5c8:0:b0:307:e498:1269 with SMTP id
 38308e7fff4ca-308f83eafa5mr5428921fa.37.1739224946736; Mon, 10 Feb 2025
 14:02:26 -0800 (PST)
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
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad>
In-Reply-To: <Z6pfomw-3LuWoQQo@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 17:01:50 -0500
X-Gm-Features: AWEUYZkKe8CssbPTeBnqdSPds-hBj-nYrF2armsMtC2A_9bwIn2Ly57bR0J6s5k
Message-ID: <CAJ-ks9nCsCfuayotpqgNytHAZ758w2oSU58dEDMXwQRU7vqisQ@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Gow <davidgow@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 3:20=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Mon, Feb 10, 2025 at 11:35:48AM -0800, John Hubbard wrote:
> > On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> > > On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> > > > On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > > > > On 7/27/24 12:35 AM, Shuah Khan wrote:
> > ...
> > > > > The crux of the argument seems to be that the config help text is=
 taken
> > > > > to describe the author's intent with the fragment "at boot". I th=
ink
> > >
> > > IMO, "at boot" is a misnomer, as most tests can be either builtin
> > > or modular.
> >
> > Right.
> >
> > >
> > > > KUNIT is disabled in defconfig, at least on x86_64. It is also disa=
bled
> > > > on my Ubuntu 24.04 machine. If I take your patches, I'll be unable =
to
> >
> > OK so I just bought a shiny new test machine, and installed one of the
> > big name distros on it, hoping they've moved ahead and bought into the =
kunit
> > story...
> >
> > $ grep KUNIT /boot/config-6.8.0-52-generic
> > # CONFIG_KUNIT is not set
> >
> > ...gagghh! No such luck. One more data point, in support of Yuri's comp=
laint. :)
> >
> > >
> > > I think distros should start setting CONFIG_KUNIT=3Dm.
> >
> > Yes they should! kunit really does have important advantages for many u=
se
> > cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the mai=
n
> > obstacle.
>
> Hi John, Geert, Tamir,
>
> Can you please explain in details which advantages KUNIT brings to
> the test_bitmap.c, find_bit_benchmark.c and other low-level tests?

I can try, but I'm not the expert, and David Gow can probably elaborate fur=
ther.

As I understand it the main benefit of KUnit is standardization and
speed (and standardization _is_ speed). KUnit makes it very easy for
me, a person who has not previously contributed to any of the bitmap
code, to run those tests, and it requires zero configuration, it all
just works. It's basically just `tools/testing/kunit/kunit.py run
bitmap`, and I get the test results in a human-readable format. The
same benefit applies on the author side: test facilities are
standardized, so once you get to know the tools, all the tests start
to look the same: you can jump in and contribute without having to
first learn the so-called local "testing framework".

The important part is that this all applies to ~all other tests
written in KUnit. I can even run them *all* trivially:
`tools/testing/kunit/kunit.py run`.

Anecdotally I've also noticed there are bots running those KUnit tests
e.g. see https://lore.kernel.org/all/20250207-blackholedev-kunit-convert-v1=
-1-8ef0dc1ff881@gmail.com/
where a test I converted was immediately flagged by a robot as having
dubious type coercion.

None of these are must-haves, they are just (to me) a nice way to make
the kernel more approachable for new contributors.

As for pure benchmarks like
find_bit_benchmark.c and
test_bitmap.c::`test_bitmap_{read,write}_perf` specifically: I believe
the benefits are super limited or even negative: AFAIK KUnit is
designed to generally suppress output (in the userspace reporter, not
in the kernel) unless a test fails, so I wouldn't hurry to use it for
these.

> I'm not strongly against moving under KUNIT's hat, but I do:
>  - respect commitment of my contributors, so I don't want to wipe git
>    history for no serious reason;
>  - respect time of my testers, so no extra dependencies;
>  - respect time of reviewers.

These are valid concerns. Certainly the testing case is the most
compelling and folks are clearly interested in lowering those
barriers. I don't have any influence in this area, but I am grateful
to John for starting the conversation.

As I mentioned in the previous thread: I think we could keep
`test_bitmap_{read,write}_perf` in test_bitmap.c and get the best of
both worlds. WDYT?

> Tamir,
>
> If it comes to v2, can you please begin your series with an exhaustive
> and clear answer to the following questions:
>  - What do the tests miss now?
>  - What do _you_ need from the tests? Describe your test scenario.
>  - How exactly KUNIT helps you testing bitmaps and friends better?
>  - Is there a way to meet your needs with a less invasive approach,
>    particularly without run-time dependencies?

Hopefully I've answered these above. I can include some of it in a v2,
but perhaps the general pitch for KUnit is better placed in
documentation or slides from a conference?

Cheers.

Tamir

