Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 498073C7225
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 16:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPNJk29xKz308L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 00:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PYxjaYLE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PYxjaYLE; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPNJC4xYLz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 00:27:22 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id p22so6827478pfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/p6gbRtJQiPaDb8OWjTGxPiPwhgdycpv155LfWpLBHM=;
 b=PYxjaYLE4pqcr693vf8bmu5r0SRjWUMc9z7lCgaUkbIUBDGU4vWSw8SBUzaP99Z41+
 awz7BjCJhG87u7tZEiQA+jf78CdgXoyXEMbggu6dHRer/kLHPaDWtM1jmicfTtDQ8ENU
 tAtalT1ilf5kQGNB6ealzKg9DAw5XQSW0mZCoHcc/8oIHE+GaK7r1UL7SRH1iqW6lKcj
 l4HwLCaZcvwMIbaEUQpBTMys8Z3iYuhdGOfQXMJMReAJEItt8Rwvz77rfuVdJE1XJf22
 /dVELFAIBG5IRPiWteuB4eobNPqWE/yI6Ia6hi1xxkZ6E92oQcZf1W4kOMa4YYPrQ2ir
 ZvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/p6gbRtJQiPaDb8OWjTGxPiPwhgdycpv155LfWpLBHM=;
 b=TFz/OY/exRHv/evJW+Kf/AENdc7+573bCOS2Y2PP46dANkxVgv7Ny8guK/1Rknuc46
 N0lGgEf+iW5kU6w9IWKvurhtdFT2iajRwRHoWmikOaF2wJauXzKEz9eummVqUHYerdQP
 d8SybkiJX16GJwz8JP5EIIiqVvBlI0tz6wM7m3cVUrFHXY6xn8cMO7dKsH0SE8kvqczO
 t0IJgaWHJEXuvRq/aADHZqoOImEDJn0QyrKkfcFqK3v2w+2hLAaX8gFbh6rK8+f7ZuRt
 Gc/qHMkRmOb/hS02of5ZNENCSd6oyhO+z+vmJr6yvaFlVa59d7kGXuru8wcFpXoN5RNL
 XlnQ==
X-Gm-Message-State: AOAM532MuFCWcdOYCbFP+/mF27+PgpYVBl1YGVgDvdcSGESAPMXfANBs
 07hFEcuznxPlwwjXeGXKj7c=
X-Google-Smtp-Source: ABdhPJzkvo280jdeuw7/yjaWODlR7Hp/iff8TiuZuIX+Ou7CnT87YjuRHBEmsrxG0ltrjHLg1hPEEw==
X-Received: by 2002:aa7:824a:0:b029:2ec:89ee:e798 with SMTP id
 e10-20020aa7824a0000b02902ec89eee798mr5045749pfn.12.1626186439787; 
 Tue, 13 Jul 2021 07:27:19 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9?
 ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id h17sm1297816pfh.192.2021.07.13.07.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 07:27:19 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] Add support for FORM2 associativity
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ad91ae4e-7c2d-26d6-1a6e-88f2c365fade@gmail.com>
Date: Tue, 13 Jul 2021 11:27:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
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

Aneesh,

This series compiles with a configuration made with "pseries_le_defconfig"
but fails with a config based on an existing RHEL8 config.

The reason, which is hinted in the robot replies in patch 4, is that you defined
a "__vphn_get_associativity" inside a #ifdef CONFIG_PPC_SPLPAR guard but didn't
define how the function would behave without the config, and you ended up
using the function elsewhere.

This fixes the compilation but I'm not sure if this is what you intended
for this function:


diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index c68846fc9550..6e8551d16b7a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -680,6 +680,11 @@ static int vphn_get_nid(long lcpu)
  
  }
  #else
+static int __vphn_get_associativity(long lcpu, __be32 *associativity)
+{
+       return -1;
+}
+
  static int vphn_get_nid(long unused)
  {
         return NUMA_NO_NODE;


I'll post a new version of the QEMU FORM2 changes using these patches as is (with
the above fixup), but I guess you'll want to post a v6.



Thanks,



Daniel




On 6/28/21 12:11 PM, Aneesh Kumar K.V wrote:
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
>    powerpc/pseries: rename distance_ref_points_depth to
>      max_associativity_domain_index
>    powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
>    powerpc/pseries: Consolidate different NUMA distance update code paths
>    powerpc/pseries: Add a helper for form1 cpu distance
>    powerpc/pseries: Add support for FORM2 associativity
> 
>   Documentation/powerpc/associativity.rst       | 103 +++++
>   arch/powerpc/include/asm/firmware.h           |   7 +-
>   arch/powerpc/include/asm/prom.h               |   3 +-
>   arch/powerpc/include/asm/topology.h           |   4 +-
>   arch/powerpc/kernel/prom_init.c               |   3 +-
>   arch/powerpc/mm/numa.c                        | 415 +++++++++++++-----
>   arch/powerpc/platforms/pseries/firmware.c     |   3 +-
>   arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>   .../platforms/pseries/hotplug-memory.c        |   2 +
>   arch/powerpc/platforms/pseries/lpar.c         |   4 +-
>   arch/powerpc/platforms/pseries/pseries.h      |   1 +
>   11 files changed, 432 insertions(+), 115 deletions(-)
>   create mode 100644 Documentation/powerpc/associativity.rst
> 
