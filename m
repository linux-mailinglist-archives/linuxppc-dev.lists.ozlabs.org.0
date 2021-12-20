Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFF47B158
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:40:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlh50QPhz3dkQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:40:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldc6cbTz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHQOkyjsYAYkSSUjlBnttsMlBNcVz6AHfxBVthsjyauVTRgA/KsiF1HXQOCfRHzOHht+Qhvb2c9wvps8Wu3eYrAVv2vXzWAhaN2hReyfpkYDL8ENTKp19b8JfIpg6i5pM4Zspm9qdchdBQkApcUN4b9VA1B2G2LGmanQOnlO6wdVgnemw6Qa8ZRCKhQG2bIU88LwvMTiqkpwdmgpmDtJRmC1zSB99DQAZ72cu7LI5+L06mzvl61GrhtO7Fs8uWvI/EY8BEZSDilBCcionRCHloEqxMJYflliXOkZCXqimPrbGzkJOTjQO5pPlP3uadDTy3hQ1BeXtn7FEFE6wdb4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkkDQtRKmGceL1ZsLQ1P5333rr3ROATXVjRguKciuvI=;
 b=YwPpyIEfU1aOgTtdI4fdGHl/WEczhs+ApESwqLdMCFNkvme5VQzprnyUSqY1O/pksTYDv0lLhP07Ouu5fxAzoADjfL8eyuZwzGrGUiUYwbeVD0crQmVQkSFDpNOvivxGrK357QyvFto/uT5dfV7d3/px8om2uFIZ6PaxgB1gL3mdDVWBy8IoAXGXRshRtsQF8qZEs7YoNbSq6z/aUg4SnV42lX7vhmA6+V6wJtNQ4CF1Fz1ar0/DstJkG4FKZ/TzMvoanAQBvOzdrscVtBmqBtev7xHfgikH1KuEJJCkYFt0rozqqrys30rHsPOzpeCyBqvzdlRlDjLs5s+ZefyjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 05/13] powerpc/ftrace: Don't save again LR in
 ftrace_regs_caller() on PPC32
Thread-Topic: [PATCH v2 05/13] powerpc/ftrace: Don't save again LR in
 ftrace_regs_caller() on PPC32
Thread-Index: AQHX9b/8mCCoJBJvIE2Q4/L/0ycWxA==
Date: Mon, 20 Dec 2021 16:38:16 +0000
Message-ID: <eadcfc770b4f1e35535ffb85e28e858a2c31dec4.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c00445e-df51-4032-78c3-08d9c3d71f80
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB21611AF04DD6128F8AB245DAED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OzDXvtVhbvNwwqFhUfsGUrtEBNS8e/eaCblNY8RawyxAfX4LQXcSAm8q5s2l/rqlNpgHvY4YV8L5f57SJTNdNeq1Iju6f3d8tUhd2DJyT8MZfMDAZ10YpxgCfyHHL5X39phQn66vXS9vPIJiS1sqXAwxBDCkDepzq0QOycSy5Xm/R0VzL+GIcLjPyHwpxBAlGMF8gxSnG2P4nMIyQ9ClhnKuVv3eRWA+AW0V/0iFqEb+xv7+inc8oKYD7v9Ko4SCeoNziJgMD8QfRwYpYH+MF0pt1lLdimfTwKCTrQBjCYcyvEP8SnHjwerUBZ6rAkCdgaEMfuJ8epZfNhb2ECCz2GVq7eaFjzgZ+oXN0PiNqOlbd9oqi8l7hjjaA2AtZSYpID/d93EC1Qpu6qntFKARD8IbPMO7UGlKNRCFpOVyOyYAxo3eOdhk9PUR0e3ab2HTp/wzDqiF31oS6eKJFGB5zvbfbKJ2jG2UQMepj0fPx0Ag94kClU/atYBJCBeaHLQU7OdxKWxp0Y7yBoMRJn90lvmmNjGcdQymR8h35R1Wq8VoSpCOeB1OjRuba8QeAeBKe5vOEnazKRIf2NLnlXrfB+ppKxAqweMDUZMVWJXLGuVx/4/9QgZj1E4ZmPjVKNXTsJz7mNXhyKgswX1FA6YJOBQSyLY87W+ISyfc3ChKZv0UCRdw3evmMhG6BLDBXpwtOSTOkRDyQJLlWP8gir/dkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6506007)(508600001)(83380400001)(86362001)(2616005)(8676002)(71200400001)(4326008)(6512007)(36756003)(54906003)(122000001)(8936002)(4744005)(110136005)(44832011)(26005)(316002)(6486002)(186003)(64756008)(66946007)(66446008)(2906002)(38100700002)(38070700005)(7416002)(76116006)(66556008)(66476007)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6AfXa4AV1TjRKEK1noBWTm64wkjXLXpu7DXyDhIReaAyTeq5cREvMBJJhq?=
 =?iso-8859-1?Q?4NE2jv9YmeHvbVPY3PorC0HUyJUCHhgz1OasOo9Gsidv6GezQ7w/87dBXV?=
 =?iso-8859-1?Q?yNV/fpNkeiYtoAefCArEK5zKudTTwmZnG7jgrUCEEZvzB9ALe74lH6xkBx?=
 =?iso-8859-1?Q?eSV70Es8W6ePZsv7Pp67A8S0AXweWl/hjbRkKFsy3CFWwTf+z+F0/7Qhak?=
 =?iso-8859-1?Q?1AyVH5yWsFRFRm0uYFXA9rfOAtShqZp8R+kynma9xFDUCP43vG6dM4aYVR?=
 =?iso-8859-1?Q?5r3IvzBnguRwI+a86yhD4zOkttWg+W4A66ytGUhxLxxFSYzftCtQnag+XF?=
 =?iso-8859-1?Q?5ZoyPs2/0Qcs/ljbEJxppetm+5L9Kn7Ml6O4RcaOQRfbsZxHWvEGoQL/Uf?=
 =?iso-8859-1?Q?penhhZaktTyT7CSkuZ7WHplme++zckqVVpvb2YFAiCRcFaxHmNGNofcn5Q?=
 =?iso-8859-1?Q?BZGE51AWIi82fITkEUGGQZ8u/Fkytwdo61oT7QyriaJj575ZR72ee5FBbi?=
 =?iso-8859-1?Q?FoS8TTcdz7UVhOH+GZqZWvOO1UcpJ+ifRTvHWqKhbn5FiGJ0pPualLL/jd?=
 =?iso-8859-1?Q?e7sRdT2WjpYT9Jer3IUqdFCmLlaSmeu1Wj1msuZIVu+57RA0fHE94b5ZYf?=
 =?iso-8859-1?Q?Tb0O177Fxtm4I8n8ruUfbFks29761Eh6dIvVsPPIEPCxKMk9ZvS2N7gU6q?=
 =?iso-8859-1?Q?bBnv0mKDaBjzfdHstOJ8XxfLAMb0mlc7gW6yS5b5vih2tQ3U3RJoYv9nGX?=
 =?iso-8859-1?Q?Rl1T7ZlvhrewGkieDedc837Xr+L0/pGHb+eCCru0njLm+2GB9eUUqEc3YF?=
 =?iso-8859-1?Q?eMGp2/zHpd3dAmSoiqnbDBpxtwo+e6ohsxXEB6sbe6xPnuwJPFLgVZuOxk?=
 =?iso-8859-1?Q?MI78MxBi5aLn7tXaiZrEkx+4lrOSO2IzA0ODb8IGwwRTQMrQa7BRazoXke?=
 =?iso-8859-1?Q?40oobnn3M7zdg175u+YtHBzvR/6UuCyWgJ5RIsDcEEbkgOtrTad73EV1Bv?=
 =?iso-8859-1?Q?7We1/GjSMAMmMbtPEBX7mLn/zxXi4IGAbO3OGoA9tBA+bQCPVebeURK+BP?=
 =?iso-8859-1?Q?AoOtax6YYk08x33tokch+2okqV41jPvWbZss50fJPZEEvMan1y40SzWDNr?=
 =?iso-8859-1?Q?gfh/ed2sC6tAXmBsDHB5GPPQyi9o4cv+tRyUYqsYxfS41Ralw7g6dkf8Sd?=
 =?iso-8859-1?Q?/ugOUPK6OB+Bh4qWvyrZtOR6IbpqMmwkHJw30wPwCbzmG2HUXr9mqO86U7?=
 =?iso-8859-1?Q?dA0STfGb8WfRZJnQn8JJKJWc32vWX+/sH1ZN7481+eikpF0ELwLvsKGxJe?=
 =?iso-8859-1?Q?R6ZJmO9QBzfY/WEK+wAwZlOGnxCwztzfz5qj3h7MHio5DfgWVj7DB1TgH4?=
 =?iso-8859-1?Q?OQtb35pO72fd/3xtkRX4KqpItMrsW31tvpjA6CbHBolmaYIiwUbYXxq3xx?=
 =?iso-8859-1?Q?umO2GKVvBxrO0sA1OWGcTx0MjyPgku5ASCZnyx0ONQygbS/Py4DKS2GtvM?=
 =?iso-8859-1?Q?sIniZln0UcPXyaO3xBlnYZufb+MIOmli6ckBXWJ8Kk5Gw/401O0ZYJq0jH?=
 =?iso-8859-1?Q?zqhM3yksZZMylx0KUSJQLps26ITdyx6Yh3b7qQapgP9PvV/zToYm6BQxo2?=
 =?iso-8859-1?Q?kANiYuhwd/BxP0sYIVVlhNM7cMQ+KJTPy5hOxvzu+CIOhaFAKjZFHzgsOz?=
 =?iso-8859-1?Q?PyHeemSkmXWNlhk4D4NTGhSNyhyOJxWl5s2bNifOykoWfLyhSn64yShR3h?=
 =?iso-8859-1?Q?c1mhlxPu/jNG6NJfu2qfRTuFw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c00445e-df51-4032-78c3-08d9c3d71f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:16.2909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OC+2YP7t9fOdpOg0IqiNoK6odkz467wRjarQgn/Jw3YItTgCPxuyDIWQYDEdviHve2yZ818kw7nydt7ZOkqeR6u34DGvtnslY/oMxIYjAVc=
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

PPC32 mcount() caller already saves LR on stack,
no need to save it again.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace_32.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/tr=
ace/ftrace_32.S
index 0a02c0cb12d9..7e2fd729116b 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -53,9 +53,6 @@ _GLOBAL(ftrace_stub)
 	blr
=20
 _GLOBAL(ftrace_regs_caller)
-	/* Save the original return address in A's stack frame */
-	stw	r0,LRSAVE(r1)
-
 	/* Create our stack frame + pt_regs */
 	stwu	r1,-INT_FRAME_SIZE(r1)
=20
--=20
2.33.1
