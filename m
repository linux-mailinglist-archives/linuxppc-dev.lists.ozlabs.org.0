Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74935BD466
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 23:40:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dF3R4pNczDqWF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 07:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dDkc1h2KzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 07:25:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8OLOH4N040050; Tue, 24 Sep 2019 17:25:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7u1f00ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 17:25:13 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8OLPCLh041938;
 Tue, 24 Sep 2019 17:25:12 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7u1f00ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 17:25:12 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8OLJrLX003220;
 Tue, 24 Sep 2019 21:25:11 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2v5bg7fya3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 21:25:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8OLP9OB59244886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 21:25:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85516C605F;
 Tue, 24 Sep 2019 21:25:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED123C605B;
 Tue, 24 Sep 2019 21:25:04 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 21:25:04 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v3 05/11] powerpc/perf: Applies counting method to monitor
 lockless pgtbl walks
Date: Tue, 24 Sep 2019 18:24:22 -0300
Message-Id: <20190924212427.7734-6-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924212427.7734-1-leonardo@linux.ibm.com>
References: <20190924212427.7734-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240173
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
Cc: Keith Busch <keith.busch@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>, John Hubbard <jhubbard@nvidia.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Applies the counting-based method for monitoring lockless pgtable walks on
read_user_stack_slow.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/perf/callchain.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index c84bbd4298a0..9d76194a2a8f 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -113,16 +113,18 @@ static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
 	int ret = -EFAULT;
 	pgd_t *pgdir;
 	pte_t *ptep, pte;
+	struct mm_struct *mm = current->mm;
 	unsigned shift;
 	unsigned long addr = (unsigned long) ptr;
 	unsigned long offset;
 	unsigned long pfn, flags;
 	void *kaddr;
 
-	pgdir = current->mm->pgd;
+	pgdir = mm->pgd;
 	if (!pgdir)
 		return -EFAULT;
 
+	start_lockless_pgtbl_walk(mm);
 	local_irq_save(flags);
 	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
 	if (!ptep)
@@ -146,6 +148,7 @@ static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
 	ret = 0;
 err_out:
 	local_irq_restore(flags);
+	end_lockless_pgtbl_walk(mm);
 	return ret;
 }
 
-- 
2.20.1

