Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7ED1FF8D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:11:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nn4d3GndzDrMb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 02:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nn2V6D1CzDrF4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 02:09:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IG3ltK185910; Thu, 18 Jun 2020 12:09:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rb5t8vf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:47 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IG4BDT191407;
 Thu, 18 Jun 2020 12:09:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rb5t8veb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IG667Y030744;
 Thu, 18 Jun 2020 16:09:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 31quax9ca4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:09:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05IG9f1u52822484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 16:09:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF7FCA4054;
 Thu, 18 Jun 2020 16:09:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D79BA405B;
 Thu, 18 Jun 2020 16:09:40 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.46.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 16:09:40 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/5] Off-load TLB invalidations to host for !GTSE
Date: Thu, 18 Jun 2020 21:39:25 +0530
Message-Id: <20200618160930.26324-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_14:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 cotscore=-2147483648
 mlxlogscore=999 malwarescore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180121
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
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
The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
handle GTSE as an optionally available feature and to not assume GTSE
when radix support is available.

The actual hcall implementation for KVM isn't included in this
patchset.

H_RPT_INVALIDATE
================
Syntax:
int64   /* H_Success: Return code on successful completion */
        /* H_Busy - repeat the call with the same */
        /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid parameters */
        hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT translation lookaside information */
              uint64 pid,       /* PID/LPID to invalidate */
              uint64 target,    /* Invalidation target */
              uint64 type,      /* Type of lookaside information */
              uint64 pageSizes,     /* Page sizes */
              uint64 start,     /* Start of Effective Address (EA) range (inclusive) */
              uint64 end)       /* End of EA range (exclusive) */

Invalidation targets (target)
-----------------------------
Core MMU        0x01 /* All virtual processors in the partition */
Core local MMU  0x02 /* Current virtual processor */
Nest MMU        0x04 /* All nest/accelerator agents in use by the partition */

A combination of the above can be specified, except core and core local.

Type of translation to invalidate (type)
---------------------------------------
NESTED       0x0001  /* invalidate nested guest partition-scope */
TLB          0x0002  /* Invalidate TLB */
PWC          0x0004  /* Invalidate Page Walk Cache */
PRT          0x0008  /* Invalidate Process Table Entries if NESTED is clear*/
PAT          0x0008  /* Invalidate Partition Table Entries  if NESTED is set*/

A combination of the above can be specified.

Page size mask (pages)
----------------------
4K              0x01
64K             0x02
2M              0x04
1G              0x08
All sizes       (-1UL)

A combination of the above can be specified.
All page sizes can be selected with -1.

Semantics: Invalidate radix tree lookaside information
           matching the parameters given.
* Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters are
  different from the defined values.
* Return H_PARAMETER if NESTED is set and pid is not a valid nested
  LPID allocated to this partition
* Return H_P5 if (start, end) doesn't form a valid range. Start and end
  should be a valid Quadrant address and  end > start.
* Return H_NotSupported if the partition is not in running in radix
  translation mode.
* May invalidate more translation information than requested.
* If start = 0 and end = -1, set the range to cover all valid addresses.
  Else start and end should be aligned to 4kB (lower 11 bits clear).
* If NESTED is clear, then invalidate process scoped lookaside information.
  Else pid specifies a nested LPID, and the invalidation is performed
  on nested guest partition table and nested guest partition scope real
  addresses.
* If pid = 0 and NESTED is clear, then valid addresses are quadrant 3 and
  quadrant 0 spaces, Else valid addresses are quadrant 0.
* Pages which are fully covered by the range are to be invalidated.
  Those which are partially covered are considered outside invalidation
  range, which allows a caller to optimally invalidate ranges that may
  contain mixed page sizes.
* Return H_SUCCESS on success.

Bharata B Rao (4):
  powerpc/mm: Make GTSE an MMU FTR
  powerpc/prom_init: Ask for Radix GTSE only if supported.
  powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
    enabled
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

Nicholas Piggin (1):
  powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
    !GTSE

 arch/powerpc/include/asm/firmware.h       |  4 +-
 arch/powerpc/include/asm/hvcall.h         | 27 ++++++-
 arch/powerpc/include/asm/mmu.h            |  4 +
 arch/powerpc/include/asm/plpar_wrappers.h | 52 +++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  1 +
 arch/powerpc/kernel/prom_init.c           | 13 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c    | 27 +++++--
 arch/powerpc/kvm/book3s_hv_nested.c       | 13 +++-
 arch/powerpc/mm/book3s64/radix_tlb.c      | 95 +++++++++++++++++++++--
 arch/powerpc/mm/init_64.c                 |  5 +-
 arch/powerpc/platforms/pseries/firmware.c |  1 +
 arch/powerpc/platforms/pseries/lpar.c     |  8 +-
 12 files changed, 224 insertions(+), 26 deletions(-)

-- 
2.21.3

