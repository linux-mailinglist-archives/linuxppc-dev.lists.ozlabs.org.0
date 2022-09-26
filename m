Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C65E9907
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:56:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbX844yfYz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:56:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KOmTHDax;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.77; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KOmTHDax;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120077.outbound.protection.outlook.com [40.107.12.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7Q3Ph8z2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boWa/VvcwTRe2Z4YPcGC9fi4DQcCKVHqyyaAU/MmaCjrD17rt5E5t9np5+KobMHa/WA35HaxAmzWNBI1tLFH4QnGLUa+xHNns5YZ9ZGglAz42kdwRL0vcU4zuOX7R4ntUKzLodPdg+1QGCn+k4UiwMDZSKQkYLi/SmmA56sJPdNvmPCEeot3XpU82Q6F2QwE/65v0N+mr9ypjD9MVNJsKrKYuesSZVzIJJx8+tGbvI6f31rJRy249jeFIUyFdoB4QjEW/3y+Bwl0F4LgMbjVJqXY9h8Jm9vxAOZk5gJzIYW/QO8B89v7sIpitWMPYnr2qo/Rc2jMV9pHHS7AvzuByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGjb74GDsmCipvTyx0auqCBWQg6MUnNiwCSMmIl7UHk=;
 b=npnqm2cHfIw6+O0fhTI+7BW61EzppCuASL9174/hfgkAlYg7FwvTSW+2j1B4fsNwlin0+gpGwQEofjeJgXOanoSmKTmMYoMP5sDCSCTtZnB73SOgOP9ejhaHw/upAJpx0satmdLSpwTkpXXXAfjMihuM2x0kl4vdHKx0TUQyv4pd5wKt/hQ2U4VYSprEOj7O6urUSJjTQn/GSHt69uBjWkq/29hEfCCqvQfYSMfvVI7SdmsZCXQRyq/97w0ax+MfZwnInPZQNp6yGKSfrizDb5F3zKzQY2QAYUsHBcHDZyVFaDnKS+Pp+xXN2ZhCWA/5ijcsexdHTnV8t6JynU4hHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGjb74GDsmCipvTyx0auqCBWQg6MUnNiwCSMmIl7UHk=;
 b=KOmTHDaxbmHUy8zSSAZ7xOcRmsMxmyQ64xd/hE3ArRUwHmFHn2cFDraX7Tq3uahH4r4TqtYsfokKMf/GWR8eyoQ8ulHz9ZN4m+dM+7/Cu8+s+06Fd/mLzFmU508evSCVwOSqKrfdr2GWw5pgdsMcvhLimB8jdy7Z7+bKakUM+TU8n2XCMh3G0XVM3p37VpVtstly+7BnTakU4kWs+5FNeRMH28DT6/pwIHzE0KiNa9QbotWTdokq3/JOkgp81pJj6yH7ENuJKYUHwsShe6AY0a0n96iKgcTUAvqUojMOnkqBZtpxw9JiBhVZCgFILn+tttBhOb2AwKLY3yCiE4vG8w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1955.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 05:55:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 05:55:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Haren Myneni <haren@linux.ibm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Ignore DSI error caused by the copy/paste
 instruction
Thread-Topic: [PATCH v2] powerpc: Ignore DSI error caused by the copy/paste
 instruction
Thread-Index: AQHY0R0xVBpODYzm/EazAJFCtgBn2q3xNw8A
Date: Mon, 26 Sep 2022 05:55:57 +0000
Message-ID: <fcc2792d-ece1-d01a-7591-c487dd4d7e1c@csgroup.eu>
References: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
In-Reply-To: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1955:EE_
x-ms-office365-filtering-correlation-id: 2056a7b9-5394-42fa-d404-08da9f83c80c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0BHAC4kUtA7cco9qV5Dk/BqRKZLwYf/lRuxJnP8N0desvrytAks9zhr9kT2yE4+paR44xD1wxJHw8h9lnkheIFF049oxc2gKJJviBwE4pScdpOfe7jAIjH7klpVYFx5066GAcuOYI6klIik7juhnIZC7gll5wpLEfj8/T8S5b9uB1uK+aVxz0Vq8NBt9A3McF5dwvlW8tutfdgm402DBiiVZQxqzZrzW6p9LOuu9oZpNEUhvKr5jNc1ccoTzbPJjecbWk/DCN6kOhuPUsGYe3mHQ3oHAqaVShtK51Hp6qsNCh6/31B4ZlDIpSTtaZhKRzvUchWHTaRoXzkJ44nW16YyEfF6nKL0AGn51HUWp2hw27YzHLJ//vj9HQU0GwStcGDCk5zczwUS6np6djaDmwSyfJMjSSRbMb5H8cE6VnaIqCjZrD4/dW/YfQ1CIsSwM/fQCcoXiQPmLZTo3KWcGqcN7ORB3m3JxixkvXeOOHLHY0o3CNZetxjLy5dOsBjUOPZV5hxc2Fwj0XzfQ5FUPjVvuzZE61zf24RnRdqHLcfhSE/4UcHy4fQ5KMfG+oBMfkPfweDuq1Dfv7Fmi2p7orDPIS89Psns77Nprc9tb6VcBem982LzqtzP/p+N1iGe+WODH6lxCyt+UFxkBgSCk2OKCaH+t3NbfogUGLTjdfD01OZ+Zoxn3KGgeZhQW/27dl7AkIth+ezGb8gosp61hxVbEZlky9YxmX81Cc+yvkVg0iwZp5H5PVr8ovM7xycBo5Z3qt3OAjqVecIMiAMJJDWLSAks6zQpQkcmlpKpcGgFm46X+KTLofIkJk7b7yBpRymmY379I1Vw3IG4umHvrwg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(451199015)(44832011)(38070700005)(41300700001)(6506007)(8936002)(26005)(6512007)(5660300002)(83380400001)(36756003)(66574015)(38100700002)(122000001)(2906002)(186003)(2616005)(478600001)(110136005)(31686004)(316002)(86362001)(91956017)(71200400001)(6486002)(8676002)(31696002)(4326008)(76116006)(66556008)(66476007)(64756008)(66446008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cHNDelFZYUtsZ2I4Yy9WSjdNU3NjV29DOG1IMHpZbXFHNXN0OEw3bUdCKzhq?=
 =?utf-8?B?b1VNbEpQWVpRVDMweCs3NFdZejNHblpmUjBHUVQrT20veVJzZkJEcFBFQjVm?=
 =?utf-8?B?STFPRnRXQVViditUaFdsMHRYTThwaDdaREQ1Q2ZEMThwSnF1SzRPRnIvZVJJ?=
 =?utf-8?B?cG5QWkFDS2RMUnVtU0pkTGNYdkgyYlpieHdNM0FycnZNdWJ1ZGlFSUxXdTZV?=
 =?utf-8?B?UEdza09IOFVKY1Jtd2tNRjMxRGk1SjVkWVkzOE9UM2Q5N1pPYU5zZ0NMY0dT?=
 =?utf-8?B?UVdIZXhKWk85WDhHQnFIc3Uwc0hsZTc5TVR5WERaVHhoWUhaY0Nhd0ZBbDFK?=
 =?utf-8?B?LzEwUW1CdHU0L3g3cUZ5aVlMUVp3S2ppSlZDNitiRGxTS2xKZEhiK0hWTmti?=
 =?utf-8?B?bkk1ZTN5TUtOUlEwVWpDQWN6ODhvdm5BY1J0ZmluSVc0NnNsVnZZb2I1Tk1V?=
 =?utf-8?B?bDNyK3lvUVNyQ1ZQdkxZZUhJOVlOS2NlSk40R3U3dmppVXFDY2x4YUV5TTZS?=
 =?utf-8?B?YVhlWWwrdCsrK3V2OUFBdjhTSW1vQlJTRU1IZ2hWK25HNlpnT2llc1ZITERT?=
 =?utf-8?B?OHI3NmlOV0U0OFBqeENRWmdhNXliR1QxZy9jT2xpWnAyNFN2NEhMNEQ0WkFF?=
 =?utf-8?B?MlBIZXlZbnFnVk9ZdWFzMW5tWFpqYlFucXo2NkM4eUNVZUdGRVBoNkVEVTc4?=
 =?utf-8?B?MG54ZTFBbk9neWkybi9LQ2lTNy8wQTBWT1Z0cGNjZlRqQ3phbXpteGZvT0dr?=
 =?utf-8?B?ZFBPdys1OXZhSWtxODU4Um5henJxM0R6NDlpamg3enZ3MTc2RnFNWk1rdmg0?=
 =?utf-8?B?VS9nanVxeUJNZUtGZFJBM2R4ZHg0ZzdzQzczcEoyUlhvTzVDUFUxM0NPaGhu?=
 =?utf-8?B?cGZ0RzZjS3lmOE1BUHBnd3N2K1cxUGlhT21GS29sOE1TcndiZmZuVGFpdFpC?=
 =?utf-8?B?RW9YUjhOblMvN0xENFk3VVRzYXBDZmZLUWg2MWhJNnp2Mkc3SSs4Znlrdldx?=
 =?utf-8?B?czhiUlYvbGxOa3VURmxjUU5jdGs0aGg1bkJRZHNiQnJLWXhxekFUQ1ZMTFNO?=
 =?utf-8?B?V0lzTE5yeTJMUDJwMGYvU1ArNWdoMncyQzErWGJJeThkaWZGSDhITXlsT1Vy?=
 =?utf-8?B?MU90SXBvSDJzZ1k0aVZMT0Z5UVpJaldpZjZMeUJEbVljWWFJWldockM1RUcr?=
 =?utf-8?B?Mk5nUDJ3MFVUbDA1VWQrQzFaOUpHUXBPYUNjaDJrbmpnNVc5dU1KY0NWdGdZ?=
 =?utf-8?B?bUU4WDI2NWxQSmtRLzdzY0Ewc1IyQ1N5OVZpZjZJdGV0WmxrWXhvblFZekkr?=
 =?utf-8?B?VHJKSnc2UEthcTJNbTgxaG11d3lKTTYrUStXL2xXY3RPdjFwYzJVdUkrbTVP?=
 =?utf-8?B?SWRaM2lDaXcyT3llMUhZNEM3NTI1a1RwRnA5TFZyeG52YmJ6R3FhWk5UeEpL?=
 =?utf-8?B?R3J0alkzMk5vK3Z2TUVsSVRCYUFPVTluZFZZd1VKY3hna2lIT3NtMllkaWNq?=
 =?utf-8?B?SWVhcnVMMm02YUVVd2lSNDM1dkVlWnlLcVdVNVUxb3V6cjZGOVQ3UXFGZHIy?=
 =?utf-8?B?d3luUmVhS1FyVmdNTDFzUysyNlR3K0U2aUwxTC9yQVVnQ0hZU0VrRWRjQ0hr?=
 =?utf-8?B?N0lHRFVvQzQ5S1UzbUZCK0d1VG1LSExHNW8yc1lFcEQ3eTlPeURvYWdXcDZR?=
 =?utf-8?B?RHFxVWZSaWFIcmV1NGZ2WTllZmlvVFRGVFQzUTlNM1grb0haNTFnLzNHNXRE?=
 =?utf-8?B?bEtPUGlERXpmdk5NaFgwOEhQS2lWWWYyMDc4KzAyejFJT3p4NDRhajBKalQr?=
 =?utf-8?B?YU0zNDNIVEJpOGFoR2RMcjB4OWNPS0hOSzZrdGg0cHorV05waVZUbnVJY2h5?=
 =?utf-8?B?ckxOcEFya1pHQ2p5WTRlUElKMW5TQWdDanM2ZkpnelhlMXJZOThYZnY3TGlt?=
 =?utf-8?B?WSt2MEQ1ZkgybWRwV2JMdllYRzdVanh5Q0g1bWd6L1owS09Kb2pETVFPZE0r?=
 =?utf-8?B?NXpBR1dwZTB2ZHRsd0wzcTNNOTJuZWZRSkxXbmM5MEhKdzhYMzNZank0N1Vv?=
 =?utf-8?B?bnEzUnJqNjcwMmZ6aTRSWWoyWTFpd2xhWnJSUFloQi9WbmRYYTZQNlpPK01r?=
 =?utf-8?B?ZFJMMFNPWFh0ZU9Fa3hqVUhIRm9iQ3Fsb3M2SGNRbExKVUc1a0s3NFV4V3lx?=
 =?utf-8?Q?oyguzDkfATwHMx4Lqv/n0sQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0109B94DA9A9CC4EB529512EBF301E81@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2056a7b9-5394-42fa-d404-08da9f83c80c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 05:55:57.1693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThViP9schDJTO+WyhNmACjey8KwdP5Z9SdHStIZALwQuhhOJSmoihfksloFz7Sx6Rbl5iJ01ywxqI8EvXOKcA/GC3G/065Np8dWuFRauiH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1955
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

DQoNCkxlIDI1LzA5LzIwMjIgw6AgMjI6MjYsIEhhcmVuIE15bmVuaSBhIMOpY3JpdMKgOg0KPiAN
Cj4gRFNJIGVycm9yIHdpbGwgYmUgZ2VuZXJhdGVkIHdoZW4gdGhlIHBhc3RlIG9wZXJhdGlvbiBp
cyBpc3N1ZWQgb24NCj4gdGhlIHN1c3BlbmRlZCBOWCB3aW5kb3cgZHVlIHRvIE5YIHN0YXRlIGNo
YW5nZXMuIFRoZSBoeXBlcnZpc29yDQo+IGV4cGVjdHMgdGhlIHBhcnRpdGlvbiB0byBpZ25vcmUg
dGhpcyBlcnJvciBkdXJpbmcgcGFnZSBwYXVsdA0KPiBoYW5kbGluZy4gVG8gZGlmZmVyZW50aWF0
ZSBEU0kgY2F1c2VkIGJ5IGFuIGFjdHVhbCBIVyBjb25maWd1cmF0aW9uDQo+IG9yIGJ5IHRoZSBO
WCB3aW5kb3csIGEgbmV3IOKAnGlibSxwaS1mZWF0dXJlc+KAnSB0eXBlIHZhbHVlIGlzIGRlZmlu
ZWQuDQo+IEJ5dGUgMCwgYml0IDMgb2YgcGktYXR0cmlidXRlLXNwZWNpZmllci10eXBlIGlzIG5v
dyBkZWZpbmVkIHRvDQo+IGluZGljYXRlIHRoaXMgRFNJIGVycm9yLiBJZiB0aGlzIGVycm9yIGlz
IG5vdCBpZ25vcmVkLCB0aGUgdXNlcg0KPiBzcGFjZSBjYW4gZ2V0IFNJR0JVUyB3aGVuIHRoZSBO
WCByZXF1ZXN0IGlzIGlzc3VlZC4NCg0KV291bGQgYmUgbmljZSB0byBtZW50aW9uIGF0IGxlYXN0
IG9uZSB0aW1lIGluIHRoZSBtZXNzYWdlIHRoYXQgTlggc3RhbmRzIA0KdG8gbmVzdCBhY2NlbGVy
YXRvci4NCg0KT3RoZXJ3aXNlLCB0aGF0J3MgY29uZnVzaW5nIHdpdGggZm9yIGV4ZW1wbGU6DQpD
b21taXQgMmU2MDI4NDdkOWMyICgiS1ZNOiBQUEM6IERvbid0IGZsdXNoIFBURXMgb24gTlgvUk8g
aGl0IikNCkNvbW1pdCBjNDk2NDMzMTk3MTUgKCJwb3dlcnBjLzMyczogT25seSBsZWF2ZSBOWCB1
bnNldCBvbiBzZWdtZW50cyB1c2VkIA0KZm9yIG1vZHVsZXMiKQ0KDQoNCj4gDQo+IFRoaXMgcGF0
Y2ggYWRkcyBjaGFuZ2VzIHRvIHJlYWQgaWJtLHBpLWZlYXR1cmVzIHByb3BlcnR5IGFuZCBpZ25v
cmUNCj4gRFNJIGVycm9yIGluIHRoZSBwYWdlIGZhdWx0IGhhbmRsaW5nIGlmIENQVV9GVFJfTlhf
RFNJIGlmIGRlZmluZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXJlbiBNeW5lbmkgPGhhcmVu
QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2MjogQ29kZSBjbGVhbnVwIGFzIHN1Z2dlc3RlZCBi
eSBDaHJpc3RvcGhlIExlcm95DQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jcHV0
YWJsZS5oIHwgIDUgKystLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbS5jICAgICAgICAg
IHwgMzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0v
ZmF1bHQuYyAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKystDQo+ICAgMyBmaWxlcyBjaGFu
Z2VkLCA0NSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQoNCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jIGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4g
aW5kZXggMDE0MDA1NDI4Njg3Li5jYjk0OWYxMmJhYTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9tbS9mYXVsdC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jDQo+IEBAIC0z
NjcsNyArMzY3LDIyIEBAIHN0YXRpYyB2b2lkIHNhbml0eV9jaGVja19mYXVsdChib29sIGlzX3dy
aXRlLCBib29sIGlzX3VzZXIsDQo+ICAgI2VsaWYgZGVmaW5lZChDT05GSUdfUFBDXzh4eCkNCj4g
ICAjZGVmaW5lIHBhZ2VfZmF1bHRfaXNfYmFkKF9fZXJyKQkoKF9fZXJyKSAmIERTSVNSX05PRVhF
Q19PUl9HKQ0KPiAgICNlbGlmIGRlZmluZWQoQ09ORklHX1BQQzY0KQ0KPiAtI2RlZmluZSBwYWdl
X2ZhdWx0X2lzX2JhZChfX2VycikJKChfX2VycikgJiBEU0lTUl9CQURfRkFVTFRfNjRTKQ0KPiAr
c3RhdGljIGludCBwYWdlX2ZhdWx0X2lzX2JhZCh1bnNpZ25lZCBsb25nIGVycikNCj4gK3sNCj4g
Kwl1bnNpZ25lZCBsb25nIGZsYWcgPSBEU0lTUl9CQURfRkFVTFRfNjRTOw0KPiArDQo+ICsJLyoN
Cj4gKwkgKiBQQVBSIDE0LjE1LjMuNC4xDQo+ICsJICogSWYgYnl0ZSAwLCBiaXQgMyBvZiBwaS1h
dHRyaWJ1dGUtc3BlY2lmaWVyLXR5cGUgaW4NCj4gKwkgKiBpYm0scGktZmVhdHVyZXMgcHJvcGVy
dHkgaXMgZGVmaW5lZCwgaWdub3JlIHRoZSBEU0kgZXJyb3INCj4gKwkgKiB3aGljaCBpcyBjYXVz
ZWQgYnkgdGhlIHBhc3RlIGluc3RydWN0aW9uIG9uIHRoZQ0KPiArCSAqIHN1c3BlbmRlZCBOWCB3
aW5kb3cuDQo+ICsJICovDQo+ICsJaWYgKGNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX05YX0RTSSkp
DQo+ICsJCWZsYWcgJj0gfkRTSVNSX0JBRF9DT1BZUEFTVEU7DQo+ICsNCj4gKwlyZXR1cm4gKGVy
ciAmIGZsYWcpOw0KDQpZb3UgZG9uJ3QgbmVlZCBwYXJlbnRoZXNpcyAoICkNCg0KPiArfQ0KPiAg
ICNlbHNlDQo+ICAgI2RlZmluZSBwYWdlX2ZhdWx0X2lzX2JhZChfX2VycikJKChfX2VycikgJiBE
U0lTUl9CQURfRkFVTFRfMzJTKQ0KPiAgICNlbmRpZg==
