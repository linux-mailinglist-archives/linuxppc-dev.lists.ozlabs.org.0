Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E00344601
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:41:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3wcp2TKMz30DW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jmdR0Ses;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.58; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.zang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=jmdR0Ses; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3wcH6pLjz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 00:40:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHl2orBAhrMh/H9Rr7DZecJQuDyd7tafdQ53jr+3DjSDNKOVExPTpPWrjBM9TzURFFFLRdZvqiHicLVmbV5r/dpS1ZMS4F/E/qoF8F7fECfkg9RNBpSgUIZntvunF/ef7OwJoFOValc7TYtk3ZyPn9HgBflEKO6RGBewLwzLKXWQU8qbwQ0JzQPaY/skyIzeMikBt8r/a1glLpPDx3bltpdAakn5wjySMKo2C539tQyhx1z1POC/ACy6/8//P2rZlXTY08WhXHrTpFn96BQZuSKYflgYMn3vM7sFWtpy59f617eQj6gad2P4nOum830ilMEBnuFYidX9LKuweWbbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKqh++oX7Zt6nJpqVqI89wscfmjEKsMhztCrswjTVKY=;
 b=JDz71OpMRtQ6Pih978vbv/HdVWYk6OSySFtCD8pNmlLqh+Z1rAjzOi67f7P2jWbcPlJ7tfdtzhlRTYrH5lpR1+p8oAp5J7OV5kpb++Bbf6Qpc1xA4kk7Acz4KnMMvKilyCRvm9Vtzb7sXh5oV62s9sslbTd1nzZKVyIt1B4tRk6H6iTMtOaTj95P+XCpE90LfMWDPNFeyyMD8uJ0nDElWld7jTjHRO4VY7NEx+ch+QTrRbfvLlWz7cZShmG2t8UQnp/GIll3w8z9Re70Es1Gr+1AACz1/2kS8CVltDQ/R6m0zVsN+TjEAVd3cFV6Sg0KkGkZTjztgWXE59AukVLgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKqh++oX7Zt6nJpqVqI89wscfmjEKsMhztCrswjTVKY=;
 b=jmdR0SesGaposubr6DPXvV6CzntIp2lxSvl+6IVFRLW5gExtz1tDDKvgWVnAyenEhi45c5xpwd47ooV20RRJcxwvauEwEjcXJMEm4T/Zs1ZfPtk6WCs9vUXMX7zol7PzgDmhneMH/Etvs38LfFXhnaPz+lXW1srfONNRmr42xG4=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by VI1PR0402MB3456.eurprd04.prod.outlook.com (2603:10a6:803:7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 13:40:16 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826%2]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 13:40:16 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, "M.h. Lian"
 <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
Subject: RE: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Thread-Topic: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Thread-Index: AQHW067swcgbu9wBmkKgbXrNx0haraobFvQAgA2nIACAUJxCgIAXMDMAgAAPvDA=
Date: Mon, 22 Mar 2021 13:40:16 +0000
Message-ID: <VI1PR04MB5967D3FCEE442AF30738939B8B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20201216131944.14990-1-zhengyongjun3@huawei.com>
 <20210106190722.GA1327553@bjorn-Precision-5520>
 <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
 <YEUdSZpwzg0k5z2+@rocinante>
 <20210322124326.GD11469@e121166-lin.cambridge.arm.com>
In-Reply-To: <20210322124326.GD11469@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [72.177.85.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab813604-a0b2-472f-2a1f-08d8ed380746
x-ms-traffictypediagnostic: VI1PR0402MB3456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB34568646F1D49631F79737678B659@VI1PR0402MB3456.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0OVKhn3Y0VMKGZFHD1gi89doFVtpHp8pWcZCK/FTDzPdXwelbSSnM7OBYhaJu3JBSuI6Y3LB92+SxePx85LaHTXVINCuJSdyNLR8tEPmbXFbxgGb7LarqOy4P2ubadisBwpUk0JFx4wEutbNUNw39Rj3n3Jj+u5I04WM0GO3Kpg2xhCK390jDn5m2TA6r6o5YLYXwh5IukdmvcslMeNNHotFTgkqkzzH33NF89RZ3yNnWDsOwZeKGZ+dGC84VcEa+SDIZctFknZsbbiU2ezISSkxFaJtVIAvKY28+6u/cSAYV8D8/tYl0YJsUeCgfy5P/yFuMpZbVjiqeT4Ng6eALuRaXYnyfjhT34nK3v+LfmYHglTKJAPl4D03SyMUeahSSjsqLSUONDfgowcGtvdLq6wb96p3deKutjNP85xvZvfoM8/Wo8uEIFI63noZTyau0QTUtCYhXz28zerZGDB/z8+NwauaGHDfGVqVXYaxWJ7/giRHQyxNS9WqXdPMyTK/apEfWmfacdgVTx8XNEo9qB23n26CEq+1mMq41w0xm/f5mydAnA93XYa4Or+7P7H99Lux+4bpEh+upmZB7Y4C7LHkwWi30i5N1aFINjdXZ65fmIBsG8uLl0ElyQPRt+QrP725Ix5F4lRn950mtfhuvrB05UB1UoE5Vz2ouvAQ4bQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5967.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(86362001)(33656002)(83380400001)(66556008)(66946007)(5660300002)(8936002)(66476007)(6636002)(26005)(66446008)(8676002)(66574015)(2906002)(76116006)(4744005)(478600001)(52536014)(64756008)(110136005)(55016002)(4326008)(44832011)(38100700001)(316002)(9686003)(186003)(71200400001)(7696005)(6506007)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ykWGt9fZZwISCcx5EE0D9pwmBnLLgeDgftrg9FkZ/5h5P33fr+Z1OxYug48QROoLVVpwE2Zh1Wv7R8mIR3K+OFGmBcpq5FqQWVKQlyurSpSY4IZVpxwYgzwi3p0Gi+ySqJcBvOHm5YOmc2P8G0wT6sTUbZpmnY5y2xCXF2KcmDaflWZrDU9Hqz3zjDvU2Zljb7BZeUOrll4iXdDpzttXVQ1yLIft+R+RmnG5MIpOeJ/qNrrYH5qJ73Y9wVOL6B9R0Cq4rSuus2vGxmaM2+UGnwr1v5KCJgySlqtqkRSYYBNU7/wEIl+tqs64w+U6rDP9Iv5nFcxRofsWo60FhkDP/6P4nvs/TvQBMNPOToA0D15SstASwa8TwC91nHZWLGLSKBu5pV1M4JSJ0NheamzIs7g5V/+6hUdMW8YbMTPpcLtFIpR2SLjMt/kcFycU6VKmcEU0moezle+a+2aciz9tqEv8tzoJoJeG/RkZXABzpg48XfjlttGe5G/jR6DJf1tXiz+dVOUPqaA19M3AGJDTWOctDcA8uEhQOYdHZv7oTcYWyIDSdKX1qZCFwi2qvEyYW9GhWAM6OIfU8Zgay9j2qo4usBuFbK1HsSq80DnF7TBAt4t9/BErwQ9DL5aUxTzaYBggdqQvoXZQ/L27GIyiCzDVB8p0JJOwK6EjBdrk1cQZKC7EYtGNvQhlIiXSnoQx7MwZWEph8Dy/y6S+JJ0E5y2ELumXpGPaKrDs2l+G7BQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab813604-a0b2-472f-2a1f-08d8ed380746
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 13:40:16.7836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woS37cya3l6XgzBQ0RN8NpecGgNJB2AJuFsC7NUGNb5JNoC9lI5duhxYt668GQepKYOXP3yx+UrCwLiQobAxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3456
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WWVzLiAgSXQgaXMgbWFpbnRhaW5lZC4NCkkgd2lsbCBzZW5kIG91dCBhIHBhdGNoLg0KVGhhbmtz
Lg0KUm95DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMb3JlbnpvIFBpZXJh
bGlzaSA8bG9yZW56by5waWVyYWxpc2lAYXJtLmNvbT4gDQoNCk9uIFN1biwgTWFyIDA3LCAyMDIx
IGF0IDA3OjM2OjU3UE0gKzAxMDAsIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToNCj4gSGks
DQo+IA0KPiBbLi4uXQ0KPiA+IEkgd291bGQgcmVxdWVzdCBOWFAgbWFpbnRhaW5lcnMgdG8gdGFr
ZSB0aGlzIHBhdGNoLCByZXdyaXRlIGl0IGFzIA0KPiA+IEJqb3JuIHJlcXVlc3RlZCBhbmQgcmVz
ZW5kIGl0IGFzIGZhc3QgYXMgcG9zc2libGUsIHRoaXMgaXMgYSB2ZXJ5IA0KPiA+IHJlbGV2YW50
IGZpeC4NCj4gWy4uLl0NCj4gDQo+IExvb2tpbmcgYXQgdGhlIHN0YXRlIG9mIHRoZSBwY2ktbGF5
ZXJzY2FwZS1lcC5jIGZpbGUgaW4gTGludXMnIHRyZWUsIA0KPiB0aGlzIHN0aWxsIGhhc24ndCBi
ZWVuIGZpeGVkLCBhbmQgaXQgaGFzIGJlZW4gYSB3aGlsZS4NCj4gDQo+IE5YUCBmb2xrcywgYXJl
IHlvdSBpbnRlbmQgdG8gcGljayB0aGlzIHVwPyAgRG8gbGV0IHVzIGtub3cuDQoNCk1pbmdodWFu
LCBNaW5na2FpLCBSb3ksDQoNCmVpdGhlciBvbmUgb2YgeW91IHJlcGx5IGFuZCBmb2xsb3cgdXAg
dGhpcyBwYXRjaCBvciBJIHdpbGwgaGF2ZSB0byB1cGRhdGUgdGhlIE1BSU5UQUlORVJTIGVudHJ5
IGFuZCB0YWtlIGFjdGlvbiBhY2NvcmRpbmdseSwgeW91IGFyZSBub3QgbWFpbnRhaW5pbmcgdGhp
cyBkcml2ZXIgYW5kIEkgd29uJ3QgbWFpbnRhaW4geW91ciBjb2RlLCBzb3JyeS4NCg0KTG9yZW56
bw0KDQo+IEtyenlzenRvZg0K
