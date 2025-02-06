Return-Path: <linuxppc-dev+bounces-5881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C895A29FEA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 06:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpQFK2GJ5z3048;
	Thu,  6 Feb 2025 16:11:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738818709;
	cv=none; b=ZC1hjwfjipemPb52RCiTKlZaEM4inJNvPRlIJr4D+U/c+bnFL1+LSDwhXB5BR6S0QtBKb/SDW8tFIjvLeZC6Tc2mF7DSpqpqv9lJjFpR1CFg66q67ZJe0zv8vpL6kp24pJJyJba/t9vdyeJjyB7qJkk9VLrmdYRNiTfKgNHhvTOVeMGPmdAledOj1C71vcvqhcR6pu0asDSB7ep//gphZaGFVvxvF1xQJJOveIe9GI1ghP1xRP670LPvXk1UCtsNQZY/6/h91NEue3INSDOtIsbCBdHYQFKE7BMYNYyUsKr4b4ZBA8MkQ/QAnJ5utlXxICSfGsaykpWBpS5JB1FNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738818709; c=relaxed/relaxed;
	bh=JmgW0js5sXBS+XrLKuMqYwQwMYY/XIu0wpHu1lUJYAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxEXiMvvFjVrpIGUwGn1Bz9e6uybLLuwtwdvBZvd3/51QCiRUaeROYdOFux2p7FwP101kPC7i4WI9JLmDkMu9ANzw7/kKPb+C+GUiRWulB9A5/5mgtztPOfBif1vJA6OGWc9ytPKGvW3eF8smDklfmYcyfFYlH43iYjEqRWZtr+70PsZd8aqSfqWcH31ZuDTQvbcbVbAm4BfZlWJb1BQRB+pRVdziNsi9mRowj5v+ZkDnd4z0aMAFPKGQMUgrhLfXS3mtpQrgX7MIfqY7+dehPRyIYCj0rS26SsC3W4Ln6gBM9fdPVbVNdVfuc10OoJ6JmYyTeeLBlKdt7H3PKhtHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RI3o9gvD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RI3o9gvD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpQFJ26TXz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 16:11:48 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5160hCK8001451;
	Thu, 6 Feb 2025 05:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=JmgW0js5sXBS+XrLKuMqYwQwMYY/XIu0wpHu1lUJY
	AM=; b=RI3o9gvDLg4ATtSm6ZbR3XsJH13uMYONwNfRXpEwDZFop7lNBbCNATk0K
	hMxLpOQEtl0186xFd5o5A8rOR3XciZQCfh2G1b/IFZL0Mu9pfSWNeE2KnEjLdQks
	pjO2aVYKWeEsFhfmVEw6yCIuckK1VmUxH0ldf3EAEfoXsQBHBHM/dhzh/CAMya1L
	XRuClS5zumRIT0S0cb9DT+JdDcpTfmkVh0vRypFSJ9ly2IqkIhyKc9RftcpzYhCk
	EAItqSiLbXHCLr8o+yNYcqAz2F52yIqwGbLILBVDyU1esJJLDSzT+LwClApJXH4c
	lr2b7Kp4V4kIJTnIM6WqolIUMkvDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ma8yuq09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 05:11:40 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516558Om005025;
	Thu, 6 Feb 2025 05:11:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ma8yuq06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 05:11:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5163ZeKZ024506;
	Thu, 6 Feb 2025 05:11:38 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxnch3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 05:11:38 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5165BZ5730737106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 05:11:36 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D485A5805A;
	Thu,  6 Feb 2025 05:11:35 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACD2958068;
	Thu,  6 Feb 2025 05:11:34 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.25.25])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Feb 2025 05:11:34 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v4 0/7] Add character devices for indices, platform-dump and physical-attestation RTAS
Date: Wed,  5 Feb 2025 21:11:21 -0800
Message-ID: <20250206051129.124706-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Gl8pCe8Buasthfe1nLSC_t_Ucv6WRnwf
X-Proofpoint-GUID: zFtbN2hu3LOHxZKDEUtxTzPORPE6C6vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several APIs such as rtas_get_indices(), rtas_get_dynamic_sensor(),
rtas_set_dynamic_indicator(), rtas_platform_dump() and
rtas_physical_attestation()  provided by librtas library are
implemented in user space using rtas syscall in combination with
writable mappings of /dev/mem. But this implementation is not
compatible with system lockdown which prohibits /dev/mem access.
The current kernel already provides char based driver interfaces
for several RTAS calls such as VPD and system parameters to
support lockdown feature.

This patch series adds new char based drivers, /dev/papr-indices
for ibm,get-indices, ibm,get-dynamic-sensor-state and
ibm,set-dynamic-indicator RTAS Calls. /dev/papr-platform-dump
for ibm,platform-dump and /dev/papr-physical-attestation
fir ibm,physical-attestation. Providing the similar
open/ioctl/read interfaces to the user space as in the case of
VPD and system parameters.

I have made changes to librtas library to use the new kernel
interfaces if the corresponding device entry is available.

This patch series has the following patches:
powerpc/pseries: Define common functions for RTAS sequence calls
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

powerpc/pseries: Add papr-indices char driver for ibm,get-indices
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

powerpc/pseries: Add a char driver for papr-physical-attestation RTAS
- Introduce /dev/papr-physical-attestation char driver to provide
  kernel interface for ibm,physical-attestation RTAS function.

Changelog:

v4:
- Include patch "Add char driver for papr-physical-attestation RTAS"
  in this series. ibm,physical-attestation is sequence based RTAS
  call and the implementation is also similar to ibm,get-vpd and
  ibm,get-indices.

v3:
- put_unused_fd() only after get_unused_fd() successful for the failure
  case later ("Add papr-platform-dump character driver for dump
  retrieval" patch).

v2:
- Added unlock rtas_ibm_set_dynamic_indicator_lock and
  rtas_ibm_get_dynamic_sensor_state_lock mutex for failure cases
  as reported by Dan Carpenter
- Fixed build warnings for the proper function parameter descriptions
  as reported by kernel test robot <lkp@intel.com>

Haren Myneni (7):
  powerpc/pseries: Define common functions for RTAS sequence calls
  powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
  powerpc/pseries: Add papr-indices char driver for ibm,get-indices
  powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
  powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
  powerpc/pseries: Add papr-platform-dump character driver for dump
    retrieval
  powerpc/pseries: Add a char driver for physical-attestation RTAS

 arch/powerpc/include/asm/rtas.h               |   4 +
 arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
 .../uapi/asm/papr-physical-attestation.h      |  31 ++
 .../include/uapi/asm/papr-platform-dump.h     |  15 +
 arch/powerpc/kernel/rtas.c                    |   8 +-
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 488 ++++++++++++++++++
 .../platforms/pseries/papr-phy-attest.c       | 287 ++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 409 +++++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 313 +++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 350 ++-----------
 12 files changed, 1698 insertions(+), 312 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-physical-attestation.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-phy-attest.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

-- 
2.43.5


