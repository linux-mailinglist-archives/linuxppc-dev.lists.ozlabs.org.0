Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D0461CF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:45:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2t6v5Rnqz3cRF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:45:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dn0neh4J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dn0neh4J; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2t6B6F0Vz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:45:06 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhK1q031726; 
 Mon, 29 Nov 2021 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1tK+pa4Aqvy8nGBPFYTLaV3b98FMUx6WXsjFQOq8RS8=;
 b=dn0neh4JHuv0MGFtS5X4jY+U2SwUh0NPUksYL+VoCnq0meE3ntke9iUumiEo6DrvBAUw
 IVTWGf9+M/sotXD75smSoKecrxVJ4iJMiWEr+iau8IPCFh1OFSc24e25LJzvRUhz6Yke
 pfrZiHEyD63tn2Ecwra/TRXCq3OdzER4KFj3oM+8a1dtualGYW5so8xH9NCKFGidc+3X
 WLK/AyecLfVFrssXNXoUnjoDnJ3w04crIYa+ctpGXpqCxK/muU4S4S91yC6zp76FmCNN
 UF+xxxj0fJ5yMT114Ii9jhLw1YFGd5cTsEq+jrTycWsuY5zd9WkOGfiLrP1ulc/kNv2+ qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn289a807-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:44:59 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHhFNx031542;
 Mon, 29 Nov 2021 17:44:58 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn289a7ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:44:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhTK3026343;
 Mon, 29 Nov 2021 17:44:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3ckcaar3n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:44:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHiuls46596494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:44:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64691C6067;
 Mon, 29 Nov 2021 17:44:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECCD7C605A;
 Mon, 29 Nov 2021 17:44:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:44:54 +0000 (GMT)
Message-ID: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Subject: [PATCH 00/10] powerpc/pseries/vas: NXGZIP support with DLPAR
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:44:53 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wYt8WaQgxuPbjoSfDdQPjOqaXA6dvEms
X-Proofpoint-GUID: keksJiH6wTsPJctPHmiBAvM_37_dtPCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=953 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111290082
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


PowerPC provides HW compression with NX coprocessor. This feature
is available on both PowerNV and PowerVM and included in Linux.
Since each powerpc chip has one NX coprocessor, the VAS introduces
the concept of windows / credits to manage access to this hardware
resource. On powerVM, these limited resources should be available
across all LPARs. So the hypervisor assigns the specific credits
to each LPAR based on processor entitlement so that one LPAR does
not overload NX. The hypervisor can reject the window open request
to a partition if exceeds its credit limit (1 credit per window).

So the total number of target credits in a partition can be changed
if the core configuration is modified. The hypervisor expects the
partition to modify its window usage depends on new target
credits. For example, if the partition uses more credits than the
new target credits, it should close the excessive windows so that
the NX resource will be available to other partitions.

This patch series enables OS to support this dynamic credit
management with DLPAR core removal/add.

Core removal operation:
- Get new VAS capabilities from the hypervisor when the DLPAR
  notifier is received. This capabilities provides the new target
  credits based on new processor entitlement. In the case of QoS
  credit changes, the notification will be issued by updating
  the target_creds via sysfs.
- If the partition is already used more than the new target credits,
  the kernel selects windows, unmap the current paste address and
  close them in the hypervisor, It uses LIFO to identify these
  windows - last windows that are opened are the first ones to be
  closed.
- When the user space issue requests on these windows, NX generates
  page fault on the unmap paste address. The kernel handles the
  fault by returning the paste instruction failure if the window is
  not active (means unmap paste). Then up to the library / user
  space to fall back to SW compression or manage with the current
  windows.

Core add operation:
- The kernel can see increased target credits from the new VAS
  capabilities.
- Scans the window list for the closed windows in the hypervisor
  due to lost credit before and selects windows based on same LIFO.
- Make these corresponding windows active and create remap with
  the same VMA on the new paste address in the fault handler.
- Then the user space should expect paste successful later.

Patch 1: Define common names for sysfs target/used/avail_creds so
	 that same sysfs entries can be used even on PowerNV later.
Patch 2: Add VAS notifier for DLPAR core add / removal
Patch 3: Save LPID in the vas window struct  during initial window
	 open and use it when reopen later.
Patch 4: When credits are available, reopen windows that are closed
	 before with core removal.
Patch 5: Close windows in the hypervisor when the partition exceeds
	 its usage than the new target credits.
Patch 6: If the window is closed in the hypervisor before the user
	 space issue the initial mmap(), return -EACCES failure.
Patch 7: Add new mmap fault handler which handles the page fault
	 from NX on paste address.
Patch 8: Return the paste instruction failure if the window is not
	 active.
Patch 9 & 10: The user space determines the credit usage with sysfs
	 target/avail/used_creds interfaces. drmgr uses target_creds
	to notify OS for QoS credit changes.

Thanks to Nicholas Piggin and Aneesh Kumar for the valuable suggestions
on the NXGZIP design to support DLPAR operations.
  
Haren Myneni (10):
  powerpc/pseries/vas: Use common names in VAS capability structure
  powerpc/pseries/vas: Add notifier for DLPAR core removal/add
  powerpc/pseries/vas: Save partition PID in pseries_vas_window struct
  powerpc/pseries/vas: Reopen windows with DLPAR core add
  powerpc/pseries/vas: Close windows with DLPAR core removal
  powerpc/vas: Map paste address only if window is active
  powerpc/vas: Add paste address mmap fault handler
  powerpc/vas: Return paste instruction failure if window is not active
  powerpc/pseries/vas: sysfs interface to export capabilities
  powerpc/pseries/vas: Write 'target_creds' for QoS credits change

 arch/powerpc/include/asm/ppc-opcode.h      |   2 +
 arch/powerpc/include/asm/vas.h             |  16 ++
 arch/powerpc/platforms/book3s/vas-api.c    | 129 ++++++++-
 arch/powerpc/platforms/pseries/Makefile    |   2 +-
 arch/powerpc/platforms/pseries/vas-sysfs.c | 246 +++++++++++++++++
 arch/powerpc/platforms/pseries/vas.c       | 293 ++++++++++++++++++++-
 arch/powerpc/platforms/pseries/vas.h       |  16 +-
 7 files changed, 691 insertions(+), 13 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c

-- 
2.27.0


