Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202216C2B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 14:48:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RgHM3Qq3zDqSK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 00:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.40; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=TLIAC/JH; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RgCz4Md1zDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 00:45:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGQ4YwpoT+zf94MKstC3KeEWdOCHS2a2zj7N882hpAG4FAKos+qjLpMXO/uxYgsWskxtK8XR0ijKxQ7mrYdgQxa4W3AFjGFgygnvUSPDPj1rocSFg4MkWj0v8qbdKiZ9BZwm5fnuOt+nJbhnN+CckOc4f2xOLsGb7bn+JcIMuvQ9K63aonDXm9f67xpgBG3JtEn4CElNZSXaisRQazzE9r5ry6wbCmUEeZ6EvZnpveMYnk0i4Jz1dP4EvWeBg3iT/qThRU9GjQMAEnhjLze79CVMKrb0+JZx1W53uzIc4QMnMaWexOwR7nC+PyAfEyqpc/z9FF1PCOLFLeXcjFOheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i02Gvs00UALHbLKEyTnrqagS3h2ysWHjsbaSrv/I6CU=;
 b=KUKnaEqY8vh7od4PfsPpTAqteTBFRZYLuxA4hMkWwuYT7R8YBByyorZkRP/rrn8t22kdRKFrdqAsr1Jj5ooWxT9Aw/rTNW79mvKsY0MZbKO0Ue57zOHRj/Dx4GOF+36uS7Lc+Ya5BN8ZXXyKtFu99NZDg7lgidNtf3xt9tjmam9YvUMFVBTrm2d+6MxesdG87Xr+J4Psj0cV1sTp3pXgBrOQRPEJxTd1UZgp1bTS9u2FKlOjuCpOqW5b9S962L1uLYEfGbPCJjh8QzGDeHcmgPRkMrOZIgrbi6WpE2D8i3PsRf7u3nSw++qqQmGpoWne2lLKjddTuJFkqkTgrl6LNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i02Gvs00UALHbLKEyTnrqagS3h2ysWHjsbaSrv/I6CU=;
 b=TLIAC/JH8R1wk8XOSoXcuJeLAWi7iKWz8f67JeEVJoxVBBdbgc/WtWIAuoWDPZVoGITOonYQnc4PdK0FIaC4l75Pe58uwsJzSTLXbqIY0JbcwRPivmZyIIuMQ/MLmLbSSnz20fpDBCx+N08OSSVNP61Ow2XllAPx1A1Ez0bgqcI=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3357.eurprd04.prod.outlook.com (52.134.7.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 13:44:53 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 13:44:53 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Aymen Sghaier
 <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, Atul Gupta <atul.gupta@chelsio.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, =?utf-8?B?QnJlbm8gTGVpdMOjbw==?=
 <leitao@debian.org>, Nayna Jain <nayna@linux.ibm.com>, Paulo Flabiano Smorigo
 <pfsmorigo@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] crypto: Replace zero-length array with flexible-array
 member
Thread-Topic: [PATCH] crypto: Replace zero-length array with flexible-array
 member
Thread-Index: AQHV6y4EbuWdz4bmOUu9w0eHD4o4iA==
Date: Tue, 25 Feb 2020 13:44:53 +0000
Message-ID: <VI1PR0402MB3485175AB5B3092409DC26AA98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20200224162100.GA25697@embeddedor>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3278bee4-f6f6-40bb-9fb5-08d7b9f8e4bd
x-ms-traffictypediagnostic: VI1PR0402MB3357:|VI1PR0402MB3357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB33576059C21239CFCE01684E98ED0@VI1PR0402MB3357.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(189003)(199004)(91956017)(186003)(4326008)(76116006)(64756008)(8936002)(9686003)(5660300002)(7416002)(66476007)(66556008)(55016002)(66446008)(66946007)(86362001)(966005)(54906003)(81156014)(44832011)(8676002)(26005)(71200400001)(316002)(110136005)(2906002)(7696005)(33656002)(52536014)(81166006)(6506007)(53546011)(478600001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3357;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eGBh3U1U8SeTeduMEOUHubGsQitpIcAGCzS9wF6beNbm5lrBN5n/Q/nSAQDs0eVyz6+kmtLfWqM4MQ4+5HlwTQWflJYPb60C2Za8i8hvS26je+/NXXOKAw4vOiipXajB4eLUDbixHLtzTYkgTTQpk5grfGoAjL95CSho8+iU5XLOYu8im1UYe+3HIHfq7RQBh0YMIaTbZXhACKxUPB0gmRVr2aqLjKRHe/msK2Hl0PdzOvyErM8wwpAJsICEgOHoEYIMOvY2efIBkvMUFO/6wA41cSHrxwrpLxWmS/0W0FCW150LOXvq5Bap7Q4xVaZnuwQ9iDMmzjT81RrR6l+raAuModTs7lXAuJZZtsVPSAK1xJ2BKREQOR0QcHGZ31pgvlVsFTphfu8edrxtOttO/LVq+KZtGzbw4y8dS+5lJqRQ3FOsXHnS1C4Nbxqaaqy+fXJnPxz6QygSnjwMMDjn9bhgNyAD0Ja9nn/aa9TnUxtOMoA8xM/DF7laZ4RgQybe6ihoZM7ErjMjNIsUkmyhm+535qzkWKw9cJOLO1Js38nim4IE40Gupyy1q+l/dstqdjUMeaoD1VA15lZWgByfgQ==
x-ms-exchange-antispam-messagedata: 5SOQ4RyOhwy5Ttw8Pn/7KmEhGTrVn6ez7LtqYxhKP5oxXokLM+5r16WHQk5x/h1RBvykXTtUriwmlKqLybiJEz76RRuMHVekJgWfdMHR1G4oe8Ht5rrjUzxephQHVaZ8ycyhN09a3aiDurpD6QfqfA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3278bee4-f6f6-40bb-9fb5-08d7b9f8e4bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 13:44:53.5925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nERPuxWiJAjXwWMbSxQSUqPw19o1m2lxSt9eRWo+jBi05Wv+TFiqRNDtIDxP7jcg3jUhwhkmgxm01Pur2MKz1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3357
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMi8yNC8yMDIwIDY6MTggUE0sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gVGhlIGN1
cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBhcnJheSBsYW5ndWFn
ZQo+IGV4dGVuc2lvbiB0byB0aGUgQzkwIHN0YW5kYXJkLCBidXQgdGhlIHByZWZlcnJlZCBtZWNo
YW5pc20gdG8gZGVjbGFyZQo+IHZhcmlhYmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzIHRoZXNlIG9u
ZXMgaXMgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXJbMV1bMl0sCj4gaW50cm9kdWNlZCBpbiBDOTk6
Cj4gCj4gc3RydWN0IGZvbyB7Cj4gICAgICAgICBpbnQgc3R1ZmY7Cj4gICAgICAgICBzdHJ1Y3Qg
Ym9vIGFycmF5W107Cj4gfTsKPiAKPiBCeSBtYWtpbmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJv
dmUsIHdlIHdpbGwgZ2V0IGEgY29tcGlsZXIgd2FybmluZwo+IGluIGNhc2UgdGhlIGZsZXhpYmxl
IGFycmF5IGRvZXMgbm90IG9jY3VyIGxhc3QgaW4gdGhlIHN0cnVjdHVyZSwgd2hpY2gKPiB3aWxs
IGhlbHAgdXMgcHJldmVudCBzb21lIGtpbmQgb2YgdW5kZWZpbmVkIGJlaGF2aW9yIGJ1Z3MgZnJv
bSBiZWluZwo+IGluYWR2ZXJ0ZW50bHkgaW50cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2UgZnJv
bSBub3cgb24uCj4gCj4gQWxzbywgbm90aWNlIHRoYXQsIGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRp
b25zIHdvbid0IGJlIGFmZmVjdGVkIGJ5Cj4gdGhpcyBjaGFuZ2U6Cj4gCj4gIkZsZXhpYmxlIGFy
cmF5IG1lbWJlcnMgaGF2ZSBpbmNvbXBsZXRlIHR5cGUsIGFuZCBzbyB0aGUgc2l6ZW9mIG9wZXJh
dG9yCj4gbWF5IG5vdCBiZSBhcHBsaWVkLiBBcyBhIHF1aXJrIG9mIHRoZSBvcmlnaW5hbCBpbXBs
ZW1lbnRhdGlvbiBvZgo+IHplcm8tbGVuZ3RoIGFycmF5cywgc2l6ZW9mIGV2YWx1YXRlcyB0byB6
ZXJvLiJbMV0KPiAKPiBUaGlzIGlzc3VlIHdhcyBmb3VuZCB3aXRoIHRoZSBoZWxwIG9mIENvY2Np
bmVsbGUuCj4gCj4gWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvWmVyby1M
ZW5ndGguaHRtbAo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMjEK
PiBbM10gY29tbWl0IDc2NDk3NzMyOTMyZiAoImN4Z2IzL2wydDogRml4IHVuZGVmaW5lZCBiZWhh
dmlvdXIiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9A
ZW1iZWRkZWRvci5jb20+ClJldmlld2VkLWJ5OiBIb3JpYSBHZWFudMSDIDxob3JpYS5nZWFudGFA
bnhwLmNvbT4KCmZvciBjYWFtIGRyaXZlcjoKCj4gIGRyaXZlcnMvY3J5cHRvL2NhYW0vY2FhbWFs
Zy5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9jcnlwdG8vY2FhbS9jYWFtYWxnX3Fp
LmMgICAgICAgICAgIHwgNCArKy0tCj4gIGRyaXZlcnMvY3J5cHRvL2NhYW0vY2FhbWFsZ19xaTIu
aCAgICAgICAgICB8IDYgKysrLS0tCj4gIGRyaXZlcnMvY3J5cHRvL2NhYW0vY2FhbWhhc2guYyAg
ICAgICAgICAgICB8IDIgKy0KClRoYW5rcywKSG9yaWEK
