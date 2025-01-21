Return-Path: <linuxppc-dev+bounces-5432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D25A176B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 05:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcZZZ4KDyz2yvn;
	Tue, 21 Jan 2025 15:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737435158;
	cv=none; b=GtbcmwIpFnivqbIWtgyHB+sCkfjwYv1lvHle3AWoHtkQWKmfN569ihYrfrCm2YMGWRFAAc7DyDPvd3T5SfBRGASz5suX3GvwWoADx/Aa1nGwiwBmUSrBbo8mpiI2h1kyrZyPWNeGIYVRSfeHJye6stVcGKpWfUoi9jDJMqRwrGT8IiKxslWMRG8zhIvk0bu8l6+A2HhW41xbyTgcKRL5hntbz8jq699yFk0ULoZu4yUR/M8aK580IAqD48DaO0P0az5Oj1cYpJrC7Bqu7W2KWCz7+YT+4QMHHqu3+SifU62Ag9bCIDCo6FtVEaOdOAsCdAvSbvKUMCc8dQ7Yi+jsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737435158; c=relaxed/relaxed;
	bh=5KbdImiF1RKBvdCX3gM7aT0AeP+DtboTYUuKXQq7sFI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WDY9wp7EukA2zmUsUlWgx+w0RFEpcMV1BHvP6tRU2yVhl2hGXB8MUGAiXUfPmQnETSkK3sYMwtW2V9eNT63G9TTzG1uD+YN7nF89qnuXo+CeDMlPYEgdBbjkS3I1B0DOp3YhrS7NlOqzZwikDDceocXZifKy5AvO6V6dWuUEtt6sKRyqH04slnWyBOinJo27tjEY+IZr6o4k24JtXOv55qRsckigQk2cOCElUSQKtXRoBbK/dw0oBObr/PoOjjSvVG6kkZ2V2QVPivy/XpJ2GiJ9DYIFLVhbNYCeOSbHWmkmcc//1+4rciJ43ZhOPFqse1/uTDNO6ftfIgy6gNE6RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZQtkM2Zf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZQtkM2Zf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcZZY1dKqz2yRP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 15:52:36 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L20bEo003007;
	Tue, 21 Jan 2025 04:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=5KbdImiF1RKBvdCX3gM7aT0AeP+D
	tboTYUuKXQq7sFI=; b=ZQtkM2ZfkxRGKKI205oX0qxL5IXWCakrnO/Gy529/3Tj
	MNqRluYEruajiKeE7qWTtzmVgLB+UIiaVUHq6A/CZn7jELGHVAvjSOv+lgpUtmf7
	C9rHPg/RQ6VQL05dPhh5/IF4YVsPYKD1kjAfvrnRlk4/z342kx65Auq6X2DjR2MC
	TQI5O2/42RgLPehGHrQwhN1/BO13xgTXEaqAFb9y8cXVc5VO653TppH+4/1KRPNg
	W9dL2RucLhnlKCFYKxlO9dVH3bRwz8QSEDT87JagD5K/gLUaIVtortTPhCQkPf/J
	6YdpqkGPue4ZCS9mrc9TodTghZzKMkYXwSAQO5+P/Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a2dy8hra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 04:51:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50L4oNSF005327;
	Tue, 21 Jan 2025 04:51:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a2dy8hr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 04:51:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L0gD9Z024231;
	Tue, 21 Jan 2025 04:51:54 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y1kpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 04:51:54 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50L4pq0k28705512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 04:51:53 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD24B58056;
	Tue, 21 Jan 2025 04:51:52 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D962458052;
	Tue, 21 Jan 2025 04:51:44 +0000 (GMT)
Received: from [9.43.94.27] (unknown [9.43.94.27])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 04:51:44 +0000 (GMT)
Message-ID: <f16ef6fe-c9ca-42eb-8388-cbcc5ad1261c@linux.ibm.com>
Date: Tue, 21 Jan 2025 10:21:42 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ajd@linux.ibm.com, andriy.shevchenko@linux.intel.com,
        christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com,
        gbatra@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, luis.hernandez093@gmail.com,
        sourabhjain@linux.ibm.com, sshegde@linux.ibm.com,
        thorsten.blum@linux.dev, zhujun2@cmss.chinamobile.com,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naveen N Rao <naveen@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-1 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qxNKSktv0JDEksAohfsATTy9yCHeqr3U
X-Proofpoint-ORIG-GUID: ZHTP3vN336lx7dlMasoCWIY1ALyOdFG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210035
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.14.

There is one trivial conflict in arch/powerpc/Kconfig with the mm tree.
More info 
  https://lore.kernel.org/all/20250109104611.2491cc3b@canb.auug.org.au/

Thanks

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-1

for you to fetch changes up to 2bf66e66d2e6feece6175ec09ec590a0a8563bdd:

  selftests/powerpc: Fix argument order to timer_sub() (2025-01-11 10:39:45 +0530)

- ------------------------------------------------------------------
powerpc updates for 6.14

 - Add preempt lazy support

 - Deprecate cxl and cxl flash driver

 - Fix a possible IOMMU related OOPS at boot on pSeries

 - Optimize sched_clock() in ppc32 by replacing mulhdu() by mul_u64_u64_shr()

Thanks to: Andrew Donnellan, Andy Shevchenko, Ankur Arora, Christophe Leroy,
Frederic Barrat, Gaurav Batra, Luis Felipe Hernandez, Michael Ellerman, Nilay
Shroff, Ricardo B. Marliere, Ritesh Harjani (IBM), Sebastian Andrzej Siewior,
Shrikanth Hegde, Sourabh Jain, Thorsten Blum, Zhu Jun.

- ------------------------------------------------------------------
Andrew Donnellan (2):
      cxl: Deprecate driver
      scsi/cxlflash: Deprecate driver

Andy Shevchenko (1):
      powerpc/8xx: Drop legacy-of-mm-gpiochip.h header

Christophe Leroy (2):
      powerpc/32: Replace mulhdu() by mul_u64_u64_shr()
      powerpc/vdso: Mark the vDSO code read-only after init

Gaurav Batra (1):
      powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW

Luis Felipe Hernandez (1):
      macintosh: declare ctl_table as const

Madhavan Srinivasan (3):
      selftest/powerpc/ptrace/core-pkey: Remove duplicate macros
      selftest/powerpc/ptrace/ptrace-pkey: Remove duplicate macros
      selftest/powerpc/ptrace: Cleanup duplicate macro definitions

Michael Ellerman (3):
      powerpc/64: Use get_user() in start_thread()
      powerpc/prom_init: Use IS_ENABLED()
      selftests/powerpc: Fix argument order to timer_sub()

Shrikanth Hegde (2):
      powerpc: Add preempt lazy support
      powerpc: Large user copy aware of full:rt:lazy preemption

Sourabh Jain (1):
      powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active

Thorsten Blum (2):
      powerpc/xmon: Use str_yes_no() helper in dump_one_paca()
      powerpc: Use str_on_off() helper in check_cache_coherency()

Zhu Jun (1):
      selftests/powerpc: Fix typo in test-vphn.c


 Documentation/ABI/{testing => obsolete}/sysfs-class-cxl   |   3 +
 MAINTAINERS                                               |   4 +-
 arch/powerpc/Kconfig                                      |   1 +
 arch/powerpc/include/asm/hugetlb.h                        |   9 ++
 arch/powerpc/include/asm/thread_info.h                    |   9 +-
 arch/powerpc/include/asm/time.h                           |   2 +-
 arch/powerpc/kernel/interrupt.c                           |   4 +-
 arch/powerpc/kernel/iommu.c                               |   2 +-
 arch/powerpc/kernel/misc_32.S                             |  26 -----
 arch/powerpc/kernel/process.c                             |   4 +-
 arch/powerpc/kernel/prom_init.c                           |  39 +++----
 arch/powerpc/kernel/setup-common.c                        |   4 +-
 arch/powerpc/kernel/vdso32_wrapper.S                      |   2 +-
 arch/powerpc/kernel/vdso64_wrapper.S                      |   2 +-
 arch/powerpc/lib/vmx-helper.c                             |   2 +-
 arch/powerpc/platforms/8xx/cpm1.c                         | 119 ++++++++++----------
 arch/powerpc/platforms/pseries/iommu.c                    |   9 +-
 arch/powerpc/xmon/xmon.c                                  |   6 +-
 drivers/macintosh/mac_hid.c                               |   2 +-
 drivers/misc/cxl/Kconfig                                  |   6 +-
 drivers/misc/cxl/of.c                                     |   2 +
 drivers/misc/cxl/pci.c                                    |   2 +
 drivers/scsi/cxlflash/Kconfig                             |   6 +-
 drivers/scsi/cxlflash/main.c                              |   2 +
 tools/testing/selftests/powerpc/benchmarks/gettimeofday.c |   2 +-
 tools/testing/selftests/powerpc/include/pkeys.h           |   8 ++
 tools/testing/selftests/powerpc/ptrace/core-pkey.c        |  31 +----
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c      |  26 +----
 tools/testing/selftests/powerpc/vphn/test-vphn.c          |   2 +-
 29 files changed, 142 insertions(+), 194 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-class-cxl (99%)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmePJuoACgkQpnEsdPSH
ZJTjXhAAgFs4D7pJzwpRqI+yw0ThAkFnCPXAdGvK92l0qoeUSJoYS9dJYQC0FFvM
caYruP0pu1IX4azxcyVH2krMKquQLVMdyfYIy4VCqcL7vq0it3iSiGc1fDx4IK1/
bkwfkisbcw7l306OMO75F2Ks2FXsiSs8z7uluBZcyBcD4002y05knHB0DXUN86L5
sKtLRHwwy4VrJh9+wXm0Yy0aHdc8MAn2NgAv1YYe/DSqTaXTd9PN5Jv7wgNomYg/
aENT/jH6qkcAPlicpG9sTBtCvDD7JKPT8ctk2Hv1BFXj4/87K+L0pmhPOJGcxp2m
J3MFxSvV+zZr/xBTRTzrlrbLlgQ8JCURakcQL8DHhXsd7FsYEtk3eepSPEa7G+hO
r5eEdRtsTkYxm3hmcvbLayNOcjD5mliIvd4xk8LgHGiPWpYaHVcTq/tlR262NByy
g6+Fw1DiQQLBexW443U0AIfOR83mP8Ky3jhnoX7mvP11WXWoMpQDbw/Q6F5iBMba
5vEeJXoanI6gAwv3xSXmLU9SR1xLptoTI8z4LEJX0GS4KnndRPR229s7NI5SOKtQ
9BfRgFh8gAnGZzpEUyBskaQ1dOMSSHJ5EHlSoKiTIlqwhUeguSLkId1ZZuzHtQqc
OTEQ4W+0uuVuYXWLBW9tncHFLfcPYUGeOOlRmtpyp1tPpdXPvT8=
=CkEq
-----END PGP SIGNATURE-----

