Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E34DC1C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 09:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK13q0344z3bW0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 19:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK13H6rblz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 19:46:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiA4s+/PtvVCw8Mh242V0EB+p/si7bsQJWHyGCLTjl1wgqlTtrxl/qVe2ulAAwtraTOODCKxrZ6ChMn0IaOqYeo0gtZrevabMvSxXenyNwPVhUcp1E32yfnawNTxgca2ld9ZuP79o4aPH953BHncbQEO+wkN2/G+/E8NK3db8+wheCcbojOKsZ0inVQwImpQnSdROkp12zKN3USI8APRORHM+3ItHscQ9N36H040/jGgsvMkMC36OQh2+tnSXUD55uHLx7304kORVGSQv2GYl1hUog6u4kNLng5GEiUzgvdh/EeNY9nR6PqOLSe8OAIzUyiaO4LWFo9VyzSgop1BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xTlnaWRsJSbz+dr1c9EbKptOIYdTbkdFz5BaziHYR8=;
 b=UoO1yhy/0nfYIgQ49A3+XpUDZHG2/MpK+5bWVaVfQOZT4hFBIxTSMl8eKA0icmBZafCBQ0Zg406w+l9Urbv7Kh0nvYVIXFeMKFkOBBNa+aNzm8UWp7/J0QPAjE5oSYKKanElFNZQHMahonde4bV5c4IPSt2yv5GPXauzLV9SaQcHT3S4iohRJB96NObdIoW3pvfdxR6raEAV9/idfVTXEH98fEswGioo3VY7ql/eMoSIn0+XlVSl77ipjZh5ipv+Uc+JmI/eQ+bKXgIvQt+S0VRUmxEtNogBL7iOgYXia5x6JIagZzHCDuuwwwz/VTcwCA5D2Qa1oZI9Kz+9Lt7Nag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2410.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Thu, 17 Mar 2022 08:46:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:46:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Haowen Bai <baihaowen@meizu.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "adobriyan@gmail.com" <adobriyan@gmail.com>
Subject: Re: [PATCH] macintosh: smu: Fix warning comparing pointer to 0
Thread-Topic: [PATCH] macintosh: smu: Fix warning comparing pointer to 0
Thread-Index: AQHYOaoICytQdKW/I0SZp75zvca+KqzDQ6cA
Date: Thu, 17 Mar 2022 08:46:30 +0000
Message-ID: <b679c9a8-dce7-d492-6c2d-c82cbbb6f903@csgroup.eu>
References: <1647485088-16068-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1647485088-16068-1-git-send-email-baihaowen@meizu.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 131ba8c5-7e49-4713-d391-08da07f2a1b6
x-ms-traffictypediagnostic: MRZP264MB2410:EE_
x-microsoft-antispam-prvs: <MRZP264MB24102E991B3279DD93A55FCCED129@MRZP264MB2410.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfqGMdIG6JkGZu0yiE2cIvj/0DHmSkr2GmIAWGryiG0rOqFxG4erdUBuDmlwBqD5TtNEpozXI5b8FsP+EF883XKxWbEbth3EhgHnOFXglBjTlVlT42SjJQXHpUS7Y8GBm7/DZL8q0BxM3u0NGVDALfsNVooBK3QJhE6Um5CutDHqUwJp2dUteA9McDLr4FXWk+YUOU43klZUJbWa5SVlTFU/fZKrJNuPj4VXlHln9pKEw4cPVFRIEKjfi4JvGgaZyMTKmBYlPDRwLtAvjrNf/mgBlAbqRozadBsLORxH5M1ok3Hsuxc/1UeGliqYrXeGimIDXdFOu2KAjfCW+sTdcn3+LZUtLsUX58wSN8RWFSQcG214VL73z3xwCP8A/t4rxU0HXaPoNtBlJx3JDWznAHHluIZ5JieOAxzB/s7RuOpwk3lY7XVox228N+xbjPZwgADQr6G0vI4DWKW+xzMyj2Z6MyiYV03hLPAgCqY6T3tX00/42+XuY3RO9JCSv8MNcSuxsV+owF0FR8CZ7Ba9JOfzBhYDnlzEZ2O8Hdo7Po60yzo2wmU3aCRbBZOMV1Ew+1zf0tcc7S1sgqP0HX7s/khcraf7HG9I3w3eHxOETH0uwMGymz6Yr+4iy21uDn2OqeeGp0tQgAnoYRu++VdGwdMwubV6LAUTfnxsjPxTiKJL0hoZjncZT/BUisTLejnvSNBc3KW1vAQcqgcB1o1wIeIDUg5JaZz4aYiesR0smMtzma9KaihsVE4HLawgXoLJZBLPFedLrT6ls5YKek1NNPMQRphNZzkCv5zHtmONtEGUk4bdtYRbVHrNld7iL/0Ny7TwB2sEJraaMra9kW6FGb27nxUnQULjhqrk11hjzG4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(8936002)(6512007)(5660300002)(508600001)(6506007)(186003)(2616005)(8676002)(86362001)(31696002)(26005)(76116006)(4326008)(66946007)(66556008)(6486002)(64756008)(66476007)(91956017)(2906002)(966005)(66446008)(38070700005)(71200400001)(122000001)(38100700002)(31686004)(83380400001)(316002)(66574015)(36756003)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekozNGV0aTB6ZUpvMHNCTWc0VmJ5K1ZZRHdOUmJPWmVBL3J5Z0tkeEZkc1pZ?=
 =?utf-8?B?dlVSTG4yb1A4TzhLOU1QUEx3YXdPN3hpVFdnNkVNbkEyT2JrM2RMVnBIWlll?=
 =?utf-8?B?aW1tL2JCSHllUCtMeHRDT3NIclhONWJWaVl5QTVKaDQyUzBpSWp6eWRaU2tI?=
 =?utf-8?B?djE4VjUxdmpCQmxZdXJ2OWlIVXlMemJnbFF4NW95YW44RXk0aG1NbksxRkVJ?=
 =?utf-8?B?NkZZeW5QdEs0VVFIQW9sWTUvcnBHYmJ0VE45dHFtem9vTjU0UnlHUDRPRFhU?=
 =?utf-8?B?TnV5UHR3bGVVQkYzbHpnQ0xHS2p0bE9sRmVkandYRFFmN090bWV3ZU9xWHFF?=
 =?utf-8?B?S2lEMTkvVE1YcVZaN2FOYTNkdnhMWTJBbGpwaXk2RTl1ZE1tQ29OY0syYXF5?=
 =?utf-8?B?eS8xZHp6SkNsZDd1bjYrSGZnRVBHVWdBWjQvajNNK01TZ0E5dlZ5MnJ0c01U?=
 =?utf-8?B?MWtCWDZwWEdBUXJWZUZ3dHdsYk5KcVRId2JRNjJmWnRZdm1SWklwUFFETWN2?=
 =?utf-8?B?cGQ3V09iTzJ4dEJENURxZ3YrcW9GVnVqWGtKb2NTeWU5dEUzeUF4SlRnNndu?=
 =?utf-8?B?aW9WOHU3Y3JKRk0yVDVEWXd4VDAyUjJEcWhQaEdwc1ZCMEFsSThKMkNjSE44?=
 =?utf-8?B?UWNJTjZzM1VZZ1BVZDRaaGRSZVptazRpS3grMGJqaXhEKzN1OTM3bGNQWkUr?=
 =?utf-8?B?Mjgwa2U4dWw5eDFuNVBSMzl4TXc5TUMvRG5oVDhYenVCaG13WUdhK0t4a3F6?=
 =?utf-8?B?aFRWV1l4WG91KzJIalF3ZjIreXVHMHlrSkZqNThtUGV4TnR5dFhnWEQ5QUM1?=
 =?utf-8?B?K25tSzRlaVM0UGE5NE0vVXIyWTlPSjlqYjB2dkNmL3dNTzB0UGR4R1pVVWQy?=
 =?utf-8?B?cy9XLzBIZDI0WlYwNmJkcU9NaGg3UkVkdWlDVDNFSlpSQ0dySVNlbVBmQ0tN?=
 =?utf-8?B?V0xwbkxGSytvOEs2UDZWOHZtWldZSUtaT1Q0VjhLNnRoMkh5SnFDZWJRSHVU?=
 =?utf-8?B?aHBTNDQ1TlBKbndlczE2czMyOStpc0dVeUxOd2JKQnVhdU5DMVR1VldhemRw?=
 =?utf-8?B?eFhNM210dFZ5RzhvVitQWWhaYlZmNFJRQWNHUFRKYVVRNEVWd1U4dzliQ044?=
 =?utf-8?B?WWlEa1I0RFVoNzVvcDYxUnRyMGxZSUlLbFZGVWhIcUU4Z2lNUGY3R3VWdDRL?=
 =?utf-8?B?SU84UitWWXFnL2JVdk9JNGowYThnV2xDcnN3a0liamI5Vk1xL0tMbzVBNDBz?=
 =?utf-8?B?dHNNSUxWTlZyZk42U1JxNmV3RjB5SjhWM2hoMVRXaVIyUmxaSzBQa0dIYmZ2?=
 =?utf-8?B?YVJ4dUpxL0tZZXAvODBhTksvV3lwTWV0VTJUQjI0RTRLanpydmpockRTQnYz?=
 =?utf-8?B?UXd1ZzRzU1hEWndWWXh1VFlmbmVNM3ZoQ1ZLT1R2RE9GQzc1Ti9rT0dFU1Fa?=
 =?utf-8?B?aDVHU1hoVndPVTA3Rk5wek82VEMxQnEyOHhCelFnNnNhb0FPOU80ZzNDTjBI?=
 =?utf-8?B?WXRuTFpSTExibUs3eXEyZHdSZ2dsc2xxT1BkTnZEUnRFcDloVUllZTh4M1lH?=
 =?utf-8?B?dmVKeGRDWUxraWZneUFkY2cyc21yWnNKQU1wNmhuY0YrSDREUDdYUDNsQUtK?=
 =?utf-8?B?WW1Xd1hmMHJDUC9rdVdrN0hPSjQreUJ1RzhTNVY1Nk4xalBWRjVtYTNpbjdS?=
 =?utf-8?B?dW1VOVc3MmtZOEJ2dytOMUkxRkZEeTMrbjlkcXJrdUpnUVpKNFIxTFFNdVR5?=
 =?utf-8?B?ajluVTZjeFBybHZCY29QcWl0UENKdHhZQTI5NlhVK1ZZa0FHRU1zRWZwMWVX?=
 =?utf-8?B?TWRlWXdydE1PSUpDR3RpcHR3L1BOVWpjOXZDaDdrSTNKd1pJc0hFS2Z3TXdN?=
 =?utf-8?B?UkRqRUJGZTNkQ1hrZmRRTmJmQlU5VjJkMlEyNUZCRTk4Vjc3cktBRWpwRk1q?=
 =?utf-8?B?eDROUkxnQWFEMmpTL2JJZVFCU0lsNzdlTzlOTnZzYkJBYVhhMTBvNWlTTzJ4?=
 =?utf-8?Q?UGLNsGuPKwYgW3ZdTJh/fOxbGaJvGM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB3E9B1DB9170E4EBC05211FBEBD330D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 131ba8c5-7e49-4713-d391-08da07f2a1b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 08:46:30.2628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3uV4sMnk911nk/WvWKxunV7Mj/2fg/xjO1bMpypkgDfRqlrQwy5DG0NlFGsxYzUCx7Fk8clZpJudMXYmTtsk55KjPqWohrqzarTkfFX/WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2410
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAzLzIwMjIgw6AgMDM6NDQsIEhhb3dlbiBCYWkgYSDDqWNyaXTCoDoNCj4gQXZv
aWQgcG9pbnRlciB0eXBlIHZhbHVlIGNvbXBhcmVkIHdpdGggMCB0byBtYWtlIGNvZGUgY2xlYXIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYW93ZW4gQmFpIDxiYWloYW93ZW5AbWVpenUuY29tPg0K
DQpUaGlzIGNoYW5nZSBpcyBhbHJlYWR5IGF3YWl0aW5nIGF0IA0KaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIxMDgyNTA2MTgzOC42OTc0
Ni0xLWRlbmcuY2hhbmdjaGVuZ0B6dGUuY29tLmNuLw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWFjaW50b3NoL3NtdS5jIHwgNiArKystLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWFjaW50b3NoL3NtdS5jIGIvZHJpdmVycy9tYWNpbnRvc2gvc211LmMN
Cj4gaW5kZXggYTRmYmMzZi4uZDcyZDA3MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tYWNpbnRv
c2gvc211LmMNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRvc2gvc211LmMNCj4gQEAgLTEwODcsNyAr
MTA4Nyw3IEBAIHN0YXRpYyBpbnQgc211X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0
IGZpbGUgKmZpbGUpDQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgDQo+ICAgCXBwID0g
a3phbGxvYyhzaXplb2Yoc3RydWN0IHNtdV9wcml2YXRlKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYg
KHBwID09IDApDQo+ICsJaWYgKCFwcCkNCj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiAgIAlzcGlu
X2xvY2tfaW5pdCgmcHAtPmxvY2spOw0KPiAgIAlwcC0+bW9kZSA9IHNtdV9maWxlX2NvbW1hbmRz
Ow0KPiBAQCAtMTI1NCw3ICsxMjU0LDcgQEAgc3RhdGljIF9fcG9sbF90IHNtdV9mcG9sbChzdHJ1
Y3QgZmlsZSAqZmlsZSwgcG9sbF90YWJsZSAqd2FpdCkNCj4gICAJX19wb2xsX3QgbWFzayA9IDA7
DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgDQo+IC0JaWYgKHBwID09IDApDQo+ICsJ
aWYgKCFwcCkNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiAgIAlpZiAocHAtPm1vZGUgPT0gc211
X2ZpbGVfY29tbWFuZHMpIHsNCj4gQEAgLTEyNzcsNyArMTI3Nyw3IEBAIHN0YXRpYyBpbnQgc211
X3JlbGVhc2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpDQo+ICAgCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCXVuc2lnbmVkIGludCBidXN5Ow0KPiAgIA0KPiAtCWlm
IChwcCA9PSAwKQ0KPiArCWlmICghcHApDQo+ICAgCQlyZXR1cm4gMDsNCj4gICANCj4gICAJZmls
ZS0+cHJpdmF0ZV9kYXRhID0gTlVMTDs=
