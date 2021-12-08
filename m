Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD446D995
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P9H34Lbz3dpn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::608;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5h1Ttrz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzsvTZn30WXb6aixkWSi5ZhEt5rIEuUhKMbDqnBnraNXS0V8RkkN/FPwy+OfdvYU3izFNwtkKKERZ9X7iSo4FcuxSfsMRYwNft4r/nomBUvd4eQISl+TuIN59Uaxvi5Ndc/CQwMSeqlMSWh3tywZSj3IYv9gQDvryP9dCqrobq4+qkrJJ2q08EvJQs+MHfr+3XzkxsM+3YhpTcTFx6EREJIjaf1ST3OGqJW4qs9kzlWemQsZ2UaRrGOfVC47P1awF8zZ+DvYe6Z8k1xTcKmLRW0Cs3oUmcSF1VknHTCVgWP3OMRcAhvbrcNw2Dx23vYMlcKTf6fuwlc37ylp6hd+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kal8uZy0vwBrMzZSbVRzSwNCiz8HNSzE2KXYS2+awQQ=;
 b=BjHkaUq7qwvTwTPEnOoUlVxTAspEUXlMQlyUfF7mc9L9yggT6KJFJATukZTEzI3pYO/EjQ6aq602SNf3UBtcD4pMlIIy8Ml1VGWDTwXbz8T50TgAfA/SSV9xYJK60qfj1wfQYeeciAjyKeT9K1Z6LnRwfob58GuSzIBlTIWRs3gNQkf8WL4fy+eLbEMCnXa3y9VQBFiCCp+tZcsYfwomllJJX6HfcJkSO3Cx0Tbu2NhOABLQiDJrXxYcHCS6OGqbVxdTN7QF+NDQTgG6dDbLltryFBurObDO3Dp4iSYX8x7EiP0EYX45H/0tGMs1c2xZ4CYCOzktDajk/pYSeRpj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 17:18:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 04/10] powerpc/mm: Make slice specific to book3s/64
Thread-Topic: [PATCH v4 04/10] powerpc/mm: Make slice specific to book3s/64
Thread-Index: AQHX7FeYbuPGOcS7MUOB41b1rsfSXw==
Date: Wed, 8 Dec 2021 17:18:19 +0000
Message-ID: <47948d4b1e2195ffbfc59c9962d7eb9951af716e.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11a6172f-94d3-43fa-e6be-08d9ba6ebadb
x-ms-traffictypediagnostic: MR2P264MB0228:EE_
x-microsoft-antispam-prvs: <MR2P264MB0228980B8C7736FC2D6D1923ED6F9@MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YNvbJUzXLjGDFsVQgptEJ4qDpXySZbBJze5OPdexgXOOi1HJcqOgbrYgwu0G9WY38dJM/j9hVjhzP6Z7mRQIPD5gQPit1ltikRUwaEsAAqMIte29/aPGJhHQ79hYJSD0tr5IHvfoZv4R0N3vtHPv2BKGNjK9cf6D8+xIDT9mbVvMmqUlMv8ixnPZIarvl3fm3fTZ6fIDUIRXpkQBgSbH/ymlFRHQX5UKpKuTIvZniPKuD62Zt/XLJrcqxKt3sZ5390x4C8k0T4CFqwCnNTa/iPSW9YYEW04yzt9O84AlgLIp98ptFx9MVs7FH34iqNLWHMm9PNLTQGgEszX1vNNN3iw/mo4jbFBr3aF0SopC4GBasowVV2EtKAMKyC1xnQ838q4uLSmZ5ONAYLJUZ7QIyiJua7CUSfqgrRSM+ZlLRFtqImBNPtm+EpJOOH+Ft6pOAUPAvPkKgfzy4T9qQQpQ5NhgycOYE1fC29oDgQ0126EnvKteE6WU12bYcMUkykYYoAeGgg3KGzr5lBsOopUeDL9uN5zleIbtRCFGJa2vnoKJiq6xSoG2ttCL8KjlEfowdK2Dz8gcU04YHU5tQGyP3usQdxkm0dlH4/4zEEG48mVEiCWg2YhGTsumPwsxzSoWIosPMPqUNAa0Pmy8vKTBqKArWacYQ+hTQ6F8uBA/2UXHWPVIvp8xIyxGMImzwf2y23myMAor2ACw1ihrjz6YXjc66ZAYUHj5OQFdDLylAhg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(91956017)(76116006)(66946007)(122000001)(5660300002)(38100700002)(66476007)(44832011)(6512007)(64756008)(66446008)(6486002)(66556008)(8676002)(86362001)(4326008)(8936002)(54906003)(508600001)(36756003)(71200400001)(38070700005)(316002)(83380400001)(26005)(110136005)(6506007)(2906002)(186003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?D72YcDrPXAk4WzLhloL+VLz+Qff1AbGMc7sZA7F4TlpKfGYJybXcpcsSsX?=
 =?iso-8859-1?Q?h3L//9rQt6/7SGDOHMilj7kklD3Xh0lmj9OUpW1KzV1M/aNY7sWadKqBPo?=
 =?iso-8859-1?Q?HnBolqNXJk/EtJNcjqfFoCt92tXKyR06hB2+pxbYHIEPAaoiOKcSYLXs8F?=
 =?iso-8859-1?Q?0XLftiNvBz6N5RmGs/GLFYyvjaUcYa8i9u7bMZ6oXY9n3xQxmXjPpFyeUG?=
 =?iso-8859-1?Q?XXw8PzYc9S8eiQY55484mJl1PqVIo2nwT4CciSsuzpXWYAP7w5D1Feb8U/?=
 =?iso-8859-1?Q?GseGnzb/xhjU37teElQtcHSoUNmNiAxIPtq63mBKulVL5Mk1rBPsLACo9l?=
 =?iso-8859-1?Q?RI2RftAuFONc/PauFYqf8nEEqplnwHNVVH31vshQ8XeuX4VS6fY7UDiJEL?=
 =?iso-8859-1?Q?SQVpVw8/DlV/6UaCPA7mkWxcpKS2voNXJldhYPCF9bp6pkYjk37nWBNjjD?=
 =?iso-8859-1?Q?i3uLvf7XCnCBx3OmTI8ItcXTQKQjvvGozoUp0Fj1rYb9AO3ekE90pid2sJ?=
 =?iso-8859-1?Q?df3LuA4bnOkUH9EQQ17fuVPelgh298SADCVJZcEhX2eGQnp7PbW9fkebY3?=
 =?iso-8859-1?Q?kCpB0iASYPOu0oXxmNigAO//D4PSbpRp2WCaI3ltMvS2nUaepu7r4E5xlk?=
 =?iso-8859-1?Q?b3l1At30kbovAi7zWIyj8sYcdjRmt7rCgOPseyNQCdZBdt6Mo0BPm16c63?=
 =?iso-8859-1?Q?QGAi4fmE2dkV5WOYS8TtEvgN1cMzU97/fQppITaTFb14l4AQm3nbqAcyDj?=
 =?iso-8859-1?Q?ZBPf/WdNLDyVyKfngQDD+7ilyi2htW8wW79ayyFZo937mM5zWrZtzTltoh?=
 =?iso-8859-1?Q?nhb8k+16nDL87PLXDl/5O2orPbuPTvZFnibEqwvWTWitrm/bwTgPhiwRrF?=
 =?iso-8859-1?Q?JBF1MRjAcO8FARgbIdDKyLPzapz4DaBlf2GrpkOrgAORrXX4xU1q5fUKlX?=
 =?iso-8859-1?Q?zOz4u2aAIOMppJZlpzMlYcGO3jU3OL9meN3grrDolu/AZNS4aB+pbFioSH?=
 =?iso-8859-1?Q?ee5GqqBCFGMwvpsgfSR+QzRZkiTmPUYUaxECZDW6m4BW4me3DmYGcvYYYz?=
 =?iso-8859-1?Q?mnfqvLAMPbeTEE81dwhbf43YJm8tplC7nQ00JjzChdcs/RRSYCK0FrvR8p?=
 =?iso-8859-1?Q?uL4Py2kHHO/YCjF1zcIyXBejuoqwbLP87Wv+FY7lq8Qz/MJgK5j31DA+h0?=
 =?iso-8859-1?Q?2F0PPZDsmjepbehQ67ZgeWN2Gs9xTRa728D65N/siZ/Sm0HZR9CLBkORX7?=
 =?iso-8859-1?Q?onwQhVgYdTFjvSUyd/cx08FFpf/tKjq3fDP1/DNolgMDiKLW53Z7EAJ+Of?=
 =?iso-8859-1?Q?zJBkwCABCqBodV8X47qUGpDtpFKqIjDsBptqKu0fMObwRgSNLW1kNSjIHQ?=
 =?iso-8859-1?Q?8i+9tKMxaiWbBW6cDAa0gGxqQYzGmTFVkNTd9KUutSRn6YchmMXsBLx83G?=
 =?iso-8859-1?Q?iCGvwATZmmVxD0N5HoOB4qToj9HupMB/q5lrOX/mP5B4ifNsDxO8QmayHx?=
 =?iso-8859-1?Q?YlFvf43ZYlVcfSj+t6hXY+TL9xqw0j/M9B4tI9WnWmyxi4ykzJpF9VzWW/?=
 =?iso-8859-1?Q?ArLWi2HtCfGuN4S5WWLSSJy4IA7O882cdxSSbi4PlGep7cVDWW/izDVJ6k?=
 =?iso-8859-1?Q?4U7vD7xRkXSoR7V/m1G8uRzv2IIPmJmyCV9f6CFudpWPjRZww2JEvJyDwS?=
 =?iso-8859-1?Q?TejYnsUQmFgF1Xw5dCauols3e9qd5oepIc9Vb3I4bPiDHucKw4prLnh/TB?=
 =?iso-8859-1?Q?Ab2DOBvRn87YHwPNiAr2zLerQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a6172f-94d3-43fa-e6be-08d9ba6ebadb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:19.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMNj1zEJd0y9IwzWAN7tkmoRgwEOCoZbBg+PJ61TcKRDAUoVRes4oe4xSGSYlvgLAkhb0Bwdd1FxnM4Gij2+/EyqS/K/+MAfGmVD4FuHpyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0228
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
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
