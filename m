Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477F46D989
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P7C1VLJz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::608;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g0qZbz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE/s6+WRbMDbfUncsYoBUC9WNZEatc0K0R7Yzyl4x5r1ml9XGBlsrHxU6aUzkVeF1aSIZAWj9AlYeF1kfHW/UBygy+BUyNMdpdnLcqSHQY7C07CMtBAo7T1Ckg6LQ3zn2N7emys4/u5kSGbAQxKanAaerbAoxrc//pfQwztTGF7B//2IaDULlsDFWJL5A33QGbcjZwUaH6LAU837y3QpuNHQv6Qj1HwTTKBmmGFhjooFAcOe4fL1a2E5wFkzCvV398jTAUMZYfyEhVJHaeIt2Lx2dJeapNpkT3fDo2BH4xpsl4s94ayFDUl1EYwUZaopwIG+yJWoFvSfc3GdaH8ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecWjS/2UZ0IgcjyZ1BNFW6PGMsjPsk8NnvtJJ1/fvs=;
 b=h3fUGFXwPFbNzmOmiKKth9884dmg9d1gmKik929ZFnD5fdG5rERTR+pOF/QNGMs7Gd9Lw1PGA8Sbd088pn2HGd2JjCfvFIu1vXw5EbvOrJp6SPw7jfqYbp2NwPFkmfpGdiQpPmj43khdiljNOtUuCJF9VpQpI0o6wuInDGUIPe5MQOjcAJrEzeJtG2o61Ercb2GuCHmNN9x1VFW7Z8xrrQXWMxDLIfZ5KiemEZ/Xm/XTDOMMWRVXBsg5oTsB4ZargWPOe+/OLblejn6meBt8s5GNlWdWGb1DzHGYQ6hA63ax342xSwyjSPw3CpNg2k9uV2FZWsUBK2pKHlCY/J9Frw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 17:18:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 01/10] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Topic: [PATCH v4 01/10] mm: Allow arch specific arch_randomize_brk()
 with CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Index: AQHX7FeXvLiXZmbMIE6c9kZusjZ8EQ==
Date: Wed, 8 Dec 2021 17:18:17 +0000
Message-ID: <75bf69360af50be65643a1f02ccbbadac9eb3157.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d1cb298-bcc0-4687-358e-08d9ba6eb9ef
x-ms-traffictypediagnostic: MR2P264MB0228:EE_
x-microsoft-antispam-prvs: <MR2P264MB022844E5BA069358B51B996DED6F9@MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tWItzkakzdTfEjSoU2u2PoZgH60sVieVzMXN4/ef+2mQfejo4LVfjuO1pU1lS1E40KwHN3QMRpEN8pJ/pnC66ojNoO0fiXRmh2wlOEfUmO8ZfRquCQc57c8td55ahe0tOHdoJ9b4e3CIsUKlezaj0885Yi3AO1l0qToA/l10xwsmXkBiwe6EAmgh5dxVZMyDK6d+IGnbOWDzifKsoeTyBKI5brhl4hDOw92h+uoALyElCJmDubUhFs0Po3n0sRVPoxedhOZ6cCo1OJDzCmcgwLXjsO9PJUfcqRu1piifI0TsQLWLTloeaQKMxDCiuWj85UE9gzU6Ai2bYj3OH2jUJPDfaZOz69UMYikMV0pd9rCibIhtpoXiUtDuz+ESsLPX6gdvJh/EpVZy1t+UdKicbN7kWldKXBgkIXrn20PT+N9hUvFECSwcjl5hLFEwZOgjfjskGaqT07KIscnzBCR1UdXRXtY6lDVFJ1pow49XS0XxVX9NentBllURcViDzbExPwU4niIlkQXyxiz1qUgo/qQDyv67Qmz2WHGODDc86nTIP6NlEbXqoMw1/n9iv1EJ7a6N1/CqyuZ8lp0mKU+XWNxnB8D24H+5oc7uz/C4z6R2CuGncdX/1MEuULkyKX9wHmqJYLXifIRXxqVATDX+RMDZUBN/jQQ1x097KXZO5Uw57d390yUaMirj+cL/r97VXLYb86Zs1QQoQ1Ls7YBZuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(91956017)(76116006)(66946007)(122000001)(4744005)(5660300002)(38100700002)(66476007)(44832011)(6512007)(64756008)(66446008)(6486002)(66556008)(8676002)(86362001)(4326008)(8936002)(54906003)(508600001)(36756003)(71200400001)(38070700005)(316002)(83380400001)(26005)(110136005)(6506007)(2906002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?juKbev/1O23S7CAZaDCSmBCK/CLdeUb/Us+Vif2uWPIYrxV2PQypIkgEfd?=
 =?iso-8859-1?Q?WuOGZpTudManVyKQe4Xhp1NiHf87hLsu0ZdymiUsn7qGgNzOQF1Ye6o0O2?=
 =?iso-8859-1?Q?cDPmXrYHCxByoNxG7X5PsgK0YFLJFwKsSiN75tlZ40kG7F7YFSeGxBqJkj?=
 =?iso-8859-1?Q?x2l+oEmia4eRyOosykvakEngbSBzfVxS2jnMEzHHeYkQTnDoxVMwGNE/jH?=
 =?iso-8859-1?Q?iLFWPC4SwbEKpqC+mrXhxwPTqhTB3P7BMW4xD9gxmWf0+BmryC2Fox/Lr5?=
 =?iso-8859-1?Q?19f+LEv3pCcMyRx0GtMMcoovsEE4hHHTVJ8tzxW+JBqXTmliRFpI6eVw5F?=
 =?iso-8859-1?Q?Bwi/KA2NE1ZeM6DUjAw2piY8HL4UFm4AotPEDhByCR42cOAbK5s8t4lRiR?=
 =?iso-8859-1?Q?xTOaZCeB2OmVd6H2jVbqbwHexLFuVP8evHWTq0Bg2RrRxYSTrLovzWlFL6?=
 =?iso-8859-1?Q?c0j8Pz5h8r6zCBrK3pBW5XkuC9DqmI/JjHpVwqa2Y1YR1hapGN96Yb/kut?=
 =?iso-8859-1?Q?udElOARL9H0qP1PZiflqVcD+ItBUyouhTjXN7i336qorhbFrVZRNSLklIV?=
 =?iso-8859-1?Q?5t38pyZY72HnVq7/buJaj52VdK2WLOajjoUIKAjjNkLCNIZgH1dlcGW1vh?=
 =?iso-8859-1?Q?CS/qJErkrdox3NJCVGtu0c04fbiFFkc/EeU1wi4d/0Rz8GsuJUX/SOWoI2?=
 =?iso-8859-1?Q?B0TbQF1yWg5vWUYF1cJjoeyXrXNu48w/SmC+Rh0tgjJsOanMbncXcfZcnk?=
 =?iso-8859-1?Q?NEn++2eLDQOLBvKvi5jJl/42xTRKe2Jqi/E5H2Cch6XunhUwE8CgOme1aw?=
 =?iso-8859-1?Q?o7SoVwt2KkC0NcGBgYuBki2uE7+X2QRdLP/03SEI3XefEuYGX0S0t3Lai4?=
 =?iso-8859-1?Q?6EaTMog9zwqCFwIpmzmM0qYgvK7kTo9vtiFJGE7lJWydiAuSE6EdMrwgj+?=
 =?iso-8859-1?Q?swRtl9hQvj1dMbrZ2lZbAYXeesSg/sd74/DQmBQM7hMdT3j9YT5qJ4UlcS?=
 =?iso-8859-1?Q?FfeA/kEm784mCZ5VcOuvMRNCBt8RYxT3dLg+jLMlUXhjzmtyukJVcccd/z?=
 =?iso-8859-1?Q?0hZMdGSpPaj8SGdC/P//bRT7Q3X0DPJ871Y8xQpwJRqsOPTB9vP1x/u1Ku?=
 =?iso-8859-1?Q?6S7KwrCeuDxj+Ouadtth2xpPqAckyE0TRA9i8+eSAaf8op1P7OIy1Jyt88?=
 =?iso-8859-1?Q?4jA7R/dImKEsDXUZLvnGVAB1hetnJva/Py7AjK80sXrgiRrG10MHQHmgVk?=
 =?iso-8859-1?Q?MO97NaKyHTam5aca48SaSgwek31FKtr/gj34+eG8HZWhHX1gWYl4oK3Ew9?=
 =?iso-8859-1?Q?MY4MjdazAJV2p59SL7N0SEOsQwiK51qF63b1X4VYL77pqmtgTPH8e1D19z?=
 =?iso-8859-1?Q?lgcKHNsWMB9QiTYGfbIjpDGnhAcd9eTlWLv0t80NTCgaX7GYl4GfEudHEl?=
 =?iso-8859-1?Q?LwujCWxw0o3QDiNT20YXd8yNPKk+km4l4pdOzZEo9AxDdiU4vnU6WEzP8T?=
 =?iso-8859-1?Q?lP2Y9nOPzGysShMGUjDz5DvioqA6Q/DlCXf1+bZivBNVLVBfivhjTNgpjg?=
 =?iso-8859-1?Q?bGBVNY87cHsIqRZHq5BF9/xLN/8TMSAFWxdVkOIL9tNtPGMAa+WW93Owz0?=
 =?iso-8859-1?Q?bIODtsmCFyvfkEwwIG58Lq7Cnn2SuNHCMdQNrrE+TUney1VYpzhusTg8W1?=
 =?iso-8859-1?Q?xIEBoXIebPJBTyFMgxunq2ZYJv7wTwUkbb3hCJh3jYgmn8DC0xu8MBwaGo?=
 =?iso-8859-1?Q?Ygd9LXQa/GmDdjIkiGQ49AaZE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1cb298-bcc0-4687-358e-08d9ba6eb9ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:17.6962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6PuNUaWXPQTEPG/xTIg4OKZqHDRaOFlLZ1qyFRNU2VGcghBpLIxJYWbI6lbn6ldUAKSW9qfpzP9K5ECLmZ/1c8poFiXusX37JvDJ62iRp8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0228
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e7142bf5d231 ("arm64, mm: make randomization selected by
generic topdown mmap layout") introduced a default version of
arch_randomize_brk() provided when
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.

powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
but needs to provide its own arch_randomize_brk().

In order to allow that, define generic version of arch_randomize_brk()
as a __weak symbol.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 741ba32a43ac..46d1a2dd7a32 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -344,7 +344,7 @@ unsigned long randomize_stack_top(unsigned long stack_t=
op)
 }
=20
 #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
-unsigned long arch_randomize_brk(struct mm_struct *mm)
+unsigned long __weak arch_randomize_brk(struct mm_struct *mm)
 {
 	/* Is the current task 32bit ? */
 	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
--=20
2.33.1
