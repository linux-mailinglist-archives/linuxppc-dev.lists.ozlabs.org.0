Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461341360F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 17:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDQBn32tLz2yxF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 01:21:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d+NekTAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=rm.skakun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d+NekTAs; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDQB75X5Hz2xY2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 01:21:18 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id e15so44068448lfr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=USVqWZAArbWUQLUtDtlQScPgCmgWeWDYUhPzzmzD9cE=;
 b=d+NekTAs6gdVeYOh1ETzFjnosk7b11Jkdp85cE2xaXNQHzds4fG/DaeBvLIWZok/bT
 8zlNB+vm+Lbp7HjZs0gwvcYkuGEzY4rYubjc8U1WV2ZAjOWge59m9LsdytVZhYAyMyh/
 kVUQqPb9S0H0ijHCFY4LkH7mywcT7P6bh7o5IlSwYZH7OErFPJB2l4n+nF1KREawE9Oh
 9pmHHaVkxCTRT5jOSCSHVffxNpywbXL6aTBdOBwwCr58FHR1JN9q9xV+0XT8s4DT/5fV
 iByIBKgKwoPVX0GWHFhW7mS1NofIUrEaPpVKSfuC2qDpTtF239YZNsypjKQ+zQwPcaL2
 R2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=USVqWZAArbWUQLUtDtlQScPgCmgWeWDYUhPzzmzD9cE=;
 b=Wo/dulcHmAhs9Puk8yxRrk0HR8cHNkLbKZWgxQszCg4/CG47OWO+Th++gZI4kXuF8K
 5fpxrSfMLKvNS6tuQo+Dy+a6nIQCaQm46Z7aofufygQaUthRg9UOJCzofZBzUnp/fKr0
 Z38po6jeOe3vR26b5ym4Y4ToXdSRy1l1pRihH634hnhxWbZLsFuodBfw89O368DwIlJJ
 oJQqKJqlsm25d8Gmqt0FFdWT1yMIeEdYjWVmg6QW9YWLASX5bm3FmuOL1QZ7bQrtyhmF
 jfp2zdGbIopsKylt0SvolscKO9s6iZzWIjSiK+Yo/JbV6qutgqMieTV9skEA3KAun37t
 xnPg==
X-Gm-Message-State: AOAM532IhZIrkVQ2ui6/6J3/ly/GIXYgc3vO646q8LNAzj0MW+e2MFa4
 +9j/wvy0IkFbpTmp9gJVKihoYnUdN2DuNekvvUc=
X-Google-Smtp-Source: ABdhPJzthr3WA2wFCeyKG586GKIXPx3EL+AR4pi1b9V0CS7EWWEg72SpC7PGxABChTKUmIl/7el5hhGdi65vVZvbKIY=
X-Received: by 2002:a19:ca03:: with SMTP id a3mr22741135lfg.176.1632237637561; 
 Tue, 21 Sep 2021 08:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
 <20210915135321.GA15216@lst.de>
 <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
 <eb98aeac-af61-0dd6-2052-5b55921746c1@arm.com>
In-Reply-To: <eb98aeac-af61-0dd6-2052-5b55921746c1@arm.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Tue, 21 Sep 2021 18:20:29 +0300
Message-ID: <CADu_u-O-aDk-J4up-UMfjMGi0DJkD6rhePcKdyqzt5750oo-iA@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Roman Skakun <rm.skakun@gmail.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Jan Beulich <jbeulich@suse.com>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-mips@vger.kernel.org, iommu <iommu@lists.linux-foundation.org>,
 Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Robin,

>> I use Xen PV display. In my case, PV display backend(Dom0) allocates
>> contiguous buffer via DMA-API to
>> to implement zero-copy between Dom0 and DomU.
>>
> Well, something's gone badly wrong there - if you have to shadow the
> entire thing in a bounce buffer to import it then it's hardly zero-copy,
> is it? If you want to do buffer sharing the buffer really needs to be
> allocated appropriately to begin with, such that all relevant devices
> can access it directly. That might be something which needs fixing in Xen=
.
>

Right, in case when we want to use a zero-copy approach need to avoid
using swiotlb
bounce buffer for all devices which is potentially using this buffer.
The root of the problem is that this buffer mapped to foreign pages
and when I tried to
retrieve dma_addr for this buffer I got a foreign MFN that bigger than
32 bit and swiotlb tries to
use bounce buffer.
I understood, that, need to find a way to avoid using swiotlb in this case.
At the moment, it's unclear how to do this properly.
But, this is another story...

I guess, we can have the situation when some device like rcar-du needs
to use a sufficiently large
buffer which is greater than 256 KB (128(CURRENT_IO_TLB_SEGMENT *
2048) and need to
adjust this parameter during boot time, not compilation time.
In order to this point, this patch was created.

Thanks,
Roman

=D0=BF=D1=82, 17 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 12:44, Robin=
 Murphy <robin.murphy@arm.com>:
>
> On 2021-09-17 10:36, Roman Skakun wrote:
> > Hi, Christoph
> >
> > I use Xen PV display. In my case, PV display backend(Dom0) allocates
> > contiguous buffer via DMA-API to
> > to implement zero-copy between Dom0 and DomU.
>
> Well, something's gone badly wrong there - if you have to shadow the
> entire thing in a bounce buffer to import it then it's hardly zero-copy,
> is it? If you want to do buffer sharing the buffer really needs to be
> allocated appropriately to begin with, such that all relevant devices
> can access it directly. That might be something which needs fixing in Xen=
.
>
> Robin.
>
> > When I start Weston under DomU, I got the next log in Dom0:
> > ```
> > [ 112.554471] CPU: 0 PID: 367 Comm: weston Tainted: G O
> > 5.10.0-yocto-standard+ #312
> > [ 112.575149] Call trace:
> > [ 112.577666] dump_backtrace+0x0/0x1b0
> > [ 112.581373] show_stack+0x18/0x70
> > [ 112.584746] dump_stack+0xd0/0x12c
> > [ 112.588200] swiotlb_tbl_map_single+0x234/0x360
> > [ 112.592781] xen_swiotlb_map_page+0xe4/0x4c0
> > [ 112.597095] xen_swiotlb_map_sg+0x84/0x12c
> > [ 112.601249] dma_map_sg_attrs+0x54/0x60
> > [ 112.605138] vsp1_du_map_sg+0x30/0x60
> > [ 112.608851] rcar_du_vsp_map_fb+0x134/0x170
> > [ 112.613082] rcar_du_vsp_plane_prepare_fb+0x44/0x64
> > [ 112.618007] drm_atomic_helper_prepare_planes+0xac/0x160
> > [ 112.623362] drm_atomic_helper_commit+0x88/0x390
> > [ 112.628029] drm_atomic_nonblocking_commit+0x4c/0x60
> > [ 112.633043] drm_mode_atomic_ioctl+0x9a8/0xb0c
> > [ 112.637532] drm_ioctl_kernel+0xc4/0x11c
> > [ 112.641506] drm_ioctl+0x21c/0x460
> > [ 112.644967] __arm64_sys_ioctl+0xa8/0xf0
> > [ 112.648939] el0_svc_common.constprop.0+0x78/0x1a0
> > [ 112.653775] do_el0_svc+0x24/0x90
> > [ 112.657148] el0_svc+0x14/0x20
> > [ 112.660254] el0_sync_handler+0x1a4/0x1b0
> > [ 112.664315] el0_sync+0x174/0x180
> > [ 112.668145] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
> > 3686400 bytes), total 65536 (slots), used 112 (slots)
> > ```
> > The problem is happened here:
> > https://elixir.bootlin.com/linux/v5.14.4/source/drivers/gpu/drm/rcar-du=
/rcar_du_vsp.c#L202
> >
> > Sgt was created in dma_get_sgtable() by dma_common_get_sgtable() and
> > includes a single page chunk
> > as shown here:
> > https://elixir.bootlin.com/linux/v5.14.5/source/kernel/dma/ops_helpers.=
c#L18
> >
> > After creating a new sgt, we tried to map this sgt through vsp1_du_map_=
sg().
> > Internally, vsp1_du_map_sg() using ops->map_sg (e.g
> > xen_swiotlb_map_sg) to perform
> > mapping.
> >
> > I realized that required segment is too big to be fitted to default
> > swiotlb segment and condition
> > https://elixir.bootlin.com/linux/latest/source/kernel/dma/swiotlb.c#L47=
4
> > is always false.
> >
> > I know that I use a large buffer, but why can't I map this buffer in on=
e chunk?
> >
> > Thanks!
> >
> > =D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:53, C=
hristoph Hellwig <hch@lst.de>:
> >>
> >> On Wed, Sep 15, 2021 at 03:49:52PM +0200, Jan Beulich wrote:
> >>> But the question remains: Why does the framebuffer need to be mapped
> >>> in a single giant chunk?
> >>
> >> More importantly: if you use dynamic dma mappings for your framebuffer
> >> you're doing something wrong.
> >
> >
> >



--=20
Best Regards, Roman.
