Return-Path: <linuxppc-dev+bounces-14520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA2C8DD43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 11:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHCkx1tVfz2yvV;
	Thu, 27 Nov 2025 21:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764240345;
	cv=none; b=C9pR+zF1mob1SesfOsODucMZx8eWGehpWEUoOFB4riEwR8Bib6c6aYb0dBK1NaoZVhiOWWzZazIqxPcaTHE8nJi2k3pRbpmVYvtG6ewVv2uXeT4jSaIg6KNmPwbWxIznPEZ4L+BBPy4i6f/PoCMo+XtTRCz8g2Cp7IRDJ3yWzwd1+5oVziDyU3TEIORqocDlX/KQ669+eKxTvhmPSREYODhlyBKJy3w/beVu2SZ4kuLOrS2LmS2SRKtyCbfkq8jTvkAuvPx7nhMaJACqldugYurAzjfS8d/VZVXUDI1fWBIkERR31wcmXt27NX29rPzqLosPRIz+ym7v6dq5/g5Ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764240345; c=relaxed/relaxed;
	bh=4ICIa0Mjhj6kj078Uv9HnCJvFvWXapkbtirqNw//vto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+czrNeQ2Zi5zqKWYAc6jwOH7436bc5Kbh0OBQ4vlncMXxtM6+3r3aa+vERYaqzpYvD78B3bY1iUxtb7TcYjuYuHkP1ezC1pMfbEW1Bxryr2upSRcAjs7WQ5abC66WGwoaZNjYTSvZwSIcgvhKm1iBlSZnrAAnac8QPUj8xTEukZUCegQrYHsK3BiZz5KRypm7/iZretLdDZH7spHpranhgX84Ve19VGdylgA9eh+ZyE2dKEfIvMj2zlVfyVVWS2wYoHp6NIgcPGES3C7O/6slm4JRz1s0vNs7GevenZ4yWw8299d9auGVp0290m/FbNKapwp4UpIdCmDM7g4TgGAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pU1ikMz5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pU1ikMz5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHCkv5bN8z2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 21:45:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AR28H2A011061;
	Thu, 27 Nov 2025 10:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4ICIa0
	Mjhj6kj078Uv9HnCJvFvWXapkbtirqNw//vto=; b=pU1ikMz5E2DkF8fgfNHlSK
	9XCMOJK5UD8r6j0aB/vgcvVMrv8MAXiHyRPXn0o28OMpRy8AonsIqU7jCw9PJrqn
	VpfVAAR19Tl0VLTylhPe5BXyCl+KOfYoGBGTE0ZNAPodpctI8wqqPwo3Y+VthD6S
	fbcdGb+zW+HDSej5KI95ZbFxMSq0b2F3dWbHx2ULxHbDF1FYotZCn8+m/EQvgE6k
	I/VaGxzdmOBnHzlGkfqoXUrBpitaqQAl62de0PfsIaRjQ6odydI50h9r83zeo3fV
	5nb4u2H8z9S7uswP5+xajzmJEiouLnYNikGMxu0+Dkb/3U/Las676ikHZaZouyRw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4w9s5ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:45:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ARAedYM023234;
	Thu, 27 Nov 2025 10:45:06 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4w9s5fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:45:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AR8A8Gc025108;
	Thu, 27 Nov 2025 10:45:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4akt71qbuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:45:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ARAj06p57082252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Nov 2025 10:45:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C443D2004F;
	Thu, 27 Nov 2025 10:45:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DB8920040;
	Thu, 27 Nov 2025 10:44:57 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Nov 2025 10:44:56 +0000 (GMT)
Message-ID: <52811199-742a-40fc-8bf2-9cb4397afda4@linux.ibm.com>
Date: Thu, 27 Nov 2025 16:14:56 +0530
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
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
        vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfXyEi4MA1r7NQP
 gONJN1v5nMQsKQZYH0zVp0pPK8/Huw5C7KXbetvZcam/0tnaNVbdCn518Kiqp6oqQhh5K/GzR6U
 /OuWIPr/AkNPswjZ95aDfwccyTC/cTe0ZzC+STILvo5fd1rYg6crknjeP4m0Rm2jHzOHhgTOWl/
 xL80HdZF9xW1I2yBeS9HNjrmWznJrgb5umO6EAeUXEge3yKHIQLViO1x8oIuex3gzfuXV0aguG7
 6PYzGA3qwQ7aATHIx9DwMMdvy0xLG9TjqcCn/GwtINOAUhfRQ/OSYW6UnXwc/YgUO/DIeK6/O3r
 cvcMyt6P7Dfa5JVeyU11IgPKQPWBgQC1J5AXmnQs+3etNbKVFlVEKmz7VKVUiSzcpF0SfwuaKrz
 mm7FZyBdeWXTZmecib+l6ETc1j99KQ==
X-Proofpoint-ORIG-GUID: lkRp_QuanJVxs8mbPfaVoeIspuwuud5S
X-Proofpoint-GUID: BPbLBkyKhmMyNVnffdeE5jdDykugeYDz
X-Authority-Analysis: v=2.4 cv=TMJIilla c=1 sm=1 tr=0 ts=69282bb4 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=mV9VRH-2AAAA:8 a=uMLcZr6R_3pDnm8Uh0cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/19/25 6:14 PM, Shrikanth Hegde wrote:
> Detailed problem statement and some of the implementation choices were
> discussed earlier[1].


Performance data on x86 and PowerPC:

++++++++++++++++++++++++++++++++++++++++++++++++
PowerPC: LPAR(VM) Running on powerVM hypervisor
++++++++++++++++++++++++++++++++++++++++++++++++

Host: 126 cores available in pool.
VM1: 96VP/64EC - 768 CPUs
VM2: 72VP/48EC - 576 CPUs
(VP- Virtual Processor core), (EC - Entitled Cores)
steal_check_frequency:1
steal_ratio_high:400
steal_ratio_low:150

Scenarios:
Secario 1: (Major improvement)
VM1 is running daytrader[1] and VM2 is running stress-ng --cpu=$(nproc)
Note: High gains. In the upstream the steal time was around 15%. With series it comes down
to 3%. With further tuning it could be reduced.

				upstream		+series
daytrader	   	   	1x			  1.7x     <<- 70% gain
throughput

-----------
Scenario 2: (improves thread_count < num_cpus)
VM1 is running schbench and VM2 is running stress-ng --cpu=$(nproc)
Note: Values are average of 5 runs and they are wakeup latencies

schbench -t 400			upstream		+series
50.0th:				  18.00			  16.60
90.0th:				 174.00			  46.80
99.0th:				3197.60                  928.80
99.9th:				6203.20                 4539.20
average rps:                   39665.61		       42334.65
  
schbench -t 600			upstream		+series
50.0th:				  23.80 		  19.80
90.0th:				 917.20                  439.00
99.0th:				5582.40                 3869.60
99.9th:				8982.40      		6574.40
average rps:		       39541.00		       40018.11

-----------
Scenario 3: (Improves)
VM1 is running hackbench and VM2 is running  stress-ng --cpu=$(nproc)
Note: Values are average of 10 runs and 20000 loops.

Process 10 groups          	  2.84               2.62
Process 20 groups          	  5.39               4.48
Process 30 groups          	  7.51               6.29
Process 40 groups          	  9.88               7.42
Process 50 groups    	  	 12.46               9.54
Process 60 groups          	 14.76              12.09
thread  10 groups          	  2.93               2.70
thread  20 groups          	  5.79               4.78
Process(Pipe) 10 groups    	  2.31               2.18
Process(Pipe) 20 groups  	  3.32               3.26
Process(Pipe) 30 groups  	  4.19               4.14
Process(Pipe) 40 groups  	  5.18               5.53
Process(Pipe) 50 groups 	  6.57               6.80
Process(Pipe) 60 groups  	  8.21               8.13
thread(Pipe)  10 groups 	  2.42               2.24
thread(Pipe)  20 groups 	  3.62               3.42

-----------
Notes:

Numbers might be very favorable since VM2 is constantly running and has some CPUs
marked as paravirt when there is steal time and thresholds also might have played a role.
Will plan to run same workload i.e hackbench and schbench on both VM's and see the behavior.

VM1 is CPUs distributed equally across Nodes, while VM2 is not. Since CPUs are marked paravirt
based on core count, some nodes on VM2 would have left unused and that could have added a boot for
VM1 performance specially for daytrader.

[1]: Daytrader is real life benchmark which does stock trading simulation.
https://www.ibm.com/docs/en/linux-on-systems?topic=descriptions-daytrader-benchmark-application
https://cwiki.apache.org/confluence/display/GMOxDOC12/Daytrader

TODO: Get numbers with very high concurrency of hackbench/schbench.

+++++++++++++++++++++++++++++++
on x86_64 (Laptop running KVMs)
+++++++++++++++++++++++++++++++
Host: 8 CPUs.
Two VM. Each spawned with -smp 8.
-----------
Scenario 1:
Both VM's are running hackbench 10 process 10000 loops.
Values are average of 3 runs. High steal of close 50% was seen when
running upstream. So marked 4-7 as paravirt by writing to sysfs file.
Since laptop has lot of host tasks running, there will be still be steal time.

hackbench 10 groups		upstream		+series (4-7 marked as paravirt)
(seconds)		 	  58			   54.42			

Note: Having 5 groups helps too. But when concurrency goes such as very high(40 groups), it regress.

-----------
Scenario 2:
Both VM's are running schbench. Values are average of 2 runs. 		
"schbench -t 4 -r 30 -i 30" (latencies improve but rps is slightly less)

wakeup latencies		upstream		+series(4-7 marked as paravirt)
50.0th				  25.5		  		13.5
90.0th				  70.0				30.0
99.0th				2588.0			      1992.0
99.9th				3844.0			      6032.0
average rps:			   338				326

schbench -t 8 -r 30 -i 30    (Major degradation of rps)
wakeup latencies		upstream		+series(4-7 marked as paravirt)
50.0th				  15.0				11.5
90.0th				1630.0			      2844.0
99.0th				4314.0			      6624.0
99.9th				8572.0			     10896.0
average rps:			 393			       240.5

Anything higher also regress. Need to see why it might be? Maybe too many context
switches since number of threads are too high and CPUs available is less.

