Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E84EF213396
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 07:38:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ykJj5nFnzDqhS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 15:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ykGd49cBzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 15:36:25 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0635X0Se053475; Fri, 3 Jul 2020 01:36:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320s8cptx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 01:36:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0635XEpE054617;
 Fri, 3 Jul 2020 01:36:19 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320s8cptwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 01:36:19 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0635KmT1020109;
 Fri, 3 Jul 2020 05:36:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgu81y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 05:36:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0635aEeo11927998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 05:36:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FAF4A404D;
 Fri,  3 Jul 2020 05:36:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25BBFA4055;
 Fri,  3 Jul 2020 05:36:13 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.77.194.246])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 05:36:12 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
Date: Fri,  3 Jul 2020 11:06:05 +0530
Message-Id: <20200703053608.12884-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_01:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=918 cotscore=-2147483648 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007030036
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
H_RPT_INVALIDATE. 

To easily check the availability of GTSE, it is made an MMU feature.
The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
handle GTSE as an optionally available feature and to not assume GTSE
when radix support is available.

The actual hcall implementation for KVM isn't included in this
patchset and will be posted separately.

Changes in v3
=============
- Fixed a bug in the hcall wrapper code where we were missing setting
  H_RPTI_TYPE_NESTED while retrying the failed flush request with
  a full flush for the nested case.
- s/psize_to_h_rpti/psize_to_rpti_pgsize

v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@linux.ibm.com/T/#t

Bharata B Rao (2):
  powerpc/mm: Enable radix GTSE only if supported.
  powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
    enabled

Nicholas Piggin (1):
  powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
    !GTSE

 .../include/asm/book3s/64/tlbflush-radix.h    | 15 ++++
 arch/powerpc/include/asm/hvcall.h             | 34 +++++++-
 arch/powerpc/include/asm/mmu.h                |  4 +
 arch/powerpc/include/asm/plpar_wrappers.h     | 52 ++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  1 +
 arch/powerpc/kernel/prom_init.c               | 13 +--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 82 +++++++++++++++++--
 arch/powerpc/mm/init_64.c                     |  5 +-
 arch/powerpc/platforms/pseries/lpar.c         |  8 +-
 9 files changed, 197 insertions(+), 17 deletions(-)

-- 
2.21.3

