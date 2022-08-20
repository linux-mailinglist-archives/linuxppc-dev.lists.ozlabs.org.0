Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199FB59AD0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 12:03:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8vMK6ndLz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 20:03:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jOuTMSPH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.85; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jOuTMSPH;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90085.outbound.protection.outlook.com [40.107.9.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8vLW2yTGz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 20:02:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcP7i4qhG2OtBCSQx+jR/n6y+iEjRBGYAfCPR3vdEpRHrqJO5KQRih2++GO9ilScTO7Bf8NWhT/0rapdDAF2em5PKPBwH0sBoBEnKarrMnVO9CU+N+InkqE77loIaP3fQVW0Imvxv2njevwMfcdps0bBLYoKWHykB62a/zhoRBtEQRtFFsCtlWlwyINsZzzS0l4De8R/FkRQNj72LzTvUWyhxNznoJdNiFB5GzNTh4DokK4Ev9Vy79XqurGS0ekJWFcBsXt8Bxc5o4YK7NT3obcEPa2RwC6mkai60pKGEk7JiBoqINkCYa3goPMNmwDBga+SfNpqbKsOXqStSZVxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9HqCtjXBl+EkvtFJtnHmSjk/muLLVBaR2Zy2h8twrE=;
 b=QI93f7NmOPOtSIQeC6DjXp0D4pvWvTETSFxK6kKRS5VaJ+qsBiWClpU8Z9FAqGWLbgYKEAIyYPGz//57OyNlQmempO4JjW/fjwc6htsNA5UI5/MMDkuEwdsOUKZ17WXCCCaNFBYKFBH3f2ffJj/3LFiFnWtLdBbEog2QjfjOJ9Z8UO1n3EhAzx4enAA7rFSpqt2Rf+zE76Geyiw9e5YVprvWDaYKtXj1/ipih+W+A0nONKI/bpd1zBEuPoIXYaXLhKMFrD61bVfuddJPaG2+Qaw2oivOU4tTl3RdgeaRQ38B5u5slTowpHTeC4LybpY2ChqBcbjk+ZK4e8Bqast2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9HqCtjXBl+EkvtFJtnHmSjk/muLLVBaR2Zy2h8twrE=;
 b=jOuTMSPH+84LVrcYSyvs4iGp/YmoSQkKRFtn5+CoqFboBtj8uQScRNjsiHaz/XCegBOMiDRUfULwaDK982nHvht8mtwVwR5/YO8hOJzUTBWytoyfgCYkw/2Wb5gNOyigALqzWTWC/L+WeDvAxqFx8ggrLH6dyPkwI9HUzKK7cxwIulKnc6Ltjq6pg0LHP7PM+YAEm23eaNvPNBVhW6H81dUJUiBTJLsN/MY71ts5URMt5NmUoIDwZUxtZuyX2Pzi9gFnDOQDsjEsbvRcTPEHpJ2ITyv82zmZy13bzusf0GnKbm2E3owTakyTi52hfytDy3fSi2i+bOrhfSK31jNGBA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3731.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Sat, 20 Aug
 2022 10:02:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.020; Sat, 20 Aug 2022
 10:02:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Masahiro Yamada <masahiroy@kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
Subject: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10] kbuild:
 link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Topic: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Index: AQHYtHvmHBMhgvHYdkutxUw4JYFhKQ==
Date: Sat, 20 Aug 2022 10:02:04 +0000
Message-ID: <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
References: <20220513113930.10488-1-masahiroy@kernel.org>
 <20220513113930.10488-3-masahiroy@kernel.org>
In-Reply-To: <20220513113930.10488-3-masahiroy@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2707a22-2b7c-4b8c-204b-08da82930898
x-ms-traffictypediagnostic: MR1P264MB3731:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TKfWXr0Z0x3956pP7AQp6vVdG5wgQE/GaifiIIgvVzAKIQSIm5x/Q4ByXSrRoY13mzU3YBqG3b1IyIaaDpO3JoVXMik9iY6FKrWgLXoosufIRQ9jGk2xlBwm3ady6tBn9DeciCIFPxdZZVuNX/cRWF4ofcriHEGoLegE1yROAjGwGjBIhika1nsg7ulz2suEzdXqz8SWXAamBikhJDVazbH0zWdoEF3r/peZ2fzFmCNe6a6w4aYss1pPqAGEm2wtzqLAHf7kvRTy5NeYMPfq7iaxK6RSkfPFbS7Yz8Hhw3iNG6kWE1+J8Ct69vUjuGu1qcFaTY8FlMwIuCpJndt6Snm4jSg6Fr9r/k8q4y/eL2G1jj0CYlFIPF3WGUJV8TmsyecPM2IH5WBybBhtkyAN1egOZi7LcaLhDTdLySAIk6CK4ReVI/VdiifJMuy0jipr3V+KEgEfJrNtNDN+x38SdMp4JQNrdi6mDCXnBodbCZye6OWw4DsTgj3UNB1bDZAJ6fPEDD3lSfjNIq5CPacNMUpiexC/nbJzrsXNs2E0GjiF/KXGkaUciVTjMs82I0eN++TFwlKTLwZL72UIOfC1XMuM9A/ArB3cEaY84wZPaMx15clyVeD9bbSOHTV9H+we87SgjKkDyZLS3YNUedRrSU4gJX8p7FDQD1EAza+5Y/VaL1b8idJvVXxd9ADB+zofrF4ALuwYYmdhx0DpUxW8F3/aXtNVwFFDSE/WpkxYWOZLIx1/0Us87LyZvDDq9omjo9hXfAZxNBBxLtvUcu9pwff3N9U/mjRYW4cE2suivheOqQkEvGw0R6re+JUKsSBtNKXrtpEU/zaxvqPkekULTg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(45080400002)(122000001)(31686004)(54906003)(316002)(2616005)(110136005)(38100700002)(26005)(36756003)(6512007)(186003)(38070700005)(71200400001)(66476007)(8936002)(478600001)(66556008)(7416002)(64756008)(2906002)(8676002)(4326008)(86362001)(6506007)(83380400001)(66946007)(91956017)(31696002)(76116006)(66446008)(5660300002)(44832011)(6486002)(41300700001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M0lmQytJU1ZRV0lpZHpBV0NBbWxZcHhoNkNkOXRrWXhocTVuRGY4b0QvaDZY?=
 =?utf-8?B?OS9pVkxQdTZmNHJLcCszVUxPQmNQdXM1YUFmRHJoQ0c1anJoa0xqZmYwYXIw?=
 =?utf-8?B?V2plbW84NG5CK0NCQ2pyc2lwS2x6dGs1Ly8yQWhXbmpBR2U2eVdBRGJlM29p?=
 =?utf-8?B?ekVjSjdBMGJSeEkrNWwyRG15TXdybGYvVkgyOFpGdGdRZHFFSG9XODRZYVZu?=
 =?utf-8?B?UmxpUUFFalBUWkRuZXFCUDBzNTc4TDJrWEcxdmk4UHRDQUJFSE9nWFFZTUly?=
 =?utf-8?B?d2tob1hsRi9xQzhpdC9uUDEvdnRPbURUZW5NRHB1YzZOaUIzenU4TDNwclBa?=
 =?utf-8?B?UXAvWW8vVEd3WGJVajBpR2VPTVcwMGRsLzBLU3NITDFhc0N4VTEvSDFGQ01l?=
 =?utf-8?B?ZURPT25uTysrTVV4MC9Rai9oc3QveVBWWk03dG1Yb1hTNEtnUUVrRzZHT0I3?=
 =?utf-8?B?TFA1TXpXR29QMytxb2EyQjI1enRQOTF2ZTY4eFhLR1ExTVdJdjhWTmhlMEJ4?=
 =?utf-8?B?WmFhb3NtTDkwazRkQzZMRDAzYU1aN1FQSWhuSndkOTVEWExIclREc0d3UjZD?=
 =?utf-8?B?VmphdStDZG5tVFFmWTRkaC9CT1RNTWJvM2lOdHFhRUw2N2VFcm96a1pqeXFS?=
 =?utf-8?B?VXlFNXcxZUxZRFFabFpMYy9wOGZDRUFQbC9NNU91VmpQTy9LYTlwbWdwRGda?=
 =?utf-8?B?UHl1RmttZHcxZ2p1TkIvM2lCZ0wvbjBrenI1TzQxWEhld0hrT1QyT1pOd0FE?=
 =?utf-8?B?U05UWXJub295NENyYXdBSXQ1bFl0VFlNV2tiUXcwWVYwblZNTXlCSktrQWg1?=
 =?utf-8?B?T3FTUFNyNEZBNWZKRFZuT2hIWEhSek9Vd01yMkMxQUkyOFE3NFFwUU5GRE0x?=
 =?utf-8?B?Q1NTcWM3NnQ4MVpzbUxFaFNMRkNJcXVPU3cwbUxQMXJCejE3WUVXdXdKZHFV?=
 =?utf-8?B?VWxUWkZYZ0xHOE10SVFMMHRhRWhPOW5RRzB0N2ZOZmFQK3dBVVdZT3pLTGtK?=
 =?utf-8?B?b045UEpBSUxvclUvMDhaU2VqU1A2ODVqMzdWNUpNVVdQQ3JlbUxoVG14d2dG?=
 =?utf-8?B?NlFmVlFRM1BHcFArMmdmRHQ4N2U3ZlphSjZ0aVNaaTFVanZkTjJoMGxZZHhC?=
 =?utf-8?B?R0VmVGp5UStJak54dmJCdVlKaEpEMUk2ckszdldENmVxTjB4bmc3WFdYK0JR?=
 =?utf-8?B?VEI2bkppTnduZ3BodGNob1ZJeTlmY3VLb3ZDS08xUTF1YkJkeENkNnZ1NTdv?=
 =?utf-8?B?cmZoR3oyOVZUQlcrMVJiNUVNRkYvM3phYkxWdUlqak9rcmpFNHA5bVBqY0xv?=
 =?utf-8?B?YmN5RFQ4eWppZFBjRUdJNWY4Y0YrcEN6RC9kUHRDcDJwV28xTSt6eGQrUS8w?=
 =?utf-8?B?cEZOdklmTUxmV0FwT1FiS3ZiOFF4UEhLczN1RTk2dWtBK1V3K3VWMGR1RTVZ?=
 =?utf-8?B?M2ZCaWFIV1Y3ZStZWCt1Rm80b1lNeDZJRm5RdkRYbkxMZTB0TStrd3ZWTVhQ?=
 =?utf-8?B?b1Z0QzZ5K1Z5NTdSUE1JSEM3OER1NEtiSGdja2lPWGx3R2JSeTQ4WkVTbWFU?=
 =?utf-8?B?RzFwY1J4eUJvRnZyZ29TZUJkR0tqakRBMkpwYnVEVThmWHcvR2sya1ZwcjNV?=
 =?utf-8?B?a205c0RWVmt2dG1qRkRubTJ6ZGZFQVpzVElMTm41TEdOMk5pZmM0RW9uKzgw?=
 =?utf-8?B?OS9jOEZ4dUM4KzM4TW1wZlRsVzRtc29DeElYN2MyUFRxOTVpV2J4T2dkbTJZ?=
 =?utf-8?B?eGRUWjRUWXJzaXRHZkw4YnJxcFN5K2hpN3RVQTlYaUFlZm56bnVKdjg5YmpI?=
 =?utf-8?B?bHFEUy94L3R5QXJ2eVZEUjdNeDRkU0Q3ajlLeElVaXFPbHJNajZRZFpKcjVB?=
 =?utf-8?B?c2lhcDVLd0lxeTVUTVdsVlVVWkJEdmhLT216VlE3QXpES0hwMkVUWW0vcCtk?=
 =?utf-8?B?TDdEcUpWcE92THlZcEtVVXl5OHlQcHljMUpSN3hIYW83aWU3aHNhV0tmMmo2?=
 =?utf-8?B?ci9xMnIzektxdUNYNnRScjdZWlB3UytKbk1GT0oremhNb3VGK2hvcXFGTXdQ?=
 =?utf-8?B?blZMbEM4aE9pdG02Ry9hWmR5UnBubFEyVTJuaXNTY3J0ZS9zeElxaER5YlF0?=
 =?utf-8?B?aEljOHh1RnRRcDlpTVdPVWpORW00ZUc2RTFHU2dvdDVTeGI4dDBiMzhFMUU2?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1681685B5D50574591EE2EAED767A2AB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2707a22-2b7c-4b8c-204b-08da82930898
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 10:02:04.1711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4YrhU9WwvR81QL6Tg1eDM8yomKWgP4Y4Z8VtEPQ7O9DPCj/vLdojLPEiV5L6IUNdPRNKhGTKqvlJafNZXb4wbSoXpIBjP2rHi/KUcLGj7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3731
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Kirill A .
 Shutemov" <kirill.shutemov@linux.intel.com>, Sami Tolvanen <samitolvanen@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDEzLzA1LzIwMjIgw6AgMTM6MzksIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdMKg
Og0KPiBpbmNsdWRlL3tsaW51eCxhc20tZ2VuZXJpY30vZXhwb3J0LmggZGVmaW5lcyBhIHdlYWsg
c3ltYm9sLCBfX2NyY18qDQo+IGFzIGEgcGxhY2Vob2xkZXIuDQo+IA0KPiBHZW5rc3ltcyB3cml0
ZXMgdGhlIHZlcnNpb24gQ1JDcyBpbnRvIHRoZSBsaW5rZXIgc2NyaXB0LCB3aGljaCB3aWxsIGJl
DQo+IHVzZWQgZm9yIGZpbGxpbmcgdGhlIF9fY3JjXyogc3ltYm9scy4gVGhlIGxpbmtlciBzY3Jp
cHQgZm9ybWF0IGRlcGVuZHMNCj4gb24gQ09ORklHX01PRFVMRV9SRUxfQ1JDUy4gSWYgaXQgaXMg
ZW5hYmxlZCwgX19jcmNfKiBob2xkcyB0aGUgb2Zmc2V0DQo+IHRvIHRoZSByZWZlcmVuY2Ugb2Yg
Q1JDLg0KPiANCj4gSXQgaXMgdGltZSB0byBnZXQgcmlkIG9mIHRoaXMgY29tcGxleGl0eS4NCj4g
DQo+IE5vdyB0aGF0IG1vZHBvc3QgcGFyc2VzIHRleHQgZmlsZXMgKC4qLmNtZCkgdG8gY29sbGVj
dCBhbGwgdGhlIENSQ3MsDQo+IGl0IGNhbiBnZW5lcmF0ZSBDIGNvZGUgdGhhdCB3aWxsIGJlIGxp
bmtlZCB0byB0aGUgdm1saW51eCBvciBtb2R1bGVzLg0KPiANCj4gR2VuZXJhdGUgYSBuZXcgQyBm
aWxlLCAudm1saW51eC5leHBvcnQuYywgd2hpY2ggY29udGFpbnMgdGhlIENSQ3Mgb2YNCj4gc3lt
Ym9scyBleHBvcnRlZCBieSB2bWxpbnV4LiBJdCBpcyBjb21waWxlZCBhbmQgbGlua2VkIHRvIHZt
bGludXggaW4NCj4gc2NyaXB0cy9saW5rLXZtbGludXguc2guDQo+IA0KPiBQdXQgdGhlIENSQ3Mg
b2Ygc3ltYm9scyBleHBvcnRlZCBieSBtb2R1bGVzIGludG8gdGhlIGV4aXN0aW5nICoubW9kLmMN
Cj4gZmlsZXMuIE5vIGFkZGl0aW9uYWwgYnVpbGQgc3RlcCBpcyBuZWVkZWQgZm9yIG1vZHVsZXMu
IEFzIGJlZm9yZSwNCj4gKi5tb2QuYyBhcmUgY29tcGlsZWQgYW5kIGxpbmtlZCB0byAqLmtvIGlu
IHNjcmlwdHMvTWFrZWZpbGUubW9kZmluYWwuDQo+IA0KPiBObyBsaW5rZXIgbWFnaWMgaXMgdXNl
ZCBoZXJlLiBUaGUgbmV3IEMgaW1wbGVtZW50YXRpb24gd29ya3MgaW4gdGhlDQo+IHNhbWUgd2F5
LCB3aGV0aGVyIENPTkZJR19SRUxPQ0FUQUJMRSBpcyBlbmFibGVkIG9yIG5vdC4NCj4gQ09ORklH
X01PRFVMRV9SRUxfQ1JDUyBpcyBubyBsb25nZXIgbmVlZGVkLg0KPiANCj4gUHJldmlvdXNseSwg
S2J1aWxkIGludm9rZWQgYWRkaXRpb25hbCAkKExEKSB0byB1cGRhdGUgdGhlIENSQ3MgaW4NCj4g
b2JqZWN0cywgYnV0IHRoaXMgc3RlcCBpcyB1bm5lZWRlZCB0b28uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPg0KPiBUZXN0ZWQtYnk6
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4NCj4gVGVzdGVkLWJ5OiBOaWNv
bGFzIFNjaGllciA8bmljb2xhc0BmamFzbGUuZXU+DQo+IFJldmlld2VkLWJ5OiBOaWNvbGFzIFNj
aGllciA8bmljb2xhc0BmamFzbGUuZXU+DQoNClByb2JsZW0gd2l0aCB2Ni4wLXJjMQ0KUHJvYmxl
bSB3aXRoIHY1LjE5DQpObyBwcm9ibGVtIHdpdGggdjUuMTgNCg0KQmlzZWN0ZWQgdG8gN2I0NTM3
MTk5YTRhICgia2J1aWxkOiBsaW5rIHN5bWJvbCBDUkNzIGF0IGZpbmFsIGxpbmssIA0KcmVtb3Zp
bmcgQ09ORklHX01PRFVMRV9SRUxfQ1JDUyIpDQoNClRoZSBhYm92ZSBwYXRjaCBsZWFkcyB0byB0
aGUgZm9sbG93aW5nIHByb2JsZW0gYnVpbGRpbmcgDQptcGM4NXh4X2RlZmNvbmZpZyArIENPTkZJ
R19SRUxPQ0FUQUJMRQ0KDQogICBMRCAgICAgIHZtbGludXgNCiAgIFNZU01BUCAgU3lzdGVtLm1h
cA0KICAgU09SVFRBQiB2bWxpbnV4DQogICBDSEtSRUwgIHZtbGludXgNCldBUk5JTkc6IDQ1MSBi
YWQgcmVsb2NhdGlvbnMNCmMwYjBmMjZkIFJfUFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgz
ZmY5ZjJiYw0KYzBiMGYyNzEgUl9QUENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0weDNmZmFjMzAw
DQpjMGIwZjI3NSBSX1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4M2ZmYjBiZGMNCmMwYjBm
Mjc5IFJfUFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmUxZTA4MA0KYzBiMGYyN2QgUl9Q
UENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0weDNmZTFkZjRjDQpjMGIwZjI4MSBSX1BQQ19VQURE
UjMyICAgICAuaGVhZC50ZXh0LTB4M2ZlMjE1MTQNCmMwYjBmMjg1IFJfUFBDX1VBRERSMzIgICAg
IC5oZWFkLnRleHQtMHgzZmUyMTFjMA0KYzBiMGYyODkgUl9QUENfVUFERFIzMiAgICAgLmhlYWQu
dGV4dC0weDNmZmFiZGEwDQpjMGIwZjI4ZCBSX1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4
M2ZlMjEyNTgNCmMwYjBmMjkxIFJfUFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmUwNzRk
MA0KYzBiMGYyOTUgUl9QUENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0weDNmZTA3YWQ0DQpjMGIw
ZjI5OSBSX1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4M2ZlMTM0NzANCmMwYjBmMjlkIFJf
UFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmUyMjcwMA0KYzBiMGYyYTEgUl9QUENfVUFE
RFIzMiAgICAgLmhlYWQudGV4dC0weDNmZjRiOGUwDQpjMGIwZjJhNSBSX1BQQ19VQUREUjMyICAg
ICAuaGVhZC50ZXh0LTB4M2ZlMDgzMjANCmMwYjBmMmE5IFJfUFBDX1VBRERSMzIgICAgIC5oZWFk
LnRleHQtMHgzZmUyMjBkYw0KYzBiMGYyYWQgUl9QUENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0w
eDNmZTIxZGEwDQpjMGIwZjJiMSBSX1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4M2ZmODlk
YzANCmMwYjBmMmI1IFJfUFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmUxNjUyNA0KYzBi
MGYyYjkgUl9QUENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0weDNmZTFlZjc0DQpjMGIwZjJiZCBS
X1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4M2ZmOThiODQNCmMwYjBmMmMxIFJfUFBDX1VB
RERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmRlZjlhMA0KYzBiMGYyYzUgUl9QUENfVUFERFIzMiAg
ICAgLmhlYWQudGV4dC0weDNmZGYyMWFjDQpjMGIwZjJjOSBSX1BQQ19VQUREUjMyICAgICAuaGVh
ZC50ZXh0LTB4M2ZmOTkzYzQNCi4uLg0KYzBiMGY5NjkgUl9QUENfVUFERFIzMiAgICAgLmhlYWQu
dGV4dC0weDNmZjg5ZGMwDQpjMGIwZjk2ZCBSX1BQQ19VQUREUjMyICAgICAuaGVhZC50ZXh0LTB4
M2ZlOWFkNDANCmMwYjBmOTcxIFJfUFBDX1VBRERSMzIgICAgIC5oZWFkLnRleHQtMHgzZmYyZWIw
MA0KYzBiMGY5NzUgUl9QUENfVUFERFIzMiAgICAgLmhlYWQudGV4dC0weDNmZjg5ZGMwDQoNCkFu
ZCBib290IGZhaWxzOg0KDQpSdW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzDQprZXJuZWwgdHJpZWQg
dG8gZXhlY3V0ZSB1c2VyIHBhZ2UgKDApIC0gZXhwbG9pdCBhdHRlbXB0PyAodWlkOiAwKQ0KQlVH
OiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBpbnN0cnVjdGlvbiBmZXRjaCAoTlVMTCBwb2ludGVy
PykNCkZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4MDAwMDAwMDANCk9vcHM6IEtlcm5l
bCBhY2Nlc3Mgb2YgYmFkIGFyZWEsIHNpZzogMTEgWyMxXQ0KQkUgUEFHRV9TSVpFPTRLIE1QQzg1
NDQgRFMNCk1vZHVsZXMgbGlua2VkIGluOg0KQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0
YWludGVkIDUuMTguMC1yYzEtMDAwNTQtZzdiNDUzNzE5OWE0YSAjMTUyMw0KTklQOiAgMDAwMDAw
MDAgTFI6IGMwMDE1MGU0IENUUjogMDAwMDAwMDANClJFR1M6IGMzMDkxZTEwIFRSQVA6IDA0MDAg
ICBOb3QgdGFpbnRlZCAgKDUuMTguMC1yYzEtMDAwNTQtZzdiNDUzNzE5OWE0YSkNCk1TUjogIDAw
MDA5MDAwIDxFRSxNRT4gIENSOiA4ODAwMDQyMiAgWEVSOiAyMDAwMDAwMA0KDQpHUFIwMDogMDAw
MDQwMDAgYzMwOTFmMDAgYzMwYzgwMDAgMDAwMDAwMDAgMDAwMDAwMTMgYjdiYjlmNGMgYjdiZDhm
NjAgDQpiZmVlNjY1MA0KR1BSMDg6IDAwMDAwMDU0IDAwMDAwMDAwIGMwYjBmMjZkIDAwMDAwMDAw
IGMxM2IwMDAwIDAwMDAwMDAwIGJmZWU2NjY4IA0KMDAwMDAwMDANCkdQUjE2OiA4NGUwODAwMCAw
MDAwMDAwMCAwODAwMDAwMCAwMDAwMDA2NCAwMDAwMDAwMCAwMDEwMjAwMCAwMDAwMDAwMSANCjAw
MDAwMDAxDQpHUFIyNDogMDAwMDAwMDEgMDAwMDAwMDEgYjdiOWM3ZDAgMTAwMDAwMzQgMDAwMDAw
MDkgYjdiZDhmMzggYjdiZDk4NTQgDQpiN2JkODY4OA0KTklQIFswMDAwMDAwMF0gMHgwDQpMUiBb
YzAwMTUwZTRdIHJldF9mcm9tX3N5c2NhbGwrMHgwLzB4MjgNCkNhbGwgVHJhY2U6DQpbYzMwOTFm
MDBdIFtjMDAwMGFmMF0gSW5zdHJ1Y3Rpb25TdG9yYWdlKzB4MTUwLzB4MTYwICh1bnJlbGlhYmxl
KQ0KLS0tIGludGVycnVwdDogYzAwIGF0IDB4YjdiYjI4ZTgNCk5JUDogIGI3YmIyOGU4IExSOiBi
N2JiMTM4NCBDVFI6IGI3YmIxMjE4DQpSRUdTOiBjMzA5MWYxMCBUUkFQOiAwYzAwICAgTm90IHRh
aW50ZWQgICg1LjE4LjAtcmMxLTAwMDU0LWc3YjQ1MzcxOTlhNGEpDQpNU1I6ICAwMDAyZDAwMCA8
Q0UsRUUsUFIsTUU+ICBDUjogMjgwMDA0MjIgIFhFUjogMjAwMDAwMDANCg0KR1BSMDA6IDAwMDAw
MDJkIGJmZWU2MWYwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIGI3YmI5ZjRjIGI3YmQ4ZjYw
IA0KYmZlZTY2NTANCkdQUjA4OiAwMDAwMDA1NCAwMDAwMDAyMCBiZmVlNjY0OCAwMDAwMDAwMCAw
MDAwMDAwMSAwMDAwMDAwMCBiZmVlNjY2OCANCjAwMDAwMDAwDQpHUFIxNjogODRlMDgwMDAgMDAw
MDAwMDAgMDgwMDAwMDAgMDAwMDAwNjQgMDAwMDAwMDAgMDAxMDIwMDAgMDAwMDAwMDEgDQowMDAw
MDAwMQ0KR1BSMjQ6IDAwMDAwMDAxIDAwMDAwMDAxIGI3YjljN2QwIDEwMDAwMDM0IDAwMDAwMDA5
IGI3YmQ4ZjM4IGI3YmQ5ODU0IA0KYjdiZDg2ODgNCk5JUCBbYjdiYjI4ZThdIDB4YjdiYjI4ZTgN
CkxSIFtiN2JiMTM4NF0gMHhiN2JiMTM4NA0KLS0tIGludGVycnVwdDogYzAwDQpJbnN0cnVjdGlv
biBkdW1wOg0KWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFggWFhY
WFhYWFggWFhYWFhYWFggWFhYWFhYWFgNClhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhY
WFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYDQotLS1bIGVuZCB0cmFjZSAw
MDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0KS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVt
cHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAwMGINCg0KDQoNCkNocmlzdG9waGU=
