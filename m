Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A766F7F66
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 10:52:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCPb70zwmz3f7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:52:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NXD3KwMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NXD3KwMq;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCPZD4CYrz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 18:52:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OE4iqUmaPPhaIGTu0O3QYc/ia0RYaGvXiaTk/bwWZAuEzjx1xTPCmk60ynNARubHmHClFkTuQgLOujvH2lEBtB9Q6BFQsAQJwT7BvzUGF0exbFFjHviqzFvqnGAl3hIGiGFzfcZgeuPIJYSVUOEPn6sbs502T+0ZcKgksr07QhNaKa8wcO7+JIxfYbziZAtKWN64NF0AkKeH4d5LV5LmRRr9h1za2zSIvW1RGN82C6p7XhnfirEVYkv1pH34LHEz2eGX4gD9JcqxaYhjOjhmnoANZiOWyJTDh3bwb6ZY6Zf+3Rjcm1CkLy3TCFBM6bWC0XNbER7wGCyIMQINh1ZEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tklRQwbCPIvdSxSQ+dvGXkM6KeY8RcXdkkOtsflwIA=;
 b=icOBGv3Pkez8slP9EXIDwOzIZ4yrPcpvANpLOS23KwY2a474YSa8syu/uQiyZVKzBm+AnopvzrkLpQjzPI6jvRxrOvvAjrhjSqm7gb6n79znzMOMFjnh6VkNAmTd7yQTkekGpUgYKkUZQz0Hnu2Zm8TDLqHpkeBox0kaWM08UbE8qdOL8BEmKbV4Pq0QWsPpDQ4bbAIB+SBCuwGG+rx2re/iskJYnCAmIlNFfyWJjPr5bq8m0PzYZqPLSVvSbmYKnPr8yRsm7WnJp7pl/ZYRuj2KFIIYBFzvKncCprdjEZYocMSLb9XSk86sSp6TnvWfTgWwgwqkAFHvEuyyxB1jOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tklRQwbCPIvdSxSQ+dvGXkM6KeY8RcXdkkOtsflwIA=;
 b=NXD3KwMqJeKs7g8JnnQ7RR1Hg5UrIDWOsRIRttPMizR/AdzLAVMU2mQ4ZiszgioMLl1Yyr+btYNz8X2eDM0PA7obNqjsX8XZq7ZBTaX2NYiD2DuIDarwG9av5gw/fSt9RuOGIh37MJmiIqtpsL0XjL4WiQz4wTIxw2oOUsy/3aJco4xst8LXQLFEE+cBBTFxeNb3+BSbjn5KzjqXkmllqVd8sH6EnBV0ryzocup5KtLosvFbc9eqdpuojS1qTmJ44f0JJhpQEyYbdbIx0cfFDZ9snLEFTMx4cIS1Mo5tjHhggEk7sNzwHdwoSw13A0AkqGN/UISNSFd7Qw9ixhJKgw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 08:51:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fce5:485d:b5f5:c8ec]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fce5:485d:b5f5:c8ec%3]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 08:51:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/4] powerpc/64: ELFv2 conversion
Thread-Topic: [PATCH 0/4] powerpc/64: ELFv2 conversion
Thread-Index: AQHZfyH4prwdA09pHEmfQH7+6BsiGq9LX1+A
Date: Fri, 5 May 2023 08:51:46 +0000
Message-ID: <6d0609ae-e31b-8530-7509-7861b07d66c7@csgroup.eu>
References: <20230505071850.228734-1-npiggin@gmail.com>
In-Reply-To: <20230505071850.228734-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2037:EE_
x-ms-office365-filtering-correlation-id: c4c9d00e-859e-4602-50fc-08db4d45f519
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6eTSCUdukSxsoiLiQTk20GasvQisuEjNUCeUmItSJkXJqFiuc9DAN0H2t1sK46Nwz4Z2z7HoFfYLwGC0dic+mibPliGaLFr7EFyx6SrZnDfXlFVYkEibVLOCs4SG3hn4Z+Qhkc7aqCXDfDlJk86QU9Ao2LEMtUgcELA2q5HdwTiq0m/5ed9h+5QZbNQZbc//Jw4hfLcC8F/VCUuOxWrcAZs66xhxQG5aSfpzm1Lp6/4j992ASUO6jo93dCK2rED06vqyJOV5wYe71ww7+ru8HsZO29g8Bl5RfbtJOAyawZXB2Z+6ILBBrUAYeBgd94cPXP0iXGfzA9BV4ZJQ5JWtM1APRwlXljyD2z7iceyIVLi9Cot99MoUlszz79zu0YZtfJwgdxjXgRAWKpo08QNOL4NGDhY0oEeMFlLEARWQQtvBXFchtGN0Z/vzD7l8zrWO9AW8RBIJ4ubomU6qrrn126Dl0qSMbrP63Y1gviP+H41QupCysZqFXNGZvbj0b2uCvoFT3W4ypWUlaJGkzblKtQOrGOnMUdwPcWbAxJjzHtzeBIGFXn/Z2djUd1y3pfq715wBpsYrX/AeEZmbWOHNgqgcRV8yiydugbYQlgoUue6wv4anHo4Df+6Rj7Q64mUyGobEW9zpoTD/SCnf4rW11W90RpjEOxF0XfLEeoqWRo6KVQ2+T7d58lPV0a3isFaz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199021)(86362001)(31696002)(36756003)(91956017)(316002)(110136005)(66946007)(66556008)(66446008)(66476007)(64756008)(478600001)(76116006)(6486002)(71200400001)(41300700001)(5660300002)(8676002)(8936002)(44832011)(2906002)(38070700005)(38100700002)(122000001)(186003)(2616005)(6506007)(6512007)(26005)(83380400001)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RTF6ZnQvL2hLdFFPMWJWUmxwTGpyMkpzSFBEWHV1U2hXLzJsVHpyYTYxREpu?=
 =?utf-8?B?bWJVanZjTitvVlJnWDdFRkZpd1UxeTNOSU53MDRMUG1jYnYwVTVYVEovTUQw?=
 =?utf-8?B?dGR4ZFI3d1AzVWw4MGRqMXpFZCtNa3ZFek96U0dQSjVHeEtIYTJNRFNkcW00?=
 =?utf-8?B?cmU1OC9wYUR3aGNjWU5mRjRObjZQWFBueVhneDJudnVYTkNLTU85bnkyeEQy?=
 =?utf-8?B?a0VrWU85ei9CMklVYzczaG5wN08weC9kOXlFRkpYMFdlZGVlN3FXeXVyVldk?=
 =?utf-8?B?OG5jZEJQSXJGblJBdVE1Nkx1ZHhTNk5VcmFndnlYRkhZMjJxeUVoZVBBYjlD?=
 =?utf-8?B?Wk53TGhZRXVPanNaQ3hNWm5IbDRhM2FwNVlsajRQeStpaStrRFVudlh1RE9C?=
 =?utf-8?B?T05OM2dCVXBDTDBlOE1nWWhhU1RJbnFkd0h3RXhwVkM0YWhxNXIvUFdZelVz?=
 =?utf-8?B?d2k3VjF4SXE0cy90VkpQdmYxaHBWU0tmWWZZRENqMDlvRWxPUGdBWm4yT29x?=
 =?utf-8?B?RGFrTFFiSUY1VDFPcU45QkVSRG8wZlJrbUt1YkpOOEl5bjFocnhYK1B5RTVN?=
 =?utf-8?B?WlZJWEIwcEVvWVhUUnc2dnZ2MFhsUzRZZU5nZGIvWXNHSU0xd3BYWlNTUCtV?=
 =?utf-8?B?V01OWXpjSHhWeGZNSnk5akRnY2JVbzNFcnpCSWdYSmhoSFpyQ2pUeU0xaHVs?=
 =?utf-8?B?ekVub2dRbXMybWlvNm9PTXpXQWV5N1RlYUowNzBuR1RWOGJtMWRhWlZ1eFBR?=
 =?utf-8?B?ZDgvTGczdC9qc1FvVmVlN1RaakFJa21vQ0N0MDkrVjIrZDlpTkNBL0g1aStt?=
 =?utf-8?B?bEUxVGlETmkvN01VYkp4WTI3NzZVV1g4YmlOZGhnZ01ycWIwNjB6QTZ6K2sw?=
 =?utf-8?B?aVpyWmljVXJROTE4TFMyVjJsOFMzUVlOWWhYSEFBRTI4ZUFKSGxJZFRGZ01K?=
 =?utf-8?B?WTh5TVFuLzV2VVFiSjlyUXB2d1VwNlAwMmZiU05aZGtBZXZNSGJ6cURidnRj?=
 =?utf-8?B?ZnRxbnJxWEVHMHFZcFN6NlllUDM3Q1hwNlMxTDRMRGlNalJWVkdmWkVHWThU?=
 =?utf-8?B?SDN6MFhXaTZkU3JhbWE0N1VEdnVMajZEQ3NEV3p5Q3JVV00vRElpTU9XLzMy?=
 =?utf-8?B?MzNxTXFHbU5ieXhkRzZNRlkxdnMvZEtET2VGK3k1ZmxjejFzeEdBQWhrREZ5?=
 =?utf-8?B?cXUveTk5MmNlaTNTdGQyTHZTWktwMWczUFo4Vnd6c1g4VGpyTWFzTzdSNHQ0?=
 =?utf-8?B?SVVYNDhrb3VkbkdlQVh5dlpCNVhyRHhPam9sUWFaeTZ1UE5nZ3Y5c2NIdWhW?=
 =?utf-8?B?M3RoYWpUZGtBMWhaVkZvWTgvMlBoT3dJdXZsU1VGMXo4V0J5UE1CZGhKajRJ?=
 =?utf-8?B?SDZiYTgzVlFjR003OGx4aEkxbkd0SHZMK2prWHdjSG9GcUozdXY3UjlMOWJm?=
 =?utf-8?B?VWdHQWdLRDYwSWtYNzNneG9hZjJaeDVZK2N4enNObFI2dmoyNThvTTIxbXBP?=
 =?utf-8?B?NTgvUlFQODFBL0FvSWcyaWFZdXZVZ1lqMDd6cElMamQwMktsVnorN2oyb2xT?=
 =?utf-8?B?MkVuZ08zdUhlVkg1WnViUGNmL0lUU2dXSkFFYkFoR2c5S01ZZGxROTQrQlJ4?=
 =?utf-8?B?UTk1em12cWNXK2VtZnZINHhJZUVPWk0zczk2b0FjMUtMNEkrLzlmL1NObStQ?=
 =?utf-8?B?N3g5aXdDRUlyUTRNWENwTVVkL3ZXUmJjNG84QnlYZ3NTaklzYUtzMDAxMkli?=
 =?utf-8?B?Ni9oNm5adUF4MnRPZUJENU5GQ0lUTmpPdWpXdEpOeWVrSmFWZUZJbXVHamg2?=
 =?utf-8?B?RDkzNGN3UDYzOGd6SndtSTJGS1ArU01XQXY1T0hRREtDWTNjcFQ4ZExYOFNL?=
 =?utf-8?B?MVRIRXp6Nm51MXFIZmNiUnFITUE3UzBGdW9ZemhiM28rY29mbjR4ZmNmNysx?=
 =?utf-8?B?YjUxVDg2MnRWNVJualdybEtuNkF2Wjd4aHBHRXJxREgxSVFhMkFoUW82L0gv?=
 =?utf-8?B?Z0RTUjFubTkrMUpCTEpjOHZKcnBENFlHUHh0SW9PUHZRb0plWnJEc2tnN3hR?=
 =?utf-8?B?UnV0QWg1SWFZWVhpaXlWeEx3UTFOblBjOHBUY01XaFZTcEQycUVWbEg1MGND?=
 =?utf-8?Q?BLXgpEXE/zjbYOzYCNAuEF6lL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DB205E064839544AAFD147B87FD5908@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c9d00e-859e-4602-50fc-08db4d45f519
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 08:51:46.3008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feWgLZWqk+PsA2mwoNo2T8+VJzk5Jss83JPJNdUqXDzNATpi/gGDH44Fo3fpWKnPkg34GSAemZORS3GMNEZWrsdHY9jkSB9396qN+tXZHow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2037
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA1LzIwMjMgw6AgMDk6MTgsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBUaGlzIHNlcmllcyBoYXMgdGhlIHN0ZXBzIHRvIHJlbW92ZSBFTEZ2MSBmcm9tIHRoZSBrZXJu
ZWwgYnVpbGQuDQo+IFBhdGNoIDEgaXMgYSBidWlsZCBmaXgsIDIgZGVmYXVsdHMgZXZlcnl0aGlu
ZyB0byBFTEZ2MiwgMyBpcw0KPiByZWFsbHkgYSBzZXBhcmF0ZSBpc3N1ZSB0aGF0IGNvbmNlcm5z
IHVzZXJzcGFjZS4gNCByZW1vdmVzIHYxDQo+IHN1cHBvcnQuDQoNCkkgc2VlIENPTkZJR19NUFJP
RklMRV9LRVJORUwgaXMgcmVzdHJpY3RlZCB0byBMSVRUTEVfRU5ESUFOLiBJcyB0aGF0IA0KY29y
cmVjdCA/IERvbid0IHdlIGhhdmUgbXByb2ZpbGVfa2VybmVsIGFzIHdlbGwgb24gQklHIEVORElB
TiBvbmNlIA0Kc3dpdGNoZWQgdG8gQUJJIHYyID8gSWYgc28sIGNhbiB3ZSBkcm9wIHRoZSAtcGcg
YmFzZWQgcHJvZmlsaW5nIA0KY29tcGxldGVseSwgb3IgaXMgQ0xBTkcgc3RpbGwgbm90IHN1cHBv
cnRpbmcgbXByb2ZpbGVfa2VybmVsID8NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBXb3VsZCBsaWtl
IHRvIHRyeSBnZXR0aW5nIHBhdGNoIDEgaW4gYXMgYSBmaXgsIHRoZW4gMiwzIG1lcmdlZCBpbg0K
PiB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuDQo+IA0KPiBUaGFua3MsDQo+IE5pY2sNCj4gDQo+IE5p
Y2hvbGFzIFBpZ2dpbiAoNCk6DQo+ICAgIHBvd2VycGMvNjQ6IEZvcmNlIEVMRnYyIHdoZW4gYnVp
bGRpbmcgd2l0aCBMTFZNIGxpbmtlcg0KPiAgICBwb3dlcnBjLzY0OiBNYWtlIEVMRnYyIHRoZSBk
ZWZhdWx0IGZvciBiaWctZW5kaWFuIGJ1aWxkcw0KPiAgICBwb3dlcnBjLzY0czogUmVtb3ZlIHN1
cHBvcnQgZm9yIEVMRnYxIGxpdHRsZSBlbmRpYW4gdXNlcnNwYWNlDQo+ICAgIHBvd2VycGMvNjQ6
IFJlbW92ZSBzdXBwb3J0IGZvciBrZXJuZWwncyBidWlsdCB3aXRoIEVMRnYxIEFCSQ0KPiANCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgMjEgLS0tLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8IDE1ICstLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICA0ICstDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaCB8IDM2ICsrLS0tLS0tLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZWxmLmggICAgICAgICAgIHwgIDYgKysNCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va2ZlbmNlLmggICAgICAgIHwgIDQgLS0NCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGlua2FnZS5oICAgICAgIHwgIDkgLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL21vZHVsZS5oICAgICAgICB8ICAzIC0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcHBjX2FzbS5oICAgICAgIHwgMzggKy0tLS0tLS0tLS0NCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHRyYWNlLmggICAgICAgIHwgMTcgKy0tLS0NCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaCAgICAgIHwgIDQgLS0NCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgIHwgIDYgKy0NCj4gICBhcmNoL3Bv
d2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL2ZhZHVtcC5jICAgICAgICAgICAgIHwgIDYgKy0NCj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL2hlYWRfNjQuUyAgICAgICAgICAgIHwgIDUgKy0NCj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL2ludGVycnVwdF82NC5TICAgICAgIHwgIDQgLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L2twcm9iZXMuYyAgICAgICAgICAgIHwgMzkgKy0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL21pc2NfNjQuUyAgICAgICAgICAgIHwgIDQgLS0NCj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL21vZHVsZS5jICAgICAgICAgICAgIHwgIDggLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5l
bC9tb2R1bGVfNjQuYyAgICAgICAgICB8IDg0ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgICAgICAgfCAxMCAtLS0NCj4gICBh
cmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAgIHwgIDIgKy0NCj4gICBhcmNo
L3Bvd2VycGMva2VybmVsL3Zkc28vZ2V0dGltZW9mZGF5LlMgIHwgIDIgKy0NCj4gICBhcmNoL3Bv
d2VycGMva2VybmVsL3ZtbGludXgubGRzLlMgICAgICAgIHwgIDggLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2t2bS9ib29rM3NfaHZfcm1oYW5kbGVycy5TICB8IDM2ICsrKysrLS0tLS0NCj4gICBhcmNo
L3Bvd2VycGMva3ZtL2Jvb2szc19pbnRlcnJ1cHRzLlMgICAgIHwgMTQgKystLQ0KPiAgIGFyY2gv
cG93ZXJwYy9rdm0vYm9vazNzX3JtaGFuZGxlcnMuUyAgICAgfCAxMiArLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0LmggICAgICAgICAgICAgICB8ICA2IC0tDQo+ICAgYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXAuYyAgICAgICAgICB8IDE0ICsrLS0NCj4gICBhcmNoL3Bvd2Vy
cGMvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgIHwgMTMgKystLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlICAgfCAgNiAtLQ0KPiAgIGRyaXZlcnMvY3J5cHRv
L3ZteC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgNCAtLQ0KPiAgIGtlcm5lbC9leHRhYmxlLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgIGtlcm5lbC90cmFjZS9mdHJhY2Uu
YyAgICAgICAgICAgICAgICAgICAgfCAxMiAtLS0tDQo+ICAgMzQgZmlsZXMgY2hhbmdlZCwgNzkg
aW5zZXJ0aW9ucygrKSwgMzc3IGRlbGV0aW9ucygtKQ0KPiANCg==
