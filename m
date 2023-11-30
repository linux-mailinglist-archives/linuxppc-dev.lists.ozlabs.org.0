Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0137FE979
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:02:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QRMSJmAz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgnFp5b26z3cVn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 18:02:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QRMSJmAz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgnDy0zbXz3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 18:02:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9SZDwor8QJfsoMT73FRVLm3OLPdiYz5zd8k64E85EqIgwNFbG2sA7pxK5inR81oz7CGeFhMXevRHVtJWwCThKfjHwTSZzmYcNv4kMJCucu5kJAkfO1q1fnDfdFuxPbCOCysRzMXmP8QrLQ0gO4kkr9GxuT6F70B6H1jQr8GYg15Y0EYx1aNP9JgAgmRi98gljEaUcUzTSPxElZ0D12Ey/jXaRsqjfyhdzwyhf9JnzZyqm1laVEVEBffwLH2IPG5Gj2efhuPbDCKJiU1WHz8Dn2rtvw56pFCnWWpcFIyE15t0EFz345RQCldJge/njvO5Xo64UPVVaoRXqGewaM/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOASsWdJKBqbgiZyAM5yL5ZAA0vky7JqsymvVL8gzaU=;
 b=YG5qW3HprXlFnrPMLwQZKmm/bePpAUg43oqEcabOALMZHCVTS+IQAmjC2vfs3zm6yBTNz24R+MOHCHOO7BEft6OYrms0xSZK8/uBIrJCRCVM9/p6gQbm+5Fk9EnvkCzl7wljo0S1WMAzPETeRXQhS+ydcz5ggllRCewE2vwm2nSHNMTIffyBQs1PIvCxyxIVB+s7vaxjG821UnterHw0MfLnH5DglRuv0NQAJA3WLyFE81zp7hvdofU/lkyf6VTG6Y8y1ldhjjv0ylTmIU2yMbjaZiMs09EotjH/Hm1dkf4+IKqfM4G+fd2ZMCrxc9jB7UOP4GCkcyUwF5YrXwmR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOASsWdJKBqbgiZyAM5yL5ZAA0vky7JqsymvVL8gzaU=;
 b=QRMSJmAzFlYMMiM+VvLn9ik+7OJS5CiJ+rnSMXNAkEKaBZMeEpqo0p0PuZUocu5dpn2gHawNgxSz7YuCax3GjZub8S9jz5Kg1VVnc6NINYnIoUFx+ob3Tltg38cKJ6W6s6wyvLfDEtpUO9iB5gSXeYnV+eMfhc3Nx2Ospkr3L+YzxNMjUxX3jRyGOw790yEfqcWKeLGQuW5npOOnnItiVlmJCwWGfKqtnCpj5G+AHWIHo5I9ziIGRwTPOFaUiGFEulERRqFtDH8um4AqhXkbfp4hHvSx4d9aR+ueu0nWhCVMyPoIfIMeGSF5bv+JGBwI0xL3+2fXR8QSd3oF+C1m6g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1556.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 07:01:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.011; Thu, 30 Nov 2023
 07:01:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 5/7] poweprc: mm: Implement *_user_accessible_page()
 for ptes
Thread-Topic: [PATCH v9 5/7] poweprc: mm: Implement *_user_accessible_page()
 for ptes
Thread-Index: AQHaIzipbvn211YnzE+MjJq/B8kqRLCSb7mA
Date: Thu, 30 Nov 2023 07:01:48 +0000
Message-ID: <8aab92bd-a046-4068-88e3-480a8fbaf0da@csgroup.eu>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
 <20231130025404.37179-8-rmclure@linux.ibm.com>
In-Reply-To: <20231130025404.37179-8-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1556:EE_
x-ms-office365-filtering-correlation-id: 0bb89c01-83e2-4b34-c80e-08dbf17238c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lLRd5KfBYOL7SW2mCouFr/PxGkCBNLw96DWQoh8qlWAtwuAFErSm3yRvQqR1BXbNggTrIX4UOeT+ZSx1UJdZDrmVpUyP1nCnzLwr75/l62BsQ0I7P6T7umwE/7pM/ACwugIrl574q9cHav2UAzic5Y/dqpUXLjiOw55dqhGOOmVEcwplr7aVUg1F01ndAsst6EAMSSL8QqIkUSlhfmkhRQYKEWiISYwRyOkj0wlvTJ2y1q1uGoYnDZxH/tIgd2prs/fGPZttOAYkwW7+XnDM0yFseMtS/xdjoOeeDhJgC8UXqYEIhFKcvjYmP1/ixAx/5b03HPgSxYZeQM57N2CYg+U+SqfmL/2gmP98PiYs+iES9AfqYg6NF7v1stxYv2MImD05UDUsvMl4R86D59o+28mD03Ce2J5A4TcMbLU0vycJSIbxqmzASuUaArO0vdIctYcwC5SlD2qd9/xB91iFYhFH9hqfrfPjqCBwaIXEcSoS2Y1rgeyzjHcgw5cEIYOWrnN81F0zCCkPpnrsyLMjivk9MYyf+GOEHZHomPzaMFrEXpXAgjmnhlY+AzdHKOVyshWIrVERFuSriIyaW27nHJplw/JsyZEgHhdvQBUGAIkrYqKOauuf9Py3YGCNHztbXYhDFrhhiWOuop++OtwqNiKK27j1exGi7cXLSo2JmdHkbn0g5e6XB3Xv91yHdCXxiB3oRePsZbepLZpL9DhzJejrwv/ArH6NgEOgdf26v8I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(86362001)(31696002)(44832011)(4326008)(8936002)(8676002)(26005)(122000001)(202311291699003)(31686004)(38100700002)(38070700009)(41300700001)(76116006)(91956017)(6512007)(83380400001)(5660300002)(66574015)(2906002)(36756003)(110136005)(66556008)(66476007)(64756008)(478600001)(66446008)(66946007)(316002)(2616005)(6506007)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dkc3OUxHSEg4TG81dmxnblpLdGkwNFBBNUczMVlGTmdkSVBPU1FkUTNKaDEz?=
 =?utf-8?B?aEtzQnB2ekdlc1FQV2lzYUZQam5nL1JTMlhVY2JUcG9tZzY2Tm5JREhBNG5I?=
 =?utf-8?B?dFpzRDVOUDR4S2ZXYUVPMTNBY3RvK0hGVFlDNnE3YnZVRzdkY3c4RWRxSlVm?=
 =?utf-8?B?R01FQjU0dG4wNTQ4RjlBenRsVExmc3UyQnc4WjdHdVhWSWllVFJIbXQycmR3?=
 =?utf-8?B?T25OSWtoSmNmS1h0OWtXZ21HVjlnL2NCL1dsNVd1Q3lpMXZwQ0cwdmFsaFI4?=
 =?utf-8?B?TGxEWmFCVGFCTXpVVHZvaXhTakhzbWVobmZrRkRJWUZYVHJwclFhSXNPZmdY?=
 =?utf-8?B?N2NTRmk5VTcwSG1XanVZelpHK2orVWZLVkRnQ3JDNGxFWiszMGFJUFQzWThX?=
 =?utf-8?B?UlBnd0c3MURkTWpsMEFhdlg5R3o1SzdKODhTVVBMQmJjakUzUTNnTEhFN2Ru?=
 =?utf-8?B?azZka3hGYXdVa2RMRFFteUczcWpRN0lIL05aOEkvTUZOZXhIdERYTG1yb2Rq?=
 =?utf-8?B?eXJ1S3h0WmQ4WHh6SjNVazlqVk9mSG1vSDRoaUUxYUVwV2Y3cmI2MHN5RUg3?=
 =?utf-8?B?UGl0eDZRbUlKN2R3UW1iRXNKc1RTeW1ZM3Nka1FFTmJXQlNiYWZ4bWNFR0k5?=
 =?utf-8?B?QXVHUVRSUC9PUGNrUUZadkVUSE02Y01Kelk2TmRrY0hick9vaUtMK1RKTTJ2?=
 =?utf-8?B?Mi9uN0JibnZVdnl3d0lra2pCem9lcTF0Z2tnb1BsWDlFSUJvSWt3UmZ6S2lX?=
 =?utf-8?B?OU5Od0FzUHAvZEVZa1U4YU0wOTFxeisvNjZ6aEtFVEdDWHE4QjE2RDh4T2gy?=
 =?utf-8?B?NVo2UU9obCtXWkJIdHhwbmdvcUM4L2EvbmxMcGZqdjBXb0M1elA1N1AzMGZW?=
 =?utf-8?B?RUlOcENHYlRFRlpaQ0ZVVEtsUzBEMTlNT25WOG5aUS9GWTFVbDNWL2VnQzFS?=
 =?utf-8?B?d0RWSjhBODI1WTdudmVwZSsrTE5pRGRWcW9rbk9DMW9DYjA2VDZkRG13MjI1?=
 =?utf-8?B?VTIybmorcU9xTERSTnJWNDA5cUVKYW5Zbi9HblI5UUJxclU4cHNBekRqWmRV?=
 =?utf-8?B?Znh0cVlIZ2xMYVlBN0Y1Z1JsK3FGNTdoNWp0dGh3cEtodHRYMDhoQ3VJeGtO?=
 =?utf-8?B?SFdhNExucHlnNWF6a1E0Q0dQMkt6Q0Z2dGdSN0dpQnFoVStlMEpiZ3YvZTVt?=
 =?utf-8?B?ZmFyRFdSNE40dWhsaHhwbjc4aG1yM1cxMlE4L2R0V2JlbWtxRUpWYmxsd0Y2?=
 =?utf-8?B?Z2xmR3VGMVhOYkFiOEt2R0ZocTJvaUFobVl6c2NLa2J5OVhMTzgydy9udVlp?=
 =?utf-8?B?NzlOZFpXYkp3bGVCVStmQThnYjR2UHFxaGRtV1B0djJ3T2puSlR3Z3FFaFkr?=
 =?utf-8?B?ZnJzYnVZVmFYZjNrS21zeHhzWWp2Nm50M1d5ZjdCbXBjclBOT2t2RGVsZ25r?=
 =?utf-8?B?SjVlSEQ5VUxGaUNvMjhLQ1pyRGU3RGxZRTV0RjN6VngvRGplMTFOMTU5TStI?=
 =?utf-8?B?d2krcFlFUHpTV1JRemh1Szk4ZXJXRkNuZy95TmJEMW50cmZKRy9HdkFQb2Fi?=
 =?utf-8?B?L2M0cW9LODd2dUY1ODJVdEFsa1g3VFkzQzRMTmxuOWtTcGF1VVo5NzRGa1Bq?=
 =?utf-8?B?UktWL3VqUDk2ZWoxY0taZ0R6MzY3VXZzUnM1M2tXMmdKVDZtVUc4V0x3Y1ZS?=
 =?utf-8?B?MzVxOHdCT3crdlN2RHptUmtFRTc2L0RYeEUzcG5EWFp4N1dWWnRpVjhqVWRo?=
 =?utf-8?B?NUVwRGxjUjg0bEpYempHTHZqWDN5WHc4dHJtcTRCLzdGY1hVRE50NjFuME9B?=
 =?utf-8?B?OThHK3kzZEF6cUQyWXlPWmJJSkJ4OE5wMWxHM2VsRlZENEFHZUZJTUYwMmg1?=
 =?utf-8?B?eDZET2FHeTVSVVF6Rkd4emtXZG4wVDljNWdPMUwzUDB5VjNBOTZQeTlvMml1?=
 =?utf-8?B?ZFIzMElsSE5yVlc3YjFQd3ZxZis0cExGRW92cnlURmhWcUhUakhUZ2hhbkJk?=
 =?utf-8?B?eTZYWEw0OTQxUmtYNXpKVkluc2ZSMWVvVjJRd0RVTGZKZU5VcFpJOXlXTUQ4?=
 =?utf-8?B?L1FtTXpvQWNCZnh1VTFZcHBycG5wcEE2cDNnY0tvMmI0aWhndktZejJFQ210?=
 =?utf-8?B?aHVHY2VxSjEwdWJsNGZPd0hENk54SzFrU1ltWnVYTVRIQVNraUlkRk5FdFFQ?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A2B820B3D2E7B47905FCB0C3F24361A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb89c01-83e2-4b34-c80e-08dbf17238c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 07:01:48.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZgceUkAM2LMZ2zP8Mu5ivSUa1KdTfgsqdD7jXH8sCYmwFwzfYJAKiHt8pOeuihxgFWpvXvUX+ikUClcC97V7n/5P1GojTGAE/mOsgyflVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1556
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

DQoNCkxlIDMwLzExLzIwMjMgw6AgMDM6NTMsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
YWdlIHRhYmxlIGNoZWNraW5nIGRlcGVuZHMgb24gYXJjaGl0ZWN0dXJlcyBwcm92aWRpbmcgYW4N
Cj4gaW1wbGVtZW50YXRpb24gb2YgcHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UuIFdp
dGgNCj4gcmVmYWN0b3Jpc2F0aW9ucyBtYWRlIG9uIHBvd2VycGMvbW0sIHRoZSBwdGVfYWNjZXNz
X3Blcm1pdHRlZCgpIGFuZA0KPiBzaW1pbGFyIG1ldGhvZHMgdmVyaWZ5IHdoZXRoZXIgYSB1c2Vy
bGFuZCBwYWdlIGlzIGFjY2Vzc2libGUgd2l0aCB0aGUNCj4gcmVxdWlyZWQgcGVybWlzc2lvbnMu
DQo+IA0KPiBTaW5jZSBwYWdlIHRhYmxlIGNoZWNraW5nIGlzIHRoZSBvbmx5IHVzZXIgb2YNCj4g
cHt0ZSxtZCx1ZH1fdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgaW1wbGVtZW50IHRoZXNlIGZvciBh
bGwgcGxhdGZvcm1zLA0KPiB1c2luZyBzb21lIG9mIHRoZSBzYW1lIHByZWxpbWluYXkgY2hlY2tz
IHRha2VuIGJ5IHB0ZV9hY2Nlc3NfcGVybWl0dGVkKCkNCj4gb24gdGhhdCBwbGF0Zm9ybS4NCg0K
cHRlX2FjY2Vzc19wZXJtaXR0ZWQoKSByZXR1cm5zIGZhbHNlIG9uIGFuIGV4ZWMtb25seSBwYWdl
Lg0KDQpBcyBmYXIgYXMgSSBjYW4gc2VlIGluIGFybTY0LCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3Bh
Z2UoKSByZXR1cm5zIHRydWUgb24gDQphbiBleGVjLW9ubHkgcGFnZS4NCg0KSW4gYWRkaXRpb24s
IHB0ZV9hY2Nlc3NfcGVybWl0dGVkKCkgaXMgY2FsbGVkIG9ubHkgZnJvbSBHVVAgc28gaXMgDQpn
YXJhbnRlZWQgdG8gYmUgY2FsbGVkIG9ubHkgZm9yIHVzZXIgcGFnZXMuIERvIHdlIGhhdmUgdGhl
IHNhbWUgZ2FyYW50ZWUgDQpmcm9tIGNhbGxlcnMgb2YgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdl
KCkgPyBJZiBub3QgaXQgaXMgbmVlZGVkIHRvIA0KY2hlY2sgYWRkcmVzcyBpbiBhZGRpdGlvbiwg
c2VlIGNvbW1pdCBhNzg1ODc0NzM2NDIgKCJwb3dlcnBjOiBSZWx5IG9uIA0KYWRkcmVzcyBpbnN0
ZWFkIG9mIHB0ZV91c2VyKCkiKQ0KDQo+IA0KPiBTaW5jZSBDb21taXQgOGU5YmQ0MWU0Y2UxICgi
cG93ZXJwYy9ub2hhc2g6IFJlcGxhY2UgcHRlX3VzZXIoKSBieSBwdGVfcmVhZCgpIikNCj4gcHRl
X3VzZXIoKSBpcyBubyBsb25nZXIgcmVxdWlyZWQgdG8gYmUgcHJlc2VudCBvbiBhbGwgcGxhdGZv
cm1zIGFzIGl0DQo+IG1heSBiZSBlcXVpdmFsZW50IHRvIG9yIGltcGxpZWQgYnkgcHRlX3JlYWQo
KS4gSGVuY2UgaW1wbGVtZW50YXRpb25zIGFyZQ0KPiBzcGVjaWFsaXNlZC4NCg0KcHRlX3VzZXIo
KSBpcyBub3QgZXF1aXZhbGVudCBub3IgaW1wbGllcyBieSBwdGVfcmVhZCgpLiBJbiBtb3N0IA0K
cGxhdGZvcm1zIGl0IGlzIGltcGxpZWQgYnkgdGhlIGFkZHJlc3MgYmVpbmcgYmVsb3cgVEFTS19T
SVpFLg0KcHRlX3JlYWQoKSB3aWxsIGFsc28gcmV0dXJuIHRydWUgb24ga2VybmVsIHJlYWRhYmxl
IHBhZ2VzLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGlu
dXguaWJtLmNvbT4NCj4gLS0tDQo+IHY5OiBOZXcgaW1wbGVtZW50YXRpb24NCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmggfCAgNSArKysrKw0K
PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgIDUgKysr
KysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaCAgICB8ICA1
ICsrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAg
fCAxNSArKysrKysrKysrKysrKysNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMy
L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5o
DQo+IGluZGV4IDljYzk1YTYxZDJhNi4uYmQ2ZjhjZGQyNWFhIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0KPiBAQCAtNDQxLDYgKzQ0MSwx
MSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBi
b29sIHdyaXRlKQ0KPiAgIAlyZXR1cm4gdHJ1ZTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90IHB0ZSkNCj4gK3sNCj4gKwly
ZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAmJiBwdGVfcmVhZChwdGUpOw0KPiArfQ0KPiArDQo+ICAg
LyogQ29udmVyc2lvbiBmdW5jdGlvbnM6IGNvbnZlcnQgYSBwYWdlIGFuZCBwcm90ZWN0aW9uIHRv
IGEgcGFnZSBlbnRyeSwNCj4gICAgKiBhbmQgYSBwYWdlIGVudHJ5IGFuZCBwYWdlIGRpcmVjdG9y
eSB0byB0aGUgcGFnZSB0aGV5IHJlZmVyIHRvLg0KPiAgICAqDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IGluZGV4IDI0NTQxNzRiMjZjYi4uZGQz
ZTdiMTkwYWI3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzY0L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L3BndGFibGUuaA0KPiBAQCAtNTQ0LDYgKzU0NCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRl
X2FjY2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBib29sIHdyaXRlKQ0KPiAgIAlyZXR1cm4gYXJj
aF9wdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdmFsKHB0ZSksIHdyaXRlLCAwKTsNCj4gICB9DQo+
ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90
IHB0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAmJiBwdGVfdXNlcihwdGUp
ICYmIHB0ZV9yZWFkKHB0ZSk7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIENvbnZlcnNpb24g
ZnVuY3Rpb25zOiBjb252ZXJ0IGEgcGFnZSBhbmQgcHJvdGVjdGlvbiB0byBhIHBhZ2UgZW50cnks
DQo+ICAgICogYW5kIGEgcGFnZSBlbnRyeSBhbmQgcGFnZSBkaXJlY3RvcnkgdG8gdGhlIHBhZ2Ug
dGhleSByZWZlciB0by4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9u
b2hhc2gvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxl
LmgNCj4gaW5kZXggNDI3ZGIxNDI5MmM5Li4zM2I0YTQyNjdmNjYgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+IEBAIC0yMTMsNiArMjEzLDExIEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdCBwdGUsIGJvb2wg
d3JpdGUpDQo+ICAgCXJldHVybiB0cnVlOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlKQ0KPiArew0KPiArCXJldHVy
biBwdGVfcHJlc2VudChwdGUpICYmIHB0ZV9yZWFkKHB0ZSk7DQo+ICt9DQo+ICsNCj4gICAvKiBD
b252ZXJzaW9uIGZ1bmN0aW9uczogY29udmVydCBhIHBhZ2UgYW5kIHByb3RlY3Rpb24gdG8gYSBw
YWdlIGVudHJ5LA0KPiAgICAqIGFuZCBhIHBhZ2UgZW50cnkgYW5kIHBhZ2UgZGlyZWN0b3J5IHRv
IHRoZSBwYWdlIHRoZXkgcmVmZXIgdG8uDQo+ICAgICoNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0
YWJsZS5oDQo+IGluZGV4IGQ3ZDBmNDc3NjBkMy4uNjYxYmYzYWZjYTM3IDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTI1MCw2ICsyNTAsMjEgQEAgc3RhdGljIGlu
bGluZSBwdGVfdCBwdWRfcHRlKHB1ZF90IHB1ZCkNCj4gICAJcmV0dXJuIF9fcHRlKHB1ZF92YWwo
cHVkKSk7DQo+ICAgfQ0KPiAgICNlbmRpZg0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1k
X3VzZXJfYWNjZXNzaWJsZV9wYWdlKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlwdGVfdCBwdGUgPSBw
bWRfcHRlKHBtZCk7DQo+ICsNCj4gKwlyZXR1cm4gcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0
ZSk7DQoNCk5vIG5lZWQgb2YgdGhhdCBwdGUgbG9jYWwgdmFyLCBjYW4gZml0IGFzIGEgc2luZ2xl
IGxpbmUuDQoNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHB1ZF91c2VyX2FjY2Vz
c2libGVfcGFnZShwdWRfdCBwdWQpDQo+ICt7DQo+ICsJcHRlX3QgcHRlID0gcHVkX3B0ZShwdWQp
Ow0KPiArDQo+ICsJcmV0dXJuIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGUpOw0KDQpTYW1l
Lg0KDQo+ICt9DQo+ICsNCj4gICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovDQo+ICAgDQo+ICAg
I2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8NCg==
