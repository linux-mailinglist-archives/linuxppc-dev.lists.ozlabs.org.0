Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F478FBA90
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 19:35:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jv9+o7Aa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtyRR3MSFz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jv9+o7Aa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtyQg4fp4z3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 03:34:50 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52b8b638437so1523584e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717522486; x=1718127286; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSAsMIUgpkuY+akx1I0POUHLWSTt61sSZO6HEcvaGx0=;
        b=jv9+o7AaBLVV+QicGZV1ordx2Knrv/+tihdzo0V+8huzPSUt8tGXRWBLI64G/ydcEP
         RP9Ua60vQO6r22eRH6UPPBkjYzhroMoVs2QBJoLIZidcP0GFexmHsAPSJmyRnAI0inFY
         G9dmVRXGUMBcGFBPXXEIF1nba4LTFCCBtfSdLic7wxwq5SAe4jUWMY8obRxNpVwqpIms
         f7Z0ByDDbIsfyMRWJ966NnpHCwmh7T7sZw4E38/cSxGYSVLAVSyyGfLnTSe2J0IjFK/2
         N3E5HYo3e+t1V9UCAOZ/KAfg3giGh1W8xpfZ2mmBUhAktGYerEkIvSnOgVV9biyj3hYT
         cLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522486; x=1718127286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSAsMIUgpkuY+akx1I0POUHLWSTt61sSZO6HEcvaGx0=;
        b=uQTqoGTx6WhkryS7isIIWR+/6EGnvybLoReCrNoX+x7n9hBqPbsdLEvzAVEMm4Rt1o
         MEd5lhqHJATYEpSE1OZ86fBGpcz6XvTMLrKh54OvsfqTjpOe+j7eCdHJmeJCqNiydiCL
         0fgpS56aSLzfPdMnhbisd5ynuB9xeuV7xu0fmKHpO6OORQv7vkgdBMWxzq/lXQ4VPtk7
         0FOKMEeabYoNA/rjgD9JYAB1e4wcOJKNZAOApXhVbUHIvpn82liPedqXQn6H88yfHFYJ
         15OMa2oiG+iamrZcgs4eHAZOBRoy5E61b/b5hxFOjGoR5GiUqbCTdAveqgSL797l7AeJ
         q2NA==
X-Forwarded-Encrypted: i=1; AJvYcCVDrgqyKbLF9snQWZMyQPci0FcOtYmp3zneYHAD0hUJwQnDPiH5k++2whjC7KiRxjCtA3ZXgwXwLnBkFI+YtkMnL0P2Ood31S1CqvALYw==
X-Gm-Message-State: AOJu0YzBh8oPJgOKUv/XGz6ELqfU+0EHMsberIMjIacoMXXmlI1ox09L
	YrJCsRpEPFJ1kCeo4/pck7CrESQ86VjQydpk/h31rTxMfcZT/f2qhWsvdjvrNmA+0+84vb69qMi
	Jgm2FczMFpEJ5skzbCB1yoUM4Nujhz4iaFyjr
X-Google-Smtp-Source: AGHT+IHW7hvfcVnmpj1/QggPMRaKYlE7gegvyFwo9KyDFTK+obmZomYA3kKP97Zw+Ic1XOVGi3IkSE+oKfX0RqFKMmE=
X-Received: by 2002:a05:6512:3da3:b0:51f:5872:dd8c with SMTP id
 2adb3069b0e04-52bab4e8a85mr148583e87.39.1717522486012; Tue, 04 Jun 2024
 10:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
In-Reply-To: <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 4 Jun 2024 10:34:07 -0700
Message-ID: <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yu Zhao <yuzhao@google.com>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2024 at 10:19=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote:
>
> On Tue, Jun 4, 2024 at 10:12=E2=80=AFAM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Tue, Jun 4, 2024 at 4:45=E2=80=AFAM Erhard Furtner <erhard_f@mailbox=
.org> wrote:
> > >
> > > On Mon, 3 Jun 2024 16:24:02 -0700
> > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > >
> > > > Thanks for bisecting. Taking a look at the thread, it seems like yo=
u
> > > > have a very limited area of memory to allocate kernel memory from. =
One
> > > > possible reason why that commit can cause an issue is because we wi=
ll
> > > > have multiple instances of the zsmalloc slab caches 'zspage' and
> > > > 'zs_handle', which may contribute to fragmentation in slab memory.
> > > >
> > > > Do you have /proc/slabinfo from a good and a bad run by any chance?
> > > >
> > > > Also, could you check if the attached patch helps? It makes sure th=
at
> > > > even when we use multiple zsmalloc zpools, we will use a single sla=
b
> > > > cache of each type.
> > >
> > > Thanks for looking into this! I got you 'cat /proc/slabinfo' from a g=
ood HEAD, from a bad HEAD and from the bad HEAD + your patch applied.
> > >
> > > Good was 6be3601517d90b728095d70c14f3a04b9adcb166, bad was b8cf32dc6e=
8c75b712cbf638e0fd210101c22f17 which I got both from my bisect.log. I got t=
he slabinfo shortly after boot and a 2nd time shortly before the OOM or the=
 kswapd0: page allocation failure happens. I terminated the workload (stres=
s-ng --vm 2 --vm-bytes 1930M --verify -v) manually shortly before the 2 GiB=
 RAM exhausted and got the slabinfo then.
> > >
> > > The patch applied to git b8cf32dc6e8c75b712cbf638e0fd210101c22f17 unf=
ortunately didn't make a difference, I got the kswapd0: page allocation fai=
lure nevertheless.
> >
> > Thanks for trying this out. The patch reduces the amount of wasted
> > memory due to the 'zs_handle' and 'zspage' caches by an order of
> > magnitude, but it was a small number to begin with (~250K).
> >
> > I cannot think of other reasons why having multiple zsmalloc pools
> > will end up using more memory in the 0.25GB zone that the kernel
> > allocations can be made from.
> >
> > The number of zpools can be made configurable or determined at runtime
> > by the size of the machine, but I don't want to do this without
> > understanding the problem here first. Adding other zswap and zsmalloc
> > folks in case they have any ideas.
>
> Hi Erhard,
>
> If it's not too much trouble, could you "grep nr_zspages /proc/vmstat"
> on kernels before and after the bad commit? It'd be great if you could
> run the grep command right before the OOM kills.
>
> The overall internal fragmentation of multiple zsmalloc pools might be
> higher than a single one. I suspect this might be the cause.

I thought about the internal fragmentation of pools, but zsmalloc
should have access to highmem, and if I understand correctly the
problem here is that we are running out of space in the DMA zone when
making kernel allocations.

Do you suspect zsmalloc is allocating memory from the DMA zone
initially, even though it has access to highmem?

>
> Thank you.
