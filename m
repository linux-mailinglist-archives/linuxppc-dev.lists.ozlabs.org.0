Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547A3C7A68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 02:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPd980n6hz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 10:07:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=teI5WRKu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=konrad.r.wilk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=teI5WRKu; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPd8g48Fhz2yWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 10:06:42 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id t185so4264237qkd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 17:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
 b=teI5WRKub2F/rwFPxCg0ZINCjBfRJc54nJqUFdAMXpGIMiTspU9RrcrUvARcHwoeMd
 CQXv1wJ/Fog/rhWZSvumcNrgcq+BxotT51h+tTiRDV8aZpevQuwsLDR4vyQtZSmmoC6h
 F9IEcsAuWnvI+dAhgG0Eo2jqsi01XmkKdYdzhKwGl4vTdbqsh5/P7DXsca+16o6s1nU2
 2kLICjJFyej3TGeGHMleEoqCSW2m15wa6CXhxq4NskVTucQzPb/x7tap01fpFeI4k0/I
 0oDywPh08J0yunT5JHEEyAcZVTBsHz7FszjRqikpByO6wq8hJu89C/WxnMp4EIv1s5qc
 +urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
 b=lPu1+nOK+rSnq2yE7fXyR5FByige1hKwq1gifpJWYrbSolDEa6kMugU2JoW1nwuePQ
 2pCVNowSHBnzLsOy08K/AgaKe263TiWKBKvHhW5JNrevpfZ6Rzr1HXbaMjKYjYPKU7Bk
 JcJ5zuVVzN4GQDTO0KYdH9vlvM60Krxr574HT5GNzzQ60UYdbGnmkq0GImvlXHD9KVL6
 7dIJg9W7I35Z5C2neQU7YjdyRsbUMVf4tyv1pEKTOcfM9VyeN1ot8uvu8g8ViQxA3BTU
 /LVI/WdT0/lXbCXvh8En/fuEsqnXHsUgatG6C9ru38V1IscsLD5QU8EO5W/hq3KTGz/W
 dmoA==
X-Gm-Message-State: AOAM530meEshJQykNsnhmpePkVV0hreVptIF4UmPP6n74wKCukt/1M1q
 JxqlODtQ1+8EM0iPkNyXpr8=
X-Google-Smtp-Source: ABdhPJwNdfUqk7dW6v+BkJSkD78e6Hf5RHfzRN9m+TvOapNBOx9APu0hdr4kc7VyqpHBok4bqL0fFQ==
X-Received: by 2002:a05:620a:b85:: with SMTP id
 k5mr282577qkh.219.1626221197830; 
 Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
Received: from fedora ([130.44.160.152])
 by smtp.gmail.com with ESMTPSA id o1sm128098qta.87.2021.07.13.17.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
Date: Tue, 13 Jul 2021 20:06:33 -0400
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YO4qifiYjL4BTMv4@fedora>
References: <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
 <YOSMDZmtfXEKerpf@char.us.oracle.com>
 <20210712135645.GA28881@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712135645.GA28881@willie-the-truck>
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

..snip..
> > > I think the main question I have is how would you like to see patches for
> > > 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?
> > 
> > Yes that would be perfect. If there are any dependencies on the rc1, I
> > can rebase it on top of that.
> 
> Yes, please, rebasing would be very helpful. The broader rework of
> 'io_tlb_default_mem' is going to conflict quite badly otherwise.

There is a devel/for-linus-5.15 (based on v5.14-rc1) now.

Thank you!
> 
> Cheers,
> 
> Will
