Return-Path: <linuxppc-dev+bounces-5440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB18FA17D4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycly30cx1z3045;
	Tue, 21 Jan 2025 22:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737460506;
	cv=none; b=D0sWfoUL7reglBYbyaVZGOYruKy+BANYU2FrsbFxVw3a/zCNPSfFLY+7NcqPyhz3mLV6XuFgplnIFO1Wd/+L9O6aY34tbrkKVHtAkIIDF8LL/GuCP3GI8j57eukZbYRUvvn4qat6dO9XtregAPaVZzKoxkqNcmXBc/nyPwO52xTfHk5xYKfDFWwEapJ2AeDHSTZBK11B8mh4vXI9mx3TXHxS61okOl3P7ytVeJ6q8Ms1VH7scfnPU6U1L7vvEzAusPHiO7LulHw668spxxolM5m/JECVjUAZ72yamaFEAvUgfdiE0DTuk02ROdpjQWVvGwft17Kp8UynbZhJD8yxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737460506; c=relaxed/relaxed;
	bh=dLbhr622cQ1xIK0R85mQA3G5m9RnW7dW6gcJ5N4+qVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4ApU0pRYjYNrDroET0+WGtG19M1dFHC1nvYeWYjIcGmiTVtxUkd7ChamB9kVyhRR+UU8RdSTpF4MHKaDEqYzp+mnlUEcZDR1qSf0FB0gnz+zVFfptlTteBWls4qOa03jDcz4oQ3w6Cq0aWPPYv+31BJkiXXkxIFOfFH+YVeZA4+Lh6WGLJZgVkftavFUKY/Ha+sgVLhOl50dzO/FLnPHQ7darr76119Pgi396oKX7UjjpqIRGIj23zPgC0KuucHNJvN6Rd2tz9ndSyc1FgtPHPTkIvDQzFR/TJg5B6JyWcm6tWxLQYfm/ETWg4NOXyWXZxOOhkweixxbyGsMwWNzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HwD6PcpE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HwD6PcpE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycly20N76z2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:55:05 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1950Q023030;
	Tue, 21 Jan 2025 11:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=dLbhr622cQ1xIK0R85mQA3G5m9RnW7dW6gcJ5N4+q
	Vk=; b=HwD6PcpE81dnGL3Doy1ZUNd7DYKiW41wc2QIzqnjwS0oPlsMotiL9NVWu
	NChiGlqer4g3Kp2L7GXOwzbADOiHlWSiXk5QXostGHwneg3jWoUFUa5fr4VWN/EQ
	rBCDdHX2ihn5M8EyQde0Rvd2yONq9OAjg1tu3Carp/MqSpQQ+4+7V1ujuWMa171N
	13MW/BgK7PvEqZkaAf6DqyI3zlClG6SoOKVEYYy7ih1GMjNSlwQXf+iN3CIIgn4Y
	mzY7/2DvTJa5LUYYnGIsGtvWnXlJsTwwtHI1XfMtJ32UB3Eho3bBqEuBy7bZVIWI
	4hv/3zsaXxkltXMDRnZeIO4sqL9vg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a1n9ah3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LAufS6032261;
	Tue, 21 Jan 2025 11:54:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujjpk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LBsn7Z59441448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:54:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ECFA2004B;
	Tue, 21 Jan 2025 11:54:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C3CF20040;
	Tue, 21 Jan 2025 11:54:46 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 11:54:46 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] powerpc/crash: use generic crashkernel reservation
Date: Tue, 21 Jan 2025 17:24:36 +0530
Message-ID: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s2Fd2Q7__MB_-Yrqi3Ft05a6Eb_k7m0U
X-Proofpoint-GUID: s2Fd2Q7__MB_-Yrqi3Ft05a6Eb_k7m0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=939
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 0ab97169aa05 ("crash_core: add generic function to do
reservation") added a generic function to reserve crashkernel memory.
So let's use the same function on powerpc and remove the
architecture-specific code that essentially does the same thing.

The generic crashkernel reservation also provides a way to split the
crashkernel reservation into high and low memory reservations, which can
be enabled for powerpc in the future.

Additionally move powerpc to use generic APIs to locate memory hole for
kexec segments while loading kdump kernel.

Patch series summary:
=====================
Patch 1-3: generic changes
Patch 4-5: powerpc changes
Patch 6:   generic + powerpc changes

Changelog:

v1 Resend:
 - Rebased on top of 6.13-rc6

v2:
 - 01/06 new patch, fixes a bug with ELF load address
   It was posted in community as individual path but
   since it align with this patch series so include here:
   https://lore.kernel.org/all/20241210091314.185785-1-sourabhjain@linux.ibm.com/
 - Fixed a typo 06/06
 - Added Acked-by and Reviewed-by tags
 - Rebased it on 6.13
 - It was suggested to try HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY and
   see if 03/06 patch can be avoided:
   https://lore.kernel.org/all/Z35gnO2N%2FLFt1E7E@MiWiFi-R3L-srv/
   But after adding HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY the issue
   persisted and kernel prints below logs on boot:

   [    0.646339] ------------[ cut here ]------------
   [    0.646351] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/mem.c:379
   add_system_ram_resources+0xf0/0x15c
   [    0.646369] Modules linked in:
   [    0.646376] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
   6.13.0-rc6+ #1
   [    0.646386] Hardware name: IBM,9105-22A POWER10 (architected)
   0x800200 0xf000006 of:IBM,FW1060.00 (NL1060_027) hv:phyp pSeries
   [    0.646397] NIP:  c000000002016b3c LR: c000000002016b34 CTR:
   0000000000000000
   [    0.646406] REGS: c000000004817920 TRAP: 0700   Not tainted
   (6.13.0-rc6+)
   e8/0x15c (unreliable)
   [    0.646603] [c000000004817c20] [c000000000010a4c]
   do_one_initcall+0x7c/0x39c
   [    0.646618] [c000000004817d00] [c000000002005418]
   do_initcalls+0x144/0x18c
   0x290
   [    0.646648] [c000000004817df0] [c0000000000110f4]
   kernel_init+0x2c/0x1b8
   +0x14/0x1c
   [    0.646676] --- interrupt: 0 at 0x0
   010020 
   [    0.646720] ---[ end trace 0000000000000000 ]---

   So 03/06 is not removed from patch series.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: sourabhjain@linux.ibm.com

Sourabh Jain (6):
  kexec: Initialize ELF lowest address to ULONG_MAX
  crash: remove an unused argument from reserve_crashkernel_generic()
  crash: let arch decide crash memory export to iomem_resource
  powerpc/kdump: preserve user-specified memory limit
  powerpc/crash: use generic crashkernel reservation
  crash: option to let arch decide mem range is usable

 arch/arm64/mm/init.c                     |   6 +-
 arch/loongarch/kernel/setup.c            |   5 +-
 arch/powerpc/Kconfig                     |   3 +
 arch/powerpc/include/asm/crash_reserve.h |  18 ++
 arch/powerpc/include/asm/kexec.h         |  10 +-
 arch/powerpc/kernel/prom.c               |   2 +-
 arch/powerpc/kexec/core.c                |  96 ++++-----
 arch/powerpc/kexec/file_load_64.c        | 259 +----------------------
 arch/riscv/mm/init.c                     |   6 +-
 arch/x86/kernel/setup.c                  |   6 +-
 include/linux/crash_reserve.h            |  22 +-
 include/linux/kexec.h                    |   9 +
 kernel/crash_reserve.c                   |  12 +-
 kernel/kexec_elf.c                       |   2 +-
 kernel/kexec_file.c                      |  12 ++
 15 files changed, 128 insertions(+), 340 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crash_reserve.h

-- 
2.47.1


