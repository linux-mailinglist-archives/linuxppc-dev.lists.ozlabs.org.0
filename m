Return-Path: <linuxppc-dev+bounces-11446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08079B3AE0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXd5PLNz2yr2;
	Fri, 29 Aug 2025 09:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422545;
	cv=none; b=nOj0rirSYj2SrCPQ/8HwqJFHNbZ9wDAGfkaD42RNP/BeBxqSF0WBu/0+rXVBVXuECd0/n0pqKxxQ+mBMIaiZXSqPNDnf/gjFpb9Bv6wjozBwZG/cwDjxg+eK08sERVYoeTPwt/2EZNYBgVdCf/PlVdFJ9qKKorQsuO7FnDqZmnBbMDZhGjqCLce2FbMFoEVRrZ7LkjMjCWTZ2oiA+P8o2Xxc666Zjcs/8f0oihZRKVWAe44K6kKAWTUmZfEQcpGmBpUVS/Tv0QUG7ivhzScpDfvyy7Kwe3S2MKesqe+65Q8NpHqG9BBtajxTFhTDUZ4YewvY7626TywmgtJsO+WQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422545; c=relaxed/relaxed;
	bh=NaBhwG6sx6OaN2R7vHA0rsZhxeVgjC5dXZKVUY6n4VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PfE3fWPo6TN7co9iDa2y9DZ2n6N/OJLHRGoUq8v+2uFllKj4x7ITLyb6ZO8YqhyYDhzhoO+i0YbUk1gu82p7DBtM1c9x1XaI2NkF+aGhSvlSw+nwLbIwKhsyp4e8Ric8BgMJe+5fkMbmiKk6vQ569imAkDknBwixboZBZvL6g4G2orZSilfK6Ltezr5dkB5yE4DbeRgefyQVws+UqhXQYM76AEInZsLX6OOUP5yDt/CxzHm40HixjB3ZGMX1dP17Z4kBgLgQ7sQRP3IGGjE1Kcxefr//vh71+tP2krG+KI50Nk/+/bGbZYvlFQieXJwi8BJbF+/4ydrWsETgUjflBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Boe3hy4u; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Boe3hy4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXc2KHMz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:03 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLCYts003786;
	Thu, 28 Aug 2025 23:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=NaBhwG6sx6OaN2R7vHA0rsZhxeVg
	jC5dXZKVUY6n4VM=; b=Boe3hy4uGItgpBukS9hCTb6jrpcvrZVYuIsPfrgmI3Gz
	VLR17pG5FOwG0CUwNtQb5EiizaRsN2ltymqAtwMb02ZbKs0i3UXLOoS2clERtPAZ
	pSxSbN0mY9n3g86t+eVVPGz2ah8sf0/Qk2sU2OKS1FY0Z3FQANwMq8tokB5W5znF
	W3dpiwq6qblh8Y741E59/t6Q7TZ9BjvgK/sIdmkTq08eV1pm6WoIBB9Rdge/flhE
	SG2fqxLpJ51qToiterubvSBXuUaRXRdwxcWr1RXHAeTu7lZykRMpSrQShC33jzdC
	mvoo6deUqT86aLRojSqhpoHIcJv0rXMD78PKcPCoJA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avvne2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:52 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN8qPi030847;
	Thu, 28 Aug 2025 23:08:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avvndf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLsk4c029875;
	Thu, 28 Aug 2025 23:08:51 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmy68d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:50 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN8mx931064780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:08:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3217758068;
	Thu, 28 Aug 2025 23:08:48 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 539B558061;
	Thu, 28 Aug 2025 23:08:47 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:08:47 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 0/9] powerpc/pseries: Add hypervisor pipe (HVPIPE) suport
Date: Thu, 28 Aug 2025 16:08:34 -0700
Message-ID: <20250828230845.2291249-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7QgBiFiPXK_Lo75Oy9Jsms5huZ8Mfmwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX0U2t+40UL9Xx
 kscqQ7IKFqVUt1jWLU62gvIxM+UvYDm1hBJUmsLp0Qq0qSK/yVjtLQJDu+ZSwYSxMjXUNde///S
 cNG/8olsKed0vLwYa5JWXU28u+Ua+Wp2hkLLlgRzQu3WVbgjvwbpV5xgVXI7e49Z+nBEAHnZtBn
 UkHamiCwDAG8UnSTh9hlWelD2nU1qncxhxBGSLmkVJip/FUxYQTJIBMPo4BZSZrs8ytCvDWilrX
 7vjTHayOu5sT7qm6JvI5qZEuRFu7zVp947jcfYAAu5EOAgEvCQ0AwiBQeeqicH1sTArk9r0r4o/
 VuxIpYvGSwo0iZYOiJDkH4+vpy+KzuipI1LqFro8+RPXmXspu4SOPYkg2WHOYMLUvrjG2vEzNJq
 S9KV4pyP
X-Proofpoint-ORIG-GUID: Phpi9FBK_4Q2QHt1XqKD4oygPyUcs6Sg
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68b0e184 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=0TRnEvMvyPSlxWdLp6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On powerPC systems, the Hardware Management Console (HMC) is used
to create and manage logical partitions (LPAR)  and both HMC and
LPARs exchange information  over Ethernet which can expose security
implications. Hence the current method of communication is not
viable for secure boot configuration.  To overcome these concerns,
the hypervisor introduced new inband hypervisor channel called
“Hypervisor Pipe (HVPIPE)” which allows HMC and LPARs to exchange
information with ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg
RTAS calls. Sources can be any target that the hypervisor supports,
but only HMC source is supported.

ibm,send-hvpipe-msg RTAS:  Inputs such as Source ID indicator of
which target the data is intended and the buffer list to hold the
payload, and returns the status. Each target represented by source
ID. For example, HMC1, HMC2 and etc.

ibm,receive-hvpipe-msg RTAS: Input buffer to hold the data and size
of the buffer, and returns the source ID of identifier of the target
providing the data, the bytes written in the buffer and the status.

The hypervisor defines HVPIPE with certain requirements and
constraints:
- The OS can determine HVPIPE feature availability with
  “ibm,hypervisor-pipe-capable” property in the /rtas node of the
  device tree.
- One pipe is assigned per partition and for all sources.
- Success return status of send HVPIPE means the payload is
  delivered to source.
- Success return status of send HVPIPE as ACK to source.
- Generate HVPIPE event message interrupt if the status of pipe is
  changed in the hypervisor such as payload is pending or pipe to
  the specific source is closed
- Then the partition issue check exception handler to retrieve the
   message which defines source ID of the pipe and its status.
- The hypervisor will not generate another HVPIPE event message
  until the partition obtains the payload with recv HVPIPE RTAS.
- Supports only 4088 bytes of maximum payload right now,

This patch series adds HVPIPE support and provides interfaces to
the user space to execute ibm,send-hvpipe-msg and
ibm,receive-hvpipe-msg RTAS calls. We already have RTAS calls
execution such as ibm,get-indices, ibm,platform-dump,
ibm,get/set-system-parameter, etc to the user space and following
the similar interfaces foe send and recv HVPIPE RTAS functions.

- Create /dev/papr-hvpipe entry if HVPIPE is enabled
- devfd = open("/dev/papr-hvpipe", ..)
- fd = ioctl(fd,HVPIPE_IOC_CREATE_HANDLE, &srcID) for each source.
- size = write(fd, buf, size)
  - Buffer contains papr_hvpipe_hdr and the payload and send the
    payload with  ibm,send-hvpipe-msg
  - Return the size if the RTAS is success, otherwise return the
    equivalent RTAS failure error code.
-  ret = poll(fd,..)
  - The user space waits for the payload from the source. OS wakes
    up FD whenever receives interrupt from the hypervisor
- size = read(fd, buf, size)
  -  Buffer should have the space to contain papr_hvpipe_hdr and
     the payload
  -  Each read() issue ibm,receive-hvpipe-msg and return the size
     for RTAS success. Otherwise return the equivalent RTAS failure
     error code.

This series consists of the following patches:
powerpc/pseries: Define papr-hvpipe ioctl
-provide HVPIPE_IOC_CREATE_HANDLE ioctl to the user space
powerpc/pseries: Define HVPIPE specific macros
– Define RTAS macros needed for ibm,send-hvpipe-msg and
  ibm,receive-hvpipe-msg RTAS
powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
– Add devpapr-hvpipe user space interfaces
powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
– Add send HVPIPE RTAS execution from user space
powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
– Add recv HVPIPE RTAS execution from user space
powerpc/pseries: Wakeup hvpipe FD when the payload is pending
– The kernel wakes up user space FD when the payload is pending
  from the corresponding source
powerpc/pseries: Enable HVPIPE event message interrupt
– Enable HVPIPE interrupt and adds the handler
powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
– Enable HVPIPE in the hypervisor
powerpc/pseries: HVPIPE changes to support migration
- LPM support

Changelog:

v2:
- Rebase to 6.17-rc1:
  Changes in Documentation/userspace-api/ioctl/ioctl-number.rst
- Fixed build warnings for uninitialized ret variable in
  papr_hvpipe_init() as reported by kernel test robot <lkp@intel.com>
- Execute migration handler only if the HVPIPE is enabled during
  bootup (papr_hvpipe_work is used).

v3:
The following changes based on comments from Mahesh Salgaonkar.
- Return -EPIPE for the send HVPIPE RTAS when the pipe is closed.
- Return -EALREADY when more than one process issue ioctl() concurrently
  for the same source ID.
- Fix typo error (4048 bytes instead of 4088 for the payload) in the
  commit log ("powerpc/pseries: Send payload with ibm,send-hvpipe-msg
  RTAS")

Haren Myneni (9):
  powerpc/pseries: Define papr-hvpipe ioctl
  powerpc/pseries: Define HVPIPE specific macros
  powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
  powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
  powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
  powerpc/pseries: Wakeup hvpipe FD when the payload is pending
  powerpc/pseries: Enable HVPIPE event message interrupt
  powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
  powerpc/pseries: HVPIPE changes to support migration

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 arch/powerpc/include/asm/papr-sysparm.h       |   1 +
 arch/powerpc/include/asm/rtas.h               |   9 +
 arch/powerpc/include/uapi/asm/papr-hvpipe.h   |  33 +
 arch/powerpc/kernel/rtas.c                    |  24 +
 arch/powerpc/kernel/rtasd.c                   |   2 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/mobility.c     |   3 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c  | 819 ++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h  |  42 +
 10 files changed, 936 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-hvpipe.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h

-- 
2.50.1


