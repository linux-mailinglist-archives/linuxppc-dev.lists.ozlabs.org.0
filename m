Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED65677E26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 15:33:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0szf6Lbfz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 01:33:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=io4GuSuo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.79; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=io4GuSuo;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2079.outbound.protection.outlook.com [40.107.9.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0syg2V7Pz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 01:32:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpg0vABjfuoBVYS8hlq2ql1VEFDuIm2IautCUxpi03wFkC+uXcSH2UgQW4iauc2Oj/huQ9JoGdpRQVyM68aI0zyh0HbtaAy/cpi1NzVkUyn4iB0IQQt9EziDUjbc029HtdJvqCszKa0hNe2+0APp7O4bZGZrYz81zNuwB7PbOVBiiJm8053RVbhN3ew2z20b85mskr5tH9kX32Gbb81DWFimpxI0L3Qd1hzlMSedKeSSnY0MrXD6IfLRe0hp1VAiCIWNhxV482EK18MhgI5MAUdb+2k7vZTv+BXb0Yr0d4SuT02sDu2MscBC/L8sASFE0N68fVxGL3vg9lqhDF9Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpR8yLLURnswEx6H92ndYDtRfzj4YPxrD3XpS0O3MZQ=;
 b=SL43/brU32hBs5cEkfbs9fJIDwIV6FUX1Ryhaek/DPMJe+fx8D9L4ShhY9JIkGx6fpZw+urWaB86JZ++HEx0MeuFQyDXl7auC7JDiBMHn6NSlwYtjE92DI3Y1Bhsbpk2VDxW48kxEC2AuO55KNl6IwJcy0xYxG0GEsHT0QkNpLTvSemzJuk/8X92YVDT0QxOGIaY06iGTaYQiUZ9ICdbCGs7yZld7xDtX4WUI1vWn0+Mjxw8iOdjQi63Kbvee3ySuKuEbMSuTKkiV+6YV0DEPzcZzt1ywfozSXWGvhauRje1w/8BAtOseQcpeWWMHBetj/E+UlIN3DmFXiqNOGKtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpR8yLLURnswEx6H92ndYDtRfzj4YPxrD3XpS0O3MZQ=;
 b=io4GuSuoy60ET162oM3inghou2WNFzF+1G105lcT4n4Giea+K1uvMC33pQ6EdECASLYywiI2neCnPvXDTQZaW2HFTtGjxSrPy31uEqZqSNewPA/nPwL2RMoqH3o5EOcoGcYk7y7pyaqiAiIdh+LaU8SbfqaTRlmBE46vJjRlm8mCkGDir6+vVVcmRFJw0Pn447M/78azk/X2V/u7LxXRYmCaKjSTtSBl2wDJaJUugU8gelRHDJObgt7t55yKbToTzFH0Yu/kK/zQsikDn3TcpMgAXH8Vqa3puvSj4AAdUvYKHrgCpnjXUJ6lk6flwXgy8X9zYVIcLSE8KwamQifoBA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1898.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 23 Jan
 2023 14:32:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:32:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood
	<oss@buserror.net>, Sinan Akman <sinan@writeme.com>, Martin Kennedy
	<hurricos@gmail.com>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index: AQHZF9ztPi//ZqICU0+kVOYLIruL1K6qdjuAgAHJHgA=
Date: Mon, 23 Jan 2023 14:32:36 +0000
Message-ID: <22db0b5a-1b7f-a94b-1092-a314d57dedf5@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20230122111631.dgw5uwtfjsqack57@pali>
In-Reply-To: <20230122111631.dgw5uwtfjsqack57@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1898:EE_
x-ms-office365-filtering-correlation-id: 16343168-b248-480b-a709-08dafd4eac5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  deNvl/9jKVq0q88ay6TQc7qTqFy2EqGCMp1pRb+C/fXhoD+eSEC8xW7SI5sdHVYqxcfT5TKEDNJrQDuTYhdD0st/kOpzUHQWPEroKm6ooT2Vt4ClGE9QAYqDncA6Zg6d7QqylZJV/37stfBPMIAAwDykhfmeQGHEFNjruaxasz2SyFAs20BzbQyscqRFKWle3gvu1QJfP/hXH3NB1UEbN1ZYmo7/AwNycExggrqlNx72DhI6ADa8B7iL3IcJVOqJU1aRDPAuKbKYXA19A3oEk76Jt2gy/ktgfVE+6kRo0hFD6EFVAJldtnYlDcLHMxCxOkefXDKpr0lF2XDs8BaCYvrQl4ujZpifnETY4w5Cbul7rfuCdQ8an2OxyaFjKcZkFteSLzTVjeSuIzdYmt3xeNuvOpWbEdWqp/un4FcmQY0tsBrwgrVfj55D23qDDfDzoAfD8WCD9v3ivhnwM8cu/KVhQqJ/AldZRf9SoJ6v5SaDPi1/K7YSx+hw76Zpi8i/raQBN5ZfDcbhuTBEd/OugADiFk2kyMbba7LB1aqxnPPHfzAbcCNRElNQ6kvPvd/ortIIBc0qy6fz9knpyccb6BKvt3Va6d30PX6QVYMPpxQEcMY+WlHzcBKA1GF931gzjpciegPCa72ts6wR8TmOCz//y1dM7vbcN8PosmLthHGR19PgV6f3wnIo622kNAVK2TpVzC4+WuLHkd/DxJFdu4aNFipdTUKHG4zWtWB8GKo+jDO7OJS1UQASYmPAngRr1XGepj07SrLNPvtw50e9PAdNGS/J0JghVe2Srajv4TM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(26005)(186003)(478600001)(6512007)(2616005)(38070700005)(36756003)(6486002)(966005)(6506007)(38100700002)(122000001)(31696002)(86362001)(83380400001)(5660300002)(41300700001)(8936002)(2906002)(31686004)(44832011)(316002)(110136005)(71200400001)(64756008)(66556008)(66446008)(8676002)(66476007)(4326008)(91956017)(54906003)(76116006)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2pxdFFEcXFvWXNFY2lJVlNJenNDc3ZBeFFBS0xKZ3gvQWZRSkVOZG5tNVZo?=
 =?utf-8?B?OUNjWW1NUXdYanBmdlZGeXZkcWkxT0FUMVJDLzdjd2lLSlJMTnFtOVZEVUE1?=
 =?utf-8?B?TTdKZVdnQlMwMDNhMkJDM2pGK0Zqa09haHNKUGlXMXdkR2k3dzZMckpML2pN?=
 =?utf-8?B?ZVo3WWttamhxNkVGeDZRY3poaE1EaWxaWHhmcDJCV29maUpuUlk5NHprc09D?=
 =?utf-8?B?eEwxckI1SHpxUy9CZ3BRS3hkb25XRExSTWxzakVmaUcxcGd5YVR5L0JZcjFz?=
 =?utf-8?B?QXpRNmV6Y0FIdkQzZzhJZDU5Ukh1WmRDS3pud1BGL050ZnFxb3hyME9xeFZB?=
 =?utf-8?B?bFhvUTFhazVMbTd6RkhzMmgyZ2QrN1hycnl1a1NlUi9Qay9nanU5VFUrQ2Rj?=
 =?utf-8?B?NnVtT0o1N05qWmt1cXc3SHUvOFFDcXlnemdHcGFkdCtnYlZsVlRwam0zNnRn?=
 =?utf-8?B?bE9nUDBmZzBELzlOTlh6bkVFb3dTeWtEeWpQY1JHYlU4UHRxbUpjRzBRWjYy?=
 =?utf-8?B?aDZIRGo4TUpjT0lkZERpS3gxWFkyaG44L3ZENFNMSytKeHQzVVhjTmJOQ1Nr?=
 =?utf-8?B?dU9aRFR6Q0lUMGtLb2FKZnNiQzN4VDhiZ1VQV2pYMWJGOTNKWkZubVY1S05y?=
 =?utf-8?B?cGRCSDErQnBFSWRFQUNFWEFYcEdIM09QNWxNcHMxdXJKYjE0WUJhUUppWEtG?=
 =?utf-8?B?cE1ES1RpY0VXRmFaNUhWZllhc2x6dWkvbVZUWmFHbzhUdWJpOXQxMEJMNEN5?=
 =?utf-8?B?NEx0dmRUZGVCbDNXTkZodEZPQVZ5YzJzcWxTOG5kVHM4QU53TUt0dTE4czhs?=
 =?utf-8?B?WUh1ODRXeFljQ0RZWk9hLzViUVZtRjh2cW5wZytTVWRzQVhFZ2NhdzBXK1lv?=
 =?utf-8?B?cFpIbVEzdE5KMkhrdWpYNUtJYmtBdDZYUGtsaHNlMnVJOWRTbzh3cVp3UDFz?=
 =?utf-8?B?ZFNxNHd0a1BuYkVrMXVzQSswVytrRUtxdlN3b2JvdjdNVWlvTGIzNHlyVk1R?=
 =?utf-8?B?VEVaZWpYWHFXVmZxTk5lZmVKUW55SWlUYStBYit5c1EvZ0RNK1hCNTV6MFNH?=
 =?utf-8?B?d2huM2h0dDhVSitEMy9EVzl0R3g0a3NpTm1OWFBTblEzQ1piTnlzc0FRb3Zn?=
 =?utf-8?B?eVVSbXBMc0ZJUnFyTTBuSTUwV3p4dUYxNndHSEc2TW1yTkhLa1AvaWNKZlhD?=
 =?utf-8?B?bUZRNlhRdWEyT3Y0VzR2VUhGaHd3WnJqbms5WHVZcWNmaEJwWDBCOXlWVytE?=
 =?utf-8?B?TmxRY0V4RjlHRlVPYkVOMmNmSGdxeDZld2dCZjkrejRrTHl0eGF6akM2U1px?=
 =?utf-8?B?anFuZnZ6dUZFTkJHSHJrem5GNDNyTDE4cjVJOVBZa2hIOUdWS0RGcEF1YUpE?=
 =?utf-8?B?YWhrRENRcHR6bmdNejc3QXA4VktWSmI3YUJvUm1BTU5oeFQ5cWhHOUpwT2Zv?=
 =?utf-8?B?T3ZZS1F4eWd0bXUybUExQ1Z4QXo1UUdHT09OU1d6L2oxK0x2NXZKblpnMzdX?=
 =?utf-8?B?OVlHdm5zY3hyRm5jN3B0SDh3Yy9VcEtqMUZiVUlaV1lheXVUZUlUKzI5Zzdn?=
 =?utf-8?B?T2xzMjIxQWNBZVQ5YlhXdUw1emtWcnRCOWZNZnFyWmNPR2VudUpQRWZSdTJ2?=
 =?utf-8?B?VENKNWNrbDE5aTZWV0hQa2ZETVR5Z0hKU2l3Tmt6cmtQNHhmQnlUZDJsTHNV?=
 =?utf-8?B?V0tuaWNqRFpaZHkvVTlrM0xzVmtJR3loVTFmTlk1aC9YMFlHaGxRRTVFeEF5?=
 =?utf-8?B?VWI4NUE1QTBOS2pSNDV2cFB4d00yVVB4WndCUEF0RExnSTRaVFk2ckx0MGNq?=
 =?utf-8?B?aFdjdHJXOWJmNTBYSTh2QUE3Qk9xaDNmNVBYTlYvbEE5eVB0MVVtbzEwaDZ4?=
 =?utf-8?B?MWtHa0wvZU04N0RSdU5RSklBd0xFdUZMRDk0V1NOanZNa1VQQXN0KzBIeHkw?=
 =?utf-8?B?QzVwakxHMEJQT09sNjVzYW00RTBGVDZISnp5ZnFUSDZpNWJhYnBpTFM1b1Ru?=
 =?utf-8?B?cHh0WEdUWnNWUlNwYXYra1RUZmNxb05SQ0pQbmEvMVhabmE0d2hDb3dRWnlr?=
 =?utf-8?B?YWpkQzFyMlVLVTNwTlo1V1VmRURId0xnTjQ5MVg4UFFNWWJPUzMyR1REWXht?=
 =?utf-8?B?Y3F4QzFMMWtkbldsazk3ZkhkNWlEVzhYQlpqZi92alVSa2h6bGhYT1BoUXZS?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A5555EC55F499498959281D17AA212A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16343168-b248-480b-a709-08dafd4eac5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 14:32:36.6817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ElGTKyw+luE6vs8mG+wrxf5F1nZjnI8nUT6K+mHqnu66yHYkGCjeBwksIE13kEzKnRtWsEBuGMHP66ZNcdoQg8nQXb4q0REuJ6GZT0+RTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1898
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

DQoNCkxlIDIyLzAxLzIwMjMgw6AgMTI6MTYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IEhl
bGxvISBEbyB5b3UgaGF2ZSBhbnkgY29tbWVudHMgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzPw0KDQoN
CkkgdGhpbmsgcGF0Y2hlcyAxIGFuZCAyIGNvdWxkIGJlIGEgc2luZ2xlIHBhdGNoLg0KDQpJJ20g
aGF2aW5nIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIGhvdyB0aGluZ3MgYXJlIGJ1aWx0LiBQYXRj
aCAzIA0KaW50cm9kdWNlcyAyNzMgbGluZXMgb2YgbmV3IGNvZGUgaW4gYSBmaWxlIG5hbWVkIHAy
MDIwLmMgd2hpbGUgb25seSANCnJlbW92aW5nIDIzIGxpbmVzIGFuZCA0NCBsaW5lcyBmcm9tIG1w
Yzg1eHhfe2RzL3JkYn0uYy4gVGhlbiBwYXRjaGVzIDQsIA0KNSBhbmQgNiBleGNsdXNpdmVseSBt
b2RpZnkgcDIwMjAuYyB3aGljaCB3YXMgYSBjb21wbGV0ZWx5IG5ldyBmaWxlIGFkZGVkIA0KYnkg
cGF0Y2ggMy4gV2h5IG5vdCBtYWtpbmcgaXQgY29ycmVjdCBmcm9tIHRoZSBiZWdpbm5pbmcsIHRo
YXQgaXMgbWVyZ2UgDQpwYXRjaGVzIDQsIDUgYW5kIDYgaW4gcGF0Y2ggMyA/DQoNCk9yIG1heWJl
IHAyMDIwLmMgaXMgbm90IHJlYWxseSBuZXcgYnV0IGlzIGEgY29weSBvZiBzb21lIHByZXZpb3Vz
bHkgDQpleGlzdGluZyBjb2RlID8gSW4gdGhhdCBjYXNlIGl0IHdvdWxkIGJlIGJldHRlciB0byBt
YWtlIGl0IGV4cGxpY2l0LCBmb3IgDQpoaXN0b3J5Lg0KDQoNCkNocmlzdG9waGUNCg0KDQo+IA0K
PiBPbiBTYXR1cmRheSAyNCBEZWNlbWJlciAyMDIyIDIyOjE0OjE3IFBhbGkgUm9ow6FyIHdyb3Rl
Og0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgdW5pZmllcyBhbGwgUDIwMjAgYm9hcmRzIGFuZCBtYWNo
aW5lIGRlc2NyaXB0aW9ucyBpbnRvDQo+PiBvbmUgZ2VuZXJpYyB1bmlmaWVkIFAyMDIwIG1hY2hp
bmUgZGVzY3JpcHRpb24uIFdpdGggdGhpcyBnZW5lcmljIG1hY2hpbmUNCj4+IGRlc2NyaXB0aW9u
LCBrZXJuZWwgY2FuIGJvb3Qgb24gYW55IFAyMDIwLWJhc2VkIGJvYXJkIHdpdGggY29ycmVjdCBE
VFMNCj4+IGZpbGUuDQo+Pg0KPj4gVGVzdGVkIG9uIENaLk5JQyBUdXJyaXMgMS4xIGJvYXJkIHdp
dGggaGFzIEZyZWVzY2FsZSBQMjAyMCBwcm9jZXNzb3IuDQo+PiBLZXJuZWwgZHVyaW5nIGJvb3Rp
bmcgY29ycmVjdGx5IGRldGVjdHMgUDIwMjAgYW5kIHByaW50czoNCj4+IFsgICAgMC4wMDAwMDBd
IFVzaW5nIEZyZWVzY2FsZSBQMjAyMCBtYWNoaW5lIGRlc2NyaXB0aW9uDQo+Pg0KPj4gQ2hhbmdl
cyBpbiB2MjoNCj4+ICogQWRkZWQgcGF0Y2ggInAyMDIwOiBNb3ZlIGk4MjU5IGNvZGUgaW50byBv
d24gZnVuY3Rpb24iIChzZXBhcmF0ZWQgZnJvbSB0aGUgbmV4dCBvbmUpDQo+PiAqIFJlbmFtZWQg
Q09ORklHX1AyMDIwIHRvIENPTkZJR19QUENfUDIwMjANCj4+ICogRml4ZWQgZGVzY3JpcHRpb25z
DQo+Pg0KPj4gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2
LzIwMjIwODE5MTkxNTU3LjI4MTE2LTEtcGFsaUBrZXJuZWwub3JnLw0KPj4NCj4+IFBhbGkgUm9o
w6FyICg4KToNCj4+ICAgIHBvd2VycGMvODV4eDogTWFyayBtcGM4NXh4X3JkYl9waWNfaW5pdCgp
IGFzIHN0YXRpYw0KPj4gICAgcG93ZXJwYy84NXh4OiBNYXJrIG1wYzg1eHhfZHNfcGljX2luaXQo
KSBhcyBzdGF0aWMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIwMjA6IE1vdmUgYWxsIFAyMDIwIG1h
Y2hpbmUgZGVzY3JpcHRpb25zIHRvIHAyMDIwLmMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIwMjA6
IE1vdmUgaTgyNTkgY29kZSBpbnRvIG93biBmdW5jdGlvbg0KPj4gICAgcG93ZXJwYy84NXh4OiBw
MjAyMDogVW5pZnkgLnNldHVwX2FyY2ggYW5kIC5pbml0X0lSUSBjYWxsYmFja3MNCj4+ICAgIHBv
d2VycGMvODV4eDogcDIwMjA6IERlZmluZSBqdXN0IG9uZSBtYWNoaW5lIGRlc2NyaXB0aW9uDQo+
PiAgICBwb3dlcnBjLzg1eHg6IHAyMDIwOiBFbmFibGUgYm9hcmRzIGJ5IG5ldyBjb25maWcgb3B0
aW9uDQo+PiAgICAgIENPTkZJR19QUENfUDIwMjANCj4+ICAgIHBvd2VycGM6IGR0czogdHVycmlz
MXguZHRzOiBSZW1vdmUgImZzbCxQMjAyMFJEQi1QQyIgY29tcGF0aWJsZSBzdHJpbmcNCj4+DQo+
PiAgIGFyY2gvcG93ZXJwYy9ib290L2R0cy90dXJyaXMxeC5kdHMgICAgICAgIHwgICAyICstDQo+
PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9LY29uZmlnICAgICAgIHwgIDIyICsrLQ0K
Pj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvTWFrZWZpbGUgICAgICB8ICAgMSArDQo+
PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmMgIHwgIDI1ICstLQ0K
Pj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvbXBjODV4eF9yZGIuYyB8ICA0NiArLS0t
LS0NCj4+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMgICAgICAgfCAxOTMg
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDIxNSBpbnNlcnRp
b25zKCspLCA3NCBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvODV4eC9wMjAyMC5jDQo+Pg0KPj4gLS0gDQo+PiAyLjIwLjENCj4+DQo=
