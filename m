Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E945495C4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCjP70sbz3dj4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:49:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCZJ3MNwz3cVM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:43:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtcV3g07PmtNR2jc5QbyiLWm1wpA9zAiTjuq+7mKqjhsVxsZ7/QuoiJJezoe2HyoupWQQ3wJ8O1VLZmgoJIWn+d+7JRyqDWLwN9UyyQHmbC/htJ6/4qNQwrHrau0cHa9efYz322yNbPHNn2qJQI+GDZeWGRie/ePIcE/JAfY10aq8hv2QvPy/MWeXNO1rUkFwwIvQY/xL+2qN0US/N+IwNGAow3d+HxeoDWwTvd3HhKmdfXK5iqbPKc/JHFyyy0M8pv8MMoqU1jfvlAOY+XFmkfvPID6gfNg281WGFm8r6kmdf8dK5FVFFn2IlpOL6dV2375gh9ikn78QYHEWYw6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGFW1HR24WYAEOnV8dd+oFOXUWflLAKM+E2nFCnaGvg=;
 b=jcRs0Wek2whK8do2+40CtHsAi3sU07tFOa1qv1zVaAtGO0Ce2R5/wEKO0D9RlH+9pzpH9rXP1x2IEOAmXCWg43GxIsLhemVYv3P2QVF76zO0vMWCmL5Lt5TtRnEyqtP2MZ82dBEKbtXpyuOZ1XlPDqaMZ2H22yDXTI1AtZhTJJdQy9GlKQCR1BoYKE03PKQtw2/8NLV4NlndvrnyLKgWRUdRVzjZOmsE+eS8fRASQassHN8r7h+RXh9F7gLHi/kPzBF1ZlTyxLk8ogtHmWWRlmRr8R5uBUdmvHkEFSi20YDyoANIzQJEd0pBo+1oPSYR9Fi42HA+k3zl9PaoTVlQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 08:42:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 13/14] powerpc/mm: Convert to default topdown mmap layout
Thread-Topic: [PATCH v7 13/14] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHYDqLcBvroGy5qcEimJqCY0/Bldw==
Date: Fri, 21 Jan 2022 08:42:45 +0000
Message-ID: <f8159eb83a8015801df01357ca42026df0703f2b.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74296052-3a68-4771-0580-08d9dcb9ff35
x-ms-traffictypediagnostic: MR2P264MB0196:EE_
x-microsoft-antispam-prvs: <MR2P264MB0196B298D6BBE9064E9B6FD3ED5B9@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:311;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JCwvEfC0u8nJxuxZ8SqVgS2JAono9lFxPpOlJYaUYINdRZhYYF9hRVqFnxWfgJ2sNlRd1tbOcopSoOWK2+zg4aFd5UflDy7hrgU7G4tYE4pBikm5wbfL3zB9Ho2WmAw5I8YYqn8fUbV++4u97cKk8vTqdNV9B1NItfokr8TPZ3ZCWyE1QhT4Oz54v7MMHD97GKX7rpedJhpu8sN+Ni2QH7/xwywnf+DKb9mrk2oo1G34aq9Q8yGaISvJJm9hD3p10sVybvfs0XZHuxddDFRwxxxcWKv1XhjRtgdJsRUMsUYYajhkLnrU7/ChW6QBVSBK5ACFvWisE9+Tu2jjxJMR+gAkwAVuCFLpnyYPPQ8D2BRuPDaaUkPjbcxIa1XNH6ixJIXxz3kWW+ZDPXcWcwi2VKdEzxTHO2L3EYsf/2AZdPV6Edcvu6n4vG0bW5FNpHAltlD6BgDixkNsOC0HXdBY6QcHUxRbaEqeSVK8vgDOnW5lcCaptxnrm/CemWiY23xh20E7pZA3+tzdSv8e3UZn8VwzwzI0EGME5uTGUuHgKPPEQzsteSrRVbee6ZNR+ptEwBTd9gbkoXpqpJcsVdcOejTM/tbzFMW7zrdLJWl4sb0kYgLxuQVqBgoFpGx/ihzClaT+dcfMWF25QWDP9SnF5hDeCQzLOi8NJQDUhHdlI1ZomUPgK4swCOPMtGNUFNRoRNPqVUPqNDMuLtslixGBjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(186003)(44832011)(26005)(7416002)(6512007)(6506007)(2906002)(8676002)(71200400001)(8936002)(508600001)(86362001)(4326008)(5660300002)(316002)(66446008)(64756008)(66556008)(91956017)(110136005)(54906003)(38070700005)(76116006)(66476007)(122000001)(38100700002)(66946007)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jZqiE+l+22nLaN5CTYPQn6UjVRLxo9IihIz7RYDMm8L29fuSyjHvTrj9bO?=
 =?iso-8859-1?Q?iPP46E0cU2KBNPXULhUSlO/aMuCYV6+cGifS8cbtKGmDjbj689M7GVJHVe?=
 =?iso-8859-1?Q?4PL5P3MOjETLjuVDk4Kw5KyX7xESxK+PAANzzyq6FRp5xdnRJHtZm0fRjd?=
 =?iso-8859-1?Q?/lQrxIIwIbm0d4xqf/Suu17E6IVkfxk2/J0BtbkRIJ4h0z1KqGAaQY2idQ?=
 =?iso-8859-1?Q?p6wkWsxh1F+qPixkL+17zzHFBA+fNWqY+QbPd/CS1fe9XZf1C2qPjTZVBL?=
 =?iso-8859-1?Q?ZJkK7psX6/tLJLdcYDMAhqXAHqUREhkngtm7yGQzta08/vHaSsH6Bm22AE?=
 =?iso-8859-1?Q?vXeV/vSlZviVGRirJoq/jJH8uctfFmpCaYxfxYaUx0aKXlaRLt4yoQA2MP?=
 =?iso-8859-1?Q?0UjI69Slq/JNsFQ+uu4OhITNBeVsJIBagRuK+XDdShErZaPxcNuVKoagrW?=
 =?iso-8859-1?Q?pQRlvysbpfB+0pa5erqERObeVGgM2WdVQ4Zzyo+QLnbfRfp/VwDa3wMYlU?=
 =?iso-8859-1?Q?Qjqc3s0NTAUNdYYC2rkDR+AkDN8xTffrKgH3tgeaQKY5+ReAKjNx3wzrpD?=
 =?iso-8859-1?Q?+p3YgUIu5Uo15OqrrsSzA6tdB8D6Ob/6eeF9ELziB2a1YmUv2YXGrV3hLb?=
 =?iso-8859-1?Q?cbbCZxjtr4hNuvOU+HSOAW2K32LRdAyMPeysOzWF2XIGOCflEpwEF53r6P?=
 =?iso-8859-1?Q?Fist9XDEHomFsdPZuVH8DRXjWgeQ08PXHcbURLw0SWMdQRv8NV/S1Yp9J7?=
 =?iso-8859-1?Q?NWi8Qs9teqWHTsgHJft6HpFAasKj2s1jB7PxKx3BPlJwIYyCAU5EruerCr?=
 =?iso-8859-1?Q?tKHMxTRIAdHnjPkOL3lTWdgG+WqpyxNDMg/yE/5abSR3UEIlTu8ym4WpJi?=
 =?iso-8859-1?Q?mm+ZG2QuZrPj22Z4n4fV4isOe7yqzE1YRInmRk6GfG8ElzPdwLC/vT9WlP?=
 =?iso-8859-1?Q?qcltVwV7Anqe0ahA0W0jHYbb0l+zYmOSeiBLThwz07ulQRuGosmzh1FIZM?=
 =?iso-8859-1?Q?J8Vsa+gRfzidMTKvPNKZcQc64UEkOiZFZdDcX6w8+SUgMKcdhtiogtEXnC?=
 =?iso-8859-1?Q?nkXm2Z6L8bcr3jqljAsD3zmQxducz22G3c+7Fz8omd6WYEsyV+Dj8sqePI?=
 =?iso-8859-1?Q?+d+Wxno6teQWtejh6675d/S0jm0AMs5f3fADaXms9N5AKlQ8ls5iQ9t/Uh?=
 =?iso-8859-1?Q?GP0GzEcPkFRGZeZjQyv+HG4OM8Z7faYGljvZjP/L1/AoOEkL9CFaC3Wc6h?=
 =?iso-8859-1?Q?Ek+/SV+4P2VRMxnyL6CIQ6/AANpZQYnSsh6P3WmKa1NVScQa5C1nT64sME?=
 =?iso-8859-1?Q?Rr765C80AmQy6LAF2Wl1FrGnApQLELd0Id6VWXcFfmyWJBjqDdArpamAKf?=
 =?iso-8859-1?Q?zqfPP+o8P6rdLjAUDz5B6ZU+EY7VQOoQYRq/CJgaoMEwYz06KemK0M14e1?=
 =?iso-8859-1?Q?jZu8bR4kGg1f6LJYlWH8y3W+8lV6DUo6HlakIiN/bhO7Sba956hIA2uUmE?=
 =?iso-8859-1?Q?hQOvZBBAmThG0o0K3tguprg2xGBMVp6p1k68t60+XI5qN6zUTasZ/6vORm?=
 =?iso-8859-1?Q?/on97vzvpneik6OlVPFVXkb9tObsJA4DUdxaZaPZAPBVn8CCotPK/8AUXq?=
 =?iso-8859-1?Q?YqnET+Mjye+CwOacVnrLogqHOA3R+0K7ZljYWTFDKC8Z7PXSHtB7llA1NP?=
 =?iso-8859-1?Q?KJGj8G4xTOh9qOr0spvg3NTMJCSLJ1BSSf/W12lFHHFcQ2XvnRaQv9DRYl?=
 =?iso-8859-1?Q?qW21CLSQxaa2Y0YaAwfs8n2RU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74296052-3a68-4771-0580-08d9dcb9ff35
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:45.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvqYMZqThSUb7klbfPz3kIPG3E9/S6WPAd3TBPTyeCbD060E/D22unWS4c6Zu3Ebre7HYF1Xotd9XINkJLubazwVV0e4uu7L14+bL1XIKpc=
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
