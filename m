Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8EB371E94
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:28:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYqhD4rg7z30D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gIfotyQz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gIfotyQz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYqgl2l4Gz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 03:28:18 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143H3o4U089217; Mon, 3 May 2021 13:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=b0NehVtQhaH+DukhYFmAYJ8D3o74eNVNRpeALUeOjr8=;
 b=gIfotyQzmX7tN+ha2FIoaKJg0INT8BxvbLb6LZf1QNkktBm5et/9+9+VnbMEMzEZ5QlW
 u3dQAsMsJrsc6ha9mANHAhTwVDAUG4xjmLaoeP+pGewl4/T1BgxwaNv9FRIeXGrmra6T
 g266Jresu+9MO7027MHsRDUdoV1RVb/nAVCIlK198/iyVnRHo86Kd75b4iAwDAtgthcl
 x25XCYrZL7nXKGe0uqyA5pN+8VQxKTlpSNYyMHbSiQ/O2dlXRHm/B8zRwC66bRxuSKp3
 exhmAZZrqLD1l7RRMqYsdv6rmYIEaGaXGOFtomZ521qJqzIg/aQdKKuv7CSEUU2IID/F ZA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38an8crj59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 13:28:10 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143HOjTr000799;
 Mon, 3 May 2021 17:28:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 388xm88ers-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 17:28:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143HS5qp25297212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 17:28:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D03FA4054;
 Mon,  3 May 2021 17:28:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 562FEA405C;
 Mon,  3 May 2021 17:28:05 +0000 (GMT)
Received: from pomme.local (unknown [9.145.31.88])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 May 2021 17:28:05 +0000 (GMT)
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
 <87fsz95qso.fsf@linux.ibm.com>
 <9d29bf8c-9e97-c179-6897-8e25fa4eb516@linux.ibm.com>
 <271ef351-b89c-ba68-3b6d-baa24cc0021b@linux.ibm.com>
 <c87e17d3-8956-9eb0-6f8a-ae316ea75f7e@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <1eac9540-e8b4-53be-1f27-4c36f92c8a5e@linux.ibm.com>
Date: Mon, 3 May 2021 19:28:05 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c87e17d3-8956-9eb0-6f8a-ae316ea75f7e@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5-z6P4QuPuXF_u3ST_vw6FFemp0Nl2NQ
X-Proofpoint-GUID: 5-z6P4QuPuXF_u3ST_vw6FFemp0Nl2NQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030111
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/05/2021 à 01:58, Tyrel Datwyler a écrit :
> On 4/30/21 9:13 AM, Laurent Dufour wrote:
>> Le 29/04/2021 à 21:12, Tyrel Datwyler a écrit :
>>> On 4/29/21 3:27 AM, Aneesh Kumar K.V wrote:
>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>
>>>>> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
>>>>> updated by the hypervisor in the case the NUMA topology of the LPAR's
>>>>> memory is updated.
>>>>>
>>>>> This is caught by the kernel, but the memory's node is updated because
>>>>> there is no way to move a memory block between nodes.
>>>>>
>>>>> If later a memory block is added or removed, drmem_update_dt() is called
>>>>> and it is overwriting the DT node to match the added or removed LMB. But
>>>>> the LMB's associativity node has not been updated after the DT node update
>>>>> and thus the node is overwritten by the Linux's topology instead of the
>>>>> hypervisor one.
>>>>>
>>>>> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
>>>>> updated to force an update of the LMB's associativity.
>>>>>
>>>>> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
>>>>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>>>>> ---
>>>>>
>>>>> V3:
>>>>>    - Check rd->dn->name instead of rd->dn->full_name
>>>>> V2:
>>>>>    - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>>>>>    introducing a new hook mechanism.
>>>>> ---
>>>>>    arch/powerpc/include/asm/drmem.h              |  1 +
>>>>>    arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
>>>>>    .../platforms/pseries/hotplug-memory.c        |  4 +++
>>>>>    3 files changed, 40 insertions(+)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/drmem.h
>>>>> b/arch/powerpc/include/asm/drmem.h
>>>>> index bf2402fed3e0..4265d5e95c2c 100644
>>>>> --- a/arch/powerpc/include/asm/drmem.h
>>>>> +++ b/arch/powerpc/include/asm/drmem.h
>>>>> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>>>>>    int __init
>>>>>    walk_drmem_lmbs_early(unsigned long node, void *data,
>>>>>                  int (*func)(struct drmem_lmb *, const __be32 **, void *));
>>>>> +void drmem_update_lmbs(struct property *prop);
>>>>>    #endif
>>>>>      static inline void invalidate_lmb_associativity_index(struct drmem_lmb
>>>>> *lmb)
>>>>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>>>>> index 9af3832c9d8d..f0a6633132af 100644
>>>>> --- a/arch/powerpc/mm/drmem.c
>>>>> +++ b/arch/powerpc/mm/drmem.c
>>>>> @@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node,
>>>>> void *data,
>>>>>        return ret;
>>>>>    }
>>>>>    +/*
>>>>> + * Update the LMB associativity index.
>>>>> + */
>>>>> +static int update_lmb(struct drmem_lmb *updated_lmb,
>>>>> +              __maybe_unused const __be32 **usm,
>>>>> +              __maybe_unused void *data)
>>>>> +{
>>>>> +    struct drmem_lmb *lmb;
>>>>> +
>>>>> +    /*
>>>>> +     * Brut force there may be better way to fetch the LMB
>>>>> +     */
>>>>> +    for_each_drmem_lmb(lmb) {
>>>>> +        if (lmb->drc_index != updated_lmb->drc_index)
>>>>> +            continue;
>>>>> +
>>>>> +        lmb->aa_index = updated_lmb->aa_index;
>>>>> +        break;
>>>>> +    }
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Update the LMB associativity index.
>>>>> + *
>>>>> + * This needs to be called when the hypervisor is updating the
>>>>> + * dynamic-reconfiguration-memory node property.
>>>>> + */
>>>>> +void drmem_update_lmbs(struct property *prop)
>>>>> +{
>>>>> +    if (!strcmp(prop->name, "ibm,dynamic-memory"))
>>>>> +        __walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
>>>>> +    else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
>>>>> +        __walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
>>>>> +}
>>>>>    #endif
>>>>>      static int init_drmem_lmb_size(struct device_node *dn)
>>>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>>> b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>>> index 8377f1f7c78e..672ffbee2e78 100644
>>>>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>>> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct
>>>>> notifier_block *nb,
>>>>>        case OF_RECONFIG_DETACH_NODE:
>>>>>            err = pseries_remove_mem_node(rd->dn);
>>>>>            break;
>>>>> +    case OF_RECONFIG_UPDATE_PROPERTY:
>>>>> +        if (!strcmp(rd->dn->name,
>>>>> +                "ibm,dynamic-reconfiguration-memory"))
>>>>> +            drmem_update_lmbs(rd->prop);
>>>>>        }
>>>>>        return notifier_from_errno(err);
>>>>
>>>> How will this interact with DLPAR memory? When we dlpar memory,
>>>> ibm,configure-connector is used to fetch the new associativity details
>>>> and set drmem_lmb->aa_index correctly there. Once that is done kernel
>>>> then call drmem_update_dt() which will result in the above notifier
>>>> callback?
>>>>
>>>> IIUC, the call back then will update drmem_lmb->aa_index again?
>>>
>>> After digging through some of this code I'm a bit concerned about all the kernel
>>> device tree manipulation around memory DLPAR both with the assoc-lookup-array
>>> prop update and post dynamic-memory prop updating. We build a drmem_info array
>>> of the LMBs from the device-tree at boot. I don't really understand why we are
>>> manipulating the device tree property every time we add/remove an LMB. Not sure
>>> the reasoning was to write back in particular the aa_index and flags for each
>>> LMB into the device tree when we already have them in the drmem_info array. On
>>> the other hand the assoc-lookup-array I suppose would need to have an in kernel
>>> representation to avoid updating the device tree property every time.
>>
>> I think the reason is to keep the device tree in sync with the current set of LMBs.
> 
> I don't really think that is how the device tree is meant to be used. We have an
> in memory representation of the LMBs separate from the device tree, and that is
> were we should track OS specific state. The values in the device-tree property
> can be updated via device node remove/add or update-properties RTAS call. These
> are the means that the platform reports (OS discovers) underlying changes. The
> new property is going to blow away any previous state that the OS wrote there.
> This is likely, one of the culprits of memory DLPAR problems that have been
> observed after LPM.

One of the issue is that the kernel is overwritting the drmem property set by 
the hypervisor once a LMB is added or removed after a LPM (PRRN). My patch 
prevents this to happen after a LPM, I plan to check and fix PRRN later.

>>
>> My understanding is that the kernel is not really using the
>> 'ibm,dynamic-memory*' DT property once the boot is done. But user space tools
>> (like lsslot and drmgr) read it to built the LMB tree and get the DRC index for
>> each LMBs as it is not available in SYSFS.
> 
> Yeah, but as I mentioned above the property can change as a result of an update
> we process from the hypervisor in response to something like LPM (or PRRN if we
> ever figure out how to make that work correctly). So, if there is some sort of
> state drmgr needs to know we have to figure out a different way to expose that
> information.

Triggering drmgr at the end of the LPM (and after a PRRN) will be the next thing 
to do, so userspace tools can be run to handle these changes.

>>
>>> Changes to the device tree should be things reported to the system from the
>>> hypervisor through the proper interfaces, and as a result any code that cares
>>> can register an of_reconfig_notifier to resepond to device tree updates. The
>>> memory dlpar code seems to be needlessly manipulating the device-tree which
>>> leads to the problem here where a notifier callback is now duplicating work.
>>
>> I don't think the hypervisor is expected to update the 'ibm,dynamic-memory' each
>> time a LMB is added, this is not design this way AFAIK.
> 
> It shouldn't need to for the most part. The only information that should change
> in ibm,dynamic-memory in the first place is the aa_index as a result of an
> underlying platform reassignment. The flags in ibm,dynamic-memory aren't
> changing as a result of DLPAR add/remove. The aa_index could be out of date as I
> mentioned above. The use of DRCONF_MEM_ASSIGNED in my opinion is actually a hack
> to mark LMBs as present and owned by the partition. Its actual PAPR definition
> is soley to identify LMBs that are present at boot.
> 
> As of today I don't have a problem with your patch. This was more of me pointing
> out things that I think are currently wrong with our memory hotplug
> implementation, and that we need to take a long hard look at it down the road.

I do agree, there is a lot of odd things there to address in this area.
If you're ok with that patch, do you mind to add a reviewed-by?

> -Tyrel
> 
>>
>> Laurent.
>>
>>> Just my two cents FWIW.
>>>
>>> -Tyrel
>>>
>>>>
>>>> -aneesh
>>>>
>>>
>>
> 

