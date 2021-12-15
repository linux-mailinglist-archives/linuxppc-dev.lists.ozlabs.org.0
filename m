Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA183475327
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:49:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQp44N2wz3dxC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjv60rQz305B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V73aBlTq7b+bc7IpoxE9/GN7WtyO22DjpezcPGHl0r7EJ8W/LwHMW/9nOkvbJcInVs8CWfCamBoENeR5nTf/AWAe8oaC8cAkDVMntG13dJBk92SD2VIJHSwGDtlHUC8kcY7kQi91cZRe2iZb3hkI9kjbz+m05WGHpl1XAHyvnyw0/y4Yrkxq5/z55Ji/jsjbTON2z8qBezAFh+LgzuLfbYFkNXlOjd0jO/U5q60fD5dvKOXNs15eMA5sdV6PQhKKw3yMaj4C2ZJrTS8Npx2FItMzp4aLzpUgCaCvbVCenNQLN1TE+RjgydtskQ1PjtANTmz+tM2dfWgiBUZ+L3J+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39FFmOvJEbICLmGjehFIN4rt9ehZmkF/y1NsezPHRsA=;
 b=cQrNauodU090zIm3u7BiKaEfnqKUaWOcg4GBwtenQ1UsL4ZpbZs7R/oh/YbLTZ1hry3emPX9iCWuW0OhCk2sABKEzYPds1aMizw5zKrDTtO4HO+YUmAMDfkYfk8cdXWhkscmyF37LOx4ML6V8du4ikPrRzdK0FbnK+2WoNOkLONY5XzAnssk/cgadPkY4WY2RAuN618yOzbNJNxJIF712GYqC9IQTwuMTFhW8K2pfCNZR1vLsWXBOSpFM22nyj0R13Hc0OcLwoKBXbkGytJz1t0PCT6ug06Ah3ToaoQeFFMl7aRTQNwaPjtUxYEkKXQVScPV44mWIL3jwDSVw4SIuw==
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
Subject: [PATCH v5 06/11] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
Thread-Topic: [PATCH v5 06/11] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
Thread-Index: AQHX8X9PxLw9vB0ed0+/1Dy1MbNFwQ==
Date: Wed, 15 Dec 2021 06:45:12 +0000
Message-ID: <a6d8a23ddf4292e0bc9a8c777ec6e952758acd62.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a84e2282-d11d-46e5-56d3-08d9bf9671fb
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB2147CA2725AEADB5094BD3E8ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjamjGD+4NueG/LWuUtPQZEda+3CiUl3X6cZeYMWJ90hwBeZ5+w3zrXC65eRF6KySLUYzPIg4bCTYrPUy6zarTA1P7BWFNWtcsQJJ3BLF5zuMdui41r+6ZUuff7AJ/3Roh4S+Q+TxMO9nilUYJhfTdqUnHzHGij10zKXM08oQgHgS0lqpFO8EhTzPe/NLh5DeF8vyKBYw7Te98VxXaLsRrfrq1scK6w37GrxCEclTdf3qdzPAa6OBGG8A7A6GSCicn+aqedPeLNmm1WWC+k+fh8L1mN6cyaF7BZFqdgla8pvPoEBwt7q62q8hwuPP1nsN/8NElbcOjCQ3P/Jvx6b32sjaLdvUsr1e+IYIqEn88TboEXlzlAZm0NbX4+B4qt7nEKLLLV+DU4Hl2ecUB7eTm1nhMqtrU6/55Y4Y4ztWbde2EkqgjYGAj/d/yXrbhi78EtJ+Ip1Pad9pGMkHNyAeoVo55RrmojZZ93CFGTm+fQNDoDmDgUzRfFdD5vRi+X0fefzj8KJtebKilmloLDhKPw8lb2pA/L2gnVTBxZ9sQp0FXKOHdL2VBkfvEvPdDTjLTKrAapuBskIzrS+VH9Ag1CxWfZ6XLcqoYNZAFOyasmpH0Ze8Mnu0y8bUuch9cvRRhDQTRw/B3uwTwbbEnRHVltHsxQDxlKFrrMGGRFtwZ7ECIYKXkjQ+WfXV7d96X0PT5076k3LA733I5ynYrUlQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/fEFe63vnux9OnFYyxbKfhTbZQPcKGkV9g8ANjwO9qO3RxGWqHHTD7po4C?=
 =?iso-8859-1?Q?zVly6j/s1zxm1Xw1eJ6lsSNMUqNZTrHEx4PKItdgX1teE68kOE/CJBX1hE?=
 =?iso-8859-1?Q?1CMmmwycsRs0u8/xdZlM5wXQL+T6+tkxcJIr4PwZKYfRiwSY/KZdazFzZA?=
 =?iso-8859-1?Q?KKziW8hgD+BHaC3jDdQPZBqtOmdSQpdzvFGZ5U9xzTT50k+y+SA6ORDVjT?=
 =?iso-8859-1?Q?8iseHKQFqACSU8stJVERu6dyo3TN0JINH+on7fZACwYv2DBo2lIFe8Y+b4?=
 =?iso-8859-1?Q?7kLh3JDLnQSVllzqKPS96hDo5FT0rrQOFOtcXV0KkCL/ttWMu+Lwrv7x3z?=
 =?iso-8859-1?Q?bl7Vmr9X5lmABKQcAnAYHOyjOGjsuej6zIsv9PjFRfFzIlNCLZBbRpr9HJ?=
 =?iso-8859-1?Q?IfeDXuGqq26XAlk0TLUJ2H4gQfjYUuDpx6KOfvhi8tMie7lMX5Sz34lU8L?=
 =?iso-8859-1?Q?FlHuLHi2rePrL3SDEDFR1AkX9xXmRHDlsHJnCz/vRwrB6gO3/1C8AE6DKm?=
 =?iso-8859-1?Q?aUGUgLYl0Xad68uUJsNV5pi7Pcnnv6DMRjvUqfTnmyYvqofemtzcxepESt?=
 =?iso-8859-1?Q?YR6pfQLypf9tKiDmCl/dbVqacI2w/swgKiZxVqSdn7MdjoOeIznniKM3Px?=
 =?iso-8859-1?Q?+D0i1vg5/8svmyh+EcnKL8cWLaE0pBwrFFiaSrsZIDS6hDAEUUIfYMc/yf?=
 =?iso-8859-1?Q?G612G1RDaOQ8tKBeOGX7Q1hg351BevM1Tb4l6PoYrYtAMhV9/F5Pi0Lh2F?=
 =?iso-8859-1?Q?GskYuRymQ8agx8V9mghwAwv64GawbWQ2gfUvNKmMjOV2CWmZ3oirOfI9Fw?=
 =?iso-8859-1?Q?PyiAYdwrDnMeBpSRQCF5sbfAfrlQEJOTq8nGZELcXiDaKNQ75JJgFLqdJD?=
 =?iso-8859-1?Q?2wcep7g2hH7pUkqs/MDvcFL/lRey8A7ocvmnj43kZLObW5aTd8gzsWt1/t?=
 =?iso-8859-1?Q?0fgKMsZezQGEjTD+Y0J0p9WbVGQMCdblqTsqYrGrVuLDOeXz70Myuj665G?=
 =?iso-8859-1?Q?moZGimelbd43m5/QfwO0URtY9J+TylsxT846Sv05+ywpqRcGERohwWXXpX?=
 =?iso-8859-1?Q?M/0MN6jCxpQoibx/oTWzJ8z8hJeKmU7KYI4WmNIrgf63/Md//mRoidjHcI?=
 =?iso-8859-1?Q?0yUFCuFFxnIEIs15y2qzkXakt1aKVSOD2wK+3Csd92G89wFaxB0nyrm3gB?=
 =?iso-8859-1?Q?sGrjS6yParql3x0HVJIaO0lLGmWTaFSFk4qYWUT3Jr+5NTfEipQDei53t1?=
 =?iso-8859-1?Q?k2wMpHovBAarVqVDl+GOmQ6R4fOfhnrf4rcOEYNi4yMo3irOxkOZyKtvsZ?=
 =?iso-8859-1?Q?vzqh1IxSRbOmF1M5U9LLJSRKSRBq0d9CvLzE02J0yeLi0CcxWM2lmvKli9?=
 =?iso-8859-1?Q?6hGvSs8HoqXipCgD8qly0Cqliacgm3CVh1uO2LkgXjsnGSfBCcDZMVvwum?=
 =?iso-8859-1?Q?FqDBA3dBs13VWLQD+WSnCRbX44AUXNLZNo4l+o5RrOwe8j7d6L2F+3KtIL?=
 =?iso-8859-1?Q?ZZBxCTcLJsVUYi4q28RS3Lk/6iwk5ECm/dIEES+Gi0bQJ7vmdENbitFLYC?=
 =?iso-8859-1?Q?vWWiC7ep2bWpYnARtIiCO+qkEzoQNg6ZcI4BktL2ZXvm5++G+oRHGiL85y?=
 =?iso-8859-1?Q?DVcWADx8ALhHxOQbxDiBPbcUb0rBa7dTCnKuhWdjJIAEIWZt8nwidP76tD?=
 =?iso-8859-1?Q?FgTBXYCsZfpUxcdla/p2elnG/UCfsvO9Zi3OtPqUdvygA+m7rFnKwdvtOu?=
 =?iso-8859-1?Q?y4Uxi5qIPKBZ/Mud4d6LSYGDM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a84e2282-d11d-46e5-56d3-08d9bf9671fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:12.5861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNwG/Bflk/9+ucCyEy8n7S62/nhgxpRNTp018NZe2jznN9V8FRag3ZK8c62DSjmYt1nZqTAGfaJla9/uE0QQLm/ruPwf7u3pZYHoj/OYQC4=
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

CONFIG_PPC_MM_SLICES is always selected by hash book3s/64.
CONFIG_PPC_MM_SLICES is never selected by other platforms.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hugetlb.h     |  2 +-
 arch/powerpc/include/asm/paca.h        |  7 -------
 arch/powerpc/kernel/paca.c             |  5 -----
 arch/powerpc/mm/book3s64/Makefile      |  3 +--
 arch/powerpc/mm/book3s64/hash_utils.c  | 14 --------------
 arch/powerpc/mm/hugetlbpage.c          |  2 +-
 arch/powerpc/mm/mmap.c                 |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype |  4 ----
 8 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/=
hugetlb.h
index f18c543bc01d..86a60ba6bd2a 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -24,7 +24,7 @@ static inline int is_hugepage_only_range(struct mm_struct=
 *mm,
 					 unsigned long addr,
 					 unsigned long len)
 {
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled())
+	if (IS_ENABLED(CONFIG_PPC_64S_HASH_MMU) && !radix_enabled())
 		return slice_is_hugepage_only_range(mm, addr, len);
 	return 0;
 }
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/pac=
a.h
index 295573a82c66..bd4dd02e61c8 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -152,16 +152,9 @@ struct paca_struct {
 	struct tlb_core_data tcd;
 #endif /* CONFIG_PPC_BOOK3E */
=20
-#ifdef CONFIG_PPC_BOOK3S
 #ifdef CONFIG_PPC_64S_HASH_MMU
-#ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
-#else
-	u16 mm_ctx_user_psize;
-	u16 mm_ctx_sllp;
-#endif
-#endif
 #endif
=20
 	/*
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 39da688a9455..ba593fd60124 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -344,15 +344,10 @@ void copy_mm_to_paca(struct mm_struct *mm)
 {
 	mm_context_t *context =3D &mm->context;
=20
-#ifdef CONFIG_PPC_MM_SLICES
 	VM_BUG_ON(!mm_ctx_slb_addr_limit(context));
 	memcpy(&get_paca()->mm_ctx_low_slices_psize, mm_ctx_low_slices(context),
 	       LOW_SLICE_ARRAY_SZ);
 	memcpy(&get_paca()->mm_ctx_high_slices_psize, mm_ctx_high_slices(context)=
,
 	       TASK_SLICE_ARRAY_SZ(context));
-#else /* CONFIG_PPC_MM_SLICES */
-	get_paca()->mm_ctx_user_psize =3D context->user_psize;
-	get_paca()->mm_ctx_sllp =3D context->sllp;
-#endif
 }
 #endif /* CONFIG_PPC_64S_HASH_MMU */
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/M=
akefile
index af2f3e75d458..d527dc8e30a8 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -5,7 +5,7 @@ ccflags-y	:=3D $(NO_MINIMAL_TOC)
 obj-y				+=3D mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o =3D $(CC_FLAGS_FTRACE)
-obj-y				+=3D hash_pgtable.o hash_utils.o hash_tlb.o slb.o
+obj-y				+=3D hash_pgtable.o hash_utils.o hash_tlb.o slb.o slice.o
 obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+=3D hash_native.o
 obj-$(CONFIG_PPC_4K_PAGES)	+=3D hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+=3D hash_64k.o
@@ -21,7 +21,6 @@ obj-$(CONFIG_PPC_RADIX_MMU)	+=3D radix_hugetlbpage.o
 endif
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+=3D iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+=3D pkeys.o
-obj-$(CONFIG_PPC_MM_SLICES)	+=3D slice.o
=20
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o :=3D n
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s=
64/hash_utils.c
index eced266dc5e9..7ecadf5e6bf9 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1264,7 +1264,6 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp=
, pte_t pte, int trap)
 	return pp;
 }
=20
-#ifdef CONFIG_PPC_MM_SLICES
 static unsigned int get_paca_psize(unsigned long addr)
 {
 	unsigned char *psizes;
@@ -1281,12 +1280,6 @@ static unsigned int get_paca_psize(unsigned long add=
r)
 	return (psizes[index >> 1] >> (mask_index * 4)) & 0xF;
 }
=20
-#else
-unsigned int get_paca_psize(unsigned long addr)
-{
-	return get_paca()->mm_ctx_user_psize;
-}
-#endif
=20
 /*
  * Demote a segment to using 4k pages.
@@ -1710,7 +1703,6 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 	return 0;
 }
=20
-#ifdef CONFIG_PPC_MM_SLICES
 static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 {
 	int psize =3D get_slice_psize(mm, ea);
@@ -1727,12 +1719,6 @@ static bool should_hash_preload(struct mm_struct *mm=
, unsigned long ea)
=20
 	return true;
 }
-#else
-static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
-{
-	return true;
-}
-#endif
=20
 static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long =
ea,
 			 bool is_exec, unsigned long trap)
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 0eec3b61bd13..f18b3a1d18f0 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -558,7 +558,7 @@ unsigned long hugetlb_get_unmapped_area(struct file *fi=
le, unsigned long addr,
 		return radix__hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
 #endif
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
 #endif
 	BUG();
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index c475cf810aa8..9b0d6e395bc0 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -190,7 +190,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long pgoff,
 				     unsigned long flags)
 {
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
 #else
@@ -204,7 +204,7 @@ unsigned long arch_get_unmapped_area_topdown(struct fil=
e *filp,
 					     const unsigned long pgoff,
 					     const unsigned long flags)
 {
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
 #else
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platform=
s/Kconfig.cputype
index 87bc1929ee5a..c775b566e7b4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -376,7 +376,6 @@ config SPE
 config PPC_64S_HASH_MMU
 	bool "Hash MMU Support"
 	depends on PPC_BOOK3S_64
-	select PPC_MM_SLICES
 	default y
 	help
 	  Enable support for the Power ISA Hash style MMU. This is implemented
@@ -450,9 +449,6 @@ config PPC_BOOK3E_MMU
 	def_bool y
 	depends on FSL_BOOKE || PPC_BOOK3E
=20
-config PPC_MM_SLICES
-	bool
-
 config PPC_HAVE_PMU_SUPPORT
 	bool
=20
--=20
2.33.1
