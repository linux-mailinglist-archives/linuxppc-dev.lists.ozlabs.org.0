Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E029265A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 13:29:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFF0X3Ck4zDqYn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 22:29:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hTrW30JZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFDxH0yrKzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 22:26:58 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JB3Jpe157546; Mon, 19 Oct 2020 07:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=bKokzyc5p4bqF8PhHn/sGau/OMjZRneFVC+CDaqBTBE=;
 b=hTrW30JZN5v9iFtcBtBy8ezB9kzMbaOjkcByxnwztJzc/dnz6vyG4wF50DbR7X+xgMk3
 M+71YQFoOsAww1K9zz/Z3kaaS8PU2N/d9OmtIoDAC7rlkfyyn4BHVyG/ltLNOis/r2we
 1+MF1BuN5rM6YFY0vQhRTKNltKW7T2vNO/ZQYpKPiA3l1EohceepWPZeCGjnYSAS2l/2
 aPR3XOKDSO33Bag8Iv5k1XNvIK+KMPIAx2nG82c968c4qhDvsErzHPKkU8EszgUrqmZQ
 qodJ46sGuRXf7VygdeVoLU3sft4UeV3wBrXPdC3NBC+ydaBw1AcZXzi+H/QEZpghbO4N zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3498ua9vnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 07:26:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09JBMYRK023837;
 Mon, 19 Oct 2020 07:26:51 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3498ua9vmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 07:26:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JBLguX014897;
 Mon, 19 Oct 2020 11:26:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 347qvha1ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 11:26:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JBQkUY24773004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 11:26:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A14E7AE04D;
 Mon, 19 Oct 2020 11:26:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E26BAE056;
 Mon, 19 Oct 2020 11:26:45 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.73.75])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 11:26:45 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/2] Use H_RPT_INVALIDATE for nested guest
Date: Mon, 19 Oct 2020 16:56:40 +0530
Message-Id: <20201019112642.53016-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_02:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010190079
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

This patchset adds support for the new hcall H_RPT_INVALIDATE
(currently handles nested case only) and replaces the nested tlb flush
calls with this new hcall if the support for the same exists.

Changes in v1:
-------------
- Removed the bits that added the FW_FEATURE_RPT_INVALIDATE feature
  as they are already upstream.

v0: https://lore.kernel.org/linuxppc-dev/20200703104420.21349-1-bharata@linux.ibm.com/T/#m1800c5f5b3d4f6a154ae58fc1c617c06f286358f

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
  KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE (nested case
    only)
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

 Documentation/virt/kvm/api.rst                |  17 +++
 .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  26 ++++-
 arch/powerpc/kvm/book3s_hv.c                  |  32 ++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 107 +++++++++++++++++-
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
 include/uapi/linux/kvm.h                      |   1 +
 9 files changed, 200 insertions(+), 11 deletions(-)

-- 
2.26.2

