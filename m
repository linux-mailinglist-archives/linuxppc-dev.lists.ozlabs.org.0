Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A62EE8FBA23
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 19:19:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lxIOMro9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vty5Q5mqJz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lxIOMro9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vty4h3Rv3z3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 03:19:15 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42152bb7b81so7895e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717521544; x=1718126344; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogohNARcfHl3s69mR1boc+24tgTnFa1tIMowF9fUlWI=;
        b=lxIOMro95cs85prhm+GlkXPjK8LzpYBkKL5QEjFGE2Gj7hR7cKarOdrrlZiA5i6JIV
         oKY3HaqhgKqhMAReVE662zUwpDpoVbYjMDsRfc/WSKhycJKoQyaYxlmXK/nTZ1xEJgCC
         YT3VpDQz/w2X0rnQxlXCNvIR8LHIGORkfVWJw2PdfRXlgAhzLBpV8zzMPysahKUYO8Qj
         oPv3I2RbMxLQWmoV/lGI85H0WV3Qf/iKpFAhz/RvJuob+QyQWdXrsSTqea6rGnZdsgtP
         60hsKmD/hhpfh2lE8joNxMm4gapkwo09xLqLQapNJKEQI/e0GYI32p60haB9ZwhFiUJQ
         li7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717521544; x=1718126344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogohNARcfHl3s69mR1boc+24tgTnFa1tIMowF9fUlWI=;
        b=lbSlHoMmGzE0XHK/n8Ym8Mxfu6D0qTfweR77ol9rgCnqcC08PiraEwInLQ6wpYCbzY
         O43c1Pe5rsKh6CG0oohElVLJnISihDjko0LciqA6TyTwiyzdNnz2E3diFxF5VUTiTwTa
         XIvJm9zXNVLasy8rMGSTqOHksmDuk9gvXprlXLInWtsgxdeypvZ3WNV7dIO6qvQI4eqP
         +8DXr8KxmcKqiJ8/pVG9oQgR9coIhzYcF8YisIw4n2Ay5srerWSY21fLH91Bb8VJFK4L
         S7E3fHqHqNgDOwab2YumFuGYzYvTaMPhLbaZXpyfBVfQrt0dkXL/WEONlU7VRRgblevo
         B2pg==
X-Forwarded-Encrypted: i=1; AJvYcCU1RlRwffxgBQ9qEbHhLVqdoh6qidIz4dXTM1+PbWdRuFopJkhoD3zlmKhu1V/CVYZgk8F797zKgz8Td4uDJYYjtJ2SwZLyAbASN9ZuMg==
X-Gm-Message-State: AOJu0YzvHG6TmxS+8rlQ6ijIkyqtOCLHiEWMqxehU6T3vBJoVeo7HDeU
	FYyQRcAgisGiil4ivG6qafSv9hKmD8uqdRQo8GJz86nWzcGiWFjpRwJGYgZ869ZaA995vkSK8Wy
	ElAcNDilHd8c/HRfLk0UdDR1zAnIHNGFMRkv2
X-Google-Smtp-Source: AGHT+IF5/uJiqqJnXLO0gjralIhLsD4wtNsd8X9tynQYjHW0e86jKHZvA4UnWrB4kknhGZbX7Nkad9V0dBq4mHb1naw=
X-Received: by 2002:a7b:c8d7:0:b0:41b:4c6a:de6d with SMTP id
 5b1f17b1804b1-4214b21954cmr2630725e9.5.1717521543952; Tue, 04 Jun 2024
 10:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
In-Reply-To: <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 4 Jun 2024 11:18:25 -0600
Message-ID: <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nhat Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2024 at 10:12=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Tue, Jun 4, 2024 at 4:45=E2=80=AFAM Erhard Furtner <erhard_f@mailbox.o=
rg> wrote:
> >
> > On Mon, 3 Jun 2024 16:24:02 -0700
> > Yosry Ahmed <yosryahmed@google.com> wrote:
> >
> > > Thanks for bisecting. Taking a look at the thread, it seems like you
> > > have a very limited area of memory to allocate kernel memory from. On=
e
> > > possible reason why that commit can cause an issue is because we will
> > > have multiple instances of the zsmalloc slab caches 'zspage' and
> > > 'zs_handle', which may contribute to fragmentation in slab memory.
> > >
> > > Do you have /proc/slabinfo from a good and a bad run by any chance?
> > >
> > > Also, could you check if the attached patch helps? It makes sure that
> > > even when we use multiple zsmalloc zpools, we will use a single slab
> > > cache of each type.
> >
> > Thanks for looking into this! I got you 'cat /proc/slabinfo' from a goo=
d HEAD, from a bad HEAD and from the bad HEAD + your patch applied.
> >
> > Good was 6be3601517d90b728095d70c14f3a04b9adcb166, bad was b8cf32dc6e8c=
75b712cbf638e0fd210101c22f17 which I got both from my bisect.log. I got the=
 slabinfo shortly after boot and a 2nd time shortly before the OOM or the k=
swapd0: page allocation failure happens. I terminated the workload (stress-=
ng --vm 2 --vm-bytes 1930M --verify -v) manually shortly before the 2 GiB R=
AM exhausted and got the slabinfo then.
> >
> > The patch applied to git b8cf32dc6e8c75b712cbf638e0fd210101c22f17 unfor=
tunately didn't make a difference, I got the kswapd0: page allocation failu=
re nevertheless.
>
> Thanks for trying this out. The patch reduces the amount of wasted
> memory due to the 'zs_handle' and 'zspage' caches by an order of
> magnitude, but it was a small number to begin with (~250K).
>
> I cannot think of other reasons why having multiple zsmalloc pools
> will end up using more memory in the 0.25GB zone that the kernel
> allocations can be made from.
>
> The number of zpools can be made configurable or determined at runtime
> by the size of the machine, but I don't want to do this without
> understanding the problem here first. Adding other zswap and zsmalloc
> folks in case they have any ideas.

Hi Erhard,

If it's not too much trouble, could you "grep nr_zspages /proc/vmstat"
on kernels before and after the bad commit? It'd be great if you could
run the grep command right before the OOM kills.

The overall internal fragmentation of multiple zsmalloc pools might be
higher than a single one. I suspect this might be the cause.

Thank you.
