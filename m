Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F87340900
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 16:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1WN63C39z3bs3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 02:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Mj97gRk3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mj97gRk3; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1WMg6m3Zz2yRF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 02:36:14 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id g24so4365219qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lr8cI5dZ9wxBPmoEi+qKRAALwFaD7oAecPyF7Og9HLM=;
 b=Mj97gRk3FfvRwhBJAVQnWR6RBHS0RqKrba7YtSg1AW0YyAw7/Nn3fxIqwh44t1NWla
 xblZETrYleLfxjwWmydjkvGhxRg2GbOEYN+WvU2NhIoXNGn1hqHlrPZucZEYjWuRfjBR
 YABk4OojNvWajgv/9J7OfHq+FbZ1kAAwRRD3z9kxysp053JkRfTA3dPkPqlyXI9c/kWl
 u1Jn6bIQKHHR86lyhHp4HJiVY++bdHDO4nWObGAA/DmGUO9d/NKZFlbAwl9EWrcUkKCt
 FSFSYiEIpeA643zmfWIqveZy/QyvOcCW8O86TGvKYnoKgnTXA62qNPPn4KM5QRdjs+Q+
 sSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lr8cI5dZ9wxBPmoEi+qKRAALwFaD7oAecPyF7Og9HLM=;
 b=jJ2A95Zb4WA2pAY0XfppNZeyky5FSp5cjVJxScokID4TDVxo4esrDJoEk00lb8Il0B
 xyebJB9En+VtVrKE7Jujee+ugpBOB12wvcXdvBnduZQSZOHhUchs2y6EtS5NwVDpZUVd
 FqcV2ou/Jlv0EpqX/yuDoxMNbg7Y7npc9dZa4+aejzWuap0NcgLQW7zbSYSiWuq2bvBF
 /v8RxzjlrqtXty17DMcntRC43YBdMCiRhIYS8LBqUCuUHufyffZ+WB9vKOawjEa3CX0h
 A8jD6iZdyE72XFp2tgBE8PbJYO0d7XNZpyaMM0tMJbUdatZFRlZzBfZTSSnLzMXXrYHE
 CKqw==
X-Gm-Message-State: AOAM530kZBIa+N986Eb5zFXZkKYDu9haCpmCMCDgLz/eXH0e9pTjVof/
 Lnuf1MjOaz2wq17CoFtyc6w=
X-Google-Smtp-Source: ABdhPJygolzwNbkU1YTg7F1DOYvEKgYz4HIh7GwkOTrNQmMzqo1Hrl3/JflTi+45FXP52ev5qLttUg==
X-Received: by 2002:ac8:4d59:: with SMTP id x25mr4333309qtv.82.1616081769713; 
 Thu, 18 Mar 2021 08:36:09 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id k8sm1653190qth.74.2021.03.18.08.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:36:09 -0700 (PDT)
Subject: Re: Advice needed on SMP regression after cpu_core_mask change
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
 <20210318134236.GC2339179@linux.vnet.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <94441f01-2d12-b4a4-93eb-9f496cc6e051@gmail.com>
Date: Thu, 18 Mar 2021 12:36:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318134236.GC2339179@linux.vnet.ibm.com>
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
Cc: aneesh.kumar@in.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/18/21 10:42 AM, Srikar Dronamraju wrote:
> * Daniel Henrique Barboza <danielhb413@gmail.com> [2021-03-17 10:00:34]:
> 
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
> 
> What does it mean for a NUMA to have more than one sockets?
> If they are all part of the same node, there are at local distance to each
> other. cache is per core. So what resources are shared by the Sockets that
> are part of the same NUMA. And how does Userspace/ application make use of
> the same.

Honestly, I sympathize with the idea that multiple sockets in the same NUMA
node being "weird". QEMU is accepting this kind of topology since forever
because we didn't pay attention to these other details.

I don't see any problems adding more constraints that makes sense in the
virtual layer, as long as the constraints make sense and are documented.
Putting multiple sockets in a single NUMA node seems like a fair restriction.


> 
> Please don't mistake this as attempt to downplay your report but a honest
> attempt to better understand the situation.

It's cool. Ask away.

> 
> For example, if the socket denotes the hemisphere logic in P10, then can we
> see if the coregroup feature can be used. "Coregroup" is suppose to mean a
> set of cores within a NUMA that have some characteristics and there can be
> multiple coregroups within a NUMA. We add that mostly to mimic hemisphere in
> P10. However the number of coregroups in a NUMA is not exported to userspace
> at this time.

I see. I thought that the presence of the hemispheres inside the chip would
justify more than one NUMA node inside the chip, meaning that a chip/socket
would have more than one NUMA nodes inside of it.

If that's not the case then I guess socket == NUMA node is still valid in
P10 as well. The last 'lscpu' example I gave here, claiming that this would
be a Power10 scenario, doesn't represent P10 after all.

> 
> However if each Socket is associated with a memory and node distance, then
> should they be NUMA?
> 
> Can you provide me with the unique ibm,chip-ids in your 2 NUMA, 4 node case?
> Does this cause an performance issues with the guest/application?

I can fetch some values, but we're trying to move out of it since it's not on the
pseries spec (PAPR). Perhaps with these restrictions we can live without
ibm,chip-id in QEMU.

> 
> Till your report, I was under the impression that NUMAs == Sockets.

After reading and discussing about it, I think the sensible thing to do is to
put this same constraint in QEMU.

In theory it would be nice to let the virtual machine to have whatever topology it
wants, multiple sockets in the same NUMA domain and so on, but in the end we're
emulating Power hardware. If Power hardware - and the powerpc kernel - operates
under these assumptions, then I don't see much point into allowing users to
set unrealistic virtual CPU topologies that will be misrepresented in the
kernel.


I'll try this restriction in QEMU and see how upstream kernel behaves, with
and without ibm,chip-id being advertised in the DT.


Thanks,


DHB

> 
>>
>> lscpu will give the following output in this case:
>>
>> # lscpu
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  4
>> Socket(s):           1
>> NUMA node(s):        1
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-7
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
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  2
>> Socket(s):           2
>> NUMA node(s):        2
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-3
>> NUMA node1 CPU(s):   4-7
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
>> Architecture:        ppc64le
>> Byte Order:          Little Endian
>> CPU(s):              8
>> On-line CPU(s) list: 0-7
>> Thread(s) per core:  2
>> Core(s) per socket:  2
>> Socket(s):           2
>> NUMA node(s):        2
>> Model:               2.2 (pvr 004e 1202)
>> Model name:          POWER9 (architected), altivec supported
>> Hypervisor vendor:   KVM
>> Virtualization type: para
>> L1d cache:           32K
>> L1i cache:           32K
>> NUMA node0 CPU(s):   0-3
>> NUMA node1 CPU(s):   4-7
>>
>>
>> This confirms my suspicions that, at this moment, we're making sockets == NUMA nodes.
>>
>>
>> Cedric, the reason I'm CCing you is because this is related to ibm,chip-id. The commit
>> after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc/smp: Stop updating
>> cpu_core_mask"), is erasing the code that calculated cpu_core_mask. cpu_core_mask, despite
>> its shortcomings that caused its removal, was giving a precise SMP topology. And it was
>> using physical_package_id/'ibm,chip-id' for that.
>>
>> Checking in QEMU I can say that the ibm,chip-id calculation is the only place in the code
>> that cares about cores per socket information. The kernel is now ignoring that, starting
>> on 4bce545903fa, and now QEMU is unable to provide this info to the guest.
>>
>> If we're not going to use ibm,chip-id any longer, which seems sensible given that PAPR does
>> not declare it, we need another way of letting the guest know how much cores per socket
>> we want.
>>
>>
>>
>> [1] https://bugzilla.redhat.com/1934421
>>
>>
>>
>> Thanks,
>>
>>
>> DHB
> 
