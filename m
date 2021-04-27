Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43136CA57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 19:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV7zp5FJ1z30BP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 03:29:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oaQIX0VT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oaQIX0VT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV7zN16qNz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 03:29:03 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RH2xLi158032; Tue, 27 Apr 2021 13:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qaRL0GcX5mJv9z9wY5Pv7EzCSvAUx3eMqPNJKQ4864Y=;
 b=oaQIX0VTcTVVruSyVFEizSmgRB0db1I5XNh0DlqzkUTSS0fP2UnrJxDcHqaRIJII2bbq
 JFZAVeBdc7dDNQWDw+2cZDE6I4tD36W7qflZ668pBO8+RXGjJZGOg54ryF0v1engAHgb
 IUDR6BXXRHYDXFZdR6XR6yuukwMD8PsLOqI7P/gtHSh/uabUt3AuDrIKJ2NIiOHXttA8
 b7iOJ6F9wLIDlcUxKj8EzIihKI6HYvG6HK/Jzfja7812lpafdHnLuX1wx5y2rbYEsElc
 xRxCPcBDc7fzrSmmoE2qkhFQRC45y+abQojUG00aplua+pbmP7niToSS7T0hkneA7u0N uA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386pf690vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 13:28:57 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RHRlGr020226;
 Tue, 27 Apr 2021 17:28:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 384ay8gtnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 17:28:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13RHSpLQ38404402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 17:28:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1069AE055;
 Tue, 27 Apr 2021 17:28:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D187AE051;
 Tue, 27 Apr 2021 17:28:51 +0000 (GMT)
Received: from pomme.local (unknown [9.145.169.209])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 17:28:51 +0000 (GMT)
Subject: Re: [PATCH] pseries/drmem: update LMBs after LPM
To: Tyrel Datwyler <tyreld@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210427150113.14368-1-ldufour@linux.ibm.com>
 <8b36065d-e4b4-bc0c-cf69-f01c91e49061@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <c80a76eb-1e10-95f7-def1-5eb26d66efb2@linux.ibm.com>
Date: Tue, 27 Apr 2021 19:28:51 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8b36065d-e4b4-bc0c-cf69-f01c91e49061@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z-QlqJK8TqS3fpFTjLusOkS7sZIzjQ4K
X-Proofpoint-GUID: z-QlqJK8TqS3fpFTjLusOkS7sZIzjQ4K
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_10:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270115
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

Le 27/04/2021 à 19:01, Tyrel Datwyler a écrit :
> On 4/27/21 8:01 AM, Laurent Dufour wrote:
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
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/drmem.h          |  1 +
>>   arch/powerpc/mm/drmem.c                   | 48 +++++++++++++++++++++++
>>   arch/powerpc/platforms/pseries/mobility.c |  9 +++++
>>   3 files changed, 58 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
>> index bf2402fed3e0..55c2c25085b0 100644
>> --- a/arch/powerpc/include/asm/drmem.h
>> +++ b/arch/powerpc/include/asm/drmem.h
>> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>>   int __init
>>   walk_drmem_lmbs_early(unsigned long node, void *data,
>>   		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
>> +void drmem_update_lmbs(void);
>>   #endif
>>
>>   static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>> index 9af3832c9d8d..46074bdfdb3c 100644
>> --- a/arch/powerpc/mm/drmem.c
>> +++ b/arch/powerpc/mm/drmem.c
>> @@ -307,6 +307,54 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
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
>> +void drmem_update_lmbs(void)
>> +{
>> +	struct device_node *node;
>> +	const __be32 *prop;
>> +
>> +	node = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
>> +	if (!node)
>> +		return;
>> +
>> +	prop = of_get_property(node, "ibm,dynamic-memory", NULL);
>> +	if (prop) {
>> +		__walk_drmem_v1_lmbs(prop, NULL, NULL, update_lmb);
>> +	} else {
>> +		prop = of_get_property(node, "ibm,dynamic-memory-v2", NULL);
>> +		if (prop)
>> +			__walk_drmem_v2_lmbs(prop, NULL, NULL, update_lmb);
>> +	}
>> +
>> +	of_node_put(node);
>> +}
>>   #endif
>>
>>   static int init_drmem_lmb_size(struct device_node *dn)
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index ea4d6a660e0d..c68eccc6e8df 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -25,6 +25,7 @@
>>
>>   #include <asm/machdep.h>
>>   #include <asm/rtas.h>
>> +#include <asm/drmem.h>
>>   #include "pseries.h"
>>   #include "../../kernel/cacheinfo.h"
>>
>> @@ -237,6 +238,7 @@ int pseries_devicetree_update(s32 scope)
>>   	__be32 *data;
>>   	int update_nodes_token;
>>   	int rc;
>> +	bool drmem_updated = false;
>>
>>   	update_nodes_token = rtas_token("ibm,update-nodes");
>>   	if (update_nodes_token == RTAS_UNKNOWN_SERVICE)
>> @@ -271,6 +273,10 @@ int pseries_devicetree_update(s32 scope)
>>   					continue;
>>   				}
>>
>> +				if (!strcmp(np->full_name,
>> +					    "ibm,dynamic-reconfiguration-memory"))
>> +					drmem_updated = true;
> 
> Is there a reason that we can't use the existing pseries_memory_notifier()
> callback in pseries/hotplug-memory.c to trigger the drmem_update_lmbs() when
> either the ibm,dynamic-memory or ibm,dynamic-memory-v2 properties are updated?

Thanks a lot Tyrel!

That's far more elegant, I'll send a v2 soon.

Laurent.

> Something like:
> 
> static int pseries_memory_notifier(struct notifier_block *nb,
>                                     unsigned long action, void *data)
> {
>          struct of_reconfig_data *rd = data;
>          int err = 0;
> 
>          switch (action) {
>          case OF_RECONFIG_ATTACH_NODE:
>                  err = pseries_add_mem_node(rd->dn);
>                  break;
>          case OF_RECONFIG_DETACH_NODE:
>                  err = pseries_remove_mem_node(rd->dn);
>                  break;
> 	case OF_RECONFIG_UPDATE_PROPERTY:
> 		if (!strcmp(rd->dn->full_name, "ibm,dynamic-reconfiguration-memory"));
> 			drmem_update_lmbs(rd->prop);
> 		break;
>          }
>          return notifier_from_errno(err);
> }
> 
> Your drmem_update_lmbs() would need to be updated to take a property and to
> check the property name against ibm,dyanmic-memory[-v2].
> 
> -Tyrel
> 
>> +
>>   				switch (action) {
>>   				case DELETE_DT_NODE:
>>   					delete_dt_node(np);
>> @@ -293,6 +299,9 @@ int pseries_devicetree_update(s32 scope)
>>   	} while (rc == 1);
>>
>>   	kfree(rtas_buf);
>> +
>> +	if (drmem_updated)
>> +		drmem_update_lmbs();
>>   	return rc;
>>   }
>>
> 

