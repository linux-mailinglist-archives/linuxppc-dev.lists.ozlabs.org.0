Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9303978D309
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 07:47:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ske1d1wU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbCx12Blnz3c47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 15:47:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ske1d1wU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbCw45FSDz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 15:46:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqKs7AMLCoPxEQqmKV74sIB2jKmYom8m1ZX4/q2+iifBLY3LZ/TkqXO7K9u9rnOgJn7smFChQks32OYI0AlHODDg2BflRWNlYDcuvG6tWPyf9/OmC4W4hYOWlaUYI8hu/mcUqG74uomj4Pg0UswhjM+e/pEjrHeQqSTynudUdhho5d4g4PUV8ACEJTlDrfAw63T46zTQfVhJ/LOo20ld5K2+g3zQdNyqpJ5ATsNaXWDK7MBcuKm9kwgoChn9H6XPPbVO+PHIBOABAvAgn+6GNgCQUZnuj3HiWt3s0Mk9WfMDH6+itAfohYcEZqftL3Kixewbp7L9rzG+QHE+y1drgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySrMpPhv0Dk5n9MRQGbseYVRe8Pg1k+MKU8/oBUlh7Y=;
 b=B++TzF3eLqPxe9gwoDhzFgg3oBZhS4hKdv74BmNqkkjK14tLep9ZQ853Z8itu0cY4Ir2I1GWZA77NFB461R18MKBqEuKRXo70HOaYH4xHf+NdVjfCkgrDRWmgq0ejZ07KyjH+ZNJh2CHcWIXpnQ/frlQKOd5QgHgg2403MqKB3wNivQsfP7iSyt3Oi2W2F0SgggV1ksWs/SlpVE1qkle9395kKTiZ9g2CaVgZibj56AMql4JGm7qpFq9FiDhBufMkvq6fW89Kqevr3y9pSI/L8a6a+SI4AMW3yzi7HbgnPYqQlsIUiM5cfpZWVfUz9f/PutqMb/xusdl4oXcWIcBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySrMpPhv0Dk5n9MRQGbseYVRe8Pg1k+MKU8/oBUlh7Y=;
 b=Ske1d1wUdnQ6JFR8S/3K0xiQyVLe5V5n43oilcU2vLAtugNH6BeyiDFmXIr9J6MXaQpF8ydx95Yc8MHt/CH3IUr2/VuHssBAcptcmz89ar2H5ed3OJMHuSEa0xn4Hvdl7ZfOH8IMeMwSQogCLYtjwM9eiRScYlBhOB1KXFdwhmjIEEjSnfQxYlH69fCgw/6w9Ezudm2RCy9REVcQXj7a0F6cBQeTPD+B4tgPZ3kmLGSxWuXGAYpY4XwYOSo54S5BitusMz4CiYAGFlU2S0YIFwmp9gc1/Yx6PdUugaD01auIu7eI+Z/Ivi0+z8L/WfIchJeFafBkQborIieFwa3rog==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 05:46:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 05:46:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] macintosh/ams: linux/platform_device.h is needed
Thread-Topic: [PATCH] macintosh/ams: linux/platform_device.h is needed
Thread-Index: AQHZ2sx72iN7hwqmvkuPM7B3pPDVs7ACVOkA
Date: Wed, 30 Aug 2023 05:46:00 +0000
Message-ID: <bc38dfbb-3f59-103f-598c-eac605b3249d@csgroup.eu>
References: <20230829225837.15520-1-rdunlap@infradead.org>
In-Reply-To: <20230829225837.15520-1-rdunlap@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3180:EE_
x-ms-office365-filtering-correlation-id: 6489fd21-2595-4bc1-d998-08dba91c6409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZmIvU6kz6scbGrMixFDbw8qWFG9uQtYF6L3gAr22eqqIhBzQDQKl8qd0C9MG0+5rQ8GwDYubIGtoNLJClThTtaQY7/uBznDVUe4wp7N2Pd90G4wNBJgz3i91H8ynDIJJGmfmtH8jXDMxRsTHOHsL0sJMiwLFCbhvkKInyiTTOoiF7Jt6QAawNHalygEcNoE4e231ZgwJyG2h39lxyAeDXfEyZqhPvY/A01arm3M5GNlpiHHcZTUgutSaDNl+iJ3npqTHLZ5dZtkb+1EXhWo1wy3KuHIRbxteSpQDkZgZgMb7mQnIXY0nwnoNRTp7GC8OdT4469O1VE6Ak8vTzEoXAMNKl7T2bNp8n9PvuAHMRdMM+TnBIZWrxEgxPjbdi0Jdb61RlQ6rVY87rIZAfZmW9Wa22/Qx31b3ro81jZz+37+Onijl9wdqQvLSIe+IZ9G/CQaM+olYoL/IFhR3SVhsgTX8Vb4vLdr4iX8cjfdJfmchD66HOuwwCN7uiEiNyXbAAXd0HfgjdZ4eQ8jTP1o6WbqNpRr/3WYxK79r60sitcmPdSABLNQRu3Weub9jVn0vCFVhKePpsn2n8050d8500MVf/zPAdpg7aAOX6beiJkwWLdRKPz/Cg6tqZ347xXyJuw/peSYi99dtmQeTfbpoOA5vaHFeW4iLlmMNHvpv9KJ3T09h3gF5ioKMjzOXJwg5
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39850400004)(136003)(376002)(451199024)(186009)(1800799009)(26005)(31686004)(44832011)(6512007)(6506007)(6486002)(5660300002)(71200400001)(38070700005)(38100700002)(8936002)(4326008)(8676002)(122000001)(478600001)(31696002)(86362001)(2616005)(91956017)(66946007)(76116006)(110136005)(54906003)(66446008)(64756008)(2906002)(316002)(66476007)(66556008)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWQ5VTArNWZQUW5xMm1qMEphM01hUEhrc1RpSWY3MlRDekFQS3ZJUklSNU53?=
 =?utf-8?B?eDdwcjlFMU13aGxBUGJCSzIxVWo5Ym5FYXdqTXpZdWtBMUNqaEw1d2Y5Uk1H?=
 =?utf-8?B?c010OTBpSlV0dFRBQUMraDFYVXNSVG9yNTdUaW41Mkp1b2tzYnYzTVZVOXpL?=
 =?utf-8?B?SVFpVXVKYVhzbXQ0eHV6dUpONUVReWZjNGRFcDRqUDZwZFJ4aTJ5VytUOVdI?=
 =?utf-8?B?UEc0SVZRTkJCdVZERG1xQVlYT1BFbVJCaldvcXdRREV5dDViQnQ1d3haODdF?=
 =?utf-8?B?bE96REpiWEpNK1puYnZKNGdzT3lRY2I4MVJoNTFZVkc5SjJaYTB5NW10WVZT?=
 =?utf-8?B?akZOOHlJa3RUQlFXZ3o0VWsvckZSK0drS3lYODlhN1h6N3c5R090QXBXZXVp?=
 =?utf-8?B?ZFc4ZEJmUUhsNmpyT0U5bWRud2FORUttWFNuOVdBVzZHSStPbkFReFcxOCtw?=
 =?utf-8?B?NEtQampWTC9vZ0lzaS9pTjNjTCtDdEdEcHh1YjdicUowVXNOeVJZNXZhR2hU?=
 =?utf-8?B?aGJKRnlsQkZWbjZwSG5ObVloemg5Yk9PbWp2emVHNC9INklIWlh0bFJsSjhE?=
 =?utf-8?B?aXVzdEhZOFFhUmxQUnczU3dOaHZUcjFBcWcyTFZlcWpKNUlqVFl0OGRWRlo5?=
 =?utf-8?B?WnJZRkdCRlVDQ2lON2Zab2FVUGNGb3dKUnZSMmN2K3FBRzlWRk1aQm93c0U4?=
 =?utf-8?B?WDc0SWhJcDFma3pQNkR1MjB5S3lLYkhyWlp0ZGo5dWk0ckxQMHlnSmN0MTdJ?=
 =?utf-8?B?bVkyOGYvMm9XeFQ3a0pkSXV1YjYzbWtQMTJUaWEvcVlYR01JNVd6NU91Nzgx?=
 =?utf-8?B?UXlXY1BFWGNKY3lVMWNyRFVrTEV1SzlmbVVFay9ueVczeXFaNE04U3E4cHJ5?=
 =?utf-8?B?b3VkOXBpc3JJZjlVUG13MHpYNzFqWVUwNDZJWnJXeG02azUveHB1L1Y0UjBo?=
 =?utf-8?B?N1FoSk1UVnQzdFZLUzIwZ0VabFp2aE5XeGp6SXF0UU1RZVJ0Qzlsd3dKOGdP?=
 =?utf-8?B?bng3NnhwSlRtOEtVSHRBMkpTMk8zQ3pEanZTZGpwUEZucVQvemx2MU5wdm90?=
 =?utf-8?B?eUhGS1duN1pad1JCVXlkZHlmVEV5STFKOGI5V3l3ZXkvNXRmSTNWNVp5Q2gv?=
 =?utf-8?B?dHhiRk5XbFZaaFFXSUhQMU1EQW9LVDhtV3k5bGN3SW43YXAxZnFyYWYzSUU3?=
 =?utf-8?B?SmkzVENYM3NIeHV0NEVidVBkVzNXREx1RzhvRVl0d08weHpKdlJUVTZYTDV1?=
 =?utf-8?B?NXlzV2VwaVhKTW9CZ0R0YSt5QU8vTFZDdklVeDlMWWY3bmVWMlBBeVhvTWRv?=
 =?utf-8?B?bkpoQXNRV1Vxc3U5RXdCZWFNOWJEUzYwak1ieTZUTjlOdjNJenNvbVdJcjJD?=
 =?utf-8?B?L3dBd3RrQ2drbE9ydjgyRkZ5MlVwK3lPUFQxb0szSVlqb1RYV2dpMTlKbTRZ?=
 =?utf-8?B?SXNEalNMeWVUMlM2UWszaVVVRmZMRk10WWVLUkdQcWhNbzBGcWZJRDM0QVg5?=
 =?utf-8?B?aDdzUXV3N1h6bDhQaXplYnBSSUkyc0NnOHBSdWhEeDBYMk5JTzNPOFFWRDh3?=
 =?utf-8?B?RUNINWdHcGMxV09sRTVjd3VZRFBWemtTSzJRdkVsOVBpNVhFaUNjWUVOS2Fq?=
 =?utf-8?B?b2xuaTZVcXU3WXd4eVIwdGdkVlA1SVdlem9xME5QaTR1bm9nSnp6YWgyV3RC?=
 =?utf-8?B?dlRTOWVXaDRKTFArNzdid2ZMK3A1TUZBaCt6K0JJdzV4U0EvbzhLUkVpUjA2?=
 =?utf-8?B?blQxSy90d3RaMmZKT0pkL1ZZaW9OcUhwRFhDQzgwdWdjTGo4VDVZUWpQQnB1?=
 =?utf-8?B?ZnozWDdVSWtQS2pVem5LbkdMZklVc1BvQjQ4SWtDSDRpanVuc2hUL1dKZVQ1?=
 =?utf-8?B?Vy82M1RiNjNSN2cveUVUd3hjZU5XMGFZVmltRDRWRzBNYnFPZ3VXTEFIYUoy?=
 =?utf-8?B?UEtJQks4SXUzY2NvaHg4U3o5L3BUVFpPZnVWb1FhK0hHNWlSTWdSaUh6QzAy?=
 =?utf-8?B?bmRyOXhZRFBST0RxQk1RV2l5RXdtVjdudk03YUtQWHpya3MzNHJ2SVprNU4v?=
 =?utf-8?B?MEhsNitNS3dYbXRwd2p4V2NIYUxwWG1kcnNSeVlJWHpRbEIvZ0oxUEhUUkxo?=
 =?utf-8?Q?wJf+vHaCAa34ia0G6CqRNMWgT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F15EA62AED5084096A210C5A753AA45@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6489fd21-2595-4bc1-d998-08dba91c6409
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 05:46:00.5310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YaMtss3DQKcPEjv0oczDXa9+cF5NW4bW6kdu9kLxODSiZdaPAYLprPLbfwCHD0H/V1bv3vXAoh4PBGhBJ1Ts6hIOnb8ntWvYg8zq1HjJ+tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3180
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
Cc: Rob Herring <robh@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzA4LzIwMjMgw6AgMDA6NTgsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBh
bXMuaCB1c2VzIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UsIHNvIHRoZSBoZWFkZXIgc2hvdWxkIGJl
IHVzZWQNCj4gdG8gcHJldmVudCBidWlsZCBlcnJvcnM6DQo+IA0KPiBkcml2ZXJzL21hY2ludG9z
aC9hbXMvYW1zLWlucHV0LmM6IEluIGZ1bmN0aW9uICdhbXNfaW5wdXRfZW5hYmxlJzoNCj4gZHJp
dmVycy9tYWNpbnRvc2gvYW1zL2Ftcy1pbnB1dC5jOjY4OjQ1OiBlcnJvcjogaW52YWxpZCB1c2Ug
b2YgdW5kZWZpbmVkIHR5cGUgJ3N0cnVjdCBwbGF0Zm9ybV9kZXZpY2UnDQo+ICAgICA2OCB8ICAg
ICAgICAgaW5wdXQtPmRldi5wYXJlbnQgPSAmYW1zX2luZm8ub2ZfZGV2LT5kZXY7DQo+IGRyaXZl
cnMvbWFjaW50b3NoL2Ftcy9hbXMtaW5wdXQuYzogSW4gZnVuY3Rpb24gJ2Ftc19pbnB1dF9pbml0
JzoNCj4gZHJpdmVycy9tYWNpbnRvc2gvYW1zL2Ftcy1pbnB1dC5jOjE0Njo1MTogZXJyb3I6IGlu
dmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlICdzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlJw0KPiAg
ICAxNDYgfCAgICAgICAgIHJldHVybiBkZXZpY2VfY3JlYXRlX2ZpbGUoJmFtc19pbmZvLm9mX2Rl
di0+ZGV2LCAmZGV2X2F0dHJfam95c3RpY2spOw0KPiBkcml2ZXJzL21hY2ludG9zaC9hbXMvYW1z
LWlucHV0LmM6IEluIGZ1bmN0aW9uICdhbXNfaW5wdXRfZXhpdCc6DQo+IGRyaXZlcnMvbWFjaW50
b3NoL2Ftcy9hbXMtaW5wdXQuYzoxNTE6NDQ6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmlu
ZWQgdHlwZSAnc3RydWN0IHBsYXRmb3JtX2RldmljZScNCj4gICAgMTUxIHwgICAgICAgICBkZXZp
Y2VfcmVtb3ZlX2ZpbGUoJmFtc19pbmZvLm9mX2Rldi0+ZGV2LCAmZGV2X2F0dHJfam95c3RpY2sp
Ow0KPiBkcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWlucHV0LmM6IEluIGZ1bmN0aW9uICdhbXNf
aW5wdXRfaW5pdCc6DQo+IGRyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtaW5wdXQuYzoxNDc6MTog
ZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQgZnVuY3Rpb24gWy1XZXJyb3I9
cmV0dXJuLXR5cGVdDQo+ICAgIDE0NyB8IH0NCj4gDQo+IEZpeGVzOiAyMzNkNjg3ZDFiNzggKCJt
YWNpbnRvc2g6IEV4cGxpY2l0bHkgaW5jbHVkZSBjb3JyZWN0IERUIGluY2x1ZGVzIikNCj4gU2ln
bmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IENjOiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96
bGFicy5vcmcNCj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9tYWNpbnRvc2gvYW1zL2Ftcy5oIHwgICAgMSArDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tIGEvZHJpdmVycy9tYWNpbnRv
c2gvYW1zL2Ftcy5oIGIvZHJpdmVycy9tYWNpbnRvc2gvYW1zL2Ftcy5oDQo+IC0tLSBhL2RyaXZl
cnMvbWFjaW50b3NoL2Ftcy9hbXMuaA0KPiArKysgYi9kcml2ZXJzL21hY2ludG9zaC9hbXMvYW1z
LmgNCj4gQEAgLTYsNiArNiw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2lucHV0Lmg+DQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCg0KWW91IG1vZGlmeSBhbXMu
aCB0byBmaXggYSBwcm9ibGVtIGluIGFtcy1pbnB1dC5jDQpJcyB0aGF0IGNvcnJlY3QgPw0KDQpT
aG91bGRuJ3QgdGhlIGluY2x1ZGUgYmUgaW4gYW1zLWlucHV0LmMgaW5zdGVhZCA/DQoNCj4gICAj
aW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4NCj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4N
Cj4gICANCg0KQ2hyaXN0b3BoZQ0K
