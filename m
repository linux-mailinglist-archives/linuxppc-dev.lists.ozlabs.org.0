Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94651777F07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 19:22:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g05V5qVQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMDJH1LwFz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 03:22:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=g05V5qVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMDHN0LqZz2ytf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 03:21:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcOF0pV0XzF5cxsSKEnyG6UShHQQMqz1zpN3+k3mVP5ZVJA0DyEO3KBESDGfasMp2Hz8T1NOGgXNDqjBTleDguokxWyXtt+tTQijNACNPtHmmCdK5qLIPwgshdMVmP0XCaz2XMeEyvxJ2C0QqbVw5mYCcmCTgs2PvDEG8q+a6QCmZUC6l6310CCB7RH4EBNDt+OY45TTsmXNXGgfOjUG0SWu2S8C7Nj1weZEzcktvdeoQNYeOvhb3F/1T27atmSQGMxrHZBLLsbv3wNccdYNZYW7datkEzmEUh7cv1JwCN1p8SmkW9SuauzJwhS4faYlLud4RyNcPOSG139xC7iiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv4dRykrDtDaj22zNSNDvYwl3lnBMQ+PjgSySv0y5vQ=;
 b=bWrI3wOUaLZQ7o2W7QHpsHPsl/0ejU9+zSDWkRr+sgphyuHjGRkgc3OUxRXojYLnxWsoRBSJj4FS/9Q1o+pwlKP68jiCGCRinBrEFteNeaOEntRMIpDLlHnrkTu1JV4AT76jk0qwMHqNALX1n++ipwludrEMtm8yjwhABotuDJGdr8iXQ7NRaz4fWoER5rT3BDXfF/qd/khWa0RfzZHmAUbS2NG0R7joni+xSQ8Uqfkp9XnjygB7sTYGyq9gdSnONqjXQBTLOupeKU/6ybuQD0BOcqEs/Lvuyx5AqwePCb2Qwh6jbF2w2ATzqqvD7HvoXuSNJOJBd7Xp5v4nWdJDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv4dRykrDtDaj22zNSNDvYwl3lnBMQ+PjgSySv0y5vQ=;
 b=g05V5qVQlEf5+qX9WgP7GYz+HQiRaA44GH+WuqjK7ZDxa676VwrQwFovgkuNKDy3NgwmLDxpCxYXHo1KOHIMsUgQIstsUbnGm37GKSpZPnnxvi/Fg2iKrmRr7NBGz3586/zVCpkiMXO2Xk0TSk/uEYbBToB+fdvE7fnYJJFpdimNo3U6EdvKj3JUBCEdZgC1cwQnAZph0r6EZ5G+jiJtcTKcac4tpc47mWnsog7HZvO6/8JFKKk6NnsxijhdoZOOj6RNJqDynOOcnV0A8bvCvDcsdbGgSCo1zvpnov+pvrC59189MzI3q+cQLYm8T1dwq2xuVQpHOAbjOYqMGG4XSg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3448.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:184::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 17:21:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 17:21:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/17] macintosh/ams: mark ams_init() static
Thread-Topic: [PATCH 06/17] macintosh/ams: mark ams_init() static
Thread-Index: AQHZy5Yjbz6CpW+mdkaL9CN20w7gaq/jxvGA
Date: Thu, 10 Aug 2023 17:21:11 +0000
Message-ID: <9a8de176-2786-99e4-5f84-3be541612283@csgroup.eu>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-7-arnd@kernel.org>
In-Reply-To: <20230810141947.1236730-7-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3448:EE_
x-ms-office365-filtering-correlation-id: 325135a8-a372-472d-5002-08db99c63196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hsP06PEmFI7tTuxEkc9k2QX+/bryQzs96J9T+CBGi3g44ew/T+uAOO92yosAAkd3MvXSzvlv2DQ2C92pBDrWDWhXbjPn1tjrSV2JWUqmg2v9vXRmAbv+Q71dQ1DXfyEazzuopUkfNFNcwt4NGFeHz1PbDZx7tscYTo8Im6Bmljl2j7TxRtPWc07hOPNcS+TLm126wvzSMF4o7L6jR/fi64cZnmiFc7NfsNlbRgWLtzQrf3ReZLW1++dgP0egLQ5vQRqUdhp/AtX5UVMqIz413tgaFNeMLXXuixasPoCaKiy26O9bQauGpGYdLm+1JkNz19SpDVAWCPMcp9yo+Nr1PVMvPqm+kI5Da0paYQ59oNyWY/4ZeTr0nyJ0e5WInDAbCYSc19lmIQGC7L0ou78UR44LBFFXkSOe8vLyh0Mi2mv8+08mEl4NSeqcFjWyDwtOyOWlUkaTuomxt4X1I00kmSmWqnM28UsM7sD7RlLaI8mBI4mXtu4z0dG+JEu2ZzFlRANlT6R/d8G5+9pxSUNAJgYrI3eCxGgdxXriDJuWYqiX0spwiIBfaS08RqOeHfIxnUMMBPTueQakRvb8e/JAWdt16pEmkcNMbbrhLIxILQ6G7j3iOmR0f6YsiN/eTdUCf0wxjpo7nyjG9mtgXW227vV2cwbbt7u+Mc5K/C5rexezG0FqPUKS9BVs7Uxnwvyf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39850400004)(376002)(136003)(186006)(1800799006)(451199021)(36756003)(316002)(6486002)(8676002)(8936002)(26005)(6512007)(44832011)(31696002)(5660300002)(38070700005)(6506007)(71200400001)(4744005)(91956017)(76116006)(41300700001)(31686004)(66446008)(66946007)(64756008)(66556008)(66476007)(83380400001)(66574015)(2906002)(4326008)(2616005)(122000001)(86362001)(478600001)(38100700002)(110136005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VlNkVWdOd2NRcG01c1hiSHMvbnA1WVVVK0FhWURlcUFsM1VSajZ4Wk82eG9v?=
 =?utf-8?B?QXczdUVXcmFUcWx0ck9XWGNKYjdNVk9QNkxxNTBqVWRucjZXQ2Y3YlBnTjdD?=
 =?utf-8?B?bjlIUVEwYmlxSEkzYnFGSjJHWEVZMzFEOFVCSStzbXpYNXJiSGFyakRYd0k5?=
 =?utf-8?B?V21mNjdKL1VFZjl4b2pESjBtSVVsbmZpOE9DakNRcGh0eEFGbnFxaWJSenRa?=
 =?utf-8?B?M2FJVC9iVVFOTUFVTFQ3dG9IWWluMDNwYVMxeFNBRlFZb3J4eW0rSjgvM0dC?=
 =?utf-8?B?NjN3emhiZjJRcy96ZFhUMS8vblk1bjdGTHRzZ255bUdhRFBJUmlQS2FuelZ4?=
 =?utf-8?B?WEFPSnJwVzdMcmthQUEzamtLb0pEZkEzTVdUbUxzSkFHMnB6R1hiUFFib1JC?=
 =?utf-8?B?WklsdFpnT3FORnhGVVBlQU01am1Jd282SUxVNnl2cmlPNVduQ2VsZ3NBMnlC?=
 =?utf-8?B?b01JOUN0WThnVnRPM1Y4RmdIcFhRcElIaTBpMm9GVEJFWEFFRExjck81WVpD?=
 =?utf-8?B?VmU5dU9Pbjh6TkVtcG9XS1BYSXlYc0xWcmlGNUlRb1BkcGtMa1VmMkJTSGtt?=
 =?utf-8?B?V2xDaEhReUhLd3NRVlN2NTE3cFRwempoLzRLTTdUTGIyU2RKeHlyOTBMQWph?=
 =?utf-8?B?SzlZVXBxVkdMRE4xSi9kRFpHdkNraGVUSE12d1FKWDJ3bzJDa1hKUGZCTk5I?=
 =?utf-8?B?b2FtN0E2NzBtZDR3U05EMlRoeGN0YWNLK0RPVVozamhGUlJ6bTUzNzNINTlD?=
 =?utf-8?B?eXduL3Z0MTlIeWtzVTNHdjkxU2pHbDVybUdycHE3QVpVK0NBR0VwV1R1Tjg4?=
 =?utf-8?B?ZG0xMGRlZGJFTGJEQjdVSE15REJhNUJ4QmEvNEM3ME1nenNWQkpaQXlJbmta?=
 =?utf-8?B?QVUxMGhHVnlZRDJKa0d0M0h5SUR5SlZGWmF4TjBOb2hUK2gveGVoN2piK0No?=
 =?utf-8?B?NU9udTY1emFTYVJDMDZ4ZWhzRE9TVG9LTm5DTSswSEtCVEFWcDJubWlyUjVY?=
 =?utf-8?B?ZUdhaDJvb1hyd3ZGbTRWeW1zOE9DVmptVURFRFhaSjBOYndhK0ZzMkcrTGNU?=
 =?utf-8?B?aC9rTmlyZitxWkhjN0d4OHd2a3IwWFFiOFhneEN4YVVRZGlDcTI0dWIrWVVW?=
 =?utf-8?B?d21oWjBML05vUy9FV25qL1B6dGw1a1RBdk1lb05XQUpqdHp1TEFYZEJpTjdz?=
 =?utf-8?B?T3JyazVrZy91dE5BQThNM1B5N3YvOWFiUWd4Ujl6LytLdjdiYXFsL253YjhR?=
 =?utf-8?B?SFVtL0dJZ1dGdzNUSE5pcTZodTQyTXdubTErdHdTWUFhU1RhdS94MWt3c09Z?=
 =?utf-8?B?ZUZHSjFmNVBHaWhHNWh2bGN5b211ZFJhaFNpaXNkN0hBVFUvN3VKZmtOOUZL?=
 =?utf-8?B?eDAwTjR2U051cC9QVEZrLzIzV0grNWhzRmFmKzdnZ0hVeGJibkp0eW9OWHVM?=
 =?utf-8?B?bmlLQ0RFMDVHNWtNU29icE1BZ2NUMVdnWUR3R2NwVTBuSzVIeFk4aWw0MW9V?=
 =?utf-8?B?N1RCODdYYXY3WDREN01qVHA4UWhYWVhKQ0M3dm0zb3IxbTlXVmp3Ui9FazNl?=
 =?utf-8?B?MkQvS0hXK1owTklrd3VNWW0rNi9qRE04UzRsajc1emRXNVJuLzdSSTkvUWNB?=
 =?utf-8?B?RUREVWF5cndEMjBNT3A3TStEbXJvOFhaZGhsOHdrUVdQc01DQjk0aGwxVDhC?=
 =?utf-8?B?YjlWL1lkWW1iSC9YM2hmcFFPRUhCVitJNTBqcnNYUXJ6UTUzYzNYYlI5KzJz?=
 =?utf-8?B?NFdWQmpBYlFHMnpJWmdmeTdRbFNIMzExTkU4SllBZGFqSzVpZnhNdWNwK2Nx?=
 =?utf-8?B?TEJSRGNyQVFFMk9ibnJZYmgxamxoWE9tdEJUZFN0Qk9WeEdIM2JPUTdka2gr?=
 =?utf-8?B?ZndOcSswOWZnM0hOc3VRRGFZbG5tSFlkOWRsVHRoYWdMMm80MkR0NDZKTGw1?=
 =?utf-8?B?YUd2eVcwV0NpMWFXWkRxczFkZGtEU00wTEZ3RUVCYXlHR2ZzcVVQc1ZDazd4?=
 =?utf-8?B?WlpVcS80ZWh5SmhQc1ZrN1BTTFMxaWJKU2t5RmJJWXFoTlZ1L2FVdTQ3eW5m?=
 =?utf-8?B?OHQ4ZnBKU0t2YkNZMmtZWVU2M3BMVnpVRzZwTXgxSmU0ZTNRWVlwRWNaci9N?=
 =?utf-8?B?MjVPWlBBRUwzdU9XMldNajBzNkpwcHgxU0ZYRmJ5dFhMSlVoWVBmTDl3U3Bh?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <191CCF54D792FF409915FDB43420FD0C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 325135a8-a372-472d-5002-08db99c63196
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 17:21:11.7348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6iUDH/+0T9DvhMDVFa8OGSnk0Kh3Yk2fQwx1RQvSwabuJVB3UZDvvsI8Ur2O0bMWBPhfgId3agCfMl7PX5V5x5dtiqdxOuLm0xZ73B8cE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3448
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA4LzIwMjMgw6AgMTY6MTksIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IFRoaXMgaXMgdGhlIG1v
ZHVsZSBpbml0IGZ1bmN0aW9uLCB3aGljaCBieSBkZWZpbml0aW9uIGlzIHVzZWQgb25seQ0KPiBs
b2NhbGx5LCBzbyBtYXJrIGl0IHN0YXRpYyB0byBhdm9pZCBhIHdhcm5pbmc6DQo+IA0KPiBkcml2
ZXJzL21hY2ludG9zaC9hbXMvYW1zLWNvcmUuYzoxNzk6MTI6IGVycm9yOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yICdhbXNfaW5pdCcgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCg0KUmV2aWV3
ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0K
PiAtLS0NCj4gICBkcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWNvcmUuYyB8IDIgKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWNvcmUuYyBiL2RyaXZlcnMvbWFjaW50
b3NoL2Ftcy9hbXMtY29yZS5jDQo+IGluZGV4IDg3N2U4Y2IyMzEyODMuLmM5NzhiNDI3MmRhYTUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtY29yZS5jDQo+ICsrKyBi
L2RyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtY29yZS5jDQo+IEBAIC0xNzYsNyArMTc2LDcgQEAg
aW50IGFtc19zZW5zb3JfYXR0YWNoKHZvaWQpDQo+ICAgCXJldHVybiByZXN1bHQ7DQo+ICAgfQ0K
PiAgIA0KPiAtaW50IF9faW5pdCBhbXNfaW5pdCh2b2lkKQ0KPiArc3RhdGljIGludCBfX2luaXQg
YW1zX2luaXQodm9pZCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+ICAg
DQo=
