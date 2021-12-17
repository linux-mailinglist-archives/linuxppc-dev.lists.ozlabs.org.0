Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5A4788F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlfh0xBFz3dgK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYl2jcfz3cW6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj4WaMHDie+k/jFA6cDTuNQceOOHHcPIsvVlATUAdVnzTLzvuyJb07Vq3+tdNHuP68lI4Dw+ni4jlq0A3u6nIaTMRumtlvxlTlYLk75+Cpz+8Cz9lqQaTSaAfOb0G9svklUaXKpwebpEbj8IAhPS0oOqneR2O2Z1g+6G6dlOZrJxzT2aKICVyK6OsNX1m05KSjfcpPB6uyTRd0ticof4QzILT0KgPTasPRnQ6XEOCo0Z+6GkYX26OD5RnXxdmQWi68kmkjGFkW5bBhZ2RGLJaTgiLW7NE1TAxCs/X58tXwYjTEvvzowFnh8Y85AP3LbU0jYyaBQgwg97eaTCkJUYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdCjHKP9l9OBJ5gDlZQo8deltmcwCmBmFWj0cSPtgCE=;
 b=WoEtlLTnChvKOx6ah3mb57cqAgqRSEMeli7CTHJcQfpv5txgf1deaCYDCqzKsUpvpk8aLUQwXtDGm41RKgYtO0n3LJKZ7RxWb/xElC+8NaNlGr3FvaEuZYqUnDwczmvKfWt6qZO/0XUo5Ab0i0oUZAe6eDLI7GzvwfLPlMjTg5vhocM7K8m5X4j8ri06sPilt45FsjBAzUGUJcTzn9hKgyCcyjjthPpJEHLepLuCZPiHiH14E09ei1pA953Kli3DRsK6G+uPPWbvBmqF4zPFclCICvPJOXEMP90xdg3xApl7mXWy8oD2yRe1GkIfT4+52ewJGP9UE+dn4CRZh8hi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:28:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:28:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 11/14] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Topic: [PATCH v6 11/14] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Index: AQHX8zDI/14Dl8nBOk2wrm2wRtwUxQ==
Date: Fri, 17 Dec 2021 10:28:07 +0000
Message-ID: <f03a1a863c19bfd2ee9c59e291ac744666ddc8d1.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0edcadce-fd1f-48ad-bad5-08d9c147eaf8
x-ms-traffictypediagnostic: MR2P264MB0146:EE_
x-microsoft-antispam-prvs: <MR2P264MB0146D2271F66F9BD8C6B681DED789@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q7B1mFfCyWA2Nt/7Y6C8T+wSmRm6dKy9c500w7/NgJO5zO8owcIBW+WKu3C62V6p5a4rD557pvyXbfzzdtQDSwLuRNmTPf/f5DD6VoNa+KsJOz7mnbtLkKtDrT32TclC/W5GRyKGK20EBd+iewmo5ZLBsVvwAt3T87MCehL6gfl0WPAmpZzC2AUeb//jA498BxL2/YZZybUbTuDhsrMN6uoRcAKRjS24byg+kGAfxt9Ch/PHZJiKs8ORWxpzReuSPVRbQCDx1PzsuBku3BvccjLNm+mPsppQD76hpLA2vjODwqn8sSdNPhEruB16Rv7pXwH+B0Vej09DVUPg9d+La7jSwgOtrX5numdj6aWsLd55z/0Bn6E+wqWZX0YmSAj2s2o/g3KHj8i7TU7o7rBIgAbdvp+anmUkvbGPH9VCeWniX+6BewELt//Pf1dCzM3OQpn/5CKxcyVI1VF3F/SHYUzFaNxzbP9svHmIBTEHlMCYvXgic/70rs2GCLjTogTpM4NFl0KKHt1I++CzUftvM/ux2wUfd0yHNFD8M6t6Y6AFxpvlUCML96yigUBG74sCm+aKx/QA/LgGQH9K2WHjxi3fFL9gKmM35mtP4AogrosHGjz2XcY5at/nJINg0dloSfLAreTXjw63VXaGHt7pnXsBKPWvWgfvXRXM7t9sWAEnzE2l0HviNPF+WBjeen/BMxMXGP3fvmle04cDrOnhjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(91956017)(71200400001)(86362001)(83380400001)(66476007)(66556008)(66446008)(2906002)(64756008)(38070700005)(7416002)(44832011)(6506007)(76116006)(4326008)(36756003)(26005)(2616005)(5660300002)(122000001)(8936002)(38100700002)(508600001)(6486002)(54906003)(110136005)(66946007)(8676002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AwH+UwICfGArYmEv4UQYEHsgXiFTtJpQILGSuc1m5Je1aZroqoqJ7CBt6o?=
 =?iso-8859-1?Q?1HoV3ArgcCm2h1/CK6gJDff17QGHaj7ypKej96NtcmUk5t0jNxaGyEbF3U?=
 =?iso-8859-1?Q?a9+7KcBM+raG8QACgFOykZUB/K56NC3dQCG+UH71ti3XZ5YTBRkk3Wd6fw?=
 =?iso-8859-1?Q?wNzHIc0NWZSsPVLVDQ3i1icONDhJ58IIHk/2sWXL4qmBm5Y6QvTH7U3RA5?=
 =?iso-8859-1?Q?Hu/2HeO04LscuwQdApxf4LzslYxQO4O2twzOk/wily4f4TH30IFkYH2NyB?=
 =?iso-8859-1?Q?C54k9OZKeAWXT0Nq5BkZI8HYV4fmV4s4wi5DZnyz/FUAFKfGRjkxCr2hlX?=
 =?iso-8859-1?Q?tP9VV9mP1Guplfn4lNheNIBR7aMcoZISKxK0/siih5bBpBHfGGCgoklUkw?=
 =?iso-8859-1?Q?sdsiSlXesfyWbKKuHB1K2Hnt4hY1M1/KT/5WQIfTGYgdNDxrXlUbx2CjP9?=
 =?iso-8859-1?Q?wQk3FezZTNxvmkrqa83Aafn0Vogmg2ocHIBveiabmLV4DrSsQyaZ6zTVR4?=
 =?iso-8859-1?Q?Z4XI3uJrUnI3Lgds+jNSJ313LzPJP9yY3IDNPFXjwzFsPJ0DPLwJD6AfsU?=
 =?iso-8859-1?Q?QYmkrksmv4uZppEr+nzqQhTIOWiU50z/CezD9iZBRiF6s51q09vyntIHop?=
 =?iso-8859-1?Q?sD6fNuxvabmSHlwCUz2aDniNZAX2qmeEodJMIt+XdMVzDIksN7l3GYXi58?=
 =?iso-8859-1?Q?+LGeIvK0tykcaa/+evar9S74J29yQPZwIHOFTAMDSBL9ucGXlyAXTbckON?=
 =?iso-8859-1?Q?ZMC3xOylJguPCKmS9rOg5WY1f87eRXv+2e2Ma0gOeEbvXv+AxUbSx/oidG?=
 =?iso-8859-1?Q?j8P28wD9UVa2WQOPckqR698xbma/nTVgGy8R0+bGT+yJ+GKSGsNSmvsGcA?=
 =?iso-8859-1?Q?ZQ87oeCDJgljdpWFuJ5ba2juVoAcdrc0HASGWuVe+8OTzzqajU5+sep7FR?=
 =?iso-8859-1?Q?3vAliDRCCgUf5UasEQ6RkUDGBDA5z6HFfW/XwNXMxoTi00UwP0oxer+Emu?=
 =?iso-8859-1?Q?JLp3JbIal/w4RwHXkXL8oxFYib28BXDfUQ1XLy63BS0RyX6e59+O2dwlO2?=
 =?iso-8859-1?Q?EMuqHHO42XcLjdFZkzEfgVZ8Qip+QLLfS+dSnyBbBKsG0bE/qcUBXE3OZk?=
 =?iso-8859-1?Q?/6F30KFZXVN7vqVWNzsFvyKr3S8JjWsRJkXIOfbN+37bxEh8tSaksD5J6Z?=
 =?iso-8859-1?Q?78O9TdcsJ4ne0+rKPcjchdIMsNkOMv8oR5zzshOzcp6oO/awKkn0ujxpQx?=
 =?iso-8859-1?Q?wUtqLrTNPbXKi+hLEP/Cyb7tWDTxphzbC79QuKa8SRMSNS17/1j+ymGEvP?=
 =?iso-8859-1?Q?6W8S+lM9yu6yvO5EJ059cEcy/qFfvVM8hv/fYGGj/Xh8daftNBaAwQZ2mQ?=
 =?iso-8859-1?Q?QUR0ZFp9OWmqzyTSt1L4smC3PdVw3clb793hCik87Le7XadIz2zqiEfTar?=
 =?iso-8859-1?Q?yQXDEwYtdQ+J8xZs0ssLY5ZuGSlDIGxVcjbSe+0R3IXFEUt7gFY8Wviry4?=
 =?iso-8859-1?Q?cFg4cb8hn0I6UD28nV3HjS+gdCfrX0PfpFSkEtpA9cVTMBxGwhHo1nPf5H?=
 =?iso-8859-1?Q?6xRqViRh7SSwWoCJsyDNTTapcX9wrZsOZziqwLn6Y84d5gT1F5EzRe0aJh?=
 =?iso-8859-1?Q?YiVexuCgz6uSErvX7D4wr7oyfmBC59/99CZ/00j1fj7JxgHwZl7N1a8D7d?=
 =?iso-8859-1?Q?4AALpL2mf+ngOtML0HP8cffxrhHDCfqjYWC1Jon6LjPX5A4k+1QLyPoR8f?=
 =?iso-8859-1?Q?SFHAK1jyhehiGGNVgKFY1dAzM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edcadce-fd1f-48ad-bad5-08d9c147eaf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:28:07.7862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGDDHUEs/9mMLX5YWldlzB13M0N9E9LimFds2EioJsxNWcUiI+W/Toboiaj+HX2GT4jhFGqF5zv+d4NKhUgwoNV79MhOOaYf+/Q7PpFAChg=
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
