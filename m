Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803047B16B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHljn3PC6z3f1n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:42:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldf3qPQz3017
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrVc5EXITf5R7O94nGBgdeEgjtO1AnC9lSJVdNAUhsMQL7SA1S/DCCg5VmUDsbu6n+Hwx9sUc40ctptGGZFvhFlIdyjmCQ4g6lRc+QHMA5mcSzhWooMKNNZUpnmak3Hu3oFA2sZVsyA0bKwn56uvF/+NIem4V0mGCPMrObIYaIUYgqhKpjulXV4+jgVOHzdnV3DwBD1eMdugxWYCaWHHX6KlQSEs6KPwFBwRB5K/MQtPZk5CvDD5y1sMRzmECh7qNmShBE6zHs5HAfBTB4GMqh5WGVia47DIw43VLfg2h+m2SMtMouaPFk29aFeukulG03f6Eja13/sr6uVjLIkX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ov6GPVxo9wBYfd/W3HMywq0/UCxDk0eakf75NTpYu8=;
 b=HMp/2RNXwBF1YPuZH/TtI4dKJF22tUUuNctfl3J8WoLUXawG08xopbPfOsjsNRLL8zFJ/rG7f30g2ptHlt/fO0xX889b3/N9Dyn1bGYi7S/klfSI6bB/8IjY90kGAjt2vPgMlz94JewsSiwcwhJ1Donclz5bpByT7lv4tT3q2psBCNxpyNBUCS9SqnZMajbcrU3/HoUY10vpGJpyFYo/W2U4HXX0M61WUEOoMhwhgpH21sz578yI50TAsUIxVGBjGsGIVi2XmedyCSMiFkLmSx+Iv+T2/6UKJ8uqWylFflP/GT5/1qMXXru4X69psy97VOe59mwkXTlBbpHt39t9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 08/13] powerpc/ftrace: Prepare PPC64's ftrace_caller() for
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Topic: [PATCH v2 08/13] powerpc/ftrace: Prepare PPC64's ftrace_caller()
 for CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Index: AQHX9cACt01RUCspvki4igFCqynk8A==
Date: Mon, 20 Dec 2021 16:38:25 +0000
Message-ID: <850817333cc76593699032e8e9a70d8c36e1af1e.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d819a140-1d10-4cff-d2e9-08d9c3d724e9
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB2161544FF53D8072FC1EDF29ED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /lHcZkeKWrHTzjw93/8q0Z9NJVMIySfieR5hxV503U6PEHEmIvULZYVig/iVgNzgW0/h0J6aqrgl5lW/YjmRIT590oA1mYK43rOUX2NuIrbzobzCUtORcmDTEq93fwa5RfEbPH+c5B8LK7O1dutozcLQAr0zvJjXjozXIusLThx5rWX/RULc68H4+WMLP05IKQYOTBV7RKIIis+lnaSFSIio6U8gVpYhuy/KMwOh+qF1ihd2RadRejjrrRvinRT48oxlFFU6AVxzP6WT2j88oMzLplxv5u7HGxmvyXyJPuvndJCErM5bOiW+enRGX51/aII4RSv9BCpLkarnSNP17SsIc+DM06qXzEc7DwYZV3HiEf91Qn7FTrjk2GLUf6mzrv9fY8Q+knEzbi2UXwcqoGh9TmQQgyll92D176csCW2WLHMmrahqT56L3gV74es/bUBOYmIJ2hkciTV4raqMzn49kbSTCWramC4uEHI9p6k9jyXOf2EBMymYbsoszf0g8gLHFRGxn693zQ1yCWqQJWuWBB+IyGwVu+bw/Brg7LudUPpYznviad1FJjpqAmf7KuEs4MMa/5FNdV+WPh36KTN37Qlswxyyr+G8/Yv0ATjko77FLZlVDBHKk69ASs9SC8jAO9JdwdSAKFLB0Ml6NBjbK9JJXQJGzZnp5Tt0fQNeNccOjraFH0CRmrq9mKQjZa/x2GqrR+OGsVUkR+jq9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6506007)(508600001)(83380400001)(86362001)(2616005)(8676002)(71200400001)(4326008)(6512007)(36756003)(54906003)(122000001)(8936002)(110136005)(44832011)(26005)(316002)(6486002)(186003)(64756008)(66946007)(66446008)(2906002)(38100700002)(38070700005)(7416002)(76116006)(66556008)(66476007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vIGJpk8xAeqSDRI3NAwOyJEZuPWX6g+rmgBeyMLCa9tUGfjpjAPelO6ojp?=
 =?iso-8859-1?Q?wbbJr2j21ybWD8PbOe9m2kmTYJd/VYrMfHp/9z3n+WmAw3Ykp4bdv6Yeom?=
 =?iso-8859-1?Q?OlrokVr8LXGMwAs9s5gBo5p9xrraWXUWBEnwJ6hYqr61eEre6R88N0tEX2?=
 =?iso-8859-1?Q?3F7TlL0//DKlp3ENFF7BgVirKPkbA8j9W89S0lDiS5NB/Bj3Vbep+ESru9?=
 =?iso-8859-1?Q?kpch2mMGDyrqjKQGGAq/7hgmanjlAET38GTAXiRutpHNwCnprueme2YyVD?=
 =?iso-8859-1?Q?mjkaBtDXg3HahQM8qg53q3//wrItKeRVRz/YeZ/wz7eyRbJER0E95q7rYn?=
 =?iso-8859-1?Q?gPTVnKoT+AhyjjiF56K0eCNUDHB9uQu8PHoYpNXmjkBbMlElKZTS4cJLXl?=
 =?iso-8859-1?Q?qDUL+SZjH+Cl3rQoSoz3YAdsMHLY4vYZFF1hZAKz6s0A593hBKEQStobfU?=
 =?iso-8859-1?Q?X4CxRTbiyUKbQ2GSxunVY8U1G0+IoxyK4xUe5G4T2dw2ABRzVtA81ttFbQ?=
 =?iso-8859-1?Q?mN8GP8GZ1BfPXrQuW2vc2AAM27ZgRtzMsJyZMdmuFz+DBuUSFR4IyK7kg3?=
 =?iso-8859-1?Q?E8FoM4B+INaJVYQJoZJL/RBqh/3CRl+lTN/PfM7RVVjVtWv5Ez4zQjP5dI?=
 =?iso-8859-1?Q?RID4TynkKRBiNBbUEjyNuGVnlauR5WgCVKfoVa8xpjNl6T8AN6ccbR3TIP?=
 =?iso-8859-1?Q?cbD4qr7bKbpi7/9vFY25zOerFWDOm8NgtJhcRRbQFa9DSD98V9oy73NWUv?=
 =?iso-8859-1?Q?WlYiyiAKKtOf/Qie9FfYNtKAyOCEwiaH/iOhdE5j8qRGp8IK+6mSDo8lwd?=
 =?iso-8859-1?Q?I5vZCrCavsWgvNQEps9O2GNjleCp3gwp74xXfn6S2O7zc/4vzR5UQi3ov3?=
 =?iso-8859-1?Q?3tAayQwMpth2uIKOx74nr0i8pQ86tdQoV1txjz++E4hKBscQokEtW/t/YQ?=
 =?iso-8859-1?Q?q8jfGpyN11mTMlS3CPmrXtVXflnGR/LVjcm/K9AA5RWCHwQ9NG/TESPjYz?=
 =?iso-8859-1?Q?uqIACjlxaCA/3F3PY20cIjmQQbQPMqRmLGepRequ+ix1sl5e0XGJIruQTc?=
 =?iso-8859-1?Q?dZiNVIcNNMij0X3S0Jh3yXZ6Atuq/27HiVr5MWqGqDVBwMevv0Z7/jMG7q?=
 =?iso-8859-1?Q?ye9wDDU07zTZ4412fLe6fSnmOJijI7UND4inQ0k94RXL4CQCV8AK9Y3QNe?=
 =?iso-8859-1?Q?iDbjZc5rm8D85lTV5tBwP+btiWWh8Ycikq/pk7rMi4T/p9HIdAhW5LxaJ/?=
 =?iso-8859-1?Q?I4vYPLi5GfGq0pjsKPNG6FK2I6DpLmLkl/fMxb4qPDdqZahfvPS3BkEkGK?=
 =?iso-8859-1?Q?oEV+ORRou2b2XWLoYGCTqwMF3K42zGCAHtJcEFF3lQetpCY8UWnVhO5LnK?=
 =?iso-8859-1?Q?5qyIFQ4GG6gNO8qxV4diLHnkCmCDm18oTW46sTc7+2EWNVUd868hOfp7oe?=
 =?iso-8859-1?Q?CGcX4qxMcscXPzMrMizPqoUWQ6M+/MINHxYaJlT9y4VXijqHe85WQp0aay?=
 =?iso-8859-1?Q?APwPPpZL1xVpNBMmYQ61EyTpht1abMKkmeSP2rJ3vzqOLpiQP5qVm3ujsJ?=
 =?iso-8859-1?Q?zVE5dhD1AH6YJ8RZgaVYcZpmn2iMVzlmz6FJ+3vu8ZbqdqYzC6TDEaeNZ8?=
 =?iso-8859-1?Q?hfdEGB7l69EyO7CedO1Fg3wAbLdZNlGvI6gAy+TwAuKhdCZTGxM4RIHmKo?=
 =?iso-8859-1?Q?vCAbTltJ8Bds9tXFhPuDR8qH1izjTribsCt/g2/29uQA+bui/yahwovELD?=
 =?iso-8859-1?Q?kIhRNoxuXp4IXHY6WSsD5QrBw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d819a140-1d10-4cff-d2e9-08d9c3d724e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:25.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6amDrLrHoIZS+eGHRs7sQ8Jd/QlRfTVAZF4Dki45NN+a/ibA+u9AyyD0Xy2DUE7Vj9gSsWXKdGxQsckGcvj3fFxvLMtD4gXkHmJFYhINMqM=
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

In order to implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS, change ftrace_caller=
()
to handle LIVEPATCH the same way as frace_caller_regs().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/=
kernel/trace/ftrace_64_mprofile.S
index d636fc755f60..f6f787819273 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -172,14 +172,19 @@ _GLOBAL(ftrace_caller)
 	addi	r3, r3, function_trace_op@toc@l
 	ld	r5, 0(r3)
=20
+#ifdef CONFIG_LIVEPATCH_64
+	SAVE_GPR(14, r1)
+	mr	r14,r7		/* remember old NIP */
+#endif
 	/* Calculate ip from nip-4 into r3 for call below */
 	subi    r3, r7, MCOUNT_INSN_SIZE
=20
 	/* Put the original return address in r4 as parent_ip */
+	std	r0, _LINK(r1)
 	mr	r4, r0
=20
-	/* Set pt_regs to NULL */
-	li	r6, 0
+	/* Load &pt_regs in r6 for call below */
+	addi    r6, r1 ,STACK_FRAME_OVERHEAD
=20
 	/* ftrace_call(r3, r4, r5, r6) */
 .globl ftrace_call
@@ -189,6 +194,10 @@ ftrace_call:
=20
 	ld	r3, _NIP(r1)
 	mtctr	r3
+#ifdef CONFIG_LIVEPATCH_64
+	cmpd	r14, r3		/* has NIP been altered? */
+	REST_GPR(14, r1)
+#endif
=20
 	/* Restore gprs */
 	REST_GPRS(3, 10, r1)
@@ -196,13 +205,17 @@ ftrace_call:
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
=20
+	/* Restore possibly modified LR */
+	ld	r0, _LINK(r1)
+	mtlr	r0
+
 	/* Pop our stack frame */
 	addi	r1, r1, SWITCH_FRAME_SIZE
=20
-	/* Reload original LR */
-	ld	r0, LRSAVE(r1)
-	mtlr	r0
-
+#ifdef CONFIG_LIVEPATCH_64
+        /* Based on the cmpd above, if the NIP was altered handle livepatc=
h */
+	bne-	livepatch_handler
+#endif
 	/* Handle function_graph or go back */
 	b	ftrace_caller_common
=20
--=20
2.33.1
