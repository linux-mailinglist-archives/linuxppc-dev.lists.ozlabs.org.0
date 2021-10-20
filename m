Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4043515C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 19:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZHn92Rgtz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 04:35:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kAInaLaM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kAInaLaM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZHmQ5lTPz2xt1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 04:34:30 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KGpd3a026681; 
 Wed, 20 Oct 2021 13:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ysXRIWmjWphjDITdTxf/YEnu3zprC2ODZVHoDw9T4pc=;
 b=kAInaLaM8mdVQX/nM8tWZrNo9qVMacgrc3PQCeFUtHkMIdAgrmqsG0i5La6DkHW05D97
 8lUlvRMhSZ9xY6p/AAAQXX3To9jZ/mwXpVAe+87bRoodtNSgF85XSiaxFdxjBlX/r7Lq
 B77qTg1VrDhBsvjc417e+NYvmzkbeLowDeLXmIn64iZ2pFmWfIz1E2WIfecuQv4uyPzp
 3JeHDXvLy9gePXRkQh5gTs3HgnAWddDYnN8qz4r73xMxSpWwtWGzSHtw4wRveJaEelqR
 +9lk9PGqv0/HSXnac2ItUYFfL1E9iubE/yJ4Xf6RKpr4zfQ56kr+AXhqxaJoBigd9Fyp sg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btpg71q1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 13:34:25 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KHHWun028239;
 Wed, 20 Oct 2021 17:34:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3bqpcc65ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:34:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KHYMsX34472378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 17:34:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C468C605A;
 Wed, 20 Oct 2021 17:34:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BE03C605B;
 Wed, 20 Oct 2021 17:34:21 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 17:34:21 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore ibm, platform-facilities
 updates
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
 <87zgr4y9x4.fsf@linux.ibm.com>
 <669cb321-7e7f-e45b-a7a1-7002d8371080@linux.ibm.com>
 <87r1cfy9m8.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <718b4eb3-f001-d5c3-c238-69f49f750ec5@linux.ibm.com>
Date: Wed, 20 Oct 2021 10:34:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1cfy9m8.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: INZNRBEI4ZJQvmLwD-sIGWV_g4BAD7fC
X-Proofpoint-ORIG-GUID: INZNRBEI4ZJQvmLwD-sIGWV_g4BAD7fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200098
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/20/21 8:54 AM, Nathan Lynch wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 10/19/21 2:36 PM, Nathan Lynch wrote:
>>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>>> On 10/18/21 9:34 AM, Nathan Lynch wrote:
>>>>> On VMs with NX encryption, compression, and/or RNG offload, these
>>>>> capabilities are described by nodes in the ibm,platform-facilities device
>>>>> tree hierarchy:
>>>>>
>>>>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>>>   ├── ibm,compression-v1
>>>>>   ├── ibm,random-v1
>>>>>   └── ibm,sym-encryption-v1
>>>>>
>>>>>   3 directories
>>>>>
>>>>> The acceleration functions that these nodes describe are not disrupted by
>>>>> live migration, not even temporarily.
>>>>>
>>>>> But the post-migration ibm,update-nodes sequence firmware always sends
>>>>> "delete" messages for this hierarchy, followed by an "add" directive to
>>>>> reconstruct it via ibm,configure-connector (log with debugging statements
>>>>> enabled in mobility.c):
>>>>>
>>>>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:4294967285
>>>>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:4294967284
>>>>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1:4294967283
>>>>>   mobility: removing node /ibm,platform-facilities:4294967286
>>>>>   ...
>>>>>   mobility: added node /ibm,platform-facilities:4294967286
>>>>
>>>> It always bothered me that the update from firmware here was an delete/add at
>>>> the entire '/ibm,platform-facilities' node level instead of update properties
>>>> calls. When I asked about it years ago the claim was it was just easier to pass
>>>> an entire sub-tree as a single node add.
>>>
>>> Yes, I believe this is for ease of implementation on their part.
>>
>> I'd still argue that a full node removal or addition is a platform
>> reconfiguration on par with a hotplug operation.
> 
> Well... I think we might be better served by a slightly more flexible
> view of things :-) These are just a series of messages from firmware
> that should be considered as a whole, and they don't dictate exactly
> what the OS must do to its own data structures. Nothing mandates that
> the OS immediately and literally apply the changes as they are
> individually reported by the update-nodes sequence.

Agree to disagree. Not saying we can do much about it here, but I think being
flexible leads to scope creep down the road that may eventually complicate
things worse. A node removal doesn't guarantee an immediate node addition. So we
are just papering over the issue with a plan to paper over it some more in a
more complicated fashion.

> 
> Anyway, whether the firmware behavior is reasonable is sort of beside
> the point since we're stuck with it.

I'm aware. Moaning for the sake of moaning about it.

> 
> 
>>>>> This is because add_dt_node() -> dlpar_attach_node() attaches only the
>>>>> parent node returned from configure-connector, ignoring any children. This
>>>>> should be corrected for the general case, but fixing that won't help with
>>>>> the stale OF node references, which is the more urgent problem.
>>>>
>>>> I don't follow. If the code path you mention is truly broken in the way you say
>>>> then DLPAR operations involving nodes with child nodes should also be
>>>> broken.
>>>
>>> Hmm I don't know of any kernel-based DLPAR workflow that attaches
>>> sub-trees i.e. parent + children. Processor addition attaches CPU nodes
>>> and possibly cache nodes, but they have sibling relationships. If you're
>>> thinking of I/O adapters, the DT updates are (still!) driven from user
>>> space. As undesirable as that is, that use case actually works correctly
>>> AFAIK.
>>>
>>> What happens for the platfac LPM scenario is that
>>> dlpar_configure_connector() returns the node pointer for the root
>>> ibm,platform-facilities node, with children attached. That node pointer
>>> is passed from add_dt_node() -> dlpar_attach_node() -> of_attach_node()
>>> -> __of_attach_node(), where its child and sibling fields are
>>> overwritten in the process of attaching it to the tree.
>>
>> Well it worked back in 2013 when I got all the in kernel device tree update
>> stuff working. Looks like I missed this one which now explains one area where
>> platform-facilities update originally went to shit.
>>
>> commit 6162dbe49a451f96431a23b4821f05e3bd925bc1
>> Author: Grant Likely <grant.likely@linaro.org>
>> Date:   Wed Jul 16 08:48:46 2014 -0600
>>
>>     of: Make sure attached nodes don't carry along extra children
>>
>>     The child pointer does not get cleared when attaching new nodes which
>>     could cause the tree to be inconsistent. Clear the child pointer in
>>     __of_attach_node() to be absolutely sure that the structure remains in a
>>     consistent layout.
>>
>>     Signed-off-by: Grant Likely <grant.likely@linaro.org>
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index c875787fa394..b96d83100987 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -98,6 +98,7 @@ int of_property_notify(int action, struct device_node *np,
>>
>>  void __of_attach_node(struct device_node *np)
>>  {
>> +       np->child = NULL;
>>         np->sibling = np->parent->child;
>>         np->allnext = np->parent->allnext;
>>         np->parent->allnext = np;
>>
>> Not sure what the reasoning was here since this prevents attaching a node that
>> is a sub tree. Either need to revert that, rewrite dlpar_attach_node to iterate
>> over the sub-tree, or probably best rewrite dlpar_configure_connector to use a
>> of_changeset instead.
> 
> Good find. I'd guess that adding a subtree used to sort of work, except
> that children of np were not added to the allnext list, which would
> effectively hide them from some lookups.

Pretty sure allnodes/allnext list is a relic of the past. It guaranteed depth
first traversal after boot, but dynamic nodes broke that guarantee. It was
removed because you can make the same traversal via the parent<->child lists.

> 
> Regardless, yes, the pseries code needs to change to attach and detach
> nodes individually. I don't think the OF core supports more complex
> changes.
> 

Indeed. I clearly capitalized on the behavior at the time while missing the
intended usage.

-Tyrel



