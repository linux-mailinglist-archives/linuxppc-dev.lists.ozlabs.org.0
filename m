Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4633C45A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzkBB1cz5z30F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cIp6tCmz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cIp6tCmz; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzk9l5twtz2xxk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 04:36:25 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id o19so2197022qvu.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=70AY4ZT/fb+lIj7IJv0hqaMfunomtHXTpxDXoKgrOhc=;
 b=cIp6tCmzcvR3woFmCbsaYF85tEbojD/yic9MphQHe4Aei9VpT2JerVun9TNmzT/YyS
 TAyflnidpzX+W1sOQb6AbQUyrNhjNxp/sCqdeA+XiXthTv6hwx3ajo1m2zoU4b3f+vLi
 yAgdiS4bULSk/shCV+/2cMrA6x5e0OkhlTU36Dc3WhTsy/K711Vc3t5m45tgEcipf2rD
 xkJd4DZIP8JtlqKJGx+bLvtJBUaqMS1BvIgOxRBE5cRXVnDV4L0A0lCX2FeOFpg6RUTV
 FwKTmbIiVREAYE+pvuI6F+UMVQF8VR+p/9SWHOmXYuMnC7wYhL5yVnZYJh82LXRAadAK
 W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=70AY4ZT/fb+lIj7IJv0hqaMfunomtHXTpxDXoKgrOhc=;
 b=GWEl8+5QhOlbVn6W48o9zUxsXdgenLvQfkMYeRlXWIsmQV8rhvCKmfrAMpmpHMQVOu
 cSepDs+BI9xcjqMyblfJGM1NplZjOqSHHogP1GdgwG1dSild5E7hD2llKmhqm2YrQwbg
 YJ56TrI7PkHoUeuNr/XwnSQWnClKqgqSSZ2Ruz31YCJH38VElgFb7qi6HAZNWNYQ91RI
 h5Dz2hu/kjP2j8FQ5AgVQAKnic9szrs5HIpjmt6XBk83NyAJUdiW0OUkDGr/QeBX3neG
 /XnR0aVZi3mwXLdlPiePhK6UbxBvNCgp9mZupUhefrvtsDiMwD9wbL5Qtvrbinuf4E6r
 tE5A==
X-Gm-Message-State: AOAM533WiyGcY8Y7wRsCqGyLHQJiv1+PHGrYoRMubF9iMqQnUTFsnbJG
 z72TKhz1to63UvmStDhSVcE=
X-Google-Smtp-Source: ABdhPJxl+eASopO75uYm5OcTV83+35u/eWuZvp1/aCaoBlB3vwh1tkci6+MMhAlNJ0RYK9MhomJ1Iw==
X-Received: by 2002:a05:6214:1305:: with SMTP id
 a5mr11795254qvv.42.1615829781688; 
 Mon, 15 Mar 2021 10:36:21 -0700 (PDT)
Received: from [192.168.15.40] ([179.118.131.107])
 by smtp.gmail.com with ESMTPSA id q15sm11543750qti.9.2021.03.15.10.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 10:36:21 -0700 (PDT)
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210312143154.3181109-1-clg@kaod.org>
 <bd0c948c-64f8-cf64-6d30-b9167b6a7629@gmail.com>
 <09b298ce-a566-0542-0aa8-8c4e5248bda6@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5f804f60-4b54-71ee-fde3-b60713ae151d@gmail.com>
Date: Mon, 15 Mar 2021 14:36:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <09b298ce-a566-0542-0aa8-8c4e5248bda6@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/15/21 1:16 PM, Cédric Le Goater wrote:
> On 3/15/21 4:12 PM, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/12/21 11:31 AM, Cédric Le Goater wrote:
>>> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
>>> available to userspace") introduce a cpu_to_chip_id() routine for the
>>> PowerNV platform using the "ibm,chip-id" property to query the chip id
>>> of a CPU. But PAPR does not specify such a property and the node id
>>> query is broken.
>>>
>>> Use cpu_to_node() instead which guarantees to have a correct value on
>>> all platforms, PowerNV an pSeries.
>>
>> It is worth mentioning that that this patch will change how
>> topology_physical_package_id() represents in a QEMU guest. Right now, ibm,chip-id
>> in QEMU is matching the socket-id. After this patch, topology_physical_package_id()
>> will now match the NUMA id of the CPU.
> 
> yes. I should have added some more background.
> 
> LPARs are impacted by the use of ibm,chip-id because the property
> does not exist under PowerVM and the topology-id in sysfs is always
> -1 even if NUMA nodes are defined.
> 
> Under QEMU/KVM, ibm,chip-id is badly calculated when using uncommon
> SMT configuration. This leads to a bogus topology-id value being
> exported in sysfs.
> 
> The use of cpu_to_node() guarantees to have a correct NUMA node id
> under both environments QEMU/KVM and PowerVM.
> 
> On the PowerNV platform, the numa node id returned by cpu_to_node()
> is computed from the "ibm,associativity" property of the CPU. Its
> value is built from the OPAL chip id and is equivalent to ibm,chip-id.
> 
> May be I should rephrase the commit log in a v2 ?

It's a fine idea, given that apparently we don't have documentation explaining
these details (well, at least I didn't find any). We can reference the commit
message later on as explanation :)




Thanks,

DHB

> 
> C.
> 
>   
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>>
>>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>>> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>>> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>    arch/powerpc/include/asm/topology.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>>> index 3beeb030cd78..887c42a4e43d 100644
>>> --- a/arch/powerpc/include/asm/topology.h
>>> +++ b/arch/powerpc/include/asm/topology.h
>>> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>>>    #ifdef CONFIG_PPC64
>>>    #include <asm/smp.h>
>>>    -#define topology_physical_package_id(cpu)    (cpu_to_chip_id(cpu))
>>> +#define topology_physical_package_id(cpu)    (cpu_to_node(cpu))
>>>      #define topology_sibling_cpumask(cpu)    (per_cpu(cpu_sibling_map, cpu))
>>>    #define topology_core_cpumask(cpu)    (cpu_cpu_mask(cpu))
>>>
> 
