Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78FB813AFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:48:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NtC7Uh/s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrjZm3nssz3d9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 06:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NtC7Uh/s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrjYv3N9sz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 06:47:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kcmr+v1SIfg3GfagnjVBlBPUnfZwDF5Bf7/GjkVtuhSbFOtfVKjzoaH6p8x0XR5IGg9/SWrTZSed/FBHwLNqjdU4So3VSCrBHBTZsYDIPyimLCidHi6xt3asgFYzpc8GgiYFSicDssFRBkUZ1DqIJYZ8Ez9imnMayECGCtfAkeszeHHunD04AfL4NgneayYN3d0GNX8Dmnf1mg6+/+mnA2IZ7szCNmPvtLhnodVNiOgoHJfP4fMTYDNdadffKKQGGZU+KyUNbi3YWgL5iNc9K69tsKiTNfKZSf7hRlmdWDNND/n+iOz9/HKPRjA2FQmbNYHLkLqpN4aRajWZpQnNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVePMISWHrSmECZbKR4gs5dxy7mu+Ct6oYrAQTxZBIw=;
 b=ZuFIk+Jrf4K2wghBBCs7PnIKCckyKsk1PbaH+ZSZpslgQbvBRutBbmvf104f54qxnxo8OUuXVVueYY62hqv3ubiSxchwjCmAW3IoyGzAPsDybKKC9Wo22xeWXjqmAF8493fO+urCuo8h9jm3PJb0Ci67wRmKA07i/op7LRve7CQrx62koZ+rZ+XV8Ku4g1cEQ0Eh9z3KBXdPpu9VJpC/LcvVvg0Fh8u2W2Nm1orDRgfCRxAfuk/A5Q94fz+XdanHFpXQgFhtjAIVMVKg0M4BqYBtlkLHRSwz/hRxJlqH/xrONh83Aw20Ss0FOaUp8reOXwcz6xi8rpTC86id1GM95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVePMISWHrSmECZbKR4gs5dxy7mu+Ct6oYrAQTxZBIw=;
 b=NtC7Uh/sRbZc4N9TJw16njqztN6mGvYqu6SRD6KtZ00LfjsC6N7tLVCOQVRTdHYbe/HsItl8U3RYBvNqKk/caLwHNgBaGUlqq13kXdyvmJDWM36sMYT5vLy2tDrl13eH+JVerUqpfDl3niEcR9jYRapTwy8myZycVxLCdQ4vFbRm6zgTx4TWjRrDSRBgv9S1xK1JuBxWYOSWQ66AW4s+u430+rJboqaNtnzTYXwYQh5htOFGddqfIpcH5CfG8fY+9Mi7R9CdevEcvsDejmT3RzrOit9MEijq8WQRqQYNpe5Tblx8SejCsaI80d5qP8vnfQBtFdHzgMeKOyhK262xdQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1653.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Thu, 14 Dec
 2023 19:47:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 19:47:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Subject: Re: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Topic: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Index: AQHaLrQSLTXRy4mOS0OgHh/wjtvn+LCpL0oA
Date: Thu, 14 Dec 2023 19:47:20 +0000
Message-ID: <27479d7f-fe9a-4ae7-8490-2f070fa7a16d@csgroup.eu>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-3-gnstark@salutedevices.com>
In-Reply-To: <20231214173614.2820929-3-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1653:EE_
x-ms-office365-filtering-correlation-id: 919cf54a-3dfb-4893-a8fb-08dbfcdd7c64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kky/DI2wFnNOyJACCix7zMg7XJsBR38anoY4BMHpLhqM7StHfPhiQOHI7O9QbewQVO6+JBsGvL8uEhzfk2xAtC0rSDV3y4GokVvAjW3BWp502Nwo+CZCNqnOGzpxTIxMnpu5PEs2czJK64Ob3dMJBrOCmlKX0EibM8ng6XHt+wpEDp5U40HQtsTYoMAK/9oDXi93yDtMLzJM3vlDypHRFKEQG6vVNKqNRPj5ZlMugoLSa1jG/tz9mpEzeIYz+f2sS9HV5khuPtaqQKdgmf4z06ZU+hgCHHb4TpGsXw9E95YRSm/rdiyzpzkVKQsilP9ZSdf36mnh/07xEVhXxZczMruh85xSA2jZhmK6T7Q4p6bzcGKb+jFOVTykSCJto4CQ8aZzgteXVmXvZb1jcfkkLS6DgPhgUnhuy6dNjZ3gn6oUkm0veoIcJMHG/6/hL27Jl5D1hzyB6Kmwf1HES00qreMa+vIDsfeAhJEfc61MSC4f1HcGVzwe9TM+Jp0rMjfiBo5no3wkY7EY1JI/O22AlHdQOrYoD7rNMOxV7zthk1gSnlLd+XM2R2WMmgfFiHrgwFa0saFOxrAWO+/dP9lA80GT4l5ScvGCfITowsD9Cr6OA4tYGniPrWKjpv1oIS3Mo907lyW9bbuCEZD3KSOoaVdt9h7se51mhikaBVw+OuyAc0nuSZZ2bZpnLlMVpJ5Whro+CVp8rlhxuxRqyvMUhQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8936002)(44832011)(8676002)(2906002)(7416002)(5660300002)(478600001)(6506007)(6512007)(91956017)(110136005)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(966005)(6486002)(41300700001)(38100700002)(122000001)(31686004)(31696002)(86362001)(36756003)(921008)(38070700009)(71200400001)(66574015)(2616005)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eTZVYWFXK1pEZzl3VWZqRmpFZkRaS2t0ak8xdytVdklRQWw1TXZIREtTc1Rj?=
 =?utf-8?B?SmR0MENldUZ0Vmd1SEd5TWVyTzZwdmVBaFJHZ1J6d0YyNk1Oa3BYOWxvRlZu?=
 =?utf-8?B?dktPd0NPVEJsTDBKQUR4Tmk2QmpqME5hN0JwR3dtS016SU01NVo2UU5udU1o?=
 =?utf-8?B?TnVWU2IyME1neXhValdWSllDeVFtTTN6V0VDNWErVXZJZnp5TnptcmNyVDNa?=
 =?utf-8?B?MkJtc3FCbkUwWXZaeENtellycWs0bzU4Mko3MWlHcVROSGFmZXFITFA2dHFM?=
 =?utf-8?B?WHVFMm9XUXhNbnRUT3F6WlovcmFWWWxvUjhZaDU3dnIwdHZiblVNaG1iUzNr?=
 =?utf-8?B?U1lZeWpoR0FZQ3I5SDZEeXFsU0dYcjlaM1pNaTlMTldrLzJzMENyQmZwUGRJ?=
 =?utf-8?B?ZzNCMEVaZndsK0FQdWFkMjFuNmNyVTRJNHdvekNKL3VoY2h2Y3JrbXhQejB4?=
 =?utf-8?B?bjhmZFIrd1pKSVhUajhVNHZsR01meEJzNGsxdUlmT2c4bzdEekk0V0xzNzlE?=
 =?utf-8?B?ZWhaanJuTXZCd2NJTU5EVzA4amZFSERkY05LMUpSTkRvM1d0WVMrc045UmZT?=
 =?utf-8?B?TjB2RlJnMmpVZ1RQczZpL0FGV2VkcmMwdkdDeWZzV3lKOUJOUGlWUWM5U2Rw?=
 =?utf-8?B?cUYzL3ZudGZtdnl3T1laZ1hWdFF4ckxXbDg3eEcxTlA4VE9Ba0ExK2NiUUo2?=
 =?utf-8?B?R0FTM1JNdmZPSkdtZVF6Zjd1ZGFpdDhUZkVYRndwSDVIZWhvY3lEYSs1RlNi?=
 =?utf-8?B?T0NCZFF3MnZFa2NhRTF2dlhYWHBjNmpHMGNNT21KUnVtdHJENDhYZ1ZnVVRM?=
 =?utf-8?B?blV3YWVYVGV5VjVHZ3ZGUzFra2F4M1UxMU44TE9EV0h1RnUxS1NlUTVabER2?=
 =?utf-8?B?emlHQmpOVjBybXd4b3BGUGwzeUZaLzlCdUVJNGZYeEJXUy8xYms4Zkp4bEha?=
 =?utf-8?B?bVVQQmU4R0xpYjB6cVBPL1J1eE1SclpoWm1qTmNQQ2FZMklYY1lBRnRHVkdo?=
 =?utf-8?B?Q0dKTmh5U0h1emVtN2owVWMvYjlBUlJOUTJCU1dNZS9hTXlUOFNNSThaQ0x4?=
 =?utf-8?B?aDRQRWFyTDhONFFjSXRsMlUxUEVJODFBemhsVWxNdEs1d3NIa3ZTQ2RadmVN?=
 =?utf-8?B?RllaajZ6N0VnNy9rcHBSSDFHcVd4WHJCUlNOd0dRK3laVDlqM0NSUUVMNFU5?=
 =?utf-8?B?cHlBRlArQ0x5bHAzUXpjUUFudlJOSG03c1pRSm9zZlBnc2RlVC9PUW5hK2lZ?=
 =?utf-8?B?YXB3ZkxHRkpFTUFwTjVHSm1zbnZYWXNWZWlpODVuRlRBa3JhYTV1MmRoRWN0?=
 =?utf-8?B?ZnZLK2t1L0ViRERKV0RIV3F4MXQ0ZUlOeXJnckFKYjduTGE5ZkxEbmY0QTgv?=
 =?utf-8?B?NWxORVBzRDhOSHRQVVBzSllRWG92Q1FJclJVb1dLR3U3R2JLVjI5bW5mUXFI?=
 =?utf-8?B?YWQ4NjBPaEJ2a2hRaitrQ2crWHRJQ2NMeDY5VWdoY01NbEJsajh1VGZjRmhV?=
 =?utf-8?B?aS9ZN09uUFZHamdDN1lSeUYrWlQxN2F5ak4xNnpOeXNZcE5qR3RERTdSOGs0?=
 =?utf-8?B?RGRsYzRUY2JvZlFOaG9TSktzaCtoK0RpOHVndmRzYWVQRjRJdE9LOUZ6ODdS?=
 =?utf-8?B?NTJ0cnVHMTY0SUFRd3h2alBIQkdwa1pibm0wdkZMekVWRnp6b0U5cEhpS21p?=
 =?utf-8?B?NzBrbkkwWHVTcWd0cUlJVVRGK3NRRmxJNlZmc2E3M2JXRTNkUUhrNEwyZWFz?=
 =?utf-8?B?K2lLRVlaSlYyaHkyaTBIRDlNTE9DdVY4V3YzWXhHTlc2dTFqVFpjeHRIUnhk?=
 =?utf-8?B?ZzhvL3B1eFBSMlE1aDR6VmRNZEtVbWxFbEdydTNVQ1BkVDRSN3l1RThobjNP?=
 =?utf-8?B?VS8yTy9HZ1haMm5UNVUrZ0tEclJYaWROeWRPd0N6MjIrcnhlL0txMlNGUzV5?=
 =?utf-8?B?akc5RHNJdGNtUnAxcS9jM1J3MjB4OW12UWNiY25tWmdub1VocHVrcTg3UU1B?=
 =?utf-8?B?RWxRSWlZbkNpc1RDWHljK1dPK2w4OUdLNlhNbzR3dDhvanJERHJ0M3Y5eUkx?=
 =?utf-8?B?Slo1VFBYdncza1JncGd1TnVsVUNCK1QyVGFjdW5kY2FHT3ovc3VsRXhWUEhI?=
 =?utf-8?Q?24WJd/ScL1ZXItGUDz/7xFfsG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69D0981A60BF5E48BEBF700D31FDEB56@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 919cf54a-3dfb-4893-a8fb-08dbfcdd7c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 19:47:20.7853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+W2t2FRm3lmPj0rBdgAYhBxLRlaBGhth9dN4Uy2p42yE3+e5zOmI2OhGO6hsVnA1AwoLbrMJbCSug4sf9T1VTRX3pYd4oI+lMOeZpgg5O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1653
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMTg6MzYsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVXNp
bmcgb2YgZGV2bSBBUEkgbGVhZHMgdG8gYSBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNv
dXJjZXMuDQo+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13
cmFwcGVkIHNob3VsZCBiZSBkZWxldGVkDQo+IHdpdGggcmVzcGVjdCB0byBkZXZtLXJlbGVhc2Ug
b3JkZXIuIE11dGV4IGlzIG9uZSBvZiBzdWNoIG9iamVjdHMgdGhhdA0KPiBvZnRlbiBpcyBib3Vu
ZCB0byBvdGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4gU2lu
Y2UgbXV0ZXhfZGVzdHJveSgpIGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcgYnVp
bGRzDQo+IGZyZXF1ZW50bHkgY2FsbGluZyBtdXRleF9kZXN0cm95KCkgaXMganVzdCBpZ25vcmVk
IHdoaWNoIGlzIHNhZmUgZm9yIG5vdw0KPiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFk
IHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgd2lsbCBiZQ0KPiBleHRlbmRlZCBzbyBp
bnRyb2R1Y2UgZGV2bV9tdXRleF9pbml0KCkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBT
dGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4NCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51
eC9tdXRleC5oICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+ICAga2VybmVs
L2xvY2tpbmcvbXV0ZXgtZGVidWcuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L211dGV4LmggYi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4gaW5kZXggYTMzYWE5
ZWI5ZmMzLi5lYmQwM2ZmMWVmNjYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXV0ZXgu
aA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4gQEAgLTIxLDYgKzIxLDggQEANCj4g
ICAjaW5jbHVkZSA8bGludXgvZGVidWdfbG9ja3MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvY2xl
YW51cC5oPg0KPiANCj4gK3N0cnVjdCBkZXZpY2U7DQo+ICsNCj4gICAjaWZkZWYgQ09ORklHX0RF
QlVHX0xPQ0tfQUxMT0MNCj4gICAjIGRlZmluZSBfX0RFUF9NQVBfTVVURVhfSU5JVElBTElaRVIo
bG9ja25hbWUpICAgICAgICAgICAgICAgICBcDQo+ICAgICAgICAgICAgICAgICAgLCAuZGVwX21h
cCA9IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiBAQCAtMTI3LDYgKzEy
OSwyMCBAQCBleHRlcm4gdm9pZCBfX211dGV4X2luaXQoc3RydWN0IG11dGV4ICpsb2NrLCBjb25z
dCBjaGFyICpuYW1lLA0KPiAgICAqLw0KPiAgIGV4dGVybiBib29sIG11dGV4X2lzX2xvY2tlZChz
dHJ1Y3QgbXV0ZXggKmxvY2spOw0KPiANCj4gKyNpZmRlZiBDT05GSUdfREVCVUdfTVVURVhFUw0K
PiArDQo+ICtpbnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11
dGV4ICpsb2NrKTsNCj4gKw0KPiArI2Vsc2UNCj4gKw0KPiArc3RhdGljIGlubGluZSBpbnQgZGV2
bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPiAr
ew0KPiArICAgICAgIG11dGV4X2luaXQobG9jayk7DQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICt9
DQo+ICsNCj4gKyNlbmRpZg0KPiArDQo+ICAgI2Vsc2UgLyogIUNPTkZJR19QUkVFTVBUX1JUICov
DQo+ICAgLyoNCj4gICAgKiBQcmVlbXB0LVJUIHZhcmlhbnQgYmFzZWQgb24gcnRtdXRleGVzLg0K
PiBAQCAtMTY5LDYgKzE4NSwxMyBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICBfX211dGV4X2luaXQo
KG11dGV4KSwgI211dGV4LCAmX19rZXkpOyAgICAgICAgICBcDQo+ICAgfSB3aGlsZSAoMCkNCj4g
Kw0KPiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPiArew0KPiArICAgICAgIG11dGV4X2luaXQobG9jayk7
DQo+ICsgICAgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gICAjZW5kaWYgLyogQ09ORklHX1BS
RUVNUFRfUlQgKi8NCj4gDQo+ICAgLyoNCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL211
dGV4LWRlYnVnLmMgYi9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+IGluZGV4IGJjOGFi
Yjg1NDlkMi4uYzllZmFiMWE4MDI2IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvbG9ja2luZy9tdXRl
eC1kZWJ1Zy5jDQo+ICsrKyBiL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4gQEAgLTE5
LDYgKzE5LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnX2xvY2tzLmg+
DQo+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+IA0KPiAgICNpbmNsdWRlICJtdXRleC5o
Ig0KPiANCj4gQEAgLTEwNCwzICsxMDUsMjQgQEAgdm9pZCBtdXRleF9kZXN0cm95KHN0cnVjdCBt
dXRleCAqbG9jaykNCj4gICB9DQo+IA0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG11dGV4X2Rlc3Ry
b3kpOw0KPiArDQo+ICtzdGF0aWMgdm9pZCBkZXZtX211dGV4X3JlbGVhc2Uodm9pZCAqcmVzKQ0K
PiArew0KPiArICAgICAgIG11dGV4X2Rlc3Ryb3kocmVzKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+
ICsgKiBkZXZtX211dGV4X2luaXQgLSBSZXNvdXJjZS1tYW5hZ2VkIG11dGV4IGluaXRpYWxpemF0
aW9uDQo+ICsgKiBAZGV2OiAgICAgICBEZXZpY2Ugd2hpY2ggbGlmZXRpbWUgbXV0ZXggaXMgYm91
bmQgdG8NCj4gKyAqIEBsb2NrOiAgICAgIFBvaW50ZXIgdG8gYSBtdXRleA0KPiArICoNCj4gKyAq
IEluaXRpYWxpemUgbXV0ZXggd2hpY2ggaXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgd2hlbiB0
aGUgZHJpdmVyIGlzIGRldGFjaGVkLg0KPiArICoNCj4gKyAqIFJldHVybnM6IDAgb24gc3VjY2Vz
cyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4NCj4gKyAqLw0KPiAraW50IGRl
dm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4g
K3sNCj4gKyAgICAgICBtdXRleF9pbml0KGxvY2spOw0KPiArICAgICAgIHJldHVybiBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkZXZtX211dGV4X3JlbGVhc2UsIGxvY2spOw0KPiArfQ0K
PiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9tdXRleF9pbml0KTsNCj4gLS0NCj4gMi4yNS4xDQo+
IA0KDQpJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8ga2VlcCBtdXRleF9kZXN0cm95KCkg
YW5kIA0KZGV2bV9tdXRleF9pbml0KCkgdG9nZXRoZXIsIHNlZSBleGVtcGxlIGJlbG93Og0KDQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdXRleC5oIGIvaW5jbHVkZS9saW51eC9tdXRleC5o
DQppbmRleCBlYmQwM2ZmMWVmNjYuLmM2MjA3NTlmZjg1YiAxMDA2NDQNCi0tLSBhL2luY2x1ZGUv
bGludXgvbXV0ZXguaA0KKysrIGIvaW5jbHVkZS9saW51eC9tdXRleC5oDQpAQCAtODMsMTQgKzgz
LDEwIEBAIHN0cnVjdCBtdXRleCB7DQogICNkZWZpbmUgX19ERUJVR19NVVRFWF9JTklUSUFMSVpF
Uihsb2NrbmFtZSkJCQkJXA0KICAJLCAubWFnaWMgPSAmbG9ja25hbWUNCg0KLWV4dGVybiB2b2lk
IG11dGV4X2Rlc3Ryb3koc3RydWN0IG11dGV4ICpsb2NrKTsNCi0NCiAgI2Vsc2UNCg0KICAjIGRl
ZmluZSBfX0RFQlVHX01VVEVYX0lOSVRJQUxJWkVSKGxvY2tuYW1lKQ0KDQotc3RhdGljIGlubGlu
ZSB2b2lkIG11dGV4X2Rlc3Ryb3koc3RydWN0IG11dGV4ICpsb2NrKSB7fQ0KLQ0KICAjZW5kaWYN
Cg0KICAvKioNCkBAIC0xMzEsMTAgKzEyNywxMyBAQCBleHRlcm4gYm9vbCBtdXRleF9pc19sb2Nr
ZWQoc3RydWN0IG11dGV4ICpsb2NrKTsNCg0KICAjaWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMN
Cg0KK3ZvaWQgbXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KICBpbnQgZGV2bV9t
dXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKTsNCg0KICAj
ZWxzZQ0KDQorc3RhdGljIGlubGluZSB2b2lkIG11dGV4X2Rlc3Ryb3koc3RydWN0IG11dGV4ICps
b2NrKSB7fQ0KKw0KICBzdGF0aWMgaW5saW5lIGludCBkZXZtX211dGV4X2luaXQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQogIHsNCiAgCW11dGV4X2luaXQobG9jayk7
DQpAQCAtMTY5LDggKzE2OCw2IEBAIGV4dGVybiB2b2lkIF9fbXV0ZXhfcnRfaW5pdChzdHJ1Y3Qg
bXV0ZXggKmxvY2ssIA0KY29uc3QgY2hhciAqbmFtZSwNCiAgCQkJICAgIHN0cnVjdCBsb2NrX2Ns
YXNzX2tleSAqa2V5KTsNCiAgZXh0ZXJuIGludCBtdXRleF90cnlsb2NrKHN0cnVjdCBtdXRleCAq
bG9jayk7DQoNCi1zdGF0aWMgaW5saW5lIHZvaWQgbXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXgg
KmxvY2spIHsgfQ0KLQ0KICAjZGVmaW5lIG11dGV4X2lzX2xvY2tlZChsKQlydF9tdXRleF9iYXNl
X2lzX2xvY2tlZCgmKGwpLT5ydG11dGV4KQ0KDQogICNkZWZpbmUgX19tdXRleF9pbml0KG11dGV4
LCBuYW1lLCBrZXkpCQkJXA0KQEAgLTE4Niw2ICsxODMsOCBAQCBkbyB7CQkJCQkJCVwNCiAgCV9f
bXV0ZXhfaW5pdCgobXV0ZXgpLCAjbXV0ZXgsICZfX2tleSk7CQlcDQogIH0gd2hpbGUgKDApDQoN
CitzdGF0aWMgaW5saW5lIHZvaWQgbXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXggKmxvY2spIHsg
fQ0KKw0KICBzdGF0aWMgaW5saW5lIGludCBkZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQogIHsNCiAgCW11dGV4X2luaXQobG9jayk7DQotLS0N
Cg0KV291bGQgYWxzbyBiZSBuaWNlIHRvIGhhdmUgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB3
aGVuIA0KbXV0ZXhfZGVzdHJveSgpIGlzIGEgbm9wLCBkZXZtX211dGV4dF9pbml0KCkgZG9lc24n
dCBuZWVkIHRvIHJlZ2lzdGVyIGEgDQpyZWxlYXNlIGZ1bmN0aW9uLg0KDQpFaXRoZXIgd2F5LA0K
DQpSZXZpZXdlZC1ieTogY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1DQo=
