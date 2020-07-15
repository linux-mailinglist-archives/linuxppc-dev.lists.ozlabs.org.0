Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC62202F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:32:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62yG25H4zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:32:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YrRkQ1Qo; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B62wV5GQDzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:31:06 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id p1so1436106pls.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g77doqSeHm5n7eF6Yg24cpSL2pWKkPvZ4RJhWp3tDMk=;
 b=YrRkQ1QoIQ3Vap9mKNCQMgPinbBzF5ZxUz+/jlqhlPwm6Rz0oZf6A+5Jk+NE+9Hh2Z
 inHAKkednS3yq2FlLfisjunDcJ2DBcX1eMyjnhdDohg/nkWLiLGpiFV9VbOdn53RMiKU
 i6+dcmt0uGHYPxypBUL20wZyhKHM2hwq4+KSmNXu9IgDGcZNXY4LlpVBSsDeIOD6qyWn
 gXWCTWhpBSvvA9luiCo4IFZKVCXK2EzOK37vQk/GeoutFHhLK1StKbebhPPmnYCkrSyy
 ylfh9ozejbguZkZOZ9qTsrSAHa/TxuuYB0XsuffjLlRpevxBBi3I0wOAkqpSB8JuM/F2
 pNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g77doqSeHm5n7eF6Yg24cpSL2pWKkPvZ4RJhWp3tDMk=;
 b=bhw005e8LWPzpy27Cdk/EjGqiP40e42Y2xMJyGIIzFvk2kZbq901UvUKwCb+R/Qyq2
 W02pHzQXo98t8077qDziQhO8qGe/dvaS6kcJQd7t+t4apIvD1zUn+p5mPNNbjMJKpq/o
 roN3NB8Ac8nXgyN9MrZAbKIxU3HsBk4BFeonrrBkCBayKG5w8h6mNtO5f9YCueay/PeU
 b1JiErm3OQBpdiCFGCsK8tut07gSnp+1SG/F3iyWH8eQaZOTtKA3Hp5rvozpo6SBx4/u
 fmU0Qi2bQCspn8Mx7cAdrRXGhQxA3ECItCnCgN8P+dG868r+2TtoHnur3xUq9h5NEzFT
 /SEg==
X-Gm-Message-State: AOAM533rlhR0rJkYv99LQXF/BPtikch4HSPpfjU6Zc4txCqSTF8bLS8v
 yRJqCLi1sp6QzwY4VfrxYYn1IVEnNszgag==
X-Google-Smtp-Source: ABdhPJxonsIUZZ2uyyBe8UGoJxnX4pSwDNWx4o89pJRDR54n2HgEaCBzh6q8oL6EXKIAkQCblrFpBA==
X-Received: by 2002:a17:902:b084:: with SMTP id
 p4mr6773269plr.58.1594783863935; 
 Tue, 14 Jul 2020 20:31:03 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id r8sm500107pfh.29.2020.07.14.20.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:31:03 -0700 (PDT)
Subject: Re: [PATCH 11/15] powerpc/powernv/sriov: Drop iov->pe_num_map[]
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-12-oohall@gmail.com>
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
Message-ID: <833e07b0-3c55-ef51-8649-a5e244f72560@ozlabs.ru>
Date: Wed, 15 Jul 2020 13:31:00 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-12-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/07/2020 15:23, Oliver O'Halloran wrote:
> Currently the iov->pe_num_map[] does one of two things depending on
> whether single PE mode is being used or not. When it is, this contains an
> array which maps a vf_index to the corresponding PE number. When single PE
> mode is not being used this contains a scalar which is the base PE for the
> set of enabled VFs (for for VFn is base + n).
> 
> The array was necessary because when calling pnv_ioda_alloc_pe() there is
> no guarantee that the allocated PEs would be contigious. We can now


s/contigious/contiguous/ here and below.


> allocate contigious blocks of PEs so this is no longer an issue. This
> allows us to drop the if (single_mode) {} .. else {} block scattered
> through the SR-IOV code which is a nice clean up.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 109 +++++----------------
>  arch/powerpc/platforms/powernv/pci.h       |   4 +-
>  2 files changed, 25 insertions(+), 88 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index d53a85ccb538..08f88187d65a 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -456,11 +456,13 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  
>  
>  			if (iov->m64_single_mode) {
> +				int pe_num = iov->vf_pe_arr[j].pe_number;
> +
>  				size = pci_iov_resource_size(pdev,
>  							PCI_IOV_RESOURCES + i);
>  				start = res->start + size * j;
>  				rc = pnv_ioda_map_m64_single(phb, win,
> -							     iov->pe_num_map[j],
> +							     pe_num,
>  							     start,
>  							     size);
>  			} else {
> @@ -599,38 +601,24 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  
>  static void pnv_pci_sriov_disable(struct pci_dev *pdev)
>  {
> +	u16                    num_vfs, base_pe;
>  	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe;
>  	struct pnv_iov_data   *iov;
> -	u16                    num_vfs, i;
>  
>  	phb = pci_bus_to_pnvhb(pdev->bus);
>  	iov = pnv_iov_get(pdev);
>  	num_vfs = iov->num_vfs;
> +	base_pe = iov->vf_pe_arr[0].pe_number;
>  
>  	/* Release VF PEs */
>  	pnv_ioda_release_vf_PE(pdev);
>  
>  	if (phb->type == PNV_PHB_IODA2) {
>  		if (!iov->m64_single_mode)
> -			pnv_pci_vf_resource_shift(pdev, -*iov->pe_num_map);
> +			pnv_pci_vf_resource_shift(pdev, -base_pe);
>  
>  		/* Release M64 windows */
>  		pnv_pci_vf_release_m64(pdev, num_vfs);
> -
> -		/* Release PE numbers */
> -		if (iov->m64_single_mode) {
> -			for (i = 0; i < num_vfs; i++) {
> -				if (iov->pe_num_map[i] == IODA_INVALID_PE)
> -					continue;
> -
> -				pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
> -				pnv_ioda_free_pe(pe);
> -			}
> -		} else
> -			bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
> -		/* Releasing pe_num_map */
> -		kfree(iov->pe_num_map);
>  	}
>  }
>  
> @@ -656,13 +644,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
>  		struct pci_dn *vf_pdn;
>  
> -		if (iov->m64_single_mode)
> -			pe_num = iov->pe_num_map[vf_index];
> -		else
> -			pe_num = *iov->pe_num_map + vf_index;
> -
> -		pe = &phb->ioda.pe_array[pe_num];
> -		pe->pe_number = pe_num;
> +		pe = &iov->vf_pe_arr[vf_index];
>  		pe->phb = phb;
>  		pe->flags = PNV_IODA_PE_VF;
>  		pe->pbus = NULL;
> @@ -670,6 +652,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		pe->mve_number = -1;
>  		pe->rid = (vf_bus << 8) | vf_devfn;
>  
> +		pe_num = pe->pe_number;
>  		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
>  			pci_domain_nr(pdev->bus), pdev->bus->number,
>  			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
> @@ -701,9 +684,9 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
> +	struct pnv_ioda_pe    *base_pe;
>  	struct pnv_iov_data   *iov;
>  	struct pnv_phb        *phb;
> -	struct pnv_ioda_pe    *pe;
>  	int                    ret;
>  	u16                    i;
>  
> @@ -717,55 +700,14 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  			return -ENOSPC;
>  		}
>  
> -		/*
> -		 * When M64 BARs functions in Single PE mode, the number of VFs
> -		 * could be enabled must be less than the number of M64 BARs.
> -		 */
> -		if (iov->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
> -			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
> +		/* allocate a contigious block of PEs for our VFs */
> +		base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
> +		if (!base_pe) {
> +			pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
>  			return -EBUSY;
>  		}
>  
> -		/* Allocating pe_num_map */
> -		if (iov->m64_single_mode)
> -			iov->pe_num_map = kmalloc_array(num_vfs,
> -							sizeof(*iov->pe_num_map),
> -							GFP_KERNEL);
> -		else
> -			iov->pe_num_map = kmalloc(sizeof(*iov->pe_num_map), GFP_KERNEL);
> -
> -		if (!iov->pe_num_map)
> -			return -ENOMEM;
> -
> -		if (iov->m64_single_mode)
> -			for (i = 0; i < num_vfs; i++)
> -				iov->pe_num_map[i] = IODA_INVALID_PE;
> -
> -		/* Calculate available PE for required VFs */
> -		if (iov->m64_single_mode) {
> -			for (i = 0; i < num_vfs; i++) {
> -				pe = pnv_ioda_alloc_pe(phb);
> -				if (!pe) {
> -					ret = -EBUSY;
> -					goto m64_failed;
> -				}
> -
> -				iov->pe_num_map[i] = pe->pe_number;
> -			}
> -		} else {
> -			mutex_lock(&phb->ioda.pe_alloc_mutex);
> -			*iov->pe_num_map = bitmap_find_next_zero_area(
> -				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
> -				0, num_vfs, 0);
> -			if (*iov->pe_num_map >= phb->ioda.total_pe_num) {
> -				mutex_unlock(&phb->ioda.pe_alloc_mutex);
> -				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
> -				kfree(iov->pe_num_map);
> -				return -EBUSY;
> -			}
> -			bitmap_set(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
> -			mutex_unlock(&phb->ioda.pe_alloc_mutex);
> -		}
> +		iov->vf_pe_arr = base_pe;
>  		iov->num_vfs = num_vfs;
>  
>  		/* Assign M64 window accordingly */
> @@ -781,9 +723,10 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  		 * Otherwise, the PE# for the VF will conflict with others.
>  		 */
>  		if (!iov->m64_single_mode) {
> -			ret = pnv_pci_vf_resource_shift(pdev, *iov->pe_num_map);
> +			ret = pnv_pci_vf_resource_shift(pdev,
> +							base_pe->pe_number);
>  			if (ret)
> -				goto m64_failed;
> +				goto shift_failed;
>  		}
>  	}
>  
> @@ -792,20 +735,12 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  
>  	return 0;
>  
> -m64_failed:
> -	if (iov->m64_single_mode) {
> -		for (i = 0; i < num_vfs; i++) {
> -			if (iov->pe_num_map[i] == IODA_INVALID_PE)
> -				continue;
> -
> -			pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
> -			pnv_ioda_free_pe(pe);
> -		}
> -	} else
> -		bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
> +shift_failed:
> +	pnv_pci_vf_release_m64(pdev, num_vfs);
>  
> -	/* Releasing pe_num_map */
> -	kfree(iov->pe_num_map);
> +m64_failed:
> +	for (i = 0; i < num_vfs; i++)
> +		pnv_ioda_free_pe(&iov->vf_pe_arr[i]);
>  
>  	return ret;
>  }
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index b4c9bdba7217..13555bc549f4 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -238,7 +238,9 @@ struct pnv_iov_data {
>  
>  	/* number of VFs enabled */
>  	u16     num_vfs;
> -	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
> +
> +	/* pointer to the array of VF PEs. num_vfs long*/

I read the comment and for a second I thought that now you are storing
pnv_ioda_pe structs in pnv_iov_data which is not true: vf_pe_arr
actually points inside phb->ioda.pe_array[]. May be add this to the
comment please.

Otherwise good,


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> +	struct pnv_ioda_pe *vf_pe_arr;
>  
>  	/* Did we map the VF BARs with single-PE IODA BARs? */
>  	bool    m64_single_mode;
> 

-- 
Alexey
