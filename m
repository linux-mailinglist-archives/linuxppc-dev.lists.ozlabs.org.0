Return-Path: <linuxppc-dev+bounces-4247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D59F4431
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 07:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC6mp5Tshz3bV7;
	Tue, 17 Dec 2024 17:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734418026;
	cv=none; b=HySMn0ScstCidH+DXnc5+cJAmPTVm3Xac1XXyt8x+1E4n4B7qhocZfa0aW95KPu3bCdyExo5lJxt+Y4y5uIrlkFpKup9CizM43EdUBIH13pyCQZckN9noGIi+dpleeZRj5q2HXMlrE7+vWyD3mJR4Z8iOzO7zQmiCycREKMUpIdOluVUKkYJr+G3snOj62UkHKBD5DGkxQFW9Z2kgn8dn0j2+U1ZmINQyocuLlm1T+ZFeyh7y9g/hiMLcVIhx+l3Tr6WCaZuymeP/FuU7ATaj8deKUSst+CnjU0qfHUOPOI/DLX837GlRVtnXxK1fXTOzjdg/ZYOYZsv5suYFQ3W+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734418026; c=relaxed/relaxed;
	bh=U5qV1v2Jt6QjYaeHXBdYfuAXSU8rjSHTL5Bu78iPvGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bhXLzR/EizkpmpA8WT789D+zYMf0FdsAWjnC+O7Oy81bur59O8ty64OcVLS6og4HYB65xNskNLJG3+Z/KIZz4uXEX7Vaz1EgH5PZ4BqshRsrCZMbz92kN8Bjj/k+uuEjTp4zAK3RpoDDgDdIMvbIZw4kz2thJApVywpPKZFvSqu7o223zSZKM8xH2aizjDIf4ssiCSbJGFOmslCFgRlNvovuHB5MXV1gyCKa3U9I6+bxsbp8di3Fph1ANdJrQoxuur+5qHlyp9P7a0dxon+3/BzHXIT3EEUO4DkhejvPrLKwE62ZT6kRSviJKRb5zcN7KZKixaxDykhzhXMjO+8USQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG2oT9l+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG2oT9l+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC6mn4Lm6z3bV3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 17:47:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6jliI027742;
	Tue, 17 Dec 2024 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=U5qV1v2Jt6QjYaeHXBdYfuAXSU8rjSHTL5Bu78iPv
	GY=; b=OG2oT9l+GEeJu4B04R3qtpEDbibssrJZo8b7wBQ2GeTbaxkBPk+gB0+8N
	e7bwCUMhN5JIVuuWmRg7Z/Dr6m7HFXAKP3MWpQix4Mqgi7YBLA/1FGldBq9xu6hi
	fSIIyNMSFQ10px+on1ScB3LPfLA+cR2Ap8L5dLSBeHFX4dMsHkLan73kpxv6DFI+
	YrWrY/jzezRruqTPl++b0IChD+8MPf3Xkyt6+jLUdKMHDMsWmitKT3VVGCaNLs8O
	7Jwosx1Dr7tYLhpUmSfIG2zKlML46KdczW0/2aezCFUcFockum9AVuazNHNUgAcb
	PkXbnQp6SzhRsY+AjIN6olpaWueGQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2dcs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:46:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6OduD014340;
	Tue, 17 Dec 2024 06:46:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqy1quu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:46:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH6kaFP39256514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 06:46:36 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BA9420043;
	Tue, 17 Dec 2024 06:46:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0624920040;
	Tue, 17 Dec 2024 06:46:33 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.29.128])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 06:46:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] powerpc/crash: use generic crashkernel reservation
Date: Tue, 17 Dec 2024 12:16:08 +0530
Message-ID: <20241217064613.1042866-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 5ds-IUGe8QsRQd2fFWvz29VEdeeBgx4n
X-Proofpoint-GUID: 5ds-IUGe8QsRQd2fFWvz29VEdeeBgx4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=877 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170052
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

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: sourabhjain@linux.ibm.com

-- 
2.47.1


