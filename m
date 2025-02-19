Return-Path: <linuxppc-dev+bounces-6340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD0A3B1E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 08:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyS2Y4Bbzz2ysh;
	Wed, 19 Feb 2025 18:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739948421;
	cv=none; b=f79a3OgC1ESOP/W3q+bsKvar4gVtjdEG2Q+WcxAK4A/dmV+0G3LMQ2cahDstAfvDsaEruPWbmViat07X+qjeIXGDcGhE6uzNsT0zJOVWFRHcsnyEah+D+JA6nE/alEjyUVsebe3TGwdYVPeVoALTOmuS4a8Rzedd96DR0DG25NE0q+n1FDraip9oE4h2nsfvXT/OrFALB3mr1Lyi3ZSFNFfZoabPm4rQCAzS2eEG67RMAztwb8OlXfwmAmK4xKv6H9AoG7RsfnKtPhIMwb/1M2z0tNxPPEEL0RyWu9/LT5JdlRDWUTZ5bXJPPZXg6VcMsTfd64qtG4HVW/hGP3X/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739948421; c=relaxed/relaxed;
	bh=VSSxu6cd8Y1QoaX22sebDySSx5Ce5oG5XF+7BGDAK+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z3Es/og2bfVR87n0yK18UG9yyq63pf54g2HhTJis2cZmz1vJsvaKviGA14Fg+9nGhNSE/HwwLQKQOSCTGwoqfN10WtCl3AZBCPluUtnDR/X8YlBJsKPmyzvpH+M+hmNRrx1IAHq34F83rFsZvlvWBeSAhwjIjAfenjyfcOOez0gKj6Z2M/cv89BH2dUNf+k1JYzuCIjerykpjUmjohgucEH3sCGRZuoIDYOJFeM0bfpKKeNpD+LpkA01j7xtjDVXchwJrB1E/csIRkUW0LPi3CURKBHBFSfhNFpPmRlU7fY3FROHVfcroY9WymwmT/jr8/Xlg1FHZSZosVzx366nmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9nQAapI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9nQAapI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyS2X5F98z2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 18:00:20 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6gZPw020920;
	Wed, 19 Feb 2025 07:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=VSSxu6cd8Y1QoaX22sebDySSx5Ce5oG5XF+7BGDAK
	+E=; b=n9nQAapIhNPj6rKr4r50DF3Wz/uFCc2kKcELdyPIxzE5LjVhGLFnXomUL
	+x7R59WsoGvOAnEGQ/m9ZEkXce8Nyq/14pL9U1bdv6HHi1IT3pbAIEKxDjff+i3t
	66hMiyk6uXpcpxZ/pC3xcN+wdhsm6DpQUCcvfdmQEODxDXUzskPz+pI8Of8V1L0I
	1k4dn4pj4j+45Sgfk+hboqZXpPFCuYoIMPLxerRxmUx/6IYGHywtiMRNKHJ3sWoC
	5C/MkkDDPP7kxC7XnZUVyYuONL0DhxhAormh2f02P0M+vBAS+daPz+nol/wdoNQf
	2HLnd7xUPOyE65ekqSJ77K0MTJ54g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vyyptd4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 07:00:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6tYhj005844;
	Wed, 19 Feb 2025 07:00:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xan2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 07:00:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J70E5i52429082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 07:00:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE85720040;
	Wed, 19 Feb 2025 07:00:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6D1A2004E;
	Wed, 19 Feb 2025 07:00:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 07:00:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1E37A6033C;
	Wed, 19 Feb 2025 18:00:11 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        clombard@linux.ibm.com, vaibhav@linux.ibm.com,
        martin.petersen@oracle.com
Subject: [PATCH v3 0/1] Remove cxl driver
Date: Wed, 19 Feb 2025 18:00:05 +1100
Message-ID: <20250219070007.177725-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: Gz0sNBoF71q4pxq9lVYy0b_9lYRbLv1T
X-Proofpoint-ORIG-GUID: Gz0sNBoF71q4pxq9lVYy0b_9lYRbLv1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=619 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502190053
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series removes the cxl for IBM CAPI devices.

CAPI devices have been out of production for some time, and we're not
aware of any remaining users who are likely to want a modern kernel.
There's almost certainly some remaining driver bugs and we don't have much
hardware available to properly test the drivers any more. Removing these
drivers will also mean we can get rid of a non-trivial amount of support
code in arch/powerpc.

Thanks to everyone who's worked on these drivers over the last decade.

This series does not affect the OpenCAPI/ocxl driver, nor does it affect
Compute Express Link (the other cxl, an amusing but unfortunate naming
collision).

The previous version of this series also removed the cxlflash driver,
which has now been merged into the scsi tree as 772ba9b5bd27 ("scsi:
cxlflash: Remove driver").

This series applies on top of 772ba9b5bd27 and the patch at [0].

[0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250219064807.175107-1-ajd@linux.ibm.com/

v1: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=436014&state=*
v2: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=442572&state=*

v1->v2: rebase and update docs
v2->v3: rebase on docs changes

Andrew Donnellan (1):
  cxl: Remove driver

 .../ABI/{obsolete => removed}/sysfs-class-cxl |   55 +-
 Documentation/arch/powerpc/cxl.rst            |  470 ----
 Documentation/arch/powerpc/index.rst          |    1 -
 .../userspace-api/ioctl/ioctl-number.rst      |    2 +-
 MAINTAINERS                                   |   12 -
 arch/powerpc/configs/skiroot_defconfig        |    1 -
 arch/powerpc/include/asm/copro.h              |    6 -
 arch/powerpc/include/asm/device.h             |    3 -
 arch/powerpc/include/asm/pnv-pci.h            |   17 -
 arch/powerpc/mm/book3s64/hash_native.c        |   13 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |   10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |    1 -
 arch/powerpc/mm/book3s64/slice.c              |    6 +-
 arch/powerpc/mm/copro_fault.c                 |   12 -
 arch/powerpc/platforms/powernv/Makefile       |    1 -
 arch/powerpc/platforms/powernv/pci-cxl.c      |  153 --
 arch/powerpc/platforms/powernv/pci-ioda.c     |   43 -
 arch/powerpc/platforms/powernv/pci.c          |   61 -
 arch/powerpc/platforms/powernv/pci.h          |    2 -
 drivers/misc/Kconfig                          |    1 -
 drivers/misc/Makefile                         |    1 -
 drivers/misc/cxl/Kconfig                      |   28 -
 drivers/misc/cxl/Makefile                     |   14 -
 drivers/misc/cxl/api.c                        |  532 -----
 drivers/misc/cxl/base.c                       |  126 -
 drivers/misc/cxl/context.c                    |  362 ---
 drivers/misc/cxl/cxl.h                        | 1135 ---------
 drivers/misc/cxl/cxllib.c                     |  271 ---
 drivers/misc/cxl/debugfs.c                    |  134 --
 drivers/misc/cxl/fault.c                      |  341 ---
 drivers/misc/cxl/file.c                       |  699 ------
 drivers/misc/cxl/flash.c                      |  538 -----
 drivers/misc/cxl/guest.c                      | 1208 ----------
 drivers/misc/cxl/hcalls.c                     |  643 -----
 drivers/misc/cxl/hcalls.h                     |  200 --
 drivers/misc/cxl/irq.c                        |  450 ----
 drivers/misc/cxl/main.c                       |  383 ---
 drivers/misc/cxl/native.c                     | 1592 -------------
 drivers/misc/cxl/of.c                         |  346 ---
 drivers/misc/cxl/pci.c                        | 2103 -----------------
 drivers/misc/cxl/sysfs.c                      |  771 ------
 drivers/misc/cxl/trace.c                      |    9 -
 drivers/misc/cxl/trace.h                      |  691 ------
 drivers/misc/cxl/vphb.c                       |  309 ---
 include/misc/cxl-base.h                       |   48 -
 include/misc/cxl.h                            |  265 ---
 include/misc/cxllib.h                         |  129 -
 include/uapi/misc/cxl.h                       |  156 --
 48 files changed, 42 insertions(+), 14312 deletions(-)
 rename Documentation/ABI/{obsolete => removed}/sysfs-class-cxl (87%)
 delete mode 100644 Documentation/arch/powerpc/cxl.rst
 delete mode 100644 arch/powerpc/platforms/powernv/pci-cxl.c
 delete mode 100644 drivers/misc/cxl/Kconfig
 delete mode 100644 drivers/misc/cxl/Makefile
 delete mode 100644 drivers/misc/cxl/api.c
 delete mode 100644 drivers/misc/cxl/base.c
 delete mode 100644 drivers/misc/cxl/context.c
 delete mode 100644 drivers/misc/cxl/cxl.h
 delete mode 100644 drivers/misc/cxl/cxllib.c
 delete mode 100644 drivers/misc/cxl/debugfs.c
 delete mode 100644 drivers/misc/cxl/fault.c
 delete mode 100644 drivers/misc/cxl/file.c
 delete mode 100644 drivers/misc/cxl/flash.c
 delete mode 100644 drivers/misc/cxl/guest.c
 delete mode 100644 drivers/misc/cxl/hcalls.c
 delete mode 100644 drivers/misc/cxl/hcalls.h
 delete mode 100644 drivers/misc/cxl/irq.c
 delete mode 100644 drivers/misc/cxl/main.c
 delete mode 100644 drivers/misc/cxl/native.c
 delete mode 100644 drivers/misc/cxl/of.c
 delete mode 100644 drivers/misc/cxl/pci.c
 delete mode 100644 drivers/misc/cxl/sysfs.c
 delete mode 100644 drivers/misc/cxl/trace.c
 delete mode 100644 drivers/misc/cxl/trace.h
 delete mode 100644 drivers/misc/cxl/vphb.c
 delete mode 100644 include/misc/cxl-base.h
 delete mode 100644 include/misc/cxl.h
 delete mode 100644 include/misc/cxllib.h
 delete mode 100644 include/uapi/misc/cxl.h

-- 
2.48.1

