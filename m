Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B57A46D5C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 15:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8KRT2lcKz2xWl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 01:33:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8KQT5f7Yz306s
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 01:33:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzQuPnSZ2J84YMXwFSy+HcFjzSEB1/l5U4eGEWee+DCKTJaowVkHbaP18YxSbrRk7RCetA6UVNulIu3/KsTmWX4g9vC0rHKEM2fCb/P0yOqbUseqvQ/X4nWPBollSFO1lsTk6m9AcKloPEYBihY+uLY+FoZgYyKp1unG7NstKXxjbtJlk34Ec3u96IVHbx9hQ/DEaY8fSJY1ZcN+PIK+4mmR7hrwRfW00Znu3O/StIpLiBDQbsVi+5Bxc87+ymsTRjn+8Q541CK73yLhormsH3yTYHVQ+M+mamRBI1/yttiplHjA5dURwxPSAdVyxb8PU3P3nqNLpFCZ6RORO+kIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t7OwxadSOpUS5cr1JIEP1Qf4IwcxeL6mx4ZbhZQykc=;
 b=Y8+06VqY4lrkVvtw7nQkuAbjzAN1C53hbjbFscgreBhp++Wz3X4I7+8r35EHw9wM/a594t4306AvKHF32G69rcUkxVOFWJu00JOG2DQd4hZdGarDYrEd9/JCrHcU1gunf05ZspjiZXiqmiXYrV3rtn3aAJIk07aUSf9dhcIYtX737+0Hln8u/Hfs4Q31zAdK+Y7e5ebZUwrw5VICh1ppVvubQaw913wn5LRTEdqPRxSdVFN14rEDGBil1JfvHIG9iRZqIFu/IhS8q/pFv1qR/wrwQbt2o9jAasbo6YL0tO6mKVAjT66fY3dVepPuADwRMx9KHAtJ1AwHelynrQvoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0357.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:18::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 14:32:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 14:32:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc: Simplify and move arch_randomize_brk()
Thread-Topic: [PATCH 2/2] powerpc: Simplify and move arch_randomize_brk()
Thread-Index: AQHX7EB3EE2L+6Yk1kqjILMiGdDXTA==
Date: Wed, 8 Dec 2021 14:32:45 +0000
Message-ID: <3c5ffa5d102c9edbfeec19072416b33b102fdabb.1638973836.git.christophe.leroy@csgroup.eu>
References: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe428764-f7d8-4670-833e-08d9ba579a13
x-ms-traffictypediagnostic: MRXP264MB0357:EE_
x-microsoft-antispam-prvs: <MRXP264MB035714095CA37B78B6100459ED6F9@MRXP264MB0357.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 05Mbc6ItvW1QnVXEQ+v0MkAaD3QUGw769jFq3XKHnTPkTfgFu8nZ1c2/VV8cGVD3msqyFG6W1I2Aexj7GLmvGHwTGp3rjoMw2IDtSwAkEqrdCZYSzGeklFJ6gcdc57NMt8+tsgpFqpcXN/ZBX5YiGkZ6PLWqAtqngCpWBWOCbsAcCOrct2OfDzU4caSvaHqVUwf93UE961jL4xJrW1BrS1j0BzYwrAEW8KvPSrpEfVEVECBAsmIAjsNnUL/oUGSOMVvQY8DeYQcVmEehffGeO3VfsaCKmxuyjJ0KHsmPXi+0+99SBCIBZvTPJo2pytQt0OY+0JnQdvzY6hsPUq/IHLQH3IdNTntQCuXX96CqUWUO39/zDbPN+jZ+qYpA9DDxI4fxKwsnT8bqOyMLJOJ6zwrpd05uAdxQbKT5JwZXJSXUqebvgRoH5urYFVu73kOWmSneejuyfHcHub/ac2kwO/g1R+LvDMHKG0N16R98xVW8WPHQiJPtWodU3mTtP3dI8AZDOoFXqG4ziTT54kHpSyVplDxExz2prAqir3TmJExd5aZjSk5uw3hzqC8Izloi4v30WzH8yhLHboIZYiV+NrcAvIhzHvFWAJzmxuvcgMVzlkImCCBBbEl2yh2ADxNVx/DlatmJPp1hNe+kZR4580SbDGjbF10OeqOK2doXaBC0phfCdqBVwot/GwExcGRJcbnn2ZuUO3fVyopt0vW/8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(8936002)(36756003)(4326008)(5660300002)(66446008)(38100700002)(122000001)(8676002)(186003)(86362001)(38070700005)(54906003)(83380400001)(66556008)(66946007)(2616005)(316002)(6512007)(64756008)(91956017)(2906002)(76116006)(66476007)(6506007)(44832011)(71200400001)(6486002)(26005)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7Ubokz1MEtEhkB6nVYVJ5mwBwEv5BLkqMhGbgOWS/uhfqnNSDVYjTRH7W0?=
 =?iso-8859-1?Q?FwOTDnMDslFmLj1RhuR2NfypdzQeU9fKKd9KsgV80v8iqVEvHK6cV64Meq?=
 =?iso-8859-1?Q?0ekXHdmKzxZLZbJUXW6N8z3Z8/3sg9G6MhA44F1zlhyLDIaMx4iLjb7PDF?=
 =?iso-8859-1?Q?DHPI0z7Gv12+9gqNLPWn3vGAcD0dU3c4bdSQYanQvZN1U+dZcL6diaY3UM?=
 =?iso-8859-1?Q?rVub+p7N/WSmjfPgt04sYPnCzi69CnM/q/AYxWTbzKl/q3GF/i6FKVvlsF?=
 =?iso-8859-1?Q?MjwFHBMtoZVZsmdSAmxKrls9N7xZSw3ZSTvv9HM8mJw+3zrr7gCrEQi0FX?=
 =?iso-8859-1?Q?+8T+j9fAZpu+PLxLq2SIgF+1eIIP3jqVWxT9C1Aj6fpd+RrU7LM3botH1s?=
 =?iso-8859-1?Q?J5nRa6JkQWwZK0uUhnlXnLSjdolgqGbRSKAWnUi76Vjm1sZQsAVNDOT6vs?=
 =?iso-8859-1?Q?EdM28bivxY6UYd2r0vjlnSCnC/Q/C56/ez2+wTwZU21W/e+mOPJ/bQqNtn?=
 =?iso-8859-1?Q?ZXQCmiKCoqCD21zyGUQS1C3Xn1FE4WiGqqX0dV/t4W9KrTzz0UuDPMZghh?=
 =?iso-8859-1?Q?cCtnUH0NfzXNVzgG/cRtRbKvGE54mwrPCgtg/fMW7YEVHjCE/LfZTPbGXe?=
 =?iso-8859-1?Q?D7lx1e8pfIpsnnT/l/HzHPXK9AXXsMd5qPBsbsnLBhI0UwRQCzXzCr/Ek4?=
 =?iso-8859-1?Q?JVbujlzIxUDkU+xehnu1dSgfALCIpfMHXolq9rGWN8eiqtGh3HZCvva+LK?=
 =?iso-8859-1?Q?WoVm5XHQWRfeazalrwmxLBjZczDWmVixTxGK+fi6PfpNz8jjbylu+/Z6Lv?=
 =?iso-8859-1?Q?lSkSwAASmsvKuBvGj04DmMJVPi+p/Y0AKGms+5td2SYb40hKqGaSAnTzT6?=
 =?iso-8859-1?Q?2rta+6DAIXi8xWufPWsJ/HaykRtWN9OmJ9GyfVUxJlkkjfxlCaWUd5ic3s?=
 =?iso-8859-1?Q?vYvREywWyotHftiDpkFzM+NuYgeEewhgF+SJLDtzF+6hj+5GN5GpAUeBWy?=
 =?iso-8859-1?Q?LAizsnSACbJE34BXNBoonwGO4t0bEZc+0bBHyABq5EX/rNEN8XzRRCl6qB?=
 =?iso-8859-1?Q?eG4kIpkJmvRchPenUHn7SY2qzBfu5RoPambkfusKsM2jks3SfDxoJX8T5K?=
 =?iso-8859-1?Q?q6uuGFJ4akhmewPfejNaU0rLF8reSu/NEhP+D2ZAzuJ87dWN/UB/nd0jui?=
 =?iso-8859-1?Q?Cq9I6BcOEMokRgdVAvPxuwovzMEB4DHM/jOOq3iv+FTXTr/9WPcvkqi8uS?=
 =?iso-8859-1?Q?lwdZXJorAj968bK+WG7F/2OgqCnsdL+/XFeXh9p/Zgvk1GdZYvLNCduHMm?=
 =?iso-8859-1?Q?N+ddvI1fq69KM82cwGGsQFEnvuMaKoLg407IAEVRM3UqrgD4f3L/VLijph?=
 =?iso-8859-1?Q?psdrs2yPi/NiivZT60VqgzFcJ6dW7abmynKUHhTDytFMH9qvsK/50x0CJY?=
 =?iso-8859-1?Q?l83IGRCabuF85dTrtHEh6jRnUHwQy+Hq1c3+kRmQ3YbclE587b8wArP69s?=
 =?iso-8859-1?Q?XRMtTpM5Q53qFnf0uhLsytIQgBD2MeZHliwENoeryjX7VhWlmW6fzRGMqO?=
 =?iso-8859-1?Q?yR2fTc9wxK9qoEcD1pwuEgaCDLzWuWrkR4DFT4BNP8VNgaw6dgdNFEmC5T?=
 =?iso-8859-1?Q?iRZh5iAsFW56BgxzPjgg2JKGVmNfe+5MVSNqNgZ+rQTvnTL4urXIDzSLZ2?=
 =?iso-8859-1?Q?aShi/lJT74DCem5rxSZLYltRzDvi8QO6WXPYBl+FyUciJkIQAIaCdt5dsK?=
 =?iso-8859-1?Q?PVxS5BcCIb2SdaazV2e52YBB8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe428764-f7d8-4670-833e-08d9ba579a13
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 14:32:45.8859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDNezULlxKUM9qMWQTaVnFTGkdbPNYIhl0NWIYjSu/pmwPGzUb1NQ08EQdfQh+u7y6+/+ciXm8gGk6y8QBDVULQS0+Ls1qmpfnVs3bHfLTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0357
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
 Applies on top of series "powerpc: Make hash MMU code build configurable"

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
index eced266dc5e9..b179a001bfa4 100644
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
@@ -2185,3 +2187,20 @@ void __init print_system_hash_info(void)
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
