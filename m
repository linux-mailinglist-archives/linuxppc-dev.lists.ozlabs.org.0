Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE246D985
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:19:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P6B2sw7z3cGG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:19:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g0nSlz2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBXuS5p95SYWI+/ybJFzZxtF2TTOyqPXNzj1wtnjNXrinjlm3b1nu6FRDQalOUdG/8bUMK05Twbkwj17AlWsWKu0qnwou8zwfvItOLgMdaR6v1FzTJ02roCk1U4EM3Vee83d7gpxWqhCKN4tvwak4MjHohivcpYljtGqX/OBXl14vsaf+xVP0sge3PLO0gK13O+GgiyrLgtw9dFp4m8mej1t53MOEo6X2RuURwTUW86T3gopX4uH7it2zdbrqFyXViM8+cCt3Nep292HNEIgg4sv/eRnRsrEhnPRYrUp+JaQ1ss2JVCMzRzqHlBRwvPDt/cpm+Ws9X9oRW2wDEuD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUFkKM+3rEOBA7h8OB54KFRMuecm1HZK/3fT5Q8Cr/c=;
 b=LbOjdyTI05Ix3Bh+xaWCMCmOnywtjmXTQhQ6R/zFFI13lFqJi2s9/uJUjOZQuOd8SBxUS03zkxKPvhn2mEsqWQPnpCIMKACTHxRwuPcLmEmU8ZACY80UPi7VQ2mtuLu2wm0dsLm5jQQVinluop9aayruo+eSqwMVIZWBfSolfhHKOH94qxwlp9g43vA4eZ6qxQ06GXZaTLShA4lPWtLpGx8aPRBCpGRkyxDKEG4lvdNQSwSmI2bamVDplKepJxM/rm4SNPKu6tdMSgOrTiAlA7Gq0McMJSVgfWohKT3lGcj9e4cQ1Z1TprUuDa8zumnd4hrlXfMTuULwouKVj+rZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 17:18:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and call
 it from arch_get_unmapped_area()
Thread-Topic: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Index: AQHX7FeZYbkFB7BK6kOFRdVEM/XL8A==
Date: Wed, 8 Dec 2021 17:18:20 +0000
Message-ID: <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba27659e-75f9-488f-1f4e-08d9ba6ebbb7
x-ms-traffictypediagnostic: MRXP264MB0823:EE_
x-microsoft-antispam-prvs: <MRXP264MB082330F22C727300D29FB071ED6F9@MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4GkEdRthWLQrvEIz46IXLQOO83EFFFpxUf3jJJOPxz9LCtan3D7ONo7IuM4eumUS1L+n8IQUVnYw3KHrqKiBrSKXHpfZrvwI1rtTaN0rapDScUhxn+3Q3pjPgIvUZV5s80ZFpDH/GVX9k3G+zHN3orQyZy5W7jWJm75/i268cJl8hXOTQ0XqrQipNKhQ73Ty9Ly620d9fhSwB3SKIZ7u4hHOUKnBc0puSUu1g88Pp5OsJczswMIKptIsQeH0/KqMet4vudN+G4OHpY3VqiaksfL++F0rBYuR6z5UzSGimk4ZpxRPySrBebNveenhQbBw1IsprWw81RIF9aGvwqcoU933KqJaSCPldDBtOzWjAbfmlfFLDhZO8AWWeDtU/5YgYuCk54bWJToRlSO2mEEwXYO2jiMo+ybGnWYt3OEVnCNqn6tQJrIknqvEqvmLLE/MamWLlokM8rcHvwZ1xsiFeRsbpqGx1XpVgr4hVhx7KvuJDUWuIvQc4Qyd2r5ifL7gcpMxygUJjTWo2DxVCDdf3TqyVpLzf1mik69cge8b0CtySPo+p2PL+yhgEWdwRC9JcrBx4fGnaODwlXutfKjM1nnMwnWl8icIdkjF07Vu6osPQejYMisMumqLpEoekAZZ6+ViDSQzGnuuTxmeIr5GglQxrnuDw9La1NL+cq8Ddtp3fhMUo3U2ckBl75ogMogkReEZP4bVwky79dUTdb4l4cpsTk7yvu7Rs92zKP0+GCg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(83380400001)(6486002)(2906002)(36756003)(26005)(110136005)(64756008)(91956017)(66946007)(8676002)(54906003)(86362001)(44832011)(76116006)(6506007)(66476007)(66556008)(6512007)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(122000001)(186003)(8936002)(38070700005)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xS3CNFaMBV3+aDDehC47sr2U5dQBZ4E6/TIb81JXOTMYWchrqtaCHhT+ha?=
 =?iso-8859-1?Q?KQIndRE6ckw9pF83BK1VZxcLWMvxX9IMASpBzMEJ4B06SL7iLKv+FPMeYi?=
 =?iso-8859-1?Q?ygvHxJLdJum05Rj9k0Hhc3Pil5l7aqyPeJxzZLEMJjYvC6udjbQ+dpZsMu?=
 =?iso-8859-1?Q?JbN06B8vf0JkhuSbYtKWs+m1y9lH88RA0xvOAzNih242j1vw8sAlskeBfj?=
 =?iso-8859-1?Q?3RacbjhEk8TaS5q/34P9sqCK3crX/gbL5MbaojoNV7cGV+zT8YX3RFXBCN?=
 =?iso-8859-1?Q?LPgPjz1IAmni5XukUolKxLaatNi7QdB/7fGRB4PEJYmeD4jAPjU7HFSZdH?=
 =?iso-8859-1?Q?2f7Zq3kzE8R0q+D/m3e4fk7oqgltNVjTqzxHFyywHAM968sUiecNxudpeJ?=
 =?iso-8859-1?Q?sMdDiUWHxCavbaZbtE5sbGAqx8JIfMpfL3/0eL3yJcCfMLq1s4wUXCk6gG?=
 =?iso-8859-1?Q?ums9FzgbA3edYLQDmDsxjuU345HyLEJbq5jd78g5XgIGotSJY/PScTpTq7?=
 =?iso-8859-1?Q?tD6Tylv2WjqO+gcFnSdsFwb2RFRog+A1mPIzOyfo24dN+FXwRtHlPxEB/p?=
 =?iso-8859-1?Q?4AvhHuTyGhSEJsX1LxYFA6tnrPN0eyswG6dKrI6bQeusE32BvvBUcdJf1t?=
 =?iso-8859-1?Q?hrytildnJQmWeUGfsSNjGnL7SWBdNQH/VSeSK4pvAkhe4dtnizicEKI7Fi?=
 =?iso-8859-1?Q?GlwO8J5P7q0ZUImVk2GBqUndi/pU/widFAyxP5UE3U99HORAt8utkYcnEI?=
 =?iso-8859-1?Q?cAIphcjJQsUMs00/oZFKKkc4rtp8mTE/QbIDRle9Ymdxaj96ajFoU460ud?=
 =?iso-8859-1?Q?eAwHElAxmFy/2AUOV6ozHPEBq3sKWGDpI/4AR6bdUXsI1Nv6rdBq0WInWf?=
 =?iso-8859-1?Q?fW2cB/FeTa/BLrX+82lXDC/6C6Pgw5xnyawL1jCByAWqeX8uv11D75m843?=
 =?iso-8859-1?Q?xtSlE/NB9b7AX+c916ccU/keg3JUh6nFsT7tdmKW5yj2P4Mm+vHQZB1h2y?=
 =?iso-8859-1?Q?5DQkDPdcxYC20nC55loO+BcpkK3OE/NwWjD1VKV05NKAhEq8Q/cD14twUe?=
 =?iso-8859-1?Q?yv5vxjVGCkHwunoAwdTtiGq5yrEUIazl6GAOlRSNiQswdU0SVUoASKfcP5?=
 =?iso-8859-1?Q?tXN9xp6mCaLDb/IYdSoUxaXb5oINRGyMAQwF/6G+KftPqgWrFq9QZmsZQ9?=
 =?iso-8859-1?Q?Xmr/ptx+cpIq48cDFithx9euD7TrIMH4mV3ACZBS25w86wdYQvgA6/A0H9?=
 =?iso-8859-1?Q?He31nGkhmfDO38S4ssQRZONxbn0cMxOhULWgnDGp2d4OICyrDW56xfk55q?=
 =?iso-8859-1?Q?xUhJptulWF97fGt8EcvJgc+d6ar8OFY3e5FqOM/CwSeihj2wKXeLcILRN5?=
 =?iso-8859-1?Q?xRDmDzOwV3oC1VzkYifSzzEHVJvQuZywGiDNzA473Lm9GyhrFEyWcBl59Q?=
 =?iso-8859-1?Q?sAov3yisFgEiX5oysfY2w+XJ1lf6EdhPoAsgDOoqD1ZZZKeGfLVrbe/IIA?=
 =?iso-8859-1?Q?2WH6l4lUAoyV6LzUx/z6pTacHSTLwEXon4UhRtTsqAmdEnibpYGBp58jhm?=
 =?iso-8859-1?Q?DaZK7xc/1adk+PaCt9/kEhagtVTVbLGrn2Ci0FcIiFreTIkziH7MGRsQIE?=
 =?iso-8859-1?Q?pnz90BGHgT9lWXxmEbkmmtrKg/LaYiBvn3VYX0nc4PMQjVH1IBNuOU3SiB?=
 =?iso-8859-1?Q?BBmbKsdC7NhadyE0pRnTTNAipFBNHFsTzrmfyIPkZXkZGSoUE6tswdgfQS?=
 =?iso-8859-1?Q?3IGUBanX7U7hozheDBbp8GuNs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba27659e-75f9-488f-1f4e-08d9ba6ebbb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:20.6701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uC3CSVXdWPrP9w843rQwrFCYsIXsami6Sk9waNXJJ9FwR42dSVCcrEeS7RxPOxxDe31Hg1ei8igwZ526OkM16YOVUybTeengBRdjengieis=
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

Use the generic version of arch_get_unmapped_area() which
is now available at all time instead of its copy
radix__arch_get_unmapped_area()

Instead of setting mm->get_unmapped_area() to either
arch_get_unmapped_area() or generic_get_unmapped_area(),
always set it to arch_get_unmapped_area() and call
generic_get_unmapped_area() from there when radix is enabled.

Do the same with radix__arch_get_unmapped_area_topdown()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mmap.c | 127 ++---------------------------------------
 1 file changed, 6 insertions(+), 121 deletions(-)

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
