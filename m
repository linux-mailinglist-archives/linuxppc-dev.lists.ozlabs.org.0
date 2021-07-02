Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F148B3B9ACF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 05:08:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGKm86279z3bX9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 13:08:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rcatVMwn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rcatVMwn; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGKld3Xckz2yj0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 13:08:12 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id a133so9723884oib.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 20:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vnC0TqPJlyIMqLOncGpr5zl9pmbmcIIyiC4phT6PUIQ=;
 b=rcatVMwnoboRAVBm6z7P2HYmOyqx+HWthzA0HOg5zSVWMr7WIAx3ZVtmMQBABS3jSs
 ll3cBrlaV5N4g4Rvy938v3Mka2o7BKSsLAnp0j9BVKtd6G0HRyhUAM117EPetSB6PYk4
 aIzksvokAZwg7oj60y4L3zka5GOYTYtCADcKKqh9eOpTeqFos+tdtKUeh13pl/ncaATb
 z+gsly2qHHMFdyn0yxdy8vih0i6Y3VD1swKheCHmBE++JlII4Ajp+FJ6942Kfxfr0p9t
 PlSPUBKWfUPw26fCx2/8jDss0gWJ7ZhSbqGnHJzN7Y9CqXNOHLSOGPQ6Z7xfZJI1OXzp
 hIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=vnC0TqPJlyIMqLOncGpr5zl9pmbmcIIyiC4phT6PUIQ=;
 b=AvM8vqM6ccHrLP89weM6Se33TAsYYL69gqWSZzQQVc8JZCMu16HqipQaMruh2xIZnE
 ZOT3xwXLfOZpFeC2v65XGrP3VoyJla3koroGLg/+Y20Hb2lyHkBSj7nc5Tpvk63QMtJ4
 Zn/4vN8TiR7kqfAThxQsBkpzG0hINTqx1mW47hB9AmLy5f7NylxVcP6G9GGEaNATdCkN
 awS0w7hxfBwgsPdxe2H/Cp/+GSdj88lbPvE53oMk6PfgTZDC7ASgf3JDVXNck0WQklnQ
 qf0KlPueDA6oDeHj3bwHQWX+wGa7zzcwvxNSYGGj4x/gVdf0AJeOLtDnNKsAS8GLQwgT
 cAFQ==
X-Gm-Message-State: AOAM533zyP9SH39/s0PMflsvM2gxVwi9QCmT/9+4t48RiqIBPcTn8CZp
 tf99IBtz6sP516ZTh7i9lAs=
X-Google-Smtp-Source: ABdhPJxROyx59a65CULGKnIjDKL6LEkceViIozGHO/6JCiILIO/ostWPfjk3TYymGpFPnNGZwku3+w==
X-Received: by 2002:a54:4187:: with SMTP id 7mr2101677oiy.127.1625195289117;
 Thu, 01 Jul 2021 20:08:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l2sm374555otl.27.2021.07.01.20.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 20:08:08 -0700 (PDT)
Date: Thu, 1 Jul 2021 20:08:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 12/12] of: Add plumbing for restricted DMA pool
Message-ID: <20210702030807.GA2685166@roeck-us.net>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-13-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-13-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 matthew.auld@intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 thomas.hellstrom@linux.intel.com, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 24, 2021 at 11:55:26PM +0800, Claire Chang wrote:
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

With this patch in place, all sparc and sparc64 qemu emulations
fail to boot. Symptom is that the root file system is not found.
Reverting this patch fixes the problem. Bisect log is attached.

Guenter

---
# bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific files for 20210701
# good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
git bisect start 'HEAD' 'v5.13'
# bad: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking branch 'rdma/for-next'
git bisect bad f63c4fda987a19b1194cc45cb72fd5bf968d9d90
# good: [46bb5dd1d2a63e906e374e97dfd4a5e33934b1c4] Merge remote-tracking branch 'ipsec/master'
git bisect good 46bb5dd1d2a63e906e374e97dfd4a5e33934b1c4
# good: [43ba6969cfb8185353a7a6fc79070f13b9e3d6d3] Merge remote-tracking branch 'clk/clk-next'
git bisect good 43ba6969cfb8185353a7a6fc79070f13b9e3d6d3
# good: [1ca5eddcf8dca1d6345471c6404e7364af0d7019] Merge remote-tracking branch 'fuse/for-next'
git bisect good 1ca5eddcf8dca1d6345471c6404e7364af0d7019
# good: [8f6d7b3248705920187263a4e7147b0752ec7dcf] Merge remote-tracking branch 'pci/next'
git bisect good 8f6d7b3248705920187263a4e7147b0752ec7dcf
# good: [df1885a755784da3ef285f36d9230c1d090ef186] RDMA/rtrs_clt: Alloc less memory with write path fast memory registration
git bisect good df1885a755784da3ef285f36d9230c1d090ef186
# good: [93d31efb58c8ad4a66bbedbc2d082df458c04e45] Merge remote-tracking branch 'cpufreq-arm/cpufreq/arm/linux-next'
git bisect good 93d31efb58c8ad4a66bbedbc2d082df458c04e45
# good: [46308965ae6fdc7c25deb2e8c048510ae51bbe66] RDMA/irdma: Check contents of user-space irdma_mem_reg_req object
git bisect good 46308965ae6fdc7c25deb2e8c048510ae51bbe66
# good: [6de7a1d006ea9db235492b288312838d6878385f] thermal/drivers/int340x/processor_thermal: Split enumeration and processing part
git bisect good 6de7a1d006ea9db235492b288312838d6878385f
# good: [081bec2577cda3d04f6559c60b6f4e2242853520] dt-bindings: of: Add restricted DMA pool
git bisect good 081bec2577cda3d04f6559c60b6f4e2242853520
# good: [bf95ac0bcd69979af146852f6a617a60285ebbc1] Merge remote-tracking branch 'thermal/thermal/linux-next'
git bisect good bf95ac0bcd69979af146852f6a617a60285ebbc1
# good: [3d8287544223a3d2f37981c1f9ffd94d0b5e9ffc] RDMA/core: Always release restrack object
git bisect good 3d8287544223a3d2f37981c1f9ffd94d0b5e9ffc
# bad: [cff1f23fad6e0bd7d671acce0d15285c709f259c] Merge remote-tracking branch 'swiotlb/linux-next'
git bisect bad cff1f23fad6e0bd7d671acce0d15285c709f259c
# bad: [b655006619b7bccd0dc1e055bd72de5d613e7b5c] of: Add plumbing for restricted DMA pool
git bisect bad b655006619b7bccd0dc1e055bd72de5d613e7b5c
# first bad commit: [b655006619b7bccd0dc1e055bd72de5d613e7b5c] of: Add plumbing for restricted DMA pool
