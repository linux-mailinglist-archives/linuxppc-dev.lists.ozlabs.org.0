Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C514791BDA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 19:04:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FA4tEN3Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfZkQ0LT1z3cBC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 03:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FA4tEN3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfZjS3GnRz2yq0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 03:03:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl18LUyt9eVwBtSuuwYxQ55UVfCbRprOe/HzJ4Ymtq7EFfSvYkIkhpFZpRJJNK+KKBOP5DYCAZrntvECudy0ycdocqUroGufDKRdofsgmYk8QLZkGFNrqBBiuSEaIs63g1HkVYmewWDO/UBU3lQjVJqX9/UTNz0/iBcpIeeywVcHcl4u09zNQPyleTCQidXPdHssBAVqc5aoW4BPwb82G8RT1zCD+gHOi5mxpiAJAUVUVF3HuvLzthRD9NWzXiogPXwAdJiasXNCbqMj3zfJoW0rsG5w9zY/dVI+m0lBavo1nIvsE2y1Extg9e+rJx2Tu+BF2IFUm/TEYbMIKxJSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpytV98U3ycdlJ7jwiHue5sKK7Jza/NKYp8GQzFznYk=;
 b=KsjSK6rYcJ3XKpn5P3gIB/31MRolYyEUrcbxhiRdAontqur0awtKzae9rSB/82z2tcG5BZdabeT7lszmsJPIFuCbwiM8OtKjCfOTHfEqc5ETKC7l8aI57XKdh2R4sUseGgmBY66wiLiLEV20CA88VBOcZWHlBLyeBIKKMJb4oVlDa3d5QoicJqO92+zzhOCKQxYzFtLoqaI9nkODFxIp9s7gkcZbSaZWiwxpHz+rtlzjRfFbLngMaJloydOvXhompD1p2wGrB+don8WgktIwlSYcr7uHJ4CHAcm4nP02wt157pqFKSHDPypDn2ASwrRu3dgJXsfE/kA95Lu3UjH3PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpytV98U3ycdlJ7jwiHue5sKK7Jza/NKYp8GQzFznYk=;
 b=FA4tEN3YvzihU5Y3QpEQh0BhRMReFXulFcv8Kl3ZYcHgyHuXHSsy6maK+o2jJH/m3P7wUMQQ3cRhyjBzMKNsCmoz4cQCUmS9zfy6pDsPzEH5uWr94VwGWNwoYHDTwTmGktAoybMhVBjWBtO58nVrwS1xRpGi2q2o6bx6eGg4S06vTZf5qKz5voCqdAyWmHh21buugMHPzElAYsUzzRf0nlH5+FFng3rK15ZmFFHH3apYEvKKUP9Ot6pImRL0TOKPelG83UUg05wBpdrW6C0QMihwYQj4DMEwJQbCzJXtsd/TZxTzybVu/mRS0y70U0Zz00L1tFnDansEpVcGNatHYw==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB2153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.32; Mon, 4 Sep 2023 17:03:28 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 17:03:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
	<qiang.zhao@nxp.com>
Subject: Re: [PATCH v4] drivers/net: process the result of hdlc_open() and add
 call of hdlc_close() in uhdlc_close()
Thread-Topic: [PATCH v4] drivers/net: process the result of hdlc_open() and
 add call of hdlc_close() in uhdlc_close()
Thread-Index: AQHZ3yvYAaNB4gr4F0i/7Owg8NCYGrAK5RgA
Date: Mon, 4 Sep 2023 17:03:28 +0000
Message-ID: <1005f190-8c03-bb5d-214c-c7fca9dd876b@csgroup.eu>
References: <20230904123130.14099-1-adiupina@astralinux.ru>
In-Reply-To: <20230904123130.14099-1-adiupina@astralinux.ru>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR0P264MB2153:EE_
x-ms-office365-filtering-correlation-id: d380a4a3-3e98-4772-f9ee-08dbad68dc02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SeuN8N/GldeMmoZm1MbmDs6nC9wZQWN2suwP8M0vrZhxyac2N9KbHA95j9iVnp5yrkN6ie4wPHOURGpbAJXQEkYfGlZn33vq0c1oi+ytmy9ducymUUkNZhbv8TKtpqkO+nXTr8t6hYEQj/ACyyO6A7tkdJLHq3HT1fdHoJk2YYnm3HNnR7w2b8bG2c1aNaD1RjkfFdqz5rMaz9x22hFxg8BKYsMKQKgWouIJL+pGZ85nfFW4nYyu4h1HFiJigGIw3zQMtXm67GVvdBwZ8J46/OQ77smFyjO2wmuWkPs6v/f5rHhetGFFtaYbK7T1EBC9G65CFqnTEiOt1g+xmqgVHD6MokjTbtEP0BXfFJ8/QxTY2Xvb3kC2LCKXj0FCrh4p3qnlS7oXzeRviK3i8rRzd+H95B5jFaITi8n6DJQ4QcL9sOPQerh6jzULvPjE/LY9huf55KZJTXgwx3MiVBPVWZ6DaIBHJ2RdhTs9ZeDhPxejWKvqRmUl/0RWV/nEzz9lHd4DGp4eooEb4EbvKaQaFzqpL3mpkqOwOqGRP+EmR5axkfGyAF5X015uMSME1pTzX3SaVKk2IFypBeAkf0w8TNLe61jioZDAW5co+ROiMD/9nGi8sQP81NMvOtSzrPlItZ61vLYi280yL6rHy3YCm9zwav15J8bh9bb3vXSuZvxxaOcu08XUxlo0yL3D5fxn
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(6486002)(6506007)(41300700001)(6512007)(54906003)(7416002)(122000001)(2906002)(36756003)(31696002)(38100700002)(86362001)(316002)(38070700005)(110136005)(66476007)(478600001)(64756008)(66446008)(91956017)(66946007)(66556008)(76116006)(71200400001)(83380400001)(8676002)(4326008)(8936002)(66574015)(44832011)(26005)(31686004)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OXZ6alMvdzFtZlpvMFUzV0hPaHpSNXF5R2xIaEtDU3dTMmg2OFR0NHQzUlpr?=
 =?utf-8?B?Nk5jZkM5VHZPd3VXdFNlQnVBbzQ0YmZKeWN0UmRIZWVaSkE5R0RqYVdBdXFT?=
 =?utf-8?B?L08xK29Md3FTQ004bHE4aEw0b3QzQ1kzQlVqclBhOUZEUk01dWIxZ0JaMXZP?=
 =?utf-8?B?TGdMSTJFREVEbHgwYnVNKzlNTkZacGd2ZTZPN2draWVIYkRUSGRFSTY4NXIr?=
 =?utf-8?B?ek53amg4K1NjdXpGcXNYZ2FVOUtPTTNZbGkxZEd5MjRNQ01TZU0zTlhSNzdi?=
 =?utf-8?B?UzF0ZWdVM3IrZEtaVDlVcFh6WTJLbGdBREx5a1lqSGdOYk9SUnE5d3FuWlVC?=
 =?utf-8?B?SHlqcVRoRXpEQ2tXRXdlbFJpYUVkZmRJU2NoMmJTRW8xelNMVnBjK2NiV0xW?=
 =?utf-8?B?bGs2dnZtN2N2MDBFWnYxNDhIZmdVVmJncmliUUFoaVpQckdzWm04c3l4ME9y?=
 =?utf-8?B?aTFJYlQyVUpoUjNsNjVxa1dSWnNTWm96aU5iTnQ5STZxNUxMQTN4K2lpSWg3?=
 =?utf-8?B?dU9nbk56WVBQdXloc1A3UWlUTjc0ZklhK2cvdk1qKys1MWVsd2szYkVmcWRB?=
 =?utf-8?B?OTBtWmxKZ1hHUnI2akhCZHJQQys4RElaUmJ5YURtUFNjaE9BdkJRcU1FVFMw?=
 =?utf-8?B?YlIvUWJOcHFtcmxWcVJiTWs0cGJCRmN0QjVkNlkycWpYcmZXQUNGTXRBWjZr?=
 =?utf-8?B?NnlZYlVHUUp5K1BQKzB1YjBnRkdjdGZwM3pURE5LbjJkM3NpRzZhY1BNOUVV?=
 =?utf-8?B?SDlXRExmOXNqRy9oeFNFamFEZlVJOE9EWUcvZDVkSnc2YVNSSDVZK2JFUS80?=
 =?utf-8?B?UWNyaFcyUDRNdmI1M1JzMUkxaTRVcE5MUVU2Z29KNG84OStxT0RQaFNMZ1Nl?=
 =?utf-8?B?WnlUei9wT1p2N0tsV1RZejM3UmkrR3MxUVltNUlPdmYzYSs2ME1kWVhDYjFy?=
 =?utf-8?B?ODNoN3pQaUdoSUFQOGJKR2toaDVUWG85ajBNL2phRi9mV3BERnMwRmhKSk5w?=
 =?utf-8?B?ck5lT3RyUk5CU2ZXb2hwUjRlK1J6MjZxand4U1ZvTG1kS0ZmRGZuMm5Eclkr?=
 =?utf-8?B?L1JxOWcwTDF4RkFJRGF3SzBXSFBsKzllYjJxOG54SG4zOG9IdXlMVkxMa0xz?=
 =?utf-8?B?dkNZMk1DRDIxMEVXTWJvZGs4aTltZ1pWUkFPWldXQkdzV3FFc2hqSmhZamN0?=
 =?utf-8?B?VkYzaDZCQ3doS010eEVUNHVFRzdaUU9sSXFkNHlaR3ZjbThnVEh2ckZUaUdX?=
 =?utf-8?B?Vkw0Mjk1ZGI0eGptMy82MGxLQ2ZucWswa0hXVkc4WHg4aENxWHhXVk1MMXFr?=
 =?utf-8?B?cDJLS1V2emdkbFpIVzd4Q3M1T2hub05vNHZIQnA5Vyt1a3lWUUUvcFoyMnBv?=
 =?utf-8?B?N0dDUzVOejR4eW8rSm5qVUt1ZE1wc1REbldLSVpNMzR6WW4weUlZNFlkV1JP?=
 =?utf-8?B?azd3OTJZQ2xSWWdTMFhhTHlTUVVKaXgxTjRMR1VORkQ4WkZYUXFZNERGcXFu?=
 =?utf-8?B?U2pydGpNTHI2SE9IRUhMTTNPaGxhMFpoVTFaM3U3aEc3UnQ3TTJBaG5nSmd4?=
 =?utf-8?B?WXQ5SUhHMUdpcENUdjF5WDZQUy9kZ1R4WTdFMy9nMzN1MzJ6c0lBRWZHTE5U?=
 =?utf-8?B?QndJVWZhaVEyYWR4dm1FRmEwU3JSY0g4a2dSZjVaQTNLcVlZSnJwUExNamsy?=
 =?utf-8?B?emRQbmxsVUt3ZWtBWkFERDJTRm9HeEtsOU1raTl2RE5aZ2lRVzR6MnhyWEdy?=
 =?utf-8?B?Rit4Q3N3SW83ZERjWlpEcWpQQTQ1VC9TVG5URUZ6dG1RVzAzNENVS1pjTVNi?=
 =?utf-8?B?M0IvWWgwbzNEVUdvcG45bjNFNmVUOHNwMUlMWEVrZzVRSWNsQW9mVEl2aHpY?=
 =?utf-8?B?WGlUOWNuZm5nclhUbDJQdTNTYks4ek9NQjQ5YlkvMHh6dWV0R2VhTnlhNVly?=
 =?utf-8?B?SENFNUF6MzlYZ2VsNkhCOXN3SW95QlhidFFoUW54VjZrOUpHSyt0YVY2UHhk?=
 =?utf-8?B?dkJBRm1iUHBXYldmY3ZtVFBMUkM4NUFFV21TZE9rVWJGS0lndFpyelBxSEtj?=
 =?utf-8?B?WGdIREgwaHhtSlZGaEJCaW9TMVN5YndLTVd3d2JScmRtV0pEVHd6S1FvRWtV?=
 =?utf-8?Q?deYG2w2IvSYxp/VR0gH6tcwWo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A84EBA0641F2CA4C81BE968D731C8C6B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d380a4a3-3e98-4772-f9ee-08dbad68dc02
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 17:03:28.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDBg9yJWIz9g8n8EWPBzltb+S26e6DPYa3fJr8z0Y2gbZZrLaQm1i0cRBUG4L1P5osAtNez9YN6t4iU4Yx5L+4tuCECfHht7MuhgNF7yeFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2153
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA5LzIwMjMgw6AgMTQ6MzEsIEFsZXhhbmRyYSBEaXVwaW5hIGEgw6ljcml0wqA6
DQo+IFByb2Nlc3MgdGhlIHJlc3VsdCBvZiBoZGxjX29wZW4oKSBhbmQgY2FsbCB1aGRsY19jbG9z
ZSgpDQo+IGluIGNhc2Ugb2YgYW4gZXJyb3IuIEl0IGlzIG5lY2Vzc2FyeSB0byBwYXNzIHRoZSBl
cnJvcg0KPiBjb2RlIHVwIHRoZSBjb250cm9sIGZsb3csIHNpbWlsYXIgdG8gYSBwb3NzaWJsZQ0K
PiBlcnJvciBpbiByZXF1ZXN0X2lycSgpLg0KPiBBbHNvIGFkZCBhIGhkbGNfY2xvc2UoKSBjYWxs
IHRvIHRoZSB1aGRsY19jbG9zZSgpDQo+IGJlY2F1c2UgdGhlIGNvbW1lbnQgdG8gaGRsY19jbG9z
ZSgpIHNheXMgaXQgbXVzdCBiZSBjYWxsZWQNCj4gYnkgdGhlIGhhcmR3YXJlIGRyaXZlciB3aGVu
IHRoZSBIRExDIGRldmljZSBpcyBiZWluZyBjbG9zZWQNCj4gDQo+IEZvdW5kIGJ5IExpbnV4IFZl
cmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQo+IA0KPiBG
aXhlczogYzE5YjZkMjQ2YTM1ICgiZHJpdmVycy9uZXQ6IHN1cHBvcnQgaGRsYyBmdW5jdGlvbiBm
b3IgUUUtVUNDIikNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJhIERpdXBpbmEgPGFkaXVwaW5h
QGFzdHJhbGludXgucnU+DQo+IC0tLQ0KPiB2NDogdW5kbyBhbGwgdGhlIHRoaW5ncyBkb25lIHBy
aW9yIHRvIGhkbGNfb3BlbigpIGFzDQo+IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+
IHN1Z2dlc3RlZCwNCj4gYWRkIGhkbGNfY2xvc2UoKSBjYWxsIHRvIHRoZSB1aGRsY19jbG9zZSgp
IHRvIG1hdGNoIHRoZSBmdW5jdGlvbiBjb21tZW50LA0KPiBhZGQgdWhkbGNfY2xvc2UoKSBkZWNs
YXJhdGlvbiB0byB0aGUgdG9wIG9mIHRoZSBmaWxlIG5vdCB0byBwdXQgdGhlDQo+IHVoZGxjX2Ns
b3NlKCkgZnVuY3Rpb24gZGVmaW5pdGlvbiBiZWZvcmUgdWhkbGNfb3BlbigpDQo+IHYzOiBGaXgg
dGhlIGNvbW1pdHMgdHJlZQ0KPiB2MjogUmVtb3ZlIHRoZSAncmMnIHZhcmlhYmxlIChzdG9yZXMg
dGhlIHJldHVybiB2YWx1ZSBvZiB0aGUNCj4gaGRsY19vcGVuKCkpIGFzIENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gc3VnZ2VzdGVkDQo+ICAgZHJpdmVycy9u
ZXQvd2FuL2ZzbF91Y2NfaGRsYy5jIHwgOCArKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC93YW4vZnNsX3VjY19oZGxjLmMgYi9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMN
Cj4gaW5kZXggNDdjMmFkN2EzZTQyLi5mZDk5OWRhYmRkMzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYw0KPiArKysgYi9kcml2ZXJzL25ldC93YW4vZnNsX3Vj
Y19oZGxjLmMNCj4gQEAgLTM0LDYgKzM0LDggQEANCj4gICAjZGVmaW5lIFRETV9QUFBPSFRfU0xJ
Q19NQVhJTg0KPiAgICNkZWZpbmUgUlhfQkRfRVJST1JTIChSX0NEX1MgfCBSX09WX1MgfCBSX0NS
X1MgfCBSX0FCX1MgfCBSX05PX1MgfCBSX0xHX1MpDQo+ICAgDQo+ICtzdGF0aWMgaW50IHVoZGxj
X2Nsb3NlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpOw0KPiArDQo+ICAgc3RhdGljIHN0cnVjdCB1
Y2NfdGRtX2luZm8gdXRkbV9wcmltYXJ5X2luZm8gPSB7DQo+ICAgCS51Zl9pbmZvID0gew0KPiAg
IAkJLnRzYSA9IDAsDQo+IEBAIC03MzEsNyArNzMzLDkgQEAgc3RhdGljIGludCB1aGRsY19vcGVu
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpDQo+ICAgCQluYXBpX2VuYWJsZSgmcHJpdi0+bmFwaSk7
DQo+ICAgCQluZXRkZXZfcmVzZXRfcXVldWUoZGV2KTsNCj4gICAJCW5ldGlmX3N0YXJ0X3F1ZXVl
KGRldik7DQo+IC0JCWhkbGNfb3BlbihkZXYpOw0KPiArDQo+ICsJCWludCByYyA9IGhkbGNfb3Bl
bihkZXYpOw0KDQpEbyBub3QgbWl4IGRlY2xhcmF0aW9ucyBhbmQgY29kZS4gUGxlYXNlIHB1dCBh
bGwgZGVjbGFyYXRpb24gYXQgdGhlIHRvcCANCm9mIHRoZSBibG9jay4NCg0KPiArCQlyZXR1cm4g
cmMgPT0gMCA/IDAgOiAodWhkbGNfY2xvc2UoZGV2KSwgcmMpOw0KPiAgIAl9DQoNClRoYXQncyBu
b3QgZWFzeSB0byByZWFkLg0KDQpJIGtub3cgdGhhdCdzIG1vcmUgY2hhbmdlcywgYnV0IEknZCBw
cmVmZXIgc29tZXRoaW5nIGxpa2U6DQoNCnN0YXRpYyBpbnQgdWhkbGNfb3BlbihzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2KQ0Kew0KCXUzMiBjZWNyX3N1YmJsb2NrOw0KCWhkbGNfZGV2aWNlICpoZGxj
ID0gZGV2X3RvX2hkbGMoZGV2KTsNCglzdHJ1Y3QgdWNjX2hkbGNfcHJpdmF0ZSAqcHJpdiA9IGhk
bGMtPnByaXY7DQoJc3RydWN0IHVjY190ZG0gKnV0ZG0gPSBwcml2LT51dGRtOw0KCWludCByYzsN
Cg0KCWlmIChwcml2LT5oZGxjX2J1c3kgIT0gMSkNCgkJcmV0dXJuIDA7DQoNCglpZiAocmVxdWVz
dF9pcnEocHJpdi0+dXRfaW5mby0+dWZfaW5mby5pcnEsDQoJCQl1Y2NfaGRsY19pcnFfaGFuZGxl
ciwgMCwgImhkbGMiLCBwcml2KSkNCgkJcmV0dXJuIC1FTk9ERVY7DQoNCgljZWNyX3N1YmJsb2Nr
ID0gdWNjX2Zhc3RfZ2V0X3FlX2NyX3N1YmJsb2NrKA0KCQkJCXByaXYtPnV0X2luZm8tPnVmX2lu
Zm8udWNjX251bSk7DQoNCglxZV9pc3N1ZV9jbWQoUUVfSU5JVF9UWF9SWCwgY2Vjcl9zdWJibG9j
aywNCgkJICAgICBRRV9DUl9QUk9UT0NPTF9VTlNQRUNJRklFRCwgMCk7DQoNCgl1Y2NfZmFzdF9l
bmFibGUocHJpdi0+dWNjZiwgQ09NTV9ESVJfUlggfCBDT01NX0RJUl9UWCk7DQoNCgkvKiBFbmFi
bGUgdGhlIFRETSBwb3J0ICovDQoJaWYgKHByaXYtPnRzYSkNCgkJcWVfc2V0Yml0c184KCZ1dGRt
LT5zaV9yZWdzLT5zaWdsbXIxX2gsIDB4MSA8PCB1dGRtLT50ZG1fcG9ydCk7DQoNCglwcml2LT5o
ZGxjX2J1c3kgPSAxOw0KCW5ldGlmX2RldmljZV9hdHRhY2gocHJpdi0+bmRldik7DQoJbmFwaV9l
bmFibGUoJnByaXYtPm5hcGkpOw0KCW5ldGRldl9yZXNldF9xdWV1ZShkZXYpOw0KCW5ldGlmX3N0
YXJ0X3F1ZXVlKGRldik7DQoNCglyYyA9IGhkbGNfb3BlbihkZXYpOw0KCWlmIChyYykNCgkJdWhk
bGNfY2xvc2UoZGV2KTsNCg0KCXJldHVybiByYzsNCn0NCg0KDQoNCj4gICANCj4gICAJcmV0dXJu
IDA7DQo+IEBAIC04MjQsNiArODI4LDggQEAgc3RhdGljIGludCB1aGRsY19jbG9zZShzdHJ1Y3Qg
bmV0X2RldmljZSAqZGV2KQ0KPiAgIAluZXRkZXZfcmVzZXRfcXVldWUoZGV2KTsNCj4gICAJcHJp
di0+aGRsY19idXN5ID0gMDsNCj4gICANCj4gKwloZGxjX2Nsb3NlKGRldik7DQo+ICsNCj4gICAJ
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KDQoNCkFuZCB3aGlsZSB5b3UgYXJlIGxvb2tpbmcgYXQg
dGhlIGNvcnJlY3RuZXNzIG9mIHRoaXMgY29kZSwgaXMgaXQgc3VyZSANCnRoYXQgdWhkbGNfb3Bl
bigpIGNhbm5vdCBiZSBjYWxsZWQgdHdpY2UgaW4gcGFyYWxsZWxlID8NCklmIGl0IGNhbiBiZSBj
YWxsZWQgaW4gcGFyYWxsw6hsZSBJIHRoaW5rIHRoZSAiaWYgKHByaXYtPmhkbGNfYnVzeSAhPSAx
KSIgDQpzaG91bGQgYmUgcmVwbGFjZWQgYnkgc29tZXRoaW5nIHVzaW5nIGNtcHhjaGcoKQ0K
