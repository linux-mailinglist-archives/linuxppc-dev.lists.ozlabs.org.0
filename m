Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57A36E99D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWCz56TQrz30HP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 21:32:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W+TIVEw1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W+TIVEw1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWCyg1xshz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 21:32:10 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TB4Gcv182189; Thu, 29 Apr 2021 07:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UWvtbK8dcp1l3VZpp6JuyPfV2zCIrVCruA0h5n2duuA=;
 b=W+TIVEw1R2OIszzlYR+Ptq1rSfRffbXH1l1C8oessfKHTW5rr6r7JweN+Bua+dsNXPvX
 /DmALLco25tMrMnHwjdhK0eCn5TEPVz2ouxitfH50/sFM+Y80d0nZdOlEEVSgQIthkzN
 T4L6I5BXFTZVz0kNFT8F1qAlfyW6ocTJycYG66IUusYtFG+sdVALfOvPq5xz+U97IwHy
 T1/XTDGzMQCEzR+Z7FnIZ4Snnky78Y169eLagcOPBZCpSVcySg8xwV9vcj+zvqbfNKRW
 iywEEj9QhqGP9pTHWQ/ClfSI+VGR1a6G2Vzr8hp+JNtggvM2N2yx2kqMcZPmKKQt23MN Dg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387tkmaq87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 07:32:04 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TBRs2w020501;
 Thu, 29 Apr 2021 11:32:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 384gjxs9xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 11:32:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TBVx3B54001964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 11:31:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 231CD5208D;
 Thu, 29 Apr 2021 11:31:59 +0000 (GMT)
Received: from pomme.local (unknown [9.145.30.132])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D0BD852091;
 Thu, 29 Apr 2021 11:31:58 +0000 (GMT)
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
 <87fsz95qso.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <e3fcd8b6-6d43-85ed-7036-42430aad4979@linux.ibm.com>
Date: Thu, 29 Apr 2021 13:31:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87fsz95qso.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GBrDq5Ha8ZcjzGgs3wfu21e5lzsZ6u6t
X-Proofpoint-GUID: GBrDq5Ha8ZcjzGgs3wfu21e5lzsZ6u6t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_06:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290075
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 29/04/2021 à 12:27, Aneesh Kumar K.V a écrit :
> Laurent Dufour <ldufour@linux.ibm.com> writes:
> 
>> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
>> updated by the hypervisor in the case the NUMA topology of the LPAR's
>> memory is updated.
>>
>> This is caught by the kernel, but the memory's node is updated because
>> there is no way to move a memory block between nodes.
>>
>> If later a memory block is added or removed, drmem_update_dt() is called
>> and it is overwriting the DT node to match the added or removed LMB. But
>> the LMB's associativity node has not been updated after the DT node update
>> and thus the node is overwritten by the Linux's topology instead of the
>> hypervisor one.
>>
>> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
>> updated to force an update of the LMB's associativity.
>>
>> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>
>> V3:
>>   - Check rd->dn->name instead of rd->dn->full_name
>> V2:
>>   - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>>   introducing a new hook mechanism.
>> ---
>>   arch/powerpc/include/asm/drmem.h              |  1 +
>>   arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
>>   .../platforms/pseries/hotplug-memory.c        |  4 +++
>>   3 files changed, 40 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
>> index bf2402fed3e0..4265d5e95c2c 100644
>> --- a/arch/powerpc/include/asm/drmem.h
>> +++ b/arch/powerpc/include/asm/drmem.h
>> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>>   int __init
>>   walk_drmem_lmbs_early(unsigned long node, void *data,
>>   		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
>> +void drmem_update_lmbs(struct property *prop);
>>   #endif
>>   
>>   static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>> index 9af3832c9d8d..f0a6633132af 100644
>> --- a/arch/powerpc/mm/drmem.c
>> +++ b/arch/powerpc/mm/drmem.c
>> @@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Update the LMB associativity index.
>> + */
>> +static int update_lmb(struct drmem_lmb *updated_lmb,
>> +		      __maybe_unused const __be32 **usm,
>> +		      __maybe_unused void *data)
>> +{
>> +	struct drmem_lmb *lmb;
>> +
>> +	/*
>> +	 * Brut force there may be better way to fetch the LMB
>> +	 */
>> +	for_each_drmem_lmb(lmb) {
>> +		if (lmb->drc_index != updated_lmb->drc_index)
>> +			continue;
>> +
>> +		lmb->aa_index = updated_lmb->aa_index;
>> +		break;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Update the LMB associativity index.
>> + *
>> + * This needs to be called when the hypervisor is updating the
>> + * dynamic-reconfiguration-memory node property.
>> + */
>> +void drmem_update_lmbs(struct property *prop)
>> +{
>> +	if (!strcmp(prop->name, "ibm,dynamic-memory"))
>> +		__walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
>> +	else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
>> +		__walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
>> +}
>>   #endif
>>   
>>   static int init_drmem_lmb_size(struct device_node *dn)
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index 8377f1f7c78e..672ffbee2e78 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct notifier_block *nb,
>>   	case OF_RECONFIG_DETACH_NODE:
>>   		err = pseries_remove_mem_node(rd->dn);
>>   		break;
>> +	case OF_RECONFIG_UPDATE_PROPERTY:
>> +		if (!strcmp(rd->dn->name,
>> +			    "ibm,dynamic-reconfiguration-memory"))
>> +			drmem_update_lmbs(rd->prop);
>>   	}
>>   	return notifier_from_errno(err);
> 
> How will this interact with DLPAR memory? When we dlpar memory,
> ibm,configure-connector is used to fetch the new associativity details
> and set drmem_lmb->aa_index correctly there. Once that is done kernel
> then call drmem_update_dt() which will result in the above notifier
> callback?

When a memory DLPAR operation is done, the in memory DT property 
"ibm,dynamic-memory" or "ibm,dynamic-memory-v2" (if existing) have to be updated 
to reflect the added/removed memory part. This is done by calling drmem_update_dt().

This patch is addressing the case where the hypervisor has updated the DT 
property mentioned above. In that case, the LMB tree should be updated so the 
aa_index fields are matching the DT one. This way the next time a memory DLPAR 
operation is done the DT properties "ibm,dynamic-memory" or 
"ibm,dynamic-memory-v2" will be rebuilt correctly.

> IIUC, the call back then will update drmem_lmb->aa_index again?

drmem_update_dt() is not updating drmem_lmb->aa_index, that's the oppposite, it 
is rebuilding the in memory DT property "ibm,dynamic-memory" or 
"ibm,dynamic-memory-v2" based on the data stored in the LMB tree.

Laurent.
