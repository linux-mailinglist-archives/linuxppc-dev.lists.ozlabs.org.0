Return-Path: <linuxppc-dev+bounces-11822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD2B472EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyRn5276z304l;
	Sun,  7 Sep 2025 01:53:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174005;
	cv=none; b=IrLl11mvB9mA8yjuuPZYb2bxU/pRaddL2q1pVNV18MbkaMT+EZ2n8D6N6JFs1w+OZEy+seUfVAhCt9loElU9cLpheDHY5qUG/sYzEa6DpV/gcslMYp3uiwJZlYSHMsvgffaiMxFRjHZ6J+EuHKzG9UhMH47Oc3QYGdYfbDM7m9V39EX/Ko89FqYFWxBw1QlHTV+0ncAGboFm0/9TLALgiDXjLHLnvHszfk64YpHe4ggkwxJ92YibKI4pJJzajDpUGOCAQY0EB+HkLDXVHvflQrh5CmZn+tMz87gYjvYF/1s+z3qPkmRsLAgopmeWutXNJQqhCGOandRppOflZOO3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174005; c=relaxed/relaxed;
	bh=wEdecWvnmSkPXCbWaFTUkzSCDPKVxBXkAc5PpgCLAW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I/JYtrcZXvAGt9pDF7dcwi0ezTVHkyxYW6/ypk1/3pkQzZVhC3h82OrcE7Mf79qZr6jcLkICPr+YdkujNiI5HFZ5v02BHSX15KW2yiCVCs1c9qwIHr/0augHLUxbIP0GAaNeu2cxnVKDebsrOKUkPp38CCXCMiT/ht2h7RW6FvUW8rz+YndNh2OAXXt7cpgNqnPQoRRx+sYd4nTgJmWp2/IWe/M0fHkLK3dPCczIMaIj0Ib3xrwJuEmctwjh46d3Hu8PlO33gLN+uPrGeAoTSW5vFUB06mlzl76PVp7uVGCCVsMMWa9TmbMJH1JMOw3FbRw/AcowIsAgGF45lWW1tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKeIL6Z3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKeIL6Z3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyRm4hnNz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:24 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5865w0uQ008429;
	Sat, 6 Sep 2025 15:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=wEdecWvnmSkPXCbWaFTUkzSCDPKV
	xBXkAc5PpgCLAW8=; b=MKeIL6Z3SGvNxZKUHADyv8a9hxXowomtiNMe6/8Q6g64
	8O0S+YdNnixhJjXHQ3Ky6l6qdqqucykXKgIIldUJDi/bwgUyzcNqEwORp/cp3z40
	kEO2CL67Z5sAZpMDXS85SBJOQrOYaxXBnuL/DLLFx7vCgCaxZTzs9B5ZRkY40dBE
	wGVE44vmRTD3JTz+7B/E/s9z5Fp9q8FoMAI5c9EycEPHPX51Mf5D5bMXeYOXBFpG
	njnwxPv/rdBkZC4YeBaJcRDwi6QZVinGa3eZIqDc7+WBeyjnyTcFS10RdSLPFaw2
	WMMn2txwCZUZUIjX8HwO0wX1SGR21cWKR7wN55jOsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586Fp14V006154;
	Sat, 6 Sep 2025 15:53:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586F3J7N019313;
	Sat, 6 Sep 2025 15:53:14 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vd4ne55p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrBeT29950466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73FFC5805A;
	Sat,  6 Sep 2025 15:53:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E5AF5803F;
	Sat,  6 Sep 2025 15:53:10 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:10 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 0/9] powerpc/pseries: Add hypervisor pipe (HVPIPE) suport
Date: Sat,  6 Sep 2025 08:52:58 -0700
Message-ID: <20250906155308.705926-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: NxQEwTkxwB82-0LcfrvgEIJfWeJa8dtS
X-Proofpoint-ORIG-GUID: oQSKe0PGWttRnuCF5zvSu6bGXpqS2DeO
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc58ec cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=0TRnEvMvyPSlxWdLp6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX0lQ1Z9XXq+Me
 +eE7CFERapqi4sCdz7lagFkrX7zc9I5uyB4KevFzu24MeK+FZDggEQ2PenN1fnXQbbQJ/RoycLa
 wSlx7ruLj4y6x0sVCOqWdx/q3Bu/8Krz30IPZNsH7xCs1k6RKxuEiDz0kWJSRVUkJiPPRQmRJqM
 OPh5/7FwN+QHm63B/huTnsJfHzu/HemFYfQkrId44CYsopd4JFKHLQTddLSCX3HqsWQhkN9fEFu
 9jerUkP0WDWauNjHHWoOr/Im8k+XzV8Ojmsr2M0yLHgQ6etGGIB9kQJaXrI65nqW4L3N74K6YSe
 EGlSzP5ZyherTVoHQTq+lVy9cLvS7KMUL2qXbAI0IDZUkF1DOVCPuKyDTSdFbEirmsRIa1JtgTX
 GfNd0I/D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
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

v4:
- Fix typo error "ibm,receive-hvpipe-msg" in "powerpc/pseries: Receive
  payload with ibm,receive-hvpipe-msg RTAS" commit log as pointed by
  Tyrel Datwyler.

v5:
- Rebase to 6.17-rc4
- Fix errors found with checkpatch.pl ("powerpc/pseries: Enable HVPIPE
  event message interrupt") as pointed by Madhavan Srinivasan.

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


