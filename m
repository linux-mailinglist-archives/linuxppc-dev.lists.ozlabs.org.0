Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C3370445
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 01:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX8V5196Wz309l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 09:59:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbiCdxfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SbiCdxfb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX8Tc63pkz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 09:58:44 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UNXG3G050553; Fri, 30 Apr 2021 19:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qwtE7nszsN4kim/BAqNLXNFcwcBkITIE3HX7zHOnqyw=;
 b=SbiCdxfblI4F6vQzYCUx5Ff0RUrYD/6XYT9uRnAaYWKRRvnogNRVE8i7lviaCK83Pape
 x4tfXSeQ0yV0H+M73abv+Romy1INZz4rs9KR43SdG4oElHOCwI/41MltRRkgJG5cShAA
 FUDvS71NOLl7nFOZdykwxptYKsjqTZ1wUUPeiN0zjgipKc5OhgqXV9mZBM06gGpA45eJ
 eZs5aGB3Ny8SHAlGimnVlDz6ylooMtoVENt30fpKMcDB+UVoFRqgc2jYm8lgMt/92F0t
 Ii3rZPMykjOGsSjrZt8UpEnwKD/ONJYc7P145hlzKYTwqlnhw4/hpxlFXNRoGqKEOSzu TQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388uhy8ens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:58:37 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UNuXRG017018;
 Fri, 30 Apr 2021 23:58:36 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 388gtrw72x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 23:58:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UNwarj41746768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 23:58:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB0F32805A;
 Fri, 30 Apr 2021 23:58:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8AA128058;
 Fri, 30 Apr 2021 23:58:34 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.126.175])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 23:58:34 +0000 (GMT)
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
To: Laurent Dufour <ldufour@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
 <87fsz95qso.fsf@linux.ibm.com>
 <9d29bf8c-9e97-c179-6897-8e25fa4eb516@linux.ibm.com>
 <271ef351-b89c-ba68-3b6d-baa24cc0021b@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <c87e17d3-8956-9eb0-6f8a-ae316ea75f7e@linux.ibm.com>
Date: Fri, 30 Apr 2021 16:58:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <271ef351-b89c-ba68-3b6d-baa24cc0021b@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: liXGrhYTm9POpe9SWTenkxzkEq6diay8
X-Proofpoint-GUID: liXGrhYTm9POpe9SWTenkxzkEq6diay8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_15:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300167
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

On 4/30/21 9:13 AM, Laurent Dufour wrote:
> Le 29/04/2021 à 21:12, Tyrel Datwyler a écrit :
>> On 4/29/21 3:27 AM, Aneesh Kumar K.V wrote:
>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>
>>>> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
>>>> updated by the hypervisor in the case the NUMA topology of the LPAR's
>>>> memory is updated.
>>>>
>>>> This is caught by the kernel, but the memory's node is updated because
>>>> there is no way to move a memory block between nodes.
>>>>
>>>> If later a memory block is added or removed, drmem_update_dt() is called
>>>> and it is overwriting the DT node to match the added or removed LMB. But
>>>> the LMB's associativity node has not been updated after the DT node update
>>>> and thus the node is overwritten by the Linux's topology instead of the
>>>> hypervisor one.
>>>>
>>>> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
>>>> updated to force an update of the LMB's associativity.
>>>>
>>>> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
>>>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>>>> ---
>>>>
>>>> V3:
>>>>   - Check rd->dn->name instead of rd->dn->full_name
>>>> V2:
>>>>   - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>>>>   introducing a new hook mechanism.
>>>> ---
>>>>   arch/powerpc/include/asm/drmem.h              |  1 +
>>>>   arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
>>>>   .../platforms/pseries/hotplug-memory.c        |  4 +++
>>>>   3 files changed, 40 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/drmem.h
>>>> b/arch/powerpc/include/asm/drmem.h
>>>> index bf2402fed3e0..4265d5e95c2c 100644
>>>> --- a/arch/powerpc/include/asm/drmem.h
>>>> +++ b/arch/powerpc/include/asm/drmem.h
>>>> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>>>>   int __init
>>>>   walk_drmem_lmbs_early(unsigned long node, void *data,
>>>>                 int (*func)(struct drmem_lmb *, const __be32 **, void *));
>>>> +void drmem_update_lmbs(struct property *prop);
>>>>   #endif
>>>>     static inline void invalidate_lmb_associativity_index(struct drmem_lmb
>>>> *lmb)
>>>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>>>> index 9af3832c9d8d..f0a6633132af 100644
>>>> --- a/arch/powerpc/mm/drmem.c
>>>> +++ b/arch/powerpc/mm/drmem.c
>>>> @@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node,
>>>> void *data,
>>>>       return ret;
>>>>   }
>>>>   +/*
>>>> + * Update the LMB associativity index.
>>>> + */
>>>> +static int update_lmb(struct drmem_lmb *updated_lmb,
>>>> +              __maybe_unused const __be32 **usm,
>>>> +              __maybe_unused void *data)
>>>> +{
>>>> +    struct drmem_lmb *lmb;
>>>> +
>>>> +    /*
>>>> +     * Brut force there may be better way to fetch the LMB
>>>> +     */
>>>> +    for_each_drmem_lmb(lmb) {
>>>> +        if (lmb->drc_index != updated_lmb->drc_index)
>>>> +            continue;
>>>> +
>>>> +        lmb->aa_index = updated_lmb->aa_index;
>>>> +        break;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Update the LMB associativity index.
>>>> + *
>>>> + * This needs to be called when the hypervisor is updating the
>>>> + * dynamic-reconfiguration-memory node property.
>>>> + */
>>>> +void drmem_update_lmbs(struct property *prop)
>>>> +{
>>>> +    if (!strcmp(prop->name, "ibm,dynamic-memory"))
>>>> +        __walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
>>>> +    else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
>>>> +        __walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
>>>> +}
>>>>   #endif
>>>>     static int init_drmem_lmb_size(struct device_node *dn)
>>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> index 8377f1f7c78e..672ffbee2e78 100644
>>>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct
>>>> notifier_block *nb,
>>>>       case OF_RECONFIG_DETACH_NODE:
>>>>           err = pseries_remove_mem_node(rd->dn);
>>>>           break;
>>>> +    case OF_RECONFIG_UPDATE_PROPERTY:
>>>> +        if (!strcmp(rd->dn->name,
>>>> +                "ibm,dynamic-reconfiguration-memory"))
>>>> +            drmem_update_lmbs(rd->prop);
>>>>       }
>>>>       return notifier_from_errno(err);
>>>
>>> How will this interact with DLPAR memory? When we dlpar memory,
>>> ibm,configure-connector is used to fetch the new associativity details
>>> and set drmem_lmb->aa_index correctly there. Once that is done kernel
>>> then call drmem_update_dt() which will result in the above notifier
>>> callback?
>>>
>>> IIUC, the call back then will update drmem_lmb->aa_index again?
>>
>> After digging through some of this code I'm a bit concerned about all the kernel
>> device tree manipulation around memory DLPAR both with the assoc-lookup-array
>> prop update and post dynamic-memory prop updating. We build a drmem_info array
>> of the LMBs from the device-tree at boot. I don't really understand why we are
>> manipulating the device tree property every time we add/remove an LMB. Not sure
>> the reasoning was to write back in particular the aa_index and flags for each
>> LMB into the device tree when we already have them in the drmem_info array. On
>> the other hand the assoc-lookup-array I suppose would need to have an in kernel
>> representation to avoid updating the device tree property every time.
> 
> I think the reason is to keep the device tree in sync with the current set of LMBs.

I don't really think that is how the device tree is meant to be used. We have an
in memory representation of the LMBs separate from the device tree, and that is
were we should track OS specific state. The values in the device-tree property
can be updated via device node remove/add or update-properties RTAS call. These
are the means that the platform reports (OS discovers) underlying changes. The
new property is going to blow away any previous state that the OS wrote there.
This is likely, one of the culprits of memory DLPAR problems that have been
observed after LPM.

> 
> My understanding is that the kernel is not really using the
> 'ibm,dynamic-memory*' DT property once the boot is done. But user space tools
> (like lsslot and drmgr) read it to built the LMB tree and get the DRC index for
> each LMBs as it is not available in SYSFS.

Yeah, but as I mentioned above the property can change as a result of an update
we process from the hypervisor in response to something like LPM (or PRRN if we
ever figure out how to make that work correctly). So, if there is some sort of
state drmgr needs to know we have to figure out a different way to expose that
information.

> 
>> Changes to the device tree should be things reported to the system from the
>> hypervisor through the proper interfaces, and as a result any code that cares
>> can register an of_reconfig_notifier to resepond to device tree updates. The
>> memory dlpar code seems to be needlessly manipulating the device-tree which
>> leads to the problem here where a notifier callback is now duplicating work.
> 
> I don't think the hypervisor is expected to update the 'ibm,dynamic-memory' each
> time a LMB is added, this is not design this way AFAIK.

It shouldn't need to for the most part. The only information that should change
in ibm,dynamic-memory in the first place is the aa_index as a result of an
underlying platform reassignment. The flags in ibm,dynamic-memory aren't
changing as a result of DLPAR add/remove. The aa_index could be out of date as I
mentioned above. The use of DRCONF_MEM_ASSIGNED in my opinion is actually a hack
to mark LMBs as present and owned by the partition. Its actual PAPR definition
is soley to identify LMBs that are present at boot.

As of today I don't have a problem with your patch. This was more of me pointing
out things that I think are currently wrong with our memory hotplug
implementation, and that we need to take a long hard look at it down the road.

-Tyrel

> 
> Laurent.
> 
>> Just my two cents FWIW.
>>
>> -Tyrel
>>
>>>
>>> -aneesh
>>>
>>
> 

