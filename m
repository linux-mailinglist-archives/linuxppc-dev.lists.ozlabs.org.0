Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A0495C4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:48:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgChD335Lz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYv2kmTz3cN1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpNTen02C54xig4Yw04LcbDg0a3G5H8CUmOalUT8BkQlga4uER3XSXO7ycLV3SrbNtHdg4TXYUdfxBLKYpqYRVxeiqVXTGZ33AMHM14auWV85FzuGqjIh0DODLsOpQXYyvq9bwafxl6dS9ZJD6WnPSi9kbP1JMbxo0L1Nl7aeOMnlq9pdWcoY6YtR9oe4wg4y/2PewPHypDoy4L39s03b5rWVJgGDCHqwqf7b3jdaW4sM9EvN1upOvC2E6xml5OT1pLa1Vfr8tH/OgIQqXdPeEZ/ZQVpQ8myZ0mPlgg5pL2CUkg5fTXFL6OiQ6knd557j9NWfZShXUv4jSGNELqkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGU4kvfJG4xkpoIdoZMTgYSWFbe4RKU94sIZkxd75As=;
 b=HPTIrA8LW0mNH3XbJy5iTPBI82ap2fI0diTw/uzwYMD78TxMWIIPKHiXRT894YUiXTCL5JP9lsRE6DU+QI3E9DvMu+d3P6kOWeHj9QVOQrUJtrXJwBK6rCTYQkQ8ByOPFdvlLP0UZ/8Dw1PNGE2WvLkIX4+F7M2vS3BTGSbvRnpd9SWxaJEMk+uHRuq+BsIXM6x6mwIRaav68fUee3sf3qfNb8ritC/3HWtGQFXRJa2gRCFnyANdo+s3g3+d1O6YDbXQJxMDL4rlAYmLBwS3KBWtmAZX2JAuxjg3mEfx5DByYgedYDIHvfniOKIBxfPR2HuzKyCQPo0RBI1kAHYV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 11/14] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Topic: [PATCH v7 11/14] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Thread-Index: AQHYDqLZ1ugDhI6z+E+ZOoMcYyydgQ==
Date: Fri, 21 Jan 2022 08:42:40 +0000
Message-ID: <1c083902be8813752bff297f2fb760bdc089339a.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45710015-d061-4663-39fd-08d9dcb9fbc7
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB0201584D7AB19EF351B89C9EED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pL5tnNjoW41rXCod5XamzHMQWNqpe4TcumrT/InYh/VSkn7vP8WtbDjXYy1NSxMaxFQ+DoIEvfgVo224vG9Dvh6DnM7PV+HKXH+qZmtWH+107Z9lVvsUHJmSMk5Ar+swsjIMImQP84qEtpDi2JqghVnClue9i8KMW/bSNRDXVXDX4+xEqNHFpAHB3vHpQZP8s56KemY1EmxmTP7QkpIfP5yXge5tH2ehEXjg7q1C0x1bI4kM5ONochS0Xy3TM6Tst+YdaiDWefGBOL38hxCuQxp07DpCfwWPZqoqasLnHH1/hpBXxYLO4TbSI5QvHnWv/Kr5MxKvLBgZDPsFCYJWkBaJ2WHdzIn7MfNZIKQL8PFiNSu/pYXtRjb+ASGbfu2MKylGokrl0Daw+A791hcCyyjSUgzzxXanVY5R+uWfCTpiDv/jyX6AxLRYgBRrlUmsV4bIUh41zSN/guqI+eDdIxSoBdv9y9Dts+r0Fscmv1zA3qAfFF+36uyXX6biQ4r7Whf5y2fbWDy3ovofJ9+yG34ktSuufIln2AC7RunEhU/Fi1wCo5a8Oep80xbt558rByGtX9K2moVpgTO7gIFs1njwAY4lQHv3Ax//m9AJeUXVSW++xCPuC9ECPG7ETaMOWSwWRH5uBNINSZaS7dbh0I1OHVE4Cpq5rTrfQqTS1wU+ZFt76NiBhV6lEl61GdJCdR6QZd0NWcJkVdgwQ4P1Iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4QpF/JTplOmNv2GF+OVg9B1cB1DASAY8fgKRlk9HnuNqqfaFpdkgycB0M8?=
 =?iso-8859-1?Q?qEXq0A3Iqiz37/WQwWISk0XucZ+sQhzxsPrtsYTwZaLmw0uGgXzRlyNzMB?=
 =?iso-8859-1?Q?L8Y9ydUnAC9h2kOTgtXfbgZ/Y14PvWIEePlUs7UBGJBHxMQPcBgmOpo1J9?=
 =?iso-8859-1?Q?TV1bWUWr9nZReUqQWr3l9P7B3vB6NQ6jaDRBGX61j2NlslnRlsZjRkVIT5?=
 =?iso-8859-1?Q?FLkOATThcjmb8+MnOfAj4J40Y6ezhPWQOP2TqfPExgkX3xqgRr/fx7Rzb+?=
 =?iso-8859-1?Q?BZ/rnTHk/7O/WqSS6RhVY8i8aC1ijii3fZf41DjjCFLWwqivx9kWWIrwC+?=
 =?iso-8859-1?Q?/eeJNgEcvN+JXPnE8a4andsFQ7TavXTiEbQcOVT0vskRjlgkHvJ5pR4bjs?=
 =?iso-8859-1?Q?HQWvfwkq47uU8uqz233drKMhwZYEwOmq8qZ6vfu8X6i68wBM0zx3wrWmbv?=
 =?iso-8859-1?Q?Byd0CMHwQ6gV175HcUhTX/3UcyjGEGZ1lbDts3m0cauUl8fvv1QwiiNbjo?=
 =?iso-8859-1?Q?UE2RDPg86wXFwaWtdAjZNPIW7fM3x/8TEQQNinLcfzA48LdYTzX/TC7MKC?=
 =?iso-8859-1?Q?ptq/peEYjVAfCMTaLLRrTv7OiecbT5+3htplIYFSTa3/tpF6L7dv866rqV?=
 =?iso-8859-1?Q?V4F7EU2KANq7ilL01HH2yaUjBSxKY82/opJB5bnlxp+/39NwgV6aqf29IG?=
 =?iso-8859-1?Q?w/5kLlAXNL9h+HBpCE9HGj748t+pgdlQ3sRe6x8oAib3Ky3aGvF7r88dSz?=
 =?iso-8859-1?Q?4Aw6uWnEac0wK4k4ndlRnjO/Ru3g4kVqY6Kk0kErFzySaJJLZLF1NFotoQ?=
 =?iso-8859-1?Q?d4AD9aXsfXGI0ZMQYjKySPO9/SwidU12GBYHfxp/jv8MlaxN43kVLig0uo?=
 =?iso-8859-1?Q?/iW9ErdPgnl7ZXyoaaoI3uHoqgurdoHOl1fXsygDP/vipQdO+21Ma8Ujki?=
 =?iso-8859-1?Q?SHObYxz3Rv7wTGYEH7X7CySDHW6xk62/7okQVNkgPsZo3Y4tajJEK/k1IS?=
 =?iso-8859-1?Q?fFxdPwKrkqW0VbgBEOGQbPV13A4yZA2eeDNQPPR3Eoro0qYXZm3SaVm5vI?=
 =?iso-8859-1?Q?Ky7uyu0PBte8yMfBtQiVz75pAdIiK9gjmMR8AacAUMItrRZeq1y+Csn54H?=
 =?iso-8859-1?Q?oGHaxEbR+beOCfvJ2+xGTpGvgJ3gC6GuZyADLPB6vXgpSseKfCdNoK8MBp?=
 =?iso-8859-1?Q?hGTc/ED6Vnqc+nfP1duUb2Yu91dV4xmqbJp5wg/tjBe1kwlsddrt/UHLnn?=
 =?iso-8859-1?Q?FptnaBcu0UwDVZDoGf9qxwPUFQ9wTC6DUn8aPt7MnEIO0AnZUn4YFbhk9b?=
 =?iso-8859-1?Q?Fccha6EdoAwr0kR/hGIvxqOJqZc1kVR8JOHH1xjDbe10YjH8KSmjp8SoZ4?=
 =?iso-8859-1?Q?woVdZR+9n49btLfdL7kesZ3E0ouHqSpFPiPSI/IP740dPYZkKsPSlaCoyO?=
 =?iso-8859-1?Q?0Q6l02WT/g4RyHZqROOGzadzcgLJZnFXMwfleIpvUgVlBCIqGccMDgSmZc?=
 =?iso-8859-1?Q?MIg5TeFwxNh4pa5k5Q5SnMPLuqD4cZabcE7Bnd2kXwE6G9GOlvzBBJzB4+?=
 =?iso-8859-1?Q?c6ITXx23IH8XmW38515UNkA9By4ZOtqeuHUAoFyHkFt0rDxysYS2cbh/MJ?=
 =?iso-8859-1?Q?BKFGtPTqOsCWY2lQ+vACCONHwTruLTGh7dwX67E0cXK+z1R1+YRcznr0AB?=
 =?iso-8859-1?Q?rIU7irfy7JKWgn/jMb3LnVBc3v4oT7ShdeaJnbA7VTAgYLsnZtdBv/mqzC?=
 =?iso-8859-1?Q?YPJlB1UHDCXAYAch1ZzMiZEpo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45710015-d061-4663-39fd-08d9dcb9fbc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:40.0052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ed0mTYjtt/MICJq700pSVfham4LHK6Yx9eHtBvKxaXvihyaqvXopkZ8WZgcv0CyySIkPruS0ntwaPSVfsnRLxsfcdjIXSXKV91zcQmKloIk=
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
index ba5b1becf518..db47524fa8ea 100644
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
