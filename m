Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 254DC7571CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:35:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K7xwPU6y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jjR0LB0z3cdx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K7xwPU6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jbq5kxVz30N2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:31 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2CLW0001558;
	Tue, 18 Jul 2023 02:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DhjHib9yNi+amjTZ6SyCSCSFT3YePg3pTl6ka+gmVO0=;
 b=K7xwPU6yaPl2Uysp/keRtu42tly164eB0TrRfkbs0U7LwOxVnlNxKWGJ6yXOrWIh4ePS
 60diAi5AUvAW0DdKHKJDvng5q0+VCpIgr8MN+kZxoSf0YsAQTUWgu3bO1CKj74ZpAtmJ
 DU4NqWEOiMzy9gX55E/DTPUxT3jaVWY8mix4ui9eReo0fR79N3OFeq0sNbEymsYlxaJf
 Q5EyxvKOPYhqXXF8kmc1vZcJpA3RyUPTlOXnhLbx3qUFwtDYQMEIjzT6J8gZ/MK2qwcD
 3kj5Ee7jv7OTHSUXANYdmBbkHN9sRbN163CiEXCYGbBf4+k2D1j7ozvrGdjHl9YfUJ4I 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwgy4s2r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:14 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2UEsd019609;
	Tue, 18 Jul 2023 02:30:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwgy4s2qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:14 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HMgHHK003340;
	Tue, 18 Jul 2023 02:30:13 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv65xbuh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:13 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2UCBU35521152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:13 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A483158063;
	Tue, 18 Jul 2023 02:30:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7357C58061;
	Tue, 18 Jul 2023 02:30:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:30:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 05/13] mm: Add pud_same similar to __HAVE_ARCH_P4D_SAME
Date: Tue, 18 Jul 2023 07:59:25 +0530
Message-ID: <20230718022934.90447-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RqJTgJ31xbyKtrC8K5RK6Pl6OTUDrFAA
X-Proofpoint-GUID: a-M8Bk_9JvMTPNFO5Jo7lFO4ZV4V0LpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This helps architectures to override pmd_same and pud_same independently.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 6fd9b2831338..ca67ecbd9a66 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -693,11 +693,14 @@ static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
 {
 	return pmd_val(pmd_a) == pmd_val(pmd_b);
 }
+#endif
 
+#ifndef pud_same
 static inline int pud_same(pud_t pud_a, pud_t pud_b)
 {
 	return pud_val(pud_a) == pud_val(pud_b);
 }
+#define pud_same pud_same
 #endif
 
 #ifndef __HAVE_ARCH_P4D_SAME
-- 
2.41.0

