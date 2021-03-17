Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4833F0CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 14:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0qz95qVMz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 00:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hV3yiNVc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hV3yiNVc; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0qyf4Qj4z301j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 00:00:41 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id g8so1309340qvx.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=e21U2UYt0oYJzEyPL9wmAS75LblZJPLoOzhTd8C2vJ8=;
 b=hV3yiNVc2/LBh+NSV4K+nod5CSpOwpXnZUXsJ7Zt5I4HQ5pyLa9v/Pq9O3k920S0Ai
 4vJJuMAzu+uDLm/AtTDvCtphxalilk24Hn+wZCWJgff3IFKDFuMGVFii2MokhK0xGPB4
 FDVv52O47IxkQUwud0kLBVaEszg+daZbGETO5hsPHpEfgfliOQgmMkckrdBhtqLiZz/r
 ga0i2wXVnaFRoneAyeU3zcE1TUkLRUlIic6JPBe+B2qvnUbuA5Ih0Sgs3+eHryfirMo4
 VeVSnU5/jrFBahNx5fMOVOuWURdwN9KRNxHreqZmKNu/CpEpeJPBvEgo8YaKw8Td5jXl
 fGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=e21U2UYt0oYJzEyPL9wmAS75LblZJPLoOzhTd8C2vJ8=;
 b=KEB1HLFWHfzAjOIrSkDT840P60FZDDqzYT1+pEXphZbIR4/tL9gT7/ogsUYDQNY1Nb
 UNTiCfQvrhcNERxy0RfVb64x5/sDe5odM64YC0qu6rgtuflgTn1+vTzd/4jcj1Fj8VGa
 AQCXODRzdXhOnhuQ3n4JqRU2J0fquSqxHnHqmAngMWAMvFuB7N1peh2UweMHq2uxNkNL
 UuPu0OI0mALjdPoVz5DWzxtdLDSxVhR1PUZB2jeIoiJc85FfugacubYZ4qNdmMlpzzmr
 L1v0KZTcs1+bRje+CNArfRNixPhjnpiULA2NUwfUJy218Hwinds2yUzXCzUZYveHaoBx
 H2Gg==
X-Gm-Message-State: AOAM530oy5cN9PeuAHrQ0FDN7FSwz2J17I7N4/+D04lk4cAM5alrGjvf
 myyT4cytd3xhNWI9OvM4x+o=
X-Google-Smtp-Source: ABdhPJxnQDDHSCyVblemoMADGl770mBx7rzBklyS8CcZfoyPkynSCCwzH2f5LLwPPDVzNZPRRd790g==
X-Received: by 2002:ad4:5887:: with SMTP id dz7mr5340642qvb.12.1615986037883; 
 Wed, 17 Mar 2021 06:00:37 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id x36sm15717449qte.1.2021.03.17.06.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:00:37 -0700 (PDT)
To: linuxppc-dev@lists.ozlabs.org
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Advice needed on SMP regression after cpu_core_mask change
Message-ID: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
Date: Wed, 17 Mar 2021 10:00:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
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
Cc: aneesh.kumar@in.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Patch 4bce545903fa ("powerpc/topology: Update topology_core_cpumask") introduced
a regression in both upstream and RHEL downstream kernels [1]. The assumption made
in the commit:

"Further analysis shows that cpu_core_mask and cpu_cpu_mask for any CPU would be
equal on Power"

Doesn't seem to be true. After this commit, QEMU is now unable to set single NUMA
node SMP topologies such as:

-smp 8,maxcpus=8,cores=2,threads=2,sockets=2

lscpu will give the following output in this case:

# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  2
Core(s) per socket:  4
Socket(s):           1
NUMA node(s):        1
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-7


This is happening because the macro cpu_cpu_mask(cpu) expands to
cpumask_of_node(cpu_to_node(cpu)), which in turn expands to node_to_cpumask_map[node].
node_to_cpumask_map is a NUMA array that maps CPUs to NUMA nodes (Aneesh is on CC to
correct me if I'm wrong). We're now associating sockets to NUMA nodes directly.

If I add a second NUMA node then I can get the intended smp topology:

-smp 8,maxcpus=8,cores=2,threads=2,sockets=2
-numa node,memdev=mem0,cpus=0-3,nodeid=0 \
-numa node,memdev=mem1,cpus=4-7,nodeid=1 \

# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           2
NUMA node(s):        2
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-3
NUMA node1 CPU(s):   4-7


However, if I try a single socket with multiple NUMA nodes topology, which is the case
of Power10, e.g.:


-smp 8,maxcpus=8,cores=4,threads=2,sockets=1
-numa node,memdev=mem0,cpus=0-3,nodeid=0 \
-numa node,memdev=mem1,cpus=4-7,nodeid=1 \


This is the result:

# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           2
NUMA node(s):        2
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-3
NUMA node1 CPU(s):   4-7


This confirms my suspicions that, at this moment, we're making sockets == NUMA nodes.


Cedric, the reason I'm CCing you is because this is related to ibm,chip-id. The commit
after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc/smp: Stop updating
cpu_core_mask"), is erasing the code that calculated cpu_core_mask. cpu_core_mask, despite
its shortcomings that caused its removal, was giving a precise SMP topology. And it was
using physical_package_id/'ibm,chip-id' for that.

Checking in QEMU I can say that the ibm,chip-id calculation is the only place in the code
that cares about cores per socket information. The kernel is now ignoring that, starting
on 4bce545903fa, and now QEMU is unable to provide this info to the guest.

If we're not going to use ibm,chip-id any longer, which seems sensible given that PAPR does
not declare it, we need another way of letting the guest know how much cores per socket
we want.



[1] https://bugzilla.redhat.com/1934421



Thanks,


DHB
