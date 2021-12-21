Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DF47C567
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 18:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJPBC0rJ8z3bj0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 04:50:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJP9j0JzKz2xsZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 04:49:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovm/lcPTprjyf+pIofg5KDPg5vhXFIvKqRKOthZKN2X/mXwzkImCcpb7WV9vQnBgHKpO6LTqgB8dDVW2jjBXJfMBDJihhURt81meviENJZb56QzqCVmUmT2dVmN1my34XFHcreIGXH4vxi3Lo/SydWTC9Bv5JcZBPbzeGwjsIWG2KE47BUtKzaFCKLvTjDIg1igfvgi9aq9yfcdX+crevp67v5wi+2ph1Lm+qr3ahFHCVz9e54bXzPBwlLefPfOnN76gI6ODqgd/b0ObcdE9KiR7E1fe3+nfC+Yo+WokjHizN2lsIb39jtVpe85OSJ3KG1WdqZ2qEiJFf2PQGALGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD04R82x84zl7tSQ6t9ZKg+qT3Wu9XlJqadQMBjmzJM=;
 b=L6yR6tAgyKKR4u2Zkc7/IMAjEk+FvHd5/bECYqpE7M8wLzMCmHEMPbWojvameW2tbeIeQy/cRJ7C4SYna21Yo8p0mKUZ5FdZo2uDW4sceM+mMJ9I/oS5xWPVuEGYVI6NVfN8nxutmfUV8YVk2RoysBKw5eqoBXsSo6B61KMsWJaitBmo/lsKMpywmwXjFR0e/s9c+ycQzvJ5HqDEwWu0lgD3yJyCVq7JV9RyJ8DIkuicTuwOwXeuZNhcrNWQe/46WswthPONpKkQKJWJB3/ID+JhN+o6kXaQ1ehTeWv6pkngoGA41ZFqVCM2V53Ocre+cKzeMCOznDvxX6xLp9uwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0648.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 17:49:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 17:49:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH 1/3] powerpc/vdso: augment VDSO32 functions to support 64 bits
 build
Thread-Topic: [PATCH 1/3] powerpc/vdso: augment VDSO32 functions to support 64
 bits build
Thread-Index: AQHX9pMcQ+oQwylQX0avpFGvesWhUg==
Date: Tue, 21 Dec 2021 17:49:33 +0000
Message-ID: <09b25a22cd5179eba4580ae95414f18fc162bedf.1640108961.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56aba0bd-c1bc-4738-1478-08d9c4aa3f57
x-ms-traffictypediagnostic: MRXP264MB0648:EE_
x-microsoft-antispam-prvs: <MRXP264MB06485B22D1A84E2B1D28F98DED7C9@MRXP264MB0648.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xV18n91EVeU8z389nj4zUXVYnbqQYdv6wXddh6CKaGAOLm2CcTb1nzS6Q/6+oExkCY6/50oIgaoFui5nolzV3SR1JQkP1XLojFB3bE8ewxNydEmHPAjEZHHZks+GiF4u7Tq6AwhjbqcFMA7wYTyARnQ4QvS4GE8K0ZjkG4sY/nxU19OmbTjEvtmR+S7vPfkujHs/aW12xYV9q9QZwuRFU2AFZPDtM/Cyan5U91Y8/YAi2JG2t3krI95h2ApkyXSlRgB5aw92gAFfCxt9Emm3pEtZQNXyYluY4rjQuzXYs2eEM+rbkpT3LBxplu7B2H8+Wfy+211hZ1GlLkQWBVeQ99yo0pBnHdqcdHz8jVtNt3LCV8W8hRmF/ayR7KdieexE4jOwR3fyHPDTwu8DoSxoMgxfQXTzfrPhfG0YxBEQiR2vb4GbHSeZNN6xqCrvv4YVudPTXRGOgMuW6z0OPvBEZFX5E40uB/fhuebkRe73ryiXAv/+/apCzG3tZ141B8Daqu4w5qAmhVn3c2RVJ4RHP6bztpHOuTHxqfXaSmR6zCqarSYcH91p/PiPJtvcCFBqnhMto1cNFoBaLtUnB9g2IhdRaqUb8fQpj1ri3yCRUTcMK3yiRx1aXDicxJ40+FYnc+54hL3Q0tZbDJOjcxxgZFhqogZKmEgSG1xllHF9Tj51UdnwvZo1fotX1bseWmtJfB3M7Mxden8qQjlajYaAxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(54906003)(186003)(5660300002)(6486002)(38070700005)(26005)(6512007)(44832011)(64756008)(110136005)(38100700002)(508600001)(66476007)(66946007)(66556008)(91956017)(66446008)(76116006)(71200400001)(86362001)(2616005)(316002)(6506007)(122000001)(8936002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6Ao8eieYhhHOtsCWxiYZd05ApC1Wbv2fHROeP5P3ovdHfeFDFiunCsli82?=
 =?iso-8859-1?Q?Jvf299n+CeYFBVN3ZqFLuTplWj5vkn/jAAjWrbROABfaYu+0mu/NFEPgbK?=
 =?iso-8859-1?Q?JttdAvJuaqrk0siTaYD4KOXs0fkXCBUKHaNBNddM4gu7CZwI72YEZ0UUQm?=
 =?iso-8859-1?Q?io22cMOrmi8w8Y6PJzAlIM8BfsFCRHWz0AjZj1YEg4ucOXQQYVPTdxqooL?=
 =?iso-8859-1?Q?d7KHNhIFMA0fkh64n3sz/v3jAAiae40jT9DKy3CmDhHVT8B1tt4k4thEp5?=
 =?iso-8859-1?Q?2sEyC37RBtVUwLgkXe8UFXlrMnKJ/IhlaJdzGMksZwpocD8nD9Fr9EBUYV?=
 =?iso-8859-1?Q?hGHhkpK1xPnIWq1cnVHIsbrPbFrIvtBEAvRFdEj6AmMLwzqIN1N9/0E9qt?=
 =?iso-8859-1?Q?SrlLD1YQWRC1n1dU+8K4exdOy39L0eOmtqPB0JkuUxn7Zsmh9+CkZ7Huhb?=
 =?iso-8859-1?Q?05b6/Qwhbra1ihhkVK/ak3HzwZwkd+kggMxyzzigTXdyhi8624115TY3Rp?=
 =?iso-8859-1?Q?YS+ZXKSEzf268h+LoBjqAQLbT6M7scLNJElAAlfQbRBEf8LL6VXtDKBNcX?=
 =?iso-8859-1?Q?FusyKB/PUFua60yTxTVJ7dNHvt/73cF7I8/JBfNEmiV3w1tDF/Kw2aXKo3?=
 =?iso-8859-1?Q?KIJILmFT23zBdTZLZGEMEZaufq/B8nQ09VIpey6OhVOxtpau35S6kbJktI?=
 =?iso-8859-1?Q?hohwvv3AYg+Cr69qwvSx4AxzDKfqIl6kzdlMaFGMV7W22Mr7W3++RSJdFb?=
 =?iso-8859-1?Q?C2gwpb0X2uSl30H8HRbsEFgNe3ABoo36vNGAm/W4rIoP8t6i6YJQ7O4zod?=
 =?iso-8859-1?Q?rB+t0Qdjbk0xNBrBBI+WFrUFv7wLNZJLSehb2tqH0TVxeBPGbYv/kpn1ai?=
 =?iso-8859-1?Q?qn9tQulmWTFLUUGyphyl5D4r2oy/O6G1wXoTiq1CbvQgrcozVXLcSKavgh?=
 =?iso-8859-1?Q?NBTrW+uqpbJ+RPqcBpjrighdIIVZ6zclO/3iPe8qCjQ9m9BsgtledasmQH?=
 =?iso-8859-1?Q?uT/VJdx237k32BMG0n1ThXdYrITBWi583sh2/BIdfi3wgcngMPI6E+GJkL?=
 =?iso-8859-1?Q?GgwINtT6Wfq86vOIgliDgtHOsYDXSOa1TrbVpocCBhM51x/4Ud3kCkR87D?=
 =?iso-8859-1?Q?DMm6OFSV5KNse1QoVp8kGwM6oJA1OJ+p6lPJJd7ExC28dSPWR3wD47IJuD?=
 =?iso-8859-1?Q?cRHAIrS5Jj1ANIh8AiPvkm8/rjR9x5fmDLY84JVqI2nJMCOMLfx80ZUBnP?=
 =?iso-8859-1?Q?GzT4HSWOo4BnqVSuOjTb2tGhVKCMx+05EskOEvrh8S220IdpVxLfeZlNxI?=
 =?iso-8859-1?Q?yO+mvjo5mLrY338esnrvCv81TycQHs6uslVSZ38bXmOfohMzOeB0lJjetI?=
 =?iso-8859-1?Q?bzkS2O0NdHsmumGXclDyYgsg9z3TaJjOkCXb5IlrE2gZwH1CWKep5PXChN?=
 =?iso-8859-1?Q?ur3Pzbgah8B3YTvyn4SEZPCmhp+uiLJQ7vCELrwlqJePzh/7ITemQDp0fi?=
 =?iso-8859-1?Q?VYtmWNHgs3hOnqjV6vpvd+kOv50Fuq62CkPZyiIOJkER/Ogvg9F5yw2FMJ?=
 =?iso-8859-1?Q?dlwv6dBzpm3cpcq44AcYJkVvegLq4By8d8H4qMLRjmiTDUrDkgCMTwo5Sb?=
 =?iso-8859-1?Q?M+0LfVhWGePOi2sX+w9io8zrkyGRNvl6kvPiXzXva3KxnKJUXPcsSa25qC?=
 =?iso-8859-1?Q?sGvbYcNuyBKpZiod3nYkHIzj/TbRnmC8lzLCzsjDaA3bPs/Omi5PXUlInA?=
 =?iso-8859-1?Q?d15k6XZygfEZi6yGBeUN3k9dk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56aba0bd-c1bc-4738-1478-08d9c4aa3f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 17:49:33.5167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZN6ZyFLBvXKN9IB5JvOLFxYhJHky/48AMqj50RQBQk5ZOP5S9lqstfrJiBjYP4VFpgdSp4lXFuvU3SeQJjZwQRw6EyFWU6tjTJPQ/xz6wCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0648
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
