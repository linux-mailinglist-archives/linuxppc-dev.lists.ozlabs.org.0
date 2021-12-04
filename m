Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AB4683EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 11:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5lbd6gysz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 21:02:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5lb66dztz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 21:01:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9RpLse1oqUFLTLpmyfA1gAQ8MoyurTHDk55u8kPiNE+dEchb3bgFG4n+GgK4yswmkA3wjg9p8Kyx5B+nIQZbKvTAwyg1SWIkzvQtsWVo7JwCgWAPLIlhlPVVoeBDF4bhCSxHRdiAzuxBMORCBH9goQigHO4Mmp/Vdkq7fVykJHtnf+iLBg6dy+QGH+NmqsaPPPZIhgOlmx6Xq6JJAWzl3NbngoeLfwJIxEPCCGDFUS++gdhKWegz6jTNt4J2glukn50D1mDhKjcwTLIhxnUSwH1yVWLFSEoCCJPIFAjH65ssTTYgfu2SN+EuN+93uSU8DcgZ5OIOWXK9NlwqsLwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E8pCpsf9hKfshP7txpKUqijqWzYXS9gT/VNv+fZLh0=;
 b=EOndlHbHqzsW0CBMMTNvpDieMDlQnMPcSU2f5IepB6Mxjt5s7uyYAE2ntecMzn/WWkwwgY+r8fLpVpfGHaTXiz6IwaRyar/OtWnCd1ySAwH0GOhdRd+FKMkHaMmX496yL+PxMwAcETrVSg7+HMCOYzDKJINFtXsSO5el18MC4USSn6qZ7Vc5bdqLFNoRVyYXF7S2Mb35HClTAvWAUQEk7RDmdvq59nI5uAMLdOQKsvtQzSmGvohTSUtMT1NsUIrg+W+d/WwlB1z8x8bADV0Pv+yYknL7B540clqlHOqBQDwGo17ao+s3PaRZv8LG0hVQ67878SKPpFD4pC7rMOSskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1761.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Sat, 4 Dec 2021 10:01:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.016; Sat, 4 Dec 2021
 10:01:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigA==
Date: Sat, 4 Dec 2021 10:01:07 +0000
Message-ID: <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
In-Reply-To: <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 986fa33b-53b7-4e29-9438-08d9b70cfdb7
x-ms-traffictypediagnostic: MR1P264MB1761:
x-microsoft-antispam-prvs: <MR1P264MB1761EE9459E029B9D9767C0CED6B9@MR1P264MB1761.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2/+JyTHaeCRLbJDpc7nCS1uUm8cTKKyaosLhAc3lVNFUj16gyb2txwetmJXl0wxhLlGysX5nOIZuQ0QAijW1NNPBiEBaueRihZoXid65onPLuHFHuyW1lqDMhCHsBVp4HxUdSFdHZE0oDCGN3pShO23bPaPrR4zZYQFRkiTrIk/gOA05Fm5XQFsFDIGvHW7Nx4lshWjGlQ6nTGbsucwcwt/KrgAKg42+jstWlr3VP7Wu1r9YGv6PwcVZ5eocqgkdRY8CSha2KNhEQ6hb2w+aVDDkOpPB8U8HQ1zkIb8wNUIpVpgKHcbQRPQHaaBMv7pNM88pKh6GyAXFDSoeG2yY9QwkULjD6q3EdNmw8pcwwDNCMojSrkm8WzY9d4O5+thbIl6yyPhcl8B6rdNFo3qfzghAH4lOQ5RliYspd25yn4ZB5/qUKVN8/RmugRJjmW/TJta5+Ooq1uMkIe4p5VPvPghsrYoMFOi06937KWnkkPuwsF+p8Dc9nT2iH/UNPQTizlXLhRUGLebuQ4+0/I+357WNZxkRinH85ZiU1ffWrAEjmVlCQlvIjFlBEGk5qG9fOOTIx2uDA2raYBgPUnj7TILdODSNxmHH306W2JoeV17GU0cYsDpVqu/UM5nvzpTaf+TwA0dMeTgy9DrqpxPePI2ezbE4piXzSKOwEEQ7ehwXs2Wk1m6LUIsMlHmNthRlD00t2zBUHilQhWc+zz1Dazp0fSz7gVlaSs7IoFjZmdh/a+H4RtyEct/vaBwzAzDXPoNY5rGdVlI0LclSRhvcrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(110136005)(64756008)(86362001)(76116006)(122000001)(91956017)(6506007)(83380400001)(508600001)(36756003)(6486002)(66946007)(8936002)(26005)(31696002)(66476007)(316002)(6512007)(186003)(5660300002)(38070700005)(2616005)(66446008)(71200400001)(8676002)(2906002)(44832011)(66556008)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVN1c1lLcGZIYW84NTRiZSsxLzlnWGJXR1lhd0d2OG15UGZBeG9lSXFDaEp2?=
 =?utf-8?B?a1BOaTU3MHZ5VDRSTEJ5OWo4ZUszZW15c0JBNEhJaW90VnhrSTh2cW80c2dS?=
 =?utf-8?B?YVp1c2sxdnptSmd0aWZyYzU1a05iU3MrL1VSZlpsbGxOcDVQRm1VZUdFZ211?=
 =?utf-8?B?RVFjSTR2SnNmd3lkYnZNaDVFcGw2Z1RIeWZwdk1JZzA3Um9tb1FLbGR0SGgy?=
 =?utf-8?B?M05RM1NRNG1FbEw3NDNuZ3F5N21lU0lsWnpKOHZhb0k1elVkbzBZTWI5YXBv?=
 =?utf-8?B?ME9BK2pUeDltMHMxSk1GT2tiUVA4aFJXU2dVUS9Yc2JuTldWTkZtMWpPdE96?=
 =?utf-8?B?V2hUQlZXQjc4K0w1Q2tYT2N2OXBoNTlUUmpzNkN1M2lhYXUxV2VlQmtNSE5r?=
 =?utf-8?B?VnB5b3BOV3Q4cldOd2EySW1IWGJhYkdldzViYXFDeWlwN29NZkVTVVlNMDBG?=
 =?utf-8?B?OGYrUEp3Q3l1b3o3Q0pPdTVZWVJVK25NYVR5QXlCMWRxb280Z1FaaEdVZ3FP?=
 =?utf-8?B?QjdDcDQ4a1J0UXNkbDJMVTVUSTBaQVo1TjllZjdJOUl1RXZ0MnMxTmlzMEFh?=
 =?utf-8?B?OUlIQ1NtQzF3KzRXUU1XbTIxTjRjcTY0NStiZnBVdktnKzNsZ0N5NDJZeHds?=
 =?utf-8?B?N2pvWHZscU9ER1Fsc3RhL24zb3dKbGNiOUV2bldCdkY1YXZUdFJQWGtUTHFU?=
 =?utf-8?B?V2FIdFcrVTk0cDJDcGpHb0RVZVp6U1ZGM2xsREdLZXAwYW1ZNzU1L1JkSXF4?=
 =?utf-8?B?eXVGaUVRTDF6bGVWbmFHZGptY0M3K3FDSHZWYVhmYnVCZHNxaC9SL1Z0djc2?=
 =?utf-8?B?SHMwRE92SmpDS3IvenRreEF3VXdHWXJjVUdPdWh0TkV4WW5hRytENWNSbjBa?=
 =?utf-8?B?bUp0TXNCSTdMRWpXcUorNXJtZGt4SUIvY1dub1VDSjN0TkxnQ21vNkFiYzR5?=
 =?utf-8?B?TlJ3bWdDYzArN2ptOGR1Y1Jja1JTWFRJRVF4SWpqRHA2cHpRZU51V25Hc2tN?=
 =?utf-8?B?c2RmVGsxTTRKZ0ZsSTh3ZDE0anJua0tnVEIyVm9YRmxscnlCZnRlUnJMWUtH?=
 =?utf-8?B?UHRiMjdLUjFyVS9ZcEZXSzVrZW1vRjN2UzBzWjJVYjN0WkI5K0k5SlFNeWVj?=
 =?utf-8?B?QzZIbTlCaGxPQTBQcEh0Qk5DdFdVQksrbVpndC9PTzVWa2JVeTEyTGNib3ox?=
 =?utf-8?B?T3lvNFZkRFh4cGpPZUIybFFMTmdIM0hIWks3c21QbGpnbUxOa20waG1kalVF?=
 =?utf-8?B?NkFCS3U3UEo5em9tMWNRZ011d0RlQ1U1VE85MmdESjFJUkdHSzIrQTg5YnBk?=
 =?utf-8?B?QTgxTUc2bk1ydDZubXllK2JLOTNKend4VzRaY056Y0d1aXM2bldJUmlCTERV?=
 =?utf-8?B?S3VjMUMzSGxXTU9iYlZwN1VrL3V2ekFqZ3VOVVVhNTRNZzFKUG1KN280N09P?=
 =?utf-8?B?Y1I1WFJVeVc4QytOU3pVL2Rzd2sxOXJZNC9vZjNQY3NPTTZXeUwyMXpGSVZn?=
 =?utf-8?B?RlNLUXNJRTJURzRlVDdJaTJCSzNHcThLL1BCZ3NkWjg1SENvM29sV3htV3hU?=
 =?utf-8?B?cFNmVU5hajNhek0yQmxlaWFnemlIRi9ENUE3UHhRaFpKT3ZKeGttM3VzREEr?=
 =?utf-8?B?NHQ2M3E3RkgwTTVFLzk2QVpBdUpZRkc0WmJmWkRncHo5VEhyY1hoVmxHVnQw?=
 =?utf-8?B?a3RvTGxlL2VhRlZZZXkzVG8wMlRKeUE3ZjZxTk52NlJLL0ZwRWxJdFhJM0ZV?=
 =?utf-8?B?eUthaGpmNUVWZW50QldlWUJqZXB6aEp2UWVpNmdsY1UvM0dwSjhUVkFJQ2FF?=
 =?utf-8?B?TTJaZHBVNUFXWU9sUSsvVmsya2poSHVlZHlCNm9wMXhxdzRCVVVJZ0FoTlhR?=
 =?utf-8?B?VkJoREw2V0NOWjh3a2g2QjB4Z3JRc1hPajk5OVF0ZFp0MkpZc0dFWU1KdUZG?=
 =?utf-8?B?aGxlcDdkMWx4TkIreG80dktpMGQrUVhBMDVpdTJoSFEyY05XUllac1drQk95?=
 =?utf-8?B?S1lPOTVlOUttZXh3ZnhUU2RTUHkySUlLcjRHRjAwQUt4ZHBGbDVlU3FXN0I0?=
 =?utf-8?B?VlZWNkRxdmxsVDhCOEtNcFd1akora0UzazYrb3VZTEVpMVRjVG1DalltbUZT?=
 =?utf-8?B?WnN3NUJFMDlFK1FyR0dQbjJjUGFKMGVEQUkvNHlSU3MzT3JsemdHcm5FMVpF?=
 =?utf-8?B?SHlldnFMckQwT3BDSGJhTlkrczYwMXc3bjBjWWV2SVh6WFZtT2UrVGI2OUxQ?=
 =?utf-8?Q?CA0dwwvN3DFhYtRqG6ipTjCofv+oskPqcEJAdRrCJk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD80B62B3171AD4C8B2D0DB6F86DC630@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 986fa33b-53b7-4e29-9438-08d9b70cfdb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2021 10:01:07.3006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qI704XE2zpzrVORO6COJaUC1Vh33CVy/oyLl+PjzCQj487CMciPQJX4NHpKNjNpvZ8ppwYFYYwAgh6BTQkUpfpdWhOZRffCpvILarMTcdX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1761
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzEyLzIwMjEgw6AgMTk6NDMsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gT24gRnJpLCAyMDIxLTEyLTAzIGF0IDEyOjQ5ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPiANCj4gSGVsbG8sDQo+IA0KPj4gSSBuZWVkIHRvIHRoaW5rIGEgYml0IG1vcmUgYWJv
dXQgaXQgdG8gZmluZCB0aGUgY2xlYW5lc3Qgc29sdXRpb24NCj4+IHRoYXQgd29ya3MgZm9yIGFs
bCBwbGF0Zm9ybXMuDQo+IA0KPiBNYXliZSByZWxhdGVkLCB3aGVuIGVuYWJsaW5nIEtBU0FOIG9u
IHRoYXQgc2FtZSBwbGF0Zm9ybSwgaXQgb29wc2VzIGVhcmx5Lg0KDQpVbnJlbGF0ZWQgSSB0aGlu
aywgYnV0IHRoYW5rcyBmb3IgdGhlIHJlcG9ydC4NCg0KPiANCj4gSSBoYXZlIHBpY2tlZCB0aGUg
cGF0Y2ggInBvd2VycGMvMzJzOiBGaXggc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiBLQVNBTg0KPiBp
bml0IiwgYW5kIHRoYXQgZG9lcyBub3QgZml4IGl0DQo+IA0KPiANCj4gRm9yIHNvbWUgbWVtPSB2
YWx1ZXMgbGlrZSA3NjlNLCBhbGwgQkFUcyBhcmUgdXNlZCBmb3Iga2VybmVsIGxpbmVhcg0KPiBt
YXBwaW5nLCBhbmQgdGhlcmUgYXJlIG5vbmUgbGVmdCB0byBtYXAgdGhlIEtBU0FOIHNoYWRvdyBh
cmVhIGluDQo+IGthc2FuL2Jvb2szc18zMi5jID0+IG5vIG9vcHMNCj4gDQo+IElmIEkgZG9uJ3Qg
Y29tcGlsZSBrYXNhbi9ib29rM3NfMzIuYyBhbmQgdXNlIHdlYWsgaW1wbGVtZW50YXRpb24gPT4g
bm8NCj4gb29wcw0KPiANCj4gDQo+IEJ1dCBmb3IgbWVtPTc2OE0sIGl0IG9vcHNlcw0KPiANCj4g
SSBhZGRlZCBzb21lIGRlYnVncyBpbiBrYXNhbiBpbml0IGFuZCBkdW1wZWQgQkFUcyBjb250ZW50
IChCQVQgNyBpcyBteQ0KPiBkZWJ1ZyBCQVQgZm9yIHVhcnQpDQo+IA0KPiBbICAgIDAuMDAwMDAw
XSBrYXNhbl9pbml0X3JlZ2lvbjogc3RhcnQ9MHhjMDAwMDAwMCBzaXplOjB4MzAwMDAwMDANCj4g
WyAgICAwLjAwMDAwMF0ga2FzYW5faW5pdF9yZWdpb246IGtfc3RhcnQ6MHhmODAwMDAwMCBrX2Vu
ZDoweGZlMDAwMDAwIGtfc2l6ZToweDYwMDAwMDAga19zaXplX2Jhc2U9MHgyMDAwMDAwDQo+IFsg
ICAgMC4wMDAwMDBdIGthc2FuX2luaXRfcmVnaW9uOiBJRnt9IGtfc2l6ZV9tb3JlOjB4NDAwMDAw
MA0KPiBbICAgIDAuMDAwMDAwXSBzZXRiYXQgaW5kZXg9MyB2aXJ0OjB4ZjgwMDAwMDAgcGh5czow
eDJhMDAwMDAwIHNpemU6MHgyMDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIHNldGJhdCBpbmRleD00
IHZpcnQ6MHhmYTAwMDAwMCBwaHlzOjB4MmMwMDAwMDAgc2l6ZToweDQwMDAwMDANCj4gWyAgICAw
LjAwMDAwMF0ga2FzYW5faW5pdF9yZWdpb246IGZpbmFsIGtfY3VyPTB4ZmUwMDAwMDANCj4gWyAg
ICAwLjAwMDAwMF0NCj4gWyAgICAwLjAwMDAwMF0gLS0tWyBEYXRhIEJsb2NrIEFkZHJlc3MgVHJh
bnNsYXRpb24gXS0tLQ0KPiBbICAgIDAuMDAwMDAwXSAwOiAweGMwMDAwMDAwLTB4Y2ZmZmZmZmYg
MHgwMDAwMDAwMCAgICAgICAyNTZNIEtlcm5lbCBydyAgICAgIG0NCj4gWyAgICAwLjAwMDAwMF0g
MTogMHhkMDAwMDAwMC0weGRmZmZmZmZmIDB4MTAwMDAwMDAgICAgICAgMjU2TSBLZXJuZWwgcncg
ICAgICBtDQo+IFsgICAgMC4wMDAwMDBdIDI6IDB4ZTAwMDAwMDAtMHhlZmZmZmZmZiAweDIwMDAw
MDAwICAgICAgIDI1Nk0gS2VybmVsIHJ3ICAgICAgbQ0KPiBbICAgIDAuMDAwMDAwXSAzOiAweGY4
MDAwMDAwLTB4ZjlmZmZmZmYgMHgyYTAwMDAwMCAgICAgICAgMzJNIEtlcm5lbCBydyAgICAgIG0N
Cj4gWyAgICAwLjAwMDAwMF0gNDogMHhmYTAwMDAwMC0weGZkZmZmZmZmIDB4MmMwMDAwMDAgICAg
ICAgIDY0TSBLZXJuZWwgcncgICAgICBtDQo+IFsgICAgMC4wMDAwMDBdIDU6ICAgICAgICAgLQ0K
PiBbICAgIDAuMDAwMDAwXSA2OiAgICAgICAgIC0NCj4gWyAgICAwLjAwMDAwMF0gNzogMHhiMDAw
MDAwMC0weGIwMGZmZmZmIDB4ZTAwMDAwMDAgICAgICAgICAxTSBLZXJuZWwgcncgICAgaSAgIGcN
Cj4gWyAgICAwLjAwMDAwMF0gQlVHOiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBkYXRhIGFjY2Vz
cyBvbiByZWFkIGF0IDB4ZmQzZmNlMDANCj4gWyAgICAwLjAwMDAwMF0gRmF1bHRpbmcgaW5zdHJ1
Y3Rpb24gYWRkcmVzczogMHhjMDEzZWQ4NA0KPiBbICAgIDAuMDAwMDAwXSBPb3BzOiBLZXJuZWwg
YWNjZXNzIG9mIGJhZCBhcmVhLCBzaWc6IDExIFsjMV0NCj4gWyAgICAwLjAwMDAwMF0gQkUgUEFH
RV9TSVpFPTRLDQo+IFsgICAgMC4wMDAwMDBdIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlciBO
b3QgdGFpbnRlZCA1LjE1LjArICMzNzkNCj4gWyAgICAwLjAwMDAwMF0gTklQOiAgYzAxM2VkODQg
TFI6IGMwMTQwMjY0IENUUjogMDAwMDAwMjANCj4gWyAgICAwLjAwMDAwMF0gUkVHUzogYzBiMDdk
ZDAgVFJBUDogMDMwMCAgIE5vdCB0YWludGVkICAoNS4xNS4wKykNCj4gWyAgICAwLjAwMDAwMF0g
TVNSOiAgMDAwMDEwMzIgPE1FLElSLERSLFJJPiAgQ1I6IDI4MjIyNDQ4ICBYRVI6IDAwMDAwMDAw
DQo+IFsgICAgMC4wMDAwMDBdIERBUjogZmQzZmNlMDAgRFNJU1I6IDIwMDAwMDAwDQo+IFsgICAg
MC4wMDAwMDBdIEdQUjAwOiBmZDNmZDAwMCBjMGIwN2U4MCBjMDljOGEyMCAwMDAwMDAzZiAwMDAw
MTAwMCAwMDAwMDAwMSBjMDhjNjdhOCBlOWZlN2ZmZg0KPiBbICAgIDAuMDAwMDAwXSBHUFIwODog
ZTlmZTcwMDAgZmQzZmNlMDAgMDAwMDAwMjAgZmQzZmNmZmYgMDAwMDAwMDAgMDAwMDAwMDAgM2Zm
OWM1ZjAgM2ZmZmQ3OWMNCj4gWyAgICAwLjAwMDAwMF0gR1BSMTY6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+
IFsgICAgMC4wMDAwMDBdIEdQUjI0OiAwMDAwMDAwMCBmZWZmZmZmZiAwMDAwMDU5MSBjMGIyMjAw
MCBmZmZmZmZmZiAwMDAwMDAwMCBlOWZlNzAwMCAwMDAwMTAwMA0KPiBbICAgIDAuMDAwMDAwXSBO
SVAgW2MwMTNlZDg0XSBrYXNhbl9jaGVja19yYW5nZSsweDk4LzB4MmMwDQo+IFsgICAgMC4wMDAw
MDBdIExSIFtjMDE0MDI2NF0gbWVtc2V0KzB4MzQvMHg4MA0KPiBbICAgIDAuMDAwMDAwXSBDYWxs
IFRyYWNlOg0KPiBbICAgIDAuMDAwMDAwXSBbYzBiMDdlODBdIFtjMDhjNjMwY10gbWVtYmxvY2tf
YWxsb2NfaW50ZXJuYWwrMHg5Yy8weDEwOCAodW5yZWxpYWJsZSkNCj4gWyAgICAwLjAwMDAwMF0g
W2MwYjA3ZTkwXSBbZmVmZmZmZmZdIDB4ZmVmZmZmZmYNCj4gWyAgICAwLjAwMDAwMF0gW2MwYjA3
ZWIwXSBbYzA4YzY3YThdIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQrMHhmNC8weDEyOA0KPiBbICAg
IDAuMDAwMDAwXSBbYzBiMDdmMzBdIFtjMDhiYjdhY10ga2FzYW5faW5pdF9zaGFkb3dfcGFnZV90
YWJsZXMrMHg4NC8weDFjYw0KPiBbICAgIDAuMDAwMDAwXSBbYzBiMDdmNjBdIFtjMDhiYmE0MF0g
a2FzYW5faW5pdCsweGRjLzB4MTg0DQo+IFsgICAgMC4wMDAwMDBdIFtjMGIwN2Y5MF0gW2MwOGI4
MTA4XSBzZXR1cF9hcmNoKzB4MTgvMHgxYzQNCj4gWyAgICAwLjAwMDAwMF0gW2MwYjA3ZmMwXSBb
YzA4YjNmZDRdIHN0YXJ0X2tlcm5lbCsweDVjLzB4MmQ0DQo+IFsgICAgMC4wMDAwMDBdIFtjMGIw
N2ZmMF0gWzAwMDAzM2MwXSAweDMzYzANCj4gWyAgICAwLjAwMDAwMF0gSW5zdHJ1Y3Rpb24gZHVt
cDoNCj4gWyAgICAwLjAwMDAwMF0gOTNlMTAwMGMgODNjOTAwMDAgODNlOTAwMDQgN2ZkZmZiNzkg
ODNjMTAwMDggODNlMTAwMGMgNDA4MjAxY2MgMmMwMzAwMDANCj4gWyAgICAwLjAwMDAwMF0gMzky
OTAwMDggNDE4MjAwMzQgNTU0YWY4N2UgN2Q0OTAzYTYgPDgwNjkwMDAwPiA4MTQ5MDAwNCA3YzZh
NTM3OSA0MDgyMDFhOA0KPiANCj4gDQo+IEl0IG1ha2VzIG5vIHNlbnNlIHRvIG1lIHRoYXQgd2Ug
Z2V0IHRoYXQgZmF1bHQgd2l0aCBhIHZhbGlkIEJBVA0KPiBjb3ZlcmluZyB0aGF0IGFyZWEsIEJB
VCBhcmUgbm90IHN1cHBvc2VkIHRvIGJlIGNoZWNrZWQgZmlyc3QgPw0KPiANCg0KDQpJbiBmYWN0
IEJBVDQgaXMgd3JvbmcuIEJvdGggdmlydHVhbCBhbmQgcGh5c2ljYWwgYWRkcmVzcyBvZiBhIDY0
TSBCQVQgDQptdXN0IGJlIDY0TSBhbGlnbmVkLiBJIHRoaW5rIHRoZSBkaXNwbGF5IGlzIHdyb25n
IGFzIHdlbGwgKFlvdSB0b29rIGl0IA0KZnJvbSBwdGR1bXAgPyksIEJFUEkgYW5kIEJSUE4gbXVz
dCBiZSBhbmRlZCB3aXRoIGNvbXBsZW1lbnQgb2YgQkwuDQoNClNvIGhlcmUgeW91ciA2NE0gQkFU
IG1hcHMgMHhmODAwMDAwMC0weGZiZmZmZmZmLCB0aGVyZWZvcmUgdGhlIGFkZHJlc3MgDQoweGZk
M2ZjZTAwIGlzIG5vdCBtYXBwZWQgYnkgYW55IEJBVCBoZW5jZSB0aGUgT09QUy4NCg0KQ2hyaXN0
b3BoZQ==
