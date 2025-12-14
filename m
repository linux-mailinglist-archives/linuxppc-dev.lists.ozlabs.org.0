Return-Path: <linuxppc-dev+bounces-14745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E27CBBACC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1K1lZ9z2yDk;
	Mon, 15 Dec 2025 00:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717476;
	cv=none; b=gtw6MQt43sGQXpH21GOd8kGmLBaxD1YdTg8oQ5yP52XkGa2N/7Nzu9BK2LUa3fGWjkPHGalTvM7jyvvbJ5Tx40teTzpJNBEQv4okxPQqSMh/pHrBlY5DJjLPxY0EyUDXqZEeHH6+feaNWXEKtPYM5v6XRPHnho10L8B8DZgXkBNehlnlD1vct/Ox1jamedurwbK7En+i3fBLfG7CSTNuEovWlJeUyQNgXI03faCsdCBNY5XHhIyfyDaDxDLcKAhA+dmk/Q7PDdfBpHPpTFXpJJOjJPa3YdFHYNbTtnoyhDyeGGGrzaqVKIemLICs6NLj/tX7fY5P7tVEjEOUsq3uMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717476; c=relaxed/relaxed;
	bh=vBwOxq2c4HmXdhYsrDb6DsL37b63k04biUxI5e7gwKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SdaBbDQyz9V+6B3hPGanZcTT0sCqXTFZCulR43HscZsYH3ODe9umO3lKefLzd+pZdY6x8ICQLO6x3ClsJubTkxc/O1iq/gM7vGfKONgh2N1EbfBXPLW2k0qPFITfODlcfUec7qMT+AjWJTpq8MMv9O2EPP9QnVkJJLAAZf6gE2yQKTgPRlrs+qEw/3fkFA0Q8PaULPHTqeyBjN0zvyRmFAXFg6HJLR0tEl4o8RxAbgEuJGg5kYnbjtPNaG53i19zbCxiRiTIlEailqUzgjmSD+47U45ubv4gS+BQgdSvczF3AR+q91PaVn5aGxm4U7x3YJDvYPMzeu6SrwUZR7Y87A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lc5bU8M5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lc5bU8M5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1H2P7yz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEBSj48031620;
	Sun, 14 Dec 2025 13:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=vBwOxq2c4HmXdhYsrDb6DsL37b63
	k04biUxI5e7gwKo=; b=lc5bU8M5wFTqfMoNEGC2OY3UZOsDQARrn20oqZWmGBN8
	mGhYPi0wgcOrovImyyc8P4v48HkP456LKSxvj24gXLJ/CL7MSqR4VR2f2x940KPD
	sCZYUK+4BSwOgM8TqNUwgd71p1u8zPuT5sEmsRB9Xf6w4Lc9U31tnC6sct09iJtU
	1S5lYF2fybrCdi4y1RfVFmsBZ6ZqEPGFZXmKMcnnONFeSb+9oHJZCqLPctFpI5Hd
	axrUiWu3NUSqyLaa8/C56Pf1kvOVwcDhSD06f20VJijTrp/fAqY/xI1wkzNBoGZ7
	ToLweaBUrKMvUxDlJmV3Enavx6TTBm0ctO+rFlhg5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED06Qu029583;
	Sun, 14 Dec 2025 13:03:42 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEC0bQw002761;
	Sun, 14 Dec 2025 13:03:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfmswex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED3blB48038302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:03:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDE5A20043;
	Sun, 14 Dec 2025 13:03:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87BEE20040;
	Sun, 14 Dec 2025 13:03:31 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:03:31 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Subject: [PATCH v2 0/8] Generic IRQ entry/exit support for powerpc
Date: Sun, 14 Dec 2025 18:32:36 +0530
Message-ID: <20251214130245.43664-1-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IBlRdxSFJqG3v6yO0YydT6G6miYyJ2Mj
X-Proofpoint-ORIG-GUID: XSb_3rnMIXc1Va832WyHEsU8EG3-9-Ac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX2ZiRdLX3s+lo
 K3QJvjBSowjthrMtdku84L65aHQ/Oe+aGYMXLUhhcv9qZwqbPRWXgcSr6asYX142xU+0k2ReIZe
 jvBzixgxgNO0TGSAJaBZq0oYdhFLxWYpfmfCNEzNT4apTOZ7uR5LLrhexzj3N9XLcyKGtXn++cK
 zQZMDRblyMeE0KyR9D3GyzYR6n4xhIH+KsANJla6B+F8MZzFPC/8KJ8eqxUeKKoUaq7aw6UHVHm
 uvGZ31e0w60yXhj/ZRn3E0jXpzNJw9yQn5JYvQ+WoPFq6GMMtT/Riyj/dqdPNN07npF5E3JObiB
 e+smSLEewaQWwnBmgvZ3yCtyBg9kduhr39UYKsYeJBOrgeHVqPWcXmLGCgJHNq1Lc3XELbu9e9B
 jrGTS/FzPoBDNsN0oxu6E2NGIiftVw==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=693eb5af cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ajJRod60m5W90iKeD0sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adding support for the generic irq entry/exit handling for PowerPC. The
goal is to bring PowerPC in line with other architectures that already
use the common irq entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths.

This is slightly tested of ppc64le and ppc32.

The performance benchmarks are below:

perf bench syscall usec/op

| Test            | With Patch | Without Patch | % Change |
| --------------- | ---------- | ------------- | -------- |
| getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
| getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
| fork usec/op    | 833.986    | 814.809       | +2.35%   |
| execve usec/op  | 360.939    | 365.168       | -1.16%   | 


perf bench syscall ops/sec

| Test            | With Patch | Without Patch | % Change |
| --------------- | ---------- | ------------- | -------- |
| getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
| getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
| fork ops/sec    | 1,199      | 1,227         | -2.28%   |
| execve ops/sec  | 2,770      | 2,738         | +1.16%   |

IPI latency benchmark

| Metric                  | With Patch       | Without Patch    | % Change |
| ----------------------- | ---------------- | ---------------- | -------- |
| Dry-run (ns)            | 206,675.81       | 206,719.36       | -0.02%   |
| Self-IPI avg (ns)       | 1,939,991.00     | 1,976,116.15     | -1.83%   |
| Self-IPI max (ns)       | 3,533,718.93     | 3,582,650.33     | -1.37%   |
| Normal IPI avg (ns)     | 111,110,034.23   | 110,513,373.51   | +0.54%   |
| Normal IPI max (ns)     | 150,393,442.64   | 149,669,477.89   | +0.48%   |
| Broadcast IPI max (ns)  | 3,978,231,022.96 | 4,359,916,859.46 | -8.73%   |
| Broadcast lock max (ns) | 4,025,425,714.49 | 4,384,956,730.83 | -8.20%   |

Thats very close to performance earlier with arch specific handling.

Tests done:
 - Build and boot on ppc64le pseries.
 - Build and boot on ppc64le powernv8 powernv9 powernv10.
 - Build and boot on ppc32.
 - Performance benchmark done with perf syscall basic on pseries.

Changelog:

V1 -> V2
 - Fix an issue where context tracking was showing warnings for
   incorrect context
V1: https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.com/

RFC -> PATCH V1
 - Fix for ppc32 spitting out kuap lock warnings.
 - ppc64le powernv8 crash fix.
 - Review comments incorporated from previous RFC.
RFC https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/

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
 arch/powerpc/include/asm/entry-common.h | 536 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 401 +++---------------
 arch/powerpc/include/asm/ptrace.h       |   3 +
 arch/powerpc/include/asm/stacktrace.h   |   6 +
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
 arch/powerpc/kernel/asm-offsets.c       |   1 +
 arch/powerpc/kernel/interrupt.c         | 255 ++---------
 arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
 arch/powerpc/kernel/signal.c            |   8 +
 arch/powerpc/kernel/syscall.c           | 119 +-----
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 17 files changed, 685 insertions(+), 818 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

-- 
2.52.0


