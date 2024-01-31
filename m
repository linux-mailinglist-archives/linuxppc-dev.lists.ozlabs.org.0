Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874A843702
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 07:54:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cUByiKb8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPt7J6wSsz3cCh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cUByiKb8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPt6V2kTVz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 17:53:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko0ieuC/Md8WWpZaZ0/hEZ30dQBG+K9xZWgVl+VaTX8p7jAp/0VafN+KS6ugWtPr3WnhsUMdgBvDH2yEkfD8g/0RNcj4gV+Iuy/Pt23+KD5nohzefK43G0gFKYUPEQ81NUG7TgyCk2k0uVxWZKteCudOxmGyqNmtL01e+dc25vncUww94iSGxG73zMBbDOki3v3qaytuKSvv5M5RCXdU4OAtA7AsvrJnjq61PDQoyT5R7NaHs5bPj8w5Cxfokb2+yCqdiKc6ti3oQ8COkvYh1zKXrr3CLQK0apnR3yUw1cMlNDUI3bCHqC7z9UCi+UeVJ9q2a0p+jCNMGxBGlvEAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B54ilBBkhKvtjjo7qcTJ5sQ3a8m/ayIV/bAdd1X4fAY=;
 b=EJwMfeJdjdzxSz0L+buZsRP4hFDt9CltFn6UBvB+MVT9WWjFMlLXYf+qLCOSurCdSgX7/WDsagz4+ExCEZ86ylQJqHsX+v/bXwnvMtLgC8R0VWfKQyA2LmRfuycspLduXxEpbZR5pfRfPC1k7b0OK4o2yxUZM7NNpbSCqSefIsEKI20T8Xdqq1zv8yU+oWcP/34g41QgLUjMTPrORyYH3LRISzzQx3NiW4Ht5u3YyZst1b6L31Hjhctc7YP7V/4+tlDuarhhgoz66/Qe+gvNRM+nnATOqi0cykUNNya0UKv+LoO3bO4fDkAEb+Z7eFrfCQerLVXhiCGa2zPcUY7AXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B54ilBBkhKvtjjo7qcTJ5sQ3a8m/ayIV/bAdd1X4fAY=;
 b=cUByiKb8VTEMpyQcUxS/90SUxB9V+lgO+ZmFe7CfNGxIrx+PSPOy0vY65sUDIM5VdsKDoT3tdLxCBxHGjaO70KWOnsJPyv37VyusmVmoNZ/oEVIlxGhbkw4CcCz0P9vXsfFfVpj27SQHRTKNmKuolL4E9pRF70FykmucQOYoBcbigpHvperS1VMF+V7C2E/RMMz2UT1ABG/EnL9c8Cal36n+OZPjStLSGvjHDd4xYuP64O10jBj+2G7dv4s01yvWIxAPHIDuC4K4Bo4vDnC3kfm0zYILeaiJxXmfxBt3wtdQT6G9GdscO6uvj3bBtTWuEV5d5+AhOaoQUe++IaUMtg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3288.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 06:53:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 06:53:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Topic: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Index:  AQHaM+yXNPEoBBWgvUqc5dink/c7D7DxdmEAgADbxgCAAB3agIAAcSGAgAAsigCAAK7LAA==
Date: Wed, 31 Jan 2024 06:53:13 +0000
Message-ID: <8b00f75d-a5ee-45a8-9ed4-5da26e4e1f41@csgroup.eu>
References:  <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
 <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
 <CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
 <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
 <ZblbuHLaK2_Xhff_@bombadil.infradead.org>
In-Reply-To: <ZblbuHLaK2_Xhff_@bombadil.infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3288:EE_
x-ms-office365-filtering-correlation-id: e2d2463e-c0f8-4089-0d48-08dc22294b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TGsS9tqNefVGS5Nvehwg3BOzC2EnAmk1N4I1PVWGeKanU1dmx882+CZqUsO0NUKlEY/J3sw9I60+FqM/JzJKEXbys4xG9yswiDfk/UGPcpvWxzVH1T9diWbg+b/NVlNQs1XZWVLb1blLWarr7dxNQod4iyDQkE+iu+RYBkZMiMWI6CK6khP6vW0RkF0OkpearQOJfXTNdfP7t+VLk9YMgUbqm0beGA3BtfyLwK+JIhtauMsn1RwtA+5nR6YqdRPYaXey2iisLluy3Us0fKNzUM5qZXrovw5/ABEqTuuuCPwoU0joT9WA1NgulcbJVZUpN34Lg9X0vIm1QjNncGcR+tJ1a0A17JiYhqvAj0pEHia7rWCGkPmdGeSk15mnyi3GAX25aTk/eSdgqefxgJojZoEsQv5O/bjnKPqAqvUrqd2nSoS7VlrIl7lQ45luIDFNoCRbFVfOrrHZriQQ4RdDBMIE/03hXBANBEwKnAxd1cb6PZ2XEHw1dPnNHKZpVKvtm3VcYEhXdeVVt7WELVfXNVZh5JuTBQbNdGWCJ6DElNikFJ90jr5y9kk74fOsuOc7LWdPq2PdT5CSb2scxhsOSGTk8J7w3111jnEX/zNmcpX02fXmbKFTzJFb/AZaUE0b7Ue3XsweijwABiyfS0dzQYjj/N0lmdE0SdkEPjqOMDpNszlBad07B/LzQWcDcZuN
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39850400004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(38070700009)(76116006)(8676002)(91956017)(66446008)(54906003)(4326008)(64756008)(6486002)(66574015)(26005)(83380400001)(110136005)(53546011)(5660300002)(66476007)(6512007)(6506007)(71200400001)(8936002)(66556008)(316002)(478600001)(2616005)(44832011)(2906002)(966005)(66946007)(122000001)(38100700002)(41300700001)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VkVQK3haY3ZwdmhIaTZKaVJQRkt5cEJCU1hIZjZWT0pZV1dIYVV4RVhsTFE3?=
 =?utf-8?B?OHc5cHhkUDdqMHdiUnUwdUNDSnlNVko4Vzd2YUUrbWFvTlVXM1B2N0oxWEly?=
 =?utf-8?B?dGJwcGE4SXlIRm1ZNjRXYTZFa1RiWGw2ZS9hYUJlQ0E4MWRCNHFhMXkrZjk3?=
 =?utf-8?B?c09yL201YVBqWTJIUzRpdGMzc0g3cWd1MmdZakx5ZklvcVlKTEdQTE1xVGl6?=
 =?utf-8?B?M1NaRWtrdFhOdytwZmNxRURSdDN6YWJnVHM3Qmh2YWNBVWxqOWp0S1NTRVcr?=
 =?utf-8?B?RTU1L3RuK2pnSUMxZjNNY3I3QUpiSW9lSjN1TUFDczUxNUd6MzY2c3RZMWpo?=
 =?utf-8?B?NWovMXc5NldRWkFjK0NWdmJxbWZibUpEWUFlSkJnYnJUSUJ0MkN2T3FiRTRh?=
 =?utf-8?B?c2VYQVBndmMxNXkyZ1FGNWVtczNDYTk3MmtzcXNSeWl2WVhoT0Zra3EyYjBD?=
 =?utf-8?B?OHRueVp2SWdIbFhZMlMzTW1HTmhNc0xCTFZqV0QwZnVYSlM1LzRWemRMZ3hq?=
 =?utf-8?B?MDhjb1c2aUdUMGdzUXd2cGRYb3NXRHd3Zm5wSjZpSlBHcUhOaU04SWhzMVFz?=
 =?utf-8?B?YzdMdS9JQ09MaDJ2S3hXcFpjZTlOdjFhRU11RG5iVUZGbTRHMVRhY3QzWTNi?=
 =?utf-8?B?TFlVZjJOaW5zd2VzTzVKdEhmOUNNNXJ3Tkh2M2svTWVuNStqODFZSnREMkF1?=
 =?utf-8?B?SS8ySmJ3TjFRMHB6M1FEV3NwVXhRVytoYjRsdW9XTFE0ZmZrSElZbnpkNkxJ?=
 =?utf-8?B?Nk1raHFNMm81TDgzeWZmQjNFOWw5NzBYQSsrWGVHeXlnUTBwc1Jsc3hNWVll?=
 =?utf-8?B?NjF6RkRrN043ek5pbUhiSENhOHN0V2E3Y2liN3JSZkQ3RElNMm11TEMyRFJo?=
 =?utf-8?B?N1o1OUxBbDR0MHJtMzFlQ0w4RVJ1cHRFUXpXNjRDc3duMWVqdElyenNaRUhW?=
 =?utf-8?B?ZDhRbEk2eEovSmVVRkV4dElMWHhZWVh1QUMwVXFxVFA1N3hsY3I2TFA5aHgr?=
 =?utf-8?B?NDNDMDdta0NiNW9GSDVSdmVXNXJtdi92MjZHZFU4aDhaalRHN3dZTlFpb1du?=
 =?utf-8?B?dWhqVkhOckJBbFZ0S3BCclJSdDFsK25McWREdnlwNlVkSlZLR3A2T0hEbkd4?=
 =?utf-8?B?MnFVTmFESGxxQ3pJbnVGWTRJeUd5QmZ0TitiMzBTcThDOWhFVzlGdnJUSnl6?=
 =?utf-8?B?L0NtUzhqSHArSUZOdGxDQ2YvR2dLd2ZKSEFtU1pwMVZveHpwQVBuYVFaSE55?=
 =?utf-8?B?R3pBRG1YK2dFa2R4NWs5dkhldFN3SDY5dy81a2xCS3lXK2h0RS9hK2pMbG5Z?=
 =?utf-8?B?MStzOUE5OGY2eG94c0pWRUF4K0FPRnRSU1kvNkZVd0U0NWxWdGdjQ1dhNlBq?=
 =?utf-8?B?Ym9oWlBjaXpBVlBDRnExYUtwcSt1eFV1bnJMS1BEdUpCejd4cENYb25ReHlE?=
 =?utf-8?B?ZXk1UmhMSHhDZmIxWHBTMHJuQ0RGUG9KWmJuSm5oRG9NVEk0NnJRWWFxekpy?=
 =?utf-8?B?Qlp0QXA2YW9mNFIrZy8yTUowZGFCQzJWNnVwMXVhVTBYM2laM0trb2xIUkMw?=
 =?utf-8?B?M2NlU0ZhZzNhNDJndmx4WTVRb0JkaEk5SXlha3MramRHQnFSaHJKaytXSXJX?=
 =?utf-8?B?Zll6QVUySzZ3aEdJRnVoTmpoN3VpOEMyUkhDYzQ0NVYzdkdSMTNMbUJSZ2ZR?=
 =?utf-8?B?UUdKSEJyaVhkeWlDci9KZmR4dUtGY3FxWXBVQUZlODNnNzNYU1FFUEczMmpB?=
 =?utf-8?B?bktFdHBndS81SzhEU0xyZUxLV3NTcFZTNU5ORWhxRkw1SDZ1c2tmM001aXha?=
 =?utf-8?B?OUVSWTZveTV0YU5Xam42MEMrSzE2WjhXL3RPbE1CRFZSTDRBdXAyeE9ITC9K?=
 =?utf-8?B?bTcvNzIrVnJ2cWFlOXEyZmllUzVaVEQyQXphSklmRlhzcUVoMU9FalIzOGVn?=
 =?utf-8?B?Z05OZDNCWHJQYnB4b2Q5ekxCV2VxM2dncDRySUNIWVBrNStBRGhHR1drMjFt?=
 =?utf-8?B?bzNjSjY2cDFiL2VyK2Z4Nko2WmhuYkt1a0Nodm1tTnlCdzJscjhwcUpsQ3Za?=
 =?utf-8?B?NEpub1FvMlg4WVcxY2l1ZFFuaXZpbHlQOVJPdHhzWXNjN1BrbUdKU2tFTWZG?=
 =?utf-8?Q?wkGAm8mynaqwwpdGz56KzkEdV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <356388C11EB0E047B06EFFA9B614B969@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d2463e-c0f8-4089-0d48-08dc22294b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 06:53:13.0190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vnc3D0ElSnfSwSTeyOCwDNv7kPyLr821tFA0A1MNsUT2+xSwQTkC1bltLBomRVRfd9vaR9s1VYLf58am5dHQr7kqoVf7qBcbFfRswD07FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3288
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzAxLzIwMjQgw6AgMjE6MjcsIEx1aXMgQ2hhbWJlcmxhaW4gYSDDqWNyaXTCoDoN
Cj4gT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMDY6NDg6MTFQTSArMDEwMCwgTWFyZWsgU3p5cHJv
d3NraSB3cm90ZToNCj4+IERlYXIgQWxsLA0KPj4NCj4+IE9uIDMwLjAxLjIwMjQgMTI6MDMsIENo
cmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4gTGUgMzAvMDEvMjAyNCDDoCAxMDoxNiwgQ2hlbi1Z
dSBUc2FpIGEgw6ljcml0wqA6DQo+Pj4+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUg
Y291cnJpZXJzIGRlIHdlbnN0QGNocm9taXVtLm9yZy4gRD9jb3V2cmV6IHBvdXJxdW9pIGNlY2kg
ZXN0IGltcG9ydGFudCA/IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNh
dGlvbiBdDQo+Pj4+DQo+Pj4+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDEyOjA5OjUwUE0gLTA4
MDAsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIERlYyAyMSwgMjAyMyBh
dCAxMDowMjo0NkFNICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pj4+IERlY2xh
cmluZyByb2RhdGFfZW5hYmxlZCBhbmQgbWFya19yb2RhdGFfcm8oKSBhdCBhbGwgdGltZQ0KPj4+
Pj4+IGhlbHBzIHJlbW92aW5nIHJlbGF0ZWQgI2lmZGVmZXJ5IGluIEMgZmlsZXMuDQo+Pj4+Pj4N
Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQo+Pj4+PiBWZXJ5IG5pY2UgY2xlYW51cCwgdGhhbmtzISwgYXBwbGllZCBh
bmQgcHVzaGVkDQo+Pj4+Pg0KPj4+Pj4gICAgICBMdWlzDQo+Pj4+IE9uIG5leHQtMjAyNDAxMzAs
IHdoaWNoIGhhcyB5b3VyIG1vZHVsZXMtbmV4dCBicmFuY2gsIGFuZCB0aHVzIHRoaXMNCj4+Pj4g
c2VyaWVzIGFuZCB0aGUgb3RoZXIgIm1vZHVsZTogVXNlIHNldF9tZW1vcnlfcm94KCkiIHNlcmll
cyBhcHBsaWVkLA0KPj4+PiBteSBrZXJuZWwgY3Jhc2hlcyBpbiBzb21lIHZlcnkgd2VpcmQgd2F5
LiBSZXZlcnRpbmcgeW91ciBicmFuY2gNCj4+Pj4gbWFrZXMgdGhlIGNyYXNoIGdvIGF3YXkuDQo+
Pj4+DQo+Pj4+IEkgdGhvdWdodCBJJ2QgcmVwb3J0IGl0IHJpZ2h0IGF3YXkuIE1heWJlIHlvdSBm
b2xrcyB3b3VsZCBrbm93IHdoYXQncw0KPj4+PiBoYXBwZW5pbmcgaGVyZT8gVGhpcyBpcyBvbiBh
cm02NC4NCj4+PiBUaGF0J3Mgc3RyYW5nZSwgaXQgc2VlbXMgdG8gYnVnIGluIG1vZHVsZV9idWdf
ZmluYWxpemUoKSB3aGljaCBpcw0KPj4+IF9iZWZvcmVfIGNhbGxzIHRvIG1vZHVsZV9lbmFibGVf
cm8oKSBhbmQgc3VjaC4NCj4+Pg0KPj4+IENhbiB5b3UgdHJ5IHRvIHJldmVydCB0aGUgNiBwYXRj
aGVzIG9uZSBieSBvbmUgdG8gc2VlIHdoaWNoIG9uZQ0KPj4+IGludHJvZHVjZXMgdGhlIHByb2Js
ZW0gPw0KPj4+DQo+Pj4gSW4gcmVhbGl0eSwgb25seSBwYXRjaCA2NzdiZmI5ZGI4YTMgcmVhbGx5
IGNoYW5nZSB0aGluZ3MuIE90aGVyIG9uZXMgYXJlDQo+Pj4gbW9yZSBvbiBsZXNzIG9ubHkgY2xl
YW51cC4NCj4+DQo+PiBJJ3ZlIGFsc28gcnVuIGludG8gdGhpcyBpc3N1ZSB3aXRoIHRvZGF5J3Mg
KDIwMjQwMTMwKSBsaW51eC1uZXh0IG9uIG15DQo+PiB0ZXN0IGZhcm0uIFRoZSBpc3N1ZSBpcyBu
b3QgZnVsbHkgcmVwcm9kdWNpYmxlLCBzbyBpdCB3YXMgYSBiaXQgaGFyZCB0bw0KPj4gYmlzZWN0
IGl0IGF1dG9tYXRpY2FsbHkuIEkndmUgc3BlbnQgc29tZSB0aW1lIG9uIG1hbnVhbCB0ZXN0aW5n
IGFuZCBpdA0KPj4gbG9va3MgdGhhdCByZXZlcnRpbmcgdGhlIGZvbGxvd2luZyAyIGNvbW1pdHMg
b24gdG9wIG9mIGxpbnV4LW5leHQgZml4ZXMNCj4+IHRoZSBwcm9ibGVtOg0KPj4NCj4+IDY1OTI5
ODg0Zjg2OCAoIm1vZHVsZXM6IFJlbW92ZSAjaWZkZWYgQ09ORklHX1NUUklDVF9NT0RVTEVfUldY
IGFyb3VuZA0KPj4gcm9kYXRhX2VuYWJsZWQiKQ0KPj4gNjc3YmZiOWRiOGEzICgibW9kdWxlOiBE
b24ndCBpZ25vcmUgZXJyb3JzIGZyb20gc2V0X21lbW9yeV9YWCgpIikNCj4+DQo+PiBUaGlzIGlu
IGZhY3QgbWVhbnMgdGhhdCBjb21taXQgNjc3YmZiOWRiOGEzIGlzIHJlc3BvbnNpYmxlIGZvciB0
aGlzDQo+PiByZWdyZXNzaW9uLCBhcyA2NTkyOTg4NGY4NjggaGFzIHRvIGJlIHJldmVydGVkIG9u
bHkgYmVjYXVzZSB0aGUgbGF0dGVyDQo+PiBkZXBlbmRzIG9uIGl0LiBMZXQgbWUga25vdyB3aGF0
IEkgY2FuIGRvIHRvIGhlbHAgZGVidWdnaW5nIHRoaXMgaXNzdWUuDQo+IA0KPiBUaGFua3MgZm9y
IHRoZSBiaXNlY3QsIEkndmUgcmVzZXQgbXkgdHJlZSB0byBjb21taXQNCj4gMzU1OWFkMzk1YmYw
MiAoIm1vZHVsZTogQ2hhbmdlIG1vZHVsZV9lbmFibGVfe254L3gvcm99KCkgdG8gbW9yZQ0KPiBl
eHBsaWNpdCBuYW1lcyIpIGZvciBub3cgdGhlbiwgc28gdG8gcmVtb3ZlIHRob3NlIGNvbW1pdHMu
DQo+IA0KDQpUaGUgcHJvYmxlbSBiZWluZyBpZGVudGlmaWVkIGluIGNvbW1pdCA2NzdiZmI5ZGI4
YTMgKCJtb2R1bGU6IERvbid0IA0KaWdub3JlIGVycm9ycyBmcm9tIHNldF9tZW1vcnlfWFgoKSIp
LCB5b3UgY2FuIGtlZXAvcmUtYXBwbHkgdGhlIHNlcmllcyANCltQQVRDSCAxLzNdIGluaXQ6IERl
Y2xhcmUgcm9kYXRhX2VuYWJsZWQgYW5kIG1hcmtfcm9kYXRhX3JvKCkgYXQgYWxsIHRpbWUuDQoN
CkNocmlzdG9waGUNCg==
