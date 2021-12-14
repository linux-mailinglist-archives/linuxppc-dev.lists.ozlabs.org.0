Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22326474A3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 19:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD5kx0B4Fz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 05:00:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::607;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::607])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD5kR4rLDz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 04:59:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6L8hi8/LH7K4Tr1pIwMCO3aReERGSMrSE2c3A/ihV60QamHhkqKsAzPjO7TketqpolbjxcQx/cZNdY97lLomtccrxw+JczoKls+Bl2LCQsfzNOIhYqQxjOtF+SFhIm2PQP9F14VgHV0UXemtjUrGl8Xyljc3uHAIInaOr+IcjyUUrAV42Y+Lam4ohfmss/ZhsB09HFnCK4Lx5zXcnasaSyV5j/ej9z01IWJhnbweAe4GVzjK2TQ62oEE6xeQGLqWM5gCQAqtb/Kg5iY1ciqeSn/ucNo1xIYMswRy6vvojH6ugalHZ6FRC6DMW0JyHkV/4jAykGHZD+w7rT1oCjfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPduxBi5U+BGwkKZBgvbDAsFeztJf9dpTb/I4Uy44LY=;
 b=DL4+PNum3wo/eK5iL6Q+xP2zdAQzBL5B5xxG2CQtdXy8ck29lUXyNSbtz4IuyOSmIv85Qdt2em76KEmrhuiaBvPi8hzT1zgz2hBW5tgIk77gbV6D4nVXLQnPfzUfVjMhp9nH3we1smqUC0dc71EDsF5SM5O7r/qd92SVw7ZPBtRLdxRnCjOy+G9S8VHbV58wwjxa3T17nmzXW/MBFDRDjJZswawSw5OGfcAEt/LhxFG7aLqkO52MBPr101bXp2rRH43I9LUMhtZyE8JaIRRe7MuM+B1vGwrK4jLzYug1WmYlHqGgnfdVoKczRN2Wrn6rk7CEW+YmY5FuNkIlh3cWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 17:59:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 17:59:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
Thread-Topic: linux-next: manual merge of the audit tree with the powerpc tree
Thread-Index: AQHXyhGlv9NcChlzxUqn6eTOsDZjzavlG8oAgAA7YoCAAWBkAIAAA16AgAAsAgCAS62bAA==
Date: Tue, 14 Dec 2021 17:59:30 +0000
Message-ID: <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
In-Reply-To: <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91b1de7c-2b98-4e7b-c718-08d9bf2b7a9c
x-ms-traffictypediagnostic: MRZP264MB1750:EE_
x-microsoft-antispam-prvs: <MRZP264MB1750CEC515C2850E1FB736E6ED759@MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yHhlFi6QGxQi2W4f26zggnoN2Tm3rVL3n3kBur2K1IcCb4xY3CgIUXE6r17AbK6vm++bE6aJgZKWSbXvtaW9ZX3FLyRKcpq4TXk22j6u2dH1BAr0UqA2EuW4KIRYIbd6zDSOasYut801ME7tf8/1lgHEQzAb98t6sIAKOI4wiigouSBDKqpXn1ckV6Ent1VLwJiLQ6NkgNfUykH7bXdFkeVwIiy/r38lv4lveljvsTDc359bLIAtGZ9Amd2Z+WwVxoykMqM2oFSjhc5xfNrIgBmaz/NJaEd6QbI4VK73cEeTg05FAcynREBGMvZiHT8Iyoti1JTjcflWDr8ClTf+OwghwiUp42DdIz7GOvRTF9z+G59t8Lkxpy7tJHJQH8FPnJ35EwBLn6LGBUsV099+OTG8RlRwBup2S4EE/56wqmlBIXFk8coY+XbGpa3ZF/Tzh0RBPL1UqLJ2xvHiYlbjgRSGtypyAIkFbKZumFImd4WTmteuKRlM9kJ9Ot2xcRHlxatCg1dZJ9PhlgR52vX4cdjjVX8IvNWV4StDy9jmq4DD8PFFYJM9ezoHsC33u+mnb3xYi4WNqre2hX1U0nRJLdVrBLtuiJORMc04fKIQ7KQOk2GnujBksw9Yr5Daci7HuMejX1+yNdcr2ktRWDOKx8KQQxoSQRiqvUQWOgMfmc4BwRAmJcDWwUOrH3vnpqx9inJ7GE9IRVtzemVm+fsDHCwMGpDleJF8rFtOCAjZGY3StADzqpgEw5qgnwdASGQL819Er44lIzaqzoAOYiHPdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(38070700005)(4326008)(6512007)(26005)(31696002)(508600001)(6506007)(53546011)(6486002)(8676002)(2616005)(316002)(54906003)(5660300002)(36756003)(86362001)(186003)(66574015)(38100700002)(6916009)(76116006)(44832011)(2906002)(8936002)(66446008)(91956017)(66476007)(66556008)(64756008)(83380400001)(66946007)(31686004)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3dSSlEzdVNKNmFEaERkNFFySUloOXBISXlsM0RoTFBEUnUxUjY0QlkwMjJC?=
 =?utf-8?B?Ymt2NnVUSzNETnBPcko1TGo5bithOHJkOVNUNjJLTnpLZ2s3alcrYm1MZ0l1?=
 =?utf-8?B?UmZNd3lxZm1mQXRrUkh1SklzaHJ0RmVkNVdqUkxadGhJdTNLc3J0RURZN1lV?=
 =?utf-8?B?YzV0ak53UTEyTkJ4WCttay8xRDBINW1HM0kvMGhPZUlTVnJFaXRtdjhGd21t?=
 =?utf-8?B?WjhiQ3RrQVUrbW9ZWm90aVMvc3p3S1JtUUswOWlrdURwOGU2dHM0NTFMREFj?=
 =?utf-8?B?b0hzREJBWTk5UDJrU0IwaUhiYmZzb0hSeEo5RG15bVc5bFk5MU9zbzk3WG5D?=
 =?utf-8?B?RTgzUkRyWTRhUXB1bnpmeU5SYVZONFdVNVk1WUpvUSt5clZPRFNnbEFOY3BM?=
 =?utf-8?B?TjRuR2xQL3dRbG81cEJ6RzNGRU0zTWFjRFJVejJsakZLVU9RN0tCa3llR0Ur?=
 =?utf-8?B?bFBzMVIwL093ZUpBRGZsSW1JNnFxRlBKQ0pSeUFEYW9ralhXb2o0U1d3R1lK?=
 =?utf-8?B?YU9Wb2t2d283bUdNWW5oSVh1MSs4aEt1VXRUUklGZ2JjdnMrVlREKzZ3UFQ4?=
 =?utf-8?B?dFZBb29RZ0FYTkR0RGxySE5WNXJvRlZtOExzTEZLeHFwaGhIZk1BWndhZlE4?=
 =?utf-8?B?KzZ6ZzN1RVRQUk41WWMvUkQzeFQ0Rndia1AyYVk0Q1ZSUHRIL0puekJQWDBt?=
 =?utf-8?B?REhuZ3JXTmViSzZwelVQV0ZZL2lKNXBXK2FDUkdSc0JpenNoSmhsNUxUQnJ6?=
 =?utf-8?B?RnptbTUxRTZLMW1hc3JzL1NtRFNQZHdMOVMyNVNUN2pnYTNiTzd0N2M3QVdI?=
 =?utf-8?B?Znc3eTNqczhKdmtMUWNBN1h6b3FDNkRMeTJyUXhScWtTbWIrY3RvQTFwVmZH?=
 =?utf-8?B?ek51cXArSjBWQUc3OTJEakp0QkVkM2tzc2hXU2ZZblJwcy9uejVwaGtZK08z?=
 =?utf-8?B?QzVlMVkyZ3U3UU81QkFFWHplS01uZ241TFluYWxnUHpJSnF0SXRCOXFNMXpt?=
 =?utf-8?B?KzE1bnFCbUNwQWd3Yi9MNFNBYlVVNERnREwzMGtzdnNXb1FIY3VOVEVCZlc3?=
 =?utf-8?B?S1I0UlVDRXVOU201dEhkMlRRMU1PM2NOSTRIRU40TWVkdzBtZmhiQWVNNnpt?=
 =?utf-8?B?cHJJYnNESG00RlNzek1PUndTQUtEbWVENEhyZlJVMmY5WmdOcHhsWlFBdENF?=
 =?utf-8?B?VE1OczliUmFTYVZMSlJqKzZuOThjcFNjZXVaREJBNHFDYjRNT2p4YmY5TFhT?=
 =?utf-8?B?ZlNWVFAxZTl0eXB5TXg1VlV6VERad0tFb0V5dkFGTjcrYnJFSFBIamFvcWZv?=
 =?utf-8?B?ekZkcWxleXhoZ3pTeStseEhGb25QQUVuM1RUenFMSTZZVVJUbU1IYzRkVGJF?=
 =?utf-8?B?N0hzVGRYYjJwVWpzRHdEVkJIZ2xnRzF4dEZLWDB3TGNCenVpUVo5SmZKaDI1?=
 =?utf-8?B?dUMwMTZkRFFvb1RUeVdxZVpJa3RKOWNEWTBBa2ZTMnVLcnB2M0QyVmkzYU1J?=
 =?utf-8?B?TUhJOW1IM2thZ2luV0gweUtHUjM1Sy9pY1VIOFJldGttQkk1VTY0VThPZnpw?=
 =?utf-8?B?ZEZ4VmJjbVFyYlRySlg4TVVtN3NRVU0rNzIvYzMyZ2ZmRXVldlZqUFppRUgx?=
 =?utf-8?B?aUkvcWhYOEFYTndaUVVIYmNRL0F6ckFGQmM4UzlHcjduOVJvdGcxdHkyOStO?=
 =?utf-8?B?NStyT2xwSmxjYmExOXJxL21JVVJwckhvbG1WNFRvTG4vZzQ0cjNSN1lNOW4w?=
 =?utf-8?B?Umk0Um9RQjl1T1UwdjFLaTNYaGhUdHF0OXBKbHlJVHpuZ3V6SUw3NmpYdERy?=
 =?utf-8?B?M0dhMWJ5bkIrM3BXcHB5THpYUmFqc21FRlkyaisyWmZQUlA3L3Z0T082Y29a?=
 =?utf-8?B?VVJsYlovNGRJUnovYkRMcTBES2VjZ2FlU3pmK08wVDBtVXh5TThZejlsQzd2?=
 =?utf-8?B?Nmh0UnBsVVA4cDVtWnljb2hocU5vU25RMUpsN01DYUFla1IvenNmM2dxQXhE?=
 =?utf-8?B?NU1OSng1YkpWWjUySmZvM2lKSHVEbGJmVXJESmVlSTZpOTBDaU4vMmFnbDhN?=
 =?utf-8?B?bFhpaEQ3ekUzbUxvNTdhSE5vVnk5RHVVVUNLby9SbkhScUhxcmxJVFFORHk5?=
 =?utf-8?B?NmtDUFd1emgzNSszNk1COHdTS29lRzFWQzBZWVgzVHZ3OXhsV1F2RDduRERj?=
 =?utf-8?B?TzZuK3hWV1pMYjRJd1RIdjRhZTY3WHBUN0hrTHZDbE1WZEdNYWUxK3dMdnU0?=
 =?utf-8?Q?RKKWAr+Gk75FwWAEZIHL3I9fIxlLg/cQfwNCAwYZVA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84F350E2D25A5B40AFDF9F1435FBDE83@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b1de7c-2b98-4e7b-c718-08d9bf2b7a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 17:59:31.0074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OK6skWjm8KuYvkyWlhnVVFxIVznZSwnXPMzCdcQIHaay3ET4Y+dVBnXw8oxGuTFOvHwMcbRurmPjWmUf5Y8gjbxP/ZZ2OPm8XoXCiwJ+MI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1750
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzEwLzIwMjEgw6AgMTY6MTgsIFBhdWwgTW9vcmUgYSDDqWNyaXTCoDoNCj4gT24g
V2VkLCBPY3QgMjcsIDIwMjEgYXQgNzo0MSBBTSBDaHJpc3RvcGhlIExlcm95DQo+IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4gTGUgMjcvMTAvMjAyMSDDoCAxMzoyOSwg
TWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdCA6DQo+Pj4gUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1v
b3JlLmNvbT4gd3JpdGVzOg0KPj4+PiBPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCA2OjU1IEFNIE1p
Y2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gd3JvdGU6DQo+Pj4+PiBTdGVwaGVu
IFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JpdGVzOg0KPj4+Pj4+IEhpIGFsbCwN
Cj4+Pj4+Pg0KPj4+Pj4+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0aGUgYXVkaXQgdHJl
ZSBnb3QgY29uZmxpY3RzIGluOg0KPj4+Pj4+DQo+Pj4+Pj4gICAgIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvYXVkaXQuYw0KPj4+Pj4+ICAgICBhcmNoL3Bvd2VycGMva2VybmVsL2NvbXBhdF9hdWRpdC5j
DQo+Pj4+Pj4NCj4+Pj4+PiBiZXR3ZWVuIGNvbW1pdDoNCj4+Pj4+Pg0KPj4+Pj4+ICAgICA1NjZh
ZjhjZGEzOTkgKCJwb3dlcnBjL2F1ZGl0OiBDb252ZXJ0IHBvd2VycGMgdG8gQVVESVRfQVJDSF9D
T01QQVRfR0VORVJJQyIpDQo+Pj4+Pj4NCj4+Pj4+PiBmcm9tIHRoZSBwb3dlcnBjIHRyZWUgYW5k
IGNvbW1pdHM6DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgNDJmMzU1ZWY1OWEyICgiYXVkaXQ6IHJlcGxh
Y2UgbWFnaWMgYXVkaXQgc3lzY2FsbCBjbGFzcyBudW1iZXJzIHdpdGggbWFjcm9zIikNCj4+Pj4+
PiAgICAgMWMzMGUzYWY4YTc5ICgiYXVkaXQ6IGFkZCBzdXBwb3J0IGZvciB0aGUgb3BlbmF0MiBz
eXNjYWxsIikNCj4+Pj4+Pg0KPj4+Pj4+IGZyb20gdGhlIGF1ZGl0IHRyZWUuDQo+Pj4+Pg0KPj4+
Pj4gVGhhbmtzLg0KPj4+Pj4NCj4+Pj4+IEkgZ3Vlc3MgdGhpcyBpcyBPSywgdW5sZXNzIHRoZSBh
dWRpdCBmb2xrcyBkaXNhZ3JlZS4gSSBjb3VsZCByZXZlcnQgdGhlDQo+Pj4+PiBwb3dlcnBjIGNv
bW1pdCBhbmQgdHJ5IGl0IGFnYWluIGxhdGVyLg0KPj4+Pj4NCj4+Pj4+IElmIEkgZG9uJ3QgaGVh
ciBhbnl0aGluZyBJJ2xsIGxlYXZlIGl0IGFzLWlzLg0KPj4+Pg0KPj4+PiBIaSBNaWNoYWVsLA0K
Pj4+Pg0KPj4+PiBMYXN0IEkgcmVjYWxsIGZyb20gdGhlIHBvd2VycGMvYXVkaXQgdGhyZWFkIHRo
ZXJlIHdlcmUgc3RpbGwgc29tZQ0KPj4+PiBpc3N1ZXMgd2l0aCBhdWRpdCB3b3JraW5nIHByb3Bl
cmx5IGluIHlvdXIgdGVzdGluZywgaGFzIHRoYXQgYmVlbg0KPj4+PiByZXNvbHZlZD8NCj4+Pg0K
Pj4+IE5vLg0KPj4+DQo+Pj4gVGhlcmUncyBvbmUgdGVzdCBmYWlsdXJlIGJvdGggYmVmb3JlIGFu
ZCBhZnRlciB0aGUgY29udmVyc2lvbiB0byB1c2UgdGhlDQo+Pj4gZ2VuZXJpYyBjb2RlLg0KPj4+
DQo+Pj4+IElmIG5vdGhpbmcgZWxzZSwgLXJjNyBzZWVtcyBhIGJpdCBsYXRlIGZvciB0aGlzIHRv
IGhpdCAtbmV4dCBmb3IgbWUgdG8NCj4+Pj4gZmVlbCBjb21mb3J0YWJsZSBhYm91dCB0aGlzLg0K
Pj4+DQo+Pj4gT0suIEknbGwgcmV2ZXJ0IHRoZSBwYXRjaCBpbiBteSB0cmVlLg0KPj4NCj4+IEJ1
dCBpdCdzIGJlZW4gaW4gdGhlIHBpcGUgc2luY2UgZW5kIG9mIEF1Z3VzdCBhbmQgbm8gb25lIHJl
cG9ydGVkIGFueQ0KPj4gaXNzdWUgb3RoZXIgaXNzdWUgdGhhbiB0aGUgcHJlLWV4aXN0aW5nIG9u
ZSwgc28gd2hhdCdzIHRoZSBuZXcgaXNzdWUNCj4+IHRoYXQgcHJldmVudHMgdXMgdG8gbWVyZ2Ug
aXQgdHdvIG1vbnRoZXMgbGF0ZXIsIGFuZCBob3cgZG8gd2Ugd2Fsaw0KPj4gZm9yd2FyZCB0aGVu
ID8NCj4gDQo+IFdlIHdvcmsgdG8gcmVzb2x2ZSB0aGUgdGVzdCBmYWlsdXJlLCBpdCdzIHRoYXQg
c2ltcGxlLiAgSSBoYXZlbid0IHNlZW4NCj4gdGhlIGZhaWx1cmUgc28gSSBoYXZlbid0IGJlZW4g
bXVjaCBoZWxwIHRvIGRvIGFueSBzb3J0IG9mIHJvb3QgY2F1c2UNCj4gZGlnZ2luZyBvbiB0aGUg
cHJvYmxlbSwgaXQgd291bGQgYmUgaGVscGZ1bCBpZiB0aG9zZSB3aG8gYXJlIHNlZWluZw0KPiB0
aGUgcHJvYmxlbSBjb3VsZCBkaWcgaW50byB0aGUgZmFpbHVyZSBhbmQgcmVwb3J0IGJhY2sgb24g
d2hhdCB0aGV5DQo+IGZpbmQuICBUaGF0IGlzIHdoYXQgaGFzIGJlZW4gbWlzc2luZyBhbmQgd2h5
IEkgbmV2ZXIgQUNLJ2Qgb3IgbWVyZ2VkDQo+IHRoZSBwb3dlcnBjIGF1ZGl0IGNvZGUuDQo+IA0K
DQpIZWxsbyBQYXVsLA0KDQpJJ3ZlIGJlZW4gdHJ5aW5nIHRvIHNldHVwIHlvdXIgdGVzdCBzdWl0
ZSBvbiBteSBwb3dlcnBjIGJvYXJkIGJ1dCBpdCdzIA0KYmFzZWQgb24gUGVybCBhbmQgb24gYSBs
b3Qgb2Ygb3B0aW9uYWwgUGVybCBwYWNrYWdlcy4gSSB3YXMgYWJsZSB0byBhZGQgDQp0aGVtIG9u
ZSBieSBvbmUgdW50aWwgc29tZSBvZiB0aGVtIHJlcXVpcmUgc29tZSAuc28gbGlicmFyaWVzIA0K
KFBhdGh0b29scy1Dd2QpLCBhbmQgaXQgc2VlbXMgbm90aGluZyBpcyBtYWRlIHRvIGFsbG93IGNy
b3NzIGJ1aWxkaW5nIA0KdGhvc2UgbGlicmFyaWVzLg0KDQpEbyB5b3UgaGF2ZSBhbm90aGVyIHRl
c3Qgc3VpdGUgYmFzZWQgb24gQyBhbmQgbm90IHBlcmwgPw0KDQpJZiBub3QsIHdoYXQgY2FuIEkg
ZG8sIGRvIHlvdSBrbm93IGhvdyBJIGNhbiBjcm9zcyBjb21waWxlIHRob3NlIFBlcmwgDQpwYWNr
YWdlcyBmb3IgUFBDMzIgPw0KDQpUaGFua3MNCkNocmlzdG9waGU=
