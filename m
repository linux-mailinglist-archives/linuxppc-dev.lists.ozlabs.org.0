Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146156BAC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 15:31:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfZ1m1dcPz3cdX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 23:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rlaoRUb7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rlaoRUb7;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfZ153Xwnz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 23:31:03 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id i190so9769377pge.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=agmImm7M/e7knYeBADeaOmcU8r38h0Z30aSlpuIYjxU=;
        b=rlaoRUb7b/fi0yI2l5KeHsPs/EZ3lsYwF/bv1lIu4ZPZvmJFqplzQlx3c3agNHp3DE
         doW41t0gA0aIxjS4LIkoUzcBa622NQdSEIAkWo8tHCJYPEVkJtKgifdosMDijSDrDrEa
         PFAIvyiBZtwCwxvaXuvlNIccZWVBNOGgchoA0vY50KYbzKx6yL9/hLPndBZT28dsloIU
         9IeileIeiNAa9JskW508VNMhIukUs8tU63v6COkC3kYLRaOEu75h+9kcCXRL1prPBbwh
         WTyGZt+g5wIXgJ4oWE/RzeE0RRg29NY3mLUEnrZsnsIdylPEQdOL1pgM8pvkEB/UgSWs
         6HcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=agmImm7M/e7knYeBADeaOmcU8r38h0Z30aSlpuIYjxU=;
        b=CL+c4m3aJbpCizLJfaK7paKjOUiJx1WXVcT5aMsFtGHnDXHVWoQD3NdgUVfMS7QeBw
         HAF/GZP3E/UGqnLpYRYsnFVngZTvxUd8LQyucDhFS/X9mqLyl/UFIB5/Ny9RneBnlvj/
         rifVP0cRfV/Js9/usfrlIf12GxktpCTtSm3FIVvPUV27eSJJd6TQh3sf3+csje1Nsf4J
         HXE4iXy9wctgX9BeTqKBQXKV5+/vCQaAR9jA+mlyN9bUdOm/NwCZO9Ng2JUGFSht3UmE
         SlOrMxCxSfF5HT09wiKq34oo/mjUZ5m5MDmZfWbYkKr2/VlfMER9virskcLADBQ/ACxF
         urXQ==
X-Gm-Message-State: AJIora9Vyg9s/Y5YwBhJ6ON0k9KcYftnc6ZJ9zGcCqmbjfLjx0fntbm0
	ihER/UasZY6h44JL5HqRjrVUNQ==
X-Google-Smtp-Source: AGRyM1upwSFrCfIxNTP4nwK3Ju2pXSF0iht0K/vsLnPtfkyabxUn/zfIfAOWj334Dv/aJ5hCm7KLaQ==
X-Received: by 2002:a63:4756:0:b0:412:88b5:2a23 with SMTP id w22-20020a634756000000b0041288b52a23mr3334765pgk.442.1657287060587;
        Fri, 08 Jul 2022 06:31:00 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id c20-20020a656754000000b003fcf1279c84sm27371159pgu.33.2022.07.08.06.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 06:30:59 -0700 (PDT)
Message-ID: <f2b51230-90b8-ecf0-8011-446e2f526bb4@ozlabs.ru>
Date: Fri, 8 Jul 2022 23:32:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <e24d91fb-3da9-d60a-3792-bca0fe550cc7@ozlabs.ru>
 <20220708131910.GA3744@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220708131910.GA3744@nvidia.com>
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2022 23:19, Jason Gunthorpe wrote:
> On Fri, Jul 08, 2022 at 11:10:07PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 08/07/2022 21:55, Jason Gunthorpe wrote:
>>> On Fri, Jul 08, 2022 at 04:34:55PM +1000, Alexey Kardashevskiy wrote:
>>>
>>>> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is fine
>>>> to do nothing as tce_iommu_take_ownership() and
>>>> tce_iommu_take_ownership_ddw() take care of not having active DMA mappings.
>>>
>>> That will still cause a security problem because
>>> tce_iommu_take_ownership()/etc are called too late. This is the moment
>>> in the flow when the ownershift must change away from the DMA API that
>>> power implements and to VFIO, not later.
>>
>> It is getting better and better :)
>>
>> On POWERNV, at the boot time the platforms sets up PHBs, enables bypass,
>> creates groups and attaches devices. As for now attaching devices to the
>> default domain (which is BLOCKED) fails the not-being-use check as enabled
>> bypass means "everything is mapped for DMA". So at this point the default
>> domain has to be IOMMU_DOMAIN_IDENTITY or IOMMU_DOMAIN_UNMANAGED so later on
>> VFIO can move devices to IOMMU_DOMAIN_BLOCKED. Am I missing something?
> 
> For power the default domain should be NULL
> 
> NULL means that the platform is using the group to provide its DMA
> ops. IIRC this patch was already setup correctly to do this?
> 
> The transition from NULL to blocking must isolate the group so all DMA
> is blocked. blocking to NULL should re-estbalish platform DMA API
> control.
> 
> The default domain should be non-NULL when the normal dma-iommu stuff is
> providing the DMA API.
> 
> So, I think it is already setup properly, it is just the question of
> what to do when entering/leaving blocking mode.



Well, the patch calls iommu_probe_device() which calls 
iommu_alloc_default_domain() which creates IOMMU_DOMAIN_BLOCKED (==0) as 
nothing initialized iommu_def_domain_type. Need a different default type 
(and return NULL when IOMMU API tries creating this type)?



> 
> Jason

-- 
Alexey
