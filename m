Return-Path: <linuxppc-dev+bounces-12579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89281B9F88C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 15:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXZBk3FtQz30Ng;
	Thu, 25 Sep 2025 23:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758806542;
	cv=none; b=mJxxs+ErBs6AqyTo9crks2o+x23bjXU6YEnuannykT5K1x/wy2NrnsHUzRTmMf/X0//6c8Z1AAVNc4C6PgCCoVpyVxGR5amhYZCmy/nYYe2GNt1C7vtWCIvsxMAUoPhRSQCyK6K2XjqZu9d+eF19316cxgYFHkff1cP5J1+dAbEmfI1970t0wACS60Jym7Bzyu1BXPHAqKjKZ5ekJI7EbR2aii+FBjbKDiF2DM0CR22x9UK9ipDFdjbQNWhhCTEtjbxZxqcDMywXLuiaMo2YRVowVa/3ORLM0HS23jWAMsZuSQgnvky9Ucb/Gq6tiymVvwQnwwid1+k3doK/LTrvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758806542; c=relaxed/relaxed;
	bh=ia1/4RPTVr5lEOH9EgydCuHgeKLgDIxOVSwAP9XSPBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nzp19rXkEw/O0rcQX014rl5Xgc+DnP3SUUA54DSVnC3wvMR2CC+098hRlO9Idr7DA6kr3ZK0zr8JUDnvhWG92kdO8/RvCOKNBR/q5R5t7lFzixFhBARum/XmLeaX5X7k3Ob8Dsis1A+WnuOkAFyixyTmMYmQnSjjaPuVleZOx8AS9dNq2bLEb3D2KlH6Q+nd/ghb0nDLHBbQD1pehb/pyYwQcQPF664XhgddVVWCuLldk2+nhXkuSrT5VMSz/5drwRZcKt3IkAowI07GXhnojTpy9AJpvyKa2Jj5H2NBbaVRTG1GoL8CiPtC+GnZ6oYrCMYan1vsbLV3lV0M86kTKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qiGxjWcH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qiGxjWcH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXZBj4Rryz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 23:22:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4O0A1021262;
	Thu, 25 Sep 2025 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ia1/4R
	PTVr5lEOH9EgydCuHgeKLgDIxOVSwAP9XSPBw=; b=qiGxjWcHB9EMO3wjfXOoNk
	Mr9r8KQDe76QddxPs9VXdPfJQ9rO77jnLeVExDPYwKqOgYiMeUdPk5ZSsdGjxgyx
	czyJDBxVBi4o7pYSS59eJvJJ7O/lCuZ1N/IaYa6CVkJRvHRKrHl2NsXm/Po+b9wv
	WGT0SZTRVb1c1XMWbO4pzwKuTePt6SBVCVwlmGfqRrK+y2YK8oPwxd7UYWx49XME
	Ahd8sNKw0oBgdfKUH5uR7veU3WNaO7SE1knduUZPS/RyaYLRYOsxVlLkeV8UPyGl
	2pDnRhPuSt/7lkmyFfiQ9VwgKBS1r6iHywUlLpff4b4TgoGgCTDyMasppqKIECPg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499hpqnbyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:22:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58PDFLwJ022612;
	Thu, 25 Sep 2025 13:22:06 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499hpqnbyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:22:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58PCZZNN008826;
	Thu, 25 Sep 2025 13:22:05 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a6yy66wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 13:22:05 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58PDM4Nh7471794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 13:22:04 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31DAA58058;
	Thu, 25 Sep 2025 13:22:04 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADC445805D;
	Thu, 25 Sep 2025 13:21:58 +0000 (GMT)
Received: from [9.39.30.226] (unknown [9.39.30.226])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Sep 2025 13:21:58 +0000 (GMT)
Message-ID: <5fa436bd-2cea-4958-8a0a-ac636595a974@linux.ibm.com>
Date: Thu, 25 Sep 2025 18:51:57 +0530
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
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Dave Jiang <dave.jiang@intel.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
 <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
 <aNUMnK23qKTjgEdO@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aNUMnK23qKTjgEdO@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=FrEF/3rq c=1 sm=1 tr=0 ts=68d541ff cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=4V8e3p56BTpXgw00i4MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JxDWaNRkxF6Qy8ZF0itz_n9KFqDcMh5m
X-Proofpoint-GUID: eFhaTNISHQyCqaBy1Lml0RWiZV5isRK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNCBTYWx0ZWRfX8HWeJU6DODxO
 mVDGFoZYhbxVlQ42sMVXhcMo1em/K1n/asrIZtm22eEauoGI2b+tljf5OPYm7mCo89NR0AiNVeA
 b5jCUQnfGSxBxmx3Ze5g9gKB5ZVRCq925XpPOgVE990hkJ1OGkeiUgBwSEw3MCJvsD4sJP/CgE7
 KmipbmGqy8j0TU3bqN5yDenmgBOqwd2838nYCAV989pTuQHkTCOhtJ5iRFnVDJQck6vCeyoo04G
 zluW2Ml2x6ZMSM+Su5PLZUsDK/tAU7bKf7VgB8uL13+TtySUavFIT7dfCcDAUsa/k+eZGEGZJmw
 KmcTgbAn7PVX6TY6pcwjxM+JNqY/FsdvpIgoDh4vyqsniAcKnvzrrVbleLD+hixPXdjqFolNu8R
 iSpNXE6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/25/25 3:04 PM, Mike Rapoport wrote:
> On Thu, Sep 25, 2025 at 10:54:07AM +0200, David Hildenbrand wrote:
>> On 24.09.25 20:40, Donet Tom wrote:
>>> register_one_node() and register_node() are small functions.
>>> This patch merges them into a single function named register_node()
>>> to improve code readability.
>>>
>>> No functional changes are introduced.
>>>
>>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>> ---
>> [...]
>>
>>>    /**
>>>     * unregister_node - unregister a node device
>>>     * @node: node going away
>>> @@ -869,7 +842,13 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
>>>    }
>>>    #endif /* CONFIG_MEMORY_HOTPLUG */
>>> -int register_one_node(int nid)
>>> +/*
>> We can directly convert this to proper kernel doc by using /**
>>
>>> + * register_node - Setup a sysfs device for a node.
>>> + * @nid - Node number to use when creating the device.
>>> + *
>>> + * Initialize and register the node device.
>> and briefly describing what the return value means
>>
>> "Returns 0 on success, ..."
> For kernel-doc it should be
>
> Return: 0 on success, ...
>

Sure I will change it.


>
>>> + */
>>> +int register_node(int nid)
>>>    {
>>>    	int error;
>>>    	int cpu;
>>> @@ -880,14 +859,23 @@ int register_one_node(int nid)
>>>    		return -ENOMEM;
>>>    	INIT_LIST_HEAD(&node->access_list);
>>> -	node_devices[nid] = node;
>>> -	error = register_node(node_devices[nid], nid);
>>> +	node->dev.id = nid;
>>> +	node->dev.bus = &node_subsys;
>>> +	node->dev.release = node_device_release;
>>> +	node->dev.groups = node_dev_groups;
>>> +
>>> +	error = device_register(&node->dev);
>>>    	if (error) {
>>> -		node_devices[nid] = NULL;
>> Wondering why we did have this temporary setting of the node_devices[] in
>> there. But I cannot immediately spot why it was required.
> register_cpu_under_node() references node_devices, so that assignment can
> be moved just before the loop that adds CPUs to node.


Sure.

Thank you


>   
>> -- 
>> Cheers
>>
>> David / dhildenb
>>

