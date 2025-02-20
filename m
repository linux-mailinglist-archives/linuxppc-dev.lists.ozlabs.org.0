Return-Path: <linuxppc-dev+bounces-6366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6415A3D772
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 11:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz9CH4MZ7z30TG;
	Thu, 20 Feb 2025 21:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740048923;
	cv=none; b=OVYjHuvCc7WrKqugjS62dK4SHsLqNIlFKeKTjIM+ex3Q13/+JajZZLbQQ5Jd7m0mPDRLzZNbWcw4gXdpccBnfdPKHAIY3FZAo5+HosMJJR5TQ/1d0l9O95k74UFfdq1hrFpwDfCLQtbXud4eXGWdi53+9pbokmrqLJJYO3mzMDu+n8PaDcVIYJeoGHid3sxBF1E/2OCnaoWU0IAknyc+5ZU7d4ZrPOyPoNFPaRlbi1gsisVzUHeexbe78pKjLesiP/ZioG0kwVmgFC+R5Vaudc1F+62Fq4Dv1cgFmZGsdWR3I2vrU7A5ghcR2Gxa65395dzEoJUsdlG72L50qhTLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740048923; c=relaxed/relaxed;
	bh=ujuHnR76tvpz4/RK1mGB53DPQfOPMqw3IQtytJ4ILFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek1IGfjgY5MVFb6KsYvJMO1i0jsfcWyBgdyXnBNlJHvCuickr+hTw8b7mjFfEKrtWIrGnyFSCxatfhPdhBbyuUZmbRPCcaiw/g07y4uQZEVAGnd1SfWE/taSVVN6/ahKOCJT0YpxUtKkTt2I6anLs7Mv5tfN61GnE1wJLRcVJjyNFxRxy35K5MV5It4A2bwMfz5w7N3mbJnJCybmdr0kQWJFeUBPINyZKTejo+Jxy1Yxgve9qfGXNSgPbD52RZkFXLTVuzEv4SR1fybcW4fbGuZ7ozSTObINAZDhr/Mf1IE1BjExcS73QYM5Aj8zIiu7TCIlMzHKhEV7qIqxcty8Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BCBjE3Mb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BCBjE3Mb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz9CG5b28z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 21:55:22 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K9P5Ko007707;
	Thu, 20 Feb 2025 10:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ujuHnR
	76tvpz4/RK1mGB53DPQfOPMqw3IQtytJ4ILFE=; b=BCBjE3MbWzhhHiXm7FTfNs
	kMYzFZ3jbJ6RpIRvdZRycbPk9IXsF3uSeak3HXGa4CgakTwR2zxVFgwVncxPAslz
	Xe49aKbYy8btQfASk2zgOE/qicxYh9fFYWgXyBjdycn7TJa6xDyiGvYGXrN66SQp
	bBZu+D4oKgQrcnzo+lRV4DUePkocOIhDQKsZWMDGr6AmH7qpA6B/IfFGz5mvCwWj
	G9igAJ56eRrlMJL53PLMjD1iEu5X4cXGfZIFGbPvVGvYvv93MRAh8tB0bQI6h8VM
	iDj/LVK9+ldPBCyv2tq3ACfRN+QA1AhsCev7XijbaEGS3dXD5bChHdhGMzpMt2Kg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44x1qy8cm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:55:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51KArwS1012824;
	Thu, 20 Feb 2025 10:55:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44x1qy8cm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:55:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51K82TDA027050;
	Thu, 20 Feb 2025 10:55:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w0259h9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:55:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51KAtCDD57606480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 10:55:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82FC020043;
	Thu, 20 Feb 2025 10:55:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF1D220040;
	Thu, 20 Feb 2025 10:55:11 +0000 (GMT)
Received: from [9.171.63.18] (unknown [9.171.63.18])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Feb 2025 10:55:11 +0000 (GMT)
Message-ID: <e44c0761-ea50-4c44-b42c-415dffdb441d@linux.ibm.com>
Date: Thu, 20 Feb 2025 11:55:12 +0100
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
Subject: Re: [RFC PATCH v2 0/3] sched/fair: introduce new scheduler group type
 group_parked
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org
References: <20250217113252.21796-1-huschle@linux.ibm.com>
 <cc6996cc-c5c1-429d-ade0-9978b859f207@linux.ibm.com>
From: Tobias Huschle <huschle@linux.ibm.com>
In-Reply-To: <cc6996cc-c5c1-429d-ade0-9978b859f207@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ct2IvKZD6_Q5Diiqy7uyOzOnkv_JcEQ6
X-Proofpoint-ORIG-GUID: vcZh0oNL4zuZdyycl9vyld7y6w1sAvJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200078
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 18/02/2025 06:58, Shrikanth Hegde wrote:
[...]
>>
>> There are a couple of issues and corner cases which need further
>> considerations:
>> - rt & dl:      Realtime and deadline scheduling require some additional
>>                  attention.
> 
> I think we need to address atleast rt, there would be some non percpu 
> kworker threads which need to move out of parked cpus.
> 

Yea, sounds reasonable. Would probably make sense to go next for that one.

>> - ext:          Probably affected as well. Needs some conceptional
>>                  thoughts first.
>> - raciness:     Right now, there are no synchronization efforts. It needs
>>                  to be considered whether those might be necessary or if
>>                  it is alright that the parked-state of a CPU might 
>> change
>>                  during load-balancing.
>>
>> Patches apply to tip:sched/core
>>
>> The s390 patch serves as a simplified implementation example.
> 
> 
> Gave it a try on powerpc with the debugfs file. it works for 
> sched_normal tasks.
> 

That's great to hear!

>>
>> Tobias Huschle (3):
>>    sched/fair: introduce new scheduler group type group_parked
>>    sched/fair: adapt scheduler group weight and capacity for parked CPUs
>>    s390/topology: Add initial implementation for selection of parked CPUs
>>
>>   arch/s390/include/asm/smp.h    |   2 +
>>   arch/s390/kernel/smp.c         |   5 ++
>>   include/linux/sched/topology.h |  19 ++++++
>>   kernel/sched/core.c            |  13 ++++-
>>   kernel/sched/fair.c            | 104 ++++++++++++++++++++++++++++-----
>>   kernel/sched/syscalls.c        |   3 +
>>   6 files changed, 130 insertions(+), 16 deletions(-)
>>
> 


