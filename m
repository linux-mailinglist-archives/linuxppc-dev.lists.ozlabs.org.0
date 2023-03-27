Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F46CA162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 12:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlTXy52sMz3cJG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:28:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=P/HNz0Bn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::611; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=P/HNz0Bn;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlTWz0p51z3c34
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 21:27:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbhkUqg/6O6HXWczbsYgaT5s2pBTEGIofn/xZEk6NI4l7XbP4n83zJf+ogYfUZsqLfOYR5ta8uY3rbcjstSHQY7DUpCKBVxruNGdSCWpElt+atVcIHyZyCvvMbsulyLqMvg2YL0bmUZiE6/sEGCDgV1doCNCk5OXRT1RrhB/P5gGHD1hoj8a4qSX147R4o2TJ81vVUie3pNjBEW/pKpdBJcThpbJrB8+gr/RgMDzan6gzXmPmRPZOFW8FNu3JU4vx1+ovNBrc9W12kbOzieCOSMso9DUcLzTiZ17kP1M74caUwU898ysW+Q5mQx4y+g3gBIaxA9AwcrXWL/nnYypWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j75aBlQPF2nHxRG+60Q9ss7ZdZF+76V0hpsx6cKsCMw=;
 b=SrR5ZMbK5Ba/6nFniMmgPNIqlbMgqfvkbTjoH2iaSJn2ZGEoAfSTYoBnU5/cP+FkGMx3M8BuFBE6eMO1K7BUVCxV2NIhEI+xXZkWrviZ/EyyGQYqgxHEr5Dbi2f0Xg8G4JP7UkFw3pqmF6yiz4l3+Lhq9O4tQ/FHxQhkYhEReWxTk1fJsMLxlTBM7Aktw7iVPTYJDeE0NvrtE+qnWGl/Z5sdEkF7EGc1QjQGu0eVdQy1t41QAeYKwuNEqdDTtadXxNspcrq/rQSnpmAyfoGmnU0mkyDenuWeZNFD+tYCVuI6MjuiYx5g9/Y8jg8G/tBvD9gDHHPzPOLtrLwoEE0MGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j75aBlQPF2nHxRG+60Q9ss7ZdZF+76V0hpsx6cKsCMw=;
 b=P/HNz0BnimstbpQIlnqtfmrg2+MWvl54vTUvUdF8g0XO3fn+hCuLw7E3bHcmHHv7LK7dk2dwVmM+pL0JHoU3M39h8rG3yrs+HPcDjlK6pxs9Ho4Of+I61XFCOL1erybUZES0kx34kOQqbcBBBS2ZmxHm7pTAObOmyqpZAvZxJVilABEMiIhHKmjRZyxX2OT/rp6wIGVxBgctTznUmRAbBJMjbA+zpwoAhb6H+Xuk/Drg/qWeh6qj0It4Y9i5/ATfxTqhSea0QTpR/urObd4vJwHSK1xCFPUJ1dNFluR+PbrggYJcV2BRRg6fyg/+eZUEMTnoZVW3vxz5O8lxIJrTSA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1910.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 10:26:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%5]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 10:26:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Thread-Topic: [PATCH] powerpc: don't try to copy ppc for task with NULL
 pt_regs
Thread-Index: AQHZYDCsztI03jSsUU6NInBtpDi8N68OLIwAgABAVgA=
Date: Mon, 27 Mar 2023 10:26:46 +0000
Message-ID: <6727b289-aef6-89f9-8b4f-d63cbaeb81e5@csgroup.eu>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
In-Reply-To: <CRGYHQ3C77DV.1PXS812TV997N@bobo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1910:EE_
x-ms-office365-filtering-correlation-id: 667d5069-2da6-4f6a-cabe-08db2eadc4d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  b/xc7pnaHAPKGJorcZ3xtDE26vksPRGOobmc10u00x4yAq+RLLJQq7Gi6lI0a03q7vx/2bmqZ23J+SpLpcRPGiJ4zQzuHuHC+8fCrKj1aB76cjBdrY9h25Hp0WvT/WBOKvqn6nSDOTbaXkdqWA0x3/96TRDTardUzorPvvy/1sAooZNyyyjy0Sp24d7vusil1g5o5+Ili8t/M0kUPXcxoRo4LNBsQRUiUmo1v694ZhM2N3O27S6gvHRuxHCgeTTKTLxkEoIMUJ64NBjVAjqTqJg+0BEG8KstsTs+U0bkosnU4VA2tjt5sDqhAQT5y7gLheFHmqYNIzAyLAlD6maqD9KIhzXWBq3RO4w8sL0/Oa3T9OU9Z67iM8O8BZi8jWm1aGVAPuWqjWWFUrHUBoOm7U5U1wJzLL6RKDP6ONW4WTqbEkyd50tSOb/IRM53b9D6sCfm0ORQHKEZEti4Fpxi4avhCA9kko59VMrEgQdW0GjrWYlZph+XYosTAqRVqYD6vy9m+mXCaogMZaB0TrGxHQh7pzsjZoAmV0h2ZRjLXqTkZyDlcaojALdvQvb4WVzSNM6Q9g8bJVfzAmf2mIJmfM+QfyFWrBmOzxhISGaTxqZ1lZPbFiQTmE30ka1FDx+87Ku4/esVcbJlWxkfV1WmWAskCOTOsESFan+3MK/m7OU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39850400004)(136003)(376002)(451199021)(31686004)(2616005)(91956017)(66574015)(83380400001)(41300700001)(36756003)(44832011)(86362001)(31696002)(5660300002)(38100700002)(8936002)(122000001)(6486002)(966005)(478600001)(71200400001)(76116006)(64756008)(8676002)(66946007)(66556008)(66476007)(2906002)(66446008)(38070700005)(186003)(6506007)(26005)(6512007)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TUlhOEt1enFQbDdSN0prMWx2UnNRQkI3MVB1ZHFXZmRPeGJUUjNtcmdZU0hr?=
 =?utf-8?B?UDdlSXJuazVRV3M1YVJnQVlwTjVRM2EyV3NGQnNZRXJlTjc3aFcrd1o0ZnV0?=
 =?utf-8?B?ejFHMUNXVXNlRlNPQzZ3L1FMYUlaVWlkbE1jOXZsQWpIQ1lLWHpWTmZidlpM?=
 =?utf-8?B?UUNkSXN2eENkb2dBdjdtZ3RTMFA4cE9IaG1QcGxiYStBd2RzTzVNZVRiSzVZ?=
 =?utf-8?B?RVAvQkZmb01zTURhWGhpSTZSVm1PZ29xYTJpSWxpUEZSTTJLekNkUlkwc05a?=
 =?utf-8?B?RGYxNzZnaDBiN1RyNGtQaW0rQU04aUN4TWErM0dicjdJMmlMSG5hSWpTT1k5?=
 =?utf-8?B?L1dJWXNwcDJOTE1LdWdtYjFVZmdueVNrcktqN1hmdFBmWm5nWEZiU1lkZmlZ?=
 =?utf-8?B?cW8wbWFjdXBHQ3dKZUUxM0VYNWlURnNaNVNwUjRQdlJ1S01BSUNheGlLNFpU?=
 =?utf-8?B?UytDa3MrbThYb1YrSlp6NEFqQ0ZYdkR1TTA4dlc0aHF2NzFHYnRxZzdKaTF5?=
 =?utf-8?B?OWlrUTNxMFcrL1BjVE90NzJyNlhiOEtmMy93Vi9EODJYRy9YeklwYXhsUGJP?=
 =?utf-8?B?bjJPczBmTjdjWEZsMUlyOXZaN2w3Z2dCSTdQVGF5cFV4OTlCRStTNDdHdHhQ?=
 =?utf-8?B?eXFIQ3g5SWtiRWJuRURPUnR1TnA4dVMzTHpCQ1hNMVpWTGx2UHkxK0JOd3NU?=
 =?utf-8?B?S0VJMDF2L3l3Rm51ZjAwSEpZTFI0MzhuRmMzekJ5QWZJdm1EeE8vemt4eGVF?=
 =?utf-8?B?aytITmp6VTh6eUcwbUdRMlFFN2M4Tk8vQ1kwNmJtclZ2ZGhzcUpYaWNBZ0RM?=
 =?utf-8?B?VlpLdTJYS3Z1blF3UmFOcDU0cksvcWJxaG81d2VFd2l6T1BVUVdVWDZmRXg3?=
 =?utf-8?B?NjFWbjZhbGtxNEg1czE2eXF3cHNDejUzRW93UjRmcUpJM1YxYnZnNFRPUFRL?=
 =?utf-8?B?WU55cE9ZKzluemFJUDZxTmtsbGpMTE1rOEpJU2o4dWFUOVdMK0NBOFFFMlln?=
 =?utf-8?B?ck0vamlxMUloRjNRZ1Y5WnpuQ1VEbUFFTXNCYkliOFRVZVpBVXJNL0ttNnJ3?=
 =?utf-8?B?Q2EyRUhSZHdneUxsWWVRa2lGNC9oR01mK3VNSXFmQ1MyVmVlQWtpUkVOK3E1?=
 =?utf-8?B?ajJIWEN6ekFmZjNaNW9UMjZ4dWwxZ1hQa3d1QU5TNGgrTitOcHlFdWRrZzNE?=
 =?utf-8?B?R3JqS250TUd4ek1oM2hlN2g3bWI5OUR4SkE0WjVhMXhZYVlvTU5pSnNWQnJO?=
 =?utf-8?B?ODZCSkdEck5IUHFEZUcvOCs3RWVNVjJSWlZzV2hiNU9oMjNqNlhPMjA3UCtQ?=
 =?utf-8?B?K242Nm4wTlI0dy9rQlJ1SjdGMkNyVzArbStLbm9PV21TZXdlN3h4RDVpQm1H?=
 =?utf-8?B?ZkRJYmtzRko3azJpem5IV1BsS3BlVE8xV1NrS2M4TW4zLzJoV09pMHBIUjAz?=
 =?utf-8?B?MmloaFVVYmdodVJJQjZ5akQyVENTbzMxTVl4cERKRjVTaEZDR2NQOEwzM1Ax?=
 =?utf-8?B?SnpTT2cyQkVJZmtVbUJLa24wYnJHTTBDYmVENDJ0MFJkT1Naai9IK1VGVU5w?=
 =?utf-8?B?Z1JlS3dRckZiL0pYRjFZZHVBRlJaRWp3THdLUU04Zkc5RmN5Z0pTQ1pwUWlK?=
 =?utf-8?B?bDh0di90WHV0Q3VJekRMWThRTWVETG16YzRwNUhHRVJqeVgrNW1HV3FsVTZF?=
 =?utf-8?B?ZnF2OUNqKzR0anNXYk1XVWd3MGc3MTV3RjN2YXpIVS81UjB5V2NVcUdvRHhx?=
 =?utf-8?B?dTAzTmtiOG9CQXZ3OXZONWg3aHJjeXp3b1ZOamJ1TUQvRENYaFFINDJFTDUr?=
 =?utf-8?B?Z1NTTVFWalMyejVYcEZGV3RHazd4RWE3NW4reGZkQk16amxLOGMwUjhhODNj?=
 =?utf-8?B?V3FrQjJhUUZKR1Qvc1o5TmJNVTh6ZFVXcGYwdit5RWQ3Y1JWR0RlejM2bHR1?=
 =?utf-8?B?NHV1RHp5VXI4M2k0amFlQlRBRWlWS09ad0pNUXhIVXRSWGc0bEtZcTRsMXpV?=
 =?utf-8?B?bm5tVEljZ1k2SmNzbFg5eWVrOUI2L09OVUNCSG82b1Y4RzFCWmh4Q01WQXcv?=
 =?utf-8?B?OTcwR3oxVjhuZ1doMjNSUE53OW5qeWhFMHlmSHlpSkd1TVBCalZMVmx6V2t2?=
 =?utf-8?Q?BpISZRgvQhUc2R/AqymEFLJ1t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1AF59DA4F65A940B71159EF7E94FC66@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 667d5069-2da6-4f6a-cabe-08db2eadc4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 10:26:46.9268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aiwQ5MzgnSjRh71RcRBS9IxwHGMagVdU4bbjMp0h0iOOsP3pjoi9s12XJ8jNN6upBe3Z02YXeJkt+H56gn+oaXOivNg6LGXbuf9Za4e9IYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1910
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAzLzIwMjMgw6AgMDg6MzYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBNb24gTWFyIDI3LCAyMDIzIGF0IDg6MTUgQU0gQUVTVCwgSmVucyBBeGJvZSB3cm90ZToN
Cj4+IFBvd2VycGMgc2V0cyB1cCBQRl9LVEhSRUFEIGFuZCBQRl9JT19XT1JLRVIgd2l0aCBhIE5V
TEwgcHRfcmVncywgd2hpY2gNCj4+IGZyb20gbXkgKGFyZ3VhYmx5IHZlcnkgc2hvcnQpIGNoZWNr
aW5nIGlzIG5vdCBjb21tb25seSBkb25lIGZvciBvdGhlcg0KPj4gYXJjaHMuIFRoaXMgaXMgZmlu
ZSwgZXhjZXB0IHdoZW4gUEZfSU9fV09SS0VSJ3MgaGF2ZSBiZWVuIGNyZWF0ZWQgYW5kDQo+PiB0
aGUgdGFzayBkb2VzIHNvbWV0aGluZyB0aGF0IGNhdXNlcyBhIGNvcmVkdW1wIHRvIGJlIGdlbmVy
YXRlZC4gVGhlbiB3ZQ0KPj4gZ2V0IHRoaXMgY3Jhc2g6DQo+IA0KPiBIZXkgSmVucywNCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIHRlc3RpbmcgYW5kIHRoZSBwYXRjaC4NCj4gDQo+IEkgdGhpbmsgeW91
ciBwYXRjaCB3b3VsZCB3b3JrLCBidXQgSSdkIGJlIGluY2xpbmVkIHRvIGdpdmUgdGhlIElPIHdv
cmtlcg0KPiBhIHB0X3JlZ3Mgc28gaXQgbG9va3MgbW9yZSBsaWtlIG90aGVyIGFyY2hzIGFuZCBh
IHJlZ3VsYXIgdXNlciB0aHJlYWQuDQo+IA0KPiBZb3VyIElPIHdvcmtlciBidWcgcmVtaW5kZWQg
bWUgdG8gcmVzdXJyZWN0IHNvbWUgY29weV90aHJlYWQgcGF0Y2hlcyBJDQo+IGhhZCBhbmQgSSB0
aGluayB0aGV5IHNob3VsZCBkbyB0aGF0DQo+IA0KPiBodHRwczovL2xpc3RzLm96bGFicy5vcmcv
cGlwZXJtYWlsL2xpbnV4cHBjLWRldi8yMDIzLU1hcmNoLzI1NjI3MS5odG1sDQo+IA0KPiBJIHdv
dWxkbid0IGFzayB5b3UgdG8gdGVzdCBpdCB1bnRpbCBJJ3ZlIGF0IGxlYXN0IHRyaWVkLCBkbyB5
b3UgaGF2ZSBhDQo+IHRlc3QgY2FzZSB0aGF0IHRyaWdnZXJzIHRoaXM/DQoNCkkgZmFjdCwgbW9z
dCBhcmNoaXRlY3R1cmVzIGRvbid0IGhhdmUgdGhyZWFkLnJlZ3MsIGJ1dCByZWx5IG9uIHNvbWV0
aGluZyANCmxpa2U6DQoNCiNkZWZpbmUgdGFza19wdF9yZWdzKHApIFwNCgkoKHN0cnVjdCBwdF9y
ZWdzICopKFRIUkVBRF9TSVpFICsgdGFza19zdGFja19wYWdlKHApKSAtIDEpDQoNCg0KSW4gcG93
ZXJwYywgdGhyZWFkLnJlZ3Mgd2FzIHRoZXJlIGJlY2F1c2Ugb2YgdGhlIHJlZ3Mgbm90IGJlaW5n
IGF0IHRoZSANCnNhbWUgcGxhY2UgaW4gdGhlIHN0YWNrIGRlcGVuZGluZyBvbiB3aGljaCBpbnRl
cnJ1cHQgaXQgd2FzLg0KDQpIb3dldmVyIHdpdGggdGhlIHR3byBjb21taXRzIGJlbG93LCB3ZSBu
b3cgaGF2ZSBzdGFibGUgZml4ZWQgbG9jYXRpb24gDQpmb3IgdGhlIHJlZ3MsIHNvIHRocmVhZC5y
ZWdzIHNob3VsZG4ndCBiZSBuZWVkZWQgYW55bW9yZToNCi0gZGIyOTdjM2IwN2FmICgicG93ZXJw
Yy8zMjogRG9uJ3Qgc2F2ZSB0aHJlYWQucmVncyBvbiBpbnRlcnJ1cHQgZW50cnkiKQ0KLSBiNWNm
YzljZDdiMDQgKCJwb3dlcnBjLzMyOiBGaXggY3JpdGljYWwgYW5kIGRlYnVnIGludGVycnVwdHMg
b24gQk9PS0UiKQ0KDQpCdXQgaW4gdGhlIG1lYW50aW1lLCB0aHJlYWQucmVncyBzdGFydGVkIHRv
IGJlIHVzZWQgZm9yIGFkZGl0aW9uYWwgDQpwdXJwb3NlLCBsaWtlIGtub3dpbmcgaWYgaXQgaXMg
YSB1c2VyIHRocmVhZCBvciBhIGtlcm5lbCB0aHJlYWQgYnkgdXNpbmcgDQp0aHJlYWQucmVncyBu
dWxsaXR5Lg0KDQoNCk5vdyB0aGF0IHRocmVhZC5yZWdzIGRvZXNuJ3QgY2hhbmdlIGFueW1vcmUg
YXQgZWFjaCBpbnRlcnJ1cHQsIGl0IHdvdWxkIA0KcHJvYmFibHkgYmUgd29ydGggZHJvcHBpbmcg
aXQgYW5kIGZhbGxpbmcgYmFjayB0byB0YXNrX3B0X3JlZ3MoKSBhcyANCmRlZmluZWQgb24gbW9z
dCBhcmNoaXRlY3R1cmUuDQpLbm93aW5nIHdoZXRoZXIgYSB0aHJlYWQgaXMgYSBrZXJuZWwgb3Ig
dXNlciB0aHJlYWQgY2FuIGZvciBpbnN0YW5jZSBiZSANCmtub3duIHdpdGggUEZfS1RIUkVBRCBm
bGFnLCBzbyBubyBuZWVkIG9mIHRocmVhZC5yZWdzIGZvciB0aGF0Lg0KDQpDaHJpc3RvcGhlDQo=
