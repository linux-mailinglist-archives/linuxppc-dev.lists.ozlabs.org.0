Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 157693AB1A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 12:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5JnW5SzHz3btW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 20:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b+LIGjui;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b+LIGjui; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Jn405Tlz2yXq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 20:53:10 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id g12so4335690qtb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QV5hZES5+LwHLSe5BRlG9xZjOgniT0X0M4QdEJLnlOc=;
 b=b+LIGjuihJqxk7/mAfGlZwwZX9rO+n7l1YAsm1pW8Ke0BJGUN1lc/KhRRGjAAexZws
 V2DyzgJBVf+p7JjyqikrTSJ1PI3y74FgxtERiMQ1+VUN3lGD0Gk/o63EwwJCjlELhmG1
 ik0wlkK/hriBgW5LrtI6551+d507wivHyW+PZf6P70/dLrdTMvlOZ/8s/XV3PImy07y/
 pB6kYY3Im2+j4jFjNKdwrXh8MGxRX9MaMSDpvbVmIDuEyTGRCSZnS/dpzkXDID0/ATIm
 6T26dSOQs+aZkKx7yQq2I4dpVb1chbKTIyIxB78Mjptwh9CJo50+lac5q968AbBg3JmN
 apuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QV5hZES5+LwHLSe5BRlG9xZjOgniT0X0M4QdEJLnlOc=;
 b=I88I76t56a+lASxYtFLz1VsDI1ZWWEzDJOCbbBXHPUVAi+UEb1v3/VpmJcylE/islY
 4SR38i07QHLAKW2sjOCGxop5YANqcEetGhcn4880NGR5lDd9f5pxdCGJPs2aOqCm/R3Q
 LOGzvBEIpOWbvqIDndpb2+V1cLSt2LZasnnUSRqrrD3/AdxGKKCTiwhKCjZWjy04QB5H
 3FsylMQWU2uClfQ7tFoM9s9Z0cpwcyMlQt+VAbN+FfQkWeawRF09a1NQyRwyVBwLoO1o
 0Gt9lq1d4ZgGnzX9vWGaXIxWnGF4zGB7KGkhR+0WiyltxDKTFVRdSr8zcDQ+qBz140U/
 A9GA==
X-Gm-Message-State: AOAM532ErUh7sLdZwGIG/13eUvGWmxwPLKSR0SU3RTZn6FYqrAhA9NMN
 1dlSqrPAXCHn9czq+DQeXEDoQloXgUk=
X-Google-Smtp-Source: ABdhPJzuV24Aac/EXQvthI8i+XPR3VgAxeTGdxa05FAwztuR5gKRlaisrVu5s650vo7Ckv9cpjAfKQ==
X-Received: by 2002:ac8:4e1b:: with SMTP id c27mr4499267qtw.22.1623927186525; 
 Thu, 17 Jun 2021 03:53:06 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:59e4:b479:6e4f:abba:619e?
 ([2804:431:c7c6:59e4:b479:6e4f:abba:619e])
 by smtp.gmail.com with ESMTPSA id y3sm1417235qkf.2.2021.06.17.03.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 03:53:06 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
To: David Gibson <david@gibson.dropbear.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com> <YMgkyfc4g+na5GJZ@yekko>
 <87czsnoejl.fsf@linux.ibm.com> <YMhKEJ9WSlapuSE6@yekko>
 <87a6nrobf6.fsf@linux.ibm.com> <YMr92K2gaidDHeqC@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
Date: Thu, 17 Jun 2021 07:53:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMr92K2gaidDHeqC@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/17/21 4:46 AM, David Gibson wrote:
> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>
>>> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>
>>>>> On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>>>>>> FORM2 introduce a concept of secondary domain which is identical to the
>>>>>> conceept of FORM1 primary domain. Use secondary domain as the numa node
>>>>>> when using persistent memory device. For DAX kmem use the logical domain
>>>>>> id introduced in FORM2. This new numa node
>>>>>>
>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>> ---
>>>>>>   arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>>>>>>   arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>>>>>>   arch/powerpc/platforms/pseries/pseries.h  |  1 +
>>>>>>   3 files changed, 45 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>>> index 86cd2af014f7..b9ac6d02e944 100644
>>>>>> --- a/arch/powerpc/mm/numa.c
>>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>>> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>>>>>>   	return nid;
>>>>>>   }
>>>>>>   
>>>>>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>>>>>> +{
>>>>>> +	int secondary_index;
>>>>>> +	const __be32 *associativity;
>>>>>> +
>>>>>> +	if (!numa_enabled) {
>>>>>> +		*primary = NUMA_NO_NODE;
>>>>>> +		*secondary = NUMA_NO_NODE;
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>> +	associativity = of_get_associativity(node);
>>>>>> +	if (!associativity)
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>>>>>> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>>>>>> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>>>>>
>>>>> Secondary ID is always the second reference point, but primary depends
>>>>> on the length of resources?  That seems very weird.
>>>>
>>>> primary_domain_index is distance_ref_point[0]. With Form2 we would find
>>>> both primary and secondary domain ID same for all resources other than
>>>> persistent memory device. The usage w.r.t. persistent memory is
>>>> explained in patch 7.
>>>
>>> Right, I misunderstood
>>>
>>>>
>>>> With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
>>>> the kernel should use when using persistent memory devices.
>>>
>>> This seems kind of bogus.  With Form1, the primary/secondary ID are a
>>> sort of heirarchy of distance (things with same primary ID are very
>>> close, things with same secondary are kinda-close, etc.).  With Form2,
>>> it's referring to their effective node for different purposes.
>>>
>>> Using the same terms for different meanings seems unnecessarily
>>> confusing.
>>
>> They are essentially domainIDs. The interpretation of them are different
>> between Form1 and Form2. Hence I kept referring to them as primary and
>> secondary domainID. Any suggestion on what to name them with Form2?
> 
> My point is that reusing associativity-reference-points for something
> with completely unrelated semantics seems like a very poor choice.


I agree that this reuse can be confusing. I could argue that there is
precedent for that in PAPR - FORM0 puts a different spin on the same
property as well - but there is no need to keep following existing PAPR
practices in new spec (and some might argue it's best not to).

As far as QEMU goes, renaming this property to "numa-associativity-mode"
(just an example) is a quick change to do since we separated FORM1 and FORM2
code over there.

Doing such a rename can also help with the issue of having to describe new
FORM2 semantics using "least significant boundary" or "primary domain" or
any FORM0|FORM1 related terminology.


Thanks,


Daniel



> 
>>>> Persistent memory devices
>>>> can also be used as regular memory using DAX KMEM driver and primary domainID indicates
>>>> the numa node number OS should use when using these devices as regular memory. Secondary
>>>> domainID is the numa node number that should be used when using this device as
>>>> persistent memory.
>>>
>>> It's weird to me that you'd want to consider them in different nodes
>>> for those different purposes.
>>
>>
>>     --------------------------------------
>>    |                            NUMA node0 |
>>    |    ProcA -----> MEMA                  |
>>    |     |                                 |
>>    |	|                                 |
>>    |	-------------------> PMEMB        |
>>    |                                       |
>>     ---------------------------------------
>>
>>     ---------------------------------------
>>    |                            NUMA node1 |
>>    |                                       |
>>    |    ProcB -------> MEMC                |
>>    |	|                                 |
>>    |	-------------------> PMEMD        |
>>    |                                       |
>>    |                                       |
>>     ---------------------------------------
>>   
>>
>> For a topology like the above application running of ProcA wants to find out
>> persistent memory mount local to its NUMA node. Hence when using it as
>> pmem fsdax mount or devdax device we want PMEMB to have associativity
>> of NUMA node0 and PMEMD to have associativity of NUMA node 1. But when
>> we want to use it as memory using dax kmem driver, we want both PMEMB
>> and PMEMD to appear as memory only NUMA node at a distance that is
>> derived based on the latency of the media.
> 
> I'm still not understanding why the latency we care about is different
> in the two cases.  Can you give an example of when this would result
> in different actual node assignments for the two different cases?
> 
