Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A07C865D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:04:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Kn7klveE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6RYT4D0Pz3cmr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Kn7klveE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6RXR3cSVz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:03:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvFrWGJQCBNm02xrMDc0MXBwKEuerXkbVZkh1fmQqi7ci+ImPlpEYmZNYN2YsJpHdpaXw8q2FK0pIh8ROeMP4dEP7Q30tTTsPtnhl74AN8QWUxzk+OSdHYbJDI4qBodg/RU2mfZ8sEpX9NcLSW88VPlgd2WxTFFnu2ACQBANXy0JVt1EU0Mgz/v6Fn5OmnGSyZAPt6zTwiT3NSFUtJS34QrcO0iBoBXBusDiuKfX9r4ptm56K6Hacoylta85h3y25BN02huwRG9l5vFyJ0rH3pBGTQXrORxHxEvmvZO/M6SHenreI/4qXzn5VALc7ke7glb45i+Voy03EeFI4ZCXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LSzYrOH3uITAqeQ/PBJKD61z1SDitTHTHqPcZaMhQQ=;
 b=Ih7IoVdXPy7b86bjzZxrz+h1ErMOCZUTdkuw2/OK95QtntmNGfxG5WhVQ3ELVeHlrADcEFVJsAyzzz1uD4XwuGt3j9WKFJLvkhP77ZpQGK6DBJKcIqVogkEsO2xMqmuub8pLvWxXsT3DwmC1Fr5GYKapLaNE+o4k1f8nYWADlcNm8Zdjf4tKGtrrieOvwMO99AhZQ9BQLY84nvlG4vHmRMwRkJWJLXgMI/pqgKqMWCCssZg+BI/v/hQG0JuAdpawmTVdxaUqhC50vdn/qhADhGuL78KspORSEzP4HZ6eKbp5xDrKvrA7FUIs4vWzpVDWD42yLYJICJy2wBPsnvCcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LSzYrOH3uITAqeQ/PBJKD61z1SDitTHTHqPcZaMhQQ=;
 b=Kn7klveEZP3OgHbTvCGQtcWBpu2H+UlsAWrD4couEe33fAp9MfVng/L4pcbQQHnimKNuWGL/cHCHhch0ukUcTm3YQ+/cZE0C19VDf9U2ciEX9lw1J0kl1ZH7pM/brQzJBXMWWg8YfU9CL1aWWnllF/xOU9COz6pYsbbkV01iDc0ewWjltDnV5XvT+F5yEYD/4kwJJuGtHh5ZOI5RLOcV9DBDLixezFnUOa8GYekFSDA7ySAOYelhRExZio9Up6R0dhvaWlOeuEaQOs3ic8It1+uozZhoqnXd037bv+MCXY1+uDGhwiVkYk4jYZHbmrKV1gYY0Lg++rAW7ux1EHLpKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 13:03:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 13:03:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Immad Mir <mirimmad@outlook.com>
Subject: Re: [PATCH] powerpc/powernv: use appropiate error code
Thread-Topic: [PATCH] powerpc/powernv: use appropiate error code
Thread-Index: AQHZ3PiH8XnMX/4C4EClLtCpI6xQl7AGPNwAgAAGUACAQa4rgA==
Date: Fri, 13 Oct 2023 13:03:23 +0000
Message-ID: <96d2ce59-9662-2f27-1322-8f9efa4ba248@csgroup.eu>
References:  <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
 <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
 <CY5PR12MB64558C413B3D8A60AA5C202DC6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
In-Reply-To:  <CY5PR12MB64558C413B3D8A60AA5C202DC6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1704:EE_
x-ms-office365-filtering-correlation-id: a38ad54d-a1b1-4acf-e8eb-08dbcbecc813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hiuC8o/PBu7pIOR539W1LCg4wAWzvEKOm2vWislA3k/DMfy510zLXasa1GHrG/4McI5lTj3r1g86iyRuRnFKxjKpZtnGjUxTRdli41H/MScGypjNwfu3+igFQVYH/rSFXEEgIVnOXf/+cQ2TRhIq0T57Q2O5I88zNBhVYpzU09FAWSREL72Yq/joWCxEVxc/685CNEZvwYedBCHDlabudBG+H9Huxr5i8GD1RRSuXSIRZopTkn1EylFPhLsLgdC4O3PBQiI3lAk07O7qinhegwE3PG0Ku3iy+7CyYTHIMnLyFcD9SWTv6L80f2oI0hXFN481fS8QTueFVJnDn/ou/9Rb01y1deZaejB7/hKRGXX+Rx7o9v/4KUuGNCLXSRehGwVuxTbB5MUAg66WjThFErSD4z0BDUPHUE9aDQMRxrtcW/I1G3Eq9KMM+drVC83OVbHJq++aWdSf0xfPlRIaA8+a6FidA9Fh3jZKAhCdZrmZG/2jYYcLgQlnU9NodjOs+i7DtaACKrfhWiJhDUcx+cxnQljOl34nBvGnPLUMaLV6RSm8A5+MzH9UZk3NMsYzXG/dvyiE0hCH2cxgYCvzweEaNW/w/CdU7hP4zDsDLSw+no5NjLxkv2V39hDJsrT9ws67pgPDzNFOwl5MmaEaPwzPZ7a7j0cOWYjqhCEp5FWAJoG5NAgY/TmBEbkP8xEw
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(366004)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(45080400002)(6506007)(31686004)(26005)(66574015)(122000001)(38070700005)(6512007)(38100700002)(86362001)(31696002)(2906002)(5660300002)(44832011)(6486002)(966005)(4326008)(8936002)(8676002)(71200400001)(91956017)(6916009)(316002)(76116006)(66946007)(66556008)(64756008)(54906003)(66476007)(66446008)(41300700001)(36756003)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y1dqZVJjNXBMQTVBb2ZnM1dQUmNjMDUyTWlKZmRDM0dNUmpLekVsL2ZxMEhE?=
 =?utf-8?B?ZEREU0JYSFY5MW1jYlZPeWhrNEdodDRSUVpVYWhrWTdjK2g0SDk3K21zTzAz?=
 =?utf-8?B?RUo1SFloVkx2VkFpdlcyVnFVcTlzREdQVU5VeDc4TGllOWhSQnJLTHorMGFV?=
 =?utf-8?B?UCtVV0lWRWxZdm5iNm9DSEVUTGhnRWtTNUc2UnhTcWhwTHZpczdBZXZJM2Ja?=
 =?utf-8?B?N1AweE9oSG5oMm9pWldwUlNDTHhTQkg4eTMyOWJBU3hXMGtPcWNmdzg5NVlF?=
 =?utf-8?B?N2ZUZFRnLzVyUHlnaGxYUzRiY0UyS1Z0TTlTU2NaMkk2cVdhb2owbzRhUFcy?=
 =?utf-8?B?VDl2czNSRzNIeGVXcTlUQ3dxcmtKOVFNVEF5Sk9hWnVYb0RaNmpzaEtNVU5m?=
 =?utf-8?B?US9DUytNNC9qUjdFSEhjQ2VQdTdLakR4bTJ1eG8rMmxIenh6bVZkaUd0UnIy?=
 =?utf-8?B?dTZZOEFHV2hValZQdlNSbk5QbEMyMmRKN1FYVzFwNWl3ZVNLRSt0ZUVHWGw3?=
 =?utf-8?B?MXJObmhyQ0xvS0syZkx3SXFFQURoaDhOVENqeGJLc1FrUWdTdGM5UmIvK1Y0?=
 =?utf-8?B?RkVGU3JTdHBXbklVbktqSDI5ODNOaThrMUxLK0IxZzZzUE9zU3R2dlBseEVl?=
 =?utf-8?B?cHNRdnVwWXA0MEs0ekw2RGtsa0lMdldBaXNRQUxjODJtSytoQUk3TTZuMDRm?=
 =?utf-8?B?MXpEa1hOU1Y2R2FwelRROFZFU0ZXUXBLR0lLQVFsRU9mWWhNRUg3K3RFbjFo?=
 =?utf-8?B?NitZaGNHbllWaVJpQ01WK0tjOVJvL0lGN0ltcTlncVVKL05YUmd0SnVDQ0Nx?=
 =?utf-8?B?L0VCUXZML0tERW0yczlKY05RUFdTc1h1RTFHNnVtc01XdE4rZlpXbGdkdlo4?=
 =?utf-8?B?eGJHR3dUR1pUazF4ejZJTFhFZS9uRWpKamFNNEZrSDNnTTNiRUJiZ2VWaWh4?=
 =?utf-8?B?U3BPTlVKbEppT2VndU12Q3Y3MXFyQXArTytKdEJYYi80M2xFcDBlOVY5TG93?=
 =?utf-8?B?SHVmc0xydmowK291Mm1TaXhYUmJSNExXL1oxT2ZCY1JiMVhzTHZwNVNlcmJI?=
 =?utf-8?B?MGg3SzEzN2tPSVVlZHRtRW1qVUgrTGZtQzA4WnpWdERSR0VRcVdWUEhhVEIy?=
 =?utf-8?B?blNoYVo1NXhoSlpra3VkNWdqdkFvdGFGalJXUFpCRlZwcGN2TUZuNWhkdUNv?=
 =?utf-8?B?TDBINkhKM2JoTXh0QVdhcGlLdTRHTWdVZnJyWHRUZ1hZMnpGdzF0SENaclN6?=
 =?utf-8?B?UlFYM0taWU1Zbm1YV2FIQVFVRVFYNWhGTG1MR1V3YjJlMFpITFF4L2l3cGd0?=
 =?utf-8?B?VlptdHVGeTdDWXQxaHRoYndZcUR0aWZFT1NwL3QySFRDczFnRS9vSjQxNWQ0?=
 =?utf-8?B?bzVmRUl0b0s5TGhXbG1DV3RHNG85QzMydllwYnV6YVBqS2VBUHlNcm1aNGZL?=
 =?utf-8?B?Ri9zSXFpMmRkUU55Rm1WTko3dU4ycUNoQUpOQlgzWWtxaFRHMHAzVjYzcUxq?=
 =?utf-8?B?NW9YY3VrQTc1SGNocEtIbWVLMVJVbHR3NUtmYmJZOEFGbUYzb0ZZL0JpOHNH?=
 =?utf-8?B?cnhFWk1EenJCbWxRMmdMdXpVd0JZeUpTbkFGL2U4OUU4VVNRb0NjcDFDZGY0?=
 =?utf-8?B?ay9GSHAxaHJrTHVHNzJGTHd6eVNKTkxNeXE0OFJqWktXWXRROEpjMzA5aFFl?=
 =?utf-8?B?eHhpaEtqcHJWNHBGcFpsbHhKc0pZSGJkWEpldHlZR2lLZlBuYTNDYU4rYi9k?=
 =?utf-8?B?ZGVrYzdZU0VsMWp6TVA0YWhyc0M4bXdyYWhhWEljWlEzckptUUp0bk51ZTZB?=
 =?utf-8?B?NmFuVkFMMmUxa2NCMFJBV0NvZFJ6TlNaRXFxRG5COFg1cWxQNzl1U2hHSFVF?=
 =?utf-8?B?QjhuaTJaU3dOZ1NEZmxPUktsWlYyV29yelNDMEtOVlJpVDA1Z3hZTU1XdGx1?=
 =?utf-8?B?YlAzN2JLNVdHK2NhZ3c3TUR4NHdHVGtFRm54cmwrbUtzbERQNUdHZTRaSmIv?=
 =?utf-8?B?TGdOZFhwME9FM1RwTm8reHV5TjZSU1lXNDFDTzVSNW1mOTFCVWxKc25PWTk3?=
 =?utf-8?B?RkxjbkRQVElxV08zbTZsaWJwNGhQdzZaZUEzeVBuOENscjNpbXUzOTE3VHlY?=
 =?utf-8?B?bnpneWcyaWdLaksxNlU5eVlqWkVFU1JONjByWWhseXNJRkExS20xNjFzM0py?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D0D3EE01ABC5444B28B27931812CDDA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a38ad54d-a1b1-4acf-e8eb-08dbcbecc813
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 13:03:23.2016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VucIUQUXKnToQEpPWU0QJxWpmZrNAgolQM8MevlCqdu2DTcH1C0xWZ00Y/PKDKT15E8JPlhfmfjQgObwyo8hDnkpNC9mTa6TMlIIHdnaekM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1704
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjMgw6AgMjA6MDMsIEltbWFkIE1pciBhIMOpY3JpdMKgOg0KPiANCj4g
T24gMDEvMDkvMjMgMTE6MTDigK9wbSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+PiBM
ZSAwMS8wOS8yMDIzIMOgIDE5OjE5LCBtaXJpbW1hZEBvdXRsb29rLmNvbSBhIMOpY3JpdMKgOg0K
Pj4+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1pcmltbWFk
QG91dGxvb2suY29tLiANCj4+PiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFu
dCDDoCANCj4+PiBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24g
XQ0KPj4+DQo+Pj4gRnJvbTogSW1tYWQgTWlyIDxtaXJpbW1hZDE3QGdtYWlsLmNvbT4NCj4+Pg0K
Pj4+IC0xIGlzIG5vdCBhIHZhbGlkIGVycm9yIGNvZGUuIFRoaXMgcGF0Y2ggcmVwbGFjZXMgaXQg
d2l0aCAtRVBFUk0uDQo+PiBDYW4geW91IGV4cGxhaW4gaG93IGl0IHdpbGwgd29yayA/DQo+PiBJ
biBzY29tX2RlYnVnX2luaXQoKSByYyBpcyBidWlsdCBieSBvcmluZyB0aGUgdmFsdWUgcmV0dXJu
ZWQgYnkNCj4+IHNjb21fZGVidWdfaW5pdF9vbmUoKS4NCj4+IFdoYXQgd2lsbCBiZSB0aGUgcmVz
dWx0IHdoZW4gb3Jpbmcgc29tZSB2YWxpZCB2YWx1ZXMgd2l0aCAtRVBFUk0gPw0KPj4gSXQgd2Fz
IHdvcmtpbmcgd2VsbCB3aXRoIC0xIGJlY2F1c2Ugd2hlbiB5b3Ugb3IgLTEgd2l0aCBhbnl0aGlu
ZyB5b3UgZ2V0DQo+PiAtMSBhcyByZXN1bHQuIEJ1dCB3aXRoIHlvdXIgY2hhbmdlIEkgZG9uJ3Qg
dGhpbmsgaXQgd2lsbCB3b3JrLg0KPiANCj4gDQo+IGlmIEVQRVJNIGlzIG5vdCBhbHdheXMgbmVj
ZXNzYXJpbHkgZXF1YWwgdG8gMSwgd2UgY2FuIHB1dCBhIGNoZWNrIGluIA0KPiBzY29tX2RlYnVn
X2luaXQgYmVmb3JlIHJldHVybmluZyByYy4gSWYgaXQgaXMgbGVzcyB0aGFuIDEgKGJlY2F1c2Ug
QUZBSUsgDQo+IG9yLXJpbmcgd2l0aCBuZWdhdGl2ZSBudW1iZXIgcmVzdWx0cyBiYWNrIGludG8g
dGhlIHNhbWUgbmVnYXRpdmUgbnVtYmVyKSANCj4gd2Ugc2V0IHJjIGVxdWFsIHRvIC0xLg0KPiAN
Cg0KVGhlIHBvaW50IGlzIHRoYXQgRVBFUk0gaXMgMSBieSBjb2luY2lkZW5jZSwgdGhlIGludGVu
dGlvbiBoZXJlIGlzIG5vdCANCnRvIHJldHVybiAtRVBFUk0gYnV0IHJlYWxseSAtMSwgc28gYnkg
Y2hhbmdpbmcgdGhpcyB5b3UganVzdCBtYWtlIHRoZSANCmNvZGUgaGFyZGVkIHRvIHVuZGVyc3Rh
bmQgYW5kIG1haW50YWluLg0KDQpDaHJpc3RvcGhlDQo=
