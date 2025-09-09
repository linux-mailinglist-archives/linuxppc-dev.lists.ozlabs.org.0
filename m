Return-Path: <linuxppc-dev+bounces-11907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583EB4A5B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnK1qxDz3cBW;
	Tue,  9 Sep 2025 18:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407461;
	cv=none; b=MJuNQbtyfBpUqa8LWfUcp8lNDwiubBfSOlpcE46jBU8cu20logy0/gbDA+jRITSDSdZcFoAPaChUL3lFCakT5BRjuiFHy/4z0ree7hW0XiLkU5TIpuDtEanryAN1jbvRS77Qfi8/WZHrbWE6SyapEBPStiOUSQTFHv+K2u8GaxFleZBojHOz4JEimoQVQnhrgQoQUJw0A7s8gDkJKsqf1JAq5QfmNRDKQcVc2+gNPi+jwPjrsWVKTJEE/vEw6i1HYi59mmk4vCTNbVOaEkeZMgOBtJDgterSSR81VdroIVQGlY1Nl0Tr5Q/ItgXcNly+ZwsNV5jIIHI+JWzRD7JdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407461; c=relaxed/relaxed;
	bh=IVM3X1rg4VGWu4IcnayFrAyAZuw2zOgijpQFrlUdI0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JvtdusvX943srPJw1eeu09ofJs8AgHDi3I8i28KQRyONPLiYwjaxRvhfa8n46PGSS7ucx9f40Ebsi9Mjty+u6fK4MVxw1OAP2386Rj9Rammc6YaybRdNEvZtGG5DyO2yq3MS0ZT7bKe/f1k0Phekzsd16WuI4zYUeedEZ0wTOmhZ3V8Aa0rI1IwqMRkWNzBm2J+g+CfCRQqw/p8szAXFVfaUkYnwk7nAsQYlNYigwQIq20T0zAG4YSJaYtC/P++SLCyiCl+MoupEWFKJtqtnto+fF+mAUBTFll4/RNrriVbu+eLsIMPuW6gqePgWkqkQgTNINA8wTP5+qJ4Fc46GmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pVk3XUAo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pVk3XUAo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnH72Wrz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588M0FZs011739;
	Tue, 9 Sep 2025 08:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=IVM3X1rg4VGWu4IcnayFrAyAZuw2
	zOgijpQFrlUdI0s=; b=pVk3XUAoyH/PC9j1j+TBRebZZRXX62T7tlO9cFAQ7Nmi
	KbTpwRK8hooiJZzA+FvEjWsquBnXiOWP4jG55xun1/n9q0D/Q7G/4fflTEXaHiLX
	o0g3OeQZ5syS69CG0XJitQPIOZdvVDoKDye3YU+8IG6Xue8UkUbnmGudy9Rij6FI
	K+3cqLqrEgm+bfWR9iQWjDKdhN1k7BrQDtUIAeuOS2vLrVBSm8sZRGFqrBLuZqqi
	gSq2CDPiPlDmbbwoKNRUA0Wm6R69yiUee89V31VFuZVAOLBpf9UUuevUvOwiZ/jd
	FWQnEKZ13vCmdIoAKDbfC4HHyZ9yzVdKJnoxsskiwg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:11 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898RqqV016990;
	Tue, 9 Sep 2025 08:44:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5897adFH001172;
	Tue, 9 Sep 2025 08:44:09 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4912039wvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:09 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898i6Qb27984572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:06 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F65858063;
	Tue,  9 Sep 2025 08:44:06 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5247758059;
	Tue,  9 Sep 2025 08:44:05 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:05 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 0/9] powerpc/pseries: Add hypervisor pipe (HVPIPE) suport
Date: Tue,  9 Sep 2025 01:43:52 -0700
Message-ID: <20250909084402.1488456-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: s9L4OkZKjNhU1SRMUg45IBBRzPlD1MsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX8j0aL25E8lSd
 Lio2QxSD+gEvQDiyXi8qncAac+dKwL0IDnSc3JA8awktPf2r+ETWrj9hFGFdZtudrptoZUJ588N
 P3JsfIzBif/Tbki+MSZ6FTb95DjI1EMtZyZX3lpGvcITIIt+ERjITgoZ+ESZLvy5d9RvcTDkaE+
 XAzsnCqLZtb8fAht8yZzY/KSoR4h7YroNwxAv6P46CJgamwRJSmjvfq063mKC3Zogm799CRVrEV
 ZjQYJ1cJIerOtFfms7hWESMzFj8NDYNovhNON/9y4iqInPW/e5agjc3O9ndCwSiMHRjRuKy0dTS
 Yqewov9mpuvq6cdLqIQ5lQtEfNcUuKMoPeonBlkrQysS0EhmEbLexsKDU7hxbM+byrnRQr99eJ5
 gTqyR5Kt
X-Proofpoint-GUID: _p3Pcd_SMy0LlpiHqWhPtTl-ZeiPZVYm
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bfe8db cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=AaOw9N7w5JxA1M-cScMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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

v6:
The following changes based on build warnings as reported by kernel
test robot <lkp@intel.com>:
- Use __poll_t return type from poll() instead of 'unsigned int'
  ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces")
- Use __be64 pointer to work_area buf instead of u64 to update __be64 header
  values ("powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS")

v7:
Fix build warning as reported by kernel est robot <lkp@intel.com>
- Return POLLNVAL instead of -EIO if the source is not attached.
  ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces)
- Return POLLRDHUP instead of -ENXIO during migration.
  ("powerpc/pseries: HVPIPE changes to support migration")

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
 arch/powerpc/platforms/pseries/papr-hvpipe.c  | 818 ++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h  |  42 +
 10 files changed, 935 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-hvpipe.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h

-- 
2.50.1


