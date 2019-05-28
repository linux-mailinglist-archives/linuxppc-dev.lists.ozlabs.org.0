Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4A2C2FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 11:19:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CpFV6zjKzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 19:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.65; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="FJV+vbNn"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CpCs5mgvzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 19:17:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWj5naSzV0ySCY1ZNrovPMjNnQtCqGhYnXGehj0aWog=;
 b=FJV+vbNnNMhJZJmUnGDbo8Kf7dY5d1wX0nBDeOkRsGlftG7UdrnCBn6bkrun7sJ+h5TwRKwLyWHL6xClLAZV827pXKTIkxN5GOEiZa2C3PLR+gOqChPsCZr2zBqMW9mC+6G62MYazs23NUNTsyfGALSDNcBqkxzqXWZXvrnumkA=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3885.eurprd04.prod.outlook.com (52.134.17.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 09:17:52 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 09:17:52 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v1 00/15] Fixing selftests failure on Talitos driver
Thread-Topic: [PATCH v1 00/15] Fixing selftests failure on Talitos driver
Thread-Index: AQHVD9neuB3rF5DbdU6FGGdK8ciL0Q==
Date: Tue, 28 May 2019 09:17:52 +0000
Message-ID: <VI1PR0402MB34850975FDD8F5F1CE366A9C981E0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6462515-2c1f-44c4-b3cd-08d6e34d5cd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3885; 
x-ms-traffictypediagnostic: VI1PR0402MB3885:
x-microsoft-antispam-prvs: <VI1PR0402MB3885CA9DEAB69658D6DE6EE9981E0@VI1PR0402MB3885.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(366004)(136003)(189003)(199004)(68736007)(486006)(476003)(4326008)(186003)(446003)(53936002)(6246003)(9686003)(5660300002)(55016002)(66066001)(76176011)(478600001)(4744005)(316002)(74316002)(26005)(66946007)(76116006)(73956011)(52536014)(25786009)(66446008)(66476007)(66556008)(64756008)(6506007)(14444005)(14454004)(99286004)(8676002)(81156014)(256004)(81166006)(110136005)(6116002)(3846002)(54906003)(33656002)(71190400001)(53546011)(44832011)(71200400001)(7696005)(305945005)(7736002)(102836004)(2906002)(6436002)(8936002)(229853002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3885;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dRJv2WAxvIzDvLYch559MunUOf5sxswNfkQ6O4ceognW7o5TCBPliiPn3i/0jvJ5VoYTGyDDy1MTqumAjBwEx7FOKaautF4t2bsy+BIZI2Y+ghEywTcK/IRf+Zw7zUrFOSJisrqyaIey8eJzh3IIb0pjv2NLD6qDh/DgRTllCW8YuGgZM3AW1a/ENj53/vTLShbS/WAWg4O3tbcI1GrJNmJy80W1nW+fWcWidYCvYkr+XeZcgQ92vVtSWywSidPIfa9BKUn7+Uo5IGEXeyRCfm65mof4vfcijT+omLQFJ0BZnMURy32FE4+KZjSxYBs5sChvvU593IEMPjYlJyIIHNvMDR+TGjM2cQRcZmmeums0uNQ5u0+Vl2ovb1EBLNEbOiO2srX55paaVlrinQgy4WFat6lqrlM+d/VN08p6cko=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6462515-2c1f-44c4-b3cd-08d6e34d5cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 09:17:52.7205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3885
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/2019 4:34 PM, Christophe Leroy wrote:=0A=
> Several test failures have popped up following recent changes to crypto=
=0A=
> selftests.=0A=
> =0A=
> This series fixes (most of) them.=0A=
> =0A=
> The last three patches are trivial cleanups.=0A=
> =0A=
Thanks Christophe.=0A=
=0A=
For the series:=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
Have you validated the changes also on SEC 2.x+?=0A=
Asking since IIRC you mentioned having only HW with SEC 1 and changes in pa=
tch=0A=
"crypto: talitos - fix AEAD processing." look quite complex.=0A=
=0A=
Thanks,=0A=
Horia=0A=
=0A=
