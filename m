Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54233F4FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 17:06:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0w4Q45Fdz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 03:05:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vgq7aUNK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vgq7aUNK; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0w3z21nBz2ysl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 03:05:33 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id a11so1786873qto.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWor0K6NvN8TRa5S/3knLDVZcX8kk3PYvAx8WjvE24w=;
 b=vgq7aUNKhZBzlKgNoAZYqyU8d+pfv0TFSwFAwP1zvUyg6ARujKNPhE3bu7GH56yG+5
 8Uze8onzfYCSCLNGdvb3yINxVrvLzk7EAUQtiJ5P+Z7oL+TBnq+iwpQ5j0y95kz4q59B
 0t5HGcyoRA+Uo8S2NkQooP57B2j1qpn/m3CMrpXzg0UGoO5AStNTM2p+V6a0UX0racaH
 C47UeMm4ukod16eTXNSXO+FElCM5Z7NhZAzk/0OyPyE1GN0ouaMGN4mP2AVBy0tdP4ve
 /U8pZJ638V7OB4bMWLvYbwjWMJXL8bGaijeICVsROayazP3VNXboX0fW1gBALQxCwvvM
 3U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWor0K6NvN8TRa5S/3knLDVZcX8kk3PYvAx8WjvE24w=;
 b=kuoaeRUu2KhzJ48nue/0kQlhdjYYHda/BdlpSdVuCrU5lGOFQXCKSC1M72OFkhqYnS
 0ARDJFHTv56rSFCjoCQp+zvsY6++gGZAVXM+TDclgNce238pX4ObSIu8sgEo9UStI/CK
 PA902/Ml70TG+LV8KDkOSdw2QlEndYSbnVKxtJKKTLLEjTuzc+DItF5gHsLOhYj9XwlG
 qqqByMBmoJdBl3RFJgTbgLv7PPWxIYVTZFVgoQ9Oyl+L05GyRw2TtFGRqin/srwj9ga4
 TQw28+9LDzTVYiG83Nw/80FZKPK3pxU5GBXzh2GEozx5jcWxth2VGhTPj7dJrYObibwj
 bh5g==
X-Gm-Message-State: AOAM530s/6mMyV+NdBWSaER/NfaH5eIbAecnglTgl4Uio92EycsAC6nd
 dzxhQAWlDNpbmpgVlueBp2Y=
X-Google-Smtp-Source: ABdhPJw8XWnAqqNag6x1PEb4vJo+CGbo062Ih1wzajh3BqoGe2CzS9yrS3Zon5Wyqe5JFrQC8XsM1g==
X-Received: by 2002:ac8:5bcd:: with SMTP id b13mr4706553qtb.122.1615997125165; 
 Wed, 17 Mar 2021 09:05:25 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id l65sm17680940qkf.113.2021.03.17.09.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:05:24 -0700 (PDT)
Subject: Re: Advice needed on SMP regression after cpu_core_mask change
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
 <4569097d-ce89-5a13-33a9-2a4ca10be7bd@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <04bf6d12-a806-d417-3d95-b6d315c44b58@gmail.com>
Date: Wed, 17 Mar 2021 13:05:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4569097d-ce89-5a13-33a9-2a4ca10be7bd@kaod.org>
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
Cc: Greg Kurz <groug@kaod.org>, aneesh.kumar@in.ibm.com,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/21 12:30 PM, Cédric Le Goater wrote:
> On 3/17/21 2:00 PM, Daniel Henrique Barboza wrote:
>> Hello,
>>
>> Patch 4bce545903fa ("powerpc/topology: Update topology_core_cpumask") introduced
>> a regression in both upstream and RHEL downstream kernels [1]. The assumption made
>> in the commit:
>>
>> "Further analysis shows that cpu_core_mask and cpu_cpu_mask for any CPU would be
>> equal on Power"
>>
>> Doesn't seem to be true. After this commit, QEMU is now unable to set single NUMA
>> node SMP topologies such as:
>>
>> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
>>
>> lscpu will give the following output in this case:
>>
>> # lscpu
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  4
>> Socket(s):           1
>> NUMA node(s):        1
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-7
>>
>>
>> This is happening because the macro cpu_cpu_mask(cpu) expands to
>> cpumask_of_node(cpu_to_node(cpu)), which in turn expands to node_to_cpumask_map[node].
>> node_to_cpumask_map is a NUMA array that maps CPUs to NUMA nodes (Aneesh is on CC to
>> correct me if I'm wrong). We're now associating sockets to NUMA nodes directly.
>>
>> If I add a second NUMA node then I can get the intended smp topology:
>>
>> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
>> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
>> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
>>
>> # lscpu
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  2
>> Socket(s):           2
>> NUMA node(s):        2
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-3
>> NUMA node1 CPU(s):   4-7
>>
>>
>> However, if I try a single socket with multiple NUMA nodes topology, which is the case
>> of Power10, e.g.:
>>
>>
>> -smp 8,maxcpus=8,cores=4,threads=2,sockets=1
>> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
>> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
>>
>>
>> This is the result:
>>
>> # lscpu
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  2
>> Socket(s):           2
>> NUMA node(s):        2
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-3
>> NUMA node1 CPU(s):   4-7
>>
>>
>> This confirms my suspicions that, at this moment, we're making sockets == NUMA nodes.
> 
> Yes. I don't think we can do better on PAPR and the above examples
> seem to confirm that the "sockets" definition is simply ignored.
>   
>> Cedric, the reason I'm CCing you is because this is related to ibm,chip-id. The commit
>> after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc/smp: Stop updating
>> cpu_core_mask"), is erasing the code that calculated cpu_core_mask. cpu_core_mask, despite
>> its shortcomings that caused its removal, was giving a precise SMP topology. And it was
>> using physical_package_id/'ibm,chip-id' for that.
> 
> ibm,chip-id is a no-no on pSeries. I guess this is inherent to PAPR which
> is hiding a lot of the underlying HW and topology. May be we are trying
> to reconcile two orthogonal views of machine virtualization ...
> 
>> Checking in QEMU I can say that the ibm,chip-id calculation is the only place in the code
>> that cares about cores per socket information. The kernel is now ignoring that, starting
>> on 4bce545903fa, and now QEMU is unable to provide this info to the guest.
>>
>> If we're not going to use ibm,chip-id any longer, which seems sensible given that PAPR does
>> not declare it, we need another way of letting the guest know how much cores per socket
>> we want.
> The RTAS call "ibm,get-system-parameter" with token "Processor Module
> Information" returns that kind of information :
> 
>    2 byte binary number (N) of module types followed by N module specifiers of the form:
>    2 byte binary number (M) of sockets of this module type
>    2 byte binary number (L) of chips per this module type
>    2 byte binary number (K) of cores per chip in this module type.
> 
> See the values in these sysfs files :
> 
>    cat /sys/devices/hv_24x7/interface/{sockets,chipspersocket,coresperchip}
> 
> But I am afraid these are host level information and not guest/LPAR.


I believe there might be some sort of reasoning behind not having this on
PAPR, but I'll say in advance that the virtual machine should act as the
real hardware, as close as possible. This is the kind of hcall that could
be used in this situation.


> 
> I didn't find any LPAR level properties or hcalls in the PAPR document.
> They need to be specified.
> 
> or
> 
> We can add extra properties like ibm,chip-id but making sure it's only
> used under the KVM hypervisor. My understanding is that's something we
> are trying to avoid.

We can change PAPR to add ibm,chip-id. Problem is that ibm,chip-id today, with
the current kernel codebase, does not fix the issue because the code is
ignoring it hehehe


If we're going to change PAPR -  and I believe we should, there's a clear
lack of proper support for SMP topologies - we're better make sure that whatever
attribute/hcall we add there fixes it in a robust way for the long term.


Thanks,


DHB


> 
> C.
> 
