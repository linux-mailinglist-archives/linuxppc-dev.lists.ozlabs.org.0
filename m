Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8CA389606
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flhym3Kjqz2xvK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ekc2ScXY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ekc2ScXY; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlhyB2ZFGz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:00:01 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id 10so10570358pfl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
 b=Ekc2ScXY1SHvF4H29yTRhgjiTSWV6Cyne34MQrajkIT3p2pu6mu773Qlyr0kpC2NNU
 P+GJiyNV1K2vRtkjtAhIgI9VHVYmFkAxziAc3YITYD5dCFwhGNrQytvT7wWGVjrLLVt/
 Z+eGZOsPbQoTabmseviirRgNiL7jb93KoBbw+F8LkLIJVv78TKzBCCrYFTn6M7Wbv/bo
 0UQmBpP3G5FMrLaiP4lB4mvY0KeluMFddI6VD1W8D7dp8q/8Zp42g/wrvlGw3mxI6q03
 5p/katWWYvUn05FJWNltsTeqIMenps29TVH4Onz8E4y1A5fSnj1TT7Ka2b9bvOBYDjcG
 zYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
 b=Uy9JHcIq8ioj46FOfew9SBWNZI9NmGt+qYf9jC6GFL2EQKAbbS6NW1BuD65TlkKUfn
 GYr3DKNNpnJLTe/pEgSPsLW0XM/xh7PzAxIu2dCS4r6XrUkBfF/2O0EH1aE7Mjjc56TC
 tEmsPshkDcUmi6m8c8mT+dVayNcIutyqF2Ml9NQOteAALTQSxtOBJgfrxtHll4dWA+2b
 TsLZpH5pwCK0WKC23FYpr3oQOsu6AVFrRz6xbvKq+EIYx0WSkwWDVZfc1HLekdptIN24
 M1O2u9MnXe/thVEWQGqJRKaflY6PT9ZEQ7On2f3rxbIQB7ZDUzXBmrAlU227p6Kmn5Nr
 JvHQ==
X-Gm-Message-State: AOAM533R29iZN0R0J0h4iDlT/0Mr2bgFr+vBGt/Mtq7FNE4uzMy2IyhD
 vi+uAIGR9V28YgxPqAcnqjM=
X-Google-Smtp-Source: ABdhPJyp0yRJO2tDNgGd4CfLo9HXihdjW7DvkJwzlUWA3fY93WK5PBHIJbH2WL1TmMBXCaStbeZwNQ==
X-Received: by 2002:a65:48c2:: with SMTP id o2mr575344pgs.376.1621450797716;
 Wed, 19 May 2021 11:59:57 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 63sm140020pfz.26.2021.05.19.11.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:59:57 -0700 (PDT)
Subject: Re: [PATCH v7 11/15] dma-direct: Add a new wrapper
 __dma_direct_free_pages()
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-12-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8c274da9-db90-cb42-c9b2-815ee0c6fca3@gmail.com>
Date: Wed, 19 May 2021 11:59:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-12-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new wrapper __dma_direct_free_pages() that will be useful later
> for swiotlb_free().
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
