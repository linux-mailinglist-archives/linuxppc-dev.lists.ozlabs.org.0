Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44247F893
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 20:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMWNk07mtz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 06:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMWLr6dBVz3c6Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 06:38:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDGd41Z67xNkkR6wWbZLtnzv0JBpsezQlpc9lqNaCHTLSLRFZuLtQmwdcMz3rsE4e6q9y+Jp+K1MqtrIkkqgauS/LTplGP5gM3AcyVf13e71HOSHGCuGRJgoiC9cshNb+59DtmKnu46SA9bvkC+g8A+6T3XmwKLaG3Cc0JOWz68zIIFLEzrCb7h/ZvV4tmrlcrmgplqhdUh+TTQgnh7KoxTc6y7gzC+p3KRS65+Pd+LzfulE88cH4//F5xSiMkT7vQJB6p4lK2m+RKaJ04Rr344F66UQOj+2hdjAIGd1g6y/amEDIiRlE9OgMcKlPiVr/uDAGZL/xbyR82aiHbsxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVXe5LLMcqVWltxsLBCTrRMiMwOgTpQ1qTr2eLOeoug=;
 b=erwC84FwZ9opTdgweNVJlQgaW+AxoxDYoMc4mXbIriYCV2eLMFKWDdadupgsZKemhuxebZtgaAaj6vE7t78B0iFUcVZmKDDsQBxEj+5g44VgMawgrxVmq56m4Z0vaVBKU+zOb1u3hTLnY9a9hINFNmdUSIb+FxW0plpDv8cQC4cs9CZLguH8N/5aEkBI4F7QhdOmDjng4Mp2DkmAhfh7zTSI+35A1elHuFGw167tufA/NkFUtHmIDRjYkTFaQqT2VzIySZyiX3eD3rHySS5A4Qs5CcvxS6ckS6CQELR4I5ml/oUNjB193q/i/Ywj4duXhwZZt/cBLfSCD2IMcBHU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Sun, 26 Dec
 2021 19:38:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 19:38:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v2 4/4] powerpc/vdso: Move cvdso_call macros into
 gettimeofday.S
Thread-Topic: [PATCH v2 4/4] powerpc/vdso: Move cvdso_call macros into
 gettimeofday.S
Thread-Index: AQHX+pAmvMp/VWjYgUWzCZwq4v8f5Q==
Date: Sun, 26 Dec 2021 19:38:25 +0000
Message-ID: <7fa01cf620cd0d1761642ff5646b72e346391925.1640542625.git.christophe.leroy@csgroup.eu>
References: <169b36a06ea63260a5047d4f44f7dbbf8442aabe.1640542625.git.christophe.leroy@csgroup.eu>
In-Reply-To: <169b36a06ea63260a5047d4f44f7dbbf8442aabe.1640542625.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9141f3ba-483c-400d-3ab2-08d9c8a748bf
x-ms-traffictypediagnostic: MR1P264MB2233:EE_
x-microsoft-antispam-prvs: <MR1P264MB2233E40848C4CCDD22C8CF36ED419@MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N/Xm/xQE/HXXktcqz6Qy6sym9y62+UCtKriKBujQBQtrbT+PQSWkwlkNtfS04tI4R0O195TIOCv2K8qu43HlTrklt0E5OtWbkMaaxH9gb/940MZ1/id1ejK9Ax54UMTDxRoQWcIeRBc6nnoR5pj6HTICrkU74p94QjXWP3XKZ6VdIwka0GBO2viFt6fftzKDZBhpw0keHCPYMgEGxxtNakU+0MUrVsBTgjYK07vQEjCBndbwmoEByHH8mYb7Eu38INuvUIEs4kDsTMY18zYTj1nZ5AcZyd42HDaB7wD+tJH6GK1xWuBz4aow/MTgflOmt8Q9xjJcB3t3b0VRVT2+pzXXPf7nXLnqZAVjd05Y7FrUNZ2mCPdgoRRq3wsp5dwCD36qJmMJWk5U7NMPlYBl7hK6GLwhnzQknJpnoS5p1xd03s78UqKN4ZwKyA6aL0mC/8oiXSqJqdHKyXDKZdqH5LBAO1tWFugRkgRN6BAFaHNUt3niIEPLB2Nb7AKriRcylpNrlSvqHgBrH0L/X9h1HIV0dI9dPY1MEOk1fthzjXI82vlelozTJPRchWrDF2T6IY6bMMlOKbWwvBQTffGxHinzQIbHx7DaVliHOWvPbqEX8tFBB+zCcYz4EPLZDTPO/ZBg1/CxwAiuvEmNKGxJ9xmsE4cPCojjcQ7vkszuq5/ROZiDhjK03eVmK4rEF9Wk8XP/Av8T3mfQrKxkfqkcLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(6506007)(4326008)(91956017)(6512007)(44832011)(2616005)(26005)(54906003)(5660300002)(186003)(38100700002)(66476007)(66946007)(36756003)(83380400001)(71200400001)(66446008)(64756008)(86362001)(110136005)(122000001)(66556008)(38070700005)(6486002)(8676002)(316002)(508600001)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7pC/va3iI67jDlayD6Ptry0t5nZfBtjKf50uA71jktyTLU82zwYrmdzm/b?=
 =?iso-8859-1?Q?zVxlXfgOPhXhWNb7tjjFKlkux1dhgSXHMjm27edDNjTDdIQrYw+ydAk6kB?=
 =?iso-8859-1?Q?a6qacdohmsYL/gZFKn5l1F9GeljwZuVUfyuZV0g2XJarW6znU3qWCfKljm?=
 =?iso-8859-1?Q?ZACrvhnu+HCxkGnnC6N2dRN0QbNwj9+axA5VL90vaub+BGsw31L9mwPske?=
 =?iso-8859-1?Q?KwDNMQcb7GrcQ6sFyPE/2XfPnJF73P4bCx1HRYq0IgQFmLiX1mRZx3d8C8?=
 =?iso-8859-1?Q?kzAXDXAcc4matyk5TnvOG75P+O//nWU94N3RdEMMmurgUJCV1jWeCsXpi/?=
 =?iso-8859-1?Q?GkOmBEaN8bognPheD2ZPwnhuGuMN7gPdnclzT6Cc1Kt1BRwFrSXnqU+VL5?=
 =?iso-8859-1?Q?VBNRtkEG8JX5OQXI8Foz/MTq1dPkqlLaYMP/Tx+jBLfm40YPbNZ5ePOS/F?=
 =?iso-8859-1?Q?fMDw1003ZswNgqW6PZ6Qt6HdWYIVzc0ErmY7gpF65plVXfYCtBP158HS7H?=
 =?iso-8859-1?Q?KxHSBixBswjuEKL16ac8yCVqUmZ4CVwINsGxIMXz2ID4EpdP3/N6cql4Sc?=
 =?iso-8859-1?Q?m2kZJWQ7/PYhLFKDZ2FWVXmwDlLCw7rrzO6SUmXzC+kbK3kqzPuGorujiu?=
 =?iso-8859-1?Q?/k1ew2LLVbrdWchJjBA7OgLv1gjdYCtmI+7rPAWA1n6JLnr5zrYZtmLvR8?=
 =?iso-8859-1?Q?r9sgkhY+hjFN7N+xhb2bE33ObQOzyHTLbtHflEoHaR1nkhrU14C67G2G0T?=
 =?iso-8859-1?Q?mAs5HWMYbCti36debAr5HB7Zg0XBuNvIt8T8HR/3mLZ2DPWiu13ITxt4BL?=
 =?iso-8859-1?Q?o3d4POn+RFaD9KesPUFYkUCBYYx4Rp3cb6mHm2PSosmwcGErqXjHI2n9On?=
 =?iso-8859-1?Q?mWCkvXHMxCFaRgxPvzPu0B7w0g1+QhKlO4q+8cldtNDsFjKORpJe3J++/z?=
 =?iso-8859-1?Q?DYXMr4JLGJ9czYXZWC1V4vq9agL0P94oZw1A28MwasbWtPKGAMpHME6Bwz?=
 =?iso-8859-1?Q?xUgas5l12oyWSyfrxS1JmTttJCo+S9AFJqAwSDMLCiSXJ1YkT9v1La5qyt?=
 =?iso-8859-1?Q?l1TPBk4K9cKrbm8op+Vcmg8XWsajmK/kWreMFIHt43LR6BqkhId1+Zobg+?=
 =?iso-8859-1?Q?C2vGDcwlAMXMkQSuFdxE6XT1FuRRy0UvZWsAqTplknxCyNpWcAhsLNmBtd?=
 =?iso-8859-1?Q?x7/US6cuIdA6BwfgYYm2m0DlfrsTO94+m5yMu3rpW/xIhm0vCPW73HWixM?=
 =?iso-8859-1?Q?H2jsysBWvesYnzlVzEj+Kfl/GNLqEadC0h7D6InHBgk8OaTe3cUb86Sh/3?=
 =?iso-8859-1?Q?xQGvz5Zmcb+lhpeeyetxs09OnKTMbfy/ehvCXpDY/3stSrzqZsCYM2iY3l?=
 =?iso-8859-1?Q?SBykHiwZw31eg8TZQWe3+gOb6rWznUID4MbdDT80vbPAILHaMxeIyKlIXJ?=
 =?iso-8859-1?Q?PGnJZWJrhyBPw7Le8y1FDh8/oDnocQCyk1dXvS8KyUFM3etuBCz7wHTsGf?=
 =?iso-8859-1?Q?o7rjYoCEvhGq8S/gC+o90VBaqSB92yJM/2d80e2W62pRaXJhIHuonRgmsj?=
 =?iso-8859-1?Q?Con53ot5A8VICL6SyIONXkXx/kxb8CPDWne6h9UAWHndnMLygZh8CxD0hc?=
 =?iso-8859-1?Q?lsSa3y1LZkuZ0r+NZM19rjakC3cf218kstF52jbH+7V+jrbTE26k8yvghh?=
 =?iso-8859-1?Q?m6r2yDU/NzBuFUWEBGe+miAUP0K7Q7IJEU+dXmJcXY8VIhvRBUxdkQYtGc?=
 =?iso-8859-1?Q?2lWGTHqAxgZZMUHSWruSEPIpA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9141f3ba-483c-400d-3ab2-08d9c8a748bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 19:38:25.4752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHp/sJNEG7eyD66RafaTVc5LSmL5mOH3eC/WRvflGcmWipx8w7CAsJyjCTaj+JWZ8Kb5n45D8ZI2XQlNF/WUHMQsdjig2Pkcyum+sBFry0U=
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

Now that gettimeofday.S is unique, move cvdso_call and
cvdso_call_time macros into that file which is the only user.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 69 +-------------------
 arch/powerpc/kernel/vdso/gettimeofday.S      | 61 ++++++++++++++++-
 2 files changed, 62 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/in=
clude/asm/vdso/gettimeofday.h
index 1faff0be1111..f0a4cf01e85c 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -2,74 +2,9 @@
 #ifndef _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
 #define _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
=20
-#include <asm/page.h>
-
-#ifdef __ASSEMBLY__
-
-#include <asm/ppc_asm.h>
-
-/*
- * The macros sets two stack frames, one for the caller and one for the ca=
llee
- * because there are no requirement for the caller to set a stack frame wh=
en
- * calling VDSO so it may have omitted to set one, especially on PPC64
- */
-
-.macro cvdso_call funct
-  .cfi_startproc
-	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
-	mflr		r0
-  .cfi_register lr, r0
-	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
-	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-#ifdef __powerpc64__
-	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
-#endif
-	get_datapage	r5
-	addi		r5, r5, VDSO_DATA_OFFSET
-	bl		DOTSYM(\funct)
-	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-#ifdef __powerpc64__
-	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
-#endif
-	cmpwi		r3, 0
-	mtlr		r0
-  .cfi_restore lr
-	addi		r1, r1, 2 * PPC_MIN_STKFRM
-	crclr		so
-	beqlr+
-	crset		so
-	neg		r3, r3
-	blr
-  .cfi_endproc
-.endm
-
-.macro cvdso_call_time funct
-  .cfi_startproc
-	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
-	mflr		r0
-  .cfi_register lr, r0
-	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
-	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-#ifdef __powerpc64__
-	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
-#endif
-	get_datapage	r4
-	addi		r4, r4, VDSO_DATA_OFFSET
-	bl		DOTSYM(\funct)
-	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-#ifdef __powerpc64__
-	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
-#endif
-	crclr		so
-	mtlr		r0
-  .cfi_restore lr
-	addi		r1, r1, 2 * PPC_MIN_STKFRM
-	blr
-  .cfi_endproc
-.endm
-
-#else
+#ifndef __ASSEMBLY__
=20
+#include <asm/page.h>
 #include <asm/vdso/timebase.h>
 #include <asm/barrier.h>
 #include <asm/unistd.h>
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/=
vdso/gettimeofday.S
index c875312274aa..bebebd756c3c 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -12,7 +12,66 @@
 #include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
-#include <asm/vdso/gettimeofday.h>
+
+/*
+ * The macros sets two stack frames, one for the caller and one for the ca=
llee
+ * because there are no requirement for the caller to set a stack frame wh=
en
+ * calling VDSO so it may have omitted to set one, especially on PPC64
+ */
+
+.macro cvdso_call funct
+  .cfi_startproc
+	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+	mflr		r0
+  .cfi_register lr, r0
+	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
+	get_datapage	r5
+	addi		r5, r5, VDSO_DATA_OFFSET
+	bl		DOTSYM(\funct)
+	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
+	cmpwi		r3, 0
+	mtlr		r0
+  .cfi_restore lr
+	addi		r1, r1, 2 * PPC_MIN_STKFRM
+	crclr		so
+	beqlr+
+	crset		so
+	neg		r3, r3
+	blr
+  .cfi_endproc
+.endm
+
+.macro cvdso_call_time funct
+  .cfi_startproc
+	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+	mflr		r0
+  .cfi_register lr, r0
+	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
+	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
+	get_datapage	r4
+	addi		r4, r4, VDSO_DATA_OFFSET
+	bl		DOTSYM(\funct)
+	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
+	crclr		so
+	mtlr		r0
+  .cfi_restore lr
+	addi		r1, r1, 2 * PPC_MIN_STKFRM
+	blr
+  .cfi_endproc
+.endm
=20
 	.text
 /*
--=20
2.33.1
