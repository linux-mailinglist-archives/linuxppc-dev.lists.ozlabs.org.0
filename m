Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B0374EA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLTY3vGZz3cJw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UlzzLMBA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UlzzLMBA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNN4kPjz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:15 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464XSVs031004; Thu, 6 May 2021 00:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Tg89mH3DPaWzZE15dM0eB1i+AV3aduvX3BmQ25kwPs4=;
 b=UlzzLMBAn7zF4h6A0UH3bpsTF9JEnfVZpdg/pgO0n+Dr+f/hPEBgHZo1pLmSJ1mEZJiW
 cDI6MhodmP9DCkYVQlOg5D96mF/Jtydyc38WZBru4Vf7k69pb/2Xy2tLdvr5oG/uvoXa
 HKH0Gp28MIkeftS4eTIJToIp8L1Olfzv0yeP2ItgBVJIJl5SNwVfKCN8HZQSfPbCiY3X
 TdnVAteqBE9HY4uzWT+zlEKyrmibh2EW0+7LmJFLaFHQO8YLrB6/DFrYq5Cdd6p/U4n8
 ISKSBYiSmPTEEEvB9lmfpU3I0fRqLuu8usnL1RnP70lvrgvoEPZR+TltdnRXpTLnsbdU yQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38c7m0a78p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:35:10 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464Xpip029100;
 Thu, 6 May 2021 04:35:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 38bee0ueee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:35:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Z7HK34603404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:35:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2AA2BE051;
 Thu,  6 May 2021 04:35:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEE3ABE04F;
 Thu,  6 May 2021 04:35:06 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:35:06 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id BC2EFBC1E55;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 07/11] powerpc/64s: Make slb_allocate_user()
 non-static
Date: Wed,  5 May 2021 23:34:48 -0500
Message-Id: <20210506043452.9674-8-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0EnHgVqbYANteOz1ZRPn6hr4P80w3ejc
X-Proofpoint-GUID: 0EnHgVqbYANteOz1ZRPn6hr4P80w3ejc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With Book3s64 Hash translation, manually inserting a PTE requires
updating the Linux PTE, inserting a SLB entry, and inserting the hashed
page. The first is handled via the usual kernel abstractions, the second
requires slb_allocate_user() which is currently 'static', and the third
is available via hash_page_mm() already.

Make slb_allocate_user() non-static and add a prototype so the next
patch can use it during code-patching.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 1 +
 arch/powerpc/mm/book3s64/slb.c                | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/64/mmu-hash.h
index 3004f3323144d..189854eebba77 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -525,6 +525,7 @@ void slb_dump_contents(struct slb_entry *slb_ptr);
 extern void slb_vmalloc_update(void);
 extern void slb_set_size(u16 size);
 void preload_new_slb_context(unsigned long start, unsigned long sp);
+long slb_allocate_user(struct mm_struct *mm, unsigned long ea);
 #endif /* __ASSEMBLY__ */
=20
 /*
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/sl=
b.c
index da0836cb855af..532eb51bc5211 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -29,8 +29,6 @@
 #include "internal.h"
=20
=20
-static long slb_allocate_user(struct mm_struct *mm, unsigned long ea);
-
 bool stress_slb_enabled __initdata;
=20
 static int __init parse_stress_slb(char *p)
@@ -791,7 +789,7 @@ static long slb_allocate_kernel(unsigned long ea, uns=
igned long id)
 	return slb_insert_entry(ea, context, flags, ssize, true);
 }
=20
-static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
+long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 {
 	unsigned long context;
 	unsigned long flags;
--=20
2.26.1

