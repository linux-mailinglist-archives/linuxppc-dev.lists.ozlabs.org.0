Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D65B2EC1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 08:23:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP5Y74nCqz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:23:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Tbe7ek0m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Tbe7ek0m;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP5XN1D9wz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 16:23:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2x8W+ceqwWeiV4mlBySwAhYyR55RbL+HGs7jkYe93X2Vu/WCd4n+HYFxOWBCV1pR60ciMkJBqo5pybogcIPVIJlaZTCU98lA39xEI79VZzKO4eWLCrn065/+xPxIF4YSiisW/DGjbImBuwomhj+70PB/+prf9HKZw9x5tWBF27qCiObDlOQPfkvlhRG27nAScEIniohIhQ+NN1Px4PtY3izHxi74FVb9Fhr4Qqv2uoI4PQS98gqYtE0oYtPaOAb1I1VttAqEbAkP1ac0MJa11+kJsaMb4swZ8XB8CFG5ghfJdRb6cO4hkhB/O4EKUmy+NoRIxWiX4lHuJJtLWaC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HLhHTTKdqyKLF459ibcFjmLnQS78nDWzBwyK8bQDKo=;
 b=iq2PrY6BvI+ruRn/HPlgZbH03ISGMP/KoHAL9swFSrVXklQXPa377DNwWYaiYkqq/T+ygjLXUxWI1PE5wXeAzfBKFTlERIv6JRqfU7oGQkMDKK0b0rQ/eASjRs6O1GkgQ+HyFTwr57psSu1mDkwEn3ckgakO94ZJNhwLUe7SBkeePgfOwAxue/NkWj0Jpn6a4UkakS5x2txH0QX7g4gcq1RAhHmsv7NVn0a3o1kbKrcNpBYMTqnAgqUQ7911iB8GoaI8OYIOEUji1gOKNW6P/MLc1khvFoYPqMCEJcEJc+nU8pWRkvWtzEw/exuhigqg+M2g5yZkvFpU4LBuvKBkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HLhHTTKdqyKLF459ibcFjmLnQS78nDWzBwyK8bQDKo=;
 b=Tbe7ek0m3nOQHm8rR6spltzExVwKCinircSIyqUvM684zS2pG2tekgNMX8n7v86S8gi/SLT2NZBLlpZ6uAtWHmHQvectCsbqZIy7jZohp5foxUJ6xL0N+ascuTdXopYhqcUqeF2iKKDu4UXsm2s3GYgF9T1DOST61xifLUmOPjSiiTwSk5BUaQawKws6J68aRnkSliaxWrKGC6NQfQ+nrJt1TJI0qvROZikEDtwiy1G1t1hIqn5JJFGE8gjjjLdP65Fya8b8IovOL4cCmq00xbixeEd+6xUvskGw/HK+TpT6JddvIc5SyWo7V2otrlXAWoFRd7n8qEx7kXuAiagV8A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 06:22:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 06:22:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 02/19] powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC
Thread-Topic: [PATCH v1 02/19] powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC
Thread-Index: AQHYw6nJB+7WvKnkKEOKnzF67snf063WmOqAgAAI8gA=
Date: Fri, 9 Sep 2022 06:22:54 +0000
Message-ID: <e60c6e97-f73e-5a5e-9ddf-8956e9a5b950@csgroup.eu>
References:  <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
 <f2d30eb7fadcfd89f7ac3784cb0b4a4b47d47db1.1662658653.git.christophe.leroy@csgroup.eu>
 <87r10ldrk2.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r10ldrk2.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3121:EE_
x-ms-office365-filtering-correlation-id: c08e613f-fd14-4ce7-8073-08da922bbb08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zfPGn0rEniaxmxRhxZYtW9KuOsGnuUcoWcdnrA1L95rm3xwCh9bMUWsgAVD7ZU6ddM2kF4w+L7yXjIlQXBXsd/HxTBs2v3Pa4Ny2+UdKiJHOhz91rwwgkMBTOg6ZB1ovzFBYzFJ+QwBPk71nMzuZsZN2iJlv+EltqJRWhp4aCMlD8gHpwE7xRQWNycVeK7MEtHtcyqVtqlZETtE8CIrHgn0dL8xJe6D0RBX4uiin4jPj3cLqjhKQ6SppBM0MZgzVfQYhfDSkSaz40rTRcl8E7VWY6402aB3LzTWpy2bUa6pSPEdPHgmgNnm6OtiVaYdW/nSNEPnJeE6HHPoTbcSOZL9ALcJlxFsycIWCbZjIqRBYaAht+65SkWuHmTI1wIYw22Raeqo74UbnF22a8y1nHBvV18qDX72rDAh0VixZqq2MVPLiKcLMfMHK6/9t+TLTJ1gP7IdIA5jkyjK5JQ7OcM4A7TIbAJW9YG8yf4OXoy7IZJJbEXRAnYCMnZQA/vI0arp1gurU73rqedxf30dKY9QuJPj/jtelRWSdlYQ2A8+JtbqhA3HDPlME2HMz8V1nl4ZamDzQ4KDdxE4RP1vDmYWQLSV26RWcrGu4H8YkoEc/FK3pMjnmupRDkc67p3tbqSW3/zILjpE4xU7vswjLg9MbKROgAUhGjklW2EC12JfSRbEy3KOdHkpUlR+MooZ0rRd6hutQRYxRiPzM1BlUkUyPM96r5wImbjEotKFV/q35R7iA2ztTFZ7lz4v386aWzxHAUY6KDIEhEGv9bE8hQ0IliTk6SUwZclRl7HPq5JHxyCil7Iz/4vodZiw+coq8LlU8VIQMlwuhtmaE0VZDMA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(110136005)(54906003)(316002)(66574015)(6486002)(41300700001)(71200400001)(478600001)(44832011)(83380400001)(186003)(36756003)(31686004)(2616005)(5660300002)(2906002)(38070700005)(31696002)(86362001)(6506007)(8676002)(4326008)(91956017)(76116006)(6512007)(26005)(8936002)(122000001)(38100700002)(66446008)(66946007)(66476007)(64756008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?enVYWFZza0E2UzdMZlROMng0WEplZGovcUNFM1JRNFpVSFQ0THBNUzhYZUsv?=
 =?utf-8?B?TE85eFhVOEpXWkgrY0NIRkxMUjJnL2cvUUdLVUVKNis3VDIvZ21RN3VDQ1Qr?=
 =?utf-8?B?K0xNaTgwOE16eG11OVVRaXR3SlRXSVVWNlZGYmJYUHNHbzRFWEFZYXFLdzdr?=
 =?utf-8?B?KytmK1NsTjRQVHY5U2U3T2dlVkQzbEE2TllqQXpZQm1PSXhVR2pQeGlTeE9J?=
 =?utf-8?B?SnJmQTBKYjhLQlpOSmR4b2hDSEd6UFl4M3U3VVd1VkR3OXFSYkdzcHMxYWdU?=
 =?utf-8?B?cXB4S3lHTHFRMzZIYThFUXFEbjcyUWdNQW9YaUJpY1BKQ3M4blR4WVdVWVg1?=
 =?utf-8?B?MDdGRHUxMERUSVNCVVdNV1hFR05LcU9tUjlvWmV4N0hDZjZzUm1lNkR4c3FG?=
 =?utf-8?B?NS83cC91YVptVnNkbkZ6YnJMSElRSlM3WlZSbUpiQjVBZ1JVTHdrbndYTEhO?=
 =?utf-8?B?cTgxNVZnd2sxODQ2S0pkR0dzRjN0VjFBOE9sS2FsV2VGNjIyVktLSU1OTFpu?=
 =?utf-8?B?QkVINlpMVVpKek9vWTRkeG00WkNZekFSYkJoZEkxQXRDaTl5anMxVi9ZaDUw?=
 =?utf-8?B?MGg5Rlc3OEVjWW83WktHM05IdkFNWUFrcGl6YTNjMFZvWlZyenV2VEhITG5B?=
 =?utf-8?B?VS9VWkhzTXY2U0IrOE0xUkNpeWFLUEFVZHl2QzV5MW1qRmNIQkNScCtxOXps?=
 =?utf-8?B?T3A1OUVuaTFvU2w3YUxIVmMwYTczVkkyaURTYW91dmxrbDVpZWxlYkdkdWJM?=
 =?utf-8?B?VlpGelR4K2FmaEJrT0c1QXNOeG14Nm5vd21yNks1cUNHYkFpeWwrbUdMa092?=
 =?utf-8?B?T0VXOEM4RGd6WWhDSm5OMExMSnpld0x5c1pXUnRQVUdsOVh5T1BMSjhvc2xO?=
 =?utf-8?B?Si9EYjhvYnEwZkM4TTRzSWFNd3BINURkakcrUzhIN1BFdDdpakF5VDhYSmdz?=
 =?utf-8?B?TE5YR1AwRzcxdDZmRkFpak9kYUlnKy9WRm9LMHR6Y1VNUGxFWGpxSFY1b2hx?=
 =?utf-8?B?L2ZCMEhBc056Y2I1d0hkb2x4cGFkQ1NyREEwWURHYko2MERRZk9RVFBWaTFT?=
 =?utf-8?B?T2plNktYSThzaXdMdWsxU29QUVVKT0hIbUQxRUR5MkRFM1lnd2tCdUZ6NEwz?=
 =?utf-8?B?dnBuY2xnZHJWbWhqbUc2QXN6Ry9TYzRmTlJ0YWp1alVDUW1GR0U0dWZjRXFI?=
 =?utf-8?B?dDVjeXJjbWROSWx2YmkrVUZaQnhJZnJOL3REMnFZT21QalhxRTl4TWZ1dDA0?=
 =?utf-8?B?ZDlPUnhHVTkzbGVLRkI3Q3luZmJ0VE9LbkV4aGZBMVAyOGxYYjZIc2JvTWgw?=
 =?utf-8?B?anVkYlpGMzJpRXdtcXpYNDduYlFxRGp6cElmUGN3NXlvNlQwM1FrcXZnVG9C?=
 =?utf-8?B?ekxmSWlXL01rSHdmNkdnaFQrR3luMG45NlNPaGlqY0pieFRWQWRWYlZDRGkv?=
 =?utf-8?B?bitIcXMwbUtMOE1qU1FKWVJ0ZDVOZ25SajQyRm4relVVeUlFYit3aXFxdTM3?=
 =?utf-8?B?TkswWVk5TVN3Q25ZaEhrNm1oVFZleUo4TUZLMlVGcm12S3VuUGdwWWhxZzNL?=
 =?utf-8?B?YzV3VzNSVzNiRnpyNDIxdHFnNEV5NGpESFoxV2RJS2VXME5aNzBGVjdhWUcr?=
 =?utf-8?B?ZWdQbTQvNjQyeHpkd2Frb1JtWTFTOVByWDEycjFNT0Vlekg0cjZLSGdtQUR4?=
 =?utf-8?B?ajQ2SFBTODY3aUVhOFZONGhSbU8zbnNlZFVZd2ZPL21VWitvY3AzSXpMbEFS?=
 =?utf-8?B?aFdJR0hQM3p2aUFBWDQvVUJYVVRMdkF3QXVqU3RvdTVGMG9kUC9PencrSlph?=
 =?utf-8?B?Mmk1N2RCaGNYL3hCRWVxVzZDY3lWNGYzQ0NjYUowQUZQUXVFcXNYeFVKVHBa?=
 =?utf-8?B?RC94N3JqbDRkVDhHbHRLWk84L0dvVldPcEo2Ty9paXE2RXhtbU1nU1Z3eHpU?=
 =?utf-8?B?MnB4QTQ5N2Y0OGlheGFJYlRsdHZ6QjR1NGhWTDY3NWJUNFZUckRSak9QTEJS?=
 =?utf-8?B?Y3BEUTc0bVVORUl1VTNudmJmWGFFSjBSZHBqK0YwWWR6QkllVXJ2VTF1RnMy?=
 =?utf-8?B?UU02a21adFdINW5aTTZjT1NUUUg5WVNpWVRaay9mcnV4dE1kUWRNWEhXZEU2?=
 =?utf-8?B?T0lUeUptTTVEaUYrUXkwYTZxSSsrby9ha0ppZzVUY1VTQmdDR3laUGJWU1Aw?=
 =?utf-8?Q?p/UvD3gd4B98l+elDBovG9Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28AEE32249C3F942A43549825A17D2D0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c08e613f-fd14-4ce7-8073-08da922bbb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:22:54.4865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFDaTGz23kGuTvNaHPEwpNmB29CWa8mUaP4LN2NNwgRfjk4Rhu+Esmz2DDfv1anjTj8w48jCIgAxs/lOjlChBVJDQnI9U0fOwu+ccP3P+ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3121
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA5LzIwMjIgw6AgMDc6NTAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSGkgQ2hyaXN0b3BoZSwNCj4gDQo+IFRoYW5rcyBmb3IgdHJ5aW5nIHRvIGNsZWFuIHVwIHRo
aXMgdGFuZ2xlZCBtZXNzLg0KPiANCj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1PiB3cml0ZXM6DQo+PiBUaGUgb25seSA2NC1iaXQgQm9vazNFIENQVXMgd2Ug
c3VwcG9ydCBpcyB0aGUgZTUwMG1jLg0KPiANCj4gQUZBSUsgdGhlIGU1MDBtYyBpcyAzMi1iaXQ/
DQoNClllcyBpdCBzZWVtcy4NCg0KPiANCj4gV2Ugc3VwcG9ydCBlNTUwMCBhbmQgZTY1MDAgd2hp
Y2ggYXJlIDY0LWJpdCBCb29rM0UuDQo+IA0KPiBUaGV5J3JlIGRlcml2YXRpdmVzIG9mIHRoZSBl
NTAwbWMgQUlVSS4NCj4gDQo+IFNvIENPTkZJR19QUENfRTUwME1DIGFjdHVhbGx5IG1lYW5zIGU1
MDBtYyAqYW5kIGxhdGVyIGRlcml2YXRpdmVzKi4NCj4gDQo+IFlvdSBjYW4gc2VlIHRoYXQgd2l0
aCBlZzoNCj4gDQo+IGNvbmZpZyBTUEVfUE9TU0lCTEUNCj4gCWRlZl9ib29sIHkNCj4gCWRlcGVu
ZHMgb24gRTUwMCAmJiAhUFBDX0U1MDBNQw0KPiANCj4gQmVjYXVzZSBlNTAwbWMgZHJvcHBlZCBT
UEUsIGFuZCBzbyB0aGVyZWZvcmUgZTU1MDAgYW5kIGU2NTAwIGRvbid0IGhhdmUNCj4gaXQgZWl0
aGVyLg0KPiANCj4gQW5kIGVnOg0KPiANCj4gI2lmZGVmIENPTkZJR19QUENfRTUwME1DDQo+IF9H
TE9CQUwoX19zZXR1cF9jcHVfZTY1MDApDQo+IAltZmxyCXI2DQo+IA0KPiANCj4+IEhvd2V2ZXIg
b3VyIEtjb25maWcgYWxsb3dzIGNvbmZpZ3VyYXRpbmcgYSBrZXJuZWwgdGhhdCBoYXMgNjQtYml0
DQo+PiBCb29rM0Ugc3VwcG9ydCwgYnV0IG5vIGU1MDBtYyBzdXBwb3J0IGVuYWJsZWQuIFN1Y2gg
YSBrZXJuZWwNCj4+IHdvdWxkIG5ldmVyIGJvb3QsIGl0IGRvZXNuJ3Qga25vdyBhYm91dCBhbnkg
Q1BVcy4NCj4gDQo+IFRoYXQgaXMgdHJ1ZS4NCj4gDQo+PiBUbyBmaXggdGhpcywgZm9yY2UgZTUw
MG1jIHRvIGJlIHNlbGVjdGVkIHdoZW5ldmVyIHdlIGFyZQ0KPj4gYnVpbGRpbmcgYSA2NC1iaXQg
Qm9vazNFIGtlcm5lbC4NCj4gDQo+IEkgdGhpbmsgdGhhdCdzIGEgcmVhc29uYWJsZSBmaXgsIGp1
c3QgaXQncyBpbXBvcnRhbnQgdG8gZGlmZmVyZW50aWF0ZQ0KPiBiZXR3ZWVuIENPTkZJR19QUENf
RTUwME1DICh0aGUgc3ltYm9sKSBhbmQgZTUwMG1jICh0aGUgQ1BVKS4NCg0KT2ssIEknbGwgc2Vl
IGhvdyBJIGNhbiBtYWtlIGl0IG1vcmUgZXhwbGljaXQuDQoNCj4gDQo+PiBBbmQgYWRkIGEgdGVz
dCB0byBkZXRlY3QgZnV0dXIgc2l0dWF0aW9ucyB3aGVyZSBjcHVfc3BlY3MgaXMgZW1wdHkuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdXR1cmUNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0N
Cj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9jcHV0YWJsZS5jICAgICAgICAgfCAyICsrDQo+PiAg
IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlIHwgMiArKw0KPj4gICAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4gLi4NCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSBiL2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvS2NvbmZpZy5jcHV0eXBlDQo+PiBpbmRleCA1MTg1ZDk0MmI0NTUuLjE5ZmQ5NWEwNjM1
MiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBl
DQo+PiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZQ0KPj4gQEAg
LTEwOCw2ICsxMDgsOCBAQCBjb25maWcgUFBDX0JPT0szU182NA0KPj4gICBjb25maWcgUFBDX0JP
T0szRV82NA0KPj4gICAJYm9vbCAiRW1iZWRkZWQgcHJvY2Vzc29ycyINCj4+ICAgCXNlbGVjdCBQ
UENfRlNMX0JPT0szRQ0KPj4gKwlzZWxlY3QgRTUwMA0KPj4gKwlzZWxlY3QgUFBDX0U1MDBNQw0K
Pj4gICAJc2VsZWN0IFBQQ19GUFUgIyBNYWtlIGl0IGEgY2hvaWNlID8NCj4+ICAgCXNlbGVjdCBQ
UENfU01QX01VWEVEX0lQSQ0KPj4gICAJc2VsZWN0IFBQQ19ET09SQkVMTA0KPiANCj4gSSB0aGlu
ayB0aGF0IG1ha2VzIHRoZSBzZWxlY3Qgb2YgUFBDX0U1MDBNQyBiZWxvdyByZWR1bmRhbnQ6DQo+
IA0KPiBjb25maWcgUFBDX1FFTVVfRTUwMA0KPiAJYm9vbCAiUUVNVSBnZW5lcmljIGU1MDAgcGxh
dGZvcm0iDQo+IAlzZWxlY3QgREVGQVVMVF9VSU1BR0UNCj4gCXNlbGVjdCBFNTAwDQo+IAlzZWxl
Y3QgUFBDX0U1MDBNQyBpZiBQUEM2NA0KDQpUaGF0J3MgaGFuZGxlZCBpbiAgW3YxLDEwLzE5XSBw
b3dlcnBjOiBSZW1vdmUgcmVkdW5kYW50IHNlbGVjdGlvbiBvZiANCkU1MDAgYW5kIEU1MDBNQy4g
U2hvdWxkIEkgcmVvcmRlciBwYXRjaGVzID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
