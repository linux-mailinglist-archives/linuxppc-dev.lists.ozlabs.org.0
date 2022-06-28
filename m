Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8A55EA6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 19:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXW912SJSz3f2h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 03:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=n9TkwQbP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=n9TkwQbP;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXW822FYwz3dyk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 03:01:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFo5KaqPIVJBbUd4P/NkngX2UhC8muGRZqUpsSIM/cdeZ0I/oTZixj0D12eQ+Eq6ON8tQkWkUkZRh8tvwEEvMyl1WmrV/o8nOC7+gmPpQ7n5Ky1k9sEwFGpjT3p/VbUvetdwp++1XxBT7bkwnrrP0ZFe205jyw7p+Bxiy+iUchTAHWsUoL3BhvEtYTRSGx0F6q1LGAQJhcZHNjKTEoNv9/ZvrDePl5u6EuoHsf7FCRIQI9RLWnLOPhAOAmei4MKqsqFTaaSDYkyPGXJ80EFnF05sVHI8qmf2uCmlo8a+y9nIxKzaZU6GifAvzy9TCSDkLtht1wkYdjAgr4QYRTInAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTXbleVmCeWXTPhHYeeQwXewHHOLGJERmMZkXDrCCiE=;
 b=LA+qYQIQxD/vEzR3lA+IHxjH4pBuhYi6SixyQR0gp2sRskuv7QtcS0ledXjH6usx1vyiqUw1oddEi/evLCpRLanwwppynmihy37y0kaIZfHrFWVwcjhWd/jbq4x+FhhNI7HsSCxXHwF3GsRon6NxYwqR/jb4b/fJew3ICwQzRqjpdna03+aEi5plg/+VdRU+EkMMBUqDBV/vD6uYNiKWIP8Er6yXx3TYZQMlZEmJ61zBUnzJGhZ8RZERRejBihronvzcCZZClH4eY1bmBs2h3YIYH8CmHnyvCFA5d/fIA4jsiYLPVQc55Ea3z3sAV1/V19IeDSy+1QE3DabF4MqAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTXbleVmCeWXTPhHYeeQwXewHHOLGJERmMZkXDrCCiE=;
 b=n9TkwQbPaT9gPTrWim6DKqZIXVpXUZGC4ZgKSp4ebl5x2gPfROUAkp/cff+tNRpxl+5cqcu3xXMfNQ9zyIIWlFLiwGXVRZwoaY9nH3TWO9Z8SMKXkKSGjpvdfqFN9OxFzllIEaBNUv69EVOdY5PLcmk5Sxx1Mv7kINO6SflAQF6QL8gOduu4/u5PldRpoXukaJcVLXO3GeGaJVr/+/2c11cvAnzqOXwn6m4ZZU1/wj4ykjwLzywkt1MtQ1UFXfmeF9nct+MjsO1S7bZnXO1lYbhgl5xxsLMD9hGENielavTF6KBs2D2bSjK553DF4TRSSmP9FiHh78zVXQS0+RRpJA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 17:00:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 17:00:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring
	<robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Nathan Lynch
	<nathanl@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, David Gibson
	<david@gibson.dropbear.id.au>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>,
	Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, YueHaibing
	<yuehaibing@huawei.com>
Subject: Re: [PATCH v3 5/5] powerpc/pseries: use of_property_alloc/free() and
 of_node_alloc()
Thread-Topic: [PATCH v3 5/5] powerpc/pseries: use of_property_alloc/free() and
 of_node_alloc()
Thread-Index: AQHYhJLy8Dqj5xUQWkiWbtNg32elUK1lGA8A
Date: Tue, 28 Jun 2022 17:00:45 +0000
Message-ID: <a6068e53-80ea-600b-0b54-0a1d0c784c54@csgroup.eu>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
 <20220620104123.341054-6-clement.leger@bootlin.com>
In-Reply-To: <20220620104123.341054-6-clement.leger@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba9a2567-4d7b-4329-a35c-08da5927be67
x-ms-traffictypediagnostic: MRZP264MB3195:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EYDa49aSqkuJIwff9xYWqLfo7Or1hSi67rzrVp5AYcOlIXSL4E7jfgfHr4P/3juesQ0G8P1ErCYcBdlnkjaqFT8EKSexxCJhd99gwR7uFn5Nex5GszYoFmAlQpRNzPkHQs5JrOzrMfYyNKxJtx8sxdhkZVnmf6KvoFFh7pHeKDby4aCd6NhiObKknoQt5U2IcfAgNDuPdxifVokJfZNpKxkRUGTc9yvgZrWWjc3dWiG6AthkgkgQt0+mBVNdPOhtgIf7n7e8DbI4u48DbzR5wmSt1zJ9H5sGDV2Zjk1oNoRIea68Y4xcsmUQUYJFvhCn3OmVbM0sneA4k0mSgQPZQKttE0TNQanlu8sR5sUlyb9wUjdl+gSV7ZcFu62JuVED+PX2MVzJ4FiYd71f36f7LLzRUwLWojGncooEFFrfZu/lTnZ2GP7ywpC8tq02qIuy9G2pHfOBO+o9ayDLROfAon6GzXl0PqvC1JC73k3jZE/wQ3rxf8FLARCDI+4mv3tD6SQH/QvVWC1doc/bOr3Vn+PxkonsiL9ShcNYqKspUqfekOHUSDv/GhSA9u+1s4zgFo/mZW0XJcPy85+n8E1OZgGyMOIWjPo1tt2js3EATp8zWR8n7kLGItHWXY7imkghOJvk8rGaikDD4QS4P8+znphgsNwalb1kX+c+4vh9VybYCfLxwpjoNWztsYH+BAP/HP8AJGDBXeEpDszJVJs28UwPTOzhm/n4uM+O4vGo4EmrmMfVWSPSu507c2LpvkHB14xUe5Y3eNUUUU+DPgQxnr+QJfE4dhA9JP29xe8ewjcC7ycX6G6/ulHMc2naYXb6NycwUEKlwQOO1Yb/HPA/KXnyEEtU8mn1bnZ/Zn8MW4BIn5E6hyfekWHvJI9CD/l7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(86362001)(31696002)(4326008)(71200400001)(91956017)(83380400001)(7416002)(66556008)(54906003)(6506007)(44832011)(8676002)(76116006)(478600001)(6512007)(66946007)(26005)(8936002)(64756008)(38070700005)(921005)(6486002)(66446008)(36756003)(66476007)(5660300002)(122000001)(41300700001)(38100700002)(110136005)(66574015)(2906002)(31686004)(316002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eVFCY1BpVytmUktyWmdXeHB5RDJNdmJ6UDZaM2tqajA4UVVWU1RXdVlkekNr?=
 =?utf-8?B?a1VyR1RrSVdIa3k5NHd3WmxXd1JHbmRKazR2a3A1b203N01JdDJPNUVwc1Bt?=
 =?utf-8?B?eW05ZzF1UmVTT2lDSHl6MHN4NHJUNGI5N3kxdGluZzhFeUFuaWtlSTJlOG9M?=
 =?utf-8?B?R01IWHJSaFFCSlgvODdkcHNlamNnajllRUpmeElzb3FsYUJBcWZNZ3RTeFpM?=
 =?utf-8?B?cHR5SGc0WHB2NGdJTi9oWHg2Yy9tbTR3UDA3WXBiazBpcDlaYTVwbitwaXRY?=
 =?utf-8?B?Y0FyM1QzOVVpZnErSEI5dW1uTVErN0QrZkh1c2lkMXl1cDN5dlFhVkZKKzUw?=
 =?utf-8?B?Ynh2ZHZDUUNIRDJEQ2UrVVBYandndjI1cEJBbXBUaVhqOWlyamVGKzdmOFhi?=
 =?utf-8?B?WUx0RSs5UjV1cW5PM0EzdnVKSjN0bDdsNWxILzgvTUpBMjZzY3NVaVk1eUZZ?=
 =?utf-8?B?NWVDcEdSR0tGeFZ0bTltbmZnVGtrRE93OHZaWDgxZ2g0WmF1cjdaaytNbjhq?=
 =?utf-8?B?ckdBbWlaclAxejFzSHJpeFNsKzBTblNXaUhna1dpOTlMWkx0NWJNNm00UXhK?=
 =?utf-8?B?M29IYXJwQTNaK1g1YzhPWW1KbFZ3dERLQzNEcGZXNGVCdFJCd3FxVEg5a3ZC?=
 =?utf-8?B?bHFaKzF5Q1pTeks2WHZGOXJGUW83SEZkQ1RleGUrSG1HR2tDY0ExUkFKK2ZO?=
 =?utf-8?B?RFdBWldZa3FDR3BlM1hrU3RVbmg1aXpvS044SG5iUEsraWk0SXNDcXd0TkFO?=
 =?utf-8?B?S0dUQmlmL09aeE0xNzhxeXBaYVRtaHFIZ2h3MlZKUWlSZ2J5aU5JUHZ3OUVH?=
 =?utf-8?B?UWN6SEVIak9pQzFtei9ra0Y4b0k3Z0dEdURMbk5UNllGKzNoSklVQWhRZCt4?=
 =?utf-8?B?aEpEMmlHcEZoZm52YkhFMVBjVkpuOXlMZzhDaUprekNJbmtjTUJ4dzdVQmdK?=
 =?utf-8?B?Wjl0S3JYQ3FtRFF4QnNGWXkzbnhvUElEVEtpeFhwNUR5UjEyTW9WeTl4Rm5m?=
 =?utf-8?B?cUpNYjhSYTl1c2N2VFVzWW9TdzQ4TFBscXJoUTJNR3FtcG5PangvNm1abS85?=
 =?utf-8?B?alA4QmpmcnNXaUF4SHJ3Y2dUY1ViVEM2WkxoTlZDL0JkSmd1T1hVS0tRUDRP?=
 =?utf-8?B?S1FtUlZ3ZENScmJsdXNBa05GNnNkQ2NJUm1NSkVyU0ZHVU1NLzRpWkdrUUZC?=
 =?utf-8?B?ZUl1QW9wQUQ3emZIVHBoZ3BjeXN2R2phMlZZTEc0eHh6NzJvRHp3a1RrZ0Vk?=
 =?utf-8?B?QTJmRFRHblJydUt0MEtJOU44TUROVVUzdFArTWZuRjI2Tlk4L2t6SjNCVldy?=
 =?utf-8?B?YXAzRU11VjV3cTd5LzR5WTRDSVFmVmlXYXYvTVRsTzZ3WXl2S1Q5MGJlTE1Y?=
 =?utf-8?B?SzR1TTBuSTEwd3BZUnVzdEc2VTJmb0N5Z1o1MXVMWnhuZEVQc2d0NnNyR05R?=
 =?utf-8?B?UFhJYVgwcEozYmpDcm9KbXlLYjdRQTF0elpFTk8rV1poV201SGlESE9kbVZa?=
 =?utf-8?B?NU1nSXppeWs3SmVxckFtQlpsVThGS0xEOVFWQSt2S3o3TEJ6QWxYM0czbU5p?=
 =?utf-8?B?OXlwMENIMk9TaE1kZnpMbWNMU2hwS25qa3N5cS9Qdk5jU1pES0ZIaE1iNVRX?=
 =?utf-8?B?UGdlRU1PS045RGZuVjJqbnNScVZ6RmhOeEhLVk5SSzUrR21kajZiY0xEb0hn?=
 =?utf-8?B?K2dIcThSektBdEg1ZGtxNzBPVklVQ3h0R2xqMzZYMEtlTFJzcngwZEgyQmRR?=
 =?utf-8?B?NGNLdkp6SnYwOHVibzVpelgxSytBQURORVVPbHlLakJUOEM2MUdhVFMxOGJ2?=
 =?utf-8?B?Y2RPbzE5b2NFMkV0RFovclRWdVpYOXRrWXVoTU9xd2Z2YmFUaTU0UHpPQnRr?=
 =?utf-8?B?blh4WWhXMlZDbk1mZGlKa1VWZ2ZtTTBlajRCQjlMZ3M3cUpMNmltZG5jZjAz?=
 =?utf-8?B?bExsbVo2VlFiazhpNk9yb0ExSVR1ek5sUGhMQURCK01GWWxtY1JxaGN0aEUx?=
 =?utf-8?B?RkJqd3Q2WUFXbWFjSnJSVyt6am5CYmYreG10TTFna0M5TVlDcWFMemU4dDdj?=
 =?utf-8?B?dHZxc3dTVGMyYVdaVUVTUWdpYnEzRGxSVGw0OUFZWGFsRHJPcmhMeFNHVnFP?=
 =?utf-8?B?ang5Um1DSGp1aWdsLzZnSDd2djZ6eVUyVWhUV3VWSUdON2xSOVhac0FlanZ2?=
 =?utf-8?Q?Ri4SCquCCd5KbXWIAdXuHJU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1AFF8A4BD1FBA46B9E66B3BC3F273D2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9a2567-4d7b-4329-a35c-08da5927be67
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 17:00:45.8781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYaBxwz87j12rmSy0kte4RA5uFfpbuthfr02HIfC712q2dIm2cX22hmj/TptfpLmx6z2BXtUCbxIGvE05D7snKp4g43vm9/O8BZBXfmPPSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3195
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Steen Hegelund <steen.hegelund@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, Allan Nielsen <allan.nielsen@microchip.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <helgaas@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA2LzIwMjIgw6AgMTI6NDEsIENsw6ltZW50IEzDqWdlciBhIMOpY3JpdMKgOg0K
PiBVc2Ugb2ZfcHJvcGVydHlfYWxsb2MvZnJlZSgpIGFuZCBvZl9ub2RlX2FsbG9jKCkgdG8gY3Jl
YXRlIGFuZCBmcmVlDQo+IGRldmljZS10cmVlIG5vZGVzIGFuZCBwcm9wZXJ0aWVzLiBJbiBvcmRl
ciB0byBvYnRhaW4gc29tZXRoaW5nIGNsZWFuZXINCj4gYW5kIGFsbG93IHVzaW5nIG9ubHkgb2Zf
bm9kZV9wdXQoKSBpbnN0ZWFkIG9mIG1hbnVhbCBwcm9wZXJ0eSBkZWxldGlvbiwNCj4gYSByZXdv
cmsgb2YgdGhlIHVzYWdlIG9mIG5vZGUgaW4gcmVjb25maWcuYyBoYXMgYmVlbiBkb25lLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4u
Y29tPg0KPiAtLS0NCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2Vy
aWVzL3JlY29uZmlnLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcmVjb25maWcu
Yw0KPiBpbmRleCBjYWQ3YTBjOTMxMTcuLjg3MDRjNTQxZGUzYyAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3JlY29uZmlnLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3JlY29uZmlnLmMNCj4gQEAgLTE5LDQ2ICsxOSwyOSBAQA0K
PiAgIA0KPiAgICNpbmNsdWRlICJvZl9oZWxwZXJzLmgiDQo+ICAgDQo+IC1zdGF0aWMgaW50IHBT
ZXJpZXNfcmVjb25maWdfYWRkX25vZGUoY29uc3QgY2hhciAqcGF0aCwgc3RydWN0IHByb3BlcnR5
ICpwcm9wbGlzdCkNCj4gK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBTZXJpZXNfcmVjb25m
aWdfYWRkX25vZGUoY29uc3QgY2hhciAqcGF0aCkNCj4gICB7DQo+IC0Jc3RydWN0IGRldmljZV9u
b2RlICpucDsNCj4gLQlpbnQgZXJyID0gLUVOT01FTTsNCj4gLQ0KPiAtCW5wID0ga3phbGxvYyhz
aXplb2YoKm5wKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKCFucCkNCj4gLQkJZ290byBvdXRfZXJy
Ow0KPiAtDQo+IC0JbnAtPmZ1bGxfbmFtZSA9IGtzdHJkdXAoa2Jhc2VuYW1lKHBhdGgpLCBHRlBf
S0VSTkVMKTsNCj4gLQlpZiAoIW5wLT5mdWxsX25hbWUpDQo+IC0JCWdvdG8gb3V0X2VycjsNCj4g
LQ0KPiAtCW5wLT5wcm9wZXJ0aWVzID0gcHJvcGxpc3Q7DQo+IC0Jb2Zfbm9kZV9zZXRfZmxhZyhu
cCwgT0ZfRFlOQU1JQyk7DQo+IC0Jb2Zfbm9kZV9pbml0KG5wKTsNCj4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wLCAqcGFyZW50Ow0KPiAgIA0KPiAtCW5wLT5wYXJlbnQgPSBwc2VyaWVzX29mX2Rl
cml2ZV9wYXJlbnQocGF0aCk7DQo+IC0JaWYgKElTX0VSUihucC0+cGFyZW50KSkgew0KPiAtCQll
cnIgPSBQVFJfRVJSKG5wLT5wYXJlbnQpOw0KPiAtCQlnb3RvIG91dF9lcnI7DQo+ICsJbnAgPSBv
Zl9maW5kX25vZGVfYnlfcGF0aChwYXRoKQ0KDQpNaXNzaW5nIDsNCg0KRGlkIHlvdSB0ZXN0IGJ1
aWxkID8NCg0KPiArCWlmIChucCkgew0KPiArCQlvZl9ub2RlX3B1dChucCk7DQo+ICsJCXJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIAl9DQo+ICAgDQo+IC0JZXJyID0gb2ZfYXR0YWNoX25v
ZGUobnApOw0KPiAtCWlmIChlcnIpIHsNCj4gLQkJcHJpbnRrKEtFUk5fRVJSICJGYWlsZWQgdG8g
YWRkIGRldmljZSBub2RlICVzXG4iLCBwYXRoKTsNCj4gLQkJZ290byBvdXRfZXJyOw0KPiAtCX0N
Cj4gKwlwYXJlbnQgPSBwc2VyaWVzX29mX2Rlcml2ZV9wYXJlbnQocGF0aCk7DQo+ICsJaWYgKElT
X0VSUihwYXJlbnQpKQ0KPiArCQlyZXR1cm4gcGFyZW50Ow0KPiAgIA0KPiAtCW9mX25vZGVfcHV0
KG5wLT5wYXJlbnQpOw0KPiArCW5wID0gb2Zfbm9kZV9hbGxvYyhrYmFzZW5hbWUocGF0aCkpOw0K
PiArCWlmICghbnApIHsNCj4gKwkJb2Zfbm9kZV9wdXQocGFyZW50KTsNCj4gKwkJcmV0dXJuIEVS
Ul9QVFIoLUVOT01FTSk7DQo+ICsJfQ0KPiAgIA0KPiAtCXJldHVybiAwOw0KPiArCW5wLT5wYXJl
bnQgPSBwYXJlbnQ7DQo+ICAgDQo+IC1vdXRfZXJyOg0KPiAtCWlmIChucCkgew0KPiAtCQlvZl9u
b2RlX3B1dChucC0+cGFyZW50KTsNCj4gLQkJa2ZyZWUobnAtPmZ1bGxfbmFtZSk7DQo+IC0JCWtm
cmVlKG5wKTsNCj4gLQl9DQo+IC0JcmV0dXJuIGVycjsNCj4gKwlyZXR1cm4gbnA7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyBpbnQgcFNlcmllc19yZWNvbmZpZ19yZW1vdmVfbm9kZShzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKQ==
