Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 140AF46D998
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:23:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8PBs04xWz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:23:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5h5VkTz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQE/yi/CLqNTAie+pOdeKBykmjhtujN+GH5+8RuvavMmjXvcKzhf8Iup2vl8P14XKfykmYV45BFhuQRrQoeZpGwwl2unKYUe6BlT+UxtJugS03cLvMwUwvhlVD6WA7QDnJnWs7yHjdJ6JH+o+0BGlyS0HplMw8bhFgZ+hOBsYlNw7j9BzDdoibd+Vfg4MJNoQoSMIM5j1yjOsPZWsSOq5exXJaCYbyk8ZFM0RqHRftrz94YyaSqx8X6KH1QCsu7I5teVpBbf7S6QKGJwacGWCpYdOEE56TeQ/OzxtHiigP3B6Gnd0yuugTTyPhYesls8u60LN2H2odC70OZZ457wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf6GokKuoZoWQvmpjyaXDKy1bgTlLEdqEkRamvuWwIs=;
 b=Fn03L9wbRpx0K9VJqGa5XAI0SimcQS2wNpSR0xK8JaZsEKoj7lIS/HY+IHKIZpU7F7DzoPN2xpWq9bBEXNRk1o6Sb3VJeU8gZeKHlCy0wAPLb1AtJCVnavzOgBKWfXqIcTrR87qFECSkpRBtRafRfXdBfi4+LnjW3fnXny49ohiRZHQDdvYNEN+PU0yTJrVu2AYC7OoN+jZvzTM4vLScxw/Q3w6GdklXnxonVAI1Hm4Siu1WzZW00sNT86n09E4NVLbsY+M+ZWBmPBDZaS1jXcFlvtKgXtQnzZW7APofkiHwuC6/hE9tk+3821YFjMoAJx8ru6zAwNIlCn+VNhWRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 17:18:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap layout
Thread-Topic: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX7FeaDIjAZ/GjkUuXVuFYrIE56w==
Date: Wed, 8 Dec 2021 17:18:22 +0000
Message-ID: <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e9cbbe9-67da-468d-7bea-08d9ba6ebcf4
x-ms-traffictypediagnostic: MRXP264MB0823:EE_
x-microsoft-antispam-prvs: <MRXP264MB0823569D767B85E297B23B53ED6F9@MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w3+fDyUkoCVZoLlOatmNJHMzX4qBit4GfxYMzarSNt7/VVq+6rSaWTn1RgmVJQNk2gxikfNqshKWDb3KdeaoIlDcgmwCfcuBp/xZCWbExYsNxZe4lGfnqbayuX1dMeiNyJidgXcIPc7T2TdpRgPjyLwA4G56eTlxy7uG1Eo/eSXtuggTvmz9NbHZZwtYTl/WWMGTENnTHMiaTG5vZI9pLQLZclLgMiv08ngt0g4uLA/mDHRZRfStRxbVKpI5a2HeGCQ2z1y/a9lOiBmQwYIwI0HPK4pXJNB50r/0THpvOXMs/XCyI2KQYr4iV39aARCj1/Qt9ZUt5gCupSkjRp9v8PnJSDt7GP8nOgLgbUcuMsJjTPU9B4ZSZ4Sl/5fUqrAmtb+sYOxZBovBR63ng+Z8gx/m8IIt320P5Xvrn6+ul41jgy6q/m15T1mGo9lKtB7Yd/cXIvvZFCVY22GTq6VlDp8Qu5J6hU2vKZ9MS1hYAehsAhrQViQOC4RUlc8+qyZSTbmGjV1M6RXn/HX6YS1O9eXhnMzBf8TsHXdf4i5ANHmNcPKg5Ore+minhyBIqRzoM/mhVPNwf6R7zVGLFbEm7Dls37yV7BdLW79b4Hq/y565qwmt17tIWiQW17RBiosyPpUJEEUD/IqauT0hrDM1Y0FkNB2MkKQrUR/HWcetlM1sG7W0vQ/Q5HDzLNc2PYTNt9Hif/+SBf/4H0Ue07l7Tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(83380400001)(6486002)(2906002)(36756003)(26005)(110136005)(64756008)(91956017)(66946007)(8676002)(54906003)(86362001)(44832011)(76116006)(6506007)(66476007)(66556008)(6512007)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(122000001)(186003)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?toYYV23H63V5qvt0j63R0H8AzPipbgQ1BPJsbAQ++/GKrUBbi8iyYGnWel?=
 =?iso-8859-1?Q?fKr6x46pqI66SEDIEAatQY2uUN4KT1vZymUNW/Aku5GrNy5xIQPeeEpFnQ?=
 =?iso-8859-1?Q?e2OnhuO/HMGKkhfOQKnkjF8mJOhz7LLhm6eAYY17bda+SItzxm90gE8GlG?=
 =?iso-8859-1?Q?v7CwhzjzI3X/DAvXXn6qRHcFomQ3Irj6padcWj7NazCbYD2BDPQfFQQXnP?=
 =?iso-8859-1?Q?TRd7iDprVSv+yAlmYgh56ZBhlaN3C/XUuvc03n83wqcpur/0695BiDd3Wt?=
 =?iso-8859-1?Q?LQfzQaJRXaemr0jRKHtz/5/ocAnU0Z4ty1jUwKiUcH2kW0gK7mI9EDz4Nz?=
 =?iso-8859-1?Q?BXjv+o2DjJ4Ai5HTacG3mqCCxrviSExWfp4dJWlVST7T6lScl4M5ECoHcf?=
 =?iso-8859-1?Q?WmxJW7dF5MxbBSvLDOODzh15UlNnrdTz71CUUJRCtrtbThbf3LUljwMDYY?=
 =?iso-8859-1?Q?rObM9XlaTztMmyK0nZeWJLkmkpLN2w63Tse8bdSI0E0uZlN/BUAMY0w9NO?=
 =?iso-8859-1?Q?Fws2mmvqmcOnW2aeAeu2O6lqjSjY9vI3DqqdB8N6dlEthUZhWowR5Km94A?=
 =?iso-8859-1?Q?9QR4hwPrKn3s2IHbBWHZcTOoolwt6yHm7242m27QFtZUVo3E2cwlbiDp30?=
 =?iso-8859-1?Q?POSxWpqIDum+Bf1A9TYLxFfDQLc5fTTTDHhCHxMQRagslVGfFJ0UT3YogT?=
 =?iso-8859-1?Q?yNQ3am7vFXv4ELpJvHaLcJkHVhBJBV7d1nEn57MQ2frcI567iwVQTipEJa?=
 =?iso-8859-1?Q?yjI6qjxXNaQOAO/n2aWdAg0zf5oXAWO5sCEnJydgp1IchVOxddpveAOw0L?=
 =?iso-8859-1?Q?pVQkKgv6yfP5o0vU24dtZlJHQzNIJ6rcJPOzMsrbWwJguWLIWc2g7KJQEe?=
 =?iso-8859-1?Q?PtvGvNWcAS9mL/gP+8qdDtv4DPI5+mPPnntYky6qhMHvtTiZHNAhZlpJOG?=
 =?iso-8859-1?Q?e32Uuzi8NUNU5qlhQ1BYxWpieaC4WrfPvQsLaPzg5461vZ+QkIM37swsAj?=
 =?iso-8859-1?Q?6UQM00fD/Ve3Je9BA3H0bR2KAkasgoFid/lWyDW2CGO/My7dBz/7NIDhLQ?=
 =?iso-8859-1?Q?DgJhkq2NOBSaGOq4gEyjTB5cQunSyu0frWxPj+G3PKCJGXoHYZpUACyARF?=
 =?iso-8859-1?Q?GEJDwj5cF2FWzGfoJVrxXJkY5sQ02JCqmO+122BVaACXAtcz7fVKTtMAG3?=
 =?iso-8859-1?Q?bbJErUE+7onsi1iERfM8ArpiwprjP5sBMuLBBN4QfowP1XJ5SQzAk7D9g2?=
 =?iso-8859-1?Q?W4BbaqpOeZvTqpko9WCPTo1Y+whwMgyukbYJyDKiws/eKtkuQe5VAwYUKG?=
 =?iso-8859-1?Q?w7NE6m/T8W0HwKFyoUInbM54QzascMDQ7c0nEXflce4K6r2oGbm+VT8Fgl?=
 =?iso-8859-1?Q?UCFvT0XckzVLICFMO2p2T8fPZLInYPk4HBysM0IHCEqpl7ica/E4Iy/q0G?=
 =?iso-8859-1?Q?5ASVavX9UZElH4iVQy9qWxZLfNOXM2raxownfLOIS8i5yeMX7Ak5QtfYPF?=
 =?iso-8859-1?Q?OBxPG8Xvulrsb65EV+PYxP8Eyi0giMh+XYxzvmb7GjqkJwKkHQefjVvZt4?=
 =?iso-8859-1?Q?qAUhGbv1lf9VGTsTGk24Ys0VxQAh7e1JXEta5C/qY/Y+0HnFIlnDmBt7T9?=
 =?iso-8859-1?Q?2EjV2IkWPqfVbVpgxB0JTYpfhZvsqiIYGfbAXB7GFuDgng1cMJfc40JX8R?=
 =?iso-8859-1?Q?++4lfZKcMt48abmuRZnuckxfsu0qalX3annXrqFNymRCtY0n2IwSY0scYl?=
 =?iso-8859-1?Q?FnQwk8Z+YzKhgJWtetckE3pRU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9cbbe9-67da-468d-7bea-08d9ba6ebcf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:22.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4lJQDaEQyWkmYDCsureuUNhSkJtkLZPMmWwhFZwIWeTgjQqmFGB1SrEu8p/sUfcj5aW8OyAfZ2xEXKEIYiUHupbbIVx9b7qrQTW97+jDeo=
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

Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
remove arch/powerpc/mm/mmap.c

This change provides standard randomisation of mmaps.

See commit 8b8addf891de ("x86/mm/32: Enable full randomization on i386
and X86_32") for all the benefits of mmap randomisation.

Comparison between powerpc implementation and the generic one:
- mmap_is_legacy() is identical.
- arch_mmap_rnd() does exactly the same allthough it's written
slightly differently.
- MIN_GAP and MAX_GAP are identical.
- mmap_base() does the same but uses STACK_RND_MASK which provides
the same values as stack_maxrandom_size().
- arch_pick_mmap_layout() is almost identical. The only difference
is that it also adds the random factor to mm->mmap_base in legacy mode.

That last point is what provides the standard randomisation of mmaps.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                 |   2 +-
 arch/powerpc/include/asm/processor.h |   2 -
 arch/powerpc/mm/Makefile             |   2 +-
 arch/powerpc/mm/mmap.c               | 105 ---------------------------
 4 files changed, 2 insertions(+), 109 deletions(-)
 delete mode 100644 arch/powerpc/mm/mmap.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0631c9241af3..b4ae3d8bde46 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -122,7 +122,6 @@ config PPC
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
-	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
@@ -158,6 +157,7 @@ config PPC
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/as=
m/processor.h
index 2c8686d9e964..873adaab20c8 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -392,8 +392,6 @@ static inline void prefetchw(const void *x)
=20
 #define spin_lock_prefetch(x)	prefetchw(x)
=20
-#define HAVE_ARCH_PICK_MMAP_LAYOUT
-
 /* asm stubs */
 extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
 extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index d4c20484dad9..503a6e249940 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -5,7 +5,7 @@
=20
 ccflags-$(CONFIG_PPC64)	:=3D $(NO_MINIMAL_TOC)
=20
-obj-y				:=3D fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
+obj-y				:=3D fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
 				   init-common.o mmu_context.o drmem.o \
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
deleted file mode 100644
index 5972d619d274..000000000000
--- a/arch/powerpc/mm/mmap.c
+++ /dev/null
@@ -1,105 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  flexible mmap layout support
- *
- * Copyright 2003-2004 Red Hat Inc., Durham, North Carolina.
- * All Rights Reserved.
- *
- * Started by Ingo Molnar <mingo@elte.hu>
- */
-
-#include <linux/personality.h>
-#include <linux/mm.h>
-#include <linux/random.h>
-#include <linux/sched/signal.h>
-#include <linux/sched/mm.h>
-#include <linux/elf-randomize.h>
-#include <linux/security.h>
-#include <linux/mman.h>
-
-/*
- * Top of mmap area (just below the process stack).
- *
- * Leave at least a ~128 MB hole.
- */
-#define MIN_GAP (128*1024*1024)
-#define MAX_GAP (TASK_SIZE/6*5)
-
-static inline int mmap_is_legacy(struct rlimit *rlim_stack)
-{
-	if (current->personality & ADDR_COMPAT_LAYOUT)
-		return 1;
-
-	if (rlim_stack->rlim_cur =3D=3D RLIM_INFINITY)
-		return 1;
-
-	return sysctl_legacy_va_layout;
-}
-
-unsigned long arch_mmap_rnd(void)
-{
-	unsigned long shift, rnd;
-
-	shift =3D mmap_rnd_bits;
-#ifdef CONFIG_COMPAT
-	if (is_32bit_task())
-		shift =3D mmap_rnd_compat_bits;
-#endif
-	rnd =3D get_random_long() % (1ul << shift);
-
-	return rnd << PAGE_SHIFT;
-}
-
-static inline unsigned long stack_maxrandom_size(void)
-{
-	if (!(current->flags & PF_RANDOMIZE))
-		return 0;
-
-	/* 8MB for 32bit, 1GB for 64bit */
-	if (is_32bit_task())
-		return (1<<23);
-	else
-		return (1<<30);
-}
-
-static inline unsigned long mmap_base(unsigned long rnd,
-				      struct rlimit *rlim_stack)
-{
-	unsigned long gap =3D rlim_stack->rlim_cur;
-	unsigned long pad =3D stack_maxrandom_size() + stack_guard_gap;
-
-	/* Values close to RLIM_INFINITY can overflow. */
-	if (gap + pad > gap)
-		gap +=3D pad;
-
-	if (gap < MIN_GAP)
-		gap =3D MIN_GAP;
-	else if (gap > MAX_GAP)
-		gap =3D MAX_GAP;
-
-	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
-}
-
-/*
- * This function, called very early during the creation of a new
- * process VM image, sets up which VM layout function to use:
- */
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack=
)
-{
-	unsigned long random_factor =3D 0UL;
-
-	if (current->flags & PF_RANDOMIZE)
-		random_factor =3D arch_mmap_rnd();
-
-	/*
-	 * Fall back to the standard layout if the personality
-	 * bit is set, or if the expected stack growth is unlimited:
-	 */
-	if (mmap_is_legacy(rlim_stack)) {
-		mm->mmap_base =3D TASK_UNMAPPED_BASE;
-		mm->get_unmapped_area =3D arch_get_unmapped_area;
-	} else {
-		mm->mmap_base =3D mmap_base(random_factor, rlim_stack);
-		mm->get_unmapped_area =3D arch_get_unmapped_area_topdown;
-	}
-}
--=20
2.33.1
