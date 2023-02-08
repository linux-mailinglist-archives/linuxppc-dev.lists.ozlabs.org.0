Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3C68EEF0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 13:26:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBfPn5f57z3cgx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:26:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EuEd3SKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7d00::62d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EuEd3SKp;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBfNn62Wsz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 23:26:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/QDpyYcHSzg8pY0ZTcgcDcgUi9GOFVnA7TWHYk1ZEopNZhDAFsYJ2ZK4dtU57JDN41FAi77R+b9DB8TJt3CVwQsMaaUFnb77VAGf1DH9JkXEzt12WpvTZUukF8p3zi5cLfXg/QwoRCUM+6u7su9xB5dOfvoZUutd5xBBALh6DdQTC2NTePFMPxJRa5daZ+964RgFn0U0GKQy3jfDu0pBu2fsZuMsbu3UdkoCWOwBN4IkcZGds1MujzEBe0hWp0Urw9Ii/Sw33xcCIwHPWJ61tFIfBNYyyXDRPNpwRs2+cK1zK0ZkA/326k6j46jH4jyY87mMGeZkROFFoOtC2HEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKLNqM4IVLoA9hcBhKgorvmU620acEXzNhEMx5+2DUs=;
 b=OxDj5jLHMFFOrGxJc4vW9Ddr+Vv0uyhtWedy7Q7ZN/JfnRzvlNLHiZNiEag0Tm/hM1rur8jVHla6WBZHm35yGA7iA+6CyaQuOZ4ZIuwUB/0xYaluJcI8byX30dU1BzkBbSblEpIPYNJy4GYsC558y1L69i/zXw8BMDOTJCNWnTPYKClxkfulnhxPKYEiPenEPXVIxyuiFVru8XKM4T2dnlZKTzcMOOSp33EI9/yllH7glyE39gW/LBn/b9kXmGsFNH98qpL5epNG+PnltR/aVlPVz5Oz6O1O4pbugZBnzIaLR+e5Ngpr0+wanPpk9UeXo9kykjafWczZRTDecWV/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKLNqM4IVLoA9hcBhKgorvmU620acEXzNhEMx5+2DUs=;
 b=EuEd3SKpSC42zaQnrp4n8BadeNiwqhe5PRSOO//BwpKTyVs8f6Kgv4N2rxrIk4ANP+akNDcYRNy6dJl076NZLWcPD0LHVEc0NSEMlRo2+/ka8DSMOYyO9R7wFxKhjt3rpBpIpugNsd1uwnuqOiFXzPdXB8jaiZFFUTdUvBkLjl4pun1BqGCs3SQLAawfzO0iIs6Mwr6WM3BnQN5CCMy/EZFR3P6RWLPKPGtoP1lmChBjrlkLvAiPoleufgRW/22bJkLtVjaSlcdxuPyg/vDOYzykomwNeSZpj1cEjfRM3Si/2W/hoKSMq/OFfZhfZRjF+TCcvWuC68FTSi4nhUY91A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1795.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 12:25:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 12:25:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-xtensa@linux.xtensa.org"
	<linux-xtensa@linux.xtensa.org>
Subject: Re: [PATCH v4 7/7] powerpc: kcsan: Add KCSAN Support
Thread-Topic: [PATCH v4 7/7] powerpc: kcsan: Add KCSAN Support
Thread-Index: AQHZO22jIeXQ03Atjk2h4YdGmw29bq7E+g0A
Date: Wed, 8 Feb 2023 12:25:41 +0000
Message-ID: <fefbfee0-f986-dc85-cbf7-dfe45dc1334f@csgroup.eu>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
 <20230208032202.1357949-8-rmclure@linux.ibm.com>
In-Reply-To: <20230208032202.1357949-8-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1795:EE_
x-ms-office365-filtering-correlation-id: 63f64d7d-49f1-4e09-29cc-08db09cf97ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OsDsTdES+W/Jx/lsaj7zkaHxWS2N5WPtiK19p3loSdeqic2WBsO7wpkid9/WITN0ABXutR/e+1pZHfLHfCqPcI444fJK9RGULb1WcFa3IW0h+JIA56S6KF4YI3L7aL871h4PGlWfpIaiODWBp/rLD9yPsfOgv4MRInezJg7IsNNi+8iANKmNttel2+v9ojtjCk8uA0pDsGlZm8FdTWvTcOztQFW50ba/YwAedOZclSr7Kz9pgRY0D6gCSeoLmpgqBAhfxVrwmalr4fnN84Gg1R4t/3bzIhhQ2Pt9qEtZfYL02FRK9Vq6UDAGqNW64U9YYTOlbxey9HKeUkLKF57NKB18pFe0QxDN0Gl651L2zxooqXEAxisdFpFBsvsEsBOZggqg6NOOnhLCEmEJ7qiTb4NID94B92Jhubu8KAOW6G8qKK1k0pLrLRbsah4ANItB9H9ZVFdTVG3sEt0nDji60Pbi9XWnM57/hVVgOU+Wu82c6mpMO13WLGc+uWvPoXU/ckRQB30dLroCcdBwYYbRLBN/uM3FeIAt9ME9oBhhuHMKfnchmzFT+jsj528UWIIWsJsyMxbcX2Lcc29Hrpp26h5GV5UdCyQ905gWYfSvAyGkH9HwXpgpLuzunDrnkmIg6YsVFm+D3Dy6ECac8+4cLIFqWBreHrL3wozYeVYeHa9AB0YfNav/YyGVb6iPtIVqE/LmOkF0zwynQ+ZZ+5pycv+XDLfAL2XYRfLrDYo+zyHRmVLCCQExqwD319ZZVyfwoEPI3MPc0NM9ketoti4BZA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(451199018)(66476007)(91956017)(4326008)(66946007)(76116006)(8676002)(38100700002)(316002)(31696002)(122000001)(66556008)(54906003)(110136005)(86362001)(5660300002)(6486002)(478600001)(31686004)(6506007)(38070700005)(26005)(6512007)(44832011)(186003)(36756003)(2906002)(71200400001)(66446008)(64756008)(41300700001)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZVBLUlBWY2dzbXkxRG0rbjdrYWQzMHMxQ2F1dnU3Mi9TM3ZZZy9IcjBtdXAv?=
 =?utf-8?B?UVFmSUNFTjFEWUIxaFdZK1ZkM1YwdGprbElSUWROOWFsU1U3Q01Gb01kc1hE?=
 =?utf-8?B?ZXBRbzhoYXRnbmhUZWdoeXd4ZTRtWFE0RkJGTjlsTnpxME1zaXE0bGw5ajBt?=
 =?utf-8?B?M09PaUptaXM1dURTZDBkNUgxZ01wNFl5WURIYTNtSDFjOUZ3WlRaVlc3UDlV?=
 =?utf-8?B?ekxZTFhkZVJtSGRZUEFpdTdHOWd5TStLMkNSQzdhbGNMMHdzVFl3aVEyREcx?=
 =?utf-8?B?QVlTRTdVUVcwbm5aT1Y2SnV1VHVITWRuYzREMlVBaFNuZUc5alNmUDV2R1M1?=
 =?utf-8?B?OU9JUDM2Q3N5MjlHZ3oyVk5vU3hKSFJxWUdCRHVTaXNKM0h0YkhGQmRXblds?=
 =?utf-8?B?VUd5emxITjRWNjU0Z0lIM3hGYW1tUDJWWW43RmJWYXFLZkhUMDFBVmJDQWlE?=
 =?utf-8?B?VkpmdUhmR3FEaW15Zy9CNjlsbDhJWUQ4RXk4OXd1RnJwbEZQLzJMcGxVclY5?=
 =?utf-8?B?QzhqTStTNjdWc2kva1ljRHFFbmtJcUIweHFsZU43U3RYTHUrcVFpbUU1bVVm?=
 =?utf-8?B?Snlua2dpSTVWTWZFWnk0aW9jZGF3ekJvK2lRWHhnUUJ1dGliR2FWUHlRQnVU?=
 =?utf-8?B?OUhweUxlZEVvU1U4cUVLMFIvUkQzaFBKK25lWU1iN2doblkvM3JydjlyUnBG?=
 =?utf-8?B?a2VsQXBHNEdDMVVLRXFrR2VneFBYYnhDaUNYOWpiUmxjMFhtVzk5R1N6bDF0?=
 =?utf-8?B?Y3JOT3ZFTFp4cjllQ1NIaGNFV0EzbWdRRmlHb2ZMbGNuWnVZa05udHRTaHdV?=
 =?utf-8?B?d2xqNDU0K2pONzhDamhHckhmbGFQQWJaNU1EemRJbEtrY1BXcGFjWkJhS2cy?=
 =?utf-8?B?MGRXU09BZUhvRHo5WVcrc3VRN2d6YzU1bjJ0V3J2clVWaWlBSjBWWE1EeWZC?=
 =?utf-8?B?OGREVnBMN2tFYWFkdXAxWTRJbXUzZG13QUg5MkhmUG1hZUhhZS96aHFaYW5D?=
 =?utf-8?B?eVZzeE1UV3RIYVRUaHBsZmtrRWw4MXFaeFR6aXFvdjZVd05jcGxyY2lSSEVo?=
 =?utf-8?B?QmhxMkhSblZCb0RSbDJSNGNYVVR0OTJNVFZZREpsZG11U3ordXBkQmxRVThO?=
 =?utf-8?B?WW8wdmN5QUNIcWJWSVhZOVNQcGJqdjlTdG1tZWFpR0VwZXVhVmVTL00zNkFW?=
 =?utf-8?B?NURUVTErWGNhRjZnU2JISmZiQVY4YVBpRi9NeVBoYkZieUg2azFuNG56cTY0?=
 =?utf-8?B?MlBGYXE3VEcwdzZqVU84cEF1Yk5iTlBHT3FHUndGNTdoWTJUTmNOL2dYRDBz?=
 =?utf-8?B?SjF1WjBXTlJpa2VuZHJHczQ5c3IydUxTeGs2VXgrMVk4ZjVENUtlYllCaUZU?=
 =?utf-8?B?TW5aL0cweGhaQ3pLZHRjM3lLYjFXRmxLd3RMZk44bjRYM2M1SVNRZ0x0Yzg2?=
 =?utf-8?B?THpTWFZFWE8wT1NaL2x3UXhheEtDRGVRM2JvQkkzV3oybENHak5nUmZVWFRN?=
 =?utf-8?B?TGFXd1dRZ01Wc0lGZVNURUZkVURqUXUxYVE3ZjVVejQvemxybC9CWUplbHN6?=
 =?utf-8?B?bjZIMWFJcmJweEhjdmJZakV0TGdiRXluMGt5aUE0aExHTXNWSFV2LzV6T3By?=
 =?utf-8?B?c2FoTnFQb1FHVEgxZ2J4b050L0x5bU5nWjJEeFkvSXcwQVBmWkE2Q2ZsR3cx?=
 =?utf-8?B?bXNmZzV1MHFGOHc0NUJSMW1zRnF0S1hyVWpRWFpyKzN4bUxicmRPSzQ2Z2xT?=
 =?utf-8?B?TXl4WlNwNWcvV09ZSEd4TEwxN08wODRhcCtyVTcreFg4bUZUakwxWm5mdEI5?=
 =?utf-8?B?TElDcjJWK2dnckthTWgybVVzNml4KzljbFlKbW53WHZ1ZC9SQ1YrUW04elFo?=
 =?utf-8?B?Vkk1TkVkaDRkTEdHWnFYWEZjSlh2ZnprazNqWE1uTy9jN29TR1k1aGM5a1VR?=
 =?utf-8?B?M2dzUi94NVU5NS9Kc1MyVFlCcjE2Sm9MZnlxbU5aOUVMejdJRVpYa1NqVkk2?=
 =?utf-8?B?Q3B5N2Rrd29ESER0bHdKM2lMd0IydmJCNTBuRm5xTVcwYTVKUkhXNTQzZ0Rm?=
 =?utf-8?B?S092WFJsYnhFeDJkQTNCcGtiM3NaaFNKMVNvQXVxQTRHZnp1UXkrZStocDV6?=
 =?utf-8?B?c2FlNEE5WWp2Z2Y3SjAzYWx0WGliZWZIVTlXckE1YjNrU3hXaSswbVc3ZnlI?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61B3E7EEA19D254C8240D66B180B049C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f64d7d-49f1-4e09-29cc-08db09cf97ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 12:25:41.0242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMPYQ+U6xmwz6DaXM1CrxWVD6SCudSh+KlWYVd1URo37aCRXtYk3m+Q5WRd2O1X03YfpUzdWYYfhLGdyOVyIaQmbaaT7sJQTkERfZVR/PX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1795
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
Cc: "chris@zankel.net" <chris@zankel.net>, "elver@google.com" <elver@google.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzAyLzIwMjMgw6AgMDQ6MjIsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBF
bmFibGUgSEFWRV9BUkNIX0tDU0FOIG9uIGFsbCBwb3dlcnBjIHBsYXRmb3JtcywgcGVybWl0dGlu
ZyB1c2Ugb2YgdGhlDQo+IGtlcm5lbCBjb25jdXJyZW5jeSBzYW5pdGlzZXIgdGhyb3VnaCB0aGUg
Q09ORklHX0tDU0FOXyoga2NvbmZpZyBvcHRpb25zLg0KPiBLQ1NBTiByZXF1aXJlcyBjb21waWxl
ciBidWlsdGlucyBfX2F0b21pY18qIDY0LWJpdCB2YWx1ZXMsIGFuZCBzbyBvbmx5DQo+IHJlcG9y
dCBzdXBwb3J0IG9uIFBQQzY0Lg0KDQpDb3B5L3Bhc3RlZCBmcm9tIHYzID8NCg0KSW4gdjQgUFBD
MzIgaXMgc3VwcG9ydGVkIGFzIHdlbGwuDQoNCj4gDQo+IFNlZSBkb2N1bWVudGF0aW9uIGluIERv
Y3VtZW50YXRpb24vZGV2LXRvb2xzL2tjc2FuLnJzdCBmb3IgbW9yZQ0KPiBpbmZvcm1hdGlvbi4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29t
Pg0KPiAtLS0NCj4gdjM6IFJlc3RyaWN0IHN1cHBvcnQgdG8gNjQtYml0LCBhcyBUU0FOIGV4cGVj
dHMgNjQtYml0IF9fYXRvbWljXyogY29tcGlsZXINCj4gYnVpbHQtaW5zLg0KPiAtLS0NCj4gICBh
cmNoL3Bvd2VycGMvS2NvbmZpZyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dl
cnBjL0tjb25maWcNCj4gaW5kZXggYjhjNGFjNTZiZGRjLi41NWJjMmQ3MjRjNzMgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmln
DQo+IEBAIC0xOTgsNiArMTk4LDcgQEAgY29uZmlnIFBQQw0KPiAgIAlzZWxlY3QgSEFWRV9BUkNI
X0tBU0FOCQkJaWYgUFBDX1JBRElYX01NVQ0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tBU0FOCQkJ
aWYgUFBDX0JPT0szRV82NA0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tBU0FOX1ZNQUxMT0MJCWlm
IEhBVkVfQVJDSF9LQVNBTg0KPiArCXNlbGVjdCBIQVZFX0FSQ0hfS0NTQU4gICAgICAgICAgICBp
ZiBQUEM2NA0KDQpUaGF0IGlmIFBQQzY0IHNob3VsZCBnbyBhd2F5IGFzIHdlIG5vdyBoYXZlIHRo
ZSBidWlsdGlucy4NCg0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tGRU5DRQkJCWlmIEFSQ0hfU1VQ
UE9SVFNfREVCVUdfUEFHRUFMTE9DDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfUkFORE9NSVpFX0tT
VEFDS19PRkZTRVQNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LR0RCDQo=
