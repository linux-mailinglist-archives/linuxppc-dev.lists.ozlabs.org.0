Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A52FD633
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 17:56:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLWr25msYzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 03:56:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLWnc1rgWzDqyw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 03:53:53 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id o11so24014116ote.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 08:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Nevn/Hsb1/pSSLD/4PKRZrIOGJGLolaHEVGjwXHh7g=;
 b=O0TcIlGFPCPdxh1GIuZybyDLfKwR74/H09/GdohowgeZd/wwYRwUc2NAIqC0kp31tb
 4udEUN/p5ZCd3F0qS/az/bCbbMSIqmLpNq4cJgzpau2n06OkKKl752YhJ767DG1F2XOD
 QmGZq2t6eeJK5KshgqcOW0lp5qLhPXTNu/SCRJ0RiFm97YzfnqnQOo7SmaYPAVCdXbGb
 NF8mza6QH+P+2aPewY5Jd1KwKSU7pa+pkdpQgNDyR4RAX2HoIkq2GnInxX/+5PB7iKC/
 qVf1Egnby94bfYqMdO2cmovRQKPJE6V0mlkRKJqUiD4S9YGxxj47RzQrFF/aKAUIBrNP
 rB0A==
X-Gm-Message-State: AOAM530oJgyTOOkBuEsZa/2faOZHFXUZCXqbbaryJa8JmR4uGMcptpI4
 CQKVwd4pccvVBE8A1FW6Ow==
X-Google-Smtp-Source: ABdhPJwaG3j9UrY6/UvK8tGFavZ8pchhV25GbY2yn1OpU1TWw5L3kI0PQYj6i0y3Xx2xzLR+yGRYiw==
X-Received: by 2002:a05:6830:20c2:: with SMTP id
 z2mr7356498otq.322.1611161630884; 
 Wed, 20 Jan 2021 08:53:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d10sm444480ooh.32.2021.01.20.08.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 08:53:49 -0800 (PST)
Received: (nullmailer pid 328496 invoked by uid 1000);
 Wed, 20 Jan 2021 16:53:48 -0000
Date: Wed, 20 Jan 2021 10:53:48 -0600
From: Rob Herring <robh@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210120165348.GA220770@robh.at.kernel.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-6-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, grant.likely@arm.com, paulus@samba.org,
 will@kernel.org, mingo@kernel.org, m.szyprowski@samsung.com,
 sstabellini@kernel.org, saravanak@google.com, joro@8bytes.org,
 rafael.j.wysocki@intel.com, hch@lst.de, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 konrad.wilk@oracle.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, drinkcat@chromium.org,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 gregkh@linuxfoundation.org, rdunlap@infradead.org, frowand.list@gmail.com,
 tfiga@chromium.org, iommu@lists.linux-foundation.org, xypron.glpk@gmx.de,
 robin.murphy@arm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> Introduce the new compatible string, restricted-dma-pool, for restricted
> DMA. One can specify the address and length of the restricted DMA memory
> region by restricted-dma-pool in the device tree.

If this goes into DT, I think we should be able to use dma-ranges for 
this purpose instead. Normally, 'dma-ranges' is for physical bus 
restrictions, but there's no reason it can't be used for policy or to 
express restrictions the firmware has enabled.

> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index e8d3096d922c..44975e2a1fd2 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - restricted-dma-pool: This indicates a region of memory meant to be
> +          used as a pool of restricted DMA buffers for a set of devices. The
> +          memory region would be the only region accessible to those devices.
> +          When using this, the no-map and reusable properties must not be set,
> +          so the operating system can create a virtual mapping that will be used
> +          for synchronization. The main purpose for restricted DMA is to
> +          mitigate the lack of DMA access control on systems without an IOMMU,
> +          which could result in the DMA accessing the system memory at
> +          unexpected times and/or unexpected addresses, possibly leading to data
> +          leakage or corruption. The feature on its own provides a basic level
> +          of protection against the DMA overwriting buffer contents at
> +          unexpected times. However, to protect against general data leakage and
> +          system memory corruption, the system needs to provide way to restrict
> +          the DMA to a predefined memory region.
>          - vendor specific string in the form <vendor>,[<device>-]<usage>
>  no-map (optional) - empty property
>      - Indicates the operating system must not create a virtual mapping
> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  			compatible = "acme,multimedia-memory";
>  			reg = <0x77000000 0x4000000>;
>  		};
> +
> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
> +			compatible = "restricted-dma-pool";
> +			reg = <0x50000000 0x400000>;
> +		};
>  	};
>  
>  	/* ... */
> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  		memory-region = <&multimedia_reserved>;
>  		/* ... */
>  	};
> +
> +	pcie_device: pcie_device@0,0 {
> +		memory-region = <&restricted_dma_mem_reserved>;

PCI hosts often have inbound window configurations that limit the 
address range and translate PCI to bus addresses. Those windows happen 
to be configured by dma-ranges. In any case, wouldn't you want to put 
the configuration in the PCI host node? Is there a usecase of 
restricting one PCIe device and not another? 

Rob
