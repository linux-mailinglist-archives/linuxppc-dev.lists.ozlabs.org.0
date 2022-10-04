Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE865F3E02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 10:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhVrY2kgYz3dqN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 19:15:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=puyvu8mK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.75; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=puyvu8mK;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90075.outbound.protection.outlook.com [40.107.9.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhVqV6ZM1z2xGh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 19:14:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5oG0Dksxc5joBxc6DMzDN9THNiYwnT5GnC0MiI7hwduP312NDWeZWqY/hhyfVpRCpVpEqkjHxHearvqeSC9Ao2dWfNA72r+x1ROWVGsUCVFS0/vE9JSwap0aPo3GeJRGFgSaFzAX2h7qzLLGzwFafctvd5kfuYagsfG3J71FVMzEQRS3mLTHUU4ya97F8fcmrUNQW97MYsUI0Mxyjc/Dhb3XfRbdJsBSCZFFcbtyPNmiUy7HapB50bwuvD+RXuyPftf95t8nc67KneRBeW512WFvLyKAiMGRBW6JlIk9ujUMrtHJx47YdOp2GnsSkn75e8zKLAGsTJ8GvB3oRir0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ4UfkwJdEfhZYaBKePn7oRVXgiXOJAXV0pK2tUmYoQ=;
 b=Xu0i4CewAvpFLVz/i42S8kRXVTDi6TilzXcqX88Pvs1E/SwPbSlbtQvAeXlaw59ERZMIG/CxULJ7jAXlEdh2YwKpdUAHxlP4dn4GnfevSGOWYlORaeQChdMNiLAfhJvpw1u0D2MdpGNUAsVvZISVqL9hgaTiE2I+UrSteU5cRbOXYTsVIcvG6x3YI9XfBLa+swp7iC+5UCIXGkCqu2uUT+0qWFXc9l4KVR2v3yRhpnh8Bmdtpf154NEmXJyIengx1TcL34tWuaU62ZEyzTomOBbB5FixVyVEXN4hVJFqlW0brYPqdSz980vviTDML786If944JTk2J7o2v1nhvMIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ4UfkwJdEfhZYaBKePn7oRVXgiXOJAXV0pK2tUmYoQ=;
 b=puyvu8mKZshnxVt51Kga3ZmFrN1VY/upOghYcaMbSYFEIhMJn0J6/J+jsbtVRN0gR3kYTB0p/oSaTML/xXvLr7SANgiS2iHSzryzLN5SCfdjpybkkBb2iPJxbi7+gxFWi8A87cpph74bOx2rXAz5qZX5nlwHlyQQdE3ftfogGTPxpoUq7pCSA0I25qRMVZ6XD2g+mrwyuxd4HlB5LE4hlD4IuGAfdq501tHCKI2qJT1f7XZUlycUe+uO7H++CRpvLXYhvJrMzsVXoJwRLDOm++1W6LtVjofGAAXCr0dfuv0obZ7OiEOHfAiRRoOyYOrtBAijebqidphSj/ST4stDUw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2937.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 08:14:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 08:14:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Topic: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Index: AQHYz2MQW2imcSyh3k+BNNYfFkQymK3tOYQAgBB8FYCAAD4/gA==
Date: Tue, 4 Oct 2022 08:14:24 +0000
Message-ID: <f51de376-51f1-0c52-2d53-9ffed688dca4@csgroup.eu>
References: <20220923154143.1115645-1-npiggin@gmail.com>
 <20220923154143.1115645-2-npiggin@gmail.com>
 <264df1e7-ad54-0fa3-c658-dff76dec8a97@csgroup.eu>
 <CNCUVAN99A8Y.8TAMANLUUGOQ@bobo>
In-Reply-To: <CNCUVAN99A8Y.8TAMANLUUGOQ@bobo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2937:EE_
x-ms-office365-filtering-correlation-id: 91786cff-aa4e-4eec-4f02-08daa5e072b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3P3qwa5XFK1lAIWnfz9ibSEAHY/gPJmG/UVSE38uUWAZ4g6WzTTPPq3xxu47M3xcFVh1G53c1qh/sb3cA4h+lQinTZ7xnRmGoyuuyl5K2He27h88EbTcpdvQId9Y6Ct7HBW1dpyeZvZX/tf360TKHV5s1uNMXh3fhTSmpRZGr4Ttz+qQ/n+ic+vJIVXHFoxSTHWipRE4SQ8b5P73vpGMch3wCm04elI/I6hxm1U3lieQaQIMP7WPUwBB03v8Vg9w/HpvhxZfjfFgyNV1eN6MaXZp15DDv7xhnzPPcECf4dlmTHfOzyYGFBEqV7xHwWM8p3rpb/TfKI7IR1aHJM26HjeEXPbe8vgRwlbtFTsBKg9UUemKFVrm6/7qhFJVxv92wK/h8hRwF4m4+AlSHPnl2BT1if8eIbKqbnIQheG0aGtOi3edkvUDyUR2/HWvXEEOV0qdzK8hGl7r4fGy2g56mYaKvfzgsRANxVDq0MoJuvEEZEfBK2oGPsYSX0/bpUOI0iCzpbsrOtTc5OO9qfJFj1U0tRFVj1eCBUuxszeYaw5/xgbZHS1mdPFBL4eg0yJ+j2kwa5kLwzUJmLnFQj1CyPxKFRsrlOh/wmgYwsLNWi29g8f/PCOAkf7H/1ZujpwdIlKUL3l2SKutzB3ZfkNu6fERwYphUNw0bbItXBe9yeS0FMiOQO8X0fEfVyGuX4a8fXMdeThFz6h7duDpdQORurYqiTZHDhomFt4Onfg1QoS44hxinKVr6bua/+rL5DeV7Jno/3AZrTyeK2tQA9iho845hFd3vc4osb5AxRDWZ7Dr6n2IKYhQ17JwonNlzw3kFotdljFxW/OJdrupg6IkuQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199015)(8676002)(66446008)(8936002)(76116006)(66946007)(64756008)(66556008)(26005)(91956017)(110136005)(186003)(316002)(2616005)(6506007)(38070700005)(5660300002)(122000001)(2906002)(36756003)(41300700001)(38100700002)(83380400001)(86362001)(31696002)(6486002)(6512007)(44832011)(71200400001)(31686004)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHhCN1k0OWJWWnYvbHdlRGpyT0w2OWRrVXV6WkUydTR1Y3ZTM0JQT1RFNmEr?=
 =?utf-8?B?YlJLRUpvS0JQdTk1ejYvc0xWalBQSy9Wcng0YXFZRzFsMzRhc0JURmUzc1Nu?=
 =?utf-8?B?K3U2MENtVHI2RW9wRXZYZHp5SDhDZ3lKVmpkM3lvWi9qaS9WVFBlekVFMFhO?=
 =?utf-8?B?K0M5S3FzeVN5S0loRHNnaWMvcTVIaEYxMzVENksyQkEralZTTGdXYzBaUnE2?=
 =?utf-8?B?b2t4aGlnSjBoNkN3Sm5YRnI5QUY1MkxUVXVJSGxvWGtHU1I5ZjZkaWx0akgz?=
 =?utf-8?B?aCtmekl5SlFDaFFXdWY4akNJU1NSellrVmh6b1pvMEhLU3dNTVJLL0dXclFE?=
 =?utf-8?B?WERjVXorQ2dXRDhoVXN0NDZuT0FpTXJsUGRkNGpJL2djRlF2VDBrMDh4MHpx?=
 =?utf-8?B?MkdrMlh5TTZ3VWtPWnJlbzdMRklnMjZNV0xQUG9qSjFVR2dqaTVvNTVySksy?=
 =?utf-8?B?RjNQMDN3SEV1UG5lVitEUUEwd28zUjZPQ2gvY293ajJONXZqakx1ZHp0c2M0?=
 =?utf-8?B?NkpaTG5EUlBkSGxZN3FXcE05N3NDOVoycXcxRi9MdVNSbFVFNTVvQURVWmpM?=
 =?utf-8?B?YzNTTlMySHZnVGo5R1BUYndOei9IQWdkQWpQOVB6dElSL3JqVDdZRm9EQ0dz?=
 =?utf-8?B?WW9XdkFFMVNtaUYxbzRtRFdmcVJDRjNtc096bjg5Sy9mRDkvRmJHWDIwWXVu?=
 =?utf-8?B?OFcrTEszYWRNMm4xR1V2YU1iU0ovQWZGRkYybVFmQUpsRzlwU0tsdUVYN28x?=
 =?utf-8?B?N1FHbDlSSXFmeWo1eFBSYmJmL21ZTWdsRENzSjExbDFXZGdKWHBQbHlieEUr?=
 =?utf-8?B?b0RlaUVtS0xHblF3RjZFbUFGTWlDOE5tb2F0OVB1UnIxelV6V3I3cXJLcDFv?=
 =?utf-8?B?QjIxeEJidE5KRHRRNWdjRXNaTURqUFN2OTZXSjNuQjJud1dCWWlQVXdsdGl3?=
 =?utf-8?B?WmllVmFIUVR0aWtOaEhUazRub09WUzB0VlN6c2NIcUpUT3VldFZ2b0JWM0NW?=
 =?utf-8?B?SzIzVWN1OGR5VGxwZnhTVG9LMUFPbmMwYkUwTlpjYTFjUlV6TFEwcG9uelI2?=
 =?utf-8?B?MTVKOFBZKzR3eHhMQmRIaFRMUG5SUDBCc3RwbC9UMzdXQmtvUHJLcWMrcWxX?=
 =?utf-8?B?YjA0TmpRNVlYdVovb3FPaDVYMTkxbk5PcW45RGN6elcvL0dnaFR5K3J4clZi?=
 =?utf-8?B?QjcwN2c5NXhJU2lqZkZtNGJHM0ZlZytHV3U3Y0RpeHZBZUc0dVFURTI1bzR2?=
 =?utf-8?B?eDFra2RJMXhjdkszNW9jbE9HNmc2R05ReXZzMkw4TzZTbUNXYVE3VVluWENH?=
 =?utf-8?B?aGVmVDVEaTZtekJYM1lRdXR3bUd4cVJreEdaQnRSN0ROeUlXOGwxdm1jM29I?=
 =?utf-8?B?S05VYnRkZGhkWWwyNjBqNW4xRHRZeWVaUEk4WExHZHJzMldHalpjN2Z5TEtC?=
 =?utf-8?B?bjNvZXQxUEtIN1hpMy9tY2g5Q21Mb1ZST1FoQVl4em8yZHVBcnNsaEI4ZWVz?=
 =?utf-8?B?QlRJQ3pYVmY5QWJXOHZ4VFR6SVJPSlMxMHdEOGU4Q0xlN3VHMkFwRzljZzFE?=
 =?utf-8?B?S2R2U3Jkcis0R1pFczBXdXZxM3RJVldjamJ5Y1NsSHVoeGZJM2hvdXJ5RXI1?=
 =?utf-8?B?RHpHbjNzTWFuOStJWnlpY2Y4VU9UbE9RakUvYTlKd0tsNGFqdDVaL05Wb2Rj?=
 =?utf-8?B?VTcvV1VJdmM4WE9JMzV1d2VYR2VpWjdxd2puNlhtSFhiY1BPcXp2WVJvQW1F?=
 =?utf-8?B?cE5GWmwwM2dqTVZPNEFIVDVWcW9rY3BvdWo1V1h2NzNseVhrUkRjeXhOdGFq?=
 =?utf-8?B?d0lWT0Z5ZVlJcVdaYUtNcGRrcGgrZmFVeUR4Z1pkL3ZBc3ZqZHhLdFUzUmpq?=
 =?utf-8?B?TkpFRllVdGpjOWIwcFM0WFp2Wm1aKy83NThkelhraThhVy8wWXBrbzljR0JE?=
 =?utf-8?B?bjdGdDhlSDZkdVhrVW5sTzJNU2JoUm1QbzZZWmx0TFlJVVczY3Z2c09tNlgy?=
 =?utf-8?B?UTI5NEhtNmpKQ1ZPY2JOQ1VIay9ybGdwaXhXcXlHYWhkQjFvVXo4QVh4S0c5?=
 =?utf-8?B?RCs3R0hPYjhYSGE0TkgwYzVpQklSRVpsMmNmYXJvamc2VmMwa1drTlJTVEQw?=
 =?utf-8?B?RTFaai92L2VaLzJYNUFsUVRadkwzRmlpelZLb3BRTk90cXJaVHRqMnRwa1B5?=
 =?utf-8?Q?77v4m1ONqVH0SUYeyH1ADeM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <868CC519B57705419F74946514EC0E26@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91786cff-aa4e-4eec-4f02-08daa5e072b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 08:14:24.1619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5V/EXTjOccsqYO+vLIjWJrPZxTSKHWtIz3ImMZwcuOBLT4hgSDGIS9zWScKNIcicvGvFduWJMpeVDNYZ6tv/m6qK7H43cNsYsNWzNZusYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2937
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

DQoNCkxlIDA0LzEwLzIwMjIgw6AgMDY6MzEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQgU2VwIDI0LCAyMDIyIGF0IDI6NDcgQU0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjMvMDkvMjAyMiDDoCAxNzo0MSwgTmljaG9sYXMgUGlnZ2lu
IGEgw6ljcml0wqA6DQo+Pj4gV0FSTl9PTkNFIGFuZCBzaW1pbGFyIGFyZSBvZnRlbiB1c2VkIGlu
IGZyZXF1ZW50bHkgZXhlY3V0ZWQgY29kZSwgYW5kDQo+Pj4gc2hvdWxkIG5vdCBjcmFzaCB0aGUg
c3lzdGVtLiBUaGUgcHJvZ3JhbSBjaGVjayBpbnRlcnJ1cHQgY2F1c2VkIGJ5DQo+Pj4gV0FSTl9P
Tl9PTkNFIGNhbiBiZSBhIHNpZ25pZmljYW50IG92ZXJoZWFkIGV2ZW4gd2hlbiBub3RoaW5nIGlz
IGJlaW5nDQo+Pj4gcHJpbnRlZC4gVGhpcyBjYW4gY2F1c2UgcGVyZm9ybWFuY2UgdG8gYmVjb21l
IHVuYWNjZXB0YWJsZSwgaGF2aW5nIHRoZQ0KPj4+IHNhbWUgZWZmZWN0aXZlIGltcGFjdCB0byB0
aGUgdXNlciBhcyBhIEJVR19PTigpLg0KPj4+DQo+Pj4gQXZvaWQgdGhpcyBvdmVyaGVhZCBieSBw
YXRjaGluZyB0aGUgdHJhcCB3aXRoIGEgbm9wIGluc3RydWN0aW9uIGFmdGVyIGENCj4+PiAib25j
ZSIgdHJhcCBmaXJlcy4gQ29uZGl0aW9uYWwgd2FybmluZ3MgdGhhdCByZXR1cm4gYSByZXN1bHQg
bXVzdCBoYXZlDQo+Pj4gZXF1aXZhbGVudCBjb21wYXJlIGFuZCBicmFuY2ggaW5zdHJ1Y3Rpb25z
IGFmdGVyIHRoZSB0cmFwLCBzbyB3aGVuIGl0IGlzDQo+Pj4gbm9wcGVkIHRoZSBzdGF0ZW1lbnQg
d2lsbCBiZWhhdmUgdGhlIHNhbWUgd2F5LiBJdCdzIHBvc3NpYmxlIHRoZSBhc20NCj4+PiBnb3Rv
IHNob3VsZCBiZSByZW1vdmVkIGVudGlyZWx5IGFuZCB0aGlzIGNvbXBhcmlzb24ganVzdCBkb25l
IGluIEMgbm93Lg0KPj4NCj4+IFlvdSBtZWFuLCBqdXN0IGxpa2UgUFBDMzIgPyAoU2luY2UgZGI4
N2E3MTk5MjI5ICgicG93ZXJwYy9idWc6IFJlbW92ZQ0KPj4gc3BlY2lmaWMgcG93ZXJwYyBCVUdf
T04oKSBhbmQgV0FSTl9PTigpIG9uIFBQQzMyIikpDQo+Pg0KPj4gQnV0IEknbSBoYXZpbmcgaGFy
ZCB0aW1lIHdpdGggeW91ciBjaGFuZ2UuDQo+Pg0KPj4gWW91IGNoYW5nZSBvbmx5IFdBUk5fT04o
KQ0KPj4gQnV0IFdBUk5fT05fT05DRSgpIGNhbGxzIF9fV0FSTl9GTEFHUygpDQo+PiBBbmQgV0FS
Tl9PTkNFKCkgY2FsbHMgV0FSTigpIHZpYSBET19PTkNFX0xJVEVfSUYoKQ0KPj4NCj4+IFNvIEkg
ZG9uJ3Qgc2VlIGFueSAuLi5fT05DRSBzb21ldGhpbmcgZ29pbmcgd2l0aCBXQVJOX09OKCkuDQo+
Pg0KPj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/DQo+IA0KPiBIbW0sIG5vIEkgbXVzdCBoYXZl
IG1pc3NlZCBzb21ldGhpbmcuIEkgZ3Vlc3MgaXQgaXMgdGhlIEVNSVRfV0FSTl9FTlRSWQ0KPiBp
biBhc20gd2hpY2ggaXMgdGhlIG1haW4gcHJvYmxlbSBJJ3ZlIHNlZW4uIEFsdGhvdWdoIHdlIGNv
dWxkIHJlbW92ZSB0aGUNCj4gRE9fT05DRV9MSVRFX0lGIGNvZGUgZ2VuZXJhdGlvbiBmcm9tIG91
ciBXQVJOX09OX09OQ0UgYXMgd2VsbCBpZiB3ZSBkaWQNCj4gdGhpcyBwYXRjaGluZy4NCj4gDQoN
ClllcywgSSBndWVzcyBoYXZpbmcgbm93IHRoZSByZWNvdmVyeSBhZGRyZXNzIGluIHRoZSBidWcg
dGFibGUgaW5zdGVhZCBvZiANCnRoZSBleHRhYmxlIGlzIHJhdGhlciBtb3JlIGVmZmljaWVudC4N
Cg0KTWF5YmUgRE9fT05DRV9MSVRFIGNvdWxkIGJlIHJlcGxhY2VkIGJ5IERPX09OQ0Ugd2hpY2gg
dXNlcyBqdW1wX2xhYmVsID8gDQpOb3Qgc3VyZSBpdCBpcyB3b3J0aCBhIHNwZWNpZmljIHBhdGNo
aW5nIGltcGxlbWVudGF0aW9uLCBpcyBpdCA/DQoNCkNocmlzdG9waGU=
