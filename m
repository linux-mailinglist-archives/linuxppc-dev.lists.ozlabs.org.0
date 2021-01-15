Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A22F7148
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 04:56:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH6mz4wjfzDsWM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 14:56:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=SlbAB2R2; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH6kq32JxzDsY1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 14:54:43 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2so4670102pfq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 19:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zn/E5DSPd3qJg+DTv9IwC7Z6z2pECZsgPkasFqGe2mo=;
 b=SlbAB2R28TVOPw4dT3y4+YKxnBvZIXRjddrKEDVYjmW3vvG3MDP0dEXICbitCBjDsh
 shg/YaDMPSBJC8TmtKZMEExrMsM7sLlrF7dj4kE9P1DHob7nRhpZZQNoE756taUh2vVw
 OwHAOHom27x10XansCH8DvCa2BNXVtylJjjRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zn/E5DSPd3qJg+DTv9IwC7Z6z2pECZsgPkasFqGe2mo=;
 b=eSSknHebBA1DAM8eiZ2TOivk5ZfZbu3szfYFawG6mJHef4HYpFHj2YjP41MrlcikmX
 csIk2kMXPrNX7ai2oYvLWlIY0bC4RGRdO1rCaUkx3SyK0H7e8X2CS/cBkxRRX2q+ZK5A
 XiA0RLm/CRgGeVVyLZSfyhk0EA/f6AJV4SuqFSyEOQpyxpwA+BfCUAq8MxaYUlp6WFwd
 8H2fDYpAPh0ENKYes7kVZNB00eboV2K8iH//qoCj3tHxgLZqwWOBrzKaSqQjgp5Xekqo
 /RRvdeYmKcaKbJHHCOVKrEowbnDPj0KyJ94KbkzwPnVSRKfcTnaavyNkGFPEsknvi+0c
 LB7g==
X-Gm-Message-State: AOAM5339k6PHZNycRb0zk2lYq2n3IJIm6CuPbraNAOjrGFtsUS652BuU
 9vcQViTeUJiu+n39GHcw4OzB/9uH3hORcQ==
X-Google-Smtp-Source: ABdhPJzsjAnf39Zr6N+XlySGdekS3Bh03py6bGk+clS4+76W//hozOD2wgK690JTdsgfpd+GApnNXw==
X-Received: by 2002:a62:64d2:0:b029:19e:662e:5e99 with SMTP id
 y201-20020a6264d20000b029019e662e5e99mr10495520pfb.17.1610682879352; 
 Thu, 14 Jan 2021 19:54:39 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171])
 by smtp.gmail.com with ESMTPSA id gk4sm6613976pjb.57.2021.01.14.19.54.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 19:54:39 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id n10so5151035pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 19:54:38 -0800 (PST)
X-Received: by 2002:a5d:9588:: with SMTP id a8mr2906589ioo.34.1610682391276;
 Thu, 14 Jan 2021 19:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-7-tientzu@chromium.org>
 <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
 <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
 <5f276678-3ab2-ddc8-640c-6dbbe173463c@gmail.com>
In-Reply-To: <5f276678-3ab2-ddc8-640c-6dbbe173463c@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 15 Jan 2021 11:46:20 +0800
X-Gmail-Original-Message-ID: <CALiNf28nW0CKsBRw-HQmz=jBJ3vK6cjoQZPu8Zx=Yn=RWPdVWQ@mail.gmail.com>
Message-ID: <CALiNf28nW0CKsBRw-HQmz=jBJ3vK6cjoQZPu8Zx=Yn=RWPdVWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, will@kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 15, 2021 at 2:52 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/14/21 1:08 AM, Claire Chang wrote:
> > On Wed, Jan 13, 2021 at 7:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 1/5/21 7:41 PM, Claire Chang wrote:
> >>> If a device is not behind an IOMMU, we look up the device node and set
> >>> up the restricted DMA when the restricted-dma-pool is presented.
> >>>
> >>> Signed-off-by: Claire Chang <tientzu@chromium.org>
> >>> ---
> >>
> >> [snip]
> >>
> >>> +int of_dma_set_restricted_buffer(struct device *dev)
> >>> +{
> >>> +     struct device_node *node;
> >>> +     int count, i;
> >>> +
> >>> +     if (!dev->of_node)
> >>> +             return 0;
> >>> +
> >>> +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> >>> +                                             sizeof(phandle));
> >>
> >> You could have an early check for count < 0, along with an error
> >> message, if that is deemed useful.
> >>
> >>> +     for (i = 0; i < count; i++) {
> >>> +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> >>> +             if (of_device_is_compatible(node, "restricted-dma-pool"))
> >>
> >> And you may want to add here an of_device_is_available(node). A platform
> >> that provides the Device Tree firmware and try to support multiple
> >> different SoCs may try to determine if an IOMMU is present, and if it
> >> is, it could be marking the restriced-dma-pool region with a 'status =
> >> "disabled"' property, or any variant of that scheme.
> >
> > This function is called only when there is no IOMMU present (check in
> > drivers/of/device.c). I can still add of_device_is_available(node)
> > here if you think it's helpful.
>
> I believe it is, since boot loader can have a shared Device Tree blob
> skeleton and do various adaptations based on the chip (that's what we
> do) and adding a status property is much simpler than insertion new
> nodes are run time.
>
> >
> >>
> >>> +                     return of_reserved_mem_device_init_by_idx(
> >>> +                             dev, dev->of_node, i);
> >>
> >> This does not seem to be supporting more than one memory region, did not
> >> you want something like instead:
> >>
> >>                 ret = of_reserved_mem_device_init_by_idx(...);
> >>                 if (ret)
> >>                         return ret;
> >>
> >
> > Yes. This implement only supports one restriced-dma-pool memory region
> > with the assumption that there is only one memory region with the
> > compatible string, restricted-dma-pool, in the dts. IIUC, it's similar
> > to shared-dma-pool.
>
> Then if here is such a known limitation it should be both documented and
> enforced here, you shouldn ot be iterating over all of the phandles that
> you find, stop at the first one and issue a warning if count > 1?

What I have in mind is there might be multiple memory regions, but
only one is for restriced-dma-pool.
Say, if you want a separated region for coherent DMA and only do
streaming DMA in this restriced-dma-pool region, you can add another
reserved-memory node with shared-dma-pool in dts and the current
implementation will try to allocate the memory via
dma_alloc_from_dev_coherent() first (see dma_alloc_attrs() in
/kernel/dma/mapping.c).
Or if you have vendor specific memory region, you can still set up
restriced-dma-pool by adding another reserved-memory node in dts.
Dose this make sense to you? I'll document this for sure.

> --
> Florian
