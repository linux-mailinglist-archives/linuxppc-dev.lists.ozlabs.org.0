Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7C77E5B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 17:57:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aYHwVC3n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQt7c4f00z3cN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aYHwVC3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQt6k2Dqqz302F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 01:56:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLTmdLhrLq35VCte5YqwmXg/SUvGaOPrCgF8AAuToHfTwhiKgPz9p4tX/0AFTiOaV8w3kxSi2KBtETQvfIwkpFByxVK6ZGauDP4UM7mSIXgFp9NMlUHNpZButinbBXFLVa14IgYlibf9W0Iu9gJovITxo8FqkHiYFAT/J3xVb8rptKCcXEdAicBSRbx59Rhqle78UdBI2qpCvt0f5un8Rroa1GU6zmmUh9fFJFhMvAd7xGkQ1I++S2JQLIJ2OgMAMhRCLpQGbsOm6vPT/ND/qzqvrxkuS0/SthxXg+kMcsVtiQMzHWLHChjsplLYclnCX9RXZtqs0RDeuOOIeuaMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/SlyrzwcYr5zCCpA46XOYA9/fYs0Pdj6PU8mnUe/ZE=;
 b=XsglWgDjEWV9VmqEHCkRqnUY6J74Mt5JR4zxkF+Zov+TSw8DcaeECbbSdbko/pUZpz0EPKFLNui1GQWQaKMjkkXf5vzGwe77XKw/ui9tuj5dw5H82287ug7ROG4eOfybQSIyz+ZBTgvcM5leIrPdU29Ecn9gpS8jr1Y/MZSnp45FvcdHYAtq88o65+YZ6dUcytFetZnfY2nzHCZL5/Glw2VzSaLT0X7XiLAz7DLyVDjCyv9p430Y4CcjNRd5l7HJq13yfcIn44rWNMueXyEJychPkEb9sNd5S/1lZxu+FKbZw6dRJMHU+45C7uycrEW8R9+LO4qAaetO3zD+i6JMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/SlyrzwcYr5zCCpA46XOYA9/fYs0Pdj6PU8mnUe/ZE=;
 b=aYHwVC3nRMZ0m1z3wSfTaL8D0/aaY/SqwHP6UgFClEI1k9tHwgrX38+ZogWJygjeZWNvPEd++fCtFsKwMX4aWTFBp2Lb6kOt8aO++fgK+jDNKO96WoCu4U7pNlKynmGZAQGVQgI90CiXLxrDKOnNi0YNvSdNVX6i9HzWqTZvypTVo88ZigSPxfC1TguOUPlljUMhtwowMu3miooV4jrADNxeU3FBU7mc3mwjEJW3CuiQv4Nu0Xj44QzqqOzLDS0hVi42/PiaTP9UhhNA7+mPmwirewtcdQMC/J5XjkWnIYnEEsCFu/3TPeWKqkRFzTwhjCNea/iNEjcoE6LFXFC3QA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3378.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 15:56:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 15:56:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0A
Date: Wed, 16 Aug 2023 15:56:26 +0000
Message-ID: <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
In-Reply-To: <20230815220156.5c234b52@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3378:EE_
x-ms-office365-filtering-correlation-id: 932d5a90-6c73-44fe-0d6b-08db9e7158f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dXNCpztFZATgYPIScWisY1lve/D+xx/0wrK+/1cy4wuengG47zRU+vKXFmS7oM6hcQI6ysh6VlIFLK+tns7KuiI8IjJowH+1MsrpTY+Mn2N4fSYi1Nds7uqjJM6alM4/OnVyXSy5m/pIVeQvUXJ/X4eWxdNhsseHAyfUYgAKNV0nzbpQsip1wX5ZzuJQXQyLHmhaw50JSbgYJDrnwUH2Edbx9D9opcQR+Rof+9At4jHvoL0ks+8coaPBUvrUyeDaXPfS2G+GlICJ3CHzfpho1fQMFKFR1lH605VL2DBEktWHOS8mxeUQ03CRSSd3A0Ew3MmEZt8N7sWz6WyxYjayuU/6/qEn0J1JHJChkpWX9etvfLMuc37i5EpzLqO0RdZEgIcmnmbqomkt1k+uZvrEPwd9EjJHDxNW7Plq8J//lgC9cVRDSAAQieCpdOQ9GCsAnAFncBcMOFevQC6BqveMVO6bFEf8iOKu7icVM/Ll5/y2py12JxFUh5VsmOHE9IlH6jzv1LujoQNmHk+ybI/il3LVYwLFDLd+tE4xnO2YPcKbMtDw9Tfryj+h0MmoxpnDFaPFI1L9L8MBRmE6bw+df9De2QIu8XDZIlrTbZOpGPiWIKLL2LgYbekTFwb/de4GpuDZc5Ji53LJ8lMz90b2J4P8vW5tVAI+0+tfpysa5KBzKjMq36msWkVTcwvY8pMa
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39850400004)(1800799009)(451199024)(186009)(316002)(76116006)(6916009)(66946007)(91956017)(64756008)(66476007)(66556008)(66446008)(122000001)(41300700001)(5660300002)(44832011)(66574015)(38070700005)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(6506007)(36756003)(71200400001)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?clk0QjJnN2tDK1V2VnkvaVBzeUhKNTJ5KzVoOTVRMldaUkI3SHdyZnFQeDUr?=
 =?utf-8?B?b0xCbnBKM2ZCRmxOZzZjcnpWQTJjOWtjQ1RXZHM3OUlRRmVqRmkzbkV6bmls?=
 =?utf-8?B?elF6VGNpNGFxTXFyUmpPeGZXSEFtL01scHVyMXY4TkFPWW5PcFE3ODl1Y1V2?=
 =?utf-8?B?SE83NklHaEN1WmRYbm9oM1pxZUNBYW5qNjNNS2lSekdvNjVSNzdSeTJPcjdF?=
 =?utf-8?B?YklaTTlZMVBuVlhVQ2FjTmhHN2NXK09UREwzZHdWVE5uT1FWTklDVDhqekFl?=
 =?utf-8?B?YkZTbTJ2NFl2eG9XOTN2dUEvd2R3U250dWZib0pBLzE4KzFtaXBTNi9QSitw?=
 =?utf-8?B?NmpZTWc3ZS9WbUhBV2YwbVR5NndoWFpBRWNXWWluQTZzUlZ1TU9YaTBJYzNH?=
 =?utf-8?B?SWZiR2l4Y2dUNVJlSkFKNXBMQitaeXlGZE9Pa2R1QnVNcGpEd1NkOEZidUFl?=
 =?utf-8?B?OFRodDRzejl6aStOVlpBMDVXVG9XUlFDTkxwL0hNZlpQd1YwbmZhQU1tV3pj?=
 =?utf-8?B?TWUzbWFoNXp5ejlJTEFnVWNXMkptdkM0Mnl1MUZBcmJSdkQ3emFyejU3TUpJ?=
 =?utf-8?B?WkI5TWI5QURxd3h2Zk8wTVQvaTFBdk5mMXIyL1BMRkFoLy92QmplTFZkNkx1?=
 =?utf-8?B?ZXk0SjAzUmVnMTZBZHpFRXlOL0k2dWFrSVZDK1ZITTZDSzB2QVdKYUN2dG9Q?=
 =?utf-8?B?UExydEdmem9QVnk0YlY4cHBzdUN2Ym9FQzh0a3NSWE52NUlheUVlWFRiMUN1?=
 =?utf-8?B?OG5zNFJnTzdMYkFXeEg2NnRHMUYrM3YraE9icDc3dUNuRVhUb2V0cFd5bXJl?=
 =?utf-8?B?NVo3ZnFBRlNodG40R25mNThER0F1eU0rbHI2NVBDMFFWRWhYSVpKdGdNYW1y?=
 =?utf-8?B?dXN5K3M3WXNmYm5DSUZXeGdja1RaZ3JCRnFwMnltNlRYQWRHbDF4OUpiWnRa?=
 =?utf-8?B?Q0Q4SUtUZnZEMHlncFgxcys0b2JOWm80SjByVkNrRlY1UERqLzZkSzRaNTVp?=
 =?utf-8?B?Y2ZXMW93WWdMNkdSSGgvcUh4OFNXQVNmRmE5ZllLRWh3MktmUjBBOHBTc3Z3?=
 =?utf-8?B?cFJlWktrRDdLVzc3eEllell6dzV6Y3NRQjh6c1l0VThZOFdOSzJmL0xmL2Vs?=
 =?utf-8?B?cjdrdVdMOHJnK0l4YjRwZFJtbytnU0pPZVdNUTNObHpYRm1zZU1zMy9HM1N0?=
 =?utf-8?B?aVdDdnY1a3pNYmc5V0NwMlZMQmNrcHFSRWJEM0FVQm9uU0h2Tmc3OTdzMUdm?=
 =?utf-8?B?NXJkVzlFeHNhbmQrM3BpZ2xsTzJCYlN5OFN6alBFcmxsc3NkbXVGRUhjQTNJ?=
 =?utf-8?B?QkJKU0RnMmRrM0M5WS9iVmQ2Y1ZKem1vY2JqSFl0dGVNeDRFQ3BrZFMyMk5y?=
 =?utf-8?B?ZmZiWjdYTDlrQ3BaSmJ4Wk1US2ZoYXprYmVmZVRUUmErRGdlcWdYb3BVK0hy?=
 =?utf-8?B?SGs1VGNkeHgxd1pvYkNjSFIrOUVsYTV3MG1Tc3l3MkpYbDlBclRCRmNWa3BJ?=
 =?utf-8?B?cXptY0hyYWlaSTJISHU2THhHWUsxNDlJR0lDZTMzd1ZVMUZhQy9McTVXQ2U0?=
 =?utf-8?B?Zm80bEZGWGlhcFpxOE1Eay9jZ0QxTGpKWFd5cDF5MlluMkJ0Rm5Xek1CamVW?=
 =?utf-8?B?ZTJVbmJXY1J5ZEFsWCtLeE4zbVhHUkt5a0d1cS9TN3FHSGZKdzFCS1ArNFR5?=
 =?utf-8?B?bjc2aDdFNksrK3JEQ1cwTmxMRkErcnZjT1dHTkxqY2dmQWREYkVXazNqbkcr?=
 =?utf-8?B?TlFXb0ZCVDBjUHdtQXM1bU9rK1BxMHNYK2tkN0tCbkNLNmhXNFJ4UTVpakZp?=
 =?utf-8?B?cCs1WVIrU1pXTXA4Z2VLUmE3OTMySW9pVjlnbWdZOEVqOFhsRFpHZjExZnlT?=
 =?utf-8?B?WXRYV3FEUitRYVk2ZkluWERKenBQbUJBLzBKZTg4MzdEZks0ZzdiVFlURVl5?=
 =?utf-8?B?ekpNamk3UnpuUmhDL2hJYnZmV0J1V25CaStGVlNHenlGNUZxbW0vN2ZPWjdY?=
 =?utf-8?B?RFJJOXIyREY0R1hHQXN0Umc2YlIwK3Qvd2hPWHRIMXFxcU15ZStwb2pHdGEw?=
 =?utf-8?B?WEZmMnBVU0JLcjZzRWJEZW50L3dZUWFYVTBEY1VET0RJb01LVGxQUzFFZjYw?=
 =?utf-8?Q?7YFIRdGStoCi12rPiDuq75xVi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB231952C0860F4DAB7544534979D741@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 932d5a90-6c73-44fe-0d6b-08db9e7158f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 15:56:26.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qpCc/j/8Ph+ari1yNMb97RDHuA/B7wxrtVmMdC2tIRxyJKSx5s7H3XFV6+Dspia/zddNytI7CyGLkCebZn1yvWU6KSD1LnOPDiYSd2mpNgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3378
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA4LzIwMjMgw6AgMjI6MDEsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgMTUgQXVnIDIwMjMgMTc6MjU6MTMgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBJIGp1c3Qgc2VudCBh
IHBhdGNoIHdpdGggYWRkaXRpb25hbCBwcl9pbmZvKCkgaW4gb3JkZXIgdG8gaGVscCBsb2NhdGUN
Cj4+IHRoZSBpc3N1ZSwgcGxlYXNlIHByb3ZpZGUgb3V0cHV0IHdpdGggdGhhdCBwYXRjaC4NCj4+
DQo+PiBUaGFua3MNCj4+IENocmlzdG9waGUNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBlZmZvcnRz
IENocmlzdG9waGUhIFdpdGggdGhlIHBhdGNoIGFwcGxpZWQgSSBnZXQgdGhpcyBvdXRwdXQgKyBh
IGJsYW5rIGJsYWNrIGxpbmU6DQoNClRoYW5rcyBmb3IgeW91ciB0ZXN0cyBhbmQgeW91ciBwYXRp
ZW5jZS4NCg0KPiANCj4gWyAgICAwLjAwMDAwMF0gcHJpbnRrOiBib290Y29uc29sZSBbdWRiZzBd
IGVuYWJsZWQNCj4gWyAgICAwLjAwMDAwMF0gVG90YWwgbWVtb3J5ID0gMjA0OE1COyB1c2luZyA0
MDk2a0IgZm9yIGhhc2ggdGFibGUNCj4gWyAgICAwLjAwMDAwMF0gbWFwaW5fcmFtOjEyNQ0KPiBb
ICAgIDAuMDAwMDAwXSBtbXVfbWFwaW5fcmFtOjE2OSAwIDMwMDAwMDAwIDE0MDAwMDAgMjAwMDAw
MA0KPiBbICAgIDAuMDAwMDAwXSBfX21tdV9tYXBpbl9yYW06MTQ2IDAgMTQwMDAwMA0KPiBbICAg
IDAuMDAwMDAwXSBfX21tdV9tYXBpbl9yYW06MTU1IDE0MDAwMDANCj4gWyAgICAwLjAwMDAwMF0g
X19tbXVfbWFwaW5fcmFtOjE0NiAxNDAwMDAwIDMwMDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIF9f
bW11X21hcGluX3JhbToxNTUgMjAwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0gX19tYXBpbl9yYW1f
Y2h1bms6MTA3IDIwMDAwMDAwIDMwMDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIF9fbWFwaW5fcmFt
X2NodW5rOjExNw0KPiBbICAgIDAuMDAwMDAwXSBtYXBpbl9yYW06MTM0DQo+IFsgICAgMC4wMDAw
MDBdIGJ0ZXh0X3VubWFwOjEyOQ0KPiANCj4gDQo+IEFmdGVyd2FyZHMgdGhlIGZyZWV6ZS4gT24g
YSB3YXJtIGJvb3QgYWZ0ZXIgYm9vdGluZyBhbm90aGVyIGtlcm5lbCB0aGUgb3V0cHV0IGNvbnRp
bnVlcyB3aXRoICJbICAgIDAuMDAwMDAwXSBidGV4dF91bm1hcDoxMzEiIGluc3RlYWQgb2YgdGhl
IGJsYWNrIGxpbmUuIEZ1bGwgZG1lc2cgb2YgYSB3YXJtIGJvb3QgYXR0YWNoZWQuDQoNCk5vdCBz
dXJlIHRoaXMgaXMgdGhlIHJlYXNvbiBvZiB0aGUgY3Jhc2guIEp1c3QgdGhhdCBpdCBkaXNhYmxl
cyBib290eCANCmNvbnNvbGUgaGVyZSBhbmQgZG9lc24ndCByZS1lbmFibGUgYW55IGNvbnNvbGUg
YmVmb3JlIHRoZSBjcmFzaC4NCg0KQ291bGQgeW91IG1vdmUgdGhlIGNhbGwgdG8gYnRleHRfdW5t
YXAoKSBhZnRlciB0aGUgY2FsbCB0byANCm1lbWJsb2NrX3NldF9jdXJyZW50X2xpbWl0KGxvd21l
bV9lbmRfYWRkcik7IGF0IHRoZSBlbmQgb2YgZnVuY3Rpb24gDQpNTVVfaW5pdCgpDQoNCkFuZCBy
ZWRvIHRoZSB0ZXN0LCBzdGlsbCB3aXRoIG15IHBhdGNoIGFwcGxpZWQgZm9yIHRoZSBhZGRpdGlv
bmFsIHByX2luZm9zLg0KDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBSZWdhcmRzLA0K
PiBFcmhhcmQNCg==
