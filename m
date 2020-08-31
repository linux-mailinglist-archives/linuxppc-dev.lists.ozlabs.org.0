Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C425711D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 02:08:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfrCD3cVyzDqSY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 10:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TlXIB4Mp; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bfr9J5DQWzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 10:06:57 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y6so2197848plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 17:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dPg6pIp0d6+IMW2eCyPuihZz92GIZill6IOikyCStwY=;
 b=TlXIB4MpnJHxFvHJueLLfeaBG1G6nE8C+Egk4sOkfAP8/FrCz60fAICJztXIiP0kNs
 eUtXcJ1UPbC4MblKNLR48Y/UkPiok4rV15/bKrR+/B/GvzwC5scvbkVZjHJUZg3SNAXL
 JZ2Nxu85goPVtOHPv2/ec6yYY+7b2KMUqLz5AUR8+gFbyS2NewAMUUyhy06ZuSXfOvxg
 7OcTPPIejcgFuUYW2/APHNLE/bBsU2QHXVAlr2K5fPnl72ynnkzrc4IkRn5U6Uy+hvcR
 5B7i1AQfAw8LHe7kQvXwxdAdUCO/vrpJELso/hjD2nvOuY2lQa7ws5BmHar1i3MLJMuR
 3/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dPg6pIp0d6+IMW2eCyPuihZz92GIZill6IOikyCStwY=;
 b=qzVp61mKyMlg2tBjSP/UKhueqOp79rBf19rFiTVMP1KORieBdVn7UnIYujwhUpROtT
 r1lDiUrL7iMyKJBYTBomfWxOJB9ipqa/Nbla0qvzqNBkOdW4SMwTvb+tsBTpVuuXNkJl
 7r1e0at/r/Ary2chZqNaThvPM6aNKXyuyXKb9Swmdvp9q5fJTKk/ib+r70Vn7XROuQs+
 n4+AhZ0oyATcjF06zCeRVYMFEwJQGZ8V/3aoCO+yQ3uoeRc8hpVX2Pg3A62P+e4o8Td1
 rBytcn7djQ5ZjNeebXxPktUTn0D1GuCIh1Zqo+t+2gnCLCvwVhYTgNZNZ7zdUY1Xjqj1
 KoMQ==
X-Gm-Message-State: AOAM5305AU9/05KRxZUcgAJEIuCF+Z9XCX20Siw6VeHNJYGNTFIqBxZ2
 dZaBra935JqlSo4DPZcPvNdScw==
X-Google-Smtp-Source: ABdhPJzDxhtQpxEwUEtVv5mpaSy+ixf9hbfjwDfZwDB111Xo6VzJEX7Z661UBYIL64R/ele2CHSgEA==
X-Received: by 2002:a17:90b:245:: with SMTP id
 fz5mr3537237pjb.131.1598832415794; 
 Sun, 30 Aug 2020 17:06:55 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id y5sm1833839pge.62.2020.08.30.17.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 17:06:54 -0700 (PDT)
Subject: Re: [PATCH v1 01/10] powerpc/pseries/iommu: Replace hard-coded page
 shift
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
 <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
 <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
 <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
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
Message-ID: <aaaf993a-d233-f5be-b809-5911a6a9872d@ozlabs.ru>
Date: Mon, 31 Aug 2020 10:06:47 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
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



On 29/08/2020 05:55, Leonardo Bras wrote:
> On Fri, 2020-08-28 at 12:27 +1000, Alexey Kardashevskiy wrote:
>>
>> On 28/08/2020 01:32, Leonardo Bras wrote:
>>> Hello Alexey, thank you for this feedback!
>>>
>>> On Sat, 2020-08-22 at 19:33 +1000, Alexey Kardashevskiy wrote:
>>>>> +#define TCE_RPN_BITS		52		/* Bits 0-51 represent RPN on TCE */
>>>>
>>>> Ditch this one and use MAX_PHYSMEM_BITS instead? I am pretty sure this
>>>> is the actual limit.
>>>
>>> I understand this MAX_PHYSMEM_BITS(51) comes from the maximum physical memory addressable in the machine. IIUC, it means we can access physical address up to (1ul << MAX_PHYSMEM_BITS). 
>>>
>>> This 52 comes from PAPR "Table 9. TCE Definition" which defines bits
>>> 0-51 as the RPN. By looking at code, I understand that it means we may input any address < (1ul << 52) to TCE.
>>>
>>> In practice, MAX_PHYSMEM_BITS should be enough as of today, because I suppose we can't ever pass a physical page address over 
>>> (1ul << 51), and TCE accepts up to (1ul << 52).
>>> But if we ever increase MAX_PHYSMEM_BITS, it doesn't necessarily means that TCE_RPN_BITS will also be increased, so I think they are independent values. 
>>>
>>> Does it make sense? Please let me know if I am missing something.
>>
>> The underlying hardware is PHB3/4 about which the IODA2 Version 2.4
>> 6Apr2012.pdf spec says:
>>
>> "The number of most significant RPN bits implemented in the TCE is
>> dependent on the max size of System Memory to be supported by the platform".
>>
>> IODA3 is the same on this matter.
>>
>> This is MAX_PHYSMEM_BITS and PHB itself does not have any other limits
>> on top of that. So the only real limit comes from MAX_PHYSMEM_BITS and
>> where TCE_RPN_BITS comes from exactly - I have no idea.
> 
> Well, I created this TCE_RPN_BITS = 52 because the previous mask was a
> hardcoded 40-bit mask (0xfffffffffful), for hard-coded 12-bit (4k)
> pagesize, and on PAPR+/LoPAR also defines TCE as having bits 0-51
> described as RPN, as described before.
> 
> IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figure 3.4 and 3.5.
> shows system memory mapping into a TCE, and the TCE also has bits 0-51
> for the RPN (52 bits). "Table 3.6. TCE Definition" also shows it.
>> In fact, by the looks of those figures, the RPN_MASK should always be a
> 52-bit mask, and RPN = (page >> tceshift) & RPN_MASK.


I suspect the mask is there in the first place for extra protection
against too big addresses going to the TCE table (or/and for virtial vs
physical addresses). Using 52bit mask makes no sense for anything, you
could just drop the mask and let c compiler deal with 64bit "uint" as it
is basically a 4K page address anywhere in the 64bit space. Thanks,


> Maybe that's it?




> 
>>
>>
>>>>
>>>>> +#define TCE_RPN_MASK(ps)	((1ul << (TCE_RPN_BITS - (ps))) - 1)
>>>>>  #define TCE_VALID		0x800		/* TCE valid */
>>>>>  #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
>>>>>  #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
>>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>>> index e4198700ed1a..8fe23b7dff3a 100644
>>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>>> @@ -107,6 +107,9 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
>>>>>  	u64 proto_tce;
>>>>>  	__be64 *tcep;
>>>>>  	u64 rpn;
>>>>> +	const unsigned long tceshift = tbl->it_page_shift;
>>>>> +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
>>>>> +	const u64 rpn_mask = TCE_RPN_MASK(tceshift);
>>>>
>>>> Using IOMMU_PAGE_SIZE macro for the page size and not using
>>>> IOMMU_PAGE_MASK for the mask - this incosistency makes my small brain
>>>> explode :) I understand the history but maaaaan... Oh well, ok.
>>>>
>>>
>>> Yeah, it feels kind of weird after two IOMMU related consts. :)
>>> But sure IOMMU_PAGE_MASK() would not be useful here :)
>>>
>>> And this kind of let me thinking:
>>>>> +		rpn = __pa(uaddr) >> tceshift;
>>>>> +		*tcep = cpu_to_be64(proto_tce | (rpn & rpn_mask) << tceshift);
>>> Why not:
>>> 	rpn_mask =  TCE_RPN_MASK(tceshift) << tceshift;
>>
>> A mask for a page number (but not the address!) hurts my brain, masks
>> are good against addresses but numbers should already have all bits
>> adjusted imho, may be it is just me :-/
>>
>>
>>> 	
>>> 	rpn = __pa(uaddr) & rpn_mask;
>>> 	*tcep = cpu_to_be64(proto_tce | rpn)
>>>
>>> I am usually afraid of changing stuff like this, but I think it's safe.
>>>
>>>> Good, otherwise. Thanks,
>>>
>>> Thank you for reviewing!
>>>  
>>>
>>>
> 

-- 
Alexey
