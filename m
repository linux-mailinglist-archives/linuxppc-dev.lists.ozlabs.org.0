Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B3495C54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCjw66vmz3dk6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:49:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCZJ73XGz3cCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:43:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPTj455QNB+EVyVm224htK0Vc2P12e48zgbKtv4PdyeoO0GBzfQoghgjAWMi3+w2gBI6j/mBCwmdTRbWEfSp8Aksmu9rfQjNjD92UijI8Re0MQRFXNhQ+KHav/3k6vsPnW/gACSDSCmx90mKhJl0yFByets0hP1pBMGK3fHg2dhDSdnbvJqsTBi9EhrCnD2/Cx/Q0/h7/D9P/g5dh9UJQrQjtKGyuaCZPksaJ6G2kVXTzNqWQQONn7S/EmU0IRojW7NH7tPr7FT1vGsAO5LbIQMUzyTq4z913OyjIzEMdgbvyy0Q2IQbWSQz7eX5KQb57Pvzs35Djt8noitZ2lSITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9SuhqlOy06KBe0gYPpfKhVvBqJHRnDfSe40VkrHRks=;
 b=JaRA4mK0b4JTJ+RL40l4c0DISgxxmA94q+kSdMszPjb9j05rqTGIBJI3pRH4GztJFv7wWnPUKXTXtJR/3yFXUQRUybBvFSbSqdjRa7d60orM8E3At1q8CXBxhUvcmonulDnOpUY/nT6UWKYib0/Fz5nCEA/hP12Ufz3PXx5blRKIRb/34NaiFq+mmCDZ1rjsSApGYra2tNKna/Bf4INJKrn3A38vVhelY+DSgKT57yymv/FPm7D3PsYWFPPIyy+Ku8j5UkrNwWG2kU+DdTXB0nqDDrM+nEc2+ogH5ZZRtIHS//+1vcVSitLXFfsIIQpHLmMyjkJkuytsyPa2y0iutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:42:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 14/14] powerpc: Simplify and move arch_randomize_brk()
Thread-Topic: [PATCH v7 14/14] powerpc: Simplify and move arch_randomize_brk()
Thread-Index: AQHYDqLenb0tMTWDJ02+PYwHQDqHvA==
Date: Fri, 21 Jan 2022 08:42:48 +0000
Message-ID: <49dc4982c458867c66f022d11f16ad34e656cd85.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd402a8c-678b-4878-e2bc-08d9dcba00fe
x-ms-traffictypediagnostic: MR2P264MB0196:EE_
x-microsoft-antispam-prvs: <MR2P264MB0196C2C0FF4C648DEFD5861DED5B9@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O/9ozK6umGY0tJIszwAYxTiJgjiKCCBynk+LGK8Alwp7mRZqQcpO4thYpJrXS2PbHPzy7WZ8bYon9Hw16Z04wKmlS76/KYhmVpLKyLSf/nKPXCPTOXCXhyTb0iMjXZrPYayai921tbzRBMOzjsT35BWQPlbuYO7gP6wui/xDUUxIymOdYJFX8v06a3N3HefbLKcFNacpwlwrcGRFDpTzoS89bEtY3zT3qUMM43zSUC0cr0cc0/X75aKCi5XI8OTGoqaKSRrfpqh9jABKeWXjXre2E1NULvyKNuVAgGj5eC2fjNss6Ubs/MSCgYT45b8UuNz1NLKIb/aWjcebI5TCyDiQyf3dHnM+JnHtopLjFYIE5FBwelqCE7W/kAxpyGHUWgfDuiRzJoOrp8cxq5TsUb1BJzP0XNlRoJMp1pPuIX0P3wKMj6dHC25Lpuz+5JOSd5y6rOdlwFcu39Rqxlfmw2G+NAwI4i+HA7Bxo1TKKzTS2ROTtx+BoYBhynFpUOPCYUuSmf3/Pt4KyIWs7EfD5Wmoe6KuYXcQan40bN+FpQ7gaIasEl9gh2atD1GtNnbWRYV0mJtKwm9ieJpcausxrdnS971DFBJ3uVZpTFy0McLrkAVevqu8DMby8KYHQLv4oYjsmB2kjA8aCU8oYZpouqiu8++vVfRojNjj+hqlhJaPYg4oDZPeKNca+8y2xU5jXqUYXnDHmqMrpSig5YVlzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(186003)(44832011)(26005)(7416002)(6512007)(6506007)(2906002)(8676002)(71200400001)(8936002)(508600001)(86362001)(4326008)(5660300002)(316002)(66446008)(64756008)(66556008)(91956017)(110136005)(54906003)(38070700005)(76116006)(66476007)(122000001)(38100700002)(66946007)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?r7C3FOW/zL6zHNmBEFUepPumHD4c3g20NOC6K8hWLK+Lw4GbOBOaMOJcow?=
 =?iso-8859-1?Q?ytDzsvEoQgOib2l7vIMYj/XSVY9WE5b/Migd7qnMX4r2plnRW3pdUmnBmH?=
 =?iso-8859-1?Q?NOyY0m/qigUwdLoW1YeJAx2QIYOW5m0spYx2vOrHSDPFED/p1hqoQR2BSc?=
 =?iso-8859-1?Q?PlnrKcWLO/7rugcST/QxpsaLOwXedq0H6zsw+UA4JhrOKCUVcymjqmMaG4?=
 =?iso-8859-1?Q?SK242Ur9KoZWRyglT+sJu8dUE8ZyM5OZyYD7vFFquRKmMj374XaieTxH/C?=
 =?iso-8859-1?Q?TyaKA4xOLLSvAI7p+PAC8DcTvbdDipxu2VJ6twi3mGGQvJuXN9XopQstJg?=
 =?iso-8859-1?Q?5r/gw8zk2ANKf+LxCVz/9L/lSN3JJ985le4HtghPj34XsJXIr7Niws8JEB?=
 =?iso-8859-1?Q?ix8ggNPAyBSXU4z2rRHKLw30z8+CeJYHcjt3Uc04KzwgFfmaUkU93OfSp5?=
 =?iso-8859-1?Q?KlWGOP5tHabw2GviGr8AdVwHL82f8dSMQl0NBgYgehfSs9xbBuXkBBXeDX?=
 =?iso-8859-1?Q?tmJKno5t0Zo5H5NmWXI49WIYpkXcQOKnG26nOM7F9uzbpGAMEeDkDtSI8e?=
 =?iso-8859-1?Q?BNZiFL5+r661pUNm8sgrM3D0EAG+BpYVFCqNUdKzD4TfzKC/4CPL9FMBwE?=
 =?iso-8859-1?Q?z0xxsh2OZKH1SHo9uBdoEankWtDqyzyYDLrLiC9bfesO5hPlkqvZcft7bb?=
 =?iso-8859-1?Q?8SKwKjyAeZrB+oBKuds6SMdhFGknATntv5C+zfsfwH7b1Z3+qVJQoUBZsR?=
 =?iso-8859-1?Q?tDLCkZ5JUcqpbnHTvjkysjDOFwu/wqpcbdSqhbrpzZz1pZyd5jPV4hXizs?=
 =?iso-8859-1?Q?nfoOjvBTSirn6dsalUGnoj22/yFTTZmZMd9ONonYlaNuODUD1ump+qQ32K?=
 =?iso-8859-1?Q?8G098kEiNQs2Q1KSVTHkXXgprPC2nMhlLQx9C9cMoIFgSeW1v3A/2q5tub?=
 =?iso-8859-1?Q?p2QaYA1QiftstxYLsXpCGTw5TcJcpZph4qgT+/mXN8aHEiLr8JLyVXr3OI?=
 =?iso-8859-1?Q?nZN2s/7+qe85wGOS6i3E7Qo9MMhaptW5S84sy2TaTsNmaNo+HiLL9QBjvf?=
 =?iso-8859-1?Q?c87IzR2B076LdVVXeFPmKOsaANQfyQvNhUYkOYHYMF0X8DuXkfMMnhi8bj?=
 =?iso-8859-1?Q?T5AfoWehs8fZ0dKW5Mq09IjkJ5QpZP90bj7TdkqxV2r2dAYxmPPdesDgoV?=
 =?iso-8859-1?Q?kppV2QMRNbfHOIYBX+Fu+jWk+HReSszDLcZFHZbd7G8+4a9tEcEax5VxJd?=
 =?iso-8859-1?Q?YHUaugghbABAjGpRCN1skYNHGQ0UnaJCEhStOCnbY+yO2AUiXP7h9k78Nq?=
 =?iso-8859-1?Q?OaH4pHhT5SVLAK43Db6JkMEvEzmnRTTF9doujXLEAWTNP5HOeziMcqtWha?=
 =?iso-8859-1?Q?Ok4+ocy8Ofh4b1VbRbpdFB+zbag/zIGGp4jD7jZQH1NvW94ktRscYjJMEf?=
 =?iso-8859-1?Q?imzeHPZS6aZOshKxEMJh7Y7wMVJhqwX1phf5hMLb9a1/7ynezPeeWJjDtS?=
 =?iso-8859-1?Q?vtfJFzvcdvyCU4f65Gepa/iQqh1DuexkBrGIfz5kO5Osd38+1G7QWGfnrE?=
 =?iso-8859-1?Q?aNiCbbwOpzGS0c8dWvFxcmBy46Vxb42X9frvviGXXEYS9oZedlyXfAarn9?=
 =?iso-8859-1?Q?NTeAx/d01zu/82uAsmzv6aTsqA++G7JA9qjPIolM4W85Wb55els/unj3ig?=
 =?iso-8859-1?Q?h9vYp/odAtxZLghB2ypi2ZbsZa3dCOlMP5rMf8xfpU1M7fQGsEMnnL7viv?=
 =?iso-8859-1?Q?cniJ0KaElhWDhRPzmeF0HFSdY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd402a8c-678b-4878-e2bc-08d9dcba00fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:48.8055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdQOI9rbEU1DV/T6+acUVGQZdYJarLJnno5XF4Nh6zIe3ir42Do9dVTOoQVIgmr9JE7BkH5VKAYQzZ0eAyl4msu/TG8791Q0vbVXf6uwn5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0196
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

arch_randomize_brk() is only needed for hash on book3s/64, for other
platforms the one provided by the default mmap layout is good enough.

Move it to hash_utils.c and use randomize_page() like the generic one.

And properly opt out the radix case instead of making an assumption
on mmu_highuser_ssize.

Also change to a 32M range like most other architectures instead of 8M.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/process.c         | 41 ---------------------------
 arch/powerpc/mm/book3s64/hash_utils.c | 19 +++++++++++++
 2 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 984813a4d5dc..e7f809bdd433 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -34,10 +34,8 @@
 #include <linux/ftrace.h>
 #include <linux/kernel_stat.h>
 #include <linux/personality.h>
-#include <linux/random.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/uaccess.h>
-#include <linux/elf-randomize.h>
 #include <linux/pkeys.h>
 #include <linux/seq_buf.h>
=20
@@ -2313,42 +2311,3 @@ unsigned long arch_align_stack(unsigned long sp)
 		sp -=3D get_random_int() & ~PAGE_MASK;
 	return sp & ~0xf;
 }
-
-static inline unsigned long brk_rnd(void)
-{
-        unsigned long rnd =3D 0;
-
-	/* 8MB for 32bit, 1GB for 64bit */
-	if (is_32bit_task())
-		rnd =3D (get_random_long() % (1UL<<(23-PAGE_SHIFT)));
-	else
-		rnd =3D (get_random_long() % (1UL<<(30-PAGE_SHIFT)));
-
-	return rnd << PAGE_SHIFT;
-}
-
-unsigned long arch_randomize_brk(struct mm_struct *mm)
-{
-	unsigned long base =3D mm->brk;
-	unsigned long ret;
-
-#ifdef CONFIG_PPC_BOOK3S_64
-	/*
-	 * If we are using 1TB segments and we are allowed to randomise
-	 * the heap, we can put it above 1TB so it is backed by a 1TB
-	 * segment. Otherwise the heap will be in the bottom 1TB
-	 * which always uses 256MB segments and this may result in a
-	 * performance penalty.
-	 */
-	if (!radix_enabled() && !is_32bit_task() && (mmu_highuser_ssize =3D=3D MM=
U_SEGSIZE_1T))
-		base =3D max_t(unsigned long, mm->brk, 1UL << SID_SHIFT_1T);
-#endif
-
-	ret =3D PAGE_ALIGN(base + brk_rnd());
-
-	if (ret < mm->brk)
-		return mm->brk;
-
-	return ret;
-}
-
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s=
64/hash_utils.c
index 154a5a860959..d28003132a51 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -37,6 +37,8 @@
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
 #include <linux/debugfs.h>
+#include <linux/random.h>
+#include <linux/elf-randomize.h>
=20
 #include <asm/interrupt.h>
 #include <asm/processor.h>
@@ -2171,3 +2173,20 @@ void __init print_system_hash_info(void)
 	if (htab_hash_mask)
 		pr_info("htab_hash_mask    =3D 0x%lx\n", htab_hash_mask);
 }
+
+unsigned long arch_randomize_brk(struct mm_struct *mm)
+{
+	/*
+	 * If we are using 1TB segments and we are allowed to randomise
+	 * the heap, we can put it above 1TB so it is backed by a 1TB
+	 * segment. Otherwise the heap will be in the bottom 1TB
+	 * which always uses 256MB segments and this may result in a
+	 * performance penalty.
+	 */
+	if (is_32bit_task())
+		return randomize_page(mm->brk, SZ_32M);
+	else if (!radix_enabled() && mmu_highuser_ssize =3D=3D MMU_SEGSIZE_1T)
+		return randomize_page(max_t(unsigned long, mm->brk, SZ_1T), SZ_1G);
+	else
+		return randomize_page(mm->brk, SZ_1G);
+}
--=20
2.33.1
