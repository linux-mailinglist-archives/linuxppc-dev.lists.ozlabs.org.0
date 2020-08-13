Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A7244188
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 00:55:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSMP901BFzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ohHk7hi3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSMM20qT8zDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 08:54:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DMWwZK053160
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 18:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/1fbI0RKaWefd/c9I5aCF3t6Cd9etnrAiqxUZBDdblk=;
 b=ohHk7hi3dVIzzBPHiEaktlDEWnfxniOPpGQD8U/v3roFPRVYOUOMRfjXh9hpR+JOJazB
 DdF1O3q6qDYR/4Q8Hm4kn7ULfS6LSqzbACLmn20B2eOL/F8U2hYUzZ97AxJgI9K828vm
 Rc0debsDShY+xXwkyznHMR2gX0p5qHfpxFVVYMsyfN+4xLLcubHfauyC93LyBl3YGEWq
 7V/ehP+Fj2ftGxauHZUGqXPy/kYoZ9ad+hQRFAmYb6bofP7f/t38ejODryHiUSBNO4/A
 8FvpVdqOYe03JA/I7m2teq2Pf+hnp1pa2MU7OJT65/QSx6HDdkosMaepdBYaPcY3Pe5q DA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32vqcq8a48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 18:54:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07DMjNHh013665
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 22:54:01 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 32skpa149q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 22:54:01 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07DMrv6261997360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 22:53:57 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B116113604F;
 Thu, 13 Aug 2020 22:53:59 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B94E136051;
 Thu, 13 Aug 2020 22:53:59 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 22:53:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
In-Reply-To: <87eeof4q87.fsf@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <87pn83ytet.fsf@linux.ibm.com>
 <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
 <87k0yayykz.fsf@linux.ibm.com>
 <6d880a50-09c4-d591-c88c-09fd77512ad3@linux.ibm.com>
 <87eeof4q87.fsf@linux.ibm.com>
Date: Thu, 13 Aug 2020 17:53:58 -0500
Message-ID: <871rkayx6h.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_17:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=1
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130159
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> On 8/8/20 2:15 AM, Nathan Lynch wrote:
>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>> On 8/7/20 9:54 AM, Nathan Lynch wrote:
>>>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>>> index e437a9ac4956..6c659aada55b 100644
>>>>>> --- a/arch/powerpc/mm/numa.c
>>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>>> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>>>>>>    	}
>>>>>>    }
>>>>>>    
>>>>>> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>>>>>
>>>>> It's odd to me to use MAX_NUMNODES for this array when it's going to be
>>>>> indexed not by Linux's logical node IDs but by the platform-provided
>>>>> domain number, which has no relation to MAX_NUMNODES.
>>>>
>>>>
>>>> I didn't want to dynamically allocate this. We could fetch
>>>> "ibm,max-associativity-domains" to find the size for that. The current
>>>> code do assume  firmware group id to not exceed MAX_NUMNODES. Hence kept
>>>> the array size to be MAX_NUMNODEs. I do agree that it is confusing. May
>>>> be we can do #define MAX_AFFINITY_DOMAIN MAX_NUMNODES?
>>> 
>>> Well, consider:
>>> 
>>> - ibm,max-associativity-domains can change at runtime with LPM. This
>>>    doesn't happen in practice yet, but we should probably start thinking
>>>    about how to support that.
>>> - The domain numbering isn't clearly specified to have any particular
>>>    properties such as beginning at zero or a contiguous range.
>>> 
>>> While the current code likely contains assumptions contrary to these
>>> points, a change such as this is an opportunity to think about whether
>>> those assumptions can be reduced or removed. In particular I think it
>>> would be good to gracefully degrade when the number of NUMA affinity
>>> domains can exceed MAX_NUMNODES. Using the platform-supplied domain
>>> numbers to directly index Linux data structures will make that
>>> impossible.
>>> 
>>> So, maybe genradix or even xarray wouldn't actually be overengineering
>>> here.
>>> 
>>
>> One of the challenges with such a data structure is that we initialize 
>> the nid_map before the slab is available. This means a memblock based 
>> allocation and we would end up implementing such a sparse data structure 
>> ourselves here.

Yes, good point.


>> As you mentioned above, since we know that hypervisor as of now limits 
>> the max affinity domain id below ibm,max-associativity-domains we are 
>> good with an array-like nid_map we have here. This keeps the code simpler.
>>
>> This will also allow us to switch to a more sparse data structure as you 
>> requested here in the future because the main change that is pushed in 
>> this series is the usage of firmare_group_id_to_nid(). The details of 
>> the data structure we use to keep track of that mapping are pretty much 
>> internal to that function.
>
> How about this? This makes it not a direct index. But it do limit the
> search to max numa node on the system. 
>
> static int domain_id_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  -1 };
>
> static int __affinity_domain_to_nid(int domain_id, int max_nid)
> {
> 	int i;
>
> 	for (i = 0; i < max_nid; i++) {
> 		if (domain_id_map[i] == domain_id)
> 			return i;
> 	}
> 	return NUMA_NO_NODE;
> }

OK, this indexes the array by Linux's node id, good. I was wondering if
I could persuade you do flip it around like this :-)

Walking through the code below:

> int affinity_domain_to_nid(struct affinity_domain *domain)
> {
> 	int nid, domain_id;
> 	static int last_nid = 0;
> 	static DEFINE_SPINLOCK(node_id_lock);
>
> 	domain_id = domain->id;
> 	/*
> 	 * For PowerNV we don't change the node id. This helps to avoid
> 	 * confusion w.r.t the expected node ids. On pseries, node numbers
> 	 * are virtualized. Hence do logical node id for pseries.
> 	 */
> 	if (!firmware_has_feature(FW_FEATURE_LPAR))
> 		return domain_id;
>
> 	if (domain_id ==  -1 || last_nid == MAX_NUMNODES)
> 		return NUMA_NO_NODE;
>
> 	nid = __affinity_domain_to_nid(domain_id, last_nid);

So this is pseries fast path. Attempt to look up the Linux node for the
given domain, where last_nid is the highest-numbered node in use so
far. If the result is in [0..last_nid] we're done.

>
> 	if (nid == NUMA_NO_NODE) {
> 		spin_lock(&node_id_lock);

If the lookup fails enter the critical section. As we discussed offline,
this is a precaution for potentially parallel device probing.

> 		/*  recheck with lock held */
> 		nid = __affinity_domain_to_nid(domain_id, last_nid);

Attempt the same lookup again. If the result is in [0..last_nid],
another thread has just initialized the mapping for this domain and
we're done.

> 		if (nid == NUMA_NO_NODE) {
> 			nid = last_nid++;
> 			domain_id_map[nid] = domain_id;
> 		}

If the lookup fails again, "allocate" the next unused Linux node
number. Otherwise use the result returned by the second call to
__affinity_domain_to_nid().

> 		spin_unlock(&node_id_lock);
> 	}
>
> 	return nid;
> }

Generally I agree with this approach. I don't quite get the locking. I
understand there could be a need for a lockless fast path, but as
written I don't think last_nid is appropriately protected - two
slow-path threads could cause an increment to be "lost" since last_nid
is loaded before taking the lock.
