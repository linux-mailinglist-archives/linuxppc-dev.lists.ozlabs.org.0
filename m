Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4655A3C84
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 09:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFlgf4p2rz3blQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 17:34:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gnh+DsZq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gnh+DsZq;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFlfw2MlJz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 17:33:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCxcx7LBklcSYGHGsSRjBcQYEHSrS//eIBS/qJOaPYrdcqCuqVp5nfI3ADFEbtIglIvU6bZVBSeE2+NnqjCFHu8CZKEXkdlwca1Bo7ZTMecwkiyWgXJIYty9bCwY1v0f+NfBDcDmEoIrSHZSo8B45jq0Gb10u6kDSgSkS2XpGRHMGxaiqboUasqKARgZ4edn33bPlz6NUeEQXCTWDzyagPtk7WlAMpQxsN9R2GEwyJAdiLOvmLyCQ5Q6jy4F/VgrKaCUEbnvPNtdcycjq2SeBP/EMuLTsCDGWD9S3fN4LDMIGXY5sr7VQXlF1hAoU4dT7ElGLQe1kceS97R/mExZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnJ5L5YZ6k/S0c6wa6r1+SrDvNyj1DNecfYjz2LOoPE=;
 b=G1XQFBG/bfiagXtrEd7oz7vPta7NEGLzwe82fzGY2NCeWu5n2RUZhlBGL7kXMwT5apYH5lvx3aXskXc5s6fxVBo1MV5gAq/Q9ACIrJkQKyGom2zd6kN+n5dtD8h9GpYeMB+DBVVe7R2zpwA9Xx2aOdI6zQS43TnPCLY0Cgt3yAq87xkhwScENCESoYYtQ48PvaDVJ2gyhuDYgZHl+XE4hCUf0RAENkI5inoGpImQ5ID7emQPj2bq984iK1vxFQslppNQ+PQbsnNgaG9jH+D4QD/vvw7GeproAggjfKu0HYtJceG0E+P5rnXFCU3bLIq37u73jzzLaK0h+5nSv5A1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnJ5L5YZ6k/S0c6wa6r1+SrDvNyj1DNecfYjz2LOoPE=;
 b=gnh+DsZqc4HrvKP6hGvB6QyWjaaNEF/pYY5H15Nzq0JKcaX24shzpLiuO8Vlx9LiDXoymConPXJSVeohf+fNIUO4V/tnJIendVqTgQfIYAauEhqqe5C2fShvIjx7NSzTKU1uwh04yAsH7UjnbLST1jqMBufqH2aV/BTWbrQar4D7+WrnjclKBvhT4IYr6+xQk4gZQjV7lZqoEPR/0MNX3AJaQfCKM7ptAkkK6kcZM1tLKB+opG8f4SqT9PZ0KRExQGwF3V+VabE5qWUwZzAPljztWQQ7/aKobsKW7qtswPzC6UHTx1lAdJXXosTZssMOZRRhJpJPeasjd2Lu0s0VyQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4149.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 07:33:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 07:33:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>, Nayna
	<nayna@linux.vnet.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Topic: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Index:  AQHYspAas1zqUQZbRU+OYz0CGvi/xa2z0aMAgAAZ/PCADAxdAIAAF/qggAFxSoCAAAd/sIAABvOAgAAHS4CAAH+M8IABDWTAgADXxgA=
Date: Sun, 28 Aug 2022 07:33:07 +0000
Message-ID: <1e9a46d4-5511-5b89-28ef-582231a94562@csgroup.eu>
References: <20220815190608.47182-9-elliott@hpe.com>
 <20220817232057.73643-1-elliott@hpe.com>
 <e6e99e33-4279-690d-88b8-9e732551c17c@linux.vnet.ibm.com>
 <MW5PR84MB1842E554A4677FA177D73E23AB6D9@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <1eb670ab-b238-8406-510d-c8dad46a2fb5@linux.vnet.ibm.com>
 <MW5PR84MB18421D567F8CA4E5AC99B7C3AB729@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <018a65de-60ce-1906-c461-44dc95353ab9@linux.vnet.ibm.com>
 <MW5PR84MB1842FE1C4B5218959C2608F4AB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <c45efdf7-a677-acb7-84c1-b64284d414a4@linux.vnet.ibm.com>
 <MW5PR84MB184208ECF216DD025CE9D35BAB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB1842263C39734FD662F991E2AB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB184220E67A8141565A8D04CCAB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To:  <MW5PR84MB184220E67A8141565A8D04CCAB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f288e67-d4fc-4355-4a52-08da88c78d48
x-ms-traffictypediagnostic: PR1P264MB4149:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  q9j02x8JiF15wmRW0dlEBdBrXR8taTWBPvKrbhx/LqFPNqiT8uDN+wzGjeokGVwgBoULDoaX8XaDe6rRYnnDDravzl8qRmq0t6piyuaOfEwhVxDWYnrhD3IIRaPT//4sYkfS/PU8K3aG2Xb61O7ydSniykaq0ti5ZQJckMP03aLrr0U+N/NKVA3cR24Q0FstZQt0NQGixOymjr+A6mwC6fU+PsZVsMDIyPOvz2onQy69vfeFUvNiFEdUxUmtuaWAqDRB/CnpHIKhRfy8ealpkZU7ExUc4l30VFe/ZA7FktYagSbv0cCYCOjNglxlrK+hoOiRTxyXGw1CFvtOUkYbe3AALopLPMGMWtT20IXhIcCjuEZznN2viNRLy0caZFGO41JWSQB3ZN5P+Woj3EOuJoiiVJJrC5M6JO2pWW0ruJzQ5GqS8HfYaZe69oLAgoN7/d+KRgz0gvk1M2Wdn4IKIBucEuGGpTTsGtWlcqVFENvgJX5R2aYu3XsLhzCUE9jPm811M5U4fjsRVZH9tD4OgfqQJkWFMDmNlo6e5ZFZYbLv2Gz3dT3h9ON7avlNuxD9l2rajBWzgUoWf9Ip/UClhMqHoAAKH9kEgaoeC1bBj7OIDMZL0k6udkU2sdhyCQ/h6/MhfD323VfDAsScYmVtFt/1nloTqpMj/iNXfhy4diA+MRHSBNmXD0/uv2q/ZSKdD9FA2wUtlkvYH+HY8Lo1fJGx5Wzk4ipIwlD+cNcku0ESJDJS0YsZqxazfDSZzN6HfqTi6d8NbkKmz1dqbfNwAiaWmL5Lwg2PTINpy/Bvs9VBqhHG78eY5X5d/B+1y3csP38JmAg3GOypg58thA4kAg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39840400004)(366004)(136003)(346002)(6512007)(86362001)(26005)(31696002)(71200400001)(6486002)(478600001)(6506007)(41300700001)(122000001)(38100700002)(38070700005)(186003)(83380400001)(2616005)(66574015)(2906002)(66446008)(64756008)(110136005)(66476007)(8936002)(66946007)(5660300002)(66556008)(4326008)(8676002)(296002)(31686004)(316002)(36756003)(4744005)(44832011)(91956017)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TDIvelF2ZVl3T0RUWnEwTHlHTGp0VDhlRkdIYm0vUTZhY01Rd0JFMUlpU0pI?=
 =?utf-8?B?bGs1dnBBN3hjWEw0V2I1ZzZvTURWWHpneGdCV3FqbE1QY1NKSkF6dVloeEk3?=
 =?utf-8?B?akF1VFZVei94RHBFYjJaeUduZncxNjZYSzlqL0FjQXAwTTZxUkZDYnRhbTc4?=
 =?utf-8?B?b3dzT0NQcnpXM0FjeVAwaTdVdUVZSldQTHRxSlUyai8vNzZXK2Q3Nncrd1FB?=
 =?utf-8?B?VG5HQkVBRjJjM0FhaHVMYlMvNUx2Rlc5VVVua01YMURYRzFOcnJNb1NSQXNs?=
 =?utf-8?B?SklIeHR3OVM3cG1PanF2aFFLaE93M0lNWFRRRHI0T3FTWTdxdFd6SzhMMGJY?=
 =?utf-8?B?LzlwNHAzUlhwZzUrZWdGcVVWWHlQaEtpeENIQUFBaGh3NkZ1L1ZJMDB0VnV1?=
 =?utf-8?B?MFJib3ZjNDFMcWpDYjB1T1pER09JQ3kzOVF4YkNsdXNMUTNFMUpOWVZSTTVj?=
 =?utf-8?B?OU1qZDhFdEhDOFpNa2VkQUxGT1liUEg3SCtUNWdoZ1owdjVXOURYbFNjNklv?=
 =?utf-8?B?b0l0WmQyN1grcmVpakRYMzR2TnNndGZQc2tXMEY2NGJyT041SGdyN3VmV2Zy?=
 =?utf-8?B?em5DVm1tWG5nKzEzMDRmM2NzN0tNeGtPdGIvZDdRQkljVUVNRnFnRElKak10?=
 =?utf-8?B?Z2c5YzNORDNBODJJYjZtMEk5c3pjSHdtb2tlaTF3V1pic0VHSFcwQmNTVzFG?=
 =?utf-8?B?Vm1FS1VOR0hEalpaeVNRVE5WNGdpQTMxTytLYVcwVjV1NWVUd3AxeHNpVGpj?=
 =?utf-8?B?M2M1U1JqSlpVaGhMaTBmUWN3TXk2ZEVZN3lpMm1jSnNhT1pEUTVhK2FxbWRK?=
 =?utf-8?B?TXJ4YmdvSStvT0tjLzJwV0daelZVTEdKWTBzOEZIZTlaUFJhQmNzNjZlWVNr?=
 =?utf-8?B?bmJidm8xR284SHRZM2dnOU9NaUZGU0lyREwvS0JrN0dSdHJieHZNQjVlUm02?=
 =?utf-8?B?T2JKWTR0MzJ0TnlmcGFJMXBLR1RyNmFOeHQvYUJiY0Uya1VsSEZ0dXoyNWVE?=
 =?utf-8?B?RzRvTVE1aHBNNjkwNm84aXJvUXhRSXRGV3lJOHdQSEltWHIzY3pSejZQN281?=
 =?utf-8?B?MmFiZXZkU0prdmtjSHFmVElmOFlZYkhiSkVBQjFYaVcrWmpIUHR5aTBSKy9j?=
 =?utf-8?B?MTRkNlJLRUhwWVZWb2hnZ2dGZUpWeTVtK2hKY1RVYVJXUHQ5dEt1U1dyakxI?=
 =?utf-8?B?M2c4eEk2QkVHSDhoMGh2MSt1V1NpOHJ6Z2hlQitOUGtxbmlvLzVGSXgzMlA1?=
 =?utf-8?B?NXdQRENwMFZpaGplbUxYZE1zT0ZURWpSOFJxaVVHREdUUGFwd3lsTHRuQUxv?=
 =?utf-8?B?dHY2cVc4SGxEekt2UTNVMmJSd1NaaTlBTWZmSEtKM0VRNVlDOVFOZW96OFdC?=
 =?utf-8?B?VEJ6eFA3cXlUWFZ5NzY4c2diREJySlNONWdURjFZdHJ3T29lTk9VUGgvcCt4?=
 =?utf-8?B?SkhKU29JbExZbEpHWnpZYkxnODFrYko2UkZrMEZIWkpKcTQ5Qld6NkZPYk84?=
 =?utf-8?B?MWZMMWo3N1BCV1pBUHgxU25tNVpGOWNiNXRUZlcwbkZ5U0VjMFV3WDF3Z0Zu?=
 =?utf-8?B?blFadHVHY2ljaEkrRXZXNW1TWHpHdzJkU2F0ZmRlbFQzYXNBdnQ1V20xdlJl?=
 =?utf-8?B?WjhHNWJCalhUNzlwSHZyMDBQbjJKdDNpbTFiekxhQ2ZOeXNtaW1HZkNpTSsy?=
 =?utf-8?B?VjY5NmxNY0Y2MHgyYk5MY3hDZWZoLzllVXF1QUo4aTIxTE5uUUlvTlRjazBn?=
 =?utf-8?B?VHhGY09PWWRqV0tBcDdBVWhGUERIcWF2Z09zN25rS2Z3MS9YWU5wTlpUUm1S?=
 =?utf-8?B?OFByWnRscHViTVpYbE14YTc1byttQzhMbG8reUlsbFgxZlcycnNCN0Ryb1ZJ?=
 =?utf-8?B?WkliazZsSVUzQVRhbEhjV0dKNnJhclJVTllUY3U5OHdiOTlOa0RZY1N5K2M2?=
 =?utf-8?B?WjJobGk3cmxjQ1RiWng5c1dkbTNjUzJreFFUKzZ3T2tOOWJXeEdzaUNyRUlF?=
 =?utf-8?B?UlcxZGx2cHZ0VjZRNDRBK1d4TS9EeE9zSm9CQ0drN0g5dklMNVdZUUR4SHU4?=
 =?utf-8?B?bUl4bnlUVXhLVkYxcVdOTk9oYzh4Rnc1R0ZFV3BDb3BDT0EwbkU2ZDR2T1l4?=
 =?utf-8?B?cHBaTUZudVhjWnc3aXRlU2dUdkZZajZpOUlRVkRNVzR5dGo4THFWK0JNU1ZY?=
 =?utf-8?Q?bCg4JrYDYsto5IPPKvKDzkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49224F046AF49D43885F624A9FEC8AC6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f288e67-d4fc-4355-4a52-08da88c78d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 07:33:07.6072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rua9czntK51x6rtPxWeSZF6/iBnAvA7Jrcha+y6mUchw95c6z8MjBAEd3AUIBhA+W568hVnqdTMQiFwM1MOHMrUmIdpgCP3THLPzwLZVP6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4149
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDI3LzA4LzIwMjIgw6AgMjI6MDYsIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykg
YSDDqWNyaXTCoDoNCj4gKGFkZGluZyBDaHJpc3RvcGhlLCBwZXINCj4gYmJhNDk2NjU2YTczZmMx
ICgicG93ZXJwYy8zMjogRml4IGJvb3QgZmFpbHVyZSB3aXRoIEdDQyBsYXRlbnQgZW50cm9weSBw
bHVnaW4iKQ0KPiANCj4gDQo+IEFkZGluZyBsaWJtcGMtZGV2ZWwgZ2V0cyBhbGwgdGhlIGFyY2hp
dGVjdHVyZXMgYnVpbGRpbmcgZXhjZXB0IHBvd2VycGMuDQo+IA0KPiAoSSBhbHNvIGluc3RhbGxl
ZCBnY2MtcGx1Z2lucy1kZXZlbCB0byBnZXQgdGhlIG5hdGl2ZSB4ODYNCj4gYnVpbGQgdG8gZGV0
ZWN0IHBsdWdpbnMuKQ0KPiANCj4gSG93ZXZlciwgcG93ZXJwYyBzdGlsbCBmYWlscyB0byBidWls
ZC4gU2V2ZXJhbCBvZiB0aGUgTGludXggc3RhbmRhcmQNCj4gaW5jbHVkZSBmaWxlcyBlbmQgdXAg
aW5jbHVkaW5nIG5vZGVtYXNrLmgsIHdoaWNoIGluY2x1ZGVzIHJhbmRvbS5oLA0KPiB3aGljaCBo
YXMgYSBwcm9ibGVtIGZpbmRpbmcgYSBnbG9iYWwgY2FsbGVkIGxhdGVudF9lbnRyb3B5IHdoaWxl
DQo+IGJ1aWxkaW5nIGluaXQvbWFpbi5vOg0KDQpJc24ndCBpdCBmaXhlZCBpbiBtYWlubGluZSBi
eSBjb21taXQgMDEyZThkMjAzNGYxICgiZ2NjLXBsdWdpbnM6IA0KVW5kZWZpbmUgTEFURU5UX0VO
VFJPUFlfUExVR0lOIHdoZW4gcGx1Z2luIGRpc2FibGVkIGZvciBhIGZpbGUiKSA/DQoNCkNocmlz
dG9waGU=
