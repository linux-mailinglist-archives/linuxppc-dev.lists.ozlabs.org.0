Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5F4788FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlgC5SBmz3f97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:32:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYn5kK6z3cZZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvJ0eHgsX3LejI2BRmnYXYO3+496znch4BFMYqqKCf+RGGxUfh0UT0XBaKwUTPGIz1/HisoEdZ15bF7IbjnWCceqhwzpmgVeDS05GruQaCwnhhkTlFvvwo07Ch7IQpTLkxuCi36ekUrGd46ttKhP2Ub3gDNTklLcKLyu/deKlQoQUbHxVXpt1j6CYYObHQPXebVQd8LuK1BKEIo8sRxGKkTqTDGrPPRlxxXyD7VHFtaIoNp1aigZuolui2mJwhtHnaptr2glbdykbRa46/w8VHytKOb2Ywi3nDsUJaqN785+iPPu2zA6VHdei1z2XL1evLjFnvG4UE1UjYE7rJDd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/H5LlacuEM5f+URl9CL6CXXwKhBdc5iypoM/HPJGE8=;
 b=PY2XRcP2KwdniQDEpz56RQ52VEJzwBBe8enfKj3R9y9dGw5hVrbfI1+HNKNCndJIInYe71KznHQpX35qR6HdHO/OQX6jpioKQCuA0qbJycWe1OaE8opQqB/8eXpqIgSdqI/5xM5viCYVkXCwdwF9mJqmNuHr3xf7HphWeKRr4K9B1QVC3UuBEbg4szjDuNyEnsri1mOk9Xc06j2VtIxiI9LA0dXU4NoUzDOWrlA0036p1GMSNpRDkS4uL76xNVCxWPjeJfpzO4pjIvlqBO2aPD8n6rpjaoQcCEG3vS4a68LOYdEtColsI8Rb8pfoeoN8kaMGL5sMca/x4vyM5NuStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 09/14] powerpc/mm: Use generic_get_unmapped_area() and call
 it from arch_get_unmapped_area()
Thread-Topic: [PATCH v6 09/14] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Index: AQHX8zDA7wQ3g07WgkWIeuZ4wqz97A==
Date: Fri, 17 Dec 2021 10:27:55 +0000
Message-ID: <e43d4ee5baafbb925e026cbcb1fa554dbf0a09c3.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cca97c2f-3997-4bad-4b71-08d9c147e365
x-ms-traffictypediagnostic: MR2P264MB0194:EE_
x-microsoft-antispam-prvs: <MR2P264MB0194223D24E5D2CAFCCE5E4AED789@MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NeCtnT0CGOj3qAuqQHSmbiKSzOpq/jT+H/dPbc9W9UYTbSMc4u1WL949WfcXR87I9crDwNSuiSe1wQLxEKzZ6zPVg3Wl6SUA7zQ0dtRtI0F/Ac01LdLZP84w+bkPGmn4sDylB3IUn49OHuveZDV8yLIx8ljOc3U64e4BnOxmGIAZ090u8q7wZH+d2wP/NHE7ptcA9lqwttnfEAYpshxcxzGcruYMmNC9bCVVF5+2DWnETdbFKmx6eBiNSiJYxVLJH6OTRj+syrnSwbybKG4rbFqlLWYOszKA3ga3rwSd4H2jSMcTyypHiAByoZiQCCOwyVE3R/1rHGTdZZVyMg0HNGc7ImfTFq3F8mRZPRusHvYFBX0t1aVsRcl3Wam5WB6JeYSRzOUNrfDmyh7yRuKiG/Dwz8NOaj+ThUZ0hVv3ShAKIaf12PoPyMSu1VvCKGpulz2dytvILDWSYFYHcfPmzWme+hpP92jfnTTwPShi4l3xOFcS7rrrQCR0cK4B5XjTvjmhfX4cRzPnAlXNWPCLKH+Ny2OseCcgXfx89stpDEjv/nzF2G9DbCZzjj9cG0Pi7AA4wMD1ogmoKvEVP69WuGPVnBwSbu98d1/97n1mOdOrN/+onKQaFIDceRMibctmAvIyX4yYR09JXedBdVuInwsuz1NHDaMCvhEEKLNnYWIl4RWuZ0zxyGyXSirUCGKbiZyRnw87vB93IUizSPUM8Rjy4aJvIuMvEWZ1KuYQcwA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2906002)(66476007)(66556008)(7416002)(36756003)(316002)(38100700002)(186003)(44832011)(6506007)(66946007)(91956017)(6486002)(26005)(508600001)(4326008)(76116006)(2616005)(8676002)(8936002)(66446008)(71200400001)(83380400001)(110136005)(64756008)(38070700005)(6512007)(54906003)(5660300002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vE/VB+s/cuHaVigQjZGUIjBLRSC4GK9p54HVKHaVv09PK8XIHzzH6JJVGa?=
 =?iso-8859-1?Q?WevFFdt4ln5rQlTU8+IuijXKlGqUQ9JNrzP7TxQr7M3g5KASSgr9syklfo?=
 =?iso-8859-1?Q?poaFKbLn2MZESlB0yXi8bOJmd7khKEENHUjfmdy3RxDysk3l3UDRnK7DhC?=
 =?iso-8859-1?Q?fptzoO+aSHTn8kIeqoGnNfdacxKGR19IKgJpXcHPjH0/u6Mb1v/pDbtTBH?=
 =?iso-8859-1?Q?Htvthv7PN2RtbQMEB3e23eFGAqEgJCamAbJH9a1b2Qia977uSSjh44c8OB?=
 =?iso-8859-1?Q?VosujEnbuhfF6ot3xrJwmciZpr2f7mETPm+GslT4Byaq334pVo6qYolldX?=
 =?iso-8859-1?Q?8Z7MCMfwlO6RQWk/xutsHiI29iLZr5Nu3ngDT9awR1PN9S/dyS668tjoSP?=
 =?iso-8859-1?Q?KJD2ERI8t15R88oyPlsi8JxQT+QWMl3pwLUoXoBUIm9Bau0NsgpQecWWid?=
 =?iso-8859-1?Q?9auUj+SJjqkW1La2LUX7aROkmcnDHWVNwq6RkhXXdjH/g92sZgT3Yc2VvE?=
 =?iso-8859-1?Q?xABIctioOzqL+lg0U8and1pULn7cgPtoO9yxX3QBQSVQndfejU8p7NB+g9?=
 =?iso-8859-1?Q?5xkgEQnPw0ya0Caiau2N66Ce0qLe5qCAMwxE8IaWbrtZfl8gqi0ttlfgu5?=
 =?iso-8859-1?Q?VLLvYucEjujxr+WZSZ/+BCp1dSqcFtv5wsafji86fsX82AvGURxPn/0BxS?=
 =?iso-8859-1?Q?vJVcEO0zjpqk9jvFILIEslT5MwW+ykLjA77TCeAv0ChjllKUzYjYjio7nC?=
 =?iso-8859-1?Q?G7FgqX7T5undAiScS0tOCVvC/h9yy9a5RXPtjjhp5r+KYgbn5nRsb8NCqB?=
 =?iso-8859-1?Q?x4fbjqOkDTgKwnKekR84QzeOxVrDr1VH3LHll2bxGapE+3R7+WDZ0QRpRR?=
 =?iso-8859-1?Q?CC1EurzP7tBS0ud5WcRjF7rd9uh+0c+cL/18NwlxGlsNlN5qyms3mHf/zC?=
 =?iso-8859-1?Q?59q/baLpfztrnfdpUL4bxxpfQj4mIMhF6Ap0b/Nh2KdIeax9o7b7Yrd1sS?=
 =?iso-8859-1?Q?+qGM19ks0Nnffoj22mlvw/OSUyj4GjcLNt6LoRfQxdsRuytUm2AfWmYU4x?=
 =?iso-8859-1?Q?jb1NQPKhMiyGB97sZglukd7DR60zy0wBj4fZZvLK+I13cZ7pCmwKSygdEK?=
 =?iso-8859-1?Q?t0vTKmQxxLbc33x2LCHWvSVdf2GvlkPjRUFu8m2rgkzVq4JgO4ozOhRIfg?=
 =?iso-8859-1?Q?3m81RiFB9f3XqYZMZXQzmytF7H2AH1ZwnyBBF6mgfA6uzWrCsKeg347D9Y?=
 =?iso-8859-1?Q?pGD6ZMETlMlgbEQ42D8AphOKQXC7ellMXKqTe2m3BDmX23O19SIL0CTqq3?=
 =?iso-8859-1?Q?U/xNUA445YrQMDpn3oIfMKDWXlzHnY7nUrrURT2/Z7JPA1qEIFrpLBoSad?=
 =?iso-8859-1?Q?GG5U8VAJvFHH18vdewpAOZAaQvlkyLTVFzjHE7XBh66OWKJe3VzeOrF9HO?=
 =?iso-8859-1?Q?TSjPyJQWm0g9h8SiyFOrgHIkXzfGbpNpaStGe1eJVEL4mAndnRKjFP5Le5?=
 =?iso-8859-1?Q?OaxNDauu7+Z3sqMPLSxcWekHedHd1qbox4Qx+d3thx//1sG2gT5Hlo+bCn?=
 =?iso-8859-1?Q?YwBpO167Bi0TUEqemfL/DdMtob3wNgY5FkXYzcxvZ1fymlCwEZj6uskUHg?=
 =?iso-8859-1?Q?MZGxqzD9ESOwfCtVRq8clFK036Hke3H4w7B14EKD40wxoopeRXGS/b3CSX?=
 =?iso-8859-1?Q?qKHgVU9l1ozxrU2b/pyAIDFh2wY7qsWsvQiJMF30YfYKP8T0n3gh+MoLsG?=
 =?iso-8859-1?Q?Bz7NFCNSIntLbty4H7jVgU270=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cca97c2f-3997-4bad-4b71-08d9c147e365
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:55.0447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jyt6VKyqtPWpXc0+9osnGMJ5XoxIQmCDMvFrPaCVDfHd0bZcVEXQ25FU4TogD9qRVYOPaj0RTeKTXK5r5MQfYGp913xEHMWShENuL3hOyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0194
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
index c993482237ed..0544764b32c3 100644
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
+	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? TASK_=
SIZE : \
+									    DEFAULT_MAP_WINDOW)
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
