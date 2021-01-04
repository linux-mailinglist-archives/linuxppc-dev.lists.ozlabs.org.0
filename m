Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 082472E9777
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 15:42:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8dcn72mFzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 01:42:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dPq25JfzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:32:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104EVlJN033213; Mon, 4 Jan 2021 09:32:23 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35v3ph291y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:32:22 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EWBR5031777;
 Mon, 4 Jan 2021 14:32:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 35tgf890fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104EWIrL46334436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9F8D4C050;
 Mon,  4 Jan 2021 14:32:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFD0E4C04A;
 Mon,  4 Jan 2021 14:32:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  4 Jan 2021 14:32:17 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0786522016B;
 Mon,  4 Jan 2021 15:32:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/23] powerpc/mm: Move hpte_insert_repeating() prototype
Date: Mon,  4 Jan 2021 15:31:56 +0100
Message-Id: <20210104143206.695198-14-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=871 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It fixes this W=3D1 compile error :

../arch/powerpc/mm/book3s64/hash_utils.c:1867:6: error: no previous proto=
type for =E2=80=98hpte_insert_repeating=E2=80=99 [-Werror=3Dmissing-proto=
types]
 1867 | long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
      |      ^~~~~~~~~~~~~~~~~~~~~

Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 2 ++
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/64/mmu-hash.h
index cb95b16e9a7b..2bffc7a0fdb8 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -454,6 +454,8 @@ static inline unsigned long hpt_hash(unsigned long vp=
n,
 #define HPTE_NOHPTE_UPDATE	0x2
 #define HPTE_USE_KERNEL_KEY	0x4
=20
+long hpte_insert_repeating(unsigned long hash, unsigned long vpn, unsign=
ed long pa,
+			   unsigned long rlags, unsigned long vflags, int psize, int ssize);
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
 			  unsigned long flags, int ssize, int subpage_prot);
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/m=
m/book3s64/hash_hugetlbpage.c
index b5e9fff8c217..a688e1324ae5 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
@@ -16,10 +16,6 @@
 unsigned int hpage_shift;
 EXPORT_SYMBOL(hpage_shift);
=20
-extern long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
-				  unsigned long pa, unsigned long rlags,
-				  unsigned long vflags, int psize, int ssize);
-
 int __hash_page_huge(unsigned long ea, unsigned long access, unsigned lo=
ng vsid,
 		     pte_t *ptep, unsigned long trap, unsigned long flags,
 		     int ssize, unsigned int shift, unsigned int mmu_psize)
--=20
2.26.2

