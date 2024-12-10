Return-Path: <linuxppc-dev+bounces-3902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D99EA989
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 08:28:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6r1T6R6xz2yZN;
	Tue, 10 Dec 2024 18:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733815693;
	cv=none; b=aILzzDRIV5Y88t1eQyVE2fvwPZmnfZvfh5ifb1f7ldzypeIeU8A72sVEcancPxxJ8Qfx0XNnMkn8DnXz3m6afO+1fpNKsVqhA6e21ohRy20XaLmnqC7mppxHEl+z6waBheBLdj+nANHxNf1IZV3/DVIcS8aEr/jmPBrG5tByCqtXjO3ucC5sU64LFGk5fYqM30CREj5wZss7eNYHa8IkeZI4XzmEyPjORGS1zvE/9wphJ+KwEuVXoxrrYNvE9gWFARrePBZCRqXasD3GjN8MmQCfJJN5pzUvLWOwfNyMSADVhqAvauul/KBTsXS6apnzib+LSfcaeXEclmHdp4KfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733815693; c=relaxed/relaxed;
	bh=5e0Rten/7/2mWdJ2lM5B/Vxs+ryCfL38jXkxPFscvpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYQvBufV3cBGfsZ1+YaGJI+RrAPLFQ9LacmEDhOxNWCqpkHvM5X+3APQdqAaPGwnrNgOeHMoP/iHTMRSECOUCJbbxgLdYIfDUIp9cafptQpZw5NvAsfGX+Lb5lFqTX+nJy+mfCkyn44YP/QvYGipCMqJ7w/oWr1AikDQVbaaI8zeOdCZXyaCgwIIYSOG6ZJShixM4McWr9yGykoJbg1XxbRRZOX7cijLoujlZZVka3Nkju+sP//ccUiL56nmDee3FnQU8Sine9HtS3ZwJNk47pJBzvJdgtXI47OTbm/fZAl+x+X7A3g0bR0f0vXjf8uoZcpEkGmV6yVA8JKeBHfuXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tOhB5g6n; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tOhB5g6n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6r1S3cCLz2xFr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 18:28:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9NC6aU016121;
	Tue, 10 Dec 2024 07:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5e0Rten/7/2mWdJ2lM5B/Vxs+ryCfL38jXkxPFscv
	pk=; b=tOhB5g6nKorFxXSuNaxnqkgjGeZlKUpcklpUf3ZrYbUUA+q+Iey8SJ0vB
	Pz8s8CJVJtHRzJQdXJ7R9FO9CXicfeelRC2CeRJ6OvceBcGaou2HwwFZAGT6PjNE
	IUzcKx/Z5s46gPdrClCeObRS1TZ7a2I3NsoYTCm6Rd36bAQEBH7lq8MmlSb32EnC
	/QgCfdHexAjkN5ywR4W4WNaN6lau8P9c28ah6CtWLtMWC9cuL8ILkiETnbUTEBJ9
	XsrG/WDANW8kPRa9ZjgGaCi+wNVsDSARv0V2b87AMRPhMF8bgH933pzdY439xg2o
	p5bgPsK6K0mA4FwwqP6eU3usc/v5g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xck8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 07:28:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA7FSQa032575;
	Tue, 10 Dec 2024 07:28:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d1pn2gk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 07:28:08 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BA7S6jd55968228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 07:28:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94E5F20043;
	Tue, 10 Dec 2024 07:28:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B182D20040;
	Tue, 10 Dec 2024 07:28:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 07:28:05 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.5.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68E9F60B5A;
	Tue, 10 Dec 2024 18:27:59 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        manoj@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: [PATCH 0/2] Remove cxl and cxlflash drivers
Date: Tue, 10 Dec 2024 18:27:18 +1100
Message-ID: <20241210072721.157323-1-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: MDiBC_uCpF7nnOj0GA-zpuosnWPqQ3EW
X-Proofpoint-ORIG-GUID: MDiBC_uCpF7nnOj0GA-zpuosnWPqQ3EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=464
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100052
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series removes the cxl and cxlflash drivers for IBM CAPI devices.

CAPI devices have been out of production for some time, and we're not
aware of any remaining users who are likely to want a modern kernel.
There's almost certainly some remaining driver bugs and we don't have much
hardware available to properly test the drivers any more. Removing these
drivers will also mean we can get rid of a non-trivial amount of support
code in arch/powerpc.

Thanks to everyone who's worked on these drivers over the last decade.

This series applies on top of [0].

[0] https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=436003&state=*

Andrew Donnellan (2):
  cxlflash: Remove driver
  cxl: Remove driver

 .../ABI/{obsolete => removed}/sysfs-class-cxl |   55 +-
 Documentation/arch/powerpc/cxl.rst            |  469 --
 Documentation/arch/powerpc/cxlflash.rst       |  433 --
 Documentation/arch/powerpc/index.rst          |    2 -
 .../userspace-api/ioctl/ioctl-number.rst      |    4 +-
 MAINTAINERS                                   |   21 -
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
 arch/powerpc/platforms/powernv/pci-cxl.c      |  153 -
 arch/powerpc/platforms/powernv/pci-ioda.c     |   43 -
 arch/powerpc/platforms/powernv/pci.c          |   61 -
 arch/powerpc/platforms/powernv/pci.h          |    2 -
 drivers/misc/Kconfig                          |    1 -
 drivers/misc/Makefile                         |    1 -
 drivers/misc/cxl/Kconfig                      |   28 -
 drivers/misc/cxl/Makefile                     |   14 -
 drivers/misc/cxl/api.c                        |  532 ---
 drivers/misc/cxl/base.c                       |  126 -
 drivers/misc/cxl/context.c                    |  362 --
 drivers/misc/cxl/cxl.h                        | 1135 -----
 drivers/misc/cxl/cxllib.c                     |  271 --
 drivers/misc/cxl/debugfs.c                    |  134 -
 drivers/misc/cxl/fault.c                      |  341 --
 drivers/misc/cxl/file.c                       |  699 ---
 drivers/misc/cxl/flash.c                      |  538 ---
 drivers/misc/cxl/guest.c                      | 1208 -----
 drivers/misc/cxl/hcalls.c                     |  643 ---
 drivers/misc/cxl/hcalls.h                     |  200 -
 drivers/misc/cxl/irq.c                        |  450 --
 drivers/misc/cxl/main.c                       |  383 --
 drivers/misc/cxl/native.c                     | 1592 -------
 drivers/misc/cxl/of.c                         |  346 --
 drivers/misc/cxl/pci.c                        | 2103 ---------
 drivers/misc/cxl/sysfs.c                      |  771 ----
 drivers/misc/cxl/trace.c                      |    9 -
 drivers/misc/cxl/trace.h                      |  691 ---
 drivers/misc/cxl/vphb.c                       |  309 --
 drivers/scsi/Kconfig                          |    1 -
 drivers/scsi/Makefile                         |    1 -
 drivers/scsi/cxlflash/Kconfig                 |   15 -
 drivers/scsi/cxlflash/Makefile                |    5 -
 drivers/scsi/cxlflash/backend.h               |   48 -
 drivers/scsi/cxlflash/common.h                |  340 --
 drivers/scsi/cxlflash/cxl_hw.c                |  177 -
 drivers/scsi/cxlflash/lunmgt.c                |  278 --
 drivers/scsi/cxlflash/main.c                  | 3970 -----------------
 drivers/scsi/cxlflash/main.h                  |  129 -
 drivers/scsi/cxlflash/ocxl_hw.c               | 1399 ------
 drivers/scsi/cxlflash/ocxl_hw.h               |   72 -
 drivers/scsi/cxlflash/sislite.h               |  560 ---
 drivers/scsi/cxlflash/superpipe.c             | 2218 ---------
 drivers/scsi/cxlflash/superpipe.h             |  150 -
 drivers/scsi/cxlflash/vlun.c                  | 1336 ------
 drivers/scsi/cxlflash/vlun.h                  |   82 -
 include/misc/cxl-base.h                       |   48 -
 include/misc/cxl.h                            |  265 --
 include/misc/cxllib.h                         |  129 -
 include/uapi/misc/cxl.h                       |  156 -
 include/uapi/scsi/cxlflash_ioctl.h            |  276 --
 .../filesystems/statmount/statmount_test.c    |   13 +-
 68 files changed, 49 insertions(+), 25819 deletions(-)
 rename Documentation/ABI/{obsolete => removed}/sysfs-class-cxl (87%)
 delete mode 100644 Documentation/arch/powerpc/cxl.rst
 delete mode 100644 Documentation/arch/powerpc/cxlflash.rst
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
 delete mode 100644 drivers/scsi/cxlflash/Kconfig
 delete mode 100644 drivers/scsi/cxlflash/Makefile
 delete mode 100644 drivers/scsi/cxlflash/backend.h
 delete mode 100644 drivers/scsi/cxlflash/common.h
 delete mode 100644 drivers/scsi/cxlflash/cxl_hw.c
 delete mode 100644 drivers/scsi/cxlflash/lunmgt.c
 delete mode 100644 drivers/scsi/cxlflash/main.c
 delete mode 100644 drivers/scsi/cxlflash/main.h
 delete mode 100644 drivers/scsi/cxlflash/ocxl_hw.c
 delete mode 100644 drivers/scsi/cxlflash/ocxl_hw.h
 delete mode 100644 drivers/scsi/cxlflash/sislite.h
 delete mode 100644 drivers/scsi/cxlflash/superpipe.c
 delete mode 100644 drivers/scsi/cxlflash/superpipe.h
 delete mode 100644 drivers/scsi/cxlflash/vlun.c
 delete mode 100644 drivers/scsi/cxlflash/vlun.h
 delete mode 100644 include/misc/cxl-base.h
 delete mode 100644 include/misc/cxl.h
 delete mode 100644 include/misc/cxllib.h
 delete mode 100644 include/uapi/misc/cxl.h
 delete mode 100644 include/uapi/scsi/cxlflash_ioctl.h

-- 
2.47.1


