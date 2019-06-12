Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB6427D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 15:41:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P7MF1VsjzDqFZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 23:41:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.64; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="cdisKLcD"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P7G21VsXzDr1Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 23:37:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN1Yj40/by2KsmjhGsp4WN01KK7a3AXQxR9ZRmuakl0=;
 b=cdisKLcDlWqNClCoLm7jqBK1neb55ssDdYTnpS9MDHCRW2i57SN7pAzrpU31gJtnw9Iag9KT34rnmaKVjqfobjcZhGn4tmRn7dp1084rCUSEuKVDVs0vQVmZ4mMGacZIFlcwgla08AtSqB8/MoRxs5h5MgXMNmA2kFi5FAzXiwc=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3663.eurprd04.prod.outlook.com (52.134.14.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 13:37:01 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 13:37:01 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] crypto: talitos - fix max key size for sha384 and sha512
Thread-Topic: [PATCH] crypto: talitos - fix max key size for sha384 and sha512
Thread-Index: AQHVIOKokm/zeEv5yEq7PjGly7PKww==
Date: Wed, 12 Jun 2019 13:37:01 +0000
Message-ID: <VI1PR0402MB3485C8E7572B6EAB6D1CEF7898EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <5f1004d33b2347dcfbc677551bafc9d469bb079e.1560318544.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19a90e58-c77f-4f25-3da6-08d6ef3b0c95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3663; 
x-ms-traffictypediagnostic: VI1PR0402MB3663:
x-microsoft-antispam-prvs: <VI1PR0402MB3663907B4FCF6CA03D7DD43498EC0@VI1PR0402MB3663.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:234;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(478600001)(316002)(8936002)(81166006)(68736007)(4326008)(102836004)(53546011)(14454004)(6506007)(8676002)(81156014)(476003)(86362001)(44832011)(3846002)(6116002)(66066001)(2906002)(256004)(5660300002)(71200400001)(71190400001)(4744005)(486006)(52536014)(33656002)(7736002)(66946007)(76116006)(73956011)(66556008)(66476007)(305945005)(74316002)(9686003)(25786009)(26005)(66446008)(64756008)(446003)(7696005)(54906003)(53936002)(6246003)(229853002)(76176011)(99286004)(55016002)(110136005)(186003)(6436002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3663;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +b8+ecrZ9nnfoQH/76auY3N5xI622mxai7luPpkXHzyxxvkbauRZW707tIQeBwaMDVKzuAXOhI9HywDhCu0xJh2h8C4atgYY683CdCrLKSMjWp+eOiUHEiCPQiycPbwOXytIbdAyp/Pcgo2hJ53xm30BCsr2UjMsJekSJO/PLOkunzNbELnEpqHpfmYtFUgIcfhOH++VXIrZapEvQ5gW68E8H07nKZU4UexDG2RInRxZnzmG1UME4/6m9mlKBWib/09DE67JH2zfhRGTe+MHuLR6vwiBQ2ewbit8VvQAj/uOHaa2+P38nRQ/rQMmImXruY9wHL625w6NGyPOj6Qb7aQxTi4Elq0X43wi5ALuh3oiOuJ0GxesssOwvvrjLhbREbz5OtRvKnyxpHmPga2+76FD7DI5nSo8ZmY/DIGR4vQ=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a90e58-c77f-4f25-3da6-08d6ef3b0c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 13:37:01.1680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3663
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

On 6/12/2019 8:49 AM, Christophe Leroy wrote:=0A=
> Below commit came with a typo in the CONFIG_ symbol, leading=0A=
> to a permanently reduced max key size regarless of the driver=0A=
> capabilities.=0A=
> =0A=
> Reported-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
> Fixes: b8fbdc2bc4e7 ("crypto: talitos - reduce max key size for SEC1")=0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
Thanks,=0A=
Horia=0A=
