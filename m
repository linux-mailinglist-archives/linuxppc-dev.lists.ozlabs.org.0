Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D86162C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 13:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2RFx538gz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=rhHGY96Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=rhHGY96Z;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2RDx0DGgz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 23:35:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI6AXpP5tkpNmh7bLYv05W/epxAAXno5bDGb3sBZFJFSriIXj9BA8nm5jcgShDHN/VZSc7LizvfbO9KyMteEuFWhB27cUhMxipjzM0JqMUym2xkyGtZ/2sIPMgxb94/cAWeR8dLVEq/Go3ty6faW7DjgKDlb4umKbORsGRZ3LUIf2KUGhbvjUV/vpDGLhwlc+doZ3C6wa1C3VyFzfYwdj7TaD9xqSSvyFYstWC/J5cRhy/LTGSL6+L2/22wDCb+EI+0IDhQyN5HAuYYZ5g141PrdHrLTL1EqV5Mc26kWO/gLrKQLrVI8JhA/FRvOYUSlUwjJlD+Ym/oUZRmYLaXWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bxvp/h7SEq67eA++lriTziDGVzsKNwi3KcJX1zGO74=;
 b=VCuwMaRLxKW+XO4Fr2UsGmVi7fEsZ00EmtPov2u0JVXbm7T6eNV0wO3tEHybYTW1zLH1y+3peIwbMvXg9DHnsXoWR/VVHzPGqKdJeDGju11wlq5stJWUy5qg2UeLBQApyYE5TFeAmASIvJKbzOVWO3wLUaJfSsvwqoojS8EkM9NIrAVZpqBWthIgHH412ULD6WNabU27BmZ+MZKnMQ9GYEO3gxRuQeJqYfrRmqUKdq1FzrajCqsiriTspYFMiSerldgmOEC8hAny/68NAzIyUQPeioqD+15/+KF6A9ddTRxZkuA7ZGyqAGeBfd20IWMF5uHwmHhrhS9KxxiRAaRByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Bxvp/h7SEq67eA++lriTziDGVzsKNwi3KcJX1zGO74=;
 b=rhHGY96ZfSYa5CyDoGstSwwFAQ0aoW6Bop54WGw2/fQpalrb6u2HyONAzxb8lwO+IBUkTlHc9rKuprqs8TknKPAeg5rHrcNmsYREZChAM6voqScnC8g+Z1R2At9k36CNkt03oCDSRJElhNZk4Tuwu1osQzk9KiM3BvGlZ2u7q7zOkEhY9kAPzl5zlaobfhVB2VJA9abRttEnBYbrthyMKDGmxyISbp5+V0MbdBYgq29RNFsGFl0kK9WzH3DcoKpys+02pM1OnjygpnxhMIfd/Pq9Una4SydDhT5Erh4rXf3f8LO7zJLsE4GCVZi3WvhHmrdSp3N3CgQsatj+9dKl2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1597.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 12:35:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 12:35:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Thread-Topic: [PATCH v5 02/16] powerpc: Override __ALIGN and __ALIGN_STR
 macros
Thread-Index: AQHY6tphEWIcPxSR20K5NwF8coXsna4rmV4A
Date: Wed, 2 Nov 2022 12:35:07 +0000
Message-ID: <327c371a-a8f4-1676-3da8-f454612b5c58@csgroup.eu>
References: <20221028143346.183569-1-sv@linux.ibm.com>
 <20221028143346.183569-3-sv@linux.ibm.com>
In-Reply-To: <20221028143346.183569-3-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1597:EE_
x-ms-office365-filtering-correlation-id: 21fa2336-eb04-4c01-916e-08dabcceaca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0SnCkYJgQKUXIrB7mXxvAkSUVgMQPUfJj0y6EzZtA3FWAL6mnoGKSNsyIMYZJ6A7rOfoUVOa6T3atPkmzYPqilAl4Secs9K3vsm7JTwmYs5g5cfMOqL8ss50KVjTxeY+67SPCcb/R1YhC2xtzw8s340tE4xxnBJTcGaKhFgo6hfChFBDuZ0UAChYL3CwFOVBkw9XjqubBo5xGhVWhj+1haoDtlh2PRE+g4TH9DGgSaJUXJAX7vvUndCuDa8mXRDAAcSKHOwxJGFSgigeTUCbNpdgGfn20KAp9e2Lk+Q9jV7pRpWDyxm89ziyMvC6THUPPJF6wi6ggi9hPthLGKxiNxtmfN+1vwHpbSeqihSbRE3Rj6wAkCkXA9CeAa6r6snN2CwVl0RNv5qSwWzZL39BRXa1A1tcI6Eyr8pkFt6CSnHrErBJbayL1/ZwrzLCEzShtehcsnFUu8pRGhVbu0eZwgjJ+GJfHnsfvpGt1YKj47LAzzQFfOqaFd2BELXW+rd9je5MPAD8bMS3n3DPFPNeS3SNV08Ud9gl2EEvuHfayinL9xfw3hCTbgzwd33v5l19jlt3KfxRxREOWF046HYV6Yon/8KGWBxVMzAaDLZbbLT6hBBH+NOFaYbCo2U4BhPMFZWY8cnERQeXPu78FNHia+T5x+TknZu+SFStss31k7/r0/sOXKo6gCNd9osKreR6bjcEXAsAbXKppG92fFtv1PcMilrudvSbtzSAh4oa1UbM79+voNlayn0hcjynkReHtI6gHfavo8BC091SHMZffIyCOs6Z5vIVExdQAuMcpecgrj2S1n5WPne8iAp6zbWDTHruMwXjjcqkcMEVRtw0Cw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39850400004)(346002)(366004)(451199015)(38100700002)(38070700005)(4326008)(36756003)(31696002)(86362001)(2906002)(71200400001)(44832011)(6486002)(6506007)(64756008)(316002)(91956017)(66946007)(8676002)(66556008)(66476007)(66446008)(5660300002)(8936002)(7416002)(110136005)(122000001)(41300700001)(54906003)(76116006)(186003)(2616005)(478600001)(6512007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZTJYbk1acXA2N25vUHZnUXhKUjVRK2owa3ZZRTdPN2RNc1FxdTd6TXNsVk1i?=
 =?utf-8?B?NWk1NGxleUZIZGo3aWlualRYMDBLVmxiQkhadWUvdTNUV2dqbitUNm9RVGNP?=
 =?utf-8?B?MjR2a3EyU2Y3RHJNYndDejdKZkxMWWJYbURLVmxiU3BrcEhSTkRwc1F4VERi?=
 =?utf-8?B?RHZQVllvZ0xiUlpWbnorcDFOK3Y0VDVyUGI5cWk5bFNhbEUxaVRrZXhjQkRR?=
 =?utf-8?B?eHBxa3NvdVF0RGFpZVZETG1SUDR2ODRZWk1JUlVRTTdaY2c2d2VEY05ZNWJW?=
 =?utf-8?B?UkxXQWQxR2Q0ZnQ1WmhUZ1lqMjN3VnBETmpGTXJwU21hNDRYZHZ1a1ZJWkcr?=
 =?utf-8?B?NXRPYlRVWnF5dzJXeGVXd2YwdnkzeUhGcTlFVEZJL28zYVphcDY4NHNybE0v?=
 =?utf-8?B?bGpBZUQ3WmVOd1lweHlqdDBVTzY0TXVUa3dxV2NQR2t4d2lNWExYRE5WcU5u?=
 =?utf-8?B?b29zaHhHTkU1OHZvUGZaWUswUnBFdkttRWRabUxpMVVUNWhNblBXODExWXhM?=
 =?utf-8?B?VzRjYXBqc1Rac3hsM2dYN21OaThybTZsUUFCM1lBRnI2MmVCSGI3T2M1S1ZU?=
 =?utf-8?B?OHl1THZvb1ppeUtRNlFzWXg4NnFMQXlhcmpEZmRQZjlydlBFT256V01LUkZ1?=
 =?utf-8?B?MTQxZktWVDlvZURpajE3M0RQQW5NUWtPWTBSU1BDVGhKMWpsOHF3QWJFTW43?=
 =?utf-8?B?MWtERmgrQ2JDUmJGdzREZ2lxekprUDlwa1ozaUp4QUVQeEhyY1RkaDJkaVAz?=
 =?utf-8?B?ZXppNmx1aURSdTRDN1VHaGt4clFuaDliOWEwZnZrVWI4WkR0K0JKYjhvRnBV?=
 =?utf-8?B?Y3ZGZmVKUzNjTkRoeUhiWTZCS09NdHo4dkRBMkt5Mmd0TVlGSU1vQUVKTzBa?=
 =?utf-8?B?bzlWbmJZbWcwZTRERkl6dW5OT2t4RkV6WXJ3WHhCYy9BRE9Sdmt5M01oQjNH?=
 =?utf-8?B?WWV5UG84R0t2dXR5L0cxbmF3WVdtUWxmQVZQY0FZRU9SRnZyMVJiazZnWm44?=
 =?utf-8?B?TG5DdmowVVJ6WnVIRVFGcjNnS0hELzRPUnZINzNDd2xSTWNyczNuNzRxdkxC?=
 =?utf-8?B?a1RqWnBwaVorWStCcVowVkhmWEM1UUFzRGVRRzNCMWZZc3J5VkZnZ3Q3R1BJ?=
 =?utf-8?B?Rm1ubUw3MjRrSU56VzJ4THpGWnhSck5UOUxRVmJGa0dFOW9VYVNSUk9GUDg4?=
 =?utf-8?B?bzNpR0dqZHFsc0JVcEZHdVkvQnB2YVJLSGFyWGVXays1WkNiVTQ3NTQxSVp6?=
 =?utf-8?B?ci8rc2NObGJGRXZGdTZkdkJubUhkK2ZOdnl4SEs0U2kvMHZmeWZ4Y0NVczNX?=
 =?utf-8?B?d2pBT01tTHl0MnBxc2xhUXJzbTJ4TTlHOVdHTVQ5UEZWcUQvRTR1emZXV0pR?=
 =?utf-8?B?RzlxUWc5QVU4MUwySnQ2VGtUTmxEMnZEeWR3QjBQcU94b2RmOStsMWQvYlJJ?=
 =?utf-8?B?VU5hQ05obHpDRUNIZVA4ZFVNVC9MbTVKemdWMEVGdzhkbXRkVVZEK0tJVWhD?=
 =?utf-8?B?S09tc0o3K1hzdXIwVGQ1V09lYnB6ZW1NUDVrUDdKUmMrV0c0dlRtSVUvZzBt?=
 =?utf-8?B?bjQ1MndNZlJmYmZnZVdEbWEzN09WYnJ5OHRXNVVzTmRNN0VhejZPNUoySUkr?=
 =?utf-8?B?MmU4Y3lNdEdtcHBGQUk3U1gwVTIxcEdtNDl3aU10Y0N2M0gzR0grNFA1TEN6?=
 =?utf-8?B?Sk9nMkN4MG9DTW1tWHdHQm9XY280YWxtTGlFKzdDY3BvL1NoRy9ZcUJRYVM1?=
 =?utf-8?B?VHl5SkVaeU9rZVhhNzVKSHJLZU1EUTNCNlBkMlhjNEQyUlVGYzBRTTBsdURk?=
 =?utf-8?B?eFdFVnZpbyswcHY1eW1sK1h0VGVteXo3eEFMZ2VPTEV4U2U1WVk5RVY3T2FB?=
 =?utf-8?B?R1RRQlJNeGRsS3AzNXltaUM4dk93SklHRlc1VU9veEowdWE0SmtxdHY1TkJu?=
 =?utf-8?B?SDhMeVRUaVRRUS9sVkxMTFdDQzNiMFZzSURjSFRvditjbTBBN0F5UEx2a0hL?=
 =?utf-8?B?RW0yQlFJMHV5QzVvVnY1UU1YNGNyMWQyZDhLc216Ymo3L2E0eS9adXZCelAy?=
 =?utf-8?B?U292NXRZdXRVMzdteWlTcjJ2aUtrSHZOMDVHNk91aG1VTUE0OWdSQkdiWnZH?=
 =?utf-8?B?Ti9WY1lUczJUL1RkNFVNTloremtTbVlIa2JUT0llOE9lSTNhWVVjaE01ajhP?=
 =?utf-8?Q?CDcv3lH0FbPZgQmPpw+L998=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75AD33305E25094984D6BD7B6482DF9D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fa2336-eb04-4c01-916e-08dabcceaca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 12:35:07.1601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03bekNJYVelcJByfroabMF0kgjrrtarF6R55d3bBBqV7COJv/jumirLftHZX84oRTsNaGU5mfiyuS3TYpGjD5BGEEBQHkcQ6ByJjohQBXGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1597
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzEwLzIwMjIgw6AgMTY6MzMsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBJbiBhIHN1YnNlcXVlbnQgcGF0Y2gsIHdlIHdvdWxkIHdhbnQgdG8gYW5ub3RhdGUgcG93
ZXJwYyBhc3NlbWJseSBmdW5jdGlvbnMNCj4gd2l0aCBTWU1fRlVOQ19TVEFSVF9MT0NBTCBtYWNy
by4gVGhpcyBtYWNybyBkZXBlbmRzIG9uIF9fQUxJR04gbWFjcm8uDQo+IA0KPiBUaGUgZGVmYXVs
dCBleHBhbnNpb24gb2YgX19BTElHTiBtYWNybyBpczoNCj4gICAgICAgICAgI2RlZmluZSBfX0FM
SUdOICAgICAgLmFsaWduIDQsMHg5MA0KPiANCj4gU28sIG92ZXJyaWRlIF9fQUxJR04gYW5kIF9f
QUxJR05fU1RSIG1hY3JvcyB0byB1c2UgdGhlIHNhbWUgYWxpZ25tZW50IGFzDQo+IHRoYXQgb2Yg
dGhlIGV4aXN0aW5nIF9HTE9CQUwgbWFjcm8uIEFsc28sIGRvIG5vdCBwYWQgd2l0aCAweDkwLCBi
ZWNhdXNlDQo+IHJlcGVhdGVkIDB4OTBzIGFyZSBub3QgYSBub3Agb3IgdHJhcCBvbiBwb3dlcnBj
Lg0KDQpCeSB0aGUgd2F5LCBkbyB3ZSBrbm93IHdoYXQgdGhlIGluc3RydWN0aW9uIDB4OTA5MDkw
OTAgaXMgb24gcG93ZXJwYyA/IA0KSXMgdGhhdCBzb21ldGhpbmcgdmFsaWQgb3Igbm90ID8NCg0K
PiANCj4gVGVzdGVkLWJ5OiBOYXZlZW4gTi4gUmFvIDxuYXZlZW4ubi5yYW9AbGludXgudm5ldC5p
Ym0uY29tPg0KPiBSZXZpZXdlZC1ieTogTmF2ZWVuIE4uIFJhbyA8bmF2ZWVuLm4ucmFvQGxpbnV4
LnZuZXQuaWJtLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQWNrZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYXRodmlrYSBWYXNpcmVkZHkgPHN2QGxp
bnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9saW5rYWdl
LmggfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGlua2FnZS5oIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaA0KPiBpbmRleCBiNzFiOTU4MmU3NTQuLmI4OGQxZDJj
ZjMwNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaA0K
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGlua2FnZS5oDQo+IEBAIC00LDYgKzQs
OSBAQA0KPiAgIA0KPiAgICNpbmNsdWRlIDxhc20vdHlwZXMuaD4NCj4gICANCj4gKyNkZWZpbmUg
X19BTElHTgkJLmFsaWduIDINCj4gKyNkZWZpbmUgX19BTElHTl9TVFIJIi5hbGlnbiAyIg0KPiAr
DQo+ICAgI2lmZGVmIENPTkZJR19QUEM2NF9FTEZfQUJJX1YxDQo+ICAgI2RlZmluZSBjb25kX3N5
c2NhbGwoeCkgXA0KPiAgIAlhc20gKCJcdC53ZWFrICIgI3ggIlxuXHQuc2V0ICIgI3ggIiwgc3lz
X25pX3N5c2NhbGxcbiIJCVw=
