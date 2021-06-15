Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A23A7378
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rmW0YYlz3byV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:47:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RK+EV8Qg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RK+EV8Qg; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rlz6N78z2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:47:10 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id r19so384168qvw.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oxP+s2iS98ER6mHisipKzQt/k7YDENuwuSSC6bgnPhs=;
 b=RK+EV8QguSi+RmSn5lJG++5eopr3fr0351qu6U1CcJ0iK1nW81UbhFvTT59sirWYEI
 gZGqKMr6ZTxTAEYoLAJue9iPn1Ye5yoVlQdOuzYgKkbLOGfCkyPcuL//xeQPHyucmddK
 zSAcKjXaqJdatOu3MQXkLS5QFHIC5/P7azj1/rieDTiJqdxIW2WE0NmbhrJsMfJMl5Bh
 XFn3LNZUnWmMSPnzsLFm0SrzMrbKR0ZfkINZwrnozs5vB+YeCszuX6bAP1B2SBDYNGuN
 0y1pRqlmKAq9lOjvs0+jQbprOS1l4cD04hkhcY3iwVGKNCaeXiJWP2XqPV1sXgqPTkjX
 IL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxP+s2iS98ER6mHisipKzQt/k7YDENuwuSSC6bgnPhs=;
 b=uhA7brgISg0aQ8txljUU8wjFNMmId1q6yPESTD25o/57cfTua7h3WDzVYLLFL5smob
 dmEvD4tRMWRs2FA83hLzVStnYB97iPoEx8gLAvJeji1joMr3XkWOuzLLrYwaPqnF/oT1
 EcO76JzQxzN6epuNtYGFWA05ii8bknvFoG8DvaQc4Gwv9kzzdZ/atZ3idsLrKZ5w1dAv
 K7WF/0gxx56fPh/6dfO6xMJtygY3A2NEDW71U1zLthL3g5EQjv3vKbdTEaKNZ5ZWPHii
 flK+y/caq5KcWSzISv+fiOcR7OsqClvjQB/U3wG4qofuojOwoGDec/9rnWVKx0SKkvjq
 MUow==
X-Gm-Message-State: AOAM532gqSz2Acla7yM8rn3aq9GniI7iwiBlVqa4Zi94W5aEKQLUJ/B8
 7/FgKS8OiWx4maK2cgo2MLo=
X-Google-Smtp-Source: ABdhPJxON7Mqr8CfjUrrMSK0CPHqrPhgJQOV1rpLR00/Y8QGwG/5jvAqGNaAwmXET+8LRwNeiaI5sA==
X-Received: by 2002:ad4:4426:: with SMTP id e6mr2380274qvt.46.1623721626794;
 Mon, 14 Jun 2021 18:47:06 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:4d9a:784f:a7de:c020:5f1e?
 ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f193sm11274687qke.43.2021.06.14.18.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 18:47:06 -0700 (PDT)
Subject: Re: [RFC PATCH 0/8] Add support for FORM2 associativity
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <7615533f-abc2-17f4-aaad-f8290e26d16e@gmail.com>
Date: Mon, 14 Jun 2021 22:47:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/21 1:39 PM, Aneesh Kumar K.V wrote:
> Form2 associativity adds a much more flexible NUMA topology layout
> than what is provided by Form1. This also allows PAPR SCM device
> to use better associativity when using the device as DAX KMEM
> device. More details can be found in patch x
> 
> $ ndctl list -N -v
> [
>    {
>      "dev":"namespace0.0",
>      "mode":"devdax",
>      "map":"dev",
>      "size":1071644672,
>      "uuid":"37dea198-ddb5-4e42-915a-99a915e24188",
>      "raw_uuid":"148deeaa-4a2f-41d1-8d74-fd9a942d26ba",
>      "daxregion":{
>        "id":0,
>        "size":1071644672,
>        "devices":[
>          {
>            "chardev":"dax0.0",
>            "size":1071644672,
>            "target_node":4,
>            "mode":"devdax"
>          }
>        ]
>      },
>      "align":2097152,
>      "numa_node":1
>    }
> ]
> 
> $ numactl -H
> ...
> node distances:
> node   0   1   2   3
>    0:  10  11  222  33
>    1:  44  10  55  66
>    2:  77  88  10  99
>    3:  101  121  132  10
> $
> 
> After DAX KMEM
> # numactl -H
> available: 5 nodes (0-4)
> ...
> node distances:
> node   0   1   2   3   4
>    0:  10  11  22  33  255
>    1:  44  10  55  66  255
>    2:  77  88  10  99  255
>    3:  101  121  132  10  255
>    4:  255  255  255  255  10
> #
> 
> The above output is with a Qemu command line


For reference, this QEMU:


https://github.com/danielhb/qemu/tree/form2_affinity_v1

https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03617.html


but ...

> 
> -numa node,nodeid=4 \
> -numa dist,src=0,dst=1,val=11 -numa dist,src=0,dst=2,val=22 -numa dist,src=0,dst=3,val=33 -numa dist,src=0,dst=4,val=255 \
> -numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=55 -numa dist,src=1,dst=3,val=66 -numa dist,src=1,dst=4,val=255 \
> -numa dist,src=2,dst=0,val=77 -numa dist,src=2,dst=1,val=88 -numa dist,src=2,dst=3,val=99 -numa dist,src=2,dst=4,val=255 \
> -numa dist,src=3,dst=0,val=101 -numa dist,src=3,dst=1,val=121 -numa dist,src=3,dst=2,val=132 -numa dist,src=3,dst=4,val=255 \
> -numa dist,src=4,dst=0,val=255 -numa dist,src=4,dst=1,val=255 -numa dist,src=4,dst=2,val=255 -numa dist,src=4,dst=3,val=255 \
> -object memory-backend-file,id=memnvdimm1,prealloc=yes,mem-path=$PMEM_DISK,share=yes,size=${PMEM_SIZE}  \
> -device nvdimm,label-size=128K,memdev=memnvdimm1,id=nvdimm1,slot=4,uuid=72511b67-0b3b-42fd-8d1d-5be3cae8bcaa,node=4,persistent-nodeid=1


with 'device-node=1' instead of 'persistent=nodeid=1' in the nvdimm parameter
up here.


> 
> 
> 
> Aneesh Kumar K.V (8):
>    powerpc/pseries: rename min_common_depth to primary_domain_index
>    powerpc/pseries: rename distance_ref_points_depth to max_domain_index
>    powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
>    powerpc/pseries: Consolidate DLPAR NUMA distance update
>    powerpc/pseries: Consolidate NUMA distance update during boot
>    powerpc/pseries: Add a helper for form1 cpu distance
>    powerpc/pseries: Add support for FORM2 associativity
>    powerpc/papr_scm: Use FORM2 associativity details


Series:


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>



> 
>   Documentation/powerpc/associativity.rst       | 139 ++++++
>   arch/powerpc/include/asm/firmware.h           |   7 +-
>   arch/powerpc/include/asm/prom.h               |   3 +-
>   arch/powerpc/kernel/prom_init.c               |   3 +-
>   arch/powerpc/mm/numa.c                        | 436 ++++++++++++++----
>   arch/powerpc/platforms/pseries/firmware.c     |   3 +-
>   arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>   .../platforms/pseries/hotplug-memory.c        |   2 +
>   arch/powerpc/platforms/pseries/papr_scm.c     |  26 +-
>   arch/powerpc/platforms/pseries/pseries.h      |   2 +
>   10 files changed, 522 insertions(+), 101 deletions(-)
>   create mode 100644 Documentation/powerpc/associativity.rst
> 
