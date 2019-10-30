Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD03EA26E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:25:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FhC2w0qzF4b7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:24:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473F7p00lBzF4R7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:00:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9UGctwC018944; Wed, 30 Oct 2019 13:00:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxwmqn6un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:10 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9UGdlDg021229;
 Wed, 30 Oct 2019 13:00:07 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxwmqn6qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:07 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9UGxOY4025823;
 Wed, 30 Oct 2019 17:00:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 2vxwh5qgfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 17:00:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9UH01a145220278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 17:00:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 575A1AC067;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D51AC066;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 408904654A3; Wed, 30 Oct 2019 12:00:00 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/11] powerpv/powernv: Restore pnv_npu_try_dma_set_bypass()
Date: Wed, 30 Oct 2019 11:59:49 -0500
Message-Id: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=744 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910300150
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Oliver O'Halloran <oohall@gmail.com>, Alistair Popple <alistair@popple.id.au>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With recent kernels, TCE tables for NPU devices are no longer being
configured. That task was performed by pnv_npu_try_dma_set_bypass(), a
function that got swept away in recent overhauling of dma code.

Patches 1-4 here bring the lost function back and reintegrate it with
the updated generic iommu bypass infrastructure.

Patch 5 fixes a regression in behavior when a requested dma mask can not
be fulfilled.

Patches 6-8 are cleanup. I put these later in the set because they
aren't bisectable until after the restored code is wired back in.

Patches 9-11 refactor pnv_pci_ioda_iommu_bypass_supported(). It seems
wrong for a boolean *_supported() function to have side effects. They
reintroduce a pci controller based dma_set_mask() hook. If that's
undesirable, these last three patches can be dropped.

Reza Arbab (11):
  Revert "powerpc/powernv: Remove unused pnv_npu_try_dma_set_bypass()
    function"
  powerpc/powernv: Add pnv_ioda_pe_iommu_bypass_supported()
  powerpc/powernv/npu: Change pnv_npu_try_dma_set_bypass() argument
  powerpc/powernv/npu: Wire up pnv_npu_try_dma_set_bypass()
  powerpc/powernv: Return failure for some uses of dma_set_mask()
  powerpc/powernv: Remove intermediate variable
  powerpc/powernv/npu: Simplify pnv_npu_try_dma_set_bypass() loop
  powerpc/powernv: Replace open coded pnv_ioda_get_pe()s
  Revert "powerpc/pci: remove the dma_set_mask pci_controller ops
    methods"
  powerpc/powernv: Add pnv_phb3_iommu_bypass_supported()
  powerpc/powernv: Add pnv_pci_ioda_dma_set_mask()

 arch/powerpc/include/asm/pci-bridge.h     |   2 +
 arch/powerpc/kernel/dma-iommu.c           |  19 ++++--
 arch/powerpc/kernel/dma-mask.c            |   9 +++
 arch/powerpc/platforms/powernv/Kconfig    |   1 +
 arch/powerpc/platforms/powernv/npu-dma.c  | 106 +++++++++++++++++++++++++++---
 arch/powerpc/platforms/powernv/pci-ioda.c |  71 ++++++++++++--------
 arch/powerpc/platforms/powernv/pci.h      |  10 ++-
 7 files changed, 177 insertions(+), 41 deletions(-)

-- 
1.8.3.1

