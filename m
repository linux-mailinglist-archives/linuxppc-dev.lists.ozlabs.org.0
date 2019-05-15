Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B461EB67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 11:47:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453qV22ZmSzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 19:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453qRj4s4hzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 19:45:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4F9gkRI069870
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 05:45:32 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sgg7fgkxe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 05:45:32 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 15 May 2019 10:45:32 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 May 2019 10:45:29 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4F9jSPD60293204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 09:45:28 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB6436E04E;
 Wed, 15 May 2019 09:45:28 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CED9A6E04C;
 Wed, 15 May 2019 09:45:26 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.19.15])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 May 2019 09:45:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm: Drop VM_BUG_ON in get_region_id
Date: Wed, 15 May 2019 15:15:23 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051509-0016-0000-0000-000009B2A67D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011100; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203605; UDB=6.00631788; IPR=6.00984532; 
 MB=3.00026901; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-15 09:45:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051509-0017-0000-0000-00004339CDF5
Message-Id: <20190515094523.8095-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=971 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905150063
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can call get_region_id without validating the ea value. That means
with a wrong ea value we hit the BUG as below.

 kernel BUG at arch/powerpc/include/asm/book3s/64/hash.h:129!
 Oops: Exception in kernel mode, sig: 5 [#1]
 LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
 CPU: 0 PID: 3937 Comm: access_tests Not tainted 5.1.0
 ....
 NIP [c00000000007ba20] do_slb_fault+0x70/0x320
 LR [c00000000000896c] data_access_slb_common+0x15c/0x1a0

Fix this by removing the VM_BUG_ON. All callers make sure the returned region id
is valid and error out otherwise.

Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 1d1183048cfd..5486087e64ea 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -122,11 +122,9 @@ static inline int get_region_id(unsigned long ea)
 	if (ea < H_KERN_VIRT_START)
 		return LINEAR_MAP_REGION_ID;
 
-	VM_BUG_ON(id != 0xc);
 	BUILD_BUG_ON(NON_LINEAR_REGION_ID(H_VMALLOC_START) != 2);
 
 	region_id = NON_LINEAR_REGION_ID(ea);
-	VM_BUG_ON(region_id > VMEMMAP_REGION_ID);
 	return region_id;
 }
 
-- 
2.21.0

