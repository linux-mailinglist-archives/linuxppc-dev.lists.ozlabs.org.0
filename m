Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAF4962D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgQ0W3p4zz3drT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:32:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPy06FXDz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:30:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbN0FgcCVXh7nVJIniGF/Xdke7yA7ax11B+sbAmEFIxKI85C+2a21m4cNWLOf3L0YMHRZRf2YNwgyzn1hJyoo2LJD0odFviFUj8d/uS7RmeVjFiKrk2/mK6+EkzZJ5+aIeLitvt503z2nCjFRu1VnWr0CHeXk5P9qi2O5T2fRtEbCAr9KxDhx0i3guGa5tX9SqgwlrPsU4myuYAeZ0gMWtsCnx2lsXFt8zAa9QGvk4Kgh7bqbpmyO6emnVEmzteVdsG3mon7LqLBjHmEBoNausj2lxjqsMpPGaNlVbR91ixrrSByau2TK6IYCXg3IkXfR3Q0jtpQGsjphnUb6kbBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67c49INXCxQa5RTPAo1HMh15Mf/WhhsRgr4XzfcxKBs=;
 b=nqjwkdBP2Byrw+rm44JpMEky0R9h3C8SDXfIvCQn7+cBmSnLJ5u2p4ag/Sy4rfHBvjCsqBf5Me9G8qq4eQ3oCSRuj86Kg6s2q9O03Qp3zbmM9bvwllyLStOeCFhXnXLdwZ1an/We/ENKAYndnTocxXKQ367+xS0UhF3HIbelVyjuX+oiS8G5R66goAfNcGSwV4U59/3DyY/ajLh6wWIvtClxOiV5YDZCfq8G4OimfxUZhYmYtfmH0xWaQYSv7ODTMVeH9qwyxTPozuBVKcRGukyHBUYsL8v2CHpbDl8vCih8c9no3DNpFHfWKXNLXiCzuBUiLDuEPoHeXLjtTTEfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 16:30:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 16:30:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v4 5/5] powerpc/vdso: Move cvdso_call macro into gettimeofday.S
Thread-Topic: [PATCH v4 5/5] powerpc/vdso: Move cvdso_call macro into
 gettimeofday.S
Thread-Index: AQHYDuQ30VAgV6brFk6OKmb40I797Q==
Date: Fri, 21 Jan 2022 16:30:34 +0000
Message-ID: <72720359d4c58e3a3b96dd74952741225faac3de.1642782130.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c612825-ed1d-4edd-1a81-08d9dcfb59c3
x-ms-traffictypediagnostic: PR0P264MB3436:EE_
x-microsoft-antispam-prvs: <PR0P264MB3436E593975061236E8C848EED5B9@PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v4JZ87a1gh4FG7SGneYMxwpfSmSWH3kFFpDKijaf+CIKAvsQc5N15U5yMXpBGALyywuMhFYu1vZBYH96uHG8StxVGaOhagA0YVnhCW29HNWAB2ac8FmyATer5A2EDE2o4mN+QPxydzxmrtxoRLVYrn89Juo0otUYOOfarBm4hKUvNdSCSl7dqR/It1oEC0AaozoRT+fJuK2QXjcoXqjmMbBUi4Mq25gFsvuFfgGES6VUue0eIfUxuplKJUVukVTT0zQ675VE+nAtOQ10pQDjILcuMs71/NV2bqnI0/EjIJlIqM+MJpDPNyH/S65zoMdaPlNPh9ErBI91ARV8Y8HT/73Ql6AVxVsSb7L/BiBngYFO1iDONVkWmZl450mMftuCzVeLn7ypQVxGkLkqdbhqYbO5oUv8zuJRUAeqWXLdrdWQNyntpfBGGYHW//LmDd0+l8dGPGsyp869CDduoJP+LsinR3xsCkXZl50KSpYFg2k90udBY+qcp+QP37aaBqyCM65GDyQMUwp6sZo7TBM6XI+Q5HIAUGanQwq2m1cxBFOOT2/aXo2SlMpzWQBWppXGg7Nq//b7ZB05FCNYjlPMQjeXfgrfnafSYr67XvoPJDiLWirV8ylM2QqIFtH2qaTSkQufRc8cholNJy4TIPU6p7fQwjUpb7SmtWnNagz8beJ/vkUcmFkcxMHVPC13WLBJm6JX7+95tMDlHwuC5tMbTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(36756003)(5660300002)(64756008)(38070700005)(6486002)(4326008)(66446008)(186003)(66476007)(66556008)(66946007)(91956017)(86362001)(6506007)(83380400001)(38100700002)(2906002)(54906003)(110136005)(122000001)(71200400001)(316002)(508600001)(6512007)(8676002)(8936002)(76116006)(26005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PG8R03t4iiizvErPoUH9eRWRmGFe91uHklE2GHz06Huqvy2y+kmSC+m0UY?=
 =?iso-8859-1?Q?0GYYFBZC6t4/CbAHl5RUimDu+JEa7ZOTC2gFB5WuCZuaWT+kFkhK0q9pwJ?=
 =?iso-8859-1?Q?Ux7dWmNRxtSaLputB+PcfBnm7Lz6ygL7JQ0Bow8tRLNE/TNOZL9j3rcWSp?=
 =?iso-8859-1?Q?rMhbQ9TjNXy06Z/AYtBx+YsMohipAwQiXZdoy0VQVtXmBQ4AKAxSoJhgZ/?=
 =?iso-8859-1?Q?p4ge5jqsfR+n7qpQhnOMiv3nb86SvUDNTyJEnyMAO0eR+gywP2p11IAZX/?=
 =?iso-8859-1?Q?9csUGg7qqpCMi4jrTsKffwpRq5ms6I5WsmaDrTK3wl4GNqdmFtn5S1eU1e?=
 =?iso-8859-1?Q?z7LXTgys4sKI2vhAsMUvKrErcKpGdjqjiegvg8Yq8U9ivrtJc2hrMWwLcS?=
 =?iso-8859-1?Q?ED8OT2TPt0uuW8UH70k8/Bn4AZ2xmJw61KoO8+bUFqQ2mm1slCwirINbhQ?=
 =?iso-8859-1?Q?CuG1fB/1Fbq3eYz+Bbpe0AG3gQmi7hBX/ysbC3gsGpJfPwb7HkTo1rmnKr?=
 =?iso-8859-1?Q?pbgBEeryvJOn+UqzQOVO9wbTBvipNoIJA8+ky8iVTe/LH+7ABSjGDWuBy9?=
 =?iso-8859-1?Q?ygHuty6Y13S/BWvnqPL+FxgNUPJ9wyeDZAmasEihjqSomlHVjjCaA62Ptm?=
 =?iso-8859-1?Q?d1iNHyzk80txY46tbwlGdi4n/xtVDnaLFFrcQktcUly/CCzkltDNi8ufdP?=
 =?iso-8859-1?Q?5leQCt4+Li/3tl9KKmwTI43XX+09wMHLbysqcDGCzMAzBoqOD11mNNxhzD?=
 =?iso-8859-1?Q?8jWy6gMh8H5WZeipCja4c50yAQtuWiTgpZLBR1pVjpcuUIH6PrtXl/gaFK?=
 =?iso-8859-1?Q?nD91tj5qHHWWSSaJqEXdWt+T6mwMrfn6opRj7tgO5HoTmnEopXwrViQBJg?=
 =?iso-8859-1?Q?ENYnmlglsUxDT+TVHUK1o5HehX5pnnlq1oXnRGVK/gNfYI76jO1zh3KA7L?=
 =?iso-8859-1?Q?rC5hqpeisGER/zUAGTZWZGFczImX+x2o+pjOKaTeYQggzsyoG7jzcW5UFm?=
 =?iso-8859-1?Q?hZlD4tqkP8xgNVeHF9nhSLPY8MLmaPtmm1pJaWGE5blg+yBSTad8qq/F0r?=
 =?iso-8859-1?Q?j2U3gq5rqxrN0lXW/z3rtQ/G+8eWYBFszusgAx3lHr/M51e22elmdgxD9i?=
 =?iso-8859-1?Q?rDGtuF5d5vgaVq7HviIgku0tJg6x4qcFQv6zvECKaf7CeE10bVhI8oHOKf?=
 =?iso-8859-1?Q?cJWlD0il5tuspRScW0sXBuKlQ+YNZgalt1J0IYNpZXGaMJ5Lwhz2ohkajX?=
 =?iso-8859-1?Q?pkhRnG3zQidExeYk6788dKoBvJvEXpzxgNDaeJsFiq/8a2a2zhhBYabJUg?=
 =?iso-8859-1?Q?jm+5W50PWR7HdV8kxKyJJSVj8WCXDGXdRcxr1Ekx2sqiywCqVPQTqUcAn1?=
 =?iso-8859-1?Q?dPWt56BCNQuIW5JeBYIqIHfJO6xw5NKkM8q/RPOxAzjJdjohCy6TCOczhg?=
 =?iso-8859-1?Q?Hb4IZ14FFTlHpXSNT3eyquS6/RQIeeRCV1vz6+o+brQPLMyTScjiwtpwUR?=
 =?iso-8859-1?Q?BHUySU5eZUglNpmVclZ4aaua8/NDDhk/avIcLLJp72uqyYE03/oKERLWDy?=
 =?iso-8859-1?Q?AC3vYQRVhEO8u4mt6QwH3jXGL9+9JkuIwrWaKBsRvEXbIFoiEe/NfOYdg9?=
 =?iso-8859-1?Q?+A+eB3QYfi1stRwhHfHeOt/yJrN29T2pOwT8tkZEKYTH/CNIiynnjAMSI1?=
 =?iso-8859-1?Q?f8rhWuifecCHFuLbtb113kCYQaHRHL29p/VjKvGP39OCyezbqbUNjiJ3rf?=
 =?iso-8859-1?Q?W0TYqF53GuAUuDe/mZSEbPNus=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c612825-ed1d-4edd-1a81-08d9dcfb59c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 16:30:34.9715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bkk4TSf5fic2/0gtBI64AxNMxj3BXIFjV3BhIFAZr7GmP8hLGCZKytf0eMxWIre2QpoIt5frVk1sQ3NB84fel+uqVLhmsUL8uGLSBntnnFQ=
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

Now that gettimeofday.S is unique, move cvdso_call macro
into that file which is the only user.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 52 +-------------------
 arch/powerpc/kernel/vdso/gettimeofday.S      | 44 ++++++++++++++++-
 2 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/in=
clude/asm/vdso/gettimeofday.h
index df00e91c9a90..f0a4cf01e85c 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -2,57 +2,9 @@
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
- * The macro sets two stack frames, one for the caller and one for the cal=
lee
- * because there are no requirement for the caller to set a stack frame wh=
en
- * calling VDSO so it may have omitted to set one, especially on PPC64
- */
-
-.macro cvdso_call funct call_time=3D0
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
-	.ifeq	\call_time
-	addi		r5, r5, VDSO_DATA_OFFSET
-	.else
-	addi		r4, r5, VDSO_DATA_OFFSET
-	.endif
-	bl		DOTSYM(\funct)
-	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-#ifdef __powerpc64__
-	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
-#endif
-	.ifeq	\call_time
-	cmpwi		r3, 0
-	.endif
-	mtlr		r0
-  .cfi_restore lr
-	addi		r1, r1, 2 * PPC_MIN_STKFRM
-	crclr		so
-	.ifeq	\call_time
-	beqlr+
-	crset		so
-	neg		r3, r3
-	.endif
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
index 397f290015bc..eb9c81e1c218 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -12,7 +12,49 @@
 #include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
-#include <asm/vdso/gettimeofday.h>
+
+/*
+ * The macro sets two stack frames, one for the caller and one for the cal=
lee
+ * because there are no requirement for the caller to set a stack frame wh=
en
+ * calling VDSO so it may have omitted to set one, especially on PPC64
+ */
+
+.macro cvdso_call funct call_time=3D0
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
+	.ifeq	\call_time
+	addi		r5, r5, VDSO_DATA_OFFSET
+	.else
+	addi		r4, r5, VDSO_DATA_OFFSET
+	.endif
+	bl		DOTSYM(\funct)
+	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
+	.ifeq	\call_time
+	cmpwi		r3, 0
+	.endif
+	mtlr		r0
+  .cfi_restore lr
+	addi		r1, r1, 2 * PPC_MIN_STKFRM
+	crclr		so
+	.ifeq	\call_time
+	beqlr+
+	crset		so
+	neg		r3, r3
+	.endif
+	blr
+  .cfi_endproc
+.endm
=20
 	.text
 /*
--=20
2.33.1
