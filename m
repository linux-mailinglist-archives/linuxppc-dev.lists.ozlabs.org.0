Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFB2C2287
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:11:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgKYT29trzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:11:25 +1100 (AEDT)
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
 header.s=pp1 header.b=q+S1SMc9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgKGw02xqzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 20:58:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AO9X8QD047820
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 04:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=WFjE5AjYv1U98OYHHq3RIzkVxshuZiL0JC81qO0ZTKU=;
 b=q+S1SMc9HrYaaDwIyk3DCDUzpxPefPv4xeq3B+8fbud4vW4RHr5VZAG2SkJjVLWf31dk
 +YLG/P81gk2NiD2BBjIHrMn3mw+UzHJqga64VLcA0MkOXQJ6Cym59cmaOUOhu8lGGwoo
 ZohOuSoOr5X8Hz5XgMW8sp6bKEtf7HamC3BUZ/PVZAkas+Btd4BdTIoSYhcaVegrxi3A
 EnrvCSs9dECh9OYWDW92KyztgEMn9zideZ3h3zrmtlRqSNXArbKYaq44T4EZQ38gufQi
 lA24z3h1ndrdikxy/CEem34sqEpbvdLo7OC3iOuhX9XzyHbAb4ORqalviLZDMmztfH4A mQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yghs0abs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 04:58:44 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AO9wLOs010325
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 09:58:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8bepy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 09:58:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AO9wcEh8782552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 09:58:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A49C752051;
 Tue, 24 Nov 2020 09:58:38 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.68.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6B8685204F;
 Tue, 24 Nov 2020 09:58:38 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V3 0/5] ocxl: Mmio invalidation support 
Date: Tue, 24 Nov 2020 10:58:33 +0100
Message-Id: <20201124095838.18665-1-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_03:2020-11-24,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240056
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
 arch/powerpc/platforms/powernv/ocxl.c | 115 ++++++++++++++++++++++++++
 drivers/misc/ocxl/context.c           |   4 +-
 drivers/misc/ocxl/link.c              |  70 +++++++++++++++-
 drivers/misc/ocxl/ocxl_internal.h     |   9 +-
 drivers/misc/ocxl/trace.h             |  64 ++++++++++++++
 drivers/scsi/cxlflash/ocxl_hw.c       |   6 +-
 include/misc/ocxl.h                   |   2 +-
 8 files changed, 315 insertions(+), 9 deletions(-)

-- 
2.28.0

