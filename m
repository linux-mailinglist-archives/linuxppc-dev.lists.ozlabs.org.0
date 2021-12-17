Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B756478907
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:34:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFljS216Fz3fWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:34:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlZ86Zlqz3c7r
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+3N/LfyhqJU6PpPVS6vXk44k6zr+dcan+r4pGDooZMzBiWk1oOj9BkQNpJjpsxxTf3cTXSfAxGYS1qpnEOCUFNQ9LvdX2g4JmgcuA7XvnzgnlHtREe8a0X57yyAnCTaGZb7dzOhehZQwYy4Ch0kn88RYpDKmqdSGtcXM91lSFl8m9MPzL0rnqbvBksEfWlNriM279ojZsMZ4qsiOc91HHRWgV2o5aWWIg2ub0B4C4orU7h2cbCDY4UXNclyePA4aZRED5QDQKH5v8A1c9AGO3lIE+aH84oUnUPI+29el5EscIBGnLzhsXXjGENeYsfnzqt1X/SucFfK9HSGS4jBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GCE25qRm2CGxDvHUrHXVel7PPUjK1mixNc0dChnkIs=;
 b=l3Vfvv4ifluULQPW8L1DQhRBQhsAybsmqdIuj9Zf8gyFa1t5udIvX3AtCsJOsOqyDTPBap4w+Fp8NhYWIDFo0rgkYz8hb+QRhls2x+GfuJVJPjY9XtiiWxG34DPWGemRe8lebSOahs7dzxYBhO3mlii5DIVGBYuBxUKhge0ZTRri0LzLL+PGrkxz7bhEjwlbjOsjHSJmORtBav4yuWRrz+T6ZKZLWmC6G1W3nUtrDTchQNz8VZUgGQqxzOF9kgdiPNyfdQFf4vSmxOj2x/yUjI4JXl9BCZHwP601mVWKzbm7uAkv/7U44pmYqdDaeBEeY4/CepYRPYRenppIc7IJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:28:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:28:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 14/14] powerpc: Simplify and move arch_randomize_brk()
Thread-Topic: [PATCH v6 14/14] powerpc: Simplify and move arch_randomize_brk()
Thread-Index: AQHX8zDRiLqEcN60akW2b/fzMqW42Q==
Date: Fri, 17 Dec 2021 10:28:22 +0000
Message-ID: <9ccc69fa94297835dde68b30759be7280333c8b8.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0267c4cb-a780-428d-1fc4-08d9c147f3a5
x-ms-traffictypediagnostic: MR2P264MB0146:EE_
x-microsoft-antispam-prvs: <MR2P264MB01468303BB59C19EC685D3C6ED789@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zSiIrs0adWpAvkdtXDhQHJarAfcVImcnWBb2+znDoEwTEHhFQtLGgO9OP966kcU2IxvspRpYFqpPtNkpX8jOE33HoqioMipVxFVVPJ2ckw62KVOwLTsunjsVaJFcQt3N98uOSr8Pfa9ZSsXT/ibN3gEubwX3LCW7SB9BNwbzuwCXUS5ssatjBEe55NdGyhyokHfkb0Mfk/Ox6gP0pthYgi7ZoRsWQIRkLPWTmLNzKF7R0Muq2uSWrDvKg4mcvvNZlIaovAbjMJsIZNz2xnen4LtxHObmWawthLAgMgjTMGzmz4k8GgwLw29xOVCBbtHgM5EKXg5PfKCZkmFIHAlvc4+MDZnWAAb9WQO5sz3gByJwfDgnEsbUc6UTpm5ykZI4HDeimmXg32+BkxpaH17VB511Ikp4jzxFLNepRXasJ2B/mAyGsQa9X1+c2/MTU4GicSPb8kjen0ymFQ9LVV6nFrbAoarff9zNy5L7iOyKzgv7Ev+wz+PgRQiE771C//yGk3+nHUcBSr4Ery0UMpdIksdo8+RBBYv45hJZQbNkk1YI/uZfwv2yRJoq3blGhVbyC3YbPr45jP1EfttdbFoXcpvHVmCbZwyynRBTmWglokVVSFJj8sL5d4DG6ilfExxY+yweanatKI1gZJQzoP+o9WsDwPhvFwKVrEypNXWqD7mU6TtRNUp2FzZH+ghxnjfpBe54ijLIymn+0soe2/rs5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(91956017)(71200400001)(86362001)(83380400001)(66476007)(66556008)(66446008)(2906002)(64756008)(38070700005)(7416002)(44832011)(6506007)(76116006)(4326008)(36756003)(26005)(2616005)(5660300002)(122000001)(8936002)(38100700002)(508600001)(6486002)(54906003)(110136005)(66946007)(8676002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CNCfu/O+ewrU+mOLOSA/Eh1QYu9DwABvzZRPWxuDOzHy2Ur4IoPxiKxJZX?=
 =?iso-8859-1?Q?slRyHg7s/mT1gGwjoFps3y5uCFxE1iWmUTfJjDFkAWVRDw90DbkWHCVAFe?=
 =?iso-8859-1?Q?tvMs+qCsIUPhrvTxN9pNeDD4V0WwnPtXOTrBFF6+4FIuvAKOQiTO+iHoJ8?=
 =?iso-8859-1?Q?mt9RbJMOaNzxubaTbdGx/fdFkBgqA0Ah2YBt+n7xxNHNFqg+lO+74bvtgL?=
 =?iso-8859-1?Q?H6VeXpqtkgXtoF96TXtQdH8jsSJFaqWzUIDYd28BnpXTJ7oj+dYJZ+B3R9?=
 =?iso-8859-1?Q?JHKWxO9hUgjhCcqE+tgZ20sq6rJlYYnclIzwrJzPOsyByptoQ5qWlFmWrs?=
 =?iso-8859-1?Q?zDJYC5vEk7rXdGblyHAjQFiLQIzd+W+tmWS9BhS3QR61vgHuRFjMhkD/ed?=
 =?iso-8859-1?Q?0AvizCVU8/lRp4SuTmBLF8yEBkzL2wreyU/UzCZ5TVcNKtngk2ebdGEUB8?=
 =?iso-8859-1?Q?/dHPtHniMO261sxB/py5nZD3daev4aLkYAhs7w78faPzFb7R2Gr0p1G7Ij?=
 =?iso-8859-1?Q?kRp17J6ygz3nhsp4hNQM+3TtP4uecmxiYbvDhoiry4NL565t+h/Kxn/61U?=
 =?iso-8859-1?Q?Vp0gCrTXCUJwRu47mRasZVrdsoO3PGaWWrVwPcuF4+EAPTi/CgpX0SwX+B?=
 =?iso-8859-1?Q?KXfJleotVOiC6O/awU2F8n//ojSH7X99XIW18XVmgaIQX2ElcK7LmSJW1W?=
 =?iso-8859-1?Q?0pxer6aLPyXgcdcH6/N7Ixr+LLXa31jZKvNaHzYO4jQLQWPjBsuTTiCTu3?=
 =?iso-8859-1?Q?G87h69ujBI3YBF6T1WYz8punmI9p9SnYlGlUq9vbfKTOdlSTYKDdwdj4eD?=
 =?iso-8859-1?Q?F4LqdW5aDDKHCmgVOWwxz3OjgnHZJhQNmDbAenbyUIFhuHK3Rf9v6QYJVx?=
 =?iso-8859-1?Q?OENUH7XeuHtOqrt7kpPRqnTdz3NK+9U4BNthMzQntpXOKfwWPt77kwZrL+?=
 =?iso-8859-1?Q?2Tr+4aGOviUHlc18H35M+e5SQ8F/H6aCb9EfNwZcHS9h60d5lHX9hd6LqI?=
 =?iso-8859-1?Q?teOIOrvZHogL8EtvY2zz1ajnHOR1UwQvQcADgws4R5xgsrymHSBOlSI11/?=
 =?iso-8859-1?Q?1fRSkhFlNule0tnOoow8iV7XtMizO/TTxo3Yfpf/RQMcmisR3vQu6sk9Qx?=
 =?iso-8859-1?Q?w0Uks0fOmtqb3I3aZN3F6xaCq2A+aqD/2O7Ecxg8ZVT+GrKDJbxp/V/WDB?=
 =?iso-8859-1?Q?Yb9bPE0AE0sDBZELTs82+ZOfTRbabdEf6D7fkAtOMwIRft3RAiwj/l6Abw?=
 =?iso-8859-1?Q?vghls0c4iyZ2Bs2Oz8epzQtPDbtSdEmzKH/PNEjS/Cv0NgGIUjptLhF4E+?=
 =?iso-8859-1?Q?0P/VthPTW1zOk62HwUUyz4qTS1yAc+n+eZsmYMMUzYKpc5udgdFCt0tNOs?=
 =?iso-8859-1?Q?sw6x9ft6FD9h+XZ9PEkFul0t3tbdiS+ZRi+H+ncG7dkxP+JOO2DhQ0A+0H?=
 =?iso-8859-1?Q?DhKQd5OmLpCtPtwb3TNTJY3fM0oi1fzxjds4OTAu+1nGntptvDKkp/mLdW?=
 =?iso-8859-1?Q?cojUFDfavKH1mfPpwqoAruGw1ssEYPM79zu/8IWPm9OH0+YTT6sgiecMuf?=
 =?iso-8859-1?Q?fdq9j6HyrkbqFr5UJ6wpRoHrKMscbyjO0F3zWWBOUN2/DFNciyiTjIywMg?=
 =?iso-8859-1?Q?OXMlZw203zN1ni0RjkIRZRlFbb8pxPYI2ZdRwTgSF410vW9r59wK0lJGRe?=
 =?iso-8859-1?Q?Lbl1kcxTTqKaaanteT0yVgF//3BVemzGj/+KmnPb5yGTlB+1u0VAsbJ3tt?=
 =?iso-8859-1?Q?L/R2pDf/MEa5oMXWrb6xkOuBI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0267c4cb-a780-428d-1fc4-08d9c147f3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:28:22.3690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reEgNqq1CcknQMMtvcfORQNBZA7fKEm3+PAlFdRVVFlgdk1lumeUtlSvehS2gceHqlaAty5nyP7fhhTBZaNSBMT/4FQv/T+KnxfLi+FDrFQ=
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
index 7ecadf5e6bf9..68a5468b0f19 100644
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
