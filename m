Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E387915F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 12:59:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OoukIvcC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfQdS3d8Xz3c2Z
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 20:59:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OoukIvcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::606; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfQcb2Nr8z2yst
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 20:59:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gfl6uT/px+1DfXHX6VrLU8n3TMxz0BZfAd44JBAHsDJSwF4ntgQaxCoA5aaVA93abcbGaaEvJoGsd0R0+SLBJBgeM3z9rUJxk6p6w6wJlHs5KJQlnKvD0bgpZXL/+juLp9c8Szff5tpPDzIC/rUseFezr6nbU3g0hU3dCkFmu2rBFVA/lglPfGSkFlh1a08uWVArqY0Df4VQdQhuOf/Oa4UVEV3c50TCZL8knWjr94VhX3wrzejYaNDhm8OiB2fjk6Fsz+/ukLYVdi1WV3QXi39U8UvrmOBIYB8Ew27Mp8/6FiBBPR2XVVsOeAxFVfsKIfQoxG4rkezdgPj4OonNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vbLYlHkVqL/1jcvBcbzCOzJV2Mo1/fYjuQyXr/L2UA=;
 b=EY7Ga8E/zo1yBV3K90GQ7IrjFRdB2IW+4PaaKBG5WBYb8FoU8HZnOUBvnoq8a5wExyWjwtbVf6gD14I1aAwJegg9aWZPtTQgRfIZtQN/WSFYldH7EO1jmVf8bIFrUKgeiRAfUyJc0WjQ10N3Q+n0yFsfZmHN67FcRGENS+mwjJAjgxizaJC6evwlI7HK2IWNMdccSpdmeIFIvX5ghwMyVOzKNeUxJvs9uPGoEY1BPxLoaoBgvocdWY0DO48wzWnTKM3Vb7b1FV3xL9ruJLOkOI1yMiuG/5LeWtEFVuHJ1rNEM6uXeyUwk3o+el4dV9zGodZqwkf+E9kN23Mt0b2jxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vbLYlHkVqL/1jcvBcbzCOzJV2Mo1/fYjuQyXr/L2UA=;
 b=OoukIvcCQ2Uc6+8o8eDv/QL129Xt3c3ExK7XUxhnCQpsC5vRYPv0cLYf90TGe7vE+g8NNmZrA7tPuosEvk4Xn/W4fssEB5DgD61C44/TvCx8rh/eiqnWoSnJGt/QtvR+LKZHpHieqz4rdwStJTmr4oGghzseX5MpVEaNmWprEx/4AjzBXL4tUZUKrwvvvNvZerdDET/kSmmE9chUYuff6g0sZECb0rBAsj0z7tVB+Rz2TlOVo+WzNXYRBOaP34xoWbaW7T0oesO6AK7hZ2w3fpGUggmi2LDup92PZaUph5Rc9faOIq9w9vcercmzCsuz+exetYgdZDjDo7ZMMy/QsQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:58:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 10:58:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yuan Tan
	<tanyuan@tinylab.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
Thread-Topic: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
Thread-Index: AQHZ3H4JMz6lATVF6k+N+07IaZY+WLAKTRkAgAAdLoCAABg5AIAAAhYA
Date: Mon, 4 Sep 2023 10:58:51 +0000
Message-ID: <54da2376-dc65-0a96-55df-7a5acfbb9bff@csgroup.eu>
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
 <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
 <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
 <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
In-Reply-To: <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2015:EE_
x-ms-office365-filtering-correlation-id: 85d87193-908e-45eb-aed9-08dbad35ec49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MGTUX+JhwjJzIckkhV2y646AKCI52H5mYNJ4ApEhN2iH6Qc4X2d8t438iA1x5vDmDzm42DwiyeDHvcqJ24vs3FNZUSuWSpeo47BKjZwhbRRo0Cqz5eGt3KgwubyVIkY1B/U8UNzqM0dJ2fzhwBoYBTl2H5nQIkmo8agFQYZNSsxitHA+UrNBU8slGGZFRSl/UVmI3kuJ72kX5E2S9YDg4BO1kL6z3fK09365oy28yxdJtH6DocTVeBxgQozolwqgs3HFXA0BMsWY7HZ7cNQRcSRL1D+dojlh6kRJqvcAEuoWP2sp7JbZkI6AMB/mdx3dO1BeGCcVQ1ZbAjNUhWp1He/Ly9LgmU4tVABsiY/pTdGLWh3p/SwS1LadYs/KIgr6GAA+2uQGeJj2AQ+OuatH4SYcM1faFV/Vl2plRQ0GXCN5cRFRguGI02fjmBvWbJ7xbjC/vda4V5+DVpWlZXu4fbaiuBWH7AFhfUzLry2lv6IBWAFrKIsJMw0Av5T8WdMrno83QeepqNZTMXI17ILiL1A7GP8/9No2uSa0JTjpE6BySEQ3KsxuphyWQxM+ZGG69CpeYGzGCl10GKgh6MqUtEBvc/HJZpYZ1TuTnMJa9j3JJYRAHVffXk85dzhSrZ36FgQADfskTqxE+laki3qt88auV/B8Qj++nlx8iGmTXS2ftmtdqZBinEiSaufEBNut
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(136003)(346002)(366004)(186009)(1800799009)(451199024)(26005)(6506007)(2616005)(53546011)(6486002)(6512007)(38070700005)(38100700002)(122000001)(31696002)(86362001)(36756003)(66574015)(83380400001)(44832011)(76116006)(7416002)(41300700001)(8936002)(316002)(4326008)(54906003)(66476007)(66446008)(64756008)(66556008)(5660300002)(66946007)(91956017)(110136005)(31686004)(8676002)(2906002)(71200400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QTFKR0hjanR4QjhTenhCeWliL2doMkY5V1VOanI0SFBKaGFoaDdjUWdMdHor?=
 =?utf-8?B?eDFrY2JzOXlaR2tlMzJFSW01d0FOTlVSd1NpQzZqa0J3VmhTTVNvcitHVFE4?=
 =?utf-8?B?N09oN0VLWG0xcVNoMVo0K3A1bzBNRGRyTkVmK0JHT2xvUENQQW9OYXdya0x0?=
 =?utf-8?B?UzZwZ1UyR0ZPNStyaFBFNDVYbFRZNHNQMUpFNTg5ZzZUcWNPUU5aRkNkV3lj?=
 =?utf-8?B?Q0J1dnNhUjdjWCtkOUcvdXRkRXFRTkZ2TGdPbWV1WitSa2FCNm1jZjU2TUc4?=
 =?utf-8?B?QkdYV1Y1YTFQRlBtc3ZnUmV6cGh2RVVtVTJUa05IZXJvYzJveXpuaFpKSEM2?=
 =?utf-8?B?citKRlhpQzJnSnlwQ1NXVGZZV1J4REd0ZE5zVjA5b3VSeENxUEhGaTBGQU9s?=
 =?utf-8?B?ZDRqWFd6Sy9TeEtKNmtmNE1ESjJ2WndhYUxKRCs5QnRZUlc5VDlsSEpqUU5t?=
 =?utf-8?B?V0lOT1hTTWZTYk1zUFlBUXlxdXl2dFB6ZWl0bzZRYWFSUStrSmptdlh2MmhL?=
 =?utf-8?B?cjFxeVlMMDlBU3YvZ0ZOZlNjMnAxOUlpV1FGWmpXem54elViYkRBakFaWUNB?=
 =?utf-8?B?UnhVZW5wMEVicTg3MzJIeWpkcElUeGE4Y0FDcGtjRExqeTJRdWxzOXVQLzdx?=
 =?utf-8?B?N3dIWHNRM0p0MWhNcE1pbnNQSzNWeEQrQklEaU9wc3p4UmhscmtoWlZvVEJ0?=
 =?utf-8?B?VnBlZDl0U2xBVUI3ZzNJVVFHcE4zaFYxUGQ4Q1ppditDTzI5dHJ4MFpVSlJM?=
 =?utf-8?B?cnNtdTI5Z0FQS0gxdDN6WkFyNDc5a0VsM2t0RC9wbFlpdnRFK205WXRacU9y?=
 =?utf-8?B?Q3Vrb0I3VDcrSkNOWko5U1ZSOGtRc25KNTRxbFpHWlhjUktvM29oM1Vna0tn?=
 =?utf-8?B?STlkU0xYQXpVWFNiS010VDc4aFpENm5sTWh4MzYrRFZDM1pycWIyY05tOURJ?=
 =?utf-8?B?d0tCb2FaUjk0Z0M4OVVTdmdVdFQwYThnZDdNMk9BMFJOVy9lMFQyYkUwWnJi?=
 =?utf-8?B?bCtnc3FsTUppSDNKSVpqRHNYYkV5bVZLT1gyZ2tQVVd4UytGTDhBQXN3SHgx?=
 =?utf-8?B?alpiRk5kNElhOXR6L0tTVEdLNTY0NkR3bFJsTEhwNXQwMVowMUpRdkxzdEhH?=
 =?utf-8?B?ZVB3TkYyYUhyaERpa1ZVbHRMVU52b2hSSld2dXIrWkgyMTM2MXNiUnRCUnlp?=
 =?utf-8?B?cmk4aGhkUnc5WWNpVUM3ampKMzBkWCtvNHZnTWllR0k0bktWL1VaejBsdGkx?=
 =?utf-8?B?MzFndFZSRDV3TlRnNlV5M2svZ3cvSDFrV05KRXJ6YVhIb1V5SGpBdkkwS1R1?=
 =?utf-8?B?c1YzQlhTZjBnMzJaSzBlZnEzRGFnTkd0V1BLaitPNnpIak02Q2FEMUxVMXN2?=
 =?utf-8?B?NlZlMkprTkFIaCtjTFZzdTYvV1ZmZkpMSXpVcUpGQUNLYXhldkRjUEJTeUtJ?=
 =?utf-8?B?ZjJBaEdDL3drTzRpYjkyZ2tvbTJmbTZFODZoVE4xUUozNS90ZWtlVlhyTGNs?=
 =?utf-8?B?UlJmeFpCMVNadWpxTkJrS1RLRC8yZ096eGFzdzNWSWRia0VoV3lud0wrWWpQ?=
 =?utf-8?B?cnJUSEZXSVhzQXBwL0tBUjEzUnZMdTdsRitxZmZTYUI5dFo0ME90TEh0Y0dF?=
 =?utf-8?B?TitJSEtDUExmTFJCZEF0b3l1WkZ0VHdyeHQ4ZUJId2ZaZjN2MFYvNENUOUN5?=
 =?utf-8?B?RURjdiswbnpaVmtnR3NVWEIzM2ZWZFNvSUlZdk9DV2xsQVBrL3hkc1I2bEJ4?=
 =?utf-8?B?eEdwS2xWcDBjUmM4MGkrVWo5bkdZM2FROThTbVpxb1hXUjFYRm5kNkQrL1Yy?=
 =?utf-8?B?YWx5OWg0QkdNVzI1VVd5eDVGMklsZDhTRVBlcW9XZ2RzM1djNnlsMFQ2K0kv?=
 =?utf-8?B?RUFIaG9CbHBEZU9VUlY5MSt2RnFXZXM1QjVkdFdlVFFFWjIvYWN1RW1Wc1R4?=
 =?utf-8?B?RFNIWTRicjVmdDIrK3ZzTm5tTUtraElLQmN6SXNDendpYXRIR3IrUHhxOStG?=
 =?utf-8?B?cjZpeWJ6am1qYUU5YS9SZWhvSjZaQVhvcTBreDNUQlFma3k4WG1WMmpiUVdJ?=
 =?utf-8?B?aTFxLy9ydUd2WDBWS1oxOFprMklyYm5jYXFoQXpRSzBpNi9VMUtJNVdkQVpP?=
 =?utf-8?Q?rIknGnp/uxTmlShJOxSoZXo8X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FADB8643C7B9E47B781EDF4ADE12CDB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d87193-908e-45eb-aed9-08dbad35ec49
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 10:58:51.1926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFmtzYmrhGNb4vR5OjH3GONbLyOczyA4QL0a5//peiTsUyjujdinICQafUO4fer2kDgOjJA5VQvXjrguN7GXEMY57i8ZOg9ninC91CW1j3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2015
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>, "falcon@tinylab.org" <falcon@tinylab.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "w@1wt.eu" <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA5LzIwMjMgw6AgMTI6NTEsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIGEgw6lj
cml0wqA6DQo+IE9uIDQvOS8yMyAxMToyNCwgWXVhbiBUYW4gd3JvdGU6DQo+PiBIaSwNCj4+DQo+
PiBPbiA5LzQvMjAyMyAzOjQwIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+
PiBIaSwNCj4+Pg0KPj4+IE9uIDEvOS8yMyAwNDo0MiwgWXVhbiBUYW4gd3JvdGU6DQo+Pj4+IE1J
UFMgTWFsdGEncyBwb3dlciBvZmYgZGVwZW5kcyBvbiBQQ0ksIFBDSV9RVUlSS1MsIGFuZA0KPj4+
PiBQT1dFUl9SRVNFVF9QSUlYNF9QT1dFUk9GRiB0byB3b3JrLiBFbmFibGUgdGhlbSB3aGVuIFBP
V0VSX1JFU0VUIGlzIHNldA0KPj4+PiBmb3IgY29udmVuaWVuY2UuDQo+Pj4+DQo+Pj4+IFN1Z2dl
c3RlZC1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWXVhbiBUYW4gPHRhbnl1YW5AdGlueWxhYi5vcmc+DQo+Pj4+IC0tLQ0KPj4+PiDCoCBh
cmNoL21pcHMvS2NvbmZpZyB8IDMgKysrDQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9LY29uZmlnIGIvYXJj
aC9taXBzL0tjb25maWcNCj4+Pj4gaW5kZXggYmM4NDIxODU5MDA2Li4xM2JhY2JkMDUxMjUgMTAw
NjQ0DQo+Pj4+IC0tLSBhL2FyY2gvbWlwcy9LY29uZmlnDQo+Pj4+ICsrKyBiL2FyY2gvbWlwcy9L
Y29uZmlnDQo+Pj4+IEBAIC01NDcsNiArNTQ3LDkgQEAgY29uZmlnIE1JUFNfTUFMVEENCj4+Pj4g
wqDCoMKgwqDCoCBzZWxlY3QgTUlQU19MMV9DQUNIRV9TSElGVF82DQo+Pj4+IMKgwqDCoMKgwqAg
c2VsZWN0IE1JUFNfTVNDDQo+Pj4+IMKgwqDCoMKgwqAgc2VsZWN0IFBDSV9HVDY0WFhYX1BDSTAN
Cj4+Pj4gK8KgwqDCoCBzZWxlY3QgUENJIGlmIFBPV0VSX1JFU0VUDQo+Pj4+ICvCoMKgwqAgc2Vs
ZWN0IFBDSV9RVUlSS1MgaWYgUE9XRVJfUkVTRVQNCj4+Pj4gK8KgwqDCoCBzZWxlY3QgUE9XRVJf
UkVTRVRfUElJWDRfUE9XRVJPRkYgaWYgUE9XRVJfUkVTRVQNCj4+Pj4gwqDCoMKgwqDCoCBzZWxl
Y3QgU01QX1VQIGlmIFNNUA0KPj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBTV0FQX0lPX1NQQUNFDQo+
Pj4+IMKgwqDCoMKgwqAgc2VsZWN0IFNZU19IQVNfQ1BVX01JUFMzMl9SMQ0KPj4+DQo+Pj4gU2hv
dWxkbid0IHdlIGFsc28gdXBkYXRlIHRoZSBfZGVmY29uZmlnIGZpbGVzPw0KPj4+DQo+PiBTb3Jy
eSwgaW4gbXkgbGFzdCBlbWFpbCwgSSBmb3Jnb3QgdG8gcmVwbHkgdG8gYWxsLiBTbyBJIGFtIG5v
dyANCj4+IHJlc2VuZGluZyB0aGlzIGVtYWlsLg0KPj4NCj4+IEluIG1hbHRhX2RlZmNvbmZpZywg
UENJIGFuZCBQT1dFUl9SRVNFVF9QSUlYNF9QT1dFUk9GRiBoYXZlIGFscmVhZHkgDQo+PiBiZWVu
IHNldCBhbmQgUENJX1FVSVJLUyBpcyBhbHNvIHNlbGVjdGVkIGJ5IEZTTF9QQ0kgWz1uXS4NCj4+
DQo+PiBTbyBzaHV0ZG93biBhbmQgcmVib290IHdpdGggbWFsdGFfZGVmY29uZmlnIGlzIHdvcmtp
bmcgYW5kIHRoZXJlIGlzIG5vIA0KPj4gbmVlZCB0byB1cGRhdGUgdGhlIG1hbHRhX2RlZmNvbmZp
ZyDwn5mCDQo+IA0KPiBTaW5jZSB0aGUgZGVwZW5kZW5jeSBpcyBub3cgZW5mb3JjZWQgYnkgS2Nv
bmZpZywgdGhlIGRlZmNvbmZpZyBjYW4NCj4gYmUgc2ltcGxpZmllZDoNCj4gDQo+IC0tLSBhL2Fy
Y2gvbWlwcy9jb25maWdzL21hbHRhX2RlZmNvbmZpZw0KPiArKysgYi9hcmNoL21pcHMvY29uZmln
cy9tYWx0YV9kZWZjb25maWcNCj4gQEAgLTMwNiwzICszMDYsMiBAQCBDT05GSUdfU0VSSUFMXzgy
NTBfQ09OU09MRT15DQo+ICDCoENPTkZJR19QT1dFUl9SRVNFVD15DQo+IC1DT05GSUdfUE9XRVJf
UkVTRVRfUElJWDRfUE9XRVJPRkY9eQ0KPiAgwqBDT05GSUdfUE9XRVJfUkVTRVRfU1lTQ09OPXkN
Cj4gDQo+IEJ1dCBtYXliZSB3ZSBkb24ndCBjYXJlLCBJIGRvbid0IGtub3cuDQoNCkkgdW5kZXJz
dGFuZCBmcm9tIHdoYXQgeW91IHNheSB0aGF0IHlvdSB1cGRhdGUgbWFsdGFfZGVmY29uZmlnIG1h
bnVhbGx5ID8NCg0KZGVmY29uZmlncyBzaG91bGRuJ3QgYmUgdXBkYXRlZCBtYW51YWxseS4NCg0K
T25jZSB5b3UgaGF2ZSB0aGUgbmV3IC5jb25maWcgeW91IHNob3VsZCB1c2UgIm1ha2Ugc2F2ZWRl
ZmNvbmZpZyIgdGhlbiANCnJlcGxhY2UgeW91ciBmaWxlIGJ5IHRoZSBuZXdseSBnZW5lcmF0ZWQg
ZGVmY29uZmlnIGZpbGUuDQoNCkNocmlzdG9waGUNCg==
