Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B45330F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L73SB1Pczz3c93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 05:00:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::628;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L73Rg4lYKz3bdY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 05:00:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMengaZFVda0p1Uxn/9yxNH1Z3JlJV5UsHYB/yrj/zzaLEkRFCSxSUlPfZDyEyALuYUqjnL+U3jfSjuQ3x72zTk1yoXUuDm7Y5TyujTKX3U2arw8y0Hk7F2P5+E7V8rrvZFODCC9nZGzkrCfjG4rhRBA1399tqPUaY+OQo3lGuLvhjTOBkzgAwxiTrFTXOJPPA2/dA+bR1ddrInhYVydZpzUlOyvPHuzcNpjPNpshVYs+XhTxBjk/oduJ/VbqX+UpFRcMZIlmdf3WXsJwc6P4Zjl96pwcvBRKlT2Emzvc7VPwGVkS6cF7MIsckpXtHN3oVVR9m4lt5y8bdwAXnL9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uxpwC0hKaMX7r1D0khsBknFP+yYSk50cryadXv++TY=;
 b=HIy/udJqXBmyCtg6XB53Iz+lICCU6IwSgDtvJ7ivoB8BdFThESyKDATNPOGIEibB1FII1Jnk5w5SgDvZIuDsaU92JJmYuKB8S1M1OlBclsEHxUhTaMGhBiHEg2Tl8xYtWuqVla3f+b1UUeCACRqNmcG1Sk2Nfma3PZzcmMf+GLnIYFuCJTmQLvLqZqW3ECEyjaMKHDwf32z5OBtQj1DP+7nLHpf4QQxiN7SdnHGOHUweY9N9vU9LVxCYRLNrsVIyfUtHN4L1PFVYpYZphgdmatQOrgEsQn99ZwogqOghu2at0cwgGpduR6bmDT3y21ylXYXTW2uvMdy6PWawXNTk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2573.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 18:59:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 18:59:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v2 5/7] objtool: Enable objtool to run only on files
 with ftrace enabled
Thread-Topic: [RFC PATCH v2 5/7] objtool: Enable objtool to run only on files
 with ftrace enabled
Thread-Index: AQHYb3C3+FDfMnlFSkC4VtW4SXKXga0uUcCAgAAAJwCAABAZgA==
Date: Tue, 24 May 2022 18:59:50 +0000
Message-ID: <5cb959a2-7e88-5aff-2f8e-be8fdecd002c@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <cf3013dfad89ad5ac7d16d56dced72d7c138a20e.1653398233.git.christophe.leroy@csgroup.eu>
 <Yo0dgyqAOuwU6gHq@hirez.programming.kicks-ass.net>
 <Yo0dpDuK3ilphNAA@hirez.programming.kicks-ass.net>
In-Reply-To: <Yo0dpDuK3ilphNAA@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69bf4e55-0f20-4724-fea8-08da3db79491
x-ms-traffictypediagnostic: PAZP264MB2573:EE_
x-microsoft-antispam-prvs: <PAZP264MB2573298E277185A6E4D6FAE3EDD79@PAZP264MB2573.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YYKaL7rYig3riysv0fnWhgSXesyFdcMlymdCyWMbzZwbKbt0BcJ+MVW1vGoFRBOW+Hh+Pi9yRFizifP9qp3E8LvJV6+e62N+SJ5zNR+DBlx7iovPnCgrYwObU0GZd059odZg4Ivn1R/IIWURYKrfjdvCuKE1qifQcfcH540a70QBRI9nrffHElRY8Q8nzTrUZ/dlIq7DUQQpOkS+zAzRvM5a041W4ej6o/bj+f3lSxKuvpZPfpocGgcq3RrvZj1DXZvZ95v8mDJF5PAyaUZd/0irRq3kXxJ6ei8EHUYlZ9lLGZIMJc/zNPGn+IpqFqhCyZPm5Yr5hmxrxJVW73EwflheGw8y+01ID1ZKuSU6+dKtwC2mqURSl+CGgik7PSIvyqfJn+03T6tZM07iY/LYnYEUby6wgXEuLV/jKv1UCjHNKipVycXiCGTfCHSFFnv1WXhZinK9Lb2JvY3In1pmo765CFFxt4xO/cZAwNbavqnGKohHjJrnyyQuuknxlnbDfzw919yvB4JDfDzvOuQP9KpLuCsYD4bABjtlwmmAnKtB9FnayEq/9tpjjefm5MyhG53JvVPIHBRf12xaDR7O4abv5WUi/u6QloNNXJ/M2t5TpfmVdja1TNGkINDSFXUESuNgEiEKwLkeMD3/+4b6MOBxiKeFO0iu1k1hPCjcWFytkobWUPRrJVktxvyDUHNr42tPcpF2S41H4BaIUMzRT3BrkS0xFSAtiQ7OZlpxBphETvANAED7Ub//qCl0sz+fWrBn/WGRavqqqBfw+OIpS//YyneghwoopEL8ZlEfYYkgJknX+HDIKf88kVox3Rivyu68Vfc5jZstOhFehaz0PdlkI+MDAshFJ9uZzdgX6Gk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(76116006)(91956017)(64756008)(4326008)(66574015)(31686004)(86362001)(2616005)(66946007)(8936002)(54906003)(122000001)(36756003)(83380400001)(186003)(5660300002)(66556008)(66476007)(7416002)(2906002)(66446008)(316002)(508600001)(38070700005)(38100700002)(6916009)(6506007)(6486002)(966005)(6512007)(26005)(71200400001)(44832011)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjNoWUdoKytpTE9vK2Eyai83bTJ1RWNJSnNGMjY3TXg4Z0lWUGc5azFJWnRQ?=
 =?utf-8?B?YzFtdlF2WnB3MmFVV3h2dHBZTlBMOEJESkpDTzdhM05hTUN4dTNvNkxyaWdr?=
 =?utf-8?B?eTZiaDBIbmRKaG5WVk1Vd0FVS0hWMzFicDJQNG9md2RFblF3THRkRmNjSk5J?=
 =?utf-8?B?a3BxWi8zMkpSV05NbVh4blpkY1NjNzVGYW9XS2xPN3p4NnVJMDYyZGlUNGk2?=
 =?utf-8?B?dDc4NlBWSFlyNTFmdTBydllQQnd2QU1KS3F5UlZOZHd5bEY0SWo0Rkt2ZUF3?=
 =?utf-8?B?bnFLSGdydkJmNlZqZ2x0ajZENlF5YnhlRFMxNUZYZHBQNGM3Ny92eHNvM1kz?=
 =?utf-8?B?VDFPWXRoL1IxT1RibEVKRFJ0UnBpa1hVVzdCM1pWdnJla1ZtYnduU2F4ejdW?=
 =?utf-8?B?S2dkMzAyT3JEM0g0TUVJTnMvelpKdXh2dG0vY1BKb2J1MnhzRHAvL3ZtRmJ3?=
 =?utf-8?B?TGZHUVZ3bEF3WGs3VGJCZnNUc0o5MStMMVVKbzhja2F5cFRRc001S01zbDV3?=
 =?utf-8?B?QkxmUG9yRlE2RVpJZHFFVDRMTjk3WTMydDVuNThkMmdLVFBoS1hRakdaL1dN?=
 =?utf-8?B?eFJRR2ZBOUdqYnhYdGcyaDFMT1EwR053Rm1GWEsyZ2xLUjJCQmFGSDNiMHI1?=
 =?utf-8?B?eklUS3RxaEJ4bE9KNjRjdUo2N0pBWS9mK3FnRDdnWi9DUXhsR3pIK1dYcGVl?=
 =?utf-8?B?TTNnQllrZnpjNXJUaFJhNFlpL0VvSU1kUlltZVNaN1FrcnAveHJ1WnJCYmZv?=
 =?utf-8?B?NEpPRmdEZi9XYjFobmRaVVBhREtPVjFmbHpDbU5jNjNjMEhsMFhuRjBqendS?=
 =?utf-8?B?SXlxT3pOcEJvY3VtN2tHcjFhNkpuUlFUUnU2SHhVVi9TazRINEdGZWVPamp2?=
 =?utf-8?B?UzYzR2d5ODhFQ2ZQeHh0M1dsakhBNkNTMGYvUXU0d1dGWVdNOVBaVEo3Y2pP?=
 =?utf-8?B?ckNjVnd5QytlaDlEY0t6NklNMjIxRzZBUGxGeHhOUzExa0Y0TDJKYlRLNjF3?=
 =?utf-8?B?OGd4Z09VWEZDM0swVlEyQzlybWRuM2hTdXVvcTFnWFVsM3pObzFNbmJiRVU2?=
 =?utf-8?B?UG1yLzc1cXBWZWRWQnVDZjl6VURYVjFLbHNqbkhUcXo5TzlFVmZ1WlkvZDBm?=
 =?utf-8?B?RStkOXZ0dTNybURuQ2VySUlKNFNNakFrME1uVVZ2MDVvUWpYa0pzdGw1WG9x?=
 =?utf-8?B?aGcvejFVQnYwbmdnY2pXamdEL2RVN3BOaDJPYzdlTVJtdjFPdUtFMk53L2hq?=
 =?utf-8?B?RU5jZWtSd1BnT0s2MEc0WEJ1WTk5c1UrNGJkVjhFYysyVk1Ha05yMzV5cXdL?=
 =?utf-8?B?bDlpa2NxdzZSbmF5Nkc4OXp5ekt2Q2tSMitVbldRODR4bW9oaTlWUGNDdWx3?=
 =?utf-8?B?aVhZV1RncUFDRmFoSHMxVnpLN2E0MVFUbW9Xa0lCRWRXeGw4UTRvREtGbnE0?=
 =?utf-8?B?cEZVa1VXTFFIcVlyekRvaXhVa3MybElybk9lR2NzQTRsNmdTMlp4N1N4N1hz?=
 =?utf-8?B?aHFNOVVSZkFYbEdhc1ZUQzVBdHBDUWk4b3VXL09USkpRL2FJbUZzTEJhYTFE?=
 =?utf-8?B?M3NGNWFzUDhtSlZoMmdrdnQ4V1czNjFXTWN4eFBHL21SVS9QRGxKN2pNTVRp?=
 =?utf-8?B?bUg3d1RvTzhsYzRqeHY4NzQ1TnlET3dabVFtc2svbVlUcHNHcENpMlV2NHdF?=
 =?utf-8?B?Zi9BNGZGdXJxdTM1eEVLZ3kvNC9pLytYT2dKVi9UZGRQQlhsbXRoNDNFdVU1?=
 =?utf-8?B?Nkx4aGpIVTNhRG9kbEg5TUY4dkdNeHFRYXlrWFdTdk5Dalo1bS9VZlFLcnli?=
 =?utf-8?B?YVloR2RZbXBrMUd6L3E2cTAyT1RZZ0lvamgxTldSRnR6ZVY2NmNmOVA1bW9S?=
 =?utf-8?B?QklsQUJUR3BrNHJqZWJJV3lOb0YrQVRGMU5uaHZINGRpUld0TitmYVZjYUxq?=
 =?utf-8?B?SGt0Vk12Rm9QU3g5eUtMWEExcTJPa3E5dUVYUDl3c3U2emdtQ3dXV2Uxa1pz?=
 =?utf-8?B?ZUFIdHhBdG5OUElUV1BEOXJFQndNNjBpOEtDTWI5T3dNLytiSG1nSG96TXZq?=
 =?utf-8?B?OWovdkJYN2RmMkUrenhHM04xWmJKNFM0WWZOZStlQ0daaTRTUkM2QVNsTVpq?=
 =?utf-8?B?YU9sdjZYQUIvdkJvbHovekF5RGk1cUlXQzN3Sks2ZytwNkpCTG5oaktnWkp6?=
 =?utf-8?B?b2UrbWhHcWp5S2dsMW1FQzVGTnBHVlpWVUZrbVVoMS9ST1N3Q3BRd1pqOTFo?=
 =?utf-8?B?ZTl6cy9ib1hRLzZLTUI0MG9paUlabmtuUUx1VXFlaXp0YzJ6M0dHa1RMcW5O?=
 =?utf-8?B?SmRJRE1SZXhscFlJT1RydGNZM0Z2Y1p3RUo4SlhtYnMrQW1LVnRyTW1tSU1W?=
 =?utf-8?Q?376+7XBre9q+ZeH17R7grAdQg3cdC5zO1UnQ3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <699A7A3B5D5C034C8C6B506D550A2766@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bf4e55-0f20-4724-fea8-08da3db79491
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 18:59:50.6939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8ABDedbhzqsL1QbmUao2Z9D6/Q6hcZ4YrrCjU50B/TBwWJG8bDLV7FH7egT1jgd3+JOGbm82QjisImzDG0w/ONHgRQjmBoRT9T4DDMY6OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2573
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "sv@linux.ibm.com" <sv@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA1LzIwMjIgw6AgMjA6MDIsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgTWF5IDI0LCAyMDIyIGF0IDA4OjAxOjM5UE0gKzAyMDAsIFBldGVyIFppamxzdHJh
IHdyb3RlOg0KPj4gT24gVHVlLCBNYXkgMjQsIDIwMjIgYXQgMDM6MTc6NDVQTSArMDIwMCwgQ2hy
aXN0b3BoZSBMZXJveSB3cm90ZToNCj4+PiBGcm9tOiBTYXRodmlrYSBWYXNpcmVkZHkgPHN2QGxp
bnV4LmlibS5jb20+DQo+Pj4NCj4+PiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgb2JqdG9vbCBydW5z
IG9ubHkgb24gdGhlIG9iamVjdCBmaWxlcw0KPj4+IHRoYXQgaGF2ZSBmdHJhY2UgZW5hYmxlZCwg
aW5zdGVhZCBvZiBydW5uaW5nIG9uIGFsbCB0aGUgb2JqZWN0DQo+Pj4gZmlsZXMuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gTi4gUmFvIDxuYXZlZW4ubi5yYW9AbGludXgudm5ldC5p
Ym0uY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFNhdGh2aWthIFZhc2lyZWRkeSA8c3ZAbGludXgu
aWJtLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4gLS0tDQo+Pj4gICBzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
IHwgNCArKy0tDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQgYi9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkDQo+Pj4gaW5kZXggMmUwYzNmOWMxNDU5Li4wNmNlZmZkOTI5
MjEgMTAwNjQ0DQo+Pj4gLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZA0KPj4+ICsrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQNCj4+PiBAQCAtMjU4LDggKzI1OCw4IEBAIGVsc2UNCj4+PiAg
ICMgJ09CSkVDVF9GSUxFU19OT05fU1RBTkRBUkRfZm9vLm8gOj0gJ3knOiBza2lwIG9ianRvb2wg
Y2hlY2tpbmcgZm9yIGEgZmlsZQ0KPj4+ICAgIyAnT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRF9m
b28ubyA6PSAnbic6IG92ZXJyaWRlIGRpcmVjdG9yeSBza2lwIGZvciBhIGZpbGUNCj4+PiAgIA0K
Pj4+IC0kKG9iaikvJS5vOiBvYmp0b29sLWVuYWJsZWQgPSAkKGlmICQoZmlsdGVyLW91dCB5JSwg
XA0KPj4+IC0JJChPQkpFQ1RfRklMRVNfTk9OX1NUQU5EQVJEXyQoYmFzZXRhcmdldCkubykkKE9C
SkVDVF9GSUxFU19OT05fU1RBTkRBUkQpbikseSkNCj4+PiArJChvYmopLyUubzogb2JqdG9vbC1l
bmFibGVkID0gJChhbmQgJChpZiAkKGZpbHRlci1vdXQgeSUsICQoT0JKRUNUX0ZJTEVTX05PTl9T
VEFOREFSRF8kKGJhc2V0YXJnZXQpLm8pJChPQkpFQ1RfRklMRVNfTk9OX1NUQU5EQVJEKW4pLHkp
LCAgICAgICAgXA0KPj4+ICsgICAgICAgICQoaWYgJChmaW5kc3RyaW5nICQoc3RyaXAgJChDQ19G
TEFHU19GVFJBQ0UpKSwkKF9jX2ZsYWdzKSkseSkseSkNCj4+DQo+PiBJIHRoaW5rIHRoaXMgYnJl
YWtzIHg4NiwgcXVpdGUgYSBiaXQgb2YgZmlsZXMgaGF2ZSBmdHJhY2UgZGlzYWJsZWQgYnV0DQo+
PiB2ZXJ5IG11Y2ggbXVzdCBydW4gb2JqdG9vbCBhbnl3YXkuDQo+IA0KPiBBbHNvOyBzaW5jZSB0
aGUgQ2hhbmdlbG9nIGdpdmVzIDAgY2x1ZSBhcyB0byB3aGF0IHByb2JsZW0gaXQncyB0cnlpbmcg
dG8NCj4gc29sdmUsIEkgY2FuJ3Qgc3VnZ2VzdCBhbnl0aGluZy4NCg0KSSBhc2tlZCBTYXRodmlr
YSBvbiB0aGUgcHJldmlvdXMgc2VyaWVzLCBzZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjIwNTIzMTc1NTQ4LjkyMjY3MS0zLXN2
QGxpbnV4LmlibS5jb20vDQoNCkhlIHNheXMgaXQgaXMgdG8gc29sdmUgdGhlIHByb2JsZW0gSSBy
ZXBvcnRlZCBhdCANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBw
Yy1kZXYvcGF0Y2gvMjAyMjAzMTgxMDUxNDAuNDM5MTQtNC1zdkBsaW51eC5pYm0uY29tLyMyODYx
MTI4DQoNCkNocmlzdG9waGU=
