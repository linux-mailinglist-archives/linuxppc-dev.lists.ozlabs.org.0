Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA833F934E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 05:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwmCj2JpTz306d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 13:58:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LHO3ECTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=LHO3ECTK; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwmC26s4qz2yLN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 13:57:48 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id b200so6811474iof.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aO31d1ja5MAKunYUAZZRLdfg9N4l+qmRykC9m1jC/pQ=;
 b=LHO3ECTKxrFvHrNircCd8rdZ+1fd28Cmb0yeGOAFZz7tvi23JfdsoKQlBQ/osBU2PS
 uSjlHhkxT55kRAddmfXWJAAOEApdxidxxDW04W+WXtBEpgeVUzkf4uqWPWAg7OHZiZJx
 7DqmkAUptTsy2yC8hMD6ce5SkESGfwW9yU/Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aO31d1ja5MAKunYUAZZRLdfg9N4l+qmRykC9m1jC/pQ=;
 b=FU4ImU1/ybuHXWYC1rlAi/me/pRfhBVCJbd7QWYc5tdR1vTwrKk3aheegjQhHHcy9R
 AXzyuDBJ3yuzYMvf7BC4IiD/yBSFPbwV4dUtj5vZW3iTZopmnihjWVV5E75iysJM8159
 fael+cwggs7z8HCoYX06zafcVqmVQxdMyMWdTRwosF4AU/VB9q76pkE010IYJcSTgGVk
 vSoOrRJ7bThdoNomKmRpQHVPVfX5vtPM8mXY4wQMmHVBHv7vQwUUKuEFbNTrSfN7T+NS
 pO4j5svQACSMSYhuW3D/ap+iS37v9GWSUbo9a/CTiu8xrN5g7M8VZJRA7PzY2FMhFXd6
 wVdw==
X-Gm-Message-State: AOAM530K7TuJoQ7Euc8E+PVq0khMaH2sPPWGR4tc39Pm1H3k4SZa5L3V
 wVe0Fba9kbMcXCp3DdAgV1L40A/a9F+gnQ==
X-Google-Smtp-Source: ABdhPJxq/ZfiprZav5uRfM0YAGC/sEwFX3OPfWgN8WiGP722PhGvKh7zsldsPdRRewakbQkT24CZ9w==
X-Received: by 2002:a02:9a02:: with SMTP id b2mr6398313jal.89.1630036664874;
 Thu, 26 Aug 2021 20:57:44 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id w12sm2853616ilg.74.2021.08.26.20.57.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 20:57:44 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id y3so5740051ilm.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:57:44 -0700 (PDT)
X-Received: by 2002:a5d:9ada:: with SMTP id x26mr5606315ion.50.1630036221774; 
 Thu, 26 Aug 2021 20:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org>
 <20210824142601.GA3393158@roeck-us.net>
In-Reply-To: <20210824142601.GA3393158@roeck-us.net>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 27 Aug 2021 11:50:10 +0800
X-Gmail-Original-Message-ID: <CALiNf2_NoJwU7UUT4mNkbKWRKsTP9R9E=9qBZzjdjOduO5WZDQ@mail.gmail.com>
Message-ID: <CALiNf2_NoJwU7UUT4mNkbKWRKsTP9R9E=9qBZzjdjOduO5WZDQ@mail.gmail.com>
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 24, 2021 at 10:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Claire,
>
> On Thu, Jun 24, 2021 at 11:55:24PM +0800, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes.
> >
> > Regardless of swiotlb setting, the restricted DMA pool is preferred if
> > available.
> >
> > The restricted DMA pools provide a basic level of protection against the
> > DMA overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
> > needs to provide a way to lock down the memory access, e.g., MPU.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > ---
> >  include/linux/swiotlb.h |  3 +-
> >  kernel/dma/Kconfig      | 14 ++++++++
> >  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 92 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 3b9454d1e498..39284ff2a6cd 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
> >   *           range check to see if the memory was in fact allocated by this
> >   *           API.
> >   * @nslabs:  The number of IO TLB blocks (in groups of 64) between @start and
> > - *           @end. This is command line adjustable via setup_io_tlb_npages.
> > + *           @end. For default swiotlb, this is command line adjustable via
> > + *           setup_io_tlb_npages.
> >   * @used:    The number of used IO TLB block.
> >   * @list:    The free list describing the number of free entries available
> >   *           from each index.
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index 77b405508743..3e961dc39634 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -80,6 +80,20 @@ config SWIOTLB
> >       bool
> >       select NEED_DMA_MAP_STATE
> >
> > +config DMA_RESTRICTED_POOL
> > +     bool "DMA Restricted Pool"
> > +     depends on OF && OF_RESERVED_MEM
> > +     select SWIOTLB
>
> This makes SWIOTLB user configurable, which in turn results in
>
> mips64-linux-ld: arch/mips/kernel/setup.o: in function `arch_mem_init':
> setup.c:(.init.text+0x19c8): undefined reference to `plat_swiotlb_setup'
> make[1]: *** [Makefile:1280: vmlinux] Error 1
>
> when building mips:allmodconfig.
>
> Should this possibly be "depends on SWIOTLB" ?

Patch is sent here: https://lkml.org/lkml/2021/8/26/932

>
> Thanks,
> Guenter

Thanks,
Claire
