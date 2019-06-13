Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A8435D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:21:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PjXN6vwqzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe0e::626;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="TkolVTuI"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PjQR6hvrzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:16:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8pubeHdJ3qZsawX6ybkUmUsvMuU/H47eerguowtxKg=;
 b=TkolVTuInkmBqLnwLWIACcDzpwStnz1x+w1AXZVpHcI8+CKdmqAxlF9jGto8eWucKFbE+y9rQ69TJFSFhbcFH3qGarzvJl0aExZZbgUHZLgBdylkl0ImawCG8zHGzAzfv2S8YD619oxPyGx34dhC6GLL5iYQTVn5HeSirng/xqk=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3743.eurprd04.prod.outlook.com (52.134.15.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Thu, 13 Jun 2019 12:16:21 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 12:16:21 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 3/4] crypto: talitos - eliminate unneeded 'done'
 functions at build time
Thread-Topic: [PATCH v2 3/4] crypto: talitos - eliminate unneeded 'done'
 functions at build time
Thread-Index: AQHVIGOIQP2x5QtZB0WoMkrOdNiB0A==
Date: Thu, 13 Jun 2019 12:16:21 +0000
Message-ID: <VI1PR0402MB3485CE6D5D9F3AF8E010378398EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <09bbce930ef6bf209c5bb5241fccc6b4dc583ba5.1560263641.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [78.96.98.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5662b4e-0a7c-4c39-4a40-08d6eff8f28e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3743; 
x-ms-traffictypediagnostic: VI1PR0402MB3743:
x-microsoft-antispam-prvs: <VI1PR0402MB3743668D73C2F079D17E70A898EF0@VI1PR0402MB3743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(5660300002)(52536014)(305945005)(14454004)(71190400001)(71200400001)(8936002)(81156014)(81166006)(8676002)(256004)(446003)(110136005)(54906003)(316002)(7736002)(33656002)(478600001)(44832011)(486006)(476003)(186003)(91956017)(66556008)(66446008)(64756008)(66476007)(73956011)(66946007)(76116006)(86362001)(55016002)(9686003)(102836004)(6506007)(53936002)(4326008)(6116002)(3846002)(76176011)(7696005)(6436002)(74316002)(68736007)(25786009)(4744005)(229853002)(66066001)(99286004)(2906002)(26005)(53546011)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3743;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l+eW8ulnS1yLmax/kwQtejfjtvYnZUqOcGU4gw7RMv379N8VMFkvS6LMCIZ+JXMnxiTPKrF0USt5LUCN6E8750iyWm+/si7EbpnBa6riHG14PqTr30P4tvcrohLEYalEhVM4YCLuMvhZM2CSuL51TzhVYNLBdU1Qn60+qJ6uxCpqtAu6qTj7OKsG0PJabJMBhbS3jcXaxpw1793t32uVZZ9IGwKVsZVCbKVtToJDoch/pt2UWgL6gGvjvfX4pWRsd9my1hhC9K77nlIabzKe0L7i+YVswQiEaYGKDGBds4M8PzBdRcU1Gr85+cKLCoduQMGnhwbAMxy2Gt6ng2bOxiV2l+MfVbYHIeA6SgaW4VKnSny7cQTtE5WDqAruJHKG70hC3XnOmIeP87v6kJGkpsLcVaxnVUXYs9OrHFj507Y=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5662b4e-0a7c-4c39-4a40-08d6eff8f28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 12:16:21.8413 (UTC)
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
> When building for SEC1 only, talitos2_done functions are unneeded=0A=
> and should go away.=0A=
> =0A=
> For this, use has_ftr_sec1() which will always return true when only=0A=
> SEC1 support is being built, allowing GCC to drop TALITOS2 functions.=0A=
> =0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
Thanks,=0A=
Horia=0A=
