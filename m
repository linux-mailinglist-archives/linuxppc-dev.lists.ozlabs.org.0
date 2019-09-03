Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E5A60A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 07:35:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MwdJ4h3bzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MwQ901tbzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 15:25:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x835Mt7p041010
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Sep 2019 01:25:18 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uqkqb20rj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 01:25:18 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Sep 2019 06:25:16 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 06:25:12 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x835PB6X3670192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 05:25:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B66E11C04A;
 Tue,  3 Sep 2019 05:25:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1688511C04C;
 Tue,  3 Sep 2019 05:25:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 05:25:11 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D1DCAA00EC;
 Tue,  3 Sep 2019 15:25:09 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 4/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
Date: Tue,  3 Sep 2019 15:23:58 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903052407.16638-1-alastair@au1.ibm.com>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090305-0020-0000-0000-00000366F243
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090305-0021-0000-0000-000021BC5945
Message-Id: <20190903052407.16638-5-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030060
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

When presented with large amounts of memory being hotplugged
(in my test case, ~890GB), the call to flush_dcache_range takes
a while (~50 seconds), triggering RCU stalls.

This patch breaks up the call into 1GB chunks, calling
cond_resched() inbetween to allow the scheduler to run.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/mm/mem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index cd540123874d..854aaea2c6ae 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -104,11 +104,14 @@ int __weak remove_section_mapping(unsigned long start, unsigned long end)
 	return -ENODEV;
 }
 
+#define FLUSH_CHUNK_SIZE SZ_1G
+
 int __ref arch_add_memory(int nid, u64 start, u64 size,
 			struct mhp_restrictions *restrictions)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
+	u64 i;
 	int rc;
 
 	resize_hpt_for_hotplug(memblock_phys_mem_size());
@@ -120,7 +123,12 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 			start, start + size, rc);
 		return -EFAULT;
 	}
-	flush_dcache_range(start, start + size);
+
+	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
+		flush_dcache_range(start + i,
+				   min(start + size, start + i + FLUSH_CHUNK_SIZE));
+		cond_resched();
+	}
 
 	return __add_pages(nid, start_pfn, nr_pages, restrictions);
 }
@@ -131,13 +139,19 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
+	u64 i;
 	int ret;
 
 	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
 
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
-	flush_dcache_range(start, start + size);
+	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
+		flush_dcache_range(start + i,
+				   min(start + size, start + i + FLUSH_CHUNK_SIZE));
+		cond_resched();
+	}
+
 	ret = remove_section_mapping(start, start + size);
 	WARN_ON_ONCE(ret);
 
-- 
2.21.0

