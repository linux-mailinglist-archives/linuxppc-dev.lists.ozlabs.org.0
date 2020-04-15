Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43D1A90ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 04:27:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4925qW0dsBzDr1P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 12:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aGeMm+Kb; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4925nj4XRRzDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 12:26:14 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id p8so820702pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 19:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iNT/Cyy6/sNs471OJMdaugj1SEGLrROiteW7Bli011w=;
 b=aGeMm+Kb5kWjedIH2HVZbyVcvxudPtqjqQeJSzv1AvE9mRuPj4plpcHOqcjqaPonC6
 XsdYtv88rcYVzg346oBi00czD1ujmupuG3seK4dsQ0ADsA7mxKJZI4Ho9ZyZsTBdh51p
 QC8zCkDhYMgr8UxN8Mhf1nqzVsRgNABDfdbMemvUX/7+sygyNDZaEkpXwG1x6mSE3rZi
 9XL+5tetY6pme41Z3EOp2xoQjIRZhIzPZO0n/tZKkGu3QWYsQOehJ9d1KhBxsviuTHK2
 J+pPGZI5mDhm2lMBxfK6SlyZcuzBDGKrcAYPfgX4zNjgrg6rapveeA3eezhlq+Pxe9I6
 BedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iNT/Cyy6/sNs471OJMdaugj1SEGLrROiteW7Bli011w=;
 b=Td9Qj9qe8OCqH/Yon4u5B4MW/12lOFRh/X38MwEWWBvLSCXMGjCfbHPSE9v4htmPsp
 5VdjRdBQAY2ptG9QNu4DvtIfDaqXCx5WB0285WinyBE7oZ/45bbBvqjcanA6akEYe8LI
 AdDz3mA3O0d2FvPBXYLH4uEA8XtrYd/OoirYoZcDv+jLyMXjuD+lI4ob3sz+EHcO/S/A
 Ym1q4sFd3rNmUSiCEGBLWKEFOjsk0hPxAeq+jU84+Yz68z49VGQWhxiOUShl00JpeVpJ
 ZHzlSz16w6wUwZeyl6VYjQe/oc2dcsWNmN1mY541iW02N9RAeJX1phkRt0/IOs0QV1uK
 efeg==
X-Gm-Message-State: AGi0Pua1k/tH+LRL/muZC255w3g/COqt2iy0qHu44jVyS2Cyl+Q7HGku
 JrTP4WHQVhJVfLAQHkZyCuPJ+w==
X-Google-Smtp-Source: APiQypImq+5ky/Kh+p/Ub9qxGxKXE4MqgsaaizN+sAwrLoQR33WZY/b6NoMGJk72e6doQs7vFp5L1w==
X-Received: by 2002:a62:fc51:: with SMTP id e78mr26366866pfh.155.1586917570386; 
 Tue, 14 Apr 2020 19:26:10 -0700 (PDT)
Received: from [192.168.10.94] (124-171-87-207.dyn.iinet.net.au.
 [124.171.87.207])
 by smtp.gmail.com with ESMTPSA id p11sm9988668pff.173.2020.04.14.19.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 19:26:09 -0700 (PDT)
Subject: Re: [PATCH 1/4] dma-mapping: move the remaining DMA API calls out of
 line
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-2-hch@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 mQINBE+rT0sBEADFEI2UtPRsLLvnRf+tI9nA8T91+jDK3NLkqV+2DKHkTGPP5qzDZpRSH6mD
 EePO1JqpVuIow/wGud9xaPA5uvuVgRS1q7RU8otD+7VLDFzPRiRE4Jfr2CW89Ox6BF+q5ZPV
 /pS4v4G9eOrw1v09lEKHB9WtiBVhhxKK1LnUjPEH3ifkOkgW7jFfoYgTdtB3XaXVgYnNPDFo
 PTBYsJy+wr89XfyHr2Ev7BB3Xaf7qICXdBF8MEVY8t/UFsesg4wFWOuzCfqxFmKEaPDZlTuR
 tfLAeVpslNfWCi5ybPlowLx6KJqOsI9R2a9o4qRXWGP7IwiMRAC3iiPyk9cknt8ee6EUIxI6
 t847eFaVKI/6WcxhszI0R6Cj+N4y+1rHfkGWYWupCiHwj9DjILW9iEAncVgQmkNPpUsZECLT
 WQzMuVSxjuXW4nJ6f4OFHqL2dU//qR+BM/eJ0TT3OnfLcPqfucGxubhT7n/CXUxEy+mvWwnm
 s9p4uqVpTfEuzQ0/bE6t7dZdPBua7eYox1AQnk8JQDwC3Rn9kZq2O7u5KuJP5MfludMmQevm
 pHYEMF4vZuIpWcOrrSctJfIIEyhDoDmR34bCXAZfNJ4p4H6TPqPh671uMQV82CfTxTrMhGFq
 8WYU2AH86FrVQfWoH09z1WqhlOm/KZhAV5FndwVjQJs1MRXD8QARAQABtCRBbGV4ZXkgS2Fy
 ZGFzaGV2c2tpeSA8YWlrQG96bGFicy5ydT6JAjgEEwECACIFAk+rT0sCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAAAoJEIYTPdgrwSC5fAIP/0wf/oSYaCq9PhO0UP9zLSEz66SSZUf7
 AM9O1rau1lJpT8RoNa0hXFXIVbqPPKPZgorQV8SVmYRLr0oSmPnTiZC82x2dJGOR8x4E01gK
 TanY53J/Z6+CpYykqcIpOlGsytUTBA+AFOpdaFxnJ9a8p2wA586fhCZHVpV7W6EtUPH1SFTQ
 q5xvBmr3KkWGjz1FSLH4FeB70zP6uyuf/B2KPmdlPkyuoafl2UrU8LBADi/efc53PZUAREih
 sm3ch4AxaL4QIWOmlE93S+9nHZSRo9jgGXB1LzAiMRII3/2Leg7O4hBHZ9Nki8/fbDo5///+
 kD4L7UNbSUM/ACWHhd4m1zkzTbyRzvL8NAVQ3rckLOmju7Eu9whiPueGMi5sihy9VQKHmEOx
 OMEhxLRQbzj4ypRLS9a+oxk1BMMu9cd/TccNy0uwx2UUjDQw/cXw2rRWTRCxoKmUsQ+eNWEd
 iYLW6TCfl9CfHlT6A7Zmeqx2DCeFafqEd69DqR9A8W5rx6LQcl0iOlkNqJxxbbW3ddDsLU/Y
 r4cY20++WwOhSNghhtrroP+gouTOIrNE/tvG16jHs8nrYBZuc02nfX1/gd8eguNfVX/ZTHiR
 gHBWe40xBKwBEK2UeqSpeVTohYWGBkcd64naGtK9qHdo1zY1P55lHEc5Uhlk743PgAnOi27Q
 ns5zuQINBE+rT0sBEACnV6GBSm+25ACT+XAE0t6HHAwDy+UKfPNaQBNTTt31GIk5aXb2Kl/p
 AgwZhQFEjZwDbl9D/f2GtmUHWKcCmWsYd5M/6Ljnbp0Ti5/xi6FyfqnO+G/wD2VhGcKBId1X
 Em/B5y1kZVbzcGVjgD3HiRTqE63UPld45bgK2XVbi2+x8lFvzuFq56E3ZsJZ+WrXpArQXib2
 hzNFwQleq/KLBDOqTT7H+NpjPFR09Qzfa7wIU6pMNF2uFg5ihb+KatxgRDHg70+BzQfa6PPA
 o1xioKXW1eHeRGMmULM0Eweuvpc7/STD3K7EJ5bBq8svoXKuRxoWRkAp9Ll65KTUXgfS+c0x
 gkzJAn8aTG0z/oEJCKPJ08CtYQ5j7AgWJBIqG+PpYrEkhjzSn+DZ5Yl8r+JnZ2cJlYsUHAB9
 jwBnWmLCR3gfop65q84zLXRQKWkASRhBp4JK3IS2Zz7Nd/Sqsowwh8x+3/IUxVEIMaVoUaxk
 Wt8kx40h3VrnLTFRQwQChm/TBtXqVFIuv7/Mhvvcq11xnzKjm2FCnTvCh6T2wJw3de6kYjCO
 7wsaQ2y3i1Gkad45S0hzag/AuhQJbieowKecuI7WSeV8AOFVHmgfhKti8t4Ff758Z0tw5Fpc
 BFDngh6Lty9yR/fKrbkkp6ux1gJ2QncwK1v5kFks82Cgj+DSXK6GUQARAQABiQIfBBgBAgAJ
 BQJPq09LAhsMAAoJEIYTPdgrwSC5NYEP/2DmcEa7K9A+BT2+G5GXaaiFa098DeDrnjmRvumJ
 BhA1UdZRdfqICBADmKHlJjj2xYo387sZpS6ABbhrFxM6s37g/pGPvFUFn49C47SqkoGcbeDz
 Ha7JHyYUC+Tz1dpB8EQDh5xHMXj7t59mRDgsZ2uVBKtXj2ZkbizSHlyoeCfs1gZKQgQE8Ffc
 F8eWKoqAQtn3j4nE3RXbxzTJJfExjFB53vy2wV48fUBdyoXKwE85fiPglQ8bU++0XdOr9oyy
 j1llZlB9t3tKVv401JAdX8EN0++ETiOovQdzE1m+6ioDCtKEx84ObZJM0yGSEGEanrWjiwsa
 nzeK0pJQM9EwoEYi8TBGhHC9ksaAAQipSH7F2OHSYIlYtd91QoiemgclZcSgrxKSJhyFhmLr
 QEiEILTKn/pqJfhHU/7R7UtlDAmFMUp7ByywB4JLcyD10lTmrEJ0iyRRTVfDrfVP82aMBXgF
 tKQaCxcmLCaEtrSrYGzd1sSPwJne9ssfq0SE/LM1J7VdCjm6OWV33SwKrfd6rOtvOzgadrG6
 3bgUVBw+bsXhWDd8tvuCXmdY4bnUblxF2B6GOwSY43v6suugBttIyW5Bl2tXSTwP+zQisOJo
 +dpVG2pRr39h+buHB3NY83NEPXm1kUOhduJUA17XUY6QQCAaN4sdwPqHq938S3EmtVhsuQIN
 BFq54uIBEACtPWrRdrvqfwQF+KMieDAMGdWKGSYSfoEGGJ+iNR8v255IyCMkty+yaHafvzpl
 PFtBQ/D7Fjv+PoHdFq1BnNTk8u2ngfbre9wd9MvTDsyP/TmpF0wyyTXhhtYvE267Av4X/BQT
 lT9IXKyAf1fP4BGYdTNgQZmAjrRsVUW0j6gFDrN0rq2J9emkGIPvt9rQt6xGzrd6aXonbg5V
 j6Uac1F42ESOZkIh5cN6cgnGdqAQb8CgLK92Yc8eiCVCH3cGowtzQ2m6U32qf30cBWmzfSH0
 HeYmTP9+5L8qSTA9s3z0228vlaY0cFGcXjdodBeVbhqQYseMF9FXiEyRs28uHAJEyvVZwI49
 CnAgVV/n1eZa5qOBpBL+ZSURm8Ii0vgfvGSijPGbvc32UAeAmBWISm7QOmc6sWa1tobCiVmY
 SNzj5MCNk8z4cddoKIc7Wt197+X/X5JPUF5nQRvg3SEHvfjkS4uEst9GwQBpsbQYH9MYWq2P
 PdxZ+xQE6v7cNB/pGGyXqKjYCm6v70JOzJFmheuUq0Ljnfhfs15DmZaLCGSMC0Amr+rtefpA
 y9FO5KaARgdhVjP2svc1F9KmTUGinSfuFm3quadGcQbJw+lJNYIfM7PMS9fftq6vCUBoGu3L
 j4xlgA/uQl/LPneu9mcvit8JqcWGS3fO+YeagUOon1TRqQARAQABiQRsBBgBCAAgFiEEZSrP
 ibrORRTHQ99dhhM92CvBILkFAlq54uICGwICQAkQhhM92CvBILnBdCAEGQEIAB0WIQQIhvWx
 rCU+BGX+nH3N7sq0YorTbQUCWrni4gAKCRDN7sq0YorTbVVSD/9V1xkVFyUCZfWlRuryBRZm
 S4GVaNtiV2nfUfcThQBfF0sSW/aFkLP6y+35wlOGJE65Riw1C2Ca9WQYk0xKvcZrmuYkK3DZ
 0M9/Ikkj5/2v0vxz5Z5w/9+IaCrnk7pTnHZuZqOh23NeVZGBls/IDIvvLEjpD5UYicH0wxv+
 X6cl1RoP2Kiyvenf0cS73O22qSEw0Qb9SId8wh0+ClWet2E7hkjWFkQfgJ3hujR/JtwDT/8h
 3oCZFR0KuMPHRDsCepaqb/k7VSGTLBjVDOmr6/C9FHSjq0WrVB9LGOkdnr/xcISDZcMIpbRm
 EkIQ91LkT/HYIImL33ynPB0SmA+1TyMgOMZ4bakFCEn1vxB8Ir8qx5O0lHMOiWMJAp/PAZB2
 r4XSSHNlXUaWUg1w3SG2CQKMFX7vzA31ZeEiWO8tj/c2ZjQmYjTLlfDK04WpOy1vTeP45LG2
 wwtMA1pKvQ9UdbYbovz92oyZXHq81+k5Fj/YA1y2PI4MdHO4QobzgREoPGDkn6QlbJUBf4To
 pEbIGgW5LRPLuFlOPWHmIS/sdXDrllPc29aX2P7zdD/ivHABslHmt7vN3QY+hG0xgsCO1JG5
 pLORF2N5XpM95zxkZqvYfC5tS/qhKyMcn1kC0fcRySVVeR3tUkU8/caCqxOqeMe2B6yTiU1P
 aNDq25qYFLeYxg67D/4w/P6BvNxNxk8hx6oQ10TOlnmeWp1q0cuutccblU3ryRFLDJSngTEu
 ZgnOt5dUFuOZxmMkqXGPHP1iOb+YDznHmC0FYZFG2KAc9pO0WuO7uT70lL6larTQrEneTDxQ
 CMQLP3qAJ/2aBH6SzHIQ7sfbsxy/63jAiHiT3cOaxAKsWkoV2HQpnmPOJ9u02TPjYmdpeIfa
 X2tXyeBixa3i/6dWJ4nIp3vGQicQkut1YBwR7dJq67/FCV3Mlj94jI0myHT5PIrCS2S8LtWX
 ikTJSxWUKmh7OP5mrqhwNe0ezgGiWxxvyNwThOHc5JvpzJLd32VDFilbxgu4Hhnf6LcgZJ2c
 Zd44XWqUu7FzVOYaSgIvTP0hNrBYm/E6M7yrLbs3JY74fGzPWGRbBUHTZXQEqQnZglXaVB5V
 ZhSFtHopZnBSCUSNDbB+QGy4B/E++Bb02IBTGl/JxmOwG+kZUnymsPvTtnNIeTLHxN/H/ae0
 c7E5M+/NpslPCmYnDjs5qg0/3ihh6XuOGggZQOqrYPC3PnsNs3NxirwOkVPQgO6mXxpuifvJ
 DG9EMkK8IBXnLulqVk54kf7fE0jT/d8RTtJIA92GzsgdK2rpT1MBKKVffjRFGwN7nQVOzi4T
 XrB5p+6ML7Bd84xOEGsj/vdaXmz1esuH7BOZAGEZfLRCHJ0GVCSssg==
Message-ID: <c2572d30-f03c-450d-e257-3a8673b42d44@ozlabs.ru>
Date: Wed, 15 Apr 2020 12:26:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200414122506.438134-2-hch@lst.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/04/2020 22:25, Christoph Hellwig wrote:
> For a long time the DMA API has been implemented inline in dma-mapping.h,
> but the function bodies can be quite large.  Move them all out of line.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/dma-direct.h  |  58 +++++++++
>  include/linux/dma-mapping.h | 247 ++++--------------------------------
>  kernel/dma/direct.c         |   9 --
>  kernel/dma/mapping.c        | 164 ++++++++++++++++++++++++
>  4 files changed, 244 insertions(+), 234 deletions(-)
> 
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 24b8684aa21d..da689ad5fffd 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -85,4 +85,62 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>  		unsigned long attrs);
>  int dma_direct_supported(struct device *dev, u64 mask);
> +dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
> +		unsigned long offset, size_t size, enum dma_data_direction dir,
> +		unsigned long attrs);
> +int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
> +		enum dma_data_direction dir, unsigned long attrs);
> +dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs);
> +
> +#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> +    defined(CONFIG_SWIOTLB)
> +void dma_direct_sync_single_for_device(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir);
> +void dma_direct_sync_sg_for_device(struct device *dev,
> +		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
> +#else
> +static inline void dma_direct_sync_single_for_device(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> +{
> +}
> +static inline void dma_direct_sync_sg_for_device(struct device *dev,
> +		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> +{
> +}
> +#endif
> +
> +#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> +    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
> +    defined(CONFIG_SWIOTLB)
> +void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs);
> +void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
> +		int nents, enum dma_data_direction dir, unsigned long attrs);
> +void dma_direct_sync_single_for_cpu(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir);
> +void dma_direct_sync_sg_for_cpu(struct device *dev,
> +		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
> +#else
> +static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs)
> +{
> +}
> +static inline void dma_direct_unmap_sg(struct device *dev,
> +		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
> +		unsigned long attrs)
> +{
> +}
> +static inline void dma_direct_sync_single_for_cpu(struct device *dev,
> +		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> +{
> +}
> +static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
> +		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> +{
> +}
> +#endif
> +
> +size_t dma_direct_max_mapping_size(struct device *dev);
> +
>  #endif /* _LINUX_DMA_DIRECT_H */
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 330ad58fbf4d..793ad775cd54 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -188,73 +188,6 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_DMA_DECLARE_COHERENT */
>  
> -static inline bool dma_is_direct(const struct dma_map_ops *ops)
> -{
> -	return likely(!ops);
> -}
> -
> -/*
> - * All the dma_direct_* declarations are here just for the indirect call bypass,
> - * and must not be used directly drivers!
> - */
> -dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
> -		unsigned long offset, size_t size, enum dma_data_direction dir,
> -		unsigned long attrs);
> -int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
> -		enum dma_data_direction dir, unsigned long attrs);
> -dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
> -		size_t size, enum dma_data_direction dir, unsigned long attrs);
> -
> -#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> -    defined(CONFIG_SWIOTLB)
> -void dma_direct_sync_single_for_device(struct device *dev,
> -		dma_addr_t addr, size_t size, enum dma_data_direction dir);
> -void dma_direct_sync_sg_for_device(struct device *dev,
> -		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
> -#else
> -static inline void dma_direct_sync_single_for_device(struct device *dev,
> -		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> -{
> -}
> -static inline void dma_direct_sync_sg_for_device(struct device *dev,
> -		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> -{
> -}
> -#endif
> -
> -#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> -    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
> -    defined(CONFIG_SWIOTLB)
> -void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
> -		size_t size, enum dma_data_direction dir, unsigned long attrs);
> -void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
> -		int nents, enum dma_data_direction dir, unsigned long attrs);
> -void dma_direct_sync_single_for_cpu(struct device *dev,
> -		dma_addr_t addr, size_t size, enum dma_data_direction dir);
> -void dma_direct_sync_sg_for_cpu(struct device *dev,
> -		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
> -#else
> -static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
> -		size_t size, enum dma_data_direction dir, unsigned long attrs)
> -{
> -}
> -static inline void dma_direct_unmap_sg(struct device *dev,
> -		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
> -		unsigned long attrs)
> -{
> -}
> -static inline void dma_direct_sync_single_for_cpu(struct device *dev,
> -		dma_addr_t addr, size_t size, enum dma_data_direction dir)
> -{
> -}
> -static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
> -		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> -{
> -}
> -#endif
> -
> -size_t dma_direct_max_mapping_size(struct device *dev);
> -
>  #ifdef CONFIG_HAS_DMA
>  #include <asm/dma-mapping.h>
>  
> @@ -271,164 +204,6 @@ static inline void set_dma_ops(struct device *dev,
>  	dev->dma_ops = dma_ops;
>  }
>  
> -static inline dma_addr_t dma_map_page_attrs(struct device *dev,
> -		struct page *page, size_t offset, size_t size,
> -		enum dma_data_direction dir, unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -	dma_addr_t addr;
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> -	else
> -		addr = ops->map_page(dev, page, offset, size, dir, attrs);
> -	debug_dma_map_page(dev, page, offset, size, dir, addr);
> -
> -	return addr;
> -}
> -
> -static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
> -		size_t size, enum dma_data_direction dir, unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> -	else if (ops->unmap_page)
> -		ops->unmap_page(dev, addr, size, dir, attrs);
> -	debug_dma_unmap_page(dev, addr, size, dir);
> -}
> -
> -/*
> - * dma_maps_sg_attrs returns 0 on error and > 0 on success.
> - * It should never return a value < 0.
> - */
> -static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
> -				   int nents, enum dma_data_direction dir,
> -				   unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -	int ents;
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
> -	else
> -		ents = ops->map_sg(dev, sg, nents, dir, attrs);
> -	BUG_ON(ents < 0);
> -	debug_dma_map_sg(dev, sg, nents, ents, dir);
> -
> -	return ents;
> -}
> -
> -static inline void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
> -				      int nents, enum dma_data_direction dir,
> -				      unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	debug_dma_unmap_sg(dev, sg, nents, dir);
> -	if (dma_is_direct(ops))
> -		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
> -	else if (ops->unmap_sg)
> -		ops->unmap_sg(dev, sg, nents, dir, attrs);
> -}
> -
> -static inline dma_addr_t dma_map_resource(struct device *dev,
> -					  phys_addr_t phys_addr,
> -					  size_t size,
> -					  enum dma_data_direction dir,
> -					  unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -	dma_addr_t addr = DMA_MAPPING_ERROR;
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -
> -	/* Don't allow RAM to be mapped */
> -	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
> -		return DMA_MAPPING_ERROR;
> -
> -	if (dma_is_direct(ops))
> -		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
> -	else if (ops->map_resource)
> -		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
> -
> -	debug_dma_map_resource(dev, phys_addr, size, dir, addr);
> -	return addr;
> -}
> -
> -static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
> -				      size_t size, enum dma_data_direction dir,
> -				      unsigned long attrs)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (!dma_is_direct(ops) && ops->unmap_resource)
> -		ops->unmap_resource(dev, addr, size, dir, attrs);
> -	debug_dma_unmap_resource(dev, addr, size, dir);
> -}
> -
> -static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
> -					   size_t size,
> -					   enum dma_data_direction dir)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
> -	else if (ops->sync_single_for_cpu)
> -		ops->sync_single_for_cpu(dev, addr, size, dir);
> -	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
> -}
> -
> -static inline void dma_sync_single_for_device(struct device *dev,
> -					      dma_addr_t addr, size_t size,
> -					      enum dma_data_direction dir)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		dma_direct_sync_single_for_device(dev, addr, size, dir);
> -	else if (ops->sync_single_for_device)
> -		ops->sync_single_for_device(dev, addr, size, dir);
> -	debug_dma_sync_single_for_device(dev, addr, size, dir);
> -}
> -
> -static inline void
> -dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
> -		    int nelems, enum dma_data_direction dir)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
> -	else if (ops->sync_sg_for_cpu)
> -		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
> -	debug_dma_sync_sg_for_cpu(dev, sg, nelems, dir);
> -}
> -
> -static inline void
> -dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
> -		       int nelems, enum dma_data_direction dir)
> -{
> -	const struct dma_map_ops *ops = get_dma_ops(dev);
> -
> -	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> -		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
> -	else if (ops->sync_sg_for_device)
> -		ops->sync_sg_for_device(dev, sg, nelems, dir);
> -	debug_dma_sync_sg_for_device(dev, sg, nelems, dir);
> -
> -}
>  
>  static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>  {
> @@ -439,6 +214,28 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>  	return 0;
>  }
>  
> +dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
> +		size_t offset, size_t size, enum dma_data_direction dir,
> +		unsigned long attrs);
> +void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
> +		enum dma_data_direction dir, unsigned long attrs);
> +int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
> +		enum dma_data_direction dir, unsigned long attrs);
> +void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
> +				      int nents, enum dma_data_direction dir,
> +				      unsigned long attrs);
> +dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs);
> +void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
> +		enum dma_data_direction dir, unsigned long attrs);
> +void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
> +		enum dma_data_direction dir);
> +void dma_sync_single_for_device(struct device *dev, dma_addr_t addr,
> +		size_t size, enum dma_data_direction dir);
> +void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
> +		    int nelems, enum dma_data_direction dir);
> +void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
> +		       int nelems, enum dma_data_direction dir);
>  void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  		gfp_t flag, unsigned long attrs);
>  void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 8f4bbdaf965e..f1a9099a4b5b 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -260,7 +260,6 @@ void dma_direct_sync_single_for_device(struct device *dev,
>  	if (!dev_is_dma_coherent(dev))
>  		arch_sync_dma_for_device(paddr, size, dir);
>  }
> -EXPORT_SYMBOL(dma_direct_sync_single_for_device);


May be this is correct and allowed (no idea) but removing exported
symbols at least deserves a mention in the commit log, does not it?

The rest of the series is fine and works. Thanks,



-- 
Alexey
