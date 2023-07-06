Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E077C7494BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 06:38:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DcGfLsdR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxP1J5tmLz3bkn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 14:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DcGfLsdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::621; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxP0M1Y5Kz30f7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 14:37:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr8u+UHGoMkWdwT5M3TX+BJRAmGhPEY7kMEcJfIGo3A0ZpDCim1jrWIK1x1yrv8XWKyVbwBMn4tcbuG9fQV/Xap4+BwJtzJwctgp27BXOF6+rBEmToAfpu81Et6VsGjgw/w/+KypJsSFkUh/Z+vss/fHeMlaCvw9E+CmhtQ2rEMTb8wOAHDjiel9DnHFKg0d0TGp2gK/3Vt/MGGI4sFELc7NSZuQgGc+a5dnuqYH2B6SjOTeHGe/uzL5LryMFbCEEovYzx/NAyye3eM9VjmiFW/+EzhoVIpFbydLsYEjN8oGL9sFCOdlCh1mnjsHPPW1S7LXYspjnJeV7osL1ImXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j3QZhni5ljeXq85YMoWF+mXmBDUHuwaba9qrzjn37c=;
 b=AnnPG7ky74Y3rBryyMQ0/o9R6quAevenh3ck8kwpBVBeUioXTHQ0EkeHuQObESDjPSikQ7baw8EgOheeHGRUau0uX7MXjN6p0/OB/hz0HOZvmNT8RzPw1vIv6PuxJU4BKknMSL/M1pcGB9BAr/WPTvCUF3vxc0qMLrCWzVUtmLdQybdJz9kfwVPuOigjhjOTGvPQ/wWL3CaTFm3UZa8MP7VilVfO5/IiwfqkyC3+oWNno+4WU+x4jcJrGUFhklbcrfGDr+Ou+fEjKUUlgYBXJu4PkG++9RhxPcRTAkN2d9IEKocxxOje56779qq1boUnKi4wXTkjubFx874HUuUF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j3QZhni5ljeXq85YMoWF+mXmBDUHuwaba9qrzjn37c=;
 b=DcGfLsdR+CZcMrIpSfbhON6l74SyWQnWnXUNXji18xa3MYzP0ZkQHfs5w8t77Eg4zLXfEprV7k3yhfV/1Xi8RMPCoJvoBO1AVhOnzzGUjgL3WTv413V3JWMbTGz5bb0d0V/s6AcuzDFBqW4iStWnB+0kRCRlWLq7N/yhWHgGPxHSc1uzqOxKjbzXhAseF5Sx5Z7PcukDp3WjSzJbviNsZC/FrK+gk7hv3+hY6v1Ls/a4vcJYse1KktgWMYwQlNxFuWAzBsQ9Ir6xi+5hcEYjLN/IyGWQQ7BZOAa9vIhsVMDebS8graO2uc1gDiwyb76Ca4/0rLqlS6zj7MR14FpwVQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:37:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 04:37:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/powermac: Use early_* IO variants in
 via_calibrate_decr
Thread-Topic: [PATCH] powerpc/powermac: Use early_* IO variants in
 via_calibrate_decr
Thread-Index: AQHZr6ZqPlrDUMFKqUivco/JNwVcma+sJ9eA
Date: Thu, 6 Jul 2023 04:37:31 +0000
Message-ID: <8bd31a9d-927e-819f-3f3c-4e586aa8608d@csgroup.eu>
References: <20230706010816.72682-1-bgray@linux.ibm.com>
In-Reply-To: <20230706010816.72682-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2178:EE_
x-ms-office365-filtering-correlation-id: 75435ad3-2f5a-44a1-c872-08db7ddab606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /5zK/amnUt1FKe7T6b14BaWrBQ/zUZn4Ah72Noh6aH+cFiGCcocfYKU3Ni5IkZB4FO3aSAHl5zJ9OMsVyJjcujlGGDoEzQRWuHBAD8ahUi5DIhUB+87mrlurtwC5Bd6SNy7jMxgtLJf+KJoPC2TwZrvruQViH5UB5LJAj6gn2gt453cLBotbysSoqpAFCyPdaDDHdCQrIRFaAWP2sHeiImsTDSomB26x99qw1Wfpu3jvhU2bCjp0S4AZo+iVcKIPFC9Yj9qzKsxpuPrm6LSkAYON0tESQGNn7dTAErvCp0nUUNO0LpdTw+oZZH2U+ylpldRzddDHwJlMDv4PzqT1X6+4LvCPZH7WMuXhfs9BkaqknRG3c9lFK1/anZG+fp/nbsvLJxPKoZ1obRQSAKDHMPB3sOT0R7ijp0n2fQrq3zL5v2XyRfg6yULJusz8YIX6Drfp77qssMZU2Umzcqg9606bap714X08mxYD0zJihk2KV/ZDERZ2X79oUSkEdQseY4RYgjwEJ2e6aQ0MNFPsTM5douhtT8H2wr7Ic/Y0JGZ7tMz1faTit5rj8HsrE1g2U9sl0XGOfN1F6Os5AuLxPTfNGTR68W8wkdzOaJj5scz9Cctox+6RDdZmCxpvURpT0bRtk+3Io/ojKc1YxsXiUOSGIs06fVP1EMi+Mbc6A4ZC6nLB1BWxnas9JwmwH4Vc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(451199021)(44832011)(5660300002)(8676002)(8936002)(41300700001)(316002)(2906002)(83380400001)(31686004)(122000001)(76116006)(6506007)(2616005)(91956017)(66476007)(64756008)(66946007)(66446008)(66556008)(38100700002)(86362001)(186003)(6512007)(26005)(110136005)(478600001)(6486002)(31696002)(38070700005)(36756003)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MkxmQW83VERPc212SGRKaWVTUnFCZC9saHNaYVoxWmxaZlZFR21yY0p5YkRv?=
 =?utf-8?B?YVMwelZIcGh2bEI2UGpUVFgzclFZanhyTFQvSURzK0Nsc3NFZUZxODd4aDh4?=
 =?utf-8?B?SjltTW9HRkUwZU04OW0wOUk4MjNRc2RRREJSMVRyRHZwS0s3bGNNaVdHaXdJ?=
 =?utf-8?B?OUpjWHlJYXBWU2pPTzJKbndOa0pzWjNQS1F6OGdvTElUc1I3dGdwV0g1N01T?=
 =?utf-8?B?R0I5VERxY3FaM1plbnQydkZQTEpYcnVGNXRRcVFNK2l2eWFBcGpDOGQwL3pt?=
 =?utf-8?B?VU9CaWFtZG9PRDA2d1VJVWRPVmE3OEFnRjU3amwwZHBmRHhrV0RNemlYSk8w?=
 =?utf-8?B?ZHBvZ1lnOUUxdnJzSlVIT01UWmhWa0lqcWR1djdSY3QwbVJMc0Z5ZW5kVlFB?=
 =?utf-8?B?ZzFnM1RhYmtVc1ZvR1dXSWRsdGpCTTkwcDhoK1hoSGRJblg1aWdyaUwzOW52?=
 =?utf-8?B?NmxzVlFaZG9Ed2F4aGFLZXhHbkQwLytwS1FlTmpSTFVoUHN3WXVaMUVycTVY?=
 =?utf-8?B?YzhUeWNnZDZUVFlpWUhrc0d4MkpkRXhLY2FQeUdBK0hyWlJPR1dBeXRYamZG?=
 =?utf-8?B?REVmSGR5NTN5a1lXN1FVY04wQTM2bm4zM0U1OHB5QlNKbVJxNWk0L296cDNW?=
 =?utf-8?B?UTYrVUdWYVowS1QvK04zUU9tMlo0VC96K0tkMXZrYWtpU0dxZjhDTnpwZEp3?=
 =?utf-8?B?RllKSnkyWHFIcjVzUzdEVVR0TFUzTjhUaGRjaTBZazUzb3hBVnBGTGlDeG9r?=
 =?utf-8?B?bjZ3YUFML1BTVHZHakxFaHRPKy9CY0orWEhlWlRSSUFVeXlWaW1OWndxQ3VY?=
 =?utf-8?B?R28xL2hVdk9EZFhYU3Uyd2VsNmhZR3l5Z1VDcUdhZkJCUDJhbGZUMUkrT1Uv?=
 =?utf-8?B?TjVVVDJWS2Erd25lMlNEQlBoZUlPV0gyVjJ6YXRoWUdiWFQzL3dkWkRiWEFE?=
 =?utf-8?B?SWRCaXprM0t0UFVnQzE3bWZmQnk4YVRsNkJIV1VuUXhvNE5haVhPTUMvUnhn?=
 =?utf-8?B?MU9raWE0L1ZiNDZYeDBEK0crM04xQWpiT1orejJ6MkVqMWFmT0pORmVlSzNM?=
 =?utf-8?B?VUpGeXF0MFV4NWUzUE1PWnE2dGR1eER4bzBZUUZySmJNNFRkUXJ4R1R0ZjRp?=
 =?utf-8?B?a0h1MWdmdSs5SmFBeFM1UTFJVlFKODhFN1BSRUpNNDI1Y0ZMajNjNkFyRWpn?=
 =?utf-8?B?TzBXalByUXVNdjlwWWovTXBsWktMSWxoMkxXbWVwb0xnOTNid1YwSW1hQzJP?=
 =?utf-8?B?YnYyYjZXd05FUWE4VTgzZnNsbk9VKzVwUi9BK3JZT0VzZUFwclhCdk0yK3dT?=
 =?utf-8?B?WXFJcVNveVFTY2hxQzFrdzBNTWJlT1ZjRHlGWHhhWGsvWkZLOXdyYStXVHZK?=
 =?utf-8?B?Y25may9iMWMxSDQ0RmxLdklFK01mTllRaEZRVzRNZTU2K2dTR0padm1qUWVY?=
 =?utf-8?B?MU9adnFERmdmWTFBUHFkUjl1MzR5a1d5MTFNenBzTUxkNnFqbzdFaUlESVNh?=
 =?utf-8?B?OHFnVEtDbVJrYkI2SGg3ZGptY2Y5bEFkOFExSVFaeUlLY3VMZVo0aWxKcy9X?=
 =?utf-8?B?MW5CNWFueVora0N2cmd6STBYRlErU0dGQjNsTnozb0s5akRoU3V6alF2QnRJ?=
 =?utf-8?B?ZTdBc3ovTkxLT0JDWUxFeVlpd3NWd2pjeUpwcG11RHNkUHRDYTAzRUwxRWQr?=
 =?utf-8?B?emRGUjhNVUMzZE8yOE1QYjc5bUhBT2xpY2V1ZUpBTU4xNTFnNHg4NUNscDlt?=
 =?utf-8?B?MGJPVjJHanlxbFJjMnprZG1VVWE5WDVXR28zRkZwNVVVWFNJdTI1bFh5RHlx?=
 =?utf-8?B?RUxKS3FXVWtmNHJ4K1lOSXp4VDBESzBTZmNsTVJhQ1pHTXJ0ZjRIZUJBZW04?=
 =?utf-8?B?cUx6UW9zNGRLQUJKdlNYMVhXTXpqUm81ZCtpVWlQRm8wMTZLM1hVVG9iYnow?=
 =?utf-8?B?MlYrNnRQUnRmN1VBbHRaVHJISks2ZDAzT3ExbzlDenl6c0RveFVnVUNLL1ZO?=
 =?utf-8?B?S0trZ3I3RXJLV2pDWmdObUJTclNCckdUK3JUQUxyalRVYkk5UEhtME1VSW1q?=
 =?utf-8?B?RWtCRmorMmpyVU50MU81QzFFbVRMR3ovdTJsNElpak5BYThoZ1VpbldMbStl?=
 =?utf-8?Q?H1mEqU8go5k+GaUv0ZVSRLolX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <488FCD958EA65542BA0FB36B1AFA31B0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75435ad3-2f5a-44a1-c872-08db7ddab606
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 04:37:31.2711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKBdCfAXIbft3uUK6/+KfutoZlXlJXySGW8AaQtBbfAl7m863YZnwaVJ+K/Z0j87vBa0u/Yll76oD13PSxE2fI6zi0k9vqjkakT8uaExhEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2178
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

DQoNCkxlIDA2LzA3LzIwMjMgw6AgMDM6MDgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gYSBwb3dlcm1hYyBwbGF0Zm9ybSwgdW5kZXIgdGhlIGNhbGwgcGF0aA0KPiANCj4gICAgc3Rh
cnRfa2VybmVsDQo+ICAgICB0aW1lX2luaXQNCj4gICAgICBwcGNfbWQuY2FsaWJyYXRlX2RlY3Ig
KHBtYWNfY2FsaWJyYXRlX2RlY3IpDQo+ICAgICAgIHZpYV9jYWxpYnJhdGVfZGVjcg0KPiANCj4g
d2UgcnVuIGlvcmVtYXAgYW5kIGlvdW5tYXAuIFRoZSB1bm1hcCBjYW4gZW5hYmxlIGludGVycnVw
dHMNCj4gdW5leHBlY3RlZGx5IChjb25kX3Jlc2NoZWQgaW4gdnVubWFwX3BtZF9yYW5nZSksIHdo
aWNoIGlzIHdhcm5lZCBhYm91dA0KPiBsYXRlciBpbiB0aGUgYm9vdCBzZXF1ZW5jZSBpbiBzdGFy
dF9rZXJuZWwuDQo+IA0KPiBVc2UgdGhlIGVhcmx5XyogdmFyaWFudHMgb2YgdGhlc2UgSU8gZnVu
Y3Rpb25zIHRvIHByZXZlbnQgdGhpcy4NCj4gDQo+IFRoZSBpc3N1ZSBpcyBwcmUtZXhpc3Rpbmcs
IGJ1dCBpcyBzdXJmYWNlZCBieSBjb21taXQgNzIxMjU1Yjk4MjZiDQo+ICgiZ2VuaXJxOiBVc2Ug
YSBtYXBsZSB0cmVlIGZvciBpbnRlcnJ1cHQgZGVzY3JpcHRvciBtYW5hZ2VtZW50IikuDQo+IEl0
J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGlzIGNhdXNlcyBpdCB0byBzdXJmYWNlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4N
Cg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3RpbWUuYyB8IDYg
KysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3Rp
bWUuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvdGltZS5jDQo+IGluZGV4IDRj
NTc5MGFmZjFiNS4uODYzMzg5MWI3YWE1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3Bvd2VybWFjL3RpbWUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bv
d2VybWFjL3RpbWUuYw0KPiBAQCAtMjYsOCArMjYsOCBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9y
dGMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiAgIA0KPiArI2luY2x1
ZGUgPGFzbS9lYXJseV9pb3JlbWFwLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5oPg0K
PiAtI2luY2x1ZGUgPGFzbS9pby5oPg0KPiAgICNpbmNsdWRlIDxhc20vbWFjaGRlcC5oPg0KPiAg
ICNpbmNsdWRlIDxhc20vdGltZS5oPg0KPiAgICNpbmNsdWRlIDxhc20vbnZyYW0uaD4NCj4gQEAg
LTE4Miw3ICsxODIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB2aWFfY2FsaWJyYXRlX2RlY3Iodm9p
ZCkNCj4gICAJCXJldHVybiAwOw0KPiAgIAl9DQo+ICAgCW9mX25vZGVfcHV0KHZpYXMpOw0KPiAt
CXZpYSA9IGlvcmVtYXAocnNyYy5zdGFydCwgcmVzb3VyY2Vfc2l6ZSgmcnNyYykpOw0KPiArCXZp
YSA9IGVhcmx5X2lvcmVtYXAocnNyYy5zdGFydCwgcmVzb3VyY2Vfc2l6ZSgmcnNyYykpOw0KPiAg
IAlpZiAodmlhID09IE5VTEwpIHsNCj4gICAJCXByaW50ayhLRVJOX0VSUiAiRmFpbGVkIHRvIG1h
cCBWSUEgZm9yIHRpbWVyIGNhbGlicmF0aW9uICFcbiIpOw0KPiAgIAkJcmV0dXJuIDA7DQo+IEBA
IC0yMDcsNyArMjA3LDcgQEAgc3RhdGljIGludCBfX2luaXQgdmlhX2NhbGlicmF0ZV9kZWNyKHZv
aWQpDQo+ICAgDQo+ICAgCXBwY190Yl9mcmVxID0gKGRzdGFydCAtIGRlbmQpICogMTAwIC8gNjsN
Cj4gICANCj4gLQlpb3VubWFwKHZpYSk7DQo+ICsJZWFybHlfaW91bm1hcCgodm9pZCAqKXZpYSwg
cmVzb3VyY2Vfc2l6ZSgmcnNyYykpOw0KPiAgIA0KPiAgIAlyZXR1cm4gMTsNCj4gICB9DQo=
