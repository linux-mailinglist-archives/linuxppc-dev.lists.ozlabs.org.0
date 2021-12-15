Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D500147532B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQpb5dWSz3f12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:49:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjw00S3z305L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2o4ckaurMbW74O74keXiO5Q5ngRRUqhxRjP/hEYL/hrsM4ipKXfQqpShReA+rQ/SK7RHPoJ0m25wOx8nGUdidsCG+scqnlCLe63FqUn3BMVs7t/gnmWzqXuPAo9xthv0VW/zubuRWqvYKStWhu/BUk0bDaFpZpcR1hKyw776zw2WtAiA6XRmROu9aNmX6nvn3WqJiZto97Yy2jOlHlwoi8R9lGMYrn7CLnyGHL2H4zFEpt8hU9k62qfXwD8JwtbBdow9sV8p6wLNOaWQx+0+FVFknmJ11juu6Xjup2GOhwgRrWYAejgP9+VrezfLnyyZuHGJDQl6L9cDi4q05IQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOPlIfLv9B1QrXE92w0DRqSm9EvE4h7iahy364wlTRA=;
 b=kDTDvsprhHKu4YgeXO8ajrnY6ov/rMJyUWfs1c5IpiV1jkVsGfyoaLyDWjrh2eA7BWZpy4nbb7Xx8KssjJ6HY3F/cSBWs1t3n3xJ90IHECk/W/8+So/PESNh9ChTwp8DU3rraPhxUEk7r+6x87H9F4Nq4sKQZ2rKPsyoTZYSpwwlYPzRJM1d9Xq1LGDtcmKmg2TUk8Y7vfJiLEUdkgmRJkJA1mV5m9mFv0hLTOUmLBQPmf7GbM9FcOumqrfTWZA27+3XvzxlWyA//kykDGA2Hyb7F/Jcvx/sor6AqgNIEblmv5EWsDAB7Z+98fb/ABoc1hhlTGK9SKMfuPvB9WPcIw==
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
Subject: [PATCH v5 07/11] powerpc/mm: Use generic_get_unmapped_area() and call
 it from arch_get_unmapped_area()
Thread-Topic: [PATCH v5 07/11] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Index: AQHX8X9P18+NgiQ6yEyIrb9PAUSKDA==
Date: Wed, 15 Dec 2021 06:45:12 +0000
Message-ID: <686895764befff16e9dbc2989e8f8eb2284b38d6.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9967f536-27a8-45f6-4e4c-08d9bf96721c
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB2147E55F36B8551107F72B81ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6u4XPbBzX8aUCgKc9PVkAvqwA9yW+BYVCMNZ0ZJAnjmhpFffDra7oGo1i4/g9nF34c5azhXiyZbnSEPBqxqmGD+uXLcikmXtSFrPV7VlwGajY4hhZ72kN58/U6O0cwqWmVtRfVan9pI/Zg+y0ae3ocvUMb2G1ejmwTqNqPJ3aGeAg5SCYrVqJb146glAOrxwBeorESWUSOKTRB7TS9UbmwBgU5JIsDfFCXMOOHJEaflhS9n/CZEwLrJj8q6+e7uhaLZaOaRurZeyBYhPMYjnlCSCDVz5/RrfmquCwHhhTs/pIuD8yxanBcMinTRuNTm2rUnWLjTTl8cmZ/xk8DdisoMrolnnZAE7XF7zdYHs+JkyjgcnRkSO5KXGbekl0piqVkvnh8ZMrLZJiny6vO0MBp1wvjeFocwUH89ynkqkeFCIhlyIOJbib7po9avvLpUD3Y9pQJbJO9DThDI/rS54qYU4BesKFiCQR4WG3zMtQknG+IUkkmPvXevTOCxgyegFZNLxmVBvhjiZd9npsqzlR6IU25Co+xDRIrn46kAOkFt4BKO9Ldz0JBG4fzcjWqmUFxSyvvqmrbAZO+6hqrtA5aAMe2JtSHn+OlBLc9AArs2NBc3cX27DrUxyvFlBt8MB+Taau0Ab17nm1ZQ38WStuiABpqmSqRcgFBe7uti9UxkNuCQL4QvWpM7fUjp4CNfGBNmwRjEEPs0NRziL83VzuyLM1+VtVZjpE9t1kSd5r+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DA0cfbH0+ItJxq8aub4etUkjJiMT/05mSVg4Y0AZ8kTqn9BlrRK7B53emH?=
 =?iso-8859-1?Q?gb0qUIxid9SlJ6L8UdrcagbrC3AZxHCFM5iTBejUaqyiNEMuNdOv4kVW1q?=
 =?iso-8859-1?Q?P3L117nSiLZhOtNwYuXWUclVJzMm5cweExT2vtvHn6eaZNwiTMjQKc4J6Z?=
 =?iso-8859-1?Q?9EP5WVOf6hFj8ENvsuOeiMh3v6RpdT/tLdLlXOlUhdwjvIekg09Qq1JEKq?=
 =?iso-8859-1?Q?P7Jwx85YVsDzgxNP8fOP9bQCgNHM1aqfGP62Akw8BHGb/Su6frRQLtLSLH?=
 =?iso-8859-1?Q?UfAJ3s5W5qqs9EuJlrirXjpqBT1amrwkWOF4cAIQwYYfeLNKiNDcT4dsrd?=
 =?iso-8859-1?Q?KZjwA5DQ0UHkJrEAup+cfqmY1S4RxCjKwl7UWUij64O99XDDZtqMMQ62Kt?=
 =?iso-8859-1?Q?SyTfoUZwZYHzGXl0PzDBfN6zGoxct9v7a2EJmpLbzyvu4OMiiimHONC6hr?=
 =?iso-8859-1?Q?rvSGVOrTBO9z20lH5spEAiKYG1HU+rcx7N1vzZI+N+ity+LwoNFhAkwArB?=
 =?iso-8859-1?Q?mlwjFA9BI8cD9QiKtD57OK3fqzGE3Q/HN1F+BgAYQqdFqfmpYqAFz8Z1Ax?=
 =?iso-8859-1?Q?Z/P20oNaO8pzhS05pqwmh3/SSm9ENiq3SSKuqwTzzBXFulWlIcBkFKMiY9?=
 =?iso-8859-1?Q?SypL7640TVT8UG1/22SMKJZNJpnmzSNnpeUYkRpGUZNTqdLVcd593ZtVq2?=
 =?iso-8859-1?Q?2m+zdlpAP7PD87dJYcgOUvZRr2d4oK2RNct+GltlOKtnHZ3K2tnGFpat+G?=
 =?iso-8859-1?Q?CR/57BscICyakdvEL5wuQLLhEq9UHkG+SWQBGGN4RPSrx0r+EfsJne/TUv?=
 =?iso-8859-1?Q?/k6GSVYUXocJ81aDDmTlitkwOlpTh3gp5YrkVynK7xsuHWmtpzYeEB9XaX?=
 =?iso-8859-1?Q?wvSgYEVA5u/5AkdIiOfV7CH7btYh/VnZECKTHeNe3on5yaEkgmMKHNcQIO?=
 =?iso-8859-1?Q?koD5FNOj5BoTcCbtN3qlo35gZT5VUDUryHcC1Hh+ZF1P0U+UPRH0pFKKaV?=
 =?iso-8859-1?Q?RKeNFAXTo/XtuYr2STPWmX6KHS8/NsDFhIh1evGa1VxQx8kXlQ7tc/OK/T?=
 =?iso-8859-1?Q?4AC8+8cmWLTrqGsuvID2y/F8p2LIGG0uO74i3N2UoTzofWJsSEM05dqQD3?=
 =?iso-8859-1?Q?xFyjjUrERJYzFRilP38N0y59HdreOSLsuTj6kXdLD5CZZ1Eznuc8ps8QJE?=
 =?iso-8859-1?Q?1+hYM19TBnwExU3Q44LdS2omZRXVb2kJUUy1CKU8oejyPkoZVrESefucPd?=
 =?iso-8859-1?Q?yRq9pz+1gd7hVRtDhBeThfbQGgks680mlh512/eaKPqV+M0l8a38MwKk7S?=
 =?iso-8859-1?Q?NRP3RJ69C2kcTSaLM97fFUcPAQg0zB6riF4Ljr5qiLhGdjBhLSMzi5J1nO?=
 =?iso-8859-1?Q?5Apc3YYk0p2Gst2vWcpZgKgyk9aNlB1hMrYw6LrwXD0e8iFDruVR4JIa7n?=
 =?iso-8859-1?Q?kzUH6iiTuyDap+y96MSPryNBiecBs84WeHX0UwjWPNvkXiKGopXAMUFtoh?=
 =?iso-8859-1?Q?K+WJrjuwsX45/16aqOn2wLLiCtBGQCyaLGP61qW+LUSjevcGO1YbxuaDiJ?=
 =?iso-8859-1?Q?9OdN1baBxn8BMxE3fXRS1Y4XXrWbQQy7KOy+RGuaoIN4xAg68pezZz+ecr?=
 =?iso-8859-1?Q?IP0sLCr+eG1dNXb4JgjIdc/6MdyB3sX4qYuo7cA+CTykkIIbgWfPaEQD78?=
 =?iso-8859-1?Q?OhbgyXtp6r9rUMkdXpNU/TYq0XRiJ7lzWjMA6020yIUS64os51WeIk/HMr?=
 =?iso-8859-1?Q?u8WHVMK/ojQlLawrF8OJAdG/s=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9967f536-27a8-45f6-4e4c-08d9bf96721c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:12.8689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4ELGewbwqWRZ8H9s3QtHbVdVl1zrK2nEUfpejx7i+279dNxE3p5ytjzZ2jFaD58RvGEY0ZJlGTFuIJcKYXPPPU1rXfUUKQ+0TsmOUb+gKE=
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

Use the generic version of arch_get_unmapped_area() which
is now available at all time instead of its copy
radix__arch_get_unmapped_area()

To allow that for PPC64, add arch_get_mmap_base() and
arch_get_mmap_end() macros.

Instead of setting mm->get_unmapped_area() to either
arch_get_unmapped_area() or generic_get_unmapped_area(),
always set it to arch_get_unmapped_area() and call
generic_get_unmapped_area() from there when radix is enabled.

Do the same with radix__arch_get_unmapped_area_topdown()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/task_size_64.h |   8 ++
 arch/powerpc/mm/mmap.c                  | 127 ++----------------------
 2 files changed, 14 insertions(+), 121 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include=
/asm/task_size_64.h
index c993482237ed..bdc87cde670c 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -76,4 +76,12 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
=20
+#define arch_get_mmap_base(addr, base) \
+	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW =
: (base))
+
+#define arch_get_mmap_end(addr, len, flags) \
+	(((addr) > DEFAULT_MAP_WINDOW) || \
+	 ((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW) ? TASK_SI=
ZE : \
+									  DEFAULT_MAP_WINDOW)
+
 #endif /* _ASM_POWERPC_TASK_SIZE_64_H */
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index 9b0d6e395bc0..46781d0103d1 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -81,115 +81,15 @@ static inline unsigned long mmap_base(unsigned long rn=
d,
 }
=20
 #ifdef HAVE_ARCH_UNMAPPED_AREA
-#ifdef CONFIG_PPC_RADIX_MMU
-/*
- * Same function as generic code used only for radix, because we don't nee=
d to overload
- * the generic one. But we will have to duplicate, because hash select
- * HAVE_ARCH_UNMAPPED_AREA
- */
-static unsigned long
-radix__arch_get_unmapped_area(struct file *filp, unsigned long addr,
-			     unsigned long len, unsigned long pgoff,
-			     unsigned long flags)
-{
-	struct mm_struct *mm =3D current->mm;
-	struct vm_area_struct *vma;
-	int fixed =3D (flags & MAP_FIXED);
-	unsigned long high_limit;
-	struct vm_unmapped_area_info info;
-
-	high_limit =3D DEFAULT_MAP_WINDOW;
-	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
-		high_limit =3D TASK_SIZE;
-
-	if (len > high_limit)
-		return -ENOMEM;
-
-	if (fixed) {
-		if (addr > high_limit - len)
-			return -ENOMEM;
-		return addr;
-	}
-
-	if (addr) {
-		addr =3D PAGE_ALIGN(addr);
-		vma =3D find_vma(mm, addr);
-		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
-		    (!vma || addr + len <=3D vm_start_gap(vma)))
-			return addr;
-	}
-
-	info.flags =3D 0;
-	info.length =3D len;
-	info.low_limit =3D mm->mmap_base;
-	info.high_limit =3D high_limit;
-	info.align_mask =3D 0;
-
-	return vm_unmapped_area(&info);
-}
-
-static unsigned long
-radix__arch_get_unmapped_area_topdown(struct file *filp,
-				     const unsigned long addr0,
-				     const unsigned long len,
-				     const unsigned long pgoff,
-				     const unsigned long flags)
-{
-	struct vm_area_struct *vma;
-	struct mm_struct *mm =3D current->mm;
-	unsigned long addr =3D addr0;
-	int fixed =3D (flags & MAP_FIXED);
-	unsigned long high_limit;
-	struct vm_unmapped_area_info info;
-
-	high_limit =3D DEFAULT_MAP_WINDOW;
-	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
-		high_limit =3D TASK_SIZE;
-
-	if (len > high_limit)
-		return -ENOMEM;
-
-	if (fixed) {
-		if (addr > high_limit - len)
-			return -ENOMEM;
-		return addr;
-	}
-
-	if (addr) {
-		addr =3D PAGE_ALIGN(addr);
-		vma =3D find_vma(mm, addr);
-		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
-		    (!vma || addr + len <=3D vm_start_gap(vma)))
-			return addr;
-	}
-
-	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
-	info.length =3D len;
-	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit =3D mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
-	info.align_mask =3D 0;
-
-	addr =3D vm_unmapped_area(&info);
-	if (!(addr & ~PAGE_MASK))
-		return addr;
-	VM_BUG_ON(addr !=3D -ENOMEM);
-
-	/*
-	 * A failed mmap() very likely causes application failure,
-	 * so fall back to the bottom-up function here. This scenario
-	 * can happen with large stack limits and large mmap()
-	 * allocations.
-	 */
-	return radix__arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
-}
-#endif
-
 unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
 				     unsigned long pgoff,
 				     unsigned long flags)
 {
+	if (radix_enabled())
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
@@ -204,6 +104,9 @@ unsigned long arch_get_unmapped_area_topdown(struct fil=
e *filp,
 					     const unsigned long pgoff,
 					     const unsigned long flags)
 {
+	if (radix_enabled())
+		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags)=
;
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
@@ -213,21 +116,6 @@ unsigned long arch_get_unmapped_area_topdown(struct fi=
le *filp,
 }
 #endif /* HAVE_ARCH_UNMAPPED_AREA */
=20
-static void radix__arch_pick_mmap_layout(struct mm_struct *mm,
-					unsigned long random_factor,
-					struct rlimit *rlim_stack)
-{
-#ifdef CONFIG_PPC_RADIX_MMU
-	if (mmap_is_legacy(rlim_stack)) {
-		mm->mmap_base =3D TASK_UNMAPPED_BASE;
-		mm->get_unmapped_area =3D radix__arch_get_unmapped_area;
-	} else {
-		mm->mmap_base =3D mmap_base(random_factor, rlim_stack);
-		mm->get_unmapped_area =3D radix__arch_get_unmapped_area_topdown;
-	}
-#endif
-}
-
 /*
  * This function, called very early during the creation of a new
  * process VM image, sets up which VM layout function to use:
@@ -239,9 +127,6 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct=
 rlimit *rlim_stack)
 	if (current->flags & PF_RANDOMIZE)
 		random_factor =3D arch_mmap_rnd();
=20
-	if (radix_enabled())
-		return radix__arch_pick_mmap_layout(mm, random_factor,
-						    rlim_stack);
 	/*
 	 * Fall back to the standard layout if the personality
 	 * bit is set, or if the expected stack growth is unlimited:
--=20
2.33.1
