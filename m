Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94163C3C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 16:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM5qz0SZKz3bVD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 02:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kFhN+hpo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kFhN+hpo;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM5py1p4Sz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 02:29:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgwteSEgR4Appp751MNdma8+1adfZF0F+ljAxwwyupDdphLxV6DQma2cu4WZMMd05RKczOYuDg3rbz1izS+nJGsGi6qmjYEzUmbdvkIY3z2u8rKFO+sMBgdAidE43zUa8+wt0aCXVOEHOkb0ZinwEt7FQrIfAtnt92Ae4NepezSv8YgjbaRBGsmjQfIVaMbJPcV80BJnm5Z4VGb4ENP7I2ZjZSKSDJT8V6Pmew+Ix9/UN9zWm5C7D+1ArvHa1IL2cZA9jX9R6BXqoCCiLqJ6Z88lNaELLEXp4Wr3hEhRP05AqYoK6eKdMI0nuoLiFt7sHxXCucwsdAW4S29nd119lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfNMvhEDO/PsfPXmUqojeCqBJVyGWgSDlvOEhzZj9dw=;
 b=NSIyQbCEDwYQ9YG8q4GUrmX6n5ogdc1oBYF1ADJfLKc/FtbmOA+Xx15eMOWH0uSddQWXz1h0wF5ciL8UNzMb5UL4OKV9MUF8yxVfM2OyK91sQaIQhSKfch63GvjrMZ0F3fAv8znB5i/dTvHv0xqf+75KsYSK0UGKGqRYpzOoFjH46JNwKSybOvZDWQ3fXgIPBwnlC8k0dAtlmn1W7LgtIXTVKRHkItETYNdOejB6IqNTauunWrEhuhT2TXI93xXf9DPHkhbOaBbnTb3Zj58jeDA3VsBa1AcIh3YObkksgH3UH1ak5In70zdQDQDUS2KMdCPsCbjUTFpTzbrNH81HAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfNMvhEDO/PsfPXmUqojeCqBJVyGWgSDlvOEhzZj9dw=;
 b=kFhN+hpoFlFoqAtSd00H7HWy4cRufE0D2mN40++NsppvXu72xJ6qsYSWfCuY5HvG/3nr7QUvlEIfwzQOMsbT0ZZU7i4pcE/W2EryQpLeDZQFQYT51QmeYPLzB17PZxfZ3B9wU41/+zbZXBT8x88X6nlLPPnOjeRLTmVaeWJ+irXko1U+CTHmaruXMm5awJa78J8I+LPVKxfF7Q7w3xWOlE/W3ubzxZOLatLRlQUom/2lZA/dxMCdY38FEvH8CBsbY6w6wmdQ2aM/X437n2wsiZTU/ykGg0ZoHZ6N4smJLjnyT43mzpqOx2tCWGoNfEx/fVtkoZX/EBTXCYbLWd4LMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1983.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 15:28:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 15:28:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warnings after merge of the powerpc-objtool
 tree
Thread-Topic: linux-next: build warnings after merge of the powerpc-objtool
 tree
Thread-Index: AQHZAH4+CSTeB8J+L0G4I3MAaW4g/65WCUSAgAAETYA=
Date: Tue, 29 Nov 2022 15:28:49 +0000
Message-ID: <c0ed0d60-6014-4c5f-e610-b4d3bd9e9e33@csgroup.eu>
References: <20221125143012.6426c2b9@canb.auug.org.au>
 <6cdad32e-782d-5bb5-f7e9-a44fb0b6444d@linux.ibm.com>
In-Reply-To: <6cdad32e-782d-5bb5-f7e9-a44fb0b6444d@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1983:EE_
x-ms-office365-filtering-correlation-id: b09bcdd9-80e2-4e58-e281-08dad21e6a31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  L7naXXMH6cntnsEn4kB5OpXYI1J/7Ej5XuhS6Xxbfs1hxMnaVLhr1Z9ZbHNAClJs/TMYR4trOT8U8idpPeU0cH947kfXJgQzW40MV23G0XK0+YNJRe6fJs7+Usj4mVbbtz9EEUshlWGqqtlzHPYjC9ppT+bjelJutvUNwywvunle5SG550pp/YBlc5M/vI2AigZ0NShXhqUiL4KYoPQOBC+QSa8DmLoDmzA6QV7iUdL1iB6HoSz1YFliNhUGbL/DF5ZkM9oaLXz2pdNxyBdqzbQ5uZh1fUgSxC0cBM22US7QevZ6YOFbr87GIM/TpPgrYCSdl9kjDA/5cG2nqo8YyzsE5nmqXdN6fV/PTLQ47fjTCYRfGzUSNilpbc1//AIreUfgONEAS9nQ2EvLzc4BXMeq0VBjoetlGd8EQgjWcx/WRrn/EpW4sWqdo2UqteDGjI24+trzxg794bFTP/VfGjHsC1kkOr4d8VdDWIBpV576cVBH2IlricoWhgI1Yj/u23ePN6Amas3ptCUhWcwm2+4H8W3KkcophnUw//5XnW4UQMqVWnoToaGu+502cV+nj2BRqM5d9+hZS2zKp7qWQG+tFRqFuc+lo71jfj8NDtqKuviqPgwKa9paRWeX2jxsCaww5RGXFHhUyBh6B1eZWD+nHpRYEuedZ/0U/rUOZ6N+YjFQsWxfsKIC/ur2KOSxpZb4fVPIIimlnbYsdm8C4Ww38+rJ4bbQuG15dctHubwJQhvlVon2vPG6zJSYILXspbPdySi2ZYej2C0Ov9hkkEIo14DreOS0pD3EhFn+rN0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(451199015)(66556008)(38070700005)(6506007)(31696002)(86362001)(91956017)(186003)(6512007)(8676002)(66946007)(53546011)(76116006)(66476007)(66446008)(4326008)(316002)(41300700001)(8936002)(64756008)(2616005)(71200400001)(6486002)(478600001)(54906003)(110136005)(122000001)(38100700002)(44832011)(2906002)(66574015)(83380400001)(5660300002)(26005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YldHMzZzcCs0UlNiZlR3czRTdzhBQTluWHBpTDljVTUrMGh6cllNeVBTT2Nm?=
 =?utf-8?B?WFd1eGdkUkpCSzJUV0hOelZBWTFDSlNsRnlyMEtyWml1MEdMTXhmTVFhTU1I?=
 =?utf-8?B?ZFVaTUQ4TnJXNzdTcmdhc1RZZmRNMzkvM2hrSllJU1BGSmlFVXpTTzA1dnhj?=
 =?utf-8?B?cEtOeTkvdlY3S01MRXQ1QlBEVWRZRHZib2l4VXdYUTNONFNXWkd3bVVxWWpv?=
 =?utf-8?B?bkZybFpuTjlOaWI5cnp0bHViUk1BN2o4WGlUakZlbjROamxjUmE3bUwyUDdJ?=
 =?utf-8?B?dXpyWnI0SHdaMXdXeXRpOWNCRTM0b3JjUGxNWDRsckxPSlVabU0yUmxpUzBu?=
 =?utf-8?B?TnZWZEp4YlFKZTY3N0FieWg1OXl2Nk43anFUblNGNjdFQWhLK1l5YVR1aXFT?=
 =?utf-8?B?b0JISjQ0VGdPY3VFT0I2Rkh2NldYZHphdUhtSHBmeGFSOGJQc1MxbWt6cHZ0?=
 =?utf-8?B?WGN1MTNrVjlzaU9zdWx2bWw3MzZMejJLZ3V4WGRMQ1h6Zmt1Qlc5WTdxSUxG?=
 =?utf-8?B?MjZMM01uelRGd05rK2k1MXhWbWZLS3lIaW9tREsraUJEbVpIcUg1dFhPU0ZN?=
 =?utf-8?B?NFd0bm9lRmdQdXJqREZSN2pJeHh6Rm9WeUlQa1J0blRPaW8ydVhOZCtzMU80?=
 =?utf-8?B?OEVDMWFwMXp6Rmc4VHZnTlJBczB2Y1hmaHlQVklXSE9UV2lMbGYrZFVqOHBI?=
 =?utf-8?B?T3krOHZFVkltUlBkM2d0UmdJQkgrWGdxcE1oblF2bnZmZWErQ0owaUxLQU0w?=
 =?utf-8?B?bHlzeHVxZkY0T2t2bXc2akZXNTJWV1E0RzBzdDVldFEycUh6YVoxTGNybGtC?=
 =?utf-8?B?QUY0NUdLWGxCNkN5Ull1NUVyOGxIOGNXVEtiYVdKTFZwbHg2TVN5OGtLYnM4?=
 =?utf-8?B?UHEvZlFOV2NIRnpYdW9jTUcwUXdqdDVPZ2dOWkVaMTJIQjBEYktPMXFiWEQ2?=
 =?utf-8?B?ZWtCMG9LeW1OYzNRYzNvYjI3QUZjdUEyZTJQeXpqRUtaL1g4NXNlZVV1dUl2?=
 =?utf-8?B?RjRnRVl2dzNtRnEvN3Q0cTVrODh3TzhBaWkzT1MrRkNmUVllaXFrSWo1WjNF?=
 =?utf-8?B?KzhQb1dlQVRHcGZob3B0bXRmclpTeXAwRzB4MEdHWUk4NE5talBMcERBcndt?=
 =?utf-8?B?S1hVWUFkeWNPdTJPTzBJUVg5dGpxcUdJUlZ2WjlKSTRHSkJ6YVdwS21lcWU0?=
 =?utf-8?B?SzN0UGdOeTZzK24vTjlUdDFGaFBTdTFiNWR3UnBSaTBvOXBFTGpTSXFxeE55?=
 =?utf-8?B?WUEvVTNRVjVtLzNpUXpsLy9JQ3k3Ymd4WEJlenVrRXhSSW9aRko0ODFiNlI2?=
 =?utf-8?B?dmZXTFRrYXdPYkFHM01uZkdSVktCYXZ3SE5ieVdsektObitBUS8yRW5CSG43?=
 =?utf-8?B?cEhBU1ZxeHMxRXBPUGpwUXErbkc3ZVMzK0o2WkI5YjJsZkx0d1ZaRXJNM2xE?=
 =?utf-8?B?TU9SZEhpVVhPZWo3OG8wQVJjY3p4NWRhQTk5Y3lyMFRZalgvOFF5WU50N0xK?=
 =?utf-8?B?UVllZGkxNjhGVFJscXRXblZEVEl1ZGZwMUt3YXFsd29JM05DNGQ3M01tZkRX?=
 =?utf-8?B?dFg4SUMrd1d4akVCd2toMnlZNGFyM2hQcjVEUm44dWZRTUJJdlNyamZsTEhn?=
 =?utf-8?B?SFJpczNIcWRQVU40dlo4a2huVW1hQWdLbHU5N21HNElick1uakMvMms3NStt?=
 =?utf-8?B?amszL3hXak9pWmMrenBXdHdXSU1yMjluazJDUjhRWE5XVXNCWWZoVTc3MCsv?=
 =?utf-8?B?ci9CTFUxUHhOd3ZVTnBHakNrQkJWNndpYVo4dVFiMDNnYnVvYjF6TlVTYUVn?=
 =?utf-8?B?VWswV1V2S2xSbFFwSFQ4SERYSUI2M2YxQmxwOWVsWGxFWXg3andnbWdsZnMw?=
 =?utf-8?B?ejRxVG1uMnd6V1Nhcmk4ejNzNjBOZ3VHTGFyTDJnNnJzMmV4cURVaUIxamR5?=
 =?utf-8?B?cE1VNlJyUjFUdVArNVRSek5yUExWR2d1VDJDbnJlV3BURGl2b1BrZUJZRVdF?=
 =?utf-8?B?SGU3TmxJWjNYcDgwWm9Qa0F1L1FqaXd4MzFSYUpGbGI1MUEyUWc1RXhNRk84?=
 =?utf-8?B?U3VTNFJiZ1c1QnNhNjdXelVYczIyR2JqTUJQODdvUkp4dmtiYTZZY1Bpbnlp?=
 =?utf-8?B?WDAwbHc0SGZPQnJ4YVFpQzRPV2dzaU1IUm5sQ1dNdjl4dGUvQzJRYWs3dG5o?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B89454532D20AC4B9A8BFBECBD0843FB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b09bcdd9-80e2-4e58-e281-08dad21e6a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 15:28:49.8696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86mMfN6yMMWOsMm/2mbljgJAxEl6dqBGGIsy+A023BQE1HT61ZCB6JAvVPgEpMmxhqcK8dD6p4Z91tEbehXd+2yqkfxaH7Zbpb1cdR2JLCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1983
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzExLzIwMjIgw6AgMTY6MTMsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBIaSBhbGwsDQo+IA0KPiBPbiAyNS8xMS8yMiAwOTowMCwgU3RlcGhlbiBSb3Rod2VsbCB3
cm90ZToNCj4+IEhpIGFsbCwNCj4+DQo+PiBBZnRlciBtZXJnaW5nIHRoZSBwb3dlcnBjLW9ianRv
b2wgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChwb3dlcnBjDQo+PiBwc2VyaWVzX2xl
X2RlZmNvbmZpZykgcHJvZHVjZWQgdGhlc2Ugd2FybmluZ3M6DQo+Pg0KPj4gYXJjaC9wb3dlcnBj
L2tlcm5lbC9oZWFkXzY0Lm86IHdhcm5pbmc6IG9ianRvb2w6IGVuZF9maXJzdF8yNTZCKCk6IA0K
Pj4gY2FuJ3QgZmluZCBzdGFydGluZyBpbnN0cnVjdGlvbg0KPj4gYXJjaC9wb3dlcnBjL2tlcm5l
bC9vcHRwcm9iZXNfaGVhZC5vOiB3YXJuaW5nOiBvYmp0b29sOiANCj4+IG9wdHByb2JlX3RlbXBs
YXRlX2VuZCgpOiBjYW4ndCBmaW5kIHN0YXJ0aW5nIGluc3RydWN0aW9uDQo+Pg0KPj4gSSBoYXZl
IG5vIGlkZWEgd2hhdCBzdGFydGVkIHRoaXMgKHRoZXkgbWF5IGhhdmUgYmVlbiB0aGVyZSB5ZXN0
ZXJkYXkpLg0KPiBJIHdhcyBhYmxlIHRvIHJlY3JlYXRlIHRoZSBhYm92ZSBtZW50aW9uZWQgd2Fy
bmluZ3Mgd2l0aCANCj4gcHNlcmllc19sZV9kZWZjb25maWcgYW5kIHBvd2VybnZfZGVmY29uZmln
LiBUaGUgcmVncmVzc2lvbiByZXBvcnQgYWxzbyANCj4gbWVudGlvbnMgYSB3YXJuaW5nIA0KPiAo
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIyMTEyODIxMDIuUVVyN0hI
clctbGtwQGludGVsLmNvbS8pIHNlZW4gd2l0aCBhcmNoL3Bvd2VycGMva2VybmVsL2t2bV9lbXVs
LlMgYXNzZW1ibHkgZmlsZS4NCj4gDQo+ICDCoFsxXSBhcmNoL3Bvd2VycGMva2VybmVsL29wdHBy
b2Jlc19oZWFkLm86IHdhcm5pbmc6IG9ianRvb2w6IA0KPiBvcHRwcm9iZV90ZW1wbGF0ZV9lbmQo
KTogY2FuJ3QgZmluZCBzdGFydGluZyBpbnN0cnVjdGlvbg0KPiAgwqBbMl0gYXJjaC9wb3dlcnBj
L2tlcm5lbC9rdm1fZW11bC5vOiB3YXJuaW5nOiBvYmp0b29sOiANCj4ga3ZtX3RlbXBsYXRlX2Vu
ZCgpOiBjYW4ndCBmaW5kIHN0YXJ0aW5nIGluc3RydWN0aW9uDQo+ICDCoFszXSBhcmNoL3Bvd2Vy
cGMva2VybmVsL2hlYWRfNjQubzogd2FybmluZzogb2JqdG9vbDogZW5kX2ZpcnN0XzI1NkIoKTog
DQo+IGNhbid0IGZpbmQgc3RhcnRpbmcgaW5zdHJ1Y3Rpb24NCj4gDQo+IFRoZSB3YXJuaW5ncyBb
MV0gYW5kIFsyXSBnbyBhd2F5IGFmdGVyIGFkZGluZyAnbm9wJyBpbnN0cnVjdGlvbi4gQmVsb3cg
DQo+IGRpZmYgZml4ZXMgaXQgZm9yIG1lOg0KDQpZb3UgaGF2ZSB0byBhZGQgTk9QcyBqdXN0IGJl
Y2F1c2UgdGhvc2UgbGFiZWxzIGFyZSBhdCB0aGUgZW5kIG9mIHRoZSANCmZpbGVzLiBUaGF0J3Mg
YSBiaXQgb2RkLg0KSSB0aGluayBlaXRoZXIgd2UgYXJlIG1pc3Npbmcgc29tZSBraW5kIG9mIGZs
YWdnaW5nIGZvciB0aGUgc3ltYm9scywgb3IgDQpvYmp0b29sIGhhcyBhIGJ1Zy4gSW4gYm90aCBj
YXNlcywgSSdtIG5vdCBzdXJlIGFkZGluZyBhbiBhcnRpZmljaWFsIA0KJ25vcCcgaXMgdGhlIHNv
bHV0aW9uLiBBdCBsZWFzdCB0aGVyZSBzaG91bGQgYmUgYSBiaWcgaGFtbWVyIHdhcm5pbmcgDQpl
eHBsYWluaW5nIHdoeS4NCg0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
b3B0cHJvYmVzX2hlYWQuUyANCj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL29wdHByb2Jlc19oZWFk
LlMNCj4gaW5kZXggY2Q0ZTdiYzMyNjA5Li5lYTRlM2JkODJmNGYgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvb3B0cHJvYmVzX2hlYWQuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL29wdHByb2Jlc19oZWFkLlMNCj4gQEAgLTEzNCwzICsxMzQsNCBAQCBvcHRwcm9iZV90
ZW1wbGF0ZV9yZXQ6DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqAgLmdsb2JhbCBvcHRwcm9iZV90ZW1w
bGF0ZV9lbmQNCj4gIMKgb3B0cHJvYmVfdGVtcGxhdGVfZW5kOg0KPiArwqDCoMKgwqDCoMKgIG5v
cA0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwva3ZtX2VtdWwuUyANCj4g
Yi9hcmNoL3Bvd2VycGMva2VybmVsL2t2bV9lbXVsLlMNCj4gaW5kZXggN2FmNmY4YjUwYzVkLi40
MWZkNjY0ZTNiYTAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwva3ZtX2VtdWwu
Uw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2t2bV9lbXVsLlMNCj4gQEAgLTM1MiwzICsz
NTIsNCBAQCBrdm1fdG1wX2VuZDoNCj4gDQo+ICDCoC5nbG9iYWwga3ZtX3RlbXBsYXRlX2VuZA0K
PiAgwqBrdm1fdGVtcGxhdGVfZW5kOg0KPiArwqDCoMKgwqDCoMKgIG5vcA0KPiANCj4gRm9yIHdh
cm5pbmcgWzNdLCBvYmp0b29sIGlzIHRocm93aW5nIGNhbid0IGZpbmQgc3RhcnRpbmcgaW5zdHJ1
Y3Rpb24gDQo+IHdhcm5pbmcgYmVjYXVzZSBpdCBmaW5kcyB0aGF0IHRoZSBzeW1ib2wgKGVuZF9m
aXJzdF8yNTZCKSBpcyB6ZXJvIHNpemVkLCANCj4gYW5kIHN1Y2ggc3ltYm9scyBhcmUgbm90IGFk
ZGVkIHRvIHRoZSByYnRyZWUuIEkgdHJpZWQgdG8gZml4IGl0IGJ5IA0KPiBhZGRpbmcgYSAnbm9w
JyBpbnN0cnVjdGlvbiAocGFzdGVkIGRpZmYgYmVsb3cpLCBidXQgdGhhdCByZXN1bHRlZCBpbiBh
IA0KPiBrZXJuZWwgYnVpbGQgZmFpbHVyZS4NCg0KV2hhdCdzIHRoZSBmYWlsdXJlID8NCg0KDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzY0LlMgYi9hcmNoL3Bv
d2VycGMva2VybmVsL2hlYWRfNjQuUw0KPiBpbmRleCA4NzRlZmQyNWNjNDUuLmQ0ODg1MGZlMTU5
ZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzY0LlMNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzY0LlMNCj4gQEAgLTE5Miw2ICsxOTIsNyBAQCBfX3Nl
Y29uZGFyeV9ob2xkOg0KPiAgwqDCoMKgwqDCoMKgwqAgRU1JVF9CVUdfRU5UUlkgMGIsIF9fRklM
RV9fLCBfX0xJTkVfXywgMA0KPiAgwqAjZW5kaWYNCj4gIMKgQ0xPU0VfRklYRURfU0VDVElPTihm
aXJzdF8yNTZCKQ0KPiArbm9wDQo+IA0KPiAgwqAvKg0KPiAgwqAgKiBPbiBzZXJ2ZXIsIHdlIGlu
Y2x1ZGUgdGhlIGV4Y2VwdGlvbiB2ZWN0b3JzIGNvZGUgaGVyZSBhcyBpdA0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NHMuUyANCj4gYi9hcmNoL3Bv
d2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMNCj4gaW5kZXggMjZmOGZlZjUzYzcyLi5mNzUx
N2Q0NDNlOWIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02
NHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMNCj4gQEAg
LTMxMDQsOSArMzEwNCwxMyBAQCBfX2VuZF9pbnRlcnJ1cHRzOg0KPiAgwqBERUZJTkVfRklYRURf
U1lNQk9MKF9fZW5kX2ludGVycnVwdHMsIHZpcnRfdHJhbXBvbGluZXMpDQo+IA0KPiAgwqBDTE9T
RV9GSVhFRF9TRUNUSU9OKHJlYWxfdmVjdG9ycyk7DQo+ICtub3ANCj4gIMKgQ0xPU0VfRklYRURf
U0VDVElPTihyZWFsX3RyYW1wb2xpbmVzKTsNCj4gK25vcA0KPiAgwqBDTE9TRV9GSVhFRF9TRUNU
SU9OKHZpcnRfdmVjdG9ycyk7DQo+ICtub3ANCj4gIMKgQ0xPU0VfRklYRURfU0VDVElPTih2aXJ0
X3RyYW1wb2xpbmVzKTsNCj4gK25vcA0KDQpXaGF0IGFyZSB0aGUgTk9QcyBhZnRlciB0aGUgQ0xP
U0VfRklYRURfU0VDVElPTigpID8gWW91IGRvbid0IGV4cGxhaW4gDQp0aGVtLCBhbmQgSSBjYW4n
dCBzZWUgYW55IHJlbGF0ZWQgd2FybmluZyBpbiB0aGUgd2FybmluZ3MgeW91IHNob3cuDQoNCg0K
DQo+IA0KPiAgwqBVU0VfVEVYVF9TRUNUSU9OKCkNCj4gDQo+IEknbSBub3QgdmVyeSBzdXJlIG9u
IGhvdyB0byBhZGRyZXNzIHRoaXMgcGFydGljdWxhciB3YXJuaW5nIA0KPiAoYXJjaC9wb3dlcnBj
L2tlcm5lbC9oZWFkXzY0Lm86IHdhcm5pbmc6IG9ianRvb2w6IGVuZF9maXJzdF8yNTZCKCk6IA0K
PiBjYW4ndCBmaW5kIHN0YXJ0aW5nIGluc3RydWN0aW9uKS4gR2l2ZW4gdGhhdCB0aGVyZSBhcmUg
bm8gY2FsbHMgdG8gDQo+IF9tY291bnQsIG9uZSB3b3JrYXJvdW5kIGlzIHRvIHNraXAgb2JqdG9v
bCBmcm9tIHJ1bm5pbmcgb24gDQo+IGFyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF82NC5vIGZpbGUu
IFRoZSBiZWxvdyBkaWZmIHdvcmtzIGZvciBtZToNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMva2VybmVsL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZQ0KPiBp
bmRleCA5YjYxNDYwNTZlNDguLjllZjZhMDQwZDg3NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxl
DQo+IEBAIC0yMTksMyArMjE5LDUgQEAgJChvYmopL3Zkc282NF93cmFwcGVyLm8gOiAkKG9iaikv
dmRzby92ZHNvNjQuc28uZGJnDQo+IA0KPiAgwqAjIGZvciBjbGVhbmluZw0KPiAgwqBzdWJkaXIt
ICs9IHZkc28NCj4gKw0KPiArT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRF9oZWFkXzY0Lm8gOj0g
eQ0KDQpNaWdodCBiZSB0aGUgc29sdXRpb24sIGFsbHRob3VnaCBJIGNhbid0IHNlZSBvdGhlciBh
cmNoaXRlY3R1cmVzIGRvaW5nIHRoYXQuDQoNCj4gDQo+IA0KPiBUaGFua3MsDQo+IFNhdGh2aWth
DQoNCkNocmlzdG9waGUNCg==
