Return-Path: <linuxppc-dev+bounces-13670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52433C28E96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:55:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cztSX3pb3z3c4d;
	Sun,  2 Nov 2025 22:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762084508;
	cv=none; b=EAmTDuXSaxRrsX9I4dY5+o7SFV786SFM0h+pfRDfS+aQmFV6+9NbIM59yL6L+ody7kKy3mG3/+I/Cl0drnj8eG0g3FRCMm3HfLyedNxaXML0O+Qzlr3QlL8MnYuHNjrXJuJbmNDkjLd2RvJrAL/t72zDno3ykRM2s6FqtYs+2Hv3mrBjW1pXBbR0kEyO3Dlp+mXQsVvRQNnKg4rcxNS2xHA+UjvHeR/D/sGLKHUYfqqI3qF/wgwlPsQwIQI8gtDpU+++W658QrNywhMkurvLjO2FpFL1u5tw7zEP1+dgjdR0Iial7x+36qTIOBzDpzaL5JWwCg4i4mHKjKm09IrF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762084508; c=relaxed/relaxed;
	bh=iwbUwV0qr81phhc2S4PU4EBv5gS2BQ5tncp35yI1I7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPopXrK0wSaeGc46/K1dfKPC2WNbxggI3/Odtkvl0RRHQDMZ9mVGGVmdoQBCjL5cIjxlJ+6W8ctFVHMbfdP4lyQlRt9uBAtPQZ0miI7EyelFsU2C2NVtmmpLwVjfT/w6jBt8ZJWlfxQF+/kBi0E8dzf/HSvhkNgmnk5OYhl0CSW9PLYduQIuy7xAAmVwkY8bfTnKAvVK2D0hGwKkAdY8uBvRdHRCY8pUVfeTiQcVnp5lKy1fxs+y4p+Po8Gg+kPfsdhZHALiJEeOW3GWbLnoEitqbbgz0bI5fsbCcov2o/7P9sImf1Gz632rL5PoC32TJHaLbfuWl1Sg1nYzxFVbTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZehCutSp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZehCutSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cztSV3Mlnz3bsC
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:55:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A23PAC3010837;
	Sun, 2 Nov 2025 11:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=iwbUwV0qr81phhc2S4PU4EBv5gS2
	BQ5tncp35yI1I7c=; b=ZehCutSpdK6jcUcupgDQsD4xHRNOTVhV+AD/6muymKH8
	A0mAaCn0sEpjxERG+iBHo9uikqZCulsaHByGb7sUtkewvGkqB2y+o9CHrnJ2l2hq
	vmR3RcDKQKkAtBqi/nV42BUSO6z4oBCS1+9tvUcIqzX04DNczwbPixJmahsD9xnk
	Mml4FNHGbcB/jC+4IPwMMPGu1ppKEWZeyFZbxMRLQg2C4S5ss4oHsMUwomNohClw
	fqNiotBNZg+X+kfokDKTgaAq0cyEliqFoPEjCPknADHsK3orp4Yiw07L4rY1io3f
	91i7Pxvkq92G5UiESQ2jpKM/wxLCZD5xVNw/D+9xnw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xbka9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:13 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A2BsDno026666;
	Sun, 2 Nov 2025 11:54:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xbka9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2ABBum012849;
	Sun, 2 Nov 2025 11:54:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y81h3rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A2Bs8RY57016828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Nov 2025 11:54:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E5C420043;
	Sun,  2 Nov 2025 11:54:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D263F20040;
	Sun,  2 Nov 2025 11:54:02 +0000 (GMT)
Received: from li-ce33bfcc-25cf-11b2-a85c-dc105c39188e.ibm.com.com (unknown [9.124.213.75])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Nov 2025 11:54:02 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        tglx@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Subject: [PATCH 0/8] Generic IRQ entry/exit support for powerpc
Date: Sun,  2 Nov 2025 17:23:50 +0530
Message-ID: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX9bB9TkummDLz
 0K3+jKC5eGYeGqrtNoSt9HHWXw3GdJKQQhdnEozFVsj8a1wu+EM4LxcnebHMujcBlVd8wKUrG7t
 E5P6Bpd+2jP0QvdXCrzetdj/oHUknjqGafWpaKUGnbvEB7/J7rY/xepK2sK7x+WhRxHGCGc7+Cf
 zs3T6wa8MZkLs5pyAuwpVGBHZKmvyis+UDpiuKl8JOyljpzK1B3M5vr9XaoHSphjReoJC77Ewf5
 paM/4P12YOgoN6nYz5Wnn03hwt1h4yj83J5eRMdvX/LwQIyKw8QH+Grtioe0DqF95oEeiDqbzjt
 ogM9fyIGGSz7VBk6XnowJiOF2zQC0+ZiJmYh+qmPoDnzfUNKCEKIWslQgzFZbLhHP60qEbqyEVd
 chD8sMP3Z8N1K0C15O+jRXJzJ8NEzQ==
X-Proofpoint-GUID: H-NGZMWkqSPMdIpYCeg4_tMT8AbcptMX
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69074665 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Xpr0uQdN4OPqXG0lzrIA:9 a=QEXdDO2ut3YA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: Z_1dq1Gr05HlqT6afChqWd5mUQCERTIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adding support for the generic irq entry/exit handling for PowerPC. The
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

RFC -> PATCH
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

-- 
2.51.0


