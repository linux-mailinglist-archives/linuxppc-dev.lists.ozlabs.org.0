Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5902847B15E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:41:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlhl1q7Xz3dqK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:41:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldd3Lmrz2ywF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGvCSR1iOo5uJjqNYZ8le9vhYLD/TBynC5sxXvLB1XX3GIqaE80g3MnJNZhWknSsNjodCMPr8CmY679s3xE84XUI6sk//zqTWv7Avgk8kR/pWjdydZPalv6KjLbSf0RNX+ABA6j1hgRXXuw5Jhc/0OhiQ5GqFg8VI9Pi2CcV9YCkPU+gupk0wzYDoMkVgTwJEAw77sd136jOjE6uhWVlDkwOETgURQ5IG2FzUEHPrda6FzgEEZEmYMzS8xKFZ5aTs7a6K2lgK4LtzGHMHP+jmw14VeyGG5+zGqTKvAkx+yyXRRvyf6zhAHnuN8O1EbAO+6lYvSBiBFMlcx9TnXOdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHz2DMxC2ekv9AgUuCbvFTmjif4Ud42jFMR/+dMeq74=;
 b=VB3DVotD6o6+fR0msoh0mkzdHdefmRpCQv2ah1F1NAees65f/6Y9lBd2zPFdfDBy5E0xbTVZs/GZ5Qo+DmGP76rJrOgn9nBmajga/aDK0iwb94QjG9+uEjveD0shVRqc+xtPKzeVzfgQ4lXayT3tsk0As54jYxQeBngEoxj3ljUea4WC1yrQ/qu4QHqZA6ta+26sfNdCvK7rDcPCu4SoaNVbM3DZla0KdMqVWbF7DZ108Z0Xh7nYjVb9nJEs55j5fn3cwElv183lFfOv0mLCZbnls+Vtz2dLc/uwhZT/0gy2mzphBFnXzWMuZ8sEbOGZBXCoxJja/vkEPctS7OoGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 06/13] powerpc/ftrace: Simplify PPC32's return_to_handler()
Thread-Topic: [PATCH v2 06/13] powerpc/ftrace: Simplify PPC32's
 return_to_handler()
Thread-Index: AQHX9b/+LnaEbwqa30+7uq9KTtCL+g==
Date: Mon, 20 Dec 2021 16:38:19 +0000
Message-ID: <aab39b77b34fb2c4ed08ed01c547b6ed13643788.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3facd83-e662-447d-6364-08d9c3d72164
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB2161CCF94D91436410450E58ED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AnBwcV6sq77/RD569a45mowowomJrS22FZb3Aknuqici5B0DNb4kU941tOvYFJau8kOLHV8Qk87LxAyvVIjP3bGyF7H7xPVqgImTTgbseC+9Xy4Lqm8upsbmUmY1e+GCmpn6kVkRE/iGrKJmkxNPUgSXGAmR4zI6eTvfP2Ae58Ocq7TcAcCvMsobdBDsndqZbJeL4sT1Xhilpb4VjYTXNs9vtjwrJSLSVXFV7tY0JhLNj/Ko9eGyeiRAR7puwF+c5mDy+R6V8R76cPg1QY+VBywoFaoDmQE7Uejq9ytG1rErlh+hkkXqw5e4c97Xfs0AsU+bl0/NIgkt2fXtvD6WOG9NbC/oxR9ON85gdkeptl7NaZ4ko99Bhee4ITBvdtHooaMNdslui3xMgZnaNDC2UlRe6/DRHuAQdCS8e9c/xb4r0sSwTP7KJMizOvuV/fs2kQ549NWIdMsbBqvE2+Dq9zCjIUJ986glPdnlRqAe2z9Fc5N21n0QN5aNXlE/QrrPtBA5s16PLQUGcBOpzh3GRvtA1YlLm8FpzV1N0t7a1FwClQWCL35jIQChuHqct8KjIU8DmT8RBLHc0pdj1MCl80lqrFFM9qfueOG4rhI5Xjxo2xG0n/NniHboLvyQuWGf3hm5hiO9FOsuSE6tIivb2q+HAguZw5cr9SaxmrqSKoOV7vugyOxbdN3ae0BkxJ39k1ASHfpbllTmzhHFMoF9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6506007)(508600001)(83380400001)(86362001)(2616005)(8676002)(71200400001)(4326008)(6512007)(36756003)(54906003)(122000001)(8936002)(4744005)(110136005)(44832011)(26005)(316002)(6486002)(186003)(64756008)(66946007)(66446008)(2906002)(38100700002)(38070700005)(7416002)(76116006)(66556008)(66476007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hX78XOql6n2A4Hxq6aSPU3W7KswMvCF6fb92vwMH+jrwOOES8DLVyn4Zyw?=
 =?iso-8859-1?Q?VTo/i2aMhEd7+RYdcmURGhw/5nJg2qI9+m4BdpGP7Q/p6Qs4qBIBTjMZCW?=
 =?iso-8859-1?Q?qWdoQdC8YVxA34LyASL57/yZg7Ax1npFyNK7jv38Nd/67KdfTW9rY2KD6O?=
 =?iso-8859-1?Q?Z3zc8HqvDTiu4P8iukeCepQYXndk4qF3FifMu+6fh98ndzaY8TGLJItp4A?=
 =?iso-8859-1?Q?cW5M2dCg2UOpUyURE4WM/OnQP7NbjlzzHq/1xotd6w6fDfO1BbhXF0PAYm?=
 =?iso-8859-1?Q?httTmK7Lmbog1wfDGv7VL5yhCrmUg4qtqjj5aThmriorfrka0J8tWufg8j?=
 =?iso-8859-1?Q?izFAQ+HufYwP2vuZqVJPv2OZivPZpFicULLa5gYaNisntDpAng2gRwyfae?=
 =?iso-8859-1?Q?x154FL82lJEZsBTwlPo8/8D5UxwiHPBseL2TDODhDyNC6zzwwEGXAblK+l?=
 =?iso-8859-1?Q?gyCaG8vyDewvBLNHTMimGQ57fUb7F/1IEQJ+htDpWEKDe4GVlLLJN3wQsY?=
 =?iso-8859-1?Q?T/adoXIZvzkRlibRrxeh0jbu1L9VFJHktGa2XEhohEYXUj1ceR412zeXat?=
 =?iso-8859-1?Q?mADwOsl5Xf1Kd95iNtof6ADLRiPiffYP1SoWkPppeJLHGjntpskzVzeoMj?=
 =?iso-8859-1?Q?Dymhzg/T85W3b+vsmAHWFGXNKs7qMEcP4UmCb5qaZbwMWeNzXfT30ZGhMJ?=
 =?iso-8859-1?Q?Nm26UIk0ck5sxlFp55aVFlTDbFjyWgZVz8PbJkKXUgivTmtcI4kvvG1xjs?=
 =?iso-8859-1?Q?+vl5RwHx6zTj7msgvcPxpz1dhANvtrZqB6hGsuujq0fJ/VQb4e5aZgaaic?=
 =?iso-8859-1?Q?ipm0FGQ/WBT5Ndl1RMJyoofQnelmdQPaWaOUZW2FeOvh8Ph6ht6FD2Pay+?=
 =?iso-8859-1?Q?DWFzZK+DROgW9Mxs9UjEpdnqL5tOtqu+k5mEleJSv9kqzo4Rdjn5wBBeln?=
 =?iso-8859-1?Q?0NLUUEUL4BJI7peaGoJYj+/uF7yTYP9tnzWzFWddTRjN6k04bpoSv6eV+3?=
 =?iso-8859-1?Q?TSmxn8wAB1815s1BCrRy8g+4maGIVLSiJvB7sBFZhnXpdROkrx7vcbTuL3?=
 =?iso-8859-1?Q?LehL/pgf+9a2EOFHSVOX+q10QD5prXPQFf0/SjdeX/IgCCRYF6YnWjG+/A?=
 =?iso-8859-1?Q?QJPFkLQvWLT9Fe2k6jkNwwEtD/PQ/oc3o7hL5bWXnnOdd3a15ocE5Yie3F?=
 =?iso-8859-1?Q?KnbG+5k3rKUlU6RigtBA3/Y10KWKdaCRevVCQrNVK9e2qQJ1+rj8e2DIMv?=
 =?iso-8859-1?Q?QHZQ9/LjQ+aTtVBoVsuN42QOhJsA4V3NAlplvIBO0yORZm4XtX7yQWFVK0?=
 =?iso-8859-1?Q?DGEAjIgrFlhKDUGBZYEtdqlqZDWo6/lmtP8JbBC6pPc2iRrtx5utlwgLUr?=
 =?iso-8859-1?Q?sUhVQf1NVD61T7uPTJasMnfOTwRY+oAhfmXnpifaBDej8mA8JFJxMzSTEW?=
 =?iso-8859-1?Q?S+OcF28AQBTZ5INSsl8GB2L73fJy97yr+D4kZ1kSO2/gCC0UOTO+mC3tbf?=
 =?iso-8859-1?Q?QAY4xwHVFz7hNk2+ofYs8OIEITAKKAIcDvEglBQrLq1M/xHLEZF8GPBI1V?=
 =?iso-8859-1?Q?sj31zvn0PXvArfYq6gwDFrRgNNIHHnZ2XWF2UD3oVHLRMwTt9pciOJBJfU?=
 =?iso-8859-1?Q?CSz9kxJIr+gvg3DwFSuG9mqSncCW8+1b/gYbZQs6vrZHERF0giHJVTzCgI?=
 =?iso-8859-1?Q?XMJYN/ZchOSY1BP24zCuKLERs/YaTQ7Ru0u3fI9MIZzWB4BOYo/4XFXYDC?=
 =?iso-8859-1?Q?+mom803PiYLFfPEq5xhHQMtts=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3facd83-e662-447d-6364-08d9c3d72164
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:19.4768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qCmux5ANKwm6Q8nqdGdfLYjEgLcmBKwpP+puQt5ckH1nzVRPTSUJPMgqyZQVNcVqLTI5uN3OC7Ea5zAmraKWotpjKmcld7XV6WG1Aa37rs=
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

return_to_handler() was copied from PPC64. For PPC32 it
just needs to save r3 and r4, and doesn't require any nop
after the bl.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace_32.S | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/tr=
ace/ftrace_32.S
index 7e2fd729116b..95ffea2bdc29 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -162,22 +162,18 @@ _GLOBAL(ftrace_graph_caller)
=20
 _GLOBAL(return_to_handler)
 	/* need to save return values */
-	stwu	r1, -32(r1)
-	stw	r3, 20(r1)
-	stw	r4, 16(r1)
-	stw	r31, 12(r1)
-	mr	r31, r1
+	stwu	r1, -16(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
=20
 	bl	ftrace_return_to_handler
-	nop
=20
 	/* return value has real return address */
 	mtlr	r3
=20
-	lwz	r3, 20(r1)
-	lwz	r4, 16(r1)
-	lwz	r31,12(r1)
-	lwz	r1, 0(r1)
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
=20
 	/* Jump back to real return address */
 	blr
--=20
2.33.1
