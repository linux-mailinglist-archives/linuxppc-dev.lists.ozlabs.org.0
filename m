Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CBD2FEF70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 16:50:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM6KQ1bW3zDrQt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 02:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HPFqecRk; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM6HS0ZGTzDr7k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 02:48:20 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4921C23A58
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611244097;
 bh=ESCY3rt1UpVAToMmeAThDINvSacKiOsK2nc/NRoNF9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HPFqecRk1JiEfou+TGAdAWm0YNGX+QvN2hslPsiDUpkZK8Xjf5clMU69GQ86tMkdk
 Gw4qS+S8nYZpoTDx4oPebx4Jcb/0ZzoJK6fXWFwcG1VMBdLiUPFDrtmrDnEykqhGN/
 HLPfcfVb2VUMwE6cw+j9SJ+7UJS15ElgziJif2cnbrCfeofK6VBympIsYcbjiPqvmv
 YzYDRlCbp9rC5yiSaVc+26bVmKPwVj6mivyYsMjPf0+1NfJ3kzh6v1XjsiPHRqd7Zy
 KW0J0yA1KAxtkAdPciu0oitaM6Wr0lzm+Av4YKZh93CvcmiQuzf4xPnuxyn4FQVBoh
 eGPy+/gmAYbYw==
Received: by mail-ed1-f54.google.com with SMTP id f1so2999034edr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 07:48:17 -0800 (PST)
X-Gm-Message-State: AOAM530Z9WCODjfOaJawI3tPEmAtTbeXaDY+LaJVHB+/ywVNlTx0N1OE
 OFVJgwlRG7yEboMoTTsXYeeR4TDo180L8wB2YQ==
X-Google-Smtp-Source: ABdhPJxClIBHDNh0ezMtBn3tEIUpA6A69KltrTNKbOdslOUCg3ST6RYu/puKZCvzOeFiwKhVG1uu2/TgGhoFpNLSPDU=
X-Received: by 2002:a17:906:958f:: with SMTP id
 r15mr70711ejx.360.1611244095545; 
 Thu, 21 Jan 2021 07:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
 <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
 <CAL_JsqKjTqcCbCLksRbCh7=f-A3Y09A3jNqtUApaA+p=RKd_Eg@mail.gmail.com>
 <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
In-Reply-To: <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Jan 2021 09:48:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
Message-ID: <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Grant Likely <grant.likely@arm.com>,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Joerg Roedel <joro@8bytes.org>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 7:10 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-01-20 21:31, Rob Herring wrote:
> > On Wed, Jan 20, 2021 at 11:30 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2021-01-20 16:53, Rob Herring wrote:
> >>> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> >>>> Introduce the new compatible string, restricted-dma-pool, for restricted
> >>>> DMA. One can specify the address and length of the restricted DMA memory
> >>>> region by restricted-dma-pool in the device tree.
> >>>
> >>> If this goes into DT, I think we should be able to use dma-ranges for
> >>> this purpose instead. Normally, 'dma-ranges' is for physical bus
> >>> restrictions, but there's no reason it can't be used for policy or to
> >>> express restrictions the firmware has enabled.
> >>
> >> There would still need to be some way to tell SWIOTLB to pick up the
> >> corresponding chunk of memory and to prevent the kernel from using it
> >> for anything else, though.
> >
> > Don't we already have that problem if dma-ranges had a very small
> > range? We just get lucky because the restriction is generally much
> > more RAM than needed.
>
> Not really - if a device has a naturally tiny addressing capability that
> doesn't even cover ZONE_DMA32 where the regular SWIOTLB buffer will be
> allocated then it's unlikely to work well, but that's just crap system
> design. Yes, memory pressure in ZONE_DMA{32} is particularly problematic
> for such limited devices, but it's irrelevant to the issue at hand here.

Yesterday's crap system design is today's security feature. Couldn't
this feature make crap system design work better?

> What we have here is a device that's not allowed to see *kernel* memory
> at all. It's been artificially constrained to a particular region by a
> TZASC or similar, and the only data which should ever be placed in that

May have been constrained, but that's entirely optional.

In the optional case where the setup is entirely up to the OS, I don't
think this belongs in the DT at all. Perhaps that should be solved
first.

> region is data intended for that device to see. That way if it tries to
> go rogue it physically can't start slurping data intended for other
> devices or not mapped for DMA at all. The bouncing is an important part
> of this - I forget the title off-hand but there was an interesting paper
> a few years ago which demonstrated that even with an IOMMU, streaming
> DMA of in-place buffers could reveal enough adjacent data from the same
> page to mount an attack on the system. Memory pressure should be
> immaterial since the size of each bounce pool carveout will presumably
> be tuned for the needs of the given device.
>
> > In any case, wouldn't finding all the dma-ranges do this? We're
> > already walking the tree to find the max DMA address now.
>
> If all you can see are two "dma-ranges" properties, how do you propose
> to tell that one means "this is the extent of what I can address, please
> set my masks and dma-range-map accordingly and try to allocate things
> where I can reach them" while the other means "take this output range
> away from the page allocator and hook it up as my dedicated bounce pool,
> because it is Serious Security Time"? Especially since getting that
> choice wrong either way would be a Bad Thing.

Either we have some heuristic based on the size or we add some hint.
The point is let's build on what we already have for defining DMA
accessible memory in DT rather than some parallel mechanism.

Rob
