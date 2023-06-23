Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93A73AFBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:12:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=D4VRvrz6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQMr38JXz3bpq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=D4VRvrz6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::606; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQLv1vwJz3bT2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:11:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvATxoxRias+nHavlqm2Lcp2HoDWPU23Pg8sZLz5X5ApnANx+YCreVCK9A05iivFKwDj1VkkHaR7NcWGetaQbLb3jZ6tZNqVFEvL1YXyUQjsqO9uc+pkRcboU/hg8ud9T3Ay1E//prdtNl6vbqRY9r5EUoXVg20UJHwwT5CsNUp0q/13J85NZPHbgQsWGdY9Dce5QhAKQfne7b51c86McVG1sQj4pcOmiY5mpcnKZqEwO5ZS7dFT7bM7EEASXPEGCuCcAWPe/jyLHCxUH4eCkLYuxjVwi+9AofWpAVCv4OGXrQ6wc8Uo/U5+cdze8gT6VLPnouZE9zPN+wNKjn/ZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3yyx1dW492KHlThMf2ZXzvp1j5dSnthNgtN88xhXwk=;
 b=JweCrY4hW+Xv56uxXGwkJYPrLdLzTiPyTI6WfwgS0xe3jcmma07de8GYehsLo7ZiVI9LLpXmgUeacRLcG8iZn/0B5tdRhk78O1+0sDeztvqTZ17UqvIDZXITq6JRqYLaG1OxiAG7ISyGBnGY/EjXUC3fGgEplpQ0N/kh1wwEuqMkTpPLPAeNJeL5zkl3A43eNZ+2y+bu83kNzU+m/kNuGT02QUbW7atqW0tg12PKpA5KiOzaax9x/07yz6dGF5a9hP+2G1oCU/DPieWIsjN3RTkhOBrvWtF5+n+2M2ELGC4rfooblkK378i7PAp50dI/N6Vi1usmekqhVJuEUXdkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3yyx1dW492KHlThMf2ZXzvp1j5dSnthNgtN88xhXwk=;
 b=D4VRvrz6uAcvmkEGyEzH7i6N1o4Rj23AlrkxsCl98SgTLbmwlR86XPDp7a3BaYZFQBtMhKOdwJdXhdQqA8N7JsmqyPKwYu6GjQ2ht8T4TCj/MPr1PjyCxQPlpC+YeGz5poB7DEfHlrFf5fveXVozpMgaUSfrIwB73ko6KWygfIhGFH95iS1exxyr7G7E7fbie+pLGiaqDfDTfULM++HhHtAQKab5HFe/R5my6dmyxAiEdlS+R1ORCtKhT2yq9NwQNy+LD6TkLjwPFsPQC3rA3oix88OwGdrE152SJv+1urbkvSNCvs1KB6Ih+5JTHCv3VfUjhWjgVDJPU6qCvapgWQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1809.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:10:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:10:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 01/17] powerpc/ftrace: Fix dropping weak symbols with
 older toolchains
Thread-Topic: [PATCH 01/17] powerpc/ftrace: Fix dropping weak symbols with
 older toolchains
Thread-Index: AQHZopQqtXDmyxH5U0il5LqI1AQSe6+X3QKA
Date: Fri, 23 Jun 2023 05:10:54 +0000
Message-ID: <05ab633c-46fe-7156-4a0b-f561b6f6ed46@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <7b265908a9461e38fc756ef9b569703860a80621.1687166935.git.naveen@kernel.org>
In-Reply-To:  <7b265908a9461e38fc756ef9b569703860a80621.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1809:EE_
x-ms-office365-filtering-correlation-id: 7f2e1d4e-bf8c-45e3-e89b-08db73a838ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PGOdt7rvEWvTW/CT1433vF4Awll6W/SgXSgwnhytOzj8jfr2lJmLlaevZ5jvbFTzfaXj2O4QM5PN2zOG+wTgMy4whQeMpkGt3wpFe6fJvHce3PVAHqVnqkWJDviyGDWF1jaonJCR+kGpDhmTn7Rz/U2YtY05JCTSHSUYtH1F8OAGmaQtgmu1p/SD/9XXH1dqOBLP851cXjc7n+NLqX4tMJXUKWS5SO1szQEJ6Bqg6APGPz+WRHkCSEkk+lA1OMCk62hSDH8xSaAQ9jvzWS6ZQMPrz2CZie5WXWRkYHI/DWnUM+PbL5Clxn2rreIsRfyl2W0/joauc1zfCHQ064kvcoIkYt0wlhflyABHncpwhXHsy9UYzHzg+7maTuk+k24umNeNe0ms8Quv8iQMt0TzdoUzH7B50SFkY74lEbADj+UiAyTSBE6ZJgci50lZ/kjo7KXKyPQi2rBRs/4uYMvXPA3bt0sjbt7+9TENfL6gc4i3RC41Q9w6A0mW0Gyf+6g7t+CKJYWX5n2Hd2R5CFQ+kznSi1VlTBWQt+G8UsUfGQJZp6fXrJaSlGVXqeXnSi3KNaCi18Yk7Mvt7dNG1aVF0L+u0XemRavSIrUuMUrGPC4AMapCUN/ulKkZ4MW+Ugj8QCGxlFGG9Md6vrU2IcF5ytAdr7Xrd3ujmZJiWcpeCst24LZWfcYnriLVuxpsLRGW
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(122000001)(38100700002)(38070700005)(86362001)(31696002)(76116006)(91956017)(4326008)(66556008)(316002)(64756008)(66446008)(66946007)(66476007)(2616005)(110136005)(5660300002)(66574015)(8936002)(83380400001)(8676002)(41300700001)(6486002)(31686004)(6512007)(26005)(478600001)(186003)(71200400001)(6506007)(2906002)(36756003)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RThHQ0t0dTlXcDhGMUlRSEtETWcrVlJ2aUVpWjdaY3p6aFpxaEsxOFhVTURt?=
 =?utf-8?B?RnhVQVlydlBjTVZLN2tJV1VJWWp3YWNxNHBSY0FVdnk0KzR1S0NVZGpSdzBF?=
 =?utf-8?B?NXZ1b2prY2Z0K3JPODlwcWpDZko4cWVuUGd3WGJ1QlZSOGQweUFPN2JMVUxx?=
 =?utf-8?B?VjVNQzIzRVNKaUg3d1F0TjFlcHd6Nis3UFgzTVlSWHVoT01uM29DSm1hRkZQ?=
 =?utf-8?B?TENwUWJUTUJPZ0hWNDVPUStWVzJIZHVHSDR0NU9FNDFzWUZVTTlKdTNLTUJG?=
 =?utf-8?B?K2FWSnlWcnVVTHJOcGc0VThPVVgxalVCQ3dML1A3SndaWGZRNmc2OVBWZHk5?=
 =?utf-8?B?eWxEVzBFSVkwYmNneHhMZ0Y0eVJaM1hzUjNEUld2NlZpb3piVkNCaWlaT2VE?=
 =?utf-8?B?SGlwZkRUNUZyNFB5NFhCSWtNcGtQM2t3RklUTFJ5UDhtbzlrRG1sKzIrWU5R?=
 =?utf-8?B?TXBFSDl4aW03bTNJTFowMjJWSjRLUnlaRTBTZDNETlh1Vjh0R1lRVzR4Ny9K?=
 =?utf-8?B?dVU2SGRuNnFJTlVKNFlMdDl5dEZqbWxsMnA0T2xPa1RMSnJtT29KYThnZkcr?=
 =?utf-8?B?Yi91dUZlcElTc2wvL2poU3c2SDFTRWhjd2E0MGlHanh3YVBrd3F1OU85eVlz?=
 =?utf-8?B?U2tNeU5BNVo3dEFuOHdQajdON21keTRaeWk5MFJMVzR0TlBqZEJhSmtRMzNC?=
 =?utf-8?B?UmI0VktBMFpYT2VZRVYySFMwSmJRU21id3BqcVJjUnN3SU5GVWs1YXFOWmxE?=
 =?utf-8?B?Y0E0WkxlQ3lhNGUwZ3UrNHpndmhCVnNJMTRoVzdZMmZaRDJyemw3SFdVZWxW?=
 =?utf-8?B?ZkpweThzMjJ4MFArWDV4NTczNFEyK2xkWDhrZTBudW9YU1c5SVlsNlpFaHhv?=
 =?utf-8?B?bkJxQVJMR05EZlZaeEN3Z0xpQ1dndUhhQ1FKVVd2SkQwaStZTXRxNTh4cVlQ?=
 =?utf-8?B?Ni9hNGZKRHY0WFp0SXZTbldONjN6czVvNFlRMjVGYW02cGo2aUpYRXUzTVYv?=
 =?utf-8?B?TE9YWTE1eXdIVUlmOWthMEViTTFVNmhzbVF5M1F2anNFQkxNTld2TkJvck0v?=
 =?utf-8?B?ajVDVUhyRHAxWEJUajAydkpXcXNUNUp4UVk1M2RlVXp2Sm9jV253dEtTeTNT?=
 =?utf-8?B?L0E1aGVyWVhSNlZ5aE5pRDU0ZUF4Z2ZtL3RxbE5Wam5aTy9CZDAwZ2FkaUpV?=
 =?utf-8?B?UEFPVXMwYzNRb1FEWU1iV3lzSjBrbGNXZCtMakdoc1pJcktzYWxnenpmOFBx?=
 =?utf-8?B?a1hwbDdwckxqQkJWZ09CQjRKWXU5NnlLTnBiN1l0Q2REa29XbzRXa0ZUUHNW?=
 =?utf-8?B?cEN4SU9oTVZCbW5INW15Um9VcjVTYXkzbk9LM3RRM1M2NUdheGFUN1pVVy9p?=
 =?utf-8?B?RGYyU2J0bHQ4MjkzRmtlT1NLZ3dHcVdQUkVrN1BMaDdsR0Jhdjd4SXI4V3cr?=
 =?utf-8?B?SENsU2lLWHpONloyUlJvdVFZUjZSQnNBWkgwbTlzT2kvN3ZTajRiSU1lN2NT?=
 =?utf-8?B?R0tJQUFXaWNtZTNDK3dVbUhHT2c2S2gvRzJkVTdsUTN5a0lOYzJyWE9lLzRp?=
 =?utf-8?B?QjJSOFlJUGU4U3U0TWc0REEzR3JEcjhpbTdjOTIrSkNrcUw2ajFFcWM3d1p3?=
 =?utf-8?B?b1VkTlFZUEthTGhWSXFvMTdnMmg4aEdLSWxMeWsrbXo1R2NMdWUwd1N5MEVh?=
 =?utf-8?B?cCtUUnJ3bE1Pb0xsQlNLcGxLRVBoYWRWMUZodzljUWlOcUhGbFJjZnB4RzJW?=
 =?utf-8?B?K2xQY2Y5aFJyTW5XTkFUWmtvRUFqbUhEdll6NU1INkFIN2dRYkg2RUFXSG5p?=
 =?utf-8?B?dFZvZis2UHVOWlgrSS9LdWdWdXR4R2VYMTlkZlFBUnB6M0JEUVprdEQxTHV0?=
 =?utf-8?B?T0RsL0UvVXdiencxYlhqVkJHOVhOYzh1ZFJrTVh6VDdRTDlMSXM0QmZ6a0Fs?=
 =?utf-8?B?WHNvZFJUNnhIbWpqeFNoWEMveE8xcVhLRy9ZQ1pRK05WTk9XUWtoSTFrQ1Nr?=
 =?utf-8?B?bWhwZmM0UE5sNGlZalZKQndOMnR4UEV1cll1TlBqb09ubjN1bDVpRVhIZmxQ?=
 =?utf-8?B?NzhyNU93aWQ1UCtKclB0WTlzK1FXNWZqaVJna05qMXNwMEpvdWF0RWRRczVv?=
 =?utf-8?B?TXhDV1dYNlBDUWcyYzNEdElxNWlML2s4dC8xWHg4VWlZNlVVa09yNENJTFVm?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1B408ACC2BB9547ABD30174DBFA4D18@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2e1d4e-bf8c-45e3-e89b-08db73a838ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:10:54.5358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oghobIuTdPjkPxHwlBiUD6YVaPjQv38tLIfFjARpu7lT3lcyRogXG8SltE5ls51HwhMIhtdazo0k59Wczfot0EIWGHss25/WwcOMWIGSvlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1809
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBU
aGUgbWluaW11bSBsZXZlbCBvZiBnY2Mgc3VwcG9ydGVkIGZvciBidWlsZGluZyB0aGUga2VybmVs
IGlzIHY1LjEuDQo+IHY1LnggcmVsZWFzZXMgb2YgZ2NjIGVtaXR0ZWQgYSB0aHJlZSBpbnN0cnVj
dGlvbiBzZXF1ZW5jZSBmb3INCj4gLW1wcm9maWxlLWtlcm5lbDoNCj4gCW1mbHIJcjANCj4gCXN0
ZAlyMCwgMTYocjEpDQo+IAlibAlfbWNvdW50DQo+IA0KPiBJdCBpcyBvbmx5IHdpdGggdGhlIHY2
LnggcmVsZWFzZXMgdGhhdCBnY2Mgc3RhcnRlZCBlbWl0dGluZyB0aGUgdHdvDQo+IGluc3RydWN0
aW9uIHNlcXVlbmNlIGZvciAtbXByb2ZpbGUta2VybmVsLCBvbWl0dGluZyB0aGUgc2Vjb25kIHN0
b3JlDQo+IGluc3RydWN0aW9uLg0KPiANCj4gV2l0aCB0aGUgb2xkZXIgdGhyZWUgaW5zdHJ1Y3Rp
b24gc2VxdWVuY2UsIHRoZSBhY3R1YWwgZnRyYWNlIGxvY2F0aW9uDQo+IGNhbiBiZSB0aGUgNXRo
IGluc3RydWN0aW9uIGludG8gYSBmdW5jdGlvbi4gVXBkYXRlIHRoZSBhbGxvd2VkIG9mZnNldA0K
PiBmb3IgZnRyYWNlIGxvY2F0aW9uIGZyb20gMTIgdG8gMTYgdG8gYWNjb21tb2RhdGUgdGhlIHNh
bWUuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBGaXhlczogN2FmODJmZjkw
YTJiMDYgKCJwb3dlcnBjL2Z0cmFjZTogSWdub3JlIHdlYWsgZnVuY3Rpb25zIikNCj4gU2lnbmVk
LW9mZi1ieTogTmF2ZWVuIE4gUmFvIDxuYXZlZW5Aa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnRyYWNlLmggfCAyICstDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Z0cmFjZS5oDQo+IGluZGV4IDkxYzA0OWQ1MWQwZTEwLi4yZWRjNjI2OWIxYTM1NyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mdHJhY2UuaA0KPiBAQCAtMTIsNyArMTIsNyBAQA0K
PiAgIA0KPiAgIC8qIElnbm9yZSB1bnVzZWQgd2VhayBmdW5jdGlvbnMgd2hpY2ggd2lsbCBoYXZl
IGxhcmdlciBvZmZzZXRzICovDQo+ICAgI2lmZGVmIENPTkZJR19NUFJPRklMRV9LRVJORUwNCj4g
LSNkZWZpbmUgRlRSQUNFX01DT1VOVF9NQVhfT0ZGU0VUCTEyDQo+ICsjZGVmaW5lIEZUUkFDRV9N
Q09VTlRfTUFYX09GRlNFVAkxNg0KPiAgICNlbGlmIGRlZmluZWQoQ09ORklHX1BQQzMyKQ0KPiAg
ICNkZWZpbmUgRlRSQUNFX01DT1VOVF9NQVhfT0ZGU0VUCTgNCj4gICAjZW5kaWYNCg==
