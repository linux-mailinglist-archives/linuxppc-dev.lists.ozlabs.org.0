Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3AB373DD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 16:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZzrc6wrcz30J5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 00:40:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IvWsmmuK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IvWsmmuK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZzr443NSz2yRG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 00:39:32 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145EXOsm167381; Wed, 5 May 2021 10:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lc7uFzgPNhcsp+WarEELqYO8Kt7OXRxKAZ/JSIHieH0=;
 b=IvWsmmuKvc1ZrmXnxYchok7nblZeFztREwnqJ4MePoTGwubYRGcX5ziJ6YS/wGWtnrRG
 4RJ4IcpZ1PR5iIY1jYxuxJcszxtQ1XOZV2Zoup8SQY/3sS5vghCCVcFlliQX4rZbA4Mq
 0Xyd6KnWMeUNSJNOw3qIsZF5oULnT23UXwLtle2iFWycijSMCTwMhTDlr3U+UMTgZtbM
 2tiv2AZCQrZoJkQQmG7wmelLF42awMKrqYs89Y8NI+jXjILujGXkuZLvKaCU8TXqXDl4
 Lne6xfC/VZ4apgMQ5QAR/JR+rbBg9lpKqmnukkY7zfwTq2XqIHTkvHUIJgQslLiHO2x2 vA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bw4nrck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 10:39:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145EcIss012554;
 Wed, 5 May 2021 14:39:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 38bedxrbtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 14:39:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 145EdORw2753238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 14:39:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 093144C052;
 Wed,  5 May 2021 14:39:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C09944C040;
 Wed,  5 May 2021 14:39:23 +0000 (GMT)
Received: from pomme.local (unknown [9.145.1.8])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 14:39:23 +0000 (GMT)
Subject: Re: [PATCH v4] pseries/drmem: update LMBs after LPM
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20210504092038.8514-1-ldufour@linux.ibm.com>
 <87bl9qf7xk.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <8cebddd7-5b06-ba93-3cc7-9cdab57db491@linux.ibm.com>
Date: Wed, 5 May 2021 16:39:23 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87bl9qf7xk.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BShm9QQKfxlfhzv9-PAaRod7W6k6SlW9
X-Proofpoint-ORIG-GUID: BShm9QQKfxlfhzv9-PAaRod7W6k6SlW9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105050106
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 paulus@samba.org, linux-kernel@vger.kernel.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 05/05/2021 à 00:30, Nathan Lynch a écrit :
> Hi Laurent,

Hi Nathan,

Thanks for your review.

> Bear with me while I work through the commit message:
> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
>> updated by the hypervisor in the case the NUMA topology of the LPAR's
>> memory is updated.
> 
> Yes, the RTAS functions ibm,update-nodes and ibm,update-properties,
> which the OS invokes after resuming, may bring in updated properties
> under the ibm,dynamic-reconfiguration-memory node, including the
> ibm,associativity-lookup-arrays property.
> 
>> This is caught by the kernel,
> 
> "Caught" makes me think this is an error condition, as in catching an
> exception. I guess "handled" better conveys your meaning?

ok

> 
>> but the memory's node is updated because
>> there is no way to move a memory block between nodes.
> 
> "The memory's node" refers the ibm,dynamic-reconfiguration-memory DT
> node, yes? Or is it referring to Linux's NUMA nodes? ("move a memory
> block between nodes" in your statement here refers to Linux's NUMA
> nodes, that much is clear to me.)
> 
> I am failing to follow the cause->effect relationship stated. True,
> changing a block's node assignment while it's in use isn't safe. I don't
> see why that implies that "the memory's node is updated"? In fact this
> seems contradictory.
> 
> This statement makes more sense to me if I change it to "the memory's
> node is _not_ updated" -- is this what you intended?

Correct, I dropped the 'not' word here ;)

> 
>> If later a memory block is added or removed, drmem_update_dt() is called
>> and it is overwriting the DT node to match the added or removed LMB.
> 
> I understand this, but I will expand on it.
> 
> dlpar_memory()
>    -> dlpar_memory_add_by_count()
>      -> dlpar_add_lmb()
>        -> update_lmb_associativity_index()
>          ... lmb->aa_index = <value>
>    -> drmem_update_dt()
> 
> update_lmb_associativity_index() retrieves the firmware description of
> the new block, and sets the aa_index of the matching entry in the
> drmem_info array to the value matching the firmware description.
> 
> Then, drmem_update_dt() walks the drmem_info array and synthesizes a new
> /ibm,dynamic-reconfiguration-memory/ibm,dynamic-memory-v2 property based
> on the recently updated information in that array.

Yes

> 
>> But the LMB's associativity node has not been updated after the DT
>> node update and thus the node is overwritten by the Linux's topology
>> instead of the hypervisor one.
> 
> So, an example of the problem is:
> 
> 1. VM migrates. On resume, ibm,associativity-lookup-arrays is changed
>     via ibm,update-properties. Entries in the drmem_info array remain
>     unchanged, with aa_index values that correspond to the source
>     system's ibm,associativity-lookup-arrays property, now inaccessible.
> 
> 2. A memory block is added. We look up the new block's entry in the
>     drmem_info array, and set the aa_index to the value matching the
>     current ibm,associativity-lookup-arrays.
> 
> 3. Then, the ibm,associativity-lookup-arrays property is completely
>     regenerated from the drmem_info array, which reflects a mixture of
>     information from the source and destination systems.
> 
> Do I understand correctly?

Yes

> 
> 
>> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
>> updated to force an update of the LMB's associativity. However, ignore the
>> call to that hook when the update has been triggered by drmem_update_dt().
>> Because, in that case, the LMB tree has been used to set the DT property
>> and thus it doesn't need to be updated back. Since drmem_update_dt() is
>> called under the protection of the device_hotplug_lock and the hook is
>> called in the same context, use a simple boolean variable to detect that
>> call.
> 
> This strikes me as almost a revert of e978a3ccaa71 ("powerpc/pseries:
> remove obsolete memory hotplug DT notifier code").

Not really identical to reverting e978a3ccaa71, here only the aa_index of the 
LMB is updated, everything else is kept in place. I don't try to apply the 
memory layout's changes, just updating the in use LMB's aa_index field.

The only matching point with the code reverted by the commit you mentioned would 
be the use of a global variable in_drmem_update instead of the previous 
rtas_hp_event to prevent the LMB tree to be updated again during memory hot plug 
event.

> I'd rather avoid smuggling through global state information that ought
> to be passed in function parameters, if it should be passed around at
> all. Despite having (IMO) relatively simple responsibilities, this code
> is difficult to change and review; adding this property makes it
> worse. If the structure of the code is pushing us toward this kind of
> compromise, then the code probably needs more fundamental changes.
> 
> I'm probably forgetting something -- can anyone remind me why we need an
> array of these:
> 
> struct drmem_lmb {
> 	u64     base_addr;
> 	u32     drc_index;
> 	u32     aa_index;
> 	u32     flags;
> };
> 
> which is just a less efficient representation of what's already in the
> device tree? If we got rid of it, would this problem disappear?

I don't think this is right for the moment, at first, we should robustify the 
DLPAR and LPM operations.


