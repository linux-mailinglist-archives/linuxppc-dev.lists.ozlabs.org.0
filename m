Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4C691374
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 23:37:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCWwJ2Rz7z3f4W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:37:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1p4N2jZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1p4N2jZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCWvK4kmkz3bf7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 09:37:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319MXS7D005816
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 22:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+g1b5lKQiOEKGCj4r5Peo9NMIwzAi4vEoVfO9vBiLFo=;
 b=a1p4N2jZtzTppB4Bcpbv9jBaCvErHHxQQWjghXjdxx4hKYaiNCUGMqi7rjwYfOS7+UpT
 GzbQk1dU18VppRmcxOXhqelk0lijIplS7gerBThQiJIgu9wtYPGaYiCvSC82jGUys0ys
 CfVPHHOBhc6ujXBubBz7nt3SGL4B97zLyb+myU4C8Rm66tuM/rKDAyaFOXxNRdqu5Pqw
 F0/YG/lapP1BJ16eu5wvz7uAUsebiWZ9Vm82q5aFpOp8CU3q/Z1KuccRyPsu/QJwCzKo
 C5mtWzB2AJUOKZbH0rVkvrdzBrhqueK9hV9H2p1KakPcMeVYX7jxzH9wBJ8ejH0wFCBp Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn9qvr5n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 22:36:56 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319MYXok008916
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 22:36:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn9qvr5mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 22:36:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319LakRA019586;
	Thu, 9 Feb 2023 22:36:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nhf08bdkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 22:36:54 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 319Map9Y2228896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Feb 2023 22:36:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD53D58069;
	Thu,  9 Feb 2023 22:36:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79D4458067;
	Thu,  9 Feb 2023 22:36:51 +0000 (GMT)
Received: from [9.211.68.107] (unknown [9.211.68.107])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Feb 2023 22:36:51 +0000 (GMT)
Message-ID: <07d86969-5a02-db96-42a1-49dac8a09e15@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2023 16:36:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc: Fix device node refcounting
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20230201195856.303385-1-brking@linux.vnet.ibm.com>
 <87zg9po6db.fsf@linux.ibm.com>
 <c00d492c-2b40-0fb8-b20f-8720903336c2@linux.vnet.ibm.com>
 <87o7q2ahna.fsf@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <87o7q2ahna.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t10by_eJM7IMkQopfQpBVBXn-L-aK5dG
X-Proofpoint-ORIG-GUID: 2RXerTNaq9CUl_CmAzU5U9kwc5XQoD5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090204
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, mmc@linux.vnet.ibm.com, nnac123@linux.ibm.com, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/9/23 11:11 AM, Nathan Lynch wrote:
> Brian King <brking@linux.vnet.ibm.com> writes:
>> On 2/7/23 9:14 AM, Nathan Lynch wrote:
>>> Brian King <brking@linux.vnet.ibm.com> writes:
>>>> While testing fixes to the hvcs hotplug code, kmemleak was reporting
>>>> potential memory leaks. This was tracked down to the struct device_node
>>>> object associated with the hvcs device. Looking at the leaked
>>>> object in crash showed that the kref in the kobject in the device_node
>>>> had a reference count of 1 still, and the release function was never
>>>> getting called as a result of this. This adds an of_node_put in
>>>> pSeries_reconfig_remove_node in order to balance the refcounting
>>>> so that we actually free the device_node in the case of it being
>>>> allocated in pSeries_reconfig_add_node.
>>>
>>> My concern here would be whether the additional put is the right thing
>>> to do in all cases. The questions it raises for me are:
>>>
>>> - Is it safe for nodes that were present at boot, instead of added
>>>   dynamically?
>>
>> Yes. of_node_release has a check to see if OF_DYNAMIC is set. If it is not set,
>> the release function is a noop.
> 
> Yes, but to be more specific - does the additional of_node_put() risk
> underflowing the refcount on nodes without the OF_DYNAMIC flag? I
> suspect it's OK. If it's not, then I would expect to see warnings from
> the refcount code when that case is exercised.

Agreed. I have not seen any refcount underflow warnings in the testing I've done
so far.

> 
>>
>>> - Is it correct for all types of nodes, or is there something specific
>>>   to hvcs that leaves a dangling refcount?
>>
>> I would welcome more testing and I shared the same concern. I did do some
>> DLPARs of a virtual ethernet device with the change along with CONFIG_PAGE_POISONING
>> enabled and did not run into any issues. However if I do a DLPAR remove of a virtual
>> ethernet device without the change with kmemleak enabled it does not detect any
>> leaked memory.
> 
> Seems odd. If the change is generically correct, then without it applied
> I would expect kmemleak to flag a leak on removal of any type of
> dynamically-added node. On the other hand, if the change is for some
> reason not correct for virtual ethernet devices, then I would expect it
> to cause complaints from the refcount code and/or allocator debug
> facilities. But if I understand correctly, neither of those things is
> happening.

Agreed. I'll do some more testing with and without the change and see
what that yields.

-Brian


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center


