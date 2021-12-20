Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99847B17D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlml1YTMz3fQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHlf66bCKz3cGb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuwqL2O+t9AxbX/l81Of0G/azZD5wTy4QtkC4Gw6r/EjhdMQ40L4DZEY3Hnm4kM9GAF3iSoxUIli+EQkbk/CmpxXyiWCEsPhkYd8E3tx6zzg7Z+FW1paGXSR8GqYT1kIe14YqG2PFM0ewEduaxFlX/kB64eU6yscUA0kXDBIL8/+f1Ge5NtOb0/6VkB5suPRrJmMlRggKSJWJbi4RlIoULZivfYyl+m/oFe122YOPVODX9kNvWQXl3QZsWp9lUSk9tQ7KJam0UQ/kI4zaqtI9AAW7lqLXeQ/2jvFOFVAw2XYkb8umUAKtk3z2MomV6ANrF9Jpi+49G1SgYbfOjZfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSv65mcWN/H4kOX5txTNMmipXggQp13N2F9TK+PvtXM=;
 b=WuJxkqrgoEQLIW2y8YTHIa5OhvtavN3IfzCtnjQCAMKMPF3LmzDKadHyjF1SNG4CRSRwpAejbpwvV6oneG2dIK8MDy57cbSljWoIQkGVG+pPbTGyBaagU1vS2f/hG1W7U5PJxqOiaGXirMbFC7Dv/qcRIGjvxVCGAGxkH+0GFstKq34i/WO8FneYp5f8PGjXWuZflq9I+3FrtDxgP2Emlgbs7WKXz4O45KcnH0RJsxizmXiLcF6ln8kRhZG0fAWncU8vYvhX6DxKF/9wOzC0bgBqEvCBWxNgALH+cr01w524lP8/0qoS5HAm4JD1UZPbePM/Vsyxvs3qP+5jATj2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 12/13] powerpc/ftrace: Prepare ftrace_64_mprofile.S for
 reuse by PPC32
Thread-Topic: [PATCH v2 12/13] powerpc/ftrace: Prepare ftrace_64_mprofile.S
 for reuse by PPC32
Thread-Index: AQHX9cAL+q8e/kpRIUG40cd4NXnolA==
Date: Mon, 20 Dec 2021 16:38:40 +0000
Message-ID: <82a732915dc71ee766e31809350939331944006d.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e74b0652-1e0d-4da1-d312-08d9c3d72dd1
x-ms-traffictypediagnostic: MRZP264MB2924:EE_
x-microsoft-antispam-prvs: <MRZP264MB2924A4E00876B29FF4A01FD5ED7B9@MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3+orbSCEMDSXONNywi3B/SuvJhCVH77G1EjP8WYm0Ejum0+rVD2WpKFSt3mQ7TGNI9iAxIX2PJnT4zMMFCLNgtJhRLdhxAONpujihVJ/PkPGIH7U4ykxnFmKt9pt7WGD1ALOHPYl1mOf+/rArPXQFW6SldXtgjsI67Rjm8XM6bj0jxNuFM4Sjlsvw2f2N+YkaxFfnqgEQwCh16g3cc38rNqXoBuj1pMNfQKBaCeeGAIdXrHdbxriPck+zHWopAtIpHvCs10fRc9O0xNwePYL1BjPxg0qhHEiuQWwjEmospiySUJx6oTV44xNF2GVhUhNCequSUC5PKlokKgFjjPNBMm01+Nxr3rhhFNZHskw+FPg9cAa4hiNB93C1cCdrlhiYZhX02G1+0Jo9Mf8NIamt/+Ve6o78X3Fsvp4PFhGuYiGhsC5R5T9tGUtzVgSHBTaULhZDrHprIqhi3xY8hMrkTG/igab+hy1smsVu4c9CixVzmNVM+SrXHzRBOxafgQkeMKq5451AXbHXmhsLEK0xKjEigXcKN+D04G/OYSfn4ouwK+DdNVXVPr7PdigQDwdqkDRMDo9aF8XHUjZQaRbqAX4twji0JmL9QoqiElvEZquxEoOJ8qOCQepcdoDJqUwtrOjWC/JP7n7TLgdIsIfnPTFW1yxrEtOeTMrFUnTMcbTVdY6fYbP1tDmJdxe0yg/1A+9bfcyqioYyWyOB/z98g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(4326008)(86362001)(76116006)(6506007)(91956017)(316002)(36756003)(38070700005)(110136005)(71200400001)(83380400001)(7416002)(2906002)(44832011)(2616005)(5660300002)(6512007)(66476007)(8676002)(8936002)(64756008)(38100700002)(66446008)(122000001)(66946007)(6486002)(66556008)(186003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LmRKGlq+I+MG7gG70nw4LbIM6zolvMMwwR9Rw/Rn606+7KUHVRwuV3HOy7?=
 =?iso-8859-1?Q?W/z8a+LqMPKQD61Zy+3ZubE6jYJgL2cI/OxlZSIDJdt1Y4lVsrmsIc0rNN?=
 =?iso-8859-1?Q?l8AXjB7bMdhFchIAnZMOgHCbpVWe0zK85JZpqIejF6RPXjlNINlDkPCzFT?=
 =?iso-8859-1?Q?CQsci0Egi5PB3Bn59Li38UAeLHkfDBs5JMmJyoVnAeOScweHiWZGnIlVKj?=
 =?iso-8859-1?Q?XQi8IPPk48ftkQlDtLPnV3JqDiOZj3yph3qjHN/2jklFgGTbwFublj150V?=
 =?iso-8859-1?Q?0qHaYJp3SYY2yc5izj73WNCSVnOZNiBNin+rgwKsPuh39ZqwIagrVbXvGa?=
 =?iso-8859-1?Q?buCSwTMX2ldAPXMj9UXn/q//HxPY0eNsOrqMwbSqGnXHhbCvAJ7MJJ+182?=
 =?iso-8859-1?Q?gy2zPmKMaSivZOkYpiDyK+jh0d1U1yhp3y4r4gklBHWVOwxO71jWpHl9aB?=
 =?iso-8859-1?Q?BjsRVEZrR9KfugmlrTKHX68wchj758/Ry81AG2q2HZU5ZsHbQ9Cr694xit?=
 =?iso-8859-1?Q?9M3BF7PN0VG5IiFrXZTnZ5yZVDNWwI1lh+n+SYfgJnOyfic7dbJym7BHBG?=
 =?iso-8859-1?Q?PzvSfsUgvI32T3bdJRz3o4gJYDngHOSyq5JvNcaqDNFlzBw3h2/QwRysTr?=
 =?iso-8859-1?Q?gj85N1KvZ+72uPnjOtANxtVD7+y31p+K/KRQ3VwoKwcKMjwlBXuMfbQmZP?=
 =?iso-8859-1?Q?XwRUf8impO1wWITE2CG+YOS+iCoa1sKeHsbc0LqVL+GVr0l+P0UMjbbUVH?=
 =?iso-8859-1?Q?/Tbj9JkWolPw6/dnM5+hkyj4tSVS0rR/KhgaQTedh/HHDaXRHikkbdmqnp?=
 =?iso-8859-1?Q?5MvNkjzAIxZdE5qlpZEBTprnrsCZhE4aqmZg8cITTsseHf91khaA4rtScU?=
 =?iso-8859-1?Q?Y6dyBmtW5PZ2YzbLFWhno9wv1T+a2p91y/RVGrnNJOFXNddxQznF2SkQ3o?=
 =?iso-8859-1?Q?5KmwjOxuIDOlFAS7xJ78hyH8798djKC1sZ9Lo+opQB/4IQCK2OzSSzZeBN?=
 =?iso-8859-1?Q?UQ4/qAOXumXNQOdWApV1mBCHnwqu0OFfoL1NustZxjvawz9C8sDQoCz8Fy?=
 =?iso-8859-1?Q?2ZOQewexbGbzR+GF+QUA7dPK57w1dm9AblSMbk+83gSTnd2/CgR3NAoCmG?=
 =?iso-8859-1?Q?ghGJnZd6tsLTnxmLQ86dJQWQE6vWZ4BWmRXaxXlbdm+eiy+FYQw5MFjQhr?=
 =?iso-8859-1?Q?2wpsa5UMmfkkjfQ8REe52z5RfUQ/omyNcw3OmfJT23B3WgkDnNylmwfqaY?=
 =?iso-8859-1?Q?YCs5vOouvJaWzf12y9PuRwWhR1tVuDykum1Hz7J6LbHWELHmTUapwBjQR9?=
 =?iso-8859-1?Q?r6/P3eETHWOzvk2+3ynPn738THkIP0Vc/YougCqoUFL6ubaryZBPVMS8cH?=
 =?iso-8859-1?Q?hFyovUza95ImlnwLYbHpeph33uyPT55wcFq0U/4ATsWxUJsVUlpU7aJLmh?=
 =?iso-8859-1?Q?czvea1icJyM/Z1wTebio6eu5clxxvCHA5+SfsD7bcN7pUCHOF4h8X6Xbk/?=
 =?iso-8859-1?Q?bIO1SZfjHA4EuFMOR3c2N240QSrqI1qi6RSXvWiHJFelUpk+Tow2BHkhrR?=
 =?iso-8859-1?Q?TnOVUZlnSqjik4kqAXyil4aLU32ZalXwEZpYha8Cdtxv9VHTV/uyu+Hzox?=
 =?iso-8859-1?Q?UjImwzh9gixZLno1D+91unYA2k08iEwSOJbQovjaIho8uoC1PyJPWePrhL?=
 =?iso-8859-1?Q?Fly8GebnzJpPtiXz0za5DBZAuzhILqQk5nS2Ht/slbmUbv9nD4U0UrFFSo?=
 =?iso-8859-1?Q?HnFwC9p+ZA8tC28ZDo+Pb5l3g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e74b0652-1e0d-4da1-d312-08d9c3d72dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:40.2809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDf2gStSrsuol/8WzM8vnBbRylINLwpJrLhpQqONz/LsV88Xd8ObngaFhhxLYz9T3P/oWdLg2woq7qlIK0tG4McJaZ1AxcJxKGyBmtx8MRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2924
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

PPC64 mprofile versions and PPC32 are very similar.

Modify PPC64 version so that if can be reused for PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 73 +++++++++++++------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/=
kernel/trace/ftrace_64_mprofile.S
index 6071e0122797..56da60e98327 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -34,13 +34,16 @@
  */
 _GLOBAL(ftrace_regs_caller)
 	/* Save the original return address in A's stack frame */
-	std	r0,LRSAVE(r1)
+#ifdef CONFIG_MPROFILE_KERNEL
+	PPC_STL	r0,LRSAVE(r1)
+#endif
=20
 	/* Create our stack frame + pt_regs */
-	stdu	r1,-SWITCH_FRAME_SIZE(r1)
+	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
=20
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
+#ifdef CONFIG_PPC64
 	SAVE_GPRS(2, 11, r1)
=20
 	/* Ok to continue? */
@@ -49,10 +52,13 @@ _GLOBAL(ftrace_regs_caller)
 	beq	ftrace_no_trace
=20
 	SAVE_GPRS(12, 31, r1)
+#else
+	stmw	r2, GPR2(r1)
+#endif
=20
 	/* Save previous stack pointer (r1) */
 	addi	r8, r1, SWITCH_FRAME_SIZE
-	std	r8, GPR1(r1)
+	PPC_STL	r8, GPR1(r1)
=20
 	/* Load special regs for save below */
 	mfmsr   r8
@@ -63,10 +69,11 @@ _GLOBAL(ftrace_regs_caller)
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
 	/* Save it as pt_regs->nip */
-	std     r7, _NIP(r1)
+	PPC_STL	r7, _NIP(r1)
 	/* Save the read LR in pt_regs->link */
-	std     r0, _LINK(r1)
+	PPC_STL	r0, _LINK(r1)
=20
+#ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, 24(r1)
 	ld	r2,PACATOC(r13)	/* get kernel TOC in r2 */
@@ -74,8 +81,12 @@ _GLOBAL(ftrace_regs_caller)
 	addis	r3,r2,function_trace_op@toc@ha
 	addi	r3,r3,function_trace_op@toc@l
 	ld	r5,0(r3)
+#else
+	lis	r3,function_trace_op@ha
+	lwz	r5,function_trace_op@l(r3)
+#endif
=20
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
 	mr	r14,r7		/* remember old NIP */
 #endif
 	/* Calculate ip from nip-4 into r3 for call below */
@@ -85,10 +96,10 @@ _GLOBAL(ftrace_regs_caller)
 	mr	r4, r0
=20
 	/* Save special regs */
-	std     r8, _MSR(r1)
-	std     r9, _CTR(r1)
-	std     r10, _XER(r1)
-	std     r11, _CCR(r1)
+	PPC_STL	r8, _MSR(r1)
+	PPC_STL	r9, _CTR(r1)
+	PPC_STL	r10, _XER(r1)
+	PPC_STL	r11, _CCR(r1)
=20
 	/* Load &pt_regs in r6 for call below */
 	addi    r6, r1 ,STACK_FRAME_OVERHEAD
@@ -100,27 +111,32 @@ ftrace_regs_call:
 	nop
=20
 	/* Load ctr with the possibly modified NIP */
-	ld	r3, _NIP(r1)
+	PPC_LL	r3, _NIP(r1)
 	mtctr	r3
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
 #endif
=20
 	/* Restore gprs */
-	REST_GPR(0, r1)
+#ifdef CONFIG_PPC64
 	REST_GPRS(2, 31, r1)
+#else
+	lmw	r2, GPR2(r1)
+#endif
=20
 	/* Restore possibly modified LR */
-	ld	r0, _LINK(r1)
+	PPC_LL	r0, _LINK(r1)
 	mtlr	r0
=20
+#ifdef CONFIG_PPC64
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
+#endif
=20
 	/* Pop our stack frame */
 	addi r1, r1, SWITCH_FRAME_SIZE
=20
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
         /* Based on the cmpd above, if the NIP was altered handle livepatc=
h */
 	bne-	livepatch_handler
 #endif
@@ -129,6 +145,7 @@ ftrace_regs_call:
 _GLOBAL(ftrace_stub)
 	blr
=20
+#ifdef CONFIG_PPC64
 ftrace_no_trace:
 	mflr	r3
 	mtctr	r3
@@ -136,25 +153,31 @@ ftrace_no_trace:
 	addi	r1, r1, SWITCH_FRAME_SIZE
 	mtlr	r0
 	bctr
+#endif
=20
 _GLOBAL(ftrace_caller)
 	/* Save the original return address in A's stack frame */
-	std	r0, LRSAVE(r1)
+#ifdef CONFIG_MPROFILE_KERNEL
+	PPC_STL	r0, LRSAVE(r1)
+#endif
=20
 	/* Create our stack frame + pt_regs */
-	stdu	r1, -SWITCH_FRAME_SIZE(r1)
+	PPC_STLU	r1, -SWITCH_FRAME_SIZE(r1)
=20
 	/* Save all gprs to pt_regs */
 	SAVE_GPRS(3, 10, r1)
=20
+#ifdef CONFIG_PPC64
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
 	beq	ftrace_no_trace
+#endif
=20
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
-	std     r7, _NIP(r1)
+	PPC_STL     r7, _NIP(r1)
=20
+#ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, 24(r1)
 	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
@@ -162,6 +185,10 @@ _GLOBAL(ftrace_caller)
 	addis	r3, r2, function_trace_op@toc@ha
 	addi	r3, r3, function_trace_op@toc@l
 	ld	r5, 0(r3)
+#else
+	lis	r3,function_trace_op@ha
+	lwz	r5,function_trace_op@l(r3)
+#endif
=20
 #ifdef CONFIG_LIVEPATCH_64
 	SAVE_GPR(14, r1)
@@ -171,7 +198,7 @@ _GLOBAL(ftrace_caller)
 	subi    r3, r7, MCOUNT_INSN_SIZE
=20
 	/* Put the original return address in r4 as parent_ip */
-	std	r0, _LINK(r1)
+	PPC_STL	r0, _LINK(r1)
 	mr	r4, r0
=20
 	/* Load &pt_regs in r6 for call below */
@@ -183,7 +210,7 @@ ftrace_call:
 	bl	ftrace_stub
 	nop
=20
-	ld	r3, _NIP(r1)
+	PPC_LL	r3, _NIP(r1)
 	mtctr	r3
 #ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
@@ -193,11 +220,13 @@ ftrace_call:
 	/* Restore gprs */
 	REST_GPRS(3, 10, r1)
=20
+#ifdef CONFIG_PPC64
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
+#endif
=20
 	/* Restore possibly modified LR */
-	ld	r0, _LINK(r1)
+	PPC_LL	r0, _LINK(r1)
 	mtlr	r0
=20
 	/* Pop our stack frame */
@@ -209,7 +238,7 @@ ftrace_call:
 #endif
 	bctr			/* jump after _mcount site */
=20
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
 	/*
 	 * This function runs in the mcount context, between two functions. As
 	 * such it can only clobber registers which are volatile and used in
--=20
2.33.1
