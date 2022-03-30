Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBDC4EBB38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 08:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSxzj6W3Wz3bPX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 17:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSxz94ZzVz2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 17:55:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfFodneIPSsT+Z8lHLZyxK2Cb51r1Du3NzgAgJqTQWhQk4/U/J/26AXST43D8bVP68n49gKafUWhEzTUc+c1WrNhvmWgMb0OVl489F7aE5Vo/ATnpIgSZ5cV3pHpjjexU3N+8Dd3OfuA7ckXViSymIoUN9BbGc0zykuPo70OzrWA+K4GBgfizjd/XApl8qjJFt/EpnJNtu/k72o5a3UOmBgX++dfinP3zKAYxiLBbfABZLFLcDuqk2U4XqMk2vGEyrtisVGFgjQlMsDBzFc/bW+x9Bg73k5nFy02MRiu36dGO7hlrDqawFsDfRtveCnRficgwpOXHaEPv8r5qlP+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkDv73aHVdqlChnoOqdC71CrI9dowVvyqCwTmCN8LBs=;
 b=OwmaoamIPLzBzsJRo8HzW/QPNlYFGTSfTXWImVLpIRk5ezM02L4A2oDnVJKKBsGjO/BR2sJdy5NvsjlTc5vn+yZQV8pJMkFISFMKmGP4bEHa0TtSHnTShjiTrXGWSo+LwUE89UosDNNZhVOgzb9bYJwWebbjOGxh3zLiijzAJuPTrkmrRkQpMfM1bzBN+br1TDA63xuJcTT6kQtTANEZp5kTLKem3kRTNzXDgbbPq85qpK56ZlmQNgn43P9TONsZEXX7NkMx6wihISuStAjqiqsqyDGpr1cZBt39iDOkzTvuQ4kWpw8nvZJOv6S78RKqtAU/3mFCHZLDlXWko78fTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2511.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 06:55:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:55:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] ftrace: Make ftrace_graph_is_dead() a static branch
Thread-Topic: [PATCH v2] ftrace: Make ftrace_graph_is_dead() a static branch
Thread-Index: AQHYQB7LxWRV2OxXEUS49dhOF5V2AazXNZiAgABQbwA=
Date: Wed, 30 Mar 2022 06:55:26 +0000
Message-ID: <8c65a6fb-cd93-926d-7851-0831658dd289@csgroup.eu>
References: <8628338322fa74287ca8d432d5c0c1964acd6f2a.1648195329.git.christophe.leroy@csgroup.eu>
 <20220329220733.682172ec@gandalf.local.home>
In-Reply-To: <20220329220733.682172ec@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37703d11-f5a8-4776-38bb-08da121a4557
x-ms-traffictypediagnostic: PAZP264MB2511:EE_
x-microsoft-antispam-prvs: <PAZP264MB2511DED8471500C966C683B1ED1F9@PAZP264MB2511.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6FhSpTPF+m+u8qW/4Ai1AZqHCP0C5mQ78LlQr71Iu1/AirxEI7Y18YecjXZ5uCQ3RykmoSw9UFZrs2/PU/J5xIiDvxc8jVc+7QKBL0LsKczOLcS4pM2yoaIX63/xV/q+gwusi5msThexQfiWu9Z43DXh8nUBz+DZbAJb9DdXpKfNky4vRCrVel9D1RYfSKlb9gANU7PzVbjSrHBJnFj14UVH5N4Q+HkpMVi5XPrbxmp584aJC8VxKnXzHueTbelC8qkDrD9du85R9OarHx/2QL3BIXj54o0tOsUkGqMGz2YTgSg9cciruu/HkH1A6SgDBm8/5dC2dO+tRzGDLwFdKnjNK5IlLrbrcJRGzXd2mMAHowOzfNKNF+pt+jbrifMRSHfmXOGSfI7iKcCl1vOmEEyewhdDs7Ev2qoKSbaFlH52+H+0HLWEBxLN54NRof157/PxjEdmF+Qn/4fwaC4AeRk/s1IWmeKX6itfZxPxZc1vj7d0kgtsgXEjZ/54p+go/5xj+A8RxoMZghB0CzkHfwrcoJ268VcGwAmy81C+rfuH4v+AW89Ra1p1urNsW6vhgxEPeqH+PQeWB/1CWOMNv902hpsrtPcJ7v+0NYjfoQo3EfdRzBcB/ENzyYTdo7TEsNmiyAnPxJJ5C8B7hcF06A4zJpe0qEZO45dwW+zlEsdHyrDynQ1pu8IT+g1M/wlA18TkATTLRMzeTyDqO0v3iEoXRyv7XmIh5kPkdl00ssTjcYsJ/n0dTwaiP787561lBmA+QyCwzqbdRYCp1WkKzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(6486002)(44832011)(2906002)(38100700002)(122000001)(38070700005)(66574015)(5660300002)(4744005)(36756003)(6506007)(86362001)(64756008)(71200400001)(186003)(54906003)(83380400001)(26005)(8936002)(6916009)(91956017)(316002)(66556008)(4326008)(8676002)(76116006)(6512007)(2616005)(66476007)(66446008)(66946007)(508600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW5zUFp6b1VDV2MxS3QyeVM5dmhNTzlnKzdocnZkWE56OU5JV1VWSjRZeUdR?=
 =?utf-8?B?RVJLWVN1cjFFWjE3QW1WSkg1NkJsWWxNdWJZUCtKTUZVaEV3S1luOW1HUUdF?=
 =?utf-8?B?QkFDNFI4SXg5ZDhOUDJwV1dZN0pBSTIwbVRlakRhL2NDUUdLek04NmJwRHg4?=
 =?utf-8?B?V2hBU1IrZ1FsSnExelQ4QzBISURZR2ZHaU1Bc21jdjQrcFNiaGRTanJ4WC9B?=
 =?utf-8?B?SGhDSEZJTkJjMzFjcXJWbmFBMExrSitvek54NVg2WGRwRW8yR3NoS3I3K3dt?=
 =?utf-8?B?M3VzOFJmQ3NQT3ZIOVBQaHZSSEF1V2x0V245cEJYRWYyUDZIcFRJVm9La1Zy?=
 =?utf-8?B?elEzWDV3RjZ3VlJ5K2xVelVyd01tNE55OW5Yb1JiYkRyVGRYRk9GOTJoblhQ?=
 =?utf-8?B?cloyRlN1SFJ1TnhUTWUyZ21OeUNDYnU4VFRNWlpaSkJLZCtGUGpFeW5EZGNU?=
 =?utf-8?B?S0VaOTJ5dmpWZHRQUzIzZ054ci9sdkNRRUtkWWNmSk1FdTlGZmNtQTRsMjRi?=
 =?utf-8?B?VTVMRlJNaXdEOWVTTjJLdnN4Q2NFZ2VOTFVKZkoxU1Mxbkw0WDFvcXQvd1RQ?=
 =?utf-8?B?QUViVDl3ZWZDNEw1WW1uaWRHWG1ZZUc5QUFndnk3QVFGN3VvUlhkT1BIT1cv?=
 =?utf-8?B?YStTNy91WnBJTGdZTkpLWnBHdzR5MkllazduYitDR3U3aWlHcENJS3hNMzQz?=
 =?utf-8?B?cXBFTFRuRU9PNXBhenBtMklzRTNkaitYWCt4SXo4VXU1VVFUTzhQaHRoMTk3?=
 =?utf-8?B?MlRLbzNVeFR3emZxVXJPUHh6d2xIakptK0VHY0FDdTRlMTZhRFJmWTFrMStq?=
 =?utf-8?B?STRIWXlXQisvaTljRi9YWWs3cnovOGhLbGVXekJxZXhKQjYwdnJtdlNSYmtJ?=
 =?utf-8?B?TjNMT3RzU2Mra2hoOVpZUjBvQzZMcVpUOTcvL0VjT0FlSzBuSUQ3Sk1QOWkr?=
 =?utf-8?B?YUpIWVBpZ2NYSHJnQklMOGNCNlR4NDJxN2lLYmdGSGRZcG03RTlyNHV2QlFN?=
 =?utf-8?B?NnR5KzBqckIxQld4eldIL2RTTGdIY3VXQ0RjY0JEUFROQk13R1ZXUjR5WnpK?=
 =?utf-8?B?Tzljb0FPSGl3RUpQcHJIeEVRcElBUXJGc3A0c3VQTjhzT0ZVRUxzZWxNWjVF?=
 =?utf-8?B?QXhJd0xyNm9Tb2hobCtyM0d2QVcrVWVaWnI5dWZZVnY4MHlBdW1QeFk2OU91?=
 =?utf-8?B?RU4yeVZmajVLeUJnZmRwdE9mTFZscDFjaHB5WTlMcWM2ZFBwcXJLZFVHS3J3?=
 =?utf-8?B?WFMyK25vczNzVWh2azhBRXpUUW1rZmNrQ1B4RnlRTzFmRlVpeUR0NGM3TlJL?=
 =?utf-8?B?VG1haXk5aUNibmZEZE1LU2dqeXphbTUxZG90OHQvRTdEYTVJclpIOG9pd2pH?=
 =?utf-8?B?eFZKL0JDRUdWQ3ZzK3ltcWt4V1R1Z2E3WUlaU3FXSUh1YlRyMWNRWlJvWmIy?=
 =?utf-8?B?N0ttZTR4ckQxZmw2Z05wS2JLMDJsU3V4ell1U0NyZWNZL25hd29TMjd6dXF5?=
 =?utf-8?B?QnFHNTNJOW1OSXBkQ25PbW9vamtjQVdQZTQxUWkvM0QwNFIyVGo5VUxhaVdk?=
 =?utf-8?B?TGUwekducGlrdmZjYTV4eHNHdG54SlJhTTduZTM3WURldGZvaTBNRDNwdEpC?=
 =?utf-8?B?WlV5aW5OOUJhVjhVcVZrNG51aVpUNEptdkQ3emtIcWtXb1c3Z2hUN0dsK3Vo?=
 =?utf-8?B?eFRldE1TNnFicEVyakRnUlgxZzUrdlo1Tkk1VWZMejJLUkpOQUVCSlExVnZl?=
 =?utf-8?B?bDB0LzE0V3MvT2hlcjNDNWZkWFIvWFE1UEhZVXFMMCtSeXdOMldGL2IyaHdZ?=
 =?utf-8?B?WTh6VFovUmpWa2NwZEE5b0M0SU84U0dvMzRJUGJQK1pxcFJWTjVBUEpSUkMv?=
 =?utf-8?B?MGdyZlNCK1hIUFQ4ZmNUQzNiTlA2TEtyWWV1ZkJleTJIVUViZk53RXNoTjlZ?=
 =?utf-8?B?WDRGcWxHNUJmYnpHV1Z1S0NIWGFhU1BCc2c1azFRaWdtZTZNMmxpdDlWM2VX?=
 =?utf-8?B?dEI2N0luSXhmZk0wMkpvZGVHTTlSbHkzQndmK1c4RW5yRzFkRVBLdU00bTV2?=
 =?utf-8?B?UlBmb3hwdWlibjhsL3FUYTVnMkx5MHV1eWU3UTZaMFUzL2psN3dmQjl6b1ov?=
 =?utf-8?B?dXFZZUJ1QW1LOVR1Q05VM0ZoT0dlcVRLZjFnMWN0YTRsRzhwRFRBTjByQkJl?=
 =?utf-8?B?L3hYKys3aUE4Ty9mM2Z2ak1jWGVVK1F3aFBiYjlXeFppZkpESm1pTEhibDVV?=
 =?utf-8?B?OU5CcVJzaDlxQlFoMUpZa3dMalJ0dFZKamF6UURRcndraVNXZHhtRDk3c2VS?=
 =?utf-8?B?UTFMbG81QVRUT3pWV1oxaVNpNDVxRHBwT0FUMC9DMHMrcDFjRnBJc1ROK3pn?=
 =?utf-8?Q?0wl1+dH0WQQH8Ya64XzU5cK2JStzQUNifDHrZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C7768E2347F034FA8D27C7619022D4D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37703d11-f5a8-4776-38bb-08da121a4557
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 06:55:26.7515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cXXoJf9Xetz/uMwtRbTjrknRWePvH9g6y+jP2bHkKOWglN5Y0Za4MjubRp5DDDkW30Pz1/x0oV9FSYroJdXK9XROPQVT5yTSeXj/U8QlC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2511
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
Cc: Ingo Molnar <mingo@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzAzLzIwMjIgw6AgMDQ6MDcsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMjUgTWFyIDIwMjIgMDk6MDM6MDggKzAxMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiAtLS0gYS9rZXJuZWwv
dHJhY2UvZmdyYXBoLmMNCj4+ICsrKyBiL2tlcm5lbC90cmFjZS9mZ3JhcGguYw0KPj4gQEAgLTEw
LDYgKzEwLDcgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3N1c3BlbmQuaD4NCj4+ICAgI2luY2x1
ZGUgPGxpbnV4L2Z0cmFjZS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPj4gKyNp
bmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+DQo+PiAgIA0KPiANCj4gU21hbGwgbml0LiBQbGVh
c2Ugb3JkZXIgdGhlIGluY2x1ZGVzIGluICJ1cHNpZGUtZG93biB4LW1hcyB0cmVlIiBmYXNoaW9u
Og0KPiANCj4gI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4NCj4gI2luY2x1ZGUgPGxpbnV4
L3N1c3BlbmQuaD4NCj4gI2luY2x1ZGUgPGxpbnV4L2Z0cmFjZS5oPg0KPiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPg0KPiANCg0KVGhhdCdzIHRoZSBmaXJzdCB0aW1lIEkgZ2V0IHN1Y2ggYSByZXF1
ZXN0LiBVc3VhbGx5IHBlb3BsZSByZXF1ZXN0IA0KI2luY2x1ZGVzIHRvIGJlIGluIGFscGhhYmV0
aWNhbCBvcmRlciBzbyB3aGVuIEkgc2VlIGEgZmlsZSB0aGF0IGhhcyANCmhlYWRlcnMgaW4gYWxw
aGFiZXRpY2FsIG9yZGVyIEkgdHJ5IHRvIG5vdCBicmVhayBpdCwgYnV0IGhlcmUgdGhhdCB3YXMg
DQpub3QgdGhlIGNhc2Ugc28gSSBwdXQgaXQgYXQgdGhlIGVuZCBvZiB0aGUgbGlzdC4NCg0KSSds
bCBzZW5kIHYzDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ==
