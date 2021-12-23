Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19EC47E560
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 16:15:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKYfC70kvz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 02:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKYdh3vc5z2xsM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 02:14:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8DMxAd/00X8cTMOB39hPoYBEJhZAwKMh2ZkMBDfM8u2Fnu1a9sGo2FwDHXT5BUzqrQLu1hOPPRwxPvD3ZTUJ2VGfPHfMB0KLpYD9FG8h96muCXYtT5z5ICaDNIkvGQsjgDTPLeJkfY2sp/W2g4MQXQrS3zwjxWZkcgDlN/t/SGBEwzvVIUIZIB9g/ap+oe5Fo4IbT9MyL7jqi8H77BfNXML6/NNeQ6waW2JV9371vO3RvRhKanjHFnzg5n6JiGRULdzctyIM74AZxcX7ufrUZr9Yz1wzVwxX24hCbzVmSCV4LjlNgyXDHQtkzmle0VkKDt7ef1QUs8t94X7KXIkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mInH2qTAnOiU4rAlJLdM6u4nERFuz+YPQBmhuy/VQGg=;
 b=cKhhpuoVAeSglrte+NgljBecfTQVBqsWeblf25RRKIYpYPUqNUwb5iMLyG/5JLY/MltyopiUoMwhwgJdNoypV7csEsr86Bi8jUeYKOOWQ9PkwadHXLt2XKWZ/4lX2+vAjiUIzGsTUwwk3WMnvB4XgxhP21elabmyHtoHBkXR/WjljBZ+iT7306Ifh6qhw7vGnL0iNivJ3U5Y3w6t8KGAps2QrRsq3wbqryp3W3VmNEO+V7gXF5T3llW8DnUhzpyg+nFTRqnHig7QUFcShVhAnL2YgBz2dsRvNM0VxhU+qVmEZMev6o/HTNVQ/sDq7dQ4hYaY/ciOcfnOYtVBxFtf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 15:14:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 15:14:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Topic: [PATCH v2 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Index: AQHX8qUBgZlGk5AZtkeEGUMOS24Ae6xABpsAgAAznoA=
Date: Thu, 23 Dec 2021 15:14:20 +0000
Message-ID: <e07eefc3-6f84-2e95-05f2-8c56eb6a0c1f@csgroup.eu>
References: <112b55c5fe019fefc284e3361772b00345fa0967.1639676816.git.christophe.leroy@csgroup.eu>
 <871r2334ld.fsf@mpe.ellerman.id.au>
In-Reply-To: <871r2334ld.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c8b9928-d5aa-416d-6972-08d9c626e4fe
x-ms-traffictypediagnostic: MRXP264MB0279:EE_
x-microsoft-antispam-prvs: <MRXP264MB02794770CE6E3F749E7077C4ED7E9@MRXP264MB0279.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6KVhrLp213GRXkAWxOryooO7u7BeKXMdS2aneA1wEhMCcSTVe6WDljywG78iEF3f7MaAqAGHaLtFsjcWOvifVtt/5tXSx9A6BEZsjm7u+JYoxFHiquJx7XwWQ7/EqmMJLqhMfAWoU6tSpBIg/C79l1G4UPtylS3mnY1s1aMsmqUXLJeLBuZihQ1nmvZbE7TjDRU9f6JEUILvei8OgmOpQ/+D5M/j0leQ4/x5FyXI16dN7OiNDAy769Kcn7/oYKBMsltsEi33aOpnYD0b12wxZmYY3qLLQzxlDoBRTYCfVbl//nfwskLE3cVKYkMxEl6zqybyZcqiJYMvJ01QjPBQZZzuoV0jl4LmKltkXNsniMmLNHkEkGxjd8W/QgqKVcqPvanII9rk7UJRpMKU4oYm5UE7VgcE5Ox18/7D3huo1dDwDeIxAGCmurpFgpjQ0z5ZkuOgc61JDwTjuVyh0S5+wv+lVLmMe7vmnXQo+JLQHeXsRiTDYaIFHM/Ij+tOqk+q1SD3JI33T4osXDXDzX9AiA2TQeZCSC/uPXMiPtGkbbxyOO81SGiVQicr4EfcR5E14/NVBW2aXyqMB2WtpnfmLUEj/pikswN8eAKUB9Rveg4HsZVN7D4ZaNWoYnHKS+NWlQSiV+H/ttITmloMznRd4OGSXaYadcl4LWHdd+Wpcu8N3ahucmUEfCi0UJcVUUrx90kf8+k8m1TBQc/8YDCpU+uQfbAN/T4WsTzy1+q91bZF5ePOioiyK3w+PzQPisgilfT03CQrZpwD9jnvZn9mkOEcdc9DaKHwE/l+zVlr6xJHrM/O3Dj/p0lvUrsSAsHdcjwGG0zXwiTOwQ20EWHStQZc1xdw90hRZyfl1sERwA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(71200400001)(64756008)(86362001)(4326008)(76116006)(8676002)(316002)(91956017)(66556008)(38070700005)(2616005)(44832011)(8936002)(66574015)(66446008)(66476007)(186003)(6506007)(26005)(54906003)(110136005)(31686004)(122000001)(83380400001)(2906002)(508600001)(6486002)(31696002)(966005)(5660300002)(36756003)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU5IOHhib3JicE1aNjY2L0M0Vzc5VjZJUThPaWkzdFFrdjVMSzNpNVFLbUJW?=
 =?utf-8?B?UDB4Sy9oSlhCVlk3Mmg5OFpWSXhsK0h5WjhxVzlYaVRpblExc2RLYytSNzF0?=
 =?utf-8?B?WkxMbjNXckZKY1c3QmVSdlZmdk5mWFV6RnY3RlJhN1RQY2lIRXQvOXFCWTc1?=
 =?utf-8?B?M2RhM2NwRm8rMDU2VTV3VWNrOWNQd2kwWkV5MHI1WlgzaTNNdGQ5dW5iNjBP?=
 =?utf-8?B?ZlhHZ3hjUWdDN0ZZRTgzRytLRE85R2V1WG1MUEd4WTVONm1JdHFCNnlPTXRh?=
 =?utf-8?B?L2pMeTlqZFNlU0dWQy9na1k3M25RTVFIcnQwMVpNTWxQdGxsRzlTZUc3ZkRJ?=
 =?utf-8?B?bWlYZ0Vod0tkSXE2NExtYkFtTWVwbS9Ialk0Zkl6VStCTnlZUEN6SFJnRVY3?=
 =?utf-8?B?LzN6RldFWTExbXp0djZrV0srckFPMWZRU0s2OUZrOHlBdVFlV241NkhDL2Yx?=
 =?utf-8?B?STY1WUw0cHJLbE4yVzVHd2VBYXo3NlVWMHEvRDNTMmRoNkgzWkVCTElOeGF6?=
 =?utf-8?B?dkk2Y2xGMmRMQ0pHQ3ZTeWdPZUdtaHk0RGhsVHUrSks3M3UwUmZiaTNmRnpt?=
 =?utf-8?B?Z2NacVpMdnNIRHRMOWhvMVN3ekpZTHBtT3Npc0xrRzQrZk00M01EaG9QYnY4?=
 =?utf-8?B?YTg0bC9uOUI2cGtUdVBHNGlHUmtEVUFXWTlCZVpoTXo2a1BDVmVYTG1raHhy?=
 =?utf-8?B?c2xKcXB5N2hpZGdmbTVEUFljRjJta1Vha3hKem9adS9tN25LNFRTZVp6OWhO?=
 =?utf-8?B?MDU3VjNRL28rWkxraUZZMUFRcWhqUWJEZEFRUHpZWUhBa05mdTVVNUNuejVV?=
 =?utf-8?B?UUhldWI4SE16QzNlQTBNN0pMMUxtN1kwL1RMWWszektLRFNBS0hOZTI5T2gw?=
 =?utf-8?B?MnZuM2lRMnQvWDlaN1dWQk80VDBhV2JWS2VOQlJFUC9mQTdSSEtEMnFaN1ZP?=
 =?utf-8?B?TVRuQy9NOUFZc0VxTGhjZHNtaTZKanJYNC9DeUwvM2t1SzJEM2JhMFhTaThl?=
 =?utf-8?B?VnlDVUpVbTNCM2UvWHVCQTV5WFZDU01SaE9SZFI0eXMvNldrRzNCY2ZWMkIy?=
 =?utf-8?B?QXd4Q0FlTSt3MmNnWVlZTmlwSC9ZTE1lcW9VdGJSQ0o5L3ZBWDkyMjl0YWFV?=
 =?utf-8?B?R0xBZVB5YU40RUVTZVBQSXR2U2hkQTdzUXllQ2pFSU5hVTRaNTFXN08xQVQx?=
 =?utf-8?B?c2FWOHo0NWZHMTVLNStxbmZ5NTlrZllqc3NibkJwNjJwNEk3Vi9WdWx0UjBU?=
 =?utf-8?B?ZXl5cXRkVXNzbjdZajV6VXNtYy9OWmx6NlcyRVF5SHcvbS85ZWZxdkkwNSt0?=
 =?utf-8?B?NWFjSnAxbkVWNmYxZjc1WGQ0T0pNMnVtd2YvVk9HRC9taGVtYkhrY3NuamdP?=
 =?utf-8?B?T3pEek0xcnRuM0Y4aXFkQXVkUmduajdWQm56ZHlMZDhjWk1zZUVqN2JuNm9J?=
 =?utf-8?B?aUJsOEpPMTlvbDRuZllxSktsS1ArUExSc1dGWWtHQ0tRS3dDQjBwbko3Q2lj?=
 =?utf-8?B?aG1WYlgybFhicUlOY2RhbVNNVUNNL1Y3Z3p6Vk1TSWI0ZkR6Q2VtVStDbUVi?=
 =?utf-8?B?WGsxRFhnVkpVajRkS0QxMExIY1k2MG84b1lLekdZRk1xLzVoellMUWNpQnNW?=
 =?utf-8?B?SzkyMkVjU2lkcFRYelhzUlB3WitrYXpUTmNvTFNtZ1E4UmtFSEJVTmhxQjJx?=
 =?utf-8?B?d2FRUzdCTFJUUjJNNUV4NU1RdmhrZTVWaWpudStzZ3I1K1Zhc01ESnRyOWIw?=
 =?utf-8?B?RGJ0MGNWbk5oMjJ6NmkrMTVOVUk1bW1HZldmWnNRMkpZMm1DTEJwTUEvcDFI?=
 =?utf-8?B?VXR3VGlDS0Q5S0RYNmhlSUVLbW94SVYwQU9EY2diTW5MVUFyV1A3aFFoOFpE?=
 =?utf-8?B?QlRJK2VQbU5zYkNDZE9MNHFiN0g2d0lseEc5ZStqSS9tOWZ2K2JSN0JzVXYr?=
 =?utf-8?B?dWgvVFhWKzJzd3haMTVUaDI0ZFNaSHh5WVpsOWthcmxGYms0c1FPS0kzanp0?=
 =?utf-8?B?N2xJekh5bGhidHBRLzVDWHVRSEdiUzA4dDZsNzBXSFEvVlE4SWZnWk9UY2Vx?=
 =?utf-8?B?V3dQREFtZ2xSUnUxZHlEaThUSjZGbURzSVAvc3VrWUJVQXRJcFE4QVUrYUNG?=
 =?utf-8?B?VHJPV09kWDZOSHZPekpjZ3cwUmd6V0JLV3FSQXdmRzFzb1prd3dWNjFyclUr?=
 =?utf-8?B?RVpaWS96N0p3TVhSSVJKTDlNRjdseThHOHY2Y29ZbmhXbU9icGZEb0V5bFZw?=
 =?utf-8?Q?dFnuwz952h7X+tTZYG0YiUPYza/IddpkthvQBNsuw8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B6F39807F7D8F419DEA675686769333@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b9928-d5aa-416d-6972-08d9c626e4fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 15:14:20.1945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeYA4uIAMkH8vSMUznQe8qsbVfYpmwzV0Afda0WdWP0GZ9IDyj3I/4QvhnDmBDToxIo0gOHG/BWSZp3prR5FNUh+QuTV5EsYg9SrpU1B3uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0279
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzEyLzIwMjEgw6AgMTM6MDksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBDb21taXQgMWY5YWQyMWMzYjM4ICgicG93ZXJwYy9tbTogSW1wbGVtZW50IHNldF9tZW1v
cnkoKSByb3V0aW5lcyIpDQo+PiBpbmNsdWRlZCBhIHNwaW5fbG9jaygpIHRvIGNoYW5nZV9wYWdl
X2F0dHIoKSBpbiBvcmRlciB0bw0KPj4gc2FmZWx5IHBlcmZvcm0gdGhlIHRocmVlIHN0ZXAgb3Bl
cmF0aW9ucy4gQnV0IHRoZW4NCj4+IGNvbW1pdCA5Zjc4NTNkNzYwOWQgKCJwb3dlcnBjL21tOiBG
aXggc2V0X21lbW9yeV8qKCkgYWdhaW5zdA0KPj4gY29uY3VycmVudCBhY2Nlc3NlcyIpIG1vZGlm
eSBpdCB0byB1c2UgcHRlX3VwZGF0ZSgpIGFuZCBkbw0KPj4gdGhlIG9wZXJhdGlvbiBhdG9taWNh
bGx5Lg0KPiANCj4gSXQncyBub3QgcmVhbGx5IGF0b21pYywgaXQncyBqdXN0IHNhZmUgYWdhaW5z
dCBjb25jdXJyZW50IGFjY2Vzcy4NCj4gDQo+IFdlIHN0aWxsIGRvIGEgcmVhZCAvIG1vZGlmeSAv
IHdyaXRlIG9mIHRoZSBwdGUgdmFsdWUuDQo+IA0KPiBXaGljaCBpc24ndCBzYWZlIGFnYWluc3Qg
Y29uY3VycmVudCBjYWxscyB0byBjaGFuZ2VfcGFnZV9hdHRyKCkgZm9yIHRoZQ0KPiBzYW1lIGFk
ZHJlc3MuDQo+IA0KPiBCdXQgbWF5YmUgdGhhdCdzIE9LPyBBRkFJQ1Mgb3RoZXIgYXJjaGl0ZWN0
dXJlcyAoZWcuIGFybTY0KSBoYXZlIG5vDQo+IHByb3RlY3Rpb24gYWdhaW5zdCBjb25jdXJyZW50
IGNhbGxlcnMuIEkgdGhpbmsgdGhlIGFzc3VtcHRpb24gaXMgaGlnaGVyDQo+IGxldmVsIGNvZGUg
aXMgZW5zdXJpbmcgdGhlcmUncyBvbmx5IGEgc2luZ2xlIGNhbGxlciBhdCBhIHRpbWUuDQo+IA0K
PiBPbiB0aGUgb3RoZXIgaGFuZCB4ODYgYW5kIHMzOTAgZG8gaGF2ZSBsb2NraW5nIChjcGFfbG9j
ayAvIGNwYV9tdXRleCkuDQo+IEJ1dCBpdCBzZWVtcyB0aGF0J3MgbW9zdGx5IHRvIHByb3RlY3Qg
YWdhaW5zdCBzcGxpdHRpbmcgb2YgcGFnZSB0YWJsZXMsDQo+IHdoaWNoIHdlIGFyZW4ndCBkb2lu
Zy4NCj4gDQo+IFdlJ2QgYmUgYSBiaXQgc2FmZXIgaWYgd2UgdXNlZCBwdGVfdXBkYXRlKCkgInBy
b3Blcmx5IiwgbGlrZSBJIGRpZCBpbjoNCj4gDQo+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4cHBjLWRldi8yMDIxMDgxNzEzMjU1Mi4zMzc1NzM4LTEtbXBlQGVsbGVybWFuLmlkLmF1
Lw0KPiANCj4gDQoNClByb2JhYmx5IG5vdCBzbyBzaW1wbGUgYXMgdGhhdCBwYXRjaCwgYnV0IEkg
Z2V0IHRoZSBpZGVhLg0KDQpTZWUgYjZjYjIwZmRjMjczICgicG93ZXJwYy9ib29rM2U6IEZpeCBz
ZXRfbWVtb3J5X3goKSBhbmQgc2V0X21lbW9yeV9ueCgpIikNCg0KSSB0aGluayB3ZSB0aGVuIG5l
ZWQgdG8gZGVmaW5lIHBsYXRmb3JtIHNwZWNpZmljIGhlbHBlcnMgdG8gZG8gaXQsIA0Kc2ltaWxh
ciB0byBwdGVwX3NldF93cnByb3RlY3QoKSBhbmQgYXZvaWQgYW4gI2lmZGVmZXJ5IGluIGNoYW5n
ZV9wYWdlX2F0dHIoKQ0KDQpDaHJpc3RvcGhl
