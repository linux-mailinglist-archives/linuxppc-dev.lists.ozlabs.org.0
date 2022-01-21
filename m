Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A82495C39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCcn3C69z3bdG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:45:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYm0jNlz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOpmXgkVo/4pjtIONyghiImX3RsfwHw7molWiAfpfCpYmbtJrPhQ65m81ZZj5UnBIaUK59YjPlBs4WOrpxIpQxvsgSWQB4c22BWS2D1YexfV0EWzSdhWh8HHYhv53LbNJGGxrldK9qD4svvJbMdZ6zOYLxP1jamB1o3ldhwwXU6ErMohNJcFLXXvj+DJgFONE82McjINVcp1dRtPWm2v9dJP8fT+mcSnZy8qUR+Lu2jRhUP12gQGvchtmXZz4+kRRkJFIRRzaUEMry9A6OAhcKqbpnlr5b3lb5+Mx+xrZTJa1Gn1aG4WMzxHXVr0mSs/XKaMWrKIbG+9aTyawBqCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiZMm9KXXy+vu3WhUEQeEWc13H9a8TPaQVYGQB2pazk=;
 b=Q6BEit0Xa6hcwD16Yw3+a2Ib+75+E354gy8AIJ/REiXZ5gdIRz4vjP6UesGUybg/f0lp65tVOKr3Q13T4ETFkFctT5s5zHPA3uSsQhyrTvq6ous6PWC3FPcKIlK+EoUNeer+VkOb0EGFQx6pwsUHX/Efo5bW34jc5wYssAz/4YS7TAv0LeVBtRlrSAW+B/nbBtyC/mDa/54iXYQZ22kkc0FeJ6yBmDxNjxChCY8KzXvRsG8joWlqgDSFD1eUDYptm9IKY9kbGkC92rBNd9hWMZ71VDhH0Fdr31Or/q+dJ5EKR+UyelP5D70UwgPNfTkLa15yyEz4WuGTrUEwnm03aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 06/14] powerpc/mm: Move vma_mmu_pagesize()
Thread-Topic: [PATCH v7 06/14] powerpc/mm: Move vma_mmu_pagesize()
Thread-Index: AQHYDqLQNgMtoK4UpES9C5Vln6QanQ==
Date: Fri, 21 Jan 2022 08:42:24 +0000
Message-ID: <44aac3ced0ce952719fa0b7bb924a3be7752c25f.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f38f2648-550d-4339-21ad-08d9dcb9f2a6
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB0201B2C8C643D410BA0C966BED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MIBM3VGcD4LVM6SU223MCLMm+DFCkhDSWiGAP3MWi2YqJOQdQi+nwv6ADO/uizrLzJNu9LOn6fJ2XHvlT37CcPdgdoizIIjX0WJ9l7qP8mRTC5QCY7JbGj2+UnZ/WmMqtBEmdyciPoj9Qwk+UmOs28cAqANWzqyVAkyfIque1fUS44dhPRa3L2QpdXAKYIvZryhFlZEq47Kgd1bW0EGi9orlQOesiLgNOH4KEP+EULTwUsEBZeyxcuvkw0xfywfXNldr0ERZfQJGeLj3uRvffTL3vleehtUnXtcW/o+RASvQOHxe3JEr05DZqzEeE53khhVuyjIpR439o+d8K/Pfoc1erhEw6vicA1owuetjZZw7vSktykb9J6cR/j9hmco9GtIry1mQV8sLOZquqflNM/quWQBa6ekCFMvn34d1me51a3bZrKnwDLealycj5Cge2q2MyftugF0YDzCpww2k+Kv8ZgHrq9vZxED5WacQK3Z0FiktjxXFVFvwZOylTWdcz1V+7wCzwdHTiNvjM61iSaHjeQuojL2W47KlWlKHMayIn7gQv/MgO9uvEKfp74o2LUVEQKda/NqgT70VME0+S6OeQmvKuWnMiBms5koSda8By9lxKkvIL28S1dMx0RZ/8QcNxtqJcDfkGOZRNSCh6lZgqVLtHnjj7Bn8F+2GxxqItIJyFpYf8UPz6/KC9bcn4PIcmIKILjicbVWpPDJ4eQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vfP5DPE6GUHjc2ZlITrqYqMPnBUbun9FJw/ruD+IXrj5NY6P60SgL9/ZVX?=
 =?iso-8859-1?Q?i3Unkw+RS65FPN1Alza6s5HyN5W/QlQ/soQj+Ql2GLzT1+4iazI33a2wc/?=
 =?iso-8859-1?Q?az6G3S363QbIlTTAC3+h06GdQtXMUKgPBVjWBmifGiOFi4UyEjjA68OJqK?=
 =?iso-8859-1?Q?dltvyYtElRPDDMzByD0RHDpd0+vdd0/ojK1ku8T5iBWbdFsfHZdsHBr/52?=
 =?iso-8859-1?Q?T/Np//qiCdYftQqFUzJCCsmJnQD9cuQYHNbVuv0RLP9cgjsoCX6fc3Nw6B?=
 =?iso-8859-1?Q?HKMNKM8a98c1eBESPVLnAGyIvus3hSbPkqLC4QTwkSY8vy7YiMQoyYKek3?=
 =?iso-8859-1?Q?ko9Nw5MCuURCqLlPh88pqBA1TBP2N/g2pfyUE8qvsnYKUuhQeaavDVrqjh?=
 =?iso-8859-1?Q?jJCYt76aJTx+GDX09k0n5RnB5o72gkNI/hORkycsuHpUlFAc6g0y/Uz6N2?=
 =?iso-8859-1?Q?4/V3K+MgEPVH52IeYCAQFMQhBuMbcSoJr/mI1VrQQLum3IIppmHYn5k+Nr?=
 =?iso-8859-1?Q?33WR+neZ7pwK0yQs4NGscLu7WmUhG/wRqSfusQ1DgdEMys9lVpj+bm1iE3?=
 =?iso-8859-1?Q?DcFPlR0QUV5sKnSomd13iopqu3fluhhJ08cL66wezvROGlg3dtvf5DpKb7?=
 =?iso-8859-1?Q?n79xMY1el+Qr8yU+HzazUqLEcTCeQg7SqK+tgaOWumsgYN9/9Vc7zuAoVB?=
 =?iso-8859-1?Q?Zb3YMpAMCQO01YUalhWaEl0AltSTzCgqAQVdmPOsOfzmNGNZ7ifqoa5fec?=
 =?iso-8859-1?Q?CtZd2SRpEYK+rk/DcKsi2bh8cKrPYlv/l34Gp9vzSVzxuWHQrOoCWkVyMo?=
 =?iso-8859-1?Q?ngy8EeQqa/BruNYkB+glH4Oj4DozK9U43I2HXbT+P/2VC64ZPjdQRLkXeC?=
 =?iso-8859-1?Q?Co6fOhlkJHGszkaPol7WnTLE6d+mzhmgr424yepmyxKkBGiIa8oyehvH61?=
 =?iso-8859-1?Q?F3Q/6X39tZJSJRe5C7pugMyP49zgOmMoL+V1udL3jbqKt5vIOnUTQFlF5F?=
 =?iso-8859-1?Q?Pqux1MCv6jF2ddz9pBSxcvjYMKbMio6TJlohIg1IZqd8dnktJMoEwXUn20?=
 =?iso-8859-1?Q?UC7lV6Kx0c4ow42Bs9MIdgqFFQvIUUlEiDhkG+KOMop7DZEP1Fk7g636Ct?=
 =?iso-8859-1?Q?Es0dvwXytlVfjODgDl714uBW9osS9GWLtd58ioXHClAgfMVt2hJm9yP4HM?=
 =?iso-8859-1?Q?ouY/6ufv91DIkPBeYmvhTZ4fRziMMo+kaEZrfgMNZzpyEUX45/FwiA3d5U?=
 =?iso-8859-1?Q?cX0hkp32WZd8bssBX/CpULnE5FxdTd6251DIgolGhh9nLjhFdvx6uhuPBw?=
 =?iso-8859-1?Q?H30mSxx5EGnmnQa+LMYDSdTJkRK6GHq/L/U6f2H/3FqCjNobAfISdCsqj4?=
 =?iso-8859-1?Q?pxWQGRu0vRkingq/xOlUvBRgdhIF9k7Qe36l++WJDtIiZa2iPHWVoKTnlB?=
 =?iso-8859-1?Q?+eYUtCrpgg7QpEg2AXaCEa9Uo+/DZjUIWwkZ0fpfbHCrrs3rsJrewgXzF3?=
 =?iso-8859-1?Q?Nbw8kVeKOURlL58SNniNPwJa8usBvdPHq5DpIXch5oABVG88Wmx9o3PWNA?=
 =?iso-8859-1?Q?7SraNNTrrk3ggKJUTWSfAiKS46e6ELjA+DTxJApI7K474j90ptQND/h7C2?=
 =?iso-8859-1?Q?tbmk2LJoUhX+Edam3oHgh/mrxMb6wUhU4yliUsrH/Z/yybBANijddwFPZD?=
 =?iso-8859-1?Q?x0Psy2EzT0u9xXY2aZNugGq1xNbTKa2zH77/rHUp2EzyB+NdgKyl3aLtlW?=
 =?iso-8859-1?Q?dU5qeGe9zgfyzgEGGSUWTkWnI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f38f2648-550d-4339-21ad-08d9dcb9f2a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:24.6889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIwVnoDlj7jnROwwpTM58+Hn2x6xKcrMhwonVWxfTk0kexWutvWdW/j6zogLTTqDiwF0djU0d0MUyoiH/QUkJcYdBGy6WPW26xeQD7GkBLY=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vma_mmu_pagesize() is only required for slices,
otherwise there is a generic weak version doing the
exact same thing.

Move it to slice.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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
