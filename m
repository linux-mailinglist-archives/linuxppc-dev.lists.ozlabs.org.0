Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2B61F3BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:52:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5WNj60Jcz3cMl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GhuxxS9t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.75; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GhuxxS9t;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120075.outbound.protection.outlook.com [40.107.12.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5WMh2fKVz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:51:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSLkzAOb63nShzKUZW0FQQ5M2HFth1JH5XSxrDdy7SYLqqDpexR8GEcS24B0KoivldcQsy7c6J0ZiDXKZ/PiUE+bodtK5sBw/61TSub9yzyMzb9lArL7d4kPGqlixcDEkEYxMby6G87fKLioBcIJaK9NSZE0lvjvqwLI8EjURv9cLpxN0hWOKM9NyQmGBw7L0X3VlJpNXk/9x5x8ZbRb4RJq7xydW6vUlW5wOgZXijJLFaF+jTpm8+Kfvo1QtDfZIcEQTDY6Yd81xaGVZ8kwNzRKPq61fJs39Ujdk4BeuDpPqkye/eZ/O6lLqlFZs76049rIevIc8ZJBxDu2w4W7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K65NpDby+aoPZ8BK2tB/k8d2HKoIkYnC4Mdg8kBW96w=;
 b=ZoNBDjO7AmESZ/D7BvouTICynXm+nJXxmmkpmbApYoaBdCuif4LOm5i12vMEyxGuO9svC71jzxLVi9A0Mnb4BUQcSC+y8sZlJs0P5rzppo6EglN32IsS4dVES3i4wGPTav0Ktwp4/bCuWcJ+WyqFOxu89j3qS1z0xO7MdS1MKH5PezkqtkUXRwiJKumj/JBpcXVv0RfoFk6UfQtsVaj2f2sZZJYx378tw4KNX4MHyX58HNIRRCl+zRZ8lH5X+eB3yTGlaaNxrhcZEwSOnpSSXINx9zVsU7qQJ49Wz45/JAoSANf7gj7Y2z7QAK/s/LLZSsy3/+Td+2kBbJOKVbViFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K65NpDby+aoPZ8BK2tB/k8d2HKoIkYnC4Mdg8kBW96w=;
 b=GhuxxS9tfrveWiFgcXVPtGtYZKf3IlTmovoVbrt6mHHBZYSCJcWZMBezwiCtbhm1XDx3SlVzRmu2f3nGrtolZ5+p8lThBohAj3E3wJ/EAS4jIbPEsjAkY2/OcKQOUct4qokE/kJKGjQq4/S8QaCfhZ4eA5KBMNOymlmG+Z+D97em0nUOqp5SqO3UMQ4FbZuna6oaB9aQDt/+ejs7LE68M7t7im6xkFCVQWgu//88g4rUMJi1bht4f0b++QkDGsWTA3abHeE/+sjOLm4fSQb8TCclaJBzNnI0aEKmNWDBL+H3qJwMNaDbEJLbSi5V64xTG9gzCKVvgOf0IQxzSOB+Lw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2352.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 12:51:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 12:51:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 05/19] powerpc/32: Use load and store multiple in GPR
 save/restore macros
Thread-Topic: [RFC PATCH 05/19] powerpc/32: Use load and store multiple in GPR
 save/restore macros
Thread-Index: AQHY7O4KXDpbnYhdrEu9+70VlABowa4s4iQAgAaRlACAAAHFAA==
Date: Mon, 7 Nov 2022 12:51:38 +0000
Message-ID: <551d6b5d-08fa-64db-e374-773cd4dc7b4e@csgroup.eu>
References: <20221031055440.3594315-1-npiggin@gmail.com>
 <20221031055440.3594315-6-npiggin@gmail.com>
 <6dd19b06-f967-7643-0857-88c92bf1ea79@csgroup.eu>
 <CO62NTZ4AV1U.NQ68OKKW9L6E@bobo>
In-Reply-To: <CO62NTZ4AV1U.NQ68OKKW9L6E@bobo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2352:EE_
x-ms-office365-filtering-correlation-id: 7fb8e20a-1fbf-480f-4451-08dac0becf79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  r80QsoUp8xa6GgmBPyegUvQqxmGa+sj6yyL/Es4677UGRnM7sR6Weh6CCVL6pk3GGoX7bbvWE49i2Vpm9KgZwYXsxl9Tk0TujQvrg7YYopFVixOeYpkQGRlUz1HRnh4tY1Uga0CfhcbawNuqcx/ofGllTZnxmkSH3aCSDXu7cgpxT+MwDr1In4ACloOsZaap1ELgLY3HsaUPIDo3n6USU6xVawY4pRR3R3/XSHno47C61BEkqiSMuDyxABysxxVmHO1/Ny7y+hfCutrn9AMVYuoDjv53CxoolbuLh+UMdR155ejMjqG+NqnKI7xQJ049odgcU7UZ30hNtfGwY6crI+rZyhOim9gWz2XutUhbbJQybR985MoATMow+8B7ZWpTMksiTY74v52nHTWVl04cvAttyrXLfG0vWFAaFVJQGhRGMyIBI9IJvThWYsblI5E6ekEhG602NjtXw/krJVpgZiQ1i/N5RbMtxrPgPTlrTN0oAiHckS7VDioVYy93kLYWHFqtkS4rMJVhAoAs7GbsrYbehh2l+mi4u6rLR3vh74yX7Ye53UsNAQ5bpFUop0soldZemNfrQ1DEKorIbhWJncrQa7BD0fugS1teZ8y4z4pSjdTEvqvN5EiIPCth0WfOVnXuEw69aZ2nOjipCavyXG4SZd2TaZrxvnwcQHNuh/aE9YpZi8RFR6hEa8sebV+JQiCiQ8PUle2t8ippf6ReLzfjU6YyHoP+v3zvDRj6aTkxQs6rxjAQS612m2qOvDWAFSIrrSzBjJoU5uJHK43BxCMvZvVLuafaCJ6mCYIcvdjF6NlUr8bJh84ntK50JqsWZU3Vl2LyG1QKna9xrddqLw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(346002)(396003)(366004)(376002)(451199015)(2906002)(44832011)(64756008)(36756003)(66556008)(66946007)(66446008)(66476007)(91956017)(8936002)(41300700001)(5660300002)(86362001)(76116006)(31696002)(8676002)(38070700005)(6506007)(2616005)(26005)(186003)(83380400001)(6512007)(122000001)(38100700002)(110136005)(6486002)(478600001)(316002)(71200400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SjdMVkJPOWFBamJZTVpEQXlNaEpDOTIzcEk2MHI2L2IyamdrZ3RYeUNMQUhM?=
 =?utf-8?B?OUN3N0toNUd3d3lGck5KTDVMSTBhZ0Jpb3FhajhLYnZZNEwzL0daQVNsODZy?=
 =?utf-8?B?YjgrdWQ1cFJaUm12a294UVJSdUJwb3lRdWZwOE43Mm9haXdMb3FlcmVpMWJS?=
 =?utf-8?B?MWdSZ29RQS9Rd2h0RUI3VTlFdFR5WnM2c1d0ZWFvOCtJWWM0dkQxQXdHY3JS?=
 =?utf-8?B?ZHMzWnVwdHVtWHhkKzZLOStoVlE4cDRHSm9JQTFDZW4xWXQwazQvUWZtWXd1?=
 =?utf-8?B?Nkk5TWFGQ3Azb0xjWHNjSld4OTVvMzBUallPWVFDQmlwRTlPUlBwT2lEY2hk?=
 =?utf-8?B?RXAwTnlrTVIyTm1xdlAvbUFmQWY3MmlEWGx4UzcrMWFJVk5ycHp2S0d1dUUz?=
 =?utf-8?B?dGMzQ29YU3kzS0REQ2xSQ2hyZGNCWlc1czFQRXVFRTY5NGxZZkdiTTVNRzZW?=
 =?utf-8?B?L0xUTnZteGE0clQ2OUkrTlZhVW1OR0ozV3dHWVFMcUdpVjc4TEhEQ0RoSFEz?=
 =?utf-8?B?QUhLbVBoSVpWUmV1V0hWOFJFRkhJTnF0eUhIam9Cc2hqZDNMT0Y1TVFsM3V0?=
 =?utf-8?B?emZwM0JYc0U1eGNPU3puYW9GY203Z1M5YmU1ZGlHSEwxZ09Ca0xHbWlOQnN5?=
 =?utf-8?B?VGlwU0hiNjRGWEU4VjdsRzdwOW91bUQ1RWhCY1c4a3VLZ0x2MHJ5L29CQnJr?=
 =?utf-8?B?ZUIzUEV0SjRqMnJVb3hyVVp4ZG0vd1hVKzN5bFBnN2N4OXVJZS85Ti9DMmtm?=
 =?utf-8?B?R0pwdmhJUjE4MFZWWlhEV2xlWUVQamJRZmlpZ1RNTmdlRjVrUW51VEVtZVNN?=
 =?utf-8?B?YTY5Z0FzcGxGNkgwb1V0eFJpL3NMQ211bnhTckV4aGRPRzg2RVRVcXdQWVFK?=
 =?utf-8?B?ZnpkSHc0cUMzbTRHdDVZSG1Za1Y3VWhlQStwNnJZRmpMUDZ4YTlYR01qTVRO?=
 =?utf-8?B?dHVqYjBPcU1Yb3ZNa1Rpa2dUZitvenNjd210bEtQV1V1cVNBclRlYjJVOUp2?=
 =?utf-8?B?dCtJWW1nWkN4VFBUUkg1aFlFNkNBN25nWkY0M29sQ2NRcW1YSnRTb2JzbzFi?=
 =?utf-8?B?SHhsTkQ2R2Q4SFI3eHhlZ2ZMOWczZllRb3FSRHhiMEwrTGZLVE5yUjI3Vncr?=
 =?utf-8?B?VWcyeGgyZVhQWkQrMFc0cTRvVEZEaWpsS010OFlwWGZvRE8weFBwakVvV3Qw?=
 =?utf-8?B?ZHZMMnpJQlh0cDJlMmt6NllZSFdvNnJWQmdXUHFaQWx0MFJWV1FUSXVxYVIv?=
 =?utf-8?B?YVNXOTZwTlN5aDZ0NjV4b1djNU9SQ1pUdGo3eWx1Ni9UdlR6SnAzdG9ZV0o2?=
 =?utf-8?B?WUppQWRUdVdpVHM4NkppUExJY1UvRVo2NEQrbkJBek12QzRXVmhwRWpaQWZr?=
 =?utf-8?B?NnRmZVArVURmNi8xRGpkcTVRd2lIeGhNclM1SFZaakJKWXFjeFVzMlZPVDdy?=
 =?utf-8?B?WGUvNzZKeURTMVhjTWZsZFVUMjNqdTY2b05FUDB2QnFsKzVKeHhxbG4rYWli?=
 =?utf-8?B?cHluSGhMeUlmckY5ZDdjaFhoUGZ2U1NrazQyYzAzOWw4ZStzSVZ3d25UOEhV?=
 =?utf-8?B?SndQbmg5Qmc2YzFwampock5SZ2pFcm9FZFQxWi9iMjN2M3U0TkMyWE5Ta3FF?=
 =?utf-8?B?N3NvekRaU1h2L1JUUTZIeDkvZWdZOW03d2prN293OXpGSS9YQU9wRDdyVkRi?=
 =?utf-8?B?NVFnWFlTbVI5TXlya0tHR1dZQUpiWVJ5UnB2S09zeG9BMG5DTW5iUHRrUW1O?=
 =?utf-8?B?S2l1SHcxcjFVakRYS25yK20rRkFaOStDc2o0d09SQ1FLM3FYNmtTTEQwa0Zl?=
 =?utf-8?B?K0p2RTREN20rUW91ZHcwTi9RNmxkRmhWcWpmMWxObnhyN09OSjRRek1md2JT?=
 =?utf-8?B?cjI4cnQzMGdmSDRKQmkveVUwekt3eTRGMU9mb2xxcE1MOEJoRjNLOWtBYkJs?=
 =?utf-8?B?enpFT3NTREIzRTJFa2tuUjNNek5xTFlNck9HWVJrVEJZbkRBeFNkOVRSaWhs?=
 =?utf-8?B?WGVKOGk1dmJaYStNWG5KWHU0VERlSEhnNE1pM0JFNmE0UGNkRU9QdGM5Qytx?=
 =?utf-8?B?ZjNzU1RFcTRvUnJudVNsOVh5YWM2bWN2OE54QkVuQWNiVzFzZ2hiMTNMV09O?=
 =?utf-8?B?MUtIZUtscG9ZYkwzbXdTQ3pBeDhyemtIazg1SnJNMCtGT1FmWjgxOWwvN3JZ?=
 =?utf-8?Q?H5Y78f+nhjxoomHZJydmw9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F076F88E35AA9148B9A05C8EB724D978@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb8e20a-1fbf-480f-4451-08dac0becf79
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 12:51:38.3184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrriaOJH7cXI3IWwFjlluzoni89ezs2RW8BRnEsLmpjqf15NvRbWZjzSxoudOTDtrzxxeDrGP1W3QEd6QQ5lPCneFs5FG1EMeZZ9yPo7uf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2352
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

DQoNCkxlIDA3LzExLzIwMjIgw6AgMTM6NDUsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUgTm92IDMsIDIwMjIgYXQgNjoyNiBQTSBBRVNULCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gSXQgY29udHJhZGljdHMgY29tbWl0IGE4NWM3MjhjYjVlMSAoInBvd2VycGMvMzI6
IERvbid0IHVzZSBsbXcvc3RtdyBmb3INCj4+IHNhdmluZy9yZXN0b3Jpbmcgbm9uIHZvbGF0aWxl
IHJlZ3MiKQ0KPiANCj4gSG1tIG9rYXkuIERvIHlvdSB3YW50IHRvIGtlZXAgdGhlICNpZmRlZiBj
YXNlIGluIHBwY19zYXZlX3JlZ3MgZm9yIHBwYzMyDQo+IHRvIHNhdmUgfjEyNCBieXRlcyBvZiB0
ZXh0PyBJIGRvbid0IG1pbmQgZWl0aGVyIHdheS4NCg0KSSB0aGluayB5b3UgY2FuIG1ha2UgcHBj
X3NhdmVfcmVncygpIGdlbmVyaWMuDQoNCkkgZG9uJ3QgdGhpbmsgdGhlIGxtdy9zdG13IGlzIHdv
cnRoIGl0IGluIHBwY19zYXZlX3JlZ3MoKSwganVzdCBkcm9wIGl0Lg0KDQpDaHJpc3RvcGhlDQoN
Cj4gDQo+IFRoYW5rcywNCj4gTmljaw0KPiANCj4+DQo+PiBMZSAzMS8xMC8yMDIyIMOgIDA2OjU0
LCBOaWNob2xhcyBQaWdnaW4gYSDDqWNyaXTCoDoNCj4+PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcHBjX2FzbS5oIHwgMTggKysrKysrKysrKysrKysrKy0tDQo+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmgNCj4+PiBpbmRleCA3NTNhMjc1N2JjZDQuLmFj
NDQzODNkMzUwYSAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHBj
X2FzbS5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPj4+
IEBAIC01Nyw4ICs1NywyMiBAQA0KPj4+ICAgICNkZWZpbmUgU0FWRV9OVkdQUlMoYmFzZSkJCVNB
VkVfR1BSUygxNCwgMzEsIGJhc2UpDQo+Pj4gICAgI2RlZmluZSBSRVNUX05WR1BSUyhiYXNlKQkJ
UkVTVF9HUFJTKDE0LCAzMSwgYmFzZSkNCj4+PiAgICAjZWxzZQ0KPj4+IC0jZGVmaW5lIFNBVkVf
R1BSUyhzdGFydCwgZW5kLCBiYXNlKQlPUF9SRUdTIHN0dywgNCwgc3RhcnQsIGVuZCwgYmFzZSwg
R1BSMA0KPj4+IC0jZGVmaW5lIFJFU1RfR1BSUyhzdGFydCwgZW5kLCBiYXNlKQlPUF9SRUdTIGx3
eiwgNCwgc3RhcnQsIGVuZCwgYmFzZSwgR1BSMA0KPj4+ICsubWFjcm8gX19TQVZFX0dQUlMgc3Rh
cnQsIGVuZCwgYmFzZSwgb2Zmc2V0DQo+Pj4gKwkuaWYgXGVuZCA9PSAzMQ0KPj4+ICsJCXN0bXcJ
XHN0YXJ0LFxvZmZzZXQoXGJhc2UpDQo+Pj4gKwkuZWxzZQ0KPj4+ICsJCU9QX1JFR1Mgc3R3LCA0
LCBcc3RhcnQsIFxlbmQsIFxiYXNlLCBcb2Zmc2V0DQo+Pj4gKwkuZW5kaWYNCj4+PiArLmVuZG0N
Cj4+PiArLm1hY3JvIF9fUkVTVF9HUFJTIHN0YXJ0LCBlbmQsIGJhc2UsIG9mZnNldA0KPj4+ICsJ
LmlmIFxlbmQgPT0gMzENCj4+PiArCQlsbXcJXHN0YXJ0LFxvZmZzZXQoXGJhc2UpDQo+Pj4gKwku
ZWxzZQ0KPj4+ICsJCU9QX1JFR1MgbHd6LCA0LCBcc3RhcnQsIFxlbmQsIFxiYXNlLCBcb2Zmc2V0
DQo+Pj4gKwkuZW5kaWYNCj4+PiArLmVuZG0NCj4+PiArI2RlZmluZSBTQVZFX0dQUlMoc3RhcnQs
IGVuZCwgYmFzZSkJX19TQVZFX0dQUlMgc3RhcnQsIGVuZCwgYmFzZSwgR1BSMA0KPj4+ICsjZGVm
aW5lIFJFU1RfR1BSUyhzdGFydCwgZW5kLCBiYXNlKQlfX1JFU1RfR1BSUyBzdGFydCwgZW5kLCBi
YXNlLCBHUFIwDQo+Pj4gICAgI2RlZmluZSBTQVZFX05WR1BSUyhiYXNlKQkJU0FWRV9HUFJTKDEz
LCAzMSwgYmFzZSkNCj4+PiAgICAjZGVmaW5lIFJFU1RfTlZHUFJTKGJhc2UpCQlSRVNUX0dQUlMo
MTMsIDMxLCBiYXNlKQ0KPj4+ICAgICNlbmRpZg0KPiA=
