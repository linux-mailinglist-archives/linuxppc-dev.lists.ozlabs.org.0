Return-Path: <linuxppc-dev+bounces-15195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E1CF0EF3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 04 Jan 2026 13:38:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkcR30jGFz2yFh;
	Sun, 04 Jan 2026 23:38:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767530286;
	cv=none; b=MZE0YfL0IaU67663r2qxZkgPpS+PmyyqK6nwJc9j5to97PNCTomrcyN1qeUxg35/6c4aefJ6T4uUWSkmgbt1hj/OUULqkdQ6KiGkCJDEa3bCw06yDJumxQEVMI4eBGan5Yn01tDdCjv28k27ryjGswjDrG6LcCzWrJx/ttZZ9MOHHIa3tQFINE/NWkwY+8oUvQoGFvlYDqH95tK9BwJDGGuJ1QJgj/xNwgPfLo+3sUI8t2MqUVA/92btiBDa9WD9fClIn3p+W47eZv23s5kjaU2gdCKYz+XUpipy3d6Szby9xW/4VMMDpTj4n5zScMhBgkyzUxkIt4e02wI0OYmOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767530286; c=relaxed/relaxed;
	bh=WAg2122s546P/Txi/Id5clhHybKTowJ5UCJPn/ClCvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j4UisAN/BSA8/vk6+hj3F6tjshXUtPy0OF9SG5DwDUaL2RZEwlUg4TkYRLhiTdQnD2oejrSIbloDXXTjca+1R6sV9oRycI9y5hr9kpZU8dza2SkBeXOy57YDgjgVAgQdjUHb53ZIC/gY+Tn8uj3Q243NB/S7PGGAFm2iFdXza7eD0gB/ktCbgVXJsItUnhpQZOvignw8TTiLJGzzAh/d7YkB6LapLSCpHlIpAQRIb43htpUDdCjGRvBgp/ByFJAgCBbE/G29+3H9sZhUujf/ojijXepSYWGn78296euRW/AlndxVowUUAcj5oGe2yf3p1sXqml5R7odn7m4teKABOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuO1joZu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuO1joZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkcR13VZnz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 23:38:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 603CsCKZ030720;
	Sun, 4 Jan 2026 12:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WAg212
	2s546P/Txi/Id5clhHybKTowJ5UCJPn/ClCvw=; b=RuO1joZu8kn1HGrD2CAyql
	xzXPE5svMnXV99M/vWCN4vV25MV4KzYOpAqU/1Zky7jixxBOxE2fr8miUcBcW5dc
	GmKdFDruDvvXL3oC3OSQbY7y1woYTXFDUenseEtr0NDRuOEQLr+bQt6bRxhZP0s7
	tpS905sX/ST6iQJBS49KRpgldoh35KbRpVwWuxvNVNdaiTlSl+vSNa/CULMooJmm
	1r9Wn0uWy/BsPHwwAnb89dZBGheGdTal+kEQbOkgStkg7kq4sHw8RDJHyUqNCVWs
	34zH9DMEbvyMXtZ5+duB9DP8DTWzXE01PR4h5BmfC/GY3HFCYFKcCCYtgFiJJHTQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshekcns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 12:37:20 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 604CbK7d005216;
	Sun, 4 Jan 2026 12:37:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshekcnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 12:37:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6048F8Xh005250;
	Sun, 4 Jan 2026 12:37:19 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexjsdyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 12:37:19 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 604CbHUI21758614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 Jan 2026 12:37:18 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB04D5804E;
	Sun,  4 Jan 2026 12:37:17 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF2EF5803F;
	Sun,  4 Jan 2026 12:36:33 +0000 (GMT)
Received: from [9.61.253.45] (unknown [9.61.253.45])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 Jan 2026 12:36:32 +0000 (GMT)
Message-ID: <3722b203-0c96-4609-9c9a-a7651a1745ff@linux.ibm.com>
Date: Sun, 4 Jan 2026 18:06:28 +0530
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
Subject: Re: [PATCH v2 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
Content-Language: en-US
From: Samir M <samir@linux.ibm.com>
In-Reply-To: <20251214130245.43664-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDExMyBTYWx0ZWRfXxtFSzlZ91o5G
 odm+OZeg8dYUCPadsZT03Eu1OM0Ao+1wsNOgEVs5ItHh+SZ7rardfnnOqRi3ytYgyDD528SNag6
 8P09wjXOC7IFbVM0ajw6+Irc4fQ60a7XWC6m8MJi6lQt2MaTP4B1nbXkYwpQXNjWkoTi4xaqUlt
 tdXucOIcL+t+v9Vwn94hvkdcOuX8J26s0375usWOuJQaMGg3cIsigK0gpYlD7yScNZKKqRsXL+O
 likTzYl9beG0xHzqdK8kUm0tEU0bfUE+IRiXcu/nfmFj0LONU0yCoD4cPc+8XsnCIwlvWsspWQK
 u1dk5YSdJ8YxJZh/5XpGrW9eJ1rxwvXZnaMXC9WuMGZrLy3LFjhJfhGXDhN+mg7wDS9XSJ9T3EQ
 LAvF1Ffr8LShEtfuKDlWnJBFUtSxkw/UwABR9GCuYCmGweFtQCGH27igXVuNxUS4t5bcQD2jrW7
 ou6cW6Wm3N7e05KccrA==
X-Proofpoint-GUID: ZW8lJorZQ6AYYnx9xFzXahKG4gl7fZYH
X-Proofpoint-ORIG-GUID: 7WjAyvfPsjy2AgCyh3bJAOsMltFfIPCt
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695a5f00 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Bpi_U_enSnNp422sU5QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601040113
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 14/12/25 6:32 pm, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>
> This is slightly tested of ppc64le and ppc32.
>
> The performance benchmarks are below:
>
> perf bench syscall usec/op
>
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
> | getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
> | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> | execve usec/op  | 360.939    | 365.168       | -1.16%   |
>
>
> perf bench syscall ops/sec
>
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
> | getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
> | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> | execve ops/sec  | 2,770      | 2,738         | +1.16%   |
>
> IPI latency benchmark
>
> | Metric                  | With Patch       | Without Patch    | % Change |
> | ----------------------- | ---------------- | ---------------- | -------- |
> | Dry-run (ns)            | 206,675.81       | 206,719.36       | -0.02%   |
> | Self-IPI avg (ns)       | 1,939,991.00     | 1,976,116.15     | -1.83%   |
> | Self-IPI max (ns)       | 3,533,718.93     | 3,582,650.33     | -1.37%   |
> | Normal IPI avg (ns)     | 111,110,034.23   | 110,513,373.51   | +0.54%   |
> | Normal IPI max (ns)     | 150,393,442.64   | 149,669,477.89   | +0.48%   |
> | Broadcast IPI max (ns)  | 3,978,231,022.96 | 4,359,916,859.46 | -8.73%   |
> | Broadcast lock max (ns) | 4,025,425,714.49 | 4,384,956,730.83 | -8.20%   |
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
> V1 -> V2
>   - Fix an issue where context tracking was showing warnings for
>     incorrect context
> V1: https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.com/
>
> RFC -> PATCH V1
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
>   arch/powerpc/include/asm/entry-common.h | 536 ++++++++++++++++++++++++
>   arch/powerpc/include/asm/hw_irq.h       |   4 +-
>   arch/powerpc/include/asm/interrupt.h    | 401 +++---------------
>   arch/powerpc/include/asm/ptrace.h       |   3 +
>   arch/powerpc/include/asm/stacktrace.h   |   6 +
>   arch/powerpc/include/asm/syscall.h      |   5 +
>   arch/powerpc/include/asm/thread_info.h  |   1 +
>   arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>   arch/powerpc/kernel/asm-offsets.c       |   1 +
>   arch/powerpc/kernel/interrupt.c         | 255 ++---------
>   arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
>   arch/powerpc/kernel/signal.c            |   8 +
>   arch/powerpc/kernel/syscall.c           | 119 +-----
>   arch/powerpc/kernel/traps.c             |   2 +-
>   arch/powerpc/kernel/watchdog.c          |   2 +-
>   arch/powerpc/perf/core-book3s.c         |   2 +-
>   17 files changed, 685 insertions(+), 818 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h

Hi,


I have reviewed and tested the generic IRQ entry/exist patch series. 
Below are my observations:

Test Coverage
Successfully ran LTP (specially syscall) and entire LTP test suite, 
without observing any regressions or issues related to the implementation.
Successfully ran kernel self test and no regressions are observed.

System Configuration
• CPUs: 80
• Kernel: 6.19.0-rc1
• Processor mode: Dedicated


Performance Evaluation
• Conducted bench marking using "perf bench syscall usec/ops".
• No functional regressions observed, and results were consistent with 
expectations.

| Test                   |  With Patch   | Without Patch  | % Change |
| -------------  |  —————   | ——————    | -------- |
| getppid ops/sec | 9,901,942    | 10,066,131     | -1.63%     |
| getpgid ops/sec | 9,886,533    | 9,978,781       | -0.92%     |
| fork ops/sec       | 2,571           | 2,601             | -1.15%    |
| execve ops/sec   | 2,567           | 2,542             | +0.98% |


Please add below tag:

Tested-by: Samir M <samir@linux.ibm.com>


Thanks,

Samir


