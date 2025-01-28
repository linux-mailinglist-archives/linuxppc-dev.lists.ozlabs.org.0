Return-Path: <linuxppc-dev+bounces-5610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70AA20442
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 07:13:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhw2K0qK6z2ytN;
	Tue, 28 Jan 2025 17:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738044793;
	cv=none; b=HoE0FhbRg6cd67VyvtUUSVIVObg/TBVjeuz7JxvIo95qYNMXnvwwKurDXRHFHGVK87FIFlgEt+QmfuJWJZPo/ws/Cwet/aoEQzIjwdFjQTRV5XWxyeYyjvPs7uMRMW8OGW+qxXQYiuAO3Ku8JXg3rgLkfqHIM3X6d8aqbVeKJB0mct6MPucEskXB2PU4N53gRahFPOxEC2GYJlt2yZFOYbYVHlqgtdQ2YrYFdkX44x+ThHwM7id+tils0P5wdXOxLGHI/FYT+nCK1NbMvEgAcShOxJjnBaA6bFEqXq/9jN91GJheN2r7e5vHpR0zn98JgEINskCzPgd/CPrzb7xGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738044793; c=relaxed/relaxed;
	bh=/796BzUD8XeVS/i1EfnIzasCwM1yfMcY20mhWpl+Q1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Er9YoAijyuaMCPrQJWU+9I2AGoSXhUtNow8su3JiT5ynlGclTh6tuSiNCj6Z5L5m1HqNUUHU0tVNhVpkSuwcbipqtLxmDb6gGhhHGOe3ihm2RVFerq70B/H4r9q4mIm32eaqoeqTpS/j4EntpsP9V4Lv+jAmv3bZQueURn0PJatr+hOeimNQ4Av3t7w5fZ2+Xa0EEhlASh3O0tUgNAJWKgyNZWIUp3+UbrtUQVjUDNjT5arGV2QfjURDzuSljt9e6OhNUlLzkq+0uCn46aDKCmlJ6V6ak5hoSpdE/x9CSXi/lLXfbMzO6o5klf9in8y2FrXjLh8Sv3nIvUJOVGaI4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0h+RdaX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0h+RdaX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yhw2H6w96z2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 17:13:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S214nJ007126;
	Tue, 28 Jan 2025 06:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=/796BzUD8XeVS/i1EfnIzasCwM1yfMcY20mhWpl+Q
	1E=; b=M0h+RdaXPrlODJJDEg3cnT4IfgDbwt0aZ+Km2Y4yg9mwFYXQDDHwYN/Fq
	tyXxOVrxD2HTgZvuobHBGUema8NcVrrqhdOvbhHTlTJtzklq0BFLhQso5F08oJR9
	QDHyvJjC10gxJYw9V7GsUvxauPobOWDiRVIZoxkBPsBVRa3Ki0NG0Hs7t80zFblO
	B+BathVHKRpsoLT2YqNpLUhdTkjwYRYwZrwLZ58iqdcpYPhhlFCiq7QaYFwx+UM4
	f8V6DpVS3wGdMA1RfWC7RSg6+U5qo1znhnAKVDk2W5qEpNLMTy0AJuAqRYOjSFgG
	82URONnnUKGsMJCc/LAGYTk4Dt4JQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ep2ygrc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50S6BVqH031784;
	Tue, 28 Jan 2025 06:13:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ep2ygrc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50S2U8bm018919;
	Tue, 28 Jan 2025 06:13:00 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dd019gn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:00 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50S6Cvpt24314378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 06:12:58 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0F5458058;
	Tue, 28 Jan 2025 06:12:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA4AE58059;
	Tue, 28 Jan 2025 06:12:56 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.33.13])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Jan 2025 06:12:56 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v3 0/6] Add character devices for indices and platform-dump RTAS
Date: Mon, 27 Jan 2025 22:12:44 -0800
Message-ID: <20250128061251.3718036-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 1GEkohh62_0wOUJ-xH8YkJ-lkU9oFygg
X-Proofpoint-GUID: t0S94waBOIK3tFWs_B_PR3i5I3Xj-k1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280044
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

Changelog:

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

Haren Myneni (6):
  powerpc/pseries: Define common functions for RTAS sequence calls
  powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
  powerpc/pseries: Add papr-indices char driver for ibm,get-indices
  powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
  powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
  powerpc/pseries: Add papr-platform-dump character driver for dump
    retrieval

 arch/powerpc/include/asm/rtas.h               |   3 +
 arch/powerpc/include/uapi/asm/papr-indices.h  |  41 ++
 .../include/uapi/asm/papr-platform-dump.h     |  15 +
 arch/powerpc/kernel/rtas.c                    |   6 +-
 arch/powerpc/platforms/pseries/Makefile       |   3 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 558 ++++++++++++++++++
 .../platforms/pseries/papr-platform-dump.c    | 409 +++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 243 ++++++++
 .../platforms/pseries/papr-rtas-common.h      |  45 ++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 270 ++-------
 10 files changed, 1365 insertions(+), 228 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

-- 
2.43.5


