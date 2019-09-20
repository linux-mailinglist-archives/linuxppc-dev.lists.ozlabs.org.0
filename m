Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62BB982A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 21:57:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZkyV4qBpzF3pj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 05:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zkqx4bwFzF14V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 05:51:41 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KJnoru141617; Fri, 20 Sep 2019 15:51:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v55628774-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:51:18 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KJp1mq144772;
 Fri, 20 Sep 2019 15:51:17 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v5562876b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:51:17 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KJoHol002669;
 Fri, 20 Sep 2019 19:51:16 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2v3vburpp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 19:51:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KJpErb56557882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 19:51:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D9347805C;
 Fri, 20 Sep 2019 19:51:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EC9478063;
 Fri, 20 Sep 2019 19:51:09 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.184])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 19:51:09 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] Introduces new count-based method for monitoring
 lockless pagetable wakls
Date: Fri, 20 Sep 2019 16:50:36 -0300
Message-Id: <20190920195047.7703-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=815 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200161
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
Cc: Keith Busch <keith.busch@intel.com>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

*** BLURB HERE ***

Leonardo Bras (11):
  powerpc/mm: Adds counting method to monitor lockless pgtable walks
  asm-generic/pgtable: Adds dummy functions to monitor lockless pgtable
    walks
  mm/gup: Applies counting method to monitor gup_pgd_range
  powerpc/mce_power: Applies counting method to monitor lockless pgtbl
    walks
  powerpc/perf: Applies counting method to monitor lockless pgtbl walks
  powerpc/mm/book3s64/hash: Applies counting method to monitor lockless
    pgtbl walks
  powerpc/kvm/e500: Applies counting method to monitor lockless pgtbl
    walks
  powerpc/kvm/book3s_hv: Applies counting method to monitor lockless
    pgtbl walks
  powerpc/kvm/book3s_64: Applies counting method to monitor lockless
    pgtbl walks
  powerpc/book3s_64: Enables counting method to monitor lockless pgtbl
    walk
  powerpc/mm/book3s64/pgtable: Uses counting method to skip serializing

 arch/powerpc/include/asm/book3s/64/mmu.h     |  3 +++
 arch/powerpc/include/asm/book3s/64/pgtable.h |  5 +++++
 arch/powerpc/kernel/mce_power.c              | 13 ++++++++++---
 arch/powerpc/kvm/book3s_64_mmu_hv.c          |  2 ++
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 20 ++++++++++++++++++--
 arch/powerpc/kvm/book3s_64_vio_hv.c          |  4 ++++
 arch/powerpc/kvm/book3s_hv_nested.c          |  8 ++++++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  9 ++++++++-
 arch/powerpc/kvm/e500_mmu_host.c             |  4 ++++
 arch/powerpc/mm/book3s64/hash_tlb.c          |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c        |  7 +++++++
 arch/powerpc/mm/book3s64/mmu_context.c       |  1 +
 arch/powerpc/mm/book3s64/pgtable.c           | 20 +++++++++++++++++++-
 arch/powerpc/perf/callchain.c                |  5 ++++-
 include/asm-generic/pgtable.h                |  9 +++++++++
 mm/gup.c                                     |  4 ++++
 16 files changed, 108 insertions(+), 8 deletions(-)

-- 
2.20.1

