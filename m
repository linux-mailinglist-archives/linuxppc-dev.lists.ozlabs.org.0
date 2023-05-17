Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92D706D96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 18:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLyZ94B4Wz3fJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 02:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dXWarFaC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dXWarFaC;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLyYG3P67z3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 02:02:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWxbP76JA6ZdWy7CkXihbvhWUHy2crseAeJJYjF7rkAXD991P1dOm6p2mj6pnf0dDC+p4Kr1ihowpJWAmvZMu1vDUTkfC76br+PBMF9tiCg31GN8jJ+GfBCa+D3+75qL2Hi9nUJGrbG0p6477Y1w98/lmnbamSmqFpGkI0inYEf6yl+9JOYc1DbMZMf9diOcs8Em7PZpWRaTloGdyps0nD+Ita2F0NFhmZ/oeS5b/kNhnlYsWFuyIFDz6ldWogA0L7YqPkIrsJ1/i2d42slK7Zp/5T6oN/JD6FAZfWxf1Qm7zWsPBvM68s3ykrmZXrSHrQ2BeJK4iAeiNwaeiC45VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz6HW0Jd8knvAZsnAVMc4PqQoHwJYIxee3w5WPn8pTc=;
 b=DS3YfkCnWtdHzq9K0LDbdS7juTeoc+JFj7FOqHtfPG44aiOV9ViUrdsDap2msS9vTV9e05H0wMP8Hy/y0dBSNY4sLHJmc3eqIR+oMII1L/5y2kXQQ5HmCo6c6uj9BmAZxGzVb7T6A/tlLmAyCSZ0FoXyqp99dJuqVpAzO6WkZ80dcb/v4qkzkIpAUFhJsDcz2RL3Xk2TMvj5nfnEtt0ljUEVmCNWkPzFbVrndq/bB/snqP06JW5XSLnYiTcjcl2m9QjdzMffJUiMVwfboNPbencw+x+BAoN63A1MBZp2RRM2UZrNL4+S1GPhgxWIJcnuuj7mx+c+8FkyRqNH5L2JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mz6HW0Jd8knvAZsnAVMc4PqQoHwJYIxee3w5WPn8pTc=;
 b=dXWarFaC94q2sLHgwpTvQM8DgoNbYLQf0xYPeF95OKDeHnaoyASvGR5PDCEJVPHYrN/iduNixThECt/LxhaZEtRZBTcGLa6n/sEjPYspSLzyJqaxx7MB20P1yjTyU+bGqCDFOaKDeX6hBvrN0/cbRKRRhrhBpwAwJQUnz3+uWTtc2QsEL8uVAbsM6T/c1WlYkECBrDFIdUN11tk/RGt56+cqLOz1AeZgqLAnhaH1SBScyxEKspEpP69c/yCIl7JVShqlfX3BKPznLVUy92wQdhs8VmC7Hf5af+4Bs1sBgmUFOYHYvnXssL9UY24gl/cRGNssNEav0gsMvmFsZ6wUow==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2445.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 16:02:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 16:02:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List
	<linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, Oswald
 Buddenhagen <oswald.buddenhagen@gmx.de>, Takashi Iwai <tiwai@suse.de>
Subject: Re: next: gcc-8-ppc6xx_defconfig: ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
Thread-Topic: next: gcc-8-ppc6xx_defconfig: ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
Thread-Index: AQHZiMhMCln+kGFjzUWfHCphX1JVo69eoESA
Date: Wed, 17 May 2023 16:02:02 +0000
Message-ID: <03ba2e3a-9317-494b-59fa-54e205e1466e@csgroup.eu>
References:  <CA+G9fYsShNP=LALHdMd-Btx3PBtO_CjyBNgpStr9fPGXNbRvdg@mail.gmail.com>
In-Reply-To:  <CA+G9fYsShNP=LALHdMd-Btx3PBtO_CjyBNgpStr9fPGXNbRvdg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2445:EE_
x-ms-office365-filtering-correlation-id: 7e0b1bcc-eebb-41a9-47bb-08db56f00de8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RYnCralpiDXhHW9lkJjXwCDDMW4OQcYQnR2pJ78rQjFlPHuiGP6ECj21udSxUulWD+uJwts45DxayNE06DR4HvFAPXY5Ux5eIqohEBmwRHlZTRM0e6rTrg+yp6eyA0XzSR49VTVYFPtg7P2PUjsaOyiKOzWnGOk3riyAtn+pwg9oS2lU6lx0OjseMWPxJr0RSpPhwEdil4k4G73TmSY03slVjJ/Ku6tOLxIEYGaJNfR1cMx81b9QYspJbbJzvcf9F/ce1h5OkbnpmFhNbQch+SbFi7WTXsHsV0wuBxAFb9lm/FqeSbkxLD0JGgxJGxovoXLvzWsK0KxJ6cgNyxSfJ/V+7THb2KcCilPWmPWU8atuVsKOpLN8TJPt8oftxNDXkbnHp77erUT2pHtPWZ30tlcqzp+M4chr9OWLdUREuj2LYQCCjnniqLyrRY10nNxDsABhTRIQUQLjMUKFt+cZp8Ue6schFpZF9zdNzotd7kc+WGKycZd9Uvj3ZdttC+JDKFKSYNAqwnT9BDsY6wEQVVW4m1SKHAHRooUOY5SKPoru8o2qCeaRFrzvkqH35Kvf4iQ2ekGQNiCYEUcxG39gmDp/zhjyI50ZHIhHeRLCKpDK1YsLVqhJUKMTGg9V6X2LMlUAmuqKaaZx2j/1kVlhgy1NVFnUST/Hz9woirr81Jk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(39850400004)(346002)(451199021)(31686004)(83380400001)(122000001)(41300700001)(8676002)(7416002)(5660300002)(8936002)(36756003)(31696002)(86362001)(316002)(38070700005)(66476007)(38100700002)(66556008)(4326008)(66946007)(66446008)(64756008)(76116006)(2906002)(91956017)(966005)(6512007)(6506007)(26005)(186003)(44832011)(478600001)(6486002)(2616005)(110136005)(54906003)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Uk5YcERoaFN1RlhzOE04K2thb1RSbU9iUVhUb3loSTRyVXM4NnEwa3lpSjdt?=
 =?utf-8?B?aGFMNVhVR2Z3UkVWNG00Snp5NXh3ZEZiOHhwaDNGME1BcWRyUVYva2NhUEx2?=
 =?utf-8?B?ZXJyUDlIaUFsNTFzS3JrU2dRK3N5amkydmVldFl4WjFScVZDVVg3STJ2YkVl?=
 =?utf-8?B?R1B2VFQwY2prckRtVVlyeHlXZUYvd2ZMYWMrQzdtZ1A0OGZrTUVGdmZDRVVS?=
 =?utf-8?B?VVZ1UXE1ZEVENUZEMXk2NjVmOWY5UFdBR2dydC9LaE1VVGZnNEVmTlVGc0NB?=
 =?utf-8?B?ay8xNHVIY1lmMHhVMDJhU3NTYXN4NHZMY0xqU3FIQjFuVHJ6WTlBbWJXLzJX?=
 =?utf-8?B?KzIxbGdacjR5eXJQa0kvNjVFZWIyNFBoR3plMzExMG8vcnA0dmNlMkNDQ0l0?=
 =?utf-8?B?Q1Bmd2Q0Qm1oQjhzeUQvb2lLeUczbHpEbFg4UHVpRm4wVWo3eUZ5eG9UV0hU?=
 =?utf-8?B?aklxbTJHT3ZRZjVFcnorUDlCN1ZxZlJXaDFkVUR6RXkwM01yUFFRSGtaeGY3?=
 =?utf-8?B?SnlHLzZVMEtlR0w1TnZ0OTZaVFdwU3owbUhJY2xqd0lFc0UwQnNjdHU4OXBX?=
 =?utf-8?B?WTJNNnM4U0k2ZTVPemFtaGZkUUxkd016OHk0V1dsdDdBYUd5SjY2OXdOcmtP?=
 =?utf-8?B?aCs5RWlCK1BtRGxmcWNDRk50dWJsNzdKbEVFZ2xLbmJDbFI2NVFpaS9rZFhK?=
 =?utf-8?B?bjhyMVVuYW1QYVZlMTF0UFhScXpSNDdHaE1KaHc3UXk4am5RMzRzdzJWS0VN?=
 =?utf-8?B?VGpDYm5IRFdGcDgzVjdVVXlNQXd4TnNEM1JBd1c2aWZIMUJ0YVV6akJUajdh?=
 =?utf-8?B?T1RMcTJLY1g1T3RiSW00bVl5LzhpVWorOHgzMHNGVndWZUVuU0I3MktISmQw?=
 =?utf-8?B?TnlubGowdW02OUVPVEtjYllLOEh6Rms2V2FJaHhtT3NXWjhhVE1neW9zaHVS?=
 =?utf-8?B?N09BVzUxRldkdGc0VlBodENnczlpbUZud3dWYVBvUW9Nb2M2elh3a29XNjd3?=
 =?utf-8?B?Y1h0YkVaS0tqRXA5aithaTBWd0gxUjI5ekdleTVRQ3oxdXdUUExyZ3dFamIv?=
 =?utf-8?B?bTZiYmxXYTJDTmQrVU90M05QZUp2dURnOHN1eUdWZlVoVjhncktlcWxWczVX?=
 =?utf-8?B?WEhtb0pXa1hZb2dIMVM4c2lGNHcrdXhRKzBMd2tJeGZ2bU5nTFhVWlRrRnNS?=
 =?utf-8?B?dHdxc2tYbTFvbnpMUEdyTXJlK1dFZk5nYjhIN2JEZ1ZhZGF1NjFPU3UzZG1x?=
 =?utf-8?B?NTJGaENhSGJGQ2hGSmpqMzZrdUxiSm5CcngvRytKNXNKc245dGthUGlGNHA5?=
 =?utf-8?B?MlVWVWpvNm10b1B2WmFDQSs3UjIrRmNuR1A0UTVIZzZka2MvSHdEMlRUbmE3?=
 =?utf-8?B?YkcyZCtqcWtBMXI2RW9VTDNJYWxEbWRWR2tCdkIrWUNySmRBN0cyYWk1ZmE5?=
 =?utf-8?B?UWY2cFc0TnM5aUREVTF3dDNLSFFvS1A0NjNzTUNob01OUzJyVmdnWHlPWU1H?=
 =?utf-8?B?RUVvUFQ3ZUpOdFpZaUY1QktOOU1PRkFoWW9ZNFR6RVFqZFFUSlFWc2tiS1hT?=
 =?utf-8?B?ek8xbVhsSVFaSGtQZ2EwVUluR3RsUVY2WWF6QW1maTVGeVMzQzUvRWxHbWpI?=
 =?utf-8?B?T0ZwRDJVeUtxVUIrS2Vjb3A4a08zMXo0VEx0eEp0cmlzOUc5dXNLTCt2RDVk?=
 =?utf-8?B?emdPYUFUODlpdFZOU2NSbzBsQXo1TmZwY3BFV0ljajZHWVZEYTQyd3JhQkZH?=
 =?utf-8?B?MjMzY0ZldkRMYS82R1JQTHM5WkJYNlFJeHRnVDQvakRuNGZZNDJab3l1eWNM?=
 =?utf-8?B?YU5IY2d6VHRFU1hoRTY0T214cERJZXFUMDZaOTdvT29CNXB1Q0xDQ1haYzlv?=
 =?utf-8?B?RkZpZWhCZnRzT1Frd2xhaGhKOTFBNjdLYmlSQmtOSkFPdkR0cjZmVktheVlD?=
 =?utf-8?B?dk1CZEh1VHJBZEZNWW9tQ0NPR0FKaWZKZnk5V0dweWQ4M1hVMld3MWs3SVMr?=
 =?utf-8?B?Z3hWYWpWWXhFREgwVTRueDdmZ3NTYWJqcWhFQWc1TDdMZWxyMzBGN0JpQlc1?=
 =?utf-8?B?MGFwR3BSS1E1OHp4NU5ac2thTVhSUWxsUVk0eG5wRzRoKzFCZnVNOHNBbjZG?=
 =?utf-8?B?U3IwWlk2a3VIZlF6czZQc0srZC94Uk1zdStkcHVnakRtM2tYSFVOVDdIVXZ5?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBB9757057C59644BC016D8F4A45C452@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0b1bcc-eebb-41a9-47bb-08db56f00de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 16:02:02.8381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AeX1yWsW6ObipI4lp2c0zFu43Mxbf9ckbWhme0dVYIcwV5HHXDsrXrmTsPpRr66nnk7iEbhgRrJYxc80WZJiygDpBxEvTkYCQ+PiOweE4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2445
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA1LzIwMjMgw6AgMTY6MDIsIE5hcmVzaCBLYW1ib2p1IGEgw6ljcml0wqA6DQo+
IExpbnV4IG5leHQgcG93ZXJwYyBnY2MtOCBidWlsZCBmYWlsZWQgb24gTGludXggbmV4dCAyMDIz
MDUxNiBhbmQgMjAyMzA1MTcuDQo+ICAgLSBidWlsZC9nY2MtOC1wcGM2eHhfZGVmY29uZmlnDQo+
IA0KPiBSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBs
aW5hcm8ub3JnPg0KPiANCj4gQnVpbGQgbG9nOg0KPiA9PT09DQo+IG1ha2UgLS1zaWxlbnQgLS1r
ZWVwLWdvaW5nIC0tam9icz04DQo+IE89L2hvbWUvdHV4YnVpbGQvLmNhY2hlL3R1eG1ha2UvYnVp
bGRzLzEvYnVpbGQgXA0KPiAgICBBUkNIPXBvd2VycGMgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjRs
ZS1saW51eC1nbnUtIFwNCj4gICAgJ0NDPXNjY2FjaGUgcG93ZXJwYzY0bGUtbGludXgtZ251LWdj
YycgXA0KPiAgICAnSE9TVENDPXNjY2FjaGUgZ2NjJw0KPiANCj4gRVJST1I6IG1vZHBvc3Q6ICJf
X2RpdmRpMyIgW3NvdW5kL3BjaS9lbXUxMGsxL3NuZC1lbXUxMGsxLmtvXSB1bmRlZmluZWQhDQo+
IEVSUk9SOiBtb2Rwb3N0OiAiX191ZGl2ZGkzIiBbc291bmQvcGNpL2VtdTEwazEvc25kLWVtdTEw
azEua29dIHVuZGVmaW5lZCENCj4gbWFrZVsyXTogKioqIFsvYnVpbGRzL2xpbnV4L3NjcmlwdHMv
TWFrZWZpbGUubW9kcG9zdDoxMzY6DQo+IE1vZHVsZS5zeW12ZXJzXSBFcnJvciAxDQo+IG1ha2Vb
Ml06IFRhcmdldCAnX19tb2Rwb3N0JyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiBt
YWtlWzFdOiAqKiogWy9idWlsZHMvbGludXgvTWFrZWZpbGU6MTk3ODogbW9kcG9zdF0gRXJyb3Ig
Mg0KDQpQcm9ibGVtIGludHJvZHVjZWQgYnkgY29tbWl0czoNCmJiNWNlYjQzYjdiZiAoIkFMU0E6
IGVtdTEwazE6IGZpeCBub24temVybyBtaXhlciBjb250cm9sIGRlZmF1bHRzIGluIA0KaGlnaHJl
cyBtb2RlIikNCjEyOThiYzk3OGFmYiAoIkFMU0E6IGVtdTEwazE6IGVuYWJsZSBiaXQtZXhhY3Qg
cGxheWJhY2ssIHBhcnQgMTogRFNQIA0KYXR0ZW51YXRpb24iKQ0KDQpNb3JlIGV4YWN0bHkgYnkg
Og0KDQorICBkZWZ2YWwgPSBkZWZ2YWwgKiAweDdmZmZmZmZmTEwgLyAxMDA7DQoNCm9yDQoNCisg
IGRlZnZhbCA9IGRlZnZhbCAqIDB4ODAwMDAwMDBMTCAvIDEwMCAtIDE7DQoNCg0KcG93ZXJwYy8z
MiBkb2Vzbid0IGV4cGVjdCByYXcgNjQgYml0cyBkaXZpc2lvbi4NCg0KWW91IGhhdmUgdG8gdXNl
IGZ1bmN0aW9uIGRpdl91NjQoKSBhcyBkZWZpbmVkIGluIGluY2x1ZGUvbGludXgvbWF0aDY0Lmgg
DQpmb3IgdGhpcyBraW5kIG9mIG9wZXJhdGlvbi4NCg0KQ2hyaXN0b3BoZQ0KDQoNCj4gDQo+IA0K
PiBsaW5rcywNCj4gICAtIGh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3JnL2xrZnQvbGludXgt
bmV4dC1tYXN0ZXIvYnVpbGQvbmV4dC0yMDIzMDUxNy90ZXN0cnVuLzE3MDMxNzA2L3N1aXRlL2J1
aWxkL3Rlc3QvZ2NjLTgtcHBjNnh4X2RlZmNvbmZpZy9sb2cNCj4gICAtIGh0dHBzOi8vcWEtcmVw
b3J0cy5saW5hcm8ub3JnL2xrZnQvbGludXgtbmV4dC1tYXN0ZXIvYnVpbGQvbmV4dC0yMDIzMDUx
Ny90ZXN0cnVuLzE3MDMxNzA2L3N1aXRlL2J1aWxkL3Rlc3QvZ2NjLTgtcHBjNnh4X2RlZmNvbmZp
Zy9oaXN0b3J5Lw0KPiANCj4gU3RlcHMgdG8gcmVwcm9kdWNlOg0KPiA9PT09PT09DQo+ICMgVG8g
aW5zdGFsbCB0dXhtYWtlIG9uIHlvdXIgc3lzdGVtIGdsb2JhbGx5Og0KPiAjIHN1ZG8gcGlwMyBp
bnN0YWxsIC1VIHR1eG1ha2UNCj4gIw0KPiAjIFNlZSBodHRwczovL2RvY3MudHV4bWFrZS5vcmcv
IGZvciBjb21wbGV0ZSBkb2N1bWVudGF0aW9uLg0KPiAjIE9yaWdpbmFsIHR1eG1ha2UgY29tbWFu
ZCB3aXRoIGZyYWdtZW50cyBsaXN0ZWQgYmVsb3cuDQo+IA0KPiAgIHR1eG1ha2UgLS1ydW50aW1l
IHBvZG1hbiAtLXRhcmdldC1hcmNoIHBvd2VycGMgLS10b29sY2hhaW4gZ2NjLTgNCj4gLS1rY29u
ZmlnIHBwYzZ4eF9kZWZjb25maWcNCj4gDQo+IA0KPiAtLQ0KPiBMaW5hcm8gTEtGVA0KPiBodHRw
czovL2xrZnQubGluYXJvLm9yZw0K
