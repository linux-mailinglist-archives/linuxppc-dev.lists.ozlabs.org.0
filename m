Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1878E5C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:34:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ho6ggnMg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbqbC4k1tz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 15:33:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ho6ggnMg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::616; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbqZG4sw7z2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:33:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOa+l1rVXamne+OJ+de7RGdrILVVEDh727Jpp2iPIfNM05S7kV3eV2EQhSFkXuduFDCt3tWuDBTONYkKWQho/Z49SvYqUy+aVmY/FiRY3qW+k4+TxZiDuWdHud1rHyEqBCTJHJgGJORHjxrR0A18p5JRIkdKbEyU9csqJMtypDOolj4KMAaDo9iEKLhPEe5l5n15/bXMBq8Tb7xd1bVeMFmjSWWQlj8YdS8+gvE/qn51oVZmqMo1BatPhUcfpgd2fSOlXQ8lsolkLSDJYzpEXeBAIuWPKtuOlyVCNkiN8Ld9OQuMQOuYvkBUVXe33cUeIgPdQdK+dCDy/ynf5MVi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCG6r+QNDs2oD7Eiz9L15LnlWFxOcDUAngsg5w3RdQY=;
 b=lWKylNNdQKOuY5IgAti7TrLGnfk9+14qPTQRwFYlodEeh6ALlJXhBAKLNsrVtTWNZVgkasWISZr7LfWp8qtm1fi/OPIQdtwtWoKVwyzq4hDpYv6EiBFrh4lETuJMBUD0m2hj5o7h75SE5kh2f68Q65vo7oBd0TfAl5iJM7BQkV4t97cYI1S/+QuFjAz7Tapmj/EcE6PLDRG+ViM+UXqE8SANbA9vShylZpSog/JW2RuFt9grJWK0aotBZa6FhaccyaNYE8TlR4HKrgSo6eAZ6jt+wHujJGUVvPqY1wYVj0ep+i9HNYrxs1s8BTXCmh1Swn2puZo9mMMIi5andzYPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCG6r+QNDs2oD7Eiz9L15LnlWFxOcDUAngsg5w3RdQY=;
 b=ho6ggnMgss1RaREciaz/hDIXHdO2CxJ1wPig4Th+dXzVxSsW3E29DyfThR0G4nt3xvPbWOzrCE9Rdklm7DvKh1uCttdC4YFu8X+oDCovBjqs1XqdrpWsXHMickLnIyyKQ3g/uILRKsKpGKqrI0dExBcg/RSwubzN/W4vOVczhSyU52oE1KU1iUDC1UCKNWxIKvx5Py+7d+XH5jxtXLQf8g4w8Fr0Fcg7D7Yzw8z9DKTP0uiSzBjyvA5biyIfxVpHIfeso2MI+6ALdNCA8MLW6WaX7Z3miH+w+AVTw6qPdR2Dhh/X93z9taVn82Yf7Hrjl65vUkMc04E/UkqhzP0grg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1981.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 05:32:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 05:32:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftAA=
Date: Thu, 31 Aug 2023 05:32:46 +0000
Message-ID: <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
In-Reply-To: <20230828011758.3b7b9daf@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1981:EE_
x-ms-office365-filtering-correlation-id: d628054d-2bfa-463f-8751-08dba9e3b4f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6DfFkri25VpDvSHqXtDfcVnuRSMmNzOdyYjx84ZgGz0j/xuq93Pf+M8lFSim9yIMUs0Ib4x1hZJmnPC1IhLCYKGJwbyhCdWL4zg6K3dydoiGiv5odcQ8IH9scFAKLIumW2sIGSZOKPBXJbOARsaf8mrqlp+XRgxA4dxtwKKpQITHaeqvAJUH6FfLjqBMMXL+/qg2VABI8DBCviDxt66sZ7B5C48CaaX9qd4hqdslCVVMaYrz43FSdsNjwzp1U+FtUKWCQFHCSNgyAKinmt+JF78K77wmLFw1ZZSMNTC3qMFJFVRqa7/96AhSiQh34zM/PFh7uh5nboVo+rOaQQULkOslqNeWKlP8evmsEkodokue+JRzodkgak3wV2adlRfyL2Ft5SD1/JVwe6hYPhZz5/kCOIlvQJiO7jllunoR1MyB+UrE7CrUqw15OkUA+fDMqS7hMj4S+z2B5jNnjPTRSnjwiN2jHPhV4HSYPr5M17z/ZFJc66citn5Gx2XwablHXUp3Vo6uyKqbWOSmWD2DOVz59L0XJa1qSjL+TeUHwoJdUuQcHw5h+DvnX34IgQIEZaJWIhl3m32F8qQ9XZ1XJXR5RSGJZyL2lvu97rAcIyMegwWGCTSv+QW3OOnNU1ibPKHNp+/oCS0Z0zuh4NE/UhTHVqwj3o0kqtioHekJ2SazrKyKX4msXO4cAERppqF9
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39850400004)(186009)(1800799009)(451199024)(31686004)(6486002)(71200400001)(6512007)(6506007)(36756003)(31696002)(122000001)(38070700005)(38100700002)(86362001)(2616005)(66574015)(2906002)(26005)(19627235002)(83380400001)(45080400002)(478600001)(110136005)(91956017)(76116006)(66556008)(44832011)(66946007)(8676002)(8936002)(4326008)(5660300002)(41300700001)(316002)(66446008)(64756008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWJmMSswV3hXeFJUQkJzL0JkMDFQSFM3MmdrVEFTditoUUIvSkJOT25QbElp?=
 =?utf-8?B?WVA1MEp6TWZlNWIvRG83UnFMaXpBbHZ3RCtNaVN0ZXF4M0ZDb3YzTG5mbkRH?=
 =?utf-8?B?cExoWHZMMngzRE5uQ2d2cXVzeDZmZkJocTR4RVkwZW9rcHM5VWt6V0h6aVRF?=
 =?utf-8?B?cHJRTHNFM3VPUTVXU0N5WkFPTjN6bXh6R1VPS2lwYWVPUFZqdVE2aVBURXcw?=
 =?utf-8?B?WUtlMlkxb1Y2c2gzMHNUL2dsVGNneWI3b29NMERUUnZrQjV4OCtreGZobXBT?=
 =?utf-8?B?N1k2ZFZPU0ZJYmtubDFYcU5WV1RKdjI5K1ZoeWUzbnhxeFhrQnpMV1hZQnRm?=
 =?utf-8?B?TW5lbm82L3N2LzNvMHFCcTV2RDdhOVRnMFpScmFrTTlPd3JoTW94R2EwZGkw?=
 =?utf-8?B?K01CRTREWnF5Vm9CTGw3ZkxkaENVUm9CTEhEUXhaelZtNjlza2tQVUxLM0hl?=
 =?utf-8?B?akVrOXkzSk5YZUJWQ0JhbGk3dzdYaXcwZVNzQjhEcmx4dXBSbFdnNld6WlZL?=
 =?utf-8?B?aWxBcnExcEJWSzZyUmlnYThpa2ZSWjU4TlJ0Z3VYZzlCT1dMK0p0M2ZXeWc0?=
 =?utf-8?B?VjBJa29wTnd3NTBxWngwN0NhRFNQcGpqcEJXQlFBcm94OGhyaFhuWEFHaXh2?=
 =?utf-8?B?Yk1wSXA2aEdXVlk1b1RoVHE2UlJUTVFmVFNCUmRiOHhBVVdFVFlaR3pDcmZa?=
 =?utf-8?B?RVVJeHlRdEI0bksxNXJ6NGVxclF2V2xYWFNBK2NibTlSSjMwT3ZWUGM0bDJl?=
 =?utf-8?B?VWg4aDZLcjZNdXYyK2JCWUpOazVtTkh2V0VlN0lQOGp6bkhxeE8wUEYvZ2h2?=
 =?utf-8?B?SnVGbEdWOUYxdHZNbUhlWFBGZTBuWUlva3VaQVEvRTY1dEYxN1ByVEJ0bzNw?=
 =?utf-8?B?Q0diQnUzMkF2TWxTNk1jZVZpdmxBdjFIc0g4VkpOMkJMc0xsaVRYNzA0cTZy?=
 =?utf-8?B?TXhBRDVDMjd2T0NtY1JuTlJPWFlJQ1lZUTVlRzF3REgwT0p4dHIxK3NhWXp4?=
 =?utf-8?B?Nkh4RVFzMFlVSzdocHpYMFB6SmYrTWVyZGRSdmZibnpqVVJhOXd1OXRqbWd2?=
 =?utf-8?B?U01PaXUvc3FQcHpKcFRHMzBKOGQwM2FiUGRSK0p5bVcveFpHRzRCcmM2Mzgw?=
 =?utf-8?B?S2pPM1QxRTNJd3FSVVgwZUE3a3ZBMkdJcGttSWpTZlBlZ3k1WkZacGpTWlBK?=
 =?utf-8?B?dkNSLzc4Q0t1bUNudENVYTRlUVpMRi9FNlg1bjhNeGYyZHl4WVJBazBMQ0di?=
 =?utf-8?B?STdvZHFzaWh5R1ROWWhhQjhBMXJRODhjdWdPZHBabExndmo3c2ljMTJUVkhS?=
 =?utf-8?B?cnpRcDFsSFVHcG14VVUwVU9Pa3A1UVVzWDhSUTMwYWlFYnI5TXRmbGRpWVlQ?=
 =?utf-8?B?MHJQNHRqVFgxaExiZXplMTljNGdudFI5SlFSTmJMUklkN2NVWDNBOHpLcnZk?=
 =?utf-8?B?Uk9KM051c0RIN3E2dFloWVVZS2ZWTCt1blhXVFE3Y0xzM3oyclFhdE5xRGl0?=
 =?utf-8?B?b1RiNUQ0d3pwQ3NWS2J1eFN1akdncG9PeDlJb3RrS2V1Z0xWckk4YmtBdm5J?=
 =?utf-8?B?TzVKcjZHTmtKWnNXQVJuNnZhamd5U2hIbnlON1RBSkR6cWxDWVorbVl5Wm9E?=
 =?utf-8?B?Q3hCMUZLbjFhT1RTMEhaSlIwYmdlblRhNlQ5M2huYS9jV0hJcUhYWGhQL0tX?=
 =?utf-8?B?c29RVGg5MVFiTjBGMzViVFZ1MkpPSFFYTUQzNHA2czZCY292MXQvemxSWUFG?=
 =?utf-8?B?aEVGZ1Ard0FCQXRrQTlnVHlCY0FmZkx3bXRON2kwdHY0bWsrRUx0TlBiU05k?=
 =?utf-8?B?bFJRTUkzUER6d3RLUUprdUgyUkV1V2syaXk5MEdCMC9Ycmk5S3A0SlRnMVFx?=
 =?utf-8?B?cUdGTjE1RHZrdmtQaFRSMm9rcTdFUTFMNGF4dDRFNnlRRVVmbzd3TXlFSk0y?=
 =?utf-8?B?RituQjJuSVFVTjdyVm9FeFpNSitoOTI0aHZ2Unc2OGgrVWc2VDV0ejhkRjU4?=
 =?utf-8?B?b1RFbHRKNGxabzMvQ00vNGRXZW5oN3dMUHJtWldSQW9vaFpXeWFvSmsxU1Ez?=
 =?utf-8?B?Vnk1YTJlMTAxVmdDWFB3Qm9jVkt6MXVhSVFtUDNHSy91aFV1Rk5SbTNrdy9E?=
 =?utf-8?B?bW52V0l5dDh5SVcvY01XSy9ObEdENTNPY200UktkNVVqMW94ZDhIYXRMbFha?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD97141F01FBA94D9250814DC20D22DF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d628054d-2bfa-463f-8751-08dba9e3b4f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 05:32:46.1828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6D12oywBC4dkbslRhJIt7WYYF4z8xAt15CES33+SRhjeUqw463aR9TsC0O+8tGqVAsFHQr8/wFdWyUcdcyC4x/IlpBgW6z3m7WmNAwkYDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1981
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

DQoNCkxlIDI4LzA4LzIwMjMgw6AgMDE6MTcsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjQgQXVnIDIwMjMgMjE6MzY6MjYgKzEwMDANCj4gTWljaGFlbCBFbGxlcm1hbiA8
bXBlQGVsbGVybWFuLmlkLmF1PiB3cm90ZToNCj4gDQo+Pj4gcHJpbnRrOiBib290Y29uc29sZSBb
dWRiZzBdIGVuYWJsZWQNCj4+PiBUb3RhbCBtZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBm
b3IgaGFzaCB0YWJsZQ0KPj4+IG1hcGluX3JhbToxMjUNCj4+PiBtbXVfbWFwaW5fcmFtOjE2OSAw
IDMwMDAwMDAwIDE0MDAwMDAgMjAwMDAwMA0KPj4+IF9fbW11X21hcGluX3JhbToxNDYgMCAxNDAw
MDAwDQo+Pj4gX19tbXVfbWFwaW5fcmFtOjE1NSAxNDAwMDAwDQo+Pj4gX19tbXVfbWFwaW5fcmFt
OjE0NiAxNDAwMDAwIDMwMDAwMDAwDQo+Pj4gX19tbXVfbWFwaW5fcmFtOjE1NSAyMDAwMDAwMA0K
Pj4+IF9fbWFwaW5fcmFtX2NodW5rOjEwNyAyMDAwMDAwMCAzMDAwMDAwMA0KPj4+IF9fbWFwaW5f
cmFtX2NodW5rOjExNw0KPj4+IG1hcGluX3JhbToxMzQNCj4+PiBrYXNhbl9tbXVfaW5pdDoxMjkN
Cj4+PiBrYXNhbl9tbXVfaW5pdDoxMzIgMA0KPj4+IGthc2FuX21tdV9pbml0OjEzNw0KPj4+IGlv
cmVtYXAoKSBjYWxsZWQgZWFybHkgZnJvbSBidGV4dF9tYXArMHg2NC8weGRjLiBVc2UgZWFybHlf
aW9yZW1hcCgpIGluc3RlYWQNCj4+PiBMaW51eCB2ZXJzaW9uIDYuNS4wLXJjNy1QTWFjRzQtZGly
dHkgKHJvb3RAVDEwMDApIChnY2MgKEdlbnRvbyAxMi4zLjFfcDIwMjMwNTI2IHAyKSAxMi4zLjEg
MjAyMzA1MjYsIEdOVSBsZCAoR2VudG9vIDIuNDAgcDcpIDIuNDAuMCkgIzQgU01QIFdlZCBBdWcg
MjMgMTI6NTk6MTEgQ0VTVCAyMDIzDQo+Pj4NCj4+PiB3aGljaCBzaG93cyBvbmUgbGluZSAoTGlu
dXggdmVyc2lvbi4uLikgbW9yZSB0aGFuIGJlZm9yZS4gTW9zdCBvZiB0aGUgdGltZSBJIGdldCB0
aGlzIG1vcmUgaW50ZXJlc3Rpbmcgb3V0cHV0IGhvd2V2ZXI6DQo+Pj4NCj4+PiBrYXNhbl9tbXVf
aW5pdDoxMjkNCj4+PiBrYXNhbl9tbXVfaW5pdDoxMzIgMA0KPj4+IGthc2FuX21tdV9pbml0OjEz
Nw0KPj4+IExpbnV4IHZlcnNpb24gNi41LjAtcmM3LVBNYWNHNC1kaXJ0eSAocm9vdEBUMTAwMCkg
KGdjYyAoR2VudG9vIDEyLjMuMV9wMjAyMzA1MjYgcDIpIDEyLjMuMSAyMDIzMDUyNiwgR05VIGxk
IChHZW50b28gMi40MCBwNykgMi40MC4wKSAjNCBTTVAgV2VkIEF1ZyAyMyAxMjo1OToxMSBDRVNU
IDIwMjMNCj4+PiBLQVNBTiBpbml0IGRvbmUNCj4+PiBsaXN0X2FkZCBjb3JydXB0aW9uLiBwcmV2
LT5uZXh0IHNob3VsZCBiZSBuZXh0IChjMTcxMDBjMCksIGJ1dCB3YXMgMmMwMzAwMDAuIChwcmV2
PWMwMzZhYzdjKS4NCj4+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4+
PiBrZXJuZWwgQlVHIGF0IGxpYi9saXN0X2RlYnVnLmM6MzAhDQo+Pj4gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+Pj4gV0FSTklORzogQ1BVOiAwIFBJRDogMCBhdCBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vbWFjaGRlcC5oOjIyNyBkaWUrMHhkOC8weDM5Yw0KPj4NCj4+
IFRoaXMgaXMgYSBXQVJOIGhpdCB3aGlsZSBoYW5kbGluZyB0aGUgb3JpZ2luYWwgYnVnLg0KPj4N
Cj4+IENhbiB5b3UgYXBwbHkgdGhpcyBwYXRjaCB0byBhdm9pZCB0aGF0IGhhcHBlbmluZywgc28g
d2UgY2FuIHNlZSB0aGUNCj4+IG9yaWdpbmFsIGJ1dCBiZXR0ZXIuDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJh
cHMuYw0KPj4gaW5kZXggZWVmZjEzNmI4M2Q5Li4zNDFhMDYzNWUxMzEgMTAwNjQ0DQo+PiAtLS0g
YS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdHJhcHMuYw0KPj4gQEAgLTE5OCw4ICsxOTgsNiBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBv
b3BzX2JlZ2luKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPj4gICAJZGllX293bmVyID0gY3B1Ow0K
Pj4gICAJY29uc29sZV92ZXJib3NlKCk7DQo+PiAgIAlidXN0X3NwaW5sb2NrcygxKTsNCj4+IC0J
aWYgKG1hY2hpbmVfaXMocG93ZXJtYWMpKQ0KPj4gLQkJcG1hY19iYWNrbGlnaHRfdW5ibGFuaygp
Ow0KPj4gICAJcmV0dXJuIGZsYWdzOw0KPj4gICB9DQo+PiAgIE5PS1BST0JFX1NZTUJPTChvb3Bz
X2JlZ2luKTsNCj4+DQo+Pg0KPj4gY2hlZXJzDQo+IA0KPiBPaywgc28gSSB0ZXN0ZWQgbm93Og0K
PiAgICAgUmVwbGFjZSBidGV4dF91bm1hcCgpIHdpdGggYnRleHRfbWFwKCkgYXQgdGhlIGVuZCBv
ZiBNTVVfaW5pdCgpICsgTWljaGFlbHMgcGF0Y2guDQo+IA0KPiBXaXRoIHRoZSBwYXRjaCBJIGdl
dCBpbnRlcmVzdGluZyBvdXRwdXQgbGVzcyBvZnRlbiwgYnV0IHdoZW4gSSBkbyBpdCdzOg0KPiAN
Cj4gcHJpbnRrOiBib290Y29uc29sZSBbdWRiZzBdIGVuYWJsZWQNCj4gVG90YWwgbWVtb3J5ID0g
MjA0OE1COyB1c2luZyA0MDk2a0IgZm9yIGhhc2ggdGFibGUNCj4gbWFwaW5fcmFtOjEyNQ0KPiBt
bXVfbWFwaW5fcmFtOjE2OSAwIDMwMDAwMDAwIDE0MDAwMDAgMjAwMDAwMA0KPiBfX21tdV9tYXBp
bl9yYW06MTQ2IDAgMTQwMDAwMA0KPiBfX21tdV9tYXBpbl9yYW06MTU1IDE0MDAwMDANCj4gX19t
bXVfbWFwaW5fcmFtOjE0NiAxNDAwMDAwIDMwMDAwMDAwDQo+IF9fbW11X21hcGluX3JhbToxNTUg
MjAwMDAwMDANCj4gX19tYXBpbl9yYW1fY2h1bms6MTA3IDIwMDAwMDAwIDMwMDAwMDAwDQo+IF9f
bWFwaW5fcmFtX2NodW5rOjExNw0KPiBtYXBpbl9yYW06MTM0DQo+IGthc2FuX21tdV9pbml0OjEy
OQ0KPiBrYXNhbl9tbXVfaW5pdDoxMzIgMA0KPiBrYXNhbl9tbXVfaW5pdDoxMzcNCj4gTGludXgg
dmVyc2lvbiA2LjUuMC1yYzctUE1hY0c0LWRpcnR5IChyb290QFQxMDAwKSAoZ2NjIChHZW50b28g
MTIuMy4xX3AyMDIzMDUyNiBwMikgMTIuMy4xIDIwMjMwNTI2LCBHTlUgbGQgKEdlbnRvbyAyLjQw
IHA3KSAyLjQwLjApICM0IFNNUCBXZWQgQXVnIDIzIDEyOjU5OjExIENFU1QgMjAyMw0KPiBLQVNB
TiBpbml0IGRvbmUNCj4gQlVHOiBzcGlubG9jayBiYWQgbWFnaWMgb24gQ1BVIzAsIHN3YXBwZXIv
MA0KPiAgIGxvY2s6IDB4YzE2Y2JjNjAsIC5tYWdpYzogYzAzNmFiODQsIC5vd25lcjogPG5vbmU+
Ly0xLCAub3duZXJfY3B1OiAtMQ0KPiBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIgVGFpbnRl
ZDogRyAgICAgICAgICAgICAgICBUIHh4eHh4eHh4eHh4DQo+IENhbGwgVHJhY2U6DQo+IFtjMTcx
N2MyMF0gW2MwZjRlMjg4XSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4YTQgKHVucmVsaWFibGUpDQo+
IFtjMTcxN2M0MF0gW2MwMTA2NWU4XSBkb19yYXdfc3Bpbl9sb2NrKzB4MTVjLzB4MWE4DQo+IFtj
MTcxN2M3MF0gW2MwZmEzODkwXSBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4MjAvMHg0MA0KPiBb
YzE3MTdjOTBdIFtjMGMxNDBlY10gb2ZfZmluZF9wcm9wZXJ0eSsweDNjLzB4MTQwDQo+IFtjMTcx
N2NjMF0gW2MwYzE0MjA0XSBvZl9nZXRfcHJvcGVydHkrMHgxNC8weDRjDQo+IFtjMTcxN2NlMF0g
W2MwYzIyYzZjXSB1bmxhdHRlbl9kdF9ub2RlcysweDc2Yy8weDg5NA0KPiBbYzE3MTdmMTBdIFtj
MGMyMmU4OF0gX191bmZsYXR0ZW5fZGV2aWNlX3RyZWUrMHhmNC8weDI0NA0KPiBbYzE3MTdmNTBd
IFtjMTQ1ODA1MF0gdW5mbGF0dGVuX2RldmljZV90cmVlKzB4NDgvMHg4NA0KPiBbYzE3MTdmNzBd
IFtjMTQwYjEwMF0gc2V0dXBfYXJjaCsweDc4LzB4NDRjDQo+IFtjMTcxN2ZjMF0gW2MxNDA0NWI4
XSBzdGFydF9rZXJuZWwrMHg3OC8weDJkOA0KPiBbYzE3MTdmZjBdIFswMDAwMzVkMF0gMHgzNWQw
DQoNCk9rIHNvIHRoZXJlIGlzIHNvbWUgY29ycnVwdGVkIG1lbW9yeSBzb21ld2hlcmUuDQoNCkNh
biB5b3UgdHJ5IHdoYXQgaGFwcGVucyB3aGVuIHlvdSByZW1vdmUgdGhlIGNhbGwgdG8ga2FzYW5f
aW5pdCgpIGF0IHRoZSANCnN0YXJ0IG9mIHNldHVwX2FyY2goKSBpbiBhcmNoL3Bvd2VycGMva2Vy
bmVsL3NldHVwLWNvbW1vbi5jDQoNCkknZCBhbHNvIGJlIGN1cmlvdXMgdG8ga25vdyB3aGF0IGhh
cHBlbnMgd2hlbiBDT05GSUdfREVCVUdfU1BJTkxPQ0sgaXMgDQpkaXNhYmxlZC4NCg0KDQpBbm90
aGVyIHF1ZXN0aW9uIHdoaWNoIEknbSBubyBzdXJlIEkgYXNrZWQgYWxyZWFkeTogSXMgaXQgYSBu
ZXcgcHJvYmxlbSANCnlvdSBoYXZlIGdvdCB3aXRoIHJlY2VudCBrZXJuZWxzIG9yIGlzIGl0IGp1
c3QgdGhhdCB5b3UgbmV2ZXIgdHJpZWQgc3VjaCANCmEgY29uZmlnIHdpdGggb2xkZXIga2VybmVs
cyA/DQoNCkFsc28sIHdoZW4geW91IHNheSB5b3UgbmVlZCB0byBzdGFydCB3aXRoIGFub3RoZXIg
U01QIGtlcm5lbCBmaXJzdCBhbmQgDQp0aGVuIHlvdSBkb24ndCBoYXZlIHRoZSBwcm9ibGVtIGFu
eW1vcmUgdW50aWwgdGhlIG5leHQgY29sZCByZWJvb3QsIGRvIA0KeW91IG1lYW4geW91IGhhdmUg
c29tZSBvbGQga2VybmVsIHdpdGggS0FTQU4gdGhhdCB3b3Jrcywgb3IgaXMgaXQgYSANCmtlcm5l
bCB3aXRob3V0IEtBU0FOIHRoYXQgeW91IGhhdmUgdG8gc3RhcnQgZmlyc3QgPw0KDQpUaGFua3MN
CkNocmlzdG9waGUNCg0KPiANCj4gDQo+IGFuZCB0aGVuIHRoZSBmcmVlemUuIE9yIGxlc3Mgb2Z0
ZW4gSSBnZXQ6DQo+IA0KPiBbLi4uXQ0KPiBNb2R1bGVzIGxpbmtlZCBpbjogX3ZhcmlvdXMgQVND
SUkgY2hhcnNfIHwoRUspIF92YXJpb3VzIEFTQ0lJIGNoYXJzXyDCpz0oRUtUTikNCj4gQlVHOiBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBkYXRhIGFjY2VzcyBvbiByZWFkIGF0IDB4ODEzZjAyMDAN
Cj4gRmF1bHRpbmcgaW5zdHJ1Y3Rpb24gYWRkcmVzczogMHhjMDE0ZTQ0NA0KPiBUaHJlYWQgb3Zl
cnJhbiBzdGFjaywgb3Igc3RhY2sgY29ycnVwdGVkDQo+IE9vcHM6IEtlcm5lbCBhY2Nlc3Mgb2Yg
YmFkIGFyZWEsIHNpZzogMTEgWyMzNTQ0XQ0KPiBCRSBQQUdFX1NJWkU9NEsgTU1VPUhhc2ggU01Q
IE5SX0NQVVM9Mg0KPiBNb2R1bGVzIGxpbmtlZCBpbjogX3ZhcmlvdXMgQVNDSUkgY2hhcnNfIMKn
PShFS1ROKQ0KPiBCVUc6IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIGRhdGEgYWNjZXNzIG9uIHJl
YWQgYXQgMHg4MTNmMDIwMA0KPiBGYXVsdGluZyBpbnN0cnVjdGlvbiBhZGRyZXNzOiAweGMwMTRl
NDQ0DQo+IFRocmVhZCBvdmVycmFuIHN0YWNrLCBvciBzdGFjayBjb3JydXB0ZWQNCj4gT29wczog
S2VybmVsIGFjY2VzcyBvZiBiYWQgYXJlYSwgc2lnOiAxMSBbIzM1NDVdDQo+IEJFIFBBR0VfU0la
RT00SyBNTVU9SGFzaCBTTVAgTlJfQ1BVUz0yDQo+IA0KPiANCj4gTnVtYmVyIGFmdGVyICJzaWc6
IDExIiBnZXRzIGNvdW50ZWQgdXAgcmFwaWRseSB0byAjMzU0NSBzbyBJIGNhbid0IGZvbGxvdyB0
aGUgb3V0cHV0IG9uIHRoZSBPRiBjb25zb2xlLiBSZW1haW5pbmcgb3V0cHV0IG9uIHNjcmVlbiBi
ZWZvcmUgdGhlIGZyZWV6ZSBhcmUgWyMzNTM1XSB0byBbIzM1NDVdIGJ1dCBhcGFydCBmcm9tIHRo
ZSBudW1iZXJzIHRoZSBhZHJlc3NlcyBpbiB0aGlzIG91dHB1dCBkbyBub3QgY2hhbmdlLiBfdmFy
aW91cyBBU0NJSSBjaGFyc18gaW4gdGhlICJNb2R1bGVzIGxpbmtlZCBpbjoiIHN0YXkgdGhlIHNh
bWUgYnV0IGFyZSBzcGVjaWFsIGNoYXJhY3RlcnMgc28gaGFyZCB0byB0cmFuc2NyaWJlLg0KPiAN
Cj4gSG9wZSB0aGF0IGhlbHBzLg0KPiANCj4gUmVnYXJkcywNCj4gRXJoYXJkDQo=
