Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FB4C25BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45NW3tNrz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::606;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45MF1Pmmz3c9t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:15:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzsnYWS2NI5qa+OsHVLsCCQq8rywi0Xj0CGmwpKcWT8oXUYdrjRLvHEuTsy5XclP9erHv5MmhgIQ4dYe26Ekae3/iQFRH6kRe+HEs9f/2EgDLB3nB4xM4quwQ0NRFL0M8R+kWF1H2dktlUna5AuOUFta26QOUIgNpgb2AqpE57i9439mUCF/o6P1U1oTlqDypABM157bJSAm/5LO09aT8VoioB5RPeknMQIudlMhd9w2/h+p3v4zlp6Ur0/5L5eTInHhHlwinMOXYDh0JtB0AZvEU4AnEtxoTA0yq/E9ZTkdb6eCRlhFk0rWyLTOgsOICLxi1S7MDc5fvr1wj4SFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baso6Mx3+Wl1NdeOGk6QycQoUy8tc06241obQzRxOuw=;
 b=lf3bjl2XBSN/i6KKTAuT9yvppZjXP86a/8qJIptZGlmKsmtmLhobIHshYqXDMIsrhgDTo5UrInjQsvAlp+sp642ZKMcpLcYFOBk3GQgQbjXinRx+x/cqmE3pfg3XV7wVb94mM+MFc5QHIKK1302ixMJ0dJsDOD4jpIpYVQXuJWKt0ze4M4wrPMTtwxZ6ERFjWTiZ0MLyRW/ohBHt//WUca5b16DY1Mn+WWxuBMPTP/gvJFRCRfNTLuL2xh0T8+p2cUkAWRX5MHzIT1YpLi/CkvRkrxVpmpGrNeJXciHAlG2ma7KsY5+VBxk4JN9DROVFkNoZF6KBTZIY4S4ZQgL8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2081.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 06:41:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 06:41:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Thread-Topic: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Thread-Index: AQHYKNh0eyGIwSmwv0u/u8dEgkopEKyhm6OAgACl0QA=
Date: Thu, 24 Feb 2022 06:41:39 +0000
Message-ID: <5c223dac-8434-a6ae-7d92-d2bd213ef320@csgroup.eu>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
 <YhadiVbwao/p2N7o@lt-gp.iram.es>
In-Reply-To: <YhadiVbwao/p2N7o@lt-gp.iram.es>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a910b178-3f99-4f87-af71-08d9f760b602
x-ms-traffictypediagnostic: MR1P264MB2081:EE_
x-microsoft-antispam-prvs: <MR1P264MB2081A79519AEF7F6839EBE68ED3D9@MR1P264MB2081.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Wg/nZEW8nEmrp7ic8zsqj02LJ3EwuNnTfBmMQxRoo5xjtnUgsgTimtduGqV51w1FvbZC5f+CLo1eAxqBgJnjkg07SoV9buyPqM9m2BqifEyHsR89BLqsZUV+ifK6i80KLKPbrNrVTDcWTm2/N45bMHuaTJS8pEPdOnx0kpYykhXdm0AJXyhjitvMA8WNIR2YaGaRL3ZNytWP1gmNj13xA1dlxeiHfJgJqllCpR9j5Dvxm38DBbRKT+62Fm/66gQA7JHWg6alN6vCu6RzRwiVhh52eOuAfyXtYAK4Zq8yBia94rtaaoz8Pnb0XDaP01dTCYyhWk575bFI0Jn6uyW0sRAQlAfpv1Gqv6Ll7ZDo/E5pMwCalfdvfK7r68fZBFWqDqWmEoFB49iIWfW8rO7yYp/MnA6RU9n/eeP0rjuVRKp/WaL/8cNxSzp7HDcfJUxehtEFFFDGW+e5t+1zxGSnMJM0LNps4k2FWEGHMGe4aCr73KHVyzMId9QFscbCQR0cjqIvCJIFlv+MiyMtQqdBAWHazCXcpXI2S2YRRzkAHFMrbvR/HT8InRPPRcvnbZnOfHrZHru9qX3pne4LbdU2jUJdBseL826RqmsjqmZaT85NjdjuuroOLaSzVkMR1sCrbqGvuLTACDpvcvCF/dgodYYZuGnt/UPdnNF9Q4Pjo8CJbrVbjU44LJaicf0S3ElT/As18WIthPHAyiOA4B++swyjmFBPvJr0UQARnb0THgyljQ10gHH/argXK55rdcOFYb3R8BH8RbBYJQXrPoz0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(31686004)(38070700005)(86362001)(508600001)(36756003)(6506007)(71200400001)(122000001)(6512007)(31696002)(38100700002)(66476007)(64756008)(91956017)(8676002)(6916009)(186003)(2906002)(5660300002)(66446008)(316002)(44832011)(8936002)(4326008)(2616005)(6486002)(83380400001)(66556008)(26005)(76116006)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjlnR2JUeUNxRUlhMDFIcTg0SlFuUFRMTkt2c0JmQzAxcmNPZElCVzNHMkJJ?=
 =?utf-8?B?d2x6Y2I3TjB6VW9neDVTY2VtU1JmTFhXdmFJQTd1eTZRZEpOd1JyWUpQRGZK?=
 =?utf-8?B?d1I3OXMrdVdGYTczU2gweElGQzF3MG1wVTl1bVNKeGF5NG9xSTdId2ZvK2Zu?=
 =?utf-8?B?anJBMW5rSHFYeFBoTzJVVnIrdCtzRG53dzE1UU1ISEhjVkdGbUcraXF0SHk4?=
 =?utf-8?B?QkdEVlJBaWt1QWU1VStGL3NUakltcTFSc0pqczVLZCtiK3lXdlZXKzhiM1Zj?=
 =?utf-8?B?L1RkWko3S29ZWFBxYlVlZmVUN1RTVHJGWkhxRFI5WVFGRmkvKy8rNXhvMjl4?=
 =?utf-8?B?bGZBRHlGQlBhSm9NVm9ZbHJQYkc4ZFdzNU15SmRJY2VTSVlKNTNneExPREdt?=
 =?utf-8?B?L3NmYlgwNkpic1ljNUR3VDJoajE5OE5GVEllb3QrbkJudWVUZjhscEpBTktW?=
 =?utf-8?B?eUNkTjY4QkdaSDRKVC9TYmRiK3hmQk1CWjV1cVArSk9CNm44dGZaWUk5dURR?=
 =?utf-8?B?eXBtcDNyaEdma3JzVldtSGJrYTR4UE83WkZMbEVKZ0VhQ2NrZUNOSUdSc0tn?=
 =?utf-8?B?b1RFdGZWQXNldjdaZFU5cjFxdlQ0cjdvUHpDSnBkSGFaNkt4cnRRSzlQVWRo?=
 =?utf-8?B?ZXJzenZsSWFBOCtSeTM5ZlEyRnh4YmdwaW5XOFFOb1FVSDFBV3lGeFJYeHhG?=
 =?utf-8?B?YjkrWkhEMU91eFJpWndzN0FralNEUXVIb3ZwYnZ0dFB2emxxMDRtSGVFbzV3?=
 =?utf-8?B?UWNRS1A2a1RQemdJR0w2bnVlTDJwaW9yQnJSSnVuQWlzdTBTSXBjSlAzMmp5?=
 =?utf-8?B?cVVYb00wcTFSakRwVkwyd0o2QWlrbW45UGxpcnJRdWYzWTRweExwSkF1M1Zp?=
 =?utf-8?B?RVQ1bVRoaXovbGQrN2RnYzVucUNNU3MzWmUrUitOTVg1UktlaWs4U2JyaWlX?=
 =?utf-8?B?ZmhnUTJNRkU3VWprTFd0Z2lid1hKcTk4VHhCNXlGWElPNTBabE8reXRHRC9E?=
 =?utf-8?B?LzRrRDloaW9OdEdJc28wSEU1RzZGTWFxazhncG5BUzM2WXJHYTloSEdwUHNP?=
 =?utf-8?B?dEVyWE9zTHM4MVRqV1ByNk82Sy9kV2FvdVR4VVVzSlRFZ2VCdXJJVzlVcEhG?=
 =?utf-8?B?bGd0RUpDdE01MmJ2RXF3bk1sUWRHcFdvYy9PZXVmdU0zc2tpOWxsbE9rN1Nv?=
 =?utf-8?B?SnFvWExYOWwwVmlOU0RvL0tWbG9FNysxZVhXNnNXeTlBTWRMbkxmOVFmWWVj?=
 =?utf-8?B?RXVLWEJDRkx2UjFISnlWSkQ1bnZZVDA5UHZOMzFKbG5OMXExMUpHZW84NEZI?=
 =?utf-8?B?MTdOb2NNQ2FSNVNUcDJvWEl0OUwrTkh1UHp3M1c3U2Y4YXFUVFFHUFpQV2xx?=
 =?utf-8?B?ZlN5ME1zdTdGbCs2QXFnOCtTQksrVk5QRFFMQ1Q5amZrVEdQTUVEekgvdVJM?=
 =?utf-8?B?OENQbURFaHFac2pjeDgxK3ZJa21FNk9hR3ZFV0ZuTy83SlJURHYzU2t4U2ll?=
 =?utf-8?B?Y09DVmFkbjVPclIzaVJpdWVicjVmVG5OYTFwZUVaWFdhVTVjb2hxUDBiRHdU?=
 =?utf-8?B?d3htRVJVK01LMnhKeWIyVVZpWkZaemlad0l2V0NmWjFDSHJ1SndCWi8wSWNt?=
 =?utf-8?B?ZnBJZ2hLeVhBeUVOTENNWk43L0dpcUdXbFIzRnIva0pZa3NHL1JHYzhwcjhF?=
 =?utf-8?B?bmVzSGFmRFlMTW04RnhQZThTSlBuMzRFRkdHN28zWnlnQWkxbE5YTit1QUgz?=
 =?utf-8?B?eHE1V1dSSnhJRTNBUXFZY0pRQzRieGtJQklkYm9VeGp6MGxubkppT05lU2lh?=
 =?utf-8?B?U1dDam5VM1hBTmdMaHVEUHYzQ2lDQXJ2WmhRWlUrOFBITFFBcGJKb2RweER6?=
 =?utf-8?B?QXM1ZU1MdmhHZ2kwdDZWdWlZdTVkZjVHcEdXNGM0T1hQWVYzWk5IbTd4Rzd0?=
 =?utf-8?B?a3lEUEJzUlpSU1l0bm5YODB4NlNkYXZ0ZWRJTHNKMkc4MjByM0hXOTJzRTR5?=
 =?utf-8?B?YnhNZitrRHdLSm9kYjZxTDVaMTJ5a2s3NjB1eHFuYkV4RTM0QXZQMnVUZkY5?=
 =?utf-8?B?VEtHeWFSbzNOWENlbStpWnJNUndSU3E1MXA3eGN4RGp3c2d6a3JidkVLVGNy?=
 =?utf-8?B?VDM4YmtKRTFqNHhoNDVNeGRINkJBeTBHYXRCaWN3bjlQK0gzWTI5ZWl3Q1Ji?=
 =?utf-8?B?RjB3SXk4NFZxZzBxZWVSQllSNVJ3b1EwR2hDMTJHNHJIRG9KVXFhd01WbjFy?=
 =?utf-8?Q?ZknxlayLGXW9NmtVKy4LqBZr0TRcQGvx9wALoFbz/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2FC8785D3A0F341B204CA6E2B84C072@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a910b178-3f99-4f87-af71-08d9f760b602
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 06:41:39.1717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efw5POgzGLmaM7oZZQVvzRUlX+x7AZbzqAnje39j0cjTZycc+Va1WtANNnU3PXrPjs/zqAvnFd2n8ACRob+EfKothgs9aypsyOkGIUGc9Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2081
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
Cc: Kees Cook <keescook@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAyLzIwMjIgw6AgMjE6NDgsIEdhYnJpZWwgUGF1YmVydCBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIEZlYiAyMywgMjAyMiBhdCAwNjoxMTozNlBNICswMTAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4gQ29tbWl0IGE4MmFkZmQ1YzdjYiAoImhhcmRlbmluZzogSW50cm9kdWNl
IENPTkZJR19aRVJPX0NBTExfVVNFRF9SRUdTIikNCj4+IGFkZGVkIHplcm9pbmcgb2YgdXNlZCBy
ZWdpc3RlcnMgYXQgZnVuY3Rpb24gZXhpdC4NCj4+DQo+PiBBdCB0aGUgdGltZSBiZWluZywgUFBD
NjQgY2xlYXJzIHZvbGF0aWxlIHJlZ2lzdGVycyBvbiBzeXNjYWxsIGV4aXQgYnV0DQo+PiBQUEMz
MiBkb2Vzbid0IGRvIGl0IGZvciBwZXJmb3JtYW5jZSByZWFzb24uDQo+Pg0KPj4gQWRkIHRoYXQg
Y2xlYXJpbmcgaW4gUFBDMzIgc3lzY2FsbCBleGl0IGFzIHdlbGwsIGJ1dCBvbmx5IHdoZW4NCj4+
IENPTkZJR19aRVJPX0NBTExfVVNFRF9SRUdTIGlzIHNlbGVjdGVkLg0KPj4NCj4+IE9uIGFuIDh4
eCwgdGhlIG51bGxfc3lzY2FsbCBzZWxmdGVzdCBnaXZlczoNCj4+IC0gV2l0aG91dCBDT05GSUdf
WkVST19DQUxMX1VTRURfUkVHUwkJOiAyODggY3ljbGVzDQo+PiAtIFdpdGggQ09ORklHX1pFUk9f
Q0FMTF9VU0VEX1JFR1MJCTogMzA1IGN5Y2xlcw0KPj4gLSBXaXRoIENPTkZJR19aRVJPX0NBTExf
VVNFRF9SRUdTICsgdGhpcyBwYXRjaAk6IDMxOSBjeWNsZXMNCj4+DQo+PiBOb3RlIHRoYXQgKGlu
ZGVwZW5kZW50IG9mIHRoaXMgcGF0Y2gpLCB3aXRoIHBtYWMzMl9kZWZjb25maWcsDQo+PiB2bWxp
bnV4IHNpemUgaXMgYXMgZm9sbG93cyB3aXRoL3dpdGhvdXQgQ09ORklHX1pFUk9fQ0FMTF9VU0VE
X1JFR1M6DQo+Pg0KPj4gICAgIHRleHQJICAgCWRhdGEJICAgIGJzcwkgICAgZGVjCSAgICBoZXgJ
CWZpbGVuYW1lDQo+PiA5NTc4ODY5CQkyNTI1MjEwCSAxOTQ0MDAJMTIyOTg0NzkJYmJhOGVmCXZt
bGludXgud2l0aG91dA0KPj4gMTAzMTgwNDUJMjUyNTIxMCAgMTk0NDAwCTEzMDM3NjU1CWM2ZjA1
Nwl2bWxpbnV4LndpdGgNCj4+DQo+PiBUaGF0IGlzIGEgNy43JSBpbmNyZWFzZSBvbiB0ZXh0IHNp
emUsIDYuMCUgb24gb3ZlcmFsbCBzaXplLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNo
L3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMgfCAxNSArKysrKysrKysrKysrKysNCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5TIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5T
DQo+PiBpbmRleCA3NzQ4YzI3OGQxM2MuLjE5OWYyMzA5MmMwMiAxMDA2NDQNCj4+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9lbnRyeV8zMi5TDQo+PiBAQCAtMTUxLDYgKzE1MSwyMSBAQCBzeXNjYWxsX2V4aXRfZmluaXNo
Og0KPj4gICAJYm5lCTNmDQo+PiAgIAltdGNyCXI1DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdf
WkVST19DQUxMX1VTRURfUkVHUw0KPj4gKwkvKiBaZXJvIHZvbGF0aWxlIHJlZ3MgdGhhdCBtYXkg
Y29udGFpbiBzZW5zaXRpdmUga2VybmVsIGRhdGEgKi8NCj4+ICsJbGkJcjAsMA0KPj4gKwlsaQly
NCwwDQo+PiArCWxpCXI1LDANCj4+ICsJbGkJcjYsMA0KPj4gKwlsaQlyNywwDQo+PiArCWxpCXI4
LDANCj4+ICsJbGkJcjksMA0KPj4gKwlsaQlyMTAsMA0KPj4gKwlsaQlyMTEsMA0KPj4gKwlsaQly
MTIsMA0KPj4gKwltdGN0cglyMA0KPj4gKwltdHhlcglyMA0KPiANCj4gSGVyZSwgSSdtIGFsbW9z
dCBzdXJlIHRoYXQgb24gc29tZSBwcm9jZXNzb3JzLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8NCj4g
c2VwYXJhdGUgbXRjdHIgZm9ybSBtdHhlci4gbXR4ZXIgaXMgdHlwaWNhbGx5IHZlcnkgZXhwZW5z
aXZlIChwaXBlbGluZQ0KPiBmbHVzaCkgYnV0IEkgZG9uJ3Qga25vdyB3aGF0J3MgdGhlIGJlc3Qg
b3JkZXJpbmcgZm9yIHRoZSBhdmVyYWdlIGNvcmUuDQoNCkluIHRoZSA4eHgsIENUUiBhbmQgTFIg
YXJlIGhhbmRsZWQgYnkgdGhlIEJQVSBhcyBhbnkgb3RoZXIgcmVnIChMYXRlbmN5IA0KMSBibG9j
YWdlIDEpLg0KQUZBSVUsIFhFUiBpcyBzZXJpYWxpemUgKyAxDQoNCj4gDQo+IEFuZCB3aGF0IGFi
b3V0IGxyPyBTaG91bGQgaXQgYWxzbyBiZSBjbGVhcmVkPw0KDQpMUiBpcyByZXN0b3JlZCBmcm9t
IHN0YWNrLg0KDQpDaHJpc3RvcGhl
