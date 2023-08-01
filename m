Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D576A834
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 07:22:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LEsTRuhD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFNll64Xjz303l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 15:22:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LEsTRuhD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFNkp3DHKz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 15:21:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTktupAt8jNrvG5hAdSOfOzY+fiIAEx9mKFHh04UqfHm1hnz50GDf/I0fnQXsGIz8+j0hEnQ4/xpOwn3FwnkgubztpreRgaBtNW5fkELb0F7MzZTVwDd3om5fULo9ZF25hdwqCxy4/9zVGgt9/LnYKftsql8HcHNLTS8IxFh1WL9VzuFOb3WSM8qL5VpkW5AcHgVyYcYHODEgfwjU8cG1K0UZmC5gp+BVKKj0knige5I7LPDd+1RIXNl5/qOEBv7FOwE+xjYEHNLXFgI8p/2DvbJh3niGgPemVm3nY+jw7YfuNMdE5BqsvXcRwOH51ek0QsTcFuqnfSwoydWgyzxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhBQXNx8yd9SOd/NOgTjqNDoVgmHjnx9LVVZufNTp0o=;
 b=UUBbjDuiQqtF0xez3dx3CetnSlIdCLwmHd9zIFNs51M6bg3w0yy8EVVQgIvt4HagCoHkDb9nF/dGmPva6BD0dZ+NHHNHiGjZ8RE8z/Dop/xj0I3DDzy9EEczytxvLecFIwZnfPDJB0SOpo79x+FVfdNhAwAdIgqVlMGB3tZqHzWPHaFHtfoeDbiDc0m78//OprvEOx1f6NeGArUYlkZ56ynZETTxieqTG0Xw76MZ2y4OgPiRtTswEb05ATlMM7e0rMRkOKUM3fxy8mxpD0Mmg5O/7mpk/ddzKb6L3ktdmwxJEDlPs2lkll2xHVtZ+66aFipsr6ig/CqoZTqGl9KJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhBQXNx8yd9SOd/NOgTjqNDoVgmHjnx9LVVZufNTp0o=;
 b=LEsTRuhDfdTlmZhRgMgdgX7I2mmZUXnUQ1MJ0FsAAduz6mXLmUjbkXLZ0nEhtKlDyaSeIRptcHkzHOccqr1o5mk0T4iNkgM+q9MafxlgUSnStb50pxQfZKlF/R2OycwEjY1MJEzlzwKNB/uifMuihLGmNl2exPFNvMQ6P66g2LZVmratm4GUSsQuz0OW7ehag40N5Nlk7GEagWlg4yJPNuhS2ldldQeBq0xVwVL+qMJHqpzPzTJhJxcNbgPS7PqJoAKGuvzKHqPF4T+Yrb1ilt3drHsVqQJaX1e0bN2CeVlOOXLTBiBFAZbhVeXZUKbPvYtiSIJ0bdNNlFeFRT69MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2964.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 05:21:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 05:21:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Thread-Topic: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Thread-Index: AQHZvfjvf6d+ftR+dEGjqGoP8+PuAq/U9AiA
Date: Tue, 1 Aug 2023 05:21:11 +0000
Message-ID: <dc334e93-1487-8058-195d-e90db7bdb53f@csgroup.eu>
References: <20230724063341.28198-1-rdunlap@infradead.org>
In-Reply-To: <20230724063341.28198-1-rdunlap@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2964:EE_
x-ms-office365-filtering-correlation-id: d54d7dd0-0f7c-4bd6-cc3e-08db924f1e98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ChcX2KWWcvgu6BLp8kdqEDuPvWajZtc0DGr1xAxzdZ2nppY7SH//oCoBYPXkwCoDQiZ8CrHQuK9cY97t33/37Rzyvr7kjM8SrYvcBXEuQd9e26i7aTUcB2J1O5NfnF3WQC9ytOvOJqBEvwJe9jrhOFX8IGxIf2ajUBFYhEwLbFauLQSb2JS+v5F33h+83Xndf/Rkmb5HKvdZpAXOdw6Ah8gNZfYeIgh7qH3ohzSfnPTCviJhgY/hn0pX2wDQ/MEG0eB4Yd27S+2yEb+uDpbHDDjEd74es3/0P3Nzuds4NrizwYK2n/YSIryQFGVrMBJzvLrxoFaWuuMr/Ca3TU0TyyTakHacPlz5q9rd9xRLAwdgW29ku2sjVH+pPmZiH979Gh0BlNBqCHopqCpKobOzRk0VaoQY9LgSBjcqnqAYkW5jxfaJpINnTRQVWZcs2NzJ6ZgsmOkG1MJ+shiZjc/FZqNqFtnJGZbNulrqziL+xPRRi9UiZTXJYc8elTkMp7ZYVBDMBruaHJxYaKUNkGV0L6lGrjtzpnYfEFK+uurhFr/o9nCnIoQBvDEDCeCqnUkl7X/d2o77lpoNMNFmwLDjH1qgmW2gDAlQlvVUGoEjTRCEhUl9xg3Slaw6xkG93F4MytTD3yc49oFEEa6CI8gAWw3YVsMAmULz9IFFV4Gc9Y4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199021)(110136005)(54906003)(122000001)(966005)(6512007)(6506007)(6486002)(36756003)(8676002)(8936002)(5660300002)(66946007)(76116006)(66476007)(64756008)(66556008)(66446008)(71200400001)(91956017)(4326008)(2906002)(66574015)(2616005)(83380400001)(38070700005)(478600001)(41300700001)(31686004)(86362001)(186003)(7416002)(38100700002)(316002)(44832011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZXlvU0F0MEVSdUFrai9OdmlyTHNZdmxhazFGODFqeUx1bG5TN21lZy9KTGpn?=
 =?utf-8?B?dkZyZWVOMmZNVnZtblNJN1pQNUtob2J1d2dLU3lGZ0w2U01yVEhtcGV4Tllt?=
 =?utf-8?B?UTVNVWJKQ3JadTdiUFJpUTU4TU85bDM3aEkrYjhHSTFvK1IzQnNzbTl2WTJU?=
 =?utf-8?B?SmptL3J3ZW41TzFnN1I1Y0pPd0hXTjlmWmc3My8zU2NwbkIxcDE0dHJqS0ZQ?=
 =?utf-8?B?cTdwUDFlNXBZcmhOa09UNjMyaWl5cXlVZXlmY05IU3BiaHhCeE1BelFDZWR3?=
 =?utf-8?B?cUdiRDEvSGRCQUxWakY5eDBPUzBHTTF3eUViTjg0SjBIcWRnNjRPeC9kaElq?=
 =?utf-8?B?dWlkcnF5YUVBL2pVVmEyS1hZckNLTHlSZTFMMUdvQ0lkS012QlVxRThCUGdL?=
 =?utf-8?B?eThOc1daVWU0bnUvUGdiNmxmS09CU2hLUmxzd3oxVjhaS1lubmRkNzFoNEhs?=
 =?utf-8?B?SUFNUUEvT3o3blVJaXBLVk8xUFpnVlF4WmVCcnBuSDJ1TVp2ZUo1eDlVaHlO?=
 =?utf-8?B?ZFhNZGZqSzdtRlQ2MTNsekUyMUlqMzUwdFZRbVB0bkxvQXlyc0d4N1gwSjZv?=
 =?utf-8?B?cjl2SFQvYmRVMUd1cVZGRjRvQXJEZFgwSCtQSGdCNVE1L0JuUndueEJCOFRh?=
 =?utf-8?B?OWN3a2M3WWFjT2oxQ21wLzdFbG5Td1NZaS9ZNFExbWIxdVVHTWk1TnJaMzVK?=
 =?utf-8?B?TEJEUlR3K0p2ZTFaK1JhUjJ0WEE4bzBaZ3A3NGtMV0oyc2tLTk4yZkk5VFR6?=
 =?utf-8?B?T3Zyelh5NlNBcWVPWVlRNmMzK2UwQlZBdkVsLzRPdjN0S0V6ZFBFTTNTbkM1?=
 =?utf-8?B?c1pyQmZGWVZadVNuV1lZd3haMXJlWjJLTmxtK21LeUdGSWUzb1l4ZkUrWUJs?=
 =?utf-8?B?YzcwYlFjVUxNZ1RwcnpSdHg1V3IyMzA2WWxVWGwrT1hZcDZSYkpaQkhCTjdn?=
 =?utf-8?B?UzliSVBDNU9EYXF5MDY5OFFJdDZVdm9vd00vaUhSZTZ6c3diU2RJSmR6SHg2?=
 =?utf-8?B?UnBJZ2J6L0M1UUFkWk5NR3JVK2NRNWtZQkpjT3FQM3VGYzlEZUYyb0RoZkgx?=
 =?utf-8?B?VVMxY1BqMHFEdHhxOGd5b1NkbXdLWWJwd2JQWTdKb0hLb0hGR0tGZHBGRjZi?=
 =?utf-8?B?cHpaU1lpRStaMk5BczlQajZZTTdudjlsK2Q4R1pLUHVGSkNIY3A3d1J4L0tx?=
 =?utf-8?B?SnI2Q1ljSStGTlg1alVhNU5KUnFaSHlLdjZraTdIVTFxWS9sNWQwd29tVDhJ?=
 =?utf-8?B?SUliQlhLa1A3am9FMkZMMTY5TXkvVnJHaER5WEN6Ukp2T3ZGSERhYTdEVXBB?=
 =?utf-8?B?MHdQUC9uSjlEQStiMHJCazl2QWVyQ01zd3RsdVk1ZGVJM2hzUkdGM1IzVVNN?=
 =?utf-8?B?YlcvZDNKVDljNkJZUGNsZ0dCVHJxU1ZHTzIzOHA4VHY5R05idUplSWwrWkpL?=
 =?utf-8?B?OUFETUVIeFl4U2xIR1MzaDJ0NVZkc05pd0ZjaGM2bnh1R1hiY3hIcUprU1F4?=
 =?utf-8?B?bFRNem5vL0NxNGh6UnB4SWJXWGQ1OUUxMDlBUldjaFJBUlVPZGtkUTRZYzY3?=
 =?utf-8?B?TG5EZUpnSUxIdkxhZTYrb2NXZEIvTmNiZ1hmanloUEVDVXRhbU4xMVdiR3dF?=
 =?utf-8?B?ZXI5Y1d6NkJQc21vWXVlWGM2WnA4YXZFd1N4TWFuVE1wbnpFMXlIQVpJMjhM?=
 =?utf-8?B?dk9JaU93WGpyc250SUc1TEhVekprelI1OERDdUF4OFplVTFHS1J3TzdlVlBm?=
 =?utf-8?B?TENNOHlQVUR6dGcwb3ZxcXY2YlpnWDNIRVJnbHpJNWxjSHQ2cGJoN1dsd0dE?=
 =?utf-8?B?UlhPWXp0SUp5dXZkem1zM3laa3VrNUNGdGNRZnR3VHVqMytJMVlKTXl1NFd5?=
 =?utf-8?B?T1hsNC9ueUlwdkFiZU5BSVBuZUE3RElRdXNkajFzRjZQeTV0MlFQbnpLUDhZ?=
 =?utf-8?B?NnFsNGZKL0REeXFXUVRHZFExSXV5Y0t4TXh1NUJUR1VEbDN0dC95aGJ3aHVw?=
 =?utf-8?B?NHlDeUxCNERLL25jeTJOQ1ZJd0FtQ1pldXRsVE1FMGcyOUJQb3p0WHFzK0lD?=
 =?utf-8?B?Y1c3cW0xUUNBNlJXUnpPNTZlblFHM29rOGFSMFhoVlowbTUrRDZxVmZBR0k5?=
 =?utf-8?B?YXl0eElPTEsrZFRpbzZGRmF5Q0dJdkdmaEhJazFQSTdkM2RlVTZzYm45V3g2?=
 =?utf-8?Q?758p1w/rOfL0DH5gbR/TN5yFTSHQbHUGvNMnv5UsjR1o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FBEAE158012FA4E8F1580DC78B80889@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d54d7dd0-0f7c-4bd6-cc3e-08db924f1e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 05:21:11.6427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kOIBODz69jrT5bHVbwCwpFHJ56dnBkVw+NMEb4A5cpiJz0NnEyOJs/iExSLbLtqIVGbyJm56+2WMmbEPlms8ZcWn4ICO5v2rSJxgSxAKkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2964
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
Cc: Timur Tabi <timur@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Gala <galak@kernel.crashing.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA3LzIwMjMgw6AgMDg6MzMsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBS
ZWNvbmNpbGUgZGV2aWNlcy50eHQgd2l0aCBzZXJpYWwvdWNjX3VhcnQuYyByZWdhcmRpbmcgZGV2
aWNlIG51bWJlcg0KPiBhc3NpZ25tZW50cy4gdWNjX3VhcnQuYyBzdXBwb3J0cyA0IHBvcnRzIGFu
ZCB1c2VzIG1pbm9yIGRldm51bXMNCj4gNDYtNDksIHNvIHVwZGF0ZSBkZXZpY2VzLnR4dCB3aXRo
IHRoYXQgaW5mby4NCj4gVGhlbiB1cGRhdGUgdWNjX3VhcnQuYydzIHJlZmVyZW5jZSB0byB0aGUg
bG9jYXRpb24gb2YgdGhlIGRldmljZXMudHh0DQo+IGxpc3QgaW4gdGhlIGtlcm5lbCBzb3VyY2Ug
dHJlZS4NCg0KRGV2aWNlcyB0dHlDUE0qIGJlbG9uZyB0byBjcG1fdWFydCBkcml2ZXIuIEFzIGV4
cGxhaW5lZCBpbiB0aGUgY29tbWVudCANCnlvdSBoYXZlIG1vZGlmaWVkIGluIFVDQyB1YXJ0IGRy
aXZlciwgVUNDIHVhcnQgYm9ycm93cyB0aG9zZSBkZXZpY2VzIGFuZCANCnNoYWxsIG5vdCBiZSBj
b25zaWRlcmVkIGFzIHRoZSByZWZlcmVuY2UuIEJ1dCB0aGUgbGluZXMgeW91IG1vZGlmeSBpbiAN
CmRldmljZS50eHQgZG9lc24ndCBtZW50aW9uIFFFIFVDQywgaXQgbWVudGlvbnMgQ1BNIFNDQyBh
bmQgQ1BNIFNNQy4NCg0KQ1BNIHVhcnQgZHJpdmVyIHN1cHBvcnRzIHVwIHRvIDYgcG9ydHMgKDQg
U0NDIGFuZCAyIFNNQykuDQoNCk9uIG9uZSBvZiBteSBib2FyZHMgd2hpY2ggaGFzIGEgcG93ZXJw
YyBtcGM4NjYgQ1BVLCBJIGhhdmU6DQoNClsgICAgMi4zOTM4NzJdIGZmMDAwYTgwLnNlcmlhbDog
dHR5Q1BNMCBhdCBNTUlPIDB4ZmZmMDBhODAgKGlycSA9IDE5LCANCmJhc2VfYmF1ZCA9IDgyNTAw
MDApIGlzIGEgQ1BNIFVBUlQNClsgICAgMi40MTE4OTldIGZmMDAwYTkwLnNlcmlhbDogdHR5Q1BN
MSBhdCBNTUlPIDB4ZmZmMDBhOTAgKGlycSA9IDIwLCANCmJhc2VfYmF1ZCA9IDgyNTAwMDApIGlz
IGEgQ1BNIFVBUlQNClsgICAgMi40MzAzNTJdIGZmMDAwYTAwLnNlcmlhbDogdHR5Q1BNMiBhdCBN
TUlPIDB4ZmZmMDBhMDAgKGlycSA9IDMwLCANCmJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BN
IFVBUlQNClsgICAgMi40NDg5NDRdIGZmMDAwYTIwLnNlcmlhbDogdHR5Q1BNMyBhdCBNTUlPIDB4
ZmZmMDBhMjAgKGlycSA9IDI5LCANCmJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BNIFVBUlQN
ClsgICAgMi40Njc0MzVdIGZmMDAwYTQwLnNlcmlhbDogdHR5Q1BNNCBhdCBNTUlPIDB4ZmZmMDBh
NDAgKGlycSA9IDI4LCANCmJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BNIFVBUlQNClsgICAg
Mi40ODU5MjRdIGZmMDAwYTYwLnNlcmlhbDogdHR5Q1BNNSBhdCBNTUlPIDB4ZmZmMDBhNjAgKGly
cSA9IDI3LCANCmJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BNIFVBUlQNCg0KIyBsbCAvZGV2
L3R0eUNQTSoNCmNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgMjA0LCAgNDYgSmFu
ICAxIDAxOjAxIC9kZXYvdHR5Q1BNMA0KY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAyMDQsICA0NyBKYW4gIDEgMDE6MDAgL2Rldi90dHlDUE0xDQpjcnctLS0tLS0tICAgIDEgcm9v
dCAgICAgcm9vdCAgICAgIDIwNCwgIDQ4IEphbiAgMSAwMTowMCAvZGV2L3R0eUNQTTINCmNydy0t
LS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgMjA0LCAgNDkgSmFuICAxIDAxOjAwIC9kZXYv
dHR5Q1BNMw0KY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAyMDQsICA1MCBKYW4g
IDEgMDE6MDAgL2Rldi90dHlDUE00DQpjcnctLS0tLS0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAg
IDIwNCwgIDUxIEphbiAgMSAwMTowMCAvZGV2L3R0eUNQTTUNCg0KIyBjYXQgL3Byb2MvdHR5L2Ry
aXZlcnMNCi9kZXYvdHR5ICAgICAgICAgICAgIC9kZXYvdHR5ICAgICAgICA1ICAgICAgIDAgc3lz
dGVtOi9kZXYvdHR5DQovZGV2L2NvbnNvbGUgICAgICAgICAvZGV2L2NvbnNvbGUgICAgNSAgICAg
ICAxIHN5c3RlbTpjb25zb2xlDQovZGV2L3B0bXggICAgICAgICAgICAvZGV2L3B0bXggICAgICAg
NSAgICAgICAyIHN5c3RlbQ0KdHR5Q1BNICAgICAgICAgICAgICAgL2Rldi90dHlDUE0gICAyMDQg
NDYtNTEgc2VyaWFsDQpwdHlfc2xhdmUgICAgICAgICAgICAvZGV2L3B0cyAgICAgIDEzNiAwLTEw
NDg1NzUgcHR5OnNsYXZlDQpwdHlfbWFzdGVyICAgICAgICAgICAvZGV2L3B0bSAgICAgIDEyOCAw
LTEwNDg1NzUgcHR5Om1hc3Rlcg0KcHR5X3NsYXZlICAgICAgICAgICAgL2Rldi90dHlwICAgICAg
IDMgMC00IHB0eTpzbGF2ZQ0KcHR5X21hc3RlciAgICAgICAgICAgL2Rldi9wdHkgICAgICAgIDIg
MC00IHB0eTptYXN0ZXINCg0KQ2hyaXN0b3BoZQ0KDQoNCj4gDQo+IEZpeGVzOiBkNzU4NGVkMmI5
OTQgKCJbUE9XRVJQQ10gcWUtdWFydDogYWRkIHN1cHBvcnQgZm9yIEZyZWVzY2FsZSBRVUlDQ0Vu
Z2luZSBVQVJUIikNCj4gRml4ZXM6IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIuNi4xMi1yYzIiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4g
Q2M6IFRpbXVyIFRhYmkgPHRpbXVyQGtlcm5lbC5vcmc+DQo+IENjOiBLdW1hciBHYWxhIDxnYWxh
a0BrZXJuZWwuY3Jhc2hpbmcub3JnPg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5v
cmcNCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQo+IENjOiBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4LXNl
cmlhbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5u
ZXQ+DQo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIERvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlcy50eHQgfCAgICAyICstDQo+ICAgZHJpdmVycy90dHkv
c2VyaWFsL3VjY191YXJ0LmMgICAgICAgICB8ICAgIDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvdWNjX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC91Y2NfdWFydC5jDQo+
IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC91Y2NfdWFydC5jDQo+ICsrKyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC91Y2NfdWFydC5jDQo+IEBAIC01OSw3ICs1OSw3IEBAIHN0YXRpYyBpbnQgZmlybXdh
cmVfbG9hZGVkOw0KPiAgIC8qICNkZWZpbmUgTE9PUEJBQ0sgKi8NCj4gICANCj4gICAvKiBUaGUg
bWFqb3IgYW5kIG1pbm9yIGRldmljZSBudW1iZXJzIGFyZSBkZWZpbmVkIGluDQo+IC0gKiBodHRw
Oi8vd3d3LmxhbmFuYS5vcmcvZG9jcy9kZXZpY2UtbGlzdC9kZXZpY2VzLTIuNisudHh0LiAgRm9y
IHRoZSBRRQ0KPiArICogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2VzLnR4dC4gIEZv
ciB0aGUgUUUNCj4gICAgKiBVQVJULCB3ZSBoYXZlIG1ham9yIG51bWJlciAyMDQgYW5kIG1pbm9y
IG51bWJlcnMgNDYgLSA0OSwgd2hpY2ggYXJlIHRoZQ0KPiAgICAqIHNhbWUgYXMgZm9yIHRoZSBD
UE0yLiAgVGhpcyBkZWNpc2lvbiB3YXMgbWFkZSBiZWNhdXNlIG5vIEZyZWVzY2FsZSBwYXJ0DQo+
ICAgICogaGFzIGJvdGggYSBDUE0gYW5kIGEgUUUuDQo+IGRpZmYgLS0gYS9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2RldmljZXMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZp
Y2VzLnR4dA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZXMudHh0DQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlcy50eHQNCj4gQEAgLTI2OTEs
NyArMjY5MSw3IEBADQo+ICAgCQkgNDUgPSAvZGV2L3R0eU1NMQkJTWFydmVsbCBNUFNDIC0gcG9y
dCAxIChvYnNvbGV0ZSB1bnVzZWQpDQo+ICAgCQkgNDYgPSAvZGV2L3R0eUNQTTAJCVBQQyBDUE0g
KFNDQyBvciBTTUMpIC0gcG9ydCAwDQo+ICAgCQkgICAgLi4uDQo+IC0JCSA0NyA9IC9kZXYvdHR5
Q1BNNQkJUFBDIENQTSAoU0NDIG9yIFNNQykgLSBwb3J0IDUNCj4gKwkJIDQ5ID0gL2Rldi90dHlD
UE01CQlQUEMgQ1BNIChTQ0Mgb3IgU01DKSAtIHBvcnQgMw0KPiAgIAkJIDUwID0gL2Rldi90dHlJ
T0MwCQlBbHRpeCBzZXJpYWwgY2FyZA0KPiAgIAkJICAgIC4uLg0KPiAgIAkJIDgxID0gL2Rldi90
dHlJT0MzMQkJQWx0aXggc2VyaWFsIGNhcmQNCg==
