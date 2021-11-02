Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0C4437AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:16:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkN4J4KxYz2yQC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 08:16:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=Dol++qKx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.102.68;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=Dol++qKx; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2068.outbound.protection.outlook.com [40.107.102.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkN3T3ccBz2xF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 08:15:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAc1H6whwf2Y+uYqmBdZQLbJ5qGcQenXO+ixHRgD812Go3Dy3zHvFHhq9C/wHbEAWUXWgvzIfZTU4sM9jQJ2iSy+VnTEZG7cP4ebuscq9QzRuzxrID3Oq2nP+6RRfyuEBhB7027uIv5lLc/7ueet8nQkeGtG7fI9Lnu8Cv9FXO6WirGMMC8g40ZP3WxkhsbB0pMBo7lTds8YhgIUuQyn5kR6FdTtqOR9VpzQWl3rBJ9P8zHDKlH/4cA4gJLFMgW4E6Y7AYYvA5VvTOMY5iowaZbzlCq9jJFc2q2NYv/T/+Jg1KN+oR+oswSsq1z10PenBaEJGE+eFsG/BBadkR/SYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4RIOQ3mpZKb0eaeBsA/45v723s6EhwZ4hsKwIgspEc=;
 b=Rja1QzdyMK6OJyeKtrSVxEiRC41gT6EPJzdbqVG2961j4ANg8DYBRyvySETUPTg0goHnGT1ShHvehi+1xAgSFVruweQ09WSVwdkqc20zukLakEpov41CGodER3TyFw7r1lvljPIkEbKzTkXow2HEn5pYQxy6fObO1fF5vH+ynQ77k6HGgMLzMep8gc7XdihRQ5JwktMwPAVqx5l2oso5+DLU33e0hDmiOUiXxo4scNM7R6/GIe3KZ/CAPuwnDTl8+LHuEW9xJIxnyQxnqzeIYKkGlfDKhKK3D1x3ePWTrC/bU5JlEuLWpw+5Ig+zZw0m+PrXOiJtSAqig1KrZEtq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4RIOQ3mpZKb0eaeBsA/45v723s6EhwZ4hsKwIgspEc=;
 b=Dol++qKxJzQn5Rs8w69A7OTovi8shchsKzJvehQ/Q761DkaAl855gAlXHinviPDvGUYYnwX+Yze2BjD0AKE4irgg0//CxgGnNhIN8+J5FcbUId4YT1p8VJG28aCMJrU3hKtSCgFiNpwe2Y+n9k2oySxP1CPCnRncjNG8IEu8DQo=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 21:15:10 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 21:15:10 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oA=
Date: Tue, 2 Nov 2021 21:15:10 +0000
Message-ID: <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
In-Reply-To: <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3fb8dce-5221-46b5-3bbb-08d99e45da98
x-ms-traffictypediagnostic: PH0PR10MB5563:
x-microsoft-antispam-prvs: <PH0PR10MB55636BF18F86AF5CC76757F8F48B9@PH0PR10MB5563.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UxiJFRT3i2RxkNnihOm4Gu8d6+9/6JiU74hEDR9h0kl1+p/omC2ZcA4KFOyNN0qT1wZQA2CLl17jM3+5/H823iGLOYJRi2Evy52fkpUhp37JcciCj2yCI2V/qvGf+mZ51jV0pM7hjM759v7WbWckOyw4AYvmOczc1pXrlfNnYVMEPp7Go5V5+W8679jXhdjKJixo5ZL9LBBlXjhXrOCXZNT6qGnBGFR10eRBJPsfKahns24gGYuYL4vkH8CIlYNPWPLVnUGpv4xPmpSiPhFv9VCcEWG2SALzpymGm1qS6NAF/nEt/OuicQGdu9ng5Nf8+ZjTi0iHT2ighCe/VqbaiyzMcdICxRSqqCPKbMzoTnzd3L0FPu0OTppp4WfJeE/7Ny24VWNwKLM+XkF8AKBq1Kpcmt78zKCNCqNHoeyFrc9hRiQ7xwQ0oOawieOgWObhq7xQhCo3T+jgCzqAEfUvXKQ11NUtzu5LzBcF0pJoNPbi3ZpRz/NhKUh800Wt8MKz3Jp2PYRYNQ+3RueLnsgmWIHq13hxxkA+uKUxiU47zUxuHZBjmoMqTpzKC78Pgk9jcG6kq5N2wj1fO1tdoZ6ihoV5hBGwa00ahUjuFRdMe8pLHbPdR2ovdeE6LVuJ/24gZbcVxuoP/vn2UqWSkXoLY2ALAnN7OIaLbuPEL8l1QN8JeA4CNsQcpmj2Lk3tBlLXYDIYlrhxhE7lhWMA/pBfnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(8936002)(86362001)(508600001)(316002)(186003)(5660300002)(38070700005)(83380400001)(6512007)(6506007)(4326008)(66556008)(76116006)(91956017)(36756003)(66476007)(66446008)(122000001)(64756008)(6486002)(8676002)(38100700002)(66946007)(71200400001)(2906002)(4001150100001)(26005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThRWDRIVVhqYXpBNlhSY25SY3dESnNZZFlzUUV1V1JaczZoREdvS2Z0QWYw?=
 =?utf-8?B?Y0pSWFJHQkRHbXMrUDZROHBjVDlFMWxOT0RuNGcwUDFTa3ZYYk9aVDZWZko1?=
 =?utf-8?B?KzBSQ25IMWZFRmdSRy9kYzFGNy9ZdWRTdjQzSmNhQWJNN3RkYmxJeEUwRDJV?=
 =?utf-8?B?akk4aGFJYldLeGxxQ0VJUG10TzBySkgxQlBnMHBLL0gzNDkxRXhFamwyTndS?=
 =?utf-8?B?dVpyZzdiSnZyaDRxNkNXNFpoTUswZEV4aEZITUZVbWVGTko1R0ZYNXUxbW94?=
 =?utf-8?B?TG8wbW1pWXVlaWhZVGtJdjZhRW9wV05DSXd2TzYzbHArRGxDbE0rUHg0RDR4?=
 =?utf-8?B?MUhxaThsanVZRWYrbkI2L09wOEZQN3R3eGVvQStVa3JwYVp5ZkdhR0lkRnRz?=
 =?utf-8?B?YzhYMUdRSkFKOFZ3YTcwdzNDM0VwclpJd3Q3S1ZqUDlMQis0dys3NERqQ1VR?=
 =?utf-8?B?N04rYXFsaEVzQ1doSjYwVUdycGhQa1NxL3drdEZJMnowRVBKdDFNR1VuSkNz?=
 =?utf-8?B?cFdxMmMwMVp1Z1NSSkFvRmR2OG9weFViSWFGRnRUUDYxdnZjUWd1TEpqeGc3?=
 =?utf-8?B?allERDVFcCtVbmkzZzNmMmpvOEtUZldJcVh1aGN3VUpXMXFiV2tzS0w2eEpx?=
 =?utf-8?B?N3JMWExBbVdwY2JqaC9adHlqM3h4R2dFcG5saThOTHNFUE9nT0Jtbk1XdTlj?=
 =?utf-8?B?UXJ2MGl2Rml5RWUydXVQcWpJaHdNSm1NN1dTOWFVOStJckJZZTZhQWVNdnVT?=
 =?utf-8?B?cTk1MlQ1c3RTZ25WWVRTZGhuQVNZbDJTcm5lVmozUndRZTVZNEp4VnFHQ3lu?=
 =?utf-8?B?OVhGV2ZxZmlLOW03NU5zWmVNbm9sNHNleDIzcUMzOTB0OGlYNXRNWFhzWmRD?=
 =?utf-8?B?Y2wvN2ROekNTZndHVXZsbmNBbFdzNjdUa2J4VUhnQlJ0enlsL0FERDhGZTEy?=
 =?utf-8?B?Z0Q5My9wTjByWHBkYWNNMkRTSEhSMVNxcDliUk5VS3IydUhFQ1A1YzROclVV?=
 =?utf-8?B?VmE4SXFRaHNJazI2R29sRC9wSjNrNnBFeFNQRzJlOTdUUVZ6d3I5Z0dtdXFU?=
 =?utf-8?B?TXBVQlRBUFlTQi8rOGI5bFFsN1E1WTBFQkJKUi9zb1lGbjR6UWdnTTZSQU5l?=
 =?utf-8?B?bHRLWGJVaTBCdC9LbzUzWmlYY3lTVFBIaFJoODV5ejlsUXc2ekIwSy95SjFy?=
 =?utf-8?B?NWU4M055dm5IbncxUkFZWDdiSnBJSm4yVkJ6eHJ2MXFnWDRnTWVZUFI2Qnlv?=
 =?utf-8?B?azNGM2hUZ2QrdHdGQ0JQQ3lvU3Nnc1o2dVpoRGFJU2YvdUc0OThWNWd4WDI2?=
 =?utf-8?B?UVhKUzFBeUhybW1VMjk5R2tZeGJZYXJ3cys5dUVnZ1M5c0FZU29UWXRPbDlu?=
 =?utf-8?B?dFpJclVjZUpvOU11WjZ3cys5V3NIekVDZTB5eFFUL1l2alRWcmNZVU1rWXdD?=
 =?utf-8?B?ZHlzTit6MEIzSlpCRnMwWVMxWXJjVVVhQzFFVkExWmppU2lndURMQnc0Ui9n?=
 =?utf-8?B?VUpVdDhiS1BkaWF5NkNmT3c1SG1BQU5vaDQxTE1OakR3UDRtK3ZTWTJMempC?=
 =?utf-8?B?THFJWUhCZ2dhU2RmV1dHT3IzN2huc1BtWURZeVJzazFqZnFQb3EwWFI5RE9p?=
 =?utf-8?B?d1o4bGxvanZPRTJuWjhzR3N0K29GbGRkTTh2N0w4bWJaRkJWRm5lRkFhWGpI?=
 =?utf-8?B?OW5vbFIwMlMyZ2g1bnhWNldJcE1TL3pxRm1ramRRZE5MNkhiUDI4dVMyd0dL?=
 =?utf-8?B?dkUvT2FoQ1g5QmFYWVRVK1ZDM3dZR3JqT1J6Q2tNM2dlUVNMWU5TVzd4TU9R?=
 =?utf-8?B?NGZqVEd1VFR3cXk4RDdZN2g2RktTTVc5L3llbEtMNHUwOG1ldWVBV2JoT0tB?=
 =?utf-8?B?OTdBMEZwaHJ1YW9lcW9CTjlpRU94Y29BdW44U3VnSWpCYlliUlo0WW0zZGVz?=
 =?utf-8?B?VW5VeTdtNHBpOG9qeU9CaXUzdHV3d0xEdnBwRXRtSGhvckVxN3ZzdjdTZHRP?=
 =?utf-8?B?WlppNmM4cVN1RTkraW44cktBeCsxR2lySFRkMnR6bkhRekdzMktGcGZkNDl6?=
 =?utf-8?B?THZnMEo1U08rNFdEazhhSmc3NmIyNGpGRVJFYjBxVUV1aHBoWDNIQklTVXFW?=
 =?utf-8?B?TmhXOGdKTDd2WmZ1M3Q3cXFqcW5qZVVSVmFxMlc3SjFKTmM0UHpmV3JjVktu?=
 =?utf-8?Q?MgW76c4h4YcBG0ezToznME4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A704C81675C5A438C24B7C78A0F3799@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fb8dce-5221-46b5-3bbb-08d99e45da98
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 21:15:10.5643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHTYQDhwHvupT0R2qCU5kQ5tbJqJR99JtQhJ0C6GRGSb22ElZnFqPy63IweCfa8ok8tH16P/rC7PYT5Fmx611A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU2F0LCAyMDIxLTEwLTMwIGF0IDE0OjIwICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBGcmksIDIwMjEtMTAtMjkgYXQgMTc6MTQgKzAwMDAsIEV1Z2VuZSBCb3JkZW5raXJj
aGVyIHdyb3RlOg0KPiA+IEhlbGxvIGFsbCwNCj4gPiANCj4gPiBXZSd2ZSBkaXNjb3ZlcmVkIGEg
c2l0dWF0aW9uIHdoZXJlIHRoZSBGU0wgdWRjIGRyaXZlciAoZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9mc2xfdWRjX2NvcmUuYykgd2lsbCBlbnRlciBhIGxvb3AgaXRlcmF0aW5nIG92ZXIgdGhlIHJl
cXVlc3QgcXVldWUsIGJ1dCB0aGUgcXVldWUgaGFzIGJlZW4gY29ycnVwdGVkIGF0IHNvbWUgcG9p
bnQgc28gaXQgbG9vcHMgaW5maW5pdGVseS4gIEkgYmVsaWV2ZSB3ZSBoYXZlIG5hcnJvd2VkIGlu
dG8gdGhlIG9mZmVuZGluZyBjb2RlLCBidXQgd2UgYXJlIGluIG5lZWQgb2YgYXNzaXN0YW5jZSB0
cnlpbmcgdG8gZmluZCBhbiBhcHByb3ByaWF0ZSBmaXggZm9yIHRoZSBwcm9ibGVtLiAgVGhlIGlk
ZW50aWZpZWQgY29kZSBhcHBlYXJzIHRvIGJlIGluIGFsbCB2ZXJzaW9ucyBvZiB0aGUgTGludXgg
a2VybmVsIHRoZSBkcml2ZXIgZXhpc3RzIGluLg0KPiA+IA0KPiA+IFRoZSBwcm9ibGVtIGFwcGVh
cnMgdG8gYmUgd2hlbiBoYW5kbGluZyBhIFVTQl9SRVFfR0VUX1NUQVRVUyByZXF1ZXN0LiAgVGhl
IGRyaXZlciBnZXRzIHRoaXMgcmVxdWVzdCBhbmQgdGhlbiBjYWxscyB0aGUgY2g5Z2V0c3RhdHVz
KCkgZnVuY3Rpb24uICBJbiB0aGlzIGZ1bmN0aW9uLCBpdCBzdGFydHMgYSByZXF1ZXN0IGJ5ICJi
b3Jyb3dpbmciIHRoZSBwZXIgZGV2aWNlIHN0YXR1c19yZXEsIGZpbGxpbmcgaXQgaW4sIGFuZCB0
aGVuIHF1ZXVpbmcgaXQgd2l0aCBhIGNhbGwgdG8gbGlzdF9hZGRfdGFpbCgpIHRvIGFkZCB0aGUg
cmVxdWVzdCB0byB0aGUgZW5kcG9pbnQgcXVldWUuICBSaWdodCBiZWZvcmUgaXQgZXhpdHMgdGhl
IGZ1bmN0aW9uIGhvd2V2ZXIsIGl0J3MgY2FsbGluZyBlcDBfcHJpbWVfc3RhdHVzKCksIHdoaWNo
IGlzIGZpbGxpbmcgb3V0IHRoYXQgc2FtZSBzdGF0dXNfcmVxIHN0cnVjdHVyZSBhbmQgdGhlbiBx
dWV1aW5nIGl0IHdpdGggYW5vdGhlciBjYWxsIHRvIGxpc3RfYWRkX3RhaWwoKSB0byBhZGQgdGhl
IHJlcXVlc3QgdG8gdGhlIGVuZHBvaW50IHF1ZXVlLiAgVGhpcyBhZGRzIHR3byBpbnN0YW5jZXMg
b2YgdGhlIGV4YWN0IHNhbWUgTElTVF9IRUFEIHRvIHRoZSBlbmRwb2ludCBxdWV1ZSwgd2hpY2gg
YnJlYWtzIHRoZSBsaXN0IHNpbmNlIHRoZSBwcmV2IGFuZCBuZXh0IHBvaW50ZXJzIGVuZCB1cCBw
b2ludGluZyB0byB0aGUgd3JvbmcgdGhpbmdzLiAgVGhpcyBlbmRzIHVwIGNhdXNpbmcgYSBoYXJk
IGxvb3AgdGhlIG5leHQgdGltZSBudWtlKCkgZ2V0cyBjYWxsZWQsIHdoaWNoIGhhcHBlbnMgb24g
dGhlIG5leHQgc2V0dXAgSVJRLg0KPiA+IA0KPiA+IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBhcHBy
b3ByaWF0ZSBmaXggdG8gdGhpcyBwcm9ibGVtIGlzLCBtb3N0bHkgZHVlIHRvIG15IGxhY2sgb2Yg
ZXhwZXJ0aXNlIGluIFVTQiBhbmQgdGhpcyBkcml2ZXIgc3RhY2suICBUaGUgY29kZSBoYXMgYmVl
biB0aGlzIHdheSBpbiB0aGUga2VybmVsIGZvciBhIHZlcnkgbG9uZyB0aW1lLCB3aGljaCBzdWdn
ZXN0cyB0aGF0IGl0IGhhcyBiZWVuIHdvcmtpbmcsIHVubGVzcyBVU0JfUkVRX0dFVF9TVEFUVVMg
cmVxdWVzdHMgYXJlIG5ldmVyIG1hZGUuICBUaGlzIGZ1cnRoZXIgc3VnZ2VzdHMgdGhhdCB0aGVy
ZSBpcyBzb21ldGhpbmcgZWxzZSBnb2luZyBvbiB0aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZC4gIERl
bGV0aW5nIHRoZSBjYWxsIHRvIGVwMF9wcmltZV9zdGF0dXMoKSBhbmQgdGhlIGZvbGxvd2luZyBl
cDBzdGFsbCgpIGNhbGwgYXBwZWFycywgb24gdGhlIHN1cmZhY2UsIHRvIGdldCB0aGUgZGV2aWNl
IHdvcmtpbmcgYWdhaW4sIGJ1dCBtYXkgaGF2ZSBzaWRlIGVmZmVjdHMgdGhhdCBJJ20gbm90IHNl
ZWluZy4NCj4gPiANCj4gPiBJJ20gaG9wZWZ1bCBzb21lb25lIGluIHRoZSBjb21tdW5pdHkgY2Fu
IGhlbHAgcHJvdmlkZSBzb21lIGluZm9ybWF0aW9uIG9uIHdoYXQgSSBtYXkgYmUgbWlzc2luZyBv
ciBoZWxwIGNvbWUgdXAgd2l0aCBhIHNvbHV0aW9uIHRvIHRoZSBwcm9ibGVtLiAgQSBiaWcgdGhh
bmsgeW91IHRvIGFueW9uZSB3aG8gd291bGQgbGlrZSB0byBoZWxwIG91dC4NCj4gPiANCj4gPiBF
dWdlbmUNCj4gDQo+IFJ1biBpbnRvIHRoaXMgdG8gYSB3aGlsZSBhZ28uIEZvdW5kIHRoZSBidWcg
YW5kIGEgZmV3IG1vcmUgZml4ZXMuDQo+IFRoaXMgaXMgYWdhaW5zdCA0LjE5IHNvIHlvdSBtYXkg
aGF2ZSB0byB0d2VhayB0aGVtIGEgYml0Lg0KPiBGZWVsIGZyZWUgdG8gdXBzdHJlYW0gdGhlbS4N
Cj4gDQo+ICBKb2NrZSANCg0KQ3VyaW91cywgZGlkIG15IHBhdGNoZXMgaGVscD8gR29vZCB0byBr
bm93biBvbmNlIHdlIHVwZ3JhZGUgYXMgd2VsbC4NCg0KIEpvY2tlDQo=
