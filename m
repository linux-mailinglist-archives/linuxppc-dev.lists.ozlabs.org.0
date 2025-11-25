Return-Path: <linuxppc-dev+bounces-14478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCCEC840E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 09:49:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFxFg4Vrbz2yw7;
	Tue, 25 Nov 2025 19:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764060567;
	cv=none; b=ARVUcxn/HImPz2mM2VsnMP8AHP0v6SxCZfswm0V6I+Oc9pFwnkgVyeYdkeYeOFycxMkVxZmfLEgrywjftxEQIJ0VEwY1a4jkgrTQCpUD1MsOpGNiJxH+qV+Xj3sNTHnohFLGSN1H1iJOnv4T+VZGsoFJnwkHXjB1jxVGWRzV/mV2WumzP9zYObaor32dDWkyyyNsbwEz4ujolqyqYBs7R7s/KV4DA4ikwqI+FRvgUrv5gAgQrspG557IPDo2bo7r8YjvYr6SwWFOjkKRa4H2I/e071w0QSl+tMUrWqrRIAi8YH5aKXsbnRC4UQ3NJm1hezShMZHxH4p4pbnP9vtNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764060567; c=relaxed/relaxed;
	bh=xMZW4jYCPZBCYDa9tRwOq2YAcYPcswbaoSrXqxyb2qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa9bKwH061LP/s6NdPqZYfLLNAEuKYjHJuJqOTLrjGqK7VK7YjKl8Un2Mh1lKptrrsnEqU6MjDCSowDEErTQ1z5O9bJo36YkXDeIpW/6zIkTTxop64OjF15GviskuYOfyUvqh5jGwYRsyQLas2/JUBx5VgvEMzVQHDlMc92QxeKML5/gsaXK6L96v7x1Sk0Cgf5Pcndr8eB6qc4hCIF5ql1iBajtfY+SJT7hsn/QJxU88q8vlpyN6HZ73EmwOIcBI+1LZrBQ6Z1PwXumRjTGz8aNfLafWVQGRbS8t+Bs06n5Dm7MdiXqcrCeVghLggr8gM7cKm1AQGAYXDnFfSwTHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bvbtMbjr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bvbtMbjr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFxFf2V3Cz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 19:49:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP6s9uO022981;
	Tue, 25 Nov 2025 08:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xMZW4j
	YCPZBCYDa9tRwOq2YAcYPcswbaoSrXqxyb2qo=; b=bvbtMbjrrgMIFVnYKw9Kra
	GBaTnCtY2ywhnfy6cQ2hakzGSkfQ9+JMrSIlPlfY2NVkFw3OP08NnaUgANcjhmHu
	pSqkPYbD7za1BzsvQKYH3PzphCg3JSfmj6Sy2MqEv7M24n7IoLvUI65a7wb5C3b+
	ScywLM4TIh/ICQflFUZjq7JOZpwrqvZqi2z/mupbmmfGLqJt19WmKBpna1BKIzwf
	977ynKEzYfXTqtVMwJivHcaI9aHLte3iBUZmmcfmtTwopA5xj8R5P/edtlUS/q7A
	KsWBXN1DeCwlO468xhh/vG+FwK8WTWeJh6q/OF2+cndBUmTz30IUBJA3lt8hujdg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjuujf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 08:48:43 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AP8kK5D032128;
	Tue, 25 Nov 2025 08:48:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjuujb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 08:48:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP6W7jd016395;
	Tue, 25 Nov 2025 08:48:42 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aks0k2j88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 08:48:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AP8mbnP52429202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Nov 2025 08:48:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A29D20043;
	Tue, 25 Nov 2025 08:48:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34FF220040;
	Tue, 25 Nov 2025 08:48:33 +0000 (GMT)
Received: from [9.124.217.104] (unknown [9.124.217.104])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Nov 2025 08:48:32 +0000 (GMT)
Message-ID: <236f4925-dd3c-41ef-be04-47708c9ce129@linux.ibm.com>
Date: Tue, 25 Nov 2025 14:18:32 +0530
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
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <2025112454-phonics-crept-5b98@gregkh>
 <4b83b443-baa8-4218-8412-ddfb0dda8ac3@linux.ibm.com>
 <0f53d5b8-dbb7-4265-940a-2f2be3d0154d@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <0f53d5b8-dbb7-4265-940a-2f2be3d0154d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OkAh_KmwgwVl3m2iOFqwMiQG81qqNXFl
X-Authority-Analysis: v=2.4 cv=frbRpV4f c=1 sm=1 tr=0 ts=69256d6b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=l-hnylNqxinosfSD0RAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -e_Hl98T10jwpy8ucKF2dydUVGGdS_b9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAwOCBTYWx0ZWRfX+8M1fqDeG9uj
 x4gjgwWTxv7E2avi0KwfruwAITXrdibcN4M02+Brl3pNdEaHxltEGHcJXhDW+qjovrTU/u3xGTi
 HRNjDJkq/p945LNP3V5SnWzmip9Rr40CiGG6Nwjxdlek2a+/mskqdYGbyGFuYea+Lz61vO3ZySr
 aMj8DZgO5lsam42E0Zl853a8X/Xh3H4c1i0x267+JANEffj5w5bp4ylpezEsLV7Micf9yVeCNeh
 rY6khhotfGIEp/IG0ukGv6Jdgxq9DoEUoYGH2TWt6ScnwtdVizJaASynpRN8XZIcKEJxhHeunxP
 sJcB1Fdt+p/ZZMeVleF+ikHXH9Ta6IFsp8smnnzKFpb83DLQmr+HZRtsJ5E5WD01TC3otmrjrz9
 5gFRt7q7ag5fFZQ4Y4nQghAGVTCqIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe, Greg

>>>
>>> There is no "v" for this series :(
>>>
>>
>> I thought about adding v1.
>>
>> I made it as PATCH from RFC PATCH since functionally it should
>> be complete now with arch bits. Since it is v1, I remember usually 
>> people send out without adding v1. after v1 had tags such as v2.
>>
>> I will keep v2 for the next series.
>>
> 
> But you are listing changes compared to v3, how can it be a v1 ? 
> Shouldn't it be a v4 ? Or in reality a v5 as you already sent a v4 here 
> [1].
> 
> [1] https://lore.kernel.org/all/20251119062100.1112520-1- 
> sshegde@linux.ibm.com/
> 
> Christophe

Sorry about the confusion in numbers. Hopefully below helps for reviewing.
If there are no objections, I will keep next one as v2. Please let me know.

Revision logs:
++++++++++++++++++++++++++++++++++++++
RFC PATCH v4 -> PATCH (This series)
++++++++++++++++++++++++++++++++++++++
- Last two patches were sent out separate instead of being with series.
   Sent it as part of series.
- Use DEVICE_ATTR_RW instead (greg)
- Made it as PATCH since arch specific handling completes the
   functionality.

+++++++++++++++++++++++++++++++++
RFC PATCH v3 -> RFC PATCH v4
+++++++++++++++++++++++++++++++++
- Introduced computation of steal time in powerpc code.
- Derive number of CPUs to use and mark the remaining as paravirt based
   on steal values.
- Provide debugfs knobs to alter how steal time values being used.
- Removed static key check for paravirt CPUs (Yury)
- Removed preempt_disable/enable while calling stopper (Prateek)
- Made select_idle_sibling and friends aware of paravirt CPUs.
- Removed 3 unused schedstat fields and introduced 2 related to paravirt
   handling.
- Handled nohz_full case by enabling tick on it when there is CFS/RT on
   it.
- Updated debug patch to override arch behavior for easier debugging
   during development.
- Kept the method to push only current task out instead of moving all task's
   on rq given the complexity of later.

+++++++++++++++++++++++++++++++++
RFC v2 -> RFC PATCH v3
+++++++++++++++++++++++++++++++++
- Renamed to paravirt_cpus_mask
- Folded the changes under CONFIG_PARAVIRT.
- Fixed the crash due work_buf corruption while using
   stop_one_cpu_nowait.
- Added sysfs documentation.
- Copy most of __balance_push_cpu_stop to new one, this helps it move
   the code out of CONFIG_HOTPLUG_CPU.
- Some of the code movement suggested.

+++++++++++++++++++++++++++++++++
RFC PATCH -> RFC v2
+++++++++++++++++++++++++++++++++
- Renamed to cpu_avoid_mask in place of cpu_parked_mask.
- Used a static key such that no impact to regular case.
- add sysfs file to show avoid CPUs.
- Make RT understand avoid CPUs.
- Add documentation patch
- Took care of reported compile error when NR_CPUS=1


PATCH          : https://lore.kernel.org/all/20251119124449.1149616-1-sshegde@linux.ibm.com/
RFC PATCH v4   : https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.com/#r
RFC PATCH v3   : https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/#r
RFC v2         : https://lore.kernel.org/all/20250625191108.1646208-1-sshegde@linux.ibm.com/#r
RFC PATCH      : https://lore.kernel.org/all/20250523181448.3777233-1-sshegde@linux.ibm.com/

