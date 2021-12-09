Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9C46E682
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 11:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8qqL2Ddbz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 21:22:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8qpr5Y3Jz3069
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 21:22:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZETMEdvjhmBEQdW9YOt23wviCrsIom2AfHN66hi0a9oXiVECOyuEdSL27/U/ScTqfruMfZeTS2pJctfZ1j+poHmQN0GpXDdT0/BiWn/AjfQJ8xTZz+fBHxnJoqXOQ6KWcfl3OdT+YuxvTsHGU2Mx5rxnQTA4/1/xOUP4BUrZ6Dry0W2baf9hc+1nk/rmlkb62s6fxA2iOmpKQfuG4K2hByKgjHd47bScIrgMGnDsLBEkYpRRoKMWZV2ARFGTbKoHeoPK10UehbktMHdQ8Oja1mPIGz3SHS0fpWzn9Mb26mBdoRGiWK98zWqjpXfQGGT6byJgpFVPayW33OTRdz/ZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znwA/W8DUBEXZoBYJ8DZsPV5fMPrvJKmHU0ABSpTVJE=;
 b=V3IJB3bT3pJm3teb5rglYBA31Ddk8x7UPquJxrufSBelUYKlwulOOjcx4IgvCVtT0jEcs/rsUUz5wzxaCPgsESmrxrBnHu76ByDJ49QY0T8VBa0cv/LUKSwy6DA4F+Y6a5pdvrvbzlDjedaIZcXFyRphwnQZGQ7FK130EaVkflAV94Twa3o3eRGkXsPlB4auMHRAsaYLSB5tHckSuKez5p72WkmjdQWZKXFTrXP2w9EgVMmvX54mYJM0qFd0oNvoVCNVsltJZPIzPNhxDynNWeI519UbH5KIads51jYlYigjb+zXyVPnJsXocyr3A56G6JCMf/QuvtGu40jBeZ4X0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2303.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 10:22:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 10:22:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Topic: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX7FeaDIjAZ/GjkUuXVuFYrIE566wp8sIAgAAByIA=
Date: Thu, 9 Dec 2021 10:22:06 +0000
Message-ID: <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
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
x-ms-office365-filtering-correlation-id: 0e40f2e7-e9b2-4f32-040b-08d9bafdc048
x-ms-traffictypediagnostic: MR1P264MB2303:EE_
x-microsoft-antispam-prvs: <MR1P264MB2303D2A0E1AFFD79B89F2262ED709@MR1P264MB2303.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zvg6S2ZoGSf/bT4Rq5VjOTqtvtEoURxO3i63VOO58QJnJIKtF//VKF5NBPnlZVDsFaxh/manHRGUY/FrBjP17e6DPaDrGv3Bkd+X78RH96PxnB49gYJCy1/wN5ph53sYrUD7Rip5EkYxfektMmoCYUZNk2jIsrEqK+XqPUJEfDtJlO9s6aBAGwWsk6hKAMYjiK9z4ggYn5HuGQWiYJRsVxXXoibdzSpVOvebZR49ZijBiWTJfrI/b1EwfnY9ltB0KV/IVvwDmjfhJqa/J3Y8v5q6nkl4aCg8seQRLsOP2SpX58B8jSJPSJdxV6JiOg12mzBT6chfDln8exMjq5TF5HcAgwZeJ3uFOuatCaOsk4VFxZX5FhAt0wVDA50nxSDK+JkwlM6AhVwzwREgZstYOJuKVWNdwpYqt1/hWOVUzqqiyncWxyJGyyI6X8wHSl/XVya3hWPKeKnZkCU6OrDAqrcd+J5Ts0Mo/My7QewER0FXSI4pGBNgTEHFF11AutGd/E3/OzGSj3EoAfNTUyDF3l7Tb10O8H1n/nVE2xZM4PN8BuFt929BNfMcbTXCzDqPU+UbDMPkGSph+ZBcZ+OGgj+IwypR6epX2aRt8f287Xi8UUrjhmDDmpGO1bzB9bMwIhgm8A1PHB3EwNVkswb4L4aUAYQsF03PY8ntPpibCzmTCXj0+XtwjcKF51ya8kJEkzUChutcKUyr/i46aEMGT66lW7VnaicykaZDmpQgTxl0gG1ttoKpdGOYsXhCWYVVLAdW0JVbPy9ITovgtbE79jxrueO+OIpuakJrcSdxo8/tt1GZiHpQJiIo373d3U6Uhu4stMaaCpNtCZL+0zdqpV+zdIuo3GYT6IegaewEmoc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(8676002)(2616005)(44832011)(31686004)(6486002)(54906003)(38100700002)(26005)(86362001)(36756003)(316002)(508600001)(5660300002)(6506007)(6512007)(76116006)(186003)(91956017)(64756008)(2906002)(66556008)(83380400001)(966005)(66946007)(8936002)(66446008)(71200400001)(31696002)(66476007)(38070700005)(110136005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z05RUjN0M2RUYUxrK1VXZHlLTkwyVmYrNGlqSWdSMFAvZ1EwK1VKajJOd2ZJ?=
 =?utf-8?B?VnV6eWtqMWl3a3pwQ0tabmVERjVvanI1QjN2MUg5a3ZCbk9NSUIvcGtla3Za?=
 =?utf-8?B?emhlZGFyVlpqSDdPK3dZL1BQTnEyWUp3cXFSUHhCUGNDRUFlRUdBU2RCRFVY?=
 =?utf-8?B?VFlFZnZlUVRtRDdrWmNwRmZQaFdkODkrNmJQSWc2VncvWkoyVkdGWWpEYTNs?=
 =?utf-8?B?R0FHNjJpOXMyQzBQYlI2TmVnVWRqZHByOVBOTXJYbUJwZE91ZHZxeFpFaTdB?=
 =?utf-8?B?Y1pjNXlQSkZFZnQxcFA1NWxRdkQwNDBRbmx3dVorN2wrV1ZXM0N0U2o3KzB3?=
 =?utf-8?B?N2lETDg1TnJFSjRSdWMycmZkS2NRZCtVRmlmLzNOWVZsVVJuNnVXNkFXRlRh?=
 =?utf-8?B?UzV3M3BCTEZjSFJzNzZyenpCcEE5MlRKVFlpNEt1NmY4TENGVndyNW91Nkth?=
 =?utf-8?B?OHZ4ZW52dDBwNGRYNm80NnM1Y3lHckRJT2NpYit3TGVNd1g4a00yVXVYMDl4?=
 =?utf-8?B?OUtlSUlVTisxYmlBSVV0eUZjR1BaSE5KSzNVZ0xzUzVSQkFUTWF3bWthbmVj?=
 =?utf-8?B?NjNYbDQ4TnkrSTBqc3lnVmcwUUx5UEN6Ti9GQkpoRTVLTDRJc1RsZm5UaW90?=
 =?utf-8?B?UVJtR1BwM0pHbTRZTHloVmQvSGhPaGhON0NDcXZZNHN3NUJrZWRTclN5a290?=
 =?utf-8?B?eVdJMkdqR3JPaVBIUHU4TWhQckFlMU0weXBtNHJnWmhoTDZRT0dzcDg3NjZC?=
 =?utf-8?B?bHRRNHVSK3hCbC96b1ZHbVIvUEg4OTFwcjQzUW1qMFBzVnB6NnM4MDZsYSt3?=
 =?utf-8?B?NnM4RmRqb1pTWkJDKzFxTzRtU0VUa2w4UUxlUk1kSGJIcTlSWWVjQ3Fkdjhx?=
 =?utf-8?B?VVlrdkxnUmUwMW9DQnJ4QWxtdDdoeWkrRU1pMjJBdy9pR29Jcm1DbjJueWlJ?=
 =?utf-8?B?UXlJU29sdERqbFVEaEtXVlVuMkFla3BGbVM2clR1YUd5QVhHb3BCTXhSbG9U?=
 =?utf-8?B?a0lBMDFOUlBKeW52TW9MNHdCTXFCdWJrVGFheGtnZm8zMTdGWGJsYXVqYVp6?=
 =?utf-8?B?OE44QkE2K0ZSTEdHK2pVaUh4MjVwcitrMmNJc2UvK3g5Y0lsckxkYkoxbXBC?=
 =?utf-8?B?L1J0ZHA3Mm1xSitpSHNOQWg4dGJoYTczQkdNZm1hVUYvT0Q4ZVVmMU5DT3Vi?=
 =?utf-8?B?V08zSE4vU05CUGx3QTZ2MjNlTDlkUC9XWkFiMFhYblVLY2lhSDNtUjlhcVF0?=
 =?utf-8?B?SHBkazBySCs0SVVwWmZDWnpteTFneTFvMGRFMmJhR2UzdUV5VVhYOTdnckdi?=
 =?utf-8?B?OUJMM0JNWmhTbkJFSXBXWTBkcXhHQnR4bDc5YmNVb1l3VnR6OG03TUIrWVJH?=
 =?utf-8?B?WkJJR3JvZmJ3UXR2dHNGRjZoaHgyUnVlMkZGcTZKWEJwQkdzUnhEV3ZUTlBF?=
 =?utf-8?B?UUlBR2FkT2lQM2Vma0g0MmdGcUJGRzVLUGVUM2hWckptWkRVOEZjVDFUSFlr?=
 =?utf-8?B?WFlzS21LWHVUMVVoTmYwN0EycjdxeS9kUzl2UzdubktYbGdMVHNRQnRBYVg5?=
 =?utf-8?B?Wlh6V2c5a2I5WGxUZytOenF5ODFMcDNLM2k0YlZhR1phNW82ZWJSRk5pYXl6?=
 =?utf-8?B?OFdaSnVmK3B6R0wrM1dsWTIyYVF4NFhxU2FsVkJUL0tOeEV4WTZERk5ZUWMy?=
 =?utf-8?B?MGNuZVBOV05kZGJ3YjhobUpnNTVwSDZwd3NoWnFsdmVmTmlwVktEVmxVdjVu?=
 =?utf-8?B?ajduTm9HSld4eEdZdzZaZHJtQWNIS2g2UE96dW1JckdGWkR4MFdMb3hjaTV2?=
 =?utf-8?B?UDM2WU9sWVBGcDlKamdMcElKZUFpaHJMQWM5V2ZyeWhrQkx3bVpKelVmd3Qy?=
 =?utf-8?B?bXlBL2JnV09Ja2MrcHFlNGl4Q05Mck4rT3h5TVVTSFN4NFpyZElWNElvSHY5?=
 =?utf-8?B?cUpETXhCVE5YVis3QUlhOXBZMjZhOEVmTHhtRHB0VUFPaUtRWkxnUWlwRjRE?=
 =?utf-8?B?Zm0zK2JKWUlvYUZIREpMS1I0ck9LSUhQajBpa3RxZnRIV1RkUjRQczFxNW5X?=
 =?utf-8?B?cmw5ZUVHWGRZaUw2V2lOMnlyaHlBZk1qOENyYlRWVlcvNVNQL1dPREIzdkQ5?=
 =?utf-8?B?WVlzaTBBNytkZ2dTSmxsQXgxUStWOFBIYXNORkZmZDhZVDNlazg4WGZYVUYx?=
 =?utf-8?B?US9uVHRLdXd2NE9DcUorWW82NUFHUnBUR1dvZnI0RzYxUTlWWEN5M2hFanhP?=
 =?utf-8?Q?gxsxJHUk2ou6eqhn5yd7mF6r6OxH6Zb1zLnBZZUUMY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB7D193A2093E046B7534FF2CADD88FA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e40f2e7-e9b2-4f32-040b-08d9bafdc048
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 10:22:06.4246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVTJ4hKCIYEeJfTLVbJDyHRjLedw1XhTunNzPd35VRHmN7ypDK0wHdcdanvsGjId3on4rD9B9VfpbWNgblagCdBqHd1nqHbIeSiJWyrfJBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2303
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
dGNoIHdvdWxkIGJlIGNsb3NlciB0byBhIG5vLW9wLg0KPiANCg0KWW91IG1lYW4geW91IHdvdWxk
IGxpa2UgdG8gc2VlIHRoZSBmb2xsb3dpbmcgcGF0Y2ggYmVmb3JlIGRvaW5nIHRoZSANCmNvbnZl
cnQgPw0KDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2
L3BhdGNoLzdkYWJmMWNiZGU2N2EzNDZhMTg3ODgxZDRmMGJkMTczNDdlMDMzNGEuMTUzMzczMjU4
My5naXQuY2hyaXN0b3BoZS5sZXJveUBjLXMuZnIv
