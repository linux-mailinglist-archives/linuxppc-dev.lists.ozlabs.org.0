Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE0678C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 08:12:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lzws0G10zDqfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 16:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lzgQ4NNSzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 16:01:06 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D5uOAI087324; Sat, 13 Jul 2019 02:00:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq3k2rp46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 02:00:59 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6D5uuIM088168;
 Sat, 13 Jul 2019 02:00:58 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq3k2rp3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 02:00:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6D608Da001000;
 Sat, 13 Jul 2019 06:00:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2tq6x68t13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 06:00:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D60uY761342074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 06:00:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0AEDC605A;
 Sat, 13 Jul 2019 06:00:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5AB7C6061;
 Sat, 13 Jul 2019 06:00:52 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 06:00:52 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/13] powerpc/pseries: Add and use LPPACA_SIZE constant
Date: Sat, 13 Jul 2019 03:00:15 -0300
Message-Id: <20190713060023.8479-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713060023.8479-1-bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130070
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
Cc: Alexey Kardashevskiy <aik@linux.ibm.com>,
 Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Helps document what the hard-coded number means.

Also take the opportunity to fix an #endif comment.

Suggested-by: Alexey Kardashevskiy <aik@linux.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/kernel/paca.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 9cc91d03ab62..854105db5cff 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -56,6 +56,8 @@ static void *__init alloc_paca_data(unsigned long size, unsigned long align,
 
 #ifdef CONFIG_PPC_PSERIES
 
+#define LPPACA_SIZE 0x400
+
 /*
  * See asm/lppaca.h for more detail.
  *
@@ -69,7 +71,7 @@ static inline void init_lppaca(struct lppaca *lppaca)
 
 	*lppaca = (struct lppaca) {
 		.desc = cpu_to_be32(0xd397d781),	/* "LpPa" */
-		.size = cpu_to_be16(0x400),
+		.size = cpu_to_be16(LPPACA_SIZE),
 		.fpregs_in_use = 1,
 		.slb_count = cpu_to_be16(64),
 		.vmxregs_in_use = 0,
@@ -79,19 +81,18 @@ static inline void init_lppaca(struct lppaca *lppaca)
 static struct lppaca * __init new_lppaca(int cpu, unsigned long limit)
 {
 	struct lppaca *lp;
-	size_t size = 0x400;
 
-	BUILD_BUG_ON(size < sizeof(struct lppaca));
+	BUILD_BUG_ON(sizeof(struct lppaca) > LPPACA_SIZE);
 
 	if (early_cpu_has_feature(CPU_FTR_HVMODE))
 		return NULL;
 
-	lp = alloc_paca_data(size, 0x400, limit, cpu);
+	lp = alloc_paca_data(LPPACA_SIZE, 0x400, limit, cpu);
 	init_lppaca(lp);
 
 	return lp;
 }
-#endif /* CONFIG_PPC_BOOK3S */
+#endif /* CONFIG_PPC_PSERIES */
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
