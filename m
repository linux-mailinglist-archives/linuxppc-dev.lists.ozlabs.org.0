Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F382C47B173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHllf6tzyz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldk2z7nz2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdPOLxaL2nGuGIxK4L/+YKNO8vFjyUooS7uXA8gnjXb5rv+gNpUFEVdlrSZF35bMEsZevFbQkKgVXijhbsSPaLAX99qgktNailpY5S82Z80mzYVzVVRoP1b5Gc7aTjEFkrgtM3dIasQIu1TxKEAVq5De9UyDPCDi4wM/SRpK+XXPWd2KeO/Qu5sA/zTo+Pg8N5XjiOLJUkCkU97ieqzEJFjcdyIVa5GZuPLXmLGuW02PDHNbQADrj3ySVWa2Rr3FrIS17S4M70YLwSLD9e5AdqdeBCbNv8P5XlD+Ks5gj+rLccOw+Y6vZnRAKTw0yqtFNDExSCB/wJ/fj1Zm+sPPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VnYTnU4UZib71s8A1qbE2QTy4FztFa9DLNZTJoEOz4=;
 b=GZnHA9kfZ6FBc/3K51Bo/45hekL9kLefOjjiWh3+0/Ya1vzlUbEDLZa8oeYKtATDzROespJBxbVZ6kBdHG01OxDH40NkIB4orpmiEo5MSOPTQMBcYTaFWRCo1ZNKvy59E0KZnx+0C8eJpKWiTS6yC8XgbStQibQ2zl0tci681aFMLMfVo55KU12CHBNFljUjmGGbg5UqdTql9588iEn2hUwTnDkXrPfdB7DRSgIE2y65zeIQ4GQqx7U42tzzl09Xk8Le4uPPV/p3J+m8zTOZdTuAKUwTOaSTQOOY2HolRGMqg24ujxzqnNfw7lYzH/wrNO5huFZn/ysz62Od8yVh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 10/13] powerpc/ftrace: Refactor
 ftrace_{en/dis}able_ftrace_graph_caller
Thread-Topic: [PATCH v2 10/13] powerpc/ftrace: Refactor
 ftrace_{en/dis}able_ftrace_graph_caller
Thread-Index: AQHX9cAGmx9IDhU2XE6F7yRDPjZy2g==
Date: Mon, 20 Dec 2021 16:38:31 +0000
Message-ID: <f37785a531f1a8f201e1b3da45997a5c77e9d820.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dd04941-70d2-4b4e-5a42-08d9c3d7289a
x-ms-traffictypediagnostic: MRZP264MB2924:EE_
x-microsoft-antispam-prvs: <MRZP264MB29246005B908C929FC8E45F9ED7B9@MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:215;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2v28u0WI+BdJN3ivesSUFhVzpNnkhhmqZcRTezxmy3L+JfpBCxx79Jn/Qk6fbl2/pw+jqhxNXDuVRfawKZHkF4mE3SG9A9ZgQ5JWTIvHDSeA/gz2F7jFy8ctHFJw/16z0xs7ESB2cdPU8knUehKuNaaWZcN1V8hEVDG5Lvs6woPMvmjoTCjd1GYqWNK0MNv0A/i9oXyQA45m/DJS5a+aGES4rPtrY6yOSXe47Lk/RZvmDqfjvp5voCEtxEvJhLvFiAR6AB9r1VD7yTgcH9Y8dQxCK6g1LaScaN+AvL2T7c964HH+KJNtJ/rMMVYJXs/qZyTvdClbOmaeNfXoXJvoOF7/xrwG/gsmv7l0MhhOHOR18raBHgJLg3C5XBcpoYQoig9zjubq2qAidct0cqMe/LUwVs5uJH20AbKmGm4ulpJyVs+NRsHQScBo4zfZYlzNH4PYsBfDwk0hZtsPifeTfftn9vsePV5b3vqSpB3uipNVloHvEKuYOUUpuqIDenhrD/Ksf263lnAWtIz3voc8KEYOZQLw2SVo/LM7o97QjYJpNij/tNHql2SeMo0cjkdspNNp82yhomELtC3CKk0SGr+9NcG49j8UW0jQ4Vt7sSJ1ePPo6MnPQO+VfegrJAV7SLjM42IRxk8XU00Posp1dxB4SwdVrdVFqlkbR7u6b7ZcgzykkxK69t9MyaaWJ8hCpMJ98jFNR7OisjG8MR7Pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2616005)(6512007)(7416002)(44832011)(2906002)(83380400001)(6486002)(66946007)(186003)(26005)(66556008)(64756008)(38100700002)(66476007)(8676002)(8936002)(122000001)(66446008)(76116006)(86362001)(91956017)(316002)(6506007)(508600001)(54906003)(4326008)(110136005)(71200400001)(38070700005)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YMulNDEx/s7T3xr/Yzp9JBIZpnkFckNYfgGiSqtnbe1bOvUNRufx6GDmx8?=
 =?iso-8859-1?Q?a1C5g+1SY0k8HgkWlYfNHFGzWDYRQ8rXEVZqLIXFJYXgmRUyyH+2N7J/Cw?=
 =?iso-8859-1?Q?a2/rSvBTF0qhFWPegwxH1H7W+5YsoY2ZivAnjMBB418/RqKrfJhTvudygU?=
 =?iso-8859-1?Q?4SOzaWB90vFEluYqECtcHdAduqcGaEo+qJinY76o2Y6rKt3wx7dPpqMEvA?=
 =?iso-8859-1?Q?xCaThs/w6KHa0vpDjQm5dBXUBwkQccuWhA1+c70SzQgNACbAuXlntAi6mp?=
 =?iso-8859-1?Q?HBJhxq7cTMjhOrwP0fDZVTm1w9ltW0gri06U0MqWjwa0z2Y7m2e3f+lY9w?=
 =?iso-8859-1?Q?yHvOO0a2l3j8AhxRB2HEXF9kWoai+Q/EHqyVuVtgxfyfrth5KOgkblHcnw?=
 =?iso-8859-1?Q?Xk3STvUv1tbpIEGykyIcRbuIeMWJuPmrocg4Wl/7TGJrRX9wMO11bKxygZ?=
 =?iso-8859-1?Q?YjYJxZKr8cfMknnfcGIccr4DzKrAl0pNdQf3TkSmXrnLiZfDnELwJr5AAG?=
 =?iso-8859-1?Q?KOIs3IVKRPeT1EfpzGh2ZC7CyAiDe3WCzXAEXcXN5RpmQw8B5SXco/K8/l?=
 =?iso-8859-1?Q?Pf6Lz3ilifcFB0akLr1QA1ICpCiC2K7kMvUgVSBYSpNehzDYh8obcl04u8?=
 =?iso-8859-1?Q?gcdKfzBEqdvNTdlVayhn/nwUwnVOWcC+qioFx3xHyLoRaHGf5+tMeCS0SJ?=
 =?iso-8859-1?Q?tqJNtHlGmg7w6BpZV1mwHNahnnAiiLUVXUGzgIVMihLfwi6nRDKTW0l5dK?=
 =?iso-8859-1?Q?bL4m3gpzIcN+JqdIZ/5+yLQAh8xth39lHUMBZa/ZqXhfCgHNZhAkUYIz/O?=
 =?iso-8859-1?Q?JGGxhMwv+/9Hv3W71Tcn8K9m4P4Egu6CQko6l1XBXL5g2hQUdA4h0M3Fpo?=
 =?iso-8859-1?Q?twezn5kKlwTQdAga4h5ztoLM/dUjJnpI/6cSBz9bKAkLHPFiZoVXaumnT1?=
 =?iso-8859-1?Q?7V5/vlcRlDJAN9KVnNM0NKz7TJIsibodxQW8ab23ogPjRhVv/rnqVYVhMZ?=
 =?iso-8859-1?Q?SsGQJhnjXj+KnlRrDp3OY4GWser/ExQ2iAQn+N8b8FR3mmkGPUpF2dT1pI?=
 =?iso-8859-1?Q?82E8zb8HAeGFbHiv9JF3y/M/jJd/alGcC6h9uTG4idKXLP0fL3CQbPoEyG?=
 =?iso-8859-1?Q?f5e+aheBGF70eDap6KNQodUMmAYsd6GoI3j/l8wTLb8XrysbRvgMko1E9Y?=
 =?iso-8859-1?Q?b2q40W1G+OvWYT6n6/V7IoLQXFbkGlOLuS6ohZFpohfoxiSHfwj2LBiBiW?=
 =?iso-8859-1?Q?uWj2RpG1hd2wl0auGn8jc9Sg68k1cmypKL4GnNwcEImxnjCpsLiHK8O2pC?=
 =?iso-8859-1?Q?F+5hw484NNXCGknmp6MoNS38qIY4wL+Xa18LLzCGbGZ6nkPs6akEHPSwNx?=
 =?iso-8859-1?Q?Rk6hmM9vqNAIHFLZiJnxPfOftT9lO2OhvYGNp7Utmh1EOn414gdqrfelO+?=
 =?iso-8859-1?Q?f//yMEVYxA6assct7Uk7Z0sukkw7qkLAhhfeCUzimjXFI31p43iMhx81NP?=
 =?iso-8859-1?Q?5x94R0s5pZdtJ69ZuvfDuf/ri8Mx9mEDRUB5PJkm8aa+BMOi3lgGt1bQtD?=
 =?iso-8859-1?Q?rlNOA8XRVyUKeMG5weguvBna2F+O/rLjeu6zhJJtVsiSVv3qk3BxZPURNm?=
 =?iso-8859-1?Q?AMAwBvf/CQAKFP9AbgpdILL2GIFJTqm7ejexta+XqH1v5VTjWuv1BVvOIn?=
 =?iso-8859-1?Q?hSBSDQTx38BqECC6UbCL97Ab1XQ2C63sd5R2ELCfjFPEkuoW1+YaF8d2VH?=
 =?iso-8859-1?Q?/5MoKALSrBl7COYXZObFNP7r8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd04941-70d2-4b4e-5a42-08d9c3d7289a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:31.5756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhhBE1R9yHi3oIEw7owcC0VeH5ui+srYpDgwnH1C+PnLn1kpBbO944LI4UR0TXh4mkXmPCem5n3gUg187TvkFJ99z3NPccxz503coePE3hc=
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

ftrace_enable_ftrace_graph_caller() and
ftrace_disable_ftrace_graph_caller() have common code.

They will have even more common code after following patch.

Refactor into a single ftrace_modify_ftrace_graph_caller() function.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 80b6285769f2..ce673764cb69 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -910,30 +910,27 @@ int __init ftrace_dyn_arch_init(void)
 extern void ftrace_graph_call(void);
 extern void ftrace_graph_stub(void);
=20
-int ftrace_enable_ftrace_graph_caller(void)
+static int ftrace_modify_ftrace_graph_caller(bool enable)
 {
 	unsigned long ip =3D (unsigned long)(&ftrace_graph_call);
 	unsigned long addr =3D (unsigned long)(&ftrace_graph_caller);
 	unsigned long stub =3D (unsigned long)(&ftrace_graph_stub);
 	ppc_inst_t old, new;
=20
-	old =3D ftrace_call_replace(ip, stub, 0);
-	new =3D ftrace_call_replace(ip, addr, 0);
+	old =3D ftrace_call_replace(ip, enable ? stub : addr, 0);
+	new =3D ftrace_call_replace(ip, enable ? addr : stub, 0);
=20
 	return ftrace_modify_code(ip, old, new);
 }
=20
-int ftrace_disable_ftrace_graph_caller(void)
+int ftrace_enable_ftrace_graph_caller(void)
 {
-	unsigned long ip =3D (unsigned long)(&ftrace_graph_call);
-	unsigned long addr =3D (unsigned long)(&ftrace_graph_caller);
-	unsigned long stub =3D (unsigned long)(&ftrace_graph_stub);
-	ppc_inst_t old, new;
-
-	old =3D ftrace_call_replace(ip, addr, 0);
-	new =3D ftrace_call_replace(ip, stub, 0);
+	return ftrace_modify_ftrace_graph_caller(true);
+}
=20
-	return ftrace_modify_code(ip, old, new);
+int ftrace_disable_ftrace_graph_caller(void)
+{
+	return ftrace_modify_ftrace_graph_caller(false);
 }
=20
 /*
--=20
2.33.1
