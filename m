Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1975645C11
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 15:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRzfP57wXz3bjN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 01:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3dOMh51q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::620; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3dOMh51q;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRzdP4wNZz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 01:07:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boF9DJ1YfuP5Kr5EjZmX9j/b7TKY/wSnZ2OV+sz7Zo7rJ4tYFb0ishkc7zNSjB3BbRLvYkZkvGJb4I8hHvs7vapmo+X/hwGwDpefQj47rHZUvVEJecQIzwB4vTNdpd4HN1byGmlN+E802xiGRR9mPqLh0BAY6FWKw5V9hxavIeyXEKy0OsXgtFOu++V9Of9ggfom3VBODp3Rq+gEPewlsIN14veIIfpd3ZHzcutIJmGn/chjwnjQeWxfkkVEQqxQOBUGQbuAk2Pb6AwRNyH+P+4m2uYPDF7d856EEVpRDGVpuDdvS/ZSd6fB8twhmuR1foRKB9Anx+vowCB6OfC6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNlSM4RIzb+Z8NaAlrd9hpVluAy1c8i43W1sicKzvs4=;
 b=EhXtp0w+Afb5tidGEFGUYOSAFyM9RNcwcSg8oz4hgKfKlRwWmGGd6e3KD2MVm+tX/RfTruXofWUkrntPa5/9GMapDCfbr8Meqte1LJviTCxkXqXXoziem150T0bioLxJazOKSKWKSvjvON27zRMcrSGD3JBSvMbUWly8EZ8M/4CtHUuKzWZSPII1aQJEWgWShIjB0qm/s9g13+s55elHK+L5W1PjTmO3ljiZmfN49c3q7FA00M9vEkuMQytq5SpiBr7JRkMV3L1PIRuMmE15huIiWBxtxPUEb58OQKcgUofkEbUZdo+nFjkxGIT+AfX696aTWgW7aJTi59mcNRy4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNlSM4RIzb+Z8NaAlrd9hpVluAy1c8i43W1sicKzvs4=;
 b=3dOMh51qSQCVnX9Id3K2+85g8LBXUm2EhNxfHzqGeQaCmioT0WmbWXTbN2eTURbqeTEURZs/CHJEOYtyHtK41BqIxkn50AMRDN3GSwBBSZSKNzIXiJDNcG5SXJTirsUnxRNihjHEOoggpxDl3dEptpqmr5Rzc8B7jr6zAYl5e57tYuWxhQxjJ7oPv7vpgLMaEpng99GN3FZtR4lF9xwXKnVQap0zg2tOh9dOZZBW0qXDN4tAvyfnEEFGWDu7u+tiA2ADY0Hzqjq/tB9DC7HHbYg8zzadhuJso7iXeDRs8sMWIoPvln+9D8hdk3XThIWZ4mwnBNa4u0VHBzf4XiGghw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 14:07:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 14:07:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH 0/7] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH 0/7] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index: AQHYtABEkudvyOpXh0Kj5zK3PXoUC65eNaYAgATs2AA=
Date: Wed, 7 Dec 2022 14:07:32 +0000
Message-ID: <02d0d651-5114-0697-209d-2105c3422ad4@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20221204105448.twotgo4rjd4uk32x@pali>
In-Reply-To: <20221204105448.twotgo4rjd4uk32x@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3001:EE_
x-ms-office365-filtering-correlation-id: 357b472e-8ec3-431d-f587-08dad85c624e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  X2674L2HRf+oJX21W5YT/39nh9tf5ibiOhpLUXiyxHhgBIEo18Y7RB+AvWMBTVN+xjkyPi7PuDWkpr7FnkGDoQ7aLFy9qqLOyQ67T+oIkgleIKLCY7tJ0O4ExNzRukxvvr7H8u5SkyxunAuL8YSVCyKk7w+NumrBB7xLX9v+9Hv4UegyXrdpyKbTFMSq9FqSoG2hVmv7oLfcepCa7f6bhIwr3iYZ7S/Z6TivnOmKi7z+0RxgRe1L94h0M40NI9izHbTJkeeNQF7aVeHtWOCvgnp7aF5nP4z2y/Dt6IrXQSFjyOZQhNzibtxvOAsX1aHJTxzI+4r9LsJ7pNWp7/vQV91fIR7hfaBIQZn9SQ57Vrg1WyhhDmF0HnbT/sjCLGCchjfLp3q+CJ1xkdSKiH/+OBaGq/YxzLRtzqV2AJuJK4YWXXfuKk1kxelSepJmdaeyPZQUh0ZTfsun3m2q2b/gPPK+oTDJVRpV4FhK85nySYpLeEIiuw8uy4rzc4g4h0DMfiWYX1fZeY3+qnUkW5nwhopx7Rjd8ZTi8Td26yelef8/HJxthD0qEYM2NN2Od/Wj1NrwV6Lg1gi7p4Xa5557qjXDdvt58QxQUE9uzjcuQGBJ+KZyHCvsW88k0TJrWFWanpav4fS6/j5hn4BqVM9T3x+soWMrdZgev/rhMRGbXQRL2RqRQBCPob3ewpjHm3EqUK91WRB3V+is124AN27k/cZKdZt1rHwqCvrd+h+8+jBhAI7nFp6pL56830Ko6cLQlkXpml0LLqLGVwEnnomUYA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(2906002)(38070700005)(31696002)(2616005)(8676002)(38100700002)(4326008)(6512007)(41300700001)(186003)(26005)(64756008)(66446008)(76116006)(66946007)(122000001)(66476007)(66556008)(36756003)(6506007)(44832011)(54906003)(86362001)(8936002)(5660300002)(6916009)(316002)(6486002)(91956017)(31686004)(478600001)(83380400001)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cVQ5T2xOWmxNTDRieGdSSG9BcmpSNkZVMkc5NzBnVFRHRkR6V3c3TDZNd0Uv?=
 =?utf-8?B?VG5FdWlwazZjUEJBUDZVN0JNSmtoY0FPZm1rRTN2ZUFBTXBqT0ROTVZFSW9o?=
 =?utf-8?B?Y1RMUUFBcWtNVXdGQVlWK0l6OXlnbG5Qazg3RGZmQW0yU3RWencxTkdtR1RV?=
 =?utf-8?B?SUNFNzd4ZUJScEY4N0ZqTTVWTmxxUDFwdi9kUGtkcEJ6d0RRNGg0bFVzUnBh?=
 =?utf-8?B?OXEyRjRwVmpHa3hwVGVSa2tjdHFaMjQ4WVlPbzQvbVRSVkhkamFaeUpBaWgx?=
 =?utf-8?B?ejNLVGxQaXFnNVhhSS9NZHljR2ZuSmNBNEVZV3JKVTRuZ0hSUzVNWjZES3pZ?=
 =?utf-8?B?NExoakxzL3JzamtncTlIVmhGdWk4ZVRSd2cvWEo0clNKYWxMR3FJUFNXOWZK?=
 =?utf-8?B?ZlZNd3dCQ2ZlL0JVWFA2aGt5V2tJUDkvVWx3MUpndjcyLzJtSDlXWjQrMXlE?=
 =?utf-8?B?a2dpdndtKy9SNEFtNlNZMTNTWjFqdmVoQmFwK3RuZ3ZaTi9GSmdQU3FMQjl1?=
 =?utf-8?B?NUNTd04vRlprUUI3ekNsT0cwOU01VmtOVDBZOFVWTnpDYlhxNkx2TXd5dGd1?=
 =?utf-8?B?OElhbXJ1MlFDN2F0S3dRbE04Umt3K0JWeVFjR3JDb1Vla29NN203UWwrTXAw?=
 =?utf-8?B?RFZYc0x6Q0NMQVJQd3A5eGxGNnZsZFNDdHVBcXdFYTBzVjk3Yll6R215ME9I?=
 =?utf-8?B?MWh0VktWZFZmSTl5WWh2MSswZW01TEhOWVhHWWRiM1lHTWh2QU94TytRS3Yv?=
 =?utf-8?B?bWxRa1VMUTYrUHNLbmp3Tk9tZ1A1SlZKQWJDYm83Y1BRRG51aUhML3lxcWpL?=
 =?utf-8?B?WDRwdUFIY1M1eXhTNjBhYjJjejF2dFBCZ0tGenNNMmI5NTZkOVRkUzFtdVM4?=
 =?utf-8?B?dmNwVWF5NVVoV3pveGFtam4vRUNrTjY1SGMxOFI3NHVGMlluZTdLeE53UzZ5?=
 =?utf-8?B?SkxaS0dOeFkvYUJ6c2ZiZy9mdUs4eE11ZWYzenc2N1pTbmZNaDRqSk8zdmF0?=
 =?utf-8?B?NG1WOUR1c0tFd1UwUlV5cVMrM21nd2Q0QW9XK3pxMFpxNUtQYSs4Wnh6VGxG?=
 =?utf-8?B?QUtTRG55cnd4UUVlcWhmb2ozTm9NWHM4b2xwMWtOekcrK0Q3SlZSYXg3Q01K?=
 =?utf-8?B?RnR3MlBnTHdUWThkclNoMGJUZlZOMUgyY3J0YVVNMTZDd1huK25jTkhSUnNL?=
 =?utf-8?B?b3NhVU96VHdReE1RMGFCSmtvRGYvdTIwVC9idzJuS1hVM3lVbzhBVjE5OTZS?=
 =?utf-8?B?LzVWZmd2TTFzQ1ZUZTFXbGExa1NDQXlvWlNNckJ6bWE2U2g2aXJxMzFoWi93?=
 =?utf-8?B?V3Z5QUZVanU5N3Z6SU9nVFV3YnNUbC95c0NMNDNFTExhVzlXVTBHZXZvbjlZ?=
 =?utf-8?B?aUdvNjZVbkhCT2JBdFlBQllkaG8vMnRPTTlVVVVDdnhlTjVyczEzeXZkTkZL?=
 =?utf-8?B?WDJ1TGdnKzBsM0RCc016aWFNOG5OcUFYMU9oSHhVYzk0WHRjdE54VFF0STBv?=
 =?utf-8?B?Ykl4T0I2eUdsZTREOUlKOEkwbTV5NTlaMGQ0WlhKdzd6dlNac09sRGxtNG5B?=
 =?utf-8?B?cDZMWWVPc1N0OEtSZWFBVE0xT2xDeW1EVFVOeFpUbVIvVUpHL2JzT0hqMjBF?=
 =?utf-8?B?TGhBT0R1RGs5aDcrcWhqQXNwSG44L0VtTVlybGttcnBwOGNhMCtsZ1ZSNEdK?=
 =?utf-8?B?QjRiTXlwdGJtT0FFcWlWeUN5TzZBbTZyckpITjc4UnRkaWNFd1ZkYTRzVmhG?=
 =?utf-8?B?Umd2dmxJVHZGUS9RTzJZb1FQSWszRVV1MXhmdkY4ZVFEOGZoRUlQQ0NjdHU3?=
 =?utf-8?B?SFdCV1N5UGNhL1A4Y011M0g3Z3VGbE43YVgrRjVpbERUNS95R2FNbEkwWVEz?=
 =?utf-8?B?Qnl2ZFFYVEs3Umg0dFNEZTk2akNIczBRNDFiN0dwZXE2SThGb0t1RG1XY0Zj?=
 =?utf-8?B?aU9TUXk5VElWK1cybGhibWpXLy9UUzJCSjR2YXJadjMyOUswUzExZWlmVHAz?=
 =?utf-8?B?TFc5c1NEbm5oQklCVnYySWphMjdqYmw1QzgyZE95SXF5Z0FEQ2VTOFVETWdE?=
 =?utf-8?B?c0dBWXZGL2s1QlVVK3k5M1U0NWozZTRDdkhPak9NZFAzSmpKeWVjdnI3V05j?=
 =?utf-8?B?dWtvd0h3eUZRN1UxeGxqZnRuR3JmTDEzRlpnOFpYU0Frd1Ryc0xKQjhlQysz?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <469CA60A72F996438BBD630B07BBE8D4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 357b472e-8ec3-431d-f587-08dad85c624e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 14:07:32.3654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILehMBHPi9WqLdqBx2drc0EayovmXF9UMbYO4IiJDb8tGrnWlR7/NCtaW+8yvtJzj6qenfn7TIZv01Ig8/2LtU08dRYMoQqG3TqQNPGj7tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3001
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjIgw6AgMTE6NTQsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IEZyaWRheSAxOSBBdWd1c3QgMjAyMiAyMToxNTo1MCBQYWxpIFJvaMOhciB3cm90ZToNCj4+IFRo
aXMgcGF0Y2ggc2VyaWVzIHVuaWZpZXMgYWxsIFAyMDIwIGJvYXJkcyBhbmQgbWFjaGluZSBkZXNj
cmlwdGlvbnMgaW50bw0KPj4gb25lIGdlbmVyaWMgdW5pZmllZCBQMjAyMCBtYWNoaW5lIGRlc2Ny
aXB0aW9uLiBXaXRoIHRoaXMgZ2VuZXJpYyBtYWNoaW5lDQo+PiBkZXNjcmlwdGlvbiwga2VybmVs
IGNhbiBib290IG9uIGFueSBQMjAyMC1iYXNlZCBib2FyZCB3aXRoIGNvcnJlY3QgRFRTDQo+PiBm
aWxlLg0KPj4NCj4+IFRlc3RlZCBvbiBDWi5OSUMgVHVycmlzIDEuMSBib2FyZCB3aXRoIGhhcyBG
cmVlc2NhbGUgUDIwMjAgcHJvY2Vzc29yLg0KPj4gS2VybmVsIGR1cmluZyBib290aW5nIGNvcnJl
Y3RseSBkZXRlY3RzIFAyMDIwIGFuZCBwcmludHM6DQo+PiBbICAgIDAuMDAwMDAwXSBVc2luZyBG
cmVlc2NhbGUgUDIwMjAgbWFjaGluZSBkZXNjcmlwdGlvbg0KPj4NCj4+IFBhbGkgUm9ow6FyICg3
KToNCj4+ICAgIHBvd2VycGMvODV4eDogTWFyayBtcGM4NXh4X3JkYl9waWNfaW5pdCgpIGFzIHN0
YXRpYw0KPj4gICAgcG93ZXJwYy84NXh4OiBNYXJrIG1wYzg1eHhfZHNfcGljX2luaXQoKSBhcyBz
dGF0aWMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIwMjA6IE1vdmUgYWxsIFAyMDIwIG1hY2hpbmUg
ZGVzY3JpcHRpb25zIHRvIHAyMDIwLmMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIwMjA6IFVuaWZ5
IC5zZXR1cF9hcmNoIGFuZCAuaW5pdF9JUlEgY2FsbGJhY2tzDQo+PiAgICBwb3dlcnBjLzg1eHg6
IHAyMDIwOiBEZWZpbmUganVzdCBvbmUgbWFjaGluZSBkZXNjcmlwdGlvbg0KPj4gICAgcG93ZXJw
Yy84NXh4OiBwMjAyMDogRW5hYmxlIGJvYXJkcyBieSBuZXcgY29uZmlnIG9wdGlvbiBDT05GSUdf
UDIwMjANCj4+ICAgIHBvd2VycGM6IGR0czogdHVycmlzMXguZHRzOiBSZW1vdmUgImZzbCxQMjAy
MFJEQi1QQyIgY29tcGF0aWJsZSBzdHJpbmcNCj4gDQo+IENocmlzdG9waGUsIGNvdWxkIHlvdSBw
bGVhc2Ugc3VtbWFyaXplIGZvciBtZSB3aGF0IGlzIG5lZWRlZCB0byBjaGFuZ2UgLw0KPiBmaXgg
LyBhZGp1c3QgaW4gdGhpcyBwYXRjaCBzZXJpZXM/IFdlIGhhZCBkaXNjdXNzaW9uIGFib3V0IGFs
bCBwYXRjaGVzDQo+IGluIHRoaXMgdGhyZWFkIGJ1dCBJIGhhdmUgbm90IHJlY2VpdmVkIHJlcGx5
IGZvciBldmVyeSBteSByZWFjdGlvbi4gQW5kDQo+IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIGFu
ZCB3aGF0IG5vdC4gU28gSSBjYW4gcHJlcGFyZSBhIFYyIHZlcnNpb24uDQoNCkkndmUgYmVlbiB0
aHJvdWdoIGFsbCBjb21tZW50cyBhbmQgYW5zd2VycyBvbmNlIG1vcmUuIElmIEkgZG9uJ3QgcmVw
bHkgDQp0byB5b3VyIGV4cGxhbmF0aW9uLCBpdCBtZWFucyBJIGFncmVlIHdpdGggaXQuDQoNClNv
IEkgdGhpbmsgeW91IGNhbiBwcm9jZWVkIG5vdyB3aXRoIHYyLg0KDQo+IA0KPj4gICBhcmNoL3Bv
d2VycGMvYm9vdC9kdHMvdHVycmlzMXguZHRzICAgICAgICAgICAgfCAgIDIgKy0NCj4+ICAgYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L0tjb25maWcgICAgICAgICAgIHwgIDIyICsrLQ0KPj4g
ICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKw0K
Pj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvbXBjODV4eF9kcy5jICAgICAgfCAgMjUg
Ky0tDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X3JkYi5jICAgICB8
ICA0NiArLS0tLS0NCj4+ICAgLi4uL3BsYXRmb3Jtcy84NXh4L3ttcGM4NXh4X2RzLmMgPT4gcDIw
MjAuY30gIHwgMTQ0ICsrKysrKystLS0tLS0tLS0tLQ0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDc1
IGluc2VydGlvbnMoKyksIDE2NSBkZWxldGlvbnMoLSkNCj4+ICAgY29weSBhcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzg1eHgve21wYzg1eHhfZHMuYyA9PiBwMjAyMC5jfSAoNTMlKQ0KPj4NCj4+IC0t
IA0KPj4gMi4yMC4xDQo+Pg0K
