Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F76C56B5D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 11:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfSzx0jdHz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Vv8o5YL4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Vv8o5YL4;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfSzD36gzz3c1l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 19:44:06 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id x184so9720799pfx.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jvVOA64qiLeWcvytZ8Nz5JHYirqHQ4D1IsDEkSGupS0=;
        b=Vv8o5YL4cnB9aUOM/u5ozjsyhs8Ie1jaJaQMVe2wKDtOzOwNSXUEiN6CEqewyl14+O
         FjHiRJwKwoKMsml0R4tWK6SQg7cLmpayqgjUFRBDb1DOwVXOWazgPoKUliQ0ES6K+pbD
         stewFV6a0vDiCoJgeZwoQ2+2FsBnkgmBnQlnXK2PmkPosgfkEZ8MlgwnGsiNGCUk5C9E
         jaaJlAEAPHc54yPMdICqAWNNXq6NAzgTlK99mzd1LPQTpq8H/SquuscDUF8EgyWZE/w7
         9P/Im6HwdkvrcquH5oCaPphML6Fbm6KBA95DqTaADyA/w2X8fSNqeSww11dKnxpLEGzC
         C8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jvVOA64qiLeWcvytZ8Nz5JHYirqHQ4D1IsDEkSGupS0=;
        b=WS5ygQKKW4Ctw8+wG00Fmdu9Sj8cc/Tu98o9HFZWz22IRo9TkI4aHbE+GGTsjuQaLG
         cCNjT81iyODk7drUR9R1RyRyJDM5AdIwiXw7r2zA1gEPQgwu3ifKpCBMm8vsyHz2vW/j
         0OnNAAJ2ap35iDFjg2ELGO2RSmzEXsz0ktfGDNZwA0c1maN6SA8craEiEnK4RY1/XtR8
         BA63RP4GZ+AGqr4CPzCUNO409QTqC/M3uecfiGXp2wctpSahhS9JJXEzv4+5KAo/omUq
         dbeWqrwMjQzearm19gzrXJGyXOCexY5qJVSxDPzkd+Bsi+trJ96giMpc3j8AcsRQEPXY
         Wwvw==
X-Gm-Message-State: AJIora8Sa9sTYtpliN98xfN3JNeR3mYt/lvT2TDBTwHUkB+e0tmnRT6/
	RxOVbJ6SiLZFv1no6uVcXl/GFA==
X-Google-Smtp-Source: AGRyM1sQecYHz5Oa7WYo9dmJsYLq6/1IdFb+xzLIYwkVj10bKIPHB3+lJGrGNpExDrLXv9q267Shww==
X-Received: by 2002:a63:a46:0:b0:412:b1d6:94cf with SMTP id z6-20020a630a46000000b00412b1d694cfmr2550224pgk.373.1657273442385;
        Fri, 08 Jul 2022 02:44:02 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902eb8100b0016c08addb4csm4286341plg.127.2022.07.08.02.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 02:44:01 -0700 (PDT)
Message-ID: <26838575-f06a-4525-f3ca-7fabb19e3550@ozlabs.ru>
Date: Fri, 8 Jul 2022 19:45:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2022 17:32, Tian, Kevin wrote:
>> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Sent: Friday, July 8, 2022 2:35 PM
>> On 7/8/22 15:00, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 7/8/22 01:10, Jason Gunthorpe wrote:
>>>> On Thu, Jul 07, 2022 at 11:55:52PM +1000, Alexey Kardashevskiy wrote:
>>>>> Historically PPC64 managed to avoid using iommu_ops. The VFIO driver
>>>>> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
>>>>> the Type1 VFIO driver. Recent development though has added a
>> coherency
>>>>> capability check to the generic part of VFIO and essentially disabled
>>>>> VFIO on PPC64; the similar story about
>> iommu_group_dma_owner_claimed().
>>>>>
>>>>> This adds an iommu_ops stub which reports support for cache
>>>>> coherency. Because bus_set_iommu() triggers IOMMU probing of PCI
>>>>> devices,
>>>>> this provides minimum code for the probing to not crash.
> 
> stale comment since this patch doesn't use bus_set_iommu() now.
> 
>>>>> +
>>>>> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
>>>>> +                      struct device *dev)
>>>>> +{
>>>>> +    return 0;
>>>>> +}
>>>>
>>>> It is important when this returns that the iommu translation is all
>>>> emptied. There should be no left over translations from the DMA API at
>>>> this point. I have no idea how power works in this regard, but it
>>>> should be explained why this is safe in a comment at a minimum.
>>>>
>>>   > It will turn into a security problem to allow kernel mappings to leak
>>>   > past this point.
>>>   >
>>>
>>> I've added for v2 checking for no valid mappings for a device (or, more
>>> precisely, in the associated iommu_group), this domain does not need
>>> checking, right?
>>
>>
>> Uff, not that simple. Looks like once a device is in a group, its
>> dma_ops is set to iommu_dma_ops and IOMMU code owns DMA. I guess
>> then
>> there is a way to set those to NULL or do something similar to let
>> dma_map_direct() from kernel/dma/mapping.c return "true", is not there?
> 
> dev->dma_ops is NULL as long as you don't handle DMA domain type
> here and don't call iommu_setup_dma_ops().
> 
> Given this only supports blocking domain then above should be irrelevant.
> 
>>
>> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is
>> fine to do nothing as tce_iommu_take_ownership() and
>> tce_iommu_take_ownership_ddw() take care of not having active DMA
>> mappings. Thanks,
>>
>>
>>>
>>> In general, is "domain" something from hardware or it is a software
>>> concept? Thanks,
>>>
> 
> 'domain' is a software concept to represent the hardware I/O page
> table. A blocking domain means all DMAs from a device attached to
> this domain are blocked/rejected (equivalent to an empty I/O page
> table), usually enforced in the .attach_dev() callback.
> 
> Yes, a comment for why having a NULL .attach_dev() is OK is welcomed.


Making it NULL makes __iommu_attach_device() fail, .attach_dev() needs 
to return 0 in this crippled environment. Thanks for explaining the 
rest, good food for thoughts.



> 
> Thanks
> Kevin

-- 
Alexey
