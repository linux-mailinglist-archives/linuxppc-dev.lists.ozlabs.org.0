Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127E34F2E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F92K96sxFz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 08:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vOri9Y+P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vOri9Y+P; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F92Jj11j6z2yYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 08:14:45 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id y18so17302018qky.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ggozfWBPW8IuLIjloW6WSrwVHoKc5x/0lF7TLz027Y=;
 b=vOri9Y+PBjDsorPl7YPFn8uYnFAt2bbwsF1irc/UoeCWg2FuGAdfhAmAryiWLbwGfP
 8M58Ydu/8nmNIQZaelGmUC+1PwKtGx/U3S58yFNQYQR8+S7fxKOL6j43RFKSz6szPcxf
 XgnGXQjJRLLXz8x4Vx8ThJpjB37S3//llCWahX/nc81rmmrDQjKFL2/ldUdWYSaz5FoL
 MJhdcD4a26Z5pT0WThRfN9bssZv2xJE2A0KuyNzfd8N+51UI/iF4q9Ldplkya1yqsnA4
 CFdt8s9V9XYeXKr5b1pbWKRcq19TLStc9Rew6TF2GLruCKfKBuIdCvEHPM1SzUxfks1f
 uajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+ggozfWBPW8IuLIjloW6WSrwVHoKc5x/0lF7TLz027Y=;
 b=UgNWzZ+IAV8EDadZ7SDu5OAVrRaWn3CYd0nWi1Pekk9hn2/NasMDviz5VSsWqMe9Nc
 coEJVybymeBdnEcCtZ5QdApuWXh7Xhn/QmbHzEuANUPcznvqDOsK6czw2czfFAs8cSLX
 Wu8XACDawl8tMS4u2iTcBXRK1wKjrRaQYjNEcEvbcJRsdwmOK9/J3ja4Y/AulLZkSg5X
 8WeIxvWoQI41DOJyXsQS+ulpCYE1Q59f1viq8Dm0perbGKeuu40zBgacDpKSlVg028Y1
 rq+SCBDmsEijdhn3/vZIzNB+X+NlaNnMVIxEfVVd6yJutY/dd8/cCMpXYvL1KTrF9onC
 QkEg==
X-Gm-Message-State: AOAM531F3GxJ9BmGEmEnjG/Z+I/p9buyALM3WG15xXc9kblNOlcHGl81
 XhZSTmQPVCPs8rLjHWoMOC4=
X-Google-Smtp-Source: ABdhPJwbD+N/GjB0AlKqJVMu0SfsvPdMs9oaHoiPjFBTbDnbbPd1HJfEWQMejjZPYQPo+ef3Vr0RGw==
X-Received: by 2002:a05:620a:2158:: with SMTP id
 m24mr231264qkm.306.1617138881199; 
 Tue, 30 Mar 2021 14:14:41 -0700 (PDT)
Received: from Gentoo ([143.244.44.215])
 by smtp.gmail.com with ESMTPSA id x21sm16567967qkj.25.2021.03.30.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:14:40 -0700 (PDT)
Date: Wed, 31 Mar 2021 02:44:22 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 24/30] Kconfig: Change Synopsys to Synopsis
Message-ID: <YGOUrpsQzrIPEHIU@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1262e9e62498f961e5172205e66a9ef7c6f0f69d.1616971780.git.unixbhaskar@gmail.com>
 <8f80fb1b-b2d0-b66a-24b0-bd92dc6cd4b6@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZkHisyvIHxtmch2f"
Content-Disposition: inline
In-Reply-To: <8f80fb1b-b2d0-b66a-24b0-bd92dc6cd4b6@arm.com>
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
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ZkHisyvIHxtmch2f
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 12:43 Tue 30 Mar 2021, Robin Murphy wrote:
>On 2021-03-29 00:53, Bhaskar Chowdhury wrote:
>> s/Synopsys/Synopsis/  .....two different places.
>
>Erm, that is definitely not a typo... :/
>

>> ..and for some unknown reason it introduce a empty line deleted and added
>> back.
>
>Presumably your editor is configured to trim trailing whitespace on save.
>
>Furthermore, there are several instances in the other patches where your
>"corrections" are grammatically incorrect, I'm not sure what the deal is
>with patch #14, and you've also used the wrong subsystem name (it should
>be "dmaengine"). It's great to want to clean things up, but please pay a
>bit of care and attention to what you're actually doing.


Thank you so much, I shall be more careful.
>
>Robin.
>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>   drivers/dma/Kconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index 0c2827fd8c19..30e8cc26f43b 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -170,15 +170,15 @@ config DMA_SUN6I
>>   	  Support for the DMA engine first found in Allwinner A31 SoCs.
>>
>>   config DW_AXI_DMAC
>> -	tristate "Synopsys DesignWare AXI DMA support"
>> +	tristate "Synopsis DesignWare AXI DMA support"
>>   	depends on OF || COMPILE_TEST
>>   	depends on HAS_IOMEM
>>   	select DMA_ENGINE
>>   	select DMA_VIRTUAL_CHANNELS
>>   	help
>> -	  Enable support for Synopsys DesignWare AXI DMA controller.
>> +	  Enable support for Synopsis DesignWare AXI DMA controller.
>>   	  NOTE: This driver wasn't tested on 64 bit platform because
>> -	  of lack 64 bit platform with Synopsys DW AXI DMAC.
>> +	  of lack 64 bit platform with Synopsis DW AXI DMAC.
>>
>>   config EP93XX_DMA
>>   	bool "Cirrus Logic EP93xx DMA support"
>> @@ -394,7 +394,7 @@ config MOXART_DMA
>>   	select DMA_VIRTUAL_CHANNELS
>>   	help
>>   	  Enable support for the MOXA ART SoC DMA controller.
>> -
>> +
>>   	  Say Y here if you enabled MMP ADMA, otherwise say N.
>>
>>   config MPC512X_DMA
>> --
>> 2.26.3
>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>

--ZkHisyvIHxtmch2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBjlK0ACgkQsjqdtxFL
KRV/Awf/WgJ4kZNXg13Lymj81qWKh0xQChcPR1byavkwRKFeyk4mIQDv4/V33f03
x8lKJRgdvwchbQrJXtz1HkobUN2Yx2wQ8aprpF+kOiv0brN8c7TE92xf7dxnjL7T
3SSjbN44aYkmCCyV/Em37qXQi4/WrhZbP70K2P89e++Xsjb/rElNBwlmQzyjx0Jt
KIiXNgr5vFaqJOtwrMFOwDqparI5v70FJjHSTjZMHPPJTiIuYwMSl4r57ABV2s+7
jXyj1J6ePWL0sfX8h4eo2sBFtcuirP8NZMJbHw4lA0JG8FE6nBDAiFohWucgPBdo
8vzWlWSOOWJTt5N84XfYEPiJB1caGg==
=WK+C
-----END PGP SIGNATURE-----

--ZkHisyvIHxtmch2f--
