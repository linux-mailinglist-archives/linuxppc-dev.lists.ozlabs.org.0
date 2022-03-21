Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB24E2229
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:27:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSRM1zkJz30Ld
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSQs3lt5z3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:27:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLWMh+d/JnyiNCId6TJn26K7q1FkUlnL+ZxH/UO+FTRlnUDIl9smWD+pfWe0no5ZpfU1Q4ywjqYM70Ncf3ywOduHtcdksc7cbOeJVf/CnTFMtZWFgSGZQuqEYnCye5kTaBdZDcr9aulRxste9xwdGd540PECjEKmJnPEL7gxoLRx2Nb7hSUAPSS2+bobQ2XZHjq+8NLuIC06HCy+2SQwiMZnL/IpVljtVIfiwbXFIAqWlC1jE9vP6ND/ORjoduY36SE7k29zvX8LoFxkLJXzYD6LWDPL1hjv5EjW8ntNHHj1zqWH8AC5nPb2V2q4rWl+8pt5NCItvslmPQWu6BfnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Crzqcy3QOmrfhfvRZ2AVB35pbSk1Jr5qJIMqF6OLS0=;
 b=OhU8RSbBc4IMmi5QXnKFvPA0lGxpJsSpZNvmxivg+0htzpuY9NfV6C7TNsYZ2TKCzqkUDbiRxyIJYlKEXt47sWqwYwzE2/nQ2OQYIRwMV1EUnREBxHO+7zjCwKZsPK9pd5ghwSAzN2buontOLDtGxLdluvcY90I1FWfG4XJS2VjIEa9UXH+Q3GaB6sUwDd0jjHVsdCBQmRqG0uq5L/zQnJSdTl7XEihCdeaCsTlXSUraIgj1m/NSY5l7bVQfMESipQ9uhpNU3U5bwGyPjgUSCZv35TBCNf5a+7j+ZzEae08nC09YkHSyBkoVaKQaRBZfuMEXH1OqBmAeIA6j9lU+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3239.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 08:26:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:26:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika
 Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
Thread-Topic: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
Thread-Index: AQHYOxG8iT5LzJosbEiV0QsgTuVp66zJbicAgAAUeQCAAAIUAA==
Date: Mon, 21 Mar 2022 08:26:55 +0000
Message-ID: <b06bb9bc-22d1-acce-fe68-c7c4cb7c15b5@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-3-sv@linux.ibm.com>
 <8e792a9a-afb8-9b26-5e97-8f51c72c2d42@csgroup.eu>
 <1647850610.961i89najm.naveen@linux.ibm.com>
In-Reply-To: <1647850610.961i89najm.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d5267f-5fc0-4456-fe98-08da0b148f43
x-ms-traffictypediagnostic: PR0P264MB3239:EE_
x-microsoft-antispam-prvs: <PR0P264MB3239A24CA402B28C0750EF16ED169@PR0P264MB3239.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v/wwx8byFME4na5bKno5W2mKGkI3OgkIlch2YpsKQ2g/VG+40lJHbe0+XRN7uHDQ8CLgn6LD6MVPhHAOAEITgMIEQXCaeOnSz2aGmbHa+FEEp+sC5m6wdbmdYHhRPibGo2uyLVtDxYJRgURTbmWTD3uCPf7mlOR3klWyMNq0V/Rx/FPQA03DOUuqP/1rV7TWYa6zIEG3pXfwmJo+LLoX1DGH63Zb5rsU72ajre1QrDTEpTQPveDlM9LrKkHNRNg80aGl6XFJ8iUIFeLnzwh9XT5Sv4GT42A4e4XmY4PLtZKOfOSsSdXoY8m863tOpGBdes8dxZKgr1hAI9yeGDBF/G7gDudCxuR4fFIv+2b+HWI57+4/35WlW+ZHU1VBJ3eGUathP4NotQPNY62DLLqW/9Qi+QOnjsC4xtoqOnZdduzWRD06dSd2kcPSH2Asd9gH5hsYACw9zaOb216E9yu8pwhVK7chMg2pGkka9r3+IUNe99n1hJu/4DU9uF3CGgUG6Uhj5Z1c+8N3zewQWfD5Cie8sjy901NYqMNleSlCyP21/Jxmx8omBBIlNUpTBK75kRfDD0AVy088EfV45unjixt/OGQBdMt9qtg5rMkLsNk8TbvpG1jJFSYjdqjRLGo9SIIsSNjNeUvIKHGOwW75UUNNasE1LVbbidEgC2Maud7EphfnNb45Q0FY5QX6vemswQ5dO1og5qMCJzVzbtThnmuK0sXGJipJzibLTwsigLjnDrTPxCpGqOWbMGFs0Nn0SlddboqHYqBjYaqdRYdrLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(186003)(86362001)(26005)(2616005)(508600001)(6512007)(6506007)(71200400001)(6486002)(38100700002)(122000001)(31696002)(316002)(83380400001)(38070700005)(8676002)(4326008)(91956017)(36756003)(110136005)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(31686004)(2906002)(76116006)(8936002)(5660300002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnZWRkxXRzdYV1J6YUFKN3RwOFd6WFdXZWJId1ErekszTmtTc1RtWmNUS05a?=
 =?utf-8?B?ZFFjdmhJYWVIWmt1U0E5enB3Y2h5ckhlUUJUMUYrb2RUWWlwWU9NMWF4cGxV?=
 =?utf-8?B?cHIxYkN4aVdaU0taVEdsK21SZTk5QWwxTE5vT09qUmJFQkJzVG1rUTJOVW1X?=
 =?utf-8?B?R3puNk9OMk9ROXg1Yk92REo5bmhlTXNoZU8vRmNjaWZSUzdsZzBBTnp1WGZk?=
 =?utf-8?B?NUZUb3ZrOHJUMkc3Zzg3bEZURlNZaXpIbU5kYlhrdVdnSlNuQ1hXUzFKNEpz?=
 =?utf-8?B?VWJkdmZrOFkrd1BWdlBYTFZKUWR0YVlPWWFicG1iYjVacWg1L1BKS0dhSmhx?=
 =?utf-8?B?OE1PcmtKWDJ4ZEpGOStBdEJJWGtIL20wQVZNQ0FxUG94ckcvR1puU2J2QzN2?=
 =?utf-8?B?WXFMa0E1M3ZmbkZ4R0k5Y0cySWNJQVZER0g0MnRSWVRMYUxJcURDVytzM01X?=
 =?utf-8?B?WDc3azVJb1EzMVdNV0RVZnhoWTJ5QXkrUWovSjM1dXBtc2JqdDBYMU0zd2xZ?=
 =?utf-8?B?OEl0aDhvSFJibUd0N082RVVtd1JQZ1h4MzVZaDVBUndmcEhNc1dOSFBBQ0Nz?=
 =?utf-8?B?YXFoTkYzUExCUUdpV1hIa0Jucnd1RlVaYUkrdXRzb25DTnp3aEc5Wkkrckli?=
 =?utf-8?B?dUhnV0tFZ0NRd2I4ZDJXQzdtUnA2RWdSWlh4d2pnS29kS2paczFGWjdSSEpy?=
 =?utf-8?B?bFBxN3JwbVF1TlRvV0M2eWszaEhibmdHNmJUelMxMS83MjJtTCtqbGxSSWM3?=
 =?utf-8?B?Qis0UTdIcnFRNGVLYXU4VVJ1OU9ubmNnY2w3WUtuMFkvU3JmcG5jOW4zMG5i?=
 =?utf-8?B?VHFPdnpDVXZ2REJJZWdoSFRvVVNQTHJ3WlI5bkw3cEtGOTEvckROazUzRDl2?=
 =?utf-8?B?RTE2MEFMazhMRHR6VVF2aGYrMERTRnBtZGdWMUhab2RRbVQvWk5RSnlRdy9H?=
 =?utf-8?B?QkU2OGhYUmtkSSt3NzRqV3RaZ3hjbFJiZkhCS2ljSmNJdjRGbzlkVXNtUGFp?=
 =?utf-8?B?NTF3VzFnZWg5aE1RK2VSNWo2RTY5M1paSjY4Snkvazl6MzY0WEJJaWdsdjhN?=
 =?utf-8?B?ZEdJV0ptTlFRU0RTWm1Ud2QvREpuNDBEb1lSdysvNkVSVm5JUTdQR2gzTysv?=
 =?utf-8?B?K20vbjU0bnkvN1RQUmh4K3hsMkxhMUN3WlpFTFFwalhseFF3UXVRNkFFbEtZ?=
 =?utf-8?B?UzZBcXVBREtrKytRKzQ0b3QwVkFGaGZuQnptWjd3R0lUZFM5M09LTERzSG5S?=
 =?utf-8?B?VlJxZU5Bd3BQLytOdDROLzZWVlBTS3N1UXBmYW5ZbTFnNjNZRmh5R0tIdU9B?=
 =?utf-8?B?SmR4VlFZYURTWTVaTGZZQ3RYZDBOZXBoUjhQVnpUbUFKS1lscTBKeFZDTzNu?=
 =?utf-8?B?aysycm5Ublk3cTZSV0ZxQXF6U0dBdHEzTHZCVHphbE1mQXdRTnhuWnMrU1BN?=
 =?utf-8?B?M2dCNVA5NVc1VmdRcHdlazlXZGFJaVVIYUlDL2ZtSmxmUXdYK01xTEFVNWVa?=
 =?utf-8?B?QnR2bFFrc1JiaFBvbXlET0xaNHc3Rmd5VFZjT3MzbERKUVJuNDE5VGtPWUMx?=
 =?utf-8?B?S0gxVy9uZUc4LzFhV3lVNlBUTnZTZjBheFZXbm1RWFdTWThxL2RqZGFHOXQy?=
 =?utf-8?B?dksxajZFOTRTMG1WVk9CTmlUQ2VXTmhOWUtSendZQnRUNFp0WHd3MU9KbVpy?=
 =?utf-8?B?K1N1VkJIaGhlUzlxL0lkSVJjWjBWb2c4ZndwNUgzSkFkSXM1L09ma0ZucG5q?=
 =?utf-8?B?SUJBajRaOVJQOVJoK0t5WGhTbjlReDVGdmRMR25nc3krUGN4QXNmOEx2dnlQ?=
 =?utf-8?B?WDRJcE9oMVlYQ1lCclIxci92YnpHSTZtQUd0cG1sNW1HS1ZSNFlkYnI5Tkll?=
 =?utf-8?B?Nk8rM1ppUCs2TCtGZEQzTHU0cHI2ZFNnbmxHM09hbG91UytiWXI5b1VqS3RP?=
 =?utf-8?B?N3Bsd1hPTlB4S2JWRFlKYUZTOS8xQ3NGczFLZjFDVVg0cG1sSGVDR25UTDBh?=
 =?utf-8?Q?LC+5S8EMdLX6R48i8RFEMknKjFZh60=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <063759FA4447D34C966064B1A10B2E69@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d5267f-5fc0-4456-fe98-08da0b148f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 08:26:55.6258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDIYASWsmQoHRb/ZhT+te1ureHLbWWh6TVsVWrOcqm6xc8qpvuobXTu0uo1n+OJqjRZUAu4sa+FSXLUDo0rYlfneuJobHhKa5vk+q8Mmhbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3239
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
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDk6MTksIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTgvMDMvMjAyMiDDoCAxMTo1
MSwgU2F0aHZpa2EgVmFzaXJlZGR5IGEgw6ljcml0wqA6DQo+Pj4gVGhpcyBwYXRjaCBhZGRzICdt
Y291bnQnIGFzIGEgc3ViY29tbWFuZCB0byBvYmp0b29sLCBhbmQgZW5hYmxlcw0KPj4+IHRoZSBz
YW1lIGZvciB4ODYuIG9ianRvb2wgaXMgYnVpbHQgaWYgQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNF
X09CSlRPT0wNCj4+PiBpcyBzZWxlY3RlZC4gQWRkaXRpb25hbGx5LCBhcmNoaXRlY3R1cmVzIGNh
biBzZWxlY3QgSEFWRV9OT1BfTUNPVU5UDQo+Pj4gaWYgdGhleSBjaG9vc2UgdG8gbm9wIG91dCBt
Y291bnQgY2FsbCBzaXRlcy4gSWYgdGhhdCBjb25maWcgb3B0aW9uIGlzDQo+Pj4gc2VsZWN0ZWQs
IHRoZW4gLS1tbm9wIGlzIHBhc3NlZCBhcyBhbiBvcHRpb24gdG8gJ29ianRvb2wgbWNvdW50Jw0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0u
Y29tPg0KPj4+IC0tLQ0KPj4+IMKgIE1ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArKw0KPj4+IMKgIGFy
Y2gveDg2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDMgKy0NCj4+PiDCoCBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKysrDQo+Pj4gwqAgdG9vbHMvb2JqdG9vbC9C
dWlsZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+
Pj4gwqAgdG9vbHMvb2JqdG9vbC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgNCArLQ0KPj4+IMKgIHRvb2xzL29ianRvb2wvYnVpbHRpbi1tY291bnQuY8Kg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNzQgKysrKysrKysrKysrKw0KPj4+IMKgIHRvb2xzL29ianRv
b2wvaW5jbHVkZS9vYmp0b29sL2J1aWx0aW4uaCB8wqDCoCA0ICstDQo+Pj4gwqAgdG9vbHMvb2Jq
dG9vbC9pbmNsdWRlL29ianRvb2wvb2JqdG9vbC5oIHzCoMKgIDEgKw0KPj4+IMKgIHRvb2xzL29i
anRvb2wvbWNvdW50LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTM4ICsr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4+IMKgIHRvb2xzL29ianRvb2wvb2JqdG9vbC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+Pj4gwqAgdG9vbHMvb2Jq
dG9vbC93ZWFrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1
ICsNCj4+PiDCoCAxMSBmaWxlcyBjaGFuZ2VkLCAyNDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9idWlsdGluLW1j
b3VudC5jDQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvbWNvdW50LmMN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlDQo+Pj4gaW5kZXggNTVh
MzBjYTY5MzUwLi4zMTZmN2QwOGIzMGEgMTAwNjQ0DQo+Pj4gLS0tIGEvTWFrZWZpbGUNCj4+PiAr
KysgYi9NYWtlZmlsZQ0KPj4+IEBAIC04NDYsNyArODQ2LDkgQEAgaWZkZWYgQ09ORklHX0ZUUkFD
RV9NQ09VTlRfVVNFX0NDDQo+Pj4gwqDCoMKgIGVuZGlmDQo+Pj4gwqAgZW5kaWYNCj4+PiDCoCBp
ZmRlZiBDT05GSUdfRlRSQUNFX01DT1VOVF9VU0VfT0JKVE9PTA0KPj4+ICsgaWZkZWYgQ09ORklH
X0hBVkVfTk9QX01DT1VOVA0KPj4+IMKgwqDCoCBDQ19GTEFHU19VU0lOR8KgwqDCoCArPSAtREND
X1VTSU5HX05PUF9NQ09VTlQNCj4+PiArIGVuZGlmDQo+Pj4gwqAgZW5kaWYNCj4+PiDCoCBpZmRl
ZiBDT05GSUdfRlRSQUNFX01DT1VOVF9VU0VfUkVDT1JETUNPVU5UDQo+Pj4gwqDCoMKgIGlmZGVm
IENPTkZJR19IQVZFX0NfUkVDT1JETUNPVU5UDQo+Pj4gQEAgLTEzMDMsNiArMTMwNSwxMCBAQCBp
ZmRlZiBDT05GSUdfU1RBQ0tfVkFMSURBVElPTg0KPj4+IMKgIHByZXBhcmU6IHRvb2xzL29ianRv
b2wNCj4+PiDCoCBlbmRpZg0KPj4+ICtpZmRlZiBDT05GSUdfRlRSQUNFX01DT1VOVF9VU0VfT0JK
VE9PTA0KPj4+ICtwcmVwYXJlOiB0b29scy9vYmp0b29sDQo+Pj4gK2VuZGlmDQo+Pg0KPj4gSSBk
b24ndCB0aGluayB0aGF0IHdpbGwgd29yayBmb3IgcG93ZXJwYy4NCj4+DQo+PiBTZWUgYXJjaC9w
b3dlcnBjL01ha2VmaWxlDQo+Pg0KPj4gcG93ZXJwYyBidWlsZHMgdGhlIFZEU08gdW5kZXIgcHJl
cGFyZTogLCBhbmQgcG93ZXJwYyBoYXMgDQo+PiBDT05GSUdfSEFWRV9HRU5FUklDX1ZEU08gc28g
dGhlcmUgYXJlIHNvbWUgQyBmaWxlcyBpbiB0aGF0IHN0ZXAgdGhhdCANCj4+IHNlZW0gdG8gdXNl
IG9ianRvb2wsIGFsbHRob3VnaCB0aGF0IGxvb2tzIG9kZCB0byBtZS4gTXVzdCBiZSBzb21ldGhp
bmcgDQo+PiB0byBmaXggc29tZXdoZXJlLg0KPj4NCj4+IMKgwqAgcG93ZXJwYzY0LWxpbnV4LWdj
YyANCj4+IC1XcCwtTU1ELGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby8udmdldHRpbWVvZmRheS02
NC5vLmQgLW5vc3RkaW5jIA0KPj4gLUkuL2FyY2gvcG93ZXJwYy9pbmNsdWRlIC1JLi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQgIA0KPj4gLUkuL2luY2x1ZGUgLUkuL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL3VhcGkgDQo+PiAtSS4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2VuZXJhdGVkL3Vh
cGkgLUkuL2luY2x1ZGUvdWFwaSANCj4+IC1JLi9pbmNsdWRlL2dlbmVyYXRlZC91YXBpIC1pbmNs
dWRlIC4vaW5jbHVkZS9saW51eC9jb21waWxlci12ZXJzaW9uLmggDQo+PiAtaW5jbHVkZSAuL2lu
Y2x1ZGUvbGludXgva2NvbmZpZy5oIC1pbmNsdWRlIA0KPj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBp
bGVyX3R5cGVzLmggLURfX0tFUk5FTF9fIC1JIC4vYXJjaC9wb3dlcnBjIA0KPj4gLURIQVZFX0FT
X0FUSElHSD0xIC1mbWFjcm8tcHJlZml4LW1hcD0uLz0gLVdhbGwgLVd1bmRlZiANCj4+IC1XZXJy
b3I9c3RyaWN0LXByb3RvdHlwZXMgLVduby10cmlncmFwaHMgLWZuby1zdHJpY3QtYWxpYXNpbmcg
DQo+PiAtZm5vLWNvbW1vbiAtZnNob3J0LXdjaGFyIC1mbm8tUElFIA0KPj4gLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWltcGxpY2l0LWludCANCj4+IC1XZXJy
b3I9cmV0dXJuLXR5cGUgLVduby1mb3JtYXQtc2VjdXJpdHkgLXN0ZD1nbnU4OSAtbWJpZy1lbmRp
YW4gLW02NCANCj4+IC1tc29mdC1mbG9hdCAtcGlwZSAtbXRyYWNlYmFjaz1ubyAtbWFiaT1lbGZ2
MSAtbWNhbGwtYWl4ZGVzYyANCj4+IC1tY21vZGVsPW1lZGl1bSAtbW5vLXBvaW50ZXJzLXRvLW5l
c3RlZC1mdW5jdGlvbnMgLW10dW5lPXBvd2VyNyANCj4+IC1tY3B1PXBvd2VyNSAtbW5vLWFsdGl2
ZWMgLW1uby12c3ggLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyANCj4+IC1tbm8tc3Ry
aW5nIC1XYSwtbWFsdGl2ZWMgLVdhLC1tcG93ZXI0IC1XYSwtbWFueSAtbWFiaT1lbGZ2MSANCj4+
IC1tY2FsbC1haXhkZXNjIC1tYmlnLWVuZGlhbiAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD10bHMg
DQo+PiAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1yZWc9cjEzIC1mbm8tZGVsZXRlLW51bGwtcG9p
bnRlci1jaGVja3MgDQo+PiAtV25vLWZyYW1lLWFkZHJlc3MgLVduby1mb3JtYXQtdHJ1bmNhdGlv
biAtV25vLWZvcm1hdC1vdmVyZmxvdyANCj4+IC1Xbm8tYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVy
IC1PMiAtZm5vLWFsbG93LXN0b3JlLWRhdGEtcmFjZXMgDQo+PiAtV2ZyYW1lLWxhcmdlci10aGFu
PTIwNDggLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIA0KPj4gLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aD01IC1Xbm8tbWFpbiAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIA0KPj4gLVduby11bnVz
ZWQtY29uc3QtdmFyaWFibGUgLWZuby1zdGFjay1jbGFzaC1wcm90ZWN0aW9uIA0KPj4gLVdkZWNs
YXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVd2bGEgLVduby1wb2ludGVyLXNpZ24gDQo+PiAtV2Nh
c3QtZnVuY3Rpb24tdHlwZSAtV25vLXN0cmluZ29wLXRydW5jYXRpb24gLVduby16ZXJvLWxlbmd0
aC1ib3VuZHMgDQo+PiAtV25vLWFycmF5LWJvdW5kcyAtV25vLXN0cmluZ29wLW92ZXJmbG93IC1X
bm8tcmVzdHJpY3QgDQo+PiAtV25vLW1heWJlLXVuaW5pdGlhbGl6ZWQgLVduby1hbGxvYy1zaXpl
LWxhcmdlci10aGFuIA0KPj4gLWZuby1zdHJpY3Qtb3ZlcmZsb3cgLWZuby1zdGFjay1jaGVjayAt
ZmNvbnNlcnZlLXN0YWNrIA0KPj4gLVdlcnJvcj1kYXRlLXRpbWUgLVdlcnJvcj1pbmNvbXBhdGli
bGUtcG9pbnRlci10eXBlcyANCj4+IC1XZXJyb3I9ZGVzaWduYXRlZC1pbml0IC1Xbm8tcGFja2Vk
LW5vdC1hbGlnbmVkIA0KPj4gLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQtb2Zmc2V0PTMyMDAgLXNo
YXJlZCAtZm5vLWNvbW1vbiAtZm5vLWJ1aWx0aW4gDQo+PiAtbm9zdGRsaWIgLVdsLC0taGFzaC1z
dHlsZT1ib3RoIC1pbmNsdWRlIA0KPj4gL2hvbWUvY2hsZXJveS9saW51eC1wb3dlcnBjL2xpYi92
ZHNvL2dldHRpbWVvZmRheS5jIA0KPj4gLWZuby1zdGFjay1wcm90ZWN0b3IgLURESVNBQkxFX0JS
QU5DSF9QUk9GSUxJTkcgLWZmcmVlc3RhbmRpbmcgDQo+PiAtZmFzeW5jaHJvbm91cy11bndpbmQt
dGFibGVzIC1mZml4ZWQtcjMwIA0KPj4gLURLQlVJTERfTU9ERklMRT0nImFyY2gvcG93ZXJwYy9r
ZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LTY0IicgDQo+PiAtREtCVUlMRF9CQVNFTkFNRT0nInZn
ZXR0aW1lb2ZkYXlfNjQiJyANCj4+IC1ES0JVSUxEX01PRE5BTUU9JyJ2Z2V0dGltZW9mZGF5XzY0
IicgDQo+PiAtRF9fS0JVSUxEX01PRE5BTUU9a21vZF92Z2V0dGltZW9mZGF5XzY0IC1jIC1vIA0K
Pj4gYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXktNjQubyANCj4+IGFyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LmPCoCA7IC4vdG9vbHMvb2JqdG9vbC9v
Ymp0b29sIA0KPj4gbWNvdW50IGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5
LTY0Lm8NCj4gDQo+IFdlIGRvbid0IGVuYWJsZSBmdHJhY2UgZm9yIHZkc28sIHNvIEkgc3VzcGVj
dCBvYmp0b29sIHJ1biBhYm92ZSB3aWxsIGJlIA0KPiBhIG5vLW9wLiBUaGlzIG5lZWRzIHRvIGJl
IGNvbmZpcm1lZCwgb2YgY291cnNlLg0KPiANCg0KSSBqdXN0IGNoZWNrZWQgd2l0aG91dCB0aGUg
c2VyaWVzOiByZWNvcmRtY291bnQgaXNuJ3QgcnVuIGZvciBWRFNPLCBzbyANCm9ianRvb2wgc2hv
dWxkbid0IGJlIHJ1biBlaXRoZXIgd2hlbiB0aGUgc2VyaWVzIGlzIGFwcGxpZWQuDQoNCkNocmlz
dG9waGU=
