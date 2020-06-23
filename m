Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC5204B46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:33:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rdLL6JXGzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:33:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rdH221LczDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:30:38 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05N73VFp085916; Tue, 23 Jun 2020 03:30:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31u67f2mr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:30:31 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05N741XU088589;
 Tue, 23 Jun 2020 03:30:30 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31u67f2mpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:30:30 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05N7MJOk026209;
 Tue, 23 Jun 2020 07:30:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 31sa37suns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 07:30:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05N7UPkd64553220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 07:30:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07CFCA4066;
 Tue, 23 Jun 2020 07:30:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B2F9A4054;
 Tue, 23 Jun 2020 07:30:21 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.54.229])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 07:30:21 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/3] powerpc/mm/radix: Memory unplug fixes
Date: Tue, 23 Jun 2020 13:00:14 +0530
Message-Id: <20200623073017.1951-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_04:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 cotscore=-2147483648 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230054
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

This is the next version of the fixes for memory unplug on radix.
The issues and the fix are described in the actual patches.

Changes in v1:
==============
- Rebased to latest kernel.
- Took care of p4d changes.
- Addressed Aneesh's review feedback:
 - Added comments.
 - Indentation fixed.
- Dropped the 1st patch (setting DRCONF_MEM_HOTREMOVABLE lmb flags) as
  it is debatable if this flag should be set in the device tree by OS
  and not by platform in case of hotplug. This can be looked at separately.
  (The fixes in this patchset remain valid without the dropped patch)
- Dropped the last patch that removed split_kernel_mapping() to ensure
  that spilitting code is available for any radix guest running on
  platforms that don't set DRCONF_MEM_HOTREMOVABLE.

v0: https://lore.kernel.org/linuxppc-dev/20200406034925.22586-1-bharata@linux.ibm.com/

Bharata B Rao (3):
  powerpc/mm/radix: Create separate mappings for hot-plugged memory
  powerpc/mm/radix: Fix PTE/PMD fragment count for early page table
    mappings
  powerpc/mm/radix: Free PUD table when freeing pagetable

 arch/powerpc/include/asm/book3s/64/pgalloc.h |  11 +-
 arch/powerpc/include/asm/book3s/64/radix.h   |   1 +
 arch/powerpc/include/asm/sparsemem.h         |   1 +
 arch/powerpc/mm/book3s64/pgtable.c           |  31 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 111 +++++++++++++++++--
 arch/powerpc/mm/mem.c                        |   5 +
 arch/powerpc/mm/pgtable-frag.c               |   9 +-
 7 files changed, 157 insertions(+), 12 deletions(-)

-- 
2.21.3

