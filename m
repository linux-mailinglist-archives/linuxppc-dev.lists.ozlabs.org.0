Return-Path: <linuxppc-dev+bounces-14024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C4EC4B7F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 06:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5F3W0zQbz2yvM;
	Tue, 11 Nov 2025 16:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762837830;
	cv=none; b=FiWS+iVHdiOTjSA04AbNYChMm1I7Gv/hM4DUu8RVbEA60TfETX0BtqDrDmRtQI5PCupKpS0C3B6ieNv60Xnx1UrHBkQhw/HfBLSENNitPDdJp/NVxsDRfL6EsagymXAF/PzUgtCMCKXQ7LK+thgfNpyV9VchkdOtAC7YdgniIvWVCr/FzOgS5i4J9yYfE0b9hyVYHMpCvVOTL+oSwFUICfDfNO04qweYRs/JxrEvvOLDzBJELrGbTXgQ2tSRjC69x5P+M1itRKu3Z+YRPDTzbbnTyGFIlTpajwrNWHms8a7guhe2STxQBKEu07hQbfvitMQtW0LNsrq3J/QgA12WMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762837830; c=relaxed/relaxed;
	bh=Hh5fcSH1bhJqQ1Drob8uAIwTEAHUBu2QKrEyQUSXZpU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VyrvWPyHRUgZ5+yQK9PqTdWLdR2t6vNzXnP0l3w/N0uaMq3h10yh/B8AYwzm4gwdccumercUW5kg0Ss54DnCIIWCY5DMMskrNRwp4dBVBlj/gdYY0+SA/oRBWbwDF6d+kDDvJhjWa8oo4MRsBYj0VpQbaQ85Si0Q6jWuKSM41sQXY2q6UAnkWEtYYPFRfyiZNmgYDVOg3FofSTbst/qlLSU7vmWB1IbQcJyOAi1YI3JNCHA24ErigJilj7D1Qtt1FXeB3oIttfKLUVcRkgcjYcoMAhL/rPbyEvv3enV0dft7NSHmtYlf8uoo17snI9j8HLyuTeAJB47drVbPV1rOCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PxWbzZWE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PxWbzZWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5F3V1903z2yvK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 16:10:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAJVgtT028610;
	Tue, 11 Nov 2025 05:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Hh5fcS
	H1bhJqQ1Drob8uAIwTEAHUBu2QKrEyQUSXZpU=; b=PxWbzZWETiho7/kkQTtk+9
	p8FniINdpeMl2ZMoQ3k3nmH3N54Z1nt/s+33BZ7jadO+bIHZD1EkFbaacdQSneex
	mkfxq49omOgVSV+hGxMYVAebpgTKXR3PuEM4ZJVbERDoT8TH9LQlY64QgOQaymum
	HgaWMFmXIVgYTOAuJx3XelQ5BU/38pKm7GS87X64o6hmPsebmBZXYr4Q61B3aAyp
	biuO2yRplXAEK8w4nmfvwZ7ODHC5Mtxnwu4D9Ky8aL7jXYyrWmoKfiF/lp7mW0dP
	cLmGdgHMaU6hIqrVABFKA6c7aET0blmoXXosYXSkGKcCGKMs4hyTnSKO0istF0fQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m81k3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:09:47 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AB55HUL001944;
	Tue, 11 Nov 2025 05:09:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m81k3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:09:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB0Ou9h028888;
	Tue, 11 Nov 2025 05:09:46 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aag6s9a5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:09:46 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AB59Vjs63963574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Nov 2025 05:09:31 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8ACB58050;
	Tue, 11 Nov 2025 05:09:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFE4858054;
	Tue, 11 Nov 2025 05:09:33 +0000 (GMT)
Received: from [9.61.248.35] (unknown [9.61.248.35])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Nov 2025 05:09:33 +0000 (GMT)
Message-ID: <a0af8e59-6828-4e12-b0a2-bc426df97b0e@linux.ibm.com>
Date: Tue, 11 Nov 2025 10:39:31 +0530
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
Subject: Re: [PATCH 0/8] Generic IRQ entry/exit support for powerpc
From: Samir M <samir@linux.ibm.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        tglx@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
 <f7fe2fb8-4538-42a7-985a-a68eb8da7395@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <f7fe2fb8-4538-42a7-985a-a68eb8da7395@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=MtZfKmae c=1 sm=1 tr=0 ts=6912c51b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=9F--yUDwXs0pceWwWsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=HhbK4dLum7pmb74im6QT:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-GUID: ecjGfxY74jOqPBcYf3dTEtvFc6JfbH6N
X-Proofpoint-ORIG-GUID: gaJyIpeO6O5wHBwv9DiMWiDFX_sfwBxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA3OSBTYWx0ZWRfX3NCZTGlkF4/Q
 1STi7mbooMMGYGO1yJQJTbtS16AVZumpxyJM4N7Jiyx70th2ezJ7fgktH+qY7jNPg3MOABD3DjR
 EgDEJbYqUVVN+LGbDBcyQZ0khGeoZHWF9QQQpb98visF9M9eO+n+RE08RDN/TWCBfOHBUjlzrz2
 zBaeyBhk9hzs6g9z5PkBpsmFSdjMfMcnFIrXHFf9L5Wzg+GDImBl4iClmBkOUx8lim4/d/IbSaO
 y7SJyjM4idPEUHXKvP2cAi8DfXE4kgtBT0pdxDrJO8RPXFbaSvKE5tWYInB+AaGVSF85WJa3G9v
 tb4Pfpvhq9LgIfAlP4pdk3henTcQLuG5pkQAGeyTxVH01cb0Rn0iKSnBhv7dvWNFR28LSrBfjQm
 12pREMR/N0dH8+ORymsmIFxaB02UnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/11/25 10:09 am, Samir M wrote:
> On 02/11/25 5:23 pm, Mukesh Kumar Chaurasiya wrote:
>> Adding support for the generic irq entry/exit handling for PowerPC. The
>> goal is to bring PowerPC in line with other architectures that already
>> use the common irq entry infrastructure, reducing duplicated code and
>> making it easier to share future changes in entry/exit paths.
>>
>> This is slightly tested of ppc64le and ppc32.
>>
>> The performance benchmarks from perf bench basic syscall are below:
>>
>> | Metric     | W/O Generic Framework | With Generic Framework | Change |
>> | ---------- | --------------------- | ---------------------- | ------ |
>> | Total time | 0.939 [sec]           | 0.938 [sec]            | ~0%    |
>> | usecs/op   | 0.093900              | 0.093882               | ~0%    |
>> | ops/sec    | 1,06,49,615           | 1,06,51,725            | ~0%    |
>>
>> Thats very close to performance earlier with arch specific handling.
>>
>> Tests done:
>>   - Build and boot on ppc64le pseries.
>>   - Build and boot on ppc64le powernv8 powernv9 powernv10.
>>   - Build and boot on ppc32.
>>   - Performance benchmark done with perf syscall basic on pseries.
>>
>> Changelog:
>>
>> RFC -> PATCH
>>   - Fix for ppc32 spitting out kuap lock warnings.
>>   - ppc64le powernv8 crash fix.
>>   - Review comments incorporated from previous RFC.
>> RFC 
>> https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/
>>
>> Mukesh Kumar Chaurasiya (8):
>>    powerpc: rename arch_irq_disabled_regs
>>    powerpc: Prepare to build with generic entry/exit framework
>>    powerpc: introduce arch_enter_from_user_mode
>>    powerpc: Introduce syscall exit arch functions
>>    powerpc: add exit_flags field in pt_regs
>>    powerpc: Prepare for IRQ entry exit
>>    powerpc: Enable IRQ generic entry/exit path.
>>    powerpc: Enable Generic Entry/Exit for syscalls.
>>
>>   arch/powerpc/Kconfig                    |   2 +
>>   arch/powerpc/include/asm/entry-common.h | 539 ++++++++++++++++++++++++
>>   arch/powerpc/include/asm/hw_irq.h       |   4 +-
>>   arch/powerpc/include/asm/interrupt.h    | 401 +++---------------
>>   arch/powerpc/include/asm/ptrace.h       |   3 +
>>   arch/powerpc/include/asm/stacktrace.h   |   6 +
>>   arch/powerpc/include/asm/syscall.h      |   5 +
>>   arch/powerpc/include/asm/thread_info.h  |   1 +
>>   arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>>   arch/powerpc/kernel/asm-offsets.c       |   1 +
>>   arch/powerpc/kernel/interrupt.c         | 258 +++---------
>>   arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
>>   arch/powerpc/kernel/signal.c            |   8 +
>>   arch/powerpc/kernel/syscall.c           | 119 +-----
>>   arch/powerpc/kernel/traps.c             |   2 +-
>>   arch/powerpc/kernel/watchdog.c          |   2 +-
>>   arch/powerpc/perf/core-book3s.c         |   2 +-
>>   17 files changed, 693 insertions(+), 816 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/entry-common.h
>>
> Hi,
>
> I have reviewed and tested the generic IRQ entry/exist patch series. 
> Below are my observations:
>
>  Test Coverage 
> • Successfully ran LTP (specially syscall) and entire LTP test suite, 
> without observing any regressions or issues related to the 
> implementation.
>
>  System Configuration 
> • CPUs: 160 
> • Kernel: v6.18.0-rc1+ 
> • Processor mode: Shared (uncapped)
>
>  Performance Evaluation 
> • Conducted benchmarking using perf bench syscall basic -l and 
> hackbench. 
> • No functional regressions observed, and results were consistent with 
> expectations.
>
>     •    Results for perf bench syscall**Loops = 100,000**
> **Loops = 100,000**
> | Metric       | W/O Generic Framework      | With Generic Framework  
>   | Improvement |
> |----------|-----------------------:|-----------------------:|------------:| 
>
> | usecs/op   |              0.125328              | 0.128839         
> |     ~-2.80% |
> | ops/sec     |             7,979,645              |  7,762,047       
>     |     ~-2.73% |
>
> **Loops = 1,000,000**
> | Metric        | W/O Generic Framework         | With Generic 
> Framework             | Improvement |
> |----------|-----------------------:|-----------------------:|------------:| 
>
> | usecs/op   |              0.125015              | 0.127885         
> |     ~-2.30% |
> | ops/sec     |             7,999,051              |  7,819,546       
>     |     ~-2.24% |
>
> **Loops = 10,000,000**
> | Metric        | W/O Generic Framework    | With Generic Framework   
>  | Improvement |
> |----------|-----------------------:|-----------------------:|------------:| 
>
> | usecs/op   |              0.124613              | 0.127426         
> |     ~-2.26% |
> | ops/sec     |             8,024,827              |  7,847,735       
>     |     ~-2.21% |
>
> **Overall (aggregated across all runs)**
> | Metric         | W/O Generic Framework   | With Generic Framework   
>  | Improvement |
> | ---------- | 
> ---------------------:|-----------------------:|------------:|
> | Total time    |           1.384 [sec]            |  1.415 [sec]      
>          |     ~-2.27% |
> | usecs/op     |              0.124656            | 0.127480         
> |     ~-2.27% |
> | ops/sec       |             8,022,098            |  7,844,423       
>     |     ~-2.21% |
>
> A 2% performance degradation was observed with the perf bench syscall.
>
>     •    Results for hackbench
>
> | Metric        | W/O Generic Framework    | With Generic Framework   
> | Improvement |
> |----------|---------------------- 
> :|-----------------------:|------------:|
> | Min Time   | 142.055 (sec).                   | 141.699 (sec)       
>        | 0.25%
> | Max Time  | 143.791 (sec).                   | 143.206 (sec)         
>    | 0.41%
> | Avg Time   | 142.925 (sec)                    | 142.472 (sec)       
>        | 0.32%
>
> So overall 0.3 % improvement is observed across 10 runs.
>
> Please add below tag for the patch set.
>  Tested-by: Samir M <samir@linux.ibm.com>
> Thank You !!
>
>
> Regards,
> Samir.
>
Hi,

Apologies for the earlier email. The benchmark results table was not 
properly formatted in that version, so I am re-sending the results below 
for clarity.

I have reviewed and tested the generic IRQ entry/exist patch series. 
Below are my observations:

 Test Coverage
• Successfully ran LTP (specially syscall) and entire LTP test suite, 
without observing any regressions or issues related to the implementation.

 System Configuration
• CPUs: 160
• Kernel: v6.18.0-rc1+
• Processor mode: Shared (uncapped)

 Performance Evaluation
• Conducted benchmarking using perf bench syscall basic -l and hackbench.
• No functional regressions observed, and results were consistent with 
expectations.

     •    Results for perf bench syscall

Loops = 100,000
+-----------+------------------------+------------------------+------------+
| Metric      | W/O Generic Framework     | With Generic Framework    | 
Improvement |
+-----------+------------------------+------------------------+------------+
| usecs/op  |           0.125328                 |  0.128839            
        | ~-2.80%     |
| ops/sec    |            7,979,645               |  7,762,047          
         | ~-2.73%     |
+-----------+------------------------+------------------------+------------+

Loops = 1,000,000
+-----------+------------------------+------------------------+------------+
| Metric      | W/O Generic Framework  | With Generic Framework | 
Improvement |
+-----------+------------------------+------------------------+------------+
| usecs/op  |          0.125015               |        0.127885         
         | ~-2.30%     |
| ops/sec    |          7,999,051              |        7,819,546       
            | ~-2.24%     |
+-----------+------------------------+------------------------+------------+

Loops = 10,000,000
+-----------+------------------------+------------------------+------------+
| Metric      | W/O Generic Framework  | With Generic Framework  | 
Improvement |
+-----------+------------------------+------------------------+------------+
| usecs/op  |         0.124613                |        0.127426         
         | ~-2.26%     |
| ops/sec    |         8,024,827               |        7,847,735       
            | ~-2.21%     |
+-----------+------------------------+------------------------+------------+

Overall (aggregated across all runs)
+-------------+------------------------+------------------------+----------+
| Metric         | W/O Generic Framework  | With Generic Framework | 
Improvement |
+-------------+------------------------+------------------------+----------+
| Total time   |        1.384 [sec]               |         1.415 [sec]  
               | ~-2.27%     |
| usecs/op     |        0.124656                 | 0.127480              
      | ~-2.27%     |
| ops/sec       |        8,022,098                | 7,844,423            
       | ~-2.21%     |
+-------------+------------------------+------------------------+----------+
A 2% performance degradation was observed with the perf bench syscall.

     •    Results for hackbench

+-----------+---------------------------+---------------------------+------+
| Metric        | W/O Generic Framework     | With Generic Framework    
| Improvement |
+-----------+---------------------------+---------------------------+------+
| Min Time  |    142.055 (sec)                     |       141.699 
(sec)             |  +0.25%      |
| Max Time  |   143.791 (sec)                     |       143.206 (sec)  
             |  +0.41%      |
| Avg Time  |   142.925 (sec)                      |      142.472 (sec)  
             |  +0.32%      |
+-----------+---------------------------+---------------------------+------+

So overall 0.3 % improvement is observed across 10 runs.

Please add below tag for the patch set. 

Tested-by: Samir M <samir@linux.ibm.com>
Thank You !!


Regards,
Samir.


