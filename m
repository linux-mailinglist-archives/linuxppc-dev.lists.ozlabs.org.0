Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 877741F634
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:08:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453xH05CB8zDqFs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 00:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.41; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="rYNRVOFX"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20041.outbound.protection.outlook.com [40.107.2.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453xCP52HdzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 00:05:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuWhjNo0yAfWVBkZhdwfp7qUe2X1r9MNjzX2ykJy+2M=;
 b=rYNRVOFXJ0KMJqnGQb3lXawAj2BfeP352mGNyuZ2C5tK+X12b+4a9dYrqhnoquaezy8ptsYYqJfM9MFdlR7KjGsCVWCPI45UYjTj9h9+Qrqs+al4woqKFwqe0n10/48Bsu0IWlRHd386h0stkqQugv0lzjP2ZtC582Z1+jeOrvc=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3533.eurprd04.prod.outlook.com (52.134.4.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 14:05:11 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::dd3c:969d:89b9:f422]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::dd3c:969d:89b9:f422%4]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 14:05:11 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] crypto: talitos - fix skcipher failure due to wrong
 output IV
Thread-Topic: [PATCH] crypto: talitos - fix skcipher failure due to wrong
 output IV
Thread-Index: AQHVCxnMCzIthJlccEajEJwlNrxcew==
Date: Wed, 15 May 2019 14:05:11 +0000
Message-ID: <VI1PR0402MB34858D80A15D4B55F64570E398090@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <a5b0d31d8fc9fc9bc2b69baa5330466090825a39.1557923113.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7fdb8af-9fd2-46b4-c1e6-08d6d93e5888
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3533; 
x-ms-traffictypediagnostic: VI1PR0402MB3533:
x-microsoft-antispam-prvs: <VI1PR0402MB353302E4E36E8C6ADAF3DDE698090@VI1PR0402MB3533.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(136003)(376002)(396003)(39860400002)(199004)(189003)(53546011)(81156014)(81166006)(8936002)(6506007)(8676002)(76176011)(74316002)(54906003)(316002)(7696005)(305945005)(7736002)(33656002)(3846002)(102836004)(2906002)(99286004)(229853002)(110136005)(256004)(14444005)(6116002)(6436002)(55016002)(9686003)(66476007)(52536014)(5660300002)(44832011)(71190400001)(66066001)(68736007)(26005)(71200400001)(66446008)(66556008)(64756008)(186003)(4326008)(53936002)(86362001)(476003)(6246003)(478600001)(14454004)(25786009)(486006)(66946007)(446003)(76116006)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3533;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tqRKJ8tn+veTogvMVEoaMg8qQ++6AsiP2XHRa2EwSnXCvbywl8PLczPTwZFA8hrZ3VeWGGxLBVGWhfP89SHEfOQ6NoQjU1Njse/DfmVq3LHNMxRZL7R54W+9xJ54rjUQ2faCGwJRIM6XR1+eyMieuvpOe74TlcpKIrAhkIFnekkIfPhrDFwOy4BKDyraR1AXrWz+UjucDSV6sAC4eM559kHOQe7/kyTClYDKwRGJ9dHb9+E/pi+GekeTIu+O15ORskuf7biBhXLhEzyEY6YYV8CC8C8EtQ+4XnuZlbsTm1TlAmbK+nfzMN9icSX3RV48nwGEHKjkWwcOrzGZuYNbUr9lJP/OkQNtIrhQVikWtnRLiNKdKS4DJYrzI0hA+SxRD/5V5QYZuc3hjz7foG8ReuPKSlv1KgrE4j+n9hkpDK0=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fdb8af-9fd2-46b4-c1e6-08d6d93e5888
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 14:05:11.4920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533
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

On 5/15/2019 3:29 PM, Christophe Leroy wrote:=0A=
> Selftests report the following:=0A=
> =0A=
> [    2.984845] alg: skcipher: cbc-aes-talitos encryption test failed (wro=
ng output IV) on test vector 0, cfg=3D"in-place"=0A=
> [    2.995377] 00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41=
=0A=
> [    3.032673] alg: skcipher: cbc-des-talitos encryption test failed (wro=
ng output IV) on test vector 0, cfg=3D"in-place"=0A=
> [    3.043185] 00000000: fe dc ba 98 76 54 32 10=0A=
> [    3.063238] alg: skcipher: cbc-3des-talitos encryption test failed (wr=
ong output IV) on test vector 0, cfg=3D"in-place"=0A=
> [    3.073818] 00000000: 7d 33 88 93 0f 93 b2 42=0A=
> =0A=
> This above dumps show that the actual output IV is indeed the input IV.=
=0A=
> This is due to the IV not being copied back into the request.=0A=
> =0A=
> This patch fixes that.=0A=
> =0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
While here, could you please check ecb mode (which by definition does not h=
ave=0A=
an IV) is behaving correctly?=0A=
Looking in driver_algs[] list of crypto algorithms supported by talitos,=0A=
ecb(aes,des,3des) are declared with ivsize !=3D 0.=0A=
=0A=
Thanks,=0A=
Horia=0A=
