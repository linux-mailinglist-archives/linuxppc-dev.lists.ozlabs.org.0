Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169247B16F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlkS2q2sz2ywH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:42:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldg0hWCz307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIEkOdmvi+tMk7E5qXfo4NvcyfRKNf7lD7H38mCWmITPD7hWIlQPwrF/MIC3qGFzAy2IwfZ04BkRBLq45hYrKKnf6t/rja3CuNl83W0JuNhdjntnT735+8UxqB3pwna1c0aBFZtnVWAT00j+PVEBtNThSy5PnAuSLVyLdM9Yx+ukNsduEeTunpAXy2TeQb+tGj/jHkjAES9D7AllP1vgoaegSvwbe6h/UotnXEAiNsCntgqYxI2DcknpPalNCpwLVxXejcHVYE6ddHghZ+opLd6NqbpvoLImrFRAI8XcBc9UDm+tDEWpkssEpFe5vyFZP105PPadxfahVDo0XRLvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64tEcR99sWdNnfbkyRKYpT7uG0hgGKM6Y5ExkSuSGPI=;
 b=UuZlnQ4rP7haM1NBm4Whx6wxQjlIzeGuOiA340vTnseY9z2D50Ygk+9vIrE7y6rhWxxTDasWDlGo+DSMhzhgOJk8YVNyODR/WiLI6az9iKmhOfGcR8YwDDp+87PYdT4hWqKBSTgUvEFN/upLK3Et2gA1xZFhz9pi80RhBDwPK5+SpKJn/506SBe3QYfhslnwN0j0ZM1mK+HnC/Qn9wcZxRmhnPTHhGBET8CYaFHvxBiU081D5FY/UcuWHGt50SFr+/FeJxBSEthZiqfVbkn6AAC1o2G4ABkqeawdA05EjuzhczWLMRkxNV+5wP0SUcDZRRVWRublTHoziiAaw2yL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Topic: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Index: AQHX9cAEWTCD8cHnLE+YV5TEx6NNVg==
Date: Mon, 20 Dec 2021 16:38:28 +0000
Message-ID: <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca5a6680-ab6c-4e48-5883-08d9c3d726aa
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB21618C110683FF8594FECAC4ED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ye8CUmNd2lveU3NS3fLGfJr5fKUuJjXDf6XHtarEDTzqwqpVwrmhAtnG+hyQgy7s3s1uJpZgKGsUsiWU83TID+y0q9ShZt8NYelCzlqF7aBYvtko0iBy/dqXR877lYDmYWsEI30AvDayg5Ug4vnnGw2CjW2a6br/PfOrtQQ3R29zsPTwtlMg1Z0T768E3ieXRqoWXOGHS8njKo1JPDyRepBZDlRFtc9woMmFn8NwhVzMUYunbZ4EC4Ytrb6srOsJQ2f4CNvMbb5gi8lSuLKKdDtHVVBkDZHGQKl3Nn5pDhR64e7d+JRQsIY0/TXrItXn7xPJZlKoS5/SX1KJu2gyTRJ/jZLyv49B7nSQpS1D60Z+2hl1Gx3N/T4ktGDHsq6lz3NE7u5UXGZ9wzbcbFXOdUiuNmJSv69nzuUrAUej20tziDrIM+8EvdDehGez28QqXNsQiBj93M5qgiu5wdBOg3DGiXXN1Ejw3kmbvvAplpOU/IgbavqpDolgMDuaCqn2L7EGzqggCeRNU7+R3itSGyqPFkY5ePQg3T1fANUH10PuOALjAVLt/tysw2rJ9H0th1xDfyK2TIoTGOknQWRpA+mZT9NO6Gxz1JjF0u3D3dGMuMjKp0yLu5YfwvOZsCM9vD4BNPXnH7qtcxykcstXYxlczmpkwYY51sg2zinAIHxhH4EF+Z3eY+JvPtMctySJo1gvZm9DXV9g5N0HzyIHMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6506007)(508600001)(83380400001)(86362001)(2616005)(8676002)(71200400001)(4326008)(6512007)(36756003)(54906003)(122000001)(8936002)(110136005)(44832011)(26005)(316002)(6486002)(186003)(64756008)(66946007)(66446008)(2906002)(38100700002)(38070700005)(7416002)(76116006)(66556008)(66476007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?u+h1DKg03mn3h8dyvag2mL1q4w3+lFf7RRyjim/eBFO1S9ZQwtqDIYqkwS?=
 =?iso-8859-1?Q?XLiiD0DiCSj4n2VVP4DVkBFWOewAd2x4J1HOQB93O9bhBzCoRvp6+J/FO6?=
 =?iso-8859-1?Q?gFYs3v0I+LAujJtF9fFoNGm11bG7VQnQyQZb9fXN3VCT3RWwNaiUUaDgGW?=
 =?iso-8859-1?Q?9BIZPkxSk/xMZJrHWmRVs88w0KR6fo4e4SVkvAsWVPTRM5L00y5FM5Bm4c?=
 =?iso-8859-1?Q?qGtWm6QamRoacU5pNX6Oat8CL4Cs/n5J7g7oJ9UUoIGXHJ9EdhWuivMCwM?=
 =?iso-8859-1?Q?smQmx6JfEGLtAAWK8H4UqBqwhD+aRMapRpcrIyscW8pycxi5yqD0HLQVrN?=
 =?iso-8859-1?Q?WQnESZ+vqtULTFV88HWwwncrdDDt5AyG8baDJEld2ynddI3ZL9kYFofGu5?=
 =?iso-8859-1?Q?bNSYjgHDKP/AeQwJ/srCKkxPYqZW2NxWBS3tAc2aYBA/2T5ncTv02FeK+Q?=
 =?iso-8859-1?Q?S7hrvKXw+RO5c0msOlKlboN9u8OsHenJ4ZBiGqRaVrzFJqxwYkUX3XvR/M?=
 =?iso-8859-1?Q?bhsU7DPcOOzhFGUUWg9BXMdlOVxeI67J7gV9CIKydAjsqSZ44kYMSZUXrY?=
 =?iso-8859-1?Q?PKEsUrJni6yZU8oevr50eiJXwnzstcXxcJQi5KuGOvOHLwKL2bvD7jcuwJ?=
 =?iso-8859-1?Q?GcKRxYGXsioFrAKz1TEnC8zVscTbaHGDV3ZrzcBT8cN3ZjGTo+YKyt38vc?=
 =?iso-8859-1?Q?/fEpWJxoMYu8chp8T8z86n9HF22suwQybnCyNA8SGx/MrR5aZpubjRgkqP?=
 =?iso-8859-1?Q?NP4bRk8pw43kzjVqXsFrEiac8FZJpRSoNgXPQc/kYi9AqvDTKO7HorfTpx?=
 =?iso-8859-1?Q?Tp0AOQgrdKBYlAJQx62G1jtt89kcSFEIoFYmG+AKK6rRXJ4P8sdbj8/FcH?=
 =?iso-8859-1?Q?eMTFG99/MBB0VWJEOibKECfnkv3EOIiGQjb/SGIyIBK0owKxQymUFrF3Az?=
 =?iso-8859-1?Q?itg4MpAzFss2CtmV61WQe9Filla8Zoo18Bw6586vjKkxYXNzbpzk0fUMHj?=
 =?iso-8859-1?Q?626DDBpGCKDLRTcP+KTIJOHBMXN/k/73Pzvd1Xp3/jz0rNKNSRRFNNwk8c?=
 =?iso-8859-1?Q?Q0IxZ/B5+ElfmG9Pl+Lviyo8IjznS5ZcT/4hDtEGh+ygMIcv3AbsTwUV2+?=
 =?iso-8859-1?Q?nYtDLmDLSdQkumxftK83bmEu7PCMWo17EJVHZU0h8vtxyCbvva3ymMtP7Z?=
 =?iso-8859-1?Q?TNPjRymAw6N7u6vQ1F0w09tkDmU4dIQGBU2G0wHlAVa5sBXL2LCWTRszCp?=
 =?iso-8859-1?Q?lBgzhnwjDlXKlvsE8cHMPwWPDdpSJ4SpbPeLPlVRx1P8B+8U/0oBhMVrgT?=
 =?iso-8859-1?Q?WGCrLrV/v57kwA7G9ycVLD7OiDccp6BFD6t6E36WJE02kpcPlWr04q1Iov?=
 =?iso-8859-1?Q?VH4hsVccnLSxCmviY4fUD79WqDsXYiZKhtYAWFx+NqB5D8ezyZd80e4P00?=
 =?iso-8859-1?Q?FNDynCl9Uwh7/X6RQwyI1PsZqFcy2JatvL1dW6KCRH4T6EbNCIgQA32tME?=
 =?iso-8859-1?Q?2PV44SzzHHIi1rf5rvywq7BXaUEruggUBGn2AEbyAJUvvf60nqBP80vMm0?=
 =?iso-8859-1?Q?+/ffF/3oWFOY7uf+9oedBGDyVUnPHiXbSbrIElHH/4+u/9h+8fqpSRU36A?=
 =?iso-8859-1?Q?qJHDqtfpfCzckz3uSgwDYDj9nnACgUg50GsJERzk7VNHb7/JCo35Pzw8+d?=
 =?iso-8859-1?Q?++hkYtaqTJQjTjqS2Vj5V+8TDrD/6rIA6RbQM1g2sqDxCHqTcLjxinehe8?=
 =?iso-8859-1?Q?/Acr6scwZm59ynceWgS0e5WwA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5a6680-ab6c-4e48-5883-08d9c3d726aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:28.3093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VROQGSk8qPPxs42WBYxXsoyahGwSeOfCj6P+klKhEqPNKtVrrS88A4iwgC9H3oYTeYBfyQcOwR6mQHPJ4a204vksu5+zo9xiEgqsJz9tPq0=
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

Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS. It accelerates the call
of livepatching.

Also note that powerpc being the last one to convert to
CONFIG_DYNAMIC_FTRACE_WITH_ARGS, it will now be possible to remove
klp_arch_set_pc() on all architectures.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                 |  1 +
 arch/powerpc/include/asm/ftrace.h    | 17 +++++++++++++++++
 arch/powerpc/include/asm/livepatch.h |  4 +---
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cdac2115eb00..e2b1792b2aae 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -210,6 +210,7 @@ config PPC
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_C=
PU)
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index b3f6184f77ea..45c3d6f11daa 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -22,6 +22,23 @@ static inline unsigned long ftrace_call_adjust(unsigned =
long addr)
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+struct ftrace_regs {
+	struct pt_regs regs;
+};
+
+static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_=
regs *fregs)
+{
+	return &fregs->regs;
+}
+
+static __always_inline void ftrace_instruction_pointer_set(struct ftrace_r=
egs *fregs,
+							   unsigned long ip)
+{
+	regs_set_return_ip(&fregs->regs, ip);
+}
+#endif
 #endif /* __ASSEMBLY__ */
=20
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/as=
m/livepatch.h
index 37af961eb74c..6f10de6af6e3 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -14,9 +14,7 @@
 #ifdef CONFIG_LIVEPATCH
 static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned lon=
g ip)
 {
-	struct pt_regs *regs =3D ftrace_get_regs(fregs);
-
-	regs_set_return_ip(regs, ip);
+	ftrace_instruction_pointer_set(fregs, ip);
 }
=20
 #define klp_get_ftrace_location klp_get_ftrace_location
--=20
2.33.1
