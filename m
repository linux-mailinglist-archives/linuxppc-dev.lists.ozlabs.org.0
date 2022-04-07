Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBC4F7764
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 09:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtCX1CLwz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtC24bY4z2yMS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 17:23:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjkoIUT1D7uas9jYE0pFCVzvJpzlNDB8d2YN5x8QnKLw6evHhjJiIwLyqm8za5WrPnJjQavA2u25fP5NuJRS223m/mZIVpncIdSLwkEVrGxfGf1toxsnhWdcxcRZvQ8amChbF3Mbf/UEApw1kBg3RZSnduId6IvZ9eO8jHqUYbcYaQ2zHlTkgQz+s75v2uQ2HagBjz1DpguWjNx7/XnNxnzfshnAMoED0qWj/b/MDjNmgnA7QjqWvly8PZOabnoBj4aHCzylpL0b4gO0NkCshtQR79Pe85T9mkGV1D7Byly3Ok5KdN3E8sb05Gvz9NGI0U1lPGucrRP2vPIvoOg9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulbSk3uOmOLCxQZUToT8rldFjDqIIboS+otkN1Ii6JE=;
 b=JtTZ6Dp4P9MvoxCI53IaZN6Tu4UDbpq7SQxVV5BQMjXPj5Na2XUoYZVOyt3neIo4nHZ5r3XtZPAq4Ym3Yy99jioIeK05wNMZFvboKhmLF3NeSVFxX6rg0OKqk6E5X2rOVGfcz72Rp9kkdg1hdGyUR1YaUvFg5On6ZkwheWfETZ9H8f8wVX3Z8EdHbpQIs+KZ9r5Kod/IkwVJC/+oy86WtilYMK3FT6TG1qX4pQJeO+ELqCXinkdyPHSppfjHiArGoLa/0IlB7U/zzcO5WUuPODBLvKZwA4G+CS6unNaZUDEHGc6rkOI0gsXsbvms0soA7nErTApe5CreJShY4p+M1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1971.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 07:22:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:22:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Thread-Topic: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Thread-Index: AQHYSih99qU/OqN7XUaQvD1dT4ef1KzkDD8A
Date: Thu, 7 Apr 2022 07:22:50 +0000
Message-ID: <226e3fd0-38a2-0034-0a11-db2d2fc89b32@csgroup.eu>
References: <20220407023700.7216-1-rdunlap@infradead.org>
In-Reply-To: <20220407023700.7216-1-rdunlap@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a431f19-6922-4efb-fb82-08da18676c1b
x-ms-traffictypediagnostic: MR1P264MB1971:EE_
x-microsoft-antispam-prvs: <MR1P264MB1971DC2A829B6A344319BA40EDE69@MR1P264MB1971.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AkhaKaKIHacy8qAabWxJ2CpFk1HNE76ZDRGYbAGaLiwWaQgmuFuFpdJnVhDB96jiP+bBLp0LgtAV6t4dZqNO/a5nR5wB36r5wMIdW3V7zUkO16+TVVhrn9vjEnMXwVzf8ilVvA0Df+vxU+yK5A/GpDfBZwNrJu8/CXZjUYRDz6KrU7KqcsvHLpplTo41umEAV7Jk5e5RuZmznoYP1//9L7ODRD6U2i5pUQqQbB9Yl35pXdPb+dRBfL9TYKS9sPFJ8/otMLWb7tHZ0UVkz62apgmacL69tjxV1KxwMTT/jlf0wHEUxlKvdxWy+7/iUg6iEkp3tRBDauUt2x+Z/7MjcjHqSxUgQaRs9+aID6c61Sf3X5MMZpuEN0rePLvrnlot1jg7fw759FJCo1bG5+2pH/z0ZDhe0QfEI3chcLkpAux41aiTy4ri6xFHUgrBUKeKT2B3W+mD3CFf4j9VREfFG2HBnVSezB0Klkt8k+bXE7oeP/niV+Hng5cmpRE3dgy5zQLn/GO2J4gegmxZTCYhAFQZh672bJRwfqj4W6UBMrN1foda/RutvmvgXOqqKA/hcAz9eFztW5C5QqMt0K8LzvluHQrrAh8Cf5iAY0RIvwOOuvdd/u0tWJNX6YbhAvJYBE8DU37TwzhI6XF5WT8uUNwHR7lzsTGtgD5Wl7KQ+8BBw6q1H4QIius1KMKDIH8wZVBS2r19gZEzCoYGTJr6h0WamfDVqlT8g14zXEYfap6TxqGn2kVQZCNc71rPMZtfsPGpQdKa7NM7W97gfr/TNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(110136005)(91956017)(31686004)(54906003)(64756008)(2616005)(186003)(26005)(86362001)(122000001)(66476007)(66446008)(2906002)(4326008)(6506007)(6512007)(8676002)(76116006)(38070700005)(66946007)(31696002)(66556008)(36756003)(44832011)(508600001)(8936002)(7416002)(71200400001)(5660300002)(316002)(38100700002)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXl4VnhOL1lSUlpqRmR4cXk3ZXFkN0x4NldHa1RyZjJSVXZIbzd2ZkgybXQ0?=
 =?utf-8?B?Z1BFelRnY0lic0Q0VzdyVGNjSGJDbkt1bVJza3hIZ1NBVzhERmVQSzh0Y3Yw?=
 =?utf-8?B?TUV6NFNSMWQvdk9zTmtqSVlSdlZpci95VFo0ZlhxN3crNVdmYXVnUXhRejEy?=
 =?utf-8?B?M21mSlVIK1BlK1dJaFpGZEg1MW4xdGNKbFFsOWpOUGxFcWZrOEc3cUhqRm9p?=
 =?utf-8?B?aDk5VnJMc3JhMER1dkloNHRXU2t4bU4vd1pkbE05b3ZGRTJMeStFT0JQRHpZ?=
 =?utf-8?B?Y2hUQWt6YVVNY1VpMTd6WnQ3NmJzVjFZTzBUck16OHQwMWlPcWNwME9JbmZx?=
 =?utf-8?B?QjR5VFF3bFNJVWxGYzJDODVtcUJsSU9nUWJBNklWZkhpZmRKeE9YdVVuWTNQ?=
 =?utf-8?B?WGNxMGtiZGc0cmVpbmRCMStXYXhqTnQ0THdsR2pqSDRWRDIrK0cxOU1iVnNx?=
 =?utf-8?B?c0JPU3cveGFpalFwNFFSN2tWOHlJaXhpQitwNTJFa0xRWjJpSStwQm9PdmVw?=
 =?utf-8?B?QWorc1dxd2MxcWNabjVwUGRKTWRQbDRuZGlTTFZvcWFZaFJ1amF3ZUtOd3JN?=
 =?utf-8?B?L2hsQ1QzSkZOWXdJbVNodXBxcFYzdzZiN01LQ2NvTW8zVUYxZFdHYlQ4WUVV?=
 =?utf-8?B?WEtZWEZrZVV1TzBNQ0tsUlVrZWNMK3ZUS3RQUTZ2M3gvR1VudWdjMWlhUTNu?=
 =?utf-8?B?ODZmZTBUQTVUblJISjZ1dlYyNDBCWThiUm16VWMraEk2V2I5aWpZNWs1NWdV?=
 =?utf-8?B?UWx5N2d1MzRMTHR4LytKdDg3a3NtbysyeTNnYTl1eTdDYytuZjYwVlQ3ekE2?=
 =?utf-8?B?Q3ZtWUgxOXAwckdyQlhlZmI2TFRjbzJWM2lwVXUzSi9uSDNqWlNVSWFKTm93?=
 =?utf-8?B?bWUyYVFydDJQcjdaSFlKWHNxckxjVW1TVFhDSVRFcGNsSm8xOHVMQlhIZzNj?=
 =?utf-8?B?QmRZNm9hOEh5VTg3ZFJVdjFHNFN0ZlJ0c1NhUk41RDVoZFdGRW03ekJSQkt3?=
 =?utf-8?B?aVV1WlAxS3V5OVFoZG1Uam9mQjQ4TldqMjUzMTR1bVM2KzJycVhvT0tUM0JY?=
 =?utf-8?B?azl4dTI1cXRMdEFNNnl4N0JzMXNvVno0TTVBdENEZUxjRGhRdEdha3VSaTc3?=
 =?utf-8?B?dUtwS2NBODFkUGVuL1dwVG4wUVhmRUd0RDlxQnpEZVZyNDdoV01NZXc3dWlZ?=
 =?utf-8?B?TnV0V3RRbHVONkFmNVgvR1lMdDkydkpCbVJVNy9XMXZUVnFZVkRWTEhMeVFk?=
 =?utf-8?B?QlpKUWVNZkNVQ0VXMXJNUEpIbGN5enE4UFIvbzJkbXlQMS9GMnhOMVpLTjdQ?=
 =?utf-8?B?ZGsySzFaN0w1Rk50cXYrbllNakRtSU5tS3IyaHNiWjBLSExDSC9KMmUwenNk?=
 =?utf-8?B?TTNsVXBDUEw2MlFZVEt0cVNIZ21TMVZad0Q4cWU1dS9SL1E0Qkg4ZzRjTGpv?=
 =?utf-8?B?UnZqODJ5eTV0RUVaWG5Nc2NhRllKZzJtK21NalVLRkl6aWYwV0hpODErYlJ6?=
 =?utf-8?B?a1VTbElzd3orOW1SSnk3aFJkcVF1YWlKdTFuSTVmZFlPd3hmM09MdmhIK2NP?=
 =?utf-8?B?eHpCdjJVVnJFdWRnT3dvREI2dzlXOUM2TXJVTlJCV3hSbGdOUC9Ld1pZTXNH?=
 =?utf-8?B?OFlxSlY0MGpKMWN6VGY1WFlkN2JrR3RQVmp1UUhkUy91c1BHWVhRbnIxSWV2?=
 =?utf-8?B?Vms3Z054SDN6dFBoSmI5bWxjWjJPTmUyRXdqZzZXWXN2VmwwMHdzNUcvNlpP?=
 =?utf-8?B?eFRQOW5NV09uNnFjaWszbFhOVlc3R0ZBZzh3WnRIK3RIV3VkeGhLc1JqbHdJ?=
 =?utf-8?B?TE1majk2RWppTnFNeUhUMWU0RCt0V1ZrVnNLcjZqVHd6LzdldlFBRUpKMkc2?=
 =?utf-8?B?SXkxc01DRnpFWG8ydmJBd3hXa3ZmYWVTaHZrVkUwZjdlZHpKazJaQkFyZ0FS?=
 =?utf-8?B?UEJVbFJPekFMb041NEg1NGlvNXVyNmFSYy83OXc5UzNqc28wMEdTZVBsQjZX?=
 =?utf-8?B?azNzVW4wak5jdkozbzVNYloxSmkzbGI0YUtDQ3dwYko0SnhYcUs0RXk5Sm9v?=
 =?utf-8?B?NkEydXNIWHY3amcyejVwdkhFUEdKTzBoRnZ6Q0tqbkdJOG9GRlhWZXJMUG0v?=
 =?utf-8?B?WEFUNDM2NDlEU0hPS2tMakVpdzVxNzhOZU5abm14QjNid01qN2xvclN2MjFo?=
 =?utf-8?B?UVpxQStiR1BNVmp1UlllNHV2OVFVWVVORTE0NFl6Vll4Q2k4QnB6cEQvSDlP?=
 =?utf-8?B?dkFQa2VKQ0R1d2JkdzhpS001cTJhQWI3dVcyQ0pETlVlUWo5cDhJZit0My91?=
 =?utf-8?B?NDd4N1pwa1ErRStKZ1h4NTRZb0ptL1JKMEt0S3pjSmlXMnVTNVRwamwvZWZC?=
 =?utf-8?Q?Bn4WaG3wmUaLW5uVGBVhJlm+L0Kn1x9CHVPJ+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAE9FB6D1190B54B80C3B26848242A7B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a431f19-6922-4efb-fb82-08da18676c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 07:22:50.0349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6F6r4l2IE7fEytpUXOJ5zuC5kDCE5Yzo7/+oHzJ4AjCIQcNVeuDn7d6YexKkyIdRK26ic54DhAUAbpnmTG3L9usw6XvuXfSoaE6s/eU3tGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1971
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Finn Thain <fthain@linux-m68k.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA0LzIwMjIgw6AgMDQ6MzcsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBX
aGVuIENPTkZJR19JTlBVVD1tLCB0aGUgaW5wdXRfKigpIGZhbWlseSBvZiBmdW5jdGlvbnMgaXMg
bm90DQo+IGF2YWlsYWJsZSB0byBidWlsdGluIGRyaXZlcnMuDQo+IA0KPiBXaGVuIENPTkZJR19S
VENfQ0xBU1MgaXMgbm90IHNldCwgcnRjX3RtX3RvX3RpbWU2NCgpIGlzIG5vdCBkZWZpbmVkLg0K
PiANCj4gRml4IG11bHRpcGxlIGJ1aWxkIGVycm9ycyBieSBtYWtpbmcgdGhlc2UgS2NvbmZpZyBz
eW1ib2xzIHJlcXVpcmVkIGJ5DQo+IEFEQl9DVURBIChSVENfQ0xBU1MpIGFuZCBBREJfUE1VIChS
VENfQ0xBU1MgYW5kIElOUFVUKS4NCj4gDQo+IG02OGstbGludXgtbGQ6IGRyaXZlcnMvbWFjaW50
b3NoL3ZpYS1wbXUubzogaW4gZnVuY3Rpb24gYHBtdV9zZXRfcnRjX3RpbWUnOg0KPiBkcml2ZXJz
L21hY2ludG9zaC92aWEtcG11LmM6MTc1ODogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcnRjX3Rt
X3RvX3RpbWU2NCcNCj4gbTY4ay1saW51eC1sZDogZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS1l
dmVudC5vOiBpbiBmdW5jdGlvbiBgaW5wdXRfcmVwb3J0X2tleSc6DQo+IGluY2x1ZGUvbGludXgv
aW5wdXQuaDo0MjU6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2V2ZW50Jw0KPiBtNjhr
LWxpbnV4LWxkOiBkcml2ZXJzL21hY2ludG9zaC92aWEtcG11LWV2ZW50Lm86IGluIGZ1bmN0aW9u
IGBpbnB1dF9yZXBvcnRfc3dpdGNoJzoNCj4gaW5jbHVkZS9saW51eC9pbnB1dC5oOjQ0NTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZXZlbnQnDQo+IG02OGstbGludXgtbGQ6IGRyaXZl
cnMvbWFjaW50b3NoL3ZpYS1wbXUtZXZlbnQubzogaW4gZnVuY3Rpb24gYHZpYV9wbXVfZXZlbnRf
aW5pdCc6DQo+IGRyaXZlcnMvbWFjaW50b3NoL3ZpYS1wbXUtZXZlbnQuYzozODogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgaW5wdXRfYWxsb2NhdGVfZGV2aWNlJw0KPiBtNjhrLWxpbnV4LWxkOiBk
cml2ZXJzL21hY2ludG9zaC92aWEtcG11LWV2ZW50LmM6NTM6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGlucHV0X3JlZ2lzdGVyX2RldmljZScNCj4gbTY4ay1saW51eC1sZDogZHJpdmVycy9tYWNp
bnRvc2gvdmlhLXBtdS1ldmVudC5jOjU1OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9m
cmVlX2RldmljZScNCj4gbTY4ay1saW51eC1sZDogZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1ZGEu
bzogaW4gZnVuY3Rpb24gYGN1ZGFfc2V0X3J0Y190aW1lJzoNCj4gZHJpdmVycy9tYWNpbnRvc2gv
dmlhLWN1ZGEuYzo3OTc6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJ0Y190bV90b190aW1lNjQn
DQo+IA0KPiBGaXhlczogMDc5MmEyYzhlMGJiICgibWFjaW50b3NoOiBVc2UgY29tbW9uIGNvZGUg
dG8gYWNjZXNzIFJUQyIpDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPg0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+DQo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4gQ2M6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBGaW5uIFRoYWluIDxmdGhhaW5AbGludXgtbTY4ay5vcmc+
DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBDYzog
TmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPiBDYzogTmljayBEZXNhdWxu
aWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+DQo+IENjOiBCZW5qYW1pbiBIZXJyZW5zY2ht
aWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMu
b3psYWJzLm9yZw0KPiAtLS0NCj4gVGhpcyBpcyBhIGJpZyBoYW1tZXIgdHlwZSBvZiBwYXRjaC4g
V2UgY291bGQgcG9zc2libHkgZG8gKGEpIHNvbWUNCj4gY29uZGl0aW9uYWwgY29kZSBibG9ja3Mg
Zm9yIFJUQ19DTEFTUyBhbmQgKGIpIG9ubHkgYnVpbGQgdmlhLXBtdS1ldmVudA0KPiBpZiBDT05G
SUdfSU5QVVQ9eSBpZiBuZWVkZWQuDQo+IA0KPiAgIGRyaXZlcnMvbWFjaW50b3NoL0tjb25maWcg
fCAgICAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IC0t
LSBhL2RyaXZlcnMvbWFjaW50b3NoL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRvc2gv
S2NvbmZpZw0KPiBAQCAtNDQsNiArNDQsNyBAQCBjb25maWcgQURCX0lPUA0KPiAgIGNvbmZpZyBB
REJfQ1VEQQ0KPiAgIAlib29sICJTdXBwb3J0IGZvciBDdWRhL0VncmV0IGJhc2VkIE1hY3MgYW5k
IFBvd2VyTWFjcyINCj4gICAJZGVwZW5kcyBvbiAoQURCIHx8IFBQQ19QTUFDKSAmJiAhUFBDX1BN
QUM2NA0KPiArCWRlcGVuZHMgb24gUlRDX0NMQVNTDQoNClNob3VsZG4ndCBpdCBiZSB0aGUgb3Ro
ZXIgd2F5IHJvdW5kLCBpZSAnc2VsZWN0IFJUQ19DTEFTUycgPw0KDQoNCj4gICAJaGVscA0KPiAg
IAkgIFRoaXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgQ3VkYS9FZ3JldCBiYXNlZCBNYWNpbnRvc2gg
YW5kDQo+ICAgCSAgUG93ZXIgTWFjaW50b3NoIHN5c3RlbXMuIFRoaXMgaW5jbHVkZXMgbW9zdCBt
NjhrIGJhc2VkIE1hY3MsDQo+IEBAIC01Nyw2ICs1OCw4IEBAIGNvbmZpZyBBREJfQ1VEQQ0KPiAg
IGNvbmZpZyBBREJfUE1VDQo+ICAgCWJvb2wgIlN1cHBvcnQgZm9yIFBNVSBiYXNlZCBQb3dlck1h
Y3MgYW5kIFBvd2VyQm9va3MiDQo+ICAgCWRlcGVuZHMgb24gUFBDX1BNQUMgfHwgTUFDDQo+ICsJ
ZGVwZW5kcyBvbiBJTlBVVD15DQoNCkFzIGZhciBhcyBJIHJlbWVtYmVyIHRoYXQncyBub3QgZW5v
dWdoLCBpdCBsZWFkcyB0byBzb21lIHdhcm5pbmdzLCBzZWUgDQp0aGUgdGhyZWFkcyBhcm91bmQg
RmlubidzIHBhdGNoLg0KDQo+ICsJZGVwZW5kcyBvbiBSVENfQ0xBU1MNCg0KU2hvdWxkbid0IGl0
IGJlIHRoZSBvdGhlciB3YXkgcm91bmQsIGllICdzZWxlY3QgUlRDX0NMQVNTJyA/DQoNCj4gICAJ
aGVscA0KPiAgIAkgIE9uIFBvd2VyQm9va3MsIGlCb29rcywgYW5kIHJlY2VudCBpTWFjcyBhbmQg
UG93ZXIgTWFjaW50b3NoZXMsIHRoZQ0KPiAgIAkgIFBNVSBpcyBhbiBlbWJlZGRlZCBtaWNyb3By
b2Nlc3NvciB3aG9zZSBwcmltYXJ5IGZ1bmN0aW9uIGlzIHRvDQoNCkNocmlzdG9waGU=
