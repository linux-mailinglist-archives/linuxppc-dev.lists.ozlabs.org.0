Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17E3CA74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 13:54:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NT1Z1q7QzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 21:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.44; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="HxIHjGrH"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00044.outbound.protection.outlook.com [40.107.0.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NSzZ22KVzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 21:52:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buwhNBYjVybHf17ZSNjeFiKnEgNL2l8Wor//fqKzgsw=;
 b=HxIHjGrH3NXLegBxhY2zRXcMC9kjcYu2bT4gA1W7LWQHHXs4lsqUdVPL40WhTa+AAwXAI8F++jmOXdf5IB4Fw2ypnJ0AmOnnThKVUjICIEnuIQz+R8uniLf3CyWnMMBreQ/HI6/G8OAri5i2tm6uCRbTSH0ksPR2vNUVBwatgRE=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3567.eurprd04.prod.outlook.com (52.134.4.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 11:52:15 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 11:52:15 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v1 1/5] crypto: talitos - fix ECB and CBC algs ivsize
Thread-Topic: [PATCH v1 1/5] crypto: talitos - fix ECB and CBC algs ivsize
Thread-Index: AQHVHFtoomGgDYc+m022z9p6oe1G7g==
Date: Tue, 11 Jun 2019 11:52:15 +0000
Message-ID: <VI1PR0402MB3485627276325DEF9CC6F58798ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
 <c8b988faeea463b89e7d9485c9328dc65a909e8e.1559819372.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f260e76-640d-4121-915d-08d6ee633f72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3567; 
x-ms-traffictypediagnostic: VI1PR0402MB3567:
x-microsoft-antispam-prvs: <VI1PR0402MB3567948D5A4D8D9A794A047F98ED0@VI1PR0402MB3567.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:303;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(55016002)(6436002)(73956011)(54906003)(9686003)(110136005)(33656002)(486006)(66066001)(476003)(44832011)(186003)(316002)(66446008)(26005)(446003)(66556008)(66476007)(52536014)(2906002)(229853002)(99286004)(76116006)(66946007)(64756008)(7736002)(4326008)(81166006)(81156014)(8676002)(25786009)(14454004)(305945005)(74316002)(76176011)(478600001)(6506007)(53546011)(3846002)(6116002)(68736007)(71200400001)(6246003)(86362001)(71190400001)(14444005)(4744005)(53936002)(102836004)(256004)(8936002)(7696005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3567;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dVZ7BWHo1MNsc2LZKghaW507KgA55jnVFEYXHDIKfxgen8YDKRzFTUXa/5y65TWhzu//hSGcClaPNAY/vyds/dQhboE8qTtphGEz8X4OOmis5JXcUCYoRPYYXPlqG44sLkqolpvLrqC2KYGoTJSAW5lJGaeaHukpcL9rzNWboPUBgQFpiM72+ebs+jG3V761WQ8lC885q+uie5ZLqokliKeB2D9fkYnzyLpob00VNVuAn/1jomA5N38AkPze+6PrtvGXuZRqkYOTvxGvkwUeUIzqqZ6oqOp+yImH37SxVmplEe4DGA9zYWbC3qVjspxRLU9vWLsT6yP0kKqzskh7W/HOMOuiOBf0+jkYdSH41HaU2hslaAQgpPKOxYRbvC9PbnSx8vkDWTBKzBsjTgIQayOspS/YCRghAbd3MHi+yBk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f260e76-640d-4121-915d-08d6ee633f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 11:52:15.2160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3567
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

On 6/6/2019 2:31 PM, Christophe Leroy wrote:=0A=
> commit d84cc9c9524e ("crypto: talitos - fix ECB algs ivsize")=0A=
> wrongly modified CBC algs ivsize instead of ECB aggs ivsize.=0A=
> =0A=
> This restore the CBC algs original ivsize of removes ECB's ones.=0A=
> =0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
> Fixes: d84cc9c9524e ("crypto: talitos - fix ECB algs ivsize")=0A=
Initial patch is correct:=0A=
=0A=
$ git show -U10 d84cc9c9524e=0A=
[...]=0A=
@@ -2802,21 +2802,20 @@ static struct talitos_alg_template driver_algs[] =
=3D {=0A=
        {       .type =3D CRYPTO_ALG_TYPE_ABLKCIPHER,=0A=
                .alg.crypto =3D {=0A=
                        .cra_name =3D "ecb(aes)",=0A=
                        .cra_driver_name =3D "ecb-aes-talitos",=0A=
                        .cra_blocksize =3D AES_BLOCK_SIZE,=0A=
                        .cra_flags =3D CRYPTO_ALG_TYPE_ABLKCIPHER |=0A=
                                     CRYPTO_ALG_ASYNC,=0A=
                        .cra_ablkcipher =3D {=0A=
                                .min_keysize =3D AES_MIN_KEY_SIZE,=0A=
                                .max_keysize =3D AES_MAX_KEY_SIZE,=0A=
-                               .ivsize =3D AES_BLOCK_SIZE,=0A=
                                .setkey =3D ablkcipher_aes_setkey,=0A=
                        }=0A=
                },=0A=
[...]=0A=
=0A=
and similar for ecb(des), ecb(des3_ede).=0A=
=0A=
Current patch is incorrect: it adds ivsize for ecb and removes it from cbc.=
=0A=
=0A=
Horia=0A=
