Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85850478903
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:34:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlhx3Kymz3fS9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:34:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlZ82ThYz3ck3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOG7YtgbSZ2v8UaZvjWHppF9mnIrT1bMtE6fcCIUjeSANQmP2lVMhKwB5CiB+PbMSKrHWMlBdf40vN49BqeGUrWxg8KDFdjhQVL1EkcJH5H8VcPUcWqB0Yl1YoQT9I8JvqXVB9EEGyqplccpbzRCnuvZRtJcUMHQu0oKw0D4jU4w98S8H8V3+0jQA8eAcCmZfttTA2zbIEWeYoL8p9/4PVjVik+4X7uSq8yAOLNKuIgR23kHqprbI3eIKRayuMm0crveL6KYJps9F+H2ezKSIISh0XHjO2xk8mvUTgiAQNDfSJ60XzOk0aHx79rZKq9y575B064HltYEbguTZ6r0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGFW1HR24WYAEOnV8dd+oFOXUWflLAKM+E2nFCnaGvg=;
 b=Sb1Arxv8Qx9q4XZj0L/5VvAfQmG3NPdfDrUwgiYeDW7+0OPHp3niYQs51FEvoHlujrFXuhQ8KWa0r4LQE7nD+aigInnG1eZSBAz42uhsTob40Bdxny8M4sz0C6i2QqqHqkp6qzRfsHb3Ir4S3KdZXsTwcCF+mXifkK6WSU2wUrgam8kN2pChxujAgU+6ZiTf10Dn5Bq/nFCk8MA0+wG1y+oS/ESfWQWDL1IoaksHx8dFZTkWb7A0Zp1CW2Qv4rFVPuTk/4rGN6y9tX2UAqCGjaPv5CnluS399xCj8gK2PF4OEtLxQSFRYDHy0rquyyxpzC1Vkdxfw3NEptX35eHM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:28:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:28:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 13/14] powerpc/mm: Convert to default topdown mmap layout
Thread-Topic: [PATCH v6 13/14] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX8zDOu32cl/lvLE6oPm2rWLszog==
Date: Fri, 17 Dec 2021 10:28:17 +0000
Message-ID: <47ca2616c0fad6e9fa5c6598cde7a43e68a0e5f4.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67d92153-a182-47a7-ff6a-08d9c147f0db
x-ms-traffictypediagnostic: MR2P264MB0146:EE_
x-microsoft-antispam-prvs: <MR2P264MB01462E10051239F4EFC3EC51ED789@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:311;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gzVloqdRBp6C3mk88ncgXdgpm67knpSS+k8+RE6QSwGj+MpqH/mnyPiZ0zSqqCfSOhMag90M0P83qqe1Z7hshrx4xf+RCrZK8NB1S1K5v7lhf7JAGmULntRN/VHimvRlsoI0OwjGhxnQoMkN37DSXZTJ99qiJwZOTC4zN9GhYHbpvkXDEGOPUfXp/tJzw1iH3EOn3GUkzIahZw1bFVxyP5RbgLj6RMa8JU3kYYftL0BSx9oq08TO6jIFRdLi5eC1iSc0tujPM7F1f9r95rBkEMj6YKrtK0w489wfDU8OlvvGaMvyvNodikU1qpW2K5TSuwV8luvPABMO1DQiGlonXkP3s04RM0nOtuxCwQTlX1RqDDeZupImjd5NbjbwolJae+zR6Sopn3J36FO/KJZJyuR0/aOTMQa40GV7pMAtwHbjPjWDYyHP6mFRlOrOx3W5XIu/YBTXDwHVy2C5anuQ41kwvj+U0kqbQTy1wCPyTN5D4/+KShUdRZhU00iB5hfe1W81aOYyGv9OUn7o/GCSV+prQ3P810lRXqJiP6LYKiMv1S6IZhrm9VAQ45+vLJveygftRh+KlZHFvJ+ZNDXqG6c6SITyy5sBa8ZVtJM3iOgHrl7/WvnQsNQ7z2alkTVmpTHxC+goLT4flSz61Lbr+d9eDKHxMFkkuMXmi/Q3PXi0p9GNIVmQRuZ6ca0t+qc51HpBOnrNqS1duJS1T9RX5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(91956017)(71200400001)(86362001)(83380400001)(66476007)(66556008)(66446008)(2906002)(64756008)(38070700005)(7416002)(44832011)(6506007)(76116006)(4326008)(36756003)(26005)(2616005)(5660300002)(122000001)(8936002)(38100700002)(508600001)(6486002)(54906003)(110136005)(66946007)(8676002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8+xiEO3joalqo24FxfAElc4RIpC3DV57PjamO0wcjutZhTuPEU7WmT9iXA?=
 =?iso-8859-1?Q?70Ry7tYUCDB4Zb9ZHecLM1SI4N/7/SfPG3nwLLmr9XRQN/KLuss2CdrdQh?=
 =?iso-8859-1?Q?ESH5asWq7WfTv+67yl+5NPkah7XObcVpDq0B/tCUdOk32s3nMjvKp4e/fr?=
 =?iso-8859-1?Q?oMsAQ0lR3w/wVY8FqYU6Clj/d8Mq+9RKzyRDAEn2ER0A+Z/OhXDmQ+4BnV?=
 =?iso-8859-1?Q?lK4e8xPgt6tVJ4EImHuh/Axkf+Kg4jc4C/O9IvjnxZnCv2cszH3O7mWesj?=
 =?iso-8859-1?Q?39kV85fi6nVh/e3DnG8wcO7/kqYH8/L77X6S+v6O6kZD5D2cBtBLfA72qv?=
 =?iso-8859-1?Q?EAj59BNYfJ+z3t462tBPwwM5bpGAyjKvuBgh1GAIZqhVbbouSqdXKDbYdD?=
 =?iso-8859-1?Q?iWX83Myk115ZBMS+9To7GuO6ywQBpSMGNfmB+RAGqjy3MhNVEkTMga5qCh?=
 =?iso-8859-1?Q?JYiMEFBaZffG7TIpIzE/lkEGclCGvndxjMoAa0j8AOyMafjx/wPdvOdzpL?=
 =?iso-8859-1?Q?PRxoqZ3u/NmN+obStoeeomU7s1D/jJmvPg8jQe7273FEZKaI4bV8YOWSnC?=
 =?iso-8859-1?Q?GLrbbvbVKX3jh6HJsNHhBiEwMxFdF+04YdfyMYIehQmOgA6rkEpxKzX/dZ?=
 =?iso-8859-1?Q?y0gWOrYBw/kzNv7TLkh2BTc7Jpv2L/MrBQScV7HSrALhKtBkeugrFJjl7J?=
 =?iso-8859-1?Q?LisOM7WdY7oFd//xFk6XJIzOOJqHfp56ApvKgY7q6dQJ0O4t1i9B5wpuJ7?=
 =?iso-8859-1?Q?OQI6GJe6WL6nr/pifD5XNM6DmuuCOfQ4eCE+zm+ms+XYNWobp++mwTb20n?=
 =?iso-8859-1?Q?QTomC0R1TgKJjRdn6+xxkYpQDf0vGI/m9F0Vuz516j6jenuKwhLxAgKPSY?=
 =?iso-8859-1?Q?cdWpybAGocgb4zWR6yBIvhD8SVcfj8IPEDZzqr6+Hz3cGWK7ocmiExsI37?=
 =?iso-8859-1?Q?Wqd0EfqiFb0e8tgIoKwr5/29xU72p/0PLnv06j/IVKfHhkDKDwxoR/dz3x?=
 =?iso-8859-1?Q?gMHta5AN0/w7l/a6y/Fqk60SV7teethKDUF60gQ/J2M49uUTzoGV5ioiLV?=
 =?iso-8859-1?Q?NNNdMAzzvmPvJ6AU7E9w7c05YHluXcc+4AG7uNS0neMIylE4h97kNq+4wg?=
 =?iso-8859-1?Q?l/LCYjNVvg11BwdtQMMfObOOk6fY59frn1c+DC3piOkbaH4PjSUkD9E5Bq?=
 =?iso-8859-1?Q?H6ZAwGQfhdJM6RMvoAywR+Uv6He8BzK0HAH4VpfJvZWL6j9ZGrW5t4OuOc?=
 =?iso-8859-1?Q?B9d7UtWdnZIVSauMAfF8YLqT1msn6byKH2LiuWNCp5MPqtSJ/nmZ6Qj+8U?=
 =?iso-8859-1?Q?yy2fzBSxuFlQjRXKrsiIWwd1gHcvx7jKS4RqltYabwcJeGkR29SPyLL2E4?=
 =?iso-8859-1?Q?wGwnqD654U9VrN+p6lMCRV728PNDWpMxoxTjyrgBs7FeG5T0TV51gf6Vc8?=
 =?iso-8859-1?Q?c+7mgU2CGz7fAfugAD5CzSc92t0g0sKoFgBZC3XUonp5ScJJswEgNv0Ijn?=
 =?iso-8859-1?Q?5+Sk8oFtBnEPdLl4e0MKl0Aqt+Joe7a/r1NkopyR3QeMT6T90qM5S2Kj2Z?=
 =?iso-8859-1?Q?bqQWb1ZQ7fyHDHAX6wMQL4yjxefH1tw/QC04AeS8onhgBgyQJAdW2EB0z3?=
 =?iso-8859-1?Q?ycDp/FqVxzaEcqFNpf9J/1FIt1Ppb5UFlN+iYoTvhtcxufhhyx/lZ0EcmR?=
 =?iso-8859-1?Q?juyZqh/o/vf56oh6OGeoynwWMHk38ClG/+koJWkNokOa+Dfh0B2gToUjf1?=
 =?iso-8859-1?Q?UaKoIQhRf2Relj18kGwQBjDK0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d92153-a182-47a7-ff6a-08d9c147f0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:28:17.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQ1xKuQXIJrH7AgOMNSv2xJ5EMHEiBaPg1eqJv7Y7t74ouYOjEVu0c7As12j2TBzLL77kP5viW6Y0la09gX4if2c8Sjfk9jeq8SeQhMtX+Y=
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
