Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3D325C78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 05:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmxH0051Sz3cnW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 15:18:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=abTtJIMM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=abTtJIMM; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmxGX44SRz3cHk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:18:09 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id k5so3976404qvu.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 20:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDTKQXWPODousjcFxfPrAdhXiScgfthwkHIVsnIoPbM=;
 b=abTtJIMMZ8KToSFWbjzFi32HOkPDN2rxZ+IfBv+eO62ap/dN702Uq0mU9oHC9j+snt
 vnVWV+5jH/p/0R+4U10lm2zTMAo+mTTld64KVC2G+prj4nocAzeugJM4VE5FsldHI9zg
 D677137O5m7d9bvVpQQ+IkqHWrA56M7YEa+Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDTKQXWPODousjcFxfPrAdhXiScgfthwkHIVsnIoPbM=;
 b=lUMMI28RlEQ/5cFMNeUCnUWMYyo11gXz1AJd40peoh+ow6zb34u7ir2tjxt3MBhyRG
 nNdctTU+7l4p7s3ZZEHPHNFGOF9rQAEp3ch8ot+lW/QJ6fj7Ad2I9iwthOnnJ3wEauyx
 qkdKuWcElaiH+r7fNC19u9/5i3yAR8PSRoDesM328ITXg2WcSqBarzODL0sE1Uj3Zwh7
 SKDYXLFAlYvCSa5blfnXz/V4iyMTEJk7LUXKdiFUtA/BZPqn5tIaoyMPfQwuQbs7I4pV
 oZYvYAW9/b8puVP8vIqcsA8f4q+I7vjUONRMZKIAz8cGxO9QdpX5nE2uh/WoeBtHqoAT
 OdSw==
X-Gm-Message-State: AOAM533d5bOurY2k4BT3udKS51Kz7S96gnFOlJqwb+jRAQWxF7uqQSvI
 vu1HGRt/cqUS2esgpgdBmWMz4CZt6lmiJA==
X-Google-Smtp-Source: ABdhPJwocytCYVdQphbU+EqieOpMamdXjGI5APuTnilWSC5ZIEKzuJ6H1u3yA1msZOU3RIsowMNSOw==
X-Received: by 2002:ad4:556c:: with SMTP id w12mr945385qvy.2.1614313084160;
 Thu, 25 Feb 2021 20:18:04 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
 by smtp.gmail.com with ESMTPSA id 12sm5052506qtt.88.2021.02.25.20.18.03
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 20:18:03 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id h8so7994105qkk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 20:18:03 -0800 (PST)
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr1097392jao.84.1614313081344; 
 Thu, 25 Feb 2021 20:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-13-tientzu@chromium.org>
In-Reply-To: <20210209062131.2300005-13-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 26 Feb 2021 12:17:50 +0800
X-Gmail-Original-Message-ID: <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
Message-ID: <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index fd9c1bd183ac..8b77fd64199e 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -836,6 +836,40 @@ late_initcall(swiotlb_create_default_debugfs);
>  #endif
>
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
> +struct page *dev_swiotlb_alloc(struct device *dev, size_t size, gfp_t gfp)
> +{
> +       struct swiotlb *swiotlb;
> +       phys_addr_t tlb_addr;
> +       unsigned int index;
> +
> +       /* dev_swiotlb_alloc can be used only in the context which permits sleeping. */
> +       if (!dev->dev_swiotlb || !gfpflags_allow_blocking(gfp))

Just noticed that !gfpflags_allow_blocking(gfp) shouldn't be here.

Hi Christoph,

Do you think I should fix this and rebase on the latest linux-next
now? I wonder if there are more factor and clean up coming and I
should wait after that.

Thanks,
Claire
