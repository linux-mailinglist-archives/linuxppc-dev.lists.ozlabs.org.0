Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3D495D3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 11:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgFQ73rGFz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:06:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgFPd5ZrKz30MG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 21:05:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTtKy/epBA4IuQukL4h8aM7I9K/lWMUysjSGMKA4JNjCacZLn/qEDZ18/othmcCx6sz3RuPCst2PnaUp3fpzDshqslWfiCP1myPm4V0feHR9HUulH0Km9ri3MrOSWt47azXAtKt7TLmUx0bZhfezdHI+pyWyY2T+GBg9bF2EE1iVtDQNkoD1lClHFNSr0U4z6oU10M+tkT7qZiiY1iFQe1NuwhfLabh++OFKPyPaokBrxdAoGhhUZ4Jh/KvUrYVVYiIEQ+OKWK/sjfuizmzxFBtpe4Y2fMFXRLW37TsMUNJRoy9vd90A3OgBDUXxAb4BNUW7yTLq0reY22qBpFIM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD04R82x84zl7tSQ6t9ZKg+qT3Wu9XlJqadQMBjmzJM=;
 b=I93kdqnq0Ue8jxhqrJtDEAWcvrI+UN6eT7q4xjEyNbBbDBzUx8i75CyYnTd9OItvo16kNrtmcFnVB3jvr6rpm4zXNpsyY5xFd72odpjGGL5uoxdBtV7NzhFkjp+kY9JbNKP+niQ6lOsAyK9y2yXCBIKWtZlo0179MQMA8v7YyAd0GxzHz6vXVt4OccfVXKlq3ztOfb9CdzrGGI0rXod82CdwWMBHjKi+2Vw0FQx//j36CybPM5uqKAvsBd28W1zr88C35hepeJE325GlOZJWjIdXAdy4ONFkRGMzrmcxhPJje06VJImLSG/2sLwuztXYjp2cNO6mquGTKX/QRz9Kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 10:05:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 10:05:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v3 1/5] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Topic: [PATCH v3 1/5] powerpc/vdso: augment VDSO32 functions to support
 64 bits build
Thread-Index: AQHYDq5kgUO42fKN0063pL/uJbZDfQ==
Date: Fri, 21 Jan 2022 10:05:17 +0000
Message-ID: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3baa1ca-c24c-40c0-fd74-08d9dcc58694
x-ms-traffictypediagnostic: PR1P264MB1918:EE_
x-microsoft-antispam-prvs: <PR1P264MB19183ACE092D77E89E686057ED5B9@PR1P264MB1918.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H02wVrjv1yvIKSqPJlHIGrtrfBS1dKOeg3r/jNkvD2uhKkr2fdPz+Sn2Q5qM/6Xj6HovCR9miojflmxjZa8NeTLrVA7R7lzBqUjx8FAHtuZj8nBzFhWvah+O17c/OdPcgppG4LgBuNLvGxqsoYX+ZdgyZ7T/KX8XK2SWHil4UTDnTccKBEHixhqKTUpkiFz53WfJQ9bVRC9zGBhDJMspcHbFI2pRmicKY8jSz8AWvH0E0x9oamgC5jSYjwwDc5ze9s5lNcsv9u8TEhli7HTBgdUvLWJ28wUuDSh9x8hhy07WO3Ggd49Q9PH3+iz/2fJ++YBTHeJOAo246Px1t9SHjoxPdXKILXtr8Aj/lJWhrQwaQrGJeUwLS/jhsflG4rO52ExuvKFgAbPSpV32/zUfkSkok48Io7uCgi+QlksqRXqCMlvo/9/UjAiMZRk5QSubD0Q4zmNAUnLrWMCbZY0hquNTDixMCnrvYH6YrLfmh8vmds9zLqT7ukGNqQAXxFxT90nQyf0zkqCnEzTXsPrde1XWV3sl10nQGAkjWmRyU5AzxrryZuQ+H8cXX9lNZQl1poFTlhOq7G8His4k8FBtuF9WB53poKFWVj4X6YSyZ73+3V0LipoiCZfJ/d+Wvbw3j5dS07hYDk3LIgaGsy0saI9Z3yxHrgxU6gZ49xCS2kIUisrPQNxhUEQAgegaxUPcmoJu2BE9FL7JVaXKLjYnJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66446008)(122000001)(6486002)(38100700002)(110136005)(54906003)(64756008)(316002)(76116006)(91956017)(4326008)(66946007)(6512007)(66476007)(66556008)(2616005)(44832011)(71200400001)(508600001)(8936002)(2906002)(6506007)(8676002)(36756003)(38070700005)(86362001)(83380400001)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?alJOXcoaZUvZuxO81zMExRAXPl2YdofIxymbj3vtb75BkWSrKbkfD49/QU?=
 =?iso-8859-1?Q?9Uz7QGH1+eDK9zs+8IffEoFx6VupCJnllxxHnscwWZo/4XeGR15q8h4GeO?=
 =?iso-8859-1?Q?D8YVYEzsZ9qDUbe4qWDKMB697IK87n1/fbESGVM8u+gyoy5gnCQkTm0Hj2?=
 =?iso-8859-1?Q?iymXYpIbnkX0hOrg+R+zN7OL9pFOgXWXKFHclxdnVnyC3e2lniFKEMIpzg?=
 =?iso-8859-1?Q?isibxhsE82ygYs1w4tbPvOAKX43viNArDxDcXgAyZGPIl6EpDvZRquef8J?=
 =?iso-8859-1?Q?7nc68RfMGSpFH+1AbDAlKvkMhBhieabCyBTR0LQDQYkMc2f613tHLOz2M9?=
 =?iso-8859-1?Q?z+FQjdrjMX4Tdzp72yZGuuvtilgVO+8kpHKiRZKRFfkfFZfLKDnV0X22t/?=
 =?iso-8859-1?Q?g8uSBIoVDVzVZ67u4uoJR7F5L/+Wt1/jBd8POa+0/5Pzn5zaaa/MRjTzoo?=
 =?iso-8859-1?Q?V+7/aLZTIYPU99RUCNRj801oITh5doiBMKBHtppq19iFYfKS9ote+4eHw3?=
 =?iso-8859-1?Q?RgisUXGGW73NOphztAHH4A17kdM8geZAFI7phze6s4KVuWVU7wHdctDAPl?=
 =?iso-8859-1?Q?IvU1ttLTw/hQdeEHalzbS/RHQOKQ5Fz4Y67rb1njpQyTE48cCQDNVguXzv?=
 =?iso-8859-1?Q?WOUEteopPjvuY4GB9R3pgoUYzyDInu+xh1+2eGkykMT1Sb0IOukA31i6Sn?=
 =?iso-8859-1?Q?vaCUPLc8MYYqpsTtPoSr/bt9Lfn/+axnEAkIdiR0i4YbKOykIw+LF/hEdW?=
 =?iso-8859-1?Q?wMJDNfS2dKV9C6EjWn9blD8kmSNuwNgyyw/iIXIciADgVxDCcZsjD6nzYm?=
 =?iso-8859-1?Q?76uSo4TK/9UriermGBeNMbpMDsDo461SDpyLj+fFMQTwwjqf6mwTWhE4Kk?=
 =?iso-8859-1?Q?ETYmPFuUC3pkiyLCIPtGUWkqVoAXSNS0g4eisN28Yz6eCcXw6JdsMVpFix?=
 =?iso-8859-1?Q?wgRnX3D6PpTF9h6ggM0ruZ6G4o0x19nel7A3aVq/MxqVWxb1lNYK99qIvc?=
 =?iso-8859-1?Q?9mz1n4whZBftQmOlYrJXKWmhOsjW2cmiBqiWArmh+UQNDulsi3iiAbWQ3T?=
 =?iso-8859-1?Q?EXxGqd2GyRbIBY4/f5M+aFmNMCl4t4mLR8mKEpJ+96+9w9mB9CAF4m6dXr?=
 =?iso-8859-1?Q?fHU1Qh8lLn9AlJo+XxxXpx++8npQacnY6V6eFgNtxHrXIwnwEtQs/087J1?=
 =?iso-8859-1?Q?HLCOKc0lwsZpUZLxW1E/dJOS2bK3ZnBPIoIyKQ988sAEgzu737yGHJQ5b/?=
 =?iso-8859-1?Q?UfgK98VpqSMp8cUN15kykkDao5PAgnFUsoD2EwP71lqcuVuj4+B12ZIMli?=
 =?iso-8859-1?Q?5PZlg8xoGz0LNv5iNSwybgc8R65rAHhgJSF3tmirVDs+lsI2br/UZgpVm/?=
 =?iso-8859-1?Q?FJMP5tLnfcaODGldKPzI4kVpJ53pnPxXuU7up0SG5DcZfPdyhab48Qq4Yn?=
 =?iso-8859-1?Q?g/gi1VS4ACZPvHTqms/Fz3yf3DBSVS7Yrn/zixhz029zRuYRJHDnqiZB5p?=
 =?iso-8859-1?Q?BETbtsNxv+6nBHUol9RSO7+7sWDbawSPOkaj7DejSQmG6pXRWHFu47GmVZ?=
 =?iso-8859-1?Q?W2wH2aXMDFfbJeZigwdoNMQMu0pXj6Mw63GvJ3a4sp9IH2l52wx9lFmMkB?=
 =?iso-8859-1?Q?D7cx7lrt+zFSPqfeMB2Ppwc60LXvMNGqo2a3QH5DPmbsTbxJP0qnD6Cqv/?=
 =?iso-8859-1?Q?vZ1JpDIGuwAbrLqtfPDSnYV6Ryc+czpNBA/kmcbiEJCUGy7dhzvA3cqjgE?=
 =?iso-8859-1?Q?TQuiYZzvO1rLSnzeszd69HtnU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3baa1ca-c24c-40c0-fd74-08d9dcc58694
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 10:05:17.3590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Gvcd8aF06Z8Xzsu47NXRguC1P3ElF8eEoZBj9g/yRR+aWFqMoUJgUjnRwDzCbz9ace47fev/jkut94Mqnl+WlxNBJHJ7nxFyZcgT9NFdas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1918
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
