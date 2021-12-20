Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB147B175
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:44:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlmC3zTKz3fLq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:44:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHlf636yFz3bWq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMCgw7vV2rV/NPz5gfMDPB0+GtG8dXq6VoEQxN1E9XFUKIGPYYnLLTdbe0bSPfmhaexoSCngmf2tSLRwY6KdcEiDJUXX7A0NIAQCu5rlXiUMwkkAkIkYHYjZfX+J0N/NpvqVoTJgEVinRbOQN5UvHxEB/rdHcf9IQImNMe4xcriXm6sAPEeZhHCKHOWe9QboCCFBKEZ/I58b50EYF9oVYOG+0Ya+na0R8nsjhB5gAABkMpdM/4ncErPuWokkN0KsGpmwTJCJpNlKjvpovIJbXNnratTQKJf8BsXHY6lmFfdrFD32Q27nkf0UmfGpq5ppvvrv4+AoB8wyE5pT276/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlGFhRpivJRsxXv2BEZDItnzJ01x1b5FeBM7AfdVvTc=;
 b=fLJ8zBDfhbws9XS2KbIwLCKAbDuiKrgVINr5ln3jypckVVy84oHg7nlFTUnU6l0qekBkhqCxZkF3l/wEddgyIb1k8PrnbU8aEH+L/lZ8/cAfSZNjxU3Tx5Md9RejFyoWo5HlDGwo8sZ0A+WX1QVLJrV688nfxy4glm8VV+NcsWzpUxEC+qH3BfAr1V43ZKUFu6I9EOq0e0jHNFicZbyYuHEgNc+86IfpzrbF3BE1MK0xgzhKgi9D/cyyoCP3o8OowPq3jh2QKmSRRTgrwb1+TpkQtFCd27cQesXnagofwLJfMCWT8vHM8FNL7V9fSP3L+5wDUbKp9Nytcl2K5zqRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 11/13] powerpc/ftrace: directly call of function graph
 tracer by ftrace caller
Thread-Topic: [PATCH v2 11/13] powerpc/ftrace: directly call of function graph
 tracer by ftrace caller
Thread-Index: AQHX9cAIYX+LNsRWi0aNGk8rp1sgmA==
Date: Mon, 20 Dec 2021 16:38:35 +0000
Message-ID: <04d196585ff81bde06a000bd9c633a33a5b21130.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e09557a-c4ed-4500-b27e-08d9c3d72ae9
x-ms-traffictypediagnostic: MRZP264MB2924:EE_
x-microsoft-antispam-prvs: <MRZP264MB29240DB4ADA9E93D85DD4568ED7B9@MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6bNLk8X2jlTp0lIOu7OyL+c++Zjb+30OddoMDlZkHBR9tjFB3WauAfZ94V1Jd15xOu/Hdz4lX/f4LvSd7l2VSF1h9wcIsKctfdRl/lpD7T9PyLPZhcO46yfQ4mCPqyag+sp13m1ygTErpRNm8jKR/GkINx5aj6zW3gmeG6yM+GThl1d6oIu7LVK5Y/bZdmzJ/W8ERJt/E8N9ZwX4JQhuSI6pnlB/zi4XjGRCd9mdoIvty0QassGkmjo2T7vHMcEwKW15IMidqW5ZtQQFb8OlJqRfZ5NPtQNoL6coobpxfcznElALEMQFAjB6zKsjslGMyEBA6Q1tVvTtUBml+DRRqFSXPrGiDnjpehahYDY9YMdvVy7SX6FUVp5BYx9AM0RmF9Q2ZHmEsaW3TSbnflomaJIFQTiaYmbLj30h+elZTOE+TYHwVADDZaDsA3V894LNk0Ss168Aziw7jy9fxqoKj+F4FC6+z9scbDZgeZUxmrukEQBTuuA29gLZq3oaoJFZqRzuWLfyXY4IQUZTwBWRUVJ+01LMcHCDLYMizl+ER1ai69BNOw8LWE21Ernn0x0wc9nmUUvTELWGAFoON5lvi1DJAIbdSvOzEnvayUXQJhcfniKNkw57ig57K6r40QUdgvItaabFZSQ0wqaSNqAn36K9UuxbuJNt4auAljYbSuTsVhPetZLAFEMEmKfzgWfPU4B8vHLiyxUz8pOg3OCBBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(4326008)(86362001)(76116006)(6506007)(91956017)(316002)(36756003)(38070700005)(110136005)(71200400001)(83380400001)(7416002)(2906002)(44832011)(2616005)(5660300002)(6512007)(66476007)(8676002)(8936002)(64756008)(38100700002)(66446008)(122000001)(66946007)(6486002)(66556008)(186003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pXQMe5jBQv0IMpcDGcune8VzCNxK0eet7tX43Wohv0NmGKLfxKwJD8HT79?=
 =?iso-8859-1?Q?Zi+CPfPIMpmrsGONJh5ANzneFAIUKDQH3FVRr3E+lMWSdZhCmmr96OT/Dx?=
 =?iso-8859-1?Q?iOBlJu5hhJR8DxJJO3zrNbe+IoVHxVABaHXnFNTpOO3svNbBJkE2R1CTNd?=
 =?iso-8859-1?Q?i8E8HVxN8hgXZtK2ykq7cOJkr0jyRg5zEISEHGjZj+V2CcE7W3v1rqbyms?=
 =?iso-8859-1?Q?G0cC37z4kpaFCxccbaILYX8OAR7xlzjruNer7gxKP1wl1e49dArkd2io4W?=
 =?iso-8859-1?Q?TYf3RDpwrplrsS3aPYTkFUJcvsSyo3JaqcKPK6V1A1QlyVrlGUpl1fxo6U?=
 =?iso-8859-1?Q?/C8wPa5c1Rf9b6rVfmfvqCt6bvVBWfPfVFSfaPwK2RYvuD+6aV2K910tHA?=
 =?iso-8859-1?Q?QJp5fRdDLg6jlxSzZFWz9lnvw7QVlJUvZ1ZigqHSOsYFHPP6jkknerBGWo?=
 =?iso-8859-1?Q?XN/RqMd5CCMo4AD1WxO9cQ0uMbIO/u8t3enCEtQzpJ7uYiHKYVwCg/lacy?=
 =?iso-8859-1?Q?t6YqJyv543XLNgptJ0Ao9Xy2si2dzvKLOkf8gVwwi04i7kKEKckbGWuEeF?=
 =?iso-8859-1?Q?oHKm1kqIwUFFdJ6dEs+QS9AiOTi3P50+Sps+0w5RcsxOys15RoXrUr9MuS?=
 =?iso-8859-1?Q?pnX/DrXLtTyNMstbA8QiZ1Z60rGXO6n0HcxtC8xrlEcjU/akMEuDtJBrhG?=
 =?iso-8859-1?Q?InrDD//Yov6SeuuDNGG428Q6hqziuvDBQ7H+62129PkdDKdtjeEb36wGlt?=
 =?iso-8859-1?Q?VT6/UqJlwGQWPIwsvT3fXkSWPiDv2Ni+0dOQf5hODJwEQ+Y5KHksYX7UjO?=
 =?iso-8859-1?Q?L7EagBJogw0QpopE1IkLkssmmna5GJU5MP2hBaa+7C8Jq0GUA9d4KyiuGP?=
 =?iso-8859-1?Q?l2miyrMi7SbWOg/PLoYeikT3P91PM63vBafSkO3J5Jh/4PYamrDgAhlbCg?=
 =?iso-8859-1?Q?Vht1X5BB4JtOUry9SJluXRr0SHWZQCcxMNgXeSej1e40J4dJ5zmZ9aPr46?=
 =?iso-8859-1?Q?sv35k1ytHwhMs0wG6QvHo4xICZnYSqgzkKfhAHEbyFd7jkyV2YmAT/BObI?=
 =?iso-8859-1?Q?/fQP5vOvRQkoKPUUNASbgE6GBanOCUfNPjmTuGA8w9U264kWx0ee6+3PFy?=
 =?iso-8859-1?Q?FBDSkJGl7HHJM6qdc9ANCpx3iGSuo9B0Ohk4B4hQvTEf8ofBYVw0YG9xCY?=
 =?iso-8859-1?Q?bCch7iNTZv/2Md27TXAM2A6TlNVJtyL60mSmYRq7GjyhNMoBU2XShzv1Ih?=
 =?iso-8859-1?Q?okx16UhNiH33nJlLahUHN17+hF/+ia0QJ8jisPxl7NItPemS8oaASi5eSi?=
 =?iso-8859-1?Q?3VY3JhxCXyqA5htbUQNQ0fkyOpuxo/2/JmSTn5EmdO9XW7pZpPrc3+w2Al?=
 =?iso-8859-1?Q?XgvimStDRT4RAuwyghyNSv3u1m9iYSqnW8nq5c3t5JOJqpu4jM2eoV3stb?=
 =?iso-8859-1?Q?fd3o33DDJ4FXAJZSjTTHOQwzpSBDF1KL4CfifZtUDB4lsZxB6EKR9x1qO+?=
 =?iso-8859-1?Q?b+2ySVgnP8499HspQMlCK807Vfx3GU9GbOzFnPTRzShUgRpE5hCUyrUcns?=
 =?iso-8859-1?Q?MEZIDE6kOHiFVOmkw5+OIfdlb2DO144laZ63Q/HVbp0eJ8GNOe9JUDZrZg?=
 =?iso-8859-1?Q?l3K1OFQ+/iyCo+oC4f9AWJOmUGv+qeBcc5WkJJEgfJetX3WEMv84vpXTQa?=
 =?iso-8859-1?Q?pORSMwQ2/AsMdXar4ZvsWqBoKNMZILpCB/ofNItYpEEVGo9PZ8QLc8qx9r?=
 =?iso-8859-1?Q?qLNtxJb/SgvAJRBEl3vDbunUc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e09557a-c4ed-4500-b27e-08d9c3d72ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:35.4198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2ph3MOnicgFAwEOXNkkVrIkDKKATlyF2saK+v2xDxEDD3AKsqzMs00YOas9Pgbq9DOw+11ozptzWFcYNmAM8ee+EeovFxjA8zpfzEXZJ4o=
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

Modify function graph tracer to be handled directly by the standard
ftrace caller.

This is made possible as powerpc now supports
CONFIG_DYNAMIC_FTRACE_WITH_ARGS.

This change simplifies the call of function graph ftrace.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ftrace.h             |  6 ++
 arch/powerpc/kernel/trace/ftrace.c            | 11 ++++
 arch/powerpc/kernel/trace/ftrace_32.S         | 53 +--------------
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 64 +------------------
 4 files changed, 20 insertions(+), 114 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index 45c3d6f11daa..70b457097098 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -38,6 +38,12 @@ static __always_inline void ftrace_instruction_pointer_s=
et(struct ftrace_regs *f
 {
 	regs_set_return_ip(&fregs->regs, ip);
 }
+
+struct ftrace_ops;
+
+#define ftrace_graph_func ftrace_graph_func
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs);
 #endif
 #endif /* __ASSEMBLY__ */
=20
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index ce673764cb69..74a176e394ef 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -917,6 +917,9 @@ static int ftrace_modify_ftrace_graph_caller(bool enabl=
e)
 	unsigned long stub =3D (unsigned long)(&ftrace_graph_stub);
 	ppc_inst_t old, new;
=20
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_ARGS))
+		return 0;
+
 	old =3D ftrace_call_replace(ip, enable ? stub : addr, 0);
 	new =3D ftrace_call_replace(ip, enable ? addr : stub, 0);
=20
@@ -955,6 +958,14 @@ unsigned long prepare_ftrace_return(unsigned long pare=
nt, unsigned long ip,
 out:
 	return parent;
 }
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
+		       struct ftrace_ops *op, struct ftrace_regs *fregs)
+{
+	fregs->regs.link =3D prepare_ftrace_return(parent_ip, ip, fregs->regs.gpr=
[1]);
+}
+#endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
=20
 #ifdef PPC64_ELF_ABI_v1
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/tr=
ace/ftrace_32.S
index c4055b41af5f..2b425da97a6b 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -59,13 +59,6 @@ ftrace_call:
 	mtlr	r0
=20
 	addi	r1, r1, INT_FRAME_SIZE
-ftrace_caller_common:
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-.globl ftrace_graph_call
-ftrace_graph_call:
-	b	ftrace_graph_stub
-_GLOBAL(ftrace_graph_stub)
-#endif
 	/* old link register ends up in ctr reg */
 	bctr
=20
@@ -135,52 +128,10 @@ ftrace_regs_call:
=20
 	/* Pop our stack frame */
 	addi r1, r1, INT_FRAME_SIZE
-
-	b	ftrace_caller_common
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-_GLOBAL(ftrace_graph_caller)
-	stwu	r1,-48(r1)
-	stw	r3, 12(r1)
-	stw	r4, 16(r1)
-	stw	r5, 20(r1)
-	stw	r6, 24(r1)
-	stw	r7, 28(r1)
-	stw	r8, 32(r1)
-	stw	r9, 36(r1)
-	stw	r10,40(r1)
-
-	addi	r5, r1, 48
-	mfctr	r4		/* ftrace_caller has moved local addr here */
-	stw	r4, 44(r1)
-	mflr	r3		/* ftrace_caller has restored LR from stack */
-	subi	r4, r4, MCOUNT_INSN_SIZE
-
-	bl	prepare_ftrace_return
-	nop
-
-        /*
-         * prepare_ftrace_return gives us the address we divert to.
-         * Change the LR in the callers stack frame to this.
-         */
-	stw	r3,52(r1)
-	mtlr	r3
-	lwz	r0,44(r1)
-	mtctr	r0
-
-	lwz	r3, 12(r1)
-	lwz	r4, 16(r1)
-	lwz	r5, 20(r1)
-	lwz	r6, 24(r1)
-	lwz	r7, 28(r1)
-	lwz	r8, 32(r1)
-	lwz	r9, 36(r1)
-	lwz	r10,40(r1)
-
-	addi	r1, r1, 48
-
+	/* old link register ends up in ctr reg */
 	bctr
=20
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(return_to_handler)
 	/* need to save return values */
 	stwu	r1, -16(r1)
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/=
kernel/trace/ftrace_64_mprofile.S
index f6f787819273..6071e0122797 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -124,15 +124,6 @@ ftrace_regs_call:
         /* Based on the cmpd above, if the NIP was altered handle livepatc=
h */
 	bne-	livepatch_handler
 #endif
-
-ftrace_caller_common:
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-.globl ftrace_graph_call
-ftrace_graph_call:
-	b	ftrace_graph_stub
-_GLOBAL(ftrace_graph_stub)
-#endif
-
 	bctr			/* jump after _mcount site */
=20
 _GLOBAL(ftrace_stub)
@@ -216,8 +207,7 @@ ftrace_call:
         /* Based on the cmpd above, if the NIP was altered handle livepatc=
h */
 	bne-	livepatch_handler
 #endif
-	/* Handle function_graph or go back */
-	b	ftrace_caller_common
+	bctr			/* jump after _mcount site */
=20
 #ifdef CONFIG_LIVEPATCH
 	/*
@@ -286,55 +276,3 @@ livepatch_handler:
 	/* Return to original caller of live patched function */
 	blr
 #endif /* CONFIG_LIVEPATCH */
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-_GLOBAL(ftrace_graph_caller)
-	stdu	r1, -112(r1)
-	/* with -mprofile-kernel, parameter regs are still alive at _mcount */
-	std	r10, 104(r1)
-	std	r9, 96(r1)
-	std	r8, 88(r1)
-	std	r7, 80(r1)
-	std	r6, 72(r1)
-	std	r5, 64(r1)
-	std	r4, 56(r1)
-	std	r3, 48(r1)
-
-	/* Save callee's TOC in the ABI compliant location */
-	std	r2, 24(r1)
-	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
-
-	addi	r5, r1, 112
-	mfctr	r4		/* ftrace_caller has moved local addr here */
-	std	r4, 40(r1)
-	mflr	r3		/* ftrace_caller has restored LR from stack */
-	subi	r4, r4, MCOUNT_INSN_SIZE
-
-	bl	prepare_ftrace_return
-	nop
-
-	/*
-	 * prepare_ftrace_return gives us the address we divert to.
-	 * Change the LR to this.
-	 */
-	mtlr	r3
-
-	ld	r0, 40(r1)
-	mtctr	r0
-	ld	r10, 104(r1)
-	ld	r9, 96(r1)
-	ld	r8, 88(r1)
-	ld	r7, 80(r1)
-	ld	r6, 72(r1)
-	ld	r5, 64(r1)
-	ld	r4, 56(r1)
-	ld	r3, 48(r1)
-
-	/* Restore callee's TOC */
-	ld	r2, 24(r1)
-
-	addi	r1, r1, 112
-	mflr	r0
-	std	r0, LRSAVE(r1)
-	bctr
-#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
--=20
2.33.1
