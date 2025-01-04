Return-Path: <linuxppc-dev+bounces-4658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC4A016C4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 21:47:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQXZ16Qd5z2yXY;
	Sun,  5 Jan 2025 07:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736023641;
	cv=none; b=SZUc5uW+J3boEtVNZjLOw1u5myJDmwsojKfETtvr0KDk1wvQVe0vCFN21Ka7/+FaQhzhcfb/E0WAdjcr3IpAIm0/K2QWLUg3XITPlFvf3M0Ml2HKMlkbJx+z/HuvghILEvlg84857TW18zSe27UFnTpdiDzpEuhejjuIcOOyFzGiLJv9AJdtG7VW5W5CpapkoWbBmZiHYN6u/39VtmJPntcMkNapGmyWkqgaY6UTl6XU5DJqoxlYEHttxsDDRk25CvbEjJuyU0yw08SymxbpyDNUfChaBaNHS1vz3p2C3oE4IBBgbmT6oJZH2COFaLLMzfaeKnRwhvGKnBcDdwTbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736023641; c=relaxed/relaxed;
	bh=YmHSmtlDgOQovuwTXBWJXco2cMySgcAT6qqvk5WaB20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIMW91sAUjo836zmqTvyj5uG5harjppYJKxFcoFfktTq7ONnNP17eQDbg3aly5CuOEyLTGEGIty4BkEkDbA07b5el6vAhUAHLePrwUbhZ656j7A2bhD9375DY9Wws8AH6UuWaDcyQvAZRPYR4FVtVFh8mOjrrXDfFdlLWLnsP2Mg79XN16l+P/6cNRz1OWPYZFiMLZ2ADI/6MB3Qv+mi784tc0uZv37OuNfTYWkfOu142SZwfapTtg3C6c1x7tsqTdWnQTK3TSO0ZFWO8jC7SiOBv7r6OcRQZnYiQ9ZjpntK3uoMEUlG5VDll8LM/bJ2iIlBC0LLFaIRMIkZiS9eiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sfzQ1IjE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sfzQ1IjE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQXZ044tsz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 07:47:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 504BiAv5010166;
	Sat, 4 Jan 2025 20:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YmHSmtlDgOQovuwTXBWJXco2cMySgcAT6qqvk5WaB
	20=; b=sfzQ1IjEV7Y9Lf64NZX8R5xpK6LhyZx3+xjVAeLUPkEVye73COiX/FdZE
	UqbyJywp363tlJpxJLvkjKYOZjr3jlFXFQvmX+VaZE4i78BWN5NuYY25ipDltdcL
	puNRKBGEC/6N97GGmgxUZsg0pOm6RvQ++Gtf/PkISPRpaFG0tO+7tlUjGkWMOyUV
	FMUknSk53+IVExbMSCKa4rNJvVim8rzs8OomBmsLbIuOx3w3sQUrhBsvZD8jCNP/
	hoFiJ1gjmQZphhy8X5/mEjwR7fpr5QwC5OS44MnaOWPshFB8em5i+/w3QTi2b9X/
	2nEw2o0UcZeVIMjWNK5O618mIfauw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xtdnap9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 504Kl7Aj018353;
	Sat, 4 Jan 2025 20:47:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xtdnap9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 504IQN8U010206;
	Sat, 4 Jan 2025 20:47:06 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnnuqka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:06 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 504Kl48a23069252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 4 Jan 2025 20:47:04 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 091B358062;
	Sat,  4 Jan 2025 20:47:04 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E43635805C;
	Sat,  4 Jan 2025 20:47:02 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.16.236])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  4 Jan 2025 20:47:02 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH 0/6] Add character devices for indices and platform-dump RTAS
Date: Sat,  4 Jan 2025 12:46:44 -0800
Message-ID: <20250104204652.388720-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-GUID: X-ftxI64KPGsrv5n2sSW878Y94Itgh3y
X-Proofpoint-ORIG-GUID: vDjzwsIxwChxyux8OFrKk307CkOSyP7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040181
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several APIs such as rtas_get_indices(), rtas_get_dynamic_sensor(),
rtas_set_dynamic_indicator() and rtas_platform_dump() provided by
librtas library are implemented in user space using rtas syscall
in combination with writable mappings of /dev/mem. But this
implementation is not compatible with system lockdown which
prohibits /dev/mem access. The current kernel already provides
char based driver interfaces for several RTAS calls such as VPD
and system parameters to support lockdown feature. 

This patch series adds new char based drivers, /dev/papr-indices
for ibm,get-indices, ibm,get-dynamic-sensor-state and
ibm,set-dynamic-indicator RTAS Calls. and /dev/papr-platform-dump
for ibm,platform-dump. Providing the similar open/ioctl/read
interfaces to the user space as in the case of VPD and system
parameters. 

I have made changes to librtas library to use the new kernel
interfaces if the corresponding device entry is available. 

This patch series has the following patches:
powerpc/pseries: Define common functions for RTAS sequence HCALLs
- For some of sequence based RTAS calls, the OS should not start
  another sequence with different input until the previous sequence
  is completed. So the sequence should be completed during ioctl()
  and expose the entire buffer during read(). ibm,get-indices is
  sequence based RTAS function similar to ibm,get-vpd and we already
  have the corresponding implementation for VPD driver. So update
  papr_rtas_sequence struct for RTAS call specific functions and move
  the top level sequence functions in to a separate file.

powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
- /dev/papr-indices driver supports ibm,get-indices,
  ibm,get-dynamic-sensor-state and ibm,set-dynamic-indicator RTAS Calls.
  papr-indices.h introduces 3 different ioctls for these RTAS calls and
  the corresponding ioctl input buffer.

powerpc/pseries: Add papr-indices char driver for ibm,get-indices HCALL
- Introduce /dev/papr-indices char based driver and add support for
  get-indices RTAS function

powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
- Update /dev/papr-indices for set-dynamic-indicator RTAS function

powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
-  Update /dev/papr-indices for  get-dynamic-sensor-state RTAS function

powerpc/pseries: Add papr-platform-dump character driver for dump
   retrieval
- Introduce /dev/papr-platform-dump char driver and adds support for
  ibm,platform-dump. Received suggestions from the previous post as a
  separate patch - Updated the patch with invalidating the dump using
  a separate ioctl. 

Haren Myneni (6):
  powerpc/pseries: Define common functions for RTAS sequence HCALLs
  powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
  powerpc/pseries: Add papr-indices char driver for ibm,get-indices
    HCALL
  powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
  powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
  powerpc/pseries: Add papr-platform-dump character driver for dump
    retrieval

 arch/powerpc/include/asm/rtas.h               |   3 +
 arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
 .../include/uapi/asm/papr-platform-dump.h     |  15 +
 arch/powerpc/kernel/rtas.c                    |   6 +-
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 552 ++++++++++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 408 +++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 243 ++++++++
 .../platforms/pseries/papr-rtas-common.h      |  45 ++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 266 ++-------
 10 files changed, 1356 insertions(+), 226 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

-- 
2.43.5


