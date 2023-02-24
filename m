Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D26A1B11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 12:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNRpY5Nmjz3f54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 22:03:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=l45vafFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::624; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=l45vafFF;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNRnX2pSVz3cf1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 22:02:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw/ouGKZ9N124ql3fNpDK9+Oo3gsQuXGbmbNWu74wlouk0JC7s4OHqDoiKPPXddcgWrUdCNYS076oI3BQvJdcGB9mn8FzcJJZRqe5gRlsEnsdWwaZ0FlD1AZE+jPdi3w4IFQqxphvfNi31x8HhIe2g1yZ2AX3DGhP0tc4YcZU1uNHPBpmC+NFizhHBwZkTmM3UrRYCWTReANL7UUCXTTPWwsupmyaPnxDbOVKmjos2ZdHmvhwAFIIq5u/JxTsyRZq5r7tySSqJC+aR/bG7ryjFp/Bq7OTOrY/tZpuy1p9tFt7T5Zxd/o1VetQPwS08AyuDiAFTssq93kT0DGJXCBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2rLJNgR25r0/uIfhVsauvSuNpOL1jdgMWo6iw0g1f4=;
 b=FIG8fKg4VYLSQfHTWN5FzqHs7Vszj3+Z16VhT94b73nbR82jn1mlPqlnLFVTiqX8OOVADlfjhKKT5zdPcWGAKAZAyIf/TU6/eMwxectfARV5S47esn3rqOtv4KmdoS/TXIxyEDhKOlfcusNUuxj7Z0RGSL9eCBzz1hc4PY+tt6lHxRMnlx6CQsnos89T8EUKe2MXQRnM3TWmiFjVhIgtBtXhZqU6y9/HUGQHYcfKhOrlTw3plQiMDYCHgtNoErFtW4e+suS6IEeYmvs4Nd2vc33+dBv5Onk6yMK+qXf7khWH9dyybKaFdsWvRxYekObR2H3TDb3sB3DFHvCcUz+3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2rLJNgR25r0/uIfhVsauvSuNpOL1jdgMWo6iw0g1f4=;
 b=l45vafFFF2qmf9QUbwtFgynhgAyLsnPZ8//1WkROwa9q0lX+lJG16FunxxOaOo9yOgmDdIsX8dAVrpADuHX9RQ7APCOFxXXIp5ZXpYaE7eBNtMklS5YVMmzfu+Fo1zfVt6XUoMpRGZtdyhkLx2gp5hPFTG/Bll9iaYD+rDnkVxrPFN+H7xYB89zTYL/pI+LfgZGbOcga5YsPRtvY1C477VKTNN0a3k2JhjUCnAZN3sMgWjhOxvfTNuxzQz3qq1q+NJbcAQcBIQBNAr8XGB8pIdADjkKlNdKIlsPhIVw6Uqyn2tE/xNJW6b60cJKLFbiKeGND1iwiimlxO/sIsmr1Rw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 11:02:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 11:02:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nysal Jan K.A <nysal@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/atomics: Remove unused function
Thread-Topic: [PATCH] powerpc/atomics: Remove unused function
Thread-Index: AQHZSDyEoevmJvzFK0S6o2NTVEEMZ67d7oGA
Date: Fri, 24 Feb 2023 11:02:31 +0000
Message-ID: <2ca14657-8bc3-f4d8-c4ca-212a982bd209@csgroup.eu>
References: <20230224103940.1328725-1-nysal@linux.ibm.com>
In-Reply-To: <20230224103940.1328725-1-nysal@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2092:EE_
x-ms-office365-filtering-correlation-id: 1e1af9e6-8c08-4fbc-4a24-08db1656a08b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pmALmFLpMj2QJcJs5bqZEBOYqB/M6nSWdVOWyc7qI6aZcNZZHubTKfepKzhZSLMI+LUIlQ0gKjaxCdLnFQO6a8zvIgnoHDgsq6ciHy70NUfJdi8Tm8gL3HwjMh+Weerg8u2k2JTDrufQMrsT7xiJ1Fw9Kz5GCxnbhIu4HnSPvop7CMXg6L1dCaMkPrHfgQTePY1AccbByIJmyh1yxYCHsoRAu713N4UvZus/wXb6x3lbR7htXErqOJgTcPlgua0FnLRAaeCyCPpDfr2hP/g56uUdjZ9FdL53XKP1P4ue8medNH5zZRSVHexctVsASsGnPBowl8DRExJ7H/Y6GZ2+ln2IWZQgHbQ/Df130fCf+6yeR/vahvD2oA5HDLyUe2oEU3StxPr4wxDbqm79y07Fq4wJX5k8iwV5wBGGtl0+b5HC3m60OlKEFmhCs1yaN2RjHzyGmSIBiAhPH5G3MAUOzWHpnIERZlN+xWIdPA84n+te8u0CYrNrsH+DdR40spMNNjRyj74hDmJob/Jy6Y9eR4VdBOc2/Im0TA9+7McPHkOCbCq671X/XlVfF05KsGHRg+rOPStzzVcippZORYyfJ0kVg/kiA1cQfFlVhLRT59weWVodmQ39pwl40TWcFdIP8C483X8MduVyI7bxjsyqZBrPzqNBgSWj3Yl/ANBIJ9qoOSi7nRDstFHO3xtMHd2La1L/l4WvMPPwx83RW0jHCcWLtL7HQPWl5jZ7Iij2opypJAcfl/jqwcqHkp90ex2nOZxVE87r4nfxa2QjuRYWYA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(44832011)(31696002)(86362001)(2906002)(38100700002)(122000001)(31686004)(6486002)(71200400001)(966005)(478600001)(186003)(26005)(66574015)(36756003)(2616005)(38070700005)(66556008)(66946007)(66476007)(66446008)(91956017)(64756008)(83380400001)(54906003)(8676002)(110136005)(41300700001)(6512007)(6506007)(4326008)(76116006)(316002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SmhjQzRrV0NrYno2UWh2djluVHlLbFlNcXRid0w3OTJoako4RllVeEVKWnRP?=
 =?utf-8?B?WDUydmYyNFNGN3VUUlVGS2M2MHo1VzJtQnQwMzZoZ21EY0F5Q2xxL1ozWG9k?=
 =?utf-8?B?WEl2Zmc4Um43L2p1dlUzRlJJWGZaOTU0ODJVZmdhU3V4d05qK296dTBKNDdx?=
 =?utf-8?B?Z3pNaGNOL2dHMFZmL0RDa0c2bUN6S0pZWkFJejVvUnFrTUtmUDFXNnY0KzdN?=
 =?utf-8?B?VllNbXJiWnhEQUhKSldTOE81Rys0bkpWbHJZOFU5YUFzNThaU2hnTHcyK2RE?=
 =?utf-8?B?L2x0cDFveEFzckN6ZGk3UUpFRVV0eHJzazdRT3BndytmRW5IMjV0dkVOS3R4?=
 =?utf-8?B?RGhqUWRpUmQ3SHltb2c1eWJCcEtIUDJmMG1ieHB1WEVQSFdZSTd4enYzMEl6?=
 =?utf-8?B?OG1IOWZrQytlNlZzYTZOa2tIY0Z5cGtQMkViYW5qazdHeTc5VERSYkluQXpJ?=
 =?utf-8?B?VVRpSnhRRWEyZ1lJVEs0cWt6a3V4czhnOHlSYjRMZGxXUklsWmplQWpUZjJZ?=
 =?utf-8?B?TnZoRzlldjdrZ0JaVU94Z3N6VW9UeGNvVTVTL1dzSHRrWkV6OWUwemR6bmFm?=
 =?utf-8?B?dG9xL0tiV1l4WnVjWnpBdFhvNThnKy80bnVKVkpBWndoUi9UZmhkUjJvUmxu?=
 =?utf-8?B?UjJnemxGanFUYytBTEx5NnhJeWdWdUdwVzdZbW9aZ1Eyd3BFcDY3TEY1ckZV?=
 =?utf-8?B?Q3hkZklXWGhNcU1BdUZMYnp1SURMMXBxa05adVVpcmFha0NZQnd1UXZIZWc5?=
 =?utf-8?B?UFY0RWkrWm5GMmJrY0JMSkY1YVlJYXAvZTJ0TFMzQjBuZ0pnZmZLN1FTRktp?=
 =?utf-8?B?S2xsY1J2Yy9PbzRpS1BtdENmcXU0YWFqTUFaRVRiWVN3NXVhdHRjWFI3bERJ?=
 =?utf-8?B?Wk5NN0RrNURIZUUzeTBKa1lqSCt4cmxaVWx6ZjJPV3RJYm8xZ0dlMXZXMjJl?=
 =?utf-8?B?Q2kwSTlmNGtjMlBBdzZ6WWx5L2wvMmV2WktxeklOUHVubmh3MENQQ2hyZW1t?=
 =?utf-8?B?cXNRRWthZGNiaFNHYUZWNDhzcFpQN0ZTbXJwMWtGS2Z1WGZicm02dTE2Y1By?=
 =?utf-8?B?VVA4QmRoUzMxVlp6Tklkbmg2TjdqbTRNWnNGOGNyREN6NUdISlFVaUVTV0tE?=
 =?utf-8?B?Wmd4NzdOaXRhb2VyNGZJc0E3OUR2dVlCM0tDUGoxbytYV2s5ZVUyTzRyRlBX?=
 =?utf-8?B?ZEJ3eExzeHpGb2gvL3dyMXF2QmVlN3ZTNUMwdWozNmpMK3djQnp0SWVEbGMv?=
 =?utf-8?B?ZkxIRkttQmxSZEZ4QjFyVlRBaVdDOUh2bEtIL0hicGZkWjRSSmYyL285UWI4?=
 =?utf-8?B?ejZObEJlZDh3cG9BWElCaU9wWFJuZlhJUzJrSyswVmxpd0NqMFFMcXRTSk9R?=
 =?utf-8?B?NW1lYmtnaERPMmRvZE1mTWp5aFp1R3ZPQW5mQytVbUs1RnFHWk5LeXNaRmtm?=
 =?utf-8?B?NTgyZSt2ZHlUZkVDaW5BMEZsbkJNRTB0WmVKVHVZL0NtSzhhcVRKaWJIZ0Ny?=
 =?utf-8?B?YUhtdm1DYmNYdGxQdzdwSk1rdFh1Nm4wNTFhcXJMcU56UnZySjlNajdLd0tO?=
 =?utf-8?B?Q09RV2tpcVNXNkpjbGJHK3dFZ0lUUmtOVjlTYjRiSnUrSXlaUml1Qytwb0g4?=
 =?utf-8?B?VWc5M201d1BOaDM5R1I4eXh3VU9zaEx2amRUeW8zNUo4SWNSbnRhQmppVjZ5?=
 =?utf-8?B?WisvM2dsdDUwQ1Z4enZvcWJhMS9TbzRsU3ZXczZiRFk4aXlLeXNyY25WdlRD?=
 =?utf-8?B?WUJ6N1hYRFkzU0xpejRYQnNDMWtoNkkvTUNGcy91Y0tPdUZyM2I0TUY0dXh1?=
 =?utf-8?B?QisxZ3lPVGxRMEJJa0ZiUndnOXd4WDU0QWMxZkUyUXMvYUhnbXBCTzBjQnhN?=
 =?utf-8?B?V1FKbEtpdTc5a1FWTG1WMHRhZGNBTWFTVkNUYTIvbUY0OFlMYlkyM0dxT3Jw?=
 =?utf-8?B?Q0J0T25Jdk5CRnNrNHh4SWhGbWZkQUs3Yk5UWG9pM2p5cTBEZGlJdmt0UlA0?=
 =?utf-8?B?TEdIT3V5NlFNNTBjZVQwMXBHODBrckE5SC9HczNIdTZNQXFiWUFzVVl5Nkgy?=
 =?utf-8?B?M2NZcU9EMjl2ZnZVYldDVDExRGJmSmlZTk92YWV6TllsSlcyQzJwODgxSlBn?=
 =?utf-8?B?M05FT0xwcGJMVWFWRjJqTnBNa1g2VFZEd2ovZEErN1o3NTV5d3VNTnhjbzN1?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEBEAFF87C5D77459102D999A59C2DA5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1af9e6-8c08-4fbc-4a24-08db1656a08b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 11:02:31.9070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCvVa1WHFXOEz4PiCXP0OGVUcffQfn7KDimQXpXxM42apZ2sESOkant1mUxpMGlyJJiYJUhWfgN08w4+c+pCGwgdNmvpFbDTtwkvjhlFhEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2092
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Boqun Feng <boqun.feng@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAyLzIwMjMgw6AgMTE6MzksIE55c2FsIEphbiBLLkEgYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbnlzYWxAbGludXgu
aWJtLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFJlbW92ZSBh
cmNoX2F0b21pY190cnlfY21weGNoZ19sb2NrIGZ1bmN0aW9uIGFzIGl0IGlzIG5vIGxvbmdlciB1
c2VkDQo+IHNpbmNlIGNvbW1pdCA5ZjYxNTIxYzdhMjggKCJwb3dlcnBjL3FzcGlubG9jazogcG93
ZXJwYyBxc3BpbmxvY2sNCj4gaW1wbGVtZW50YXRpb24iKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TnlzYWwgSmFuIEsuQSA8bnlzYWxAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXRvbWljLmggfCAyOSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXRvbWljLmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYXRvbWljLmgNCj4gaW5kZXggNDg2YWI3ODg5MTIxLi5iM2E1MzgzMDQ0
NmIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hdG9taWMuaA0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXRvbWljLmgNCj4gQEAgLTEzMCwzNSArMTMw
LDYgQEAgQVRPTUlDX09QUyh4b3IsIHhvciwgIiIsIEspDQo+ICAgI2RlZmluZSBhcmNoX2F0b21p
Y194Y2hnX3JlbGF4ZWQodiwgbmV3KSBcDQo+ICAgICAgICAgIGFyY2hfeGNoZ19yZWxheGVkKCYo
KHYpLT5jb3VudGVyKSwgKG5ldykpDQo+IA0KPiAtLyoNCj4gLSAqIERvbid0IHdhbnQgdG8gb3Zl
cnJpZGUgdGhlIGdlbmVyaWMgYXRvbWljX3RyeV9jbXB4Y2hnX2FjcXVpcmUsIGJlY2F1c2UNCj4g
LSAqIHdlIGFkZCBhIGxvY2sgaGludCB0byB0aGUgbHdhcngsIHdoaWNoIG1heSBub3QgYmUgd2Fu
dGVkIGZvciB0aGUNCj4gLSAqIF9hY3F1aXJlIGNhc2UgKGFuZCBpcyBub3QgdXNlZCBieSB0aGUg
b3RoZXIgX2FjcXVpcmUgdmFyaWFudHMgc28gaXQNCj4gLSAqIHdvdWxkIGJlIGEgc3VycHJpc2Up
Lg0KPiAtICovDQo+IC1zdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wNCj4gLWFyY2hfYXRvbWlj
X3RyeV9jbXB4Y2hnX2xvY2soYXRvbWljX3QgKnYsIGludCAqb2xkLCBpbnQgbmV3KQ0KPiAtew0K
PiAtICAgICAgIGludCByLCBvID0gKm9sZDsNCj4gLSAgICAgICB1bnNpZ25lZCBpbnQgZWggPSBJ
U19FTkFCTEVEKENPTkZJR19QUEM2NCk7DQo+IC0NCj4gLSAgICAgICBfX2FzbV9fIF9fdm9sYXRp
bGVfXyAoDQo+IC0iMTogICAgbHdhcnggICAlMCwwLCUyLCVbZWhdICAgIyBhdG9taWNfdHJ5X2Nt
cHhjaGdfYWNxdWlyZSAgICAgICAgICAgIFxuIg0KPiAtIiAgICAgIGNtcHcgICAgMCwlMCwlMyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiINCj4gLSIg
ICAgICBibmUtICAgIDJmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXG4iDQo+IC0iICAgICAgc3R3Y3guICAlNCwwLCUyICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuIg0KPiAtIiAgICAgIGJuZS0gICAg
MWIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
biINCj4gLSJcdCIgICBQUENfQUNRVUlSRV9CQVJSSUVSICIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXG4iDQo+IC0iMjogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuIg0KPiAtICAgICAg
IDogIj0mciIgKHIpLCAiK20iICh2LT5jb3VudGVyKQ0KPiAtICAgICAgIDogInIiICgmdi0+Y291
bnRlciksICJyIiAobyksICJyIiAobmV3KSwgW2VoXSAibiIgKGVoKQ0KPiAtICAgICAgIDogImNy
MCIsICJtZW1vcnkiKTsNCj4gLQ0KPiAtICAgICAgIGlmICh1bmxpa2VseShyICE9IG8pKQ0KPiAt
ICAgICAgICAgICAgICAgKm9sZCA9IHI7DQo+IC0gICAgICAgcmV0dXJuIGxpa2VseShyID09IG8p
Ow0KPiAtfQ0KPiAtDQo+ICAgLyoqDQo+ICAgICogYXRvbWljX2ZldGNoX2FkZF91bmxlc3MgLSBh
ZGQgdW5sZXNzIHRoZSBudW1iZXIgaXMgYSBnaXZlbiB2YWx1ZQ0KPiAgICAqIEB2OiBwb2ludGVy
IG9mIHR5cGUgYXRvbWljX3QNCj4gLS0NCj4gMi4zOS4yDQo+IA0K
