Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EE43B167B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 11:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8y8l1ddZz3046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 19:07:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SA9G17LO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=SA9G17LO; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8y8D45tnz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 19:07:23 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id h2so2393560iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
 b=SA9G17LOrb34DyVZWPMTTHIONdcJ/5ZbZWqssqBb4aWqa4vseTx3+V6CkFU4RvePBr
 YNNS8jqCGxfTDXRduKfQQMwLt3JL1m3nr4PNVWIksCr6YiJm78aGWUxZDo4V4hXGS1bN
 zAH4ZuRlx4WIbGetsYgzQvT1yucBC3KtrF3U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
 b=BU63DIRHfXSDc+lmfP5PSpv47Wk0SKpGh6k9bbNa8eZoi3GZKiOHs7L9butoXNKLZ9
 iFncHptwoqB9yw6hxbVDXXJ1fHL3hgwlgZWmqc+ai99yJeiVXLr8+WzflJcFMkUukwhm
 BypF7z7LAyAfUME9yQ16AvaKmxurZliwcJGL5ayaW76xbkDGK0VvYqs2d45yjDNRPZdq
 v9MWbLx8V0TjkH3rbFriWA9q9eFDBJqIslxPY44YBAnBuaVs0o5K/yGy0fAd4ToyeixV
 tL77yeYiRiCfIKwhq+JHf5zkwrJjGzfAua2NYYXKRtyEleo5puwsjKtz+FRmD9w1UFCN
 MomQ==
X-Gm-Message-State: AOAM530dAKdLO89HigLvVZJKhBvlxw8ajM70M1bExsZ4j1Es9OqYkUNG
 zZ2UTSbRuaDFCDORL5WBOQUUBaaI9DAcvg==
X-Google-Smtp-Source: ABdhPJz6a1SAsi4p9d4M9U+5ufcqEWeiXHmw9ptIer8lUs6dqIDpAgOhvqKEyTjrpDf2dqJyk2K64A==
X-Received: by 2002:a5e:950f:: with SMTP id r15mr2129232ioj.135.1624439239804; 
 Wed, 23 Jun 2021 02:07:19 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id y11sm2387764ioj.3.2021.06.23.02.07.19
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 02:07:19 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id g22so2456617iom.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 02:07:19 -0700 (PDT)
X-Received: by 2002:a02:4b46:: with SMTP id q67mr7991027jaa.84.1624438886886; 
 Wed, 23 Jun 2021 02:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210619034043.199220-1-tientzu@chromium.org>
 <YNLy7z0Zq1AXKLng@char.us.oracle.com>
In-Reply-To: <YNLy7z0Zq1AXKLng@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 23 Jun 2021 17:01:16 +0800
X-Gmail-Original-Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] Restricted DMA
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
 Will Deacon <will@kernel.org>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 23, 2021 at 4:38 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Sat, Jun 19, 2021 at 11:40:31AM +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same region.
> > The feature on its own provides a basic level of protection against the DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system needs
> > to provide a way to restrict the DMA to a predefined memory region (this is
> > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> >
> > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>
> Heya Claire,
>
> I put all your patches on
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/log/?h=devel/for-linus-5.14
>
> Please double-check that they all look ok.
>
> Thank you!

They look fine. Thank you!
