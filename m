Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD841805
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:21:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nkxn6dqNzDqxt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b/BOc2qi"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nkw15CP9zDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 08:20:17 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id 107so13509864otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 15:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vfffTPwX82Idi1y/riGTFQzU5OrguyWB0uehUGHFMv4=;
 b=b/BOc2qiPknWcS0qM4I1ROFqX2v2bn/BFdCQuZ0nURILM3EUTeeOCNms4U4wKZI917
 yvKUXlUGmIs3dSGULT7FP45GMLEq3dngWO2Ik4gO3YK9HMArZJwUrncv8MoLfdYakNbn
 bah0wvKoaJ5/3A5xUp03rnECtpX/Zb0f5h1VqnTIwBX1z57IZl4oSQv94bhW3mQ9Jej9
 OSSVCyseEW4gYt/W7Sjvx5stNFHMvCZVWID8xlWbNJWYzkeiG0QPnno2By/wDFtKKELK
 VeEFAEz0URsLSW+fkXIJpN/1TNGRbN/mJUHWQxMabMC6gs9g/QAUN1d7sE9pkBMlRhu9
 uEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vfffTPwX82Idi1y/riGTFQzU5OrguyWB0uehUGHFMv4=;
 b=bI0R+ndGSuqLt9brqdsdgXXq2SFa1P00Az7/M9MKDL8OKvYus2byLervbg+O/679YY
 VKhXycH5Jdsa/cMgU7qWlzLs58QmYURaFGworV7nX3UigfIgnET5wI/nwZyzZJfKtu+m
 nEYD29hHaDCdhpNh+SeVoXFKibrhYL0BDJRQ3XH0d5H9GTKskrgDsXed0fI1p6hs+0eM
 bcPVAMgsHbS8ZBiq/LUITroadZRYtDBydA4Wqd3cdnIDM6725Y1RvHyo4ep81iGeKra3
 /Y5f6MVvnP5gNBR/FbgYjMLWWmU9ZdjSofsuI2bcAO85jNWHAbdXl/Jvl834RC3QLPK1
 dKIQ==
X-Gm-Message-State: APjAAAVmzUAY/x0qh94mLWWISs2uXj/2+R3JYejDMcxFEDY66r704hGP
 2y9WJNI8aydtPIKwZFHrRIssK0bj
X-Google-Smtp-Source: APXvYqwBXsNiPTo0yn/3zKEUnGFm4Ao1KrYIYiC3IG0c1gK/mb67+IOPk1NPjHn0OqAhRUhwh4+G2w==
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr19745696otm.94.1560291614292; 
 Tue, 11 Jun 2019 15:20:14 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id w140sm1977822oie.32.2019.06.11.15.20.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 15:20:13 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
Date: Tue, 11 Jun 2019 17:20:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611060521.GA19512@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/19 1:05 AM, Christoph Hellwig wrote:
> On Mon, Jun 10, 2019 at 11:09:47AM -0500, Larry Finger wrote:
> 
> What might be confusing in your output is that dev->dma_mask is a pointer,
> and we are setting it in dma_set_mask.  That is before we only check
> if the pointer is set, and later we override it.  Of course this doesn't
> actually explain the failure.  But what is even more strange to me
> is that you get a return value from dma_supported() that isn't 0 or 1,
> as that function is supposed to return a boolean, and I really can't see
> how mask >= __phys_to_dma(dev, min_mask), would return anything but 0
> or 1.  Does the output change if you use the correct printk specifiers?
> 
> i.e. with a debug patch like this:
> 
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..9e5b30b12b10 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -378,6 +378,7 @@ EXPORT_SYMBOL(dma_direct_map_resource);
>   int dma_direct_supported(struct device *dev, u64 mask)
>   {
>   	u64 min_mask;
> +	bool ret;
>   
>   	if (IS_ENABLED(CONFIG_ZONE_DMA))
>   		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
> @@ -391,7 +392,12 @@ int dma_direct_supported(struct device *dev, u64 mask)
>   	 * use __phys_to_dma() here so that the SME encryption mask isn't
>   	 * part of the check.
>   	 */
> -	return mask >= __phys_to_dma(dev, min_mask);
> +	ret = (mask >= __phys_to_dma(dev, min_mask));
> +	if (!ret)
> +		dev_info(dev,
> +			"%s: failed (mask = 0x%llx, min_mask = 0x%llx/0x%llx, dma bits = %d\n",
> +			__func__, mask, min_mask, __phys_to_dma(dev, min_mask), ARCH_ZONE_DMA_BITS);
> +	return ret;
>   }
>   
>   size_t dma_direct_max_mapping_size(struct device *dev)
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index f7afdadb6770..6c57ccdee2ae 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -317,8 +317,14 @@ void arch_dma_set_mask(struct device *dev, u64 mask);
>   
>   int dma_set_mask(struct device *dev, u64 mask)
>   {
> -	if (!dev->dma_mask || !dma_supported(dev, mask))
> +	if (!dev->dma_mask) {
> +		dev_info(dev, "no DMA mask set!\n");
>   		return -EIO;
> +	}
> +	if (!dma_supported(dev, mask)) {
> +		printk("DMA not supported\n");
> +		return -EIO;
> +	}
>   
>   	arch_dma_set_mask(dev, mask);
>   	dma_check_mask(dev, mask);
> 

After I got the correct formatting, the output with this patch only gives the 
following in dmesg:

b43-pci-bridge 0001:11:00.0: dma_direct_supported: failed (mask = 0x3fffffff, 
min_mask = 0x5ffff000/0x5ffff000, dma bits = 0x1f
DMA not supported
b43legacy-phy0 ERROR: The machine/kernel does not support the required 30-bit 
DMA mask

Your first patch did not work as the configuration does not have 
CONFIG_ZONE_DMA. As a result, the initial value of min_mask always starts at 32 
bits and is taken down to 31 with the maximum pfn minimization. When I forced 
the initial value of min_mask to 30 bits, the device worked.

It is obvious that the case of a mask smaller than min_mask should be handled by 
the IOMMU. In my system, CONFIG_IOMMU_SUPPORT is selected. All other CONFIG 
variables containing IOMMU are not selected. When dma_direct_supported() fails, 
should the system not try for an IOMMU solution? Is the driver asking for the 
wrong type of memory? It is doing a dma_and_set_mask_coherent() call.

Larry
