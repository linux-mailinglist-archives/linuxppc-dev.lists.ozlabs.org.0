Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364A47F890
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 20:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMWLv2HMCz3c7Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 06:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::614;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMWLR6RRJz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 06:38:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUJgdRp/YLR3OdFiqkPyGAJR5TGSnZkfjCVxbGrOoVK02EUgNqLbAVtAvnXeXKAJuHuJcaCXC5FcDVmYTUHowtELvUZShQZe8O7SGbo/r1Z5dRWFohcvbwe3a2I+vsfj9JKldaxAUj2BKZuc1c10DYYVFyzOB+5jg3yJJytuZd/wzlfXK6DOPkPK6odYX5alkQXUwk7i506RXlJK0412TBbacgMeKlWFUXRpkn3bCl8I3kFpLwd25rqoXPNbmXk1Cz/aAPFn6Q5s623UYoTu7jDWMMS8DtwvtqUlRITLtKOuG383tsTgpTstTJ0DYsb38QxB7hZcc4xXuA4PzbsL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD04R82x84zl7tSQ6t9ZKg+qT3Wu9XlJqadQMBjmzJM=;
 b=lIO25ZPDhznm2ljAhno/u8MLzsFe/LV5AOhPCCvhxjiTDw4CNsbZwEKcg6apddCWcFMNEA2uO0eqK0oMZO48VZf/IYwMx1xZarntvGjlrRQjhVvMwtdlMz/AbRCDk6Y7NBzEyphFUSmbFMvGft90fvXjsBuRRGU44F1DIh+b8u23LFihAqgkAWZQzOBEzj2vPOZqnmuYWB2NeAMxlNDWjILCF10eBPhjq4KtiB3MohGYRf5kfTy/KQ0fSxbQlbzB/r0r82jdq+EJZQkKLALZ/izEFY5OsI+VCGpXflfkXbV0EAdb0A55ai40g9U9ntOjeQYIBzk1+bJV16mxMfuEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Sun, 26 Dec
 2021 19:38:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 19:38:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v2 1/4] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Topic: [PATCH v2 1/4] powerpc/vdso: augment VDSO32 functions to support
 64 bits build
Thread-Index: AQHX+pAXhwejkc9jW0iFxYfLSL4H2A==
Date: Sun, 26 Dec 2021 19:38:00 +0000
Message-ID: <169b36a06ea63260a5047d4f44f7dbbf8442aabe.1640542625.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8437fc56-10ff-4b8a-5e0b-08d9c8a739a3
x-ms-traffictypediagnostic: MR1P264MB2233:EE_
x-microsoft-antispam-prvs: <MR1P264MB22338CE09FCEFCCA85B8323EED419@MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ypQXLFW1WGWY/78K4Ah3OFLw3psTJS6X5k0RNVsNHmW6zYVC37EAw632e9Xs8Zkpf8vi2t9XZzDUuJrdDOBSlc3+OrkHSY5gE3WwkLhGB82tkiUHeyyLAqiNCzHyrO1VtFSSvz+tgLypBu6RS4KqJHcutmgWeJUKiy32UTFAOjyrxE2b4VpcBV+6ItkEVfOEz2zPHGKpDu0i1q1cXYU58jleCeetr8YIzsOk6Jo93xNttSUpvQYGXbUuS86OppOO6X4AMrmUPOud7l3M0mEIBVJjn8wqSYxy/X/JHIPOrmksoQ3j8e70S35scu1yyoOb15iaXSheC5JW+Lk0l0H1y59FtN0C9DqDuBmVEUYJ9gJQrlgueBw1yGasl7d3bK5UjKj/NJhnI9oQiZsWocrj+Xnh+nQA7yd8BnM5SMmNL/xEyDknLC9/iAQjxQWWeb71IzoAVmvecuD55DjqWtZme6RU3PWtzconxkQx6pg7VtPFGhk0zVj4YQLl/W+OZau9V9O1pP5fzmtAro7PDusc7xHPXUB6aNiTgIcyIWfPn+mAEibHRdr0QqrYb72AZsya9Jc9kKv0DRKhh9ncXRvduiyMSoLic5fdPxzxUN9I48tvduyDaThrVkuZaTEUEy6m4+oM5xfI9qMN1YhCF56GMIF/hT4PhWbfj8ImcnEbKMpU6TburBPr2RaWuYsA3pZMU0GL2H5u1VwAWKIXbOmDrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(6506007)(4326008)(91956017)(6512007)(44832011)(2616005)(26005)(54906003)(5660300002)(186003)(38100700002)(66476007)(66946007)(36756003)(83380400001)(71200400001)(66446008)(64756008)(86362001)(110136005)(122000001)(66556008)(38070700005)(6486002)(8676002)(316002)(508600001)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pW2WrXcLvAwnXSXcZh8GrohWV7HGlXgcWGfnoTpS2b4OIu4XlY2tMCE4oI?=
 =?iso-8859-1?Q?m2mGC1AZ6HKCY4U/WvwUzKLrK9TYHHZBu1ywKlq2V64R54v2vu0VIohZ4G?=
 =?iso-8859-1?Q?MuPkBlVo/N+QYaj6oMgvZunGAw+2dCJIxZdPa07g28d41iUO0SsqT2R8VI?=
 =?iso-8859-1?Q?au1d/oQhgudfWSoFKlw4ifNq+P27Ako+gkrqbE193tYtjhqpu1JvP0z3Ic?=
 =?iso-8859-1?Q?sGAioeIr75+K6URmrL3jaeYarr1iWXj211iZ/hlJBDZGGqZHMAkP830rkO?=
 =?iso-8859-1?Q?uBZhjwEM9evhNIz3SRp2MeKepTgAmiFW8QQe+N5N0faVd+/5t4kybMheWC?=
 =?iso-8859-1?Q?3nVTy58baRoKjDPzzHXup6YEGPVj6NNo4bWpRVsrGXo7x/eHg4aVr2vJXt?=
 =?iso-8859-1?Q?4G2VRCANtkB3HldYxcJHRiXSPA+9b1KDR6UVYJtDRkP3oEDnEpf7uOLdT3?=
 =?iso-8859-1?Q?DKW6i7bfl5va4xKgVLkdSYAYostXo2ZfQE42ObC462Z7DhhQoxJ+Gzqm/C?=
 =?iso-8859-1?Q?P8m8BhkGnbzr/AFPYXc//ScwNOyDKTSX14w7ZcLRH3A767KhDH10x+5LVv?=
 =?iso-8859-1?Q?+EZrkYGHv/c/dhj3TXl4NarPOmTD4l4y3RJ3p2oCJtryVL8NF7ajzrr8Gr?=
 =?iso-8859-1?Q?chbvyaCzWj2+T0zv+lFd3D8CQeHSLMf3NJwceBgNP2152/5DPil90SVjrF?=
 =?iso-8859-1?Q?CJVxGmzwV/2VeCPcGYTZUYzBKwwtJtIwy1kzUZnwlNd5NTtZx9Fl7NlnmW?=
 =?iso-8859-1?Q?/ysDxG6h+C+rJBjRuwNTz/FlLSG8XVS4VU19ECMe7IZvTizLXVZTg04hry?=
 =?iso-8859-1?Q?NvwBmWUzK5CW8cwFqg965BBdWIwzXkS2R5LtuLw87xQnlkr9vFDJi/c41L?=
 =?iso-8859-1?Q?4qtatHmBtQmsfAyGKwSdXTPXYDoZe3V+apn/YPnIsuRxu97Bn0GuaUtlxN?=
 =?iso-8859-1?Q?IpDWY48WerA4uyaHEpKa+W12rLKmZvMgeAhPcET3MMd38gHKerQlBBaJid?=
 =?iso-8859-1?Q?QCOPkh0X7jEomOivI4kuf82oxz2CkEcncgZrEr0jmqJli4OgA7qro092+I?=
 =?iso-8859-1?Q?JpsC3idmgpZmYkMe8/VEPA0tqTW7cBR5jhQAk020nJNrfpyjdDhTLwHf7w?=
 =?iso-8859-1?Q?ndHk/53XVujaByUDqHe3W3i9+xwBqrfYz8ZtNab3alqpncNHbccqfAxX0Z?=
 =?iso-8859-1?Q?lCSUn5aPLcIQGIUGt9KgOSGXuS8r2EJjTgZ2+tSKgwPB9VtN1d94StOWi7?=
 =?iso-8859-1?Q?VaOlWUSorgM5wgcfQMU8whsbGhdP1Nr20okOOVOAvysHAtht5apuD0l4XX?=
 =?iso-8859-1?Q?9G10So5O7gbwNasRvDTDkf6vYfXnIsn4v88FpcHPdMUNMcRAR+GuTOcQsa?=
 =?iso-8859-1?Q?5sRNj1nx3cxOftZ3PVblaHFsfsoPhDdpDc19kpx45KqE7K992bfTx0rp6k?=
 =?iso-8859-1?Q?FQlTfvcGIEQAgS4uW5IAtOb/v1QvVeD4qPf7YHZTUrV1iT7yVpvzAQsW20?=
 =?iso-8859-1?Q?X2W6zlGd6CIEo1HF4GVlCIdur3MrDwGCAkK2VfpGnZagKDiJfW7ljjkpw6?=
 =?iso-8859-1?Q?1hPz/jUzAeUVdmU6ZkZoBTY8cprPEof+c2Yfk7E7hKKK5VGF8Sd7WQOKY9?=
 =?iso-8859-1?Q?xTpvKWFicFfwWMg298ROJh1gdpw8ntgflTfyt/ytSjAbp67DuEJLb2E6kH?=
 =?iso-8859-1?Q?ScNAg/Y0JMYt06tEebIDXq6ZOSnarS3L/L2jfF4R5h3OPqDWvKcOXbm/Cw?=
 =?iso-8859-1?Q?VSJQDVIe4ZNGKb3H/yxYJHMxU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8437fc56-10ff-4b8a-5e0b-08d9c8a739a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 19:38:00.1269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxlgAKehl+2wKICTb3KtCpL/Et9Kf6nms2DlLQy6GgS9w0c4a5ivbjH5ARMCxqo0WrnUKd41JL15nWcAgribXxrZpqwUUX5g9tDKvyB+VR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2233
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

VDSO64 cacheflush.S datapage.S gettimeofday.S and vgettimeofday.c
are very similar to their VDSO32 counterpart.

VDSO32 counterpart is already more complete than the VDSO64 version
as it supports both PPC32 vdso and 32 bits VDSO for PPC64.

Use compat macros wherever necessary in PPC32 files
so that they can also be used to build VDSO64.

vdso64/note.S is already a link to vdso32/note.S so
no change is required.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-compat.h      |  2 ++
 arch/powerpc/kernel/vdso32/cacheflush.S    |  4 ++--
 arch/powerpc/kernel/vdso32/datapage.S      | 10 ++++++++--
 arch/powerpc/kernel/vdso32/getcpu.S        |  4 ++--
 arch/powerpc/kernel/vdso32/gettimeofday.S  |  8 ++++++--
 arch/powerpc/kernel/vdso32/vgettimeofday.c | 23 ++++++++++++++++++----
 6 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/a=
sm/asm-compat.h
index 2b736d9fbb1b..2bc53c646ccd 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -21,6 +21,7 @@
 #define PPC_STLCX	stringify_in_c(stdcx.)
 #define PPC_CNTLZL	stringify_in_c(cntlzd)
 #define PPC_MTOCRF(FXM, RS) MTOCRF((FXM), RS)
+#define PPC_SRL		stringify_in_c(srd)
 #define PPC_LR_STKOFF	16
 #define PPC_MIN_STKFRM	112
=20
@@ -54,6 +55,7 @@
 #define PPC_STLCX	stringify_in_c(stwcx.)
 #define PPC_CNTLZL	stringify_in_c(cntlzw)
 #define PPC_MTOCRF	stringify_in_c(mtcrf)
+#define PPC_SRL		stringify_in_c(srw)
 #define PPC_LR_STKOFF	4
 #define PPC_MIN_STKFRM	16
=20
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/=
vdso32/cacheflush.S
index f340e82d1981..d4e43ab2d5df 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
@@ -46,7 +46,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	add	r8,r8,r5		/* ensure we get enough */
 #ifdef CONFIG_PPC64
 	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
-	srw.	r8,r8,r9		/* compute line count */
+	PPC_SRL.	r8,r8,r9		/* compute line count */
 #else
 	srwi.	r8, r8, L1_CACHE_SHIFT
 	mr	r7, r6
@@ -72,7 +72,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	subf	r8,r6,r4		/* compute length */
 	add	r8,r8,r5
 	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
-	srw.	r8,r8,r9		/* compute line count */
+	PPC_SRL.	r8,r8,r9		/* compute line count */
 	crclr	cr0*4+so
 	beqlr				/* nothing to do? */
 #endif
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vd=
so32/datapage.S
index 65244416ab94..db8e167f0166 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -30,11 +30,15 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mr.	r4,r3
 	get_datapage	r3
 	mtlr	r12
+#ifdef __powerpc64__
+	addi	r3,r3,CFG_SYSCALL_MAP64
+#else
 	addi	r3,r3,CFG_SYSCALL_MAP32
+#endif
+	crclr	cr0*4+so
 	beqlr
 	li	r0,NR_syscalls
 	stw	r0,0(r4)
-	crclr	cr0*4+so
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_get_syscall_map)
@@ -49,8 +53,10 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
 	mflr	r12
   .cfi_register lr,r12
 	get_datapage	r3
+#ifndef __powerpc64__
 	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
-	lwz	r3,CFG_TB_TICKS_PER_SEC(r3)
+#endif
+	PPC_LL	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
 	crclr	cr0*4+so
 	blr
diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso=
32/getcpu.S
index ff5e214fec41..8e08ccf19062 100644
--- a/arch/powerpc/kernel/vdso32/getcpu.S
+++ b/arch/powerpc/kernel/vdso32/getcpu.S
@@ -19,8 +19,8 @@
 V_FUNCTION_BEGIN(__kernel_getcpu)
   .cfi_startproc
 	mfspr	r5,SPRN_SPRG_VDSO_READ
-	cmpwi	cr0,r3,0
-	cmpwi	cr1,r4,0
+	PPC_LCMPI	cr0,r3,0
+	PPC_LCMPI	cr1,r4,0
 	clrlwi  r6,r5,16
 	rlwinm  r7,r5,16,31-15,31-0
 	beq	cr0,1f
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kerne=
l/vdso32/gettimeofday.S
index d21d08140a5e..c875312274aa 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Userland implementation of gettimeofday() for 32 bits processes in a
- * ppc64 kernel for use in the vDSO
+ * Userland implementation of gettimeofday() for processes
+ * for use in the vDSO
  *
  * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org,
  *                    IBM Corp.
@@ -41,9 +41,11 @@ V_FUNCTION_END(__kernel_clock_gettime)
  * int __kernel_clock_gettime64(clockid_t clock_id, struct __timespec64 *t=
s);
  *
  */
+#ifndef __powerpc64__
 V_FUNCTION_BEGIN(__kernel_clock_gettime64)
 	cvdso_call __c_kernel_clock_gettime64
 V_FUNCTION_END(__kernel_clock_gettime64)
+#endif
=20
 /*
  * Exact prototype of clock_getres()
@@ -69,6 +71,7 @@ V_FUNCTION_END(__kernel_time)
 /* Routines for restoring integer registers, called by the compiler.  */
 /* Called with r11 pointing to the stack header word of the caller of the =
*/
 /* function, just beyond the end of the integer restore area.  */
+#ifndef __powerpc64__
 _GLOBAL(_restgpr_31_x)
 _GLOBAL(_rest32gpr_31_x)
 	lwz	r0,4(r11)
@@ -76,3 +79,4 @@ _GLOBAL(_rest32gpr_31_x)
 	mtlr	r0
 	mr	r1,r11
 	blr
+#endif
diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kern=
el/vdso32/vgettimeofday.c
index 65fb03fb1731..55a287c9a736 100644
--- a/arch/powerpc/kernel/vdso32/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c
@@ -2,8 +2,22 @@
 /*
  * Powerpc userspace implementations of gettimeofday() and similar.
  */
+#include <linux/time.h>
 #include <linux/types.h>
=20
+#ifdef __powerpc64__
+int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec *ts=
,
+			     const struct vdso_data *vd)
+{
+	return __cvdso_clock_gettime_data(vd, clock, ts);
+}
+
+int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *=
res,
+			    const struct vdso_data *vd)
+{
+	return __cvdso_clock_getres_data(vd, clock_id, res);
+}
+#else
 int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
 			     const struct vdso_data *vd)
 {
@@ -16,16 +30,17 @@ int __c_kernel_clock_gettime64(clockid_t clock, struct =
__kernel_timespec *ts,
 	return __cvdso_clock_gettime_data(vd, clock, ts);
 }
=20
-int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezo=
ne *tz,
+int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res=
,
 			    const struct vdso_data *vd)
 {
-	return __cvdso_gettimeofday_data(vd, tv, tz);
+	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
 }
+#endif
=20
-int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res=
,
+int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezo=
ne *tz,
 			    const struct vdso_data *vd)
 {
-	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
+	return __cvdso_gettimeofday_data(vd, tv, tz);
 }
=20
 __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struc=
t vdso_data *vd)
--=20
2.33.1
