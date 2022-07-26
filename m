Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08B58154E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsfVs44mDz3cd8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 00:31:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JPviZgQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JPviZgQ0;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsfV65FB9z3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 00:31:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfqVBZPVmUk7wpSQa2bGbxBfdOx7Ed3EiJVkX4K5XFPcH3fjTFMeTlAeOmXsqyhJ9Ib+lMimMS/7PKQKCBkO30zo8bFTiGKXzbIMc+Tsgw8YBzjUxUZxuneDWvYvaryjEj7NJT6DxgHMV0RhSWvmtm47XNJtn07EsIBJptz7IiZSltska4Rh7PNBIuE1uKjv0Xg/VsWdGgDHv+NeBD0SLhkdQUdI/poDg9EMrXRs2ODJXmvJhTCrG7mEvsn7n3/yhZQZjTTQpvZHyU5jHpuFgIyCp4wH2R14WAFsDTOCOrboLL8G8mqNOMXoKHH2XOq20DZwFkokkvLx7FXvgMV+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHV07XDjLwWLLr1cMUOBztglpqUuCOfs0YsY3f0T++c=;
 b=HmC/BOoeretwhJ7k/Z7FFW1tFk3oefDlmWvVJTIgupEABg6Z+3WvlOWt7F42mJjwx5h1gWrI1GvuIvLqg5T7s/hiJNREanUce1dW4XdBMbM9UihRoVHZm1l4X56jRamu9lGEyxjdvvDopG1XRWcfHxCaKnyljrOlvUVbPZs0LfZDbiUygv2O/P5Ea5oN4BQ9/uwxBV1PHzig95koheeuio+eW6R26P4k2+pOgnRTSg1BKotINpjbtJCDWGoirry38fMDvSJbA6ytwW5wpFHaGTJZVIKyvr1JtHPRL3/+RbjrV1SZ9/VippBL3bsE7T4KNp2pl3TQisKsjBQbdGn0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHV07XDjLwWLLr1cMUOBztglpqUuCOfs0YsY3f0T++c=;
 b=JPviZgQ0zXVxkXOg/sUU6McnbStVgSX1SZ+bcBTkkFB15tDA78OvFD09D+aPIep6lazNyTf30VrRKYHLD/eRAvjTztiTqKUUY9wvyZoqyCrx0/DFX+6IYL46QOpvipNcfTxT45hNZv6s/CTWqFeSXLmm/ZMSyIV9cyo0Frrm3056TfFr27FCnASAuJcV2rc4faNWPQPikrTaZpVka+TebnspuJiwdY/qWjeXdX630q7OnWPpkjXVndmQEUY06U5AATsQ5mMcnfR0y8RJTZJz/2WM932OpplkNAXO/Qyta17AQq7vdzc8NGFM9qAR0R4xGfyc9WMPDUC4jXFmlCwawA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:252::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 14:30:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 14:30:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Segher Boessenkool
	<segher@kernel.crashing.org>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Topic: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Index:  AQHYnarFcL6sKMJcmk+y5CiOp18nOa2MCX8AgAAG5QCAArLxgIAATEEAgAA6FYCAAEATgIAAHRcAgACyxACAAGOtgA==
Date: Tue, 26 Jul 2022 14:30:49 +0000
Message-ID: <4933ed23-9d0e-cffc-7bc6-05426414894c@csgroup.eu>
References: <20220722090929.mwhmxxdd7yioxqpz@pali>
 <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali>
 <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
 <20220725201009.gwuchzswcqaxntrk@pali>
 <20220725215416.GV25951@gate.crashing.org>
 <20220726083406.tcjvny6d2di6q7ar@pali>
In-Reply-To: <20220726083406.tcjvny6d2di6q7ar@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eb132e3-c69f-4d2b-03b6-08da6f136fe8
x-ms-traffictypediagnostic: PR1P264MB4070:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kPHVwKDcWv0wMtytiHUg+VKf6iSR4Wa6x/sxwfqaC2gd/5iEUJIaRq18O5m1kYd84N8ntpKXLytsXKLT67BIpFwcXa8cBmKE+3I+7DcStqwoOHKLgexiF8d1C0OMFZqBmy2fJMlI0+RzgZb2kNRbj5Q3Ld6W5OlDj2TzMjG/gJmuYwd+ynmMFlmYbjCLK2a5auOCHuVmgOBcgIBdbAuCUCbOL0NEkpswciq+4+y43lRwqC8lbzpeWAjGsEU10WaBzBiJ9I4+WtrVLuaAMH9hNKdPVx2vommBHvk19ffQS06rgC83K0NYHCRlk52vEMrIoaQMFvumzHw3Kayp/vbnFFE3k30gVf3mChTqhijj8Z8mN6zTWSbgQHdQfrrUMwryCSeY82YBTDSHhEDfJK25D/LQHJ3NfhCmjMg4r5aQH8qn+WRQjvSiszrhruGRb7fq3V4PTA6s9o5/DlNOPqKqS0dC9uVqu3wyisVTEJR5eV3W3EOUKRtznKvXDsEQiBwiiWd+9E2WbiDQQVrbH6sapQbkWkZPu4pDcBHmT1EWcV6vwvp+4MmZGwGoZs563xMwGCZVi+C+H4rLyZlZCtsOzq6wHQN9wO/0qYP0c/DRvA0ChM8gRfDavPuGfo6JcpfFEUtvWpJQ6SKhn3kJ7lh13ZSoSSogDFVW1a6BtehqvEiQSyPWa1LThW5RnfTc8/Dt/H39NYA64XZs3x4BewmJ7nACrURixxaV0R9bAaHwZU0Hev5XyHqJEda17FhQbpz87LoRB8/hsqCEIrBm4ffdcUPx3nWHg3Oatfua3XCQ8u4RkW5m0V+yDJKMnoKrYVEUQ5fcKsunmKEN0YvN9YF0bc+qRsC0hp+8tAh5+V+Dim8YhLqcPaSKo8fPGL0JsIWahMGBL3uj3jFe2zIJuV7rHw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39860400002)(366004)(122000001)(38070700005)(86362001)(38100700002)(31696002)(966005)(6486002)(8936002)(5660300002)(44832011)(478600001)(316002)(64756008)(66446008)(66476007)(66946007)(8676002)(71200400001)(4326008)(76116006)(66556008)(91956017)(66574015)(2616005)(36756003)(186003)(83380400001)(110136005)(54906003)(6506007)(41300700001)(2906002)(26005)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0YzMVN4d3UzeW83bURlNkVhL0o2cUdCRzRqemEwMFlQOWUxNloyblZEOXhU?=
 =?utf-8?B?V3N2NGUwOVp3N2N3R3NlUUJ5NURCdzg2bmdqVmJSV2ErYXh1YU83cXErTGRW?=
 =?utf-8?B?elZQMlV4bW92UXBZRDVoc0F2QWFpanlvaEk4a1ZYN1BUK3pTSkdsY1FGTkJk?=
 =?utf-8?B?Z3kzeEJwZ2s2NG9YaGJva3RSZWNmM1NkaGdJWUpERWVXdVdDNWxXMXJhRjB1?=
 =?utf-8?B?bEdXcy9iMnQyaWprOTBBNmU1YnhZUjAxSEI0M1RJenZxS2IwMktLbktDZVkr?=
 =?utf-8?B?R0RKcFJSVlhpM3l0WWV0cFVDMjFRUkEyQXdkSW1oOW9vWTBSZTN4V2lKRjBt?=
 =?utf-8?B?TmZDMTkyYXFFeFVYZEJPUzJqQUNMM0EzUE9OY2JTTXlHYU92TzR3T2VDUkk0?=
 =?utf-8?B?VmlnaURvR093OHp1Tk1qUHdmRFhEOUdmNnpYdUhFOUc4c0h6cWhETG1XZmJv?=
 =?utf-8?B?ejBKUytOSDRwMXBzZ0pDSkJrV1EwMGl3cDNqd2xQKzJLeTVDb2o1aXNLelRu?=
 =?utf-8?B?bGgrV1hRVXFQczBqNGdoa0tOQjJ6amdTY3NpdHRPTi82KzM3NExQU012NS9t?=
 =?utf-8?B?K2syZHA1eUs0L29VanRtZnZudWYyVk1iUkhEalZESzdKQ2RBdm5KQjQ1RmxW?=
 =?utf-8?B?Rk42V0RqVGdmUmJtOFR5ZFF0ZTJuaVoxby83MW1OaXJ6VjFlbG5aT3ZQWDFE?=
 =?utf-8?B?Y0ZhdU9kQ3ZMUzhtRkhQZFZLVWR6YlJyVXR5S0xyWG5aa3hqRGQ4YjFVNitO?=
 =?utf-8?B?UDBtcHpuMjJXSlNlekM2NTZLMWpzN2JHNjl6KzBqdFhSaXVNY2NOZ3Nac1lI?=
 =?utf-8?B?NVdZQTdRWFAydUFNS1Fva1ViTGF1YlpVekppeENTNFNPMExmOVJPWHl0SDZQ?=
 =?utf-8?B?Z3FIdGtpY1NDaHkwSVdueEI1eEtMYjBIbjc4NEp2dDltTG9PVG80WVRadkZw?=
 =?utf-8?B?YVRLb0hiN3VDWnFkNW90TXdLc05DT3JRN2p3WVBHWjcvRE5sNTJOZHpyQlpC?=
 =?utf-8?B?SFRZSnFGYVVYUGxxbG9FcDRXY1pUY2xPa0xZR1lrYWZiSXkyRWJERGVNV2wr?=
 =?utf-8?B?OS9NTFFUbnpVNWRtaXcyamZpazltcXg4azhiUjg1ZzdRblM2NXJza3k1RTNL?=
 =?utf-8?B?a09lU1NjeGhnUXA4UkM4Nll1bXQ3K3lRVktvMHNVMlNJQkp3eVViYmlSWTB4?=
 =?utf-8?B?ZU5NZHJRSW5XSDZNR3UwYXVZZUZnb0Z4a0RTN3lIa2tMbW1SVkRYR0xiWmJy?=
 =?utf-8?B?WXgwb1I2cUsvR0hhc2h2ZnhoQVpiZ0JrM2dmS004Wm1IeWxORXk5Y2RmZ1pN?=
 =?utf-8?B?UTJ4NkU4WWMrd0cxaHl1bEY1dUpFSk8xVkdIa0hFUVJWbU9HaTN6bHJqT1p6?=
 =?utf-8?B?UVNReDNmY0w3S0hhckZDZDZlajl6SW4rcXJzVmwvSVFueHkxSFBIc1lZRS9a?=
 =?utf-8?B?MWF0Y1lvb1FFLzMzY3dwWmh6WUdIc2hBN3l0U1J4ZDZDWlRXSmhqSHlqNVMw?=
 =?utf-8?B?OXY5Tkw4VUtub3ZxTDAvcTdDeFBjcDlXWDBBaldicjl0SVI2ZXBrVWttNzg3?=
 =?utf-8?B?d2p1WEpZbWVnamI1cGVJL0M0UnlDV0dZZ2JCVEppdkdQd1d2cU9UTzd4K1BC?=
 =?utf-8?B?c2IyT1lIZHdXUWlPcUxUcVFjSE90MXloUzBOWjE5MG5WNzlCcG81OWlLM1Q4?=
 =?utf-8?B?QkE2MmJxVUxaNnlXVjhSSDdPWmxyanorUEwyQWNNMnNTV0dvQ1pkaE5IdkJ1?=
 =?utf-8?B?dG4vSnpJalhTNWdsMGVIUitJYUN1R0k3QnlqUWxYMG40OWtncjFHektJVDBz?=
 =?utf-8?B?T00zRERVSGlKaFJhUjROU1AzdExaS1RlNVBTT3pFb1RCVVZUM2ZuYlFxcU50?=
 =?utf-8?B?WHU3bFZsNVk5YXZneS9XQnpvQlcxNGtTcmRydFEzZENKKzdSNW9zS1RiaUZ4?=
 =?utf-8?B?MXMwZUJwaWd0b1UrNTJBNGhBeEsyMWlTZVQ0NUZ0OUxkNnArVnBuWm5rTlhZ?=
 =?utf-8?B?UU5OTTFKa04wd29EK1BvbS81T1F5TXN3RTQweWxveTJLOFFrRGc1a2hmS01m?=
 =?utf-8?B?K2NxRXZYR3FSOVVkRXltbENQY3lMYWhqcGVXR2dUMWI3bTRVZ2tMYndSV05T?=
 =?utf-8?B?QzUxbmVtSTdrd0NlOHliV1VoNjEyZGZPMmVBZU1ReUJKQlVaNDVlcU5hOVZG?=
 =?utf-8?Q?SmKXi6bseVYP8v3p7ohT5P8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F55D9A1F210D7A44AC119A007503B327@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb132e3-c69f-4d2b-03b6-08da6f136fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 14:30:49.8259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lt0rnZx2CEL8hCaO6yWeaE9H59orKy1HBoOUU/k8b4Qto/xyqfDBHR9NS58YyybJcGqc4pYB5HhvBtf9BIaDgDBtQrgyMOp/lVi3Ms1gXJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4070
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

DQoNCkxlIDI2LzA3LzIwMjIgw6AgMTA6MzQsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IE1vbmRheSAyNSBKdWx5IDIwMjIgMTY6NTQ6MTYgU2VnaGVyIEJvZXNzZW5rb29sIHdyb3RlOg0K
Pj4gT24gTW9uLCBKdWwgMjUsIDIwMjIgYXQgMTA6MTA6MDlQTSArMDIwMCwgUGFsaSBSb2jDoXIg
d3JvdGU6DQo+Pj4gT24gTW9uZGF5IDI1IEp1bHkgMjAyMiAxNjoyMDo0OSBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4+IE5vdyBJIGRpZCBhZ2FpbiBjbGVhbiB0ZXN0IHdpdGggc2FtZSBEZWJp
YW4gMTAgY3Jvc3MgY29tcGlsZXIuDQo+Pj4NCj4+PiAkIGdpdCBjbG9uZSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgJiYg
Y2QgbGludXgNCj4+PiAkIGdpdCBjaGVja291dCB2NS4xNQ0KPj4+ICQgbWFrZSBtcGM4NXh4X3Nt
cF9kZWZjb25maWcgQVJDSD1wb3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJwYy1saW51eC1nbnVz
cGUtDQo+Pj4gJCBtYWtlIHZtbGludXggQVJDSD1wb3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJw
Yy1saW51eC1nbnVzcGUtDQo+Pj4gJCBjcCAtYSB2bWxpbnV4IHZtbGludXgudjUuMTUNCj4+PiAk
IGdpdCByZXZlcnQgOTQwMWY0ZTQ2Y2Y2OTY1ZTIzNzM4ZjcwZTE0OTE3MjM0NGEwMWVlZg0KPj4+
ICQgbWFrZSB2bWxpbnV4IEFSQ0g9cG93ZXJwYyBDUk9TU19DT01QSUxFPXBvd2VycGMtbGludXgt
Z251c3BlLQ0KPj4+ICQgY3AgLWEgdm1saW51eCB2bWxpbnV4LnJldmVydA0KPj4+ICQgcG93ZXJw
Yy1saW51eC1nbnVzcGUtb2JqZHVtcCAtZCB2bWxpbnV4LnJldmVydCA+IHZtbGludXgucmV2ZXJ0
LmR1bXANCj4+PiAkIHBvd2VycGMtbGludXgtZ251c3BlLW9iamR1bXAgLWQgdm1saW51eC52NS4x
NSA+IHZtbGludXgudjUuMTUuZHVtcA0KPj4+ICQgZGlmZiAtTmF1cnAgdm1saW51eC52NS4xNS5k
dW1wIHZtbGludXgucmV2ZXJ0LmR1bXANCj4+Pg0KPj4+IEFuZCB0aGVyZSBhcmU6DQo+Pj4NCj4+
PiAtYzAwMGMzMDQ6ICAgICAgN2QgMjAgZjggMjkgICAgIGx3YXJ4ICAgcjksMCxyMzEsMQ0KPj4+
ICtjMDAwYzMwNDogICAgICA3ZCAyMCBmOCAyOCAgICAgbHdhcnggICByOSwwLHIzMQ0KPj4+DQo+
Pj4gSSBndWVzcyBpdCBtdXN0IGJlIHJlcHJvZHVjaWJsZSB0aGlzIGlzc3VlIGFzIEknbSB1c2lu
ZyByZWd1bGFyDQo+Pj4gdG9vbGNoYWluIGZyb20gZGlzdHJpYnV0aW9uLg0KPj4NCj4+IFRoZSBr
ZXJuZWwgaGFkDQo+Pg0KPj4gI2RlZmluZSBQUENfUkFXX0xXQVJYKHQsIGEsIGIsIGVoKSAgICAg
ICAoMHg3YzAwMDAyOCB8IF9fX1BQQ19SVCh0KSB8IF9fX1BQQ19SQShhKSB8IF9fX1BQQ19SQihi
KSB8IF9fUFBDX0VIKGVoKSkNCj4+DQo+PiBhbmQNCj4+DQo+PiAjZGVmaW5lIFBQQ19MV0FSWCh0
LCBhLCBiLCBlaCkgc3RyaW5naWZ5X2luX2MoLmxvbmcgUFBDX1JBV19MV0FSWCh0LCBhLCBiLCBl
aCkpDQo+Pg0KPj4gYW5kDQo+Pg0KPj4gI2lmZGVmIENPTkZJR19QUEM2NA0KPj4gI2RlZmluZSBf
X1BQQ19FSChlaCkgICAgKCgoZWgpICYgMHgxKSA8PCAwKQ0KPj4gI2Vsc2UNCj4+ICNkZWZpbmUg
X19QUENfRUgoZWgpICAgIDANCj4+ICNlbmRpZg0KPj4NCj4+IGJ1dCBDaHJpc3RvcGhlJ3MgOTQw
MWY0ZTQ2Y2Y2IGNoYW5nZWQNCj4+DQo+PiAtIjE6ICAgICIgUFBDX0xXQVJYKCUwLDAsJTIsMSkg
IlxuXA0KPj4gKyIxOiAgICBsd2FyeCAgICAgICAgICAgJTAsMCwlMiwxXG5cDQo+Pg0KPj4gbm8g
bG9uZ2VyIGNoZWNraW5nIENPTkZJR19QUEM2NC4gIFRoYXQgYXBwZWFycyB0byBiZSB0aGUgYnVn
Lg0KPiANCj4gTmljZSBjYXRjaCENCj4gDQo+IE5vdyBJIGhhdmUgdHJpZWQgdG8gYXBwbHkgZm9s
bG93aW5nIGNoYW5nZSBvbiBtYXN0ZXIgKHdpdGhvdXQgcmV2ZXJ0aW5nDQo+IGFueXRoaW5nKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zaW1wbGVfc3Bpbmxv
Y2suaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zaW1wbGVfc3BpbmxvY2suaA0KPiBpbmRl
eCA3YWU2YWVlZjg0NjQuLjcyZDM2NTdmZDJmNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3NpbXBsZV9zcGlubG9jay5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9zaW1wbGVfc3BpbmxvY2suaA0KPiBAQCAtNTEsNyArNTEsNyBAQCBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgX19hcmNoX3NwaW5fdHJ5bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxv
Y2spDQo+ICAgDQo+ICAgCXRva2VuID0gTE9DS19UT0tFTjsNCj4gICAJX19hc21fXyBfX3ZvbGF0
aWxlX18oDQo+IC0iMToJbHdhcngJCSUwLDAsJTIsMVxuXA0KPiArIjE6CWx3YXJ4CQklMCwwLCUy
LDBcblwNCj4gICAJY21wd2kJCTAsJTAsMFxuXA0KPiAgIAlibmUtCQkyZlxuXA0KPiAgIAlzdHdj
eC4JCSUxLDAsJTJcblwNCj4gQEAgLTE1OCw3ICsxNTgsNyBAQCBzdGF0aWMgaW5saW5lIGxvbmcg
X19hcmNoX3JlYWRfdHJ5bG9jayhhcmNoX3J3bG9ja190ICpydykNCj4gICAJbG9uZyB0bXA7DQo+
ICAgDQo+ICAgCV9fYXNtX18gX192b2xhdGlsZV9fKA0KPiAtIjE6CWx3YXJ4CQklMCwwLCUxLDFc
biINCj4gKyIxOglsd2FyeAkJJTAsMCwlMSwwXG4iDQo+ICAgCV9fRE9fU0lHTl9FWFRFTkQNCj4g
ICAiCWFkZGljLgkJJTAsJTAsMVxuXA0KPiAgIAlibGUtCQkyZlxuIg0KPiBAQCAtMTgyLDcgKzE4
Miw3IEBAIHN0YXRpYyBpbmxpbmUgbG9uZyBfX2FyY2hfd3JpdGVfdHJ5bG9jayhhcmNoX3J3bG9j
a190ICpydykNCj4gICANCj4gICAJdG9rZW4gPSBXUkxPQ0tfVE9LRU47DQo+ICAgCV9fYXNtX18g
X192b2xhdGlsZV9fKA0KPiAtIjE6CWx3YXJ4CQklMCwwLCUyLDFcblwNCj4gKyIxOglsd2FyeAkJ
JTAsMCwlMiwwXG5cDQo+ICAgCWNtcHdpCQkwLCUwLDBcblwNCj4gICAJYm5lLQkJMmZcbiINCj4g
ICAiCXN0d2N4LgkJJTEsMCwlMlxuXA0KPiANCj4gYW5kIHdpdGggdGhpcyBjaGFuZ2UsIG9iamR1
bXAgc2hvd2VkIGV4YWN0bHkgc2FtZSByZXN1bHQgYXMgaWYgSSByZXZlcnQNCj4gdGhhdCBwcm9i
bGVtYXRpYyBjb21taXQgb24gdG9wIG9mIG1hc3RlciBicmFuY2guDQo+IA0KPiBJIGd1ZXNzIHRo
YXQgc2ltcGxlX3NwaW5sb2NrLmggc2hvdWxkIGJlIGZpeGVkIHRvIHBhc3MgMSB0byBsd2FyeCBm
b3INCj4gQ09ORklHX1BQQzY0IGFuZCAwIG90aGVyd2lzZS4NCj4gDQo+IENocmlzdG9waGUsIGFy
ZSB5b3UgZ29pbmcgdG8gbG9vayBhdCBpdD8NCj4gDQoNClllcyBJIHdpbGwsIGJ1dCBuZXh0IHdl
ZWsgYXQgdGhlIGVhcmxpZXN0Lg0KDQpDaHJpc3RvcGhl
