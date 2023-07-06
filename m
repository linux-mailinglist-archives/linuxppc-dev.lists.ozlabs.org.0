Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65911749616
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 09:11:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PscbfLFa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxSNz2DGNz3bv6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PscbfLFa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxSN01SGNz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 17:10:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDSsbg2rQUPFMJz4d+9RYgSFBBtdjmpSZO3wCb/GyzaZe1e8vPUgBlrx1VzYGFZBCLlVV2+jk8rfLJIcAYoc7zlDlbYN/aXz76r64j0rmhPHJX+f+G3AD/1TfNbNeVqNS9zOXXc0ciWMhnCqmFYnw7jpBH/zD+lOGNx+ck18xoNsv6MrEIYYFFk5K/gRxCyNqwzYD78td6Rs7uxZsJ8sBaQSO5A5UB4ya1NSrf85oGlMACQdaT2fOGtnrPh7yTidShJG9Wh31C24S9NQ/yHG/l07wvZaLduEziBsLroITliGYqACEG4qFQZLTPCsCRtJTvzRVjz5ZQOXKwRW723ZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWguFdiiFZq0UQaM46KqcWvw6m+wgvnIz+HEkcKMOsE=;
 b=PncWIiKkyLBUaeUj24GFAyWyz4T0d+0hzWF39snh1LvOvv1kU0WyRIRKpNgzJTdfwMPMw4HmGdFwj3uV7s/iQshrNAtShKSlLDfBzGBWnzn65iZ3Esx6oevAJJ4YLV8f5DS8Q644mWWE/1V+5Dgd71xryTARnNaPrKQTcqIZ/s3puRbvS5elPtO2EayoGXV2lWBvsy92q9WoyNLnPPiek91YQdOcRxSSuBtmxPx+XC7mF6L0rHPBEzyeywoVBRH/JegSZ5ROGvJG5bPmL8Pf8Ea/ZH+e9e6oCz6egYmDEN5SQgJbXeSN7+ZY4B4dNCUvDGJqr4UfMqdjdqmENblYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWguFdiiFZq0UQaM46KqcWvw6m+wgvnIz+HEkcKMOsE=;
 b=PscbfLFaCY3eVaHhHYYrHE7FevSq8pR/Z1247sabdOzyqstsEj+ih67XBtwp5+zjxTPRIXJL6QmbKcHG2exgNmtrAvccgHxOenmp7lMwx79utyIB9cvQq46Ud1WyWKKMHtS0IZKMrfX81MFZd0POjYrLQYbCUU4U2Krz/Dha505dgYDpi6WdYew9CkWZC7cQzcnW4vPV+19RVIe8USIKXwipkzUV9lHpZT3bCTS4jTsJOgRvyOvbqVziedc/Y1Eq5wHnfAa1L8SVpvsTIvrgWIVKKSsGmVI1AIQw1IkibtSQY0sZgYDfgLf/Qa8q9x48FzgKJsGx+icw3SuaPKkNzg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2485.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:09:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:09:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, "fweisbec@gmail.com"
	<fweisbec@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@kernel.org" <mingo@kernel.org>, "dave@stgolabs.net"
	<dave@stgolabs.net>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"josh@joshtriplett.org" <josh@joshtriplett.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Thread-Topic: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Thread-Index: AQHY/Vy1EjapAccMX0qC6ocgl+Biyq+ttvWA
Date: Thu, 6 Jul 2023 07:09:47 +0000
Message-ID: <efd3ac99-d406-fc45-60e1-73eb8bce4c67@csgroup.eu>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
In-Reply-To: <20221121035140.118651-1-zhouzhouyi@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2485:EE_
x-ms-office365-filtering-correlation-id: e16cdbe7-8723-4003-bcae-08db7deffb7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZFgE+MzZojXM/h+08m8DGTzscIB+NWpm15RpPX1ndClM8mOA7AhyP4W36HP87icTDxg06nDz0AGOezu8AZYWh1d1BxJ5ScTNj8OOM/Vc+SXInQO0RDM1RJbIjvBVp9fXSiWtJvR557XTBcPBjKYdzhOe56iFV4pI6lVGj3LYXNA81Mcyg9g7zZ5Opl5Qs1bE7gkzMCMAJ/T5QucmvY4nq0LGR9L+3RPEpDG0PS2TgfMnijln4acZJlGhBfCwmL0WZgY2xpv+yY2nt8lPkDVNhRPNkWNT5mJltSDV2Uu3qTP8JKWj/kfO57Ld6cM6Z44YNbaP/aujnwr3bf2mUzsZ1HPIwdtfp8pclVamxD74LaKxrPh98N176AofBQscAKaYuAljbNeU8uxGf95gj1M7n9smiUu78eYtXZIJBtavZyF1XLo+LK3BYY75faE7Mng1GrbUwQ9s8c+EE6QdhkVGFtxCzTI/Ac01D6nUS7AHkpyKeTnUDj3pTGWCX5vAIkwlMtxCMuq1yFIa6+0qLQ7yYACxYkqT4/iZugsHCjhnU/WpXjAOxD8cJiWWJTIEVpg+bgSQxehLPn2A+98xYp9WncUp+myiYdAN313KIA3/cehib8i/s6V7BmLRje0zeQXoKoRx2D1AgMSFODCcOqIjAV6hytsRl8cSEbAU9zfaCIXJnhCzyZ7bA/2AWC0MmCtRTm1bbFF5bcwYDUpWNejwvQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(76116006)(38100700002)(91956017)(66556008)(66446008)(66476007)(64756008)(66946007)(921005)(2616005)(122000001)(186003)(86362001)(71200400001)(6486002)(31696002)(6512007)(38070700005)(36756003)(6506007)(110136005)(26005)(478600001)(8936002)(8676002)(44832011)(5660300002)(7416002)(31686004)(41300700001)(2906002)(316002)(83380400001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mm1Hc1JiY3FOM2FXSk1qSFBsUlllQ05lRzdaVkJhVEl4QWRZZnN6aUI0UjBO?=
 =?utf-8?B?azREK2ZFUXdUS2wyaVM0UU0zL1RJbEZDSmYrb1g3VUYwWjZ0cnFES0VjcGZm?=
 =?utf-8?B?VlB0N2YxOVZ4VDVmc1FoTldvZHJjVU5HaHZzOVRVL3VGMC9YTDRIanIxZGY5?=
 =?utf-8?B?bjd1K3V1ZEpmbGczMUI0LzlXSkRrd29hN3ZGb2tydVQ3WHg3OVZpbXI4U2lP?=
 =?utf-8?B?TTBoWG5Wd0VVa2tKOGJxcU5aMGtSNE1WbHlOQ3E1SE56QkdrWkZkOGVCQXla?=
 =?utf-8?B?ekhsbU5lV3ZZRVJEdkwyQ2JNemlVVmhmT1Vpc3Z1Zk96Y3JDVFNzRDlCSzlK?=
 =?utf-8?B?WVR3N2FDQWY3UWIwM0R2aEZJTlBITnRmc3ROV2pGa0kzckJKQ25SeWpIb2tx?=
 =?utf-8?B?WEw4Z2lVM0lxazY1bVh1YlNhd0FKMy9XNmdlN3lraEZRbVRnVWZUUEQ1L3o2?=
 =?utf-8?B?dlNUS1c0WnBmeTBSWWJSSkZBVHdMakI3d0pINzRZMisxanVWc1g5WEpYUmJN?=
 =?utf-8?B?aDZUMXhEdm0zVmxlNzlnV0NuMktJUmlDdlF2WVJSNG5zMXFNZHFhRlFiTHpB?=
 =?utf-8?B?c0RrWVlIcnVyUWE3UURoR09EbkFmSlU4dVkydnZ4NkRORjNzckROUXp0STdN?=
 =?utf-8?B?eEhhdHpJckgwbDNJdmgxZDl3NVVTQWV5T0VTa0VEb0JlbEhuZURtWnhLR3Za?=
 =?utf-8?B?bXB5bVVRSXpFYXNUTFRUZGNVV0Z5S0FxdEdMVUZZTUJveXdTdzg3K1QrQ2hC?=
 =?utf-8?B?R3Ywd2VhVWc2cWpLb1hSMjRSRVJydkErL3pOVnhhdnlKWkt0UG9YL3VwZWQ2?=
 =?utf-8?B?eTl1Y21Ca3NoWjVqUTVyeVZsNHlFLzRqVHBzVnp6TmdCYlBrK3kzbTBvNjRD?=
 =?utf-8?B?L0hNeTUvUnZSUmZvTVNjN1ovWWU1NHBDY3drME1LVEorc0s4cWVQUmRtd0tu?=
 =?utf-8?B?Y2xOL09lM2FPYWRnaUhtdnJmZTh5STV3TktnSkVaQmR5Q3BGTm5NWE1iSjdt?=
 =?utf-8?B?SEpoN3EyNWM4QW1oSFdGWURxMTYrWGZTdGhncHlPRnZRUVgzaVpKampVajRs?=
 =?utf-8?B?WXhmUDIyY2MzanBOOG1lclJSVU1EYmJvTWVZcDVmWGdMaGl1UXRSZDNvMDhy?=
 =?utf-8?B?cURVMXREaU1ZcWN6dHl4TWFSdFhzcWdsQXQ3SHhQbXR6dzlTbzNtTFRTUk9u?=
 =?utf-8?B?Ujk3QW9acWNvdUh3S0ZzTFVjakthMWgyT3l2NmtWTXB0ekpPZCt4UzNNTFYr?=
 =?utf-8?B?SUxFSlp0bFVHa3BUZTJ2RDF1UlpyM2J1L0xjZS9IcHEvekNzdGlVVzFNaEpn?=
 =?utf-8?B?RERDbkl1bTY1cVJaSFRWOHo0QlBNQmhYMDRTM2VadldLUUNyRlNtUFNjc3lJ?=
 =?utf-8?B?d3U0bDJMZW9EMHRPZEh6L1B0elpmYmxLenhEdUhJRTl1TC9SUG5FOWdMbTZT?=
 =?utf-8?B?VUpnZ0xCZjBuazlJOXFLV1FYcFBRaVR5MUVocXQ5OVNyTFhNU2s2SWJ2T2Jl?=
 =?utf-8?B?TkxsZjBpR0RnS0FUWS9hWnRtTkl3a2lSdHlxV0tYUlpXL3hTMExyejJmVHUx?=
 =?utf-8?B?cy94WFRubC8xaDN2STQrVzBhcFVhZzB2dHpkSlUrS1d3Q0pMREVOMGxpYWJE?=
 =?utf-8?B?V0kwT1gxU1VmYVY2N1psMUt6VStCcHlnMTF2M1NCTTVrakhjVDFuWTBNRUxC?=
 =?utf-8?B?WkVzZjlpSzA1R0N4MXdHd0ZmaEF6Unh3a0ZxdFM3T3RSNm9xOVh5RnBUNXJp?=
 =?utf-8?B?c3d0NVdUclZqNitDQjlWSGZtQng3R1dZNTRoVzlzZmdMdUxzZUdKRXIzNldI?=
 =?utf-8?B?Y2hjeGlHamNTK09oQmttNWtKZFVZVjN3QVFjMjZSQXNNVWlUbllWUlNabE5z?=
 =?utf-8?B?Rjc0Yk9UMWlvNmlKdVNyR1lxZDZGajNxTFVLd251QUpLb0VUbDVpTUhkOFpj?=
 =?utf-8?B?ajh4YlRPWm5vOGx5SmJOMEEvRmdZSDQzT1F0cTRTeGo0ZTRtUmxyREZwYlNl?=
 =?utf-8?B?aktzWHRDMFp2OGVZbmhlRVNiaDZCYjJRNVNEYWlLVGpSU2lKcFEwYWxhZlky?=
 =?utf-8?B?SWJGcnJsSWlxd3RQbjAzQkZiVGcyNGFIMDJqUUpHcHV1UG5RbVAvTlg4bkIz?=
 =?utf-8?B?dUxpZU13L0pwdlNzWCtMS0pGSW9sdmVZWWR3OUQ2M25IbXk1VTN2M0FNellZ?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBB650119BB1624F9FE1C6736944F812@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e16cdbe7-8723-4003-bcae-08db7deffb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 07:09:47.2514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diqpKxVoLmzHEekfBt6XLpHl/mh+al2f+IY/RL7NhkLisr7ZvKWeFkoBtjsgruZwD39dPAVFy36XdiFQqlCq/fcKPElcq3GWHXnm3DCXQxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2485
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

DQoNCkxlIDIxLzExLzIwMjIgw6AgMDQ6NTEsIFpob3V5aSBaaG91IGEgw6ljcml0wqA6DQo+IER1
cmluZyBDUFUtaG90cGx1ZyB0b3J0dXJlIChDT05GSUdfTk9fSFpfRlVMTD15KSwgaWYgd2UgdHJ5
IHRvDQo+IG9mZmxpbmUgdGlja19kb190aW1lcl9jcHUsIHRoZSBvcGVyYXRpb24gd2lsbCBmYWls
IGJlY2F1c2UgaW4NCj4gZnVuY3Rpb24gdGlja19ub2h6X2NwdV9kb3duOg0KPiBgYGANCj4gaWYg
KHRpY2tfbm9oel9mdWxsX3J1bm5pbmcgJiYgdGlja19kb190aW1lcl9jcHUgPT0gY3B1KQ0KPiAg
ICAgICAgcmV0dXJuIC1FQlVTWTsNCj4gYGBgDQo+IEFib3ZlIGJ1ZyB3YXMgZmlyc3QgZGlzY292
ZXJlZCBpbiB0b3J0dXJlIHRlc3RzIHBlcmZvcm1lZCBpbiBQUEMgVk0NCj4gb2YgT3BlbiBTb3Vy
Y2UgTGFiIG9mIE9yZWdvbiBTdGF0ZSBVbml2ZXJzaXR5LCBhbmQgcmVwcm9kdWNhYmxlIGluIFJJ
U0MtVg0KPiBhbmQgWDg2LTY0ICh3aXRoIGFkZGl0aW9uYWwga2VybmVsIGNvbW1hbmRsaW5lIGNw
dTBfaG90cGx1ZykuDQo+IA0KPiBJbiB0aGlzIHBhdGNoLCB3ZSBhdm9pZCBvZmZsaW5lIHRpY2tf
ZG9fdGltZXJfY3B1IGJ5IGRpc3RyaWJ1dGUNCj4gdGhlIG9mZmxpbmluZyBjcHUgYW1vbmcgcmVt
YWluaW5nIGNwdXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaG91eWkgWmhvdSA8emhvdXpob3V5
aUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvbGludXgvdGljay5oICAgICAgICB8ICAx
ICsNCj4gICBrZXJuZWwvdGltZS90aWNrLWNvbW1vbi5jICAgfCAgMSArDQo+ICAga2VybmVsL3Rp
bWUvdGljay1pbnRlcm5hbC5oIHwgIDEgLQ0KPiAgIGtlcm5lbC90b3J0dXJlLmMgICAgICAgICAg
ICB8IDEwICsrKysrKysrKysNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3RpY2suaCBi
L2luY2x1ZGUvbGludXgvdGljay5oDQo+IGluZGV4IGJmZDU3MWYxOGNmZC4uMjNjYzBiMjA1ODUz
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3RpY2suaA0KPiArKysgYi9pbmNsdWRlL2xp
bnV4L3RpY2suaA0KPiBAQCAtMTQsNiArMTQsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9yY3Vw
ZGF0ZS5oPg0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UUw0KPiAr
ZXh0ZXJuIGludCB0aWNrX2RvX3RpbWVyX2NwdSBfX3JlYWRfbW9zdGx5Ow0KPiAgIGV4dGVybiB2
b2lkIF9faW5pdCB0aWNrX2luaXQodm9pZCk7DQo+ICAgLyogU2hvdWxkIGJlIGNvcmUgb25seSwg
YnV0IEFSTSBCTCBzd2l0Y2hlciByZXF1aXJlcyBpdCAqLw0KPiAgIGV4dGVybiB2b2lkIHRpY2tf
c3VzcGVuZF9sb2NhbCh2b2lkKTsNCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC90aW1lL3RpY2stY29t
bW9uLmMgYi9rZXJuZWwvdGltZS90aWNrLWNvbW1vbi5jDQo+IGluZGV4IDQ2Nzg5MzU2Zjg1Ni4u
ODdiOWI5YWZhMzIwIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvdGltZS90aWNrLWNvbW1vbi5jDQo+
ICsrKyBiL2tlcm5lbC90aW1lL3RpY2stY29tbW9uLmMNCj4gQEAgLTQ4LDYgKzQ4LDcgQEAga3Rp
bWVfdCB0aWNrX25leHRfcGVyaW9kOw0KPiAgICAqICAgIHByb2NlZHVyZSBhbHNvIGNvdmVycyBj
cHUgaG90cGx1Zy4NCj4gICAgKi8NCj4gICBpbnQgdGlja19kb190aW1lcl9jcHUgX19yZWFkX21v
c3RseSA9IFRJQ0tfRE9fVElNRVJfQk9PVDsNCj4gK0VYUE9SVF9TWU1CT0xfR1BMKHRpY2tfZG9f
dGltZXJfY3B1KTsNCj4gICAjaWZkZWYgQ09ORklHX05PX0haX0ZVTEwNCj4gICAvKg0KPiAgICAq
IHRpY2tfZG9fdGltZXJfYm9vdF9jcHUgaW5kaWNhdGVzIHRoZSBib290IENQVSB0ZW1wb3Jhcmls
eSBvd25zDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvdGltZS90aWNrLWludGVybmFsLmggYi9rZXJu
ZWwvdGltZS90aWNrLWludGVybmFsLmgNCj4gaW5kZXggNjQ5ZjJiNDhlOGYwLi44OTUzZGNhMTBm
ZGQgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC90aW1lL3RpY2staW50ZXJuYWwuaA0KPiArKysgYi9r
ZXJuZWwvdGltZS90aWNrLWludGVybmFsLmgNCj4gQEAgLTE1LDcgKzE1LDYgQEANCj4gICANCj4g
ICBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHRpY2tfZGV2aWNlLCB0aWNrX2NwdV9kZXZpY2UpOw0K
PiAgIGV4dGVybiBrdGltZV90IHRpY2tfbmV4dF9wZXJpb2Q7DQo+IC1leHRlcm4gaW50IHRpY2tf
ZG9fdGltZXJfY3B1IF9fcmVhZF9tb3N0bHk7DQo+ICAgDQo+ICAgZXh0ZXJuIHZvaWQgdGlja19z
ZXR1cF9wZXJpb2RpYyhzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpkZXYsIGludCBicm9hZGNh
c3QpOw0KPiAgIGV4dGVybiB2b2lkIHRpY2tfaGFuZGxlX3BlcmlvZGljKHN0cnVjdCBjbG9ja19l
dmVudF9kZXZpY2UgKmRldik7DQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvdG9ydHVyZS5jIGIva2Vy
bmVsL3RvcnR1cmUuYw0KPiBpbmRleCA3ODlhZWIwZTExNTkuLmJjY2JkZDMzZGRhMiAxMDA2NDQN
Cj4gLS0tIGEva2VybmVsL3RvcnR1cmUuYw0KPiArKysgYi9rZXJuZWwvdG9ydHVyZS5jDQo+IEBA
IC0zMyw2ICszMyw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3N0YXQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L3RpY2suaD4NCj4gICAjaW5jbHVkZSA8bGludXgvdHJhY2VfY2xvY2suaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5o
Pg0KPiBAQCAtMzU4LDcgKzM1OSwxNiBAQCB0b3J0dXJlX29ub2ZmKHZvaWQgKmFyZykNCj4gICAJ
CQlzY2hlZHVsZV90aW1lb3V0X2ludGVycnVwdGlibGUoSFogLyAxMCk7DQo+ICAgCQkJY29udGlu
dWU7DQo+ICAgCQl9DQo+ICsjaWZkZWYgQ09ORklHX05PX0haX0ZVTEwNCj4gKwkJLyogZG8gbm90
IG9mZmxpbmUgdGljayBkbyB0aW1lciBjcHUgKi8NCj4gKwkJaWYgKHRpY2tfbm9oel9mdWxsX3J1
bm5pbmcpIHsNCg0KQ2FuIHlvdSB1c2UgZm9uY3Rpb24gdGlja19ub2h6X2Z1bGxfZW5hYmxlZCgp
IGluc3RlYWQgYW5kIGF2b2lkIHRoZSAjaWZkZWYgPw0KDQo+ICsJCQljcHUgPSAodG9ydHVyZV9y
YW5kb20oJnJhbmQpID4+IDQpICUgbWF4Y3B1Ow0KPiArCQkJaWYgKGNwdSA+PSB0aWNrX2RvX3Rp
bWVyX2NwdSkNCj4gKwkJCQljcHUgPSAoY3B1ICsgMSkgJSAobWF4Y3B1ICsgMSk7DQo+ICsJCX0g
ZWxzZQ0KPiArI2Vsc2UNCj4gICAJCWNwdSA9ICh0b3J0dXJlX3JhbmRvbSgmcmFuZCkgPj4gNCkg
JSAobWF4Y3B1ICsgMSk7DQo+ICsjZW5kaWYNCj4gICAJCWlmICghdG9ydHVyZV9vZmZsaW5lKGNw
dSwNCj4gICAJCQkJICAgICAmbl9vZmZsaW5lX2F0dGVtcHRzLCAmbl9vZmZsaW5lX3N1Y2Nlc3Nl
cywNCj4gICAJCQkJICAgICAmc3VtX29mZmxpbmUsICZtaW5fb2ZmbGluZSwgJm1heF9vZmZsaW5l
KSkNCg==
