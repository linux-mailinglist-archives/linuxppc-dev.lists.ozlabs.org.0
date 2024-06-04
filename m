Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA48FBB04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 19:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=v+Lqm+ZJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtysy1t94z3cVx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=v+Lqm+ZJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtysB2fmNz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 03:54:21 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso2241a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717523658; x=1718128458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvjvNFsuZm1XCxQL706IG6zhzQH06/KtKZ39FICaL2E=;
        b=v+Lqm+ZJ9YApgmlXviVNy8Uhp7xItYOAiHwCnYtEDKcnLRKkrMElc7P/L5+Ii4xiVZ
         xQYB3d8Kvmw4bD8fguA8ZwE+UZbdoFeBBEDZ5vXdBqHpzg9+Fa+tPau+S5W5Cnx5aicb
         e8RfrfWwLnnqAFXxndlsCeEuUBNH9oWOhrrC362APNo4BrbO6NmLkM08cxRBsfHd8oyD
         ahWPC/1tqx9/1CEiWQtkVe8wsRpm9kebKbVI5DEhqfIp6FQyq7N1AFXV6ZXUmppYvwbv
         bzCrGnbvp5BnfSxPtuJQTqDSIvPOzBbvXcHrBLYmVdGi7DsUYyB25h3m2DkPMnYTFYPb
         HXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717523658; x=1718128458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvjvNFsuZm1XCxQL706IG6zhzQH06/KtKZ39FICaL2E=;
        b=PzjpZx/N4L7Gdr2pdq2deOjE2i77achWgG0sHEhFjj3GBMDuVbWHoxSAOodlz0ENB7
         +kc9O2g8SPxqyX6Cx2dqJbj7dO13BjvHSLykeZ0TIbmtSjTMBLwDbuE3q85XfHxwDx4m
         ipJVTpq2lzH/1WNmw5cUnkeGjfW40rh7bS1xgLoJRyHVQC1SxAXfzO5Y3sy3HlTdXkYS
         DgIvVi5VNGHT5PkgTPZzC3vKipg21FR/qLvRVWTo9nv9zxpP9L28W9NvLqQOnG86/9nX
         TN9tmmAwVlt8Ib5z15KNVJOC7VHWm2481fB2lSKVuNSiIbb5/OXbbhjtwwnTMFXLGxo1
         qjGA==
X-Forwarded-Encrypted: i=1; AJvYcCWzY9FMurnodlunNYS0oRVVXFUfvtnA0U2JYbo7ehqjm9lw3aGX/svGlUFZTvydKFDO0xW8jY6G5RyY6N/vx/yKB9NG653sF994V1aHOQ==
X-Gm-Message-State: AOJu0YzvBP6wVpL82GNcqtw/3wYp1MLJ5ltX1qMzSUFxFpLJ2vTts1nE
	gX8Op8VtOh4BDCDT615BtQroPRDVqdGqwqEifLbs7S6hVf5JgjlPsYoO8DEylrlwoeYX6xt9+38
	splDdTH6qtFQj+CR1dcJalUfNddsQzmOA3x0c
X-Google-Smtp-Source: AGHT+IEqQH4VcW+bet6kw3ahjQXxsK9cW/QD3nBI7Uk5BIGc4R3Umj4HZMjvuIihX6oNv84m9DLjuGyDpzWWY0nDRIs=
X-Received: by 2002:aa7:c245:0:b0:57a:2276:2a86 with SMTP id
 4fb4d7f45d1cf-57a8d6e48c9mr2045a12.4.1717523657843; Tue, 04 Jun 2024 10:54:17
 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com> <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
In-Reply-To: <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 4 Jun 2024 11:53:39 -0600
Message-ID: <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yosry Ahmed <yosryahmed@google.com>
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

On Tue, Jun 4, 2024 at 11:34=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Tue, Jun 4, 2024 at 10:19=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote=
:
> >
> > On Tue, Jun 4, 2024 at 10:12=E2=80=AFAM Yosry Ahmed <yosryahmed@google.=
com> wrote:
> > >
> > > On Tue, Jun 4, 2024 at 4:45=E2=80=AFAM Erhard Furtner <erhard_f@mailb=
ox.org> wrote:
> > > >
> > > > On Mon, 3 Jun 2024 16:24:02 -0700
> > > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > > >
> > > > > Thanks for bisecting. Taking a look at the thread, it seems like =
you
> > > > > have a very limited area of memory to allocate kernel memory from=
. One
> > > > > possible reason why that commit can cause an issue is because we =
will
> > > > > have multiple instances of the zsmalloc slab caches 'zspage' and
> > > > > 'zs_handle', which may contribute to fragmentation in slab memory=
.
> > > > >
> > > > > Do you have /proc/slabinfo from a good and a bad run by any chanc=
e?
> > > > >
> > > > > Also, could you check if the attached patch helps? It makes sure =
that
> > > > > even when we use multiple zsmalloc zpools, we will use a single s=
lab
> > > > > cache of each type.
> > > >
> > > > Thanks for looking into this! I got you 'cat /proc/slabinfo' from a=
 good HEAD, from a bad HEAD and from the bad HEAD + your patch applied.
> > > >
> > > > Good was 6be3601517d90b728095d70c14f3a04b9adcb166, bad was b8cf32dc=
6e8c75b712cbf638e0fd210101c22f17 which I got both from my bisect.log. I got=
 the slabinfo shortly after boot and a 2nd time shortly before the OOM or t=
he kswapd0: page allocation failure happens. I terminated the workload (str=
ess-ng --vm 2 --vm-bytes 1930M --verify -v) manually shortly before the 2 G=
iB RAM exhausted and got the slabinfo then.
> > > >
> > > > The patch applied to git b8cf32dc6e8c75b712cbf638e0fd210101c22f17 u=
nfortunately didn't make a difference, I got the kswapd0: page allocation f=
ailure nevertheless.
> > >
> > > Thanks for trying this out. The patch reduces the amount of wasted
> > > memory due to the 'zs_handle' and 'zspage' caches by an order of
> > > magnitude, but it was a small number to begin with (~250K).
> > >
> > > I cannot think of other reasons why having multiple zsmalloc pools
> > > will end up using more memory in the 0.25GB zone that the kernel
> > > allocations can be made from.
> > >
> > > The number of zpools can be made configurable or determined at runtim=
e
> > > by the size of the machine, but I don't want to do this without
> > > understanding the problem here first. Adding other zswap and zsmalloc
> > > folks in case they have any ideas.
> >
> > Hi Erhard,
> >
> > If it's not too much trouble, could you "grep nr_zspages /proc/vmstat"
> > on kernels before and after the bad commit? It'd be great if you could
> > run the grep command right before the OOM kills.
> >
> > The overall internal fragmentation of multiple zsmalloc pools might be
> > higher than a single one. I suspect this might be the cause.
>
> I thought about the internal fragmentation of pools, but zsmalloc
> should have access to highmem, and if I understand correctly the
> problem here is that we are running out of space in the DMA zone when
> making kernel allocations.
>
> Do you suspect zsmalloc is allocating memory from the DMA zone
> initially, even though it has access to highmem?

There was a lot of user memory in the DMA zone. So at a point the
highmem zone was full and allocation fallback happened.

The problem with zone fallback is that recent allocations go into
lower zones, meaning they are further back on the LRU list. This
applies to both user memory and zsmalloc memory -- the latter has a
writeback LRU. On top of this, neither the zswap shrinker nor the
zsmalloc shrinker (compaction) is zone aware. So page reclaim might
have trouble hitting the right target zone.

We can't really tell how zspages are distributed across zones, but the
overall number might be helpful. It'd be great if someone could make
nr_zspages per zone :)
