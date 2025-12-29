Return-Path: <linuxppc-dev+bounces-15081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAFCE5ED0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSY6xHPz2yFp;
	Mon, 29 Dec 2025 15:55:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984157;
	cv=none; b=dHKb6dcEMLXgRcWgLfIKgHaEjrkr4EHNh8lxCWUWQOaiHJP3Osv5rwli+gIam0155jeeWo3aVgdAnUSWemhcIJ4O5636OurB3EL/ryBtIGJF/kS/uAT6/w+ndEpC7/KXusIc7S5SYI2gElH3tkCKCxjq9mmEt1YMpLwPhfb4Oib++SB0M6TZYyqEPvOqTi71FZErzj6WpNX60HviPW6kG1LAemx6fEfDA9vak+vlXqgxfqNsvjzSSTWXxuXFgFiQ1MNuwJLhCtcDITPcBkT9VxhKHVhEl+CBfiR0ABDw41G8XMSfQ+lulhkSrMDFWw6UzrxqJFyTS48fI86RCpighA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984157; c=relaxed/relaxed;
	bh=8S/ttZm53zQhIcy/NcXR67hJ13sDUEsAdEFVhwnHykE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=noCNgCFsQquyClW7ATk7KWnw3ElstYF2E21Fuf4nWkKP1cwrpWCwnoPsWm8RRnYg/7Lk5hXf1F+rzrQfSLu/bS6oANYUA69D6TbT5ow41KlzFoqpqJLuHFWgkB6/lOyfaqKtwzDyJWysy6oYXWNgAKC0BWFuIfJo4jx/0tvbh8dpdiumijov5fq9oUZkyaAk4ZJG/fZgub9c1NioHw9892mu+edfozBNj1ks8ZleKUsT4AqZESD9qW4MxYW4peou99r/u0Un+f4AmnL97KcKTlHH/1A0/84gVov/h6QiJm0UDNWVPkN+6y1OUDB/WwbCXJDon921TtWlJgnz9RCgdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QTgDEzON; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QTgDEzON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSX19BTz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:55:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSNIpUA024808;
	Mon, 29 Dec 2025 04:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=8S/ttZm53zQhIcy/NcXR67hJ13sD
	UEsAdEFVhwnHykE=; b=QTgDEzONoak7MxOkVA+Zl8HoTQbxzFE0+w/hDQ/mxogM
	5qx+VuAtQKnEzLVdCQD5y5zt14igLv6n7WpzXlhxTjuXuwbUZt1wjyQ2nDDcpALE
	+tyhr4Lhuk43+ITnfOm3BiT8TqwxXVDeJAeYETGS85a91uKi8hG1pXUpApIxDFtA
	7l1Abf8kztbveTLx8kr9c8tthBaYSchUGG8LrQ8GTNsA7Re3iYXC6jaJzh6dmptz
	kVIlqwZV2GqqOrZoDgvazN0l/T369hfgd8M08excECWeOjjEJa1wQ4H5+jZ3esWa
	G9OU4DfxdGMbMpiiMBjSHGkZdt4WavM0IJLzJjvCcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba4vjncjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4otkU022791;
	Mon, 29 Dec 2025 04:55:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba4vjncjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT2YD2m026049;
	Mon, 29 Dec 2025 04:55:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsn3yh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4svA031064488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:54:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C44A2004D;
	Mon, 29 Dec 2025 04:54:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E93020043;
	Mon, 29 Dec 2025 04:54:51 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:54:51 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Subject: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
Date: Mon, 29 Dec 2025 10:24:08 +0530
Message-ID: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=I7tohdgg c=1 sm=1 tr=0 ts=695209a6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ZH3TfmeqgBF4u7PPYS0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JYsT-wvLCo69bppE6gBkzU8DxE_bb1MR
X-Proofpoint-GUID: wk6jB_z7jdSDKpaHuJN2NxeewJUF7OJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX7JBNJwdcv6Z8
 SLf8GitaKtCivkjACE5CR0scyjHMS5Yp1bYrTZmu6vRiWjuvu6Yr0m0L0HauEEIf1hQtoY5Yrlx
 FX7Ov6H6uyaj6oGKJb20SHhF2SeIsVqq/n9YWMRG5uuKb6amOm7dEE90WFLv2ASqpfBeIyHJJRu
 yYIh6I1+AXx8lCVaIX8blMkGFpBYBsGo7hIG/NeNFp+g5IpbSUScogeGFGdeU5ABdMs596dHxnR
 2hgTPAZW4ol2v4pjds7CMStBs9u5wmK7CnBt6eYc/CewNWwUo8NnN6wYVAUzwFmOJLg1A7gjgac
 GZ1I2Dkece1Vv70SE7TEVJsq39MradPI4Ja69LECHAb6Pfrj7PUvBUWUmqEx7G5zQcUBnyXw3hl
 hvADh8tQcf4ToP1KusvFfrEEv3dLYPNVX6kYu3uGntmXG4EnXE4KFjsCepHf8SyJAKcn+GMSu4Q
 NYOYgnxxgPFrLF7mgyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512290041
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

| Syscall | Base       | New        | change % |
| ------- | ---------- | ---------- | -------- |
| basic   | 0.173212   | 0.133294   | -23.05   |
| execve  | 363.176190 | 357.148150 | -1.66    |
| fork    | 853.657880 | 840.268800 | -1.57    |
| getpgid | 0.174832   | 0.135372   | -22.57   |

perf bench syscall ops/sec

| Syscall | Base    | New     | change % |
| ------- | ------- | ------- | -------- |
| basic   | 6006021 | 7502236 | +24.91   |
| execve  | 2753    | 2800    | +1.71    |
| fork    | 1171    | 1190    | +1.62    |
| getpgid | 5942117 | 7387040 | +24.32   |

IPI latency benchmark

| Metric         | Base (ns)     | Test (ns)     | change % |
| -------------- | ------------- | ------------- | -------- |
| Dry-run        | 206652.45     | 209317.37     | +1.29    |
| Self-IPI       | 3567895.23    | 3590444.77    | +0.63    |
| Normal IPI     | 148570416.17  | 148564173.40  | -0.00    |
| Broadcast IPI  | 4033489673.38 | 4007319512.62 | -0.65    |
| Broadcast lock | 4011023005.48 | 4010267885.93 | -0.02    |


Thats very close to performance earlier with arch specific handling.

Tests done:
 - Build and boot on ppc64le pseries.
 - Build and boot on ppc64le powernv8 powernv9 powernv10.
 - Build and boot on ppc32.
 - Performance benchmark done with perf syscall basic on pseries.

Changelog:

V2 -> V3
 - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
 - Some functions made __always_inline
 - pt_regs padding changed to match 16byte interrupt stack alignment
 - And some cosmetic changes from reviews from earlier patch
V2: https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com/

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
 arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
 arch/powerpc/include/asm/ptrace.h       |   6 +-
 arch/powerpc/include/asm/signal.h       |   1 -
 arch/powerpc/include/asm/stacktrace.h   |   6 +
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
 arch/powerpc/kernel/interrupt.c         | 255 ++----------
 arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
 arch/powerpc/kernel/signal.c            |  25 +-
 arch/powerpc/kernel/syscall.c           | 119 +-----
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 17 files changed, 681 insertions(+), 824 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

-- 
2.52.0


