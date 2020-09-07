Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA530260431
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 20:06:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blbnw0pHpzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 04:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DKUC1cxI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Blbl36tV4zDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 04:04:15 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 087I2Kaj149186; Mon, 7 Sep 2020 14:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=llOokXYaeFuIqVieDq95v0tbRJZyTidIz682PTCYDAE=;
 b=DKUC1cxIdAyXGdb1LJMQxZCmyRckMOY3yH+BL2PIngvCYp9BUjlEt9kNIZfUGGbwFQPD
 bantvKYv38QTxd4IL4TDUhdMYgKl7HtCjI4wLqN0xpm18+BVow6mrg+vGE8uN95Pqb7K
 r3A/hRvxcHV07fQVv4bHCljFgqnzeJAwpg4w4cxTYbt9ypJOOXXa/60NC6bwYZ2xTJyI
 /wWSwGk1krs3AmfcV9p3i0tMaQ8847pcow1g3GsKVixL9i1Bvuu/CzewQKiyoiqtOg7x
 wMTvQsX3CLxuhJDnZskAgiskS7ZyMC1EO8GXmdBTdbeZjjPLW3zmvsr58bQCVaBm2qrv pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dsgfrbxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 14:03:16 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 087I2StQ149524;
 Mon, 7 Sep 2020 14:03:15 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dsgfrbwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 14:03:15 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 087I39Cf010781;
 Mon, 7 Sep 2020 18:03:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 33c2a89kvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 18:03:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 087I3A7O64356840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Sep 2020 18:03:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDA974203F;
 Mon,  7 Sep 2020 18:03:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B683442045;
 Mon,  7 Sep 2020 18:03:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Sep 2020 18:03:09 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Subject: [RFC PATCH v2 3/3] mm: make generic pXd_addr_end() macros inline
 functions
Date: Mon,  7 Sep 2020 20:00:58 +0200
Message-Id: <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-07_11:2020-09-07,
 2020-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=950 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009070168
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexander Gordeev <agordeev@linux.ibm.com>

Since pXd_addr_end() macros take pXd page-table entry as a
parameter it makes sense to check the entry type on compile.
Even though most archs do not make use of page-table entries
in pXd_addr_end() calls, checking the type in traversal code
paths could help to avoid subtle bugs.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 include/linux/pgtable.h | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 67ebc22cf83d..d9e7d16c2263 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -656,31 +656,35 @@ static inline int arch_unmap_one(struct mm_struct *mm,
  */
 
 #ifndef pgd_addr_end
-#define pgd_addr_end(pgd, addr, end)					\
-({	unsigned long __boundary = ((addr) + PGDIR_SIZE) & PGDIR_MASK;	\
-	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
-})
+#define pgd_addr_end pgd_addr_end
+static inline unsigned long pgd_addr_end(pgd_t pgd, unsigned long addr, unsigned long end)
+{	unsigned long __boundary = (addr + PGDIR_SIZE) & PGDIR_MASK;
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
 #endif
 
 #ifndef p4d_addr_end
-#define p4d_addr_end(p4d, addr, end)					\
-({	unsigned long __boundary = ((addr) + P4D_SIZE) & P4D_MASK;	\
-	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
-})
+#define p4d_addr_end p4d_addr_end
+static inline unsigned long p4d_addr_end(p4d_t p4d, unsigned long addr, unsigned long end)
+{	unsigned long __boundary = (addr + P4D_SIZE) & P4D_MASK;
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
 #endif
 
 #ifndef pud_addr_end
-#define pud_addr_end(pud, addr, end)					\
-({	unsigned long __boundary = ((addr) + PUD_SIZE) & PUD_MASK;	\
-	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
-})
+#define pud_addr_end pud_addr_end
+static inline unsigned long pud_addr_end(pud_t pud, unsigned long addr, unsigned long end)
+{	unsigned long __boundary = (addr + PUD_SIZE) & PUD_MASK;
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
 #endif
 
 #ifndef pmd_addr_end
-#define pmd_addr_end(pmd, addr, end)					\
-({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
-	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
-})
+#define pmd_addr_end pmd_addr_end
+static inline unsigned long pmd_addr_end(pmd_t pmd, unsigned long addr, unsigned long end)
+{	unsigned long __boundary = (addr + PMD_SIZE) & PMD_MASK;
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
 #endif
 
 /*
-- 
2.17.1

