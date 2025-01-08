Return-Path: <linuxppc-dev+bounces-4829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D865A057CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:15:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkM11fBxz30Q3;
	Wed,  8 Jan 2025 21:15:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331325;
	cv=none; b=OjqNgPMgIDxA32ZTZ11Xf/pwD2RhBg0gAoZtLnMRUI9XTuNFzX4B67l1Bv5fNMNiYbBkTq6jDm9nEckGk0yA94pjWmT9SJhxA+S5bAmHKNqPK/SD+2XT07Ie1pg6jX7VNMWnQyhfD6U7HzBH0fuBldkrWXVS30oROQecZu0FdW2ewBW2CaScKG/vYoBDjbgaCQaKh81ulB7a0YFMcOLZFDxGdOLfIcK9CEuc1ikLaYnVERBUvu1NewhhNxKMnihFf0JaEeOqwyUMNinFe9Ulb67eURx2fQDsigrx8BHTJvRAm4BpoUe16PXJNuuXObKL7PaSB97ecbi4tlfzYWESqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331325; c=relaxed/relaxed;
	bh=W1r5waazukROmJZjcrfHhKFG3R48sy2zH19SxlSm3AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBX6HtQY+yrvdpyJkuITuyg+pgRQYE8CL1OV/Dh8SnhlZ5ww9O2y0oyz6e+x8yY4dFOtXC15srqg+WR9JBaVfjtexL7e4Fqfjq/OFolrX5OLq7Rp0k3533useQGN/15XT6aNoqQXirvs8/iAv6CBObEEgVyXmrEF542RdILE/5p4TzFuPSoTqhoPZHFax0BGpL4PoR2wVYC7O7FKfZLLDt5+nSCv+f9KYLfi9rjHUaNy+gm11/Nq7eiVKY5MSVejUKvtGUKAbsKKtC0kRQhozurJK9wnq3HDs6VGLvTM46evsiNCpP70xZH2jGBQQnyLhg2r4kSyJYsTsuZyDo0fNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gReSIrIq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gReSIrIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSkLz4rdmz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:15:22 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50886LaD023325;
	Wed, 8 Jan 2025 10:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=W1r5waazukROmJZjcrfHhKFG3R48sy2zH19SxlSm3
	AU=; b=gReSIrIq+z5lVt/iY4+pfDVy0s+e0bjkqYMUTuo5zcFm/D7W+PjX94TvH
	tVGErjDoKEAcoHqAxcOmmv+jxM/4a1CQQteTtYEyZt/NEUNxZw2/M/salt/EfxyE
	lp+uuvws4DytDInHwYEmAvU0Mv8klnIVnQi7+IfJAoxb5U13w+3Nh74JiQCXWiU7
	16vxmp0Hu1mv2Y1D/FWZRVXMF1UsPk2EjfkdH62uwFesWw1t5M61HD7DE82L5C8Z
	ucv+QfVVDlu9Gwrh/4Z/kNwfYLNgWxsoxI8O2Dx1KsuRoEWu6ik0E0honr714J2P
	ItGBM+oBHcKvIDjHw83uvUM9DBamQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441nj38ksx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5089gP05015809;
	Wed, 8 Jan 2025 10:15:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtky3vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AF34135652148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:15:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73E4E20063;
	Wed,  8 Jan 2025 10:15:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA57720065;
	Wed,  8 Jan 2025 10:15:01 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:15:01 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 0/5] powerpc/crash: use generic crashkernel reservation
Date: Wed,  8 Jan 2025 15:44:53 +0530
Message-ID: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: llUUr_k1JdtpQE9XB-6rXzYJ6Mvq2QNm
X-Proofpoint-GUID: llUUr_k1JdtpQE9XB-6rXzYJ6Mvq2QNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=926 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080082
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
Patch 1-2: generic changes
Patch 3-4: powerpc changes
Patch 5:   generic + powerpc changes

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: sourabhjain@linux.ibm.com

Changelog:

v1 Resend:
 - Rebased on top of 6.13-rc6

Sourabh Jain (5):
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
 kernel/kexec_file.c                      |  12 ++
 14 files changed, 127 insertions(+), 339 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crash_reserve.h

-- 
2.47.1


