Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B99813CA9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 13:59:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NT7b4d6gzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 21:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.85; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="T98xkkvU"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10085.outbound.protection.outlook.com [40.107.1.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NT5g4FjHzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 21:57:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECpbNgV8uOXKol9qXRMchw2RjsYH5zpamqfReQDkrCI=;
 b=T98xkkvUq0WUQfmxcwwNI1B6CTHwaMAcrVcgupFEmA4kLbPoRyMe+fVVSUqz+TvdnrSVjJ348k5yvs/DLHwvmFDI3ddeGeuKMTZi98KKpCRmLtvXKuZLgFUNz2KyybnzUn/yONrKQOSWotLLFpjX5oq3xlVKNBRFnLn/VVabZ18=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3567.eurprd04.prod.outlook.com (52.134.4.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 11:57:34 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 11:57:34 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v1 2/5] crypto: talitos - move struct talitos_edesc into
 talitos.h
Thread-Topic: [PATCH v1 2/5] crypto: talitos - move struct talitos_edesc into
 talitos.h
Thread-Index: AQHVHFtoqsM5u9K3R0ScM4yhQppwKQ==
Date: Tue, 11 Jun 2019 11:57:34 +0000
Message-ID: <VI1PR0402MB3485848D81EF07419EB0128F98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
 <108a23c4d2f0803b1302bc00c7321d799e42edc1.1559819372.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf2f448c-c6da-41e7-b7ff-08d6ee63fdac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3567; 
x-ms-traffictypediagnostic: VI1PR0402MB3567:
x-microsoft-antispam-prvs: <VI1PR0402MB35674940D4D2FAF5F6CABB4498ED0@VI1PR0402MB3567.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(55016002)(6436002)(73956011)(54906003)(9686003)(110136005)(33656002)(486006)(66066001)(476003)(44832011)(186003)(316002)(66446008)(26005)(446003)(66556008)(66476007)(52536014)(2906002)(229853002)(99286004)(76116006)(66946007)(64756008)(7736002)(4326008)(81166006)(81156014)(8676002)(25786009)(14454004)(305945005)(74316002)(76176011)(478600001)(6506007)(53546011)(3846002)(6116002)(68736007)(71200400001)(6246003)(86362001)(71190400001)(4744005)(53936002)(102836004)(256004)(8936002)(7696005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3567;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ti6L6IEyQbgh0KQhV11mQPOTAdRDAo7UUK/OjX9yWsuVCSEnlsnGYv90H24UM3wBdYept5c6Gr/+FrsmgD38ANFvGCH292Ef88EsWMyXvGft8JOljtLYdm9R0mubcWRKHOlOwwtj0YwPDnn1frSmp+Fx50VuE6kOkLTrMwaj/+fqP1Yzw7Gp3UNDUTVbftFctS/xUJHPVlZBPv7bGxgcj5btKFFGXWYNdSJqit6H7qn2Tk85z1yzQKS8W6lFSy1FJmAaxZrz2ES4jIr/SCPOkGgvGQIwdCt0+lg8fxuaF/9B2xMgWNKway74Fu/75rbZ4MYRbnRu7lG15ahGNPXzCqXGYrG4ndPU0yBO2/nVwutpjibmkJNgWos/ogNKExKmLJnkWo4iUTyXaxtRhQWih+E7lHilw7udVzk8mCfBIdQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2f448c-c6da-41e7-b7ff-08d6ee63fdac
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 11:57:34.3362 (UTC)
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
> Next patch will require struct talitos_edesc to be defined=0A=
> earlier in talitos.c=0A=
> =0A=
> This patch moves it into talitos.h so that it can be used=0A=
> from any place in talitos.c=0A=
> =0A=
> Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash =
on SEC1")=0A=
This isn't really a fix, so please drop the tag.=0A=
=0A=
Thanks,=0A=
Horia=0A=
