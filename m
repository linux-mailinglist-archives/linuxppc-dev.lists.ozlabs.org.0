Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1491557A5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 14:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTKPY4NSTz3drh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 22:31:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=otjtix2p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=otjtix2p;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTKMZ6XSRz3c9D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 22:30:02 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBogOS003688;
	Thu, 23 Jun 2022 12:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=I0XDoqGAyD9wFQlqMc8lxz6HDUp5LOCjaeVn1njh074=;
 b=otjtix2pSjz9u7VmbEFDcM8gMhYNWciWNnmg21J9JA04jPwbH43QSwjpSKwhPPGdjMTC
 ipXE8k1FTHGKBzn37KqZ76onVX4DJdZQ49uZRA00ZYfghTHdkkOIrBrPGqJQjs/fP285
 4Qre1wT74JUKMsWTQhMpWMiP708WE5yla+40+zbVFEK4GBDysuMeoWfAaznJt/LU8Od8
 gLytjCV9Zo6J/+iALdyyNYcYn7iD63fRD2AVS864w7ApQZ/pEo9tUZuBJGNDXn9OsUax
 CMCKKzEpjUvh/3rwRbNlyRdwNxX5ZBrzCcegDBbm5t4XKb7edzwoTcJBmT2f2Lpw+VLa Pg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvqnj1327-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:29:45 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NCKcXa003896;
	Thu, 23 Jun 2022 12:29:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma01wdc.us.ibm.com with ESMTP id 3gv5cjwxtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:29:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NCThKB18415966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 12:29:43 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BADF628058;
	Thu, 23 Jun 2022 12:29:43 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2393F28059;
	Thu, 23 Jun 2022 12:29:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.18.68])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 12:29:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
Date: Thu, 23 Jun 2022 17:59:22 +0530
Message-Id: <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lqFXGDskXzs26GTPeZJKCdYL15mWLfZt
X-Proofpoint-ORIG-GUID: lqFXGDskXzs26GTPeZJKCdYL15mWLfZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=870
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230049
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of high_memory use VMALLOC_START to validate that the address is
not in the vmalloc range.

Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5f75c70eda8..256cad69e42e 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -134,7 +134,7 @@ static inline bool pfn_valid(unsigned long pfn)
 
 #define virt_addr_valid(vaddr)	({					\
 	unsigned long _addr = (unsigned long)vaddr;			\
-	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
+	_addr >= PAGE_OFFSET && _addr < (unsigned long)VMALLOC_START &&	\
 	pfn_valid(virt_to_pfn(_addr));					\
 })
 
-- 
2.36.1

