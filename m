Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69C69F08A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 09:42:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM8lq09XSz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 19:41:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PqZeA16u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PqZeA16u;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM8kp249Cz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 19:41:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWgqabTuEu+eWqpXAfI5wMPQ2Tl2OEmM891LRZYjAcZuOJ6C+VvNhmx5HHbunp+gU+LrUc2XTjx70keF84iAX4AkK1tdlyzfs9BGhBFiBTc/iN+nwUmYgol7Cz1fgGRC4FEFhryH2W7G3K+UtKDLc6ifZO8RRUaGFpQuXDPyirBE5qQ0hIogQbod9ZHw4MDAaLpm41/PaeFL2Gx8ZEW+Y+v7gdL/0AFUAlgzK7keWzsXkEg2beULYHi6cbQVeRuGjd3xnRuzJoGv+RRHC86/D02q/ZmG7aBzils+BcR2XlsiJQiruiWor8AIcs8E0gs59yUym4Qp8rNEDZqsDLjc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsnorzsMbNVlYe+MLs53JxmRAEA9qDd8gi9Fdnp+Fww=;
 b=gUMvzW7uKra2n/bwZVRcYdZPh+xNSv6sA62fOUQsHV3E3QfOCpVwZjl0mwkn+U1Y3BQQCLtO5+hd4uZ5Sa+RIs6PvJl9wsn2CVe06PGbZQlYoMKHjaJNSzhJrgb1sHnkH8qcAXyuNU0enKa9ZcIjKMMw/H4BYoKxzaTirTgL2mOUTEKcrRHhCvBlZ1sAIwB8znxYoAyS/Ncl9PDZrRY2yvVcvjJ0+X24xGydYOAbSq9nNFxcg0tiYsXfPW4UYguui+yGvhbndc0ao6sGrfKFEfivkcC30YZHgXl2XVIFJKN/0irDPzy4s0i6DBMBMY0z/lCzZ5DBkdzNsN/A5mFQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsnorzsMbNVlYe+MLs53JxmRAEA9qDd8gi9Fdnp+Fww=;
 b=PqZeA16uJVk7ShPLBDRTSlaXztH0PWZ6XVI0kpa2M6ehpx7aYmAwmIfpWdMPqiP6OarhQvlqW2cNfbLu0+FYjD4Es+3J9cPEImQmFgL4zd9b19P4VnIIaqD/UGJKn303fjaY69odz8sEOhZFg8U8TVCJmHmBNUWqa1fsF4X6N1+6YJI6fM/5WoFtn1X2123WCZXn0rCzf387q9KG7hrnJuFUf8VOn2s0HaLvdvG6FD5zYwGjoODa8l6sk/s81YxgpjjdB4ShY4vo2z41UU9k52uYbdU9LsFjGenqxctDh8d7ugw9JsL8jTwPDgcPr8t5iqU0tJ5db4ez90MtIvJM1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1563.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 08:40:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 08:40:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Topic: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Index: AQHZRoMefDxjCpO3tU+isLH8cV0K1a7aikAAgAAUsgCAAAa8AA==
Date: Wed, 22 Feb 2023 08:40:44 +0000
Message-ID: <b02ddb1b-393f-16f7-1d06-caa99bfd3d20@csgroup.eu>
References: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
 <896436d1-04e4-8019-0f89-f4d4938f9697@csgroup.eu>
 <Y/XPZl8V4/0Bjegy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To:  <Y/XPZl8V4/0Bjegy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1563:EE_
x-ms-office365-filtering-correlation-id: d4c6cbf9-e2be-4f1d-bee2-08db14b07cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BAvI1IqKueD9ye4u36hXS89yKyHGqKrUIY9grp1fjCV3QqqvxwtSq2pC4YxxWBlDh/FyQ8mErt7DjePyPmA5EVHFDwKA6DZJUbaLGWHJzKpa86h2Pkd0vlFmLiDlSD0cqJkUjIjlrByPo7tr0QSFOxpX8Seg05dySicKO0ORJFyJuOqFFqyJZNdPKVmnwBqrH8cWGsPwDY744B8oUwxYLPe7lD90BM+MlCekxUbKuA3/Wcz1eZc6Le/r1ct97sjRTEu4SleTNU7k6ABoOzagOaVt+FRJNnfpAwymkBqcik2q96B0bOUf+UStnd8VD2WlFGW+fAYEXQrKe5bjGhveTzxLniEPUMgGU4fN2pWL9FIZgjQLSe+uG4/YpC55+U8M1t3TllwUYJVvqge1vqXXnROS2eA16EVbZEW1i70MQUFiBHqBMloX9xTvAcmG0HqdSKSue+bt6WlfWFBycSHZPUz6ifwSI97WnDHeQ3wr+ZQN5klgTl32+BPJ7Rr4B6DTNb5PPEV3/HMSV91LaHZB+Lb9nkXAOuLUheucPDYbS4MPuTM7A+9CTuGePtdXO6T37ItnzUa9qVk0QFGy8zFhjioaijjTH3DyxSjuvOyfbhkD8Zn+vSC8E5hQvYNpTowHZtLjiTflcReBecV3sbHt7Ds5E9hnpbGF4EISIGt8yI8tTrCfDQh+J1yiIS030XB9ukjfIdK9KesWfh5PMacwCRL/7aPvz7iq9+9hJ52cbka6WjuVujvcBI9E4JKmbUIc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(451199018)(316002)(83380400001)(54906003)(66574015)(478600001)(122000001)(38100700002)(44832011)(36756003)(2906002)(86362001)(31696002)(38070700005)(64756008)(91956017)(76116006)(66946007)(66476007)(66556008)(66446008)(8676002)(6916009)(4326008)(8936002)(41300700001)(5660300002)(2616005)(966005)(6486002)(186003)(26005)(71200400001)(31686004)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SjRETElXSjVDTnJnVTZ6elN6MFRmRFJuUnJtejByWlB6WXJKVHVKYzY2enVj?=
 =?utf-8?B?WitMalQvRENZdWRFSko1THkrUkpiS3BGZVJrNHo5YlE5akxtWHRQbS9raHM5?=
 =?utf-8?B?dW0zZUx2YzdjbkR2YTRQVHF2d21ZUFdGUkM3MlEzbTVjUnhvRDNwZTIyUjVO?=
 =?utf-8?B?TVpRNTNxNm1Za2xuVEFjc3FDdVdyeUZoeC9Ecy9sWWY0NmtwSE9GWkQ4a2Rk?=
 =?utf-8?B?TnpBZm9wMFNwR0pNVE1iZ3hacTVYb2h5dENLelI2SDlWVWZ1MmpoN0t3L3hP?=
 =?utf-8?B?SzgrS2RLQXBEUFlvZ1lMVElpUjEvYkFsWWJUTmdUSjdkYkNhR1lKV2ppNU5H?=
 =?utf-8?B?TnZDOGhxd3JDSEdpakZaaWpmMkkxazNPc1JkbzROL2hMcUdEUmVTSm14VHM4?=
 =?utf-8?B?ZFVWVmh1QTBIbE43MUpIQko1aDcyeVd4a2pYWFdSSVQ5cnhueDhiTkg1N0V2?=
 =?utf-8?B?Z3ByQ3NydWZtNGJrUjFlWmIvNlBWcDJJOXpaWEFHdnVUbzNLOVhhOFpaa3RH?=
 =?utf-8?B?RmRGWThGWGdud05WQS9zRytoNnIzbGtoN2x0QmdRSWJGVG1YellkMXRmdUZE?=
 =?utf-8?B?c1Q2QXMraTdOZG1LSmNIS3ZCQUZjYW85WnBZZXlELzZZNlFTdVA2U2l1UWRt?=
 =?utf-8?B?RlZRcVZLbnU2b2d6NTY5cG9WUnJ6YmtuQXF3SENtTFRGNFhoOStLKzdUNjJ3?=
 =?utf-8?B?L3FGenJ4YjBOT09zdzdEb3E3OCtIbTRKY3UrS1hlaUgxWGROMzZuRTZZb1Jm?=
 =?utf-8?B?THdCOUpoYTZyT1dMT3lVQ243VXJ6UVBpZEhWaWZtL0VtUFhGa0hUMWFkT1BK?=
 =?utf-8?B?eU0xeFNKM2kwVzFoZVpwd1JqaDdyZ3VjQnZ5TU1tM2ZNZ3Z3TnZUVG9wM0Zn?=
 =?utf-8?B?TzZmTGhnNW5KV0N5Z1Q4bm9JeFBKWktYSkR2QTJIZzRLb08rQ2RSVFVlaGQ5?=
 =?utf-8?B?Y0NjMTFVSmVHWTRoVTRkZTg5UWJBQXFCcUR6dEJibWJuWmUycFJzQlVRL1Rz?=
 =?utf-8?B?RU91dndkUWJnTGd6cllQT1duU1krSEJVSmQ4ZWk0ZzlWZk1qV1dxU1AxUGp1?=
 =?utf-8?B?V2ljeEpKa3FNc2V0TlNrb1FZak9zSUU5WmErYW01QzF0Vm5xc002djFVL2tI?=
 =?utf-8?B?MVhxcTdTMURNZUQ1Z0pJNXVkdEY3Y25uZzJqUCtFOVl5d2t3b2dyYVJnTENM?=
 =?utf-8?B?RkpxV0lSTkhNdWY4bHFLby9OZndrUjgwSGgvd004Ynp2ZldSWmNMSlhtQU9l?=
 =?utf-8?B?TXJ5YVk0VmZVMFI4c0NSQVlRWE1UWUNYUDQ0aFZhc1owWEZHN2U4Tk5jc2sy?=
 =?utf-8?B?RHc4WWhMdWxtYi9yZS9FZVJ5VTFKUExoczluMk0rU1QvL2FiOE1VQk0ydC9O?=
 =?utf-8?B?dlRabUtoY2lhdHN4NHVvWHNWZ1NBYnNTcGtOYWhyTWt1bGQwWmVrUzMvMXFD?=
 =?utf-8?B?YnVIYVdDWlZObGdKalRidEhPS3VzWmc1Z2lJVjRENkdOWjVHbUE0VTJpaUlV?=
 =?utf-8?B?NTdtK3Z4T1VsUDhKb3FpdWY0VWV3MG5hQWJ4YTB5bHI5V3puQjA1TEVMeGNv?=
 =?utf-8?B?NGVsalVGZldTL0s1WDFWL2NkY3d1VncvOEpWdStSTUFzYWlxaDcwdE1mMEds?=
 =?utf-8?B?bFBGNlhuckVJa0VLMUd0T2l1V01qYVFqbXQzaFZQM1FkL2U2V1pUK3pOY3ZU?=
 =?utf-8?B?N1BZWUFXYllyMVdTcFd4Wlptd2llend4Wm5tVFA5WFBlYWNmcnpCcjdzc3B2?=
 =?utf-8?B?ck5QS0NQTmxjQnJkMUhnWm9HdkdmMFY0YzVKUUtCTGV5V2ZWamp3K1JoVFR1?=
 =?utf-8?B?Q1ZHZnJUYWtWT2VzNHpHS0RFcE9uTnpDTkwySmRZazBLNGlWdWROejBoSzYy?=
 =?utf-8?B?eitRWWJIc2RBYXltcTFJbVNHWlNlVG1mendkZmhyTHhZUlhSNWlOSG5LMWw2?=
 =?utf-8?B?d2ZXUTRkSXovSlJnc2FCd2pZUlB3STB0R1hVOVU3a3N0OXpUaXhBSTJyWkFV?=
 =?utf-8?B?VjZNcFJjNTgyc2htc0wwRHVVNEV5MWorV1FLdFFRd2J5NVVmbnp2RWptNzdP?=
 =?utf-8?B?bXE5T0gyWVlxbGhwZFczYXBQaEErbkdZcGNSOVFqK1ZoZ01oenY4T2pzSW1T?=
 =?utf-8?B?cURYK2xEVXBmaUlrZUt3b0FCTmp1WnNEdVFYdmtmWFRlWjE0K0N2cHNYam54?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A588A9927C9EF34E8D756676FC534B4E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c6cbf9-e2be-4f1d-bee2-08db14b07cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 08:40:44.3362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kuKhNjbBCwPM7q1dPCNBtEfM9BkuZxPzdVbYBVFTH2bcAMVD8UdoomCYl4MoSmngGxzO3GDf0ltSq1/x8zwPa//6b93tSOWSJOhfYvbrHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1563
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMDk6MTYsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCBGZWIgMjIsIDIwMjMgYXQgMDc6MDI6MzRBTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjIvMDIvMjAyMyDDoCAwNzowMSwgS2F1dHVrIENvbnN1
bCBhIMOpY3JpdMKgOg0KPj4+IEEgbGluayBmcm9tIGlibS5jb20gc3RhdGVzOg0KPj4+ICJFbnN1
cmVzIHRoYXQgYWxsIGluc3RydWN0aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8gX19sd3N5bmMN
Cj4+PiAgICBjb21wbGV0ZSBiZWZvcmUgYW55IHN1YnNlcXVlbnQgc3RvcmUgaW5zdHJ1Y3Rpb25z
IGNhbiBiZSBleGVjdXRlZA0KPj4+ICAgIG9uIHRoZSBwcm9jZXNzb3IgdGhhdCBleGVjdXRlZCB0
aGUgZnVuY3Rpb24uIEFsc28sIGl0IGVuc3VyZXMgdGhhdA0KPj4+ICAgIGFsbCBsb2FkIGluc3Ry
dWN0aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8gX19sd3N5bmMgY29tcGxldGUgYmVmb3JlDQo+
Pj4gICAgYW55IHN1YnNlcXVlbnQgbG9hZCBpbnN0cnVjdGlvbnMgY2FuIGJlIGV4ZWN1dGVkIG9u
IHRoZSBwcm9jZXNzb3INCj4+PiAgICB0aGF0IGV4ZWN1dGVkIHRoZSBmdW5jdGlvbi4gVGhpcyBh
bGxvd3MgeW91IHRvIHN5bmNocm9uaXplIGJldHdlZW4NCj4+PiAgICBtdWx0aXBsZSBwcm9jZXNz
b3JzIHdpdGggbWluaW1hbCBwZXJmb3JtYW5jZSBpbXBhY3QsIGFzIF9fbHdzeW5jDQo+Pj4gICAg
ZG9lcyBub3Qgd2FpdCBmb3IgY29uZmlybWF0aW9uIGZyb20gZWFjaCBwcm9jZXNzb3IuIg0KPj4+
DQo+Pj4gVGhhdHMgd2h5IHNtcF9ybWIoKSBhbmQgc21wX3dtYigpIGFyZSBkZWZpbmVkIHRvIGx3
c3luYy4NCj4+PiBCdXQgdGhpcyBzYW1lIHVuZGVyc3RhbmRpbmcgYXBwbGllcyB0byBwYXJhbGxl
bCBwaXBlbGluZQ0KPj4+IGV4ZWN1dGlvbiBvbiBlYWNoIFBvd2VyUEMgcHJvY2Vzc29yLg0KPj4+
IFNvLCB1c2UgdGhlIGx3c3luYyBpbnN0cnVjdGlvbiBmb3Igcm1iKCkgYW5kIHdtYigpIG9uIHRo
ZSBQUEMNCj4+PiBhcmNoaXRlY3R1cmVzIHRoYXQgc3VwcG9ydCBpdC4NCj4+Pg0KPj4+IEFsc28g
cmVtb3ZlZCBzb21lIHVzZWxlc3Mgc3BhY2VzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogS2F1
dHVrIENvbnN1bCA8a2NvbnN1bEBsaW51eC52bmV0LmlibS5jb20+DQo+Pj4gLS0tDQo+Pj4gICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaCB8IDEyICsrKysrKysrKy0tLQ0KPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4N
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmgNCj4+PiBpbmRleCBlODBiMmMwZTkzMTUu
LjU1M2Y1YTVkMjBiZCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
YmFycmllci5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaA0K
Pj4+IEBAIC00MSwxMSArNDEsMTcgQEANCj4+PiAgICANCj4+PiAgICAvKiBUaGUgc3ViLWFyY2gg
aGFzIGx3c3luYyAqLw0KPj4+ICAgICNpZiBkZWZpbmVkKENPTkZJR19QUEM2NCkgfHwgZGVmaW5l
ZChDT05GSUdfUFBDX0U1MDBNQykNCj4+PiAtIyAgICBkZWZpbmUgU01QV01CICAgICAgTFdTWU5D
DQo+Pg0KPj4gVGhpcyBsaW5lIHNob3VsZG4ndCBiZSBjaGFuZ2VkIGJ5IHlvdXIgcGF0Y2gNCj4g
SSBtZW50aW9uZWQgaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiBCdXQgaWYgeW91IHdhbnQg
SSdsbCByZW1vdmUgdGhpcy4gRGlkIHRoaXMgYmVjYXVzZSB0aGUgcmVzdA0KPiBvZiB0aGUgZmls
ZSBkb2Vzbid0IGhhdmUgdGhlc2Ugc3BhY2VzLg0KPj4NCj4+PiArI3VuZGVmIHJtYg0KPj4+ICsj
dW5kZWYgd21iDQo+Pg0KPj4gSSBzZWUgbm8gcG9pbnQgd2l0aCBkZWZpbmluZyBzb21ldGhpbmcg
YW5kIHVuZGVmaW5pbmcgdGhlbSBhIGZldyBsaW5lcw0KPj4gbGF0ZXIuDQo+Pg0KPj4gSW5zdGVh
ZCwgd2h5IG5vdCBkbzoNCj4+DQo+PiAjZGVmaW5lIG1iKCkgICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoInN5bmMiIDogOiA6ICJtZW1vcnkiKQ0KPj4NCj4+ICNpZiBkZWZpbmVkKENPTkZJR19QUEM2
NCkgfHwgZGVmaW5lZChDT05GSUdfUFBDX0U1MDBNQykNCj4+ICNkZWZpbmUgcm1iKCkJKHtfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoImx3c3luYyIgOiA6IDogIm1lbW9yeSIpOyB9KQ0KPj4gI2RlZmlu
ZSB3bWIoKQkoe19fYXNtX18gX192b2xhdGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5Iik7
IH0pDQo+PiAjZWxzZQ0KPj4gI2RlZmluZSBybWIoKSAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJz
eW5jIiA6IDogOiAibWVtb3J5IikNCj4+ICNkZWZpbmUgd21iKCkgIF9fYXNtX18gX192b2xhdGls
ZV9fICgic3luYyIgOiA6IDogIm1lbW9yeSIpDQo+PiAjZW5kaWYNCj4+DQo+IEkgdGhvdWdodCBv
ZiBkb2luZyB0aGF0IGVhcmxpZXIsIGJ1dCB0aGVyZSBleGlzdHMgb25lIG1vcmUgI2VsaWYNCj4g
Zm9yIENPTkZJR19CT09LRSBhbmQgdGhlbiB0aGUgI2Vsc2UuDQo+IFRoYXQgd2F5IHdlIHdvdWxk
IGhhdmUgdG8gcHV0IDMgZGlmZmVyZW50ICNkZWZpbmVzIGZvciBybWIgYW5kIHdtYg0KPiBhbmQg
SSB3YW50ZWQgdG8gYXZvaWQgdGhhdC4NCg0KTm8sIEkgZG9uJ3QgbWVhbiB0byB1c2UgdGhlIGV4
aXN0aW5nICNpZmRlZi9lbGlmL2Vsc2UuDQoNCkRlZmluZSBhbiAjaWZkZWYgLyNlbHNlIGRlZGlj
YXRlZCB0byB4bWIgbWFjcm9zLg0KDQpTb21ldGhpbmcgbGlrZSB0aGF0Og0KDQpAQCAtMzUsOSAr
MzUsMTUgQEANCiAgICogSG93ZXZlciwgb24gQ1BVcyB0aGF0IGRvbid0IHN1cHBvcnQgbHdzeW5j
LCBsd3N5bmMgYWN0dWFsbHkgbWFwcyB0byBhDQogICAqIGhlYXZ5LXdlaWdodCBzeW5jLCBzbyBz
bXBfd21iKCkgY2FuIGJlIGEgbGlnaHRlci13ZWlnaHQgZWllaW8uDQogICAqLw0KKyNpZiBkZWZp
bmVkKENPTkZJR19QUEM2NCkgfHwgZGVmaW5lZChDT05GSUdfUFBDX0U1MDBNQykNCisjZGVmaW5l
IF9fbWIoKSAgIGFzbSB2b2xhdGlsZSAoImx3c3luYyIgOiA6IDogIm1lbW9yeSIpDQorI2RlZmlu
ZSBfX3JtYigpICBhc20gdm9sYXRpbGUgKCJsd3N5bmMiIDogOiA6ICJtZW1vcnkiKQ0KKyNkZWZp
bmUgX193bWIoKSAgYXNtIHZvbGF0aWxlICgibHdzeW5jIiA6IDogOiAibWVtb3J5IikNCisjZWxz
ZQ0KICAjZGVmaW5lIF9fbWIoKSAgIF9fYXNtX18gX192b2xhdGlsZV9fICgic3luYyIgOiA6IDog
Im1lbW9yeSIpDQogICNkZWZpbmUgX19ybWIoKSAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzeW5j
IiA6IDogOiAibWVtb3J5IikNCiAgI2RlZmluZSBfX3dtYigpICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoInN5bmMiIDogOiA6ICJtZW1vcnkiKQ0KKyNlbmRpZg0KDQogIC8qIFRoZSBzdWItYXJjaCBo
YXMgbHdzeW5jICovDQogICNpZiBkZWZpbmVkKENPTkZJR19QUEM2NCkgfHwgZGVmaW5lZChDT05G
SUdfUFBDX0U1MDBNQykNCg0KDQoNCj4+IEJ5IHRoZSB3YXksIHdoeSBwdXQgaXQgaW5zaWRlIGEg
KHsgfSkgPw0KPiBjaGVja3BhdGNoLnBsIGFza3MgZm9yICh7fSkuDQo+PiBBbmQgSSB0aGluayBu
b3dkYXlzIHdlIHVzZSAiYXNtIHZvbGF0aWxlIiBub3QgIl9fYXNtX18gX192b2xhdGlsZV9fIg0K
PiBJIHdhcyBqdXN0IGZvbGxvd2luZyB3aGF0IHdhcyB0aGVyZSBpbiB0aGUgZmlsZSBhbHJlYWR5
Lg0KPiBDYW4gY2hhbmdlIHRoaXMgaWYgcmVxdWlyZWQuDQo+Pg0KPj4gU2hvdWxkbid0IHlvdSBh
bHNvIGNvbnNpZGVyIHRoZSBzYW1lIGZvciBtYigpID8NCj4gTXkgY2hhbmdlIHdhc24ndCBtZWFu
dCB0byBhZGRyZXNzIG5ld2VyIHVzYWdlcyBvZiBhcyB2b2xhdGlsZQ0KPiAjZGVmaW5lcy4gSSBq
dXN0IHdhbnRlZCB0byByZWRlZmluZSB0aGUgcm1iIGFuZCB3bWIgI2RlZmluZXMNCj4gdG8gbHdz
eW5jLg0KDQpUaGF0J3MgbXkgcG9pbnQsIHdoeSBub3QgYWxzbyByZWRlZmluZSBtYiB0byBsd3N5
bmMgPw0KDQo+Pg0KPj4gTm90ZSB0aGF0IHlvdXIgc2VyaWVzIHdpbGwgY29uZmxpY3Qgd2l0aCBi
NmUyNTkyOTdhNmIgKCJwb3dlcnBjL2tjc2FuOg0KPj4gTWVtb3J5IGJhcnJpZXJzIHNlbWFudGlj
cyIpIGluIHBvd2VycGMvbmV4dCB0cmVlLg0KPiBJIHRob3VnaHQgb2YgZGVmaW5pbmcgdGhlIF9f
cm1iIGFuZCBfX3dtYiBtYWNyb3MgYnV0IEkgZGVjaWRlZCBhZ2FpbnN0DQo+IGl0IGJlY2F1c2Ug
SSBkaWRuJ3QgdW5kZXJzdGFuZCBrY3NhbiBjb21wbGV0ZWx5Lg0KPiBJIHVzZWQgdGhlIHN0YW5k
YXJkIExpbnVzJyB0cmVlLCBub3QgcG93ZXJwYy9uZXh0Lg0KPiBDYW4geW91IHRlbGwgbWUgd2hp
Y2ggYnJhbmNoIG9yIGdpdCByZXBvIEkgc2hvdWxkIG1ha2UgdGhpcyBwYXRjaCBvbiA/DQoNCmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bvd2VycGMvbGlu
dXguZ2l0DQoNCidtZXJnZScgYnJhbmNoIGlzIGEgbWVyZ2Ugb2YgYnJhbmNoZXMgJ21hc3Rlcics
ICdmaXhlcycgYW5kICduZXh0Jy4NCg0KVGhhdCdzIHRoZSBicmFuY2ggdG8gdXNlLCBhbGx0aG91
Z2ggaXQgaXMgbm90IGFsd2F5cyBpbiBzeW5jIHdpdGggZml4ZXMgDQphbmQgbmV4dCwgaW4gdGhh
dCBjYXNlIGFsbCB5b3UgaGF2ZSB0byBkbyBpcyB0byBsb2NhbGx5IG1lcmdlICduZXh0JyBhbmQg
DQonZml4ZXMnIGJyYW5jaCB1bnRpbCBpdCdzIGRvbmUgcmVtb3RlbHkuDQoNCkJ1dCBqdXN0IHVz
aW5nICduZXh0JyBicmFuY2ggYWxzbyB3b3JrcyBtb3N0IG9mIHRoZSB0aW1lLg0KDQpOb3RlIHRo
YXQgJ25leHQnIGJyYW5jaCBzaG91bGQgYWxyZWFkeSBiZSBwYXJ0IG9mIGxpbnV4LW5leHQgc28g
eW91IG1heSANCmFsc28gdXNlIGxpbnV4LW5leHQgaWYgeW91IHByZWZlci4NCg0KPj4NCj4+PiAr
LyogUmVkZWZpbmUgcm1iKCkgdG8gbHdzeW5jLiAqLw0KPj4NCj4+IFdIYXQncyB0aGUgYWRkZWQg
dmFsdWUgb2YgdGhpcyBjb21tZW50ID8gSXNuJ3QgaXQgb2J2aW91cyBpbiB0aGUgbGluZQ0KPj4g
YmVsb3cgdGhhdCBybWIoKSBpcyBiZWluZyBkZWZpbmVkIHRvIGx3c3luYyA/IFBsZWFzZSBhdm9p
ZCB1c2VsZXNzIGNvbW1lbnRzLg0KPiBTdXJlLg0KPj4NCj4+PiArI2RlZmluZSBybWIoKQkoe19f
YXNtX18gX192b2xhdGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5Iik7IH0pDQo+Pj4gKy8q
IFJlZGVmaW5lIHdtYigpIHRvIGx3c3luYy4gKi8NCj4+PiArI2RlZmluZSB3bWIoKQkoe19fYXNt
X18gX192b2xhdGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5Iik7IH0pDQo+Pj4gKyNkZWZp
bmUgU01QV01CICAgICAgTFdTWU5DDQo+Pj4gICAgI2VsaWYgZGVmaW5lZChDT05GSUdfQk9PS0Up
DQo+Pj4gLSMgICAgZGVmaW5lIFNNUFdNQiAgICAgIG1iYXINCj4+DQo+PiBUaGlzIGxpbmUgc2hv
dWxkbid0IGJlIGNoYW5nZWQgYnkgeW91ciBwYXRjaA0KPj4NCj4+PiArI2RlZmluZSBTTVBXTUIg
ICAgICBtYmFyDQo+Pj4gICAgI2Vsc2UNCj4+PiAtIyAgICBkZWZpbmUgU01QV01CICAgICAgZWll
aW8NCj4gT2suIENhbiBjaGFuZ2UgbXkgcGF0Y2guDQo+Pg0KPj4gVGhpcyBsaW5lIHNob3VsZG4n
dCBiZSBjaGFuZ2VkIGJ5IHlvdXIgcGF0Y2gNCj4+DQo+Pj4gKyNkZWZpbmUgU01QV01CICAgICAg
ZWllaW8NCj4+PiAgICAjZW5kaWYNCj4gU3VyZS4gV2lsbCByZXRhaW4gdGhpcyB0b28uDQo+Pj4g
ICAgDQo+Pj4gICAgLyogY2xhbmcgZGVmaW5lcyB0aGlzIG1hY3JvIGZvciBhIGJ1aWx0aW4sIHdo
aWNoIHdpbGwgbm90IHdvcmsgd2l0aCBydW50aW1lIHBhdGNoaW5nICovDQo=
