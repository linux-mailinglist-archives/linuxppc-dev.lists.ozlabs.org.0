Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E9495C46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:47:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCfv1L9Yz3bTy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:47:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYp1pRCz3cCG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaSaWOzNJ1qUnZzZSd/rT7GRRlJdamAYAQrA/e97Kz8PTAcIVbVwhUJe8+p705MrYmjcoy9lEP1ozLFJuhdLM5NN7h1ZoBs/6mij+o/6kbr2kM9nz8x6IPseOw4l/NyiessXZxrb8AxQBSnX0WxfTfmzdSyPV1qzJUv/P7mJ8lN587M3ySLW8Bf+rLmRpu4bGcAhE06+3V71Z/rI67ihK43xeo4JwqMTQhnoZO5gO9RNlFU3bQHixcIqiTO6sjwX44ZUYmUs4c8uQ2mzJgLHmKXeqgsEnje6fiqygx+Rs0AkCLh/r0qH++2/LevUGSRKN0uEzQnFaxQtylBGioxosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao0J4RtTmJCD5YE4NNN5icIYyoHVg3j5QWKaKWYo9c4=;
 b=Me+CTu0tV+B3uEIJznYO1Hb86VIDcoIwe6gyMitIdJnINY9lXfj5tObOu43UTnuGVnheCRRpdGiGVliG65429SJTW1i/4TeyAMBpQp28Hkgkmw1ZE+uyQodv7N/SAkgtPElwmOEP5iL09VTEciB05PPHmIFYY/GFfMhREQaxYd5UsHcBj6GRSLoSS2f+6FUTSzO9/LjY79WCTNtzDJxKtjjKsigUZxL3ox72/gzkEQvdjcW+fAIjNvKw46RC8iP/gVBBpnFfFLES9EBXPZiJ4xdCZivQeT89V9xuWizFkiKsgc/WYE7USd7GysMgxDtLShdyEAEYcYbT4wr/PmiNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 10/14] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
Thread-Topic: [PATCH v7 10/14] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Index: AQHYDqLXMEbHY05GpUKmQZyc8qN6vA==
Date: Fri, 21 Jan 2022 08:42:36 +0000
Message-ID: <976bb751596336cce4f86563b45e0d41ff208235.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d04c83fe-cd71-4cc3-59c4-08d9dcb9f9c6
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB0201AA1B6B1D1BB5832D027EED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:246;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /mpoP28VLpqE3CIMeVvEbX4q9ooDSIp+5ghBzLK9ZYq4wfIXaqQHsu0pAU9ipkqFMijsIcWLssaytmuP8JQ/z8plXkev88ihl4VJgKLSTN1/D1dQJ2rGyi6Oyu1zgijyiB04ukyB7iVScuLNfsZ3f/A4T0Ao8S/+Lcu0nCx/naPhrZEqPT++QesZ4RzepMM/JJ+43qqHnhM/Tm7G2Hla3Pydwm6bXmV7pJLgp10USew5R4xybWR9LCspvSKpIL+F3faGBSkWJkLZKSJima1bIwzaWwK255ve4vZLJr1U9Pi48rbZP3xj7fj9h3QFQ+rxE/bDsJaOq9nlRITMQoIzCFa9cRjjQUgqt7DLm48Bx8KWROZFhetBAa32aMutY4WYMgXuHOBZs69Xt27gHvu7I8tNDhsR9l7Wye7dhdGlXYrZaa32ByI47HpI6ijIlWOaOAsuiNtHRbCVBFd8QPuEgSuvkW7SpOUnjahlYzl/P9mlzpGjT1jeSdn2p5Ecr0egGp2UcwTn3v6tHmYfE7ykQl74HGFwI+u1qhEqlMNsdQ/xL3kc/jX4zNthMvhUNCtTk8Qg6octS3CBavVMDpvnVprPn1hcTOeopeF98jL0XcJnTJvFwBlOWUHFy+pzt1ir5IHS31tppr8L/oisnMw/IvGKBF7l+9y9uz208KmVVFd1JyYAdOhdPLtdC7bSDJwFnL5MEtth2Dhto6wP4zt+i8te7xxcCOaB4O+FIdOa3gw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xBpUYKcSl0eLuLm2UVpm1KruHo1g3ATLjBZGBrQZtP2t9//9KYocTXKV5u?=
 =?iso-8859-1?Q?Zhp1F3NltM/HXUQ/DTD/8AqzUIDGt9RGEdw158qWXMtF6PhlL+Qv3ojeCj?=
 =?iso-8859-1?Q?+JoPjpn6gZyCLFQWR2qZf8TrlPR2OULA+n1tUMdObLPP8WlRcBWyac/KjU?=
 =?iso-8859-1?Q?OTQ+NDctTHHuN7mJtbazRCNoxR/ZpHKrR9I1M11tU76TaGfd7Y480/T0NA?=
 =?iso-8859-1?Q?BezjH0Xy0nG5//VOK9wm3SyHxTg0ttBCmnqQDrjjWzSfGPDBwUK/NnHE28?=
 =?iso-8859-1?Q?VOhNQeG91XMrUP2rRZbBSNtCW0P7lGuq/CwznLjSjeFzs2kQYXIl0whprN?=
 =?iso-8859-1?Q?z+RbwGK9epXyJI/w97OeIXXd67C9tY2zNwX83ga5XrxhTQ//icp35xWRy8?=
 =?iso-8859-1?Q?QboUCfbxMgHLuu/ZBEcKMBMHH4ccGRZoo7LvVsYUyJlYIlnjeXIy66tCYM?=
 =?iso-8859-1?Q?L+HhWRUogWX8OJg60JeRhCZnw0VqRque+JgNRX1lgu+mLno6TfRZOYaemx?=
 =?iso-8859-1?Q?k4hIklOZlN+SEdo9/ljEJTqVEajcesgzqxgFM5mN6tJwHzuu6j346OqU3y?=
 =?iso-8859-1?Q?zADmrybG6zhAexgJaTqKYPLRIcUrXcaz4WcBob/WHdbyWIQsorE/jtsCvD?=
 =?iso-8859-1?Q?zIZ4KeZ193SRNcDV+0TxjpDgYevqoUH/f79WFjyEQSt2XorCmgVXGPdAx8?=
 =?iso-8859-1?Q?6smp5Z+Q7moHEz/dlWX9+IW6rq/lMaNkOfFqE8+dVeUDXPJT/ZsdQ5hm7Q?=
 =?iso-8859-1?Q?y1cHDDc8ar4LMr6isK4577DU3yVneNMw9PLfE30L98H/9/OZ1jMrm5l/nE?=
 =?iso-8859-1?Q?BazsvTdir6FBu5OBsCC/qmge+o/EEhj+22uBizt6avfos3D3NHK1cbrLbm?=
 =?iso-8859-1?Q?O/QQYAQDWwyD/MKRFOYyPtOji9HAgxcYEonf2JV4TqcttdR83LTrDmU+pH?=
 =?iso-8859-1?Q?0jU7JUlUM/5SUWBVrqnEYpNkjGV+WnrVK/i0qehzshWyww5H8Lw1cH8ocg?=
 =?iso-8859-1?Q?d0sFyDvZP/Kl12dB3kLXj7VSGD9X99x4UQS5YqSjkWjdxCB/MhF6tys/OH?=
 =?iso-8859-1?Q?R1NZY8o09VAa1lS27KHVDecTmeMLd33B98Ql0s4/Z+jSI8oUiOIh5wUrvd?=
 =?iso-8859-1?Q?AkJIzZlR+bVzXdPqVWW4RKFT0EWszngJ8w+ali4kAIJeIQZbOlG8d19Sp5?=
 =?iso-8859-1?Q?Hx5j0P5AMEV1JxpEhtvDWMXTrRhk+U4DL1eUMF3wJjRiKcXV/jTUqEeTUD?=
 =?iso-8859-1?Q?vBUQRZdxUwCdLssYvWnWqkYUFShE7jobQvX110d1t0nZIRAFPkTixFtYLl?=
 =?iso-8859-1?Q?1mteNH6/kcB/Bm+Eu07qg/tClkHzl1RVKBvtnJCwU6Q/5M3JdOI7GHUJ//?=
 =?iso-8859-1?Q?bxJRvn3u93lCTjyVDUcb4+Rvw+nAPDqUSaV/l1YBJM6+rTpdFvlq7XT1EA?=
 =?iso-8859-1?Q?zP1Hb1lsCuxEHeZABGZvElc2StlrvnCZG6YumBjX/PlkYyVg0lobtZoQ/3?=
 =?iso-8859-1?Q?U2quEFZbuQVQmuRM57QK4NK71OlnkXwTfzTWbRVjx6j1QSCD8IhXOm37st?=
 =?iso-8859-1?Q?cWJQb0pBHzYFWi3+wv1Y2lZkbPyH4vW8iWaweGfSqj5exoFcj1qBLhqIJi?=
 =?iso-8859-1?Q?8BN4Tjhb9N6gSLM7T7bvZX638KE2Bffg43OdkiuEj58S6+J3MiDaST81Me?=
 =?iso-8859-1?Q?zhrerjh4HO9PpaEwA52qpJb42wlybwrsNy8/QOHmsI/XE4+I1h5g7YKrc5?=
 =?iso-8859-1?Q?MF8ltbru1/bZ+xdzhZtjPrOm8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d04c83fe-cd71-4cc3-59c4-08d9dcb9f9c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:36.6619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0bS/Z/16FoEPR5XZ93MvwjJ+rsOuDqyPVsSFEVAkolK8iK5hJMTivh2t1dJ8Uq9bu7FJVoTsYnm2DbfB7/3oyY8T7QiAW2ee6Avv2ILzTg=
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
