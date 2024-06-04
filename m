Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A08FBB3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:07:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LLXwiEcX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtz8b3ph3z3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 04:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LLXwiEcX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtz2V0wYBz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 04:02:25 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3d1f7593ddcso1181153b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717524139; x=1718128939; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHWLGQWisUQj7HhRAw2go4sy8LHyULISrzif4HyJkSE=;
        b=LLXwiEcXa8s0P86kchlCLl1rAHFgjnxV36M63feHBPbWjKoHS9w/BVBGLgniDulHLJ
         RndiO1uuYksEVPtuwY6p36K0WDVCdurUe9GwCEUY2IxONpYgGN3JUelqNAnCf3HpemXk
         TPna7pyicD+aIoDG7cMtO8O/fNL0HvAFyY+pJRiqB4Nz67pavVEDrhQT/PdbqMavLrxy
         Qo6TeScg3hJxemFf80g84kZe2tVaZ2F+DaWksb83GKIQ+KdU/8AR+AVD4XMjj3HdIC1p
         ThaP6gRRnkci8R/Ocy/MtMPmSmUPQpTBFceorxJu2Ek8IVC9T4WCsC9rD58y4gqMaDC9
         464A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717524139; x=1718128939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHWLGQWisUQj7HhRAw2go4sy8LHyULISrzif4HyJkSE=;
        b=Q85GYWXrK+cURAkavcY7iUoY+IrzbsIbsnc7T19S43sR6rx6UKRZLd7WzjRzw7MeXR
         tZcE57+bYopOIZ2KvrJd/OvSY5yqWeK2gk4ZbW8Y6dNTDjvXGTxmjYj6VzQwUflC5hmf
         Rvj/ejjPDl31MV5zBdLMhVUEnpI2C6QQ1xoB0Hg9OM8GFwVmCRTUQC2evjlUrAM6d7nJ
         62g59JdxpNlI+2V2Xv/mtzjuR3mBECaIg0R8zmGVUazH9QYOBuexGDgXlSBMaddcgdjf
         o75Vmzu6Xfn9/cxBXKoseD8GuN/FPK4mZl4vDDS4tV1B46+sJ/yw0hKXLPXdj9u+ghR+
         cQeA==
X-Forwarded-Encrypted: i=1; AJvYcCX1vIEpZD+kPJPImJ0O8mZUwJStKxUx3eQ9CxBmByMRJPoNCpNiSYp7NCbUcN75VJo+1ft2upHmJi8UxoJ53Pp/iAL0UPDtArl0Sg7eOw==
X-Gm-Message-State: AOJu0Yza0Dfk0UDyrji52rKqj4gj8ZMHkfRphODbv2STT04qr5uWlM0M
	36FE6w3Tu5yVvsAu1pYgXZPrM0IxTBdsL/GYorA71yAISFpxckRIf9hgoFJXgTQIxX3amyrdp/6
	HRVi1AvxyEb7rAZqYBMdkfM6TbC5dmFkVSF14
X-Google-Smtp-Source: AGHT+IGLP4t3hL8c6rQwnWojRitsYcXuRXha13VBXTuVelVGnvix3EEiSfqrbr4AO/JmxEnQlMJSjTPnhcgT9+b9UCM=
X-Received: by 2002:a05:6808:911:b0:3d1:d9e6:7ee9 with SMTP id
 5614622812f47-3d20439d504mr112188b6e.33.1717524139167; Tue, 04 Jun 2024
 11:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com> <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
In-Reply-To: <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 4 Jun 2024 11:01:39 -0700
Message-ID: <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
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

On Tue, Jun 4, 2024 at 10:54=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote:
>
> On Tue, Jun 4, 2024 at 11:34=E2=80=AFAM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Tue, Jun 4, 2024 at 10:19=E2=80=AFAM Yu Zhao <yuzhao@google.com> wro=
te:
> > >
> > > On Tue, Jun 4, 2024 at 10:12=E2=80=AFAM Yosry Ahmed <yosryahmed@googl=
e.com> wrote:
> > > >
> > > > On Tue, Jun 4, 2024 at 4:45=E2=80=AFAM Erhard Furtner <erhard_f@mai=
lbox.org> wrote:
> > > > >
> > > > > On Mon, 3 Jun 2024 16:24:02 -0700
> > > > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > > > >
> > > > > > Thanks for bisecting. Taking a look at the thread, it seems lik=
e you
> > > > > > have a very limited area of memory to allocate kernel memory fr=
om. One
> > > > > > possible reason why that commit can cause an issue is because w=
e will
> > > > > > have multiple instances of the zsmalloc slab caches 'zspage' an=
d
> > > > > > 'zs_handle', which may contribute to fragmentation in slab memo=
ry.
> > > > > >
> > > > > > Do you have /proc/slabinfo from a good and a bad run by any cha=
nce?
> > > > > >
> > > > > > Also, could you check if the attached patch helps? It makes sur=
e that
> > > > > > even when we use multiple zsmalloc zpools, we will use a single=
 slab
> > > > > > cache of each type.
> > > > >
> > > > > Thanks for looking into this! I got you 'cat /proc/slabinfo' from=
 a good HEAD, from a bad HEAD and from the bad HEAD + your patch applied.
> > > > >
> > > > > Good was 6be3601517d90b728095d70c14f3a04b9adcb166, bad was b8cf32=
dc6e8c75b712cbf638e0fd210101c22f17 which I got both from my bisect.log. I g=
ot the slabinfo shortly after boot and a 2nd time shortly before the OOM or=
 the kswapd0: page allocation failure happens. I terminated the workload (s=
tress-ng --vm 2 --vm-bytes 1930M --verify -v) manually shortly before the 2=
 GiB RAM exhausted and got the slabinfo then.
> > > > >
> > > > > The patch applied to git b8cf32dc6e8c75b712cbf638e0fd210101c22f17=
 unfortunately didn't make a difference, I got the kswapd0: page allocation=
 failure nevertheless.
> > > >
> > > > Thanks for trying this out. The patch reduces the amount of wasted
> > > > memory due to the 'zs_handle' and 'zspage' caches by an order of
> > > > magnitude, but it was a small number to begin with (~250K).
> > > >
> > > > I cannot think of other reasons why having multiple zsmalloc pools
> > > > will end up using more memory in the 0.25GB zone that the kernel
> > > > allocations can be made from.
> > > >
> > > > The number of zpools can be made configurable or determined at runt=
ime
> > > > by the size of the machine, but I don't want to do this without
> > > > understanding the problem here first. Adding other zswap and zsmall=
oc
> > > > folks in case they have any ideas.
> > >
> > > Hi Erhard,
> > >
> > > If it's not too much trouble, could you "grep nr_zspages /proc/vmstat=
"
> > > on kernels before and after the bad commit? It'd be great if you coul=
d
> > > run the grep command right before the OOM kills.
> > >
> > > The overall internal fragmentation of multiple zsmalloc pools might b=
e
> > > higher than a single one. I suspect this might be the cause.
> >
> > I thought about the internal fragmentation of pools, but zsmalloc
> > should have access to highmem, and if I understand correctly the
> > problem here is that we are running out of space in the DMA zone when
> > making kernel allocations.
> >
> > Do you suspect zsmalloc is allocating memory from the DMA zone
> > initially, even though it has access to highmem?
>
> There was a lot of user memory in the DMA zone. So at a point the
> highmem zone was full and allocation fallback happened.
>
> The problem with zone fallback is that recent allocations go into
> lower zones, meaning they are further back on the LRU list. This
> applies to both user memory and zsmalloc memory -- the latter has a
> writeback LRU. On top of this, neither the zswap shrinker nor the
> zsmalloc shrinker (compaction) is zone aware. So page reclaim might
> have trouble hitting the right target zone.

I see what you mean. In this case, yeah I think the internal
fragmentation in the zsmalloc pools may be the reason behind the
problem.

How many CPUs does this machine have? I am wondering if 32 can be an
overkill for small machines, perhaps the number of pools should be
max(nr_cpus, 32)?

Alternatively, the number of pools should scale with the memory size
in some way, such that we only increase fragmentation when it's
tolerable.

>
> We can't really tell how zspages are distributed across zones, but the
> overall number might be helpful. It'd be great if someone could make
> nr_zspages per zone :)
