Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7B36FE4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:14:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWy9g32Jmz30Cw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:14:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0ul8jnC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N0ul8jnC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWy9B2Rvcz2y6N
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:13:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UG4fp9098661; Fri, 30 Apr 2021 12:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EOZHrgGSMmfA8sfZIsPC7o2SDQRDRpbJl5mRXAW0OUU=;
 b=N0ul8jnCilykbevS0aNrDQfE7i1yaogwee8oO5/GkD3WQhVbQhRkUdSaD0FKcDOoSopJ
 yaTFKzASX14+eKPafEqWP/HfSvK+6zYCBncoFoz+NAfHCL8kWnF7z0K8MnFnfYCQDpbf
 X1IOMfhWnJqpBgeAOw8MxaHvJhAFOH2TpRLmvv/kPDdCwVuC3FxN6Q2EcCvDEMsgD9SB
 mJomJta1qdYMLW3Et/s+dplXaLdHgExMvOFOQvYtBjH4BI3pIk5VzTKh6LtBPrzs199C
 MsrV1mnGB9BEWm8koH3PdMK/SnpcDCVazvgfU8kOkAYv5Y+WtMMn0kopQZVs+OUSKmjr sQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388mer9t8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:13:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UG44ju008864;
 Fri, 30 Apr 2021 16:13:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8kafc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:13:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UGDTo840239550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:13:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A336A4051;
 Fri, 30 Apr 2021 16:13:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E102DA4040;
 Fri, 30 Apr 2021 16:13:28 +0000 (GMT)
Received: from pomme.local (unknown [9.145.168.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 16:13:28 +0000 (GMT)
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
 <87fsz95qso.fsf@linux.ibm.com>
 <9d29bf8c-9e97-c179-6897-8e25fa4eb516@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <271ef351-b89c-ba68-3b6d-baa24cc0021b@linux.ibm.com>
Date: Fri, 30 Apr 2021 18:13:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9d29bf8c-9e97-c179-6897-8e25fa4eb516@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ejYf8IUz8E6jXXe4R_z-qeDTsBweZaE5
X-Proofpoint-GUID: ejYf8IUz8E6jXXe4R_z-qeDTsBweZaE5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300108
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

Le 29/04/2021 à 21:12, Tyrel Datwyler a écrit :
> On 4/29/21 3:27 AM, Aneesh Kumar K.V wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>
>>> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
>>> updated by the hypervisor in the case the NUMA topology of the LPAR's
>>> memory is updated.
>>>
>>> This is caught by the kernel, but the memory's node is updated because
>>> there is no way to move a memory block between nodes.
>>>
>>> If later a memory block is added or removed, drmem_update_dt() is called
>>> and it is overwriting the DT node to match the added or removed LMB. But
>>> the LMB's associativity node has not been updated after the DT node update
>>> and thus the node is overwritten by the Linux's topology instead of the
>>> hypervisor one.
>>>
>>> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
>>> updated to force an update of the LMB's associativity.
>>>
>>> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
>>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>>> ---
>>>
>>> V3:
>>>   - Check rd->dn->name instead of rd->dn->full_name
>>> V2:
>>>   - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>>>   introducing a new hook mechanism.
>>> ---
>>>   arch/powerpc/include/asm/drmem.h              |  1 +
>>>   arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
>>>   .../platforms/pseries/hotplug-memory.c        |  4 +++
>>>   3 files changed, 40 insertions(+)
>>>
>>> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
>>> index bf2402fed3e0..4265d5e95c2c 100644
>>> --- a/arch/powerpc/include/asm/drmem.h
>>> +++ b/arch/powerpc/include/asm/drmem.h
>>> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>>>   int __init
>>>   walk_drmem_lmbs_early(unsigned long node, void *data,
>>>   		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
>>> +void drmem_update_lmbs(struct property *prop);
>>>   #endif
>>>   
>>>   static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
>>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>>> index 9af3832c9d8d..f0a6633132af 100644
>>> --- a/arch/powerpc/mm/drmem.c
>>> +++ b/arch/powerpc/mm/drmem.c
>>> @@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
>>>   	return ret;
>>>   }
>>>   
>>> +/*
>>> + * Update the LMB associativity index.
>>> + */
>>> +static int update_lmb(struct drmem_lmb *updated_lmb,
>>> +		      __maybe_unused const __be32 **usm,
>>> +		      __maybe_unused void *data)
>>> +{
>>> +	struct drmem_lmb *lmb;
>>> +
>>> +	/*
>>> +	 * Brut force there may be better way to fetch the LMB
>>> +	 */
>>> +	for_each_drmem_lmb(lmb) {
>>> +		if (lmb->drc_index != updated_lmb->drc_index)
>>> +			continue;
>>> +
>>> +		lmb->aa_index = updated_lmb->aa_index;
>>> +		break;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Update the LMB associativity index.
>>> + *
>>> + * This needs to be called when the hypervisor is updating the
>>> + * dynamic-reconfiguration-memory node property.
>>> + */
>>> +void drmem_update_lmbs(struct property *prop)
>>> +{
>>> +	if (!strcmp(prop->name, "ibm,dynamic-memory"))
>>> +		__walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
>>> +	else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
>>> +		__walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
>>> +}
>>>   #endif
>>>   
>>>   static int init_drmem_lmb_size(struct device_node *dn)
>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> index 8377f1f7c78e..672ffbee2e78 100644
>>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct notifier_block *nb,
>>>   	case OF_RECONFIG_DETACH_NODE:
>>>   		err = pseries_remove_mem_node(rd->dn);
>>>   		break;
>>> +	case OF_RECONFIG_UPDATE_PROPERTY:
>>> +		if (!strcmp(rd->dn->name,
>>> +			    "ibm,dynamic-reconfiguration-memory"))
>>> +			drmem_update_lmbs(rd->prop);
>>>   	}
>>>   	return notifier_from_errno(err);
>>
>> How will this interact with DLPAR memory? When we dlpar memory,
>> ibm,configure-connector is used to fetch the new associativity details
>> and set drmem_lmb->aa_index correctly there. Once that is done kernel
>> then call drmem_update_dt() which will result in the above notifier
>> callback?
>>
>> IIUC, the call back then will update drmem_lmb->aa_index again?
> 
> After digging through some of this code I'm a bit concerned about all the kernel
> device tree manipulation around memory DLPAR both with the assoc-lookup-array
> prop update and post dynamic-memory prop updating. We build a drmem_info array
> of the LMBs from the device-tree at boot. I don't really understand why we are
> manipulating the device tree property every time we add/remove an LMB. Not sure
> the reasoning was to write back in particular the aa_index and flags for each
> LMB into the device tree when we already have them in the drmem_info array. On
> the other hand the assoc-lookup-array I suppose would need to have an in kernel
> representation to avoid updating the device tree property every time.

I think the reason is to keep the device tree in sync with the current set of LMBs.

My understanding is that the kernel is not really using the 
'ibm,dynamic-memory*' DT property once the boot is done. But user space tools 
(like lsslot and drmgr) read it to built the LMB tree and get the DRC index for 
each LMBs as it is not available in SYSFS.

> Changes to the device tree should be things reported to the system from the
> hypervisor through the proper interfaces, and as a result any code that cares
> can register an of_reconfig_notifier to resepond to device tree updates. The
> memory dlpar code seems to be needlessly manipulating the device-tree which
> leads to the problem here where a notifier callback is now duplicating work.

I don't think the hypervisor is expected to update the 'ibm,dynamic-memory' each 
time a LMB is added, this is not design this way AFAIK.

Laurent.

> Just my two cents FWIW.
> 
> -Tyrel
> 
>>
>> -aneesh
>>
> 

