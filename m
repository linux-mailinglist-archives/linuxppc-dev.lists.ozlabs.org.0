Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415784A5D8A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 14:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp5fR09hlz3bTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 00:40:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp5dw711dz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 00:40:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFlLGtWe8C689zZvtk3+W54DHX5MjXWBBW4H8kXsObMksBOtG5iY1iRXbQXaRmyN4DNup04ozJNSjUiHfrj2c6Az3apRuyFY2NGaibvTICNWz1faSvKxXkJ/ZxtupoZI+V31Jxo+IYRIOJyp9aUxz/HKhMsKeyNeCiWu7O7U5J58xcT7ZYGttTvwlUQvW/17oKJ07nYTLkob9yzX3oVqO2aq0ootzxrjzAlCaFKFTnEq0Lvueq0zxOBLrxGI6sisL56orUYAXsmfL0Kmd8T8dvJ8XL5mvxss83A1dMGafNTksUE0uMfMaBQnu12CWTEGtoAdipMAqH1MIloNBarnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kp0HI3yF37L10ysUCoPuc8MqA73HIRhTke9gVA76EA=;
 b=QKP9wyW3Kjrunb09GMWXtAaiodoAAmDGQz5l1Bl841jbXM5EukjXyp6EGxoA+R+H0MGT4iE6d9Nc/xZOidrJXsg9oxamOQQW0sYgmfAiIm2F/p6d4XJQQw0Jw8gLJyYL5lNsy1BK1/DTZCK4uEEeoJFC3rrKS8+ZaKFtUafXmxZJ0u8cXdqSzy15wkv5t4DZ7tAvbUtaoGYMKhAFoZ3oNrBWewGojB4qZdD1gCf5MYsa2oKVRlRm2YTZPFBoc20aO4Bf5IFrC2F1PXQA0F6ZOxcC1HkF8+UeTfZbJgxf7big9OkPTcAOgEeyvC4vV+4S1U0pmDRRQ56XnJS1UK5EqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4111.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:259::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 13:39:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 13:39:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "allison@lohutok.net" <allison@lohutok.net>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "clg@kaod.org" <clg@kaod.org>, "groug@kaod.org"
 <groug@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Thread-Topic: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Thread-Index: AQHYF19nCm4XBW90q06ptXN1Sv+uT6x+oOkAgAASpgA=
Date: Tue, 1 Feb 2022 13:39:37 +0000
Message-ID: <c66aab06-f805-f591-0d08-31319885b912@csgroup.eu>
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
 <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
 <7c34009b-0d34-baa8-f4ff-68f2203422c5@wanadoo.fr>
In-Reply-To: <7c34009b-0d34-baa8-f4ff-68f2203422c5@wanadoo.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 555d11d9-8cdc-4ab3-2735-08d9e5884a88
x-ms-traffictypediagnostic: PR0P264MB4111:EE_
x-microsoft-antispam-prvs: <PR0P264MB41115D1D6BE75DA41CD1E169ED269@PR0P264MB4111.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xkouHlxsYfd030Ukbk3Hm0HbQezL5CzyNWgvg4s1FhZngJJvl1DPoTjp2ABa2gvNJ/6ClELodhwlukN+SZ3/p36xMsqR5EvoYoc1z/mDI+xk3uZH7D1gIJdaFvObfWn/SCQV8mR9UD7mlv9piNyYE6TrvCrWoZf9+suiVhbeRqgi7a/2pW2Fh/wvnbt1l1dDpWwHagpRgdj60rjVx8Ry6GNYmlD0sKwPzYPr4bHWPfj1f30IERNzSrWYTzXtkavOeZzFryQQMSGcD97en1yICbfPAtHPz6ml2wz665qodGM0tCqYikxEqqrHAufc0BFPGqI0OPy86T//vjMdeZ5z/TU8QS9v6gZGv9TLtmwsABHLNRHzA9oQDpwP1zmUN0IADXb2WNA6PwrabfCNU9iYvigVob5mGp/NnLjLX5jPIUBuo12Asoc3EDnjSY2AmcEQUVW4vG24DnQCwD83sva3rnMhH2AyI5G0d9xbcwp6HjiI3d8Lhb+qrADx7MzcrQilvEMmDd08cLeNYqYWKx3v+zlQDQ7Iqt8LRj7+2jHNUyecVj5MYJGo8nsJkyzfuUFztUVHV/YB4YZfo43AZwupYHpx1E8O+RtC8YLP+JLkqWKVPhZHRrULFqWJciz0F3yt7qJLS1gLlIy/+C6IRAMvnhOY3xkMSqgIM44K1uFMbDQqAFwfxiZgWiN+LLwJCmAi8n5cvK1vIyDPYbExmMK+uFg8hkwiDaBVjY7TTtqdB/J9OmVjoni28hH1wXnHmsS413SYNSjrN0hvbfQA1lrOMjIC37tYmdnmyAuC/4/2SFkFDGd2yovFdR1j9B2uCg88o7/6gY3yloYPn2mFe0foi3yPGNwN/rxvfSEEsyuK21PGJamJiPoKlzK2d53ERaXqgWhNWkIJ/1ZTkEH4Z9+xmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(31686004)(31696002)(86362001)(110136005)(122000001)(38100700002)(508600001)(91956017)(71200400001)(8936002)(76116006)(4326008)(8676002)(66446008)(66556008)(38070700005)(66946007)(66476007)(64756008)(316002)(6486002)(966005)(36756003)(6506007)(5660300002)(6512007)(4744005)(7416002)(2906002)(186003)(26005)(2616005)(44832011)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHV2c21PbE95cnA3U2hxS3F1YzYrZ3hPSGhwaWJhbkdHS1pqVlVpY0V2SHF1?=
 =?utf-8?B?d01TQlhONlJ4aDdSdHpUTVcxRUtFc2ZaYis5b3hHWDFtbTAySnBaY1BkVXo4?=
 =?utf-8?B?QitBSjJRR3ozMUhmMGtWRjdHSHh5cEZQb1hZcnI4NFhRQitZZlpGMm9hQXZq?=
 =?utf-8?B?aUgzM0RMWFNPVTA0dG9vRnVqNkYyWnpZSVJmQlZIMzNSMFhUMk9qcXRQZm84?=
 =?utf-8?B?UFhrcTdBWE1zeTMwT0hUeC9UdFlVUUNwb1p6THV4MUM1TFErUE01TEkvNUZB?=
 =?utf-8?B?VGZJZ0RaaVpaYUFPclJpYzJaN3dkanB0VURlN2gybnVqMDErZ3h0SEVoVFlu?=
 =?utf-8?B?N2VuOWkxeUpCam1oekowekFvUWEwRDlpZTI4UDJkRUJWc2Z2Vm5BU2pWYWtC?=
 =?utf-8?B?QTRzaEhmYmd3ditiTkxUd0tRRHJXVWdHdDRvTndsNk9palJrT0ptNFF1Wkpy?=
 =?utf-8?B?M25NQmJQZW1MMjU1bmRUbHB1bmU2eS9lY3R4Q1ZYZ3dZbFlKRlRhaTlxbUZh?=
 =?utf-8?B?b28vT2p6Y3VxbWtCREdPdXBtWERBeTB5N2xwak5PV2RjK0NWSmRMU2ZicHZL?=
 =?utf-8?B?eXl4SCt3Zkk5UXk0SXVmcitMQWs3YzFsN1lUTmErUmdmaDcwbzJieVR6ajJU?=
 =?utf-8?B?WU5RZjcwT0NhNWd0VUQ0YVZUaGozNFNleGpIQUx5VE9heDFiWE1hbHJyQXFz?=
 =?utf-8?B?QUpCdUtsK3VIRW1QVlpXeDlpWnc0ZTEvczRXaXFjNndyN1BUdHM2alg3ZWtu?=
 =?utf-8?B?K3lDLzdYNkpwWExWSU1Ob3BlbGtycDJxbUdRNVdhemJRaXZzbmNPZHFXbFhj?=
 =?utf-8?B?UCt3Y2FhUTVKb2NXQ0I5WmNteHBzN0ZRV1UwTjVYdCszL3F4NXdWSjlXdC9N?=
 =?utf-8?B?U0RRdTUrczJSQ0k0MzE5cnpxNHU1MmJzNklQdUZvbjV1RS9waGs3U2dNR1lw?=
 =?utf-8?B?NGdzbk1zMU90aStqSTdzZ2V1SXBabVlwRjR2UGZCclhaU2pialpDc1JUSW1M?=
 =?utf-8?B?QUVVZEhTSWxYYTRROHVqd1Vib3BBaWJ1VC9ZWG1WdlFwNmxyWnhrWkYzSmlo?=
 =?utf-8?B?VTZtVGFXTWF0MS9ubXVNU0hwdEl0U1B4NncrZENZaXlKTjROTE5CVjdCTEox?=
 =?utf-8?B?L1JiZUkrUjd1OVZDczJuYWhRK3k2dXlwdld6TGxpV2k5R2p0dGd2VWJjN2R0?=
 =?utf-8?B?MzB2b2RCRFc5M1V2Y0hSQzkrc2plLzkycXJZWnd5OE02Q3ZtSG9RZC92SVFM?=
 =?utf-8?B?UVkrRE4wR2orcWpnZmlVRjZNNW93dEpsL01ZamZzOUhQVk9OUGx2OE5ZZlly?=
 =?utf-8?B?Y2FGbGkyRTNVWHF5c1FXd0lwekppVzJMZEhGd2Vnem5FYWJ3Y0twdVhHYVdO?=
 =?utf-8?B?ei9DNHUrQ1dwbDdGeGcwY2ZQNk9RVXgzUG5MOFVUbktQRXRBTVk3VjlRTGlo?=
 =?utf-8?B?NGNqS0RSOU1UMEprM1pkd2N4NzZ2b3dmZDljMytJRzhrdjhveGIwbHZFZFJt?=
 =?utf-8?B?cVlGRG5UTHBTdGp0eVBIRW9HMEtVRll0QjY0bzR0MWJRTDJvQnRORGwzYmht?=
 =?utf-8?B?bXY2MzFnR25aYlRETVh4NHN3MktUYmpuWlZ2WTFFMStsUUZHSDZScWtkSWdD?=
 =?utf-8?B?dGZwMjJzdi9FTEZqeEQ0bklzalpHT28rRlhYalBYY0N2VlZ3SkIrZ2h4Y0tX?=
 =?utf-8?B?T1lOcFk1WVY5dEpUTFE5OGcxcXV1ZzRxa0JnQTI5OUNTQVhMVEdHMDc0V1F4?=
 =?utf-8?B?QzMxZ0FWcU1GNHVRTnRST2hJZzhUMit0a2h5bTJCRVdrVVkwOHUxcFZaZGFx?=
 =?utf-8?B?Tk1TVnI5T1VQaWorZzhMMnhwUHI2UFFFVlR6L3lhYTdZdnBMTmNSRjdYNjl4?=
 =?utf-8?B?VnRWdWEzanV4ajJHL0pwWHNHdGxjTEQ5Rk1kR2ErSy9xUEdCbGtka2lhblpn?=
 =?utf-8?B?Z1dLK29Ia2NJZktPekFSeUwycndxK1NvUHo4RTBtbkVuZExEWGZwcUxtSnFK?=
 =?utf-8?B?VUk3eXM2bUJaYTU4Yk1ubFFkaDFNemRudG84Q2dTMTNrLzFXdDkzbmR5aTdl?=
 =?utf-8?B?ZlJKM3g1TFVqRUJGaUdpTmtraCtyVi8wR2RmSExOcGYwM2JVbCtOWXBOYXUw?=
 =?utf-8?B?L0p2NUVKdE4xSEFKeFc3YjRWbXRxRHhyQ1pFQzRvSVVVUEpQd3lGS2VsNWdD?=
 =?utf-8?B?b0Z0VHFrTkI4WkwzS3JrOVM0TTJzUXIyVmQzYmxpSDBrMy9MOTNia3ZWZ2NR?=
 =?utf-8?Q?gz58iiuWq7tJZQbqNqgoIixJG+TxLz9Oh1zJrjaKVE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2564B4EDC351AC44AE6FFEF7B82E6239@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 555d11d9-8cdc-4ab3-2735-08d9e5884a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 13:39:37.7604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2MYMIE8HULClWNVi13ZTuC+9smHiskoFWJODYq0CWblDK20//IG+uU5oPdjWMpcWoANCtctKCLNkCJ7KSWdTbUUYcg4xDJaiSqugLJ/vGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4111
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzAyLzIwMjIgw6AgMTM6MzIsIENocmlzdG9waGUgSkFJTExFVCBhIMOpY3JpdMKg
Og0KPiBMZSAwMS8wMi8yMDIyIMOgIDEyOjMxLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6
DQo+PiBIaSwNCj4+DQo+PiBMZSAwMS8wOC8yMDE5IMOgIDEzOjA5LCBDaHJpc3RvcGhlIEpBSUxM
RVQgYSDDqWNyaXTCoDoNCj4+PiAneGl2ZV9pcnFfYml0bWFwX2FkZCgpJyBjYW4gcmV0dXJuIC1F
Tk9NRU0uDQo+Pj4gSW4gdGhpcyBjYXNlLCB3ZSBzaG91bGQgZnJlZSB0aGUgbWVtb3J5IGFscmVh
ZHkgYWxsb2NhdGVkIGFuZCByZXR1cm4NCj4+PiAnZmFsc2UnIHRvIHRoZSBjYWxsZXIuDQo+Pj4N
Cj4+PiBBbHNvIGFkZCBhbiBlcnJvciBwYXRoIHdoaWNoIHVuZG9lcyB0aGUgJ3RpbWEgPSBpb3Jl
bWFwKC4uLiknDQo+Pg0KPj4gVGhpcyBvbGQgcGF0Y2ggZG9lc24ndCBhcHBseSwgaWYgaXQgaXMg
c3RpbGwgcmVsZXZhbnQgY2FuIHlvdSBwbGVhc2UgDQo+PiByZWJhc2UgPw0KPj4NCj4+IFRoYW5r
cw0KPj4gQ2hyaXN0b3BoZQ0KPj4NCj4gDQo+IEhpLCBmdW5ueSB0byBzZWUgYSAyIDEvMiB5ZWFy
cyBvbGQgcGF0Y2ggdG8gcG9wLXVwIGxpa2UgdGhhdCA6KQ0KPiBJdCBzdGlsbCBsb29rcyByZWxl
dmFudCB0byBtZS4NCg0KWWVhaCBJJ20gdHJ5aW5nIHRvIGNsZWFuIHNvbWUgZHVzdCBpbiBQYXRj
aHdvcmsuDQoNCj4gDQo+IFYyIHNlbnQuDQo+IFN0aWxsIG5vdCBjb21waWxlIHRlc3RlZC4NCj4g
DQoNCkF0IGxlYXN0IGl0J3MgYWxsIGdyZWVuIGF0IA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC81NjQ5OTgxMDE4MDQ4ODZiMTUxMjM1Yzhh
OWY5MzAyMDkyM2JmZDJjLjE2NDM3MTgzMjQuZ2l0LmNocmlzdG9waGUuamFpbGxldEB3YW5hZG9v
LmZyLw0KDQpDaHJpc3RvcGhl
