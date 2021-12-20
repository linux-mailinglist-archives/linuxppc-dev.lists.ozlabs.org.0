Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC047B153
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlg35LN0z3ckL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldX4jSmz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntRUhM5JLqWYdbIeUCLYgmf2Rd8+IStuzkhBj31f9T/fR+JjK58qOOUeDqdG09ITIjW7u4OLhkBdI7Jivc5zSgAdy8bI/iVt5Dyne8tIUNM2mxXPYQpFbsAvzy5HtS6oEt6pJR6HE5PjqIy0bJ3BdeOZ+OjKml7xp0L82dcxJ37mUWC7nvBbxwdHFSpxIhl/GcjEWljkEqoNMHjlbLQF9swc8ZaCNGXuSN4HwQKrgHtxUnAVlco1s6EujJFfAh5lzf/hZeyo/wsmYo+gBGo/RDgQIi4uofIogY9dOO1kSL8/mfLHMM1oqPyuetc4vOtF96sHVmCEY4iyHpf1SFO/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tziqduouK13ZB3Ue14AukQmD+cW3q8aDvAxaW98VgpE=;
 b=cT63T02m26CIspzcGPwDsKtxCBTliNVSyoIm2tDuZY9eQbwnsCmicnfki00EsEZ22LcOQrBTxuo0wWRKT0Mh3LjZLiPHAuyDhnfHw+t1/HuKRYwssLACPxsvj0eRunlO9uQZ4NOmjB4KRQY8t4wHmaQ8hZ5UzwNNNCA2lL1u/gHa4Oi2lb6mnIcr8l0Eq25XxlB4ot10+rRPIApTh5yZpmyioHzy7oq6bZ6r0qi53h3VLsgIvuGXAIY6GVTpggGBn3fW/5SQ1+CtCdbXO68CJ2FhGgbww3JbIKv3hg0qHQb3PQ0QH1tXX71J28YcdWk0zrAxN9dbfnllPfi8aI1QYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Topic: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Index: AQHX9b/2q2Ez9U+DWUatpfXKha82og==
Date: Mon, 20 Dec 2021 16:38:06 +0000
Message-ID: <bdc7e594e13b0891c1d61bc8d56c94b1890eaed7.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d271e9f-5f29-43e0-30c7-08d9c3d71966
x-ms-traffictypediagnostic: MR1P264MB1905:EE_
x-microsoft-antispam-prvs: <MR1P264MB1905CE179E12F58FC7E4A1A4ED7B9@MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3fxFAT5GrM/3yheZb3n1JV0sq8E4YEN/2AG/vIz4OWFv6fRgdnT5Vp8UIEh49ufQSuZJOMLKNgbi87YY8p87nm1Z5RKHeiSr/+agt9V3/mmQVS3rcD8p7P8Id5JTeosxM7ccT2KXfg9XLi5q0057VBOGQudPryg2XYnsxphbpBi0PyAohHkzZOB6hlAonTn/ey4BLtYxys6d3uXNYTHP6w26VMzbeDU7E7X9PRM+MaD/TpERH909IU/JnroTP8aW1xezImX/+x6wv0ep1k715eRNY3nDWU5HR1JacU+mtxEWxwywIUTmQ5Vgiq/WmQ68JrZE4Ttkcv4qfQi/Kni608Bv1Q+lctAPIGzcywEahrphxNtgqOIe7OKnxr6gX/Pixb3oCUWpGOvyJCB9wC47wrCt6cWFwnKdZXlkGtqzosbdYBZ/HdHgEe6fsg0D0fe7sQCsqHRKj6rL4bYdd/pwAJY6UzWiiakgD8TmfDZjEz2lyTpyI7HPVhMploQem1s0yQ24VJUpxTJ4TUvAVzzUNAZIhlwca3dW1ctl9EFbdU2ga0pxLPpqCxYPXDYwGP4pEKz3cbDKOyoKtjlqGVHY9jA/or4HSYXRguE9GApSkkr8tqep+hOH3U3cMYsGeMuGk0pCAvaPIoVHV49WpdRFFMrYeWgb+HtiJLJ24bi/0ne7/gW0so1+g8AqV+0jX1KvuITqa44QOQ8hgp473GKuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(86362001)(36756003)(316002)(110136005)(6512007)(54906003)(71200400001)(6506007)(38070700005)(83380400001)(8936002)(2906002)(122000001)(6486002)(38100700002)(8676002)(44832011)(66446008)(5660300002)(66946007)(66556008)(26005)(76116006)(4326008)(91956017)(7416002)(2616005)(4744005)(64756008)(186003)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hwLLSBfAKy6MWFfcs21QYeLkcgabQP1iOuN4qx/TEYl3J3x9JLg1n+gQb7?=
 =?iso-8859-1?Q?xEon7Zj8O1+oIWdlqtZzH0+ikMLG888SiNVA5gah0ehhgf2AMrbzyvILk0?=
 =?iso-8859-1?Q?yIm9IbdVmOg1vPBluUsGEgefa368+awlvyWsGFnSFqiBs3lOGU6/NKu9xA?=
 =?iso-8859-1?Q?SS2YQa83Y8b2dDd11r2wsqHJYZZ31tO8KFHa42x3+oAz2ZLjd4dGdSsfFU?=
 =?iso-8859-1?Q?0xTLZ9sqjm3KnWT4XmajRMSZGbsU6UZYI/uUTPzqvMxMA4yWreDjg0WFyB?=
 =?iso-8859-1?Q?1mnbAymnumILxlVwYF6iARTOys/cmklHjhUkuIDrFzJudqYw+LAdpZ4P1n?=
 =?iso-8859-1?Q?P9Roa3Db1UOr1E/AbnSLhv7kJp+O9riw5sYzoiNzIDrXe6KPIaMh6xlgmy?=
 =?iso-8859-1?Q?vSy0cfb/q21EFzdP7B1Nxbn0iAZXbMIYAwkQXITVcTlduQ6LlWoZ30dKuE?=
 =?iso-8859-1?Q?M7IIQ8dvxUC8tiGCZx5KAs3x7MYzmzF3yZnCe6eHnjXm8pQMgY4ycxcDUN?=
 =?iso-8859-1?Q?DJrTP7SwAapYzPGswbYfonJRADNZj80I49wPL+2S/Gj2v0wCDuKM+hVQj9?=
 =?iso-8859-1?Q?pismVjYOh0jkYDgHrsnsDksHueFrd6j6ZSoUf/Qcea/b5byVxzURo1ukY/?=
 =?iso-8859-1?Q?X5bAmqyCY1s6h7Nd+7BFpzBd8QYS38nDOyqCG5R38+XVv/ajWkqfLXu2nA?=
 =?iso-8859-1?Q?fmBw5DDKSDB5TYYLmWTgfT8e9KlAfXUXOoILCeiMtAagy8HQAQeF2tmf/F?=
 =?iso-8859-1?Q?HdOANCZJd+lEIOui4qbz7gLrzVX2NGRJWyPergr1mMZDh+uqOZZgWSrvzl?=
 =?iso-8859-1?Q?EIGOG7JeLpcsWDkmd0lQ3TRSIDs+tkuTu5YUsWai5dan7Gu+Y+n+9LxDta?=
 =?iso-8859-1?Q?n62YPh77Lo97cVq7B+7SQPr2myFCinvk6qRQjuHKFUcX7lgmwQd0XGdTko?=
 =?iso-8859-1?Q?1XuLpJGRVoiDfK/5uV40ijZNCazQ555uheaof0+dZGnqN7/R3O65IGYVku?=
 =?iso-8859-1?Q?uhjEGtjG6MUdipsP77Bnbmsp06MEsztZ7jGBzQNeFDHBbuNIL7JN10r8dD?=
 =?iso-8859-1?Q?j7LG1UVcqTX8THwSLZFTEOb52NFcRNb+2boqJFnWCpdYf0tVuEDiG6cZ/7?=
 =?iso-8859-1?Q?aVajJ8WpYl8byQnQYgJnxaJFFMduX7UNDvSzlFx4qtXIQlXgLC7QAz+5Z6?=
 =?iso-8859-1?Q?qFs8U+UcCl8MxEJaj9d5eno9mYGFKQwy8f41R3RjRUPO4trR4rEknEJV7Q?=
 =?iso-8859-1?Q?VaPgVly8x5Iffu3Wj0pe/oRMrsMOgl+JgfP+d/nku7GRJW2pVNplZrr6gy?=
 =?iso-8859-1?Q?rAp7b2yDyqJN8rKlRjArK12MzSRay1Y3kY8Env4SoUtZSfWlyc5wvTCFJk?=
 =?iso-8859-1?Q?IbLu6v0f+mcprSjVZFe5rhxOyy6R2StzvmASzXPeV5t56kLBnzFUxq8OHi?=
 =?iso-8859-1?Q?DbpZrjzS1jC816RI/E4aU05hxo8rN+rCuWlvIRpVC8/tyuCoPanrmhwpbZ?=
 =?iso-8859-1?Q?CuOftKRy/V8gjMpnp/bMhv8bqNjiDhxI/sFQizP+uKQxj+uJb+mU6T8x6i?=
 =?iso-8859-1?Q?1x32A1l08VeIBhRIMpn89dd6zB8Y4cIc957Dfs+Zdd6r++KpLbdh42BH3t?=
 =?iso-8859-1?Q?TQf7TF4aDaygi97Cv2CtNLRQVMkzUlhLvX+MsTc8cTwIGoRJFiY/ZrsMWi?=
 =?iso-8859-1?Q?mp28hRsymOkxObSKyjg42fw8NmVhIZ7noowQyPuNkXntsaj2aOtyahyOoV?=
 =?iso-8859-1?Q?9LldOegEQgSWYe4PKTonLwcXg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d271e9f-5f29-43e0-30c7-08d9c3d71966
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:06.0367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2c9OGwCbw+yQm57kNWfnIslJJFmhkdi1X06bm8DSm7gGQX6FEC03Zd5ifMR2PUZDcaCsl63jDM3CbKptauG1gees0iXDABqI+nf4Q8vadCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1905
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

CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is required to test
direct tramp.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/trace/trace_selftest.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_selftest.c b/kernel/trace/trace_selftest.c
index afd937a46496..abcadbe933bb 100644
--- a/kernel/trace/trace_selftest.c
+++ b/kernel/trace/trace_selftest.c
@@ -784,9 +784,7 @@ static struct fgraph_ops fgraph_ops __initdata  =3D {
 	.retfunc		=3D &trace_graph_return,
 };
=20
-#if defined(CONFIG_DYNAMIC_FTRACE) && \
-    defined(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS)
-#define TEST_DIRECT_TRAMP
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 noinline __noclone static void trace_direct_tramp(void) { }
 #endif
=20
@@ -849,7 +847,7 @@ trace_selftest_startup_function_graph(struct tracer *tr=
ace,
 		goto out;
 	}
=20
-#ifdef TEST_DIRECT_TRAMP
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	tracing_reset_online_cpus(&tr->array_buffer);
 	set_graph_array(tr);
=20
--=20
2.33.1
