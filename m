Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E936946D98A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P7j6Lxxz3cFg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:20:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::608;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g4bZxz2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5IHaE1RghxPOzLoXLyQ98RvEDd4Gq0828plnRsToIv9/bbhdIjXR8yBjLzb8OqCNx+g49j3E8lVMIHPRHC+DbbzxznBI5IZ0ZbGHSiSXWYUEPKe+xN2y4FGAS390cyOJ/pAvW1pkMvQDalvPxmDL4ei/bE22bewQ2WiU/w8Uw5/wBg1Efm2K/rSjS16H0amCY62i/z33YarWLeNxZfW0THULt7HNH3HWC2hllD/DE2pd7D5SC2mdr5+SoPy49P/o84qHvBTKo4ybMh8NZOuUQz8OUmS2kUYhXmeCzerZjpYFUXir0bbfXdS+ypFqxKa9KWHUYBr2IeZkg32tRnckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb8oXjzBpjFNS8rXv0nZ8Dve+gNuL7r2/5q0eP76QFM=;
 b=Bc/EEAwqihmeEIgc0CkJJpKKija2VGGujsLfFs3HvTruipgmY/KFW9iN/9IoSfHBQzvH+8g8wB5cY8rf5DbfR4BgVGryHWLCIUS54QBrpo5K/S3paUq1VAAYufbZb0tpl4CYtb/uRQRFn+LuomOuVaoHGntSBW2sdFr6GgMdiRislatJICNMk3jCde2KWO3rKZcbEl2bf42yyLSdswpcWe6wuss59cEYN93k2HAr2LOGHHThpyjMxye4ouLAS1m0K4Bk+wZ+stG84KL+qBjEa2uMlo/nLJRWqX5TZoQc0hLP3dCygD/hWvBH2rQwUnt9irZEfUGpQCPv0IAZp9ALlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 17:18:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 03/10] powerpc/mm: Move vma_mmu_pagesize()
Thread-Topic: [PATCH v4 03/10] powerpc/mm: Move vma_mmu_pagesize()
Thread-Index: AQHX7FeXKyJMdySKVkCHabepEx7D7w==
Date: Wed, 8 Dec 2021 17:18:18 +0000
Message-ID: <372d1488c35dca1c5af04f95d9b8548ea07ea603.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9968802f-d74c-4047-9c55-08d9ba6eba85
x-ms-traffictypediagnostic: MR2P264MB0228:EE_
x-microsoft-antispam-prvs: <MR2P264MB022810B776123EB7CEDA89D2ED6F9@MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5u8YKxULaZMGKUy2k+UmwhvBW80NEC+ZsEE8gcg3T/zBjtwp5DOLXIjHQTBm93+/INeiObeclE/nbdTcu2nv/qoOyplRpGOVQgAsGDOvGg70aIUnl+KYicmhjIUxjKEOh44MI8tbaThd6eeTA/MroIr/WdxeoED5ffGz1E+IGK3YHG54idITy0aCCr9ib+7yE+ZL36lPKPK0zCiUPyWjAfa3qSJ3EVjqhOLPnGGbSBh2MjB47wsECwt9RR/SQnpyo1tZS18ebjY014QdgIB+8Xd5aqdFqT0jh9g6IPP7nVJvpMJ8Xay5Ydw6gr0O2CqwEvO6tivY3FrX9MBey9x6XjZsrfQlHFZSk3VDvPYtIHSsGXwTib6MrXmj3iNuvJr59TT+VmgTp/m7uCAAEhPYguomECZn/TZs9f/CW0lVuVp+658Z1CvTQiISnt7ZSwZn6uTzv0TCPEqQU2P7/X0/G4uKOQviAGZVXKu3UkZcqcH/bscsHpUGjOBwwmSoFPDIua7tGYEbHAyFClKqiy4xdi1yPI3OlcNjWgoVhVcLNP+O0UrzuCGYiThs9da1LBkp7fJSryojE4uElJ4FFXOAfkF4MWMbeUjIV2CTzmNIaLB02kgc87sm73VR9uwJ5JpdIJwKb5IH6c2uFcuEDimPcfGRM2sHrli70w2gIQGSbpRJqJFoIcgGmqgn6PFV3COo6QrBDSQX0LmDHGvH9/gNTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(91956017)(76116006)(66946007)(122000001)(5660300002)(38100700002)(66476007)(44832011)(6512007)(64756008)(66446008)(6486002)(66556008)(8676002)(86362001)(4326008)(8936002)(54906003)(508600001)(36756003)(71200400001)(38070700005)(316002)(83380400001)(26005)(110136005)(6506007)(2906002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OCPcTq7iChTlb+wkrhu+ryHhDeHduavcUj5hGuux1ihsIzN4poDrcLdJlE?=
 =?iso-8859-1?Q?Wz6F7Lmsqoa5CepJ03HqfvyF/PFaYh85bPRG0lQw9BN8NxFXJJ3kG8WSmB?=
 =?iso-8859-1?Q?EkfikgTGVgN75CSXl8lhLvlIQCAo5EnadRJYyZWu4Vm6n3ezrJ4rAfJEky?=
 =?iso-8859-1?Q?gJi9PA9aX+Svy6zsxSWMgd3mNigOjmCJPLjBg+qAIUzULM2D5HMA3C/Be9?=
 =?iso-8859-1?Q?LKiY8mQ1Q77dtE318BomCQ1id9qhF6Ntu3nRbFnbgLrGugHsFxiiskCWMO?=
 =?iso-8859-1?Q?RPEoI0FQ8VU1XVo6yvStDC9IC6HKm1oaYJDEwL/OqW+2/M+55cYbUNYGxr?=
 =?iso-8859-1?Q?hpl7YL3qGAvynoMr8d+FmWwlrpcPVZ06tT10qVVSKmxzAd7n7P/Icx99HV?=
 =?iso-8859-1?Q?qKOytHYq3uj/R2ovWtueLIbpfC/CofK6dK1iXci78LA8Xz+dUY9cS6ZRHf?=
 =?iso-8859-1?Q?gEsxlnHJlQsleDO/g+mzIxLmP0EYDGT8YbOIEoDR15qpzo0QAFAC7c51KK?=
 =?iso-8859-1?Q?dzEwMIMp2ECbD8f0G5yPhXKJwoUx5gU+LJYgRU4p1r/EHnkuBd5zBEVmsp?=
 =?iso-8859-1?Q?/ag0kFnAA248jZ6A+YLsnBQYIS/RDhA5R/Nx9GbMyplEOU7/3w3AxRQK4B?=
 =?iso-8859-1?Q?2XqmfGG2hbNUB71Y4ymM3VnWMP9NnHQWc8G/oO3CVvQ4A5+KZN7FmeFNZ1?=
 =?iso-8859-1?Q?07M8kOJjxTu8ubXGmofMVKr8zHnz/reDHpUXDnXMyaOPz+nMbVpaFYr7vO?=
 =?iso-8859-1?Q?mnOV6iklxnlh1TakvPHxsmZabRsG8DpcMY4WAEebUi9bOSp/R5FIE+NYv5?=
 =?iso-8859-1?Q?o8yIVUOCVbLkQJYCm+vc7WzI9zNSQTJUa6GmvWkYaLX4XAqeGhaxWmmngD?=
 =?iso-8859-1?Q?5cB0Z+9vt7bDE8orE4LdL2NUctLZpikJM33zo5dwUiDSgPo25M8E+cbOqU?=
 =?iso-8859-1?Q?n26qOH/mgSMSV49Blc13O3kskFDHOjeFurSXwIZN2EokOok7PRhMAztqOm?=
 =?iso-8859-1?Q?LZ6y5Lz1cKvf3Ids+UucalGScIMUM+PQ+3znDj7h7RWTYFkUeWO000Tpmz?=
 =?iso-8859-1?Q?4zneEtp4efNAR9c5HXOYf8NWVl+JmRm3GcWximq3U3shfP6rFC7LxZX75a?=
 =?iso-8859-1?Q?yNo6Lx1+wN+/nRO1XELYcmIyuTuMtt6fCZ1a4cUVOFBF3dFLAlM6VfrhEX?=
 =?iso-8859-1?Q?k2wsYG5WtxWryVUt/wYq8s4G1VBpchd2W1W1AoKLEujbkYYsh/evgadnTq?=
 =?iso-8859-1?Q?SoOASbzAW5zkPOaXTwHAvIz5/YACsCv5mgq6TA5i+07v3uP90UCdAVKqkP?=
 =?iso-8859-1?Q?CwcNg49PAwnyLpS1zvLKRfQIVIY6Dib+hbGw1Gpf3dEPN8jAirmA72edR5?=
 =?iso-8859-1?Q?YsX9cCNAJo7gxPDxTa+yDjxX89nZEons46GwZZbZGOyIS01uiyiy82HFSH?=
 =?iso-8859-1?Q?rPxQlB5K6uKGbHU8R5hPY0cXCoJu59whw4fKFKNqeWKPZg6dWd3zjseUnM?=
 =?iso-8859-1?Q?8rJ0mKWiFzdc0vjV2ajD4pgBs6m+bNLh8Yy3NQGyzofTjcV5xA1mdrH6Td?=
 =?iso-8859-1?Q?RK1VLghnbaUu8DXF1jhYyUE5RO0+6O39u6XxInu+wJbtfQbPDshDn9yIt+?=
 =?iso-8859-1?Q?yeLQTi2yBwdKJchkZgZdnoqR106QAz7e4rNvIfxSjoZBb+RIYcDjCoOYLn?=
 =?iso-8859-1?Q?ADiaIF6fbbcZl6pMLiRdrtcejjydlfV2/vtMQAK9vFnC5+jhbt8Xprbwpq?=
 =?iso-8859-1?Q?Do4YqrylIRcdE08JPxXuAiA5M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9968802f-d74c-4047-9c55-08d9ba6eba85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:18.7187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwaUfq7CZF7oLA2RRRdTKPI09LS7PevKZL6LIz3Ki0Y67CVOQ8Wzw/suNyy9pae0bryooTJMnrPIP3c5QZAB9oGnb5iKBfv6R0MyKmQC72A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0228
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

vma_mmu_pagesize() is only required for slices,
otherwise there is a generic weak version doing the
exact same thing.

Move it to slice.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/hugetlbpage.c | 11 -----------
 arch/powerpc/mm/slice.c       |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index ddead41e2194..0eec3b61bd13 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -565,17 +565,6 @@ unsigned long hugetlb_get_unmapped_area(struct file *f=
ile, unsigned long addr,
 }
 #endif
=20
-unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	/* With radix we don't use slice, so derive it from vma*/
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
-		unsigned int psize =3D get_slice_psize(vma->vm_mm, vma->vm_start);
-
-		return 1UL << mmu_psize_to_shift(psize);
-	}
-	return vma_kernel_pagesize(vma);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift =3D __ffs(size);
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index f42711f865f3..8a3ac062b71e 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -759,4 +759,13 @@ int slice_is_hugepage_only_range(struct mm_struct *mm,=
 unsigned long addr,
=20
 	return !slice_check_range_fits(mm, maskp, addr, len);
 }
+
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	/* With radix we don't use slice, so derive it from vma*/
+	if (radix_enabled())
+		return vma_kernel_pagesize(vma);
+
+	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_star=
t));
+}
 #endif
--=20
2.33.1
