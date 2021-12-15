Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB447532D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQq635NVz3f2K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjw01Cnz305j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qdh1OFQ/hFEVvIs7Pbz3bsXCk4DHECsZ9puS+lymWDgCMjhvem3rKHy9MAhbWsccM8HeONg9DXmbt7x0grYxYPBQkUGb2bZ9nhfAyJPCqChlukAmO8sPiB0J+7G0kd15nxiPu39oeZ2VCxdDTJs8Roh50009ukH8oNModDhcZzpLqWeQ6LGxOtc3mSXTBx3PGU+mGsiK+hRg6hJeAA/BcrQw3iDivG6Z9zHwzZiTjHOsRVRM1n5j2vBdiCDoX7wMLG7eGPVRIhcz6PPXp4CFWWIEr+woibBFr8N8D1zuYf3B2x1+rASa9USyvcI6Szl75WeSzGkmnVnoELeKPeIGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdCjHKP9l9OBJ5gDlZQo8deltmcwCmBmFWj0cSPtgCE=;
 b=cJDKGo+c42Z348GOCVWVuQ4zCHV33E04EN2Sm94CbyOiG6Oz83FHyj+0+5kkLYnytZwCx9OQU/kKEOSMB/slJ7I82Q1wNe2qoztDR2hqA78aJ+HX/sDSD5TM02a7bqYQporOfgtr4LP5GmQZKdcTtj+P8X7trzCl991Am0yID1WCyDRZnth9TObiLTPqiED+nH0TJmXsEgWrvywd1N269QEOT80JRAPzxlY3htZ8FPOffRjDNffnxZKdyY7Y+Tsppf+E/0AMaYAsTcOY3gOwwZvBkJ+ZPbYLiVbxyf7SiKjNEhhXdWZwZ2yjHTCkxsJhXumHvTOXxwWW3048jnNopw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 06:45:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 09/11] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Topic: [PATCH v5 09/11] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Index: AQHX8X9PfJMd8arIBE+k0k9TTXOCMg==
Date: Wed, 15 Dec 2021 06:45:13 +0000
Message-ID: <510046d11cc0d5da800d9bdbd9d4ac3bc0a605a8.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7723a19b-edec-41ab-2773-08d9bf967277
x-ms-traffictypediagnostic: MRXP264MB0311:EE_
x-microsoft-antispam-prvs: <MRXP264MB031187752448F773838DF92BED769@MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FE7A4ulTpvjfTq9lmcnyjtJzaGw76Yx6pZkfIav7678rRCyJlnmylhRwtHekoSak9JcnRhYwTNWE5+ElWnPnTOTcK73/qVAwMe4r2rOWkT9PecsO+Rty+azuzJy62U1x924yfojqzJ85y/XzvE+szGYLa0S4lTK7vNBxFeSI0y6vlLM7LgkusdifR7A1PRBpZZizri2kAV8wfgFy7qCZPj04e2RgaXDWBGJpqx03Xouz1jnxPXawuu1OuN/wpQqjR9zCh50kwmoeqhkjCtkJpzpOm/oMHYCcc7PqCf4TlfQzxdLcJWgBSXXR5OJtICag5Z5zsAZpripCyZE956tDr+KH0SF8ssi5YQtt2NLG6nKrZyeGMCAqBtAs4vulgX3XUxNpSoNzmR23dEK7ACmcS05PLj7uJtl+kF9amRWUB8lWtiChhNnh0OfMQUqlN9E0PyFZYaP6jqEeZfw48YMAvK4R2P9tV5rr0PZkZzHm4HNrDBL6+uBPr0bU8vhKh9KIGRQGrtFQNg9uL06qf2Q3MVSefL1URqG6XBBAwIiZxeTWO/vfkIBlSXhPLpaZaKtha2h43lHheQGg6xDHDx1wIE+9RERpuwy6ZlVyiOMXKiHSE800sudWEKhVTiMuy98m+TdSR5p+0CMyf9o9TwvyiMi/keE5saPHC90Sx0fR8uC3mdmHzssg/euwqFwXZ3F9WW5JqSyyxHNNF44hzdZpjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(36756003)(86362001)(6512007)(83380400001)(2616005)(26005)(76116006)(8936002)(71200400001)(66556008)(66476007)(66946007)(64756008)(66446008)(38070700005)(186003)(110136005)(122000001)(38100700002)(316002)(8676002)(6506007)(7416002)(5660300002)(91956017)(508600001)(2906002)(6486002)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yqTnmyqVRZbbRekppizezaN1e96udt7mWRpmR+bNpl8ZpG3lN/x17lJdpF?=
 =?iso-8859-1?Q?DK4N6bKgV7pugiuHQ/P+/KbBmUhbA/wPPvvcgQiOwrAjAIvqlwPdrhCfe0?=
 =?iso-8859-1?Q?WBsThBnrR8bViAPC/1vN/NBojI8fBmdFZrLKDHkyrm8i98kBtaGRgeVj7q?=
 =?iso-8859-1?Q?QPLdbtoBPFbhXwihbeFHU9JQwLKc+iGwJNiav6DUOtjIGnNfj0XE98aceU?=
 =?iso-8859-1?Q?d4r9QlTw1P5pvzE0CVo6uGwRaNuwY39v8492xh4gWE62cEtY1aRa5Uhg/E?=
 =?iso-8859-1?Q?lp0HsQc1ba7alzeNvnde+9kL8bW8ITM+LkPp/AHwpfcM1inG/5Ae6nywBX?=
 =?iso-8859-1?Q?mc56Saf/TmC9lyd/dJHP7AsKJJ8d9loMk15gYDBLegbbHlmiTEQ8kwDvCZ?=
 =?iso-8859-1?Q?UNlMmjm7g3+9vsZ794t5mVFWz99ULOggqWwWg12E6Y9F0LpQ/oWQ77sZCK?=
 =?iso-8859-1?Q?WlikltiUVDtkWH5fPI9ex0MtqPy7iTvLFiAa9yEdscBzhdWpx8eLZZeYzc?=
 =?iso-8859-1?Q?u7Cy3jp0HXz5+peSgZXem7H1Spls3LzfFNwMklRNauwJioWWzFHkMWd56w?=
 =?iso-8859-1?Q?GkboZq22EtTO420QJWu8CDFAV1B3E0APMqvLBzG5GHkmCxGeFOYKhyO5+h?=
 =?iso-8859-1?Q?HCzs6bYghtIdkIUe1zd1l266iRV7uhwxiARbs2G/v2FN0P5JInI9rLTqRX?=
 =?iso-8859-1?Q?FwqN0dMj5t6XL8GamvOvCJdW5s0tHbAPURhPEzF4OQoHflDiYI4LW4UhME?=
 =?iso-8859-1?Q?CaczXrOcS+wqLKZZHv6UNbktwdvotCCl64aCPJa4IAmM3HD+PKHiwz3lxJ?=
 =?iso-8859-1?Q?WQH58X6FGRB7vtbZsdADkclynSHWRf5lu55gwTC8a6RNny07mgc11GUdEB?=
 =?iso-8859-1?Q?++p8qKJN9iJq7hrfPS1syzOPOsPiwd0BbzCmshBLn/5I+ynuQ89IwW8ltE?=
 =?iso-8859-1?Q?chQS2iHKSkP8TLeTXc6jzzAcrkz9jCA4rJxHxHm0Z7MO7T/p2+igoH2uiK?=
 =?iso-8859-1?Q?HvBRwnU6Gp9Q1mDVSCDHv6bSw/TPLBlbgqZ9aIXnUtUxC74Tnrw50WEKLg?=
 =?iso-8859-1?Q?1qh+MhiEesVmicRr/iq4WYQaaZJhmjjKnlzbGo6wJUVLzc8F18pFIeaTrl?=
 =?iso-8859-1?Q?HMg8d1VYdRgrIYeh6he2aRUrYlu2oOoJFyG9sOOfGc5Us0SNQWxUGB4Zy1?=
 =?iso-8859-1?Q?OpPDwZi/yb6UZ2AgTdwBYoXY5YdWfBetGOHo5OSHI7K+pqP7aTXCpxRbE7?=
 =?iso-8859-1?Q?bXGY+hp6P2cGf2xL1tow535+9Kmw3wceAUkC7qGdnAJnuqvNlUYb0h5kxS?=
 =?iso-8859-1?Q?nZtnVPn/MyfaOYjK3Q4JHZncYUM/xK/gs4iQ/MGeEqBWBlvRDyYmDDxVmf?=
 =?iso-8859-1?Q?fNS5f+VNCN8q9enwmeJg/iSQ4agPb+2AVVFBP2bKW4nzrkh19yva+F/Zjs?=
 =?iso-8859-1?Q?KuMD6GTq8qfbxJRqoQO5SF9hn9opHjoaA8lBg5JKLmMMqAZkK0AN6+iimE?=
 =?iso-8859-1?Q?SKUixYBLHfASQwgEWJBANvA6uAQQbPV9/LXFyZSVFvWbwojAkL6frczpgF?=
 =?iso-8859-1?Q?6G6X4mpOxhLDY3IyhPAHwsj0sjnC1HG/9q/zzAEt4U9xTcix6LZ/TG9LYE?=
 =?iso-8859-1?Q?VvfXLJFmQOWLglEX7UPCzgxxsgw88lYT8/83hrKGD0jrJ9CBJMM3aAlJCj?=
 =?iso-8859-1?Q?3zOc52fL7QtmkBzVwqReGQZpCdO9BZ/CqKPAPullTdLtINSTiKOzjLFaiN?=
 =?iso-8859-1?Q?ocUmScRsT2fzScpv5/YsDUg70=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7723a19b-edec-41ab-2773-08d9bf967277
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:13.5350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVbILLp60vu25x7ojZvUNTt4Qmq6401YdRxKOxtZs2gKieBVtZovoM8siJX5oq111HPP+JMFMnEbkB+OdVni2F0dn+euYGppxpRTqzl2siM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0311
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
