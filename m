Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4936958FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:16:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9v831g8z306Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 17:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hwkzzuhs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0d::60f; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hwkzzuhs;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9tB6J15z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 17:15:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4vvpmxCKTbVo4yUIOfOHb+CnT2fw6hyZy6SRq++kpCgmh3F7PowDDFzZGEAYvlxHMPW5Ml3Utb+WCmzlH1kLihcRHZE0Y5RJjH87qDHB3c9mBDeyRshwomah7wxS0gDXbbhmwzHVLp/kR1Ba4vN8Y8WohqQdhhvRv/REVXA56RmerWcVvLB2TfDd0W5TqejNSv9nNIbhzQwJzC4LinK34IUdyxf++W+PmYb+1680a0oRM1wWbGne/DSRUvuHP5mr2eu9fZ4f4Wl77fYdpRW0pUFgneaSxNVIyCe7Qp92wtzf0+Xq7A1IuCLv1tunPpwD6++q/lVXiTJfN4zpIX9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvVV9bNNjAk+RErHP/4zgWjmNjiLINXstncI7FLCElo=;
 b=CfMOBdnLr1cZUqdGXSUVAAGp5a+hkkkQimAKO+tSLK3AAc+O3odj1Cj0Wq9KqVykmtqFaaXZ6lSrIB8+XwLl+tQFHJWuusiYL9gUttZUTcgoLFMdZmSXr+fXd5zxVMT4iZHT4FAzho2jbWhE8ru4r5VkGjKJHNjxOL2BvQV2PT8cUlAki0q7+voVeXm2HFtneYKxwaVAMFN9zni4z3ww4S1M18AVh7Azjs055vb+iiDtByo3zDr132WYh6tlDZuJze8F7oKCVpRE+pPsT8QFUsc1J+7STNl7Jl7eh56se71qVdPS3B66KBr9y2yXLXTiE3kRUizmL77pV3zA741EDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvVV9bNNjAk+RErHP/4zgWjmNjiLINXstncI7FLCElo=;
 b=hwkzzuhsdyAMs8v5hmOzkvLD9J2ZKRYQqcWO17iACk+omOzqeIcE1MMdSh+4ag8zHGYYoeq6ZJKk6nPKebih9rbRTPCoje/j3rUSsbnn/qyryV2ql4csiXnLgnzzq8vJcRj2f1LxMxv6UUwDozZjhUlscDWwvI+PRQbEyL+440wIIR8gKkhm4g0JlTWdyJTV5fy6Oi7ClhJB7tVboWe4Q9izNcObKl2bZbON4gVyYSKhZK4LNc38eZ8bk3nq3t7jF/XEoO3+MImoSOxITJY4f3l1uw272LaeEmH1iSzlirdV//LHbryb1CsMhbK+C7UFlCp3FBHZMXjigjUvkxA4BA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2938.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 06:14:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 06:14:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 7/7] powerpc: mm: Support page table check
Thread-Topic: [PATCH v6 7/7] powerpc: mm: Support page table check
Thread-Index: AQHZQBgm7Y8g8qPVNE+VSuZeVPmtJK7N9x2A
Date: Tue, 14 Feb 2023 06:14:54 +0000
Message-ID: <7cb7bbb4-9a5f-7466-0b01-4e681ac33b00@csgroup.eu>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
 <20230214015939.1853438-8-rmclure@linux.ibm.com>
In-Reply-To: <20230214015939.1853438-8-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2938:EE_
x-ms-office365-filtering-correlation-id: 63ddbf74-021c-4260-080e-08db0e52ca02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  GHm8P/k8BgX02ue0MQG57AwLGtNgwy7hEnJ2I0Vdu0TPrwT8/K+WQIIuqowCcp62Ho50BzUSyRUwr9Q/kmjlTqZyp1LOeY4bi9k0jkgZx46JXfYUIrYqUf/SEm8RAhWyiD/tfhGMWy4UefMg+6zv9vzmG1F8npfvd24bVHj8wyz0lDGmAdjRPRbHLqjl/iLtevkucjUQ3KRJKcYKLhyCetzvDpff/eTbAnsT27V0objxvyACR5yMl3azue7gE9G8a5Gxmdtcx4kUJe5QDu0de4kvW4vcEQnKwaLmvZKznMMQ8MpXN64cpdaQ13yr9sgotx+arzUNR7ihYe138+68INU76x++3eSu/w0egASTq6p9la7sclFnhXhQdoYexbpeJrN9Jb2KuX9b++CY6dU63rJqza7gPX7yNgc6SwsnCDnbbKC/r7Fzrd/ShhoghJwmXk6hJX+MMequwxH6vM9/cy4XK+qGED4PQd0Ul+mqlfXsNIUCefJDP+V5F38XnPqYXnc+9sp2WsFSazjCn10w+2xReVqNs36nTX44wckt+ngI63Y1qROQfAqlq+tl1bsqqM88UK/pdtx0CRfkzZBR0f4OwpUpp+FNx2DJQzl8USUiRwPe4RcayTKjfREW3Urlm3V9oKT9AEyDJWi+embEnBDR5nmAfAFcexqh7aK/v5BtTWUN4dKua+U9px7jE/r+AkoMOlEqa1sDk/WupkyzXuAahRHOHRonV0qfNzlf33b+nxMQOWxM82iH8vxl35T00dARYZ3O9rm7PJkLAhPTng==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199018)(44832011)(86362001)(31696002)(2906002)(122000001)(38100700002)(31686004)(186003)(71200400001)(66574015)(6486002)(6512007)(6506007)(26005)(36756003)(38070700005)(110136005)(316002)(76116006)(66946007)(83380400001)(91956017)(41300700001)(478600001)(8676002)(4326008)(2616005)(64756008)(8936002)(66556008)(66446008)(66476007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?enJJN0piZmJBazh1aWpTb1U3MmxBSEEzVEJNQkx4UXRXRW9TMGV0cDVlbVZI?=
 =?utf-8?B?aUxwUW44U21IL3ZYRGJJSkM3SzZxaG9qb1FITzR3eEY0ajJVbmZPMnZwbkNG?=
 =?utf-8?B?UmpXUUNvOWlDUW1CUVJFV1BmZXk5UHNBNnF2UW1CS1VNelZPazNuYkNKTVND?=
 =?utf-8?B?ZTZnYnZES1ZDeVAydG5BWnREYWFLM2tNbDdHREF6M0xMWlVVckJSMTVvbTli?=
 =?utf-8?B?ZWdsRno3TDVCcCtkeUZGRk9Dai8wcDNiUEhmKy9VbTZqcnZkVTcwZlRVeHBj?=
 =?utf-8?B?R3pvTDNOQ1dUUEFaalRXVysyNjdZdmFJUWVlSzRBUkNNd0lqaG9iMnlUeHlY?=
 =?utf-8?B?ZVRtbzVZQ2IrQkM5SVpFT0lmazNNNHlCSTdydlZ3Y3BvbDBBMWxQa1hoSHpz?=
 =?utf-8?B?aG5lWEtHNXFHbTRJTWhjcEpuWnRWNUFiS1pDUzlRazdJYVVkK2Z4dHVCKzBT?=
 =?utf-8?B?MCt1OXdnVm5CNmZQRU9JN0l2c0FxUmorL2E1dklNYXVhUVNYUUhDVjZzYmJj?=
 =?utf-8?B?YUd3UlVzeDJzeGFLVDR2bEdCVUtBU3VHTE5jRXN5UWp4OVFZTlpMemNBZHVq?=
 =?utf-8?B?aklLSWlhb0FxNmFKRCsyZkFrYWlKTmhUbnhjdEUxTmNsRTh6MmQwMGF1V09i?=
 =?utf-8?B?aVlIRCs2NksyZzY0SGlJczU3TWpEK2lwSTl6ejhzck4ybzVzTGU0bVJYYjdW?=
 =?utf-8?B?MXlOdWhvM0VKOUlFbnZSaThUVUVnSnVBblowa3NrZUNTRGkxazI1V1NuK3M5?=
 =?utf-8?B?c1ZiK2poWStOVS9QVm5OaTg4YkJzNFlTN2FRT0QxMkVqd04rZ3l4ZGNQbUxp?=
 =?utf-8?B?QWhEcy9iUjFUVVdWZ2dMRmRmaEl4OUxEcDJPTGd3MUNVM0VsSUtxL0hoUDVa?=
 =?utf-8?B?TGYzbDZIbkZkYk41b2dvM1pxNDNVbnJYaWpFcEYyKzMzZ1h3WTBhUSs5bDA0?=
 =?utf-8?B?RVpGeENFWS9YU25tSy9wbW9weUVtamFaSUF6TDRmaThHbFU3WkdLb2M2VDZN?=
 =?utf-8?B?eHpmd0V0RmRKZUpTYXBHSkRUWHlnTUszTTIvLzAwNmJibnhNRXhpcHc4Z01B?=
 =?utf-8?B?dEFtU1pXb21KdHZlTWNvYWtmRXoxK3d4NEZCNSsxYWQrUS9LTnRwc29pWjEz?=
 =?utf-8?B?cCtyTTJkREdLdXQvbTVoSUozWitUc3MvdFl4OG1ueUN2b3NXU09CWUhndEYy?=
 =?utf-8?B?eG5rQVlELzRZb1NhdFN1R2F0NVRMSzZmc2JXb0pWa2FnYUVTTHYwRHVWQ0Vj?=
 =?utf-8?B?K3dSZHE4dUFFNGo0MHBhWHYxcStpdmwySXZOelZjYzczRUp0eVFKaGZEUTVP?=
 =?utf-8?B?dGdRUXNxYW41NVRiS1dvZW1ESFRpRnYyZkwyeGRSUkkzRFhab2VUc3NnaDkw?=
 =?utf-8?B?K010NG1ZOGpOOEE0YlZKSXZWbUNVa3NJT2dwWWJEWEZ4VEdNRTdYZW1ETDNm?=
 =?utf-8?B?SnVnWitDTDA2K29RTm1ZTTJPSWlobWJiWVFZNFNvb3I1OE1idWVOdnhmVGlT?=
 =?utf-8?B?dkkzYkRVbDRXM1Foc09WNjJybjJaU3NMZHBDdVMwaitxRW5ySFRwRnNxSlFF?=
 =?utf-8?B?cWh6T3N6NkY4Zm9SOVJFeWNxYURpbE1UK0IvNHJsbjlJZzU0NkVKM1UvWW1h?=
 =?utf-8?B?bThBUFpDMUw3bTlOYTdGVXVNb3pUYm42T3hxeUNqamUrMXkrRUlpWjBBb0Ry?=
 =?utf-8?B?V0RHZkcxaTdDVnVhbWZNWGtMKytia3R4SktWWGdhclpzN205Z2pTVmhZSHpn?=
 =?utf-8?B?YlAzRUVaUlF6akhlTEpRUTBIMUFIdWp2RnRVLzY5U3oyeHQ1NGEwUkhiZHdG?=
 =?utf-8?B?L2FFQVFjTDlRZWIvZzRIcVhQRnNsUFRlNE1LU1FrQ1E1YW1MOUk4VmFsOU5u?=
 =?utf-8?B?ZE5FdHphMkxzVThvZXBjZTdxTS9Td0NNUTY1cVl2REJZeFhyZEtTRGw0Zk5R?=
 =?utf-8?B?aUF3N2d0OTNuKzBUNXpVVi9jdUpsWFhXZUZuMS82Y0dicVpjZHJmVWhxaGU1?=
 =?utf-8?B?eFFsV3U3YTBsSEZvMGhldGI2cUNtQittVmxHZ1VVWGZqaDB2Y2ZIWGpvOFZh?=
 =?utf-8?B?SEZPeGxlNVZaU01NRmhNMG5jdTBmb1NFdjY2TnByTnhTODFFblpaR0FWODlu?=
 =?utf-8?B?R3BYMkY0L0VTaHo5NWdGUEptSmhnL3l3MCs2c2VHS1R4dkxFNkRIV0FCT1lj?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F175AE08D56A34B8571B324A1817C79@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ddbf74-021c-4260-080e-08db0e52ca02
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 06:14:54.1670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWY8EvptR5SvcZOG8GSUPxtUnRUbn2daIk6nWfBpxa+MpY3JwOBedOoLDfGVocASxxInIyUt2HKJjWNpd33UjAqDHKVd2u2Qsui2YJyxCbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2938
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

DQoNCkxlIDE0LzAyLzIwMjMgw6AgMDI6NTksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBP
biBjcmVhdGlvbiBhbmQgY2xlYXJpbmcgb2YgYSBwYWdlIHRhYmxlIG1hcHBpbmcsIGluc3RydW1l
bnQgc3VjaCBjYWxscw0KPiBieSBpbnZva2luZyBwYWdlX3RhYmxlX2NoZWNrX3B0ZV9zZXQgYW5k
IHBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyDQo+IHJlc3BlY3RpdmVseS4gVGhlc2UgY2FsbHMg
c2VydmUgYXMgYSBzYW5pdHkgY2hlY2sgYWdhaW5zdCBpbGxlZ2FsDQo+IG1hcHBpbmdzLg0KDQpQ
bGVhc2UgYWxzbyBleHBsYWluZyB0aGUgY2hhbmdlcyBhcm91bmQgc2V0X3B0ZV9hdCgpIHZlcnN1
cyBzZXRfcHRlKCkuDQoNCj4gDQo+IEVuYWJsZSBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hF
Q0sgZm9yIGFsbCBwcGM2NCwgYW5kIDMyLWJpdA0KPiBwbGF0Zm9ybXMgaW1wbGVtZW50aW5nIEJv
b2szUy4NCg0KQXMgZmFyIGFzIEkgY2FuIHNlZSBiZWxvdywgaXQgaXMgaW1wbGVtZW50ZWQgZm9y
IGFsbCBwbGF0ZWZvcm1zLCANCmluY2x1ZGluZyBub2hhc2gvMzIuDQoNCj4gDQo+IENoYW5nZSBw
dWRfcGZuIHRvIGJlIGEgcnVudGltZSBidWcgcmF0aGVyIHRoYW4gYSBidWlsZCBidWcgYXMgaXQg
aXMNCj4gY29uc3VtZWQgYnkgcGFnZV90YWJsZV9jaGVja19wdWRfe2NsZWFyLHNldH0gd2hpY2gg
YXJlIG5vdCBjYWxsZWQuDQoNCklzbid0IHRoaXMgZG9uZSBpbiBhbm90aGVyIHBhdGNoID8NCg0K
PiANCj4gU2VlIGFsc286DQo+IA0KPiByaXNjdiBzdXBwb3J0IGluIGNvbW1pdCAzZmVlMjI5YThl
YjkgKCJyaXNjdi9tbTogZW5hYmxlDQo+IEFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyIp
DQo+IGFybTY0IGluIGNvbW1pdCA0MmIyNTQ3MTM3ZjUgKCJhcm02NC9tbTogZW5hYmxlDQo+IEFS
Q0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyIpDQo+IHg4Nl82NCBpbiBjb21taXQgZDI4M2Q0
MjJjNmM0ICgieDg2OiBtbTogYWRkIHg4Nl82NCBzdXBwb3J0IGZvciBwYWdlIHRhYmxlDQo+IGNo
ZWNrIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5p
Ym0uY29tPg0KPiAtLS0NCj4gVjI6IFVwZGF0ZSBzcGFjaW5nIGFuZCB0eXBlcyBhc3NpZ25lZCB0
byBwdGVfdXBkYXRlIGNhbGxzLg0KPiBWMzogVXBkYXRlIG9uZSBsYXN0IHB0ZV91cGRhdGUgY2Fs
bCB0byByZW1vdmUgX19wdGUgaW52b2NhdGlvbi4NCj4gVjU6IEZpeCAzMi1iaXQgbm9oYXNoIGRv
dWJsZSBzZXQNCj4gVjY6IE9taXQgX19zZXRfcHRlX2F0IGluc3RydW1lbnRhdGlvbiAtIHNob3Vs
ZCBiZSBpbnN0cnVtZW50ZWQgYnkNCj4gc2V0X3B0ZV9hdCwgd2l0aCBzZXRfcHRlIGluIGJldHdl
ZW4sIHBlcmZvcm1pbmcgYWxsIHByaW9yIGNoZWNrcy4NCj4gSW5zdHJ1bWVudCBwbWRzLiBVc2Ug
c2V0X3B0ZSB3aGVyZSBuZWVkZWQuDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvMzIvcGd0YWJsZS5oIHwgIDggKysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgNDQgKysrKysrKysrKysrKysrKy0tLS0NCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3BndGFibGUuaCB8ICA3ICsrKy0NCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaCB8ICA4ICsrKy0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICB8IDExICsr
KystDQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJsZS5jICAgICAgfCAg
MiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3RhYmxlLmMgICAgICAgICAgIHwg
MTYgKysrKy0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMg
ICAgIHwgMTAgKystLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL2Jvb2szZV9wZ3RhYmxl
LmMgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIuYyAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KPiAgIDExIGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyks
IDI3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmln
IGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gaW5kZXggMmM5Y2RmMWQ4NzYxLi4yNDc0ZTI2OTkw
MzcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+IEBAIC0xNTQsNiArMTU0LDcgQEAgY29uZmlnIFBQQw0KPiAgIAlzZWxl
Y3QgQVJDSF9TVEFDS1dBTEsNCj4gICAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfQVRPTUlDX1JNVw0K
PiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19ERUJVR19QQUdFQUxMT0MJaWYgUFBDX0JPT0szUyB8
fCBQUENfOHh4IHx8IDQweA0KPiArCXNlbGVjdCBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hF
Q0sNCj4gICAJc2VsZWN0IEFSQ0hfVVNFX0JVSUxUSU5fQlNXQVANCj4gICAJc2VsZWN0IEFSQ0hf
VVNFX0NNUFhDSEdfTE9DS1JFRgkJaWYgUFBDNjQNCj4gICAJc2VsZWN0IEFSQ0hfVVNFX01FTVRF
U1QNCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggYjc2ZmRiODBiNmM5
Li5kZjAxNmEwYTMxMzUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBA
QCAtNDgsNyArNDgsMTYgQEAgc3RydWN0IG1tX3N0cnVjdDsNCj4gICAvKiBLZWVwIHRoZXNlIGFz
IGEgbWFjcm9zIHRvIGF2b2lkIGluY2x1ZGUgZGVwZW5kZW5jeSBtZXNzICovDQo+ICAgI2RlZmlu
ZSBwdGVfcGFnZSh4KQkJcGZuX3RvX3BhZ2UocHRlX3Bmbih4KSkNCj4gICAjZGVmaW5lIG1rX3B0
ZShwYWdlLCBwZ3Byb3QpCXBmbl9wdGUocGFnZV90b19wZm4ocGFnZSksIChwZ3Byb3QpKQ0KPiAt
I2RlZmluZSBzZXRfcHRlX2F0ICAJCXNldF9wdGUNCj4gKyNkZWZpbmUgc2V0X3B0ZV9hdChtbSwg
YWRkciwgcHRlcCwgcHRlKQkJCQlcDQo+ICsoewkJCQkJCQkJXA0KPiArCXN0cnVjdCBtbV9zdHJ1
Y3QgKl9tbSA9IChtbSk7CQkJCVwNCj4gKwl1bnNpZ25lZCBsb25nIF9hZGRyID0gKGFkZHIpOwkJ
CQlcDQo+ICsJcHRlX3QgKl9wdGVwID0gKHB0ZXApLCBfcHRlID0gKHB0ZSk7CQkJXA0KPiArCQkJ
CQkJCQlcDQo+ICsJcGFnZV90YWJsZV9jaGVja19wdGVfc2V0KF9tbSwgX2FkZHIsIF9wdGVwLCBf
cHRlKTsJXA0KPiArCXNldF9wdGUoX21tLCBfYWRkciwgX3B0ZXAsIF9wdGUpOwkJCVwNCj4gK30p
DQoNCkNhbiB5b3UgbWFrZSBpdCBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gaW5zdGVhZCBvZiBh
IG1hY3JvID8NCg0KPiArDQo+ICAgLyoNCj4gICAgKiBTZWxlY3QgYWxsIGJpdHMgZXhjZXB0IHRo
ZSBwZm4NCj4gICAgKi8NCg==
