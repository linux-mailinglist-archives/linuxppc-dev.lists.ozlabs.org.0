Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6297447532E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQqf1jfYz3f9H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:50:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjw2Vtvz305B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxhXpEo0KVuhbn/gco8LAuRDr6AxRT/b0RzP/dYMSi45GppTv6izyOctZCcPH4WKSFMzjp8jyHgQpyhFmwUJzdc7f1tVb7MCBIjZ0tI0FiTx6SWwVY0lbN/e0s0ECZv3N32C+ihOOtc9v9YQer1tSLh/1bGRhWbRxr5SEJNvPjWtRn0QaEtO4mphoSQO7pf6Q9660/o/JjV2XYikjp2tsR8XZNRRxPJ37QYEWCEKf5X12VUMzTGIFn2vLB4r7MqgQFue9hoO1dpj8UtADzlK8y5hhP9UDJ9IY7k114x9hdMcTwj+Fe2WW4eJWXcOQIdLbMSNvEfjJnwXk9Mi9G1Qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao0J4RtTmJCD5YE4NNN5icIYyoHVg3j5QWKaKWYo9c4=;
 b=Yfgrin3/elY+QYD9BZJWO5398zlmvBk2smLqz93p2ShmdqUuYXajPn9X7UcZxn89ujQs07VIjZ0+CINGzcXffQsh6nVh7QGe12ozqxaeW+GdfKFLO0VNeZbd+U9G3+yo639JrjQv3bOlq+N/Q/w0w0j4BvU1uioGIsxCDRoJyNFVBFg7kHNZFoiQ0kEn7p7gLN8edtbB1cJS84pXRfhNtPKqDEldDQ2rxqD/2gDnMfHo/Kj02Gn8jONgpArJOyq+58v2aJu+xCYXErEgUZeHlQUGVB4qJq8fdu0ASRknF5MO6oFR1IHcHSScaAwUiiGrowa1dMS4Sr54HRizEAZD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 08/11] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
Thread-Topic: [PATCH v5 08/11] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Index: AQHX8X9PFl6iCMIDuUSKEdqOR1hcJw==
Date: Wed, 15 Dec 2021 06:45:13 +0000
Message-ID: <7e151023284051a14ab088b9ed284efbac0048ef.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff287c5d-3e08-4498-ae14-08d9bf96724d
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB214779138458E54251E8808DED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:246;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ycXG95SEtS/UWrhfk0SOHzD/JukAaQ+jaP8zblcg8MtnLyMl6Mm9UIEP5egiuroSDsT0u4FNCDGkt61Kd3nul2wQ/QgwgDjlMZEYixhsVVB3NGru0cPBZxjNsGgb8MxqhM40NTiNHEmPbJq07bdScCh0/xVvl/YGluTxb2DaqpJdibZ0CNUQd+M7oOySKAzBgutIjs2ecBRVH/p+RxNMlAl4thaam4nsCJfUVu1fzf93fABUtXfmBFs4KVpa3C8hX8Bw2RVAD6lXKuysp2pv6UfieE3TItchpRTf3oriyK55H5dY1Yp9oS65idZp61cJk5lW5wHwnqIpBiQNvpxUsxfksJ+3AnabyG/meaeqIBihAJ+w2LCKgjuzw/cUECL8qVJcr6RaEoSt3RCxUD7QnjRw0qzlumajQvHy2uoovF7rEqRWSStzSlbKJ8izoED3f4w9Io49Zl5iaL04Lt4+NKmAhGIATCoE/Hg8Xy+kxatRTFG065qFxWHZTAGeZhIJ/vr8u1IcD9w4TYg5zScGm7zsv3gWuxRIZQBuq8sLnJWpbhJ0dwHfa6sdmEXPl8STOr4El2lIOsAHptYTaqnrqC19mWgAI+zEUGFh6szJs3gVrN/omZDRnqFvd8dCcqGTAD/ljKedCZdJRqV+J1Pw2SqSRQjssPjj70T1G9h7LCDwJIuXlkQk5OsSe1WZfT7Fm5EdaAr62Q33gBSQ7udb5bBmkgEwxkp/I3Ch1cYZarA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ywyzsHPr5oUQA3yBp06ga4vqgsRkulorVfLzvHs29P8R/RTglk/cPJIycP?=
 =?iso-8859-1?Q?2dJCJd6m21GuR81qQy7gUc6I+E0DcwOExHDDSwcKGfEMao1azAIFhj5cuJ?=
 =?iso-8859-1?Q?v+n6LsSKlWlQ0FMfF0LPx30XYBP1t9EhJMiWIrWKLc3EucHuwBeL67Nj7F?=
 =?iso-8859-1?Q?syTWq635gXFhCVZsBERnCSUmZxW8H773VzlvZOHdjKE0XNkbOmqZLl/7CS?=
 =?iso-8859-1?Q?fJ4diaovDI710ptGxvRV4+utJbKxoJ7gg4mZ2X8lzgIRhOtpN44ZPtEf1G?=
 =?iso-8859-1?Q?KUf0t56qqrlKvgBu2jdnE55H1GfjGt3thre5cDShg2RhQdcibdoOCTUgIz?=
 =?iso-8859-1?Q?dyXuuPpVcO19sJ1F1MAN/vN7pu4walb0XGsLh0nUQJAxqh6y+BuGLBkUET?=
 =?iso-8859-1?Q?BAIsPyIK4p+s2rD3YtxhGuJoKJTwsvS7CBBKNW0pvDJOxMqMHcGwKvXCoo?=
 =?iso-8859-1?Q?hIRvv7G5ZrfM+PxcSmGJIT13EbOS4gfIRiBNAV+hlLcg/NLrpTvKAyK5Uc?=
 =?iso-8859-1?Q?pGcjfEKnJgYCoiqahrB6F7+V7iQrT4rEnxDN6G3LnzTk5wkyxXEfNrYgJC?=
 =?iso-8859-1?Q?Fla/RN1moJAha0oroA1duyR+BBeU6dTREgAR/+L8PxaSI/1b0o4oy2pp1m?=
 =?iso-8859-1?Q?i1nRlXBfGl+rHiNMXJ1h+IvNoqI2yR67rL3dsuR3HfGGGHwVpiLanmENpO?=
 =?iso-8859-1?Q?IDgvzm3SKGglM3RgWYuVfT2Ow+AZrViLMZXAz9vIdg1aFCKo2LwbBhWmVA?=
 =?iso-8859-1?Q?Fsm+laLTDKX02kNIrAfs5g5+xozIv38ffa9bEunei1KPJt8wcVQCxu/kpS?=
 =?iso-8859-1?Q?v1VzqDCwuduwA4pCo3PVFYtGNGDXQ3bNwqNOQMJamdZ7n+t7sx19482LAF?=
 =?iso-8859-1?Q?VnGJjh+GHjzrWg0s0Uj4aj6xbTuwaUbAk7hQ+5uUbEky4/7ec7hCR+qXXJ?=
 =?iso-8859-1?Q?yMx9mWMjij3QcXZIoWvxOPjnslZRO0LJOE2Myx3EppL6eFXRrt/z6RFqof?=
 =?iso-8859-1?Q?ZmfR5Vp2kHAjxUQbL2lIv+bZZLfIW5xXjX6pMfpiA/TK/puvS6fsDaocx2?=
 =?iso-8859-1?Q?vyy8aaiOpcHe8GwxY4UYfcL+ispuoJmBWwiS1IZ/Pgv83CR+N2qlCRjj+k?=
 =?iso-8859-1?Q?IT7N1fQVIwQMcMAedR0L7Up2ISgXM9H0w572Fwct13j/upCVFMWn90R++T?=
 =?iso-8859-1?Q?q3AKFcxcRsFnK6MKUzWzhjX3eULE9okosfQ12TdcjcvXin9V+VCpP5Mz82?=
 =?iso-8859-1?Q?Q7imeRukrVTaQ9BJuRPyeY10Aqxc7ahD14tn/lA27i3m+a1WkHCciPeex8?=
 =?iso-8859-1?Q?9ZOdKMp+KV2vfcG0ReHJZ83ynsbVFOWw6Iga0ag3MjSwTKKvnJVy2lEiix?=
 =?iso-8859-1?Q?/lCZlzgLyk39j5ZANNN85TPZ0EVwAGkLiVmZ0+2jzpIMAzUV6a+Vv0XAbg?=
 =?iso-8859-1?Q?3MU+K92rdxa3tXZ5Hkb7eAsD4cZXOlE5BWALf7CmX6vJ1cJmbqnDT/4Lro?=
 =?iso-8859-1?Q?YQImxjNm0T1mRyqDwGD4FzMEEJ1dysgWztusbmAgQMzgKGO9GeZ2h0JEi0?=
 =?iso-8859-1?Q?tx5Ay91rhVc/LPZlOOQpEyxRMLidqUGx/IPp7arH7XotNKN+EIbH202q1k?=
 =?iso-8859-1?Q?xWn3/J625U8OiJa6TzV5bmNO/H3LinFOm/aGvGNsWu+NmgtH5HIwFR9S99?=
 =?iso-8859-1?Q?cYQ1mo8+8t0aenwDJNgs7OdaGDksT3n5C24FPPAbZK9B5z1V441vahaWAG?=
 =?iso-8859-1?Q?s2tFEFrNRubxVTVVDQ8XFGWFU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff287c5d-3e08-4498-ae14-08d9bf96724d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:13.2164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIZuM52tXLRnTk/v8R/6VENKgzPJvbO89NcG6xD8PqcuY1lEcR7egXq6PWmjh1or0vd+7O34kCq6yUY0aFrgfC5nG8g7idwLtz73lJn6Q2g=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the generic version of arch_hugetlb_get_unmapped_area()
which is now available at all time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------------
 arch/powerpc/mm/hugetlbpage.c                |  4 +-
 3 files changed, 1 insertion(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/in=
clude/asm/book3s/64/hugetlb.h
index 12e150e615b7..b37a28f62cf6 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -8,10 +8,6 @@
  */
 void radix__flush_hugetlb_page(struct vm_area_struct *vma, unsigned long v=
maddr);
 void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned =
long vmaddr);
-extern unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags);
=20
 extern void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma=
,
 						unsigned long addr, pte_t *ptep,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm=
/book3s64/radix_hugetlbpage.c
index 23d3e08911d3..d2fb776febb4 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -41,61 +41,6 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struc=
t *vma, unsigned long st
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
 }
=20
-/*
- * A vairant of hugetlb_get_unmapped_area doing topdown search
- * FIXME!! should we do as x86 does or non hugetlb area does ?
- * ie, use topdown or not based on mmap_is_legacy check ?
- */
-unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags)
-{
-	struct mm_struct *mm =3D current->mm;
-	struct vm_area_struct *vma;
-	struct hstate *h =3D hstate_file(file);
-	int fixed =3D (flags & MAP_FIXED);
-	unsigned long high_limit;
-	struct vm_unmapped_area_info info;
-
-	high_limit =3D DEFAULT_MAP_WINDOW;
-	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
-		high_limit =3D TASK_SIZE;
-
-	if (len & ~huge_page_mask(h))
-		return -EINVAL;
-	if (len > high_limit)
-		return -ENOMEM;
-
-	if (fixed) {
-		if (addr > high_limit - len)
-			return -ENOMEM;
-		if (prepare_hugepage_range(file, addr, len))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (addr) {
-		addr =3D ALIGN(addr, huge_page_size(h));
-		vma =3D find_vma(mm, addr);
-		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
-		    (!vma || addr + len <=3D vm_start_gap(vma)))
-			return addr;
-	}
-	/*
-	 * We are always doing an topdown search here. Slice code
-	 * does that too.
-	 */
-	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
-	info.length =3D len;
-	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit =3D mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
-	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset =3D 0;
-
-	return vm_unmapped_area(&info);
-}
-
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t pte)
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index f18b3a1d18f0..bfd7f4af1e58 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -553,11 +553,9 @@ unsigned long hugetlb_get_unmapped_area(struct file *f=
ile, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags)
 {
-#ifdef CONFIG_PPC_RADIX_MMU
 	if (radix_enabled())
-		return radix__hugetlb_get_unmapped_area(file, addr, len,
+		return generic_hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
-#endif
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
 #endif
--=20
2.33.1
