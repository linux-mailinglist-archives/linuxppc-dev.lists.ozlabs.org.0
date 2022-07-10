Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7A56CF08
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 14:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgmbN50nyz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 22:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4I1IMD/e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4I1IMD/e;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgmZj4Cp4z306l
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 22:30:50 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id b9so2699118pfp.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=fg5E2eBgaQlyCb3LdAsjmkolgSV+8nQczZEF7J+6Qm4=;
        b=4I1IMD/eTCt3TfO4DHK3yeekUC4+snqx0avX3EyMKfEoOZNojflfuka97cip2G/joZ
         /VNVp5Nz6s4TAmkoVfV5HCDiN8213UwurW/iMkVuAW1LsNgpaDsFAdjQcpqmXJiIbW1V
         G7Ky2FXQ6qUfUDEhbS9lsqUM3I9D5TqjUgbZa53RvT/TuNkmIPI5mpHiFyXhdyI7V9Sh
         3PlJljMuYMdUrmbL1i4xZ3r2xZrKe7scOCdTQDFhW3zWCPamQpEzW1eMdxH1HOc3/bdm
         Wf8/RN+fdNiXgmt5FbmFH7uEZViIKWwnmwE8GA7sTog10mY2SOoFaZX/whfmSNFL/gqD
         KVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=fg5E2eBgaQlyCb3LdAsjmkolgSV+8nQczZEF7J+6Qm4=;
        b=vWmWLxRilBe9waVkffL3aBsjF45jVc8fByAG7iFZbjZCPQpQSwSDbQ0Sotq7hc84EX
         irB0XDDUA9Ws+JKj6kS4Evox7pPpHliI2Eed8rYGnPLFcg0hNmI/yvVk4vo8OVUpEtZs
         bdLJlGnrWff/sdFRW3nur7xP3uPvVoPU6hnGerTy//cZnzaQdiolv1ggdBJ6IMrUSNqS
         joUUXBX/ToInJl9T2v6uq9AcvOshiHSsppKFoq72YlqGpeSIH1riqILA5vorVQGnI1lI
         m17RT/eIuWodl0jXr8SQBi49McSfrBrSYZIIa3C26jFDXqZHsa8tkvUjGuMRRewusRjI
         +zvQ==
X-Gm-Message-State: AJIora9HRgHNoTVhb0LxyAU0NyhD3Iti7cwgK4GHqYX+jk20P0oAdIgp
	G4HPVCidKRG7Ur9VuxQDhiaPVQ==
X-Google-Smtp-Source: AGRyM1vrrDOd2+w370BUJEXxc4NSswwO3/F/bxRU2nXSY5TquPrZObhrp0H2Vus+8mrInxi5F/e6Zg==
X-Received: by 2002:a05:6a00:1911:b0:525:9ffe:cffc with SMTP id y17-20020a056a00191100b005259ffecffcmr13035046pfi.54.1657456246663;
        Sun, 10 Jul 2022 05:30:46 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id y15-20020aa793cf000000b0052ac038672esm1921011pff.33.2022.07.10.05.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 05:30:45 -0700 (PDT)
Message-ID: <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
Date: Sun, 10 Jul 2022 22:32:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
 <Yspx307fxRXT67XG@nvidia.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <Yspx307fxRXT67XG@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/07/2022 16:29, Jason Gunthorpe wrote:
> On Sat, Jul 09, 2022 at 12:58:00PM +1000, Alexey Kardashevskiy wrote:
>   
>> driver->ops->attach_group on POWER attaches a group so VFIO claims ownership
>> over a group, not devices. Underlying API (pnv_ioda2_take_ownership()) does
>> not need to keep track of the state, it is one group, one ownership
>> transfer, easy.
> 
> It should not change, I think you can just map the attach_dev to the group?

There are multiple devices in a group, cannot just map 1:1.


>> What is exactly the reason why iommu_group_claim_dma_owner() cannot stay
>> inside Type1 (sorry if it was explained, I could have missed)?
> 
> It has nothing to do with type1 - the ownership system is designed to
> exclude other in-kernel drivers from using the group at the same time
> vfio is using the group. power still needs this protection regardless
> of if is using the formal iommu api or not.

POWER deals with it in vfio_iommu_driver_ops::attach_group.

>> Also, from another mail, you said iommu_alloc_default_domain() should fail
>> on power but at least IOMMU_DOMAIN_BLOCKED must be supported, or the whole
>> iommu_group_claim_dma_owner() thing falls apart.
> 
> Yes
> 
>> And iommu_ops::domain_alloc() is not told if it is asked to create a default
>> domain, it only takes a type.
> 
> "default domain" refers to the default type pased to domain_alloc(),
> it will never be blocking, so it will always fail on power.
> "default domain" is better understood as the domain used by the DMA
> API

The DMA API on POWER does not use iommu_ops, it is dma_iommu_ops from 
arch/powerpc/kernel/dma-iommu.c from before 2005. so the default domain 
is type == 0 where 0 == BLOCKED.


-- 
Alexey
