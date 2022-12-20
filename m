Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B942F652578
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 18:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc3G42BCbz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 04:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uqukiPRR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uqukiPRR;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc3F267n8z2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 04:18:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0IvnwH5kBolMcN5K9N28b9P4Kjg6cY+kBaaqjwleu8wVEs5rZM9HAgzZVCIm3LW0/4hz8Q3b8RnmDEcpSlb0vUNwuM2JEQCikHKfg/YK7lmI5m6eUcYY58yLneDnpWNMubqAosRiNA5vlWCncaJCjMGEabTVCkjdxc836vgwFO3sSrWU6VOUouXbYxepCgC1eig1LRXesENTTmIX8u6lIRoUT0AHDbJc5ZjITXlf3up22DvnuDLMRh4TkHSzJHmUzxPCX/jR5f+093yjnKdgCXNRWS47K/iNJ3D76oyI8W8UIr7o7UXXq/i2Uf+B9KrfbMMr+8HGbd0JGHT9IW39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otxPt/JtFceGUwMuwf+WP1EcKShjJH2N0tuuMQQC3L0=;
 b=mIlR0x1sKq/u8fJg7gI5mYqW+3HB2BnxsMYUvB94hj15Vkr85QvOVa6rjcxxTlP1CcvveGWivL0LZkSoQjnR6hTqvfanboxDnPT/sZhXUA3n6Q9Ne4ZKJnpBn1EQqWvZwBFHPsX2J5Ykm9WNL77kuwljv6VR6ItzQCg6dCVc3FayPEbyEmtBr73hwCOOKviSyZh9eXNww7R8fLYps19NnK+hsSB85ZlanDEAB8J1w5cVby2IbpyEo+/F5nVcq++/J3FUO6PrPsTniJEvsw8sLH/rKCvMEvExtfEazE3yhlJMUM+4w94s8tmH1mAD+if6Ungr6M8MJgvpJasCX7KUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otxPt/JtFceGUwMuwf+WP1EcKShjJH2N0tuuMQQC3L0=;
 b=uqukiPRRWoMYvR6Kf+ULnF1Bxx0LXMF+JCidUh4XY98SEq/bNo0eAx1jItnIW0khAke/c/zwJ2OHHeGNal6cW5J+1HzSNitxxy/iXwdBwQQgvcWXqzc8aRnMJ4Cdv9UXBORyxk7XAKRTuA+tlZvnWqJHlb7Y/1yf6LupoLUS0lSSeX+7supHIYemAD/A01JCdZMYq3Mf33yOcWK1VTxmeImUei2hx6ifz1wAq6qX8nDaGhf4xXZnfLBtiP2bVMwFQM/x98cc6ljOh0ODNX5+hIahpjUot+qSMAiWCW2XSwWBgs9W5MKzMejmNlVMLdVaUio6M8AixNUwsbGWJF8wVg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2493.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 17:17:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d%9]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 17:17:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v12 0/6] implement getrandom() in vDSO
Thread-Topic: [PATCH v12 0/6] implement getrandom() in vDSO
Thread-Index: AQHZDltMkslVxQwl0EmQ4kx4EilLGq53EUUA
Date: Tue, 20 Dec 2022 17:17:52 +0000
Message-ID: <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
References: <20221212185347.1286824-1-Jason@zx2c4.com>
In-Reply-To: <20221212185347.1286824-1-Jason@zx2c4.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2493:EE_
x-ms-office365-filtering-correlation-id: 92650f46-a029-41bb-8a08-08dae2ae2076
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7Aq8jpITeHL+N7nWaIunTnJw6+MRpez88UZ/EIGGZ+vvVAk3fo5ScMxEQT05eqW8BU4jwX3OzzhNOevT5nw5fSu7pKuMh3Jl5pNho9gohxA5PSrIROycwSHMJBVlC9cR/J/NvLb5OWDXqNQlDPi+jPJ5d8SNJggDYDsy+x50+A6U5FmAP7DoqRWFhtLa5/8CLOc16kbzQN5sJ6Cw6NURjywE7WieRXu4M+yKP21QjJkVhLhyruzkVPrs/vcv8+9LOUa7FkWS24iizBPcDUKTPS7H57FS3l71DzKiAcR4Y2vW8j/uC3JY41GfnJCSe9VBPytvBt8B8IiSRBIwd8XncXYldWO2x1W4iWuSOmAWunar7Jv9kLn+vmIHlTITEMOPjC9P8tCy2zB+g9HDho0xYXr+E3ZbF48HNcZaTUNlbJD8411nykVB79/maU/VAaaShaeniCuswdo0Zif717rqy51YOYtLMEshUmg8n8oa2jcrM7WGn2QNdeN87Nxayz28dfqS/rqIX4pdxYP5kgvyMzBXapo30Tf1UlAa+tTME/zvfG6i+URJDsD3LiXJmnKwuP/2h5HocHULIhAZlp1kYtNBFnGXwg1oreOn4vrEJPWvGvN4AN6YykY23VxNuEpNzqOT2tNqSno6Je+wAz5wy71xkXKo+gFhEW3YOEUgz6G9YtCM1MrcjpvbCNb/1GUzy0M8xM3I7OR/oOhN0+t551F6MLBVXt58dearAHO2uSuMFZn2xY2odcGq6jq7q9uxIRpl3DhHKUXXetW8ZSS03w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199015)(38070700005)(66574015)(31686004)(83380400001)(6506007)(7416002)(8936002)(5660300002)(478600001)(44832011)(66556008)(6486002)(66946007)(41300700001)(71200400001)(8676002)(76116006)(64756008)(66476007)(91956017)(66446008)(31696002)(2906002)(2616005)(36756003)(38100700002)(4326008)(6512007)(86362001)(26005)(122000001)(316002)(186003)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QnFvZHhsdW9kZ2ptZVFSM2IyLytiZVU0ZTlhcFc1VFEweHVIcHFObnd3UGRN?=
 =?utf-8?B?cFhUS3FWVVRBc2Q4QU5nMmdTMHpXc0dycWVna0ZIVTM3MTlrSFRoc1ByaTZH?=
 =?utf-8?B?dkROR1paRWFyQ1c1dUgxc1J4K3ZFRG41a2U3aU5Ha0dTYjVPV0dyYldXQTFR?=
 =?utf-8?B?ajlkUk1LRS9NTm9WclFzUEsxYzFyQnkyMU12UnlSaWxmTEx6SU1BemcyOS9Q?=
 =?utf-8?B?Q3RVa0YyK3dJWjgyZElJQ2wzVC9zcFBJN1liTmFJWnNMTXdpT0NHdTF2cVBS?=
 =?utf-8?B?QmtRZUhkazk4UWFEU3pXdUFEcnVYY0p4Z1FpeXg4SmVTbFlUbmxjRHphODIw?=
 =?utf-8?B?MzdZbC9YbzRwTmNSOURQaWJvQW1kKzJIaDdhRTM1Q3FncjFBUmUvOXZBSWpN?=
 =?utf-8?B?Q0JwUXdlVEFEZVNDamk4ZklxVkR1UjRlSy9iS0R2N1BlTTBSY3NmNy9IZi91?=
 =?utf-8?B?MkRDUXdXM1lzSVR6SnZmNlVCZGo2ejFOUkE4K0VhWFE0SndOdlExYTdaVER4?=
 =?utf-8?B?M0g1Z3VET3A3YS9HSFpOQTdEeDFwWlNhMU10RlM5alJwMTlPNkJJTCtVL0VX?=
 =?utf-8?B?UXRKOFRPV0ZRSTNydVAvVWFpQjJTVzBvNGxpaE1IM0xHTlRPVWxFbDVqcUwy?=
 =?utf-8?B?cnAzaUxaS0lzR3R6dXdoK3lLTStIUjZ2V2phdW8yV3lmbGhCejJzUFRHcmF3?=
 =?utf-8?B?N0thRmFodXZoTWNOUWExeERmalJoZGwvcUgwTlJWcEZGYVZmR3B3cUJpR1di?=
 =?utf-8?B?d2FLeHpjc05RVWJDdEhLU3NlZzZLTjBnYjVFWFRsN0dRbWxUeXREQlpIQ1FR?=
 =?utf-8?B?VG4yWk9IbEdXSWp2d3R3UWkyWWtwNzUza0U4WVgvZkFIMkpVckVibzlUbVpk?=
 =?utf-8?B?UjUwMGtzRVJFR2ZPVWVXampqU2FJMGg4d1NUb1E3Y1dpU1B5NXhRdVp6SWt0?=
 =?utf-8?B?dmJiRjVpaUE3SHZtbmFsNGQ2VmJFeXBWdkk3eUU4U05tK09yT000YnZyYS9h?=
 =?utf-8?B?cUpOUG9RQVF6NzFLaWxKa2tIa2JGK3RDZVFVUlV3Z3BiUmJYVnljaE0rRjVi?=
 =?utf-8?B?NUdod3FKZDNhbkt6ZFgyZDF3OU84SExQck9PdklCVWQrOFlnbjd6cURCOWpl?=
 =?utf-8?B?WEsyNW84NlhMa0RWV2JDNTM4NnNudUFSN1BmcDNpUGpLS0lDYTRienlNTlFB?=
 =?utf-8?B?SzR2bGFscVVhS2laak5FQXArbUVKMWFBTnc1bXZUMkhYL1hSdVZJd1ZSeUtS?=
 =?utf-8?B?VjJFTXNxZU5vdXJSYUpCVTYrTG9HTjRlbytNQmYvelp5QWl3N2x6NmM3K0Qw?=
 =?utf-8?B?TzN1Q2ZjTDlyY3FNbzhkTjNNVGczTXVOYStYSUw2NGtIUEpNYmRUeklLZ1VD?=
 =?utf-8?B?ZzEwYWVvUUMrbjZlaTFGMW5ZNnJ3M0tmcXV2ejZrOEt2UDI2NzBwdWxVSXhz?=
 =?utf-8?B?cFpUQk40MWVQRU1xVlBkY2FEbnVHRVZqeUVPSWNWbDJ2ZkM3NCtXK1NORkxJ?=
 =?utf-8?B?ZE92eHR1dmVJOVpTYnpvSFFGWWpKemJVbGlaNHVBTFA0KzhHcWwrZnF4dG1k?=
 =?utf-8?B?RlV3TTJoTzI3ZmFOZTFRKy9ocEdUeDloMHJGUzFqbkZKN1BiN1pFS1Vtbk1V?=
 =?utf-8?B?ODIrKzNINitpSnRsL3pCRkxySzJGbElFOUxIRmhHVGpoU0V6UUdYNnR0TFlk?=
 =?utf-8?B?aE1vY3N1OHZBdS9HU01qYWhOVFd1YXNWeGw0MjlVSXRFeHZWY0hTZU5jbDND?=
 =?utf-8?B?ajYzbW9QcTR3dm8vd09uNWVqdEtoMnVxVHNBY1ZITHNibmc0M1ltSWtmN2pN?=
 =?utf-8?B?OTh3RThDUi81R3RUa2VoWExCUXJSc0dkL3FzR2M4dm5lQStlVFp3ampKb093?=
 =?utf-8?B?NjdXakhuR1h2NXNJVVN4L0lOTW84VGZaRVZpb2h4RGI0Z2tjU0lXQ1BOMUtQ?=
 =?utf-8?B?R3loeDc1UzhIbVNPd08veTZEOVhjQ3drQWx5d3lsZVhhL2ZCeXhVSHRIbVlT?=
 =?utf-8?B?Rk1SQ3hPdjZCU3NoZ1UyakwwZkdBc3luVmk0cWdFQXlzQ0JXditNblBjTFUr?=
 =?utf-8?B?TlIyTmhYK1VaQ2RzbXE3YjRpWlJ6MFk3SkFrL0owQURjZFMyS2dVNENlQXZN?=
 =?utf-8?B?WmFkdzFucG9yc3NvNXMvQVIxcklCajJvRmEweDJ3dXpXaVF3SU95NXNSVjNV?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89DF8EDB4C4EAE47AE9E84484A8695E7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92650f46-a029-41bb-8a08-08dae2ae2076
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 17:17:52.2534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAMeb1Uh1HMCbeOfvSls9eX62lX7YMBqz72SaAPEb7P5T8nbQbAi6mAI3L9t764PtxFhwSRewpyRJsDfUcVk/+Zotg01lRMBHTYcTzZMw6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2493
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
Cc: Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Carlos O'Donell <carlos@redhat.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSmFzb24sDQoNCkxlIDEyLzEyLzIwMjIgw6AgMTk6NTMsIEphc29uIEEuIERvbmVuZmVsZCBh
IMOpY3JpdMKgOg0KPiBDaGFuZ2VzIHYxMS0+djEyOg0KPiAtLS0tLS0tLS0tLS0tLS0tDQo+IC0g
SW4gb3JkZXIgdG8gYXZvaWQgbWxvY2soKWluZyBwYWdlcywgYW5kIHRoZSByZWxhdGVkIHJsaW1p
dCBhbmQgZm9yaw0KPiAgICBpbmhlcml0YW5jZSBpc3N1ZXMgdGhlcmUsIEludHJvZHVjZSBWTV9E
Uk9QUEFCTEUgdG8gcHJldmVudCBzd2FwcGluZw0KPiAgICB3aGlsZSBtZWV0aW5nIHRoZSBjYWNo
ZS1saWtlIHJlcXVpcmVtZW50cyBvZiB2RFNPIGdldHJhbmRvbSgpLg0KPiANCj4gICAgVGhpcyBo
YXMgc29tZSB0ZW50aWNsZXMgaW4gbW0vIGFuZCBhcmNoL3g4Ni8gY29kZSwgc28gSSd2ZSBtYXJr
ZWQgdGhlDQo+ICAgIHR3byBwYXRjaGVzIGZvciB0aGF0IGFzIHN0aWxsIFJGQywgd2hpbGUgdGhl
IHJlc3Qgb2YgdGhlIHNlcmllcyBpcyBub3QNCj4gICAgUkZDLg0KPiANCj4gLSBNYW5kYXRlIHRo
YXQgb3BhcXVlIHN0YXRlIGJsb2JzIGRvbid0IHN0cmFkZGxlIHBhZ2UgYm91bmRhcmllcywgc28N
Cj4gICAgdGhhdCBWTV9EUk9QUEFCTEUgY2FuIHdvcmsgb24gcGFnZS1sZXZlbCBncmFudWxhcml0
eSByYXRoZXIgdGhhbg0KPiAgICBhbGxvY2F0aW9uLWxldmVsIGdyYW51bGFyaXR5Lg0KPiANCj4g
LSBBZGQgY29tcGlsZXIgYmFycmllcnMgdG8gdkRTTyBnZXRyYW5kb20oKSB0byBwcmV2ZW50IHRo
ZW9yZXRpY2FsDQo+ICAgIHJlb3JkZXJpbmcgcG90ZW50aWFsLg0KPiANCj4gLSBJbml0aWFsaXpl
IHRoZSB0cmlhbHMgbG9vcCBjb3VudGVyIGluIHRoZSBjaGFjaGEgdGVzdC4NCg0KSSB3b3VsZCBo
YXZlIGxpa2VkIHRvIGdpdmUgaXQgYSB0cnkgb24gcG93ZXJwYywgYnV0IHRoZSBzZXJpZXMgDQpj
b25mbGljdHMuIEkgdHJpZWQgYm90aCBvbiB2Ni4xIGFuZCBvbiBsaW51cy9tYXN0ZXIgZnJvbSBu
b3c6DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCiQgTEFORz0gZ2l0IHJlc2V0IC0taGFyZCBsaW51
cy9tYXN0ZXINCkhFQUQgaXMgbm93IGF0IGI2YmI5Njc2ZjIxNiBNZXJnZSB0YWcgJ202OGtub21t
dS1mb3ItdjYuMicgb2YgDQpnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvZ2VyZy9tNjhrbm9tbXUNCg0KJCBMQU5HPSBnaXQgYW0gLTMgfi9Uw6lsw6ljaGFyZ2Vt
ZW50cy9pbXBsZW1lbnQtZ2V0cmFuZG9tLWluLXZEU08ucGF0Y2gNCkFwcGx5aW5nOiBtbTogYWRk
IFZNX0RST1BQQUJMRSBmb3IgZGVzaWduYXRpbmcgYWx3YXlzIGxhemlseSBmcmVlYWJsZSANCm1h
cHBpbmdzDQpVc2luZyBpbmRleCBpbmZvIHRvIHJlY29uc3RydWN0IGEgYmFzZSB0cmVlLi4uDQpN
CWZzL3Byb2MvdGFza19tbXUuYw0KTQlpbmNsdWRlL2xpbnV4L21tLmgNCk0JaW5jbHVkZS90cmFj
ZS9ldmVudHMvbW1mbGFncy5oDQpNCW1tL0tjb25maWcNCk0JbW0vbWVtb3J5LmMNCk0JbW0vbXBy
b3RlY3QuYw0KTQltbS9ybWFwLmMNCkZhbGxpbmcgYmFjayB0byBwYXRjaGluZyBiYXNlIGFuZCAz
LXdheSBtZXJnZS4uLg0KQXV0by1tZXJnaW5nIG1tL3JtYXAuYw0KQ09ORkxJQ1QgKGNvbnRlbnQp
OiBNZXJnZSBjb25mbGljdCBpbiBtbS9ybWFwLmMNCkF1dG8tbWVyZ2luZyBtbS9tcHJvdGVjdC5j
DQpBdXRvLW1lcmdpbmcgbW0vbWVtb3J5LmMNCkF1dG8tbWVyZ2luZyBtbS9LY29uZmlnDQpBdXRv
LW1lcmdpbmcgaW5jbHVkZS90cmFjZS9ldmVudHMvbW1mbGFncy5oDQpBdXRvLW1lcmdpbmcgaW5j
bHVkZS9saW51eC9tbS5oDQpBdXRvLW1lcmdpbmcgZnMvcHJvYy90YXNrX21tdS5jDQplcnJvcjog
RmFpbGVkIHRvIG1lcmdlIGluIHRoZSBjaGFuZ2VzLg0KUGF0Y2ggZmFpbGVkIGF0IDAwMDEgbW06
IGFkZCBWTV9EUk9QUEFCTEUgZm9yIGRlc2lnbmF0aW5nIGFsd2F5cyBsYXppbHkgDQpmcmVlYWJs
ZSBtYXBwaW5ncw0KaGludDogVXNlICdnaXQgYW0gLS1zaG93LWN1cnJlbnQtcGF0Y2g9ZGlmZicg
dG8gc2VlIHRoZSBmYWlsZWQgcGF0Y2gNCldoZW4geW91IGhhdmUgcmVzb2x2ZWQgdGhpcyBwcm9i
bGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4NCklmIHlvdSBwcmVmZXIgdG8gc2tpcCB0aGlz
IHBhdGNoLCBydW4gImdpdCBhbSAtLXNraXAiIGluc3RlYWQuDQpUbyByZXN0b3JlIHRoZSBvcmln
aW5hbCBicmFuY2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLg0KW2No
bGVyb3lAUE8yMDMzNSBsaW51eC1wb3dlcnBjXSQgZ2l0IGRpZmYNCmRpZmYgLS1jYyBtbS9ybWFw
LmMNCmluZGV4IGI2MTY4NzBhMDliZSw5ZmFiZDdhZmZkM2EuLjAwMDAwMDAwMDAwMA0KLS0tIGEv
bW0vcm1hcC5jDQorKysgYi9tbS9ybWFwLmMNCkBAQCAtMTI5MSwxNiAtMTI1NiwxMyArMTI5MSwy
MiBAQEAgdm9pZCBwYWdlX2FkZF9hbm9uX3JtYXAoc3RydWN0IHBhZ2UgKnBhDQogICB2b2lkIHBh
Z2VfYWRkX25ld19hbm9uX3JtYXAoc3RydWN0IHBhZ2UgKnBhZ2UsDQogICAgICAgICBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQ0KICAgew0KICAtICAg
ICAgY29uc3QgYm9vbCBjb21wb3VuZCA9IFBhZ2VDb21wb3VuZChwYWdlKTsNCiAgLSAgICAgIGlu
dCBuciA9IGNvbXBvdW5kID8gdGhwX25yX3BhZ2VzKHBhZ2UpIDogMTsNCiAgKyAgICAgIGludCBu
cjsNCg0KICAgICAgICAgVk1fQlVHX09OX1ZNQShhZGRyZXNzIDwgdm1hLT52bV9zdGFydCB8fCBh
ZGRyZXNzID49IA0Kdm1hLT52bV9lbmQsIHZtYSk7DQorKzw8PDw8PDwgSEVBRA0KICArICAgICAg
X19TZXRQYWdlU3dhcEJhY2tlZChwYWdlKTsNCiAgKw0KICArICAgICAgaWYgKGxpa2VseSghUGFn
ZUNvbXBvdW5kKHBhZ2UpKSkgew0KICArICAgICAgICAgICAgICAvKiBpbmNyZW1lbnQgY291bnQg
KHN0YXJ0cyBhdCAtMSkgKi8NCiAgKyAgICAgICAgICAgICAgYXRvbWljX3NldCgmcGFnZS0+X21h
cGNvdW50LCAwKTsNCiAgKyAgICAgICAgICAgICAgbnIgPSAxOw0KICArICAgICAgfSBlbHNlIHsN
CisrPT09PT09PQ0KKyAgICAgICBpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fRFJPUFBBQkxFKSkN
CisgICAgICAgICAgICAgICBfX1NldFBhZ2VTd2FwQmFja2VkKHBhZ2UpOw0KKyAgICAgICBpZiAo
Y29tcG91bmQpIHsNCisrPj4+Pj4+PiBtbTogYWRkIFZNX0RST1BQQUJMRSBmb3IgZGVzaWduYXRp
bmcgYWx3YXlzIGxhemlseSBmcmVlYWJsZSANCm1hcHBpbmdzDQogICAgICAgICAgICAgICAgIFZN
X0JVR19PTl9QQUdFKCFQYWdlVHJhbnNIdWdlKHBhZ2UpLCBwYWdlKTsNCiAgICAgICAgICAgICAg
ICAgLyogaW5jcmVtZW50IGNvdW50IChzdGFydHMgYXQgLTEpICovDQogICAgICAgICAgICAgICAg
IGF0b21pY19zZXQoY29tcG91bmRfbWFwY291bnRfcHRyKHBhZ2UpLCAwKTsNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KDQokIExBTkc9IGdpdCByZXNldCAtLWhhcmQgdjYuMQ0KVXBkYXRpbmcgZmlsZXM6IDEw
MCUgKDEyNjM0LzEyNjM0KSwgZG9uZS4NCkhFQUQgaXMgbm93IGF0IDgzMGIzYzY4YzFmYiBMaW51
eCA2LjENCg0KJCBMQU5HPSBnaXQgYW0gLTMgfi9Uw6lsw6ljaGFyZ2VtZW50cy9pbXBsZW1lbnQt
Z2V0cmFuZG9tLWluLXZEU08ucGF0Y2gNCkFwcGx5aW5nOiBtbTogYWRkIFZNX0RST1BQQUJMRSBm
b3IgZGVzaWduYXRpbmcgYWx3YXlzIGxhemlseSBmcmVlYWJsZSANCm1hcHBpbmdzDQpBcHBseWlu
ZzogeDg2OiBtbTogU2tpcCBmYXVsdGluZyBpbnN0cnVjdGlvbiBmb3IgVk1fRFJPUFBBQkxFIGZh
dWx0cw0KQXBwbHlpbmc6IHJhbmRvbTogYWRkIHZnZXRyYW5kb21fYWxsb2MoKSBzeXNjYWxsDQpV
c2luZyBpbmRleCBpbmZvIHRvIHJlY29uc3RydWN0IGEgYmFzZSB0cmVlLi4uDQpNCU1BSU5UQUlO
RVJTDQpNCWRyaXZlcnMvY2hhci9yYW5kb20uYw0KRmFsbGluZyBiYWNrIHRvIHBhdGNoaW5nIGJh
c2UgYW5kIDMtd2F5IG1lcmdlLi4uDQpBdXRvLW1lcmdpbmcgZHJpdmVycy9jaGFyL3JhbmRvbS5j
DQpBdXRvLW1lcmdpbmcgTUFJTlRBSU5FUlMNCkFwcGx5aW5nOiBhcmNoOiBhbGxvY2F0ZSB2Z2V0
cmFuZG9tX2FsbG9jKCkgc3lzY2FsbCBudW1iZXINCkFwcGx5aW5nOiByYW5kb206IGludHJvZHVj
ZSBnZW5lcmljIHZEU08gZ2V0cmFuZG9tKCkgaW1wbGVtZW50YXRpb24NClVzaW5nIGluZGV4IGlu
Zm8gdG8gcmVjb25zdHJ1Y3QgYSBiYXNlIHRyZWUuLi4NCk0JTUFJTlRBSU5FUlMNCk0JZHJpdmVy
cy9jaGFyL3JhbmRvbS5jDQpGYWxsaW5nIGJhY2sgdG8gcGF0Y2hpbmcgYmFzZSBhbmQgMy13YXkg
bWVyZ2UuLi4NCkF1dG8tbWVyZ2luZyBkcml2ZXJzL2NoYXIvcmFuZG9tLmMNCkNPTkZMSUNUIChj
b250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9jaGFyL3JhbmRvbS5jDQpBdXRvLW1l
cmdpbmcgTUFJTlRBSU5FUlMNCmVycm9yOiBGYWlsZWQgdG8gbWVyZ2UgaW4gdGhlIGNoYW5nZXMu
DQpQYXRjaCBmYWlsZWQgYXQgMDAwNSByYW5kb206IGludHJvZHVjZSBnZW5lcmljIHZEU08gZ2V0
cmFuZG9tKCkgDQppbXBsZW1lbnRhdGlvbg0KaGludDogVXNlICdnaXQgYW0gLS1zaG93LWN1cnJl
bnQtcGF0Y2g9ZGlmZicgdG8gc2VlIHRoZSBmYWlsZWQgcGF0Y2gNCldoZW4geW91IGhhdmUgcmVz
b2x2ZWQgdGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4NCklmIHlvdSBwcmVm
ZXIgdG8gc2tpcCB0aGlzIHBhdGNoLCBydW4gImdpdCBhbSAtLXNraXAiIGluc3RlYWQuDQpUbyBy
ZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFuY2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFt
IC0tYWJvcnQiLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpDaHJpc3RvcGhlDQo=
