Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B446D997
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8PBK2TRJz3f0F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5h1bgfz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bagqc6I5u3rSF3lMqjMqlVWhOntWMPeXKyfsgWuTDSRbKB8IDZBOpPDo9NpEMF66MtAh5EIMlHV2zPfN4asYTa7GufOhG1D0MnglJp3OljGvIfSBGIwjaWMNZsVO2kfe7+jBYVEwaPRpMTPam/jZexViN81jwJvoB4uPAHe0Bt0uhRujSAm7dXDSKu1dWXcYxc0Zdv61myzYYneCI7GILbw9RdmAGqEZVzWvyqwCfwVYdG5NiFL4ICzouWzQO262ccyE3GPblSqfUDOj/uAgVsjQXKUPFvZo4tY2HKUB4Leg34FdZ9K5pMVGVXEmk53yI3/cX8cVoZVJlbHuXzg5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdCjHKP9l9OBJ5gDlZQo8deltmcwCmBmFWj0cSPtgCE=;
 b=HLKYz883fMmLSc4NFf5M8qRBeEmMYcuDc7mWmHJQE5mdNoFvOcLdSPT8djd1AWhm7rGhHMWa84WpBSwtj+xHZcXjCu7Npwv4f7JvyIuXQtYvHQnb38LGX7Qomi1SSJ0Vqh8/LjZJg81eJ/X/ftpxCZTfx/aYPh87UaOaVaMrQBL55vBzpw/XxX60/5c7N42dMUNW6WyKfgROIDTiU3aUsp82p5Tp4ysJIP6uTowqgEAhqhPjJmHgFrRVQdUWAxYUbiq7GXClBSVUxBEM2z9X/RvMdgxtSD79iga5SmMQJD7AI9yfqOzk9njXznJ7yaWwQPmsmMsezIGNIwrC3H3AJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 17:18:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 08/10] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Topic: [PATCH v4 08/10] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Index: AQHX7FeZb+/3TX1n7EW9KYtAkSYZWw==
Date: Wed, 8 Dec 2021 17:18:21 +0000
Message-ID: <a9e56354c98463bb7a741e869700459cb3c65609.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3ae390d-0861-45db-02d3-08d9ba6ebc7c
x-ms-traffictypediagnostic: MRXP264MB0823:EE_
x-microsoft-antispam-prvs: <MRXP264MB08230900ABDB7757F9545ADBED6F9@MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ENUghyS1DmrofjT/CTeoKkLPf8F+whxyMAUn3lGq5qqIyeZgSyT6RmWRlYoVca4jAOEJc0wr/kqjv3ehpCYLPfbiCID8eldnpJpWsvbwtQsRhmkwVKyV6LH+iV+Hgvp87t5mGCR2NTtMbHvHDQ+cLMf/+fhoeq9LjO7lt5Q5XBTROy/QEMz9wynBuef9ZF9le2PSaZ2l6b3y+PLCUrkCZEOUkXz8gTas1R1YFinoDYk4TXcbR2nKUR7pY+j6mYRg1QPO9m1+9SbC0+JfX+g7qby183sAqMsLFL4tL1iGnXebBkPGXM8ykRh5k91g9y7I2ZfwWe17rgagnssIsv2rus69VhRoclYm6YcJWJ0Z5Rs1LRxvziHzWiMg2GYjdSC9vE+m62w//duNFvuJQGzLxGE8tYmfxKgilEImjhFpRB5uFffto7e9sAi+CpJZaPTFxoVcTjF5uCL2mIvkcNZc4p8PGqRdCTFMvtZhLQli4iiiwmdr2Y/EB/8lHyg5FiT631ssnZYb4RqpHeSQykrbqNV+E2GbZv004aJzGyftx36k1CgOJq7nFZQLcalYlqLanAmNVjpEaVGLfQ6sEmQjNP1TJce2LHeIphYyDi9IPTZs2zr6tXMAXtMBgZAxK5fLTTR9f+2Dw+yU9l7tLFqoY68P4iOAoIjAvdx04tIqTehYe3mH2fxrJdiUS1dEkwNdK2NHmc9NH/rP3j43s61pCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(83380400001)(6486002)(2906002)(36756003)(26005)(110136005)(64756008)(91956017)(66946007)(8676002)(54906003)(86362001)(44832011)(76116006)(6506007)(66476007)(66556008)(6512007)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(122000001)(186003)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/scOSMs6fldDoeHWFuInGPQFb8mFx3JumMfg8Zx0MC6d48flYER8dQ0Lnd?=
 =?iso-8859-1?Q?rukgiNWvGlP4SJ8ZRyg/ihHpz9rZ8qetYREPn8smUlDdEYw/IouogmsJJ8?=
 =?iso-8859-1?Q?XQB5o7ygN4yj/8ylpTBjdZM62OOKo76Z2rPKc3dalC6b7Jc6zEEEvDuUyf?=
 =?iso-8859-1?Q?RHc/ElgE5eojYxFHY05vZO6xBdtj4MPCHfduzA0dl3cCZbextH1eJ71wHk?=
 =?iso-8859-1?Q?xWpZRBVroLLhH6ie2hM69SGgaLPImRhaldN21cgZWPb/RpIlnfDgnPVraV?=
 =?iso-8859-1?Q?zmvf+rt255YfbEJH4i0vW1511GMW46v8fXWRyitTTc16CoOPSe+UnS86WZ?=
 =?iso-8859-1?Q?CKnuIZkn+wM9xfHTkrMtLBq8GzM6+SwOHo3aTV36x49eN/n1zyqFdaxpeJ?=
 =?iso-8859-1?Q?tNI7rLl1H2yUZtf+7bXHS5yMwcM0P9P6RaNmEsj6WuQYPPJDt3g0TGPdy8?=
 =?iso-8859-1?Q?JEvaV3aNI3Px7h/DBy4QnnplpoCihlncrYzc8EjtOfpp/Qc2XiyIlClmuT?=
 =?iso-8859-1?Q?SIIiK2CLcEjtTyay29c6SuB5PKDuDuxE687p1ACnDIcPV8tlxs/+vijIAe?=
 =?iso-8859-1?Q?543ealbQx8cn7I08YJ3AZXzwowW+G279W+QFBu0VOwZ2QNFbQtBivjwazL?=
 =?iso-8859-1?Q?VOKf+t3DeRxcJSeoUODAW+0Ai3RJ0Y+PiTIH3XGKV4C13/ammYx/hRU556?=
 =?iso-8859-1?Q?WfITV4G+IpokfHo8D53ArbgAwMo9dWlIlaOoD10tVCaUA5bgkzI9gW43GH?=
 =?iso-8859-1?Q?/53hJM6XglKRLMOo7e/M4gvXXh+P8K8Wj+/IZxyzuWPXqJha+UxvxCIw72?=
 =?iso-8859-1?Q?3E5MdYu0B/KnnhFSeWFquPrihN9M9VutFfSad9yMFpHvR39mR07J+ncYOQ?=
 =?iso-8859-1?Q?Akpob5eGKNnZhqm6H2H1fkqB9Nmk2eD3nGSxy0npsehxkTb5xbpLoftTfR?=
 =?iso-8859-1?Q?XqpGJ9Wn/2ghV8sg8S7omhMbKBu2y9yR4XZh2jZyK0GEtjzSxP8XdyRhFB?=
 =?iso-8859-1?Q?WA0hXuacUkQTRh6P23BTE8qAp2qSzdtD1ozH12Mt3DXRe7dTXsIU1zY2YE?=
 =?iso-8859-1?Q?CFXO2SI3R+oei2Wda2s4MjXih/be2V2YDdvt9BJVE24UGchtmSNBN3cSKJ?=
 =?iso-8859-1?Q?BsjBOl/TmQZtD3C1AQ5BimiDFUVBbeHxHy4g7lEYXim/XMItrz1INuVGE/?=
 =?iso-8859-1?Q?MRfFQ9y4HQS5dDU0UuIrsDkieyuK1NQl3Kd+kVU5TxZBKroUsnfr3CQcfR?=
 =?iso-8859-1?Q?OpJfwHIPDBlcaw96BMTnjlijP1HEWY5FaLf6MBnH9f8+YrPYWdiky3mTPU?=
 =?iso-8859-1?Q?a132fxTVNozKqkoIXdr1gqWG57Lj5AVTB45hJvlY+RxUviUIHMwP4Z0Idj?=
 =?iso-8859-1?Q?5qYLlgR01e+30yhtOn6CdZdTZbe1wUqIqi6NEYAQPzCVyhLE7aKhlsbRhJ?=
 =?iso-8859-1?Q?KFJRQPxclzuzJ9hL1KoeTRn6411zoTHMtKQHxBGwAtwtzGDfNhcdt6yEFo?=
 =?iso-8859-1?Q?l8H224IckYKOjHjgCZooZYGrnTy88pIe78UE7r6RQZjC6Wa8+cLlStWZxJ?=
 =?iso-8859-1?Q?V7Q1EffsldZ7NRoNjerOJDlM0Zt3fgaHz4GazEIdIle5SiDlbwXXiIxpmq?=
 =?iso-8859-1?Q?K7ACEFBoLvv+bNnTQ2G9H/JTEGoOxQpr2kcyie3mX4H6NPWZlvlpdRd38Q?=
 =?iso-8859-1?Q?FCDhQcp4ekNtMsmOb2z1m1twfLtxuuzcqcYOqvzqVGjd3lql+3GbiXfugo?=
 =?iso-8859-1?Q?Uas4fLcG723v8Tg1TvTiCRxac=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae390d-0861-45db-02d3-08d9ba6ebc7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:21.9823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha/Nl7FLp3/Hr4FN/njRChDUEPjhm3n1UMzMv0atpK3hFiUtVSvVQBDLx4Z6WQ/2cxmBpH2Xrs8nKWc5mB6N3FMHuUfxHQ7nk5KmOz6mMJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0823
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hugetlb_get_unmapped_area() is now identical to the
generic version if only RADIX is enabled, so move it
to slice.c and let it fallback on the generic one
when HASH MMU is not compiled in.

Do the same with arch_get_unmapped_area() and
arch_get_unmapped_area_topdown().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/mmu.h   |  6 ----
 arch/powerpc/include/asm/book3s/64/slice.h |  6 ++++
 arch/powerpc/mm/book3s64/slice.c           | 42 ++++++++++++++++++++++
 arch/powerpc/mm/hugetlbpage.c              | 21 -----------
 arch/powerpc/mm/mmap.c                     | 36 -------------------
 5 files changed, 48 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/includ=
e/asm/book3s/64/mmu.h
index 7fee46e50377..310ca3597d58 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -4,12 +4,6 @@
=20
 #include <asm/page.h>
=20
-#ifdef CONFIG_HUGETLB_PAGE
-#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
-#endif
-#define HAVE_ARCH_UNMAPPED_AREA
-#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-
 #ifndef __ASSEMBLY__
 /*
  * Page size definition
diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/incl=
ude/asm/book3s/64/slice.h
index 5b0f7105bc8b..b8eb4ad271b9 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -4,6 +4,12 @@
=20
 #ifndef __ASSEMBLY__
=20
+#ifdef CONFIG_HUGETLB_PAGE
+#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
+#endif
+#define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+
 #define SLICE_LOW_SHIFT		28
 #define SLICE_LOW_TOP		(0x100000000ul)
 #define SLICE_NUM_LOW		(SLICE_LOW_TOP >> SLICE_LOW_SHIFT)
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/sl=
ice.c
index e4382713746d..03681042b807 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -639,6 +639,32 @@ unsigned long slice_get_unmapped_area(unsigned long ad=
dr, unsigned long len,
 }
 EXPORT_SYMBOL_GPL(slice_get_unmapped_area);
=20
+unsigned long arch_get_unmapped_area(struct file *filp,
+				     unsigned long addr,
+				     unsigned long len,
+				     unsigned long pgoff,
+				     unsigned long flags)
+{
+	if (radix_enabled())
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+
+	return slice_get_unmapped_area(addr, len, flags,
+				       mm_ctx_user_psize(&current->mm->context), 0);
+}
+
+unsigned long arch_get_unmapped_area_topdown(struct file *filp,
+					     const unsigned long addr0,
+					     const unsigned long len,
+					     const unsigned long pgoff,
+					     const unsigned long flags)
+{
+	if (radix_enabled())
+		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags)=
;
+
+	return slice_get_unmapped_area(addr0, len, flags,
+				       mm_ctx_user_psize(&current->mm->context), 1);
+}
+
 unsigned int notrace get_slice_psize(struct mm_struct *mm, unsigned long a=
ddr)
 {
 	unsigned char *psizes;
@@ -766,4 +792,20 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *=
vma)
=20
 	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_star=
t));
 }
+
+static int file_to_psize(struct file *file)
+{
+	struct hstate *hstate =3D hstate_file(file);
+	return shift_to_mmu_psize(huge_page_shift(hstate));
+}
+
+unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long a=
ddr,
+					unsigned long len, unsigned long pgoff,
+					unsigned long flags)
+{
+	if (radix_enabled())
+		return generic_hugetlb_get_unmapped_area(file, addr, len, pgoff, flags);
+
+	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
+}
 #endif
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index bfd7f4af1e58..eb9de09e49a3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -542,27 +542,6 @@ struct page *follow_huge_pd(struct vm_area_struct *vma=
,
 	return page;
 }
=20
-#ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
-static inline int file_to_psize(struct file *file)
-{
-	struct hstate *hstate =3D hstate_file(file);
-	return shift_to_mmu_psize(huge_page_shift(hstate));
-}
-
-unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long a=
ddr,
-					unsigned long len, unsigned long pgoff,
-					unsigned long flags)
-{
-	if (radix_enabled())
-		return generic_hugetlb_get_unmapped_area(file, addr, len,
-						       pgoff, flags);
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
-#endif
-	BUG();
-}
-#endif
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift =3D __ffs(size);
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index 46781d0103d1..5972d619d274 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -80,42 +80,6 @@ static inline unsigned long mmap_base(unsigned long rnd,
 	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
 }
=20
-#ifdef HAVE_ARCH_UNMAPPED_AREA
-unsigned long arch_get_unmapped_area(struct file *filp,
-				     unsigned long addr,
-				     unsigned long len,
-				     unsigned long pgoff,
-				     unsigned long flags)
-{
-	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
-
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	return slice_get_unmapped_area(addr, len, flags,
-				       mm_ctx_user_psize(&current->mm->context), 0);
-#else
-	BUG();
-#endif
-}
-
-unsigned long arch_get_unmapped_area_topdown(struct file *filp,
-					     const unsigned long addr0,
-					     const unsigned long len,
-					     const unsigned long pgoff,
-					     const unsigned long flags)
-{
-	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags)=
;
-
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	return slice_get_unmapped_area(addr0, len, flags,
-				       mm_ctx_user_psize(&current->mm->context), 1);
-#else
-	BUG();
-#endif
-}
-#endif /* HAVE_ARCH_UNMAPPED_AREA */
-
 /*
  * This function, called very early during the creation of a new
  * process VM image, sets up which VM layout function to use:
--=20
2.33.1
