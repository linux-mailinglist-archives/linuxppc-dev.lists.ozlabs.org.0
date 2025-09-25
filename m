Return-Path: <linuxppc-dev+bounces-12578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B468B9F869
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 15:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXZ9V06Rtz2yrm;
	Thu, 25 Sep 2025 23:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758806477;
	cv=none; b=ZHi1wRFD4Yfpaa7bw/xLyfcx8yV30gC7MrNQy130QeVdCxEzIyi4QZN3uh08O/r7B4A+ggbf44C2x9KhYTaHXc0/SODBoH0bgz/pHDY4x7TRXz9Rwc68GoRHr+QexkuKVQR5XH6Sfsmu0FWECVwhvuKvQu6tRL/O+lpa5B6j2iPX20AoE8U44rpJk7S3ImkZt2E/g8PmZryPBLBQjm9bPMiZZOrJOBNvSqAMqGeqkEvkBp4W6cUNl32SAmDOMpCckgz/HnNqdGi0LSJdsRwgBQyuE+S81aM73/46c+eCYucUoPspUxgp7V2SznUrt6cjBBQMwZlIT9667VwSrvZd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758806477; c=relaxed/relaxed;
	bh=izGvxpR8RQZ9UpXF9e+lyp0j6l+qKVnb1xtnr65Pjm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A062uW3L6ZWFOtoDzGeja7zrlw6Ikyj+dNYTKHNNdSihlceSNWim/2f3MaC48wv9ouv4vZt5jCNZVJ39uDb7CvX7Ip2nhSqhd3tLgBaiVozASkRt7lC5O2X5YsYBFzpRIOB1S753rbnabH60FYB/eSbQAGgmdQDKI/+tqUp954AdxRz0ANPYFY2Mq+76veBdCdz8X4ByC8X3msDQyU3ycKtBHm5EioHoN1bY9Vo0Qz7P8cAQZLFUSl3gSw3sJy0Gw2JbGHDAzECYZoJrbJySzjjEoiJLDrCuS2mDi0L9tNQLlmy6gdgpUNUZhnsy+Q0hu4+EYaSa/4L2dDHGkcBx9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RvCZUGSH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RvCZUGSH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXZ9S1NRTz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 23:21:15 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PDExM2005703;
	Thu, 25 Sep 2025 13:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=izGvxp
	R8RQZ9UpXF9e+lyp0j6l+qKVnb1xtnr65Pjm4=; b=RvCZUGSHSijPR3Rl6QKtJo
	Y4c2jWVDdC07PZOkjbCMFbNW/7I32sapNM+wvF6CN1UfwzE+HCajs/AQQQPGg0ew
	b+GUDup5GVZAzoDODHp31sDqNuNdRXNK5U0s8oqSOEzah9Y0yTC4v7V3dGT1ICN1
	Q+giwkCYFtY5u/KL41nMuioTNEy0MYMV1B0KNmetDXQjZTY+uCyIppNdr6sFY3nv
	WrAumX6TFKpNBpH+Af/3yiTexayGyVEHDIL+8hCRt6Zp0uQMAIKScYTowPL2UiIq
	kWKYpP/XqEo2lUYRABJX39lhPmJcU50jM6kvfmYtmce/e7PtyT0lhPB6Aeh6L1/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499kwyw0uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:20:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58PD4HVp004982;
	Thu, 25 Sep 2025 13:20:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499kwyw0uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:20:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58PA862L019671;
	Thu, 25 Sep 2025 13:20:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a83kdyds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:20:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58PDKseh27722280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 13:20:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A57C758061;
	Thu, 25 Sep 2025 13:20:54 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E2AA58057;
	Thu, 25 Sep 2025 13:20:49 +0000 (GMT)
Received: from [9.39.30.226] (unknown [9.39.30.226])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Sep 2025 13:20:49 +0000 (GMT)
Message-ID: <3ad7a1b6-eaba-4e1e-aa27-b6c9260ddc68@linux.ibm.com>
Date: Thu, 25 Sep 2025 18:50:47 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers/base/node: merge register_one_node() and
 register_node() to a single function.
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
 <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J5Cq7BnS c=1 sm=1 tr=0 ts=68d541b9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=VYFwuNkCapB6VMV0qykA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: eMJ9kfsTgBHfUA6tVjsPD_AWFt_ZESvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNSBTYWx0ZWRfX+DZTcBF17QFy
 MJGsSw1/Ma0YcTsS42Ta3NR9/1joRq7IOGTZXo+cwc7aZJbzUJaXRGPwCwXFwuM+5/jWjBD3dGt
 Tk3EDAfcN5i38vmODxWFcPGltZX9kTTCvdfCWV5Z2NlFgWxLa3oNm8+pcfJStpZdKE4Gwq4VzTW
 sJkAMrOXpfc63gthcVes50j/iqweKkELJ+x7YU7uusmeyGQQM4aLq2c9fE6Q/+dJnIN9dW6NSqH
 AuG+1nW9L2yAudJXxgTbhdYL5s28+10xdlW+KchgLU06UsGP3EjqQ3uF17XkO5GnpYdm+UdF2lJ
 oJQnlNNoBPLQbNRziKFEx7Bv4ftMtntnWH6VzCAs+NzzZ999TiM1Wk2/8vuMLaY4Zv54febI3Ms
 KxIRK8rA
X-Proofpoint-ORIG-GUID: Dk6YoM9jUnqj7o99btFxGm_iPC6WbMWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200015
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/25/25 2:24 PM, David Hildenbrand wrote:
> On 24.09.25 20:40, Donet Tom wrote:
>> register_one_node() and register_node() are small functions.
>> This patch merges them into a single function named register_node()
>> to improve code readability.
>>
>> No functional changes are introduced.
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>
> [...]
>
>>   /**
>>    * unregister_node - unregister a node device
>>    * @node: node going away
>> @@ -869,7 +842,13 @@ void 
>> register_memory_blocks_under_node_hotplug(int nid, unsigned long 
>> start_pfn,
>>   }
>>   #endif /* CONFIG_MEMORY_HOTPLUG */
>>   -int register_one_node(int nid)
>> +/*
>
> We can directly convert this to proper kernel doc by using /**
>
Sure I will add it.


>
>> + * register_node - Setup a sysfs device for a node.
>> + * @nid - Node number to use when creating the device.
>> + *
>> + * Initialize and register the node device.
>
> and briefly describing what the return value means
>
> "Returns 0 on success, ..."
>
Sure

>> + */
>> +int register_node(int nid)
>>   {
>>       int error;
>>       int cpu;
>> @@ -880,14 +859,23 @@ int register_one_node(int nid)
>>           return -ENOMEM;
>>         INIT_LIST_HEAD(&node->access_list);
>> -    node_devices[nid] = node;
>>   -    error = register_node(node_devices[nid], nid);
>> +    node->dev.id = nid;
>> +    node->dev.bus = &node_subsys;
>> +    node->dev.release = node_device_release;
>> +    node->dev.groups = node_dev_groups;
>> +
>> +    error = device_register(&node->dev);
>>       if (error) {
>> -        node_devices[nid] = NULL;
>
> Wondering why we did have this temporary setting of the node_devices[] 
> in there. But I cannot immediately spot why it was required.


node_devices[] is used in many places to access node data.

In the previous code, immediately after allocating the node

structure, it was stored in node_devices[]. On error paths, we

were clearing the node structure entry from node_devices[].


With the new code, the node structure is now stored in node_devices[]

only after the device has been registered, and just before calling

register_cpu_under_node(), since node_devices[] is accessed inside

that function.


It is also used outside of node.c, in hugetlb_register_all_nodes() .

Do you think we could use a different mechanism instead of this?


