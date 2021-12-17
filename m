Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B44788F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:30:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlcp31l4z3cl7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:30:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYP4WZ0z3cTY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHPGzv2FR88/XJUOuIU0IbdqkKzNZNz3d8f5rF0sb281LQ0zYquLBx3m4tmtzjPWimFhjvjQ1UIg1zzvjI9qhEbZtgKZto5CnLESDXzZA1oqOl0LiHgtwbJB3vBFIZjYSXeHumaLHinLGtRc9DHkUn+TuNL4qasqFFQtaU6Z5VhDkXsQWGJ/4rGRSINreWo932v1rFD7/fDlPh3kUzOh37rUw4E7NMXPNAZCjHqyBgZhWKwHLN8vetiUkF4guaxOi/RnWCjhsSKklxz55hhSFSP/yqaJmQzmZagHKnOkbBnBA0iD+04ATRfPwC3Zhx7LO2FeRc40aXTM03ZDq1AmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiZMm9KXXy+vu3WhUEQeEWc13H9a8TPaQVYGQB2pazk=;
 b=ku3AgqusDhFMB2IrnUXRWJLCliQ4qWarYufXB7H7g9woXu3laHx02d33tc9EkFQMjQJji5kp0DqXwdLrUoQbd0BHXSVjjv6Vcd7QE9UlsCJmrCKkRksWXIHqP9aSANJ4nl2pd7zhH699OoOJ10xjn3l5udYQ7dgljhmsgnSvmXzE/KuYlZId0Gc4JQsRycJ6SESxpnUGrkzNZ5RUmLqGvtM69B9Gn3nEBc2AP3xXx9VWubRmuFkc7jJNMX+5zxMGotTTgP6dG4dqvwPfFpoSx5/wF8tIEhpfOmof0XkfbzqW8hjf21plUp2gB85XDtaf3Ulqj03fZ+BFCwfzQL3NwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 06/14] powerpc/mm: Move vma_mmu_pagesize()
Thread-Topic: [PATCH v6 06/14] powerpc/mm: Move vma_mmu_pagesize()
Thread-Index: AQHX8zC28dayHdKkFEWOgBWA0YYl1A==
Date: Fri, 17 Dec 2021 10:27:38 +0000
Message-ID: <523780f4ba5497efb738f9e25e43f23263e125ec.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b03f6d4-da12-4bbe-5178-08d9c147d95c
x-ms-traffictypediagnostic: MR2P264MB0194:EE_
x-microsoft-antispam-prvs: <MR2P264MB0194C1B07CF64D94E5509F61ED789@MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wUX3LCxBnvwgDSGbyBjVKvmqLBxBM0AdyJ4E2pMORh9fJ6J2kULjLFEffKTKnFapdz1J7SNFhIFYlm/Gq+MqWvtt7Ypmd+/gRpzaVmZwCO3mWSybGAqu7Ds+JxGP8yPIZ4tn36wFYzDJVbJbdSsxfVfdXJAUEta1M48JjS+vmjh3Y6Pzls1N0bssm/Teku04QhME101ZnW4wyiMWSBd3P55QamWkaf/LCQyg0Id+q68aIzEK2cmrMTA0wPG0fwRMKefEfCujIXaeUJM2anad06VJE45sx0YkyqxhbMtuN7+iA8mI9TeODiRu55rU1P2bK+/ER2nWpvCq5/fNBm4T418AMbKacVisXoWs/2dUmAo8Xanp/928246NZq+g3cPn2omULAC8JqETttVk3Xo1t7uU+PJ6EntTs1AjcTTqiPlXCA+2P40FdqDtDN8kI75ovc17uTB4ncZTlvNGjcUAjDq6qarw2OsquBzq8EVXbdlT9HYZzPunWV6zAeetWpTegbXSfXJy8DotTGCHJ8HqBgrsbXcafkrYi21XJCY50PibzG3LU1hYyPiRE0FxBSZbO2BdliaiC0Q9GLYnWhjmNGb/ADquBa9bg7GwMkBCyvc1j5U/6Z/qvSwNdpmA6bjs0gZIh/r3ebH4H2X8YWl/JhOJ2OLHldoQ1bxVlz2VEwS6s2wSr3tjrf5Ht/GuxkakAsv3fDnPUuxOZV96WEjZNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2906002)(66476007)(66556008)(7416002)(36756003)(316002)(38100700002)(186003)(44832011)(6506007)(66946007)(91956017)(6486002)(26005)(508600001)(4326008)(76116006)(2616005)(8676002)(8936002)(66446008)(71200400001)(83380400001)(110136005)(64756008)(38070700005)(6512007)(54906003)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HYa0f8vPEkCKHm4QkTbUFNizQS0vRP1F7ULWXgLPI19L81aPzjnfHwojLF?=
 =?iso-8859-1?Q?LLWtQy9SIWLmdxi1R1Mvi7pZiZs2y2Wg5vZIXiAOu870L1oqN2ocGDbO0P?=
 =?iso-8859-1?Q?5MIiqqijUT6P+BWaHCWdZjf0eti6Y+5fWDLPXVd8UTBQ9w/D28Atr3h6xM?=
 =?iso-8859-1?Q?8hM+8p7ykmraioR8k2+y2piDADfcEL0dvV+aDBzv8pdsyXuY5G7burMJWb?=
 =?iso-8859-1?Q?CYmF0w8a5shQ4dpIiG0qU4xbZ+VJ01KwdTFdUOnBvSoN2Upj53PCdt5yyN?=
 =?iso-8859-1?Q?hhJwxJc5Kw95nzswO5SzBjWAP78TYARnqnUpnjBIvFHGrNX5JlIJppgd8y?=
 =?iso-8859-1?Q?mfdkOrOxVyaT91srt57eUnIRPuU4yp2IH8bXkJ5le0J7gdMKNlunTGX3o0?=
 =?iso-8859-1?Q?DFynFpSvE1gutXp4hHGLRt0phlEEHSc3rewwvd8ThqLB5sxevlLfBL2rdW?=
 =?iso-8859-1?Q?LBNJmzU/ceHnZlP69WlEaiTiQlpTAuxD5c8vZ/ImT/cmqxnwIRh5DJqzrW?=
 =?iso-8859-1?Q?/A+nKA8PNRFFSmZbqry1+LZoNK4G5oC7nWD8kD8Y950PsAurqkxCI7cFtD?=
 =?iso-8859-1?Q?EdbNK2oI3wxatYiW2vQ4D6hOroqjtA9pk+uLmSoUR7f5vHaWQct4pskIa3?=
 =?iso-8859-1?Q?/5bPlEoHYfO1h5VO2seO/+3QQBUwK5MjaNQoEscdu80v82zEhWJ1dijMqa?=
 =?iso-8859-1?Q?LWlafIP0GxbTUyzt4REJE1FyFKPy4wUJLB2Y6MHZLjI5olHugNR4mxcfD+?=
 =?iso-8859-1?Q?f3s5wNa60YF1yZlg1rihsVKuYRDQSyUgHAGAsHK/MQkcTXHDhGObsTwFyX?=
 =?iso-8859-1?Q?XJ5yMyW/F1GD2acRT81e5ieyRdykxaP+nROiZNg7ruSC6RS/ZOcUFFxH6G?=
 =?iso-8859-1?Q?ZKTyZKTXP23TINZ0IqJsIb7/6wWipuP8WxSTb7NQTe0KwoziPu3Ha8QfFE?=
 =?iso-8859-1?Q?MStUTfEtCoA+OsAEDlKGZxgMaSi0J6UWPfB+qK3LLmHgGsomMrQSbYPktP?=
 =?iso-8859-1?Q?qT3YzPkgB8c2xKA3D5dTYc/Gyr9WYNkiV7gGKHp1gdDnmk1adB+qKG1nXm?=
 =?iso-8859-1?Q?4MGRy5CmeED3ssv+W1DBj7tnL2fj4RQYOJTYtaXUov1H1OQ8IJmPMA1D8u?=
 =?iso-8859-1?Q?QiR4BeFTyHaSQ/puS1CA9+c24Q2fWwpMT6Tr2qYS5BcGsQKoudykP5ppXZ?=
 =?iso-8859-1?Q?xuUP7vf0SNX/Zx4UnNqPB0fJL9CWhJk47QJ6Wqg2hfspsiuhLBGbKwOZmR?=
 =?iso-8859-1?Q?snMPGIkoFKxCEOnAUM7KOVcVQzwtdFQF56upLSWdije+kbounIiKnmmKrJ?=
 =?iso-8859-1?Q?gHofmku+eyh8T6p1jZeKZnu5RPjX9obaYaam4/lyhIc5Gwv/W1H7+dv9Mf?=
 =?iso-8859-1?Q?gT9pDKCltkUyF5B1QktzTrpS56rXJ1l8TpaEX2PSMSqtC2vN2UCGVe8Jst?=
 =?iso-8859-1?Q?ewgW6D88tIKOIx+TLgUbWc5UpqDYFITA9IZwsVcOMYdh0CW+cOrswDD9bC?=
 =?iso-8859-1?Q?JMHlLTGDoznIiQvQRQM7gEmu4lCQAULzYbLW+gYrOQ6E7iJoMgxGbrNXgD?=
 =?iso-8859-1?Q?6hpTUPhDdztyc+zgpXKpZvjZpAWhWQKpbcN/azXgC8ij72OJV5N+gU4Et8?=
 =?iso-8859-1?Q?VmlYcTIIo1wQGb8+0tCDz4bajF8o/47kw7aTXxOiJlKbY8PfNG24hNj1Gj?=
 =?iso-8859-1?Q?UUbYIDdEBrv1uHsQGYrEaOaQ/3+OSqMYveP7gmbXndxpspuEgRs59c/20P?=
 =?iso-8859-1?Q?e8zKQ+KSKa7VtN+exo2boQz08=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b03f6d4-da12-4bbe-5178-08d9c147d95c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:38.2243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GavLUNWdgE7VFLHAQ0X6gEJ3fSFx0h9iYWcq41QJ9mSoHboRubvIT2PvnSpaCBsa6PjhCGcDycvUTQEW14/0GQcfpmbjXM2YcZlxRoMioio=
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
