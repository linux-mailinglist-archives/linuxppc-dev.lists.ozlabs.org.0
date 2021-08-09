Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2713E4E30
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 22:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gk7gT2bHtz3bXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 06:57:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FnE/mwoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FnE/mwoX; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gk7fp49mhz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 06:56:32 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so899928pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Aug 2021 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aHkEfDAWCJ52ci6CWzgHFotFEpQgyQ+sf+J3/pgjMWo=;
 b=FnE/mwoXtb/DMoLH6pkJpeH+iUokfECSyCZxpAPBoAtZ08oUDzmJ9EkAmCQ8cL+Q6W
 17bfrsbKeLiOXV9Y7YUwvrKM8LmlRrY9XgTjwCgULlDkIK3bLZJCLcJbuhlWWf9nIyYO
 m+08IYHqobyAGKLdO4mcgH45KuvkEE/3FL9D6Qvk9EFpyUOlVSZaSRQXNpps9rmemqgH
 xI32Q0SeE6DcfIA49U0pZ3kU9+eHKhVvuZTMSyG4sCJwIwFzFEU00BdsQUsBAVRZXFPm
 4JbKuwpqQRY5XMgVnEhKWBBvSEXKcZr4jt4gOD+mBfjaaMxQGvscNW9/L/bFB4RPjTlY
 K4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aHkEfDAWCJ52ci6CWzgHFotFEpQgyQ+sf+J3/pgjMWo=;
 b=NMv/c13FUuoeKNHjya+UZV8JlHKQe6BP7e+EwlTe+2jkmOERfPqCXmquo1JL2art0O
 xF6LfBHrWw5ew2k9GqXG66q8FSLuUphrwFFFFspmuFiI/vfiHQftrqU9eyXMjgp1dyFG
 3UazaBlNoGzE523YGikrn3Du7BSnpHFRqUA01vBvY8GlxXGSt88IAXD5n7ieaKnIec25
 XIiJwkMcLJHxCDAZAEJxzjR6dhPogqlv5UIo5Op6uhlV3sXNiavznJmk50S4zpAbcgpE
 7uu6ePQeqBhhFkb6Qr0smjLhnZqYMQqqyT17bYy+FdO74gzFCn+Vziv0TwGQ4wWSZCoh
 3FeQ==
X-Gm-Message-State: AOAM533i1+M1iTDje2gfjBnS8nuVf28QLv53a8boCWKdW0ouW/6XzXaz
 aeF3MVP+1+pxio1F5up1ft8=
X-Google-Smtp-Source: ABdhPJyuh3J7fUBjz7DiAIBd5Rm5t88uDl92NjUk3Hbnwa4NJ/OkA3mOHW8P9BGWvGlKbMs4cqGPiA==
X-Received: by 2002:a05:6a00:888:b029:3c3:ff1:38e with SMTP id
 q8-20020a056a000888b02903c30ff1038emr19786128pfj.17.1628542588878; 
 Mon, 09 Aug 2021 13:56:28 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id e35sm405510pjk.28.2021.08.09.13.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 13:56:28 -0700 (PDT)
Subject: Re: [PATCH v7 0/6] Add support for FORM2 associativity
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <3eb3146c-dc38-1de8-262f-ed4326ffcfe0@gmail.com>
Date: Mon, 9 Aug 2021 17:56:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
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



On 8/9/21 2:24 AM, Aneesh Kumar K.V wrote:
> Form2 associativity adds a much more flexible NUMA topology layout
> than what is provided by Form1. More details can be found in patch 7.
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
> After DAX kmem memory add
> # numactl -H
> available: 5 nodes (0-4)
> ...
> node distances:
> node   0   1   2   3   4
>    0:  10  11  222  33  240
>    1:  44  10  55  66  255
>    2:  77  88  10  99  255
>    3:  101  121  132  10  230
>    4:  255  255  255  230  10
> 
> 
> PAPR SCM now use the numa distance details to find the numa_node and target_node
> for the device.
> 
> kvaneesh@ubuntu-guest:~$ ndctl  list -N -v
> [
>    {
>      "dev":"namespace0.0",
>      "mode":"devdax",
>      "map":"dev",
>      "size":1071644672,
>      "uuid":"d333d867-3f57-44c8-b386-d4d3abdc2bf2",
>      "raw_uuid":"915361ad-fe6a-42dd-848f-d6dc9f5af362",
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
>      "numa_node":3
>    }
> ]
> kvaneesh@ubuntu-guest:~$
> 
> 
> The above output is with a Qemu command line
> 
> -numa node,nodeid=4 \
> -numa dist,src=0,dst=1,val=11 -numa dist,src=0,dst=2,val=222 -numa dist,src=0,dst=3,val=33 -numa dist,src=0,dst=4,val=240 \
> -numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=55 -numa dist,src=1,dst=3,val=66 -numa dist,src=1,dst=4,val=255 \
> -numa dist,src=2,dst=0,val=77 -numa dist,src=2,dst=1,val=88 -numa dist,src=2,dst=3,val=99 -numa dist,src=2,dst=4,val=255 \
> -numa dist,src=3,dst=0,val=101 -numa dist,src=3,dst=1,val=121 -numa dist,src=3,dst=2,val=132 -numa dist,src=3,dst=4,val=230 \
> -numa dist,src=4,dst=0,val=255 -numa dist,src=4,dst=1,val=255 -numa dist,src=4,dst=2,val=255 -numa dist,src=4,dst=3,val=230 \
> -object memory-backend-file,id=memnvdimm1,prealloc=yes,mem-path=$PMEM_DISK,share=yes,size=${PMEM_SIZE}  \
> -device nvdimm,label-size=128K,memdev=memnvdimm1,id=nvdimm1,slot=4,uuid=72511b67-0b3b-42fd-8d1d-5be3cae8bcaa,node=4
> 
> Qemu changes can be found at https://lore.kernel.org/qemu-devel/20210616011944.2996399-1-danielhb413@gmail.com/


Series tested with the forementioned QEMU build. All patches:


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> Changes from v6:
> * Address review feedback
> 
> Changes from v5:
> * Fix build error reported by kernel test robot
> * Address review feedback
> 
> Changes from v4:
> * Drop DLPAR related device tree property for now because both Qemu nor PowerVM
>    will provide the distance details of all possible NUMA nodes during boot.
> * Rework numa distance code based on review feedback.
> 
> Changes from v3:
> * Drop PAPR SCM specific changes and depend completely on NUMA distance information.
> 
> Changes from v2:
> * Add nvdimm list to Cc:
> * update PATCH 8 commit message.
> 
> Changes from v1:
> * Update FORM2 documentation.
> * rename max_domain_index to max_associativity_domain_index
> 
> 
> Aneesh Kumar K.V (6):
>    powerpc/pseries: rename min_common_depth to primary_domain_index
>    powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
>    powerpc/pseries: Consolidate different NUMA distance update code paths
>    powerpc/pseries: Add a helper for form1 cpu distance
>    powerpc/pseries: Add support for FORM2 associativity
>    powerpc/pseries: Consolidate form1 distance initialization into a
>      helper
> 
>   Documentation/powerpc/associativity.rst       | 103 +++++
>   arch/powerpc/include/asm/firmware.h           |   7 +-
>   arch/powerpc/include/asm/prom.h               |   3 +-
>   arch/powerpc/include/asm/topology.h           |   6 +-
>   arch/powerpc/kernel/prom_init.c               |   3 +-
>   arch/powerpc/mm/numa.c                        | 433 ++++++++++++++----
>   arch/powerpc/platforms/pseries/firmware.c     |   3 +-
>   arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>   .../platforms/pseries/hotplug-memory.c        |   2 +
>   arch/powerpc/platforms/pseries/lpar.c         |   4 +-
>   10 files changed, 455 insertions(+), 111 deletions(-)
>   create mode 100644 Documentation/powerpc/associativity.rst
> 
