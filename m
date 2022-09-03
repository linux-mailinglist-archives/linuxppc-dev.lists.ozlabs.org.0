Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 333345ABF73
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 17:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKdS319DCz30F7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 01:07:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lYFKN8Sx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.75; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lYFKN8Sx;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90075.outbound.protection.outlook.com [40.107.9.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKdRF30rdz2xZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 01:06:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVBQtpmVktuTzUY2wf4n6DRHpsI1aY6/iXRjsO5X42LS7Cn3QCZDlH/Bl19vXMpSYs1YHU3u42GmvZwnoLiBbsODptZOyRNERHWLxaXhuFybRcn/9OD05LFiH7/Tf2tbDmxIpge3SVJQEWObHZa0EJgYcvDIv1uLpoOIpsg+PYZnEpU+qvv19Gdl96AHsXCl283KwKz56TYMmqj/k+NSx5HItEfLSlIhEN4GVJVhBnswRHNP6rIHO/hAmSUrcKGs+JuwdL2fFKbh6eDbkmwOXu7F6uxdkn52ljmqcNFwRblyuUpz0qMzy7FjgGNObTNlO/Z4KOdLWp22Jb9T8D/NaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiRAgEXltvvEVwBoGXIy7AtSudTPG8cFZzTw5afkTRI=;
 b=Ag2vZ+dPy7wiam1Mq6v2n9nYYjjc74kY0QwpCZVvFIwSp4IrUhmeBWxqvhHusNofqrTQANXu67KWjZvIkBtPk0ChtL7jVthTymWgjGYpXzyBv1r3i1jN0bRwh1OIQJVLkGos2WTOnjQPeBBOscL3ZOUJmibFEt/BT7FERB9TPPmoQ9n1xUeRrD8apvrVhk9yKWB+h5UDLWC7q/cKe/sKdUvzwmfZ/vvtYP/d5hdAfZTk/GH/cbvqonslk2gRSt4/qS++aHc/Qpi2TAA+Fhr5YAfA+ToX9ih6Hh1R8Iq1Dg/TkBV9nJQt9X/HFC3/lxR8bRCy1XWZz+H7krbB6j8gJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiRAgEXltvvEVwBoGXIy7AtSudTPG8cFZzTw5afkTRI=;
 b=lYFKN8SxwCM3NUdn36/4BbnEwKzulfGYHKgF28hJJHQyrG0RfQNRHcsPJOfoXAK5tCunsyEeqJlt7jnLWjEJjrd+ZXEgRBr5CaecbQSc03U3SZ+RNjtPamgggwM5DnBGPh9LS/SLKiMlh88xez+occx2Ypv1d2aqb7uUUhxJ0O2B0hCVRWMceG90XIC7zbm/ts7Z164RgngfNH5Hz+60psD8cwWvt56kBK4hjtifs+qPm/zRP3r+Q9X2c7Kyo75/mlScayFN6BmpXZT70zp/91pLzo2sH+YRT56R1nBPi+Lsv9BW2NnXBjjUiPi97IHVi0hkemSOu+tz0vsXPvFtUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3351.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:18c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sat, 3 Sep
 2022 15:06:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.017; Sat, 3 Sep 2022
 15:06:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
Thread-Topic: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
Thread-Index: AQHYv5HcTeiP0g8PgE6KVQ+vkT0pe63NzleA
Date: Sat, 3 Sep 2022 15:06:27 +0000
Message-ID: <9534a2bd-57d7-400c-500b-4a591dbb3fbc@csgroup.eu>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
In-Reply-To: <20220903123640.719846-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fe19438-70f7-44d6-9c94-08da8dbde065
x-ms-traffictypediagnostic: PAYP264MB3351:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qe1hZznd1FKEMrh5rw9fbq9dopO80G6lEg+NC8X8QBr0TF8j1uxoQvNQLHLWwveje05mDzIBREnbaZ6MX7LnR/C57ojZeCDjT0KVGjJIHKzM4lgsxIyAiyroTZMDRpmiLhVnQcqhWo7UVee65K+/LNEBkoUSdjSFMlkQiv8TIKJYoBeHF5Y1M3lGK9ezMfSMi3rtQ6oSxfsySwRgJj2oj3mt9iG91FGrVJUns1Bd4ft5LxbYHMcsQ1Z+wuBdGPEtBy7vVDuM1vXRNi+5mg4dWgcdXkZArCVIn2aos3ithOnTaXhAS/gYMiQ+uyBmDIih188TMhCQ5ezfq+1guhD+u2KVpenPTN7VvotzuIwwUdCjmV8Sl9u9MYIPIWedmWvQxeMO6yROQXgYd3b1cLCplS0TiskRQWXFN9yowUT89G7H0eHl1ljB6F5QiEpbJjolxNajUPpRC/AAYs9ViSqUkkrTeUz5syhqjdXqSLOZ+/mqhrXjGEaKFdpBZN2KILEtCbWQYomdioXiUjhOLIcAG/9P72XpZdgl/nfsKKch29RxQcFhBkCvXt7lPFUyQ6+xgNah/XNVHZiafSjpbkRuKeMCGfxv6Zo6qbzrvHknKKmcyWHnOx/mSJgB9QJ4SU/3AdzqS244Z7FjFnU7qj22angF7lWPtt/QMvMDIXxb7EzWoP/etTg0BdfYw/uYjtK1ZbEG9JaGez9my7A85PuUWFFIYwf01UGm/Q9t9jcW84SttP5TsAzrdkU/Oz1UXlIflKWc0zXZnx+nw4LehA2fmXfkqtvixYxqd6ps7oIkY/3NHKSbgVepMTFV3E+Iaf1quvggBHpW1ypIKzUuSVXMODHUdTUuCG9MPqioutT5FuY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(31696002)(86362001)(38070700005)(122000001)(38100700002)(316002)(54906003)(110136005)(91956017)(2906002)(8936002)(5660300002)(4744005)(44832011)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(2616005)(186003)(478600001)(71200400001)(26005)(41300700001)(6486002)(6512007)(6506007)(31686004)(36756003)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?THFMdmxXUVZUOVR0QTh1bXQrbXVZTUVjNFAvVVVPbEgyRzkxK1hPTWh1VDF6?=
 =?utf-8?B?aFh0OXJIaEdLaktmbmxMUE1xbk1HSElqaTRBL3Z3UFhENVVIL2NwNThKblpo?=
 =?utf-8?B?TDhpTlhGeW1DZ21WcjU1ZVFESitxclIyY29LYXdlK1hnOEpDTkVOZjA2b1JZ?=
 =?utf-8?B?YzJWRkxVV2t2Uk5jdm4xWUNHTDBhWER0Z21IaG9ZT3Q1TWVOTVZlSXJoSG8z?=
 =?utf-8?B?ZlVvUnh4VGNaSzBoR3BnY1UwS3RRaU4wZHF2NGVCVFo4Q2lpd0RLNXcyd2Jz?=
 =?utf-8?B?dXhLeEtXQ2tpWUtrWnY1ejBFQnFQd3dNUytERXg0U1IxWGpQQVpob2Q4MlEx?=
 =?utf-8?B?eFVnLzdDb0tacGdUcjZDNmhBcE4xTGdyMXVQci8xVW0zb2Q1di9xN0dEa2Z0?=
 =?utf-8?B?TUtSdW96eElDWFRtdlc3Z2NVcU02V0RKbHJJTmFRdFRKQUhSV1BObVcwc2Ev?=
 =?utf-8?B?WFFmWk5BazlNeFZ3UzZhVTdkUU9RRXh6QWJXRGdSQm1WcE5vZjhFV1VVdFps?=
 =?utf-8?B?MDhEWnY3eDVvTC92M1JjaFFpZFNNeTFBQ1FDV3BHQy8xdDhUaGVVMTA3Q2Rw?=
 =?utf-8?B?amZiZDc4M09rYzVRZ2g1SHh3cUlxbjJweExYYWFFMFc0ejh0enBnbjFtTHBr?=
 =?utf-8?B?SlV4R2lqUDV5eXR6OWpYZUJDQkVaYkh4L2tXZ0c2QVFCZmt1clRSK2s4dmRW?=
 =?utf-8?B?OHFIQzdJTU5IODVBZ1J4VXB2bFA3T0tsdjNuRlAvb0UvZmV5S2hBQjZwdjBw?=
 =?utf-8?B?YUc5dklJd3lVTDczejlOeXN5QzRKRFh1T0ZTeEJMTGl6TlZZYU82K3l4TmxE?=
 =?utf-8?B?dDlGTURUOHVLRWlSMyt4Y0w0NWFONnFHSkhIL3F0YU1KYUxaajk2WnVDWW1R?=
 =?utf-8?B?YW1vVkJwZW15QzR2QUNNcFlmeHpnRUhPamx4L2t3TDlZQ0k3QjljM2V2YlVw?=
 =?utf-8?B?QjNFWEY3Mm1mcHRnSVRaZzFiRnUvZ2RYdEJKZDFCOTlNa1d3anRtVk4ybTVt?=
 =?utf-8?B?ckYzMXh3UXZVaXRGMEUrYTlyNDRVejhkVzdTYm5MN3ZlczVpNEdxTVhrL3or?=
 =?utf-8?B?VkpnVFpzVUxYNWxjSXZrUTdrakoxTlhETWNQNTVFMkg0U0tKZUJGTzhIb2tX?=
 =?utf-8?B?SzhLL3FzTFgzRUlpeUFCOERZMHhFc3p1ZFlPR1drSit1ODVjTmw3RkJFdzd2?=
 =?utf-8?B?SGdmQldTUlJhbzFwOHRoSStpTzBUNEdVdTBaQzNqOW1zc1NZMlQ4aGhNK05N?=
 =?utf-8?B?d2Y0SzhyWjNwTHU0bmtSK0daSTJHajZ4MXhUUk9QRUY1L2RBVFJheGFmNDk1?=
 =?utf-8?B?Sy9HQmpYUURsV2JjeWJ4QWwxd2U2ZDM3UHBwRUo1c2VzTmQ5VUZGcE1KWjBT?=
 =?utf-8?B?cGs5Yms4VkNpSTdudzA5MEszTk9DN2RxMVNOc2x0ckJtVFQrL2F6Rm1lTlE1?=
 =?utf-8?B?NFJwQkp1dXdJeGRxaTJkcVIzdksvRlFCaGRCVmxSamNkT05RSnl3U2J0cjNY?=
 =?utf-8?B?dHp2RHZoTi92Nzg3c051QlNtWFo2U1hUeGpReW4vSjFZZkorRGNwdU96MlBD?=
 =?utf-8?B?ZFdZWTRicEd0RFQza0lPdGE1UFJrWFo5QkVtK1pmQWI1N2wraXhVdEFvR1JQ?=
 =?utf-8?B?eDRta1NzeVZsbUt5YU05dk95Z1VWSU93dCtZZDhNNHl4QzF4ZTMxazg4M1Z2?=
 =?utf-8?B?ZGFuLy9nV3VhZDRkNFJMcmk0bkRRNVRLeDhPRXhCTmhHc2JMbjNMSXJvQVpR?=
 =?utf-8?B?dG9PZXRZeFNZaGRIdzMyQXVKSHBwT1ZsRXFWdHc5OTlHTWozQ1hQZHVwVU9E?=
 =?utf-8?B?MGdYTTFiU09zQlVQUFUyNldZTjluUTdzQkc4MFVYQ2lsSzcxY0ZocmpXTUNS?=
 =?utf-8?B?ZjJZdkRJSmExeWsvbG93K3dMcUVWNmhpbGVHek9SUHk3RXZBTW9xU2F1MlZu?=
 =?utf-8?B?bDY0dk1XbUpJeCttZFFKYTRGcDY2NkxXMTJKakllaFIzbEtNYjJjakowMS9G?=
 =?utf-8?B?R2xWcXArVURJUGo3QmZXZkVpMVNlemVvV2oxdVlFNWZQVk1UdjcxU2U0a2kw?=
 =?utf-8?B?UUxkTmFNdkRrWEVQN1JTK2R1NGlSQ3BldmJ2N0FxbzN2V2pxRzlERXVFYnBx?=
 =?utf-8?B?OEUyd0Fuc0RrT2dhSDNjQkVSbitzRVZMVndwRTkzTEcwWmovWUV1V3BQRkty?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D185B80766550E4DBB0626370ED075CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe19438-70f7-44d6-9c94-08da8dbde065
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2022 15:06:27.8968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQZvn16gi+eqKFGIvdjvaM52zKRPoXUzNxeN321fu4LSsIXVQEHLmhuiJxynP4bLrCZBDKssrsQ2JKJbKrb6m3BnsT68+IRDX5E/gbQhJMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3351
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA5LzIwMjIgw6AgMTQ6MzYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cg0KLi4uDQoNCj4gDQo+IEhvd2V2ZXIgaW4gY29tbWl0IGJhOTViNWQwMzU5NiAoInBvd2VycGMv
bW0vYm9vazNzLzY0OiBSZXdvcmsgcGFnZSB0YWJsZQ0KPiBnZW9tZXRyeSBmb3IgbG93ZXIgbWVt
b3J5IHVzYWdlIikgdGhlIHBhZ2UgdGFibGUgbGF5b3V0IHdhcyByZXdvcmtlZCB0bw0KPiBzaHJp
bmsgdGhlIHNpemUgb2YgdGhlIFBHRC4NCj4gDQo+IEFzIGEgcmVzdWx0IHRoZSAxNkdCIHBhZ2Ug
c2l6ZSBub3cgZml0cyBhdCB0aGUgUFVEIGxldmVsIHdoZW4gdXNpbmcgNjRLDQo+IGJhc2UgcGFn
ZSBzaXplLg0KPiANCj4gVGhlcmVmb3JlIHRoZXJlIGFyZSBubyBsb25nZXIgYW55IHN1cHBvcnRl
ZCBjb25maWd1cmF0aW9ucyB3aGVyZQ0KPiBwZ2RfaHVnZSgpIGNhbiBiZSB0cnVlLCBzbyBkcm9w
IHRoZSBkZWZpbml0aW9ucyBmb3IgcGdkX2h1Z2UoKSwgYW5kDQo+IGZhbGxiYWNrIHRvIHRoZSBn
ZW5lcmljIGRlZmluaXRpb24gd2hpY2ggaXMgYWx3YXlzIGZhbHNlLg0KDQpXZSBhbHNvIGhhdmUg
cGdkX2h1Z2UgZGVmaW5lZCBhcyBhbHdheXMgZmFsc2UgaW46DQogIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wYWdlLmgNCiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxl
LmgNCg0KVGhvc2UgY291bGQgYmUgcmVtb3ZlZCBhcyB3ZWxsIGFzIHRoZXJlIGlzIGEgZGVmYXVs
dCBkZWZpbml0aW9uIGluIA0KaW5jbHVkZS9saW51eC9odWdldGxiLmgNCg0KQW5kIHRoZW4gYWxs
IHVzZXMgb2YgcGdkX2h1Z2UoKSBpbiB0aGUgY29yZSBtbSBjYW4gYmUgZHJvcHBlZCBiZWNhdXNl
IA0KcG93ZXJwYyB3YXMgdGhlIG9ubHkgdXNlci4NCg0KQ2hyaXN0b3BoZQ==
