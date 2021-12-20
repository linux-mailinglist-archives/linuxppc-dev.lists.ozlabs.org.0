Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A447B162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:41:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHljG4tMjz30JT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldd6yW6z3017
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8V+GrDe2mEEJliEHK74/GHGTy/R5/GHYR9671G114FZxojKk5LBt6MT14D/s/u1XhLh0efzhOgfH2NW7Dt31ZddDfqplvBR8mxubiZUr1HVEketfdAr+4TT6suJuOgjjPhVcwpz5TYdo78zUXVCsnPWC5BUpVVbOXx2Dt9vQvrfBTgcUE49ixoXOWqef7EnPKAdTuirAh/1fE6cG4/h4EjwfW6HbzpCX7Ial+MVAIGk/rE3rIjogxnI5laOBJ2PfTdW+Rd1km0wB/uuBKH1UGQwnfmJQ2hUOQpSb0SG6Y9f0oEf6udLCZ4uGO+BXIpPf612xGOWthjevGHc8N7kKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS/bPfMWFvYVot7vUnbQMniRlb2x3C9nR/OOoWPQ82k=;
 b=CHf1A+7YlbhEjE4JKaj36Nr0JilFle5ylUKi+UsPDhlNOHC0aFd/oviLBO8YdBbYvXsDmgO2wKeR99AMswCK4ib5LP/QugV65nwuLu65s+yEKXeRG7Cu2U+CFleGi/JXMTW0YVekyvFGcKvS3D8/rwo3XOxqYueIlkhv6xJAQSqYj1d0zrpFMyRm6LMrEp5A5Ouiip+/yx6Hfvt4cDxMPO5P/xxRaYZdj7tO4+I8rsl+eYgS6NUKwozxNbNF78d0mqWnXloRXR/PA0otN3OOVdTt8cZD2W9fGGuAqJjIZ1yEuTP94bCxzKbT6aSoo+KcB+j8OPn/xB/H9ttYOVFcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 07/13] powerpc/ftrace: Prepare PPC32's ftrace_caller() for
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Topic: [PATCH v2 07/13] powerpc/ftrace: Prepare PPC32's ftrace_caller()
 for CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Index: AQHX9cAAVQvvUssGakCLDiCzPg5K8g==
Date: Mon, 20 Dec 2021 16:38:22 +0000
Message-ID: <da9734eba504998fb914aca12131c9f6bf6120a8.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ce2e6da-f140-4009-ddfd-08d9c3d7232b
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB216133322EE9092CD8EE4013ED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /VwNQpZh9hjD10zj4SxNdHLC8kdn4lbX4JL0q/XE3vuul/Hmenrhiw5icMCHZfomaLGFJUihTkm0esjeAqOSI8nO7VyZS4UpqR/cR4e5hHLhvXPAaJM1FnOKSbJb6XjhOiSXTTHqvJe1JdsVgYKiOF8Jk8sEvQjmmBPvXi/E2ri3WA3PZwCO8pJJ2WWu28WuY/D8uY1yIMiCORXV8tAL9sIjPCLIDsiNk5aw2ASoqd+8BNbEDM1i2dMaBl2BmFO6gXZttRr49aLASPFtXj0wweqasvH8Er6ZvFap2ms4DTE+CobKKOSAhh6614jeUoAQA8WJVvxin3VngvVqrdU9aIBOOv7J8DcDVPgITEPGGHYWoiNmdBV7GrScubrpZlIfPumBXPWXc/YFliMHr2LXBfGloVqWOlLGVYy71avrifWkUjxL7zudQjRtNZhrdCK+XmtoLkIVNXnId1KTrI5jsrB5FtUUQ6BjGmiEHJTohopQ/72aW+zUOZC3nI98xh1hUgAcfupAF4Waq0ErwnYtZYHwxNVleyBJiNlqFbGChfRyBp+YwSYdccxl3XF6+irMY+NaaQWvlQHZXQQfzB8pgJpvHsFdMOOenJLcnqEBM3eVST2qYqdCz+CcVAc7Vdn5Sjft9BJOaDhuyKyFT9dQ1WObGgSlRl63UMpCXWxPLGoL+mfbpLE2h/fZPNxntB+mlb++KMFFiJgALQ3PzReqIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6506007)(508600001)(83380400001)(86362001)(2616005)(8676002)(71200400001)(4326008)(6512007)(36756003)(54906003)(122000001)(8936002)(110136005)(44832011)(26005)(316002)(6486002)(186003)(64756008)(66946007)(66446008)(2906002)(38100700002)(38070700005)(7416002)(76116006)(66556008)(66476007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?D21kNufp61XCtnRdS5v3bpa2K/rRJ8GYeeAt9ZiRmHi0E/TvvOvJiHdFIV?=
 =?iso-8859-1?Q?DOAD8+1s6BrlwJxWGQrZyeZ9DVmbu3/KSlHxbRpj5bJzm/HEZplwSQDukJ?=
 =?iso-8859-1?Q?nEW0wO2xWDXrukYZXb9JLvlThJx88pMhH6xcrw2Ha2V0r3J3n3Y3ZRTGVA?=
 =?iso-8859-1?Q?17mkb1HnmlZ4hl9MIeh7KfAGLaI/A53ReQYY4krzVYHiEtsVJpRKpRaaI+?=
 =?iso-8859-1?Q?9JNOs0jVLK9HcqzR7PAILOHI8O9UonjRI7OFpLJ5y5v5ICystLZEOl6aeL?=
 =?iso-8859-1?Q?HmFmydbT5RbOQgjfafrQRtmnpY63S5g1ZAdsVvE1e9agrcmaet/A2PgWzd?=
 =?iso-8859-1?Q?spwhn69YV79l+RXCIYFbw3HZie/sK0yTWw/tkX2RXv/r7HKTEomryFz0ja?=
 =?iso-8859-1?Q?nXQQFFFTl3CzlBEpYG7rynviUv9baSoY4m6JPkfK15hXbNI+lapToi8WVn?=
 =?iso-8859-1?Q?K3HabZAH6EAgrpsCpIx6cZ8+Mk8VJPP0rJVLPGt7WSqIOgODI3Imv6P4nZ?=
 =?iso-8859-1?Q?tMpzREe7wI3JhU27qYsY9gFS1ADfuI6TasteF5C8KTSui5NPKTJLCzSqVi?=
 =?iso-8859-1?Q?g6qKZxGKczquDPAsNk+WAmUhbm+nWi9uNKdVrfG+vYdnD6z202pM7PqzCv?=
 =?iso-8859-1?Q?iGosm6jG3akHhJTICO9VgRtu8RKnx6iDcoTbgPgViXVGalw+Mtf3VOCLqv?=
 =?iso-8859-1?Q?1XnJaPrzvWYAaO8BRd7+x6y31FjEJMVqquExuYmaG8DTMSBGUT6X5VIM7s?=
 =?iso-8859-1?Q?gmQLDPYwSLHev+urBqMs7lF3e2mLpEbEeFyUaWMyUIAQ6aFSxxBGPGF32M?=
 =?iso-8859-1?Q?C3OQar/hmqL01VnTUKKwsxlQ0BDtCBSHBDaLOtLRKI3OrYC7xwrEMOuXTW?=
 =?iso-8859-1?Q?PRHmAwJDYsELvzbcceTngVYht3PizHN/VdLi7Tne7Gok+f1rdnyiv0FR4q?=
 =?iso-8859-1?Q?kzTxo5Q0i12UsxcAOjW8VQKXqhQy9wmA459CbVW1Tm81MUJUkraoKALb5s?=
 =?iso-8859-1?Q?hrGqhILBzvJ3SsupKpHCS0OhWmpmX2MH/RrhO+0spZmj5I+EmYXKLVV3Li?=
 =?iso-8859-1?Q?vtxSAJ4LUAl8rvVmRWVsF9oGzhw0cmop0BqEtSuwFfqq696Icja1pawBtX?=
 =?iso-8859-1?Q?Q1t2OqX0DS7JXPe7j/ZOUgjNNj36HjmUB6cPsSmlnuky6rHVhUORngBs5y?=
 =?iso-8859-1?Q?9F7VO+ZzP+NwD8bunU/3VHwZjzxCeCpDHHOmHqxkLuFD2rX03Jtp+z9pFs?=
 =?iso-8859-1?Q?sFvNNHLWsC6MHzpVPWFnJZppoqsvILQxd11mY6+OEoUQaasbwomUT+znxm?=
 =?iso-8859-1?Q?wLxEGMqv5b0cHL/UBD7UT4xjRGmVg5ewOnFxKtUJhc4RiFUXBFIzJoldIx?=
 =?iso-8859-1?Q?tLivKrz6qEMTdNL+y8TszzLpklAOy7/AoCQx325GprIKp1eYGSuvXvWgqk?=
 =?iso-8859-1?Q?EjuapQljBnoxUbRpwB2cxOsVrtiHepbgtIrLlmecKCOdFS9cYZBxv6ku5Z?=
 =?iso-8859-1?Q?Z7xgqc7fyzyMRN5XIne5KiziKXT3a0uYej0LATZ0JQOhZlZDKY3xXTYvfo?=
 =?iso-8859-1?Q?7E4euaYwPRi9cOm3bDgiYMkw8rm2mT+Nj2MwJiEco78lLqoD61OiKEcklS?=
 =?iso-8859-1?Q?H/xrQlAdtU2jXrIJN8JIDVlx2CAzakNlTY7eh+bvGKl6qLKJrNUPtDSS5L?=
 =?iso-8859-1?Q?VbA8M2tuUf/Ulpbuiy8rf+Tc5t937X7lVP7/iGgYCClY4NCBDQ87LMO0Yr?=
 =?iso-8859-1?Q?w5YETe0u00ARvZRInQjPIe+8I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce2e6da-f140-4009-ddfd-08d9c3d7232b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:22.4473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q2zSNDDxPc47jDhItVLh3pnUrzuZbZFgB9d8iVzyaygQRzZ5ssAvVKGZjg2U/xA8bvm/n575DaqmykmjmwP/YEJF5y6r679RIlJmTRRlkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2161
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS, change
ftrace_caller() stack layout to match struct pt_regs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ftrace.h     | 39 +--------------------------
 arch/powerpc/kernel/trace/ftrace_32.S | 29 +++++++++++++++++---
 2 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index debe8c4f7062..b3f6184f77ea 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -10,44 +10,7 @@
=20
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
=20
-#ifdef __ASSEMBLY__
-
-/* Based off of objdump output from glibc */
-
-#define MCOUNT_SAVE_FRAME			\
-	stwu	r1,-48(r1);			\
-	stw	r3, 12(r1);			\
-	stw	r4, 16(r1);			\
-	stw	r5, 20(r1);			\
-	stw	r6, 24(r1);			\
-	mflr	r3;				\
-	lwz	r4, 52(r1);			\
-	mfcr	r5;				\
-	stw	r7, 28(r1);			\
-	stw	r8, 32(r1);			\
-	stw	r9, 36(r1);			\
-	stw	r10,40(r1);			\
-	stw	r3, 44(r1);			\
-	stw	r5, 8(r1)
-
-#define MCOUNT_RESTORE_FRAME			\
-	lwz	r6, 8(r1);			\
-	lwz	r0, 44(r1);			\
-	lwz	r3, 12(r1);			\
-	mtctr	r0;				\
-	lwz	r4, 16(r1);			\
-	mtcr	r6;				\
-	lwz	r5, 20(r1);			\
-	lwz	r6, 24(r1);			\
-	lwz	r0, 52(r1);			\
-	lwz	r7, 28(r1);			\
-	lwz	r8, 32(r1);			\
-	mtlr	r0;				\
-	lwz	r9, 36(r1);			\
-	lwz	r10,40(r1);			\
-	addi	r1, r1, 48
-
-#else /* !__ASSEMBLY__ */
+#ifndef __ASSEMBLY__
 extern void _mcount(void);
=20
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/tr=
ace/ftrace_32.S
index 95ffea2bdc29..c4055b41af5f 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -27,17 +27,38 @@ _GLOBAL(_mcount)
 EXPORT_SYMBOL(_mcount)
=20
 _GLOBAL(ftrace_caller)
-	MCOUNT_SAVE_FRAME
-	/* r3 ends up with link register */
+	stwu	r1, -INT_FRAME_SIZE(r1)
+
+	SAVE_GPRS(3, 10, r1)
+
+	addi	r8, r1, INT_FRAME_SIZE
+	stw	r8, GPR1(r1)
+
+	mflr	r3
+	stw	r3, _NIP(r1)
 	subi	r3, r3, MCOUNT_INSN_SIZE
+
+	stw	r0, _LINK(r1)
+	mr	r4, r0
+
 	lis	r5,function_trace_op@ha
 	lwz	r5,function_trace_op@l(r5)
-	li	r6, 0
+
+	addi	r6, r1, STACK_FRAME_OVERHEAD
 .globl ftrace_call
 ftrace_call:
 	bl	ftrace_stub
 	nop
-	MCOUNT_RESTORE_FRAME
+
+	lwz	r3, _NIP(r1)
+	mtctr	r3
+
+	REST_GPRS(3, 10, r1)
+
+	lwz	r0, _LINK(r1)
+	mtlr	r0
+
+	addi	r1, r1, INT_FRAME_SIZE
 ftrace_caller_common:
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 .globl ftrace_graph_call
--=20
2.33.1
