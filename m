Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E01105F59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 05:57:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K40g26HRzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 15:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="qqSbWLNt"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K3yh6LDRzDr5h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 15:55:24 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id ay6so2616995plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 20:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V7qZkYtZ+rIp1B8D5XKsSAt/Ewyl0rF11oJ8fUWLcSk=;
 b=qqSbWLNtz5/dxrJWgNGMazJNZ4lUqzPnBQL7pOrQ59COGqMUlU96UADaBxhnr767qC
 2rxVvhAtHl8ESQG6/DBiau8Gg8Tr8uGxUtYJT906OndNy+DbQhUxOdwNazYo9tojAeOZ
 Wzrx/0n+8x66PBikvjnjlFK0mcVCM+Y9TyI3b5Il2qHTOBmhol6LDyWCO0K0UZlDt20V
 zRPxSF/ptbamWi/OLBfkoV4fMV1ddq8i4CgvUTXXuYRomTiO7EilqksY6ekO0nHQIglU
 UvfnTzDyUAboDf41DJppZgCY6/T8r+u3F4O0lwWxvTV2sD/TR5eQNoD5MP24haGJyYMV
 tq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V7qZkYtZ+rIp1B8D5XKsSAt/Ewyl0rF11oJ8fUWLcSk=;
 b=BIZ5sQh7KRHKJzO5q6p9AbnoTITo0JzZbGQbsG09aiG+G8xcXzPPrCO7iiN9ATuWtL
 whJVrlJcv1HuwbXuwU9qVOEME4B29/QjA7Ze37FC4/nPGUaLfnch2kkpgAj6ZcvPHL7o
 F2YcHgch8XaLnUJuSTueELngRxSJ5/5mjLd/O6//3k4zWwljBzm+wLF+O/vZ+62Fo5ZG
 PvcyTtxyUGmc9aQT9sHw6KL8EO1CoWi/jdIAnPq7oHDzgAs63nR6DlgjiSCexwgkmj/1
 yH1VQDGVYmlbJc6+9D9dvJV+ofzuXpGNFON0K2Rb4Kqk8JMhNVmlNYtqA3rgm51kdNvu
 ZEIQ==
X-Gm-Message-State: APjAAAU2kgeMMj+YSTjvNcjsvnJRO8shwsCWJO+beAe6V1ShK0Hzqc4w
 54PywmT3xI+g1JA4NOrgbvobOg==
X-Google-Smtp-Source: APXvYqyDzQ8JW/49r0YjsbBHvGXGp8Vj/M/SUmfZqAMGUGYcs1UkkrWqx/x60+W+7SZDJX8hEK66hw==
X-Received: by 2002:a17:902:b90a:: with SMTP id
 bf10mr12559439plb.45.1574398521442; 
 Thu, 21 Nov 2019 20:55:21 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id u20sm4915097pgo.50.2019.11.21.20.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 20:55:20 -0800 (PST)
Subject: Re: [Very RFC 11/46] powerpc/eeh: Convert various printfs to use
 edev, not pci_dn
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-12-oohall@gmail.com>
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
Message-ID: <e8d20c8a-16cc-5c5c-70a9-076236351391@ozlabs.ru>
Date: Fri, 22 Nov 2019 15:55:17 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-12-oohall@gmail.com>
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2019 12:28, Oliver O'Halloran wrote:
> We use the pci_dn to retrieve the domain, bus, device, and function numbers for
> an EEH device. We now have that in the eeh_dev so covert the various printk()s
> we have around the place to source that information from the eeh_dev.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/kernel/eeh.c    | 14 ++++----------
>  arch/powerpc/kernel/eeh_pe.c | 14 ++++++--------
>  2 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 63500e34e329..c8039fdb23ba 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -167,23 +167,17 @@ void eeh_show_enabled(void)
>   */
>  static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  {
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
>  	u32 cfg;
>  	int cap, i;
>  	int n = 0, l = 0;
>  	char buffer[128];
>  
> -	if (!pdn) {
> -		pr_warn("EEH: Note: No error log for absent device.\n");
> -		return 0;
> -	}
> -
>  	n += scnprintf(buf+n, len-n, "%04x:%02x:%02x.%01x\n",
> -		       pdn->phb->global_number, pdn->busno,
> -		       PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
> +			edev->pe->phb->global_number, edev->bdfn >> 8,
> +			PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
>  	pr_warn("EEH: of node=%04x:%02x:%02x.%01x\n",
> -		pdn->phb->global_number, pdn->busno,
> -		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
> +		edev->pe->phb->global_number, edev->bdfn >> 8,
> +		PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
>  
>  	eeh_ops->read_config(edev, PCI_VENDOR_ID, 4, &cfg);
>  	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index 634963aa4a77..831f363f1732 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -366,9 +366,8 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
>   */
>  int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  {
> +	int config_addr = edev->bdfn;
>  	struct eeh_pe *pe, *parent;
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> -	int config_addr = (pdn->busno << 8) | (pdn->devfn);
>  
>  	/* Check if the PE number is valid */
>  	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
> @@ -382,7 +381,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  	 * PE should be composed of PCI bus and its subordinate
>  	 * components.
>  	 */
> -	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
> +	pe = eeh_pe_get(edev->controller, edev->pe_config_addr, config_addr);
>  	if (pe) {
>  		if (pe->type & EEH_PE_INVALID) {
>  			list_add_tail(&edev->entry, &pe->edevs);
> @@ -416,9 +415,9 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  
>  	/* Create a new EEH PE */
>  	if (edev->physfn)
> -		pe = eeh_pe_alloc(pdn->phb, EEH_PE_VF);
> +		pe = eeh_pe_alloc(edev->controller, EEH_PE_VF);
>  	else
> -		pe = eeh_pe_alloc(pdn->phb, EEH_PE_DEVICE);
> +		pe = eeh_pe_alloc(edev->controller, EEH_PE_DEVICE);
>  	if (!pe) {
>  		pr_err("%s: out of memory!\n", __func__);
>  		return -ENOMEM;
> @@ -434,10 +433,10 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  	 */
>  	parent = eeh_pe_get_parent(edev);
>  	if (!parent) {
> -		parent = eeh_phb_pe_get(pdn->phb);
> +		parent = eeh_phb_pe_get(edev->controller);
>  		if (!parent) {
>  			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
> -				__func__, pdn->phb->global_number);
> +				__func__, edev->controller->global_number);
>  			edev->pe = NULL;
>  			kfree(pe);
>  			return -EEXIST;
> @@ -698,7 +697,6 @@ void eeh_pe_state_clear(struct eeh_pe *root, int state, bool include_passed)
>   */
>  static void eeh_bridge_check_link(struct eeh_dev *edev)
>  {
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);


This belongs to 09/46. Or just merge them.


>  	int cap;
>  	uint32_t val;
>  	int timeout = 0;
> 

-- 
Alexey
