Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A236092C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdfR1RM3z3byH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:18:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=X9VAHPzW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X9VAHPzW; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLddz6kG7z2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:17:58 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id o5so24924826qkb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=24mOKhAuhspo6DiV281KlluDZ/bNDPtc8ic5EA47Ykc=;
 b=X9VAHPzWBKhQKbHOR5LSE++LtdOVs0sbS7fvLbm5nH0gRbm8zvOv/sPc81S2rF7nc1
 qY9P5KFE60NY0I1HeCsIAF+yZOPzO5+eykcvdFGiCSfKRtbqcF+8VpbdWsUQkZ+ajLA/
 tGmqjmMXDE91sNdlO3LFlUbS6jWbhWeblDV5u/7bC6Hvn8xsK583rLEewsV4l/fy88e6
 YNVtFxexpSJdcU/2GpwpXPUhSGO6WBYcOiKp2Kvu3E3T7jmVz72fxHcvWALE621d/q98
 PIlS5mtaMRXWuN/2jwZbPKpHE2f1WwA4rYqgkt5Rj3+ID/u8UWHoQvzSzzJBmls0q3Du
 8CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=24mOKhAuhspo6DiV281KlluDZ/bNDPtc8ic5EA47Ykc=;
 b=rVJeWcQayN++dREQY7ufE4eaZs7w59PbgWMRDbK+F3BgZ++6R1g5TWXGbJyoAZ9l/Q
 jXGKS1cN0eLoJ4j+C3Z+R7Hr8De97KwDdYnaKyd2rjXVG38iofKmrPCfSoybmpeNZNCg
 /n8PdlQxJ/tC4fY0FekAhWF3zRp5Uy2huF1ksQk/jNxSluxNxWD0mZvhq2bbaUyF0ZMG
 OUSnAnYqMeFNybr50pIIYvKxvf5/Px4nD2Iae6KJt4RMgBOCHHxavBAjVDqlm9Nym44t
 UNFV5oy3htCK2ODWpNJZkqle4W3gfD4jLw7H0y8iFViODJGKQtrALR/bKyTxoujyAqud
 zU/Q==
X-Gm-Message-State: AOAM533UH8YYBETQsyWfaVEUazEbydCwMiTLnojNutEczppxLgV0emch
 dtbK+80UQfObKu5OWZ0J/huYVWcr38A=
X-Google-Smtp-Source: ABdhPJx7dmaUktjBhx90JKNa22BHsx3DyIMCWwvTUmEwxD/DktEoezqrStUOmjeA9a/SU6K6XbcNMA==
X-Received: by 2002:ae9:e64b:: with SMTP id x11mr3031928qkl.290.1618489072956; 
 Thu, 15 Apr 2021 05:17:52 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:92e9:c7f0:1492:45b3:f90e?
 ([2804:431:c7c7:92e9:c7f0:1492:45b3:f90e])
 by smtp.gmail.com with ESMTPSA id o189sm1795061qka.86.2021.04.15.05.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 05:17:52 -0700 (PDT)
Subject: Re: [PATCH 0/3] Reintroduce cpu_core_mask
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <86dabfd7-8d83-4a5e-04fc-3988b4325155@gmail.com>
Date: Thu, 15 Apr 2021 09:17:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,


Using a QEMU pseries guest with this follwing SMP topology, with a
single NUMA node:


(...) -smp 32,threads=4,cores=4,sockets=2, (...)

This is the output of lscpu with a guest running v5.12-rc5:

[root@localhost ~]# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              32
On-line CPU(s) list: 0-31
Thread(s) per core:  4
Core(s) per socket:  8
Socket(s):           1
NUMA node(s):        1
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-31
[root@localhost ~]#


The changes with cpu_core_mask made the topology sockets matching NUMA nodes.
In this case, given that we have a single NUMA node, the SMP topology got
adjusted to have 8 cores instead of 4 so we can have a single socket as well.

Although sockets equal to NUMA nodes is true for Power hardware, QEMU doesn't
have this constraint and users expect sockets and NUMA nodes to be kind of
independent, regardless of how unpractical that would be with real hardware.


The same guest running a kernel with this series applied:


[root@localhost ~]# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              32
On-line CPU(s) list: 0-31
Thread(s) per core:  4
Core(s) per socket:  4
Socket(s):           2
NUMA node(s):        1
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   KVM
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   0-31


The sockets and NUMA nodes are being represented separately, as intended via
the QEMU command line.


Thanks for the looking this up, Srikar. For all patches:


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>



On 4/15/21 9:09 AM, Srikar Dronamraju wrote:
> Daniel had reported that
>   QEMU is now unable to see requested topologies in a multi socket single
>   NUMA node configurations.
>   -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> 
> This patchset reintroduces cpu_core_mask so that users can see requested
> topologies while still maintaining the boot time of very large system
> configurations.
> 
> It includes caching the chip_id as suggested by Michael Ellermann
> 
> 4 Threads/Core; 4 cores/Socket; 4 Sockets/Node, 2 Nodes in System
>    -numa node,nodeid=0,memdev=m0 \
>    -numa node,nodeid=1,memdev=m1 \
>    -smp 128,sockets=8,threads=4,maxcpus=128  \
> 
> 5.12.0-rc5 (or any kernel with commit 4ca234a9cbd7)
> ---------------------------------------------------
> srikar@cloudy:~$ lscpu
> Architecture:                    ppc64le
> Byte Order:                      Little Endian
> CPU(s):                          128
> On-line CPU(s) list:             0-127
> Thread(s) per core:              4
> Core(s) per socket:              16
> Socket(s):                       2                 <<<<<-----
> NUMA node(s):                    2
> Model:                           2.3 (pvr 004e 1203)
> Model name:                      POWER9 (architected), altivec supported
> Hypervisor vendor:               KVM
> Virtualization type:             para
> L1d cache:                       1 MiB
> L1i cache:                       1 MiB
> NUMA node0 CPU(s):               0-15,32-47,64-79,96-111
> NUMA node1 CPU(s):               16-31,48-63,80-95,112-127
> --
> srikar@cloudy:~$ dmesg |grep smp
> [    0.010658] smp: Bringing up secondary CPUs ...
> [    0.424681] smp: Brought up 2 nodes, 128 CPUs
> --
> 
> 5.12.0-rc5 + 3 patches
> ----------------------
> srikar@cloudy:~$ lscpu
> Architecture:                    ppc64le
> Byte Order:                      Little Endian
> CPU(s):                          128
> On-line CPU(s) list:             0-127
> Thread(s) per core:              4
> Core(s) per socket:              4
> Socket(s):                       8    <<<<-----
> NUMA node(s):                    2
> Model:                           2.3 (pvr 004e 1203)
> Model name:                      POWER9 (architected), altivec supported
> Hypervisor vendor:               KVM
> Virtualization type:             para
> L1d cache:                       1 MiB
> L1i cache:                       1 MiB
> NUMA node0 CPU(s):               0-15,32-47,64-79,96-111
> NUMA node1 CPU(s):               16-31,48-63,80-95,112-127
> --
> srikar@cloudy:~$ dmesg |grep smp
> [    0.010372] smp: Bringing up secondary CPUs ...
> [    0.417892] smp: Brought up 2 nodes, 128 CPUs
> 
> 5.12.0-rc5
> ----------
> srikar@cloudy:~$  lscpu
> Architecture:                    ppc64le
> Byte Order:                      Little Endian
> CPU(s):                          1024
> On-line CPU(s) list:             0-1023
> Thread(s) per core:              8
> Core(s) per socket:              128
> Socket(s):                       1
> NUMA node(s):                    1
> Model:                           2.3 (pvr 004e 1203)
> Model name:                      POWER9 (architected), altivec supported
> Hypervisor vendor:               KVM
> Virtualization type:             para
> L1d cache:                       4 MiB
> L1i cache:                       4 MiB
> NUMA node0 CPU(s):               0-1023
> srikar@cloudy:~$ dmesg | grep smp
> [    0.027753 ] smp: Bringing up secondary CPUs ...
> [    2.315193 ] smp: Brought up 1 node, 1024 CPUs
> 
> 5.12.0-rc5 + 3 patches
> ----------------------
> srikar@cloudy:~$ dmesg | grep smp
> [    0.027659 ] smp: Bringing up secondary CPUs ...
> [    2.532739 ] smp: Brought up 1 node, 1024 CPUs
> 
> I also have booted and tested the kernels on PowerVM and PowerNV and
> even there I see a very negligible increase in the bringing up time of
> secondary CPUs
> 
> Srikar Dronamraju (3):
>    powerpc/smp: Reintroduce cpu_core_mask
>    Revert "powerpc/topology: Update topology_core_cpumask"
>    powerpc/smp: Cache CPU to chip lookup
> 
>   arch/powerpc/include/asm/smp.h      |  6 ++++
>   arch/powerpc/include/asm/topology.h |  2 +-
>   arch/powerpc/kernel/prom.c          | 19 +++++++---
>   arch/powerpc/kernel/smp.c           | 56 +++++++++++++++++++++++++----
>   4 files changed, 71 insertions(+), 12 deletions(-)
> 
