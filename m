Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE755B3639
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 13:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPD7n5NJyz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 21:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w23FVbHs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.50; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w23FVbHs;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90050.outbound.protection.outlook.com [40.107.9.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPD7157FBz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 21:20:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaE70WD02rcILm3eSjMAglsiRRmVzGWTxdqrT4e0nxrJsl6t5IvpA4jKrM1DNXtnOGdRBZdrGVVnJ9cnPL9dbEZEjynmq/1LOmUO86QS8nuPEX4V77YcBHnRenk5xSP+/3qBgxun7G5hcsCzTTsPQJgPnGddvuBK+1gJWpXiVr5xyQYvv+lapxVg3U1rX3ezOhzUBaOTkb0w3LxFrEWEznxirz08M4UtD1PU2mmecnym6ajkhClp8swujqrRacD9qeI8nsI64nCspP0mCOLUIdefvb+/lACvrFNAqh6DsACcta345b2thKkDHlbYqu4++lbef1/Nz1YJPZf6txUDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFkqq9zgSvG9fziwKuKxbH3g1ru8N7j5KsmveNx5ZMo=;
 b=oZvcpHJuRngHj7g7wW44fP6QPtmnTYLaMKfag1dx9N2cbYTPqxFn3NdyGkJ54SscF9sFMRPpFiUISDdWBbYRnwu2Atw4lAm5c9tRM9p2VcR5dnmQcGEad4SofxT+ELHg/I+uiRf/mIuJtnjUffox/dfFdzYIFv3mhWCwNdCsnFMXFiabSRhmder/mWUhJH56x09G/nNFvntcFNlO34MfCKVpFeK8cMArZ3wBMvU3xlSpV8UGs06ieLFR9dp5+qyy7Rdr6Drk2YVb1UqQGbOnir9CDxB73wmoKZHYIsQJMhePSqAPPvTolYQNAWfrAhjl2gev731ltMBnXt46lBYEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFkqq9zgSvG9fziwKuKxbH3g1ru8N7j5KsmveNx5ZMo=;
 b=w23FVbHsyZZWf9rTA0ohPGB+LAenV+ULsFi7Uo3wVyG4FsG87Jchbd1FYqdAu+DQR30l8x9la4/2G0EGkFKyXQv992xvNEEnfMq/hVLelrHaHJjp6Kc4EE24niCLEJDpbBl+6xdzvmiSCDvbwBc5Z0NJHIpvjjKgCZQWtttz4hVe/V8UPPdxr0frjBT0xlYOT/yP3kz7O3qxRSG+IYGR9PmUlditRkHQGc61ft+V0ifKIB9U79pU8ZNWYR3a1iOwca8bmcF1JrOVdZphMRQzTT3frc040T2Fv1R+3A9gryb5w3kRhERtjag4Pq+dtyVL90w20k+BAnzAi7wE7o6ubA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3110.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 11:19:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 11:19:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of
 creating a PPC dependency
Thread-Topic: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of
 creating a PPC dependency
Thread-Index: AQHYxCsW50qhWcc7f0iHq7StqfLKda3W8M2AgAADB4A=
Date: Fri, 9 Sep 2022 11:19:53 +0000
Message-ID: <2379456e-4f18-d619-10bf-022327de0463@csgroup.eu>
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
 <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
In-Reply-To: <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3110:EE_
x-ms-office365-filtering-correlation-id: c138658d-087b-4ebb-b881-08da925537be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KoNtdjiAWYZd+5AKum3WcTGMSxtGjtFXSq3tqROOxs/zaK806/ZsGLR2PW2XEZ0a38z3FUBl8jQ99grnbV7+clPF7AEJK9cBrT+OcHPo2ZWvCjUh5+kJSo49L0itcECqqk7kNKliVg9p4ocpkfZrs+TUrnqHyeS622CqWW3obK9nkpXjt382ct/GR/bFiTNnml+5Pl9R8RYrrEU+t/PfCxN9OnwoqOc0CWnma5a5Dsm4e9q3axvDvXWAXAl1Am3VAkHUMiAt0yzgATrqj728QovYWaYe0l69oDnczfAlAGOTBjPjXRo3a6H7c76dopbAsT0FRRHKc1T3cVS2QFjiTgwL5HEPBjTKVDsALLqbcDOFZVaMBvFlmlFD3BTCVzpDzbAE9MogqaIHThaYsnWlqxbb+hLEDlV7JcgH28gr1BpsWgi/sFi/z/CzfNtxbqD1SooPLCo7gPpItynxLTjWZtd5babOXwKHcbOhqptW35s+jzWeMjbZW77uDc7DYkwt2H8pPPdh4aU1W3SwAabBWwMkwRBA2vK1LxQxZa9o1YPZ7CeMc+Hohm3E13UIeCDM/zVdLTAH0oeeV0wU1eU7u+Dx2QNnWsnHQDpCHfsCHVG74Ol7Q2EffWMnfHAQLc2lT9+tA4AFR4Jhq1K31fAJoI20RmUW9LtixGsJlXBwqVzX/164JImT4odhwNtzytJqwBTzNE13zygNJ5tQtoHIKhpBNqCtNie2TioNOY2+vzwHJcdtQcUb5aIEPKDKnD1EaiICzL0ibEs1zJokt0yGm+Vx4rVq0htx2PHdJquH0eswDbJKJlvkzP0zfvpKKGvacIubF/bqnkfFk0HDsIu9uw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(2616005)(86362001)(38100700002)(83380400001)(122000001)(66574015)(186003)(5660300002)(316002)(44832011)(54906003)(31696002)(110136005)(64756008)(66446008)(8676002)(31686004)(91956017)(36756003)(66476007)(76116006)(66556008)(2906002)(4326008)(66946007)(8936002)(26005)(71200400001)(6486002)(38070700005)(6506007)(41300700001)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aHlTRDB4bEI0YlVFS2ljMjZsb0p2K2FGZElwbGlKeDhtRkRISHJGUkpSY0M0?=
 =?utf-8?B?OXdhN0tST3hNaWNKK21pZ2ZXOWRHZTNsYStIWjFGNTZNcFo4bmY2SHAxME0v?=
 =?utf-8?B?RGRBZVJZWVpZcmNCa0VFclRTWmFLaTRZdkJ0YmxzL1FTcUo5aFZRWE1TWko3?=
 =?utf-8?B?dThpbDFmQUx3Wi9kMm9VVDcvV3dwZWhCbksyQ3RsNzVWVjRlNHlXbVhpbUxi?=
 =?utf-8?B?TDZBdWVVVExlWW1PZmtmTHdwTWlVdS9IVHNTelZ3NTA1dFY4aTVJaTFUODNZ?=
 =?utf-8?B?c0FHSXlPeFlRNTdsV21zRWJnV0d0RUtFZHdjb1lkY1NOUUc4NndPQ2Z5alhE?=
 =?utf-8?B?SXNRT0hMcnJTTE5IVk1EWjBPS09KNEVra2gveHFRd2pQdVNxQnY2RkUvTmZL?=
 =?utf-8?B?b0Y1NDAzbUlRc0hhRkhTNGozcGtXdG1xNFJ3L00wMVJlZll6bElJbG5BT1Bh?=
 =?utf-8?B?UUpodlhqSHRmVGxQVGZqTHBiY3ArbE1jcU9mWlZ0TXl0U2NneVlFQWtlZHBI?=
 =?utf-8?B?RFJlWHBZYWVyN3d2VFJYNWpTYjY1SGZ6bkk5MWNPRmJyTVVjaXo5VmRncisr?=
 =?utf-8?B?ZlBBUUxhZFBlVEkreExsSFNoenFGZHU3ZDN1UnZ0empnQUhGUXVGcDV4QTUz?=
 =?utf-8?B?d2NsOVE2Z05GbmVoVTB1NW1pb1p2dG43blMwUlRxN0VFY1oxY2tDSG43WG9k?=
 =?utf-8?B?OWhFY2FRRG1ONEZsSzg3UUJyVmhwRlA5ZTlHdTBNNmZlK3Y2RFhJT1F3ZkN6?=
 =?utf-8?B?ZnNxMndEWkIySGtmcVpyeXJiOFpKenBFOEZpSVpzRFExZ0hJTXBRU1QyZUdO?=
 =?utf-8?B?MlVlV1d3WFpLRDBSUk5od1c4UUZDMTFhRmE1UnlHNjY5UjdaZzVIcTBsR2Fx?=
 =?utf-8?B?a1hXWWsyaVowK0w2bVd2aUdjQ0ljN2ZickVQd2FVRmhlRGxiOVhDUDhVL0hs?=
 =?utf-8?B?aTMrQndUVmtTVDBkQ2JYMk01SGg4NnIrNjVmY1pMKzRsYzJaNldtY2REbjU3?=
 =?utf-8?B?QUgvMTEzVHZhczFmME12T2VjQVFBK0pXRWg4bVc0Mlg0TlBVZ043eWl4dXRu?=
 =?utf-8?B?TEx2YnJ6cStJQnU1WDBCWTlvZXl3bEtkZ0MrVklFa2c5V2RnU0xJQ0lML2xN?=
 =?utf-8?B?VmdjcVFqTDFiVEl2R1F5bTdIUzFwaW1OUzRUemhpdXBhNDlicVc2cjRlaHdE?=
 =?utf-8?B?eTlsQWZoZ0RBMS9uMjM2L202eGgyenZoQXNpcmhGTlRxeEc3YzRNSVU0TXAx?=
 =?utf-8?B?bFFaU3VXTjNVenhiZFpaRHFFZUY2UTI2R0dvYVoyakloRkVtUTg0VFVURThi?=
 =?utf-8?B?MkorRjdwWWl1UUczdWRwV1lWeWRreS9lN0ZaM0daamZzZnkxZUI3WFBSRGlQ?=
 =?utf-8?B?d2JWRExreTBSZTNuRjNXM1NDUUppSDNtMEVnajg5dHZsbVpzRnlUQ0Z4dStj?=
 =?utf-8?B?Q1BJaklkWlJHdk4rREI4amJFWDl3OExHWWNaZUJOcUoybm9JVlErS3orMXZT?=
 =?utf-8?B?c2J6Y1pObkJoZVlOMituUGF3YksxRk5HMFg3TndBUUNpajZGUS8rZ29wakZt?=
 =?utf-8?B?QTNIWVM4TEo2MGlDM1pjZU81bXl1a3djU3U3TXI4WDFGaFdoOXQ0VTl2bkhN?=
 =?utf-8?B?bmhWcFZPdnpsS1pFanI3VFZtdHZxQkJERDBCc0M3RElja2N3dXVRRjZoYnUy?=
 =?utf-8?B?Zk5WYm9NK3Y0L3dBSDdjRWNSME1rMC81emtrei9nYzJRM0FNbklVeUV4aEpB?=
 =?utf-8?B?T1JuSEo3S05oMEVRbDJzSERXMDhXVmVYMElBL1JHVDdockppOWJaVGF4Z29F?=
 =?utf-8?B?WkRwV20vN01HTWFZUzlTaXlBMUo5a1V2WWk4a1c5QzhUWjVlWnJIU0hmOWFz?=
 =?utf-8?B?MTVRdCtyZC9ueFVCcmxheHV2N1Vobk11MTVhd2VwVTBnemxyMjRyTHQ0RFVj?=
 =?utf-8?B?czFUNlNVQVdkV3hGbkdPMzR1cTVRY0RPOFFCdWFPSVVLbE5SUHdzbzkveFlW?=
 =?utf-8?B?S1N3S2RiTnhNQ05qVTAxVVdxSWJrYjZsclBXWWw0Y1V5REhmQXdLWlZ1c3I0?=
 =?utf-8?B?TG85czRBODIvZzBrRmE2THRLU3lMZnhCczVEU0s2bEwxMTZ0T2RicGp4Wm4z?=
 =?utf-8?B?YUU0NGZjSnNLRVE5NW9DbXkxTnA3d2tLQUduMmpSa2JBMHNGdlI5RmlIWW04?=
 =?utf-8?Q?WW1/BIm81fANalG5QsCg6q4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <614544A03F9A7C40B3A9CAFE80D6C2D8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c138658d-087b-4ebb-b881-08da925537be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 11:19:53.1311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtR3txwqVKfDYeg5rCU2ofDM6bfn/LJJah0EGkDigHOehtT/GRfAtd1oQGrogNEqNHrFX0u/ACKzKXsH7D0BI3eFky/qrJwaBH1TMg0W1E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3110
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA5LzIwMjIgw6AgMTM6MDksIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCBTZXAgOSwgMjAyMiwgYXQgMTE6MDMgQU0sIEx1a2FzIEJ1bHdhaG4gd3JvdGU6DQo+
PiBDb21taXQgY2MxOGUwZmVhNzkwICgiTElCQVRBOiBBZGQgSEFWRV9QQVRBX1BMQVRGT1JNIHRv
IHNlbGVjdA0KPj4gUEFUQV9QTEFURk9STSBkcml2ZXIiKSBpbnRyb2R1Y2VzIGNvbmZpZyBIQVZF
X1BBVEFfUExBVEZPUk0sIGFuZCBleHBlY3RzDQo+PiB0aGF0IGFsbCBhcmNoaXRlY3R1cmVzIHNp
bXBseSBzZWxlY3QgdGhpcyBjb25maWcgd2hlbiB0aGUgYXJjaGl0ZWN0dXJlDQo+PiBzdXBwb3J0
cyB1c2luZyB0aGUgUEFUQV9QTEFURk9STSBkcml2ZXIuDQo+Pg0KPj4gVGhpcyBpcyBwcm9wZXJs
eSBpbXBsZW1lbnRlZCBhbHJlYWR5IGZvciBhbGwgYXJjaGl0ZWN0dXJlcyBleGNlcHQgZm9yIHRo
ZQ0KPj4gcG93ZXJwYyBhcmNoaXRlY3R1cmUuIEltcGxlbWVudCB0aGlzIGZvciBwb3dlcnBjIG5v
dy4NCj4+DQo+PiBBZGp1c3QgdGhlIGNvbmZpZyBvZiB0aGUgcG93ZXJwYyBhcmNoaXRlY3R1cmUg
dG8gdXNlIHRoZSBjb25maWcNCj4+IEhBVkVfUEFUQV9QTEFURk9STSBhbmQgc2ltcGxpZnkgdGhl
IGNvbmZpZyBQQVRBX1BMQVRGT1JNIHRvIG5vdCBtZW50aW9uDQo+PiBhbnkgc3BlY2lmaWMgYXJj
aGl0ZWN0dXJlIGFueW1vcmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgQnVsd2FobiA8
bHVrYXMuYnVsd2FobkBnbWFpbC5jb20+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL0tjb25m
aWcgfCAxICsNCj4+ICAgZHJpdmVycy9hdGEvS2NvbmZpZyAgfCAyICstDQo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+IGluZGV4
IDM5ZDcxZDc3MDFiZC4uMjU3NWUyMWI2ZTZiIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBj
L0tjb25maWcNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+PiBAQCAtMjM3LDYgKzIz
Nyw3IEBAIGNvbmZpZyBQUEMNCj4+ICAgCXNlbGVjdCBIQVZFX01PRF9BUkNIX1NQRUNJRklDDQo+
PiAgIAlzZWxlY3QgSEFWRV9OTUkJCQkJaWYgUEVSRl9FVkVOVFMgfHwgKFBQQzY0ICYmIFBQQ19C
T09LM1MpDQo+PiAgIAlzZWxlY3QgSEFWRV9PUFRQUk9CRVMNCj4+ICsJc2VsZWN0IEhBVkVfUEFU
QV9QTEFURk9STQ0KPj4gICAJc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFMNCj4+ICAgCXNlbGVjdCBI
QVZFX1BFUkZfRVZFTlRTX05NSQkJaWYgUFBDNjQNCj4+ICAgCXNlbGVjdCBIQVZFX1BFUkZfUkVH
Uw0KPiANCj4gSSBkb24ndCBzZWUgYSBzaW5nbGUgcG93ZXJwYyBtYWNoaW5lIHRoYXQgY3JlYXRl
cyBhDQo+ICAgbmFtZT0icGF0YV9wbGF0Zm9ybSIgcGxhdGZvcm1fZGV2aWNlLiBJIHN1c3BlY3Qg
dGhpcyB3YXMNCj4gb25seSBuZWVkZWQgYndmb3JlIDIwMDcgY29tbWl0IDljZDU1YmU0ZDIyMyAo
IltQT1dFUlBDXSBwYXNlbWk6DQo+IE1vdmUgZWxlY3RyYS1pZGUgdG8gcGF0YV9vZl9wbGF0Zm9y
bSIpLCBzbyB0aGUgInx8IFBQQyINCj4gYml0IHNob3VsZCBqdXN0IGdldCByZW1vdmVkIHdpdGhv
dXQgYWRkaW5nIHRoZSBIQVZFX1BBVEFfUExBVEZPUk0NCj4gYml0Lg0KDQpCdXQgdGhhdCB3YXMg
YWRkZWQgaW4gMjAwOCBieSBjb21taXQgNjFmNzE2MjExN2Q0ICgibGliYXRhOiANCnBhdGFfb2Zf
cGxhdGZvcm06IE9GLVBsYXRmb3JtIFBBVEEgZGV2aWNlIGRyaXZlciIp
