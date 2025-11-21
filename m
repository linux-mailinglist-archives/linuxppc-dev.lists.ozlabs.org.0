Return-Path: <linuxppc-dev+bounces-14401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21590C7741D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 05:40:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCMwh0LVlz2yrg;
	Fri, 21 Nov 2025 15:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763700051;
	cv=none; b=X+l5mCjtOa+Se9bXp4+ZyEutgjs0/11FFq2BeUoCP7DWk4UZcrc1h3wGzBnxPzwaYYa95X0ZWBPKpjZ3WESEiiC6Gc/pwlY+DragNZh34c6JEzOUD71OPZmVNEhYF530ihjJjDP3bqn8IyINxWwUkYQD1GQ7kRwu7sevXscyd0jlL/viYRlqT2jUBR8XQZv5tlaWUiysrUiVRiEGfLJJ1bxJ+KdVbmRLZdQO2NNzmKMazyouGqarNNztwxNaRflWiBca2dWPLY+Qbr0MdPv4s2OdOrFGmhInEkNWQ4LhKzpx3Dp16QE3HpAoke0wNKWCDHOrTbtMpwLYzFLn+fXT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763700051; c=relaxed/relaxed;
	bh=EJJhc5g3TuV96XyqC8Zrby265i0biLPN3jNby3Folq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XihrRhtWstAsKqZqM2nN9wmif41YrMXlDqbec97dFPMnA3EhXeoTCRfzIXx6VVevT6UJUsCxKJktsxgdjGlOlm152opY41HbBKfJC8lYHyT3lGcAlgYC6oC77UcSSyrqc+kgclNzlsO/0juGEfftRVSuJg5zo7WUtSYHbKxGhJTOpg7hY7XYKsJdX+xMIqU5EJqZzvklZRZMiGmktGmLtfxpjng4nSy9T0b7N/bf2sLtoe1nYHZPY3D362TA9HPT3duwaq/9A0G1X9sGke6zLRsxC7jS8A1AV+XglyBSQp3kbm5blqQQo98p/thT0+egAX9RB4coxkJdxAkDWorZnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BXz2GOSs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BXz2GOSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCMwf6jn5z2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 15:40:49 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKKKi3T029273;
	Fri, 21 Nov 2025 04:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EJJhc5
	g3TuV96XyqC8Zrby265i0biLPN3jNby3Folq0=; b=BXz2GOSsMjNBp4Ec8wZvX0
	JRweDrLmiDhqNyumnzd0Sr+SdKQdGISHe6BY3GA7j8By/qR2wVhwmTQkKNKYmtrv
	GRh6ooYqg4vk2fpDobo/9arbnts11UcV+MT8hnyXoTskzaewFmShFaGqR93ItvUO
	BPwhdcLMUe5GXnsjN9VK+srphe0SqU4T4wqxS8H1k52DwUDfIWWXsu5jniNyZZdy
	qvBnj1tpz8YwICEsTjrDgt3Zh7LC5+PluBB9bfffce4CpwrjLZNPfL/gQDLzAtAG
	vBI3Y+XZB7kZda6F5zHGT9ko1VYWIT0id5B83LNCTkN3TdtdB17h/FDqEYGFaDMA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1t2kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:40:26 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL4ZdHP025108;
	Fri, 21 Nov 2025 04:40:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1t2kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:40:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0njfj017305;
	Fri, 21 Nov 2025 04:40:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j222k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:40:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL4eK4460752206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 04:40:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C59BF2004E;
	Fri, 21 Nov 2025 04:40:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13CB620043;
	Fri, 21 Nov 2025 04:40:17 +0000 (GMT)
Received: from [9.124.217.15] (unknown [9.124.217.15])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 04:40:16 +0000 (GMT)
Message-ID: <08ff261e-7ac8-4a1d-bceb-b1bf792171ae@linux.ibm.com>
Date: Fri, 21 Nov 2025 10:10:16 +0530
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
Subject: Re: [PATCH 09/17] sched/core: Add support for nohz_full CPUs
To: K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <20251119124449.1149616-10-sshegde@linux.ibm.com>
 <0f9ed7ce-3839-4d2b-98b3-25cc4045aa22@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <0f9ed7ce-3839-4d2b-98b3-25cc4045aa22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691fed3a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=peo6C5Bk6qtxJPoZQsAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LMoe7tVnUK2YG5YNYqQVp8mS0YE_L1WW
X-Proofpoint-ORIG-GUID: GhJVg2APiqwAyA_Qg4ehK3vnBimoTG0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXy/Od22Cii+Rg
 q8gswT5ZSRkuWv+urESytqleNCVO8tANdZP+WzNVUs7DEmbN2+cS0N+drmo1eAXJbsQCXz4BAlx
 0QK+n7I0Eze8Ss/UeA6e4jnhOS0roQB+HqSLefDgmL8zDyIbdVzWrATKvTD4kiR1gz3urIplM2g
 SGtQjSq9y1Ve0zHRwtvYkWmLFSZoFEKtiCyYxrIeuzi+XT4xZpdeaIP4DIdQ7tRLt5ds2XY19sh
 EgRkmBpjLy206QI8krr6C2oLYkWQmvekZDLwfv+z+c1OPbFIbFnz/V/NZnfJuqymELDg10xrN3r
 ftmUF9Ch57bxlHoJiti5oj2Tdf8wUfEcE92bSQM/HqiSfCPANb9WItIoyWl+xgxMlf0Gfu7sLeO
 ezgSrMdV0ps+uS9lIv61PLH3CoGwCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Prateek.

On 11/21/25 8:46 AM, K Prateek Nayak wrote:
> Hello Shrikanth,
> 
> On 11/19/2025 6:14 PM, Shrikanth Hegde wrote:
>> Enable tick on nohz full CPU when it is marked as paravirt.
>> If there in no CFS/RT running there, disable the tick to save the power.
> 
> Wouldn't the task be pinned if it is running on a nohz CPU?
> We don't push out pinned tasks so this seems unnecessary.
> Am I missing something?
> 

No. Task will not be pinned if it running on nohz_full unless
user has done a taskset. They are still part of sched domains.

Pinning is usually true for isolcpus. You need to explicity set taskset
for isolcpus since by default you won't go to those CPUs.

on nohz_full it is just that tick will be disabled when it has
only one task running. If there are more task on it, tick will be
enabled and load balancing can run.

Example:  ( i have 300-479 as nohz_full)
taskset -c 300-315 stress-ng --cpu=2

(it was initially on 301,302)
10:27:37 PM  301  100.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00
10:27:37 PM  302  100.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00

Ran hackbench for a brief time. After hackbench completes,
(it runs now on 301,314)
10:27:43 PM  301  100.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00
10:27:43 PM  314  100.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00


