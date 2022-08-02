Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A88587AC8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 12:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxrwd3HLMz30hw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 20:35:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jlsta/Bz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.57; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Jlsta/Bz;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120057.outbound.protection.outlook.com [40.107.12.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxrvs4JCCz2xD3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 20:34:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyvbQMaXGeKcODm7zSDQ8bVOj6W1cWxWw2zdKxuh/lcs1IWfzC4j6xFCGYgP8If7Hb2vLMtbRk36n047bnFrF7djo6eDRtXJX+wxtIIojB5BDoZeI526jp3SXef6nKh8vxWku5NK9/397cIzRcewhAqSYIq5kB5VpdQ332pFWKjzPz2Y2TwlAb2ITGjWsDvana2EMKqFhOWX15Q336nNeeckR2zUfDBvKYRejUF/bUYUhGFkpEDMG2ea1cHwRt/YWsECdPNvPmOygIiJTdibDoTGpWBi1qMB7F0O8fH+mPekaWqjtXk3dINuxiM0KKeC1W0R7m2pffMB8nKPXRRwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5RLsiy8VgGUnpM0ICe2DOL6L6PTB/Ox8T5Ff04+fu0=;
 b=H67VaL9nAmSK9V+BXQP5vz3AKVbqHGIDlvMl3J8KDzAYG+5mgpZb4JnyE10sVKrxG8mtRM+0mLCPFrj3ORO7izlXrHZ3atb7EdrVZZWKrijor3uWreMtRhCVJr0S0sG5KiLbVX9tDp9Hri+F2f5sW0R/0ItQ8BWLRFq9IVwVnnnJRv7n8+o5OpG7s6YuJs8k7AvBqn4gKeIaXP0l673yo3Domun0GwznS/W2ZqZ7JW/h6Fi0Lz69jLdyiWmv8UcVXIMXncjOKWeh6dmvLjP9u9vfQvtxUh8pRXDU9J6f0GBSuIZH37fumwfnW/JcnOC3/fZOgHrdrz/3iYV3Y1n3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5RLsiy8VgGUnpM0ICe2DOL6L6PTB/Ox8T5Ff04+fu0=;
 b=Jlsta/Bz5bNX+WV4oECjHo0KUQaODEom7BA7NS8zsQH5YrOhzIHkzkuRRxtBwFgwxzkgA+DA4ArOsGUVcVS5f46xdcGF2qGzB3T9r3E6739JwHF2e1YhStLk/j4uRyUyxBanoev0zdzgXZg7OHcCRhP0nO+OhRzso1+xt/8mflIDCXljr9VHO3Dx60IymhXwejhbGUdrbiZhjlUEmG6s8+vuvxyLgA6m+zPwkMZxPGK3Pc2EOa1CR6UPV14L6wm5nJXI8QYmf4D6n0ausR00yuEmj9W25TUQVX82X9tJTPaleRC0oc1Fcw7HnryuhlYh8gOI8qgEkMUuerGLpvaDFA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 10:34:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:34:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Fwd: [linux-next:master 2767/10347] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/hid/hid-uclogic-rdesc.o' being placed in
 section `.init.plt'
Thread-Topic: [linux-next:master 2767/10347] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/hid/hid-uclogic-rdesc.o' being placed in
 section `.init.plt'
Thread-Index: AQHYlvCooRBbbm4LUkS8CKCZPywv8q2biO+A
Date: Tue, 2 Aug 2022 10:34:13 +0000
Message-ID: <f08d6285-6aae-6e99-ad6e-53ad0125688b@csgroup.eu>
References: <202207140355.luE6UekP-lkp@intel.com>
In-Reply-To: <202207140355.luE6UekP-lkp@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdffb9f3-e5df-4296-42bf-08da74728b22
x-ms-traffictypediagnostic: PR1P264MB3311:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hqAQxr8qKlipCUThG2lXJxiAn7GlTN/f8yhbJVd3Vc2hs4FYOMpBFBfI87A1yTDskfnoNTlVdtjMdqzMW0f8FAzdGlWyUTto4KkBSXzIy4ZHfFSXJivsmvhraWrsltBAeVZzdnUDCbsbqcZt0Bi+T+8AQnPYKzzvaRra26+yL7I4cvbtkH8d16NiVX2z6B4wIjAU1FPiDKOP91Gr92w3MUoGmJPmed8cdsiy+LlkRNEluGjb/X5DnXpyWqeG1Y2svJwb4nJQRmE5lLrhba5w3QTAlTf3KyGvkUaXA5xOZD4/MRAsTNNYXY+HXvwHxvfwh+FKkEW5OTN2eZWiviPIGVUSo8c3hPr28//tR1zKXl1Vi/BV5JSEVJVEchnMQSydp2z3Yyd9wzIq1yGUXfeU+KjAGQJEEW8B0hRfDj8Q7b8S+vyelGeYrr3X8GpqGyWxJaMS9ePymRgnJ17nXDeO3X4ItAaSp6Xk6lcnblrr5mMoyGuHbSUxRyzZPEH03y4J7IPU/fT4TzPY6thuYUX1WgN7vTeyMwmzpr7BvmFVM7Ft94AW23QlnoUu46k0Ba++jwxX6jMpfG7YSSrfCHGbRhSCSKgEsor/txhGXccGv1VgaOBmDX3BjjT3KQIbZJCw7/A2jfr4EYsDnTY5ZoM5xmNs9VMcUWNEq3Rixs4jmDkAnwBmygO8dnvc6zP30CvQ8SORPs9ha9LSyXCdLt+soNMZ1AkeCkZn67qAwnXj1sCaMK+a0ZYIheUV4CmKGT3sprLmtj0fAU5Ku5mDXInQGdJNV/POuPTseEFJk4qJuTbyU9468BncgeaOOQ0fx4yZUjZ9gU3I42oWxzyGcOzuSpKpeROc7BbbE0CRDVIsb92i5JXeIyI9b5kYGL6qZwGS610ig/s/LAI530SUcui0ceDT0Mm1o+W22dU0h7j6ZGA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39850400004)(76116006)(66446008)(66476007)(316002)(64756008)(38100700002)(66946007)(8676002)(5660300002)(66556008)(44832011)(66574015)(41300700001)(2906002)(91956017)(38070700005)(8936002)(6486002)(966005)(83380400001)(186003)(86362001)(478600001)(36756003)(31686004)(26005)(6512007)(31696002)(6916009)(71200400001)(2616005)(6506007)(122000001)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L1cyeWFrTklBZUc0RUtxejlPUURsczZWN3dNV3lWY0VvZDRHQVkxSTJEeVpR?=
 =?utf-8?B?ZUJETzM5ZHBya1dqSUpqZWExK3hrRkkvanB1Q2ZSK05KNjlINnpPQUJ5Y2Vj?=
 =?utf-8?B?ZzhGL0RlckFld0pmbWVxYVFveTJtTkp3eHh3Q2NzK2EvVFcxNzM0Mi9oOVRr?=
 =?utf-8?B?WE8yZWhWNUR6MFc5bE5UVGlLUU15anR4OVJmK2Nxc0lyUURSU0dHK25EN2dx?=
 =?utf-8?B?alNnU0s5bVlLN01RS01EMjczZUloYjF3eU4ra0Nkb3N1MForUllzVmU0TC9B?=
 =?utf-8?B?Kyt6ZGd3WGxlUUMxZnFua0djNVhlTjNobGwxUENxRXlQS3pXR3Z4U0RtQjBY?=
 =?utf-8?B?TG5DK2N4R0VZNTRHeWRHcTRKT3p4cEhFMzNqcWZ5Y3dsZzVNajk1MXNhODc4?=
 =?utf-8?B?Y3Vpb09qOU5kOVFuMjRPamFjYm1aczFLTkFKYjU4Z3VHMys3SGo1aVhvNkNN?=
 =?utf-8?B?VGVZYXRjdDBGMG9jRHlsZ0lpeXdkWWh0NXJYcWhrdlFSNHdUMVRoREVaeWJR?=
 =?utf-8?B?dm5OU3F4SWlxZUlxUGdoZ2JsZUlVWUVJRFNOM2phWDBDQkN5bmFwTVNxdmMy?=
 =?utf-8?B?aFFwNGw5TzM4UEt0VTNOK2VZT3U2VkNrdzFhd3pRUHpMektSWElVUnRHelpX?=
 =?utf-8?B?bWd5OWU5OW10dHNxOTlvOUpPb1p6aTdONWYvZkpkQUZpb2QrbEw5WmxocXZj?=
 =?utf-8?B?UWVmaWVJd0hyanBPVnRLckN6QWZJOXZweGxIemx3N1FJd3JHaFdDbENJNTdY?=
 =?utf-8?B?dXc4MThuazlENkplMEovSzVGOWdDTjQrNFF1bGluSnRDRDlmV0Q5YjhacEha?=
 =?utf-8?B?ZEJ6azJka1BhcXMxSUhXVzRiYzd0YmhzSklnTkQvRnhlUEkwN2RrVWpITmYy?=
 =?utf-8?B?U1laSWt4VHAvNUJTSG90aHVJZWhueXppc1J5ZUZ4N3c0bnI1Z2JsbmpSYitl?=
 =?utf-8?B?NEF2RUMyT0tIaUJBS1ZYb2p6RkJjYlRjQ2Q0aGtCRWkyRlBIZ210R2dZcTNT?=
 =?utf-8?B?QXYvNjlQb2pUd2JQZEVBRXZuNkZ6ek1CQkc5aUNXTno5Q1FkVHJpOVJDNkdh?=
 =?utf-8?B?ZGJYbExScTRteGc3R0l6YzJxZk1FeVllUEdhdGxHU2lwelZ0MFZBZm5VYzh2?=
 =?utf-8?B?Ukg1UHZwSHB3TDBTOVZWdWVkNi9BdWFmcGdYeU50c0ZadFlnbHAzbkszSUMz?=
 =?utf-8?B?SjBsSDF0MG9kL1pQUWVtaG8zaE5wWVBIdkxXUHVHUWd3S0w2VU5OaUNFcHZh?=
 =?utf-8?B?WXZtZmx6blV1SmpNK3hwU3dtTFFWK2MyUnV1OTU1Z2JXOE40eEVtWWtxWXV1?=
 =?utf-8?B?VXJ2N3Y4Ynk0OFlWSVNlRWFTTmY3UU93R0tDdTcwQlNXYjkrZnNXcVRBaU9p?=
 =?utf-8?B?dkNlc0MxTTA0S1Y0bHdxdG5xOXo2eWZxR1pwOUd5TWorWiswTWJjbDVuTXBp?=
 =?utf-8?B?d0dKc2YyMjVzSmNUQkU1cFlmU0FFb1g0a2dMeUx6c2FkcktmcENoZ2tUS3VO?=
 =?utf-8?B?UDcxdGFxUGpuSlR3U0JMNGRnTDBYOW84VnlEU3dIUGhXME42VGQ4c05vTXV0?=
 =?utf-8?B?ZFhrTmhFRlhVK1FmaU5wOThwUDh0VXZKZUxBRHRzTHpoZFlkNDQvNUVvaU9C?=
 =?utf-8?B?TFE3NGo0WFl2cWhJcGo2ZEl3dURUT2FmUHEvVy83MzljRGJOU3BYRU1RQTdt?=
 =?utf-8?B?Y1ora0FpaUVZbXhabmwxTGlrNm44T3RTNWcrVkh2K0N5VTM2djdKWm0reHV4?=
 =?utf-8?B?UUh2K1Z6dThrUFkwMGhoOVV6UnJZcnBJdzlRcTk4QXNSa3BUSE9XeUVxb2tw?=
 =?utf-8?B?OGRqMHZqNEErTS9Sc2JNVE9Tc0xkekFLM3ZEeER3UjdldWgvRkFzWmNaMmZI?=
 =?utf-8?B?d0lOQUtWemQ5OElMQ1JhZVVpUWVNSnBsZEFRMy9QSnBmODN5Zm9yT0s2RGd1?=
 =?utf-8?B?Y3ByZTlkNUYvRFRybmZsbURFNVpnNyt3S3ppL1BLRUxqdVBFbW84ZHQ2RDNT?=
 =?utf-8?B?OEtiS3ljS0N6WUNwVEhWVUtEZU5TaWF3UDB4TlJmakN0RnRFb0ZlcW9VZi9K?=
 =?utf-8?B?bk9remlwYUhWa3VtOENlbUNXdS9nVjVQZ3czQWx5QXlKM240N2xvbXlkampC?=
 =?utf-8?B?c3NMR3JtYmtnd05QWUgvZERTMFVidVM2VW9tRkZudm5DL1N5QkhTN3ZlSTJx?=
 =?utf-8?Q?D1Epj0w+c2FFnGdrZPnwceE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1928F6B2596A874C9FA7DFE2FC678A2C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fdffb9f3-e5df-4296-42bf-08da74728b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 10:34:13.5250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6vXrtrwcYCG9m+t3boLPpC9DxczEghzdNP8FNebJpnTbNEZRtDRPrKG7fUr7ec+Gt33W630rQpIGW0ZxSLa3+8ycmNbbO3GXdvR2jO0Z2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3311
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

DQoNCg0KLS0tLS0tLS0gTWVzc2FnZSB0cmFuc2bDqXLDqSAtLS0tLS0tLQ0KU3VqZXTCoDogW2xp
bnV4LW5leHQ6bWFzdGVyIDI3NjcvMTAzNDddIHBvd2VycGMtbGludXgtbGQ6IHdhcm5pbmc6IG9y
cGhhbiANCnNlY3Rpb24gYC5pbml0LnBsdCcgZnJvbSBgZHJpdmVycy9oaWQvaGlkLXVjbG9naWMt
cmRlc2MubycgYmVpbmcgcGxhY2VkIA0KaW4gc2VjdGlvbiBgLmluaXQucGx0Jw0KRGF0ZcKgOiBU
aHUsIDE0IEp1bCAyMDIyIDAzOjQxOjQ1ICswODAwDQpEZcKgOiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4NClBvdXLCoDogSm9zw6kgRXhww7NzaXRvIDxqb3NlLmV4cG9zaXRvODlA
Z21haWwuY29tPg0KQ29waWUgw6DCoDoga2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcsIExpbnV4IE1l
bW9yeSBNYW5hZ2VtZW50IExpc3QgDQo8bGludXgtbW1Aa3ZhY2sub3JnPiwgSmlyaSBLb3NpbmEg
PGprb3NpbmFAc3VzZS5jej4NCg0KdHJlZTogDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0IG1hc3Rlcg0KaGVhZDogICA0
NjYyYjdhZGVhNTBiYjYyZTk5M2E2N2Y2MTFmM2JlNjI1ZDNkZjBkDQpjb21taXQ6IDJkMTY3YWFi
YTM4NjRjZjhmNDZiODM2NGFhMzNlNzgwZGUxZGE4ZjQgWzI3NjcvMTAzNDddIEhJRDogDQp1Y2xv
Z2ljOiBBZGQgS1VuaXQgdGVzdHMgZm9yIHVjbG9naWNfcmRlc2NfdGVtcGxhdGVfYXBwbHkoKQ0K
Y29uZmlnOiBwb3dlcnBjLXJhbmRjb25maWctcjAxMS0yMDIyMDcxMiANCihodHRwczovL2Rvd25s
b2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyMjA3MTQvMjAyMjA3MTQwMzU1Lmx1RTZVZWtQ
LWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KY29tcGlsZXI6IHBvd2VycGMtbGludXgtZ2NjIChHQ0Mp
IDExLjMuMA0KcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKToNCiAgICAgICAgIHdnZXQg
DQpodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rl
ci9zYmluL21ha2UuY3Jvc3MgDQotTyB+L2Jpbi9tYWtlLmNyb3NzDQogICAgICAgICBjaG1vZCAr
eCB+L2Jpbi9tYWtlLmNyb3NzDQogICAgICAgICAjIA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPTJk
MTY3YWFiYTM4NjRjZjhmNDZiODM2NGFhMzNlNzgwZGUxZGE4ZjQNCiAgICAgICAgIGdpdCByZW1v
dGUgYWRkIGxpbnV4LW5leHQgDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0DQogICAgICAgICBnaXQgZmV0Y2ggLS1uby10
YWdzIGxpbnV4LW5leHQgbWFzdGVyDQogICAgICAgICBnaXQgY2hlY2tvdXQgMmQxNjdhYWJhMzg2
NGNmOGY0NmI4MzY0YWEzM2U3ODBkZTFkYThmNA0KICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcg
ZmlsZQ0KICAgICAgICAgbWtkaXIgYnVpbGRfZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNv
bmZpZw0KICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9
Z2NjLTExLjMuMCBtYWtlLmNyb3NzIA0KVz0xIE89YnVpbGRfZGlyIEFSQ0g9cG93ZXJwYyBTSEVM
TD0vYmluL2Jhc2gNCg0KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZyB3aGVyZSBhcHBsaWNhYmxlDQpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQoNCkFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0K
DQo+PiBwb3dlcnBjLWxpbnV4LWxkOiB3YXJuaW5nOiBvcnBoYW4gc2VjdGlvbiBgLmluaXQucGx0
JyBmcm9tIGBkcml2ZXJzL2hpZC9oaWQtdWNsb2dpYy1yZGVzYy5vJyBiZWluZyBwbGFjZWQgaW4g
c2VjdGlvbiBgLmluaXQucGx0Jw0KPj4gcG93ZXJwYy1saW51eC1sZDogd2FybmluZzogb3JwaGFu
IHNlY3Rpb24gYC5pbml0LnBsdCcgZnJvbSBgZHJpdmVycy9oaWQvaGlkLXVjbG9naWMtcmRlc2Mu
bycgYmVpbmcgcGxhY2VkIGluIHNlY3Rpb24gYC5pbml0LnBsdCcNCj4+IHBvd2VycGMtbGludXgt
bGQ6IHdhcm5pbmc6IG9ycGhhbiBzZWN0aW9uIGAuaW5pdC5wbHQnIGZyb20gYGRyaXZlcnMvaGlk
L2hpZC11Y2xvZ2ljLXJkZXNjLm8nIGJlaW5nIHBsYWNlZCBpbiBzZWN0aW9uIGAuaW5pdC5wbHQn
DQoNCi0tIA0KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KaHR0cHM6Ly8wMS5vcmcvbGtw
DQo=
