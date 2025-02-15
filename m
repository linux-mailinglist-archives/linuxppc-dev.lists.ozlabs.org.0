Return-Path: <linuxppc-dev+bounces-6209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE7A36C16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2025 06:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvxs76bQVz2y92;
	Sat, 15 Feb 2025 16:13:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739596411;
	cv=none; b=KrSVqHrWgW+boLRu7qfDCrDZ1dSoXd8ucdtV9gW5RngnXOZiylQl7Nuo/be/oQt4QaD+6NYKR/EekOZz1Ppw7ERm4Vu4+UKCprNBfGuXcAhdLnWUQIQalckl4B66ScffTbSqpzjwrf4g/NqCjAiu6oBzMKSPPyS+x30PXMrErI8lntlxdbzX6S2hV0ZcIA/YmLixiM2ybLwgZtE6Dg5FVcxr2/Sucw7qJ0/0Ai9+9xUN1NKytSfr5FAsN6CVHG/8nV0NCA1pW+4JiREry3ADZ/bQAe9dwZ0GyO+44MN81me3PG4WryP6NgPytvVQ1QMrCnkHuK5gfiYVdyfnOGViow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739596411; c=relaxed/relaxed;
	bh=7NARPB2YDcR/Zmuvr69TFenzPzrBVMiG/g4OleIygt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GhSwalhkuYdFI2NFvkEcdjRFn1DRCtErWMI59AUXuGh8nzqMpM4Qd8sT4f0dkx1sFQbWtFQPF5Muv7ACJraxPKX1UUxRjAcgLvPOWnJw1/AwrzadlLAIV0s6ENt6LewoUKi7EwpNrqHo6KWMmrpnbb8kS+mms3B0o/GSMPbfdCoL0SZNcRqcQ0lUihM3tl6FqIW66zkFVaxs8/HuMQpk/HIyEEYT4NUssmp2aTT+3H8qniGem7GJs/AHHkZkRB4Bf8fqCT6r6l2+9bMzvQAS/NQC+25uurfQ6CpUxr4DeQk/b7FU6l2z21sntetZJH4ePh24A5Mf7bUbR8IYlhXW3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ft4CRfw8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ft4CRfw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvxs64dy9z2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 16:13:30 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51F0OCtZ015055;
	Sat, 15 Feb 2025 05:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=7NARPB2YDcR/Zmuvr69TFenzPzrB
	VMiG/g4OleIygt4=; b=Ft4CRfw84ME2XB4E+702NG9izfBN43bbEYHo7e57M8ss
	vrZjy1bhaLxxbt1h9pabQ5pcx3VFhIlLhvnXuD2gIjhhFE8h5FN3KV4Rwt+wRyiO
	L7gArZU9BLnPxA+ZmypfnObiIHu6vdkWwAYOY6SsN8ZbrW6OPHy/wcEn7NFw4zb0
	DxZeJsemVSLyoTG3il7GIuMZ84i59GqwpEHFcuYuoocFHPAQ4mxfh/McYzNqBWit
	WUa5N8vmTraJWYdDb8u5n3RHqkWQdyDRSu1sdteFaBdm0bSCHzFq24/HezlSlt8L
	i92L8z7uT1/GxJaTIYNxDq7tiqOrh9xgdN9/8RCw0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tgbp0r73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51F5DKA2027667;
	Sat, 15 Feb 2025 05:13:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tgbp0r71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51F1CgnO028735;
	Sat, 15 Feb 2025 05:13:20 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma26q5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:20 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51F5DHqf5374536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Feb 2025 05:13:17 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B00858058;
	Sat, 15 Feb 2025 05:13:17 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E74BE58057;
	Sat, 15 Feb 2025 05:13:14 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.107.186])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 15 Feb 2025 05:13:14 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v6 0/7] Add character devices for indices, platform-dump
Date: Fri, 14 Feb 2025 21:13:02 -0800
Message-ID: <20250215051310.243099-1-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lPKwXB7aN_QFb00q-kwdQfl_Bnqn9YCu
X-Proofpoint-ORIG-GUID: vVgy-W-76aopwZ02w7T-kPQYTwsoN7iL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150036
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
v6:
- Define the proper command ID for PAPR_PHY_ATTEST_IOC_HANDLE ioctl
- Update ioctls description in ioctl-number.rst.

v5:
- Return with -EINPROGRESS in papr_platform_dump_invalidate_ioctl()
  if the complete dump is not read (Suggested by Michal Suchánek).

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

 .../userspace-api/ioctl/ioctl-number.rst      |   6 +
 arch/powerpc/include/asm/rtas.h               |   4 +
 arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
 .../uapi/asm/papr-physical-attestation.h      |  31 ++
 .../include/uapi/asm/papr-platform-dump.h     |  15 +
 arch/powerpc/kernel/rtas.c                    |   8 +-
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 488 ++++++++++++++++++
 .../platforms/pseries/papr-phy-attest.c       | 287 ++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 411 +++++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 313 +++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 350 ++-----------
 13 files changed, 1706 insertions(+), 312 deletions(-)
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


