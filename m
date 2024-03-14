Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F687B9E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:58:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Cxkc3+5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLr80MXKz3vXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:58:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Cxkc3+5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLqR2lY0z2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:57:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RorGdPK4DV0iI0sBarJdrMkQdBhDHmdXEml/s+xz4vnzyKv+DhCo1zrqlDXDTZJGdX9zZ71f0N6H3ACDhTXlewguxE/E0mm+sWRM+hJTTX8qeVTW9iNcBF1mvAMEmLTZqIs3z0QgXNcfL02j+0FqtKbYw4Hn7pi9DVJFy7EWGdb1i8+CvEsLESuR97o7vZxz9zXVCv1VAzH4QqpD7ODM0Iibg84UiInVImfi+Dnt/rSgWUjsiC3vxmnivbIo/2v1U1jCX3LqP9sL1cAmzHvq2LsFIfiisrMlJ9QM10271xx8dgVpVd2aIzTGwSO4uZc+6/rW0ydGAmkZnzyD2/ewQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO/s6eGQFup1/+wzYkEaflmKlTEg+Ix8dxFBsBFYnFA=;
 b=jvTzlM14hBBWtY3RskfNs4DDptbwXEPrWS2DRA0/53T+jU1LBtDDKb7fZndBYUn5NzdF6vsH0lFZpoYMBneSD56X2JxYwxxPDa5Jbu7extGborK79fXABwo2FsnsV8o06izejCkEuPVDADv2mvaYVvqcTZWnRXSMXK/RfkNOidikQnyv8J4yGfNJY2uIWVG2pjuhqRxgbxoBx4QF3djl+dQQJvEOaO7k80YqR9wm89ZDwPE1ZHzHIUapAvfQcPu+po+fg0hwvJCKR6xdfrW3JqYq8mRIwOcOQEDysYmVNTYyDuSH1yjVGIRxFU9WXSPEdJ4ua5+CXReIiCa3bsln+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO/s6eGQFup1/+wzYkEaflmKlTEg+Ix8dxFBsBFYnFA=;
 b=Cxkc3+5K89oAsc1jRL2fKNnZ1TilN/Cwkg6NEE+GbrWJcHpIoLhO+MwLcU85UUmElVHeGCGfhSP6Z8zpqvGNdbvGnh8VpQxrRFJfdRp5flbgu7hVnQJc5o5uPy1u3rol/N8Fk0WB8thSPuDrqMNmZaofVZJuQzI2Dk9VeHIYbY5Z0/PPGIep7KvKrHp2tycApdL0dpt4T0Av/97aCLofQB43t+Z08VFfo2+0pTfBPS/Q99AL/ZUGvllO3s9sXLlLceSJifFXm8RVdsyQQXHP+CiW5fVjvvtwRH0PS00uY/2qNE61f2d5dpkq9jeD5O5EHj7ZvIDeB5TFEibZu8DPLw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2258.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 08:56:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 08:56:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 12/13] mm/treewide: Remove pXd_huge()
Thread-Topic: [PATCH 12/13] mm/treewide: Remove pXd_huge()
Thread-Index: AQHadZAU4oc3uWLufUu+/baOWSAmO7E28AWA
Date: Thu, 14 Mar 2024 08:56:59 +0000
Message-ID: <7e93ab99-c956-42d0-9afd-3c856f3ad951@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-13-peterx@redhat.com>
In-Reply-To: <20240313214719.253873-13-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2258:EE_
x-ms-office365-filtering-correlation-id: d7fe2076-97ec-4ad5-1e86-08dc4404b59a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9rN9rNaueMTrgqsZo36T0AJYR6/zp9RE22CZmQI6otcrWlL/uuQbQjtTeZ8aHnOi/LBT3umhAcA86DyUuEqPcLJPv2+TdrbD7A91+CFuFbtj+U/+qB+5MEpEOzFVfHXrtdp61BmxdSQ0hNtvHBNnudTubTueklTjGnud6tpvlTMkmjcnoXy+9B+044cn4l7+XxYRFI8/pgb/fXws3clfEMmHSxXNJKxGHH5ZT4AhcY9Ohd43GTMlVg2jNTPk+97nn5eq9no6lPpShHT+hAs9iRVhy0wIad1BWIQWCAnqA5n7GLJtN9/LzWynJ4QctYRia9H1+KLRz59mIK0gghvrYK3Rd+Fv9zDcdnoUa35syZVxazsG7Jalcqs1cnv4K4O0r4KaB4uLONl+2fxFrWH6CKHC4LxwtmHNLJPLD/+85EHSn1znOM5Lj89PxuYWEUn7sqy6BhkdpQvg/1DAht6qnYR7dPerz4BqNsWSXjXl7ViUe8/30MHAxYNQyazOiqz+qhcyjhtVfGn/NsfXP+dozbW2F1y0etUR3e0UBVBT0L7WeG6aMLMiwH/M5Ezf4uDIDUM7cvCfWBiWkfmxI2QQoABAT/53hr5D5g+ORE/LeJ5iTHDYF9QYg1VoQSuYRDSMMvCxy682pHPPvmBhq7y0Ii0DT9/jvD0YWdONLrMCgphof2GNg5q7YtD1ZQMR0Sgz440VtUnnHf4pACaya3S7Rw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NzNkTVFQSXVSMXNIMWw3N1VQbG91Q3VVSWhseXh0YkhKcEZjRWlpWDV1d0wr?=
 =?utf-8?B?TzVpakpSRkw4OStUOS95NE5XS1ZQODVzdkpoT2dIVlFEa0VSQWFjVVRJY2VX?=
 =?utf-8?B?ZHVHYkQvUW4vbFZPeFpCKzBia3MvU052ZVhuaUFiL3dsOThobmRrNVJ6RXVt?=
 =?utf-8?B?K2lhWlhMZlowMUdUNE9mYkpyNEE5TmxRVnYza3FUY2txeE00UHlnNy8weUJP?=
 =?utf-8?B?NW9NYUVUa1VBdnh5VXZHbW1tMFNEN3JjbVRUQmJtWnM0STQwaFRzekxpZ2lP?=
 =?utf-8?B?TXhhQmxvak9TK1JaOTRtK0M2R2kzRHJSMWxiNlgxVVZSM3EzcDFjOW5jb01H?=
 =?utf-8?B?aE1sZzhEaEFYUzkrZTJGYi9ua1Erb3BLQllVdC9zSXZSM3Zzb1prRllqM09B?=
 =?utf-8?B?YTI4NkxxVHYwWlVJYm52cDk4eDVyT25VMU1QRUNIUHJRMDRvY1gzMmN4S2J4?=
 =?utf-8?B?S1RaU3plcHNlNkVMK2trWWcxTmhLaU5EdFh6RjcxNmFyS3R6RDIzYUM0cTZ2?=
 =?utf-8?B?bkgvSzV1dXhBRVAvaTlZTjE0RS9kSlM4M2xhTjFmL2lkb2Y2UjNkU3FxQ1Vn?=
 =?utf-8?B?TEJ6eWtCRWV1QjVpRTdEYmM0UDNQNEVMRUo4Y1JqNnlvNE13L3oyUzViZGp0?=
 =?utf-8?B?L3ZmbDNkMEp0a1p3Y0Y4NTFrVTVBOWRuN2ZCems3TWZMR1pSVGNzQVI5aTlS?=
 =?utf-8?B?OU1rQzNtaG56elFvaTB5WXJqdzl1QUFwdE8vVU9PVEVTU0JLcWdjWE45K2hp?=
 =?utf-8?B?MlREcGVpRVo5cFJIQWtIaFgxL21PelhpeEYzRmI0T2R5a1VUOXlHcVZhSysw?=
 =?utf-8?B?T2cyVCsxb1pPLzhvRVJERURLZGxCcnlOdXRmVmhZTHYxa0NvZitNbnhLOC9M?=
 =?utf-8?B?Z0dWRW5LckFvd3RYVWNrZnVFOGdRbDdzcXFHcjhmNkZQWVBlbERxeFZ0TW1N?=
 =?utf-8?B?cjg2WElpMXEyQlhJUWdUNW5xZVVjTkRMZE0wdkU4TGNQV1VwYjcvblBZU3Rm?=
 =?utf-8?B?aGlFK0lORW4ydEFKazQ1S0lUa3ZoYmN4Q1pxZ2N6d3JCT1RVSm5qdG5Ha2tk?=
 =?utf-8?B?Y2FpaSs5VG84dzhEUlE4WklyeE5IY0g5VDVzNDdGeDR4MWtkb21uTFFyQ3ZB?=
 =?utf-8?B?cTZjWllLazkzSHZ6WnF2cG44blFNWTFIdytlYks4YlY2VW80L3ZUSERTNGww?=
 =?utf-8?B?TDhnekQ0UjRnSTlFMkxGY1puSGZLdk04QXdaYVpON2N5bmoySjZMUXJLamVj?=
 =?utf-8?B?UnlYb1FnenVxM2FGZlhnZVMxUE5PMFdZQWFpYW5ZeFhDc3ZwVHJSYXlESGNa?=
 =?utf-8?B?Ymk0cW02dUdaNlVtSXluZTc5T0dlYUU0Z0ZNajgrbmVwdzN3V2RQSUJxaTkr?=
 =?utf-8?B?c0Zkd2tHWHVpc0p5RlB4Ykowb09UZUdTODEzL2Njd21kalB4YWdMZS9Jamkx?=
 =?utf-8?B?UzFIdGlLT2ZlOU5FMEU4akFKenpuNis3U2NobVJaa3kvMThHRmI1UEdjcC8x?=
 =?utf-8?B?MjlXZkwxMXh3bng0UFJ2NEpySHpIS043bEJ1SkU3S2ttamdJMlJPWmtDWHJ1?=
 =?utf-8?B?bVlXYU9MRGYwWDhpZGF1cUM3VktLZHVzdVpKcktSK3BrS29pWnQ0bEFPbldP?=
 =?utf-8?B?SmdsWGI1Z0hEaHNmRVRQNUxiMEpSV1k4NmdUWTNLWmhLTHZRYy9qMVBHakFT?=
 =?utf-8?B?R2tsVmRldldTOXJXOEVhOEJlUU1YM2ovUGYySDFzZ09Zc1hDeXJzS3JLMkg5?=
 =?utf-8?B?bkpVMmdVTXBRVUhtVEtVa2Fxa1pGYzFYelUwKzUyNGhMMDA2N2xaelRZUXZG?=
 =?utf-8?B?SkErOUFjb2JweFdYOVljRjFFSkVTWXhIdm10aVRmMG14MkFjWWx1VUdqdW01?=
 =?utf-8?B?SmZJbEFNQXNDWVpoL1JUTTJwM0R5aGVCVnRDYk5jZXVLaXNRNjhzdDh5Y1FN?=
 =?utf-8?B?S25UTnNHNDdGelhLZ3JOQVBldlJFbUxaVVBlVjBqNllEaEpPclcrdFBMZEty?=
 =?utf-8?B?OEMwQXpOQkpUZ3VEd25QSmtDNFVUYkhmZ1NxQmpSS1dBODd3SlNxYnk4L3V1?=
 =?utf-8?B?enBCV0RxeGZzeGtEaUpEczVlamJkNTlXUzVQdUlkZDVBbEZSYXR1NzZsT0pv?=
 =?utf-8?B?K0xmRjJiVU5QMHRITWxiejljQ0Q4ZU1HTjh4QWhnYm9RWEN1aHBJRWhhRFB5?=
 =?utf-8?B?OUZhTG5zVXhGZ3VzcE9nV3ZKZHFzekdWRFR4Z1VuZU4rMUxaMVdQREdONGV4?=
 =?utf-8?B?Q2x0RVgrT2U3K2dsN1BtQlQ1KzFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC383C06347D9A46A6BF1C2DBF5BA0D1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fe2076-97ec-4ad5-1e86-08dc4404b59a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 08:56:59.6942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3jBnN4Qv08upahVWZcS+9OXlmqAJzPrqTfx/HDfzYj7mNA5+2ueqedQvfBL+crEmzjfOpI9Ht+X0598VWANYyK4TvCl+aKZKpTBQbroI8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2258
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAzLzIwMjQgw6AgMjI6NDcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IFRoaXMgQVBJIGlz
IG5vdCB1c2VkIGFueW1vcmUsIGRyb3AgaXQgZm9yIHRoZSB3aG9sZSB0cmVlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBhcmNo
L2FybS9tbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgYXJj
aC9hcm0vbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAgICAgICAgIHwgMjkgLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgIGFyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAg
ICAgICB8IDEwIC0tLS0tLS0NCj4gICBhcmNoL2xvb25nYXJjaC9tbS9odWdldGxicGFnZS5jICAg
ICAgICAgICAgICAgfCAxMCAtLS0tLS0tDQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFi
bGUtMzIuaCAgICAgICAgICAgIHwgIDIgKy0NCj4gICBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0
YWJsZS02NC5oICAgICAgICAgICAgfCAgMiArLQ0KPiAgIGFyY2gvbWlwcy9tbS9odWdldGxicGFn
ZS5jICAgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0NCj4gICBhcmNoL3BhcmlzYy9tbS9o
dWdldGxicGFnZS5jICAgICAgICAgICAgICAgICAgfCAxMSAtLS0tLS0tDQo+ICAgLi4uL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLTRrLmggICAgICAgIHwgMTAgLS0tLS0tLQ0KPiAgIC4u
Li9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS02NGsuaCAgICAgICB8IDI1IC0tLS0tLS0t
LS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaCAg
ICAgfCAxMCAtLS0tLS0tDQo+ICAgYXJjaC9yaXNjdi9tbS9odWdldGxicGFnZS5jICAgICAgICAg
ICAgICAgICAgIHwgMTAgLS0tLS0tLQ0KPiAgIGFyY2gvczM5MC9tbS9odWdldGxicGFnZS5jICAg
ICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0NCj4gICBhcmNoL3NoL21tL2h1Z2V0bGJwYWdl
LmMgICAgICAgICAgICAgICAgICAgICAgfCAxMCAtLS0tLS0tDQo+ICAgYXJjaC9zcGFyYy9tbS9o
dWdldGxicGFnZS5jICAgICAgICAgICAgICAgICAgIHwgMTAgLS0tLS0tLQ0KPiAgIGFyY2gveDg2
L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgICAgICB8IDE2IC0tLS0tLS0tLS0NCj4g
ICBpbmNsdWRlL2xpbnV4L2h1Z2V0bGIuaCAgICAgICAgICAgICAgICAgICAgICAgfCAyNCAtLS0t
LS0tLS0tLS0tLS0NCj4gICAxNyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE5OCBk
ZWxldGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbW0vaHVnZXRsYnBh
Z2UuYw0KPiANCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUt
MzIuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLTMyLmgNCj4gaW5kZXggMGUxOTY2
NTBmNGY0Li45MmI3NTkxYWFjMmEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLTMyLmgNCj4gKysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtMzIu
aA0KPiBAQCAtMTI5LDcgKzEyOSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHBtZF9ub25lKHBtZF90
IHBtZCkNCj4gICBzdGF0aWMgaW5saW5lIGludCBwbWRfYmFkKHBtZF90IHBtZCkNCj4gICB7DQo+
ICAgI2lmZGVmIENPTkZJR19NSVBTX0hVR0VfVExCX1NVUFBPUlQNCj4gLQkvKiBwbWRfaHVnZShw
bWQpIGJ1dCBpbmxpbmUgKi8NCj4gKwkvKiBwbWRfbGVhZihwbWQpIGJ1dCBpbmxpbmUgKi8NCg0K
U2hvdWxkbid0IHRoaXMgY29tbWVudCBoYXZlIGJlZW4gY2hhbmdlZCBpbiBwYXRjaCAxMSA/DQoN
Cj4gICAJaWYgKHVubGlrZWx5KHBtZF92YWwocG1kKSAmIF9QQUdFX0hVR0UpKQ0KDQpVbmxpa2Ug
cG1kX2h1Z2UoKSB3aGljaCBpcyBhbiBvdXRsaW5lIGZ1bmN0aW9uLCBwbWRfbGVhZigpIGlzIGEg
bWFjcm8gc28gDQppdCBjb3VsZCBiZSB1c2VkIGhlcmUgaW5zdGVhZCBvZiBvcGVuIGNvcGluZy4N
Cg0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMv
aW5jbHVkZS9hc20vcGd0YWJsZS02NC5oIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUt
NjQuaA0KPiBpbmRleCAyMGNhNDhjMWI2MDYuLjdjMjg1MTBiMzc2OCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaA0KPiArKysgYi9hcmNoL21pcHMvaW5j
bHVkZS9hc20vcGd0YWJsZS02NC5oDQo+IEBAIC0yNDUsNyArMjQ1LDcgQEAgc3RhdGljIGlubGlu
ZSBpbnQgcG1kX25vbmUocG1kX3QgcG1kKQ0KPiAgIHN0YXRpYyBpbmxpbmUgaW50IHBtZF9iYWQo
cG1kX3QgcG1kKQ0KPiAgIHsNCj4gICAjaWZkZWYgQ09ORklHX01JUFNfSFVHRV9UTEJfU1VQUE9S
VA0KPiAtCS8qIHBtZF9odWdlKHBtZCkgYnV0IGlubGluZSAqLw0KPiArCS8qIHBtZF9sZWFmKHBt
ZCkgYnV0IGlubGluZSAqLw0KDQpTYW1lDQoNCj4gICAJaWYgKHVubGlrZWx5KHBtZF92YWwocG1k
KSAmIF9QQUdFX0hVR0UpKQ0KDQpTYW1lDQoNCj4gICAJCXJldHVybiAwOw0KPiAgICNlbmRpZg0K
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFi
bGUtNjRrLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUtNjRr
LmgNCj4gaW5kZXggMmZjZTM0OThiMDAwLi41NzlhNzE1Mzg1N2YgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS02NGsuaA0KPiArKysgYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUtNjRrLmgNCj4gQEAgLTQs
MzEgKzQsNiBAQA0KPiAgIA0KPiAgICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICAgI2lmZGVmIENP
TkZJR19IVUdFVExCX1BBR0UNCj4gLS8qDQo+IC0gKiBXZSBoYXZlIFBHRF9JTkRFWF9TSVogPSAx
MiBhbmQgUFRFX0lOREVYX1NJWkUgPSA4LCBzbyB0aGF0IHdlIGNhbiBoYXZlDQo+IC0gKiAxNkdC
IGh1Z2VwYWdlIHB0ZSBpbiBQR0QgYW5kIDE2TUIgaHVnZXBhZ2UgcHRlIGF0IFBNRDsNCj4gLSAq
DQo+IC0gKiBEZWZpbmVkIGluIHN1Y2ggYSB3YXkgdGhhdCB3ZSBjYW4gb3B0aW1pemUgYXdheSBj
b2RlIGJsb2NrIGF0IGJ1aWxkIHRpbWUNCj4gLSAqIGlmIENPTkZJR19IVUdFVExCX1BBR0U9bi4N
Cj4gLSAqDQo+IC0gKiByZXR1cm5zIHRydWUgZm9yIHBtZCBtaWdyYXRpb24gZW50cmllcywgVEhQ
LCBkZXZtYXAsIGh1Z2V0bGINCj4gLSAqIEJ1dCBjb21waWxlIHRpbWUgZGVwZW5kZW50IG9uIENP
TkZJR19IVUdFVExCX1BBR0UNCj4gLSAqLw0KDQpTaG91bGQgd2Uga2VlcCB0aGlzIGNvbW1lbnQg
c29tZXdoZXJlIGZvciBkb2N1bWVudGF0aW9uID8NCg0KPiAtc3RhdGljIGlubGluZSBpbnQgcG1k
X2h1Z2UocG1kX3QgcG1kKQ0KPiAtew0KPiAtCS8qDQo+IC0JICogbGVhZiBwdGUgZm9yIGh1Z2Ug
cGFnZQ0KPiAtCSAqLw0KPiAtCXJldHVybiAhIShwbWRfcmF3KHBtZCkgJiBjcHVfdG9fYmU2NChf
UEFHRV9QVEUpKTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGlubGluZSBpbnQgcHVkX2h1Z2UocHVk
X3QgcHVkKQ0KPiAtew0KPiAtCS8qDQo+IC0JICogbGVhZiBwdGUgZm9yIGh1Z2UgcGFnZQ0KPiAt
CSAqLw0KPiAtCXJldHVybiAhIShwdWRfcmF3KHB1ZCkgJiBjcHVfdG9fYmU2NChfUEFHRV9QVEUp
KTsNCj4gLX0NCj4gICANCj4gICAvKg0KPiAgICAqIFdpdGggNjRrIHBhZ2Ugc2l6ZSwgd2UgaGF2
ZSBodWdlcGFnZSBwdGVzIGluIHRoZSBwZ2QgYW5kIHBtZCBlbnRyaWVzLiBXZSBkb24ndA0K
