Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF05E9EB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbdnb5rvnz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:11:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wAbpOu2t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wAbpOu2t;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbdms6cbpz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 20:10:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2+vEmnmV4waxqoYvCD6NT13BVmRpvS96SlEpjYvnyJ/pwRe3blZELwPdGbd/7X5ORV+t9maRyL9kkkFpUR7om+s8kEWjmoRl1yJMHJz0IR4YjREqZq5tKT9/kM62jxNQH/dLXYVwuMm1zjGNKbGMRQReiy9hV72PSOkbL6fh7yJM0+bOlKZYYn+RKTm9GUn1U5BetZgWZTjQgAeK780pq24GFIrT0NXUp9kBZ4n5Kl4MK4xA09DI9VG2iEKwXFkfe5L9n5HxkGY1TMM2OVSRJiKGwEBJ0QsO+vK1K01CT/7Fb3ZCiAPSvPZemZAAss6Cd3hIuAU9dYbCta79unYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpzGp0Pj3PxsQ4tW3Yhl7mKF4ydBhzeVzCdlFmcVE4o=;
 b=N1l9U+hxsywdeY6HQf5k0ak7PnlrVZpbvzQlJpcru5JbWw8GHbzIkvYkMakgPpCeKkbex5m/u6k5Mdy8BSSNdfQOTmZ/bo74IqqOTUVcc3H+k4uIt7+McK5y99L04pRXIaKe76lqoYvfYHPdKNO1D6krP700GEG5XRIBWvKTLNvAMbRsgPC15Oj5ISBTBsgftpLL232c7J4i6m+CWua/+s07Q+pTq3sBbbInf7retsdsZLDJt+iUC0TeYJQ3+2uQXegajiDGDlBsyo1cLRBlQrr9WqLDxttmFPF2zvLEBzrt5ZB9SFlgS3e4qn6febbFJOarOpUl11VfS7Pk2q/yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpzGp0Pj3PxsQ4tW3Yhl7mKF4ydBhzeVzCdlFmcVE4o=;
 b=wAbpOu2tK9DdbLyrLecxWyRd8suJS489wddi1d5ipst0zWs9iqrGoYtb9ABcKH/B/KOd5rDt3r8k/NPpeSEZPei4rTz389OdOERFqSiIzO9kj9h4TqcTiW6oCWJq1lNpI45hovfsLgKoZczXVF4+o0hZ4xf9QMOcx97CZ1yj1smwEWn7TWF3pQx8XXhJ5v50PgrP1GpYqzi+qTIOndX7rftIh3l+qgafIFLVNKjTULHLrJxX52xYAMTfdUmg3YTnqTwQ89Xre6dlpwzizz4yfipuKioVZv7Au/rdp47bRk0QLfZTHjEJ/nSKvPhTNSX6ZcD8F94N2Ol0CMfR2MipCA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 10:10:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 10:10:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Sinan Akman
	<sinan@writeme.com>
Subject: Re: [PATCH 7/7] powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC"
 compatible string
Thread-Topic: [PATCH 7/7] powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC"
 compatible string
Thread-Index: AQHYtABGV7usEsrcREWt3xQWKFV13a3xuFoA
Date: Mon, 26 Sep 2022 10:10:19 +0000
Message-ID: <9436f041-ba6d-0297-4026-e281acc7dbad@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-8-pali@kernel.org>
In-Reply-To: <20220819191557.28116-8-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2087:EE_
x-ms-office365-filtering-correlation-id: 15205e42-f9c8-4189-c54c-08da9fa75101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fsemtjHhsO6zmF/FCmDrQzmEzFSypi30sdRSoQR8blI+9msz7BTVfPltEr1bhl25RGDwpsB9yFfmW8L1wft3fYqKp+ya79B4+e7PVXgyoohOYAvfoG3ShPThxDopvxwUTeY1xksgWcqL7J/0uVHvfD9XqDXrZHfrd9uHYL6WQWaCRCMFaz33cky8kmF3BtFQshmSnQHR3aMFFyyJsFwnY6Whmooxd4wUZL+q+0VQseFLbG0ABTmUkjPWxbQDzh5nzBK4HskSm/VMZ087yJdYWflSXxSlcv7AxO54M7f3403yJym+7onYA+uFPeWHEx5kUQwIJY5LQWXm+9IHqikf5xEiUPyBawdb+1BYkKdWU4HgBtZ0NI6DL911eISyyujtsqPxi0VJcjIkeVOnrzXzgoHTXERenjjAc/bzJJfm/qbIvBSzeFbi+8ZcJI2nmD9df4Mq9ChAMzVog4UwjB9yhk0QG60RUjR+G/bwePIni/PdjgVBz5acjwE92XP0NC1OgEfBrJlkKS0BTlGZaUxQULAUI6pNID49MNeL+TSIe6IlkqBrXMTpFSAbR6NHlkCw2tJfGoOFVBPW0L8RDc0oPTsO9Hj5YNViQ5hol95PloF1xe5OhiKT/5QY58xGcT//1F5oJhx4/qFmbRgnfWxYuBC1aQMjrcsMNfkbnqUy0FvSpWN8vCrx6sSCwtpynrFeryVkieY8pVWrsZN9i33ZUkujySHvwDlrQyvSQoVl3TP3gF++SEIJNCA3KCpi1+DiyygNogncJm8KIit8Lr9jmhw4tThfzxa90S3al07lFHKeY86812sYXnpNdPus1Yy+h1FyIykg1UpWQBrYZYBMJi1RwI1UoZhLxHEtiD2FdYc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39850400004)(376002)(366004)(136003)(451199015)(186003)(31686004)(316002)(110136005)(54906003)(66946007)(6512007)(36756003)(76116006)(41300700001)(71200400001)(66446008)(44832011)(8936002)(91956017)(478600001)(64756008)(66556008)(6486002)(26005)(8676002)(5660300002)(6506007)(4326008)(86362001)(2906002)(31696002)(66574015)(38070700005)(66476007)(83380400001)(2616005)(38100700002)(122000001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVZxMFJERUVieTNDNnZKbjZwYXBVZDVtNWhxciswd1ljbVR6K2dKd0s4TG44?=
 =?utf-8?B?c1lhaHJNYVhhdXBVNXVOcklFWGlNeHY1cnZYNnljV0ZzZUorc3lMYkk1ZUhi?=
 =?utf-8?B?M3YrdjdDcXpTM3VmYllFWE92UGcyMnU0UFBsRTNHNHZCaGY1YmtlOTRZdnV2?=
 =?utf-8?B?SU9GRnk2TDVMSXFLclRNVmV1QnZZbVhQMSs3T2txUWwxKzNXR3dyNThPbmlx?=
 =?utf-8?B?bjZlV0o3Mm1Wa0dXR3oxMGlFcWRJRTlyRGQzOVo1T0o2TnFXZkM2YmV3TmdQ?=
 =?utf-8?B?cFRQK011b3NqOVdQdGt2ODFaTmxpSG1wYjVYWm4vOFcwUTQ5NFlhR0ZZelBk?=
 =?utf-8?B?Nmh1eG1wenZvdHIyb3dkT3cwVWtrZlpjMTI5VndUbk96T0VTcUx3NjlmcjMv?=
 =?utf-8?B?SWRJbDR3VnpTMnRWOGpYQjdTeEM2dHQyV2VqdXNNTWtodkRRRTV0dzBuNXR2?=
 =?utf-8?B?Wms0S1pINlYrOTFKY2NkYTVSblREbVVUa1NkYmNINWpKd3dvc0Y4aENNZXV5?=
 =?utf-8?B?Qmd0YVA3cVV4SjBRK1QzWU1rc3JsVlZCZElleDRqZmoxMUZYdjdWVHNOamZB?=
 =?utf-8?B?ejFEcDlLaWxVclFtNk9vMlNFb0F4M2kxRzNzN3ArVWNTYXk1WmlGTE50MXB6?=
 =?utf-8?B?ajYyS3VOUWI2MnhYcUF6aXh2T1NKUjlkSmtxK3RscnQ0MjBEUC9LVndVWGRB?=
 =?utf-8?B?UFZMSHVuTHdXbHJEVU9jdWFHOGh1cGRhdEpMd0E5ZXl2Y1lkSXVwUXhTNlJU?=
 =?utf-8?B?a082dUZMNnFQcE5tWXpwRHRSQXB3aklIR0pyTHlUb2ZOSzh6V1FhdFJYbXR4?=
 =?utf-8?B?dkxETUZ0NmtsTXNpSjg5U01UWG1YQkdlWmc5TlIzSEU2Y1BmZXhTZ0FBeG9N?=
 =?utf-8?B?YmdKdkd6MXMrWVRPa2F4Z2M0YkUxZjBBVmZCK0RyVTM1OWNSQmlNVlY2VUZY?=
 =?utf-8?B?aEtBWjIrVzFnKzArWHl4OHROaFAyOUlhRHVVcys3SXlLNW43MHlLY01sTkJk?=
 =?utf-8?B?dlFod09DYUxMTTJlTHFnQTdVcGtSS093WWxiZVJiOXBzc0Foa1VraHhFcUxy?=
 =?utf-8?B?Z2tYekxiNUZPcXljT3Y2dzlzK0h2U0xLNWVwa3hWUUtkZUlHMkpFSnU2OUN5?=
 =?utf-8?B?Wk10cVJ4WVRnV0plelY4N0xndG1KaWNMZFMvV0hmZ3RBRko4UlVoKzBBU3B2?=
 =?utf-8?B?ZDlGS3BGUE5TYmRmc1ljLzVYYnZwRy9KcDRQaThvOCtVeTI2eGZIeTQ2QUhV?=
 =?utf-8?B?b1JQNGR2cEFkVDZremFPVHVMVVVBMHNzWC9aM3dCSm9oZDRGVmtkWmpDQitO?=
 =?utf-8?B?dzFVUGJQM3hkRzJHVWovU1hOaEpRc2JwaEoxblZhNENmNzJ2S0h3UjVlb0Uw?=
 =?utf-8?B?VHQxaWlVMXpob2N4WnpiWkFZRmlIWmtTNVpDbE5zVFJTeCs0cWs1bi9Ma1Br?=
 =?utf-8?B?bm95eTdRRGVUYUFiYXFkVWpJZzJVa3B0U1hZcVpiOGNESW5XZmRHcG1NaW9j?=
 =?utf-8?B?VEIrS1gvL3dwVC8rOWJkcEs2bDJiOVVYZWw2SHBvcmtFU0xEV2pBcjhvR1lY?=
 =?utf-8?B?ck8xRGRoVHdDTUtTRmFKdEtZaXBKUjJ1QW5ZakI0endrdVhpT2dtUmVpZW44?=
 =?utf-8?B?a0o3VGtnZmpVMnJiN0dnNldUaUlwaDRWSHQ4NTRKT3p4NDN3em9GUEV3N3A0?=
 =?utf-8?B?TUdWdHFZVVl4anlFYlgvY0JHZzZuV213SzFZMDVBR0tGRE92WjliNTRtVDA4?=
 =?utf-8?B?SVFQYmFzaU5ybGRZTGUrZWJHVzZKc1R2WHZ1dFdVeEhVU1BGdzUrZWplZmZU?=
 =?utf-8?B?UE5ZRXgxWmZDU1NTMlA2ZW9EQVcvMitpckZRd093QThHK3VtSDhIUTExSDZU?=
 =?utf-8?B?cmUzRFZEUDFIaTlRSS9IMWFvb01PbUhjU1VhcXNZWEx3M0tpZ2xWRXFtV0Nx?=
 =?utf-8?B?bStLMFpDREhUVUNLekFtd3JlQS9PRlZZRzBmY0xCTG55WCsvMWI4UThaV0tv?=
 =?utf-8?B?STZOMUxmbVFyWGE3cU00VE5xQ3NLRVlkY0lDZlJsQ0Z2S0VNa0tYaUVZQVBk?=
 =?utf-8?B?UzI2SjB2SkRXc1NwY3pOd0Y4NWJnblB5STE2VTdoZnVpVU43UUJad1dhcGZx?=
 =?utf-8?B?R0N0Y0dTcDZaMnJzU3ZWcG92Wm9jYUl3SDdxaXN4NldNa1FDS05GTmM2UDVt?=
 =?utf-8?Q?HxM7KPjp8vF3ahsE3+SpsYI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9229D8DE9517D4F942800A160E33EEB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15205e42-f9c8-4189-c54c-08da9fa75101
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 10:10:19.3459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mHqI0ulmF4SKrGiohM3HJ7cnzuN9T8VsRs2jEUjWSdzy9Aj0IMK4jb2k+G2W9EUbEpUmzNY5GnNzeLosvBxhFb/FnUdKsTWlU7PqPRtO3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2087
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+ICJm
c2wsUDIwMjBSREItUEMiIGNvbXBhdGlibGUgc3RyaW5nIHdhcyBwcmVzZW50IGluIFR1cnJpcyAx
LnggRFRTIGZpbGUganVzdA0KPiBiZWNhdXNlIExpbnV4IGtlcm5lbCByZXF1aXJlZCBpdCBmb3Ig
cHJvcGVyIGRldGVjdGlvbiBvZiBQMjAyMCBwcm9jZXNzb3INCj4gZHVyaW5nIGJvb3QuDQo+IA0K
PiBUaGlzIHdhcyBxdWl0ZSBhIGhhY2sgYXMgQ1osTklDIFR1cnJpcyAxLnggaXMgbm90IGNvbXBh
dGlibGUgd2l0aA0KPiBGcmVlc2NhbGUgUDIwMjAtUkRCLVBDIGJvYXJkLg0KPiANCj4gTm93IHdo
ZW4ga2VybmVsIGhhcyBnZW5lcmljIHVuaWZpZWQgc3VwcG9ydCBmb3IgYm9hcmRzIHdpdGggUDIw
MjANCj4gcHJvY2Vzc29ycywgdGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIHRoaXMgImhhY2siIGlu
IHR1cnJpczF4LmR0cyBmaWxlLg0KPiANCj4gU28gcmVtb3ZlIGluY29ycmVjdCAiZnNsLFAyMDIw
UkRCLVBDIiBjb21wYXRpYmxlIHN0cmluZyBmcm9tIHR1cnJpczF4LmR0cy4NCg0KT2gsIEkgdGhv
dWdodCBpdCB3YXMgbm90IHBvc3NpYmxlIHRvIG1vZGlmeSBEVFNlcy4NCg0KSWYgaXQgaXMsIGNh
biB5b3UgaGF2ZSBhIGNvbW1vbiBjb21wYXRpYmxlIHRvIGFsbCBwMjAyMCwgZm9yIGluc3RhbmNl
IA0KImZzbCxwMjAyMCcsIHNvIHRoYXQgeW91IGNhbiB1c2UgaXQgaW4gcGF0Y2ggNSBpbnN0ZWFk
IG9mIA0Kb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi9jcHVzL1Bvd2VyUEMsUDIwMjBAMCIpID8NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4NCj4gLS0t
DQo+ICAgYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL3R1cnJpczF4LmR0cyB8IDIgKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9kdHMvdHVycmlzMXguZHRzIGIvYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL3R1cnJpczF4LmR0cw0KPiBpbmRleCAxMmUwODI3MWU2MWYuLjY5YzM4ZWQ4YTNhNSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL3R1cnJpczF4LmR0cw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvYm9vdC9kdHMvdHVycmlzMXguZHRzDQo+IEBAIC0xNSw3ICsxNSw3IEBA
DQo+ICAgDQo+ICAgLyB7DQo+ICAgCW1vZGVsID0gIlR1cnJpcyAxLngiOw0KPiAtCWNvbXBhdGli
bGUgPSAiY3puaWMsdHVycmlzMXgiLCAiZnNsLFAyMDIwUkRCLVBDIjsgLyogZnNsLFAyMDIwUkRC
LVBDIGlzIHJlcXVpcmVkIGZvciBib290aW5nIExpbnV4ICovDQo+ICsJY29tcGF0aWJsZSA9ICJj
em5pYyx0dXJyaXMxeCI7DQo+ICAgDQo+ICAgCWFsaWFzZXMgew0KPiAgIAkJZXRoZXJuZXQwID0g
JmVuZXQwOw==
