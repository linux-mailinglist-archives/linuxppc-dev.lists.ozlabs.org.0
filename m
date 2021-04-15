Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AB3608EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdT55tCXz3byh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:10:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V2Y1g+NM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V2Y1g+NM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLdSY6QJWz2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:09:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC3thu183105; Thu, 15 Apr 2021 08:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5ddDQ/clXi0X1sbC3zFmEZgrYe/+8ei9iOL/9N2fDIs=;
 b=V2Y1g+NMed0o+xFSGdCoEdE8Ap/uLlMNbIiw6fHblFSLvGi9i8CrN6aHr1fHvyt0FIa6
 CmTf6sRyrzsUUKkARIexkironG7vOORAlPC8vPrsUB/yx4PsCgxwtsOfMTLEvb7FeBK5
 lpG5ccwKxqVx6s1VIEaR9XRFtQTFG2EDbCgtMhYjMgd4/IlkjTsXB+eiimX9JeyRj1gl
 jxSneyaDWoXKg74tUV/xARQCh879dxhqRe5FdVnSXlP5XugG7xxUA/jJWhU8dibZeJWD
 FElLkGnXcvAG9rr83FebYjQO7EhJwS1hoSGGTi6kHtN2CW+OKpTxXydR1FU+gkrQKEvj sw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37x094gps3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:42 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FC898Q020784;
 Thu, 15 Apr 2021 12:09:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 37u3n8j2hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:09:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FC9cso12976570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:09:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FBA6A4060;
 Thu, 15 Apr 2021 12:09:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04C01A405F;
 Thu, 15 Apr 2021 12:09:37 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.74.6])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 12:09:36 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] Reintroduce cpu_core_mask
Date: Thu, 15 Apr 2021 17:39:31 +0530
Message-Id: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FQnFE0A_Vd_0_iwBV8VXLacZTJqExrJw
X-Proofpoint-GUID: FQnFE0A_Vd_0_iwBV8VXLacZTJqExrJw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150081
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel had reported that
 QEMU is now unable to see requested topologies in a multi socket single
 NUMA node configurations.
 -smp 8,maxcpus=8,cores=2,threads=2,sockets=2

This patchset reintroduces cpu_core_mask so that users can see requested
topologies while still maintaining the boot time of very large system
configurations.

It includes caching the chip_id as suggested by Michael Ellermann

4 Threads/Core; 4 cores/Socket; 4 Sockets/Node, 2 Nodes in System
  -numa node,nodeid=0,memdev=m0 \
  -numa node,nodeid=1,memdev=m1 \
  -smp 128,sockets=8,threads=4,maxcpus=128  \

5.12.0-rc5 (or any kernel with commit 4ca234a9cbd7)
---------------------------------------------------
srikar@cloudy:~$ lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          128
On-line CPU(s) list:             0-127
Thread(s) per core:              4
Core(s) per socket:              16
Socket(s):                       2                 <<<<<-----
NUMA node(s):                    2
Model:                           2.3 (pvr 004e 1203)
Model name:                      POWER9 (architected), altivec supported
Hypervisor vendor:               KVM
Virtualization type:             para
L1d cache:                       1 MiB
L1i cache:                       1 MiB
NUMA node0 CPU(s):               0-15,32-47,64-79,96-111
NUMA node1 CPU(s):               16-31,48-63,80-95,112-127
--
srikar@cloudy:~$ dmesg |grep smp
[    0.010658] smp: Bringing up secondary CPUs ...
[    0.424681] smp: Brought up 2 nodes, 128 CPUs
--

5.12.0-rc5 + 3 patches
----------------------
srikar@cloudy:~$ lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          128
On-line CPU(s) list:             0-127
Thread(s) per core:              4
Core(s) per socket:              4
Socket(s):                       8    <<<<-----
NUMA node(s):                    2
Model:                           2.3 (pvr 004e 1203)
Model name:                      POWER9 (architected), altivec supported
Hypervisor vendor:               KVM
Virtualization type:             para
L1d cache:                       1 MiB
L1i cache:                       1 MiB
NUMA node0 CPU(s):               0-15,32-47,64-79,96-111
NUMA node1 CPU(s):               16-31,48-63,80-95,112-127
--
srikar@cloudy:~$ dmesg |grep smp
[    0.010372] smp: Bringing up secondary CPUs ...
[    0.417892] smp: Brought up 2 nodes, 128 CPUs

5.12.0-rc5
----------
srikar@cloudy:~$  lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          1024
On-line CPU(s) list:             0-1023
Thread(s) per core:              8
Core(s) per socket:              128
Socket(s):                       1
NUMA node(s):                    1
Model:                           2.3 (pvr 004e 1203)
Model name:                      POWER9 (architected), altivec supported
Hypervisor vendor:               KVM
Virtualization type:             para
L1d cache:                       4 MiB
L1i cache:                       4 MiB
NUMA node0 CPU(s):               0-1023
srikar@cloudy:~$ dmesg | grep smp
[    0.027753 ] smp: Bringing up secondary CPUs ...
[    2.315193 ] smp: Brought up 1 node, 1024 CPUs

5.12.0-rc5 + 3 patches
----------------------
srikar@cloudy:~$ dmesg | grep smp
[    0.027659 ] smp: Bringing up secondary CPUs ...
[    2.532739 ] smp: Brought up 1 node, 1024 CPUs

I also have booted and tested the kernels on PowerVM and PowerNV and
even there I see a very negligible increase in the bringing up time of
secondary CPUs

Srikar Dronamraju (3):
  powerpc/smp: Reintroduce cpu_core_mask
  Revert "powerpc/topology: Update topology_core_cpumask"
  powerpc/smp: Cache CPU to chip lookup

 arch/powerpc/include/asm/smp.h      |  6 ++++
 arch/powerpc/include/asm/topology.h |  2 +-
 arch/powerpc/kernel/prom.c          | 19 +++++++---
 arch/powerpc/kernel/smp.c           | 56 +++++++++++++++++++++++++----
 4 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.25.1

