Return-Path: <linuxppc-dev+bounces-6792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72539A56109
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 07:41:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Gsm5508z309v;
	Fri,  7 Mar 2025 17:41:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741329708;
	cv=none; b=avhfrI3yuPNoq0se6DUhNViXVDc/QueCAUEIWmFocGofwUMg04dTEfnskhlUWiIgqofsktok7Uk11+lzk3R2t4cqrI40y8L2+QWwIagV/gNwJuf0KI+0spMVwHgIGANB9x24IpWj/4PUdjEhVXmVx8TfIoLnK2ZmxIyKjSUT/2HDwnTCp5FBJfxNUROnDZ5T3n02Cv1DGSJ8eb8HNVEoR1nBXihQacZrMuyTcGR0y+OSU616khrPrQ6v6onXOR8+/895ojyIbGiCDzJKB4QNJB2QKRCyHdqo6lWNQwUbl3K8yQT/4D/D7t8EuWwzJZCXcGYIn6AhZjGVJsLz3x6qMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741329708; c=relaxed/relaxed;
	bh=9OjahQcgZi++ijgqmfRadPtCPfSKoh0ixUrNfyNobDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ipin5OQmxReWqpSKruOBCyTb+KGfirrbnB3n/FBvnqo0WbwQ8+YaCm9tQeyaCBz/CIu7XmD8AJu9m1wKZvQeoScjmKrGV/dorsBbvL47WxEsNyEtfttEAHHG0ENrgiuqCff0aqy8nw+diqMS7bhVsRAONDnRvFNcAjCISNYgpMtbGSn/ydlbMeGU6U+saNAukIuFyc2w7cH5QVtTB+bdicCytm36epnTEM9SQolQOeFgmtrgEqF2Xs2i+m2Tgspu6C9oSfMQ75sEKlfvdmqzRf4Ie5+T7PcN9Q4jB5RU+J279s0aFGMgPmZe4IZ6uS68d/Th921coAKYqjcg540YYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V7QYVY0O; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V7QYVY0O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Gsk3kLGz305G
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 17:41:46 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52764aNQ011757;
	Fri, 7 Mar 2025 06:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9OjahQ
	cgZi++ijgqmfRadPtCPfSKoh0ixUrNfyNobDs=; b=V7QYVY0Od/yy7rcd3+6DH9
	mJ+41PxbgsywBEWe37AVEjWpQ2kCJwCkTWqEPH/Z0+c/ucGD+Y8q2bo9/KonMQrF
	zIlD68KRbqeaCdGZEdFV8afDrL0MEOKD1BWz8AM9kbXU/GWkNGicVEML1sHqEbC5
	qNWzb2UJ7yVT1Xw+URKWFjqovkcCOcXz+BrCWdgma7TOKlAaoE23h/io4tRn8XyL
	4j7Qw1WuoQg5YPwnSXmILC//m01DZgdB+wf6p7A0iuqdjAcW0mNYatsDHkqqh7MW
	E4/X2ZggWdjmBOIQTn3CMi9vG9KdFzcrLFQo46dhvpB8qktnebhQtSCg/aen8e9A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457k45a45p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 06:41:41 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5276e8hi000481;
	Fri, 7 Mar 2025 06:41:40 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457k45a45n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 06:41:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52732bTp020794;
	Fri, 7 Mar 2025 06:41:40 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454eskcxaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 06:41:40 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5276fdob38601286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 06:41:39 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C6625805A;
	Fri,  7 Mar 2025 06:41:39 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BC6B58051;
	Fri,  7 Mar 2025 06:41:37 +0000 (GMT)
Received: from [9.124.218.124] (unknown [9.124.218.124])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Mar 2025 06:41:37 +0000 (GMT)
Message-ID: <38858370-c94d-454f-a0b6-ead242f18baf@linux.ibm.com>
Date: Fri, 7 Mar 2025 12:11:35 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] book3s64/radix : Align section vmemmap start address to
 PAGE_SIZE
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>
References: <20250226043426.224494-1-donettom@linux.ibm.com>
 <yq5aeczexo5w.fsf@kernel.org>
 <d4b3fdbc-645f-4a43-bd9c-d29f4e4dacbc@linux.ibm.com>
 <yq5amsdyssr0.fsf@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <yq5amsdyssr0.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9R-KoC0FuPN0ciX8d4V9lHjNO1xjFTLd
X-Proofpoint-GUID: kU-CxtekRxAwZzSH2ZkQHsNMITJi85VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_02,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=914 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070044
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 3/6/25 9:41 AM, Aneesh Kumar K.V wrote:
> Donet Tom <donettom@linux.ibm.com> writes:
>
>> On 3/3/25 18:32, Aneesh Kumar K.V wrote:
>>> Donet Tom <donettom@linux.ibm.com> writes:
>>>
>>>> A vmemmap altmap is a device-provided region used to provide
>>>> backing storage for struct pages. For each namespace, the altmap
>>>> should belong to that same namespace. If the namespaces are
>>>> created unaligned, there is a chance that the section vmemmap
>>>> start address could also be unaligned. If the section vmemmap
>>>> start address is unaligned, the altmap page allocated from the
>>>> current namespace might be used by the previous namespace also.
>>>> During the free operation, since the altmap is shared between two
>>>> namespaces, the previous namespace may detect that the page does
>>>> not belong to its altmap and incorrectly assume that the page is a
>>>> normal page. It then attempts to free the normal page, which leads
>>>> to a kernel crash.
>>>>
>>>> In this patch, we are aligning the section vmemmap start address
>>>> to PAGE_SIZE. After alignment, the start address will not be
>>>> part of the current namespace, and a normal page will be allocated
>>>> for the vmemmap mapping of the current section. For the remaining
>>>> sections, altmaps will be allocated. During the free operation,
>>>> the normal page will be correctly freed.
>>>>
>>>> Without this patch
>>>> ==================
>>>> NS1 start               NS2 start
>>>>    _________________________________________________________
>>>> |         NS1               |            NS2              |
>>>>    ---------------------------------------------------------
>>>> | Altmap| Altmap | .....|Altmap| Altmap | ...........
>>>> |  NS1  |  NS1   |      | NS2  |  NS2   |
>>>>
>>>                               ^^^ this should be allocated in ram?
>>>
>> Yes, it should be allocated from RAM. However, in the current
>> implementation, an altmap page gets allocated. This is because the
>> NS2 vmemmap section's start address is unaligned. There is an
>> altmap_cross_boundary() check. Here, from the vmemmap section
>> start, we identify the namespace start and check if the namespace start
>> is within the boundary. Since it is within the boundary, it returns false,
>> causing an altmap page to be allocated. During the PTE update, the
>> vmemmap start address is aligned down to PAGE_SIZE, and the PTE is
>> updated. As a result, the altmap page is shared between the current
>> and previous namespaces.
>>
>> If we had aligned the vmemmap start address, the
>> altmap_cross_boundary() function would return true because the
>> vmemmap section's start address belongs to the previous
>> namespace. Therefore normal page gets allocated. During the
>> PTE set operation, since the address is already aligned, the
>> PTE will updated.
>>
> So the nvdimm driver should ensure that alignment right? I assume other things
> will also require that to be properly aligned.?

  #cat /proc/iomem
00000000-63ffffffff : System RAM
40340000000-403401fffff : namespace1.0
40340200000-403a0ffffff : dax1.0
403a1000000-403a11fffff : namespace1.1
403a1200000-40401ffffff : dax1.1
40402000000-404021fffff : namespace1.2
40402200000-40462ffffff : dax1.2
40463000000-404631fffff : namespace1.3
40463200000-404c3ffffff : dax1.3
  #

I have created 4 namespaces with a size of 1552M. As you can see, the 
start of
namespace1.0 is 1G aligned, while namespace1.1, namespace1.2, and 
namespace1.3
are not 1G aligned. If I had created the namespace with a size of 1536M 
(1.5G), then
all the namespaces would have started 1G aligned.

I believe that based on the size we are requesting, the namespaces 
alignments are
being created. They do not always need to be 1G aligned.

Now, if we calculate the vmemmap start for namespace1.1..

Phy start - 0x403a1000000
pfn start - 0x403a1000000 / PAGE_SIZE = 0x403a100

vmemmap start = 0xc00c000000000000 + (0x403a100 * 0x40)
                           =0xC00C000100E84000

This address is not page aligned. This will trigger this issue.

>
> -aneesh

