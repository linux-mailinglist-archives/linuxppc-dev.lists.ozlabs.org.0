Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E05112082
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 01:07:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SK0h3rqHzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 11:07:16 +1100 (AEDT)
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
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="vxckcFAb"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SJxF6NVqzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 11:04:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so2335035plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 16:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cav5nQmejjyTnSKKvj3Yh5fm3QiZe0mKSSjAAkMTSbs=;
 b=vxckcFAbWR7tBhbe7EXXiArAvdpRLUpI6O0Ix91FZPiXcYCMwlUEPvOg1yobZpXWsQ
 4L779wTdf4l0Nx+9K/nbPXocRfmufKTC4CrFgGPdgaDJA6l3OmqJTbiQXf4R9bx7jUEs
 k9xuDo9HaCII4p/O8NwFaiVSyAkYNzNHFTqHXG5VyIjuUSrTUZl1cMgTv0fAF3wjadgW
 BnhLZgeIXsN6sPo4rQtcmxq9Hm14Uw5FHERNiDobFAPq1hIh7Oo9Gj1hbxn7o7a0VX6p
 PW1DwjOcVU8zDoiRHDLZULisHCAfPtjrgfrWjuTjKYrGCiZtGAB8kr+eefWVf3jZpuSQ
 HtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cav5nQmejjyTnSKKvj3Yh5fm3QiZe0mKSSjAAkMTSbs=;
 b=HaaQdNotx5jWilgG96Wfkxvv16QJjDRoCKbfQwvxoA0uF29mhMQ7vd3HavTAO9h7aj
 aa/fyHBkm2np1z2RQ3EaDULEfYNYgdP1JVehkTl0BdMoMbh3GlhzUd23Us2flCQemqRV
 rhrMi3hmOBXzQrcuGrT53uurfPbKSIpzfUO6AZbEi51vEdsPv0tA6AeQC5gRM4zfmMuw
 npYX6erXjK+lgV70jmy5UNuU2cgti9stab1vQjPcxzYYOa4FMAmrPW5g8lMcmyscBpyB
 RTz1Gen3fpgLdoU5X0CwDWRKWT5L1MPneHu+K2ZuFC1SEGVvoOrE4kcp00z8OP2nYQ8m
 VucQ==
X-Gm-Message-State: APjAAAXgUYKKBPYcygaQ+9JoRLuHqxYqbmuOtuX+w7u/dcVrRy0oAINR
 G/fia/61vyjwCDOiosyjOp/TVA==
X-Google-Smtp-Source: APXvYqzmNBDaEc70VSmHmRhWAr84kNaCr3lvBmtHQCbrdthaUMmGm9DHJW0mkUiN6lSuMSBcWkMA7Q==
X-Received: by 2002:a17:902:34d:: with SMTP id 71mr605565pld.316.1575417852446; 
 Tue, 03 Dec 2019 16:04:12 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id g18sm2504812pfi.80.2019.12.03.16.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 16:04:11 -0800 (PST)
Subject: Re: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
To: Ram Pai <linuxram@us.ibm.com>
References: <1575269124-17885-1-git-send-email-linuxram@us.ibm.com>
 <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
 <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
 <20191203020850.GA12354@oc0525413822.ibm.com>
 <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
 <20191203040509.GB12354@oc0525413822.ibm.com>
 <a0f19e65-81eb-37bd-928b-7a57a8660e3d@ozlabs.ru>
 <20191203165204.GA5079@oc0525413822.ibm.com>
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
Message-ID: <3a17372a-fcee-efbf-0a05-282ffb1adc90@ozlabs.ru>
Date: Wed, 4 Dec 2019 11:04:04 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203165204.GA5079@oc0525413822.ibm.com>
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
Cc: andmike@us.ibm.com, mst@redhat.com, mdroth@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, ram.n.pai@gmail.com, cai@lca.pw,
 tglx@linutronix.de, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/12/2019 03:52, Ram Pai wrote:
> On Tue, Dec 03, 2019 at 03:24:37PM +1100, Alexey Kardashevskiy wrote:
>>
>>
>> On 03/12/2019 15:05, Ram Pai wrote:
>>> On Tue, Dec 03, 2019 at 01:15:04PM +1100, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 03/12/2019 13:08, Ram Pai wrote:
>>>>> On Tue, Dec 03, 2019 at 11:56:43AM +1100, Alexey Kardashevskiy wrote:
>>>>>>
>>>>>>
>>>>>> On 02/12/2019 17:45, Ram Pai wrote:
>>>>>>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
>>>>>>> its parameters. One page is dedicated per cpu, for the lifetime of the
>>>>>>> kernel for this purpose. On secure VMs, contents of this page, when
>>>>>>> accessed by the hypervisor, retrieves encrypted TCE entries.  Hypervisor
>>>>>>> needs to know the unencrypted entries, to update the TCE table
>>>>>>> accordingly.  There is nothing secret or sensitive about these entries.
>>>>>>> Hence share the page with the hypervisor.
>>>>>>
>>>>>> This unsecures a page in the guest in a random place which creates an
>>>>>> additional attack surface which is hard to exploit indeed but
>>>>>> nevertheless it is there.
>>>>>> A safer option would be not to use the
>>>>>> hcall-multi-tce hyperrtas option (which translates FW_FEATURE_MULTITCE
>>>>>> in the guest).
>>>>>
>>>>>
>>>>> Hmm... How do we not use it?  AFAICT hcall-multi-tce option gets invoked
>>>>> automatically when IOMMU option is enabled.
>>>>
>>>> It is advertised by QEMU but the guest does not have to use it.
>>>
>>> Are you suggesting that even normal-guest, not use hcall-multi-tce?
>>> or just secure-guest?  
>>
>>
>> Just secure.
> 
> hmm..  how are the TCE entries communicated to the hypervisor, if
> hcall-multi-tce is disabled?

Via H_PUT_TCE which updates 1 entry at once (sets or clears).
hcall-multi-tce  enables H_PUT_TCE_INDIRECT (512 entries at once) and
H_STUFF_TCE (clearing, up to 4bln at once? many), these are simply an
optimization.


> 
>>
>>
>>>
>>>>
>>>>> This happens even
>>>>> on a normal VM when IOMMU is enabled.
>>>>>
>>>>>
>>>>>>
>>>>>> Also what is this for anyway? 
>>>>>
>>>>> This is for sending indirect-TCE entries to the hypervisor.
>>>>> The hypervisor must be able to read those TCE entries, so that it can 
>>>>> use those entires to populate the TCE table with the correct mappings.
>>>>>
>>>>>> if I understand things right, you cannot
>>>>>> map any random guest memory, you should only be mapping that 64MB-ish
>>>>>> bounce buffer array but 1) I do not see that happening (I may have
>>>>>> missed it) 2) it should be done once and it takes a little time for
>>>>>> whatever memory size we allow for bounce buffers anyway. Thanks,
>>>>>
>>>>> Any random guest memory can be shared by the guest. 
>>>>
>>>> Yes but we do not want this to be this random. 
>>>
>>> It is not sharing some random page. It is sharing a page that is
>>> ear-marked for communicating TCE entries. Yes the address of the page
>>> can be random, depending on where the allocator decides to allocate it.
>>> The purpose of the page is not random.
>>
>> I was talking about the location.
>>
>>
>>> That page is used for one specific purpose; to communicate the TCE
>>> entries to the hypervisor.  
>>>
>>>> I thought the whole idea
>>>> of swiotlb was to restrict the amount of shared memory to bare minimum,
>>>> what do I miss?
>>>
>>> I think, you are making a incorrect connection between this patch and
>>> SWIOTLB.  This patch has nothing to do with SWIOTLB.
>>
>> I can see this and this is the confusing part.
>>
>>
>>>>
>>>>> Maybe you are confusing this with the SWIOTLB bounce buffers used by
>>>>> PCI devices, to transfer data to the hypervisor?
>>>>
>>>> Is not this for pci+swiotlb? 
>>>
>>>
>>> No. This patch is NOT for PCI+SWIOTLB.  The SWIOTLB pages are a
>>> different set of pages allocated and earmarked for bounce buffering.
>>>
>>> This patch is purely to help the hypervisor setup the TCE table, in the
>>> presence of a IOMMU.
>>
>> Then the hypervisor should be able to access the guest pages mapped for
>> DMA and these pages should be made unsecure for this to work. Where/when
>> does this happen?
> 
> This happens in the SWIOTLB code.  The code to do that is already
> upstream.  
>
> The sharing of the pages containing the SWIOTLB bounce buffers is done
> in init_svm() which calls swiotlb_update_mem_attributes() which calls
> set_memory_decrypted().  In the case of pseries, set_memory_decrypted() calls 
> uv_share_page().


This does not seem enough as when you enforce iommu_platform=on, QEMU
starts accessing virtio buffers via IOMMU so bounce buffers have to be
mapped explicitly, via H_PUT_TCE&co, where does this happen?


> 
> The code that bounces the contents of a I/O buffer through the 
> SWIOTLB buffers, is in swiotlb_bounce().
> 
>>
>>
>>>> The cover letter suggests it is for
>>>> virtio-scsi-_pci_ with 	iommu_platform=on which makes it a
>>>> normal pci device just like emulated XHCI. Thanks,
>>>
>>> Well, I guess, the cover letter is probably confusing. There are two
>>> patches, which togather enable virtio on secure guests, in the presence
>>> of IOMMU.
>>>
>>> The second patch enables virtio in the presence of a IOMMU, to use
>>> DMA_ops+SWIOTLB infrastructure, to correctly navigate the I/O to virtio
>>> devices.
>>
>> The second patch does nothing in relation to the problem being solved.
> 
> The second patch registers dma_iommu_ops with the PCI-system.  Doing so
> enables I/O to take the dma_iommu_ops path, which internally 
> leads it through the SWIOTLB path. Without that, the I/O fails to reach
> its destination.


This is not what the commit log says. What DMA ops was used before 2/2?
I thought it was NULL which should have turned into direct which then
would switch to swiotlb but since recent DMA reworks it is even harder
to tell what happens with DMA setup. Thanks,


>>> However that by itself wont work if the TCE entires are not correctly
>>> setup in the TCE tables.  The first patch; i.e this patch, helps
>>> accomplish that.
>>>> Hope this clears up the confusion.



-- 
Alexey
