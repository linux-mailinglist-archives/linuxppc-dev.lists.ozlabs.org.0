Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C502061789F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2xd74F9Kz3cK2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3GTjVLY3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3GTjVLY3;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2xc762CNz2xGB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:23:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZU2emPI21X56j+m6UdT6nLeaD7Le6VgmEZsyKpeTCEvmhQ7AaIc7pYlUoWLpdnxqiAHuPgwadpO32/E6HD7xmxEeNW+8X0QOAlkkhJiM4vmkjXA1+96+yt60WJxdTHJ6XiMbfjDU1oMQVKVDyNXwiaZnRgt8MITbOmfWcogS8//KBN3QueDarI7c82tcnjGjh/Wzn8R/TyRaWMVtIQVKGHKSl0iCIY52CkLX+lV26Mq9zRDF1wJ2D4hKb+oHZw1Lrs1hdgQAmJYAUlqIFZmlyA6E00mTws5vvqfbohzx/Nd7T3w7kKYlWsVB1GrZXnNcRSTZGFOaVIsk21ToWrM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APEKHbChxUjJMeLp6MMRqHsAe2hCI+a37xkT6yBmNkU=;
 b=Aeg2uM8fzGWb9KNe/cxfAjGJzafpytAGuvR2fLn8X1CPxQSe/PuQjYjMdFjn3hOaq0kfCYMfCtQ/HVui9Qvr0c3Qf3NG1hkMfybzNO0AToOeNsoruDIoAEUz7BBI4K/xTVX6+DIy8bW4AQxthdLxMAOCQBogrIp8OQSA/u3FS1nSx1yKepo/pPeraLA4bp33+sVcVWkgxD1At/7LISy9dUFM7H3TE3fTlS4yXvTVr1GkFRwRNnN0yvT9gIiVK/WS9Z34sYRM+uHbX+TMzMnfKNUx/JBz6tqAVnhBhh42cVRPctNrTZv/MKzzTZzDhVaqXE0vrnu8a7iX5JTYRCfjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APEKHbChxUjJMeLp6MMRqHsAe2hCI+a37xkT6yBmNkU=;
 b=3GTjVLY3VIisxDQQCbCyAG1gM9jFo8IkgTcEvpEKysRtmqxnNBDt6gz9qcqh7oFqebUij3VuOVoTIGkZcaG+UtE7s/7Te9qTwVxZfPeYrQJuyAOvbOpf4EDTW+fB1AbpyI4H3Wbf103p+Rv8fVP8NhpyOdb6WucVAVKCg6QeyxoQpNfvQYybZFfyP2tq2VabFIeL2QjUq+QUiyVBtG7+aDRHXcto/eyL9afYkaoKGYqX/1yWlmBULDtsNg3lkd1FM18fGqrreoudC2QBrUbdhzU/lFvuX/fGw1iyIsjsohx8kt770NyHgYFQo9Qm41MqBWHGxQzHiY4dgMQr1HIkyg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:23:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:23:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] random: do not include <asm/archrandom.h> from
 random.h
Thread-Topic: [PATCH v2] random: do not include <asm/archrandom.h> from
 random.h
Thread-Index: AQHY6zmAUeP7ex9RRUCbb7d9veBz8q4s5KeA
Date: Thu, 3 Nov 2022 08:23:33 +0000
Message-ID: <128fa0ae-38aa-30f3-cc23-bcd2f55a71a6@csgroup.eu>
References: <20221029010857.161574-1-Jason@zx2c4.com>
In-Reply-To: <20221029010857.161574-1-Jason@zx2c4.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3092:EE_
x-ms-office365-filtering-correlation-id: 0a893dd6-e3a1-4e7d-12f1-08dabd74b243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q0hpinkvfPqToe44q7TEGUEzGepmZ/xZE1Ib/aYy2gBatlPnTDO8mfELAARxArQ7XzM4R1HOeA/fJURjDq2/zhkYVjlzkVXjGNWxoBxm9JqguUXvtIBNRzA7NbWgHNV9MjXvqgvRhT2cKWCwgRS8DqosWId4hEwG+DaMFj5oIBjFPOeZImloSOrwL7HiQ4AnRahtLiutwDWcvHlAoF2qN8Ee3ctSDDYP3Ks5xO8S4CuSzk/kGxNg6FDwg69ryj6x1BgArVqmHyI4L4pDMHKz6xdr3hJTuaQbP3AFzvDNiSRxMc20yVEaPOEUTjBMCLu0dXkoYFK+EJFyPTZVpzMg9fYuhpB+KQKjmOGAAAX3q/1tBGtOXR5TEgSJFZGilj2NJATLWH8iRB+EbxNGnAG3FN6pSBjs0Y/33kSyd7STjUcNGH57JVJHMlgBIBPaVLJdGRbf+tAeGLQreZvCXcO3065yysHz/Ov1s8pSvHcS8kJ4wSvfn40ehxXk1AsRHEVrcWJ/49R67vOj6srtaY4gENZOHItJTZPCegB+3g0QQfr7eUUGZ4MLDlGyVX9UEk4/hUP/rmV1rdTXEGENnlqa99TX6di8NsUb4crNGkBes4oGUkUlfA2DqvlX+vPtrZcS59yOLCiwSTH33Z/eoYQB+DxDdPT5dmvVykAUETheOWptWCk86vTYphCVOaxjAbjQfu5WaNilPP35j1eiYcApdu/TNzPxxIUGo/LPpVR3pqHqezDioJZ+c+1muO3MUpOwkOHWVzB2UWepdkOto7WZ0h/b9HOVkcICSbq6HVsSWKZ5ayeD/0Ikv56nn/iN/uKSsMOTXLfWKWiKwkBIFgDQ8w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199015)(41300700001)(36756003)(76116006)(66556008)(66446008)(91956017)(4326008)(44832011)(64756008)(2906002)(8676002)(8936002)(66476007)(6506007)(6512007)(26005)(5660300002)(83380400001)(186003)(2616005)(478600001)(6486002)(54906003)(110136005)(316002)(86362001)(31696002)(66946007)(122000001)(38070700005)(71200400001)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dEtVYVdUV01PSGVYQ3NaUWVGZG4xZU0zLzFMQWFyTCtneFpmbi80RHl0MjJk?=
 =?utf-8?B?b2s2UXBOTWxRVjdDRGc0b0J2bE9IRkEwcW9rTzhHL0RyVFdQeC9LRlNjRnAy?=
 =?utf-8?B?MmZIVHZvYnQ0VHhoQzNGWTVYZ3FqZy9yUGdEZktmQUw5OTVDdmNFbk5teVdq?=
 =?utf-8?B?dHZtQzY3REpXYjNQZDNsL1JDbUI0YW00NmI5c2lxdXpjak9VOHNTYXV6ckd4?=
 =?utf-8?B?RVVjK0xqaXpmaWliSDFBUFYwR1MrTHBCYlo2ajMxaGVsSUFmcHlrd0F0bTFn?=
 =?utf-8?B?RWdXSmlDYmEvYXRVM0ZLTUh0dDJFOUZpWlFwNnUvanJBUXIxSmllczJzOFJ4?=
 =?utf-8?B?aDR6VFVPT1ZmVXZaUWRCZU1yM1U4cWZQQ1dvZ1pYdzFoUnVUQXpMS0JzSHcy?=
 =?utf-8?B?SUNsbGhjdit6ZkNvT1A4b3l0MkxPbDVTL2VIVlBTL04xUUtBUHRWUm12cnhX?=
 =?utf-8?B?dmx5c2UxeVdpSGdFaHpWN3MxcmNBeWFwR2YrZWJhd2VHUFdDY21EckMvbGFN?=
 =?utf-8?B?emJxL3JoNkNJK3BmVmJjZHRjVktOamJocGgrZWVlSW9BNS8wMHhScUt5bUhm?=
 =?utf-8?B?MnUvSWV2UUNldFhXWGJmQ0FmR296bEU3TTdLUVhNRWFHZy9rdlBtVWJHK1Yy?=
 =?utf-8?B?RmRtUjRwd2l1eWVQSTI5WUdWd3h1T1VwVHJKMG8wRjBxaVd2eGNvQ1JoMWt1?=
 =?utf-8?B?M0lCRTg5bTV2RlhsRHVHZFFXb2ExNmtCNVZMakljTzh2dklWT2tGOGoxNW80?=
 =?utf-8?B?V1NEaWFISkVIdTREejVZekZuZFUvVU0wQmpTeEU2K3Byd3RwV3NrOG5PNXB4?=
 =?utf-8?B?cFJuL3V3UHRMVWQrRFZhMUg2Z2tScEdHRWgrK2hmMjh0ZncwWklZbUZWZmVt?=
 =?utf-8?B?MTkwVmxrR0VhWFpZeEhxWVdHWGs1TXB6RW5Sa1MxMlEvbExIcWhnSnBvNzVU?=
 =?utf-8?B?YWRnTno3L2ltcm5BdkYzcnpvUUJSVGdQdlMzcHRkeHUyaWV2NE5hbmN1VlM3?=
 =?utf-8?B?Wm1nY3NKS3ZXWDZyUkk2NGhEUG9US1BDWWFTbVh4L3VyUlhhV3pxdlh5MXlr?=
 =?utf-8?B?RWlTS0I0UGd6L05wRU1ZdXJkNHcrdHN3RkZtV0ZkcWJHUmNDRXZ5dzZKSlNX?=
 =?utf-8?B?RGp0aVV0dVdxNi9xZHNJQ1RlZVh0YzlKck5HTGthUHlFZFhHOXp0QVFLNElT?=
 =?utf-8?B?dHNpblRzYjNvM08vQ1dqY2tPQ2F5d1hFeVRnMEhxRnpLaWFLeFNKNkEzeUhG?=
 =?utf-8?B?V2pMT0NhcHFMejBZTDA3dG9LTXJxVUJQcXkweVNHSXI1UFd3RldPVFljZHRo?=
 =?utf-8?B?MERreWgzeGp4S3NsZ1EyKzJ1RlB1d0Y2VHloUzlQclJhakJVRTNOc1c3eDV6?=
 =?utf-8?B?ZkRxdjRncFZlNWU5LzdRd1h4bHg0OFJ1citHNWZaTlFCa1p3UkRZU0R1blZx?=
 =?utf-8?B?UzUwRmRWZFUyL2FYV3VGZmhWMkJ5MTFxNWw4SkR4SHhxOW5RcXQramZPWmdO?=
 =?utf-8?B?VnMrZE1Md2ZFVVU2WlVYSkE5VUVaVjJLb3RzcnJyWU5LQnJZUTJmRWhJVnVM?=
 =?utf-8?B?S1lhVldnekQ5a1N5aTlQQ0hpQ2d6aGNrWGtHL21hNk5vR2RDT0lPUFFkWG5m?=
 =?utf-8?B?bWtObFEwZWxTZlFZQ2Urc1hjSFgwRE43OThXdUtVMXRlNERpK0srR2pMb083?=
 =?utf-8?B?cEpZY2dtMUxpQlBxK1BlaFFjU3FHV3BKQUhRQ0NVSGc0MnRSSWxlNVVkOFZs?=
 =?utf-8?B?UXhmZTlzRnFicXhQNHNOSWdzRlFOUS9pVXZCS0trYUJnZWJUNnpITkQ0a25E?=
 =?utf-8?B?OHpoRWRTQi9FejJvRmNuUTZjazhXcXFDdklYY3dZUnI1bHhUd2VoaHNYV0gr?=
 =?utf-8?B?Wnd6MXJrUm9lbm55R3duRGIrclp2aW91UCs5WlJQd3U4Vlp6dHVCTHY2elBu?=
 =?utf-8?B?Q2NSY3dGcng4YUs2aFVuQXlpTCs5cjNpNEovQmpFNzMwZ1NlN3RvYVVUWWxl?=
 =?utf-8?B?U1d4MDVxNVVSZlpDaUt4MHZOQW5oRUhQY1ZCdGRwQmNkNFY0cUNjaGZVSGpn?=
 =?utf-8?B?c0xNRmsrRnArcEZ2SEdNSkx5NGtsdzI0T2t0Z09yUGtvcWF1UExTempUNTdt?=
 =?utf-8?B?WnZLSGxHelhsZWJleUlMUi9kQXhhRzdNbTFNcVQvYnNPUGJYU05vWGxoY3JJ?=
 =?utf-8?Q?G3rAaSL4ZQJZQX7LqXPb0Ew=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B93540857C6B7D48856FBB5F95B34267@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a893dd6-e3a1-4e7d-12f1-08dabd74b243
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:23:33.0786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVh4IDGMw1rjptnNokEwxvLg+MsnyRYfvcELkNpBjLTnvWWUUJkHa/teJx/BPMOBG7CO4Le+K5nKAsyWlDC1ZmDPoayylYWMHBh/AHT5ugQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3092
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzEwLzIwMjIgw6AgMDM6MDgsIEphc29uIEEuIERvbmVuZmVsZCBhIMOpY3JpdMKg
Og0KPiBUaGUgPGFzbS9hcmNocmFuZG9tLmg+IGhlYWRlciBpcyBhIHJhbmRvbS5jIHByaXZhdGUg
ZGV0YWlsLCBub3QNCj4gc29tZXRoaW5nIHRvIGJlIGNhbGxlZCBieSBvdGhlciBjb2RlLiBBcyBz
dWNoLCBkb24ndCBtYWtlIGl0DQo+IGF1dG9tYXRpY2FsbHkgYXZhaWxhYmxlIGJ5IHdheSBvZiBy
YW5kb20uaC4NCj4gDQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+
DQo+IENjOiBIZWlrbyBDYXJzdGVucyA8aGNhQGxpbnV4LmlibS5jb20+DQo+IENjOiBsaW51eHBw
Yy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+DQoN
CkZvciBwb3dlcnBjLA0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0
dXAtY29tbW9uLmMgfCAxICsNCj4gICBhcmNoL3MzOTAva2VybmVsL3NldHVwLmMgICAgICAgICAg
IHwgMSArDQo+ICAgZHJpdmVycy9jaGFyL3JhbmRvbS5jICAgICAgICAgICAgICB8IDEgKw0KPiAg
IGluY2x1ZGUvbGludXgvcmFuZG9tLmggICAgICAgICAgICAgfCAyIC0tDQo+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvc2V0dXAtY29tbW9uLmMNCj4gaW5kZXggNmQwNDE5OTNhNDVkLi45YjEwZTU3MDQwYzYgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYw0KPiBAQCAtNTksNiArNTksNyBAQA0K
PiAgICNpbmNsdWRlIDxhc20veG1vbi5oPg0KPiAgICNpbmNsdWRlIDxhc20vY3B1dGhyZWFkcy5o
Pg0KPiAgICNpbmNsdWRlIDxtbS9tbXVfZGVjbC5oPg0KPiArI2luY2x1ZGUgPGFzbS9hcmNocmFu
ZG9tLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9mYWR1bXAuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3Vk
YmcuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2h1Z2V0bGIuaD4NCj4gZGlmZiAtLWdpdCBhL2FyY2gv
czM5MC9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYw0KPiBpbmRleCBh
YjE5ZGRiMDlkNjUuLmI1M2E0NTczNWE1ZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zMzkwL2tlcm5l
bC9zZXR1cC5jDQo+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvc2V0dXAuYw0KPiBAQCAtNTIsNiAr
NTIsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9odWdldGxiLmg+DQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2ttZW1sZWFrLmg+DQo+ICAgDQo+ICsjaW5jbHVkZSA8YXNtL2FyY2hyYW5kb20uaD4NCj4g
ICAjaW5jbHVkZSA8YXNtL2Jvb3RfZGF0YS5oPg0KPiAgICNpbmNsdWRlIDxhc20vaXBsLmg+DQo+
ICAgI2luY2x1ZGUgPGFzbS9mYWNpbGl0eS5oPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFy
L3JhbmRvbS5jIGIvZHJpdmVycy9jaGFyL3JhbmRvbS5jDQo+IGluZGV4IGUzY2Y0ZjUxZWQ1OC4u
YTdhZmQxN2RiMDc1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2NoYXIvcmFuZG9tLmMNCj4gKysr
IGIvZHJpdmVycy9jaGFyL3JhbmRvbS5jDQo+IEBAIC01NSw2ICs1NSw3IEBADQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3NpcGhhc2guaD4NCj4gICAjaW5jbHVkZSA8Y3J5cHRvL2NoYWNoYS5oPg0KPiAg
ICNpbmNsdWRlIDxjcnlwdG8vYmxha2Uycy5oPg0KPiArI2luY2x1ZGUgPGFzbS9hcmNocmFuZG9t
Lmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2ly
cS5oPg0KPiAgICNpbmNsdWRlIDxhc20vaXJxX3JlZ3MuaD4NCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvcmFuZG9tLmggYi9pbmNsdWRlL2xpbnV4L3JhbmRvbS5oDQo+IGluZGV4IDJiZGQz
YWRkMzQwMC4uNDdlN2NmMTI2ZThmIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3JhbmRv
bS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvcmFuZG9tLmgNCj4gQEAgLTE1MSw4ICsxNTEsNiBA
QCBkZWNsYXJlX2dldF9yYW5kb21fdmFyX3dhaXQobG9uZywgdW5zaWduZWQgbG9uZykNCj4gICAg
Ki8NCj4gICAjaW5jbHVkZSA8bGludXgvcHJhbmRvbS5oPg0KPiAgIA0KPiAtI2luY2x1ZGUgPGFz
bS9hcmNocmFuZG9tLmg+DQo+IC0NCj4gICAjaWZkZWYgQ09ORklHX1NNUA0KPiAgIGludCByYW5k
b21fcHJlcGFyZV9jcHUodW5zaWduZWQgaW50IGNwdSk7DQo+ICAgaW50IHJhbmRvbV9vbmxpbmVf
Y3B1KHVuc2lnbmVkIGludCBjcHUpOw==
