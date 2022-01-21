Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C694962D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:32:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgPzT5QkLz3df1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:32:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPy02Wc9z30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:30:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMBwN8hoX3KypkVrbef+L2CQLO0/SoO2Moa/z5UsuRGO96so09zCK+eLSZllz1ODMnDz7TzqQB3xc5+JPvZxX8QPmQfzqsYP8CTJmzqxS8ndTipVCn8+VDIvDp+uPyhJYktmF/X8SjKH3R6phcTivA6V/M141RYmxYsmKmEURrQIePxLO1tJyw8XP1yKwgE0JOmfvB3sBWzTJpFbJWUrnGKFb//gqSERaRRbsDN+DUVObWiq4vTJvMjxJjqHkqRRhNFvLDoljIfJt0/2LRdCYpjFuZsGxAu036Y1DKQqH57SsOTsnyF3gzABDXqgsivE/eDgmUGQ/DH9KgD0TaTLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqBVuTIqU1dVAeg6hBoCe/Re7DTyqbB/RfDQyeq4IY8=;
 b=XXjlJGjmaiCoXe8x3YASttCXga2bDMcpyWbEn/P94XpHHLXamhUzqZCmd1yuojIWrPlUTFMc50JJcdetW9jZhwUqRauLwvgy8HjOp5WdeGvR/gmsR1dHT3JT6FFzPxEgtAJK9TMB8D1lbWwiMkA6d3OXnkkWsFQnW+DYothKOtwgkW4zhqs1beFua1kI6T9Or46n9YKAk/R+YlFHOR6oUuoCddETan8xnRh7d2gPGANOnnP1uhNeqTi9Lqx6bSLZ4xlAWAeb75ebWLSXOUl78BriHqdpGgVdiy9GmWPWVYNEjQJKvrCZWw7F48tk5lBNN6RPVBizEARNpdqHLGikUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 16:30:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 16:30:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v4 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Topic: [PATCH v4 4/5] powerpc/vdso: Remove cvdso_call_time macro
Thread-Index: AQHYDuQ06ytioK3kYkGg6cu79gegnA==
Date: Fri, 21 Jan 2022 16:30:30 +0000
Message-ID: <837a260ad86fc1ce297a562c2117fd69be5f7b5c.1642782130.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdadc2ed-b81f-4fe2-f686-08d9dcfb5700
x-ms-traffictypediagnostic: PR0P264MB3436:EE_
x-microsoft-antispam-prvs: <PR0P264MB34361239F5673E8027262C8CED5B9@PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4/BiyQWQB5KJXQE98B6ryzDQmsKmhKbqfVZKNWZ2lYPz8O62A084enp4KLQI73zsCgUHasaWFSAhMRqlurZnyumfpbeUhNQzCvevK0NCAZEbOo1+2KD0s7+GfIenjWaUQ6CyY54rn5Yos1qnwrCMp6NTQqfOufhov+4dNUkqsHaW7nbKblu/uL9f9bT6xQXKLfn7xlao+22qztm53s5j245UbduBXtONJhfZgYJr9bidzbc9B54v6rHOZEJ9y3SGAit18Mb/7FrNW46uKfMyjVmbGI0xWCsznxgdibkAW6S1zWkUNE68rDYHEutGhSi/qq2z/TA8vBOwcX+FrQKdyltrupSeRP5M0NGJaPjQPPDlpHb53cbMMI2nPkqPXsssqLvZfiO1DLMmRa1ZSBqMLDRxBHt1R89JWGxU4RWpOVbDsYAdYRmQrhRqCOQ0UGm8KNfS6bvxV0OPPKhMNLlRMa58fgbdyWx0HBGldBVCPEtppdLBJB3zbJZifXyzeKtcIiOFQXIayzg3tsGuSeyOIpfbcnSkA8ZkEVmKRvRO9jLkySYbQpv2047FkIxc1u/dtIjcLgbap7EVnpytrEAFiR5Ogu+aOzcIru9XejSLk7JYuLaVLEYDZ6YCSzrZ5Vge8xgoqO1zchXIW4t8+/kdQzkJfErjYrnk5R+DjDaPRjXgsJ6FIc2xeHKmD4VqdVffScu7EKRMCsjrjVAUL3o+Dg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(36756003)(5660300002)(64756008)(38070700005)(6486002)(4326008)(66446008)(186003)(66476007)(66556008)(66946007)(91956017)(86362001)(6506007)(83380400001)(38100700002)(2906002)(54906003)(110136005)(122000001)(71200400001)(316002)(508600001)(6512007)(8676002)(8936002)(76116006)(26005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6EcOTad7SLmGtdTNInsP3hdNzF5CwQPJbix8HPwHG7EPiJ6uG2TydsGgM7?=
 =?iso-8859-1?Q?o/p6lrYh8l7P5mB25GThzapz3Jo8Fwh2XOv0wOFC6T3XbdUB02ROEie2+E?=
 =?iso-8859-1?Q?TLc1ub7REbvFoool27r7aJ+yCty1r2O5p6fVG+R8LOoo8b0E2wrjFu1jRm?=
 =?iso-8859-1?Q?j2KXXcVx8rCTZBsrFNtQvRhqg7FshKGVXQebtaxVxpd7W/RmmD9snj4DgY?=
 =?iso-8859-1?Q?qxVDL/jNKurDmxPelW58/vpIvu+PQ5fCfC+YHN+bBI5SUTcAI1DuLUp9C8?=
 =?iso-8859-1?Q?jJDu/nqCuUK8gucu78yu2jawCudegTdyGv7yu5lM/5/gpWTOo1t4jtP8IA?=
 =?iso-8859-1?Q?L5jI8Ky00VgcMfCMz9ru10OgN3p+Gs+N6q0GKB4OLcWbI/pqeXMoLvjZEX?=
 =?iso-8859-1?Q?23PlFVrc5qDo1ddK2Q0Mg2Zn91ziEVUP3/DSTw/HIH4Ksgt2KG1/71ot8b?=
 =?iso-8859-1?Q?7o4+VRCD1lMo7DCHnCbjvvGe+20G6OXLg+4hku1hUx+17ajTEf1Y757mgX?=
 =?iso-8859-1?Q?euPGqwYUCCyJ9WfJr6HCg29xngqfp7tGwJZ8i9DHSL3LHNbbnjpeTOFlS+?=
 =?iso-8859-1?Q?lnrqZgmap5oqxPCwPlE3b5hQJnSMMEup9wMg9HbJMacDpAQKSmB8THpbzU?=
 =?iso-8859-1?Q?TMVfINy2E/03en0DNb39EqRtzCajYs3W6VK5qc6pLbS21BHIM5rWhoJJO8?=
 =?iso-8859-1?Q?fxzcYBk7rD/iNplb4tjt94YH2Y/DAE9S/K5TG2bT4NCEz3qQCcC7+5QcjD?=
 =?iso-8859-1?Q?pSPjARqxHnb5ka/5GX/6Ea8k3rp3C4UBDSthvT5E3gqFAMVAFEaqxVQeLH?=
 =?iso-8859-1?Q?pMPcGSSxRzYK07ECK8LaEnS43drvYbz6XhvYE6XZ+EERT8zknpJCcT5cRS?=
 =?iso-8859-1?Q?vzLwHQ0bU8z29ZhpJhaDDpkgDqC49sRfslpR0pJicjHagSHLjqWdOXvV+P?=
 =?iso-8859-1?Q?UQajhbXUak9+KxvuI7mf1dqgl7VuagyWikKd4aQ/GwRcshetCSK1EVDsMS?=
 =?iso-8859-1?Q?dA+UIWMf/VPA7qexRK6+0wjIKo9qSK7Ljk1xiOJgaa9HNT/GGPNhsuxLGI?=
 =?iso-8859-1?Q?Eyp7oGB6QKvZYglH/uWf60N0ga58y20aFq8T/PFcP/gxVBIQzuNKZp2A5G?=
 =?iso-8859-1?Q?ZgQ5rI6449rUP0aUnbaF4HpA0Y7Q9zvkMqNKKpbtffn3z2VNqsRcnHdD6J?=
 =?iso-8859-1?Q?wkM8wt4N60vr0rq+QuolTXMMPBrOi8wzaSpJ883YlP/qYTwT/KumNZ1X63?=
 =?iso-8859-1?Q?wO4Yd02JPhya6VNGHmG2QNdTOJkIdlmhxXqxbwycPK87sOzKMV55Bd62by?=
 =?iso-8859-1?Q?1+WIdt0pyOjmqY+kSwIRmfY4edFNoF2oZ6dIEcfpR2p9Wp7aR1+eYOfPrf?=
 =?iso-8859-1?Q?3Ld7UAMatVcMdsrSGUPx/Vl4riWZ0uBB6WlbxzOMBhYrAb6xO1c0z6yZKj?=
 =?iso-8859-1?Q?bPVZQ9qFgGb74LMZf7/jJurSSGoThwtXcFq8vzNgv+sWYLaZf0TC4UVsyF?=
 =?iso-8859-1?Q?bmx82PqXep+TdtFz1muiq5i7E0p1Qplz3p1VeRrnuqtpJbkkOtw7Q3JuxD?=
 =?iso-8859-1?Q?SxEartthMAiV/UiSwJpFcw9HLIckS8SYg99mQmFJpn7AKZkwLCs55X7Ifm?=
 =?iso-8859-1?Q?uiSWSCvqttSRXeGhvCaP3B0zBPyXjpLQdZrYA14qRcQ+GUYZSsZONMSjcM?=
 =?iso-8859-1?Q?T8uNvMxL++Ms1mTD0saJHyBgEe0lEC2LuZLDs4l159oFZd6/qTivBuB3S0?=
 =?iso-8859-1?Q?wAUblUI1S1pYplmPhv2P4ahz8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bdadc2ed-b81f-4fe2-f686-08d9dcfb5700
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 16:30:30.3281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbRk++NBdnkXs6gKelGS0ezonQHIu1AwumNsx3Xagsp3qY63NZHJ2VodFVCOgsCu82AN5sn6pRg72NND6luGQzmvepCFlfPVS2iDLxs2JL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3436
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
 arch/powerpc/kernel/vdso/gettimeofday.S      |  2 +-
 2 files changed, 11 insertions(+), 28 deletions(-)

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
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/=
vdso/gettimeofday.S
index c875312274aa..397f290015bc 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -65,7 +65,7 @@ V_FUNCTION_END(__kernel_clock_getres)
  *
  */
 V_FUNCTION_BEGIN(__kernel_time)
-	cvdso_call_time __c_kernel_time
+	cvdso_call __c_kernel_time call_time=3D1
 V_FUNCTION_END(__kernel_time)
=20
 /* Routines for restoring integer registers, called by the compiler.  */
--=20
2.33.1
