Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82B584A4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 05:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvD8L30nwz30Ly
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 13:51:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=KV0WesXa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=KV0WesXa;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvD7f6tyVz2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 13:50:35 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id b10so3552904pjq.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 20:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YQpurthpd79ltKeNcne3CW9AN47hruLnqp7ECw/DFPY=;
        b=KV0WesXazPGGQgHCyrTIeS5eGadDx3WUDze+7p6emj8xgNmrF03XqWzy6atLQWqJUM
         gkavXGZbmuXlIsi+R8Qo3yJcvcVv8Qizp5s4iYqWwoCWoYEsJNlKWZp42IfS/7tCGPZQ
         H3PMI4M5lTgUDuJxhHvVAzWLuHvXhiz7prMZrO33MJbHcIDuPCv/FS/18u5LvLhL21HN
         Zn/zlbWxorQm7MD+OL6oYg8ImylwTu1a9I6yLm7NcWtsdG4I7ZN5aXY9ifMX9eI9RpSY
         Ko5PMu01R7wMn5lD0Uie57TWzbmVHYENko0oTdH80PYKCAaUnYFeZ/YLTzpcn5qzkvH3
         GQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YQpurthpd79ltKeNcne3CW9AN47hruLnqp7ECw/DFPY=;
        b=15NEsI+Uh+g56StemOQtg553BSiEEwYb8iHypznXutJxZvucmDknFg7KsGrqZ2jXIT
         wLGgYul/xawRunkIIb1IcgqErZ8NzGqVzH0fs4hnh4wB+PMM2kA4D+hhZSodLo5dv/Bd
         1XmM9h9vR6Mxt6YXut8Ix2VJnHt+niXVg1HSvcg8y87yXjU4k2+Plr1+tUmWw3xPHJGL
         cKhKoMMISIu2qkAXnmXQ2nXoq5vREPM3pQ2xA0qBa8+flz+BGxETGyKk0TWcY4NERJlV
         L8sJ6V7vlo2eRL31xpUQWigVtpXCSy38hds02gpblZatMFx3JO65WpbhUgFb+zh2kmD2
         jb/A==
X-Gm-Message-State: ACgBeo3kX3g1RPPQ1EsZpTgC6UJgU/jcv1AX4yQ6NZ0IQ61nobT4taYo
	gVxJbE8jjgbks53jNje/OCRSOg==
X-Google-Smtp-Source: AA6agR60ruOjF9mnAPPgGOUWvaJkztxX2/z8cghwrKPSMu8fHHJNxJpysVKsIwQoLxDKbSeGgSDTAA==
X-Received: by 2002:a17:90b:3e89:b0:1f0:4233:b20e with SMTP id rj9-20020a17090b3e8900b001f04233b20emr2012452pjb.0.1659066632918;
        Thu, 28 Jul 2022 20:50:32 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id o124-20020a625a82000000b005289fbef7c4sm1638163pfb.140.2022.07.28.20.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 20:50:32 -0700 (PDT)
Message-ID: <78db23aa-ff77-478e-efaa-058fe08765d9@ozlabs.ru>
Date: Fri, 29 Jul 2022 13:50:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Oliver O'Halloran <oohall@gmail.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
 <300aa0fe-31c5-4ed2-d0a2-597c2c305f91@ozlabs.ru>
 <CAOSf1CHxkSxGXopT=9i3N9xUmj0=13J1V_M=or23ZamucXyu7w@mail.gmail.com>
 <BN9PR11MB527626B389A0F7A4AB19B6728C999@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <BN9PR11MB527626B389A0F7A4AB19B6728C999@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Joel Stanley <joel@jms.id.au>, Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/07/2022 13:10, Tian, Kevin wrote:
>> From: Oliver O'Halloran <oohall@gmail.com>
>> Sent: Friday, July 29, 2022 10:53 AM
>>
>> On Fri, Jul 29, 2022 at 12:21 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>> *snip*
>>>
>>> About this. If a platform has a concept of explicit DMA windows (2 or
>>> more), is it one domain with 2 windows or 2 domains with one window
>> each?
>>>
>>> If it is 2 windows, iommu_domain_ops misses windows manipulation
>>> callbacks (I vaguely remember it being there for embedded PPC64 but
>>> cannot find it quickly).
>>>
>>> If it is 1 window per a domain, then can a device be attached to 2
>>> domains at least in theory (I suspect not)?
>>>
>>> On server POWER CPUs, each DMA window is backed by an independent
>> IOMMU
>>> page table. (reminder) A window is a bus address range where devices are
>>> allowed to DMA to/from ;)
>>
>> I've always thought of windows as being entries to a top-level "iommu
>> page table" for the device / domain. The fact each window is backed by
>> a separate IOMMU page table shouldn't really be relevant outside the
>> arch/platform.
> 
> Yes. This is what was agreed when discussing how to integrate iommufd
> with POWER [1].
> 
> One domain represents one address space.
> 
> Windows are just constraints on the address space for what ranges can
> be mapped.
> 
> having two page tables underlying is just kind of POWER specific format.


It is a POWER specific thing with one not-so-obvious consequence of each 
window having an independent page size (fixed at the moment or creation) 
and (most likely) different page size, like, 4K vs. 2M.


> 
> Thanks
> Kevin
> 
> [1] https://lore.kernel.org/all/Yns+TCSa6hWbU7wZ@yekko/

-- 
Alexey
