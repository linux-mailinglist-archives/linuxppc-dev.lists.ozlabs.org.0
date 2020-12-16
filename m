Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A412DBD34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 10:00:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwpxB32zCzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 20:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ocBFD4LQ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwprg5NM5zDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 19:56:19 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG8Ux4b184793; Wed, 16 Dec 2020 03:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=diY0OnzX0DLJXGQaVUrqXiIPoD58kEfGJHBpjnGGW9A=;
 b=ocBFD4LQm6JG8GMt4uvajlZU16/dbyRz88rm2bbGw4raPQEp4QZUgQ9Y3UY6FgCFdHkX
 f6geVn7hTl1F75CrNNaH7HrERJpO9SYg5T1Z0mdWF+qTWapald38zIJAsIFyGlkoL+Jj
 7qQ1rDTADVIWoRhYiBX70UrpOzdeeGPzrabXtf1VXK168fzsM8ZlP6yXDiNf3wAJLmWn
 z+A/QLbmNLkPP6drqjEChfgW4F2Ey0EYNsdFP7WqcvheHXZ+H2eCwFU0PUOGIfnPW1km
 9CD7Fr1Q1BfNHFSTtq33j4gQHGVgv5Co3cwMVQRF7gHGi+Vc1kP59zLb3rUv+obc3JgU LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98f8kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:56:11 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG8cgQx040846;
 Wed, 16 Dec 2020 03:56:11 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98f8jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:56:11 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8rAf2017409;
 Wed, 16 Dec 2020 08:56:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8e32y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 08:56:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG8spGB22413650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 08:54:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65A6042041;
 Wed, 16 Dec 2020 08:54:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC6114204B;
 Wed, 16 Dec 2020 08:54:49 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.116.220])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 08:54:49 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] Support for H_RPT_INVALIDATE in PowerPC KVM
Date: Wed, 16 Dec 2020 14:24:45 +0530
Message-Id: <20201216085447.1265433-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160051
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
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds support for the new hcall H_RPT_INVALIDATE
and replaces the nested tlb flush calls with this new hcall
if support for the same exists.

Changes in v2:
-------------
- Not enabling the hcall by default now, userspace can enable it when
  required.
- Added implementation for process-scoped invalidations in the hcall.

v1: https://lore.kernel.org/linuxppc-dev/20201019112642.53016-1-bharata@linux.ibm.com/T/#t

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
NESTED       0x0001  /* Invalidate nested guest partition-scope */
TLB          0x0002  /* Invalidate TLB */
PWC          0x0004  /* Invalidate Page Walk Cache */
PRT          0x0008  /* Invalidate Process Table Entries if NESTED is clear */
PAT          0x0008  /* Invalidate Partition Table Entries if NESTED is set */

A combination of the above can be specified.

Page size mask (pageSizes)
--------------------------
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

Bharata B Rao (2):
  KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

 Documentation/virt/kvm/api.rst                |  17 +++
 .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  27 +++-
 arch/powerpc/kvm/book3s_hv.c                  | 121 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 106 ++++++++++++++-
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
 include/uapi/linux/kvm.h                      |   1 +
 9 files changed, 289 insertions(+), 11 deletions(-)

-- 
2.26.2

