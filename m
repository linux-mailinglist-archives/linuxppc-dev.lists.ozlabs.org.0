Return-Path: <linuxppc-dev+bounces-13993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0DC458A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 10:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4kTm5jq6z2xqM;
	Mon, 10 Nov 2025 20:13:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762765980;
	cv=none; b=m2AKKMYENJiubh3pEzOXihL+Qk4RK0hladCyu2GtHZNW/TXu+v1WTyn5q4N3SRb58f713WV5GfNi1lZCOTTz4oxuWh9823/9AZhyh4XEERYHRa2OmhaWVd/UNfj0r+q1gHNnY6PL8i1mWuOHYrHtgXLKwraFGOWkgJaAhKpBcDQLikvWDX4IFGt4DDAjFOFrdHIHQvaA9SdNi8MI96CTC4K9PfBDZJ8/gyOUS9/b0lYJgPN/3LHJsvkLrOIgHnIANroneLqRHvcSzW5pRyTMo/HvuQOZ11XxV48fgSDoWnqsZ4lA1R88/6TICCXF78aA//9cg1vO+KogAtXbVvWfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762765980; c=relaxed/relaxed;
	bh=MlFLz0r4EaIF2tQbBerZnpxCLol/MNcwRpTg/9h+gqw=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=EFnvCrKFLEst1GnFX4yner3Tqg1rg+wEfwLDfLDA5O57edtHWjoR2HGYmY1fUjjQt13ZxCsy/PPByRtIO6YkgDofz3viILbFAee7Umlxt/LayhsnYbiDJspn/ht1garqlKL73WnNtnbNeed3UmdlWWPVt0cy1REvQ0vWL9+qyX+BwjGA/3HLZCdevkJBqYlap4Ln5K1+RCnoATnSYUqHzCp3nUnVh8ljjZtVJNFpQnYRhC3iaPrNzK8kqpqgpGSCbC8W/ZNR8og1xRFFCv8JgQKtAk/qByiOTcQ63FiD6WjrxUmnAfuQkKhioxPOnMPDsVQsMnVE56BcCkyo3QY8KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQ+YojTT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQ+YojTT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4kTl6NsSz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 20:12:59 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9JgFaq016772;
	Mon, 10 Nov 2025 09:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=MlFLz0r4EaIF2tQbBerZnpxCLol/MN
	cwRpTg/9h+gqw=; b=mQ+YojTTIdrobdNjWcz4QV0bGJZEep82WcawtObqJm6ESp
	GQrCquTtH+khXC4fTXWP5e2uyNzGHnrRGDncKA+q4yAWuK4Kmox0oqVyNc1K7L1b
	a0glWFitS6t4Tf3A7DEJ6IEIp2ZsxwU8x/rqtwwuq7Qw+tvLvGmgj1+jA8RLZU5x
	OQ7VJJoIw7EANUuvrk6Y6da11x4eoThSSnm8zYrq2XgLrqXGP4el8EPuVV5WNtlp
	4fMuMMdtKeD8oIjtKymbdDLjMOKh5I6OUEuVSsA7Oieb76GqbBDjMHT0kqBGzsif
	9q8Nssy8eEkUNsc9tj3bHYxoyl8X+qHcKMA8bs8A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chx5m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:12:27 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA996bb004297;
	Mon, 10 Nov 2025 09:12:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chx5kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:12:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA94BeS011431;
	Mon, 10 Nov 2025 09:12:26 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajw14huc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:12:26 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA9COa625166380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 09:12:25 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD7DF5805D;
	Mon, 10 Nov 2025 09:12:24 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 249855805A;
	Mon, 10 Nov 2025 09:12:14 +0000 (GMT)
Received: from [9.79.204.225] (unknown [9.79.204.225])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 09:12:13 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------IsA5aYp08wrNEpVUKvaW1B2b"
Message-ID: <de9a7259-73cb-48f6-afd0-7dd47a725c46@linux.ibm.com>
Date: Mon, 10 Nov 2025 14:42:12 +0530
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
Content-Language: en-US
From: Samir Alamshaha Mulani <samir@linux.ibm.com>
In-Reply-To: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=6911ac7b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Yqzg2m6fQhnNyKgerrwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vU58yfGyNwJjuA0bxoQA:9 a=7i3ow50MfOXuK4a5:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=HhbK4dLum7pmb74im6QT:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfX0ZVYKhtJeYBg
 qvcETXRGhNwAjZCfl0gVJB2lsTxZNMax6YRn2ndzn4z1lHVtkJoUyX6k8uA48ZvO9MrhfHignWr
 WWSLF1t1buuimw82/ft/zLIh+ZSZwSujVnUpsLMH6DM5rumuhB6M8r3yEXXiVJ7U55kZWN21H0h
 yn/TZvklfa6XMr3/xUvYb6Umc9W0gnILSDqyyOqoQES70JgGYt6fgCxJsZ/lMOOQ3KjHXb45yoS
 8Il42XJkG93wDqBP2cGZ9hTGn/b8Y/wfghSfk8UDouCQ6nyQ04fXDbkEvpWNKbvHR204bgXyTHr
 zrimkudoQyjb9teadXEBWEi1xP+1JAP5PM2UFlO2+DLn7ewaRGfZ+fu5qJ6LhysE4qw0tnbliap
 kCf+RnLjj4AsIGRU7lJGWGWqp2KVgw==
X-Proofpoint-GUID: iG9IjSy-9jrGqcftOMwpC0U1KRSQIRva
X-Proofpoint-ORIG-GUID: gPSc53AR6nYmw1J9lVDNhX3APDdfSiXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------IsA5aYp08wrNEpVUKvaW1B2b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/11/25 5:23 pm, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>
> This is slightly tested of ppc64le and ppc32.
>
> The performance benchmarks from perf bench basic syscall are below:
>
> | Metric     | W/O Generic Framework | With Generic Framework | Change |
> | ---------- | --------------------- | ---------------------- | ------ |
> | Total time | 0.939 [sec]           | 0.938 [sec]            | ~0%    |
> | usecs/op   | 0.093900              | 0.093882               | ~0%    |
> | ops/sec    | 1,06,49,615           | 1,06,51,725            | ~0%    |
>
> Thats very close to performance earlier with arch specific handling.
>
> Tests done:
>   - Build and boot on ppc64le pseries.
>   - Build and boot on ppc64le powernv8 powernv9 powernv10.
>   - Build and boot on ppc32.
>   - Performance benchmark done with perf syscall basic on pseries.
>
> Changelog:
>
> RFC -> PATCH
>   - Fix for ppc32 spitting out kuap lock warnings.
>   - ppc64le powernv8 crash fix.
>   - Review comments incorporated from previous RFC.
> RFChttps://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/
>
> Mukesh Kumar Chaurasiya (8):
>    powerpc: rename arch_irq_disabled_regs
>    powerpc: Prepare to build with generic entry/exit framework
>    powerpc: introduce arch_enter_from_user_mode
>    powerpc: Introduce syscall exit arch functions
>    powerpc: add exit_flags field in pt_regs
>    powerpc: Prepare for IRQ entry exit
>    powerpc: Enable IRQ generic entry/exit path.
>    powerpc: Enable Generic Entry/Exit for syscalls.
>
>   arch/powerpc/Kconfig                    |   2 +
>   arch/powerpc/include/asm/entry-common.h | 539 ++++++++++++++++++++++++
>   arch/powerpc/include/asm/hw_irq.h       |   4 +-
>   arch/powerpc/include/asm/interrupt.h    | 401 +++---------------
>   arch/powerpc/include/asm/ptrace.h       |   3 +
>   arch/powerpc/include/asm/stacktrace.h   |   6 +
>   arch/powerpc/include/asm/syscall.h      |   5 +
>   arch/powerpc/include/asm/thread_info.h  |   1 +
>   arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>   arch/powerpc/kernel/asm-offsets.c       |   1 +
>   arch/powerpc/kernel/interrupt.c         | 258 +++---------
>   arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
>   arch/powerpc/kernel/signal.c            |   8 +
>   arch/powerpc/kernel/syscall.c           | 119 +-----
>   arch/powerpc/kernel/traps.c             |   2 +-
>   arch/powerpc/kernel/watchdog.c          |   2 +-
>   arch/powerpc/perf/core-book3s.c         |   2 +-
>   17 files changed, 693 insertions(+), 816 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h
>
Hi,

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


  * Results for perf bench syscall**Loops = 100,000**

**Loops = 100,000**
| Metric       | W/O Generic Framework      | With Generic Framework    
| Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op   |              0.125328              | 0.128839            
   |     ~-2.80% |
| ops/sec     |             7,979,645              |  7,762,047          
     |     ~-2.73% |

**Loops = 1,000,000**
| Metric        | W/O Generic Framework         | With Generic 
Framework             | Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op   |              0.125015              | 0.127885            
   |     ~-2.30% |
| ops/sec     |             7,999,051              |  7,819,546          
     |     ~-2.24% |

**Loops = 10,000,000**
| Metric        | W/O Generic Framework    | With Generic Framework    | 
Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op   |              0.124613              | 0.127426            
   |     ~-2.26% |
| ops/sec     |             8,024,827              |  7,847,735          
     |     ~-2.21% |

**Overall (aggregated across all runs)**
| Metric         | W/O Generic Framework   | With Generic Framework    | 
Improvement |
| ---------- | 
---------------------:|-----------------------:|------------:|
| Total time    |           1.384 [sec]            |           1.415 
[sec]               |     ~-2.27% |
| usecs/op     |              0.124656            | 0.127480            
   |     ~-2.27% |
| ops/sec       |             8,022,098            |  7,844,423          
     |     ~-2.21% |

A 2% performance degradation was observed with the perf bench syscall.


  * Results for hackbench


| Metric        | W/O Generic Framework    | With Generic Framework   | 
Improvement |
|----------|---------------------- :|-----------------------:|------------:|
| Min Time   | 142.055 (sec).                   | 141.699 (sec)         
        | 0.25%
| Max Time  | 143.791 (sec).                   | 143.206 (sec)           
      | 0.41%
| Avg Time   | 142.925 (sec)                    | 142.472 (sec)         
        | 0.32%

So overall 0.3 % improvement is observed across 10 runs.

Please add below tag for the patch set.
 Tested-by: Samir M <samir@linux.ibm.com>
Thank You !!


Regards,
Samir.
--------------IsA5aYp08wrNEpVUKvaW1B2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/11/25 5:23 pm, Mukesh Kumar
      Chaurasiya wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251102115358.1744304-1-mkchauras@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">Adding support for the generic irq entry/exit handling for PowerPC. The
goal is to bring PowerPC in line with other architectures that already
use the common irq entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths.

This is slightly tested of ppc64le and ppc32.

The performance benchmarks from perf bench basic syscall are below:

| Metric     | W/O Generic Framework | With Generic Framework | Change |
| ---------- | --------------------- | ---------------------- | ------ |
| Total time | 0.939 [sec]           | 0.938 [sec]            | ~0%    |
| usecs/op   | 0.093900              | 0.093882               | ~0%    |
| ops/sec    | 1,06,49,615           | 1,06,51,725            | ~0%    |

Thats very close to performance earlier with arch specific handling.

Tests done:
 - Build and boot on ppc64le pseries.
 - Build and boot on ppc64le powernv8 powernv9 powernv10.
 - Build and boot on ppc32.
 - Performance benchmark done with perf syscall basic on pseries.

Changelog:

RFC -&gt; PATCH
 - Fix for ppc32 spitting out kuap lock warnings.
 - ppc64le powernv8 crash fix.
 - Review comments incorporated from previous RFC.
RFC <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/">https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/</a>

Mukesh Kumar Chaurasiya (8):
  powerpc: rename arch_irq_disabled_regs
  powerpc: Prepare to build with generic entry/exit framework
  powerpc: introduce arch_enter_from_user_mode
  powerpc: Introduce syscall exit arch functions
  powerpc: add exit_flags field in pt_regs
  powerpc: Prepare for IRQ entry exit
  powerpc: Enable IRQ generic entry/exit path.
  powerpc: Enable Generic Entry/Exit for syscalls.

 arch/powerpc/Kconfig                    |   2 +
 arch/powerpc/include/asm/entry-common.h | 539 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 401 +++---------------
 arch/powerpc/include/asm/ptrace.h       |   3 +
 arch/powerpc/include/asm/stacktrace.h   |   6 +
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
 arch/powerpc/kernel/asm-offsets.c       |   1 +
 arch/powerpc/kernel/interrupt.c         | 258 +++---------
 arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
 arch/powerpc/kernel/signal.c            |   8 +
 arch/powerpc/kernel/syscall.c           | 119 +-----
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 17 files changed, 693 insertions(+), 816 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

</pre>
    </blockquote>
    Hi,<br>
    <br>
    <p>I have reviewed and tested the generic IRQ entry/exist patch
      series. Below are my observations:</p>
    <p><br>
    </p>
    <p> Test Coverage    </p>
    <p>• Successfully ran LTP (specially syscall) and entire LTP test
      suite, without observing any regressions or issues related to the
      implementation.</p>
    <p><br>
    </p>
    <p> System Configuration     </p>
    <p>• CPUs: 160     </p>
    <p>• Kernel: v6.18.0-rc1+     </p>
    <p>• Processor mode: Shared (uncapped)</p>
    <p><br>
    </p>
    <p> Performance Evaluation  </p>
    <p>• Conducted benchmarking using perf bench syscall basic -l and
      hackbench.     </p>
    <p>• No functional regressions observed, and results were consistent
      with expectations.</p>
    <p><br>
    </p>
    <ul>
      <li>Results for perf bench syscall**Loops = 100,000**</li>
    </ul>
    **Loops = 100,000**<br>
    | Metric       | W/O Generic Framework      | With Generic
    Framework    | Improvement |<br>
|----------|-----------------------:|-----------------------:|------------:|<br>
    | usecs/op   |              0.125328              |             
    0.128839              |     ~-2.80% |<br>
    | ops/sec     |             7,979,645              |           
     7,762,047              |     ~-2.73% |<br>
    <br>
    **Loops = 1,000,000**<br>
    | Metric        | W/O Generic Framework         | With Generic
    Framework             | Improvement |<br>
|----------|-----------------------:|-----------------------:|------------:|<br>
    | usecs/op   |              0.125015              |             
    0.127885              |     ~-2.30% |<br>
    | ops/sec     |             7,999,051              |           
     7,819,546              |     ~-2.24% |<br>
    <br>
    **Loops = 10,000,000**<br>
    | Metric        | W/O Generic Framework    | With Generic Framework 
       | Improvement |<br>
|----------|-----------------------:|-----------------------:|------------:|<br>
    | usecs/op   |              0.124613              |             
    0.127426              |     ~-2.26% |<br>
    | ops/sec     |             8,024,827              |           
     7,847,735              |     ~-2.21% |<br>
    <br>
    **Overall (aggregated across all runs)**<br>
    | Metric         | W/O Generic Framework   | With Generic Framework 
       | Improvement |<br>
    | ---------- |
    ---------------------:|-----------------------:|------------:|<br>
    | Total time    |           1.384 [sec]            |           1.415
    [sec]               |     ~-2.27% |<br>
    | usecs/op     |              0.124656            |             
    0.127480              |     ~-2.27% |<br>
    | ops/sec       |             8,022,098            |           
     7,844,423              |     ~-2.21% |<br>
    <br>
    <p>A 2% performance degradation was observed with the perf bench
      syscall.</p>
    <p><br>
    </p>
    <ul>
      <li>Results for hackbench</li>
    </ul>
    <br>
    | Metric        | W/O Generic Framework    | With Generic Framework 
      | Improvement |<br>
    |----------|----------------------
    :|-----------------------:|------------:|<br>
    | Min Time   | 142.055 (sec).                   | 141.699 (sec)     
                   | 0.25%<br>
    | Max Time  | 143.791 (sec).                   | 143.206 (sec)     
                   | 0.41%<br>
    | Avg Time   | 142.925 (sec)                    | 142.472 (sec)     
                   | 0.32%<br>
    <br>
    So overall 0.3 % improvement is observed across 10 runs.<br>
    <br>
    Please add below tag for the patch set.<br>
     Tested-by: Samir M <a class="moz-txt-link-rfc2396E" href="mailto:samir@linux.ibm.com">&lt;samir@linux.ibm.com&gt;</a><br>
    Thank You !!<br>
    <br>
    <br>
    Regards,<br>
    Samir.
  </body>
</html>

--------------IsA5aYp08wrNEpVUKvaW1B2b--


