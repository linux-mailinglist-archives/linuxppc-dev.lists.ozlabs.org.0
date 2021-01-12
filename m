Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508032F298D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 08:59:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFNJ34MXczDr0t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 18:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Muj3J6AU; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFND71Cc0zDqxH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 18:55:30 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id h16so542142qvu.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7gLFMlxBCQENVWtNxS2npLHFlF1Oh0HPmJ2b4uXz4E=;
 b=Muj3J6AUcKeWXk2QVKpBxfCJmD1ZNU3ECoTrLMhnZ3l10BcmT1KWV3KJZVJiyjnmgp
 tXnYNLGybukalejR/JL4Ccq0hthA+yksiWl3Xj9n38DlJXhcHL4x7k7Hi60j74u9oC5X
 xVXg0JvakYs/Mgnk3DB5tWgDJ2Wm5qz5NT8oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7gLFMlxBCQENVWtNxS2npLHFlF1Oh0HPmJ2b4uXz4E=;
 b=jCHnrMF0nJbIxQTP2yk7ABKoTQFmuvYWW0MmH9I/z/6cLXYA455ztMYgW7Xp6rsZWl
 7CG97JIEugGeMuL+6LM7fGKOuKSN+rW8FR/Try1TcOPE8RI0p6hzxl012KPznihpUOW4
 m9lLQ6tNR4C2dRaZA0x1a8GxhKDM49EYG3aE9OE3CuExzaZ/NJnUCODLpJbYtiG8uHWw
 3VGtcSA5i38CsYmdnr8AQpuUuMRuit8NlTNsKl4grMlCS+Cgz7UcxfG4BgebOw4Tb3zx
 cdjXaRmzABTiDkjd5cEMjpIp+cSGt1b4qWSFL143wTtFm7deN4qLieXtFU7pMO4ANo7t
 8m7g==
X-Gm-Message-State: AOAM533r8kLBiZxvaxQsnu2bPa3d9s58pZNauG3LJigKuWHnL6FTX8NS
 rg+LXXJSHZnZd5AEThn84sFmUo2ZfK2B0+f8
X-Google-Smtp-Source: ABdhPJyh7IKHCp3nIrEla2jTSJwRc39Ot9oOnX6wqp8uu0XGi0HcSnVdjOOINhlhBck4gC0EzTaubg==
X-Received: by 2002:ad4:4390:: with SMTP id s16mr3388596qvr.28.1610438126151; 
 Mon, 11 Jan 2021 23:55:26 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177])
 by smtp.gmail.com with ESMTPSA id k141sm1009948qke.38.2021.01.11.23.55.25
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 23:55:25 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id v5so1022913qtv.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:55:25 -0800 (PST)
X-Received: by 2002:a05:6638:c52:: with SMTP id
 g18mr3073726jal.84.1610437670186; 
 Mon, 11 Jan 2021 23:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210106185757.GB109735@localhost.localdomain>
 <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
 <20210107180032.GB16519@char.us.oracle.com>
 <4cce7692-7184-9b25-70f2-b821065f3b25@gmail.com>
In-Reply-To: <4cce7692-7184-9b25-70f2-b821065f3b25@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 12 Jan 2021 15:47:39 +0800
X-Gmail-Original-Message-ID: <CALiNf29Kqr1WP3BEjX-y5Xtife7AinqiXAcRD2g4eB9isTaXfQ@mail.gmail.com>
Message-ID: <CALiNf29Kqr1WP3BEjX-y5Xtife7AinqiXAcRD2g4eB9isTaXfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
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

On Fri, Jan 8, 2021 at 2:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/7/21 10:00 AM, Konrad Rzeszutek Wilk wrote:
> >>>
> >>>
> >>>  - Nothing stops the physical device from bypassing the SWIOTLB buffer.
> >>>    That is if an errant device screwed up the length or DMA address, the
> >>>    SWIOTLB would gladly do what the device told it do?
> >>
> >> So the system needs to provide a way to lock down the memory access, e.g. MPU.
> >
> > OK! Would it be prudent to have this in the description above perhaps?
>
> Yes this is something that must be documented as a requirement for the
> restricted DMA pool users, otherwise attempting to do restricted DMA
> pool is no different than say, using a device private CMA region.
> Without the enforcement, this is just a best effort.

Will add in the next version.

> --
> Florian
