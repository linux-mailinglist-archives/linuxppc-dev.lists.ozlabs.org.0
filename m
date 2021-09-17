Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA240F4E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 11:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9pkk4yPnz306R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 19:37:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MN1/jjZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=rm.skakun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MN1/jjZb; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9pk04b3hz2yJP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 19:36:23 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id b15so11945496lfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iK4mpVKVVYi9/BGqZbaVX4RSahiZlKiCXLvFBZ3uV8Y=;
 b=MN1/jjZbppwReGdyLZpyF5ymRtRGFu/Up778Ys6rsxRU6QdZsKzVvIV1Q5LMSVHi6Z
 LMWOqEixSS5S1UiNP6owwflUknFLs1ErQafLBTm1cdf5WCbo14UWSsE6/KV+DIGfOqjV
 AyKGWKq6Yh+vZ9xqARQDEgXI+FhmqY29Z33fH6+Ub3CcWbHN7pydnuuP4botigVFYLMy
 33nx/CbANxIL6zJDEYOpA2yEgz1OMqNEISlQrFUuBE6towtd9HN1UqjyGBakn7j61ZaJ
 GLIWXE28d5uJ2toCULBsue8DI3bB0s7qDKIuYv8KsoZ9U2hiDf3PWxFEWtOdeGEfcBVA
 03Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iK4mpVKVVYi9/BGqZbaVX4RSahiZlKiCXLvFBZ3uV8Y=;
 b=UQHE3cyoRviB7SgTg4+6mG2RHGncyJHphzHNoP3A5Q98PPnep04nwdKtQwUTVDWSNZ
 0iDatRReoZNzPKVJN9f4B0Wj17Fa1QKPUK9NPABhaT03LjKnBjo5bmd8vXxNBAJppWWq
 xPhJoZrsQktYCPq0nRbHNpE+rtEtQst9IMx6Ym9qc+PUFZftqs6zI131CHq8GvHzwqJF
 e49S02DwF2AeWqDGAymxIhKewipdZBz40V3e87WPJ+dFIqQ+SI6kMJnRIoVQ1TPsUuji
 nzMKf/JeJEruIIxyjlBFR1XVwlsxbmJAf9pPHfbaLOy68e9LzED4M9kqBA3J1pAmWi9S
 /7bw==
X-Gm-Message-State: AOAM533cdS7cPWva3xNDvwUAGx3EdbR4XdqNprlWevfAldlKVbuMrcVP
 1zIR/1ZN52oKpVCOkLmkDPm3fBiwww/3hTd7biY=
X-Google-Smtp-Source: ABdhPJzQUNFm8ZGVYUpqQ4Z42IbxHswXEbwr86F8d6HCMiXlqvVN8bj/2/tgPLfPn2KT6aH0vcM4FCwUBAENJfLsLbE=
X-Received: by 2002:a2e:586:: with SMTP id 128mr8467207ljf.310.1631871375448; 
 Fri, 17 Sep 2021 02:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
 <20210915135321.GA15216@lst.de>
In-Reply-To: <20210915135321.GA15216@lst.de>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Fri, 17 Sep 2021 12:36:04 +0300
Message-ID: <CADu_u-OZzgVj+z=iD6kUQOZxUufF5QSMR6-MmpN_hLZ9PyQJhQ@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Christoph Hellwig <hch@lst.de>
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
 xen-devel@lists.xenproject.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu <iommu@lists.linux-foundation.org>, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Christoph

I use Xen PV display. In my case, PV display backend(Dom0) allocates
contiguous buffer via DMA-API to
to implement zero-copy between Dom0 and DomU.

When I start Weston under DomU, I got the next log in Dom0:
```
[ 112.554471] CPU: 0 PID: 367 Comm: weston Tainted: G O
5.10.0-yocto-standard+ #312
[ 112.575149] Call trace:
[ 112.577666] dump_backtrace+0x0/0x1b0
[ 112.581373] show_stack+0x18/0x70
[ 112.584746] dump_stack+0xd0/0x12c
[ 112.588200] swiotlb_tbl_map_single+0x234/0x360
[ 112.592781] xen_swiotlb_map_page+0xe4/0x4c0
[ 112.597095] xen_swiotlb_map_sg+0x84/0x12c
[ 112.601249] dma_map_sg_attrs+0x54/0x60
[ 112.605138] vsp1_du_map_sg+0x30/0x60
[ 112.608851] rcar_du_vsp_map_fb+0x134/0x170
[ 112.613082] rcar_du_vsp_plane_prepare_fb+0x44/0x64
[ 112.618007] drm_atomic_helper_prepare_planes+0xac/0x160
[ 112.623362] drm_atomic_helper_commit+0x88/0x390
[ 112.628029] drm_atomic_nonblocking_commit+0x4c/0x60
[ 112.633043] drm_mode_atomic_ioctl+0x9a8/0xb0c
[ 112.637532] drm_ioctl_kernel+0xc4/0x11c
[ 112.641506] drm_ioctl+0x21c/0x460
[ 112.644967] __arm64_sys_ioctl+0xa8/0xf0
[ 112.648939] el0_svc_common.constprop.0+0x78/0x1a0
[ 112.653775] do_el0_svc+0x24/0x90
[ 112.657148] el0_svc+0x14/0x20
[ 112.660254] el0_sync_handler+0x1a4/0x1b0
[ 112.664315] el0_sync+0x174/0x180
[ 112.668145] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
3686400 bytes), total 65536 (slots), used 112 (slots)
```
The problem is happened here:
https://elixir.bootlin.com/linux/v5.14.4/source/drivers/gpu/drm/rcar-du/rca=
r_du_vsp.c#L202

Sgt was created in dma_get_sgtable() by dma_common_get_sgtable() and
includes a single page chunk
as shown here:
https://elixir.bootlin.com/linux/v5.14.5/source/kernel/dma/ops_helpers.c#L1=
8

After creating a new sgt, we tried to map this sgt through vsp1_du_map_sg()=
.
Internally, vsp1_du_map_sg() using ops->map_sg (e.g
xen_swiotlb_map_sg) to perform
mapping.

I realized that required segment is too big to be fitted to default
swiotlb segment and condition
https://elixir.bootlin.com/linux/latest/source/kernel/dma/swiotlb.c#L474
is always false.

I know that I use a large buffer, but why can't I map this buffer in one ch=
unk?

Thanks!

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:53, Chris=
toph Hellwig <hch@lst.de>:
>
> On Wed, Sep 15, 2021 at 03:49:52PM +0200, Jan Beulich wrote:
> > But the question remains: Why does the framebuffer need to be mapped
> > in a single giant chunk?
>
> More importantly: if you use dynamic dma mappings for your framebuffer
> you're doing something wrong.



--=20
Best Regards, Roman.
