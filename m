Return-Path: <linuxppc-dev+bounces-10054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB8AF64E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2d2wYYz2xQ6;
	Thu,  3 Jul 2025 08:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494505;
	cv=none; b=aixKmbUXX2Orrufpz8DLXWxsNNtiinEtaiE/QkT2JCnHrtTNxcvNC4fqc7Qlqv78TPqWA71OgbyPQ3PnaK2otPqLB3NT0HOiNYUSdEb2/BL7kjx9MgWvNGSrlcF9Ym/dRYfvOa5ZtWuAbk0BFZ+jxNVbvvVBPrwjHgVRzEzYmapBVOFlI7ZQTBMBvsPoaSJEmjvVNiNiCuHpEEw4m5XncMRLo5zBJo8OCc8vCJuDp8PbHUmR2fAZXh5UrVv/dBGtCRZhpZspveViVnaaSfYVUIVcxq+hVupUqiklKS+qJQjYpt+OBdh9Bwuu/VR3T7E6w/qqtjAU0+29a1TSfoRLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494505; c=relaxed/relaxed;
	bh=XX5IocJC8J3ziXEmcO/hvM4mJqtF+qIvvqcmYpvkKTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VeHg5uzxyA8mzpOg84dn6o9aBQcec04nxUAF0OcBJGnvhAHRLWm6q1+EF3jfGoFKqk9dhvHmJ0zBuA9b6v2RTRi1+qJe6ZpeTdTnuyh9ix+cOFoZ5ttQwkGCPREqWH/8mvTP9/jOSlETjlWIFwYPMdh+vRg+TlxR6ca01Pn24uu+eVc0fR4UF5LMvQ9itZLZdMQPVctFB5IylOwDGvEySHc+ZnAqdDtWrNxGipg9RiR2Gc/ZeFOJJpH4Acfj2sPpyNsGe/DzLgbm2lKCW/2lGWUuuVkLfdBQY2jpY1e4jhdCKEg8TSFF+sfuCcFGnCiz5EZIkIXGpi13EyLVXmwSjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vgn+Evx2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vgn+Evx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2b5c1Bz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:03 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562KBTPR031789;
	Wed, 2 Jul 2025 22:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=XX5IocJC8J3ziXEmcO/hvM4mJqtF
	+qIvvqcmYpvkKTI=; b=Vgn+Evx20OXs67f4B+ppPMkJ6+Y/3F88wMvoR04Lhxkv
	i+gmD1VvWIBxC1OrxLvmpxwWajWoD/q1Um2NCnCHyWb4mZ1xVSop4PhDLHMzORYv
	nZ6NDAuiEIRdfQRycNEMN3601WfcPLcT0ue50l7FC0k+v6FaIFbl6Kdqe/hr9XOj
	n+VcoWPJfuDb6ic77u8iGm8DfvE4aZMOULxWwEw9Ea82JXBYD12kjjZHOPvwLcAj
	a7p8V7TE6vzwD1AXQCzF5xloX7sutWJ3B7dVudqHoVN+4vdciWsCr1j3VHBRFZPx
	ckXLx/mSpO0c9BmfgcExtAkNMB6y5QxMzWJJhq+cgQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttg717-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MErYF005540;
	Wed, 2 Jul 2025 22:14:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttg713-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562KMtSc021078;
	Wed, 2 Jul 2025 22:14:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jtquhydw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:52 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEmJ637618186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8466E58056;
	Wed,  2 Jul 2025 22:14:48 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA8D55803F;
	Wed,  2 Jul 2025 22:14:47 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:47 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 0/9] powerpc/pseries: Add hypervisor pipe (HVPIPE) suport
Date: Wed,  2 Jul 2025 15:14:34 -0700
Message-ID: <20250702221444.879256-1-haren@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: txFWMvR7JWrB3vcwEc1JgAyhNxTvJ3Mr
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=6865af5d cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7WqYcPGtkoB8p4lpbD4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AhVeHyuUtu4MIp78Oo2RXbcrLD612QE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX3JFqxysJ2wbW c7qc698fV5sorWQb55QXR+tZ1cZKeONSXmP5Ywo4pcXQke1E+5W4rhrZZ12y7oZ4CqrFji75eDD Lo1Q1yPtNESFgsmtdGj8XYaDrwpha1biS1HUkYYUQWcHtlZUh8ybJg93aYz8uBgIuBJnMehwAWn
 oa09cd37jm9PrqF8voBRkicsbyGpVyElTzuVUd/u4c2bdaACveD+w2AQGkukDgakrcJRa1wOXSz S8ulPd9wMB93gxeEALfDTCIs1KBH87QpUXU+O68Xmulz1KvN4hPdxSwdJ+BKa4LoextL11V40YU JJTx2U7s6vzSvMOygadWccG2Kaje99/stvbW6nqJUl2n2WZD447Nh07yLP1HnKrR7OdglfSaCOA
 8bD81Dv4eIwDrlweH7AWxtC9FeFicIyL5nPhQ89B99Rl3QGC8QG1Sv1vV7qIuLWyavHVDgBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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
 arch/powerpc/platforms/pseries/papr-hvpipe.c  | 792 ++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h  |  42 +
 10 files changed, 909 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-hvpipe.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h

-- 
2.43.5


