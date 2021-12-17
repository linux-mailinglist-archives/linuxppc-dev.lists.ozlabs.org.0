Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8294784EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 07:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFfH02z3fz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 17:30:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFfGR0Nwdz304R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 17:29:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfh/p7JuVOWdumx8Og3g0A3U+tYn22LRzN5Ch/n1lWhnTyfzL7v4SZiR73/1ktPKYCbxZM/xtcKG7ImCirD36ywYBd53JbARJyVptL3ucYSpNIjYQ1vBAMZVjNPLHH70IkhtcouSkW5LkXKReJ590pfVxdPdioGximWfsfWfOYpi3h/6UjLl5Iy9aBVSsHAOMPT8CwUb1cvpP6Nupve88hyYaoKldTNf+iodGBbosDXR64CDIQwTBUGVRzezs1pjP8tYuKhEZO+vuERnS+Oe4xdyisDqali8dryouE7WS1QDMxCwQAgioNC0yYErAg1hx1hr8K4tm6n84guCkPA0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCVa34PXHp2h9o+dVRfZtZVbhSO1DDChYHpsGRbaHdA=;
 b=QD8f5fFqHiMrswkCT6lqbzSXQA2AnpZb2IRCxJZud3fN73Dkp65waOOXhL84TEW25vtXQsOaGdzPztwEIpd1QhjvYKD9f+LP9ylMUPSL4KKdTL870x94fLyYeW7Z3E1xsE9Vb9JBxpgMraiptHJPfoJNUPgfxvZiHyS7v8t2nVe/Pl1nmpMkZk9iUc5xuBoUjnbvS3if5Fqy28SxtUCCpe/vu9rQI99Hy4fX97ltOvx71fG7SrY7KqJaFH9BmZW9Gut5W4YF1/QqKyVTjvqRHKtx9CmsHgIqauCUeYjmKK6AVJ4GYE1EXBraVPof5Oe5wCFGMEHGoMCNkM3Dnw7qxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 06:29:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 06:29:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nick Child <nnac123@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 00/20] powerpc: Define eligible functions as __init
Thread-Topic: [PATCH v2 00/20] powerpc: Define eligible functions as __init
Thread-Index: AQHX8sh4VMNy9vZNSE2refa3Neo9gKw2OTkA
Date: Fri, 17 Dec 2021 06:29:08 +0000
Message-ID: <f1bdd55e-1141-c118-0f6d-b5ce61c6f7dd@csgroup.eu>
References: <20211216220035.605465-1-nick.child@ibm.com>
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10369598-4ef8-4915-fe4f-08d9c126882e
x-ms-traffictypediagnostic: MR1P264MB2179:EE_
x-microsoft-antispam-prvs: <MR1P264MB2179B10323FE498090D9C038ED789@MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HHkkZ27BSjwuouZ49Qzd7wUy/raI53sjzCpwQhkFtRjTRUP+OQmwDA6mDiDvT4nowV29p6Q5eHScDVAKC2timyd6tEkPUcgoqKoZpnHGE3vVGzaLVlccDtDVg68msK6M/HYv5WOoR95ScXQxNSMOAqEsPwwhpin9C7uIz4TuOW/Cew0g7f+sNHpJxbY7rw3+xuZwsrA7oeu2mnbVt3EKN9D/EAFnQ+E70i/QMNRtAXM6Olp4QzVnFtLH8fIn9bX0dnDESiKL/Uk6woommqsDGkJIWhVQunQ86FxZN6IsoL4XvAed5rseYPsDA2JDTWLPVI8wWOP/luB9La/IfzbBiCTHZxZ4x7VZTYREawDVWs134xwqe2RMQLt8mTg8q0OyEviDS03j5uFXiQs+R/yikBTyonmuxT5LxH4S0FRZ7mbe+k+YBqWj6xZkkZT/YFRDIQ60gceIJaxOCbNay2uGLAOB/JKsryjZlSEu+ShfjM7tWFXQ+tJSJYQ79PrZLvTToJSdrZOfLJiDAQFFppjZ0Mjw6WhkhWCTmr5rrwV6C7r0zKTv9OvgWw7sJpEHSUUmJAEHtxyPVo63OTC06vozhh5Pw46/BxWvKV6MgCmnNDX1+WdZcBWPfPpYiiwkrLAM7BPWeM4+srD58Dr0uL2NONQwq/n8BE/LCNicmRB8D0umutGNbpzNR27lnWiOubpP7FTzylha5PmJZZrrOtH1z8dgNB52bIcccwmQeyn/hXIhvwagOILNXyhY8oHF08OSOaIKEuEDJOI6FozJ7HFOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(2906002)(86362001)(122000001)(186003)(36756003)(6512007)(2616005)(110136005)(8936002)(38070700005)(71200400001)(316002)(8676002)(66574015)(44832011)(26005)(38100700002)(91956017)(76116006)(31686004)(6486002)(508600001)(4744005)(66556008)(83380400001)(64756008)(66476007)(66446008)(6506007)(54906003)(66946007)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZET3pMaUxxZzBySXNXZkg0OHMyaEk1OVJjODNtSjc3NHF5VGloRWNacDFx?=
 =?utf-8?B?UElJWGJLK0IzQmhWTWgyTnFtVzdzSWluL1c3VCsrMU9uanBTQUczTWxCV2w4?=
 =?utf-8?B?d1dBV2pGS2o1RGVxdnl3SHo0MDBYSDJVRXh2WVNBZlR0ZEgrSXpqRmkvWExM?=
 =?utf-8?B?M2thaU9yWUZqRkdBV2lCMXgxM3Y3T3YrRzlTVm82MnJVei92ZkxsdW12anFP?=
 =?utf-8?B?Y3NncWxjYm5GMjNBY0tRWlRadXhPMkt3T0Z2cUxIUDFlUjBiTEFSMXlrYlFl?=
 =?utf-8?B?ZVNrbktnQnA2Z0JVeWZXY04xckRKeUVwdWY1YlJmTFhZdjdCME5WTzd1N2F4?=
 =?utf-8?B?aERJVkRLZm4xNFdIRm5zelNKS2VkSE1RUk9RazVoL2tkTFVDNWFzWGhwejhr?=
 =?utf-8?B?a01LMk1ldmFxcXQwakN2UGhjUjYyYkZXNXVDdmt3cWxOb1JBMWdJaU9tZjlF?=
 =?utf-8?B?ekdMWGJUWXAwSXFRZ2V6L2FSWVpPV2NNRXNCV0VmVkZzS3NZQVBxaS9mWkg0?=
 =?utf-8?B?Z3QvT3lSa0FDajNwdzlMRG80ZThMTncrU3AvS2VYYUNTUEJEaHg3eURpYVMv?=
 =?utf-8?B?MWxBdzlKUWRHRkU4ZzB3SVNaZEI1K2RCbTVPcDdqWWVpeDBiaWhBNHhNcU1q?=
 =?utf-8?B?akxiSFlBSmRqL25JR1VEYUlXTlhXSFZDcVZzdHlXZVA0elIvMW03a01RRmVP?=
 =?utf-8?B?N2NRRDgvbFlSYmx5VTBka1JhREN3T3J6QUxScTdva1BSZGkyQ3NiUTdMYWlO?=
 =?utf-8?B?MHpzYjY3bVVTWk9JVC81MmNyaFluT1F5S2RmTGpzUndLUDdNOGxFbXEzdUJH?=
 =?utf-8?B?N3BjejNqRWlYMHVtVWpwYVBMR0YwcVY0L08xaXpEWVRFTUZrVjdXcWMrU1k4?=
 =?utf-8?B?YXpzT2hKZkJRT2pLa2xZZzRqa0NCVUNCSUtSSFpaYk5VUmZnRWlDakpHdVNV?=
 =?utf-8?B?TVowWUJyKzdBUHVRR0ltRWl2UmZnMkZ1QUd3ZXhyaDQ3aVhxWjBCVjZtMFgv?=
 =?utf-8?B?UTRnZFJoYlBoTnpLWm9hcTV4dTBpRTJtWFhNSmlEcXMrQnVWNWhNUFAwY3BL?=
 =?utf-8?B?Y2xJbngzTHF5Q0VERlhWM3l3VkFZOEUxRkxRZ2NMdzMzaXFUNVZyWWN6a3Ru?=
 =?utf-8?B?bUhNd0tOd3A3WTE4MnZvSnlMVW1zTVdXWFIvbDd4YWM1ZXFRZzhKZStpMzJB?=
 =?utf-8?B?bVNLbFJKb3FUbzNtbU0zdzcrYzVTM3BGa1p1aXpBem1QQkY0NVpNZ0w1ZXVt?=
 =?utf-8?B?T1dnNlNHSUd1YjlweGlES3g1b0x5M1htU1kyNldJNkdjSmRsTlpVUmhLV2RG?=
 =?utf-8?B?YXdoaGFnYWNmcUhyT0ZCWkg2SUFiNzhmOUQ3clR1b3JRdm5xRjBLQlZPK1gx?=
 =?utf-8?B?WEVubFc5c3E2QkxubFcwQ3RhaUFuUXlWK09zcE5TeXdNVGE3bjdORlErTDhB?=
 =?utf-8?B?UHVDNThoZzBVcytDMVFEOWpYV1pOK1l4ZzJqOGxIQTZTdmZURFd5L0dCZ0pu?=
 =?utf-8?B?VVNyaG1RNkF1Szd6MURvUVhsSHVBbitUdWYrMkpXNkw1RTBQZ3I2ejdvR1Vx?=
 =?utf-8?B?SVpUbEt5VWFTTzFCNWNwTVBNNzE0N1NGVmloZGxLem1venFvZVJhKzdNbGYr?=
 =?utf-8?B?R3JoenZIZk1DQXdKNzF2NUNueExRN3MyZjRoeG5TQ2VReDZ1d3FXSU96THk5?=
 =?utf-8?B?eTYrRk91bUpCdzdCdjRsbk00cVhnOXVaazY2RW5JdEdkVkdwbDFsYUF4VjlD?=
 =?utf-8?B?ZTlJMytMZ0J2RjNIbUw2UTB2VVFybVJMTDB2ZDdiNkM3NkJ5ZXBHTnNLWU92?=
 =?utf-8?B?WURLTzVlYkhtTGUyMVY4VmVJaC9mRkVISlllSXVUbTBTT1U3Ujg4SXg4WFZX?=
 =?utf-8?B?RnY0T1NiM3lWbjZQd2grQTR6R3hBVDZDYkU3aXMybjgwZGZ6ZkFzcURKdzFi?=
 =?utf-8?B?QkNwUjVpN3MxZko3WkZUNnNTcEhhQytYTzV3WEtZMGxRdHZwYUR3VjVpWlpZ?=
 =?utf-8?B?RmRicG0ySkpvSlg2T2dCSThlZ2VySS9ybXUxTUxKUWFZa3N5cXlQR2xjQXla?=
 =?utf-8?B?OUhwR0JFOGVpdWx1WU1vajlrVXVDbVo4NVlNM3dXblFlZ1N1bDJub1ByRzVh?=
 =?utf-8?B?MkRkdWwxSytkbko2MDV5Wkt4RUpHODJoZ3FISm1ncEJoRUo2cTRURWVmOFBH?=
 =?utf-8?B?UHRzSEZoaFdFVWhVZlhZL1dzUjdwZHNZQXBad2ZEZ1I1bDZlSm1XMGx2cDhp?=
 =?utf-8?Q?6uefwNNhyclT4DLTvgYK6T8iVk1UsKAjO+WGtA3Z64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAB827440AA658428531B66ACE9677A7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10369598-4ef8-4915-fe4f-08d9c126882e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 06:29:08.6554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Pa9WXid3kVS+3zjlQ+eSNukZGToDbsfQGz8vkZIOncabEQNjuIIBamJotdLbnO3IaHsIa9zTIUbCnwxVbpu876VlQXHTNmo9tj/WhoWijo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2179
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
Cc: Nick Child <nick.child@ibm.com>, "dja@axtens.net" <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzEyLzIwMjEgw6AgMjM6MDAsIE5pY2sgQ2hpbGQgYSDDqWNyaXTCoDoNCj4gDQo+
IENoYW5nZXMgaW4gdjI6DQo+ICAgLSBhZGQgYF9faW5pdGAgaW4gcHJvdG90eXBlcyByaWdodCBi
ZWZvcmUgdGhlIGZ1bnRpb24gbmFtZSBpbnN0ZWFkIG9mDQo+ICAgICAgYXQgdGhlIGVuZC4NCj4g
ICAtIHJlc3BvbmQgdG8gLi9zY3JpcHRzL2NoZWNrcGF0Y2ggZmVlZGJhY2sNCg0KWW91IHByb2Jh
Ymx5IG1pc3NlZCB0aGUgZm9sbG93aW5nIGNvbW1lbnQgZnJvbSBjaGVja3BhdGNoOg0KDQpXQVJO
SU5HOiBGcm9tOi9TaWduZWQtb2ZmLWJ5OiBlbWFpbCBhZGRyZXNzIG1pc21hdGNoOiAnRnJvbTog
TmljayBDaGlsZCANCjxubmFjMTIzQGdtYWlsLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiBOaWNr
IENoaWxkIDxuaWNrLmNoaWxkQGlibS5jb20+Jw0KDQoNClNlbmRpbmcgZnJvbSBhIGRpZmZlcmVu
dCBhZGRyZXNzIGlzIHBvc3NpYmxlLCBidXQgeW91IHRoZW4gbXVzdCBhZGQNCg0KRnJvbTogTmlj
ayBDaGlsZCA8bmljay5jaGlsZEBpYm0uY29tPg0KDQphdCB0aGUgdG9wIG9mIHRoZSBjb21taXQg
bWVzc2FnZS4NCg0KDQonZ2l0IGZvcm1hdC1wYXRjaCcgc2hvdWxkIGJlIGFibGUgdG8gZG8gaXQg
Zm9yIHlvdSB3aXRoIHRoZSBnb29kIG9wdGlvbi4NCg0KQ2hyaXN0b3BoZQ==
