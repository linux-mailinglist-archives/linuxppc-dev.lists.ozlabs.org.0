Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FD21D082
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 09:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4wR22kTzzDqVW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Wrq2I/MW; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4wP76VYGzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 17:33:28 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id j19so5647041pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7wXOsH2H7SE11ftN1oECGPb6WzsU/0FTfmI/DQyobkI=;
 b=Wrq2I/MWsjODAoCJNp73czwqr2cEo4pEX4ewuglN/rdDwp240S9sXpAV5Z4WxfMJxt
 hE9zvbqvDtbbVugxm3eQ71gV1mmK0RmVOn+ZBfaUMb8mcgFxdGDSQqI/6KM5Tc1ThV5B
 I4tD4jx89bSkYju/oXrMeTza3shF5YLc9Dtgkg6QOmBlb37SsEdQ7WO37u7hhuxpvsUS
 dvFx6zF0bV1WqCmvE8ZASeUqPZQEa6m3Ky7t9PtsvRptphA8CAV9SSD+reg/s5FdXdAL
 QkaP5VguX4Gm8fYTpHAsflr5AnQf/ImpmWq+p9RZw5nr901rRACCIe+L2+/HUNTL9WYW
 H0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7wXOsH2H7SE11ftN1oECGPb6WzsU/0FTfmI/DQyobkI=;
 b=g5NfT3djlUFzBbFkB+/yrP0isFxpbWNL81nahmV3fn6TEwOk+/4/qCjgi/nePMs4AM
 j7VfXELx/6bGwWgqHzYrxDr6ZwXvt7PCFfCccsgyWXb3766E3hQA5ruFAi9spoUwnQHY
 lWGfMhnOnGhT+/oDtfqrxDM/4bw1FpdrZbbULvcx1eZGaxq8eubsPoAUYAxtCL0lI3cg
 DFWEvAi6bmKr9iCZFB//V6Mz9UCf4vxLqgueztS8qD00mizrWL+paXUhvScQtzcdtqif
 SnZWM8UARmR1Dp4cMtgGFA8hYnXaBc2/votIBwRnjzdpD/lH8cIene8cr6U6UpFN63xw
 ewZQ==
X-Gm-Message-State: AOAM532qE86yiZKuftZa61bYSZgPmoALuZsRAuvEdpTgAKZp6cuyYfiC
 qd41+rg89pkLAjScuXefEu65bA==
X-Google-Smtp-Source: ABdhPJynOyQPO9gscwWImDYb2sLEkmu9S7o6v691VIIbwcDvN1BySlMM0qldtmpI4Fh+p5ngs0OjbA==
X-Received: by 2002:a63:7246:: with SMTP id c6mr68073102pgn.422.1594625606877; 
 Mon, 13 Jul 2020 00:33:26 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id nh14sm12988306pjb.4.2020.07.13.00.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 00:33:26 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200703061844.111865-1-leobras.c@gmail.com>
 <20200703061844.111865-5-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
Date: Mon, 13 Jul 2020 17:33:21 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703061844.111865-5-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/07/2020 16:18, Leonardo Bras wrote:
> On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
> default DMA window for the device, before attempting to configure a DDW,
> in order to make the maximum resources available for the next DDW to be
> created.
> 
> This is a requirement for using DDW on devices in which hypervisor
> allows only one DMA window.
> 
> If setting up a new DDW fails anywhere after the removal of this
> default DMA window, it's needed to restore the default DMA window.
> For this, an implementation of ibm,reset-pe-dma-windows rtas call is
> needed:
> 
> Platforms supporting the DDW option starting with LoPAR level 2.7 implement
> ibm,ddw-extensions. The first extension available (index 2) carries the
> token for ibm,reset-pe-dma-windows rtas call, which is used to restore
> the default DMA window for a device, if it has been deleted.
> 
> It does so by resetting the TCE table allocation for the PE to it's
> boot time value, available in "ibm,dma-window" device tree node.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 83 +++++++++++++++++++++-----
>  1 file changed, 69 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 4e33147825cc..5b520ac354c6 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1066,6 +1066,38 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>  	return max_addr;
>  }
>  
> +/*
> + * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
> + * ibm,ddw-extensions, which carries the rtas token for
> + * ibm,reset-pe-dma-windows.
> + * That rtas-call can be used to restore the default DMA window for the device.
> + */
> +static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
> +{
> +	int ret;
> +	u32 cfg_addr, reset_dma_win;
> +	u64 buid;
> +	struct device_node *dn;
> +	struct pci_dn *pdn;
> +
> +	ret = ddw_read_ext(par_dn, DDW_EXT_RESET_DMA_WIN, &reset_dma_win);
> +	if (ret)
> +		return;
> +
> +	dn = pci_device_to_OF_node(dev);
> +	pdn = PCI_DN(dn);
> +	buid = pdn->phb->buid;
> +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> +
> +	ret = rtas_call(reset_dma_win, 3, 1, NULL, cfg_addr, BUID_HI(buid),
> +			BUID_LO(buid));
> +	if (ret)
> +		dev_info(&dev->dev,
> +			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
> +			 reset_dma_win, cfg_addr, BUID_HI(buid), BUID_LO(buid),
> +			 ret);
> +}
> +
>  /*
>   * If the PE supports dynamic dma windows, and there is space for a table
>   * that can map all pages in a linear offset, then setup such a table,
> @@ -1079,7 +1111,7 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>   */
>  static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  {
> -	int len, ret;
> +	int len, ret, reset_win_ext;

Make it "reset_token".

>  	struct ddw_query_response query;
>  	struct ddw_create_response create;
>  	int page_shift;
> @@ -1087,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	struct device_node *dn;
>  	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>  	struct direct_window *window;
> -	struct property *win64;
> +	struct property *win64, *default_win = NULL;
>  	struct dynamic_dma_window_prop *ddwprop;
>  	struct failed_ddw_pdn *fpdn;
>  
> @@ -1122,7 +1154,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	if (ret)
>  		goto out_failed;
>  
> -       /*
> +	/*
>  	 * Query if there is a second window of size to map the
>  	 * whole partition.  Query returns number of windows, largest
>  	 * block assigned to PE (partition endpoint), and two bitmasks
> @@ -1133,14 +1165,34 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	if (ret != 0)
>  		goto out_failed;
>  
> +	/*
> +	 * If there is no window available, remove the default DMA window,
> +	 * if it's present. This will make all the resources available to the
> +	 * new DDW window.
> +	 * If anything fails after this, we need to restore it, so also check
> +	 * for extensions presence.
> +	 */
>  	if (query.windows_available == 0) {
> -		/*
> -		 * no additional windows are available for this device.
> -		 * We might be able to reallocate the existing window,
> -		 * trading in for a larger page size.
> -		 */
> -		dev_dbg(&dev->dev, "no free dynamic windows");
> -		goto out_failed;
> +		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
> +		if (!default_win)
> +			goto out_failed;
> +
> +		reset_win_ext = ddw_read_ext(pdn, DDW_EXT_RESET_DMA_WIN, NULL);
> +		if (reset_win_ext)
> +			goto out_failed;
> +
> +		remove_dma_window(pdn, ddw_avail, default_win);
> +
> +		/* Query again, to check if the window is available */
> +		ret = query_ddw(dev, ddw_avail, &query, pdn);
> +		if (ret != 0)
> +			goto out_restore_defwin;
> +
> +		if (query.windows_available == 0) {
> +			/* no windows are available for this device. */
> +			dev_dbg(&dev->dev, "no free dynamic windows");
> +			goto out_restore_defwin;
> +		}
>  	}
>  	if (query.page_size & 4) {
>  		page_shift = 24; /* 16MB */
> @@ -1151,7 +1203,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	} else {
>  		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
>  			  query.page_size);
> -		goto out_failed;
> +		goto out_restore_defwin;
>  	}
>  	/* verify the window * number of ptes will map the partition */
>  	/* check largest block * page size > max memory hotplug addr */
> @@ -1160,14 +1212,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
>  			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
>  			  1ULL << page_shift);
> -		goto out_failed;
> +		goto out_restore_defwin;
>  	}
>  	len = order_base_2(max_addr);
>  	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
>  	if (!win64) {
>  		dev_info(&dev->dev,
>  			"couldn't allocate property for 64bit dma window\n");
> -		goto out_failed;
> +		goto out_restore_defwin;
>  	}
>  	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
>  	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
> @@ -1230,8 +1282,11 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	kfree(win64->value);
>  	kfree(win64);
>  
> -out_failed:
> +out_restore_defwin:
> +	if (default_win && reset_win_ext == 0)


reset_win_ext potentially may be uninitialized here. Yeah I know it is
tied to default_win but still.

After looking at this function for a few minutes, it could use some
refactoring (way too many gotos)  such as:

1. move (query.page_size & xx) checks before "if
(query.windows_available == 0)"

2. move "win64 = kzalloc(sizeof(struct property), GFP_KERNEL)" before
"if (query.windows_available == 0)"

3. call "reset_dma_window(dev, pdn)" inside the "if
(query.windows_available == 0)" branch.

Then you can drop all "goto out_restore_defwin" and move default_win and
reset_win_ext inside "if (query.windows_available == 0)".

The rest of the series is good as it is, however it may conflict with
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200713062348.100552-1-aik@ozlabs.ru/
and the patchset it is made on top of -
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=188385 .
thanks,


> +		reset_dma_window(dev, pdn);
>  
> +out_failed:
>  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
>  	if (!fpdn)
>  		goto out_unlock;
> 

-- 
Alexey
