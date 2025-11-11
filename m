Return-Path: <linuxppc-dev+bounces-14023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A3C4B78E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 05:40:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5DP619R2z2yvM;
	Tue, 11 Nov 2025 15:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762836042;
	cv=none; b=N5iLwQAbCvsJscHdA6a6Iqfdb/9GLzf2qJcP7hSDfSd9hAk12ZgJPEe8CgtXkNw8BYO3ZdcsEnXSeL3METtFJeY0MFQ8j7NxQG5JF5pe8VUH32wZ0aghn0SXj6fVGdnoLYBj990Dwj/RKIa3hIyViQWlYA8fAqldiQMFoCozD/43ZP3MX8/K7sKohy4kLSNoCKRx3Va2PQqA+5dSl/R7xs2B0RdzSBrr1D9t8SRnjy7hH/ownUUzHYdaL5IIT9bA3hVl0s0+KwUg/AN8FSpCoN4m9zHfKgVCzCUvGng9uA/427T8bHgQ0XFDcz4LQA7y8/sQToCjpakyLE0RYzkDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762836042; c=relaxed/relaxed;
	bh=AQ+/sOOSU+nZ0JUT64QhvUYm/f1On9PFMj3X4Sv2l5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YAPiQpjW3F/I4HQh6lnMRFx54lucKDoDa32M96GqrtCXnB6ei9EfvW9BoS8RfOfWcrjd8K/1EC1Y0+zVaJX0UdrlwTsKG1iU3RvAUkG8TXTWFw88sUg1FMLuOozxeczoPdXagoXn+8SBczDx/0Hvfa4h9v+WeozipGAtNJ+nKhVKpLfFRvPxMCugmBg12zOcmRaYpbcGiRjst5KiWFF85bRnJ/0zncuwevAVo3v9xorxCAz5Kpw7BAu/eHtluv6aNCFG0XVjh/NvSjWtRqRUzJLyD2ymhhMyYlQLuCAG8zKmS96OK5dMqCxzNYmjczAY+PX+AjsGHHkgBlq1ginD3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ma3gW1eO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ma3gW1eO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5DP464vcz2yvK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 15:40:40 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAHSG92016433;
	Tue, 11 Nov 2025 04:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AQ+/sO
	OSU+nZ0JUT64QhvUYm/f1On9PFMj3X4Sv2l5A=; b=ma3gW1eOxhituBEdGLEGp1
	MMe2pKfjTC3IXnjVMrHINB8kFh83Q0DHzmvuL1jgSiHkGe1ACq+2NeFutdTWtHyO
	5e2aPsXv5IUQoRaaxFyBv5rtmS6vAYjsRaSkwC3HWkIPE3ze4O3HqfW3X2SNmR2G
	XWhbBeppe//2u77zUundUF9JC45z3hhvIb1jy/+oD2qKZNYbM1dm83qmiFHUo/+s
	dem0dhVC1MOBewn/LyPVI/zmsuBamhu81oZ78CZwdLXBMHaPePBdwputWdf4uuUv
	OGjzwWXbdSsd47/xSYMydH5vIQHvus/aOtAOekobQGUfMe51UFh+xPld72oMbPwA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5cj25p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 04:40:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AB4HBhi021970;
	Tue, 11 Nov 2025 04:40:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5cj25p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 04:40:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB0c94q028880;
	Tue, 11 Nov 2025 04:40:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aag6s96v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 04:40:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AB4e5XI29622856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Nov 2025 04:40:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 690E358054;
	Tue, 11 Nov 2025 04:40:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8845D58045;
	Tue, 11 Nov 2025 04:39:54 +0000 (GMT)
Received: from [9.61.248.35] (unknown [9.61.248.35])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Nov 2025 04:39:54 +0000 (GMT)
Message-ID: <f7fe2fb8-4538-42a7-985a-a68eb8da7395@linux.ibm.com>
Date: Tue, 11 Nov 2025 10:09:52 +0530
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
From: Samir M <samir@linux.ibm.com>
In-Reply-To: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=6912be29 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Yqzg2m6fQhnNyKgerrwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=HhbK4dLum7pmb74im6QT:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfX+Dwe9pOy0tlr
 dfIaULKRbqWW/3Vzi5R8kMmHL1fcN9rCc2PH7dPpd+mJ0K4rIG+2z1NPcnH0FzjozdtgZxS5bAF
 o7p2mgNEnz9qCp5iE8gSL93PUnWRE46AbwrsLyS5lbUg0On8z5/iJoGWQ04DyExcAiXwF4Pa8il
 OZs2GfRuCt3Q9dHLSbAAsSNGHHxKbhcacTL9i99STDvJ/34cIpZ7xHliSVSvmIccsCgxRYZ3SUo
 qjt5Y+Qnr+MxIFz9kPsWT0BJUI2c4bLXZmFZMKQzpmUSXmbXDjDricZ7BXh1No7yOZbVDFlhNan
 HVLVeLsQwTxAAkMQCxNtUZNNUaoUwAbZs4/oebccbUrsHB7b+RK3rUoFC07YCBZC1Ne8x6x7qno
 lh5g0AwibMsmCr0s1ia3LRdB6FZXYQ==
X-Proofpoint-GUID: YzXFFhcm2Aluvgio0Pph3Cb-a4kYjdBM
X-Proofpoint-ORIG-GUID: 06dMdqdzqb-OF-ygaTrdYAc8dQMR7dpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
> RFC https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/
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

     •    Results for perf bench syscall**Loops = 100,000**
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

     •    Results for hackbench

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

