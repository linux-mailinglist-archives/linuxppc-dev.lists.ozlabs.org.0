Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A462BB188
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:36:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3d15cb7zDq6q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 04:36:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=crccE3lq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd3Xf0CB3zDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:32:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKHVi4L074138
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=y0j0bs3feqhjqWRmgU2JzpUEbc1aepzmu88Zy4+qeyY=;
 b=crccE3lqSWzFJTGGw3BOEN9+pzFbvQx3BWOqr8zyCdtoGKbpjqtmN362JnkBjTAneNMJ
 YUSKirA0oYCmgZE+bpwJyLRu1dQWfFTyh9U7ALE0AaBYkuhMZ8hj+f02U7JztBtTBtPY
 cDgzz+9pE0mdcPqV9uPTND2BQRm82hgEl5JvjnnQl8d8zn9J7ryumzYUsOVkdmXDuH14
 lMkKoyWkcSGFTH/1iqy6bo1hREYIDITjKD9lNr2IldomU+CQDRlIbj2qMVJqsW44IU2F
 XonCowqhWDEusMlFDGGBzgpdCg1eiPR2BEUDlBP8PWDwX4JhZ618zjMoAnw2sKks0vaE Tw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xj7v02n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKHVg2E014601
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 34weby1wht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHWfVu21496188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:32:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97EB4A4057;
 Fri, 20 Nov 2020 17:32:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C815A404D;
 Fri, 20 Nov 2020 17:32:41 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.3.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:32:41 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V2 0/5] ocxl: Mmio invalidation support 
Date: Fri, 20 Nov 2020 18:32:36 +0100
Message-Id: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200116
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

OpenCAPI 4.0/5.0 with TLBI/SLBI Snooping, is not used due to performance
problems caused by the PAU having to process all incoming TLBI/SLBI
commands which will cause them to back up on the PowerBus.

When the Address Translation Mode requires TLB operations to be initiated
using MMIO registers, a set of registers like the following is used:
• XTS MMIO ATSD0 LPARID register
• XTS MMIO ATSD0 AVA register
• XTS MMIO ATSD0 launch register, write access initiates a shoot down
• XTS MMIO ATSD0 status register

The MMIO based mechanism also blocks the NPU/PAU from snooping TLBIE
commands from the PowerBus.

The Shootdown commands (ATSD) will be generated using MMIO registers
in the NPU/PAU and sent to the device.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>

---
Changelog[v2]
 - Rebase to latest upstream.
 - Create a set of smaller patches
 - Move the device tree parsing and ioremap() for the shootdown page in a
   platform-specific file (powernv)
 - Release the shootdown page in release_xsl()
 - Initialize atsd_lock
 - Move the code to initiate the TLB Invalidate command in a
   platform-specific file (powernv)
 - Use the notifier invalidate_range
---

Christophe Lombard (5):
  ocxl: Assign a register set to a Logical Partition
  ocxl: Initiate a TLB invalidate command
  ocxl: Update the Process Element Entry
  ocxl: Add mmu notifier
  ocxl: Add new kernel traces

 arch/powerpc/include/asm/pnv-ocxl.h   |  53 +++++++++++++
 arch/powerpc/platforms/powernv/ocxl.c | 103 ++++++++++++++++++++++++++
 drivers/misc/ocxl/context.c           |   4 +-
 drivers/misc/ocxl/link.c              |  66 ++++++++++++++++-
 drivers/misc/ocxl/ocxl_internal.h     |   4 +-
 drivers/misc/ocxl/trace.h             |  64 ++++++++++++++++
 drivers/scsi/cxlflash/ocxl_hw.c       |   6 +-
 include/misc/ocxl.h                   |   2 +-
 8 files changed, 295 insertions(+), 7 deletions(-)

-- 
2.28.0

