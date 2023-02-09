Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25421690EEF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 18:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCNhM5zkKz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 04:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ExZpBqW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ExZpBqW5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCNgM6Vptz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 04:11:11 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319GlnUe020847
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 17:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=swq8aQCWbHbxeubT9CKhfy/tHLdFZwpVDrxQaQmXJhc=;
 b=ExZpBqW5MJGK1GQeDqlYH9iUXr4w/069xagDO5qMF2VUaKOwL8yuwQutBYKcsFALq9dc
 rG29dTgTNWaA3NjHRypd+xBMiYQJTgHddpopvgBQsR4pBjbap5jsTqXG0FaHR02++41n
 +OwDiKGBh16ywpqCYJLw7EgM0qQcssKKq5moiQBygrozTfr2OiLWLk2vmOeo6QLfrrQJ
 xIISwgmTme7+fys3UfYD9UIBoS6nb24sGWoSzdnPMtWLwzNBkhqcFlgcU/CCxYaeKebM
 hotEt4D4wrHQC4rniJZngz9Q5mQ409pA1APnSX5SiQQP7AcV8iT1F/+t9Wt9fp/rrdX2 IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn4nkgvhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 17:11:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319GoOKL000776
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 17:11:07 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn4nkgvh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 17:11:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319H0dIK027478;
	Thu, 9 Feb 2023 17:11:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3nhf083aka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 17:11:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 319HB5ZW62259466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Feb 2023 17:11:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 842A658060;
	Thu,  9 Feb 2023 17:11:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 722305803F;
	Thu,  9 Feb 2023 17:11:05 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Feb 2023 17:11:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fix device node refcounting
In-Reply-To: <c00d492c-2b40-0fb8-b20f-8720903336c2@linux.vnet.ibm.com>
References: <20230201195856.303385-1-brking@linux.vnet.ibm.com>
 <87zg9po6db.fsf@linux.ibm.com>
 <c00d492c-2b40-0fb8-b20f-8720903336c2@linux.vnet.ibm.com>
Date: Thu, 09 Feb 2023 11:11:05 -0600
Message-ID: <87o7q2ahna.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OcY0xM9VoY92j8rIPs8nV721xYruKh8A
X-Proofpoint-GUID: SB8oo6oPkJljhkXp006CnxgnyWxpNsh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_13,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090162
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

Brian King <brking@linux.vnet.ibm.com> writes:
> On 2/7/23 9:14 AM, Nathan Lynch wrote:
>> Brian King <brking@linux.vnet.ibm.com> writes:
>>> While testing fixes to the hvcs hotplug code, kmemleak was reporting
>>> potential memory leaks. This was tracked down to the struct device_node
>>> object associated with the hvcs device. Looking at the leaked
>>> object in crash showed that the kref in the kobject in the device_node
>>> had a reference count of 1 still, and the release function was never
>>> getting called as a result of this. This adds an of_node_put in
>>> pSeries_reconfig_remove_node in order to balance the refcounting
>>> so that we actually free the device_node in the case of it being
>>> allocated in pSeries_reconfig_add_node.
>> 
>> My concern here would be whether the additional put is the right thing
>> to do in all cases. The questions it raises for me are:
>> 
>> - Is it safe for nodes that were present at boot, instead of added
>>   dynamically?
>
> Yes. of_node_release has a check to see if OF_DYNAMIC is set. If it is not set,
> the release function is a noop.

Yes, but to be more specific - does the additional of_node_put() risk
underflowing the refcount on nodes without the OF_DYNAMIC flag? I
suspect it's OK. If it's not, then I would expect to see warnings from
the refcount code when that case is exercised.

>
>> - Is it correct for all types of nodes, or is there something specific
>>   to hvcs that leaves a dangling refcount?
>
> I would welcome more testing and I shared the same concern. I did do some
> DLPARs of a virtual ethernet device with the change along with CONFIG_PAGE_POISONING
> enabled and did not run into any issues. However if I do a DLPAR remove of a virtual
> ethernet device without the change with kmemleak enabled it does not detect any
> leaked memory.

Seems odd. If the change is generically correct, then without it applied
I would expect kmemleak to flag a leak on removal of any type of
dynamically-added node. On the other hand, if the change is for some
reason not correct for virtual ethernet devices, then I would expect it
to cause complaints from the refcount code and/or allocator debug
facilities. But if I understand correctly, neither of those things is
happening.
