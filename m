Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5C847748B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 15:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFDxf1kVrz2ynx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 01:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFDx93b6Tz2ywv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 01:28:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqTKfvFeTE5y+IetSfb8rBxpOYaQs8IAfr7vf/WvtN1gh0O0+QadsLo6+MzszLySW3LT7gSsZ8Xyjdn2KVP4v0CCm0Fz7hXItEA5wMBO7jTxWP+uSZxoqDGWk1/+LbNpa6/7PziAg0r8aTVqmqZoMsbFBZRFn9eJTgGkXWlJGP9znniR33l7GMys9DQrxvqfeGBcPIK5SR8fDMIGYo3F2he8pgkNo53l7bG528AfAzoyL/tuwvyIDMXkVhnMOv9JZ00Gb/oEpY/4KJCHMi4oMcmGpdjtwfuPU2Nc5C+UTeADb5Jnh8JYL4gz4V+J32h6b2MVsj7MD4j0bNAN5wyKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy4IyxVbVFlRfr4OLPqrAgudDqQ5vXKFJ6zuJOUsm1o=;
 b=gTMeysHhETprCjpR+0TQ+y8eEjXMWBbdqkOl239E1j7EWT8ZGhaiEjDNHed580A987hNTOQXqoO4FFNtq918sjrX9RedbgEbL1u0L3LH5PX10UQwGL458+CbvQWy1LL07ZP09OCIIAfCMI3CPpKrL1BCJd/UvA5bubPq9kn077yK8YXONW6O6p9pdTdxd3M23pJrhCX+bPahIRcJcaTpE/p0EkOCiZ0DCKtytghX0vCzJNr24NNfowI8qP4t8+QaN0TfbuQHro4gMqsgLSfv+7sierFwUaYOqkVvAcMF5oOzv8LfrVbRI8MhzWmxgpSlUGakc1hltUSw18+DS/Kytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB2180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 14:27:53 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 14:27:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Topic: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX7FeaDIjAZ/GjkUuXVuFYrIE566wp8sIAgAtGxgA=
Date: Thu, 16 Dec 2021 14:27:53 +0000
Message-ID: <442b2b4c-7d6b-65be-0f0a-e72f76369547@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
 <1639044621.jeow25j0pr.astroid@bobo.none>
In-Reply-To: <1639044621.jeow25j0pr.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb3cb0c7-8e60-4bc2-47b6-08d9c0a03f2f
x-ms-traffictypediagnostic: MR1P264MB2180:EE_
x-microsoft-antispam-prvs: <MR1P264MB2180D5FB07F00D6201E4DBE8ED779@MR1P264MB2180.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AbuS6mGyehgp/iEPMXcZdMK569LxKQlaDQ2cbb0OdHnFSaU3R/8yQp+epcfrqEG+xgu0vmBU/VrLug4aTe2gFnkkdIouc6vopZ/ILpn3pE2UX1lUjnb4u2SrVUSCc9NQ4t9IfB/1AaZ9a/2pLxCgPLVEpSOm+DBM4QOsRwxaMIZUcfbjPRRQr24GDH9nVg0RjMrlXcm0PS7tvPbWAuiwO1E+DKEl4oV8nCzmNK7skavDz6BxmvxkcDIWqzGu86swrHPjgz8Wg4dayLRCO0+GdeUJS5DiycclFkykZZGKHkW3dt+pbWhLWdYk694gOuNzb+/ov52ZiuFcSVQjSlLWkDHULZv328ZJyXlQvoo9NYoehFJ4RYlBTmP8/pWNBzy964/1yIAVpVZoZqFu38LRk71nekFfJkpAdqcTRg0kRJyaWMGI6+8t7ZPYlzDBVBP5EG6a00NMb+Ads/Kve6JpruYygbV5FCnyjgVr2v5ob7uihzFsZpD24va9p9WnPcG3cRN8g589rnMxUwdkhr3krQ0PHN3IK14m/x10VYMcwvSYMnUF7hjS6bMpcGR/x3Xq2aloxkZshTWLbzrYutxadD0FRgqBm34EFKNJPhYQK+UClPdrzhO4vLp6xFu5AaU2uDR9FcuPpZNvEfxGnHt+DroNxQ3Hh1tjhiVhQ2h+VNjP4dQEaUEAXLElvxs1z/lTNPv58ZWNexldATx2gsIWgb0VNwnUrpqv+jbIkmXVBJkfhqLukR05PQWFehIKkopB5IzP1xUgwr8D+WEZ/jgwMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6512007)(44832011)(54906003)(110136005)(8676002)(122000001)(86362001)(5660300002)(6506007)(316002)(8936002)(508600001)(36756003)(31696002)(38100700002)(2906002)(4326008)(66446008)(186003)(66946007)(64756008)(71200400001)(26005)(2616005)(6486002)(66476007)(76116006)(66556008)(38070700005)(31686004)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUErS2VDODJBazZ4SDZLa0RxT0VSNkRuMCtlMENOQVVFOFpiZHFLSFFRbUhD?=
 =?utf-8?B?Q1lQaUtYVURWdzIxY1dLdlBxVElWakZaYkxZNld0RjV4WkZkSEpwREFUc3pH?=
 =?utf-8?B?K0tLaVlnM2J4YjNYMk4vZGNSc2tkUUxweDNDdHRrZk5MYXdtdFlMWVVTZWhp?=
 =?utf-8?B?MHlTNlFZU1ZFMTBzc2d0OStlL3NLMmQ4Nk9NL2QyaU5HM3FWRzBYQ1NnNk9F?=
 =?utf-8?B?SC9mWlpzclpjNmxGWk9rOS93Mk9hZmNBMStaZktpdEN5QlVSTkZvdnJBZ2E2?=
 =?utf-8?B?bFVtVTl0Wkp5NGp4RGR1aDdJb2Q0di9QczBJLyt2N0luWGZBQnhMeWJqeFcy?=
 =?utf-8?B?Wm9WRDIxWnlRYTY0YWpjOHI1M25GdVZ2aXA5dU9qemI4bnpSRDNseXlzSUpK?=
 =?utf-8?B?RDIwc3pvU0UzblZJWG1jOUQ4MU1JUVFzenZGQnlzYW5ZZVpHUGU4STl5WlFp?=
 =?utf-8?B?aXpla3FzTnZPcS93aVNHL3dFRGJ4UVovVnNaRk5lWlNEOW1zT2w3emJ3QmRM?=
 =?utf-8?B?OHMyN2dDbGJScytTeE1CUDdrZllacFMzY3A3enJtTTBkVlZSQ3hPaHptWCs3?=
 =?utf-8?B?SWVkak85ZHA1UkFlNHVKV1ZQV2dJbjdnYkw2R2NycytrRHpjUlY0YXBBNks0?=
 =?utf-8?B?WkRnQ3Y2Sko0NHM2ZDd2WW1IbEw0OTRJVzc0RTljZEJnUWhRYnhNMC8vMzBs?=
 =?utf-8?B?b0hITFpneDlOTVI2R3JmcEZKM1RmMW5meFFoNEd1RjVSRmI3ZEJkZ01ZWnZE?=
 =?utf-8?B?RnZPWmYxSnRHaDJEYmc4bVRQeGp3QXNNdFFIL1hyMzZPSlBuTkFwdDFtdUgv?=
 =?utf-8?B?OExGREwxcVE2TWNHbGN0SExFL0VPdytLU3U4b1ZvdkNJWC9WcjFPbXV4bVpQ?=
 =?utf-8?B?cUw2VG9SNWJBajlyVGYwYkw4Qy9iekxBRkY2cnZQRFM4ODZTcmFmUkJMYnF0?=
 =?utf-8?B?djdMS3pvNXJYTHp6NzlLUmFWcHFXb3l2M21ZdnIyRnIxeEtKVG9mZzBicWtM?=
 =?utf-8?B?NzBIZTFwaEJqUkNIUHZuaURmYTFma1NaSzVPcHozMWVuSFB4RTJhTENtN2RE?=
 =?utf-8?B?TFRDZmcwUU9mWlBYdkN4cW9DQU9VMWtrMTliZkszYzdUQTJnZHovTVc5cHJq?=
 =?utf-8?B?cmtJMzhtOEtzL1hwOGZLUUNUcUgxYTBhRHNrMHBITDFpNTBncEIzWmR3Unk0?=
 =?utf-8?B?eGxzRnYycjJ0VkFhUTVEbm5rLzQzVDJDN3BZajcvVFU1VWEvcHI1RndwVERO?=
 =?utf-8?B?ME1tanRKcis0N1BoeW5paUZYazNCUG9zRkFzNm9XL3VwVVo0TE9ySzE1TzZs?=
 =?utf-8?B?d1BuMlN0NndGZzkvSEVNb3l3V1U3Z0IxT1h2SmNUNU1aQWZHMDg0dUovemt1?=
 =?utf-8?B?Z0hZZ0YzYm5GR09HWUl1bTNtVGQwcjFHeUFLOHduZ0d1Qk8yamdFUldIR0dP?=
 =?utf-8?B?ZUJlaDVhSnFLQVlBalB3eEl0djJDU3ZFMWhzcWIwOFV1dG42L2t5QjZPSEpT?=
 =?utf-8?B?OHNVTFVSYXJndkVxV1VUQzgzUDBOU3VZeWN0ZWJXT3JrTUxMSTJkTkY0cXpx?=
 =?utf-8?B?SDFsZkV4VEJKNyt0VHppZ2crUUl1bzNHYXExNzkxZGVKNFdoNFpMREJod0h2?=
 =?utf-8?B?d0dodWpESzlFK05EQ25za3hDV2dablhmczJTMVdLTXU3c3o1cG95a3FUcEtM?=
 =?utf-8?B?TUtSMWlzMnl4WTREbmhIMk9uRnBLdSthMXVEaThKeCthbnpiU21LMXpmQ1Vs?=
 =?utf-8?B?cUxjMUl6Qzh6elhaR3hlV1pITW1US25sSzRaTnAxZVh5bWlMK3ZNQ1EzcXVH?=
 =?utf-8?B?Z2l2bmx4eE42WGx4bkk1aU9RUlJ3QlFFVjMwdWk5MXYyT0JBQUd4QmwyM0ZJ?=
 =?utf-8?B?b2xXN2YzeE8vaVlKVllDK1E4RWwvcEpsNm1ONXRvQm5veXlXMm5SUGRtMCtH?=
 =?utf-8?B?cktQL2VXR29rU1R4R2ZuUkhpbmpCUk9uNWZPOVdvZHJJR2hxNmx3RHZ5SlVj?=
 =?utf-8?B?bit0RTFIT2Eweks2RDBDR2VkcEZnVmhXbWtRbGxqZ3lPa1F4N3kvckhEME9s?=
 =?utf-8?B?QkxPZ0c2L3FqVE9KVnBsWVNrcktFY1FqcEExU3pDZlhRNkZXd2xUeU1JL1Js?=
 =?utf-8?B?TkUxVUxsRDY4S2pYSTE1bXlCaXBUM2N6K1NJODB6U1RhSmg5L0xwMWJZVVdO?=
 =?utf-8?B?eG9KUmhmYTR4dzRGL1QzbDdTb0pBU2xyZktyMk85SHdqZml1N0kvSDgxYjlY?=
 =?utf-8?Q?B+BPnT2hZqPOZT3xRAlaqIvgPaV3yV0spO0OYX33cA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E67C6BD4CFA3D741A50B556BA9ED204D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3cb0c7-8e60-4bc2-47b6-08d9c0a03f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:27:53.5993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Taq03tieImT1vdAAPBD54QoWwI9p2DzdBeG8vV1lNp+E6R1Bqrobhy51X8X9Ngoi4FkRK91mGya2DWn1QOgl8o0ft1RXu9AbL9/SrsOVLI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2180
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMTE6MTUsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDks
IDIwMjEgMzoxOCBhbToNCj4+IFNlbGVjdCBDT05GSUdfQVJDSF9XQU5UX0RFRkFVTFRfVE9QRE9X
Tl9NTUFQX0xBWU9VVCBhbmQNCj4+IHJlbW92ZSBhcmNoL3Bvd2VycGMvbW0vbW1hcC5jDQo+Pg0K
Pj4gVGhpcyBjaGFuZ2UgcHJvdmlkZXMgc3RhbmRhcmQgcmFuZG9taXNhdGlvbiBvZiBtbWFwcy4N
Cj4+DQo+PiBTZWUgY29tbWl0IDhiOGFkZGY4OTFkZSAoIng4Ni9tbS8zMjogRW5hYmxlIGZ1bGwg
cmFuZG9taXphdGlvbiBvbiBpMzg2DQo+PiBhbmQgWDg2XzMyIikgZm9yIGFsbCB0aGUgYmVuZWZp
dHMgb2YgbW1hcCByYW5kb21pc2F0aW9uLg0KPiANCj4gVGhlIGp1c3RpZmljYXRpb24gc2VlbXMg
cHJldHR5IHJlYXNvbmFibGUuDQo+IA0KPj4NCj4+IENvbXBhcmlzb24gYmV0d2VlbiBwb3dlcnBj
IGltcGxlbWVudGF0aW9uIGFuZCB0aGUgZ2VuZXJpYyBvbmU6DQo+PiAtIG1tYXBfaXNfbGVnYWN5
KCkgaXMgaWRlbnRpY2FsLg0KPj4gLSBhcmNoX21tYXBfcm5kKCkgZG9lcyBleGFjdGx5IHRoZSBz
YW1lIGFsbHRob3VnaCBpdCdzIHdyaXR0ZW4NCj4+IHNsaWdodGx5IGRpZmZlcmVudGx5Lg0KPj4g
LSBNSU5fR0FQIGFuZCBNQVhfR0FQIGFyZSBpZGVudGljYWwuDQo+PiAtIG1tYXBfYmFzZSgpIGRv
ZXMgdGhlIHNhbWUgYnV0IHVzZXMgU1RBQ0tfUk5EX01BU0sgd2hpY2ggcHJvdmlkZXMNCj4+IHRo
ZSBzYW1lIHZhbHVlcyBhcyBzdGFja19tYXhyYW5kb21fc2l6ZSgpLg0KPj4gLSBhcmNoX3BpY2tf
bW1hcF9sYXlvdXQoKSBpcyBhbG1vc3QgaWRlbnRpY2FsLiBUaGUgb25seSBkaWZmZXJlbmNlDQo+
PiBpcyB0aGF0IGl0IGFsc28gYWRkcyB0aGUgcmFuZG9tIGZhY3RvciB0byBtbS0+bW1hcF9iYXNl
IGluIGxlZ2FjeSBtb2RlLg0KPj4NCj4+IFRoYXQgbGFzdCBwb2ludCBpcyB3aGF0IHByb3ZpZGVz
IHRoZSBzdGFuZGFyZCByYW5kb21pc2F0aW9uIG9mIG1tYXBzLg0KPiANCj4gVGhhbmtzIGZvciBk
ZXNjcmliaW5nIGl0LiBDb3VsZCB5b3UgYWRkIHJhbmRvbV9mYWN0b3IgdG8gbW1hcF9iYXNlIGZv
cg0KPiB0aGUgbGVnYWN5IHBhdGggZm9yIHBvd2VycGMgYXMgYSAyLWxpbmUgY2hhbmdlIHRoYXQg
YWRkcyB0aGUgbGVnYWN5DQo+IHJhbmRvbWlzYXRpb24uIEFuZCB0aGVuIHRoaXMgYmlnZ2VyIHBh
dGNoIHdvdWxkIGJlIGNsb3NlciB0byBhIG5vLW9wLg0KPiANCg0KT2ssIGluIHY1IEkgYWRkZWQg
dGhhdCBjaGFuZ2UgaW4gcGF0Y2ggMTAgdGhlbiBzd2l0Y2hlZCB0aGlzIHBhdGNoIHdpdGggDQp0
aGF0IHBhdGNoLg0KDQpDaHJpc3RvcGhl
