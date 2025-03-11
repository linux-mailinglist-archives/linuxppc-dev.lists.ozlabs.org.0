Return-Path: <linuxppc-dev+bounces-6915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A864AA5D2B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 23:51:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC8BR5T96z3bmS;
	Wed, 12 Mar 2025 09:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741733471;
	cv=none; b=LT14V81MWYHSIYwZa3F8YJQFCLbB4mAVtVZOuwLs6kyHi95j84Q32+NNw6RlHV/OxyH0+jhn26IGFwgnDmNMLrmmxjXJctgHRef911wiP42gpObZNW1fyyHZbYzlIuWBqbVXiLV8cWqd9zitstJYK3LMzK1zfuMabhuoYF8cAuoFjR263/TgzZbL1xzPAxkXz6B/svOEedbJPto6KGiqMpCO/ZvMrd+lcuEQSVXVpKLRdQ2BYQ7EtyQBAJ36WZwWInpsYfBPBc/Ara+fu50qxKHqWKOW4/GN1XtTX2BevwAjn9a0Ah91H+vZ8cirn0qgYlYl2RZBg6wxHtIHGc1ilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741733471; c=relaxed/relaxed;
	bh=Q4EA2o35JTqaqhIv0fLG1ztOzx0LHeVWmLOZBvFkeWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XPjO7wYhPXDU0tjpbXwU6OvZfZ0jeN/WhNVJKugL3lLdVRoaxshedG354jw35K7ftP5WmwZjiuH3B53X9z55ZqUMzqd1Q+WA5Ok+5ZVWUq0bFHVF0jsOeltUndx6/U7UWu1XafQqwCcRc3vl7C9Qwv1NI66HS2lJPrErjO4FGEEcGp5VzBTX16YRpgxA9epNwjpgp4UIkjmBPAtjIjplIvQZ3OPd9ft9WMPjRJIeQ8C/XTYPnDUh7jEpxM2WWpBtTkTF2JN6nZaetRV4LDUn8KSLFkCbpNWRqWp29mmZFAZ1v9IThqrXe2SRjTkfWZ9eVl7R/644PohufUJ8B6qw1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJHBP+F6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJHBP+F6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC8BQ5QN9z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 09:51:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJRTNF021596;
	Tue, 11 Mar 2025 22:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Q4EA2o35JTqaqhIv0fLG1ztOzx0L
	HeVWmLOZBvFkeWA=; b=hJHBP+F6Z74Wdv8f2bjrOXYfeg/RmRSnjbojyuu3zxI6
	xy3h/7SJq1YKVH4qXdigkcgmbRadIKnkTfqCRfD8o5/jxJTU2xZ4o1yACX2rOkM2
	zDfGWW8rPhCkD4BSlIVVoikwpmsGRC4DLDcIbCV1G7/i7eEEHcdlFhY0dCKyB4zA
	/Jsuh3bNxWXj3AsrHUswOYpcLBz+V6QibbiAzl4m4gxlCZJNNS5aQ5IXy79Ub5gf
	SiHR0SytIp4HgxuK7iG3hpahOCFnvF1dfxpb8fi9qZJ0/cwABXJ9Tkng41IieoWm
	yscsCddb0LPcBiffQpbEHO5MPsqzP3DaEtgW11aXkA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45aubp8v29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:01 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BMmABA017186;
	Tue, 11 Mar 2025 22:51:01 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45aubp8v25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:01 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMMLlY026166;
	Tue, 11 Mar 2025 22:51:00 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atsp902t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:00 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52BMov9A32637658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 22:50:57 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 423E058059;
	Tue, 11 Mar 2025 22:50:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DDBF58058;
	Tue, 11 Mar 2025 22:50:56 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.74.78])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 22:50:55 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v8 0/7] Add character devices for indices, platform-dump and physical-attestation RTAS
Date: Tue, 11 Mar 2025 15:50:41 -0700
Message-ID: <20250311225049.146783-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: NxLtM7GeSnLFK1SpE3Am_eCWeJIEeUNx
X-Proofpoint-ORIG-GUID: 8sezvSmJemUf03VQdMq_js_LO51DGylP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503110147
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
v8:
- Fixed build warnings for the proper function parameter descriptions
  (vpd_sequence_begin(), few papr_rtas_*() functions, and etc) as
  reported by kernel test robot <lkp@intel.com>

v7:
- Pass the proper next value to the subsequent RTAS calls for the
  get-indices sequence RTAS.
  (Vasireddy Sathvika found this bug).

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
 .../platforms/pseries/papr-phy-attest.c       | 288 +++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 411 +++++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 310 +++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 351 ++-----------
 13 files changed, 1705 insertions(+), 312 deletions(-)
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


