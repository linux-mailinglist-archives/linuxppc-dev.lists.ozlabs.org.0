Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0D8CA0E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:51:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=netpK3n7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjk1K2BWSz3gCG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 02:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=netpK3n7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjk0Z2VsLz3fnh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 02:43:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly8dzC8VKZROICksLoAIb0tix48b8iU8fzBzcZSVI/nN0l0OX/k3uVgYVoCkJMY9mMqr1HctTukTgSvCBF7uvRYQna1OsEig05BMDEHsbapuE1dwZiq0Q2rp+omYJUOia1AYqhIO9XE0nOoaRqu1dV36zsWQ4KYc5nL7HpLtU4eLP0j8oyFV0AEYHxzdgyoUy5jOf5l7tn7kjpqJbYQfCIdQ3LK0pVo4RdD4Elt6lQZQf9ztpmEBN2akEvbcg+ojBi4SXBNrOHFIhoucZwiUK9PqF7oSXtG83RmOj2vofshNyPmwV5XP+v4NMj92U7/uvObfhq2Era5FVk508mH8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBwTMwy7il4HQz8+7aJuZcmoyx/uNWxNkGyfCiFI5WQ=;
 b=Epjufmt2/J2n1dSbz4YfF+7wrZqmIJFiGStjor6KjkC9557m6SkGF6cWq57vpVBGHpxOAq6FiFuVWP9cP6ocy1CWnsQoHshkEIhWtxa4ggobwRKwtQ1VE29uBuyVmeluCzC5dqW9+ewxGgkt+c1tuCOT5FzLIr96tuYbZ3d3nDiW4oPYuYd9gR3FjN5A3HGcmy5IkKtDWcw2mEwzRiJozgdwftoQNre222/H7+M8L2qwZ1lTxQRgKC2KvUThGAwC4WIiu85gcIGPqHr52jUdw4kMhLsIGcSYYtn+rkVstMau6YLPKB4+lkZ2tWvqoQuFNau9jVGEwl4n1AXiE4Jg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBwTMwy7il4HQz8+7aJuZcmoyx/uNWxNkGyfCiFI5WQ=;
 b=netpK3n7rqYAejnCNbVKpDg+YXdv3aLAjkp/patJxmocwbeRm/EXh5I2PHNyZ96khaswFSGPhCTZelAT53EfYfPmmZTB5AzPCSdn3faKpS2bjSjmhLoxd/49AL2OPjxePibV/3dPaGPJQQy0leSD3GXO1008qdAr0wD/t9qTGQ8VWqoHShwcNPZbIn9a2xhf5xYow5e6tIzQO/LTXGp9g/dyyImZanPUj0IOAAlPp7cJAv8fIXb+aqUVRaoQfZgO6GPj7fsF/X7l9MJaaSDJJnJUDK3BJtmEa6YeiZLmcB9jxz+h5YcjSTDMuz3IorBDRs8sSO9SG+kvHUjSr7IbxA==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAYP264MB3334.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Mon, 20 May 2024 16:43:19 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bc7:7b86:2461:88e1]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::bc7:7b86:2461:88e1%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 16:43:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Peter Xu
	<peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Thread-Topic: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Thread-Index: AQHaqIx5KQ+eT+iFZk+BwYl5V0oOjLGgGKKAgAA/5oA=
Date: Mon, 20 May 2024 16:43:19 +0000
Message-ID: <99575c2c-7840-4fa4-b84e-aaddc7fef4cb@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu>
 <D1EHK0STZ19E.3CTOAWG7LVBPK@gmail.com>
In-Reply-To: <D1EHK0STZ19E.3CTOAWG7LVBPK@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PAYP264MB3334:EE_
x-ms-office365-filtering-correlation-id: a62eaab5-4d3d-459f-5961-08dc78ebf46a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?dTdCTEV5OVMrSDZBRitEejljRzh3SDRDVDJESFJDeWFJN3Z1eGJyL3M0VTJ2?=
 =?utf-8?B?UTdDU0krYmtpQnZEU2NvOWhSNUl5S0V4MlBFU3BKR1JKcWZXUjljSktKcTNM?=
 =?utf-8?B?cHYvOUVqZlNpNGxOZnF4aXJhL2p1SDM4R2NJYzU1SXE3SlZ3VkRMNjRYcWtS?=
 =?utf-8?B?b0l3L21hSVpZUzI4bzVZSFNpQ1FEdnNnbHNwdE4xc2crN0lySHhvM1NIQ3M5?=
 =?utf-8?B?Y1g2S1duVzRQNm40VDd6SWRldWxibXJXa0dObnVqcUNDUWpmMHVlTkp4SWJU?=
 =?utf-8?B?RFRsS2prTk9tRDVZYlFtNlFtUmQvQ05mejd5azNDKzBvZmR0TUFNdnoxL2lL?=
 =?utf-8?B?czMrcmpEalJpdUZWcEJUVXNBdENqZm5pQlZHL3VDamxKdU0vSU5yYjFFejBU?=
 =?utf-8?B?NzA0Nll6ZXVzNWNnem56RGJQK29mY1RENHIrQkdwN2tuUHVEcGh0MTd2clBi?=
 =?utf-8?B?eDZEQVF1VG9aUWZrU0FaZSt0dzNtcUVqUU9BZStwaW1oTFl4SUlsYVU1ZWZ2?=
 =?utf-8?B?OHlkZnE5UDVwWjZKVlZ2MHE4eDd4MWJmUzlWTFZldTRUL1dPU21vQ0FOYnhJ?=
 =?utf-8?B?TFVKcVpjOWhiTjhiQXlINXF4Vm1EUEdxb0JWc3phNzNhOXRzUUFLZ2hYV2ZO?=
 =?utf-8?B?dDhHanQ0dEVBbjhITVFzTnpVMjM2TjF3SEFNSUxGMDltSy8rUWwvNFJ5UWtN?=
 =?utf-8?B?YmRmUlh6aTRYVndOSm11dC9QQTY5TnVWOFJJM3JQZ3NmazJjYXNnNGYrb25p?=
 =?utf-8?B?UWMwWXJqblZiM2todmdHVzJCSmhHRklFNVZWdTFZaHZrcTZ1WUxydnAwRWFo?=
 =?utf-8?B?U01YaGFUTjgrWUtFK0RQelUrZDlqRzJyZmMrbVhCV0V4QnBST3NuVmx3NkdM?=
 =?utf-8?B?T3ZwNWxsbTVVWUdLeW1idDVRMFRWbG5jekRNOXBZcEhjMWw0U2Nzb29hSWZH?=
 =?utf-8?B?cnJvdit3RDc0bUxqck5uVnJpUWpsS1BxclhUa3pKWHV5ejNHZlQ1cWxtVVl6?=
 =?utf-8?B?cElLN1g1TXZvQnk1ZVpNLy9yZWFCdUthRGlXeithRWptSTc0R2czRXludWY1?=
 =?utf-8?B?dVlZNVdCN2pPVU1HWGdCN00wUjdmQ2xEZmxwOEN4YTRoc1NvTmp0Q2JKRU56?=
 =?utf-8?B?NjJUM1orRkNndmc3VzJrMWdqbnI4UmpqZFprNGNGMGovdDdSVUtYRWVzRTdo?=
 =?utf-8?B?TWtEN1lRUzRRK1ZmYUdFRU9rNGppZG9Sb2NhKzdrZXRxNjNGQ2ZvTFgxY1N3?=
 =?utf-8?B?WnhYdzFrdE04VGhONThLS3dhM21IK2FjYmdLZU9iZ2g1UU9XWmhMOHZEaXF1?=
 =?utf-8?B?V3l1dFpRcFRzRVk1SXNKbGxqNjVMQnRoV0NQc3BhTzV0WW85NGlXSjNkM2tQ?=
 =?utf-8?B?WVdOR3dROXBSRWJPZG5OdmNrVVB3a3kwVWgxeG9hQmhqWUIxS0c2dmdNYWZ5?=
 =?utf-8?B?V0M5QnFtVjk1eXdHMGRhVXpYQzZMbW9IRGVNVHZjTytKa0NheHhiRnNCZ1dR?=
 =?utf-8?B?UW9zUnhYY09iVE9KRmNXdFZRMEF6TjhZbzB3YUdYNHoraEd5UkRldU9XNVR4?=
 =?utf-8?B?eERpc1I3Rk1xaVRpUTlFR2VtejBHeHFmMGl0YWgxUzd5NTR3V0h2aGZWQU1F?=
 =?utf-8?B?MjFwTzFNK1lQelpyaFV3RWZ4OEw3OS81NTQ2T2F2c0s2QjFnY2NqcnNROHpk?=
 =?utf-8?B?NUdPdCtxT3RTRkJvM0l6KzhmRFNGTkowZ2ozMFVRSHJMcld5aUpHcTlxamRF?=
 =?utf-8?B?TFliRjBkSTNXNDVjUXQ3WFhiM3JDK1ptdE9kK3ZOeE1nR0VsNXBiay9ReTNt?=
 =?utf-8?B?WnAxY3BzSjVBMEZrTVo2QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MUVac0VoRENaRzVtMEZEdGJZK1ZPZVFrUE04Skl1cktHb2tLT1JuR25Fb1NE?=
 =?utf-8?B?OGtvUVZONWlkTTBsUDNqWGc4dkxMRzNyaUFzeTdXbW5tUll1Q1ZDY0xVWHRN?=
 =?utf-8?B?enQ2aWZ4YlJuUS9nWGFEQmV1UnJYWmpEYlUyenhNMm5WMDMydjZEOURVYjQr?=
 =?utf-8?B?eVN4WlJBVUp0OVlyVjZhbzcvNEU0V2U5Mm45VGVvdWpVRUY4MVY2K2tQOHho?=
 =?utf-8?B?by9OV1hmQlBzZDRmMXdpNHFrcW15N25YWmJhZll4LzNQekNyaFFyQ0lyTU9K?=
 =?utf-8?B?UCttNDM3U014blJLL3FXb0RVVkR2UEIxMHg0Zy9IODE5TjVjK1NxakRFcllR?=
 =?utf-8?B?U0p4Z2ZtKzl4bGNEclpvekV5Zmk0TEhsMldTRVIxRit1MXJFY1Zza25rVk1q?=
 =?utf-8?B?V2M2M2NMTml3QlJMU1JESkpnQ1FtWnlyVytrenFCN3Z2bXMxV3hoNVB6VnpO?=
 =?utf-8?B?NFFWZXlUbHNQNlhKbkU3SVhYMFBJYXAvVXNhN2dGM3h5UXBKTTI4QkNzczF1?=
 =?utf-8?B?bnBJWUFvRHRUaXNSeHdVSGNsN2Z6eHpCbStMbUQ5V2UvaVBZaWFEaHE4MUdI?=
 =?utf-8?B?UXMzM1pJY2NPb0Zod0NtNVh1Y0xoTktKRlE5NDFSZXY2QnJOa0R0YzNuUkUx?=
 =?utf-8?B?MnZaeW5FQmtHUFkyc3hMQkRVaHoxZHJzZzAxL1Y1TUxZVjM5dktrTXBlWnI3?=
 =?utf-8?B?S0NxWERlRDl3MzRNeGw4Q3A3dHJ2TC9wZ2ZoMnRKYXptMGVNNVVtVDJTVUtC?=
 =?utf-8?B?TmlZa2ZpQ0JwaWdESHVISEtJbkJtQlhCam5UOWJFUGxaK3FRNVFTK3c2VjBy?=
 =?utf-8?B?NU8vb2Y4VmlNV040TzB5MGZPT1M1ZFhNTURvOGcrdnhWdUFCQW9YNjZQZ1l6?=
 =?utf-8?B?cDJHY1o0M3d0dldDOUpsOHpYbWdPemdlaTFxUTNVS3dqWHBUOGVUVjlyNXRh?=
 =?utf-8?B?U1cvRThJdFdYTm8zVHc5Um15aDM3M21KLzRRVndYYzlsWDY5djdEQmkyT0Vv?=
 =?utf-8?B?R0xWQ1dmVEtFWUw5cWErUzViZEVseEdSbEh0cGFQWmxsV3BYV3Q2UXlYRXNG?=
 =?utf-8?B?SkYreGxzaW5GNFowa05VRGhCdUIwcHRmRENxQjJOQm80b0hxU0JtSkdTSW1O?=
 =?utf-8?B?bG4xVVdTU1pPM1VKbXdPQ1libkpVcW9DUUhKWkNzVWorWnhZVlR3bm93dXJH?=
 =?utf-8?B?WUZvcnNnQ3p0dzRzYW1RR0M4Qzg5emxFRElSRk5nYjhMZ1BZSEFBbjhzZlgw?=
 =?utf-8?B?OVUrbEgxdFlkUVB6aGsrU3kvRzB4cVBGK2hPZm9PTnpuSFg3TmNQbFNTL25q?=
 =?utf-8?B?QkN1cjdOK2JGN2tyNFUrbXV4RGdqN0d1RTk4VWFjQmRPd054bkt0SE5mMjdk?=
 =?utf-8?B?c043MXZuNkNNV1RSdTZib29qYkJRZkV3ckJwY3M5RmZyKy9OcHUwYzU3am9V?=
 =?utf-8?B?T2JGSHJFd2QzVitDZWEzQUFOTlhyZnN4bGRzbWZEL0FZWWh0NkNWdkx2U0Ix?=
 =?utf-8?B?OGNTS21KYjd0RXRZOUVyb0VmcTZMK25oeTlzRS8zY2w5K1BSaHNDK2RjQ1po?=
 =?utf-8?B?S2lnMTliWlEzN2xETmpHRVJBSkNUN3UrRUtJWVRBakxhaHZmcGZBb2VCQ3BL?=
 =?utf-8?B?UkNRMnlxalVodWtFZFBGaTh4ODVPWENhbndpem9xL3VjNkxacndpLy90ejhH?=
 =?utf-8?B?SFVSUFJlUW9pKzVtVUgya216cHJQNEQ4YWY3UHRTb3g4cnVUT1JHWWdtSjJp?=
 =?utf-8?B?QzRUYWMzbjJBUElFSlREMnZNMGdUQmI1UkZDRGpZSmRKNk5jSXZzblJZbGxK?=
 =?utf-8?B?MWhTZUlROG0xYzVtRXlCb3RjaTRFdzBaZjRuRml4cExOS0Y0M0tVTVlscVJM?=
 =?utf-8?B?VjIra1hpN043cnlwOVgzWmZCZ3kvMzdkVkd5ekpkRG5LOXVJbUl4OHNTcmRB?=
 =?utf-8?B?dmpjV0NrUGgyMDc2bHR0YTQyWkJFVHU4ZCt4cmlzRFdGVk53MHg1amZpRzI4?=
 =?utf-8?B?UE5tRjVUOHNURWdWTGZpbzY5OE1La1BqSkFTQmdwekZlYUVUZk5vMEtTSkFI?=
 =?utf-8?B?UGhoQUZrOEY5ajRQOStrK0t2N2twd0JXRFgzL3IwUVpHamdEOTVpb1Y2K29h?=
 =?utf-8?B?K0VKM1M1OUUrUVFkSU1MY2xqcis3eU1jeGtxL2RaS0QvRGdwZHNmUlVlUGpS?=
 =?utf-8?Q?+SPTxchgx98ymxjuLvxAouFvSv8BHVoZ2+2OYUME5lj0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E8D4689EE25F94AB3F598333865C821@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a62eaab5-4d3d-459f-5961-08dc78ebf46a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 16:43:19.2759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAVqbs499f6g0sFe4QDwPL6g3rMBC+7MTFYB8An6u91WFvjDobKZU4S7HL7m7AMNv5KrgxQrWl1koP+38dVfx1TIVJRSOJk0hO50nq7UYos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3334
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA1LzIwMjQgw6AgMTQ6NTQsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQgTWF5IDE4LCAyMDI0IGF0IDU6MDAgQU0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+IE9uIGJvb2szcy82NCwgdGhlIG9ubHkgdXNlciBvZiBodWdlcGQgaXMgaGFzaCBp
biA0ayBtb2RlLg0KPj4NCj4+IEFsbCBvdGhlciBzZXR1cHMgKGhhc2gtNjQsIHJhZGl4LTQsIHJh
ZGl4LTY0KSB1c2UgbGVhZiBQTUQvUFVELg0KPj4NCj4+IFJld29yayBoYXNoLTRrIHRvIHVzZSBj
b250aWd1b3VzIFBNRCBhbmQgUFVEIGluc3RlYWQuDQo+Pg0KPj4gSW4gdGhhdCBzZXR1cCB0aGVy
ZSBhcmUgb25seSB0d28gaHVnZSBwYWdlIHNpemVzOiAxNk0gYW5kIDE2Ry4NCj4+DQo+PiAxNk0g
c2l0cyBhdCBQTUQgbGV2ZWwgYW5kIDE2RyBhdCBQVUQgbGV2ZWwuDQo+Pg0KPj4gcHRlX3VwZGF0
ZSBkb2Vzbid0IGtub3cgcGFnZSBzaXplLCBsZXRzIHVzZSB0aGUgc2FtZSB0cmljayBhcw0KPj4g
aHB0ZV9uZWVkX2ZsdXNoKCkgdG8gZ2V0IHBhZ2Ugc2l6ZSBmcm9tIHNlZ21lbnQgcHJvcGVydGll
cy4gVGhhdCdzDQo+PiBub3QgdGhlIG1vc3QgZWZmaWNpZW50IHdheSBidXQgbGV0J3MgZG8gdGhh
dCB1bnRpbCBjYWxsZXJzIG9mDQo+PiBwdGVfdXBkYXRlKCkgcHJvdmlkZSBwYWdlIHNpemUgaW5z
dGVhZCBvZiBqdXN0IGEgaHVnZSBmbGFnLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2gtNGsuaCAgfCAxNSAtLS0tLS0tLQ0K
Pj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2guaCAgICAgfCAzOCAr
KysrKysrKysrKysrKystLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvaHVnZXRsYi5oICB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgLi4uL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC9wZ3RhYmxlLTRrLmggICAgICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+ICAgLi4uL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLTY0ay5oICAgICAgIHwgMjAg
LS0tLS0tLS0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgICAg
ICAgICAgfCAgNCArKw0KPj4gICAuLi4vaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4
LmggICAgICAgfCAgNCAtLQ0KPj4gICAuLi4vcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvaHVn
ZXRsYi1lNTAwLmggfCAgNCAtLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5o
ICAgICAgICAgICAgICAgfCAgOCAtLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9o
YXNoX3V0aWxzLmMgICAgICAgICB8IDExICsrKystLQ0KPj4gICBhcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcGd0YWJsZS5jICAgICAgICAgICAgfCAxMiAtLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBj
L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgIHwgMTkgLS0tLS0tLS0tLQ0KPj4gICBh
cmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4g
ICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSAgICAgICAgfCAgMSAtDQo+
PiAgIDE0IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDE2NyBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9o
YXNoLTRrLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2gtNGsuaA0K
Pj4gaW5kZXggNjQ3MmIwOGZhMWIwLi5jNjU0YzM3NmVmOGIgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2gtNGsuaA0KPj4gKysrIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9oYXNoLTRrLmgNCj4+IEBAIC03NCwyMSArNzQs
NiBAQA0KPj4gICAjZGVmaW5lIHJlbWFwXzRrX3Bmbih2bWEsIGFkZHIsIHBmbiwgcHJvdCkJXA0K
Pj4gICAJcmVtYXBfcGZuX3JhbmdlKCh2bWEpLCAoYWRkciksIChwZm4pLCBQQUdFX1NJWkUsIChw
cm90KSkNCj4+ICAgDQo+PiAtI2lmZGVmIENPTkZJR19IVUdFVExCX1BBR0UNCj4+IC1zdGF0aWMg
aW5saW5lIGludCBoYXNoX19odWdlcGRfb2soaHVnZXBkX3QgaHBkKQ0KPj4gLXsNCj4+IC0JdW5z
aWduZWQgbG9uZyBocGR2YWwgPSBocGRfdmFsKGhwZCk7DQo+PiAtCS8qDQo+PiAtCSAqIGlmIGl0
IGlzIG5vdCBhIHB0ZSBhbmQgaGF2ZSBodWdlcGQgc2hpZnQgbWFzaw0KPj4gLQkgKiBzZXQsIHRo
ZW4gaXQgaXMgYSBodWdlcGQgZGlyZWN0b3J5IHBvaW50ZXINCj4+IC0JICovDQo+PiAtCWlmICgh
KGhwZHZhbCAmIF9QQUdFX1BURSkgJiYgKGhwZHZhbCAmIF9QQUdFX1BSRVNFTlQpICYmDQo+PiAt
CSAgICAoKGhwZHZhbCAmIEhVR0VQRF9TSElGVF9NQVNLKSAhPSAwKSkNCj4+IC0JCXJldHVybiB0
cnVlOw0KPj4gLQlyZXR1cm4gZmFsc2U7DQo+PiAtfQ0KPj4gLSNlbmRpZg0KPj4gLQ0KPj4gICAv
Kg0KPj4gICAgKiA0SyBQVEUgZm9ybWF0IGlzIGRpZmZlcmVudCBmcm9tIDY0SyBQVEUgZm9ybWF0
LiBTYXZpbmcgdGhlIGhhc2hfc2xvdCBpcyBqdXN0DQo+PiAgICAqIGEgbWF0dGVyIG9mIHJldHVy
bmluZyB0aGUgUFRFIGJpdHMgdGhhdCBuZWVkIHRvIGJlIG1vZGlmaWVkLiBPbiA2NEsgUFRFLA0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvaGFzaC5o
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9oYXNoLmgNCj4+IGluZGV4IGZh
ZjNlM2I0ZTRiMi4uNTA5ODExY2E3Njk1IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Jvb2szcy82NC9oYXNoLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvNjQvaGFzaC5oDQo+PiBAQCAtNCw2ICs0LDcgQEANCj4+ICAgI2lmZGVmIF9f
S0VSTkVMX18NCj4+ICAgDQo+PiAgICNpbmNsdWRlIDxhc20vYXNtLWNvbnN0Lmg+DQo+PiArI2lu
Y2x1ZGUgPGFzbS9ib29rM3MvNjQvc2xpY2UuaD4NCj4+ICAgDQo+PiAgIC8qDQo+PiAgICAqIENv
bW1vbiBiaXRzIGJldHdlZW4gNEsgYW5kIDY0SyBwYWdlcyBpbiBhIGxpbnV4LXN0eWxlIFBURS4N
Cj4+IEBAIC0xNjEsMTQgKzE2MiwxMCBAQCBleHRlcm4gdm9pZCBocHRlX25lZWRfZmx1c2goc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+ICAgCQkJICAgIHB0ZV90
ICpwdGVwLCB1bnNpZ25lZCBsb25nIHB0ZSwgaW50IGh1Z2UpOw0KPj4gICB1bnNpZ25lZCBsb25n
IGh0YWJfY29udmVydF9wdGVfZmxhZ3ModW5zaWduZWQgbG9uZyBwdGVmbGFncywgdW5zaWduZWQg
bG9uZyBmbGFncyk7DQo+PiAgIC8qIEF0b21pYyBQVEUgdXBkYXRlcyAqLw0KPj4gLXN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBoYXNoX19wdGVfdXBkYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LA0KPj4gLQkJCQkJIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+IC0JCQkJCSBwdGVfdCAqcHRlcCwg
dW5zaWduZWQgbG9uZyBjbHIsDQo+PiAtCQkJCQkgdW5zaWduZWQgbG9uZyBzZXQsDQo+PiAtCQkJ
CQkgaW50IGh1Z2UpDQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhhc2hfX3B0ZV91
cGRhdGVfb25lKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIGNsciwNCj4+ICsJCQkJCQkgdW5z
aWduZWQgbG9uZyBzZXQpDQo+PiAgIHsNCj4+ICAgCV9fYmU2NCBvbGRfYmUsIHRtcF9iZTsNCj4+
IC0JdW5zaWduZWQgbG9uZyBvbGQ7DQo+PiAgIA0KPj4gICAJX19hc21fXyBfX3ZvbGF0aWxlX18o
DQo+PiAgIAkiMToJbGRhcngJJTAsMCwlMwkJIyBwdGVfdXBkYXRlXG5cDQo+PiBAQCAtMTgyLDEx
ICsxNzksMzggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhhc2hfX3B0ZV91cGRhdGUo
c3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+PiAgIAk6ICJyIiAocHRlcCksICJyIiAoY3B1X3RvX2Jl
NjQoY2xyKSksICJtIiAoKnB0ZXApLA0KPj4gICAJICAiciIgKGNwdV90b19iZTY0KEhfUEFHRV9C
VVNZKSksICJyIiAoY3B1X3RvX2JlNjQoc2V0KSkNCj4+ICAgCTogImNjIiApOw0KPj4gKw0KPj4g
KwlyZXR1cm4gYmU2NF90b19jcHUob2xkX2JlKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIGhhc2hfX3B0ZV91cGRhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0s
DQo+PiArCQkJCQkgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gKwkJCQkJIHB0ZV90ICpwdGVwLCB1
bnNpZ25lZCBsb25nIGNsciwNCj4+ICsJCQkJCSB1bnNpZ25lZCBsb25nIHNldCwNCj4+ICsJCQkJ
CSBpbnQgaHVnZSkNCj4+ICt7DQo+PiArCXVuc2lnbmVkIGxvbmcgb2xkOw0KPj4gKw0KPj4gKwlv
bGQgPSBoYXNoX19wdGVfdXBkYXRlX29uZShwdGVwLCBjbHIsIHNldCk7DQo+PiArDQo+PiArCWlm
IChodWdlICYmIElTX0VOQUJMRUQoQ09ORklHX1BQQ180S19QQUdFUykpIHsNCj4+ICsJCXVuc2ln
bmVkIGludCBwc2l6ZSA9IGdldF9zbGljZV9wc2l6ZShtbSwgYWRkcik7DQo+PiArCQlpbnQgbmIs
IGk7DQo+PiArDQo+PiArCQlpZiAocHNpemUgPT0gTU1VX1BBR0VfMTZNKQ0KPj4gKwkJCW5iID0g
U1pfMTZNIC8gUE1EX1NJWkU7DQo+PiArCQllbHNlIGlmIChwc2l6ZSA9PSBNTVVfUEFHRV8xNkcp
DQo+PiArCQkJbmIgPSBTWl8xNkcgLyBQVURfU0laRTsNCj4+ICsJCWVsc2UNCj4+ICsJCQluYiA9
IDE7DQo+PiArDQo+PiArCQlmb3IgKGkgPSAxOyBpIDwgbmI7IGkrKykNCj4+ICsJCQloYXNoX19w
dGVfdXBkYXRlX29uZShwdGVwICsgaSwgY2xyLCBzZXQpOw0KPj4gKwl9DQo+PiAgIAkvKiBodWdl
IHBhZ2VzIHVzZSB0aGUgb2xkIHBhZ2UgdGFibGUgbG9jayAqLw0KPj4gICAJaWYgKCFodWdlKQ0K
Pj4gICAJCWFzc2VydF9wdGVfbG9ja2VkKG1tLCBhZGRyKTsNCj4+ICAgDQo+PiAtCW9sZCA9IGJl
NjRfdG9fY3B1KG9sZF9iZSk7DQo+PiAgIAlpZiAob2xkICYgSF9QQUdFX0hBU0hQVEUpDQo+PiAg
IAkJaHB0ZV9uZWVkX2ZsdXNoKG1tLCBhZGRyLCBwdGVwLCBvbGQsIGh1Z2UpOw0KPj4gICANCj4g
DQo+IE5pY2Ugc2VyaWVzLCBJIGRvbid0IGtub3cgdGhpcyBodWdlcGQgY29kZSB2ZXJ5IHdlbGwg
YnV0IEknbGwgdHJ5Lg0KPiBXaHkgZG8geW91IGhhdmUgdG8gcmVwbGljYXRlIHRoZSBQVEUgZW50
cnkgaGVyZT8gVGhlIGhhc2ggdGFibGUgcmVmaWxsDQo+IHNob3VsZCBhbHdheXMgYmUgd29ya2lu
ZyBvbiB0aGUgZmlyc3QgUFRFIG9mIHRoZSBwYWdlIG90aGVyd2lzZSB3ZSBoYXZlDQo+IGJpZ2dl
ciBwcm9ibGVtcy4NCg0KSSBkb24ndCBrbm93IGhvdyBib29rM3MvNjQgd29ya3MgZXhhY3RseSwg
YnV0IG9uIG5vaGFzaCwgd2hlbiB5b3UgZ2V0IGEgDQpUTEIgbWlzcyBleGNlcHRpb24gdGhlIG9u
bHkgdGhpbmcgeW91IGhhdmUgaXMgdGhlIGFkZHJlc3MgYW5kIHlvdSBkb24ndCANCmtub3cgeWVz
IGl0IGlzIGEgaHVnZXBhZ2Ugc28geW91IGdldCB0aGUgUFRFIGFzIGlmIGl0IHdhcyBhIDRrIHBh
Z2UgYW5kIA0KaXQgaXMgb25seSB3aGVuIHlvdSByZWFkIHRoYXQgUFRFIHRoYXQgeW91IGtub3cg
aXQgaXMgYSBodWdlcGFnZS4NCg0KT2ssIG9uIGJvb2szcy82NCB0aGUgcGFnZSBzaXplIHNlZW1z
IHRvIGJlIGVuY29kZWQgaW5zaWRlIHRoZSBzZWdtZW50IHNvIA0KbWF5YmUgaXQgaXMgYSBiaXQg
ZGlmZmVyZW50IGJ1dCBhbnl3YXkgdGhlIFRMQiBtaXNzIGV4Y2VwdGlvbiAob3IgRFNJID8pIA0K
Y2FuIGhhcHBlbiBhdCBhbnkgYWRkcmVzcy4NCg0KPiANCj4gV2hhdCBwYXRocyBsb29rIGF0IHRo
ZSBOID4gMCBQVEVzIG9mIGEgY29udGlndW91cyBwYWdlIGVudHJ5Pw0KPiANCg0KcHRlX29mZnNl
dF9rZXJuZWwoKSBvciBwdGVfb2Zmc2V0X21hcF9sb2NrKCkgd2lsbCBsYW5kIG9uIGFueSBjb250
aWd1b3VzIA0KUFRFIGJhc2VkIG9uIHRoZSBhZGRyZXNzIGhhbmRlZCB0byBwdGVfaW5kZXgoKSwg
YXMgaWYgaXQgd2FzIGEgc3RhbmRhcmQgDQooNGsgb3IgNjRrKSBwYWdlLg0KDQpwdGVfaW5kZXgo
KSBkb2Vzbid0IGtub3cgaXQgaXMgYSBodWdlcGFnZSwgdGhhdCdzIHRoZSByZWFzb24gd2h5IHdl
IG5lZWQgDQp0byBkdXBsaWNhdGUgdGhlIGVudHJ5Lg0K
