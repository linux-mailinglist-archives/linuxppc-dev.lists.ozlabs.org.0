Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9063ABD40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Xwj58ckz3bw0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:00:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iPlEdd/x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iPlEdd/x; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5XwC0Lcgz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:00:10 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d9so5713052qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MbpAT803dGPAbZHUBvW8uPj/r5KNelGr1jAJCRWRXeY=;
 b=iPlEdd/x4ut87iO4Bd3KgPCBLIpZoWDl1dKONHZTUEtY8epd6xtwB6nL+fdfBTVq6b
 o7oQjm+pomFNACc89Y6f5ILlrfNSS27yC9jqq9zfR6KP9ibVYUXXrhuO1SahDSZe9MNr
 YdMciq2X1kWcaeBebVCUVV10p1zmh5hVaylBwuruf3S0nzUHNjz3VwRA1MJMQGaNI1wZ
 W0ZbqZy6WDfOro0ZB3eMMLZeLb/eeMiStSvoz7+Ro3TlgQCKg+XA2yHS7zvpTnnKf1Mb
 dEFNmqL0UmXFi0kWahl6o4nRw27XkbESWH1vnN4keYTBl4vefkHBs2TMni+orJrCsSEy
 /19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MbpAT803dGPAbZHUBvW8uPj/r5KNelGr1jAJCRWRXeY=;
 b=FZaMdArNFp2qejALlQJd1RliIBfmRxQEbHYvYjXjDoMF8Uk7SDtvT4NR4tiqW71dSt
 DC16sYc6sGV5srBK7PVdp1vwGFP+yodMfD5S/4fKLVLpJBjo9llhjK1lccFsuJkre/IF
 m/ajJw4FKw0jJE9vvD1J8kZ8viVRqFK/g6XS5SI1+ai8m1xyxGCzjpo6fuAz+DYBs2tO
 6fkA7ExJ9M4F6wx+nHorwRQz1GxfhTQ2euXOfcKY2+0V22Ti1VS8BK3X2hjp1B29Wpcu
 PaXuR9MD6TYcNQH2GEdeJEUKf6O5lP+h2mI4Nzt+Ojg2qN2DpHzx5TUlhyX5Mqp7ga9z
 Yb6g==
X-Gm-Message-State: AOAM5305DFjTuSQWRE5KAtDACe93Otcii21tSwCXX5+Wqscq8IlpX8fH
 yHMYOWWLQ+MuMvMO48Y9IMsqPBfQMmI=
X-Google-Smtp-Source: ABdhPJwIQrl3gThNNNx8SEf3WWUbgt9B6NCSDjFy382ZdhkuakfxvFHp68/DFalUpSrnMjD8azjxJw==
X-Received: by 2002:ac8:5ed5:: with SMTP id s21mr7051367qtx.87.1623960004500; 
 Thu, 17 Jun 2021 13:00:04 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:59e4:b479:6e4f:abba:619e?
 ([2804:431:c7c6:59e4:b479:6e4f:abba:619e])
 by smtp.gmail.com with ESMTPSA id z6sm2402218qke.24.2021.06.17.13.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 13:00:04 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com> <YMgkyfc4g+na5GJZ@yekko>
 <87czsnoejl.fsf@linux.ibm.com> <YMhKEJ9WSlapuSE6@yekko>
 <87a6nrobf6.fsf@linux.ibm.com> <YMr92K2gaidDHeqC@yekko>
 <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
 <87r1h0n3u6.fsf@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5e180af8-9d48-7519-0b35-967065f8e3e1@gmail.com>
Date: Thu, 17 Jun 2021 17:00:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r1h0n3u6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 6/17/21 8:11 AM, Aneesh Kumar K.V wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 6/17/21 4:46 AM, David Gibson wrote:
>>> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>
>>>>> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>>>
>>>>>>> On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>>>>>>>> FORM2 introduce a concept of secondary domain which is identical to the
>>>>>>>> conceept of FORM1 primary domain. Use secondary domain as the numa node
>>>>>>>> when using persistent memory device. For DAX kmem use the logical domain
>>>>>>>> id introduced in FORM2. This new numa node
>>>>>>>>
>>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>>>> ---
>>>>>>>>    arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>>>>>>>>    arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>>>>>>>>    arch/powerpc/platforms/pseries/pseries.h  |  1 +
>>>>>>>>    3 files changed, 45 insertions(+), 10 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>>>>> index 86cd2af014f7..b9ac6d02e944 100644
>>>>>>>> --- a/arch/powerpc/mm/numa.c
>>>>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>>>>> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>>>>>>>>    	return nid;
>>>>>>>>    }
>>>>>>>>    
>>>>>>>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>>>>>>>> +{
>>>>>>>> +	int secondary_index;
>>>>>>>> +	const __be32 *associativity;
>>>>>>>> +
>>>>>>>> +	if (!numa_enabled) {
>>>>>>>> +		*primary = NUMA_NO_NODE;
>>>>>>>> +		*secondary = NUMA_NO_NODE;
>>>>>>>> +		return 0;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	associativity = of_get_associativity(node);
>>>>>>>> +	if (!associativity)
>>>>>>>> +		return -ENODEV;
>>>>>>>> +
>>>>>>>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>>>>>>>> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>>>>>>>> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>>>>>>>
>>>>>>> Secondary ID is always the second reference point, but primary depends
>>>>>>> on the length of resources?  That seems very weird.
>>>>>>
>>>>>> primary_domain_index is distance_ref_point[0]. With Form2 we would find
>>>>>> both primary and secondary domain ID same for all resources other than
>>>>>> persistent memory device. The usage w.r.t. persistent memory is
>>>>>> explained in patch 7.
>>>>>
>>>>> Right, I misunderstood
>>>>>
>>>>>>
>>>>>> With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
>>>>>> the kernel should use when using persistent memory devices.
>>>>>
>>>>> This seems kind of bogus.  With Form1, the primary/secondary ID are a
>>>>> sort of heirarchy of distance (things with same primary ID are very
>>>>> close, things with same secondary are kinda-close, etc.).  With Form2,
>>>>> it's referring to their effective node for different purposes.
>>>>>
>>>>> Using the same terms for different meanings seems unnecessarily
>>>>> confusing.
>>>>
>>>> They are essentially domainIDs. The interpretation of them are different
>>>> between Form1 and Form2. Hence I kept referring to them as primary and
>>>> secondary domainID. Any suggestion on what to name them with Form2?
>>>
>>> My point is that reusing associativity-reference-points for something
>>> with completely unrelated semantics seems like a very poor choice.
>>
>>
>> I agree that this reuse can be confusing. I could argue that there is
>> precedent for that in PAPR - FORM0 puts a different spin on the same
>> property as well - but there is no need to keep following existing PAPR
>> practices in new spec (and some might argue it's best not to).
>>
>> As far as QEMU goes, renaming this property to "numa-associativity-mode"
>> (just an example) is a quick change to do since we separated FORM1 and FORM2
>> code over there.
>>
>> Doing such a rename can also help with the issue of having to describe new
>> FORM2 semantics using "least significant boundary" or "primary domain" or
>> any FORM0|FORM1 related terminology.
>>
> 
> It is not just changing the name, we will then have to explain the
> meaning of ibm,associativity-reference-points with FORM2 right?

Hmmmm why? My idea over there was to add a new property that indicates that
resource might have a different NUMA affinity based on the mode of operation
(like PMEM), and get rid of ibm,associativity-reference-points altogether.

The NUMA distances already express the topology. Closer distances indicates
closer proximity, larger distances indicates otherwise. Having
"associativity-reference-points" to reflect a  associativity domain
relationship, when you already have all the distances from each node, is
somewhat redundant.

The concept of 'associativity domain' was necessary in FORM1 because we had no
other way of telling distance between NUMA nodes. We needed to rely on these
overly complex and convoluted subdomain abstractions to say that "nodeA belongs
to the same third-level domain as node B, and in the second-level domain with
node C". The kernel would read that and calculate that each level is doubling
the distance from the level before and local_distance is 10, so:

distAA = 10  distAB= 20 distAC = 40

With FORM2, if this information is already explicit in ibm,numa-distance-table,
why bother calculating associativity domains? If you want to know whether
PROCA is closer to PROCB or PROCX, just look at the NUMA distance table and
see which one is closer.

  

> 
> With FORM2 we want to represent the topology better
> 
>   --------------------------------------------------------------------------------
> |                                                         domainID 20            |
> |   ---------------------------------------                                      |
> |  |                            NUMA node1 |                                     |
> |  |                                       |            --------------------     |
> |  |    ProcB -------> MEMC                |           |        NUMA node40 |    |
> |  |	|                                  |           |                    |    |
> |  |	---------------------------------- |-------->  |  PMEMD             |    |
> |  |                                       |            --------------------     |
> |  |                                       |                                     |
> |   ---------------------------------------                                      |
>   --------------------------------------------------------------------------------
> 
> ibm,associativity:
>          { 20, 1, 40}  -> PMEMD
>          { 20, 1, 1}  -> PROCB/MEMC
> 
> is the suggested FORM2 representation.


The way I see it, the '20' over there is not needed at all. What utility it
brings? And why create an associativity domain '1' in the MEMC associativity
at 0x3?

What the current QEMU FORM2 implementation is doing would be this:

           { 0, 0, 1, 40}  -> PMEMD
           { 0, 0, 0, 1}  -> PROCB/MEMC


PMEMD has a pointer to the NUMA node in which it would run as persistent
memory, node 1. All the memory/cpu nodes of node1 would be oblivious
to what PMEMD is doing.

I don't see the need of creating an associativity domain between node1
and node40 in 0x3. Besides, if a device_add operation of a PMEM that wants
to use nodeN as the node for persistent memory would trigger a massive
ibm,associativity update, on all LMBs that belongs to nodeN, because then
everyone needs to have the same third level associativity domain as the
hotplugged PMEM. To avoid that, if the idea is to 'just duplicate the
logical_domain_id in 0x3 for all non-PMEM devices' then what's the
difference of looking into the logical_numa_id at 0x4 in the first
place?



In fact, the more I speak about this PMEM scenario the more I wonder:
why doesn't the PMEM driver, when switching from persistent to regular
memory and vice-versa, take care of all the necessary updates in the
numa-distance-table and kernel internals to reflect the current distances
of its current mode? Is this a technical limitation?



Thanks


Daniel


> 
> -aneesh
> 
