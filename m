Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2984A30F8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 18:05:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmLLT0Nh5z3dsp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 04:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::609;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmLGx40jxz3bTp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 04:02:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf1RZYhEzuv8B9+5AMHJIePX0nOIUO6IUW+f1BkQKM/tsWtf8a+8CZkpW2WaK3A4dO4Dfq8NSZSV1BJB9pICKQ4s6+JMzAdpPEoX5SyqRGRJDlUd5mWsurYgMplDnYLp1jDep4up8foyNNG5XlpLSsJ5XQcQuBF6Ohpsponyl2I7Qlvnclmdk5VQJXCdi+qzN+kL6QO9xLCd2HLgtvH8PfDHiHJ1WihzPl5qqpdfYseTO8FVlCD8SB2b9kY3dn63JlLfSn0+xsI+7f6bIekvKI7tpdtkQjTazQ7u/0j4jb5tbFuiVYxh3f65X01Ya0stYrgH74cpS5CfgOFQK8PwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJplCcR9Zkx4G0K2Wjd0QLzNxJNdkoySv2NqjcWI/Ik=;
 b=EO7teiGeybXqSa3YGeJCpfd9/a7NkjOgx5lx+pTyNYmtzM9JTWcJzdy9wnUhMNKSMVBVNJdpL3AzdXHP1D/CXCxQ1bRJjbXxtHldZJlXZMnVWppZa4yxzrp0S/DlLUpMXUhnjKwieq4VUR1LSm6G2dBDEvgiSOb+f4TIyV+ujlLxEQIqathJ2NVkZnfFwdmIATbwMkDW/Fgv+o5Zc0ugIq6WXJ2fhoN1VgHJqpx1kwBw4BtS44ytEHWevNF/nXHo0ceRzaRFmyx6Vxmtwn1W4oFF5UiZLS7vx2T5Yzt8Hae2vsPzbA7zUF/UUhjR5LfqvA0o3OvjZLap5Zpy1TXH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sat, 29 Jan
 2022 17:02:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Sat, 29 Jan 2022
 17:02:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: [PATCH v3 1/6] modules: Always have struct mod_tree_root
Thread-Topic: [PATCH v3 1/6] modules: Always have struct mod_tree_root
Thread-Index: AQHYFTHwBkgteju0lUKhtOmDC0OODg==
Date: Sat, 29 Jan 2022 17:02:04 +0000
Message-ID: <79a93898cfc4fcab56bdadd06bd9233f78caeb81.1643475473.git.christophe.leroy@csgroup.eu>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1643475473.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5431cea2-0cce-43ff-add0-08d9e3491320
x-ms-traffictypediagnostic: PR0P264MB2584:EE_
x-microsoft-antispam-prvs: <PR0P264MB2584B60C018B6DB8B0C5BAB2ED239@PR0P264MB2584.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:556;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /50+geNmZLhhxp7pF6rvhMNVFH8QLSwZ0LcFAxDc2KYyCsX55kC3ethHp8768UZkPVTdVQRF5cH9w9Edy5ebQEEh3S3EGd+ja+gKtpqX6M9KJBRqJ09tPCSPqo689OxCkPQ2kOWod5hHaapiJEMSAwd+21tlqSr2M0mlNwy2YTaVinU6EKOG6BVYEE5GA4tPYltfAe8Kv7SHCCYPOJEozgOMWTwyA6+NEXcUHQgsNnZy0BJx5oBLtQngjvC6amiQPSyn40pWOz68io2oMC+N+ENzJpafVHuHsiZbwkfpLIrVPIbaT/TxcB9yo6mcQjES2IG1tJUqnUah3TEum7FHJu1Xn2VVT5QS/jmtzI3FiF1qGgNKEqc9GOFQi2ePi3d07WKVhudsJr+P4buo2TJucFzPXjOfBxcuQ7rkN15wprwM3E3+cTLZ23YqE/oGPLfNRU1PXDX2oqh3D7kgCj+PTS2EM9LfslM2G/8/OZp6roCDYqBfCDlY+7vrhN+PCkXMuyX8MjkpZNke2GXTzRyG/DsTEWwrObrrVUZxqbY0a5Z3AH9jd7kg2CiCzmKRfWGKOfXf+RVGWunuQDTRqX9ckdN5rkX8i5a4R4HAZSXS6JKHwnLHrYifeUaaW6B1csj6RLSm/7oQsNDnvWznJg0oouwIqi2EgNzBU6fC2gnaIYCbNYyJPAgf2TgeF9h0ExlMI1j9PN+ARlxhNWsiBCdZhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(6512007)(2906002)(86362001)(6486002)(508600001)(4326008)(122000001)(38100700002)(91956017)(316002)(76116006)(26005)(64756008)(6506007)(8936002)(186003)(5660300002)(44832011)(66476007)(66556008)(71200400001)(66946007)(8676002)(66446008)(83380400001)(2616005)(36756003)(38070700005)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?914jvIorz8kxfZKlhd3jVND2DCYK/x+mTl5Ju4hnvbW0OarUbKlO9B/gKW?=
 =?iso-8859-1?Q?ytJvW6jP5TZMk83LiK1DsKsO9fNVaOO4sXnwz4CLY09xSk1hDjHRS61N+D?=
 =?iso-8859-1?Q?oRPBODodYiLgWdIVXS9ChJRfIYwxm4aig6hwunGT+G7d4H8e0tj4Gt+OEy?=
 =?iso-8859-1?Q?IlBk96ZEJV3piWzBD7X+B4XA9oZXqld0XFrNOXrtguCsdO4J1DoPSYG2b4?=
 =?iso-8859-1?Q?FY1cQS95P2O2oCnwZPncBZ8+m6G5BOCkSkxn8PCFGDGHKUayM41kBY5WLh?=
 =?iso-8859-1?Q?0TqhsFfbFRJn2RBMA1JVH0p0xpgOV8WxwszD8EGTJbhIbscowCaYBynO4m?=
 =?iso-8859-1?Q?1ZGoxir25MuwsDpkRo1aAFCC3sAzzCfUn/t/gGWxtRD8MLRGXAxkCOocee?=
 =?iso-8859-1?Q?EzdV35H4H5ABqhrA37XJ4oUGiTL/Si2CsmUyUGawZ45TXOVAC5j7IDb0pW?=
 =?iso-8859-1?Q?ehYNBSV5c8b0pUKI6uwS9CwsjwzVKJcL1YClimMMdY9mKSGoIKLuKtxUos?=
 =?iso-8859-1?Q?2n8AO+rkfmKeClWzj2w1hs9fGXeprDiqVA+UWAO/laf7dH8SDbmi5VMc89?=
 =?iso-8859-1?Q?nZBWrpGKNcZundDRTfzgdmkdlh452Dx5+RKnWtcECxphARfE/gwjqSGGnU?=
 =?iso-8859-1?Q?LRkLl+gr+KtO9v8SzwYIM9cTkHBcDGi87MEbTwfAq1gvM3Hrfb9sFx9zM9?=
 =?iso-8859-1?Q?RMME9C3BWg942zoRu+FTdsClwKhsnNCGntOZ2Pa29CRImxp+oQ3moQ84RJ?=
 =?iso-8859-1?Q?o44grY5LxPQaleB15m8gqwymi8jz8TxEKTdsEOY6ie0dnIvuiS+oCnK4wP?=
 =?iso-8859-1?Q?ZWCd1qnrO1UuNoRsAMdTVTaAlQMNLaXnD3VGFkjkrORiUeGCkYZXcYcOap?=
 =?iso-8859-1?Q?RmqneY2kn5ZqzS841x7RqqZ9naD0UuYm5s9fv8DSYKaXO1a0awGSFr91zj?=
 =?iso-8859-1?Q?c+V3wGCy6h4gVpT8KmZisHVZUU+J5uSLOAkYRaGj+ayPvtRRBpTSif1gLs?=
 =?iso-8859-1?Q?hm8dIa+Li9hNIV4Pp0qq6ovGmyt3a+nqVCZqs/9ygS8KYv6Ykfc8Gnn9Zu?=
 =?iso-8859-1?Q?Kziwyi7UddMtQwGcvjpsFk6Y+DS14rISUTPglVmmcBTs6Y2o2dZrs4O1gE?=
 =?iso-8859-1?Q?dzW8OEI6PnA1/QuYrInbPRdECJstr3g1CfMvbhgZl2s7lUHaiZ/AN5D6oo?=
 =?iso-8859-1?Q?Tq+YXbsATEvLTrxG/OSTbhksUk3qfReaByJpD/+CZrzMROAMHGViB4/Sl/?=
 =?iso-8859-1?Q?k1PXN/cUQfaAZ6SCntaCZRgiW+oIHoMFX+XGN/cU7qFiy0o3H1UVD/auge?=
 =?iso-8859-1?Q?UPL5YxKG9wg72joIzoleDSrxlSQ04SDISdxIJZHnXCenXw/hPqiLRS3Iw5?=
 =?iso-8859-1?Q?5J1O35tPk0ucdPhIGaq8od1e+bjIDXG14Uj4HY8igZ+D9eJcmkbMScH8fJ?=
 =?iso-8859-1?Q?nr/RXMHiKZHwA6OSfv3iuC3Kb5HvSN2DyK/Ggt/mX1rq2JJ0UOHr74Pidn?=
 =?iso-8859-1?Q?A9BEpnKRNbjvz8ej8B7/FaaMmcNcai6kEkgbYyZuMglgeRueSzNRmkyjEJ?=
 =?iso-8859-1?Q?fM0LkVrojzxsfhVXJ5yiblx4ar4TnuRYjDvkT0TKzikUzJ/87G+zUH1/27?=
 =?iso-8859-1?Q?nx5zBpGVRYILRwInOTOg7dr+qz6oTxo+9gSzrXdb1t9nxJVTocPTcOJzj5?=
 =?iso-8859-1?Q?pLBnfPEidSytrbz+VjI06IkswkqwdhTw6cmEnk65HIZ5i352BVjHvpiuN+?=
 =?iso-8859-1?Q?SH4g+bGSuAA0suGM5w2jZ/NcU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5431cea2-0cce-43ff-add0-08d9e3491320
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2022 17:02:04.1881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6j5EVAHKC2Cc9TFaQQWcM+IWDgyGMUvkhKiZ1usUhYEtoLVnUeeU2hYN89gdD95h/lvk33Zau2PskYU37pXLgOYf/Wiex07OvQxqS+G6Ijg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2584
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to separate text and data, we need to setup
two rb trees.

This means that struct mod_tree_root is required even without
MODULES_TREE_LOOKUP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 24dab046e16c..080193e15d24 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -96,6 +96,19 @@ static void do_free_init(struct work_struct *w);
 static DECLARE_WORK(init_free_wq, do_free_init);
 static LLIST_HEAD(init_free_list);
=20
+static struct mod_tree_root {
+#ifdef CONFIG_MODULES_TREE_LOOKUP
+	struct latch_tree_root root;
+#endif
+	unsigned long addr_min;
+	unsigned long addr_max;
+} mod_tree __cacheline_aligned =3D {
+	.addr_min =3D -1UL,
+};
+
+#define module_addr_min mod_tree.addr_min
+#define module_addr_max mod_tree.addr_max
+
 #ifdef CONFIG_MODULES_TREE_LOOKUP
=20
 /*
@@ -149,17 +162,6 @@ static const struct latch_tree_ops mod_tree_ops =3D {
 	.comp =3D mod_tree_comp,
 };
=20
-static struct mod_tree_root {
-	struct latch_tree_root root;
-	unsigned long addr_min;
-	unsigned long addr_max;
-} mod_tree __cacheline_aligned =3D {
-	.addr_min =3D -1UL,
-};
-
-#define module_addr_min mod_tree.addr_min
-#define module_addr_max mod_tree.addr_max
-
 static noinline void __mod_tree_insert(struct mod_tree_node *node)
 {
 	latch_tree_insert(&node->node, &mod_tree.root, &mod_tree_ops);
@@ -209,8 +211,6 @@ static struct module *mod_find(unsigned long addr)
=20
 #else /* MODULES_TREE_LOOKUP */
=20
-static unsigned long module_addr_min =3D -1UL, module_addr_max =3D 0;
-
 static void mod_tree_insert(struct module *mod) { }
 static void mod_tree_remove_init(struct module *mod) { }
 static void mod_tree_remove(struct module *mod) { }
--=20
2.33.1
