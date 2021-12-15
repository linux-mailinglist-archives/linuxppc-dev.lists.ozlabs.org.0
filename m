Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7432475323
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQnY3GX0z3cBl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjv3QCPz305L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldt/Gfn1MZ74aC5mq67T7ENCKRr3VB9TGiKluuSMBGmlzo8m/yDhrES/gmaLbgLSbZegCbD+W1hMxOvSFN0hoeMUUipCzFm1MRPXvFQMcFLBTVVoUp1SdBhTlnymBYQKXQngHbg43L7qvn7JrnNdyIlsE3yFusZ24MAlE/kq2jAq/hXb+kRswaQD04fbeCpwczOaDZIATDRPLFm9N9oOEWAwqi9SGwIW1RHZSE0u+gO2pwNa7hOZckqixkrKTJXN3cGWshgmGyhDdbVDbl3iZXydyXmSbeEwzG9F739Xb7Y4W82vySv7opARtEuLWJpzGXfHBz7YK+ljD/Q8i31wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kal8uZy0vwBrMzZSbVRzSwNCiz8HNSzE2KXYS2+awQQ=;
 b=CArDeLULztxuAoRxJlx6kMSba5WQB8jbxAXjvqV96CGkEjSNyWM1c5O1qFxwTqdc7KHXWLHF7GNyAH0pjbKEpPCClAjqWwnpeUutuRoueWQ2LUywVfLvINmMvCgjuHou1R4XXVk9WBoCN/FHL1gsJ4RN0YmGfCysrPcPbQq/01ltYgvxT9TYWVex7/sUdLYnlLFzkIf6vpjpYO9Hvezukefl4o1ysbJBIViOv9a6okHRVd84+Lwx8P+e67fOhy6GJQL2LIiL5kKMHnO7qGlggPcokg6BT0r0OXM1p0kJaKeiKMcsoAmF0wJAnT5ldBIcW95X5xnni84bw032szIIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 05/11] powerpc/mm: Make slice specific to book3s/64
Thread-Topic: [PATCH v5 05/11] powerpc/mm: Make slice specific to book3s/64
Thread-Index: AQHX8X9PRt5u0RL0BUiKOx05nfM3rw==
Date: Wed, 15 Dec 2021 06:45:12 +0000
Message-ID: <13f6dcb4275ddf89e6c36d3d95e9a9b280f711c0.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7432c0e8-3987-48f9-4f17-08d9bf9671d9
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB2147737AC1E49A675419C494ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C0D140RxNxv9vEMYD0l9lD2QamBGdlruft64HzxrSb3jFOTx++H95DkgSer7wxGmHBXe7M57ElnNHa1y21WabuOtPDFUiTOhlH60mo86fc3VLJrR+2SIXCCU6b6dl6tGTCs7boMRoxxLR/D/SCloHTnKv68VX51/xYpZDtlblR7IMvA7+0TMK8y6Re9C49xFJ2gCmyKGzubBl1/5Xda/J313DJ6JqZjsNtmEdd3WRUcOR8xyL6ql0EG2OMAw1W+NNuHpBrL5hkkElqz2WhHCLzAlrceGPsN5J1lyAmCcjsGa4voXKM6/k02AZigIbrNdBnjd8kE43yJcWooxAVc/YYH6eHIgboFdo062i201a0ZMGBDxXgikmc/Xe5o+fpbiLch4N+47ly6QVOIBvObS4ww12W0SU3AHq1iFoYsCUNwdrRlHgl3CBT5F7yMId31LNFNPnkSSr2NUwrysEiNw9pQ1hJ5xcn9PF6RAkPzYy3ruvxdVTXqSM0q/Eu4+RrThGQP46DQhfJZiTGczOLJyy+IDT0MKlZJodkxAvbNWkCbl/81mD6brVIlIA1uOaCRAlkg7QLV+xffDfCjRdRrFvXyG8ELGAwh+GUVzDIxUYncJpX+CwcL5RKawuKmFEuVODU4KHNa3LulqfAaaqfxdV7oRuJMvpM2Pcqrcgo0UrG9Zyj2x1kWh2cRMVc1ZQXYtOYNDQ+hB0v1gechwzMhrG1nC1zhSDfB2+ZWQlWXFp9Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ggc9YDUQpmwYlBq4DdNUKyMPuRUd1so9NxS8ZlAMAgUDcnUKItz8Utm4Uq?=
 =?iso-8859-1?Q?CqmqVe5kJNMf98rQKbqH5/Zgk/awNzRhzmY4E3gq6KWYMT3tVbLQq9/vxI?=
 =?iso-8859-1?Q?4VOqwF5G3FJ8d+JSan0ej2aV5c1OVfJayim8J+eYuX0uiTJDQo2ZA6jvzM?=
 =?iso-8859-1?Q?1dmN4BK0IZjo45rTQzYA2YQ2Rm4WTbVrpwEYVoYvqzcK+Hl3D5vucmjqbz?=
 =?iso-8859-1?Q?7jwGOFj4b0FbaR50W+zgRma/vb2ocaO25N30ZPyOcpA/m8TQZDCznQod97?=
 =?iso-8859-1?Q?dyLppSfgFZeVsAxybu9NzDr8kPYSCVIHW8n9npHNEWmZQQOhmfDSoCEXHr?=
 =?iso-8859-1?Q?wnVLr8PGSz8ZEgw49Z9G+V8usclHdIb0ihmZz4GFOtvvdx8FSEMK/5hwz5?=
 =?iso-8859-1?Q?wIP4j/0r/+LB7jZ9zQL0PqY9CPoVRYIVAhGOHcdnR33jOnsRaM65sRiIJg?=
 =?iso-8859-1?Q?WIgu7Nju6u71ISUcSKJa0Kr3+5eL/Mn8c7vu11OALvr81VYbFjw04OdHON?=
 =?iso-8859-1?Q?QwMpSF2JbkpHuO7tEgq8D14A9JnrimaH6jl9Xdh8nltmvdAZukvf4VoZzb?=
 =?iso-8859-1?Q?OY+HpKAIiIkdtzpTs/vAGs1/YLW/FvGx5J7WN/1tN7W7rh9Y/afPRW/uzY?=
 =?iso-8859-1?Q?gbMreYeTxu4hcB2OGwOoGAZb58/Ucs3Fua3U9UmzlR51fToL4lF4YNVuyP?=
 =?iso-8859-1?Q?PQ41K5jXsz7P3Hm6t5yF5O/DrH2nD4DGoXt6lI1cgnQBjZ5ieTt5SMXBPE?=
 =?iso-8859-1?Q?c202lzsVZOMw/WyLCnReK6xF2LI0SO6b3UfatdhzPDazlRG0HcBitC/LPO?=
 =?iso-8859-1?Q?A3XsZ8FnDYJ7JahDfWqu1iD5ruE0N2xThT+r1REarZCBJWQ+FvrHN+5Uz8?=
 =?iso-8859-1?Q?QIEM7+SPsiootyaqg9/PYvLE+ulzapl2ALQqLg3JRnL62tthGkzU4X9Pun?=
 =?iso-8859-1?Q?aMWNyCxFEoz8ObQ+6zEa4qSmKufukBPyGIvWRPLSHVvmUDC5O3S1wpjhAT?=
 =?iso-8859-1?Q?yoJvhy729zkBnzXl2YuqjEy6SB6oSzbsaqM+a3AsqfejRMbDPHgrzbAILx?=
 =?iso-8859-1?Q?gvfrMtnYYXC/BE4b9HA7AOBe8IgnuF8l41pMpJ4ooaRVLGKpABAxfH+Hu9?=
 =?iso-8859-1?Q?sqec8/95e/vsx4XeNPIkpyqy7WLohaTCsK+UdPJ47w0e0t9/bE1non8hDK?=
 =?iso-8859-1?Q?W8+Q7+FwgfckFxyY/cQTfY5fsjcOxHIAsNZ6m4lUJdAeFEwseSEiQinZjv?=
 =?iso-8859-1?Q?snSp2csSXA7LMW459J1TkhEd+9enWVM1A1Qedg5YFfKlghp0rz6+21sXXa?=
 =?iso-8859-1?Q?+1xmDYFZRqiNqvg7EbrlwotiTP1K3PDImPFQdSeddDt6X1KLOigFfwg7rT?=
 =?iso-8859-1?Q?9h/QPLTHv2H7S2letdDbq3XyN45yU0jsZyemTiZu3BLfV3F+mx5ouYPw28?=
 =?iso-8859-1?Q?FLvAkN5Txyc/lk17U2lYUjX2udd+Tc5QGlmChJ4CmqjmpQWgZWFvYuMuTL?=
 =?iso-8859-1?Q?ZIRUhAy3M9FkgOXp1gEy+fXG1bm9qzgp7xOw9J4x/RuRcN5rlBpzzaEBaP?=
 =?iso-8859-1?Q?qtVjbtlJ6Q8ZQhEGkCumIXO4r7VQCF1Qo4cSD6l+i01cP5iohCC14QFcOn?=
 =?iso-8859-1?Q?wL4VUFDJQur6t9kptllsP+aMJLr5g6wur67dC3DhR8asg2zWmq1m2ccThl?=
 =?iso-8859-1?Q?WvHPhyZdOI7xtu2JFpNohq63d4qYfE+Oy1JqbFdSLbpiq2aSrKVdP/fdGI?=
 =?iso-8859-1?Q?T0s4tFbXbaR9MZ0zLWJMWDPuY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7432c0e8-3987-48f9-4f17-08d9bf9671d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:12.3731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olJfMpzZv/aIc45blCa9ACsrr3QnY9kGsEY5Chs4SeSkFJUWorz93I9r2Z4yYEmrRPD2lfvLRgV6p+oFcvll644jRhs/voRRnxpwoyp0rtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2147
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
