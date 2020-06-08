Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D381F16F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 12:52:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gVSP36x5zDqRn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 20:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gVPV02MTzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 20:49:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058AW1B1011426
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31geq6t0ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 06:49:30 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058AZxUT029161
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:30 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31geq6t098-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 06:49:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058Akp5C013086;
 Mon, 8 Jun 2020 10:49:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 31g2s7usgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 10:49:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058AnOOv56033342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 10:49:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E3A4C040;
 Mon,  8 Jun 2020 10:49:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B24A84C050;
 Mon,  8 Jun 2020 10:49:23 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.48.183])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 10:49:23 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 0/4] Off-load TLB invalidations to host for !GTSE
Date: Mon,  8 Jun 2020 16:19:05 +0530
Message-Id: <20200608104909.14350-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_07:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=1 mlxlogscore=999 cotscore=-2147483648
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080077
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hypervisor may choose not to enable Guest Translation Shootdown Enable
(GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
permitted to use instructions like tblie and tlbsync directly, but is
expected to make hypervisor calls to get the TLB flushed.

This series enables the TLB flush routines in the radix code to
off-load TLB flushing to hypervisor via the newly proposed hcall
H_RPT_INVALIDATE. The specification of this hcall is still evolving
while the patchset is posted here for any early comments.

To easily check the availability of GTSE, it is made an MMU feature.
(TODO: Check if this can be a static key instead of MMU feature)

The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
handle GTSE as an optionally available feature and to not assume GTSE
when radix support is available.

H_RPT_INVALIDATE
================
Syntax:
int64   /* H_Success: Return code on successful completion */
        /* H_Busy - repeat the call with the same */
        /* H_P2, H_P3, H_P4, H_Parameter: Invalid parameters */
        hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate process scoped RPT lookaside information */
              uint64 pid,       /* PID to invalidate */
              uint64 target,    /* Invalidation target */
              uint64 what,      /* What type of lookaside information */
              uint64 pages,     /* Page sizes */
              uint64 start,     /* Start of Effective Address (EA) range */
              uint64 end)       /* End of EA range */

Invalidation targets (target)
-----------------------------
Core MMU        0x01 /* All virtual processors in the partition */
Core local MMU  0x02 /* Current virtual processor */
Nest MMU        0x04 /* All nest/accelerator agents in use by the partition */
A combination of the above can be specified, except core and core local.

What to invalidate (what)
-------------------------
Reserved        0x0001  /* Reserved */
TLB             0x0002  /* Invalidate TLB */
PWC             0x0004  /* Invalidate Page Walk Cache */
PRS             0x0008  /* Invalidate Process Table Entries */
A combination of the above can be specified.

Page size mask (pages)
----------------------
4K              0x01
64K             0x02
2M              0x04
1G              0x08
All sizes       (-1UL)
A combination of the above can be specified.
All page sizes can be selected with -1.

Semantics: Invalidate radix tree lookaside information
           matching the parameters given.
* Return H_P2, H_P3 or H_P4 if target, what or pages parameters are
  different from the defined values.
* Return H_PARAMETER if (start, end) doesn't form a valid range.
* May invalidate more translation information than was specified.
* If start = 0 and end = -1, set the range to cover all valid addresses.
  Else start and end should be aligned to 4kB (lower 11 bits clear).
* If pid = 0 then valid addresses are quadrant 3 and quadrant 0 spaces,
  Else valid addresses are quadrant 0.
* Pages which are fully covered by the range are to be invalidated.
  Those which are partially covered are considered outside invalidation
  range, which allows a call to optimally invalidate ranges that may
  contain mixed page sizes.
* Return H_SUCCESS on success.

Bharata B Rao (3):
  powerpc/mm: Make GTSE as MMU FTR
  powerpc/prom_init: Ask for Radix GTSE only if supported.
  powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
    enabled

Nicholas Piggin (1):
  powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
    !GTSE

 arch/powerpc/include/asm/hvcall.h         |   1 +
 arch/powerpc/include/asm/mmu.h            |   4 +
 arch/powerpc/include/asm/plpar_wrappers.h |  14 +++
 arch/powerpc/kernel/dt_cpu_ftrs.c         |   2 +
 arch/powerpc/kernel/prom_init.c           |  13 +--
 arch/powerpc/mm/book3s64/radix_tlb.c      | 105 ++++++++++++++++++++--
 arch/powerpc/mm/init_64.c                 |   6 +-
 arch/powerpc/platforms/pseries/lpar.c     |   8 +-
 8 files changed, 137 insertions(+), 16 deletions(-)

-- 
2.21.3

