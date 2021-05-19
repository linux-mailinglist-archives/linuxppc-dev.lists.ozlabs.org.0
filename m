Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8F38960C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlhzF0ctLz3c01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TKwRdnu4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TKwRdnu4; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlhyP1lC6z3074
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:00:12 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so2753838pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
 b=TKwRdnu4+Sp1YkQdeC//ZaZe5gFK1OBbc6fiWqiSSxtaemxo8tsS6cyyKonvkggi45
 AkmXBkDwPjivTxMkW/6u87n74jtYP0vz5yoiKDWAMEYfh+QJdqbXNMoLboJ95qsaB+Sz
 evhXDQC1zkb888kY45tuzx3cOkf8aRLE0tysepxM3+bqwCkk54R2Q027+/7CcS0ORj65
 6mx2ltgEPNZ+I2TPARzQB2NU/eRypDG4kJedWyyBabBiqBkk+XEYxHjO+wV8NZqkj5Xb
 Wiz3FWUYSWAt8nsw3SelNmNlkX4sXNF7RuifyB1BY+CyHdw4EnNC9bgPveVhRQQuluiO
 dhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
 b=QoWIZ8LhBXWkRNNZBADNcguTOMlBK9jghM2oiGbDgul0mTeJGpJo6nres9FH1vl9P9
 AUKWodNTXSVGsPGEVSx6YzwXAPL7yBwg8/Toar/jsQyAoRfGTrZ94x3BUx5JVP6aO43q
 qAIy1qd6aBLMUGyXqCR5f7J8n54PH9lfpHyo+Y90jNtcrXnWWmzwr6+m4nBdfD/qCq0e
 DGiBV4fW8yDIptwIkga+XVnxLN1+SP3rkl0KLguvy3OKpK+NAJQI9e3z+Yu8U5q4fw1W
 sdA0IYSPveR44jGsZwnbxFpEQM22pu2KDE2au/XFyFq6Ap0Q4CaliUa4wyROwelEZn8k
 Rg6Q==
X-Gm-Message-State: AOAM533CGU9kOMAj/8PEV/Pn8OLZkYCKiUB9MjA+Gh4T4TeRoI8e6oLM
 QX8XVYbjq/4byKN7B2O//8Y=
X-Google-Smtp-Source: ABdhPJzSFi5vywroBZ7tSNHRQs1V9GPTz+dOSZzWMkXvwkz7CoWyRh73gQHWXYp/m+DT8rff9721jw==
X-Received: by 2002:a17:903:10a:b029:f4:109c:dc08 with SMTP id
 y10-20020a170903010ab02900f4109cdc08mr1027246plc.10.1621450810600; 
 Wed, 19 May 2021 12:00:10 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y26sm89076pge.94.2021.05.19.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:00:09 -0700 (PDT)
Subject: Re: [PATCH v7 03/15] swiotlb: Add DMA_RESTRICTED_POOL
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-4-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d9975ce8-7ae9-2ece-a1c5-a16d0aed8143@gmail.com>
Date: Wed, 19 May 2021 12:00:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-4-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
