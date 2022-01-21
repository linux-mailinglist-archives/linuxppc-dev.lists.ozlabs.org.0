Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3034962D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgPyy32rWz3ccQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:31:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPxz68pjz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:30:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpoAjLInWlTQmqYs6jx6ubpyxLTh88D4z+h1iOKf9Ntx1NguUQB0lVStCK92+7lAvHzHG3d64rq4vWUneGD1t8rcynCmUUpk2GzKtx6+vF9A+DrGqUrg6WLColFfnNbw8mLD9LsrSPC64L+NkG1VwfYtf0l67/ccuqNwyV8tg3cQgjKCXjtFFlT4e7/1207TNJCmetBs7ec8TKRbZFhxVHKREhFtxYxQ10Bg1YisK4afFGFfHiu609fPwKNeLIRGjCnVrsPrzqZyFn7qhoNxJKiLbS5wW4p43bCOB4yBpmbEC1BLCUuPrPL2pBPbobNe1IzkXBliKvI1mABHx7suUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD04R82x84zl7tSQ6t9ZKg+qT3Wu9XlJqadQMBjmzJM=;
 b=YMsLbAOF4VIidNEbP1DrSZslaKlfNMs0Y3WQqQ4YUegIeVjGidI0SuW/0EqS5hiuGGqlWn7vcESa8BzhMNFbTP1gXZ5lKueNbjQlBDjMjY46JBmn/ZdE6Ehuxmzq6rq5oGxcAFSH1HUT6/R0bADV+HgXlA9cYH519H/gxcRiA0e3kqdQtI8plEfL/UstP4qEDNMPzWIt30ILUv038Ymscwf47kGjDj2Q8nwtNypASsYt+XW3jPK5t4T952yTXJ7uHVvbiDyjmSsJHkmXRAONC7t4oO/gB4guxCan0CLyJEqIiI7zZmkKnqXDYZtdb3TDhV6hlggNmiXgwcDVUbbh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0900.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 16:30:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 16:30:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v4 1/5] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Topic: [PATCH v4 1/5] powerpc/vdso: augment VDSO32 functions to support
 64 bits build
Thread-Index: AQHYDuQvGc9XpqFUPk2tWKRqUfvjIw==
Date: Fri, 21 Jan 2022 16:30:21 +0000
Message-ID: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ed3f637-607c-4912-e9ca-08d9dcfb5186
x-ms-traffictypediagnostic: MR2P264MB0900:EE_
x-microsoft-antispam-prvs: <MR2P264MB090026D62D419FD9D612E8D0ED5B9@MR2P264MB0900.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +dUfDPXsDs1x6YThf8hP+K4kaglVA45EIVDKoeUnswOiUMQ5FWZTeBTe8kWBcoAguIb84Xb8RnGcqDNSDJ5lfvvWG0tyGRiceHsKq8ysro+18I+wbhdvcZKtHq26KF6MMeToH1TAD+mBV4NLXl/2tYA0kriQ/qxEUgkw4Dd9A/24TmKsBidGGRDCbnW2gzHrlQroO1JR/s8GmuCusykWi/xNCss1WQiukBFwPXv0BfR0TgnCeJRtYS5Z5bGcMmmgtUVb8Ki7NaMPTro340buJaT/IkEO+WPkCuLh0lfhYUtV1NFAAL57LQikjWS67b4S93paQ1cxvi+fwOyYHY8MZY/ZOCNdJUbnrC83vhOvr6B3Iotu0rNia8oOxgK79ca0BMPCUEWLLnb+jqaEqYtd/2mriPQCYQr+5L5aMBi/lAMM8FQmwaTToY2rUwiTGEwqc724meFMwAQT4CxlJfBiv/Sr2tpWwmpdONAZ8xD116mTloxSHhCzCo4AcFGb1Gm2VefpZAc5CUcq2MLib6OFbDhk5HH8sUs1BHTNZvLdhCI1GndRZlnzUjHMOSdrKvM4i4teuIQN4wgYWesbl0VGcx5Y2qpq49O9+iRfXyyQwGjL7suNT+02loaCA8Ae2in3XNPzcqFGPncnsVkFtzlCnSKDcsqvJ13IqVqM9cv2OlkYYtsFWFWAQLI3Od8zvh0xgcbF+m4mlqAQumZRnoNjNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(38100700002)(26005)(2906002)(6512007)(186003)(5660300002)(6486002)(122000001)(2616005)(44832011)(86362001)(91956017)(36756003)(71200400001)(83380400001)(6506007)(8676002)(54906003)(316002)(110136005)(38070700005)(66946007)(508600001)(4326008)(64756008)(8936002)(66446008)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2ndUnKEpMp3FXUSJ8BzAusa/w6sR/iytcZ8DHY9+aMHK/M2Zl0PrWqyCxu?=
 =?iso-8859-1?Q?+Xcp2xPgo6EJneDLCRxxFCJHtjESNGKjbDykNxwXwwJ6Aeh2OJ36nAl1co?=
 =?iso-8859-1?Q?PVUQoRjxyZgL/3Dv+SK1kRtX9GcMAGsOjFPw+R2oAfNs1G4FQfqZfHhI2+?=
 =?iso-8859-1?Q?LydoOQ7EcD9+C79hRVlgOk/RaB8/vL25ql2bwDOxt/Tg+y/T8EjPVbPNM4?=
 =?iso-8859-1?Q?wY2JSu61sz+BvHLcDhS87lxIFnf+2bIvL4srksCpzcSeZJ+K9UK7I5nvXk?=
 =?iso-8859-1?Q?DHbsWmx0qoHEPn5bc9RNbl6jMLLCEkWNtkzf8kwvsmam8Q7O5EnfPMAC68?=
 =?iso-8859-1?Q?xter6BnHzj9aKA0knbhT6WY40ANYzoi+pS1M76zwOzVXk4Um7mb0XKAHnv?=
 =?iso-8859-1?Q?Xkf9MNy80Xm42KWuLFOh2Fal4i4mS0sSnGyarR4R2al1MKWVWc0AQ5OpY3?=
 =?iso-8859-1?Q?kYyvuRdgGiWKqP084YuGtv+aMLdSovn7Iy5Ha6q5vdyjtYqwp6dZTajxL4?=
 =?iso-8859-1?Q?ABIoK2M0Uut+Hx/BPK/90GvMz8fCtPldqcY7zxHFsXQNfTsB0P526DCq5b?=
 =?iso-8859-1?Q?2UgUhRfXng07cqG7vYhFm6NzZsS3ErNGt9OlMzabO62PGAYo6/VKmvWmHs?=
 =?iso-8859-1?Q?ovQpPsafml4uDuMS/Omz7RGJSiQdUMdRqQvcGTTbO2yztE6yJSuLjIFqAz?=
 =?iso-8859-1?Q?LoiliOX3Yq7Hbd7xOwZPIV3VmaM/+iDBuKtU/2lbn2kWNqbzSgI/Lbc3CM?=
 =?iso-8859-1?Q?ggzMQ1uzO8iIRM3vwqM0GBrRlrk5vw2UUcnv3EVQSKhlST4cZnaZIbN4HQ?=
 =?iso-8859-1?Q?nr0Td80wsOIqqhN1ChMTe9Ar8a4f3/k/XZLu2xYnH6aERorbQNtP3m+Wgl?=
 =?iso-8859-1?Q?rJepcYT2cpiKGAL+CjBAHzJjaTCaFmeO2jxILDyPbr5hPHc4Bb0icWssLB?=
 =?iso-8859-1?Q?jcV0547ebVmKv1KrnRhYAllS1XiEfZBpVHzvTdG8DjLgd39x59t6lyUOzC?=
 =?iso-8859-1?Q?kmAXtiYXw4b7nXnBRqVd0paA1CIce0iQcOlO77D+v5AL/kYDH04uda0A5X?=
 =?iso-8859-1?Q?K/GfPq50Aqi0nl4gPyKeQ4aDqceW9wcXAWa0WKF+DRXclLdwMSmvEDlTc2?=
 =?iso-8859-1?Q?tzcOK5jjf36cBDVv6TrPIrDyLSXxpGHIdixxZ11SUS/VqWANO4sXQNxqp/?=
 =?iso-8859-1?Q?J/52WT7IM634FIKpDVqOLqHju498dxMBIeravki3lz9swNQquMyjDRdUjT?=
 =?iso-8859-1?Q?mqfFUf4lczLLgkAMti0CiCIgIvVkjUu5/QUhbHiWTlhZsubFYfKFbkw3xt?=
 =?iso-8859-1?Q?hy69Ul2orK7zOBy3NSfJqps5sBNV4xzVMwLJGRe1tt5mIkBKy/xnj1QfRT?=
 =?iso-8859-1?Q?IFfmgN5xOLkT9zauwm/hqkq2QPCXjSZWCKRVbmWA2/UTC9mehcZLDwMcHj?=
 =?iso-8859-1?Q?hBFQSBeH5EsOI8accrHB0/SgoReaKcYUcREzYLe6VHNC8nvuxlgozJgIm6?=
 =?iso-8859-1?Q?3I9kKh0X3y1nvjmUIk+6XgO2B5LWurGWh8V2hUqUJgRGx7cheAq7HombOf?=
 =?iso-8859-1?Q?zHqId8hx0fj4dvsTOUjqCbI/PtkAhVHXaeYZSUxYl3ThYmIeDW/9tYToG8?=
 =?iso-8859-1?Q?tOkwLdcbdvf6t4nEAMHLfKaEDPFZGPbf95q6FiQM9kkx3vQR4m72Ol10Ci?=
 =?iso-8859-1?Q?CTd1kT0/3XlF75N3iryqwgQJuKjrw3wUbLKV1rB40W7/54x9j1XOLGO3mL?=
 =?iso-8859-1?Q?GXUWmuAT2BZ2odNvaktp6lcp8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed3f637-607c-4912-e9ca-08d9dcfb5186
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 16:30:21.1709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYctQ7VBDnk95iwH/LMBKPbAyxvpcKu1HeyRwLeK4lqCz0l8LRKBZw6DbyiQ0wMdNRqKwkWm4XuvgmYMABdZJI1/Jo8nzX4vEr3op7oA+DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0900
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
