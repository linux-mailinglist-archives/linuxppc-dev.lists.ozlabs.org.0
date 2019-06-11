Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8D3D2F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:48:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbYM6QJTzDqtm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.77; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="nX9Y2AlR"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nb8h4pyszDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 02:30:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBmbstKvPK2WLXM1xmmmhCIUkvtodyhsFlA454TXjYU=;
 b=nX9Y2AlRB4/s0a98mnqFkRQRahcfKrO1VHXrmC8/ufDATk80bij0QwY9OONafqOv30RApSqbl/a1sX3O+Z5/w7HgBoOl/fCi1nOq/uF/5K0CymlgivKM7VGZs40A94BkAfzI2S7ukNI/pS6G7DG1gWN9UGgCHXCuKjwNLKEfJ+A=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB2799.eurprd04.prod.outlook.com (10.175.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 11 Jun 2019 16:30:34 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 16:30:34 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 0/4] Additional fixes on Talitos driver
Thread-Topic: [PATCH v2 0/4] Additional fixes on Talitos driver
Thread-Index: AQHVIGOH8ah5xSLD4UOplfJkXECTiA==
Date: Tue, 11 Jun 2019 16:30:34 +0000
Message-ID: <VI1PR0402MB3485AD965F36709F27EFB72698ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34853CAF031426F4183FE29B98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <0cb7c534-6e48-5284-899c-c0ef85c3c126@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3e86c67-0c46-4806-a870-08d6ee8a2127
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB2799; 
x-ms-traffictypediagnostic: VI1PR0402MB2799:
x-microsoft-antispam-prvs: <VI1PR0402MB2799F8B21E76E9687BD646DB98ED0@VI1PR0402MB2799.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(26005)(14454004)(99286004)(6246003)(4326008)(33656002)(66946007)(66556008)(7696005)(64756008)(66476007)(66446008)(25786009)(256004)(76116006)(73956011)(102836004)(53546011)(76176011)(6506007)(316002)(8936002)(81156014)(8676002)(81166006)(305945005)(6116002)(3846002)(7736002)(6436002)(2906002)(74316002)(229853002)(478600001)(55016002)(53936002)(68736007)(9686003)(486006)(476003)(446003)(54906003)(110136005)(186003)(44832011)(86362001)(71200400001)(52536014)(5660300002)(71190400001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2799;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Upw35HGlCh+ue53bfE7wM/9LdXjhl84nvOPuDmZb4OghYu9pTNj0lZCO1BvCadGwJ63jUnSIhyoM6sJyn0PEqEHFoZny7OxKTdJk/pLTt1ER6V3gtK4kzPMBoMNSreqgUrYNnPsoh4TAZyROiM3cHStOU+J5fAOiZlBXLGZNId/T9BI7dT4Fiby33UWfk3oK+xGOpbHFgTdN1s8K84FsnGjSmuEybemOAFP5GiVBJ77ObTFrxQV7GmfCy+s3+XrQ5s9X2JMleIGQevCZKxn7ihCVy6X/F842HyftdWL4tlyElIPX8Xcj2DwtZ6iKhNCgVNeVwqoQbcTxzB8AxKYUDULDR7aluw4BauCxRsOiYVFovhnDN43WSPy+nh38IbQ0bd5OtX/O1rZrjQi6cSAAXUOm9BCqkFSTbKgcBVr+92A=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e86c67-0c46-4806-a870-08d6ee8a2127
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 16:30:34.7609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2799
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

On 6/11/2019 6:40 PM, Christophe Leroy wrote:=0A=
> =0A=
> =0A=
> Le 11/06/2019 =E0 17:37, Horia Geanta a =E9crit=A0:=0A=
>> On 6/11/2019 5:39 PM, Christophe Leroy wrote:=0A=
>>> This series is the last set of fixes for the Talitos driver.=0A=
>>>=0A=
>>> We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and=0A=
>>> SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:=0A=
>>>=0A=
>> I am getting below failures on a sec 3.3.2 (p1020rdb) for hmac(sha384) a=
nd=0A=
>> hmac(sha512):=0A=
> =0A=
> Is that new with this series or did you already have it before ?=0A=
> =0A=
Looks like this happens with or without this series.=0A=
=0A=
I haven't checked the state of this driver for quite some time.=0A=
Since I've noticed increased activity, I thought it would be worth=0A=
actually testing the changes.=0A=
=0A=
Are changes in patch 2/4 ("crypto: talitos - fix hash on SEC1.")=0A=
strictly for sec 1.x or they affect all revisions?=0A=
=0A=
> What do you mean by "fuzz testing" enabled ? Is that =0A=
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS or something else ?=0A=
> =0A=
Yes, it's this config symbol.=0A=
=0A=
Horia=0A=
