Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1A889204
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:55:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KTOs64zo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33bc3RMlz3vpg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:55:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KTOs64zo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Lb6nsSz3vht
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:44:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtxCnEgqWYFyX7viVVW/yCHS2qEAEXDORcZ2OvJqD4OAUlHt6dKqH3diSxY+fHdykYEye5/qo7Ykxp0jy/9NZ60JXjBv5cUCQ5j31Uhzn2ZAKbDO13Ovr33f09hEfn/tpX/5XlyiWKRU9VTFz7sqvSe7w0ueDCCCz2dWaK8wgIIXJP/30U0Q8gLR88MNEoeifrLj+C0kdB/NFSQ2YNHHxQQkc3o7BSbJ2jfFmbzzb3VJyo0IwP4o3CtYLi3p79tRh1BcMbqBjWIqFSYTXMFVc0mE9+owXpdObY8tefJ2ChnmVHR44bEXPTT0r07VpVPf05XaLQ/8uq+1DyOOaOg3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nukh09oiBSmSo919Q/bGDATYNHQvYhwnDuHrUpbHtw4=;
 b=f9dOSao1cjMzrNH0/HVVViJ+u34wJQknKhmFsDJB32zPRpZmr33r5PaEYlexSssDv2m8GTaDB8pTXUQtzDcWLHl8PNeMV7bTP2GTxvY3vTmrVX/oiZM8FE8ulnUeLACpdZHMssCJC2wdMklKk8jn2Y3I662sozLslXm1/LPOpP+HjDAfeKHrxfR78yomF7eg4QPuZQMqW3IhfEiDOgZx2a7zCYa+YcwPpcSyj0sUXa+b0TcuoJ5Yn5skqPL4tm3IzUCLwCvVi23DECpAk5p/v2VLSGg9XgMQtW/kOaw/dSxk+1Fm5Xg2uAONG0/n7sFYlz9fl7AnGa5/vyt/fxNXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nukh09oiBSmSo919Q/bGDATYNHQvYhwnDuHrUpbHtw4=;
 b=KTOs64zouDRXBla+kRc5E2kcETKCJALkty5iGDTd07MWXHe6Nv0jwjv6ebrj8/CaFJl6wZAwyoNN18EB7bE1iGt2hHNg/KWNa/uIwrOX1oE3nsLtD1dEo696DaLlKe68l9FfglOVIDi8NgvR1+hbgg9S90ASAT2CgbGgfehbVQWcRk97LFA2mzOXCzISoOq4CfLAmuHnFbPk3wl35bC5ePQ5TpeXOFyEuarmuVNMXrpOwK3ydjPBoAoc1zg7TumsD+2aRTcbe5X5AZ7wYKGIvOYx3FZ7z2uisz9xtQqBbdIhTMJ9c5fmRs7eM3DtLOPyzKgJxw4KDDhQOafmdpMcBA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1859.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 06:43:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 06:43:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
	"hbathini@linux.ibm.com" <hbathini@linux.ibm.com>
Subject: Re: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Thread-Topic: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Thread-Index: AQHafm/HBa6Zup3O6kOZVcW6XoFyVrFH6uWAgAAXxYA=
Date: Mon, 25 Mar 2024 06:43:40 +0000
Message-ID: <5c232ad9-c4d5-49fa-8434-fc5034b6c5da@csgroup.eu>
References: <fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de>
 <761e7864-4655-4b58-b0ad-60d716c5f321@xenosoft.de>
In-Reply-To: <761e7864-4655-4b58-b0ad-60d716c5f321@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1859:EE_
x-ms-office365-filtering-correlation-id: 4ad3315e-1ff1-4105-3d84-08dc4c96e80a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kk1saIfEWL0uob+rfYZl2y28cbyEIMrERcV8aK4HvEHek21Fk5UvWdc7hcOvAAomxRAUyTGhPWk5Lhb9Q6Gnbjubdp3fahAcE1uTTkOn3rBskUCnkdnTx9EKObNbjB9d77lFKQj4+eskS6ZIXa3QSfWApSfUZPbr7PkkV9P1fMQuRdrFZ8+ICyHm05qFTXYQdMb2cqjAFcvBAndtfutdbhhj+3oKLIxoYTf8cIOBWVF56FNVc4orPM1oP2pPswQCK0TzNj1fu8JOORKJO7+tW8pwZlA/8S7QMiU7sGkhxrRmscoTKcKTVcD6mHL6dctcnXGjv3Xb0a1ArvURDUg5xGopiK9bVaYo6pkPz1gDTQYzv8ON0olZRs+ie10F6ENACmwB9q2W21bqGeb2vRP68ZNQWMQ3oasNhUa52uf5tbJWNULcHW1Ooekmpwq0T0RsHS2oKFAKb1jGq5FQOlRscbtTzSqsb06zjTTfHZZg48+S8kNVnqHE4qx0soNhJeE7hqhyD+F3fxjHQtMX9Su2rpTUDjfrN6b0JJl4UxPt3Ty5a+7W09QL/sXkef+xXLf5wpynAlJakikXo7TFQWzQi8YZD4TB7ubtqJ6jnnefw7KMNlNbDEAIsyjvK9I+ekFC78phY0DGjkUIoK9u8+9cQZpppbsEIHWLIXJB8DzOhwo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHRjOVJGQmM1Z1dVekZyZWE1QTZSUW45dlRCWUhBT2Z1dDREMmZINFJ2cldp?=
 =?utf-8?B?SEIzeHR6cXlJYjV1OEQxQm1mUVorMEt3VEJWQ1VYb3ZBUmVEQ0FQNzY4UGtj?=
 =?utf-8?B?RHMwQnJjU3ZpeDVKWkc1NldLMHk0YXEzN1lPZm9lTlYxNWJzajhMUkRxcklF?=
 =?utf-8?B?cGxuMDJtS0dSSGJ1eGtLMjk4OG9MRndXcG5VcTJkcVQ3WWZKNGVzZVArV0ZZ?=
 =?utf-8?B?cDBtT2VGNDBMdlZXZHFVYlp1UUhwa1RWMkF1UnEwN3dxa0pvaEYzK1dpLzlm?=
 =?utf-8?B?REhSTUc0MGk2c1BHOE1UWHcvL3liU2k0S3dWaWUzNHZzMVdzS3BFek54MGRs?=
 =?utf-8?B?bmNoczY3cUtKY2ppTmpYalVDcGFZSkhXUEgzWnBLV3BBNGF6Nkl1Ty9pcnBZ?=
 =?utf-8?B?c0NGTk1OdUFoOFBYSjBjcUJ6NUJrUG1Xa2Y1UThuUlVKSUtjT1pUeFR4eEVZ?=
 =?utf-8?B?Q01Ydy9VK1hoRHNLTlRZdXpQY2w3OTVubmJwQnRFN2R1YnNuS3pLTDBOWmRN?=
 =?utf-8?B?MmlEMWIrOHJWaE9PUFVsYmtHK3A0UDZLQW54NnB4V0hzWFVWSXZXanEyUGw2?=
 =?utf-8?B?ckhwb2llelRqOEhwZVp3RUlYblY1NTJLMmwweCtncDRweEZVejZlWmdQRFNE?=
 =?utf-8?B?bHY2bmQzbU11WVZ0OHlLbEV1aGNRQnUva2h0SzRMY0J1bHE4TVhKWThIK3ZQ?=
 =?utf-8?B?M01xV3pPT0ZQdVRmUTUzV1YyU0RrN1Jyc3RrblVWSnBBTUhtTnVodFlDSTNC?=
 =?utf-8?B?empRS2E3WExRbUNIbk85TW92WnRQMUhiamRFckJlRTlZUThNT3RaNStYbExs?=
 =?utf-8?B?ODR2MDBCZ3FmOXpxQlhjRmFpaEE1K0FoNThCWlNFQkhJQjJlWlpYUTF2ZzF0?=
 =?utf-8?B?WEozNHI3WVVkQ1VLY2hST2VkaWFyVTVHN3dGZkVOR3I1ekljd2N4dmZ5RUs4?=
 =?utf-8?B?TU14cjdKdGJSSVBkVWVlaGlNYVRQQ0VLUGcxRXNrcGozNjZjb1FLUEpjNTZ2?=
 =?utf-8?B?N3o0WTAvajJKVWJJNHQ5MWZXOGducFBFcGU4aUp5UDlVQjNsaEo1eTNtSlhM?=
 =?utf-8?B?UmhUNUtBd1lWVVp2UTVDSGR0TXVMMEtPMWNSemhQaXJldE9SMThYUnN0RmR4?=
 =?utf-8?B?YVhiSi9DSjhUblQ4NXdFdnpGSk5wNkpsVjl2b3R5SXBuVHBIRzU2RlZ0Smc4?=
 =?utf-8?B?THAreFIxUlUvdGtqdDQ3ZkI1N2xHcDNiQ2dKQ1Bna3h6NnhtbzQ3NWY3QTBU?=
 =?utf-8?B?V1gyekRrUjlUKzBwSUVKZytYOUNrVUpETnBMdVVVQVNKQzFiZVRwQ3hVTWZX?=
 =?utf-8?B?cFlYbFk2REREdUNUbi9FMmxmZFMwV3pKclUrVENSUHVJd2lhOGpKKytCZGh3?=
 =?utf-8?B?RnNhN2pGSXRXRDNIQ0I1K3VjWGo3ZVhJVzIzR0IxVG8wVmZHSTFraFNFVHlx?=
 =?utf-8?B?YmZKUG1YbGxKd2orQlpudzI1VXJ0R0psOGxjM09RdDZ6V1pZOWp6SjIybHJi?=
 =?utf-8?B?Snk4bXAvSTYwYUIxdllUVFI4S0JEdTBHTm81R0laQ1FUQ2htYXgwWW5jOWZ6?=
 =?utf-8?B?cTFwQTUzR2ttdExneFA2MXlsSmRhRC91MmkzQ2ZlN1FQdHYvNVVia3NrU096?=
 =?utf-8?B?MXhQbkplMkR1SFNTTmVyVVVxK1FpTXFvY2Zlb0l4aGxoU21PTm13QkcwbWV3?=
 =?utf-8?B?YzgvUThwWkVRY1FvSUtuTWpCZ0tnZHl6OHJNS1NmbUIrS0xlN09UNlRsV1V0?=
 =?utf-8?B?alVHTE4xd0lrQ2RHQjFXcE1DeEVQZ1U5L3JuajR2OTVuTVFSbTZ5TWpYQVFm?=
 =?utf-8?B?eVpqTVJSSFhFcGM5VE5BSnpRa2l2emd5NzJ2K1dXcW1SR29oNUIzOXBIb1Na?=
 =?utf-8?B?citHNFlHRFhCY1ZEMlJDTW9FYUhGVkpxOHRIZnZkRzBHUUpsVlhRbEM2UFdz?=
 =?utf-8?B?SFZaMm90NHFXRUI1YVlXUkZKaEFtaW1IVktwVEFlRnRwZTYzMXF3V0Y2ZWRy?=
 =?utf-8?B?QmhGSm1neWMxRENjWlVkd0V0R1IxazN6alM1YzdKTDNyVU82WUVMS3gySkhV?=
 =?utf-8?B?SGRRVU1INC9ZMTU1TjUrM2ZveENGNEpGakZzcm1GNGpLZnRGa3l0dGpIcDVB?=
 =?utf-8?Q?ZQxagYdOGP8ALsK5gwc7zwshu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2501813EE592D4F84B0D863A4CCFDAC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad3315e-1ff1-4105-3d84-08dc4c96e80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 06:43:40.0996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xjb/Ap9pyK5O1cVMhzerkeEr9fuHfhBlaSCojUiEIdb4fb3KeRWu15DBVQkiZFCvcv2vbv1A2CbXAuKMxXz9EsbGZkLSq1OtbrjtYArhhvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1859
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDI1LzAzLzIwMjQgw6AgMDY6MTgsIENocmlzdGlhbiBaaWdvdHpreSBhIMOpY3Jp
dMKgOg0KPiBJIGhhdmUgY3JlYXRlZCBhIHBhdGNoOg0KPiANCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy84NXh4L3NtcC5jIDIwMjQtMDMtMjUgMDY6MTQ6MDIuMjAxMjA5NDc2ICswMTAw
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zbXAuYyAyMDI0LTAzLTI1IDA2
OjEwOjA0LjQyMTQyNTkzMSArMDEwMA0KPiBAQCAtMzkzLDYgKzM5Myw3IEBAIHN0YXRpYyB2b2lk
IG1wYzg1eHhfc21wX2tleGVjX2NwdV9kb3duKGkNCj4gIMKgwqDCoMKgwqDCoMKgIGludCBkaXNh
YmxlX3RocmVhZGJpdCA9IDA7DQo+ICDCoMKgwqDCoMKgwqDCoCBsb25nIHN0YXJ0ID0gbWZ0Yigp
Ow0KPiAgwqDCoMKgwqDCoMKgwqAgbG9uZyBub3c7DQo+ICvCoMKgwqDCoMKgwqAgaW50IGNyYXNo
aW5nX2NwdSA9IC0xOw0KDQpjcmFzaGluZ19jcHUgaXMgYSBnbG9iYWwgdmFyaWFibGUgZGVmaW5l
ZCBpbiANCmFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMgYW5kIGRlY2xhcmVkIGlu
IA0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2tleGVjLmgNCg0KU28geW91IGNhbid0IHJlZGVm
aW5lIGNyYXNoaW5nX2NwdSBhcyBhIGxvY2FsIHN0dWIuDQoNCkFsbCB5b3UgbmVlZCB0byBkbyBp
cyB0byBhZGQgI2luY2x1ZGUgPGFzbS9rZXhlYy5oPiBqdXN0IGxpa2UgDQphcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL3Bvd2VybnYvc21wLmMgSSBndWVzcy4NCg0KQ2hyaXN0b3BoZQ0KDQoNCg0KPiAN
Cj4gIMKgwqDCoMKgwqDCoMKgIGxvY2FsX2lycV9kaXNhYmxlKCk7DQo+ICDCoMKgwqDCoMKgwqDC
oCBoYXJkX2lycV9kaXNhYmxlKCk7DQo+IA0KPiAtLS0NCj4gDQo+IC0tIENocmlzdGlhbg0KPiAN
Cj4gDQo+IE9uIDI1IE1hcmNoIDIwMjQgYXQgMDU6NDggYW0sIENocmlzdGlhbiBaaWdvdHpreSB3
cm90ZToNCj4+IEhpIEFsbCwNCj4+DQo+PiBDb21waWxpbmcgb2YgdGhlIFJDMSBvZiBrZXJuZWwg
Ni45IGRvZXNu4oCZdCB3b3JrIGFueW1vcmUgZm9yIG91ciBGU0wgDQo+PiBQNTAyMC9QNTA0MCBi
b2FyZHMgWzFdIHNpbmNlIHRoZSBQb3dlclBDIHVwZGF0ZXMgNi45LTIgWzJdLg0KPj4NCj4+IEVy
cm9yIG1lc3NhZ2VzOg0KPj4NCj4+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zbXAuYzog
SW4gZnVuY3Rpb24gDQo+PiAnbXBjODV4eF9zbXBfa2V4ZWNfY3B1X2Rvd24nOg0KPj4gYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NtcC5jOjQwMToxMzogZXJyb3I6ICdjcmFzaGluZ19jcHUn
IA0KPj4gdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4gJ2NyYXNoX3NhdmVfY3B1Jz8NCj4+IMKgIDQwMSB8wqAgaWYgKGNwdSA9PSBjcmFzaGluZ19j
cHUgJiYgY3B1X3RocmVhZF9pbl9jb3JlKGNwdSkgIT0gMCkgew0KPj4gwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fg0KPj4gwqDCoMKgwqDCoCB8wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNyYXNoX3NhdmVfY3B1DQo+PiBhcmNoL3Bvd2VycGMvcGxhdGZv
cm1zLzg1eHgvc21wLmM6NDAxOjEzOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgDQo+PiBpZGVudGlm
aWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGlu
DQo+PiBtYWtlWzVdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ0OiANCj4+IGFyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zbXAub10gRXJyb3IgMQ0KPj4gbWFrZVs0XTogKioqIFtz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4NTogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4XSAN
Cj4+IEVycm9yIDINCj4+IG1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0ODU6
IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXNdIEVycm9yIDINCj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDo0ODU6IGFyY2gvcG93ZXJwY10gRXJyb3IgMg0KPj4NCj4+IC0tLQ0K
Pj4NCj4+IEkgd2FzIGFibGUgdG8gcmV2ZXJ0IGl0LiBBZnRlciB0aGF0IHRoZSBjb21waWxpbmcg
d29ya3MgYWdhaW4uDQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGUgUG93ZXJQQyB1
cGRhdGVzIDYuOS0yPyBbMl0NCj4+DQo+PiBUaGFua3MsDQo+PiBDaHJpc3RpYW4NCj4+DQo+PiBb
MV0gaHR0cDovL3dpa2kuYW1pZ2Eub3JnL2luZGV4LnBocD90aXRsZT1YNTAwMA0KPj4gWzJdIA0K
Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L2NvbW1pdC8/aD12Ni45LXJjMSZpZD00ODQxOTNmZWNkMmI2MzQ5YTZmZDE1
NTRkMzA2YWVjNjQ2YWUxYTZhDQo+IA0K
