Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 068AF4E20A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 07:38:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQ1d6ysPz3bXv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 17:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQ170d1dz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 17:38:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtPu4sJTyLE++kvyWIMjbDpG6R/7qoKCKfTeCwpABBLhQCZjKWANHFqagzusdwpu2hOw7z5xnV8cDHm7NnFiIZXxnYQBoEwdk/3GWhqgpLreFpR4DT9+PxLQlSuGB7j6lBXaAt/BFC57xrHSKhlTz7ReWKln0d46WP6ZwVhy9Yc7FNB2fk8pwVuLCsUQXh8OJtrHbH0lP8jQLQkMiKeGtVHP8R/bZM0Qn6YqR3IBI+hlAWhheK4ZXEFi8ESDtM+3tQRhE8z3qHARWYQyTbIfXJecLyfqYKOl9OuidNSXF4VyXW+Kmue5nrLgveXq298nOfbo8ShDcn+YpOXS/2vUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMZbTqPoT+WJfxj1IcIXJXhgDve7D7SsxNsv4bBySIk=;
 b=kRwf9kQo1HMp4/IgWT6D7zBX7+zXdq6KuvUqi0Z2atU41SEefyZMNNB9JqZG+swNWBMuQXseQ24mwGsBzMExTxUegRr7p8tefxnrtBPRVP4ThddfiAqphUdRV/0W2Zu7Y3jHe9lRFGPJj6PTXwRmhkJxiSS+2+vIGmYgbOZWWJMqbrOE2l04ktepMmK7DnbYVODA5QoUIBhI8LpWFcudK+Nx/JlwdRQnc0zotMu345f0QOuIyeyxVRxaztBI1NuXYI1N+pOlgwF2KJRavwuQNpcSh7EU+1W36uipTg6zsOm4Crrt0TVd6WRaUgf5F1Tk4D80eTUwVMa2y+U2GaYJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0627.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 06:37:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:37:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
Thread-Topic: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
Thread-Index: AQHYPNyiu03EmEvHYkCft49mNZyboazJYquA
Date: Mon, 21 Mar 2022 06:37:55 +0000
Message-ID: <5291a177-9a67-b23a-515f-7faa3cc887e8@csgroup.eu>
References: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
In-Reply-To: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14320ca7-5b25-4573-5298-08da0b055507
x-ms-traffictypediagnostic: MR2P264MB0627:EE_
x-microsoft-antispam-prvs: <MR2P264MB06274B0163739EC8F14F2A49ED169@MR2P264MB0627.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jtnNNl79ZMlDP1mDoKxwJvlJELVzmSDsREVafxaBCeg/qIywsgWB+IIxD7U3JtSKi21bGu+fAI1Pio0GBC1Vv6cHehbBZS6+1f0tRaGgiiRCm4VWQ9lVyr/a90U5ExIbQbCpN9YNMLEE/1XWdNzxBcWikZ0/+E06v24licSgmGln5K6yrsMyV+s2CreLqQ2ajopN4joxDyXfZODAcoECiF++XM8Joql2zmfOHDEGKmVAYQJgODTFCfqTVmehlogBQzvWTRbKFubJNN6kAUFQ4lH12i7PSdJKMDNME+jbMvYfUsnWbeUXnUN2aLJMsr7KeCfbOoRllDAeIEzERpwsOqoohWYS6tCjEnSMK8n9xCXa8r8YhNNIADoAQI0rv/3oeUQEoEBISAa8O27h1JRxYodpCIJ1VJQ2Xw6qSZEVJ+sXffgpFC71bvtz7mNwSrnGvXx/Ewd+JzQfa1XgmQBaAs+g2Kx7f8lOJi2v66f7sE9rwKJDS+aMqjo4yYkaS4oc68isv2mNyjA6ggzBWaEjlFLsSbdDJIug2kRlNDTKw0dGZ96cblKFOgnmdTz7WgSmi7IJerblUvFdq1IbtY+PtlVds8x1/IHJGwB/T6y3zOpm0s2eshJkxFuCkQW3ebrEy38Cd0xuyjSs4T2x8DqUqGfnV5bFgHh8jzThT/x6ZNqyg0LJsiOljPpru74whojt5Ee8cXerwEpT63iX64msTONg6NvTMOSbHsN7S8GP0P5eX2OOUySkpk2XmzkkYsLhBmZVgtm4V8rt09+lOa5/SA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(186003)(66574015)(44832011)(38100700002)(110136005)(316002)(31686004)(5660300002)(54906003)(2906002)(38070700005)(26005)(83380400001)(122000001)(8936002)(66946007)(86362001)(66476007)(66446008)(66556008)(64756008)(508600001)(4326008)(76116006)(6486002)(91956017)(71200400001)(6512007)(31696002)(6506007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlIxTmhSSDR6MCtxM003eFBvR1ZLWkpnRnRMOUh6b283SEIzQlFwNHB4M2wy?=
 =?utf-8?B?YmU1SkdRcmUvVHRob1V6eWl0SHhDRUc3SFR4Sml4aGxJNDdLYWVTbzJ3QTZr?=
 =?utf-8?B?b3BPcUF6cGsyNFpxNTAvWmVnSEsxNm45UjdXTEVFcUZNTHNnL0J4TUtuNzFT?=
 =?utf-8?B?R01yeVpDbkpBUEFXdFNWTytIbFVGNVA5V29RZ003UXRPUkl3VEV5WXpDamdq?=
 =?utf-8?B?UDloVURVM2prRkIvVWo2ZkJIdElzZDNIRG9xRTc3dktZSUNiTHkwbXdmUzNl?=
 =?utf-8?B?bmkyeTBYU0VpalZmaWQrdktVTXdHNjJaMnlCT0x3Vktvc3MrMmVNeXVNdzhz?=
 =?utf-8?B?a3ZjTXMyTnYxcmVlUHdBa3M5VmJGbUZ4MHlZNytXTzdRcEVRTkZlckl0eFQy?=
 =?utf-8?B?YzRYb0g4Vmdvdjh0ZW8xQitrS2pxU2gxNHVKOVoyTGliNmNFTEpmUDdtNGYv?=
 =?utf-8?B?a2gzM3RsOWNWWTF2aFFobkYwbysveVVieUh4SlVubjZCRzZPdnFtaGJKc0hp?=
 =?utf-8?B?SUE1Y3NMR20rWm92ODhORTRXbGdDUzJMTFo0bnJqZ3JOZFJLWlBsdVdVYjZ2?=
 =?utf-8?B?NUdacVI4eE9INTk5Ly9xZlorbmRWSmpqeGQxVHdVMnYxWVNNdDJvYVp3MHpm?=
 =?utf-8?B?S216Q2dKdzJoME11RHE0czhlY3M5TklmWHp5QlRUR1pjSU5DbTJreVFkVHpX?=
 =?utf-8?B?ZkZWNDRPTWh4TlRWSzJBMnF4cGd2MW9HOU16OWxkYUJKQ3ZHemtsVkEycmNu?=
 =?utf-8?B?YjY1WUh1ZTJmNUlmYUVKcUE1ak1XcTVpbVpEL24zVlZaL2pNcHFHU1FUS0tO?=
 =?utf-8?B?U2RUYk55SmZFUWo5Unl5NzdHTTl2eEVTZHJULzNRdm1xeExLd3BJMVhoYkZt?=
 =?utf-8?B?RG02MjdiUHIxWlMveWpYY01LcUlpYitjUUJGcnVqWlJ4amZPZWVzd1k4VU15?=
 =?utf-8?B?WU9PZnVoU1Y3clVNSWRNLzdkZzlaRXBjc1BELzlpbjJMOTE4d2FDeFFlZkxZ?=
 =?utf-8?B?amVSMnFLYlpwbldSaldaLzFTTmdCWnI5WHBGTE1CeHFnVnVqZEQ2NGoyQnlj?=
 =?utf-8?B?am50OElubElPdW1Gakd3ZWtTVXFhMDF3SWd3SytaeklYdFFjMWdCVWh2bi9F?=
 =?utf-8?B?WDh2MjlnUUxCdmN6Y2VCSVRpN2ZXd0ZyM2NSb0dvYzUrdFVOU0VzWU1lSllp?=
 =?utf-8?B?ODh2NGg3UVU2bGkxQnF3WUVtblZ2b2EvSG5PU3MvMWtjR1VwUzF4SDJBYkNu?=
 =?utf-8?B?Wkl3WjEvNEdtYUlqWlZCVEpLUUZzN3dSdE1RQlFFMG1mbk84NWIyOEtNblAy?=
 =?utf-8?B?UjBmcjliS2J5MklFY044Q2xjV3dFNWtTSnovWWNZdVkvTWF6bWpKVkNRTGhJ?=
 =?utf-8?B?TTdjalI3ZzExT1dmMlRlQWhBMFJRSjluWGY4SlNlUFVkN0VkSjFvN1ZwODR1?=
 =?utf-8?B?c2U5ZUltc1FaZHFUUytML0JCb2ZydDUzZ0hmZXNyeDZ5Ykxza0ZEZll0RTFI?=
 =?utf-8?B?ckI3OVk2a1RBbG15clVnemlrYm9ITEVoT1lNZGxGYy8zMWxGVE1qTUZDRmtu?=
 =?utf-8?B?ZlErc1RVSEZMeHZWUTZFcWhtVWFWeDRqSHNJd1hXNGJXQzltT1ZOSVVuVEo2?=
 =?utf-8?B?cDBHMU50b2tDWjJRUnVzZlpLMTdkZWlEUVdIWEZpRmNERzFwVVJvMjZ6Q0lC?=
 =?utf-8?B?ME1EL2JEbENTQUx3TzNZZmFRSk5rclUrRWZkU3JsdCtrNHpkYUZEZ2t5cVpi?=
 =?utf-8?B?aXFGSWV4ZzZCVEFGUmRibjR3QUxYS05nVVBZS1lJR2cvMkFCeU45VTd3VVVK?=
 =?utf-8?B?eFczOVJock1Vdk9PY0FITzlJWWNzVDNHQXRaQ3FJNTZ0b3B5aGV0WVl2bVZx?=
 =?utf-8?B?U3E5Q2J5eFA1YUlZOFNHZFgzNUZBU0x1Wkw2Ukc5UmdwSTJ0czVCQ3QzL1l0?=
 =?utf-8?B?Z2FNWGRmV1I5R1h2RnBSbkFwVzN4L0JMTkdpVHpWVHEzZ0MyVnQ0RXg2akQ3?=
 =?utf-8?Q?gtv4G3x3rMomsBzlXI3DvHSNuv1v2Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46813718DBA5D143ADB44B3BC11707B8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14320ca7-5b25-4573-5298-08da0b055507
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 06:37:55.4694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvDH8ryp+TfRPflYcESJ0uM/Y9yr88wybEhmuzk2LITbTBFlMPLYE7B+qgnYpWfe3VnXHEmvHtYFES8eSi1xV0E180ZrvamPLk9Vd3HEyw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0627
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDU6MzAsIEZpbm4gVGhhaW4gYSDDqWNyaXTCoDoNCj4gZHJp
dmVycy9tYWNpbnRvc2gvdmlhLXBtdS1ldmVudC5vOiBJbiBmdW5jdGlvbiBgdmlhX3BtdV9ldmVu
dCc6DQo+IHZpYS1wbXUtZXZlbnQuYzooLnRleHQrMHg0NCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGlucHV0X2V2ZW50Jw0KPiB2aWEtcG11LWV2ZW50LmM6KC50ZXh0KzB4NjgpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcNCj4gdmlhLXBtdS1ldmVudC5jOigudGV4dCsw
eDk0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZXZlbnQnDQo+IHZpYS1wbXUtZXZl
bnQuYzooLnRleHQrMHhiOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2V2ZW50Jw0K
PiBkcml2ZXJzL21hY2ludG9zaC92aWEtcG11LWV2ZW50Lm86IEluIGZ1bmN0aW9uIGB2aWFfcG11
X2V2ZW50X2luaXQnOg0KPiB2aWEtcG11LWV2ZW50LmM6KC5pbml0LnRleHQrMHgyMCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2FsbG9jYXRlX2RldmljZScNCj4gdmlhLXBtdS1ldmVu
dC5jOiguaW5pdC50ZXh0KzB4YzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9yZWdp
c3Rlcl9kZXZpY2UnDQo+IHZpYS1wbXUtZXZlbnQuYzooLmluaXQudGV4dCsweGQ0KTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZnJlZV9kZXZpY2UnDQo+IG1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MTE1NTogdm1saW51eF0gRXJyb3IgMQ0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjM1MDog
X19idWlsZF9vbmVfYnlfb25lXSBFcnJvciAyDQo+IA0KPiBEb24ndCBjYWxsIGludG8gdGhlIGlu
cHV0IHN1YnN5c3RlbSB1bmxlc3MgQ09ORklHX0lOUFVUIGlzIGJ1aWx0LWluLg0KPiANCj4gUmVw
b3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBDYzogTWljaGFl
bCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBGaW5uIFRoYWluIDxmdGhhaW5AbGludXgtbTY4
ay5vcmc+DQo+IC0tLQ0KPiBUaGlzIGlzIGVxdWl2YWxlbnQgdG8gdGhlIHBhdGNoIEkgc2VudCBh
IGNvdXBsZSBvZiBkYXlzIGFnby4gVGhpcyBvbmUNCj4gaXMgc2xpZ2h0bHkgbG9uZ2VyIGFuZCBh
ZGRzIGEgbmV3IHN5bWJvbCBzbyB0aGF0IEtjb25maWcgbG9naWMgY2FuIGJlZW4NCj4gdXNlZCBp
bnN0ZWFkIG9mIE1ha2VmaWxlIGxvZ2ljIGluIGNhc2UgcmV2aWV3ZXJzIHByZWZlciB0aGF0Lg0K
PiAtLS0NCj4gICBkcml2ZXJzL21hY2ludG9zaC9LY29uZmlnICAgfCA1ICsrKysrDQo+ICAgZHJp
dmVycy9tYWNpbnRvc2gvTWFrZWZpbGUgIHwgMyArKy0NCj4gICBkcml2ZXJzL21hY2ludG9zaC92
aWEtcG11LmMgfCAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21hY2ludG9zaC9LY29uZmln
IGIvZHJpdmVycy9tYWNpbnRvc2gvS2NvbmZpZw0KPiBpbmRleCA1Y2RjMzYxZGEzN2MuLmI5MTAy
ZjA1MWJiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tYWNpbnRvc2gvS2NvbmZpZw0KPiArKysg
Yi9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnDQo+IEBAIC02Nyw2ICs2NywxMSBAQCBjb25maWcg
QURCX1BNVQ0KPiAgIAkgIHRoaXMgZGV2aWNlOyB5b3Ugc2hvdWxkIGRvIHNvIGlmIHlvdXIgbWFj
aGluZSBpcyBvbmUgb2YgdGhvc2UNCj4gICAJICBtZW50aW9uZWQgYWJvdmUuDQo+ICAgDQo+ICtj
b25maWcgQURCX1BNVV9FVkVOVA0KPiArCWJvb2wNCj4gKwlkZXBlbmRzIG9uIEFEQl9QTVUgJiYg
SU5QVVQ9eQ0KPiArCWRlZmF1bHQgeQ0KDQpDb3VsZCBiZSByZWR1Y2VkIHRvDQoNCmNvbmZpZyBB
REJfUE1VX0VWRU5UDQoJZGVmX2Jvb2wgeSBpZiBBREJfUE1VICYmIElOUFVUPXkNCg0KPiArDQo+
ICAgY29uZmlnIEFEQl9QTVVfTEVEDQo+ICAgCWJvb2wgIlN1cHBvcnQgZm9yIHRoZSBQb3dlci9p
Qm9vayBmcm9udCBMRUQiDQo+ICAgCWRlcGVuZHMgb24gUFBDX1BNQUMgJiYgQURCX1BNVQ0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNpbnRvc2gvTWFrZWZpbGUgYi9kcml2ZXJzL21hY2ludG9z
aC9NYWtlZmlsZQ0KPiBpbmRleCA0OTgxOWIxYjZmMjAuLjcxMmVkY2IzZTBiMCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9tYWNpbnRvc2gvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRv
c2gvTWFrZWZpbGUNCj4gQEAgLTEyLDcgKzEyLDggQEAgb2JqLSQoQ09ORklHX01BQ19FTVVNT1VT
RUJUTikJKz0gbWFjX2hpZC5vDQo+ICAgb2JqLSQoQ09ORklHX0lOUFVUX0FEQkhJRCkJKz0gYWRi
aGlkLm8NCj4gICBvYmotJChDT05GSUdfQU5TTENEKQkJKz0gYW5zLWxjZC5vDQo+ICAgDQo+IC1v
YmotJChDT05GSUdfQURCX1BNVSkJCSs9IHZpYS1wbXUubyB2aWEtcG11LWV2ZW50Lm8NCj4gK29i
ai0kKENPTkZJR19BREJfUE1VKQkJKz0gdmlhLXBtdS5vDQo+ICtvYmotJChDT05GSUdfQURCX1BN
VV9FVkVOVCkJKz0gdmlhLXBtdS1ldmVudC5vDQo+ICAgb2JqLSQoQ09ORklHX0FEQl9QTVVfTEVE
KQkrPSB2aWEtcG11LWxlZC5vDQo+ICAgb2JqLSQoQ09ORklHX1BNQUNfQkFDS0xJR0hUKQkrPSB2
aWEtcG11LWJhY2tsaWdodC5vDQo+ICAgb2JqLSQoQ09ORklHX0FEQl9DVURBKQkJKz0gdmlhLWN1
ZGEubw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jIGIvZHJpdmVy
cy9tYWNpbnRvc2gvdmlhLXBtdS5jDQo+IGluZGV4IGIxODU5ZTUzNDBiMy4uMDIyZTJmZDQzOTdi
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21hY2ludG9zaC92aWEtcG11LmMNCj4gKysrIGIvZHJp
dmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jDQo+IEBAIC0xNDY4LDEyICsxNDY4LDE0IEBAIHBtdV9o
YW5kbGVfZGF0YSh1bnNpZ25lZCBjaGFyICpkYXRhLCBpbnQgbGVuKQ0KPiAgIAkJaWYgKHBtdV9i
YXR0ZXJ5X2NvdW50KQ0KPiAgIAkJCXF1ZXJ5X2JhdHRlcnlfc3RhdGUoKTsNCj4gICAJCXBtdV9w
YXNzX2ludHIoZGF0YSwgbGVuKTsNCj4gKyNpZmRlZiBDT05GSUdfQURCX1BNVV9FVkVOVA0KPiAg
IAkJLyogbGVuID09IDYgaXMgcHJvYmFibHkgYSBiYWQgY2hlY2suIEJ1dCBob3cgZG8gSQ0KPiAg
IAkJICoga25vdyB3aGF0IFBNVSB2ZXJzaW9ucyBzZW5kIHdoYXQgZXZlbnRzIGhlcmU/ICovDQo+
ICAgCQlpZiAobGVuID09IDYpIHsNCg0KQ2FuIHlvdSByZXBsYWNlIHRoYXQgI2lmZGVmIHN0dWZm
IGJ5DQoNCgkJaWYgKElTX0VOQUJMRUQoQ09ORklHX0FEQl9QTVVfRVZFTlQpICYmIGxlbiA9PSA2
KSB7DQoNCj4gICAJCQl2aWFfcG11X2V2ZW50KFBNVV9FVlRfUE9XRVIsICEhKGRhdGFbMV0mOCkp
Ow0KPiAgIAkJCXZpYV9wbXVfZXZlbnQoUE1VX0VWVF9MSUQsIGRhdGFbMV0mMSk7DQo+ICAgCQl9
DQo+ICsjZW5kaWYNCj4gICAJCWJyZWFrOw0KPiAgIA0KPiAgIAlkZWZhdWx0Og==
