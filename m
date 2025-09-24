Return-Path: <linuxppc-dev+bounces-12560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D169B9AC9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 17:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX1hd5Cdtz2yxN;
	Thu, 25 Sep 2025 01:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758704759;
	cv=none; b=Bh56hUx+EqOApzHIA58nIUxMdLDyfgCxzYO3/A8j/ElGL858pxiPp0YMB6XZNIgwE2Rd8GyVBOmDgdYpmD4D8ACCSFSY1xQ0O1z9S6mnYf8mGYs2bx1hy2WkMZo2nqs/D7kBzipKOuCDHxAEpWmpCy9+PorF2fk8ATtnUfGStaxSACzLdt+A8CMHMpeTCHvwEI5+xxlDgMzimPbC7iqWgioXNLT9Et/q9Ta1K2fp22c/AVwdtcLEnnmVJwP4YYtDJWSOwOd5nvL5k5tqmXpIMZlv9VkuSX/P3/redMLER9LopBq3Ibv7dRanHe7kCBlG5yEtsh8NLGQiY/wDy2pmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758704759; c=relaxed/relaxed;
	bh=w8kKH6i35rhldkgTE5qOuALa2v7kvEjLUO9ifscr9Ok=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=oIKgLRAqlUs0ze4eI6Z7xnRZ1wfl7++V2B2MkqESdBJlhS/a6YCeHfZklp8RdBeKk4qm4cx/7wqAhhHWGDHKn+aGRbLqlXC9miCOCRQzNKyjHF80iHcbdnE5iSczTHDs+v0FU981Z2OLtRhsPbGsmAL2NHvlaO1TgBn6TN849HvTubhe5kfsXWDLPG7aP2IOH3GqybFavDMEA8oY+Y10SffIjk7PteE9YvicZ7Fz8rXsCGgRQG8w9K7GTO76j3g1VCj360uF2UtkV1zq4clXkyvN17/+Bb4MMGMhK83in8H7IrcJJtnWMZUJrT8FyoF/9HbQRGEXB1xv+KiqCgP3NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZsqq1NS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir.mulani@ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZsqq1NS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=samir.mulani@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWrYK5SGkz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 19:05:56 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O8Igm7007335;
	Wed, 24 Sep 2025 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=w8kKH6i35rhldkgTE5qOuALa2v7kvE
	jLUO9ifscr9Ok=; b=rZsqq1NSJSEm2OJA1bgvC33TuDOgt7gqL6bpP359/G7Vud
	rSjavEAAQR+hXhL6cmqvo+nD+r+Q4NvXyKKxcvhoXoIf4yeVsYF3o3G7pTMctFb9
	EgZzUkQ2ffl6nWURtEV78NZU8HQddmAUqSH8BvJo4aUf/F7TnNj5jKAh4aLooBFG
	mkLGYelhGkS4QluYBmwQKtc13uKTQji2y7rLr4RAV45AwhpzYXHRuY9VOA19Mqdd
	3RYFN0wg4YWd3YHUz91QvNA5+uBXN0ULVah1xyCIug45KC3mqxYjmdQl/iy7E7w4
	Dx1MB8IgsllhQBm7l1wDNPbmjJUr6465wvvNSFQw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0jpasc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 09:05:19 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58O92r3d028085;
	Wed, 24 Sep 2025 09:05:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0jpasa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 09:05:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58O6ILV0030367;
	Wed, 24 Sep 2025 09:05:17 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49a9a17hbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 09:05:17 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58O95F9N62914940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 09:05:16 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B09C35806A;
	Wed, 24 Sep 2025 09:05:15 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0CBE5805A;
	Wed, 24 Sep 2025 09:04:58 +0000 (GMT)
Received: from [9.79.205.209] (unknown [9.79.205.209])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Sep 2025 09:04:58 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------YXjKiqqnkrkwlc9CDrNGfH31"
Message-ID: <446c7bbb-c128-4f3b-94ff-c6f3bf850c5f@ibm.com>
Date: Wed, 24 Sep 2025 14:34:55 +0530
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
Subject: Re: [RFC V2 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, deller@gmx.de, ldv@strace.io, macro@orcam.me.uk,
        charlie@rivosinc.com, akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
Content-Language: en-US
From: Samir Alamshaha Mulani <Samir.Mulani@ibm.com>
In-Reply-To: <20250908210235.137300-2-mchauras@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX/AQqkXi+5SNE
 0C4aVlbKzoGkRkPKmOGgs3g7DQ92TJAut3otsJWi/7MDjjis+GoeRj3tqBCbyxLcBcBzFV+CmEe
 5faP4XSFtjhreYBU4c/LX8MExapAc5uVoEa2wnGcY1KuVgi9ugIIbYweCf0yFLDGWLOtJQ0q3LP
 ZDMVgskTBwnzi90s/iUIl7Df42OXZAGTEcPrK2z9fSUCSbt1VvKfgOEvrxeEGZAtVeH1dJ4aUtE
 HbbKURf24niLnYmRH1w0oj9Y/Cd9mbpty80Y6lIpxQEO6xgFfGkxG1RwujONIu4yO5w0TRhn3RP
 nJmQo9ukgbEMKldfY2NatiFcUP8+0+FSUMDRwmqPgTDDVXchVEu5oLXh7Ee3EeVht724dP6w7Mk
 jpHNKI7g
X-Authority-Analysis: v=2.4 cv=TOlFS0la c=1 sm=1 tr=0 ts=68d3b44f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VnNF1IyMAAAA:8
 a=aXUYgpE7gxmlHphDPu8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WJu2qr6j2GB9LtsjdnsA:9 a=1MbpTie0CwP2j_3e:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10
X-Proofpoint-ORIG-GUID: 8NP4n_lcmP8j3DoKUCfViSKQ1GEqNbQu
X-Proofpoint-GUID: WG-L9afnnFpGPt7bjGfp2L7j5wv8rlA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------YXjKiqqnkrkwlc9CDrNGfH31
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/09/25 2:32 am, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>
> This is slightly tested on ppc64le.
>
> The performance benchmarks from perf bench basic syscall are below:
>
> | Metric     | W/O Generic Framework | With Generic Framework | Improvement |
> | ---------- | --------------------- | ---------------------- | ----------- |
> | Total time | 0.885 [sec]           | 0.880 [sec]            | ~0.56%      |
> | usecs/op   | 0.088518              | 0.088005               | ~0.58%      |
> | ops/sec    | 1,12,97,086           | 1,13,62,977            | ~0.58%      |
>
> Thats close to 0.6% improvement with this.
>
> Changelog:
> V1 -> V2: Support added for irq with generic framework.
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
>   arch/powerpc/include/asm/entry-common.h | 550 ++++++++++++++++++++++++
>   arch/powerpc/include/asm/hw_irq.h       |   4 +-
>   arch/powerpc/include/asm/interrupt.h    | 393 +++--------------
>   arch/powerpc/include/asm/ptrace.h       |   2 +
>   arch/powerpc/include/asm/stacktrace.h   |   8 +
>   arch/powerpc/include/asm/syscall.h      |   5 +
>   arch/powerpc/include/asm/thread_info.h  |   1 +
>   arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>   arch/powerpc/kernel/asm-offsets.c       |   1 +
>   arch/powerpc/kernel/interrupt.c         | 251 ++---------
>   arch/powerpc/kernel/interrupt_64.S      |   2 -
>   arch/powerpc/kernel/ptrace/ptrace.c     | 142 +-----
>   arch/powerpc/kernel/signal.c            |   8 +
>   arch/powerpc/kernel/syscall.c           | 119 +----
>   arch/powerpc/kernel/traps.c             |   2 +-
>   arch/powerpc/kernel/watchdog.c          |   2 +-
>   arch/powerpc/perf/core-book3s.c         |   2 +-
>   18 files changed, 698 insertions(+), 810 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h
>
Hi,


I have reviewed and tested the generic IRQ entry/exist patch series. 
Below are my observations:


Test Coverage
     •    Successfully ran LTP (specially syscall) and entire LTP test 
suite, without observing any regressions or issues related to the 
implementation.


System Configuration
     •    CPUs: 640
     •    Kernel: v6.17.0-rc6+
     •    Processor mode: Shared (uncapped)


Performance Evaluation
     •    Conducted benchmarking using perf bench syscall basic -l.
     •    No functional regressions observed, and results were 
consistent with expectations.


The performance benchmarks from perf bench basic syscall are below:

Loops = 100,000 | Metric | W/O Generic Framework | With Generic 
Framework | Improvement | 
|----------|-----------------------:|-----------------------:|------------:| 
| usecs/op | 0.124562 | 0.124253 | ~0.25% | | ops/sec | 8,028,471 | 
8,048,158 | ~0.25% | Loops = 1,000,000 | Metric | W/O Generic Framework 
| With Generic Framework | Improvement | 
|----------|-----------------------:|-----------------------:|------------:| 
| usecs/op | 0.125389 | 0.124374 | ~0.81% | | ops/sec | 7,977,511 | 
8,040,330 | ~0.79% | Loops = 10,000,000 | Metric | W/O Generic Framework 
| With Generic Framework | Improvement | 
|----------|-----------------------:|-----------------------:|------------:| 
| usecs/op | 0.124626 | 0.123928 | ~0.56% | | ops/sec | 8,024,058 | 
8,069,182 | ~0.56% | **Overall (aggregated across all runs)** | Metric | 
W/O Generic Framework | With Generic Framework | Improvement | | 
---------- | 
---------------------:|-----------------------:|------------:| | Total 
time | 1.384 [sec] | 1.376 [sec] | ~0.58% | | usecs/op | 0.124694 | 
0.123971 | ~0.58% | | ops/sec | 8,019,904 | 8,066,393 | ~0.58% |

Here with this benchmarking we can see the improvement close to 0.6%.

Overall, the patch series works as intended in my testing.


Please add below tag for the patch set.


Tested-by: Samir M <samir@linux.vnet.ibm.com>

Thank You !!


--------------YXjKiqqnkrkwlc9CDrNGfH31
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 09/09/25 2:32 am, Mukesh Kumar
      Chaurasiya wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250908210235.137300-2-mchauras@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">Adding support for the generic irq entry/exit handling for PowerPC. The
goal is to bring PowerPC in line with other architectures that already
use the common irq entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths.

This is slightly tested on ppc64le.

The performance benchmarks from perf bench basic syscall are below:

| Metric     | W/O Generic Framework | With Generic Framework | Improvement |
| ---------- | --------------------- | ---------------------- | ----------- |
| Total time | 0.885 [sec]           | 0.880 [sec]            | ~0.56%      |
| usecs/op   | 0.088518              | 0.088005               | ~0.58%      |
| ops/sec    | 1,12,97,086           | 1,13,62,977            | ~0.58%      |

Thats close to 0.6% improvement with this.

Changelog:
V1 -&gt; V2: Support added for irq with generic framework.

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
 arch/powerpc/include/asm/entry-common.h | 550 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 393 +++--------------
 arch/powerpc/include/asm/ptrace.h       |   2 +
 arch/powerpc/include/asm/stacktrace.h   |   8 +
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
 arch/powerpc/kernel/asm-offsets.c       |   1 +
 arch/powerpc/kernel/interrupt.c         | 251 ++---------
 arch/powerpc/kernel/interrupt_64.S      |   2 -
 arch/powerpc/kernel/ptrace/ptrace.c     | 142 +-----
 arch/powerpc/kernel/signal.c            |   8 +
 arch/powerpc/kernel/syscall.c           | 119 +----
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 18 files changed, 698 insertions(+), 810 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

</pre>
    </blockquote>
    <p>Hi,</p>
    <p><br>
    </p>
    <p>I have reviewed and tested the generic IRQ entry/exist patch
      series. Below are my observations:</p>
    <p><br>
      Test Coverage<br>
          •    Successfully ran LTP (specially syscall) and entire LTP
      test suite, without observing any regressions or issues related to
      the implementation.</p>
    <p><br>
      System Configuration<br>
          •    CPUs: 640<br>
          •    Kernel: v6.17.0-rc6+<br>
          •    Processor mode: Shared (uncapped)</p>
    <p><br>
      Performance Evaluation<br>
          •    Conducted benchmarking using perf bench syscall basic -l.<br>
          •    No functional regressions observed, and results were
      consistent with expectations.</p>
    <p><br>
    </p>
    <p>The performance benchmarks from perf bench basic syscall are
      below:</p>
    <p><span
style="color: rgb(209, 210, 211); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(232, 232, 232, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Loops = 100,000
| Metric   | W/O Generic Framework | With Generic Framework | Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op |              0.124562 |              0.124253 |      ~0.25% |
| ops/sec  |             8,028,471 |             8,048,158 |      ~0.25% |

Loops = 1,000,000
| Metric   | W/O Generic Framework | With Generic Framework | Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op |              0.125389 |              0.124374 |      ~0.81% |
| ops/sec  |             7,977,511 |             8,040,330 |      ~0.79% |

Loops = 10,000,000
| Metric   | W/O Generic Framework | With Generic Framework | Improvement |
|----------|-----------------------:|-----------------------:|------------:|
| usecs/op |              0.124626 |              0.123928 |      ~0.56% |
| ops/sec  |             8,024,058 |             8,069,182 |      ~0.56% |

**Overall (aggregated across all runs)**
| Metric     | W/O Generic Framework | With Generic Framework | Improvement |
| ---------- | ---------------------:|-----------------------:|------------:|
| Total time |           1.384 [sec] |           1.376 [sec] |      ~0.58% |
| usecs/op   |              0.124694 |              0.123971 |      ~0.58% |
| ops/sec    |             8,019,904 |             8,066,393 |      ~0.58% |</span><br>
      <br>
      Here with this benchmarking we can see the improvement close to
      0.6%.<br>
      <br>
      Overall, the patch series works as intended in my testing.</p>
    <p><br>
    </p>
    <p>Please add below tag for the patch set.</p>
    <p><br>
      Tested-by: Samir M <a class="moz-txt-link-rfc2396E" href="mailto:samir@linux.vnet.ibm.com">&lt;samir@linux.vnet.ibm.com&gt;</a></p>
    <p>Thank You !!</p>
    <p><br>
    </p>
  </body>
</html>

--------------YXjKiqqnkrkwlc9CDrNGfH31--


