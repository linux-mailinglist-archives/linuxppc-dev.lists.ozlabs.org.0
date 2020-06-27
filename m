Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4B20BF36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 09:05:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v4Wc0LhYzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:05:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49v4SG3Ld9zDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 17:02:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05R6WbaQ057530; Sat, 27 Jun 2020 03:01:59 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31waw9bjwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jun 2020 03:01:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05R6uDIH005724;
 Sat, 27 Jun 2020 07:01:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 31wwr7s9jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jun 2020 07:01:58 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05R71wfk48300508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Jun 2020 07:01:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1502728058;
 Sat, 27 Jun 2020 07:01:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA6092805A;
 Sat, 27 Jun 2020 07:01:56 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.210.117])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 27 Jun 2020 07:01:56 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/mm/books64/pkeys: Rename is_pkey_enabled()
Date: Sat, 27 Jun 2020 12:31:47 +0530
Message-Id: <20200627070147.297535-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627070147.297535-1-aneesh.kumar@linux.ibm.com>
References: <20200627070147.297535-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-27_02:2020-06-26,
 2020-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 cotscore=-2147483648
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=951 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006270042
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename is_pkey_enabled() to is_pkey_masked() to better indicates that
this check is to make sure the key is available for userspace usage. For it to
be made available both the bits in UAMOR should be set to 1 (0b11).

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index ca5fcb4bff32..70d760ade922 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -206,18 +206,16 @@ static inline void write_uamor(u64 value)
 	mtspr(SPRN_UAMOR, value);
 }
 
-static bool is_pkey_enabled(int pkey)
+static bool is_pkey_masked(int pkey)
 {
 	u64 uamor = read_uamor();
 	u64 pkey_bits = 0x3ul << pkeyshift(pkey);
 	u64 uamor_pkey_bits = (uamor & pkey_bits);
 
 	/*
-	 * Both the bits in UAMOR corresponding to the key should be set or
-	 * reset.
+	 * Both the bits in UAMOR corresponding to the key should be set
 	 */
-	WARN_ON(uamor_pkey_bits && (uamor_pkey_bits != pkey_bits));
-	return !!(uamor_pkey_bits);
+	return (uamor_pkey_bits != pkey_bits);
 }
 
 static inline void init_amr(int pkey, u8 init_bits)
@@ -246,7 +244,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	u64 new_amr_bits = 0x0ul;
 	u64 new_iamr_bits = 0x0ul;
 
-	if (!is_pkey_enabled(pkey))
+	if (is_pkey_masked(pkey))
 		return -EINVAL;
 
 	if (init_val & PKEY_DISABLE_EXECUTE) {
-- 
2.26.2

