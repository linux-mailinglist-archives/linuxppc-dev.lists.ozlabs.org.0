Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D353A495D41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 11:07:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgFS05dnqz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgFPm3YQ0z3bZT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 21:05:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi03/HPwfnfwOVjD9HwaqA17TGD8l9PWymDmE1OPe/BWsVHYpR/NMUGivc4MMoRqWuefTv8VtUmdkXYtIR2YUgS65VL70Ud/6DY2HZ7o9jmndowRl52QC5XUnNgIvtrrztRhrUgA7zH4CwvXSPHPiJeeK4L5i8XLC5VECUNrfAY9YqGs370wU6q8PTGYW4+e7YHN0p9kXIPd2CSAOSJOsbS+UN+jdcZclkSSuZ/iH/pa0eWR4pkP2Ex2/2Inp3qSvqfiYxwfYq+aSBieichRsZKUcZCr7H6VXao8bWNufuOLc5pqneHwTwXo2SQVYKJ/ZlI7++jntVKjm2Z3lv/pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgy8K6cUGmbQ/LGbmdcqnBIHx9XzyhftzBICVBagaks=;
 b=SNYK4ulqyGLRxNNucO/NTLYzCAYAALDELdJlWp5/G6jb8v2bONNcM9kYWTZBAgC+fkCJS8ISq5v1/MqteMLnvBZ8Y4DLmmLR58C/RRN/db+jA7Hp2MwZbpzx7cS+U6BACA8GOlHVcmDYXRHjXSDsv5erI01JlfjS5PhKWTRKGgsnYb7VjocgUnF6lYis7FQBQMs6GLkXxh7G1Fhp2Kcwz2oB8iSwipXuLy8c6bfeqLsnBfhJo6nY6+mCp34ZsFnUDPtx+aRHNljsLnCuSbwVpyrskQfGQvoJKaa7sKGDSFIBqIMKf9oxjtfs6I8WsFpvwxP2CNAolHvH5/ztWIP2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3697.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:29::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 10:05:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 10:05:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v3 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Topic: [PATCH v3 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Index: AQHYDq5q4X/zFzDPC0qXcH9f2UXjTQ==
Date: Fri, 21 Jan 2022 10:05:28 +0000
Message-ID: <2ddc46d3a6d2996c56547039709e171b0ed2ec46.1642759506.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08521498-f358-46d0-9287-08d9dcc58d0e
x-ms-traffictypediagnostic: MR1P264MB3697:EE_
x-microsoft-antispam-prvs: <MR1P264MB36977A98847A744AB9B68E41ED5B9@MR1P264MB3697.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOxdRHrs3EgTw2UVWosi2KBrh3O8dQLet81oXLnOYWWcvNZ1/aiVj0zL2w2Z53X/JbeSZJ6fN3KqLO92vaFnQG+7GMlARKe84armuBt+TBvVdml9JqS4MGbu25I9ipsXdnTp4ZpOZzI2Br8SopeAabUvrNuBVA6yo0bvxqcouNBAt37YM7t4GaB6X8LpK7vow6fZVM0UYR0iExLyxOhoojxK9yUY+TyepuzqVIcbHQZKAPVvdAVo5REB0NdSfPQkpzgXZKc8qSbVH2lC/M2xjqGUkCdF4jvtrA7xtWbH0yZuLa4lTDVLfL5+wTwIDiRJ6qTC3Q9N2xZ02tqwiq2CSJYPSpRkSAKnvUWES8hWlRf9jLe6a3VsoVwOW5nCYMvf7Z1Ih63j/IyxXPU0wzzWzFMr18HNcpR5ey8hQNu53Wxex0zAPNHMayUVGreuCTxbbW9b+VFe3wWEb9IA0wdUzZ+f2vCRrKzBCSEgZIC/U2gE0KxQ0XXqaUsooo/8TxnjkJxEoigm11Kh4s/EeTkkayMs17ESZe735/jtAocIqG0lg7eUp89oxy3N6ZpRcnKU/6QzBoCS/QpLHkNhz0b3qfkngFL7Y3ByrXeHDUoF5dwvA9hQpCmmWYrwSbLis6Ip5uIMxK6bNGZPN2Wj9AB9HGo85dNYZAbF2EPf5IKwid/4b8U+8h3mSaOFbKBi5h9l1NIY7nzhsRJp1iJb4pONUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(6486002)(86362001)(110136005)(2616005)(6512007)(66476007)(36756003)(508600001)(44832011)(2906002)(71200400001)(122000001)(5660300002)(8936002)(6506007)(83380400001)(26005)(4326008)(38100700002)(186003)(8676002)(91956017)(38070700005)(76116006)(66946007)(64756008)(66556008)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BKr6b8IkcWs6yNlmngBsCqRnzM82OgzDK13FCxb/sRRS21Tgl7VRx4+OAy?=
 =?iso-8859-1?Q?ibX8/9GGdtFijwqvkPQCnpD38cWgfqtSoHy4jsfzVPTO68Mx1l1zhEQ0l4?=
 =?iso-8859-1?Q?bqPJeuCk88sDP7X+AAWnBerCLHLQ9QzkM2AI8w1PX7vnfZZM/k8s9LxjRu?=
 =?iso-8859-1?Q?06kRPeVJXobheNTChIzYsuGsIUGdDd0nLUu741mZ+q42gp9gLymV+SrpTV?=
 =?iso-8859-1?Q?v9av12G6n/RE1wDbJtItZ644EO0EexsBsPQpPQYYFp60iPIuzRJW7fnXIa?=
 =?iso-8859-1?Q?aRFuaCHp870iO+6jBpiXvVIsnq05BEuondME+k8WCfpQsgpOP4Ze9QAEnj?=
 =?iso-8859-1?Q?rhrQO+4wGg698DYYJVFBCTbIweLKzhbQryfbnzP259W5WpZ1Q3m8rUQm3e?=
 =?iso-8859-1?Q?o0QnEBHfApdC8UrZjGcSP8QKh1Zn/8PXlcYagRTlKVyD2VAdY06gyOdYH8?=
 =?iso-8859-1?Q?LOx8Lijhyds/Sczfd5L/BR0efe1bGSoJNC2z9RlCy0goR9C8X03AZ26Ezp?=
 =?iso-8859-1?Q?BzP+OLrPyMKis7ijWQ6iLymmzAvHp92eIpi2Aq2YAiWP5xcb3UhG8nuaaq?=
 =?iso-8859-1?Q?Oxfct5QeS3sviY34NQT6llmz9kNJ58gPQwj3+9PIc8YnFZ9PR1JJKUNw+s?=
 =?iso-8859-1?Q?DkYG9dASvewj0hSh8+TmbSOu21EPhFGkO8ML8KovjzvVGwcsjSLUiFdncN?=
 =?iso-8859-1?Q?OIt2p3VOxEexaFEI2nDNYBKuB8vVQ5iViNnncAHbasI3LPblaRP9AmZdGi?=
 =?iso-8859-1?Q?Q/uuyL8q5ps1xCgioS3LRF90cgCO7aeMoprlWvnH8ZZWB/PT9sLdsqWlhl?=
 =?iso-8859-1?Q?V5bbz7NEXmlL11BOMFNqo+UeHfF2DRTSTqf/YvU6MB7k5iOGn+gxnTEpQj?=
 =?iso-8859-1?Q?6rZIFpEJW5s2IKsVIY4k1gFG1TxaCO6k+UdinuzMSmUZXqy73n33Eeag6O?=
 =?iso-8859-1?Q?JfpKw0XoOK0Ly+rVslmcitpw6WMDPhB1FHxOoFvMdl/rBIacnbZhdxaeSl?=
 =?iso-8859-1?Q?6tSy9urTR1VgvZW2mvgShyLas/7pj6gNKUd7ZGA6tZVqzVHgnp1iB33tN8?=
 =?iso-8859-1?Q?EPHMUy4vHMcQxycrh153CZQzIO0aSP8Py0HoXh50k1dhm8VluElbb9VdFU?=
 =?iso-8859-1?Q?ucW2ZSr4qJvaFI7AE/RaxWmjb5FccUMV7xxxPGJJl9BWpjkGD6KXhRkK6o?=
 =?iso-8859-1?Q?CvkmOVPJ+ZB0HJ/UC29m2iRrya051NCEFO7r8CZywN4Et3ZutpZgROwyfR?=
 =?iso-8859-1?Q?JKta2SVZqxMgAJEYNiqTycULsAnv8yFhCPb5o3aUy5iv7uVuGuYjeHfsPI?=
 =?iso-8859-1?Q?qvlB9fHPVs+BMH/lgK8V5YaTHhwMqK/+6y/1xonzS451LD05VFktEx5wsz?=
 =?iso-8859-1?Q?zZPstkNt75SeiPyw9EsmmL/nqbHz7SkiEEEbOz00z/QY6GMaWcIzdjq8gy?=
 =?iso-8859-1?Q?U2JPzsuaWTInc7kg99v9X8vWTJ90OyzTZocXiCQvcKuBTg0jLNdHIK2Dp1?=
 =?iso-8859-1?Q?PEFgA+pU8i6fPeqMcle3W72RXksjGuq/PdPnqXG5Z5YSkFA4bZzdL6omn7?=
 =?iso-8859-1?Q?sV4U/ZD6t2W0XRqW1t6MDZ/oBL4/iOMYk4oTs8g/C5gpgt1356eGYuB2Ed?=
 =?iso-8859-1?Q?h+stFTiWPONqNwXJawJGfyojE2gIX8ULR6/SKN2E+AAhy8Kdiz4seS+zGm?=
 =?iso-8859-1?Q?YmBIaNfk1cCzaVGIt7I0wAOX/vYDLl+usrdv8YmXaKYEFVBgnqWBJmjLJ3?=
 =?iso-8859-1?Q?tJ2bCvJyg0ub7s5hFKKMTlBu4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08521498-f358-46d0-9287-08d9dcc58d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 10:05:28.2377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEd2L7fQXRAwfXcTcMPQKAA4JWVT0pXXngQ5vYNtiTFDpDXwLKyLqx117MpBxf+veX1tNLL19ZDhNfC5MtjJ4PFHa8Xl9cNO/TrISQYRouU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3697
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

cvdso_call_time macro is very similar to cvdso_call macro.

Add a call_time argument to cvdso_call which is 0 by default
and set to 1 when using cvdso_call to call __c_kernel_time().

Return returned value as is with CR[SO] cleared when it is used
for time().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 37 ++++++--------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/in=
clude/asm/vdso/gettimeofday.h
index 1faff0be1111..df00e91c9a90 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -9,12 +9,12 @@
 #include <asm/ppc_asm.h>
=20
 /*
- * The macros sets two stack frames, one for the caller and one for the ca=
llee
+ * The macro sets two stack frames, one for the caller and one for the cal=
lee
  * because there are no requirement for the caller to set a stack frame wh=
en
  * calling VDSO so it may have omitted to set one, especially on PPC64
  */
=20
-.macro cvdso_call funct
+.macro cvdso_call funct call_time=3D0
   .cfi_startproc
 	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
 	mflr		r0
@@ -25,45 +25,28 @@
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
 #endif
 	get_datapage	r5
+	.ifeq	\call_time
 	addi		r5, r5, VDSO_DATA_OFFSET
+	.else
+	addi		r4, r5, VDSO_DATA_OFFSET
+	.endif
 	bl		DOTSYM(\funct)
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
 	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
 #endif
+	.ifeq	\call_time
 	cmpwi		r3, 0
+	.endif
 	mtlr		r0
   .cfi_restore lr
 	addi		r1, r1, 2 * PPC_MIN_STKFRM
 	crclr		so
+	.ifeq	\call_time
 	beqlr+
 	crset		so
 	neg		r3, r3
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
+	.endif
 	blr
   .cfi_endproc
 .endm
--=20
2.33.1
