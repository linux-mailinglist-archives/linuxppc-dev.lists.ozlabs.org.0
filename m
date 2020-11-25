Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADA2C447F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:52:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch54h49LdzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PJOtRyyx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5261jWDzDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:50:21 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APFW1SD006348
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=W0l5ef+qJ5KVmWwSB+FRmYZhdx3gGsiCQhJWq/Esres=;
 b=PJOtRyyxJOxokqmk8o2PN6CSw77wZFPtK7uM3+a1d1lqMWGkWAdhofeEkGcs2j45TRli
 GQ+bVCreT/rCLiGlCBDZJaA1g+LxPtNnsWFjBO4i+nRoSa2Z7iflQDFQJLN9EOYf9y/v
 pKeO6Dimxj+LAX1YO9n/fPZPfBrI9D4tXu2hNiRQM26vMRP/iVlvAjG4q8+CTZcfMl5c
 h0gpZSv55jMW57bJwQQwaZ42PB52e9X5dtBbfguRVbwD7PAVOHRYGl/tqbfuMGZ/JZe+
 yHvZiaSp/jnqwC/kJPPZyI8/kHJXkUvtxi/fakQmBVJtB3NhkUK4mzwYXfF06xk6EjPq Sw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 351347suvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:18 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APFbgAW014472
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8guf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APFoD1M8323710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 15:50:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BB464204D;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F934203F;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.47.8])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V4 0/5] ocxl: Mmio invalidation support 
Date: Wed, 25 Nov 2020 16:50:08 +0100
Message-Id: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_09:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011250096
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
Changelog[v4]
 - Rebase to latest upstream.
 - Correct a typo in page size

Changelog[v3]
 - Rebase to latest upstream.
 - Add page_size argument in pnv_ocxl_tlb_invalidate()
 - Remove double pointer
 
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

 arch/powerpc/include/asm/pnv-ocxl.h   |  54 ++++++++++++
 arch/powerpc/platforms/powernv/ocxl.c | 114 ++++++++++++++++++++++++++
 drivers/misc/ocxl/context.c           |   4 +-
 drivers/misc/ocxl/link.c              |  70 +++++++++++++++-
 drivers/misc/ocxl/ocxl_internal.h     |   9 +-
 drivers/misc/ocxl/trace.h             |  64 +++++++++++++++
 drivers/scsi/cxlflash/ocxl_hw.c       |   6 +-
 include/misc/ocxl.h                   |   2 +-
 8 files changed, 314 insertions(+), 9 deletions(-)

-- 
2.28.0

