Return-Path: <linuxppc-dev+bounces-5051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E0A09F51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVKDl73Cwz3ckL;
	Sat, 11 Jan 2025 11:30:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736555431;
	cv=none; b=ZjyU9TV8MrG3fx9P6KvKufRb2R1yJwFCk11qScmIo0iVf9Et0eGPrxufaumkgopGKkT4MzYHiSy2Q5TC377+ah9srZdcpzAATJULUOB4XddPdz4HQLXR/yb23D1n5wLJNBt1/nLdMqjtHbFOf1pMFwzkyPsQdMuxZmTnZwN6ho8JBEsiVCRX8/iuadXEHkyaCrIPDJDsYeCB9kp8VizfryOpZMKkkrHFssXsayjBlPWe2VYWbzrJIrqeRCTIDkWJgFqjpWIdilImxTt3ZFX+4Jsm1wgwB4qQEDpbkD/xwlopk8ovjQFviW/L9U4HiNnQM+C9zwHLnCRiHGiRQNSKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736555431; c=relaxed/relaxed;
	bh=WZMoo3wTQgqTkZxk1QmZzya7PEGxAj+kHbKM7GaqjAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlsqkuwkNEoZ03j7YraELuwVGh3nVOvKcTEC5IaLaGsMsIAjIq2Gwa05ZDt6RSi6bV5O6Dm0naL2MN6+vElXL9eZSJNqNJ/2yoJIe1nYsQbSF+Z9NrkSQxwDXM8TQKDuQ+7bjAhObYbhC5b0CVN/Xemdu7E817ujldigCXWPV8I1xYJGRcYYPCGhREFi7t1sSWBn7pMuAsdes8kag42QEKNCJ/4+xJUKcjSo4j56/GSgtjLuamzA3GmEd1kgNebgas0aR4VfPKDtfLpy8HbqleTm3qYAD0zC6LAQLJTH1DgiUR+PNa+MOZK7JqVEirMIumEp9jpGWxH311VqF/jElA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4nBiw59; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4nBiw59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVKDk4Zmsz3cjr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 11:30:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE6I5v025740;
	Sat, 11 Jan 2025 00:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=WZMoo3wTQgqTkZxk1QmZzya7PEGxAj+kHbKM7Gaqj
	AE=; b=G4nBiw59qKwt5Rtus+O1sJUbbxWESgYtqmtlxYf6iTUedXj+XCB7Q8e9+
	sDLKaULPVog6sv5R7TqVYlzOlsZ+bYybPMMM+t+RFC9++qONU4QdS71TDgEnY7dt
	Gk3KjQKClYuXs7ElNdOJj1T1myERLC3oKgBWuDcI1s6Vp+YzakG1w1TwO8eqe6ZE
	mH1cXKwQ5a5mPEzHc/JVx5NTsJ/pmt6pMNUpxojAA7qaiTeYKVpDXpUteO0NLTLw
	tIXd03+Ps2qn8ytMS0VyuBBlWB7h19xIamkzXcTeOIDBpT/iurAg0Pb7F1IiM/3v
	QsQfAfLoBZzl3uJ/Aa0AFI+GU3MbA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4435152cks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:19 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50B0UJ7X007641;
	Sat, 11 Jan 2025 00:30:19 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4435152ckq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:19 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50AMeujg026171;
	Sat, 11 Jan 2025 00:30:18 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj12mh8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50B0UF6224642064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 00:30:15 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F8435804B;
	Sat, 11 Jan 2025 00:30:15 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 922EF5805B;
	Sat, 11 Jan 2025 00:30:14 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.28.150])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 11 Jan 2025 00:30:14 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 0/6] Add character devices for indices and platform-dump RTAS
Date: Fri, 10 Jan 2025 16:30:02 -0800
Message-ID: <20250111003010.2147021-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: UrP9xNB6fHzH3O0zSZ0njnMC4ICbuka7
X-Proofpoint-ORIG-GUID: 34AvUjTIiCBjDbqDZSWs2G5krznjDPYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501110002
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
 .../platforms/pseries/papr-platform-dump.c    | 408 +++++++++++++
 .../platforms/pseries/papr-rtas-common.c      | 243 ++++++++
 .../platforms/pseries/papr-rtas-common.h      |  45 ++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 270 ++-------
 10 files changed, 1364 insertions(+), 228 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

-- 
2.43.5


