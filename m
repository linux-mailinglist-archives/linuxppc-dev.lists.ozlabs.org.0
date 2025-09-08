Return-Path: <linuxppc-dev+bounces-11889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B545B49B67
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKF72Yjtz2ySm;
	Tue,  9 Sep 2025 07:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365435;
	cv=none; b=kh+mkQLSryDnMkVXfyozz+YZOJSKx7R2WxtmcyPLpEN6LiUAApod0FNkYCTbOwnWQSoZtEQKbno/KwtpIuYl+DwJyo+4vcut21lwz3XG+mSxyFk4Nbyvjh7m4SIRA3+KMPPJI0rPfljcg/SRo98+eFfzpAtdJw7STDQm6DmNHQsKA7UEYbk8v1KB40UOwrT2pgRCcJ8xXD0OIJ6QqEu6kCYhx/LUevZ+HtbAwIHfgDsssf6ocHJkYZ3KbxFmd8Rl5pOL+weuikmHCyCjy2p8lg5xTOWeUMhW9cVPQ6EqqYWnlst6xVGZV5TAUqdR+LlyAEeNi0jChsYFFAmQaEbuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365435; c=relaxed/relaxed;
	bh=TxXmtbRDof/tqCBn2kWDQQrJuPkPOHGNbejq/garmMw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eDEvEdHTMc1Ctf7WPQaqrd+CjTeFaF/6LFaruiuubwCiGXz38mFTWm661Hd9Qq631p8NVbVTJw+hXvHsUp0sHSLRXzp0QV1TAvhe2OOEx2wbRH8u7TN3JNtLpOPoEi0lixWWNcqBRcWT3cC0KEAHlQ3vdyNtJ6fecaxBfO75MFm9OvtQilfaEUyWrCirpQAF0sm3zCihC1BNRQ0JRyUWsWnq9pNbCrH5R0z9PrTHLYBo5tjraHW9AaTYRYJRDe1ApxuXZOagvyYdD27+Xp2i0MHYoOk7Egpyb/I9rOciStShNtF7IBvVe5oQQKxx03g6WzVQgNXYXFPO19LcEX1liw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz/hBNzV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zz/hBNzV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKF623tJz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:03:53 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GqNe0004387;
	Mon, 8 Sep 2025 21:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=TxXmtbRDof/tqCBn2kWDQQrJuPkP
	OHGNbejq/garmMw=; b=Zz/hBNzV23CVHkbY1r49upeCgiEkaMkytX0/4UZ3+FUz
	4H7+DsbvQBRDXouOPTm0PoXgKcc1aCYT6RmB9vNjl1RQ7XMuftoLtirW/wWrrGwZ
	6QrxfSSDAygjJPC9FH4RTVtg+UstncVIcuNIBhnQescnesfk/BK6ALb/9jjtUgPa
	CEPaV0aV8TrnpbQ8b8MpxoxBoH4d1bkCH6oZ7S4kaBhiW5Xt0nXNUlWagne+2r7Q
	ejB47ixr3aw678NjxK2vkysInKrMBVN8G4dNDUqPtF+4pkfBpBahW9fHSJuoIS7r
	xVdrw8a1/IuTqKb/4pN3VAnSa1ZlZTOjnj/+2OGiuw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsksrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:27 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588KvUCR003431;
	Mon, 8 Sep 2025 21:03:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsksrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588KCMBU020458;
	Mon, 8 Sep 2025 21:03:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0r33d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L3Lg454723042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:03:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A434820040;
	Mon,  8 Sep 2025 21:03:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C341020049;
	Mon,  8 Sep 2025 21:03:13 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:03:13 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, charlie@rivosinc.com,
        akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC V2 0/8] Generic IRQ entry/exit support for powerpc
Date: Tue,  9 Sep 2025 02:32:28 +0530
Message-ID: <20250908210235.137300-2-mchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX/kn0XNBk1pqh
 G6hMShw5lExP8JA/wbunQ2Ba023Q0Z7fiIaJRJSXOdKZQWUunO87kYNNKyCd/s7Eu5sBGhwK3Wq
 fWkwMGuoxDTrvQL8kg783l6iGDnZN5t8AhfqHLdRoyrJvQpQEgI/UYJhYG40+MzJmsfo4vF1OKj
 GKTarqX9tIHwjnqyPjXn9ZDmRUFblSyWydhXl6zjF5/9Luu4JoO3+/hdw0giBnw/pPIlnfFYzoj
 rNQwQhjtXM724/FNcFGM+nQDGtXjCIblnlQimxifCvvJkfxc25dx8RsLfMPdZHIpFJ0zMSeRlD3
 XtQS82jiFFV8ZqulAUHE49booIPITHxHuoySLTIbPzYtgc5t4hNElcS68MPiOqx5uqWP6XyupHe
 HmnHmWE4
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bf449f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=4vtfHP31wVu_lv1VMw4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TQqEA0mI5BoNRm1Y_yetjOoNdhDII7SK
X-Proofpoint-ORIG-GUID: txrgkYK7in8xLtAk-A3R7EXaGmrixyXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adding support for the generic irq entry/exit handling for PowerPC. The
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
V1 -> V2: Support added for irq with generic framework.

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

-- 
2.51.0


