Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105B2C119
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 10:21:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cmz40xGMzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 18:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.70; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Nv9/uVBd"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cmxg4bXxzDq9Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 18:20:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TylURNC/HEKHBhkttdDRp+LsGMfvjUcou9kPlsazCXA=;
 b=Nv9/uVBdiQWw0Mq6JNVUTe02mn5pM5nfCK5MAG2qLi8R1R8ckGI6oJPqEWJmdwSU1inRXvOfxKl12UgHSpBKJzPgROpZRbiT1xz2NJKr0+bhRxIY2dZ5cfurijS6mrPYBdg8MvRdSPVcTCV6vUs99qXS/RTEm2NjBMw6uZHJTHQ=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3840.eurprd04.prod.outlook.com (52.134.16.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.21; Tue, 28 May 2019 08:20:29 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 08:20:29 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v1 08/15] crypto: talitos - Do not modify req->cryptlen on
 decryption.
Thread-Topic: [PATCH v1 08/15] crypto: talitos - Do not modify req->cryptlen
 on decryption.
Thread-Index: AQHVD9njMUF7ft0BM0m68K66eI1bNg==
Date: Tue, 28 May 2019 08:20:29 +0000
Message-ID: <VI1PR0402MB348519D7E3927482A894F276981E0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
 <1ad8020c8140da1b4f818220e130ed0074c37fe1.1558445259.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a44333a3-2280-4130-f9d1-08d6e345589d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3840; 
x-ms-traffictypediagnostic: VI1PR0402MB3840:
x-microsoft-antispam-prvs: <VI1PR0402MB3840AF6B069EDCD443373728981E0@VI1PR0402MB3840.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(26005)(81166006)(81156014)(102836004)(186003)(53546011)(8676002)(25786009)(6506007)(76176011)(2906002)(8936002)(99286004)(68736007)(14454004)(33656002)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(478600001)(76116006)(305945005)(7696005)(7736002)(71190400001)(6246003)(71200400001)(52536014)(44832011)(486006)(66066001)(9686003)(476003)(55016002)(3846002)(5660300002)(54906003)(53936002)(256004)(6116002)(446003)(4326008)(229853002)(110136005)(6436002)(4744005)(316002)(74316002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3840;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5JioKxmm9amMVF/gnfjA9MsdG+UNzUKciWYpfmj6xh3iWPC7RNY1pUIasEvjllxIdc/22QmPtIoBga2t0NxI51gMRMktN1TTfEXfb1qy4MggBT7CCYJwN2t1kX2/D40TEYUv2fxEVcQu3bys5BvAMzFv+nkNJuzXUIlrPH72KZtEMwyt5aqj/Yvjq/wFEyKxBOiGMSTv54EB2imu8cFDUJ16Se0vgJzjMIA5uJwjK4xlyXqebgYNEccNvga0qm3dwteeT40e+jxfvD2Eofs+KkggFjO07JXx3horNLE0I4jvAn2HgLj/BOQu06cV1Nm7LjMqAKVoFg8e+4uPXBxs0JXrtPrc7SGFrMIJuNHhgw/tQ3Oa04BK5wLJyp0fF6Wp422EjVil+31S58RHPZKjGhBbD90fNN30+y241nKGxuI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44333a3-2280-4130-f9d1-08d6e345589d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 08:20:29.7800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3840
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
> For decrypt, req->cryptlen includes the size of the authentication=0A=
> part while all functions of the driver expect cryptlen to be=0A=
> the size of the encrypted data.=0A=
> =0A=
> As it is not expected to change req->cryptlen, this patch=0A=
> implements local calculation of cryptlen.=0A=
> =0A=
An alternative would be to restore req->cryptlen in the *_done() callback.=
=0A=
It would be easier to implement, though probably less intuitive.=0A=
=0A=
Horia=0A=
