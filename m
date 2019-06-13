Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ADC435DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:24:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PjbZ4kg7zDrFL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.46; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="iXvIxfgd"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PjWn5WPBzDrLK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:21:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1zWiHG4Rx2y6vEIWUAIabqXfzkEo2b5uBF0T7kDjJo=;
 b=iXvIxfgdEGqXjM5RTZ7NT4+pHlBHgrMy5jBlMBY/4m/3Y/OXfQf8BSGiNjql3VH9/voXU6jCLohLoN51Rs1dVTOk22GUjG4OzSPullOGa4hkPk/iAKhg2Ze/+WNFTNiOrFy2O+hAuMG3JuOPI6K4OYXBE5AELfF0lHAh6E/T4w8=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3743.eurprd04.prod.outlook.com (52.134.15.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Thu, 13 Jun 2019 12:21:00 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 12:21:00 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 4/4] crypto: talitos - drop icv_ool
Thread-Topic: [PATCH v2 4/4] crypto: talitos - drop icv_ool
Thread-Index: AQHVIGOJrdRSUhmoG0O2embG4loeGA==
Date: Thu, 13 Jun 2019 12:21:00 +0000
Message-ID: <VI1PR0402MB34852F501B30A09A4E515B4798EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <39be46fb40ad77e40ae5c1a979ca6a2ccfab244a.1560263641.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [78.96.98.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 447ced5e-4048-4398-fbe1-08d6eff99881
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3743; 
x-ms-traffictypediagnostic: VI1PR0402MB3743:
x-microsoft-antispam-prvs: <VI1PR0402MB37437C547B3A523FBA52AD1E98EF0@VI1PR0402MB3743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:192;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(5660300002)(52536014)(305945005)(14454004)(71190400001)(71200400001)(8936002)(81156014)(81166006)(8676002)(256004)(446003)(110136005)(54906003)(316002)(558084003)(7736002)(33656002)(478600001)(44832011)(486006)(476003)(186003)(91956017)(66556008)(66446008)(64756008)(66476007)(73956011)(66946007)(76116006)(86362001)(55016002)(9686003)(102836004)(6506007)(53936002)(4326008)(6116002)(3846002)(76176011)(7696005)(6436002)(74316002)(68736007)(25786009)(229853002)(66066001)(99286004)(2906002)(26005)(53546011)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3743;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7mHtrdDElPOrqD04F/qPIoDayRw1yGF4mzd8C6sWbkHs4cf4Zm7ps0OBGnfUxFmzHAEV6p4oljCxV2u+fQEGbsBdDiDCwLYg+WwiKwi7DiPakudDSBEwIYpuObqdJlSUP4IZg1z33szoW/0R1SaQwC6a2O7HlDW2GmZD3kSKedkWpq0/IDgqpGdl2PUwltuxKKX9iVuDfzeRVGutM8oYF7GjiWl8ZMk2Qu5Tc/WbS5GIMUuu+K0MEjq3/ukpRlPzqL8TQmgtW4ahyPXVsyEOUw5lAw2jcPR/DW9OSb4OzoH6Xw7WCC15Ijivpn1xfdTUMlJg8y8ugmQy0oH+LfyPn1ii2BqdBdxH9PSgkHnGrll3BIotzXiqeLTvkE/6xPLn6HLFhzjJt771ZAz7Px1ewAJM7jIdVzkvG5SQcxMGDMo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447ced5e-4048-4398-fbe1-08d6eff99881
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 12:21:00.2985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3743
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
> icv_ool is not used anymore, drop it.=0A=
> =0A=
> Fixes: 9cc87bc3613b ("crypto: talitos - fix AEAD processing")=0A=
I can't find this SHA1.=0A=
=0A=
Are you referring to commit e345177ded17 ("crypto: talitos - fix AEAD proce=
ssing.")?=0A=
=0A=
Horia=0A=
