Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E34BCA82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 20:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1K0W5yQ5z3cY1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 06:50:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6GrxMsK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I6GrxMsK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Jzm4hQnz30LY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 06:49:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JIdQf9011279; 
 Sat, 19 Feb 2022 19:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WbnCrtqmKGlOFlPB8Mb2JHmp96l3XRVruTxRDQWoZvU=;
 b=I6GrxMsKhmbr3yLOtwKlLp+Weor/62wAXJC+NGdOODwkA7OuGD7UyH3yQeViZULu4gUE
 pttZuRrVRgKIOgF9lAJ9o310juVD9Si3XUfpzWq881MIXLoAtMcdEfbNEGHKpOcHiDtH
 X513uOAhXLhEEFM71hvawMIOCga1Yqr4y2mpH96ubzhYexOD5VTHlhHt6YjmwEGAzepv
 nk9JggPVOMqMeErH3y8wcWB4RWDfTeInw1PyCVZT56nDS3KCFHC5SqY59EZXK017X8mX
 ORN0lxnTdCOdT86qWg3cNaEXHc/yMX1iSXCCSD9lahgUFuylKhhslIcttu2sDb2dj7bu ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb4cm219j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:49:15 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJnFGg018902;
 Sat, 19 Feb 2022 19:49:15 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb4cm219b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:49:15 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJm8r7024703;
 Sat, 19 Feb 2022 19:49:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3ear697hn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:49:14 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JJnCfs28377464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 19:49:12 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CBE912405A;
 Sat, 19 Feb 2022 19:49:12 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA132124055;
 Sat, 19 Feb 2022 19:49:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 19:49:11 +0000 (GMT)
Message-ID: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Subject: [PATCH v4 0/9] powerpc/pseries/vas: NXGZIP support with DLPAR
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 11:49:10 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _oa_X-tib3DXN755IGva9JwS2W1C_Wqg
X-Proofpoint-GUID: e-vzoB-DYACNx6H-CWG3dtOXlBKLe8Dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202190126
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
Cc: haren@linux.ibm.co
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
  close them in the hypervisor, It uses FIFO to identify these
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
  due to lost credit before and selects windows based on same FIFO.
- Make these corresponding windows active and create remap with
  the same VMA on the new paste address in the fault handler.
- Then the user space should expect paste successful later.

Patch 1: Define common names for sysfs target/used/avail_creds so
         that same sysfs entries can be used even on PowerNV later.
Patch 2: Save PID in the vas window struct  during initial window
	 open and use it when reopen later.
Patch 3: Add new mmap fault handler which handles the page fault
	 from NX on paste address.
Patch 4: Return the paste instruction failure if the window is not
	 active.
Patch 5: If the window is closed in the hypervisor before the user
	 space issue the initial mmap(), return -EACCES failure.
Patch 6: Close windows in the hypervisor when the partition exceeds
	 its usage than the new target credits.
Patch 7: When credits are available, reopen windows that are closed
	 before with core removal.
Patch 8 & 9: The user space determines the credit usage with sysfs
         target/avail/used_creds interfaces. drmgr uses target_creds
        to notify OS for QoS credit changes.

Thanks to Nicholas Piggin and Aneesh Kumar for the valuable suggestions
on the NXGZIP design to support DLPAR operations.

Changes in v2:
- Rebase on 5.16-rc5
- Use list safe functions to iterate windows list
- Changes to show the actual value in sysfs used_credits even though
  some windows are inactive with core removal. Reflects -ve value in
  sysfs avail_creds to let userspace know that it opened more windows
  than the current maximum LPAR credits.

Changes in v3:
- Rebase on 5.16
- Reconfigure VAS windows only for CPU hotplug events.

Changes in v4:
- Rebase on 5.17-rc4
- Changes based on comments from Nicholas Piggin
    - Included VAS DLPAR notifer code in 'Close windows with DLPAR'
      patch instead of as a separate patch
    - Patches reordering and other changes

Haren Myneni (9):
  powerpc/pseries/vas: Use common names in VAS capability structure
  powerpc/pseries/vas: Save PID in pseries_vas_window struct
  powerpc/vas: Add paste address mmap fault handler
  powerpc/vas: Return paste instruction failure if no active window
  powerpc/vas: Map paste address only if window is active
  powerpc/pseries/vas: Close windows with DLPAR core removal
  powerpc/pseries/vas: Reopen windows with DLPAR core add
  powerpc/pseries/vas: sysfs interface to export capabilities
  powerpc/pseries/vas: Write 'nr_total_credits' for QoS credits change

 arch/powerpc/include/asm/ppc-opcode.h      |   2 +
 arch/powerpc/include/asm/vas.h             |  12 +
 arch/powerpc/platforms/book3s/vas-api.c    | 141 ++++++++-
 arch/powerpc/platforms/pseries/Makefile    |   2 +-
 arch/powerpc/platforms/pseries/vas-sysfs.c | 257 +++++++++++++++++
 arch/powerpc/platforms/pseries/vas.c       | 321 +++++++++++++++++++--
 arch/powerpc/platforms/pseries/vas.h       |  16 +-
 7 files changed, 729 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c

-- 
2.27.0


