Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D430495C3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCdK1BL5z3dqn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:45:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYm4WKRz3bP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir7BopmHnyJ/i7Bns3u+baLuynD3HTByqWGbPIWnd/gSVv114JfjBKvgYhVqs4B5bRsyhzKz/rdGmHsiTDQg3noIAQRSAzCM1E6y7jVqHVICCrtP9FGynutOztT3TqPc4M4ieT2sJvg2cziXNpSYkmHYSWYDitI1i85PGim4yQAgYhU7r1oCEnkQiIi9/qvzUEqtXZn5EnoOWZJcttIwtCRsGFGohr4bAzFro94OYL3vN6TKsFRLMwRRuXCTyAq+YVTaf+KbYitsiA9MrBP2HwI8btJ47LIKlScl0n+43ouEG/+fu42CgJ2in9yGw/GzcOpYSfVsXS0O0IyoF1Rlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcB2DX1cHDXi9JS6wFdHfyCR3d/PINCnfCWyhq69JXA=;
 b=MEkYioVhQl0vHFj983RMBIUYdbj3DO29XcjrDz8ZDs4fDsYZ8J4BSuMIZ/hkyK7g7y95dTX0VidlqcJ5Sdg2iFjUzCUPeOutt2VIWTkR0n4en6PdH1+HlTGttaEixgwA0j0vtMQXjPBpVea+Y2/uo1Kjn8Woq7FjGbzGWcs9kKTxmdi5HJJLegK/gfmdB81b3GYS5fdgWOZzOfu9eqOsW5qhWFuhPJDOq6hek5xvhir2L8UA3qtWV0SbeQ+iAsSrpc/8v7vJPjADWfujmraN8OczYZYpGZsw96KaT0TPapFwHY6L4VmBbn1H9dFMiIh0H/IYGi0i4xBU+oWlZR2tGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 07/14] powerpc/mm: Make slice specific to book3s/64
Thread-Topic: [PATCH v7 07/14] powerpc/mm: Make slice specific to book3s/64
Thread-Index: AQHYDqLRddxa/03Vk0SHKge8QDGmPg==
Date: Fri, 21 Jan 2022 08:42:27 +0000
Message-ID: <0291cfad5e241a98aff2241fdb6bc30368e66d8a.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e6b22f0-f9d0-45e5-bb32-08d9dcb9f45c
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB02018EF0CC8B5ACE586A6533ED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PcOaaZHOaiEZtliO6UKAbYqdJ9NBtTFkbkfcrDU+KxiGiCzz+Xfo91QyRNd+ekSrgjkVOV7dOkqQDQCOMmWkPpfZzWFsdswHHKAAY2i21jMzf3Jm/fJcaZGT0IAPTtS+McSuqGbavCi6egM+GsFpa5rJwhW36gHh51BLjnolXSXPhGq8OrO5r5WAXTJpJjq/G3RjOxNPN39IM4FUMsIZTlAOe+IyyNrxL3uDPNQThC0cys48GpPbuNypxinj86bYe+dDH1Ts4is5xr8EyNkTZrT+A3Usk880y2EqnI7+PJusuRiHYA1VNRukJvzGAFDmlHCcv+PheAqwo8ush1LXE65Giix7iGW7IOXv9lKLuXfMKAphW4wL9Hvx5JC6UmZIBlKrqaDnB7pTvA5mNkbk0zOuQYYJPfB1ONlofJc1vM9fVxGRyDchZ8mL024jegS97AmhlAKFnLVcg1m4UyDatqCEZ96f19lsMdiN5Zz+GeIt/gzm4aoCee1HO/KzBHduE/Tq0O7hfib/oZCcdZZpdQ/c2kQXrk4mKaVbfEuec+Db562F9NTRA4tTmG9ZC0P0LZ/Dz7qRodmJYLEHYQbgfSx7cz4zIAwqbhgs8NX6FX2V4OS5TuUUK/jamOZXSvNZg6zpgVBry2MlldsWZg2/icI8G16tRnaJhJAulY3jk1SA6Xe5B3iEbZWN91juclzSRCOng3Lj+paNd/LWaEGbOWcrP1iMsx9Hd1ukKHyu7eU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZTeUo4DpnvMlndUZ4d8bnH7nddLdocTNa/3xMJTvV8SRhcwg1hBL1j2oX7?=
 =?iso-8859-1?Q?QJ95mc7o1snwVPlWL4zBCagTSnUF29dcAtr7XRVKOIKBbn8Np33G7cTcPj?=
 =?iso-8859-1?Q?zposy6XVzuS9cj77sXBaV8zibTMnj3JjB57nCgJzBT7vDnMyDcm/M4dK/B?=
 =?iso-8859-1?Q?st63osaiciPyATQ/7NFctpyRQG2/IpjiVG0eHWZS2NDPw3LTJQs/DSvG3Y?=
 =?iso-8859-1?Q?FQE1SMoF9zRb0dWuIQaio/90yOIftcYyoNTeFUGSJEDBcCns2PRllOYeXi?=
 =?iso-8859-1?Q?XdkTjMVjcCnrOoXWPrqKxwmqWKiRnb5KWHlqdsheG6WK6QNpbfjsaPJ75C?=
 =?iso-8859-1?Q?bJyjMLTXIAh6rhJDzvphMqccJ5rIoOPVXilz5uPYxBmd6F/C79GSVPTCve?=
 =?iso-8859-1?Q?3iiR103PvyGS96MJui/XiiYINsLc1C/VyewwJWRW8QuOHuRqzzVS/KQ5xo?=
 =?iso-8859-1?Q?QgJHMfaubEbUxkP2wYSNvd5Msz57AJdjesiwEAMP+kiBs73fupDIwSLuAU?=
 =?iso-8859-1?Q?2TbGWH0XhOCCKIXqozgFAfdJ8m5i1kdcxTrj5shx3eR8iEgiI3ofBXi0/H?=
 =?iso-8859-1?Q?TKVL/bfMB5Kq6UrqmTYyLDDXBa45CpahNQLcGq9Z71IUx9jObtpl1oWjwg?=
 =?iso-8859-1?Q?mH/005WIOlpMXGys0YsspF3od+sgXTyQqyWq1v/2YGOR/OoXyfX6PWkeKv?=
 =?iso-8859-1?Q?4PdPFGw/o0J0QBCCL57QW/WRmZR/NMwEt8qRoGpCJ9Rme0jiCC5NwP5dLa?=
 =?iso-8859-1?Q?3ANLhTxnDHiXGcRJK6nOrbb/DoRNjtO5Q4VD9seT98qTB8z1y9WZTwyPLV?=
 =?iso-8859-1?Q?mCmXiO/MfXaumWAp3n/9GffHobkfUCjmi+eqaNI35T8I+j2lW4TYfMOcJ9?=
 =?iso-8859-1?Q?pPGLlOYfZZj+peyNiW6Z0BeQdl8TLA4LINAoxlguB6vXQvTKHZejftvb/Z?=
 =?iso-8859-1?Q?cUaclshQMhQMPwwC06i4gEhaTjOC3Zm6hjIKSd61iBmwsSPN/8MrOQqeSe?=
 =?iso-8859-1?Q?2NW6JJMvAyMbTUug/rlcU9RtJ2sBq9/I+UzDuCR9sDR7ACpfH1KCWuAjnG?=
 =?iso-8859-1?Q?ab8kVlriU2u1m8lGgfvc8TRidkj2rUXad1DggeCFxwXY4LditD7gSTWp7Y?=
 =?iso-8859-1?Q?NUWsiD2nCB4mN2pMe5mIiaPunJ0hHU5my1hjogYuKMNPZOHb7/l3AqaWRd?=
 =?iso-8859-1?Q?gYWvXdTmjoHflEplcOz8jOlxVPCsvbid/Ormp4q/CrhalkyGGR/hj5VGA6?=
 =?iso-8859-1?Q?T5bS3QWbN+yIFIENPise7RylYMD4uDLgQIO0cHt5LLKORYC7ZMywGDbqLQ?=
 =?iso-8859-1?Q?Ut4yIdDta6DesyWjdZYzoIGFwDbnYSpUQ+KDnMlWz7lFC7iIEr1ltZGKj5?=
 =?iso-8859-1?Q?Q9c9/cV7QpXA7JNpWYCv6kpWzZsXNDSKXZ2RQe14UiH4Cq/z/RRFZLVMwP?=
 =?iso-8859-1?Q?3uArcax00lcasnPdfqMI9kdvx4SOxAmIljAQwAFKwVAf0qnjvXfiTbCWH4?=
 =?iso-8859-1?Q?WuJvpUkux5iG/qEjZ93zhDla9RgCGl1Rei+ZA75w+SGEX/ik5zNdFdqJr8?=
 =?iso-8859-1?Q?tw5PkrT+128aoNWbfgRSsHF8roX3Sql81cB8dr6ZAV/F5D0TjwotkkTsje?=
 =?iso-8859-1?Q?jwIZnyPxYtlZqjLApqY0fs+q8Zh3MvMih36FLZfFXROx8NmsheSk4/bl/r?=
 =?iso-8859-1?Q?erb1KbTd86YmjSF6vrfGk9YE25F24EMoUo4U6qkzM2uPkUZb7D4IXZNnWi?=
 =?iso-8859-1?Q?LeCP59KHeNf7cmnv/lLAl7k0s=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6b22f0-f9d0-45e5-bb32-08d9dcb9f45c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:27.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3EfhDW8H9Ig6jGZyWuvFNH9jnUprzA6nWRHp26I3D0d7dUE9AKE1aj8lIIsT1ABKprjl8B2hmuUKTBoyaM8KtvjRuixEbvZYCOXwvhfym4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB0201
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
index fd2c77af5c55..7e1e7c3dc66a 100644
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
