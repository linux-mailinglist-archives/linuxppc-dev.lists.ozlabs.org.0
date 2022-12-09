Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F86488A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 19:53:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTKsm5YcXz3bjQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 05:53:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lCove4uA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.77; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lCove4uA;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2077.outbound.protection.outlook.com [40.107.12.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTKrm39VZz3bWZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Dec 2022 05:52:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpCV/q0LzSv/qXVocKCFuv7syq9U8B3Xy4SJPRdI+C2YOM/zI4jg3u6Yu1WHh7GupPBp0ecpD/vfYQwXZvFl5/K2Wj2sTv7RA1m2y6DRh3nrRX+kx/R/v1LpXvIpuXO51UKo8uaGkMgwfmh9FViTkylfBukkTdOcFv8lN/Hej2hYXEZ8h6Ql1nfxskExGQCldJVXWl0tQ6nt4jfHoz94pA6/Z29viyMGVOH5aNkhbfIgqp1H2OkNnULCICqtF2+xK/PVwM/Qq0JU4eGiClsGG6lnPNRw4T5vv3SIAtSwUawJtf1yzfobK+eDmMTH5P4FUwBCzD9mJb3fKZZzwpEX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAB793b5R8SN8AIeicwKPz2jCIKNAwBdAAFauc4U0RY=;
 b=LUge0crLKhk6pMPKEe7m2lT+JRLwpoVy2lK2mblatAn4kc5QV0K7C9xoE1jHW1y/Nkn+i466O8wWOFjXJrFNKYfrYk8sv8wFS7iV7JBzjkEKoiPgAzyMHN9PpM4a+0Pm8sJMCJQLx/BBfTSBEDFhkoXBpPXMl64lTMTJoweuHiAJ3Rsb6QQGOc+/mWDcfDANFEA1x5/szyTCebku81hOGb6GTv7uP0RLJ4umq+dxK3yj4ESLYMqEHcBHJTh6jy0nOp0tE6wVz2lI8FBTVrr4fcD7ae/jFI0t+wDsDH7qsCBJnhZd5/i0jUQ5sJgDM2Y1ATpbLaEsN1TnfWx8fW1wGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAB793b5R8SN8AIeicwKPz2jCIKNAwBdAAFauc4U0RY=;
 b=lCove4uApN9BpYtnZvCTQkRh/F4bIeuG76bpv3ZHUBf8uxhv7zQBGYmdcdP6V6YBVGwMZmXMX4ttMyP/7RdElmxNCwj+jVniztGiQ3el9JXcd/oVQkbnzxBynUzaa5IvVUI/Y41Gh4mHj6VeAeyMQ2OjMJ0gqGs0skyiOpr4kpepetXANl86cR08Q/3+y02VLOCSS39CPr0azJlc4gMdfudfftWHuWFm6pJ0c2fwZsgvj4xTXZvAwq4N2jhPhFWRmD01fZ7nXJ6dSgjZN58qf9iz+b47fISvR1t4vTY2XnF4ZtFYJ6GERbDlQY0z6hbXybmF17T7iY5zW2h4xnq5rg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3327.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 18:51:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 18:51:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
Thread-Topic: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
Thread-Index: AQHYvijHFpAxbykXEk2mPFHnW6Ku4a5mHrWAgABdjwCAAAYMgA==
Date: Fri, 9 Dec 2022 18:51:59 +0000
Message-ID: <7ddc326c-0c55-4901-16df-3e4e376e2570@csgroup.eu>
References: <20220901171252.2148348-1-song@kernel.org>
 <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
 <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
In-Reply-To:  <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3327:EE_
x-ms-office365-filtering-correlation-id: e8de3fec-17e4-4dde-6563-08dada16741e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TsX/0uaK1tWUgKnj7rKu110xNZXgS93bF7jppQ+0y+ckKc9dd/ldDiZw8p6ACc/7A8RKRDbk3A97ZQnq+GK4iEKgqnZr3tXIw1nObB+/uQ+RlZiqVs2trgR6qudGv6OGsF1T6UvGC3akdPUtODIWqVNTNnqWj4cZXtnAOfmfrePfqF5N7W4LuSZhMOh0c5+bcLRRw3RGe9UXrMQKnF+UB/96dMaPpmYnr/yyV/dpwHsL2GwqkHKr26YrmaHziEt8UPDyvwzvG9tezKwWUvo2/oSpnBYd0CyARN0sBtLrOmu+9d5my/3UxRhZwmX9aE/W3ZNH2mcBaP8pfZKTJZwuOCWI9YGj6QAdDHwTW39rkdjIc5lEkG/6byr5cUWm0mELicgNQ+hjzBFs0mdrQRAu9KcKGXdZe85hH2K1DYhWrTzmraBDBtDQvzfLdOqgzf99zVq1spclfUZctzpxXWBoIgl9ZluRaoQ9zmXLqjI4KcJWOtdQ4KqrubNPWEEHPAqc51xxmAJla6rTLDxYSktDfocwg14AKm2SKD/K1dXjvLeTaD12aS45MQ8bPQRETfNHvMRxT7tF6X2FCHDGOmk0hJ+zVh5iMPnPH6wA/ndbLsnegIbEBCoXg1qfIV57FDLRwfP8fL7edOz3P5cGktGjqQnwyQ7r/0qmIhOpZ6yhJTAabEtkdliqyjkfQkQ9c9wCUXjPMsMERFk3NwZ/xtYHeUXKc/pb7sRXsZlXHCU4mR0aGGRcNtf/0/ZXU7p8zDjisG2EhQK1BrDnwaV/4XkmdGhEG+YBhjXFN6D8pnXDlx4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(66899015)(31686004)(122000001)(2906002)(38100700002)(64756008)(66556008)(66946007)(66476007)(4326008)(8676002)(66446008)(41300700001)(36756003)(76116006)(86362001)(31696002)(2616005)(6512007)(316002)(38070700005)(26005)(83380400001)(5660300002)(66574015)(186003)(7416002)(91956017)(44832011)(966005)(478600001)(110136005)(8936002)(54906003)(6486002)(53546011)(6506007)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OUxzN0M0NUdPbDg5V2labWgxdkx1YTRaNjNMc1V0MVZ1NmJLNkdYQWNkeXh5?=
 =?utf-8?B?YXp6RVdQazBEMnpCclgwSWF4U1AwcG1nTXlEVkZIckxhT0ZCMHJtblUwWXAz?=
 =?utf-8?B?ZTROcDQ3Z1JpVHJJSGN0Y0dVdjM5UkxuRE13Mk9iS1k5OE1lMFQzK3MxZUpa?=
 =?utf-8?B?a0lRQ1d1WFFDbkdkZGlkZUlKakRXRUI4Uml0RDk4YU9ET0ZGYW9DNG1iQ00w?=
 =?utf-8?B?UkttUzNxZ2xwL01Hc0tNbHhyMkpHM05FeExsZlNsMHhWMjZzM2JoSCt4TFZP?=
 =?utf-8?B?R09jTmNoVGdkK1BLZHZNeEszeWUzakNjUjBVVW9MaFZWcWVrOGtPTGNIQ01l?=
 =?utf-8?B?ZlN0bVVoK292U0w1Yk4xLzFSMWV3OHRZek4veVhWeFlSSDY0SDFQcEM2S2xC?=
 =?utf-8?B?NTh3U2V5UFN4U1d4OFIyQ2N3cFY4b2xQTGt0ODZyci96TTJ3Rm4rWVdyZjZC?=
 =?utf-8?B?bmlmck1EYUxXcWpHQ2Z2RklBL2dwTmsrY00rUm8rZm0wTjhpR3pWY0RTZGtp?=
 =?utf-8?B?WE42aG9ueUhteWx6SG9vTzRXOUFpeW9jQjFZdFhFNHNMekpHcXZ4T0NUYjhZ?=
 =?utf-8?B?eCs4WGwzbXRYeEZWTXpDdnk2NElCeTdjU3BLQ0lrOWlVOGJMOTIzSGVYUFBZ?=
 =?utf-8?B?WENPTGZHQytDMlVkWHhXZlFsa25mdTF4N2JpTUt1RHJJWWRBUzdjWjVHS2tF?=
 =?utf-8?B?aldza2hLRkErR0hQQUVVcDJ4VnlpblVTcHFhZ2VLTnVsN0dZUHdqYlMvWEJM?=
 =?utf-8?B?MlZkSVp6OWVrRG9BcjBkM0ZZRHRUZHQ0cWZoRS82QTVTT3E0MmZVZk4wbUNa?=
 =?utf-8?B?c3kwL0lSN2Rtbi91N3pubjdFNzR6dzRTMG9IVno0d3ZDa0R3RnludHBIN0Ir?=
 =?utf-8?B?M3NmUlhSazE1K3pqTTRFZFhOaXB4eUp5MTJtSEQ1YzVnWXVrM0d6SjR1M25D?=
 =?utf-8?B?SFF5NmN5Z0pHdFdvY3A3MWx6NG9CRW1HYTNsb0VjRjFWbll5YWVpRHNpcHc3?=
 =?utf-8?B?T1RjQ0VlWDlRNDBoRmppMTR4TE1NOEg0T1Bjazd3ZjJqMzNRTDdVNzVKYk0x?=
 =?utf-8?B?M0V1eEdWaG1vek1JZlBDRmFXNS9IcVlBMGFQck5lZEkwbmxMNVRzQU82VEVK?=
 =?utf-8?B?QVJYcjZUbkZ3NUQ2Qjc5aVNoeWxFNTZwdFVZY3Q4VzhTSXczSEtrOG94MjB3?=
 =?utf-8?B?eVc3YXpNWmluT09HYkhEcnhIWkJMb1BzUVVsUEx3elpqVjEwYS9HcFJ3Um81?=
 =?utf-8?B?T3VqTlZYeHY3a2o4ckRGa0xmekxvOWRQNS85TTY0bHVpRk9TeTR4cXhJeVVK?=
 =?utf-8?B?eWtuUW9hTlhZdlpVQVN2S3RmV1Rqam5kUFByODNGaUh3VWJPSXE2ZFlCQWc0?=
 =?utf-8?B?UWJkTnUwUHVYc3FlUUR1aWQ2c0RjajB0aStIQ2NKa2V2ZTlpOTJrUW9tckFh?=
 =?utf-8?B?TlFzaGVVMjhVekY1TThPSng1RjU2b3JTNnpIdjcyQmdldmVBM25HZHRLaUlw?=
 =?utf-8?B?c2Z3dGczWXJJaVczQnc2VTlqVXhESmx2S2RlUDRyZmZtZEJTS2lXdEVXWnNn?=
 =?utf-8?B?Z2UxVDhRWS9sRW1Ia0I3YTg2dUVFUi9NWGYwa0pJR1RuZjl6QXV4VmIwdWth?=
 =?utf-8?B?Q2FxcjhWOHNlY3c3TWRmSktOcXBzRUQ3THlNaElXenlRWll0cXB6RklTNklI?=
 =?utf-8?B?dTA2cStyKzRrQXB1MjFWNUs0U3BxSzZ4MVU3aEhrV1VVUnc3dSt1RFF3QW53?=
 =?utf-8?B?OVRicVdFV1VYRjNtOVY0OUozV2MvdUhKT21DOFFreXhLaTIwSVlFdEt4S20z?=
 =?utf-8?B?SytlSFU0UFFYQTA1c0lEUm01d3ZwRExLbmgrNkYxNUNqeWZQSzRETHRJMDZT?=
 =?utf-8?B?MU4rV2pKTEpubHNWUmdNUUdtZnJJK2xOUWkyYjhUNnJtWG1jZ2tIYVl4WUEz?=
 =?utf-8?B?cmFTbllRSkpUOXFsTUpmY242K2dXajZFUG5uU0FJY3NxcTMxMGFxckFScXNu?=
 =?utf-8?B?TDQwdFg4aTZ6QXFhY2RTM0tsNXVyQmFod3pKZEVLSzJkSDFtc0pMcWR2SEdm?=
 =?utf-8?B?NlhzVzQ1cjN5N0FhQlVWdjlOS0R3VFoxTXovMzh3WWhkNlNvVkg3elpmRVpx?=
 =?utf-8?B?anlIZVorRUJyLzkrQkJoQkl5K1FsSWh3bFkxWnkwOWFGMXZ6UzN4QjhVZURV?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06BC0DD543B3554DA620F79D6861D16A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8de3fec-17e4-4dde-6563-08dada16741e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 18:51:59.8475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oOWxXRK7dvy1bkzqWwaEKX0695GnAdbq7SB3JsgSs9oxkx4/HmyrBDCftsp2Un2lBOXxwQC4XAoEmNJylU/lKR4JjtIXqonU/Lm5/Z09ffI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3327
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
Cc: "pmladek@suse.com" <pmladek@suse.com>, "x86@kernel.org" <x86@kernel.org>, "jikos@kernel.org" <jikos@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joe.lawrence@redhat.com" <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjIgw6AgMTk6MzAsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgRGVjIDksIDIwMjIgYXQgNDo1NSBBTSBNaXJvc2xhdiBCZW5lcyA8bWJlbmVzQHN1c2UuY3o+
IHdyb3RlOg0KPj4NCj4+IEhpLA0KPj4NCj4+IGZpcnN0IHRoYW5rIHlvdSBmb3IgdGFraW5nIG92
ZXIgYW5kIEkgYWxzbyBhcHBvbG9naXplIGZvciBub3QgcmVwbHlpbmcNCj4+IG11Y2ggc29vbmVy
Lg0KPj4NCj4+IE9uIFRodSwgMSBTZXAgMjAyMiwgU29uZyBMaXUgd3JvdGU6DQo+Pg0KPj4+IEZy
b206IE1pcm9zbGF2IEJlbmVzIDxtYmVuZXNAc3VzZS5jej4NCj4+Pg0KPj4+IEpvc2ggcmVwb3J0
ZWQgYSBidWc6DQo+Pj4NCj4+PiAgICBXaGVuIHRoZSBvYmplY3QgdG8gYmUgcGF0Y2hlZCBpcyBh
IG1vZHVsZSwgYW5kIHRoYXQgbW9kdWxlIGlzDQo+Pj4gICAgcm1tb2QnZWQgYW5kIHJlbG9hZGVk
LCBpdCBmYWlscyB0byBsb2FkIHdpdGg6DQo+Pj4NCj4+PiAgICBtb2R1bGU6IHg4Ni9tb2R1bGVz
OiBTa2lwcGluZyBpbnZhbGlkIHJlbG9jYXRpb24gdGFyZ2V0LCBleGlzdGluZyB2YWx1ZSBpcyBu
b256ZXJvIGZvciB0eXBlIDIsIGxvYyAwMDAwMDAwMGJhMDMwMmU5LCB2YWwgZmZmZmZmZmZhMDNl
MjkzYw0KPj4+ICAgIGxpdmVwYXRjaDogZmFpbGVkIHRvIGluaXRpYWxpemUgcGF0Y2ggJ2xpdmVw
YXRjaF9uZnNkJyBmb3IgbW9kdWxlICduZnNkJyAoLTgpDQo+Pj4gICAgbGl2ZXBhdGNoOiBwYXRj
aCAnbGl2ZXBhdGNoX25mc2QnIGZhaWxlZCBmb3IgbW9kdWxlICduZnNkJywgcmVmdXNpbmcgdG8g
bG9hZCBtb2R1bGUgJ25mc2QnDQo+Pj4NCj4+PiAgICBUaGUgbGl2ZXBhdGNoIG1vZHVsZSBoYXMg
YSByZWxvY2F0aW9uIHdoaWNoIHJlZmVyZW5jZXMgYSBzeW1ib2wNCj4+PiAgICBpbiB0aGUgX3By
ZXZpb3VzXyBsb2FkaW5nIG9mIG5mc2QuIFdoZW4gYXBwbHlfcmVsb2NhdGVfYWRkKCkNCj4+PiAg
ICB0cmllcyB0byByZXBsYWNlIHRoZSBvbGQgcmVsb2NhdGlvbiB3aXRoIGEgbmV3IG9uZSwgaXQg
c2VlcyB0aGF0DQo+Pj4gICAgdGhlIHByZXZpb3VzIG9uZSBpcyBub256ZXJvIGFuZCBpdCBlcnJv
cnMgb3V0Lg0KPj4+DQo+Pj4gICAgT24gcHBjNjRsZSwgd2UgaGF2ZSBhIHNpbWlsYXIgaXNzdWU6
DQo+Pj4NCj4+PiAgICBtb2R1bGVfNjQ6IGxpdmVwYXRjaF9uZnNkOiBFeHBlY3RlZCBub3AgYWZ0
ZXIgY2FsbCwgZ290IGU4NDEwMDE4IGF0IGVfc2hvdysweDYwLzB4NTQ4IFtsaXZlcGF0Y2hfbmZz
ZF0NCj4+PiAgICBsaXZlcGF0Y2g6IGZhaWxlZCB0byBpbml0aWFsaXplIHBhdGNoICdsaXZlcGF0
Y2hfbmZzZCcgZm9yIG1vZHVsZSAnbmZzZCcgKC04KQ0KPj4+ICAgIGxpdmVwYXRjaDogcGF0Y2gg
J2xpdmVwYXRjaF9uZnNkJyBmYWlsZWQgZm9yIG1vZHVsZSAnbmZzZCcsIHJlZnVzaW5nIHRvIGxv
YWQgbW9kdWxlICduZnNkJw0KPj4+DQo+Pj4gSGUgYWxzbyBwcm9wb3NlZCB0aHJlZSBkaWZmZXJl
bnQgc29sdXRpb25zLiBXZSBjb3VsZCByZW1vdmUgdGhlIGVycm9yDQo+Pj4gY2hlY2sgaW4gYXBw
bHlfcmVsb2NhdGVfYWRkKCkgaW50cm9kdWNlZCBieSBjb21taXQgZWRhOWNlYzRjOWExDQo+Pj4g
KCJ4ODYvbW9kdWxlOiBEZXRlY3QgYW5kIHNraXAgaW52YWxpZCByZWxvY2F0aW9ucyIpLiBIb3dl
dmVyIHRoZSBjaGVjaw0KPj4+IGlzIHVzZWZ1bCBmb3IgZGV0ZWN0aW5nIGNvcnJ1cHRlZCBtb2R1
bGVzLg0KPj4+DQo+Pj4gV2UgY291bGQgYWxzbyBkZW55IHRoZSBwYXRjaGVkIG1vZHVsZXMgdG8g
YmUgcmVtb3ZlZC4gSWYgaXQgcHJvdmVkIHRvIGJlDQo+Pj4gYSBtYWpvciBkcmF3YmFjayBmb3Ig
dXNlcnMsIHdlIGNvdWxkIHN0aWxsIGltcGxlbWVudCBhIGRpZmZlcmVudA0KPj4+IGFwcHJvYWNo
LiBUaGUgc29sdXRpb24gd291bGQgYWxzbyBjb21wbGljYXRlIHRoZSBleGlzdGluZyBjb2RlIGEg
bG90Lg0KPj4+DQo+Pj4gV2UgdGh1cyBkZWNpZGVkIHRvIHJldmVyc2UgdGhlIHJlbG9jYXRpb24g
cGF0Y2hpbmcgKGNsZWFyIGFsbCByZWxvY2F0aW9uDQo+Pj4gdGFyZ2V0cyBvbiB4ODZfNjQpLiBU
aGUgc29sdXRpb24gaXMgbm90DQo+Pj4gdW5pdmVyc2FsIGFuZCBpcyB0b28gbXVjaCBhcmNoLXNw
ZWNpZmljLCBidXQgaXQgbWF5IHByb3ZlIHRvIGJlIHNpbXBsZXINCj4+PiBpbiB0aGUgZW5kLg0K
Pj4+DQo+Pj4gUmVwb3J0ZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29t
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1pcm9zbGF2IEJlbmVzIDxtYmVuZXNAc3VzZS5jej4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPg0KPj4NCj4+IFBldHIg
aGFzIGNvbW1lbnRlZCBvbiB0aGUgY29kZSBhc3BlY3RzLiBJIHdpbGwganVzdCBhZGQgdGhhdCBz
MzkweCB3YXMgbm90DQo+PiBkZWFsdCB3aXRoIGF0IHRoZSB0aW1lIGJlY2F1c2UgdGhlcmUgd2Fz
IG5vIGxpdmUgcGF0Y2hpbmcgc3VwcG9ydCBmb3INCj4+IHMzOTB4IGJhY2sgdGhlbiBpZiBJIHJl
bWVtYmVyIGNvcnJlY3RseSBhbmQgbXkgbm90ZXMgZG8gbm90IGxpZS4gVGhlIHNhbWUNCj4+IGFw
cGxpZXMgdG8gcG93ZXJwYzMyLiBJIHRoaW5rIHRoYXQgYm90aCBzaG91bGQgYmUgZml4ZWQgYXMg
d2VsbCB3aXRoIHRoaXMNCj4+IHBhdGNoLiBJdCBtaWdodCBhbHNvIGhlbHAgdG8gY2xlYW4gdXAg
dGhlIGlmZGVmZmVyeSBpbiB0aGUgcGF0Y2ggYSBiaXQuDQo+IA0KPiBJIGRvbid0IGhhdmUgdGVz
dCBlbnZpcm9ubWVudHMgZm9yIHMzOTAgYW5kIHBvd2VycGMsIHNvIEkgcmVhbGx5IGRvbid0IGtu
b3cNCj4gd2hldGhlciBJIGFtIGRvaW5nIHNvbWV0aGluZyBzYW5lIGZvciB0aGVtLg0KPiANCj4g
V291bGQgeW91IGhhdmUgdGltZSB0byBmaW5pc2ggdGhlc2UgcGFydHM/IChPciBtYXliZSB0aGUg
d2hvbGUgcGF0Y2guLikNCg0KU2V0dGluZyB1cCBhIHBvd2VycGMgdGVzdCBlbnZpcm9ubWVudCBp
cyBmYWlybHkgZWFzeSB3aXRoIFFFTVUuDQoNClNvbWUgaW5mb3JtYXRpb24gYmVsb3c6DQotIGh0
dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy93aWtpL3dpa2kNCi0gaHR0cHM6Ly93aWtpLnFlbXUu
b3JnL0RvY3VtZW50YXRpb24vUGxhdGZvcm1zL1Bvd2VyUEMNCg0KQ2hyaXN0b3BoZQ0K
