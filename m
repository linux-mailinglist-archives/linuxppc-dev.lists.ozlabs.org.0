Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5447532F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:51:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQr956HSz3fDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjw3zzyz305j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntvEBT4LJmqHIEe7Rbt8PnQ/6fvgJCZfYOF0CyNPE8W4Fu1YzswZusQZpiyek0a0pNLw0OEHoDXC8inW0RVlsxnkWyAS0K4iN9szwsDG56Da+HviZVKAQSqSRfIjaq3rtxZjBlGhVeKeA/M2pUi3xX2lWJtMu+WjhVY6GGc3Ad3fF8wDEbw6S/Mbbdv/4oCkGyCTzcHKCvJEsKaEz34oJJIWkS2L2ZSr9w8N+EXDW03Djn42Uwg0/NhOLgdjTz/V3tfiRqIy/fZLDFhGeDhOs5ChiOJQAJ4gD2M5fPjLM4ZC5bf5O0/HfY99phE/WZjbV0L4GxZfGDDZSd+K7kJnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGFW1HR24WYAEOnV8dd+oFOXUWflLAKM+E2nFCnaGvg=;
 b=XIFEG2C9ct2Y6EzAudzpbL8L3UNIOrxCU4aYO6pfsHZgJ0PU2Cp+SVyZ8Otsx0jOZJd+kBgee1DcQHFlOmOl6RRNkvLnHBiPOjoONIhh4xJgXsxgfZ5jr1ALagT2WpRbAR9jQLLpfFrGiyvzIUTi8Kk8r+Vee5H3HB8LFC2HzXKRHVWPJcy1E+qwbCisR0p8W1krGvekIyQKIJ/tLSAMENQxGcRHupC2vh8io0xyyLUGkzrmJRRMbJjny9Z0Dgfn8IYm/5/mAzoO80QIfvTwfGhCsZHuJOw7GUe2Yy7hxXfjjC74uNQzt5edyi7c74e3Wio/ZF/K/hnyLEI9IGmhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 06:45:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 11/11] powerpc/mm: Convert to default topdown mmap layout
Thread-Topic: [PATCH v5 11/11] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX8X9Qgu4CnQ/bmEeq6LBbICcf2g==
Date: Wed, 15 Dec 2021 06:45:14 +0000
Message-ID: <5eec7cc6923729d067b8f09347862408e2ad993c.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90b879a6-783c-4342-4579-08d9bf9672e7
x-ms-traffictypediagnostic: MRXP264MB0311:EE_
x-microsoft-antispam-prvs: <MRXP264MB0311D7ED005E3382BEA0CE2DED769@MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:311;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n72yKB2taiVYT+O8kPr65sbc3VTjFXVwq63ts5FZ6ITnlzwPpQ1B1a/mSUcZJLB85ac7TgfxakGGDdwawkni1ctvgig01faox35bWeybsQ5CqTc4TYpSHK2a/XACPrFJu2sZk5CykUSHcJAPcvgTfMaZyu6AY3yD4JNf8hYMx3ErjPMv2xPwlIFhysDJbVY2kjObdCB+30wvXQDEHtsCPMjvwEqTVgm/xjpZ2xLJpxpBKrRi1hMOydXUSwSoxfN7AADeAdXIFdYLfMC5t/k29AWSoAHUWi+fXmE7ShrmhObZ9Xxz1DWUSbMrH8QW1DBO9EoyhSqyHh7ZTru9pBV39wLec/aFVrbv2UDqSfm1O6KV2XlET9OImH0MRVFVgRk8wF2wpkh/jGtlvG1K4spUrg4h9/hwWU2IPxX2WoJlU9KuN3Emf9P9yP8TkSvoOo1YEF/vXqHIsaXUVK/lSIvtP63kQobgbWiPMgA8F7rrcFB2AjXtFStizBqSkSupBJgK+CGSSbG9lZXYdgmyrBjyhhALfJEr5HrycKHkgfEKcPO76WJ+D68wdjGZtH9y+7X3fMj+/R3ykZMfCgscOIXakuaFCpKImGfWKaDD1YmXSpWa21haSOMLEyX0LOgpkhDpo8H2g02VF12CRzbJ0+ZIDIYhYHHwBrBdF1rlM9D1TVvQ0KOUJSD+qM1ICYdSj3sdvE736lREGAlZERmvunaHLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(36756003)(86362001)(6512007)(83380400001)(2616005)(26005)(76116006)(8936002)(71200400001)(66556008)(66476007)(66946007)(64756008)(66446008)(38070700005)(186003)(110136005)(122000001)(38100700002)(316002)(8676002)(6506007)(7416002)(5660300002)(91956017)(508600001)(2906002)(6486002)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g4ufxBQ7oJ7emvP3hxpJ0pp143doKfqy7oV2PC7dYp8KJ0OJETLyygSbdQ?=
 =?iso-8859-1?Q?pMUI9X61+gl2AqSWOtiuhJ10lcBAaHG7rz+2LH9Q+1RLJ7aMKzphCrErEL?=
 =?iso-8859-1?Q?pf89ezrNJnbpBwn0D4XHMLrkKpKg8DyOFMoaBgmNvLP4sHSZ+lZeSnDnnC?=
 =?iso-8859-1?Q?yRLjwRFjZBBWRA+OhkF3rdDp3lyvUEQ0xebD2mK9e1bTzLjOrdzpHvsMQ6?=
 =?iso-8859-1?Q?DOQkAadURAQVbu0f8iWFWmts93ud26Zt32bscpmdaeJcz7Ujsw9r+uRuzq?=
 =?iso-8859-1?Q?8TgiChiRcj8UNPmXC4sihNOqz557UXWTiWha6da33CO+oDRM589mRJgoWb?=
 =?iso-8859-1?Q?6k5vfCXLJoeSXsn6vd+iHtrWYGbRpUNdXKDBEBVEQPUevulpgdAKC9bu4n?=
 =?iso-8859-1?Q?PC5Ny7nElWRvsgB9fYTdp7ZlC+GKiiqigDjUQ5vPnU9PxipX6dA6O7DGs8?=
 =?iso-8859-1?Q?8I98yJCqKaboL66bwugEQfoHIXFKOWPPt5iBDAanikdrzIt9rX5KVXzEFe?=
 =?iso-8859-1?Q?Sslw82NFPGqtAAlLwgkrGKFGPh80uLZm87t3r2/bALD6VZ4GsRFUeftLWw?=
 =?iso-8859-1?Q?Z1AjhHFKoXqDAg4BMe+h9bo5e/5jj9r9VDXdCtCWFb9y1GViJo1UuD+t5t?=
 =?iso-8859-1?Q?8eeNXHiTm7B0hWVZADVosuG8jHxL6F2BCp5ce3NN+NNuFoXRxsj/IuZBBu?=
 =?iso-8859-1?Q?hcugzuJSemgOYPxBkM+V/4UdDGPAACSkEbAG3q/GX7ReWs4wM1KrBBnH1O?=
 =?iso-8859-1?Q?UT9MpOsGBPuY8240Rsaezu7n+PVPRuLcR0ES07BOWliG3NWFfyAywVFsiZ?=
 =?iso-8859-1?Q?yO2uSkl39pKuPZ4z0HGW1mGqs9I96ousGUMwt+ETOjpmWzUX4LDKfTTgsa?=
 =?iso-8859-1?Q?z3Rm94yvdWZZVPamsuqij7vgsVbbSTOqQVSWVCB4kfT91BhPxjfkIkmm9o?=
 =?iso-8859-1?Q?fDOS8LHprRVlNpR1PU64ErLZN3aaws7VGJjYTeYX8wPDaZtkcItuGocoGJ?=
 =?iso-8859-1?Q?v6Slpb5RanO7Rcp+2pzKL+Z/9T57ijC/YWqf9bpo5W+j66CnYzgtgCnTb3?=
 =?iso-8859-1?Q?b9HjiYoDbIQu4zQarlAnKNRH6WH03FUJY/wr+VGwvbujfeYvgKTTpWxM/h?=
 =?iso-8859-1?Q?mx53BmjM1wOJ7ty52IDjFoHwd8ZUU96IxXgveXjKzali4ygjh5OySQj7Tv?=
 =?iso-8859-1?Q?G0+29DLLgf4zYsMpFUprbN0VIE8L+tKSEXsK0HLH5UyBrS2qsYSUeEwTiE?=
 =?iso-8859-1?Q?sHPVWVp7CzTs+JstIiEz3bR+aA2D/5Oej1pNMUTpzBRThdPlufNaz0NJFl?=
 =?iso-8859-1?Q?rElkY+7BwRCgLPad9iSyBrIcKjGkqWR4ml/2nWDrUXpk7sg+S1Y2P5vJnO?=
 =?iso-8859-1?Q?1OcjQ98tP76+C1OJr9l/OT+pgmwcAuX+QdGi50ub5c98Isy0DBuev3W/LP?=
 =?iso-8859-1?Q?C37SRf0z880TlusMkEp31FV9ljLOXaRb6PFl5nTbl/eiyF5sGe1q1yieOy?=
 =?iso-8859-1?Q?u6LZgris2REmq9IZN8lbnru8AHZdKX5ixsJxL7WYRnWXslsP0BM4jIHMVW?=
 =?iso-8859-1?Q?O75uZ/BU1uPR8Fd+S6Fzo7wPXHrvzKYWfCmaufLyU9JOBujQSwAcOiiiRr?=
 =?iso-8859-1?Q?mE56o3J4C7EUHGOPm3HA8O9oHOpumIQKzsWg0/xaGSJXT9QKMgR0WIgVIy?=
 =?iso-8859-1?Q?X2HDAROmRxi/mJrQ2Y5/ZaFSqGj2Icsmj/s8AGnqzPlj9rxF4RPTRGn6c6?=
 =?iso-8859-1?Q?ZhhTF9hj9kKOLjZ7zLTEDm/5o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b879a6-783c-4342-4579-08d9bf9672e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:14.1154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N08R0KTlVWtvybxRkU292ReBRz55Yiw9GPwuuWNdQPm4i9eJRIK37pIHCQHBSG2nTczlVHISAHzp+ABHOCXIvTniIYdPFHNg7YM/+UektaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0311
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

Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
remove arch/powerpc/mm/mmap.c

This change reuses the generic framework added by
commit 67f3977f805b ("arm64, mm: move generic mmap layout
functions to mm") without any functional change.

Comparison between powerpc implementation and the generic one:
- mmap_is_legacy() is identical.
- arch_mmap_rnd() does exactly the same allthough it's written
slightly differently.
- MIN_GAP and MAX_GAP are identical.
- mmap_base() does the same but uses STACK_RND_MASK which provides
the same values as stack_maxrandom_size().
- arch_pick_mmap_layout() is identical.

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
index d9eae456558a..000000000000
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
-		mm->mmap_base =3D TASK_UNMAPPED_BASE + random_factor;
-		mm->get_unmapped_area =3D arch_get_unmapped_area;
-	} else {
-		mm->mmap_base =3D mmap_base(random_factor, rlim_stack);
-		mm->get_unmapped_area =3D arch_get_unmapped_area_topdown;
-	}
-}
--=20
2.33.1
