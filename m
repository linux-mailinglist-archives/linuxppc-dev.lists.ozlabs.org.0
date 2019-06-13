Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA9435C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:15:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PjPb5677zDrDJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:15:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.73; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="mw7lqDtH"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PjMG09VRzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:13:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv69o6ZuYfDc5tqvervHiRSdpbKRGL/jmvkvv1MTHkw=;
 b=mw7lqDtH/qgnwCtHpwK5UCtmfVfLR9iKe9OE38W8i7nEdELbXd6UbdWGIDtVywdrGSM+F8mRa2o8a2JWiLbn4mJNayJHUw2yk4XH5jkKs3GZbJZ+pWOFSCf7j42YkUIr917NIIgmwr9ST73Uq6fZQYLfIgjVdwL0u1J+Qd0QVCo=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3581.eurprd04.prod.outlook.com (52.134.4.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 12:13:30 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 12:13:30 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 1/4] crypto: talitos - move struct talitos_edesc into
 talitos.h
Thread-Topic: [PATCH v2 1/4] crypto: talitos - move struct talitos_edesc into
 talitos.h
Thread-Index: AQHVIGOHWjiLuJ/iA0u2rV751i1YWQ==
Date: Thu, 13 Jun 2019 12:13:30 +0000
Message-ID: <VI1PR0402MB3485C0F4CB13F8674B8B5A5598EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <d9b5fade242f0806a587392d31c272709949479f.1560263641.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [78.96.98.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f215663-958c-4a03-700d-08d6eff88c39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3581; 
x-ms-traffictypediagnostic: VI1PR0402MB3581:
x-microsoft-antispam-prvs: <VI1PR0402MB3581E0EE7B459D9995FD171998EF0@VI1PR0402MB3581.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(366004)(346002)(199004)(189003)(76116006)(6436002)(66476007)(66066001)(446003)(53936002)(5660300002)(186003)(316002)(26005)(54906003)(6246003)(110136005)(55016002)(99286004)(486006)(71190400001)(64756008)(73956011)(71200400001)(66556008)(66946007)(478600001)(7736002)(66446008)(68736007)(91956017)(229853002)(6506007)(44832011)(8676002)(53546011)(81156014)(81166006)(8936002)(86362001)(256004)(25786009)(33656002)(102836004)(9686003)(4326008)(305945005)(14454004)(3846002)(52536014)(476003)(7696005)(76176011)(2906002)(74316002)(6116002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3581;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BDUcSMVCA3EhwEB5tA2oqCNhihgKWsKdIw+dxzNg+LRxFERORmViQyRiy+LglFTG5NFlUCxF4XffLWQUkGDnAuhuvfzrTvCI9+4fNew6hP7iY5LGULqGu6QBTOtxw3iX08axOng9WiLhG4L7aOwTKVMz+GQUcnuExFVpL2E4l6/PHW+7Dzu2Q5TXWCxdfvTzEzxBMBZem4DnQDO/KBsP3+y00cf62URdI96w0pOiHeF3rAbKDkdO4gkG4SwrNSniKb8EWbX7TMimGinUpxPsmFyZHLNfIjDoCWx8TXeMtPnibRsy7h68o8DETVwmUYXiyLrYSQuX+BaKrUeShGJ+YE7vbLyUWWzTiQKX0ov9mCuojWsjvMs9qH1HSMTweg8eSF9o8HADUYnCvBmDwP8YN62ezvl9gTy9TqkD3jC0zJQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f215663-958c-4a03-700d-08d6eff88c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 12:13:30.2046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3581
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

On 6/11/2019 5:39 PM, Christophe Leroy wrote:=0A=
> Next patch will require struct talitos_edesc to be defined=0A=
> earlier in talitos.c=0A=
> =0A=
> This patch moves it into talitos.h so that it can be used=0A=
> from any place in talitos.c=0A=
> =0A=
> Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash =
on SEC1")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
Again, this patch does not qualify as a fix.=0A=
=0A=
Horia=0A=
