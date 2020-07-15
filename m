Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EDF2206A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:02:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B68xD24hXzDql2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:02:08 +1000 (AEST)
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
 header.s=20150623 header.b=pOXWana0; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B68v50n3HzDqgb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:00:14 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id s189so2673574pgc.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+14dlxGD3b+Qon9jpYZMMJng1yr4glZxlmnARtf23TM=;
 b=pOXWana0XkqHVYHXjklD7Uc5ktWyRpmoh8VCNMA6XoBDrLYnY0Cf6nBdb/zYZK2hIQ
 /zG16ScTdn6yszKTfFlXBgmFBjCKfqQDITxAEB7266L9XfKh0LepAppKSIxjCrLZWY86
 xgOjm/+FRtA2oVs56JvrOPbj1/Oy6o9iuYuJVgHKoiqS7g97w45SQD86bT5eQqEKN65O
 m3KNUNXqnkKXNTf8RjFyeJv2rVTmSSmuMTdLLOeZs5OuM1pkEEGl00ViwQ00JcYoJAlJ
 42aZIeSeC2lVL7ErJ7XjTyTen/Z0WmtBJK/xXCEww6NMI/ayL+eH9unomzYjsahWWRiG
 T42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+14dlxGD3b+Qon9jpYZMMJng1yr4glZxlmnARtf23TM=;
 b=FGKdOyTES3gLrErNgFba1eNOYaYnrcHfPEJdJe9sEu7UtcPjP30Oge0s7ziSDPiL+e
 f4n7gq7wwinhuAXl3yTNqnfw5Nm70x/bE6sLCBYT0YbB7uh1P+1bFM7LxdVDYAIcVxAb
 LpXs8azd+diRsdJS1vdEyYoC/SoM6RM4iARYK6/+vLVEUrZrGlSrNM+HD9by91C035J9
 tWOyS+ckeFZiUTVghKgZt6rCxJhlf4JuMtvYfqfkMp6g50qw+SU3rDmOnW+cPkvnT1ZH
 qrd/g++31YtID2B1EEORJYR8GFU2/m4zdDsZHE8XHJpNIU4nD9E4R9r0L5h0NX1Qg0U4
 oP3w==
X-Gm-Message-State: AOAM530FBeuPq/QzF/VN/F/xX1+d73WfRHd9ZKPgZQ5D0NSqChMX+zlr
 FNxxjKTvxkxsRPhlMadIk8AXaDiha6wdcw==
X-Google-Smtp-Source: ABdhPJz6BLZAfAvF7NIJurqiH/U3QO4i2p3YCPS1Kbwxf4P01buJnVDFBiWjxJZFisFbmFnZJN59Yw==
X-Received: by 2002:a63:5613:: with SMTP id k19mr7217347pgb.424.1594800010906; 
 Wed, 15 Jul 2020 01:00:10 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id o23sm1375970pfd.126.2020.07.15.01.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 01:00:09 -0700 (PDT)
Subject: Re: [PATCH 15/15] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-16-oohall@gmail.com>
 <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
 <CAOSf1CHL9YoSohwMWm1YkLbLTqOn-WfBMKERZaPYb_5-UKmsuw@mail.gmail.com>
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
Message-ID: <25d7fd88-668a-861e-a93c-3188caeac3cf@ozlabs.ru>
Date: Wed, 15 Jul 2020 18:00:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHL9YoSohwMWm1YkLbLTqOn-WfBMKERZaPYb_5-UKmsuw@mail.gmail.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/07/2020 16:16, Oliver O'Halloran wrote:
> On Wed, Jul 15, 2020 at 3:24 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>>
>>> @@ -158,9 +157,9 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>>>               goto disable_iov;
>>>       pdev->dev.archdata.iov_data = iov;
>>>
>>> +     /* FIXME: totalvfs > phb->ioda.total_pe_num is going to be a problem */
>>
>>
>> WARN_ON_ONCE() then?
> 
> can't hurt
> 
>>> @@ -173,50 +172,51 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>>>                       goto disable_iov;
>>>               }
>>>
>>> -             total_vf_bar_sz += pci_iov_resource_size(pdev,
>>> -                             i + PCI_IOV_RESOURCES);
>>> +             vf_bar_sz = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
>>>
>>>               /*
>>> -              * If bigger than quarter of M64 segment size, just round up
>>> -              * power of two.
>>> +              * Generally, one segmented M64 BAR maps one IOV BAR. However,
>>> +              * if a VF BAR is too large we end up wasting a lot of space.
>>> +              * If we've got a BAR that's bigger than greater than 1/4 of the
>>
>>
>> bigger, greater, huger? :)
>>
>> Also, a nit: s/got a BAR/got a VF BAR/
> 
> whatever, it's just words

You are talking about these BARs and those BARs and since we want "to
help out
the next sucker^Wperson who needs to tinker with it", using precise term
is kinda essential here.


> 
>>> +              * default window's segment size then switch to using single PE
>>> +              * windows. This limits the total number of VFs we can support.
>>
>> Just to get idea about absolute numbers here.
>>
>> On my P9:
>>
>> ./pciex@600c3c0300000/ibm,opal-m64-window
>>                  00060200 00000000 00060200 00000000 00000040 00000000
>>
>> so that default window's segment size is 0x40.0000.0000/512 = 512MB?
> 
> Yeah. It'll vary a bit since PHB3 and some PHB4s have 256.
> 
>>>                *
>>> -              * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
>>> -              * with other devices, IOV BAR size is expanded to be
>>> -              * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
>>> -              * segment size , the expanded size would equal to half of the
>>> -              * whole M64 space size, which will exhaust the M64 Space and
>>> -              * limit the system flexibility.  This is a design decision to
>>> -              * set the boundary to quarter of the M64 segment size.
>>> +              * The 1/4 limit is arbitrary and can be tweaked.
>>>                */
>>> -             if (total_vf_bar_sz > gate) {
>>> -                     mul = roundup_pow_of_two(total_vfs);
>>> -                     dev_info(&pdev->dev,
>>> -                             "VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
>>> -                             total_vf_bar_sz, gate, mul);
>>> -                     iov->m64_single_mode = true;
>>> -                     break;
>>> -             }
>>> -     }
>>> +             if (vf_bar_sz > (phb->ioda.m64_segsize >> 2)) {
>>> +                     /*
>>> +                      * On PHB3, the minimum size alignment of M64 BAR in
>>> +                      * single mode is 32MB. If this VF BAR is smaller than
>>> +                      * 32MB, but still too large for a segmented window
>>> +                      * then we can't map it and need to disable SR-IOV for
>>> +                      * this device.
>>
>>
>> Why not use single PE mode for such BAR? Better than nothing.
> 
> Suppose you could, but I figured VFs were mainly interesting since you
> could give each VF to a separate guest. If there's multiple VFs under
> the same single PE BAR then they'd have to be assigned to the same

True. But with one PE per VF we can still have 15 (or 14?) isolated VFs
which is not hundreds but better than 0.


> guest in order to retain the freeze/unfreeze behaviour that PAPR
> requires. I guess that's how it used to work, but it seems better just
> to disable them rather than having VFs which sort of work.

Well, realistically the segment size should be 8MB to make this matter
(or the whole window 2GB) which does not seem to happen so it does not
matter.


-- 
Alexey
