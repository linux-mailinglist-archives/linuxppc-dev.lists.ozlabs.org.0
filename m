Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE1D964D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 18:02:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tcW52F9szDqCZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tcRt26l6zDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 02:59:21 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9GFsh44120666
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 11:59:18 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vp67rg6yp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 11:59:18 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Wed, 16 Oct 2019 16:59:15 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 16 Oct 2019 16:59:14 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9GFxECF53018648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 15:59:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E75DAA4055;
 Wed, 16 Oct 2019 15:59:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACD65A4053;
 Wed, 16 Oct 2019 15:59:13 +0000 (GMT)
Received: from lombard-w541.ibmuc.com (unknown [9.145.11.244])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 15:59:13 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, groug@kaod.org
Subject: [PATCH V2 0/2] ocxl: Move SPA and TL definitions
Date: Wed, 16 Oct 2019 17:59:11 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101615-0020-0000-0000-00000379A1F4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101615-0021-0000-0000-000021CFC715
Message-Id: <20191016155913.13693-1-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=975 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160132
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

This series moves the definition and the management of scheduled process
area (SPA) and of the templates (Transaction Layer) for an ocxl card,
using the OCAPI interface. The code is now located in the specific arch
powerpc platform.
These patches will help for a futur implementation of the ocxl driver in
QEMU.

The Open Coherently Attached Processor Interface (OCAPI) is used to
allow an Attached Functional Unit (AFU) to connect to the Processor
Chip's system bus in a high speed and cache coherent manner.

The Scheduled Processes Area and the configuration of the Transaction
Layer are specific to the AFU and more generally to the Opencapi device.
Running the ocxl module in a guest environment, and later in several guests
in parallel, using the same Opencapi device and the same AFus, involves to
have a common code handling the SPA. This explains why these parts of the ocxl
driver will move to arch powerpc platform running on the host.

It builds on top of the existing ocxl driver.

It has been tested in a bare-metal environment using the memcpy and
the AFP AFUs.

Changelog:
v2:
 - patch 1: delete debug message as it no longer makes sense.  (Fred)
            Rename pnv_ocxl_read_xsl_regs to pnv_ocxl_get_fault_state. (Fred)
            Rename pnv_ocxl_write_xsl_tfc to pnv_ocxl_handle_fault. (Fred)
            Call opal_npu_spa_clear_cache() internally without using external
            function. (Fred)
            Remove pe_handle parameter from pnv_ocxl_update_pe() (Fred)
            Not possible to split this patch in 2 (one part for the SPA
            handling, the other for the translation fault interrupt). There are
            far too many dependencies with the SPA structure. (Fred)
            Switch the order of the pe_data allocation and the call to add the
            entry in the SPA. (Fred)

christophe lombard (2):
  powerpc/powernv: ocxl move SPA definition
  powerpc/powernv: ocxl move TL definition

 arch/powerpc/include/asm/pnv-ocxl.h   |  46 +--
 arch/powerpc/platforms/powernv/ocxl.c | 400 +++++++++++++++++++++++---
 drivers/misc/ocxl/afu_irq.c           |   1 -
 drivers/misc/ocxl/config.c            |  89 +-----
 drivers/misc/ocxl/link.c              | 383 ++++++------------------
 drivers/misc/ocxl/ocxl_internal.h     |  12 -
 drivers/misc/ocxl/trace.h             |  64 ++---
 7 files changed, 508 insertions(+), 487 deletions(-)

-- 
2.21.0

