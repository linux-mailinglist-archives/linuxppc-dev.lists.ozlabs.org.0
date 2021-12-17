Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB884788F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFldT4VGvz3f1R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYb0xvSz3cTl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0kHVsHQXrsQ9uiyJ4wJNxMAZCw65mJT9whsLBogGccdC5l6rTS+h8IPc+gHDjKLxJ9PRf2uXJONJXn6UYCTPa7CVg0uw8nredPjdI6O2g5pODY98XqSevkM+9vlS9Ixa67oxOjvueYtMOglVecmEzQGmpIIgLxONIX8LX1WtSHnp3TqGhilfT/xIo3t/FHyZVJsyNDyszPMGCbSYgWBM7wHXuxdGH18wWLPJQUIMVcOeihdH7O3/IiIUXDJyBE+cCLY+S+7OGz0L7GCgmw7YztH0p2zAEwJqXkqVvn395aUCLBlPkkWBy9rxHyWFW1urDEZfnwaL13wOO0tsG80Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kal8uZy0vwBrMzZSbVRzSwNCiz8HNSzE2KXYS2+awQQ=;
 b=Ykj69sNVZx9hGohlsQj47S4LUP1+FnD8ESAuwkUy6dIdfU/t2U0CQz8E4uIzlXfawQfR577BbhAkwhUcGQShtuzEjQAzm+qdpwITtqxQdfgLILjIXZu10yRsL5z+PlVZNRayGTplAbYc5BsewQ6Y7FdRGnnS+54lx7aeguW3JUT0jLZRwquUW2sYmFjMOB28G/tCBndvb/9TGdJ0bA1CjwfeBcqisvn30Qs07GrbQ1XbO3ArLOF+rx5gSn4Uihmm6NTHlxGKgq2juDGo5YIo3nUNIdm+x7V/iLwxtZfSwxz6jfz1iabI5EWyaJT2YW71j9/YtSVZoCnQgpqGqkhBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 07/14] powerpc/mm: Make slice specific to book3s/64
Thread-Topic: [PATCH v6 07/14] powerpc/mm: Make slice specific to book3s/64
Thread-Index: AQHX8zC688aLht4OC0+lqZbp9OnzKQ==
Date: Fri, 17 Dec 2021 10:27:43 +0000
Message-ID: <b585c25f5b1bb4817a446a96f239499ba16b93ce.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 965c4765-15d8-4e25-37aa-08d9c147dc8c
x-ms-traffictypediagnostic: MR2P264MB0146:EE_
x-microsoft-antispam-prvs: <MR2P264MB014668712435DC7DDDD5F7CBED789@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: znZTJlpSQ0Z/XFWA6+67i7nOpXRxp23ZtkfSvpW42tbA2ojDPjtvhYxPSDHrjK5i1Ji0csmqPugqsAkSbUJU8N93wZfovXqRBvzIYUfDFU/114xs+TtRB9s34ZCFL7rjrbEcPi44KEc82DV6yPZ1EYl8jZjRu43wDYF6BURHEucrGy3FQ7W2F50W4U2bgTqvua6a4p3TxPn8WbCw/feS1gOA3wcYWzv38iGqhMuUsSWOOr6lfA31Cb4IfWhHH80o0v1ZCfNvrrAO004KYt+lGi6752wtj6nmPAyYsgJ70NN9iwuGwe0NHh9L/mx4KCxOIgAAlJu9FhUG3PF+fRxaNbBpTno0vm4CHwgf+LBKiCfnaHEdxVuuF5R0hAJjAOZ63pZAu1sy2WpJUzxfnn+Wx2vHedUaI7ujMqZr3iSvH5SevTzq8F6fEGZtnx9Gr15QRVM225dC1P0WazMV6HlM+5mmGjP86eGRpNPu8Z64ijiO7d4amYblvNfQLJ/p4Nv7mTzhc1A1OMZYX4+tiDMp0mBQsILHIzSo9TsV5IriNjL0uLs01JYpEhYphMFAixdovAolEsJSkS1p7nnauZWIdyhAhSOvZ4IJcDaWRIeZSZdyUn8fiRng3qZiLLK/62/QYlLijGfzYTdN2p3IKDSYTpeSr+jnvdRij1zE4RSj8TeuPok2iEyadzAaKnlXdr140kT68j8v/BufRbVZuFAUqHJzHbnUjgQne7pA0wf+q1w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(91956017)(71200400001)(86362001)(83380400001)(66476007)(66556008)(66446008)(2906002)(64756008)(38070700005)(7416002)(44832011)(6506007)(76116006)(4326008)(36756003)(26005)(2616005)(5660300002)(122000001)(8936002)(38100700002)(508600001)(6486002)(54906003)(110136005)(66946007)(8676002)(316002)(6512007)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y6wikPlWJB4HEVM5rhK2Wiz73hymRJ4wCtzBFCDOUCyiLyFmbDZ0Wj3SxM?=
 =?iso-8859-1?Q?LIFXkFrka73BFPbeL5j2o44SEznHfnfO3RQHMDGdERjIda4qrIUGsMrr9D?=
 =?iso-8859-1?Q?cBRA6EIrJ4gS84ohQdaVoSYkJiKGs2Zzdh7gMSyD+PdzfbqEKX8fZAGAdY?=
 =?iso-8859-1?Q?R8pTUbxKUEc1FLy8zMuK9+N7GdkWKvNzekBuf7UU7rBIG3hhoGngXucqe8?=
 =?iso-8859-1?Q?34vbM3H4Glk6r3q7HDPpgGlHeCa4IVUNMTKFrm+zOIA0zWH9DRw0V+GQwp?=
 =?iso-8859-1?Q?9FjHP6xypMCSmueA2v70iOrokybSvvFtIzpWhjmmCZM2X3wI+VkgbCKbci?=
 =?iso-8859-1?Q?JJPEudtEcbFLqlsifRRS/d5yKCrki1JtcB4U8FL5WTMI6NcpxfMwXuWjA+?=
 =?iso-8859-1?Q?y+5ifTW+v2zTK0w2YstrGnBxa2gUyRiEHQMRrZHgWkYYFc0RJVBdW2sHth?=
 =?iso-8859-1?Q?iCnUxbNOLaBXLDmqVm0hznuGahPuLfSCiytSH646nvuCvqIG8HDK4O90XA?=
 =?iso-8859-1?Q?ohOV5hFi29hN1+sysJo+9iwREPjjzHOtN9eYo2Q0riVWR+PpZuCwf1ceoQ?=
 =?iso-8859-1?Q?y35owrDlX0SHewga5gckuRIZuSY5KzNbeBggSbYJ4EBFbkrpGux/IlONwd?=
 =?iso-8859-1?Q?TnK6e4BSgOJsJHzJWEFo7Ctelp6YPU49lfaaIhXXE+i73I0udcSS2xq0+9?=
 =?iso-8859-1?Q?th98tnod7HSUa10KP1xuuPKzuemAqj2dCkjBe6Wv03O+EGPwBXUTJ7BHBR?=
 =?iso-8859-1?Q?+7nZuaStBGLWcCKFpxDQ1pmHGPD/AZllvGJR/W6ApYKm+tqefAvoyeG0tF?=
 =?iso-8859-1?Q?LxsVUVdeXvoZ/vLp3IYF5PBq5EBmGVBDpF5Np9EpXpzKqxNoNO4Wtwejr/?=
 =?iso-8859-1?Q?dp12Sf6cVKrAMKyMr0DEiKEk/5dlsFIqW09hnSZtezVXpZxGnCdAmrKzyN?=
 =?iso-8859-1?Q?e10PWPzlM7a+w+VAPrqK627VL1DpA2Ur7UQgtSFtGqnoRvEh4ojHKMW438?=
 =?iso-8859-1?Q?Afh3Yr8sarD0GgrfD7VVfHRWwW1p+kBsgrNUDsqo5PVJhkaTHgmCaeMOZq?=
 =?iso-8859-1?Q?X/4darRyrQrOk5mZwFMGaeulZnbEUz/29iB8FG5T2z6E4kQ2OuCU/8PUIQ?=
 =?iso-8859-1?Q?5BHfz3vUj+brJZeFn+21RTyPACM+4lZdzQ003m+Z9zfRURWE3VRhFU8sGT?=
 =?iso-8859-1?Q?AiTVxryD3fs6dG9xC6y+8GpaSPR6oUeXdvOu7OtDYMDkK3j2fFRrVjIjpK?=
 =?iso-8859-1?Q?8Y8Cg5c5f++EFDuFwK7yEOEAiX4v34RDVxHDLdxDzrLpXpwL+cBnC11+jt?=
 =?iso-8859-1?Q?2g3PBHLIcS74/x2h33eI6CjXCMQchd0vOG72BHPGW1OVh7N8+pXk5xKVtd?=
 =?iso-8859-1?Q?X9DSs5vv+fp5ScIGqAHAlp2vQWyIZRXkmCadZEsaDZllmk0psa2lZn2oOC?=
 =?iso-8859-1?Q?raQ8ytCMvTRgRWLVEnuaK6UR8nPZPlEhFwIXsFuVfhGhz6jYjqo4Uwi96r?=
 =?iso-8859-1?Q?ylLFl48z8ufewqGM5ixS9Uw4cYmZ8QZuMii3gT9Lo8dgi7e/9ByXg/ZMlE?=
 =?iso-8859-1?Q?HCIfVwan+CVKJ1UCuaSJrGXhfSx9bfXTDILKrm2YxcUfks2XaCkUkNSmcm?=
 =?iso-8859-1?Q?OyPOoaRZP5posLzXmHOmlUOLoZOHyVd5iJn3ocO6dtUM0HnTw6zKluJbuv?=
 =?iso-8859-1?Q?dCM+qlvQCB/ypLJBghfoT042TrRIdaipdzZMLUWWroTQ6JMDAx4x986nPH?=
 =?iso-8859-1?Q?9eZp0pFQqM5lH/f4nLm+ciTok=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 965c4765-15d8-4e25-37aa-08d9c147dc8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:43.5870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Kz5mzuSmnrL+0M/ysaTDmDIuZptfwt4szyExX4q1fh7FlVQ6xDWrXcoqzrXpYXcbknaRShy1+6IAnz2XFh1uRfG2NaEwbQ5KnTBGROZZDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0146
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 555904d07eef ("powerpc/8xx: MM_SLICE is not needed
anymore") only book3s/64 selects CONFIG_PPC_MM_SLICES.

Move slice.c into mm/book3s64/

Move necessary stuff in asm/book3s/64/slice.h and
remove asm/slice.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 +
 arch/powerpc/include/asm/book3s/64/slice.h    | 18 ++++++++
 arch/powerpc/include/asm/page.h               |  1 -
 arch/powerpc/include/asm/slice.h              | 46 -------------------
 arch/powerpc/mm/Makefile                      |  1 -
 arch/powerpc/mm/book3s64/Makefile             |  1 +
 arch/powerpc/mm/{ =3D> book3s64}/slice.c        |  2 -
 arch/powerpc/mm/nohash/mmu_context.c          |  9 ----
 arch/powerpc/mm/nohash/tlb.c                  |  4 --
 9 files changed, 20 insertions(+), 63 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ =3D> book3s64}/slice.c (99%)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/i=
nclude/asm/book3s/64/mmu-hash.h
index 21f780942911..1c4eebbc69c9 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -18,6 +18,7 @@
  * complete pgtable.h but only a portion of it.
  */
 #include <asm/book3s/64/pgtable.h>
+#include <asm/book3s/64/slice.h>
 #include <asm/task_size_64.h>
 #include <asm/cpu_has_feature.h>
=20
diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/incl=
ude/asm/book3s/64/slice.h
index f0d3194ba41b..5b0f7105bc8b 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_SLICE_H
 #define _ASM_POWERPC_BOOK3S_64_SLICE_H
=20
+#ifndef __ASSEMBLY__
+
 #define SLICE_LOW_SHIFT		28
 #define SLICE_LOW_TOP		(0x100000000ul)
 #define SLICE_NUM_LOW		(SLICE_LOW_TOP >> SLICE_LOW_SHIFT)
@@ -13,4 +15,20 @@
=20
 #define SLB_ADDR_LIMIT_DEFAULT	DEFAULT_MAP_WINDOW_USER64
=20
+struct mm_struct;
+
+unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long le=
n,
+				      unsigned long flags, unsigned int psize,
+				      int topdown);
+
+unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr);
+
+void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
+			   unsigned long len, unsigned int psize);
+
+void slice_init_new_context_exec(struct mm_struct *mm);
+void slice_setup_new_exec(void);
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_POWERPC_BOOK3S_64_SLICE_H */
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/pag=
e.h
index 254687258f42..62e0c6f12869 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -329,6 +329,5 @@ static inline unsigned long kaslr_offset(void)
=20
 #include <asm-generic/memory_model.h>
 #endif /* __ASSEMBLY__ */
-#include <asm/slice.h>
=20
 #endif /* _ASM_POWERPC_PAGE_H */
diff --git a/arch/powerpc/include/asm/slice.h b/arch/powerpc/include/asm/sl=
ice.h
deleted file mode 100644
index 0bdd9c62eca0..000000000000
--- a/arch/powerpc/include/asm/slice.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_SLICE_H
-#define _ASM_POWERPC_SLICE_H
-
-#ifdef CONFIG_PPC_BOOK3S_64
-#include <asm/book3s/64/slice.h>
-#endif
-
-#ifndef __ASSEMBLY__
-
-struct mm_struct;
-
-#ifdef CONFIG_PPC_MM_SLICES
-
-#ifdef CONFIG_HUGETLB_PAGE
-#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
-#endif
-#define HAVE_ARCH_UNMAPPED_AREA
-#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-
-unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long le=
n,
-				      unsigned long flags, unsigned int psize,
-				      int topdown);
-
-unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr);
-
-void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
-			   unsigned long len, unsigned int psize);
-
-void slice_init_new_context_exec(struct mm_struct *mm);
-void slice_setup_new_exec(void);
-
-#else /* CONFIG_PPC_MM_SLICES */
-
-static inline void slice_init_new_context_exec(struct mm_struct *mm) {}
-
-static inline unsigned int get_slice_psize(struct mm_struct *mm, unsigned =
long addr)
-{
-	return 0;
-}
-
-#endif /* CONFIG_PPC_MM_SLICES */
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* _ASM_POWERPC_SLICE_H */
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index df8172da2301..d4c20484dad9 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -14,7 +14,6 @@ obj-$(CONFIG_PPC_MMU_NOHASH)	+=3D nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+=3D book3s32/
 obj-$(CONFIG_PPC_BOOK3S_64)	+=3D book3s64/
 obj-$(CONFIG_NUMA) +=3D numa.o
-obj-$(CONFIG_PPC_MM_SLICES)	+=3D slice.o
 obj-$(CONFIG_HUGETLB_PAGE)	+=3D hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) +=3D dma-noncoherent.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+=3D copro_fault.o
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/M=
akefile
index 2d50cac499c5..af2f3e75d458 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PPC_RADIX_MMU)	+=3D radix_hugetlbpage.o
 endif
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+=3D iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+=3D pkeys.o
+obj-$(CONFIG_PPC_MM_SLICES)	+=3D slice.o
=20
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o :=3D n
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/book3s64/slice.c
similarity index 99%
rename from arch/powerpc/mm/slice.c
rename to arch/powerpc/mm/book3s64/slice.c
index 8a3ac062b71e..e4382713746d 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -692,7 +692,6 @@ void slice_init_new_context_exec(struct mm_struct *mm)
 		bitmap_fill(mask->high_slices, SLICE_NUM_HIGH);
 }
=20
-#ifdef CONFIG_PPC_BOOK3S_64
 void slice_setup_new_exec(void)
 {
 	struct mm_struct *mm =3D current->mm;
@@ -704,7 +703,6 @@ void slice_setup_new_exec(void)
=20
 	mm_ctx_set_slb_addr_limit(&mm->context, DEFAULT_MAP_WINDOW);
 }
-#endif
=20
 void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
 			   unsigned long len, unsigned int psize)
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/=
mmu_context.c
index 85b048f04c56..ccd5819b1bd9 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -317,15 +317,6 @@ void switch_mmu_context(struct mm_struct *prev, struct=
 mm_struct *next,
  */
 int init_new_context(struct task_struct *t, struct mm_struct *mm)
 {
-	/*
-	 * We have MMU_NO_CONTEXT set to be ~0. Hence check
-	 * explicitly against context.id =3D=3D 0. This ensures that we properly
-	 * initialize context slice details for newly allocated mm's (which will
-	 * have id =3D=3D 0) and don't alter context slice inherited via fork (wh=
ich
-	 * will have id !=3D 0).
-	 */
-	if (mm->context.id =3D=3D 0)
-		slice_init_new_context_exec(mm);
 	mm->context.id =3D MMU_NO_CONTEXT;
 	mm->context.active =3D 0;
 	pte_frag_set(&mm->context, NULL);
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 311281063d48..3359cf7c2a61 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -773,9 +773,5 @@ void __init early_init_mmu(void)
 #ifdef CONFIG_PPC_47x
 	early_init_mmu_47x();
 #endif
-
-#ifdef CONFIG_PPC_MM_SLICES
-	mm_ctx_set_slb_addr_limit(&init_mm.context, SLB_ADDR_LIMIT_DEFAULT);
-#endif
 }
 #endif /* CONFIG_PPC64 */
--=20
2.33.1
