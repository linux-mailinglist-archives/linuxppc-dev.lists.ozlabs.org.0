Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F347B172
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHll71Vnjz3fCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:43:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldj5Knlz3bj1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAsJFGFbR/hGWxQ9hn3Jyzg4I5hYl11OO/Un484QuMq0p81sGkUDaRv9kNthUhI1cMPKtacgFS26pOY+mcQm94qlgo2Y6+1PLpC4MSuksLznHfEjAiNDL0Ad8slsbqy5zTkGxiDMwpoutBglePA6y1RJdOCe0QaSfQKJoRWjhAclunZheBvXDXAPUbq+b9o0JWHqZWXqOd0lvmU58iVIEup2VaYCa1Q6B7i70VmaKl1R7egI+R3+K0zrX0lBpjgkkUwzArr3K3nBQXNeeHU5NDmlzNvTVY+mvhEWWmdbaXtyRF8RqBCU55PYlm2vzTo4GZF1Btqlj8wfqTCYnxYJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ6UOweLhpPyHW7Ov2ppI5esOA38y9Gtnzd62Q9XXDg=;
 b=oMe8M2TNINBl2sSqfjMk7ljx4Z4CuM6Da3W14SwGh8mvaeg2nH/A6qr5Pg1vlNrCv3nOFsp3ob6wSC2WfK4QEafmtbXcLJqbVDfuCeICXeLyHtN8pDw9P/lbp2ejH/ht/E7j/79oCOFRWI5CuCHyb3YALT0q3Z78vjlNzoq5im3gkiBGz3F99fCb3MhaCZCYVRyXts2JtCmx5I2RUHF3WyXznWfDxnF0G4Mt7hpCjjrFnGELSjNr2DH2vOEvgewLjkb+Ppth9EBKbIvdfa6NuUio6J6tKYeuruKvJd5dDWp6pUXlfiILhKRMih4o06cOVjMRr9IgT3nKe0VL6PJhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 04/13] powerpc/ftrace: Add support for livepatch to PPC32
Thread-Topic: [PATCH v2 04/13] powerpc/ftrace: Add support for livepatch to
 PPC32
Thread-Index: AQHX9b/6eBLNZiqJgUWhrC7ryztVNA==
Date: Mon, 20 Dec 2021 16:38:12 +0000
Message-ID: <63cb094125b6a6038c65eeac2abaabbabe63addd.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2addbaa-6311-4300-5c8d-08d9c3d71d84
x-ms-traffictypediagnostic: MRZP264MB2924:EE_
x-microsoft-antispam-prvs: <MRZP264MB292445A965C3EFEBADB13A50ED7B9@MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IkGsHx6eu98pU5+TtsUf8mWC4FAQJ7dDJmBf+IazsjkjpZWe0Skx1yQ+JwEqa7PrbkTMxc8uHxF53S8BOU70vWjtr6jHf5E14R0E4uGJC6rhBkF8LeSkrxGsFYL0BfqUv837zK7LfWTsHlXvwilXt7HpoIIH9qhhuMy/ovpIOhpbKt1RGgRvnrWrpiO4hLwn6T+lwFtWS8Wtiy6xIA2Zcr/uAA2Il20Oe7I02dRqLep8McWfDAFxhjRKfOceUfahd1Lomcta+XKo41LoQxvjlnVtXR5u7+sGpyhySiuT8B7vq02H1OOsqIHq09saYZW0khKr4FgaTu73RZSQERZK9/PqW5+rR/m9qEEuMNayqu8WdoPdVjNTDWnklO6meeSf4JT7PjGJIDlORTWHsLRMwCB4s+DYcoWH0gp7gmet/Jt2vakCyJRUe2IAVAw6PN0vtQEc2EZ/E3nQ1VqjzRYV/APd51o14memmMUeCwW5/BtXjLzmHtk3Gg9/CqWEvnD5EoJjIBzo0C+HXWDmHFN9Gb3S8ATyuinSC6e2hcRSsB+ICf6+CgDFnUp3gpntHky8x0WCf3sjHnm8GsKskYfBXSunlKwL1V+R5gW+RGGEBg+IgXK/pt+xyVOwLmxOOH40SVAJ7Dzev7XamsAsOnveGqqPTpJbiA1QsFYfv0BGFTwT8CT7th9se7kkNutfq5ssLRbYYTsiRAtImlRcddOsNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2616005)(6512007)(7416002)(44832011)(2906002)(83380400001)(6486002)(66946007)(186003)(26005)(66556008)(64756008)(38100700002)(66476007)(8676002)(8936002)(122000001)(66446008)(76116006)(86362001)(91956017)(316002)(6506007)(508600001)(54906003)(4326008)(110136005)(71200400001)(38070700005)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ka2bGgJtLnZN2CA2CQumpwoG36Uz6X4rVGWGH/o7wbunC3Cdrg6DKHjW62?=
 =?iso-8859-1?Q?ty0UJFEOMdRZ3jnGUTVre22qcivXEOxSi9xLeBg8ULCxXiB3ixOYVoRx2q?=
 =?iso-8859-1?Q?RsjRvIdzf+r7gv5wdcxC3nYKT8+H6gCsB88inejWCPWkehBZjE9Jc+YWLh?=
 =?iso-8859-1?Q?ilm8FiOzwVzsyL41E+xAeTj0jrdlbZImg3EWdQTaLA8kkGVr7mHNHw76kz?=
 =?iso-8859-1?Q?OkH3JWxQGsYYglsurE3caOF0BN9VfTncjB8xl0fUBDYAF3IxI1yw/U5Cy6?=
 =?iso-8859-1?Q?AyqgTNXosy8PX+g5lnGlK18LaD6kZ3o0Eqbsh7/OSsBaLQUUHN4/q+SM4U?=
 =?iso-8859-1?Q?t03NKlIT95QwVzZlTgK2iojOQcqiV+dsP7ellXBwcLJmdE0Rz5BIwjTtAy?=
 =?iso-8859-1?Q?mbiSK3+GlOS80bCjndm2i+94JRRRInCsZZyHt9Zf/KYf7Vcm0tnUCHy5wz?=
 =?iso-8859-1?Q?dKn7RsdVnX3LbAZCP/1T5OinfrCtuzL2rBe2gsxJrHWld1yHLmMb5N8vmE?=
 =?iso-8859-1?Q?joppzb7cJ2a4yY+yGcPZriYYeLeGVI4HSyos0HrRMGFpiNizVLK7njiEdz?=
 =?iso-8859-1?Q?Ik7vhlz1PBjPzCgQnGBk+1/SOHQfcqc/mhMXHco0QinkX7ZgvTLDCisRkC?=
 =?iso-8859-1?Q?KV+ePrxOq1TisePMx810UiiR01nZE+pz9YYfcJunqqg7NJ1NvgLqD0a1qp?=
 =?iso-8859-1?Q?pyLWd5VJEQWBlk8YICaAHxeDWINp/UamSdKcQvkl2aZTxDdSkPWXgo1qZO?=
 =?iso-8859-1?Q?74E1G7JMr7HhKv/Gfujg58RPWoQjU7pkOp7SUJfosGE/I2qCA+b5Q6mjps?=
 =?iso-8859-1?Q?B/W20NEE1Axy49l3eH/h6ug91jYsxb+ZnfCG9qESydD+/ZOTAfDu8R4UdO?=
 =?iso-8859-1?Q?j28OqvS30gSjAFKn0db0pyDjDxJbzL+0F2VtvHmbFFLvnWRhSP3RKzS8le?=
 =?iso-8859-1?Q?XvtphFMK5t9ZO0ZZ5K5ObKk/MZRjkA4Y03ZXR43UIh2KqBGOXzWcqXMv5+?=
 =?iso-8859-1?Q?TJ/IP259W/ETjDN0wIih2l9TQsQA1OIfiCFdjkKg4fsEyV5xGHApQnZUGx?=
 =?iso-8859-1?Q?hchz9+ssCu/nA27a9iZ+4pMH/kGqrna2+2W1ypzUnKzfnd9ElitXs8SSby?=
 =?iso-8859-1?Q?cb+L0RUQwi/C9clhMxJyFnWpLOM2M1OJbPucedYV+3Qivh8Dy47SYCkTlB?=
 =?iso-8859-1?Q?2TD9jXuOdq5gNzytbKmBokFa1RdFM1bfpXXgLfWba794GNQs+5HysmVMul?=
 =?iso-8859-1?Q?i/WhE5Hgx0snlUkwfFKUeirMOkknFJv2oCeTnTw8VI/CjnlcZ0azsDJrJo?=
 =?iso-8859-1?Q?l/trGjk7nnywCqabHnsuyJa/KPD11bs/Ay8gvlrR6ZQFZsFRt4+/tDY//O?=
 =?iso-8859-1?Q?1minA+nrAuaMFsyZGUOX92JmIHCJP8z8pZBMqc4D8CxgrPGRg+BzJxLFLQ?=
 =?iso-8859-1?Q?WteBesLAyWweJ5BTNRu5gxmU1gPFciGZMYpTf2c163Lbe/8v9DguBwHR03?=
 =?iso-8859-1?Q?eHnNp6RkbDUceshzwMtAkRKmhTeOeWWL7z2lGYW/2PPTVroPo+NmfWzTQb?=
 =?iso-8859-1?Q?QSRU1/thAT2Ej3DNSYCQOBrHflBkRKVqfliMW0E4MeArX6sf9UAfHoa3tr?=
 =?iso-8859-1?Q?XkTAQcCY+CHpaNX+94+GKA/LOXMz/4SfnC84eZAWutEueKHe52KTRZDUZF?=
 =?iso-8859-1?Q?99c4wB4MWK73HpWl1Gefy14UXG5iMHfWJhv4+6qKXcIpSHjh9YkzGUYQv6?=
 =?iso-8859-1?Q?YgzObRikG/gjQae7rJavYJghY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2addbaa-6311-4300-5c8d-08d9c3d71d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:12.9297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChFmWvWOABelcK9FVA5CY/jemslILH9HrJKlFWvJrU/THHALjlfOvWr/epV4BVLBynysYBJSCHF0RiFzaHXAvF+74PCzGav04vtBbcHJyKY=
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

PPC64 needs some special logic to properly set up the TOC.
See commit 85baa095497f ("powerpc/livepatch: Add live patching support
on ppc64le") for details.

PPC32 doesn't have TOC so it doesn't need that logic, so adding
LIVEPATCH support is straight forward.

Add CONFIG_LIVEPATCH_64 and move livepatch stack logic into that item.

Livepatch sample modules all work.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   | 6 +++++-
 arch/powerpc/include/asm/livepatch.h   | 8 +++++---
 arch/powerpc/include/asm/thread_info.h | 2 +-
 arch/powerpc/kernel/asm-offsets.c      | 2 +-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0631c9241af3..cdac2115eb00 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -9,6 +9,10 @@ config 64BIT
 	bool
 	default y if PPC64
=20
+config LIVEPATCH_64
+	def_bool PPC64
+	depends	on LIVEPATCH
+
 config MMU
 	bool
 	default y
@@ -230,7 +234,7 @@ config PPC
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
-	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS && PPC64
+	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/as=
m/livepatch.h
index 4fe018cc207b..37af961eb74c 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -23,12 +23,14 @@ static inline void klp_arch_set_pc(struct ftrace_regs *=
fregs, unsigned long ip)
 static inline unsigned long klp_get_ftrace_location(unsigned long faddr)
 {
 	/*
-	 * Live patch works only with -mprofile-kernel on PPC. In this case,
-	 * the ftrace location is always within the first 16 bytes.
+	 * Live patch works on PPC32 and only with -mprofile-kernel on PPC64. In
+	 * both cases, the ftrace location is always within the first 16 bytes.
 	 */
 	return ftrace_location_range(faddr, faddr + 16);
 }
+#endif /* CONFIG_LIVEPATCH */
=20
+#ifdef CONFIG_LIVEPATCH_64
 static inline void klp_init_thread_info(struct task_struct *p)
 {
 	/* + 1 to account for STACK_END_MAGIC */
@@ -36,6 +38,6 @@ static inline void klp_init_thread_info(struct task_struc=
t *p)
 }
 #else
 static inline void klp_init_thread_info(struct task_struct *p) { }
-#endif /* CONFIG_LIVEPATCH */
+#endif
=20
 #endif /* _ASM_POWERPC_LIVEPATCH_H */
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/=
asm/thread_info.h
index 5725029aaa29..42f8a1f99036 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -51,7 +51,7 @@ struct thread_info {
 	unsigned int	cpu;
 #endif
 	unsigned long	local_flags;		/* private flags for thread */
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
 	unsigned long *livepatch_sp;
 #endif
 #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC32)
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-of=
fsets.c
index 7582f3e3a330..eec536aef83a 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -94,7 +94,7 @@ int main(void)
 	OFFSET(TASK_CPU, task_struct, thread_info.cpu);
 #endif
=20
-#ifdef CONFIG_LIVEPATCH
+#ifdef CONFIG_LIVEPATCH_64
 	OFFSET(TI_livepatch_sp, thread_info, livepatch_sp);
 #endif
=20
--=20
2.33.1
