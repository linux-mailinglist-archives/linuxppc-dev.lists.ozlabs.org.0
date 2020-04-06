Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8D19EF9A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:53:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wc8h4rgzzDqg5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:53:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wc436p4RzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:49:38 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0363XAvn127277
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 5 Apr 2020 23:49:35 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306pcy56tx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 23:49:35 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 6 Apr 2020 04:49:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Apr 2020 04:49:09 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0363nTjk44761488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 03:49:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7122D11C058;
 Mon,  6 Apr 2020 03:49:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F32011C04C;
 Mon,  6 Apr 2020 03:49:28 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.79.179.162])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 03:49:28 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 0/5] powerpc/mm/radix: Memory unplug fixes
Date: Mon,  6 Apr 2020 09:19:20 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040603-0016-0000-0000-000002FF197B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040603-0017-0000-0000-00003362EE1D
Message-Id: <20200406034925.22586-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-05_11:2020-04-03,
 2020-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=674 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004060027
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Memory unplug has a few bugs which I had attempted to fix ealier
at https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-July/194087.html

Now with Leonardo's patch for PAPR changes that add a separate flag bit
to LMB flags for explicitly identifying hot-removable memory
(https://lore.kernel.org/linuxppc-dev/f55a7b65a43cc9dc7b22385cf9960f8b11d5ce2e.camel@linux.ibm.com/T/#t),
a few other issues around memory unplug on radix can be fixed. This
series is a combination of those fixes.

This series works on top of above mentioned Leonardo's patch.

Bharata B Rao (5):
  powerpc/pseries/hotplug-memory: Set DRCONF_MEM_HOTREMOVABLE for
    hot-plugged mem
  powerpc/mm/radix: Create separate mappings for hot-plugged memory
  powerpc/mm/radix: Fix PTE/PMD fragment count for early page table
    mappings
  powerpc/mm/radix: Free PUD table when freeing pagetable
  powerpc/mm/radix: Remove split_kernel_mapping()

 arch/powerpc/include/asm/book3s/64/pgalloc.h  |  11 +-
 arch/powerpc/include/asm/book3s/64/radix.h    |   1 +
 arch/powerpc/include/asm/sparsemem.h          |   1 +
 arch/powerpc/mm/book3s64/pgtable.c            |  31 ++-
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 186 +++++++++++-------
 arch/powerpc/mm/mem.c                         |   5 +
 arch/powerpc/mm/pgtable-frag.c                |   9 +-
 .../platforms/pseries/hotplug-memory.c        |   6 +-
 8 files changed, 167 insertions(+), 83 deletions(-)

-- 
2.21.0

