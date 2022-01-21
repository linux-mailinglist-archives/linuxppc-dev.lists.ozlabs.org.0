Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9A495D45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 11:08:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgFSW2Bb1z3dhX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:08:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgFPm6pfdz3bbL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 21:05:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUeizJGwnqipitLYBZVRb8/YzG0heZH2GvK1cB+x35mJHGN7ydh/CEWlJA8PiIYuZhNlCVQd5GLLKzwAV4WmLuXLOPuLoWpocCOPiO/3eLtMCGP+tqaPQs6L5YgLnvX4tMexG3XB7sJP7Dl3VCd/yfB58o7YTgPHH9AP0NGlAZxMbqdIPnd9fsWFiMHLnXeMcp+azLxc+/DyZ/YP03dAalPNgquPfRfvunodO05tHJWcxjB0niH9qus3YNmg7BQ22tZjAftDw9PYvGr1gIB/bA30XL49oOM5pQ5S0R2EeR5y90K3zy2u3wxu2zNaTtSIA8L9KvFCSxS9vIpEni2K7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddtVBD82QIQJLpEfG41LxRROMDv/OJpNqTNmbY2ROUc=;
 b=JCb3Ff80F+WBOglS5Ms0MaCdUDIdhk00rrwRbOb0N5sJQ3FA1h73gQ4akmb1fBg1VEiJN04h2NaYDAoy1Fb/ebI5jUBTp6WE3pfumUBdCoHMobOQXFtyNGAI8wQE9PjR6t7uqFwLPk+qnVOPTuwwUeiA8dSJZfJfReeTkGKPMHxc2RyY+hcZGmjZd3aLrc4HLC1RlbUCcT6F/KW24JnxKlPM1ptjM2uspojGRrfEX7ANgczt9LjC6ZeHJdycSqmXpoPOuGsZ35r33TYi0FCww9c3xnXZ1eiINPu86zFqSfFEuczUiGFDLQBypvk7tY8rGo+/saNtAJ1VrrvChdg10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3697.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:29::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 10:05:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 10:05:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: [PATCH v3 5/5] powerpc/vdso: Move cvdso_call macro into gettimeofday.S
Thread-Topic: [PATCH v3 5/5] powerpc/vdso: Move cvdso_call macro into
 gettimeofday.S
Thread-Index: AQHYDq5shf98igvZz0+pyrRDKUBu0g==
Date: Fri, 21 Jan 2022 10:05:30 +0000
Message-ID: <fcd8662a183c51353f218ff7272944f529fcad11.1642759506.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642759506.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5b68a44-2743-438f-b1f2-08d9dcc58e95
x-ms-traffictypediagnostic: MR1P264MB3697:EE_
x-microsoft-antispam-prvs: <MR1P264MB3697AAF45CB1A50E13FF0B52ED5B9@MR1P264MB3697.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tULGJ5h4s2cA5hEDxvoUT/16uds5Dl5o5tIW1yQLcwiioxIyebfdIdPZuJEPm5Crtvo46X3F844em8MfDQ41tZAx/mH6zM3++qJbupRzqn0bEk3UkyEOJRDjgN1EOXg9UoziPAYPdodibNjHuT/P+0JuqCBJP2wRDirNNUJTwNcOKXwfLY8Z9I4W0iX76ogXgHoEoqdHcKFby1BfRoUTSsREJHHHHC5TqEHCBu4u1nlFtwAOCqYf5jYjoNHqhJvQoVvQw4e19TuFa8Qludjq4yuHGAFDoadVBg2RSkEEXEKgOk8YgvHAqAW8fZ/byHY/lfc/CeP07CPI8JvRWcWOetGNBbGXmcdyfHiQwlPx9nECvVhp0qow4NMKW7c+zg2XeWZvm81z4tIMOqsFqe7CMU86YEBlQx71PVMQrwrN1zDixbJcnlsm8o+w4YSNVoGS9PKXjwfAZTGOu0WXOEofrigCay53B34ksPgZmWt3vaDu7ykwxjmwOjDJZNWbQQ1VeaefT8XiTpDF9FEHS9J6WfWldEJ8wTDU/3gbecOCtReG1qWnYPhWnLAbVGclpoX34pHwgpyuxq+ec7uhsspT7Ryed9r6JvhrnhzbEK0dZXiRVSmHsLFrWD8c3rY/h2eZZTJPCTfBOiBJPQHKBTGiiMCZV77pTpwf24Ho0mZwe79U4+8xrsRcCCbekMPodJPikbZDXxLt4oWVtUE0UbF+wA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(6486002)(86362001)(110136005)(2616005)(6512007)(66476007)(36756003)(508600001)(44832011)(2906002)(71200400001)(122000001)(5660300002)(8936002)(6506007)(83380400001)(26005)(4326008)(38100700002)(186003)(8676002)(91956017)(38070700005)(76116006)(66946007)(64756008)(66556008)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rb8iot3AiqjcpCVC77ccDta/hKIIy3hz2GUbJtVJb04V5GbGhe2AVff2bx?=
 =?iso-8859-1?Q?4C2vJflLGEYtH5Oa5NHLk/Jb/hHvAISGDLX8kLRKCjG3jXYcSW7cZbZY83?=
 =?iso-8859-1?Q?2wpk9Zj4WdOC3DiA5HXa804mPh8zbQtbhOkxMC2JpVJE4i5QxGAM6Xj2YK?=
 =?iso-8859-1?Q?95cMBGGuzIXCtFQCRV6UqKPIlgVkNkwVo8jgvsKKfF8VaNodIi+pHrbiDg?=
 =?iso-8859-1?Q?sDDC7oLogZiLgeoB/nEPaIf3tIXKXzTZH98EomZwPamS3F4CMlV/WpWNsG?=
 =?iso-8859-1?Q?jkq4uGQ3k1rO6DdS7Rqe5TF2D2Yb+afmkTzx26CP0j+oIFZVES1bTQv4YA?=
 =?iso-8859-1?Q?s/gmUCSvjMmnMupbEKH3/+PCLCQYGiJGUEoLB1hgPXuIJIcB61dW/Whokq?=
 =?iso-8859-1?Q?KBeBi7MLjwIQhqFE0uzfqFoaQTVyjCe/W+JTDSY1bm0AlcEemSDfLSIinj?=
 =?iso-8859-1?Q?BlX9O218FyiEjbS46F+CEq3y7dKDl8Crddjyemtx8igNlD435iQQ8I23Bk?=
 =?iso-8859-1?Q?Pi8EsvLtYGC4C4NcMNaAVv7nkfANPoVSe/b9Zzq9dlDEaSleb6F0qtkdRi?=
 =?iso-8859-1?Q?ULO2fsqHWIjopoGpgBRCmYyglmoJql6ltqBXqry87vOkwhpa3zCooIUyuK?=
 =?iso-8859-1?Q?ONyE/zPAV/N1WdNLPxtA1DAxhn/aR+TuH2LqowmcWNnggAnzcBDB0Fo5GO?=
 =?iso-8859-1?Q?DmE8G89XW2H24hscKbOkEa89D3g9f7Y5mEYDnrDwrccqoEYbXViBKU+Ako?=
 =?iso-8859-1?Q?73LYVL8/iW8vw5iPUH18IFE3+3C4WWWo5rE3NZWu+5PQGpcgyOIi6DIOiZ?=
 =?iso-8859-1?Q?ubkgzLWS2x/7x4Il9FfL5B/6ocqG8NAkr8ayo0EecePiuoVXv1k9VXrRhL?=
 =?iso-8859-1?Q?duWN2AY3nywpCuy6rpywkBG/r5iShI29meicqyrJ6aaKejG77sdYqEG+Vn?=
 =?iso-8859-1?Q?UQziLCZZXFqD9CK/8BFz05s0V7MF/ACeAI7dZsD6sCWF6ZTKOjciqP0eAT?=
 =?iso-8859-1?Q?XKKr1p3W8B9VsPLsgDhybgnuSZOP2mq3X6/8FP/OzMMo9TqxFk8X5uLtQC?=
 =?iso-8859-1?Q?6FoUgwjr86yyVxTnzgkpjK4XecX0GPvdGQL4JRLYyuDX4lvjVVabZOvbLM?=
 =?iso-8859-1?Q?meMm57/Z0s/YDQS45JtOCMBxmC9/Xu83E6S413Ao8a5H7IXXmLouus2Sfr?=
 =?iso-8859-1?Q?S7daxxkzSjw9isg9ZqzHXo0zZsLXIneayTA6uvXVUuT/cVNFpiwKxa6Qzt?=
 =?iso-8859-1?Q?4dKM6DhLtwj9VmUeNN74I2UH4DOnx78684HMy6Qe0AKKt7vGlRaAF9oChV?=
 =?iso-8859-1?Q?+wlKGU+kyQPGKdFLEfkWq1yJy3cA7udwg7on5wKA2ZzR07mIQ7tLKXXY7l?=
 =?iso-8859-1?Q?RUaavw/RD8TFV5+bUtZQWlzarX+e18cSgbbyWNu2usrOBawerI8ekqpo7i?=
 =?iso-8859-1?Q?7SMTyEt47nWrOwc52uAqcSec3OpOjizge1MGOMN366l+uVZFJ52PQ7sT7Q?=
 =?iso-8859-1?Q?rVumAJn2hLcdv3e+wH9wWTmATedC0S//XMaAf0er5aerEb38LZgj0X4Xnz?=
 =?iso-8859-1?Q?jEmJhLmN8YffbhN4+ZASvO9t4apo9T3RBCyI25TFa8e1IGpRJpcB5OeSUP?=
 =?iso-8859-1?Q?aXrD8ElBe+XNjuDnY9Avr5Uwffln6Uco4+47F+an6bBKr8VuC3ikrGyCEN?=
 =?iso-8859-1?Q?Foi5vHsmOAds/LLooE2mPBccwMcTIG327IwShn8tgXVuw3EvZXlx3/bAtF?=
 =?iso-8859-1?Q?F96gIk7DjBvESnYOArmLJMGPg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b68a44-2743-438f-b1f2-08d9dcc58e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 10:05:30.7697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhWHKZNbHd9fiElDCsQGpcZreOaYKogGPlqShJj5/a0QPz3fY199du3ZuC9fy1ATYY052Wq86nBawH1eAJE8i3PRK7VzTQOS0Fkpg3+cFoU=
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
index c875312274aa..11e0b911c923 100644
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
