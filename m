Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85EA4DDB20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 15:00:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKlyg3kzlz3bPR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 01:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::610])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKly906zYz308B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 00:59:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlsF+Rsz7cxs6R3qAI2BtB5RwlHE8m9JxLuY2TCy1IOCTXKAIpNqqSdykIHwrAf/91axoyu6/z/cdXmzor+LHuce5WAmRlGXI7vR+2lhgfKeox9uzhmpa6CmG9qvDRkiy5MkGalQWJvC968uk5K1IE9MFh1QUOxyCbU09DF2/r1S4LjMDoGEX0fPLASX33Glk2bYUvnw2ha87sDfr0JAhbgyK6IfeektaJrDRWCFT+UHVtfCJ8CSRifn3Hphy+WvZUL4a+f2jewQp04QClBxTTBBnGHhvtJDOgQHspu3VjFKBIO5Q8EKTDtDXjxLVyf2aEpAhDOJBWteaKRRnEXnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmQmGIr3FPmodm34yix+JbpW7dzVXitlW8FQlevz2ds=;
 b=UbzNKIhWP8Fx3zb+ITPKh6Ny9z5PmVbZqAY7TlSdV0eGLAq+VIHGc5ktfLZyfE8e2zdVwK4xu0FurjFgGSl3pqnGXKh22vEvd+RnMV0sp1ubxE+rf8D0aYCe74XdTZ2DrcOuSLWn/KNCdlmJfKFSTDBwe5S8Fp0iAI+vGo2sctpQ8gY28dqRXR0D3r0w2YIanl89InxR/QIGwXlwDnI1iW6ZYto18BCBKUcNzRO0xw2+LzFkOF2vhr4dTuRp5wC3O95dfuKCGtUvUMzXHsQIZjD4V3mcgkTp6niX/6x/Sasc/BNM/2RJD9DJ6BX1ijXYqfLK9BRPtIdFlLiHdFLcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1627.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 13:59:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 13:59:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzFK0EA
Date: Fri, 18 Mar 2022 13:59:34 +0000
Message-ID: <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
In-Reply-To: <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae95cc6-4c61-4d0c-7eb5-08da08e78829
x-ms-traffictypediagnostic: PR0P264MB1627:EE_
x-microsoft-antispam-prvs: <PR0P264MB1627F7FC89BEFB9BE0747024ED139@PR0P264MB1627.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wEimvwXGCQNim1Z7CJqDns1113+eDgifnEQ7IZx0LD6vfA17Lht2vBArJKsKaCZf9HOBun+rrGSs/z63oV/xiHPDK5JtdQoQ/Rm03K9G6vsE0cumnfMfoQI83I/0BR8/VtXBBksv7W6NCQZMCPCjXWbQr9iBHloJokTFsTEIWdVoTqjEuJx+6ghlPtFtA9JZR1m1Lj0w9+BCAVJWKNvxw6/B0e63xp29WECbVg1h+lpyYw/a4lHapmUno+03mXD0HaA7Q3QINMIoWtL8K9SUYWZvR4oXXyjTy0/7d6/cY+Rw7yQOfmpWBGQ4gFmDa0VyWffuDJGnpxyUyk3eQKujG0BzRG0yKAOPm70lE79FG3xMTvoFJm4YbdH8WQQ27PUmTgeIUmV+axmtV2drHQ9Wx/PXQuEjLSLBlVaJ0kLpu/Ygj3OBmn1KyaYuDCRhqoWOcKim/+/ar258cx0A7/q7kTxuvrURDHUnffj3XaNKmC2MErLMzJTtgqVSZiuyg1kDRmNFOAUpLd28OFuPZUBg5sKKph7k++YBx59mUUHzPEKAmpj+dCz6ndLJFZ7B3NkoDgSt1/TOdcQDAF5pdONCYnhhLO3R9onjbv2v4DPqV+zsWYnqxDgJSV8vOKqM322biQKo3G+tOvuA/K1ET+Czkg5Ik34kDlonDsvebAn2jqV2tTmH4qdMA2X7uKLuJXbH0/S1Nt8susgio/Z+bsoCX88LlAb861O6MstJ+f/PpgxvbN/VXNypdkgegn9iL6FIYa3sgCd8tZCiGX85kM0xSlwr6NOpDsJ9YVLX6vrF2PH1ooJ0Nj9NnrFrRZBkMUPB3H/B2aa7xhuujslktbAFiiTti7r8Mi3cCtF8ysizobY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(66946007)(122000001)(6916009)(76116006)(66556008)(66476007)(66446008)(8676002)(54906003)(4326008)(38100700002)(64756008)(508600001)(6486002)(26005)(186003)(966005)(316002)(6512007)(71200400001)(6506007)(31696002)(2906002)(8936002)(86362001)(31686004)(2616005)(44832011)(5660300002)(38070700005)(36756003)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGxXRXl6ZGdtZzMzRjN0TUtudnE1bFFITmM2cXFnN2VoQ2VmNU9KMmV1amlY?=
 =?utf-8?B?MGNWaXZ4cWcyUjRBN1lMUjhsQ0xMVUR4VVhNYWc1RXJZOUNUS3pFdjlyRjk1?=
 =?utf-8?B?Z0dHSzB2c0t4bDBGTnBUOHVzL3lpdEZFWVVPSWNTN2IzVDJhZmtTMWZRSENk?=
 =?utf-8?B?anRqL3NNTXJCdnVRdzloSHVQQTc3OVJYUW1mMzgxTlRwUER4Qk5xdWg5Nk9p?=
 =?utf-8?B?b2VoZXhZNm9EQTlFaktqamJ2eUF0ZVRtMWRiSHBPRy9ocC9ZVVMwK0JzUlVh?=
 =?utf-8?B?aFF5N2p5TFNqRFQyQ1hTTStzRmJMTnRDM2NkTnZPL3JpR3VBQXlEeExZVFdy?=
 =?utf-8?B?WlFWdTh2VXZpZkFWVi9YWXFFRkNHT3ZNbW1pZXhYeElMTWF4bUNVWFMzYnAw?=
 =?utf-8?B?dGlBNTl4L1E1V1EzQytjMDViMXY5c3l3QTd2VEVOanVHS2x3R2ZkUEhHekl0?=
 =?utf-8?B?NWtvVGZyUm9GZlgzbmJKV3pUeHp4L0NOcEw5aGFLR2U1cXFXbnM0czc5UW9J?=
 =?utf-8?B?aVYySzMrQktOaVhKaUtOd2JxbzkyOEQrYlI3VU5aVndGMitZVUlwYVJUSzZQ?=
 =?utf-8?B?SVlJSXQyVSt2MDFEU2ZER3FQbS9icVY0b1FDakQ0SDFMR0Zma2UrZzZ5ZFRs?=
 =?utf-8?B?MXN6U3lqUDNEUlo3bC9HWER5VnRVQk9hbm9nalVPVGlGNWwzTEl4VEY4VFBK?=
 =?utf-8?B?bTJnYmNnenEzR3F2cDJWcjdGeVpoTDVkU01ENENWL3B4QXBkS2h1WlBXTXE0?=
 =?utf-8?B?c0d6WkFjWDAveUQwZ3I2NStwRFlMSVRxNVpnRWwzbVFmdEZFcW4vWVNaTFpq?=
 =?utf-8?B?Z2RHcHpHaGpHN0o2WDY1OVFaUnRjbWdzVXVoL3FicmMzTUZNOGplSmluMUNU?=
 =?utf-8?B?ZEtWQkhIeDhTYjhZWHVnem9SQWorYU80NFhsRkpBVXZQSHdXbTlrMVE2VzJG?=
 =?utf-8?B?VjhTZ1JRYTYxUW05cVFLNGJRR05tbFNrNEhQekc0RlN1UnZXaHF4MFI0a0p3?=
 =?utf-8?B?WTVhTDUzWVFFWmNXTlhEZWw4ejdLbnpScHJKTVFGamozM3d4UkdvUlQ5MTBO?=
 =?utf-8?B?ZDAxRkY3aStyb2lKbDNJVHFWQjI0VWkxaXU4TStNaEpaZDl3U0VreFRKS1Rk?=
 =?utf-8?B?eXVqSjJ5SmlIYTZ2aS82cDhlR2VtMmhiQldyRy9oZTUrSms4WEQyUnc0RmVa?=
 =?utf-8?B?OGdhZEdVMGp0NGJnaVFQeTArYXhySldUdlhLKzZHVmRDMUk2NTE5YXdSdjhm?=
 =?utf-8?B?WmJTNnFBbUZjaktzVjJnTDJmQnFyZFl6RjZCcVlXclhERHA5K0xGR1dsRFBK?=
 =?utf-8?B?bll3d3p6Um9IZjE0ZytFNzN1RU1YOEhnK1FRMEdsSmZKZTA0NTlFdkcvMmlS?=
 =?utf-8?B?OE9CQXREV0hvWHV4bzFOb3E2S1QxUytzc29uN3VRZER5Q3FSNmJZRlhpNExE?=
 =?utf-8?B?OExHUHp0WTcrajVyZkl3RTlMVG5rODZSK05CTDAwSTdTZWt2TnljeUxWU1da?=
 =?utf-8?B?S3hlMWxQemhSNkJzRTVBYlRjeFBMdUxiWVgxbVNvSXVzcVBjbFRWZ1pHazBm?=
 =?utf-8?B?WEpoMzZWaUs1SjhYM0g4b2NVNnlsTUpiVkFmdVY1STVTUWlFeVJHZEJuTGVr?=
 =?utf-8?B?ZzZxU0xjWGFjSjJoOSt6bkw0MjZ4cmFoaXVaa0pTOEl6NXR3Rk1ZZXhlb1V0?=
 =?utf-8?B?ZFdiU1BwMnhZUkhuTC90cWR2N1VwNFZpVklpbzI3dGN0TE9FcHhlYkNleHhW?=
 =?utf-8?B?dWcvWjBxUDhrZFJzekpqTnh5Z2tEYlhKYXJmb2VGcVpLM0FSaURvUnBERGFo?=
 =?utf-8?B?YjFmdXp3UW5kZS9oTEJXLzlHZSsrL09KLzhBZCtsOFM5WXZtcEJDZ3M4d3Bt?=
 =?utf-8?B?UFZ3c2pybzl6SzhmTzRXcVhKLzFiKzM2L0xQWVZzWGF6eWEwa05oRlJ4MlFn?=
 =?utf-8?B?c1o3VFZ1aWxxeUU1SUpGZnJ0QjZ0Wm81SkZuSE1nZ0dNTUNLTXY2amVyckxo?=
 =?utf-8?Q?5q1sHkVpLhVActGge/TNHt07VYkZ34=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34434F866BB88047B379CE48EA2B2C48@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bae95cc6-4c61-4d0c-7eb5-08da08e78829
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 13:59:34.0453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBMr0wOzdjUntQtxV2KS6pynrYx3UvXIw31sIDj8/wpoyusTnAl0Y39nPagMS2eDX7zAHLvldh9x9qlQ6B+KbUjkl1qMHOXjdRIlafQjpv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1627
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDE4LzAzLzIwMjIgw6AgMTM6MjYsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6
DQo+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDA0OjIxOjQwUE0gKzA1MzAsIFNhdGh2aWthIFZh
c2lyZWRkeSB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggYWRkcyBwb3dlcnBjIHNwZWNpZmljIGZ1bmN0
aW9ucyByZXF1aXJlZCBmb3INCj4+ICdvYmp0b29sIG1jb3VudCcgdG8gd29yaywgYW5kIGVuYWJs
ZXMgbWNvdW50IGZvciBwcGMuDQo+IA0KPiBJIHdvdWxkIGxvdmUgdG8gc2VlIG1vcmUgb2JqdG9v
bCBlbmFibGVtZW50IGZvciBQb3dlciA6LSkNCg0KSSBoYXZlIG5vdCByZWNlaXZlZCB0aGlzIHNl
cmllcyBhbmQgSSBjYW4ndCBzZWUgaXQgb24gcG93ZXJwYyBwYXRjaHdvcmsgDQplaXRoZXIgKGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8pDQoN
CkRpZCB5b3Ugc2VuZCBpdCB0byBsaW51eHBwYy1kZXYgbGlzdCA/IElmIG5vdCBjYW4geW91IHJl
c2VuZCBpdCB0aGVyZSA/DQoNCg0KSXMgeW91ciBzZXJpZXMgYSByZXBsYWNlbWVudCBvZiBzY3Jp
cHRzL3JlY29yZG1jb3VudC5jID8NCg0KSWYgc28sIGlzIHRoZXJlIGFueXRoaW5nIGNvbW1vbiB3
aXRoIHRoZSBmb2xsb3dpbmcgUkZDOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2Nv
dmVyLjE1OTExMjUxMjcuZ2l0Lm1oZWxzbGV5QHZtd2FyZS5jb20vDQoNClRoYW5rcw0KQ2hyaXN0
b3BoZQ0K
