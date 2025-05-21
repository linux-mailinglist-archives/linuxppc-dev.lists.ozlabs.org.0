Return-Path: <linuxppc-dev+bounces-8837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3488ABF4E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 14:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2WdP1WQFz3c1g;
	Wed, 21 May 2025 22:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::618" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747832185;
	cv=pass; b=RviGM5hcBR5IYLThG1cgaFmMk1Cn3uLs8+gmlRDEs/wIeBN9RrXg7n/a0ofs99jVj+PKTCXhDP12ztzj1qX1BNs4IGMERPZZ5gVNNEDH+iCTq8gz54plNyp/ZWYO+7HI7wDKKaPsfC0gy7n3fD/2WnbtGBR1av64YGsIu0jvu2U14NLCfR9HikvdWAqlqM4pCBJgDBGEUpqlnjZsmZNlBbTm6gnu3tFSiNSF6cct/9rxWES4pZQbihEoOHA5zZjBYz6hIEspXJZ5w5QAfEYHid6PobMxShkDH/NOKzHHxquv+rg8iN/MLUZcEFkrIuXtMkvn65YOkSC3ITyc+EQ7Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747832185; c=relaxed/relaxed;
	bh=kG3QufDy4rAjuxdTSJ7AtmkGs5KbPZmZtohY2N89kWg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hlKlx9CMnqsnl1PFIneAHDMoXa4YCL3XaGZgxt2QckofLPjjmkHTd6A1PgVpD2kV/Spx2t7hLzmAciZnbYA4nzfdtakbqWlgpbP1oxrAWyfsR/6la8bkthFLuUfIWjweTpvl6De1pqR2kyKDZZFbTc9Atx4cXLKYFLEEt3Nokb6ZQ7kaJmNvE5JIe4rjaSLhXDbGO8JNTTRGT9Y1eODkEvb9N3fwjfekl7YbZk3R8AfgNh5c9s8s8na56xVDcbZv5Hgp+fBOI4Ail0WIEiRyggKnBBjEiCgAnua3VVJ9q+0f7ILe+qUPi3QPnuQoF9nx09xGUyKfz96g8ST+GVJxrg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=On+zHeD5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2614::618; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=On+zHeD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2614::618; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20618.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2WdM2Q2hz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 22:56:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRgMDDTVB3aBLk0Y4iZE/85ixz5JdJ+W39MiwVlohXoZw94yIynqPXdwwJ39mLw25uqObHVPlHV/o0rz5gVGVsgoG9RghDAQ5kdehdE3xVUka3J33O7DTd28H5d17tkXpXNHx1hGOjWd3XOkp6P4ku7/2BX3zDGj/vu2WAftubPIjVjJifQuA4PcROFATU8fHMNK3FDPviaAjRygoLRxwFNDdiJ2MBYDeg9XKiVK0Z+L/gF5kd8F0E8J76/q2Um3334i4dgCLqv0sAMa6c3ZyGdzcAjk0gaZfr0rNRuvqv1v3/0f+X61owPYOMJcDDupV5ZQGGEY94k+dQraUDoYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG3QufDy4rAjuxdTSJ7AtmkGs5KbPZmZtohY2N89kWg=;
 b=VC+TFKNNqia3Tk7UA+3Xd51SWw1n/argKS5xDvYYknSDHbwrI7ZZSHtFo42fFJgM0FDgq6JhpvDGF86dAvFsi+QGl1bqSqgTKsxLQqMbqZSyhP2TS6R/LsT+4cxhw6va0KqdIPhoTIq7zPtgLlagAgUBkVGv4IRz6bKp4ZEObPmeRauHU6m0cRVMMmepXV5kmNZC1wVW0VyiQgxrjHpXU2E9ETxnDfCWa5PfH6NzoZRw25HJvnN4H+QjvoNDRHsJGhFnqkbxrP9bY5tVBIWdm8GzmmDi6unZz99Ufqojc68jDCFUaorkji22pvZwoVUU7Fii843p0IA0j+TQKCpYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG3QufDy4rAjuxdTSJ7AtmkGs5KbPZmZtohY2N89kWg=;
 b=On+zHeD5VCs+hPicKW4xTfjWn0uddgdfsRFPjVM87wp9Px6tlv6HsKO+vQGlgbgBcUyqKc8oU7uerusjSZBab27hNACf73FE2BUkl8Sj/X6x7PfAS5St2QMJV5hR952/7IVoab7p5vMKF3M+GPlQZWRcHx3x07llstqCfaNzABvSzQ4JwzzipGEM5Z740AK2IZSH321SwExqEbIMbAgIj7jeeeEnYwwR/73r8Y8Vmkt3tfOgevf8dkfOWkg6YuHqDGCbRExhTfBHCoEmokTRDEAdTq5uXcOozE8ccuQqNOs2nMntgHRJo2O3D8CTYzjlAOykkXu+C7aUXecsJDxCHA==
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com (2603:10a6:208:ed::33)
 by DB5PR07MB9417.eurprd07.prod.outlook.com (2603:10a6:10:4aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:56:02 +0000
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a]) by AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a%6]) with mapi id 15.20.8746.031; Wed, 21 May 2025
 12:56:02 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Paul Mackerras <paulus@ozlabs.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas
 Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Crash in __do_IRQ with gcc 15
Thread-Topic: Crash in __do_IRQ with gcc 15
Thread-Index: AQHbwUvuWBilynjsS0WjxgWvPd1MdbPNZ0mAgAP/yYCAC7W+gA==
Date: Wed, 21 May 2025 12:56:01 +0000
Message-ID: <09dac01d-b2f2-46eb-b046-8cc8a524e5f4@cs-soprasteria.com>
References: <aB6teOoVLWkdvyBu@bruin>
 <4a2c63a7-4ed2-47c5-b5f7-19e323c267f5@linux.ibm.com> <aCP6sXStzfplyvXm@bruin>
In-Reply-To: <aCP6sXStzfplyvXm@bruin>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB6196:EE_|DB5PR07MB9417:EE_
x-ms-office365-filtering-correlation-id: 2e2f672e-2a8a-4ec4-6e9f-08dd9866d71c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGpPaWtKVitFVytZRmh4cTZmSElFMUMxODBOQXQyVE4yY2d2YjFDUmdmTE12?=
 =?utf-8?B?SHF6TzZrLytYbTRCSHB0NkRWQkI4VTdqdS85T283bTBia0hiVW8rOEdSSVpL?=
 =?utf-8?B?Z0h0bG9BNmJ2V1d4VDVmMFFTeUpBZ0Fwb3dEcmZqNVg5UXV5eHNzMU5HOG5z?=
 =?utf-8?B?eERSbDk4VkF3eFdRdDdkYzMxM3RXZG05eDRVWjRtZW41MjB5L0d5dUx0YW1y?=
 =?utf-8?B?OG94Y0tlazljeGZDcSszZGRqSXNtcVhrd3dtTFJMMGlubUhaT2licG9NRG51?=
 =?utf-8?B?T2lGR2xuUXlvSkphS1RDZmVSTjVhTTRXY1FHYkpaUmxWRFZlZEZDVHExSjFm?=
 =?utf-8?B?bmc2UDE2WDd5R2dpbHptYTJtM2VJcitFRE9WbktJZGJMNnoxOTIreDJENUZX?=
 =?utf-8?B?a2NCaWNkbVFwR2FIZzkzaU40VWVsd0FrbDRhVlVhNUs0NzJ3S0Zhc25EMlkx?=
 =?utf-8?B?ZHEyN1VXeE41aGdDb2pJVFVFcWpydUg3WkNoODlJajhReVJVaERqYU0wYXZw?=
 =?utf-8?B?dU9yVk1sR2VzKzJDbFZxV005cmpQcDhobFNlcWJCUDFEemNBRzBLRitiaHpu?=
 =?utf-8?B?d0p5Y1NpRUxIUlg5aFg1L2NnZldVMXBjSU04cERucCttVWhiZFRlVFFZc2Zr?=
 =?utf-8?B?OFlDSVRjRithNVpiYW40T2lnRUFFMndmY3ZzdkRPNWFjVUovOUVoVFhLWURN?=
 =?utf-8?B?dE1KbW1yUGRwc1lQNjlTckdRSGZwc2NxMU1HSVJGbkxqMHMzR3k1bnNhRzVH?=
 =?utf-8?B?dlA2RzNsWG03N0pMZ0NDdm9kMmk1WFhoL1JiVzM5d3Z5REpXUHk5MzZMcFFS?=
 =?utf-8?B?aXdianBQanoxRytDekxrcmU2ZXg1UWwxSWRkOSs4NERaZGNWalA3UWIvZmtP?=
 =?utf-8?B?OHBTZ3d6U0xNSXVNODFYQkpkS0xJdFZNb3grV25DRFVhSDJOU0M4YmVXV0xk?=
 =?utf-8?B?VFBFV0VuV0crcGIrUHVaUXdycUl4TlZvOGtGUk9jN1FTWnVlZ3YyTmxXZFIv?=
 =?utf-8?B?RktjTHBaaVdneHl1d1BCOWFSOEI0OE5uUjkrZHZFWWNua0NJdHpISFZWVlpk?=
 =?utf-8?B?cE5Nc0FHVlYvUHNaQlU3bWJGelVEZ0FxdEJsVUVFeFlGM1BiN0VJbW16SjhY?=
 =?utf-8?B?dVlmVyttU2IyY2dzVEVkOGJMZEVPMHhHeElnSnVweDZqUnozQ0F1Yk9WZ054?=
 =?utf-8?B?dkxwbzFVWTlwdGQzNVFXNHltRTlIVEFLSjhTWElUNHBMUXJXdklkL0QyLzB4?=
 =?utf-8?B?VC82UVZrRmhTTmVSdU55ZUZlTjZTbUZob2dRUThrdDE0TFZORHpVbFZnMWEw?=
 =?utf-8?B?NWlHaTVXVzlEUmsrR3NIT1RTdkpMWnN3Q2YxZXl3NlJkUndkYU9WZUV3dGFa?=
 =?utf-8?B?YnBLNXVzU3hXdGZFM2ZwdVB1RnV1aWxTWmFSMlFjYkFvYjdqT1dqOXlwTW01?=
 =?utf-8?B?dWNQZlZXSjBjZkFGdHdPbCthR3publNMOHhmanNoQ1lTQncyQm1pS2NmS2xK?=
 =?utf-8?B?SW1FUmVPWkkxTlM0TDJBYWRvbExxRVZTOERjNFpRWlltV2pFUGllcE14dHI0?=
 =?utf-8?B?NTFFSkxyVC9CZ3N0UUVUcFRtM1FFMitSV3RJM1orUUQwemRmaXJCSDM1VUxL?=
 =?utf-8?B?emFPQlNvYTB1QTR0VXBkSWo1RWFuQVNKQWU4RFE2c0ZzU0RMYUdwemc3dFo0?=
 =?utf-8?B?b3FTd3JuMDg1Nnh0RWNpVzA2UW45Sjh2dUdxNHRkcVRpQUJqQzdGM3BxZzM3?=
 =?utf-8?B?RTl0QitFWVR6QnZ5VGNhcnA0OE5sRUlVblJPYk9HTFZOK1Y3U2JXd3BUZHRZ?=
 =?utf-8?B?NUZIRzRjUXNjWHNBaU9BZUNNbm1ZU2dOd3JDNFN0REFMbTFwT0ZtQ0wvamVx?=
 =?utf-8?B?NkdDd1dCclhPeXhHZlRaRVhvY3dFUVRmL1BEeTR0RnAxTHVHdlQrQm13SWhO?=
 =?utf-8?B?amc4RGtuSm9SckJyMFMvZzd4V01WNGQ5d3BkQzVBV012bDlQd0xUYmdyQUoy?=
 =?utf-8?B?RUpyQW5Xd1hBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB6196.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmZHSWVBLzR3cjlPdlVxN0p3Tyt2RXJodnlPdEhFWjcyejk5N01tdlc2cUFI?=
 =?utf-8?B?VStPcmVPQ0hkZkFBN2U0ZDlBaGZzbXB1OWdrLzdIWUZJV0ZJbHJlWWxMV2tl?=
 =?utf-8?B?aU1sT2VML2tOeU9xYUdBZUIxdFNlZXNEakgrK1gzdW1sWHRzRGIyTUJOa0N2?=
 =?utf-8?B?Zmg4R2ZnN3B3RExZSHNtMnhXRWFSMFFYN1U0aU1qaHgrWG4xMHlFWFMrMHpT?=
 =?utf-8?B?QW55d3QvUERlaGJSQWtwVHZ4cEdkcmFOWHhGRXFRWE43U1N0MGN1dmRNVHBr?=
 =?utf-8?B?YXlsUWZEOEdnVlVKbjJBYUpuV1Q4VnkwTHJxc25jU3hXYkFIbEJ5VThmS2o4?=
 =?utf-8?B?RklJUW9neVI3SE9VeU5yYzFqYXpMTTdJQTJrdzNlZ1FERDFyWFd2ajYvdXYz?=
 =?utf-8?B?Uk1nNEtWU1l1SEVKNzBZTDdXcm5aL1pWQmFOZjNKc0hkVzJtZFVmMkFCcDlE?=
 =?utf-8?B?dkpZU1VpS3h5NjFoWnRUNE5PUU5xUVdkV1kyaU8rWWhFRTJWV0RGSGhSNWRT?=
 =?utf-8?B?OFp2UHNVZkN6bEdud0dZUkhEODVhaXRRc2NvamVBSjVBVXpUNEc2cEU5eFNR?=
 =?utf-8?B?QnIrTUJDVVd2RHdpYURldGxpc0lyUmhKTnBpM3pSVUdQNmF2V1crZVo0b2xy?=
 =?utf-8?B?TmVjU212Y1FGLzQ4MVpPYlE1ZVJIY3ZLK1hFUGJkc0MyelhrTzBkQ0dUMkE5?=
 =?utf-8?B?K21lVWlON1FseXc4L1ZFdGVTY0loWXl0cUYzOVFkdGVEUU1TSUcvSnRTa2RC?=
 =?utf-8?B?dXhyV200d0lqSDU0aHBDQ29vWFR4cFM5SUFFT2h3cVZqQlRTUnlNS1ZDUVJI?=
 =?utf-8?B?YVB4enk3dXNKMUEyeUYwWjdwajNwVGV2SnN5SHM2UU9aNU83dHdXenV1dHlG?=
 =?utf-8?B?WitLelp5d05icXhkVHNUNjJTeVp2YW5ZTktKVTlpODU4Wmk3RzhuenJPUERh?=
 =?utf-8?B?R1IybEF6QzNINFFBWnlQa1ZqUE1JeFlJbENDSVdTcGJoTDhpQkt5RVpDUHNx?=
 =?utf-8?B?V3hwQVRWWnhZQUV2emRiWnRTK2xqcGlxZ2RLb1JTQ1V0STM1OUpLZ2FyMjYr?=
 =?utf-8?B?ZU9uWkxrbSt4aFhQZkZ0RGFTSVdjZWpNZTRZUFJmUVI1UFdjdUtQK3VuWjhl?=
 =?utf-8?B?MUVnTnNjVEk2bm05VUpSMjlHSUcyWGhCbU5JMlI1b3g0Wm5DQXZrVFBqUnNp?=
 =?utf-8?B?SlNONnoxcm13bXhyY0w1MXpvUWVzQ25JVXBudEI1Y3M5a0xlTU9uOUxtVDlM?=
 =?utf-8?B?cFhSQ1FMN1F5RkJzQThOWFFkNzA3S3RDZVFrcXVoZjg1MU4yUENsK3pHcEhK?=
 =?utf-8?B?bXFUY1d0UW52Qi9SWHkxbDg2ZVV0OW5sU0QyejhoS3ZpcWd2VCs0WjlmZkFM?=
 =?utf-8?B?c1NNUjVMVW9NdHVuUWtXcnJKWFl3VE9IcGpidlNLYkIyNUdrOWpocGxTVjVm?=
 =?utf-8?B?Rmw4OVZsbm1uTVUrbndGZndjVjBKU2hJSkNJSEY1dG9IY0hHN1gzUGhMTFZ1?=
 =?utf-8?B?aGh1YUNWbkwzSkE0TDVTQmhQTzdTQkY2clVjREdhTC9NZWFtYTZMOWVwNnh5?=
 =?utf-8?B?bHZWWk1xZzlOTmE2bjBCdGJKU0ZXZkZIRzlIOGNHeE1sUUFGbGpkc0JmSnFj?=
 =?utf-8?B?bzF2Yi9qSkwzYlFlZkw1RFZYREI5dVFNeWt3RFJITlBMRGhuamx0MndUTjlF?=
 =?utf-8?B?VjA5OG1LeUxWMnpWTU1IMlhLRTR3cnBZdlhuTitueWNxUFdNSk1OTjVCTVRU?=
 =?utf-8?B?eXdxcUxWNHMvbkw1Rno2T2RnbkRQK0dPcFQwT1FnOEZONTBNanVVaWVhQ2Jw?=
 =?utf-8?B?Z2dSdDVrU3hVTXpWZG9Ndk55Q1d2ekloRFM2Q2lJeFBLS3N2Um5Ydjc3ejVw?=
 =?utf-8?B?U1A3Q21tWThTQjFiWWtGbHlQalFjM3J3ZVVlS1hDTytYOFBjaU00VkxDU3Ni?=
 =?utf-8?B?eEYyMkhMQmVxaEhEUlhpRnpUa0t3RkRnQkxMKzVRaVJkK0dxVmN6WTlHU2la?=
 =?utf-8?B?R3c4ZnRVWnl5ZTc1RUZNWHRjUU0xUk41bmczeStpSWc3WUlDa1QxakpETHJ0?=
 =?utf-8?B?Y0llby9PRnNPaDlYQUZya1BNV3grRTljNWNTSWJjL2tTU2RKU2FDYXMybmQy?=
 =?utf-8?B?Qk1aVnFzTjhyTERySysraFVpdkVHelZBYTlZOFFoeXA0aXVpZ09FR1BBcjFN?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6A1A9C86F971542AB9D1C453BD675A2@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2f672e-2a8a-4ec4-6e9f-08dd9866d71c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:56:01.9490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEOF5bGaHfWfcCBHRMhFPwVNIbGMJMq7ZaNXlGSaKT4ZyMXbi118alxUMrfLE3NQq6HWEyyarfZPy48+iTSl3aJwbZ332RWIr8BzvvoW8CPOXcf8jtU8fwsZ+/HMKLbm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB9417
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DB5PR07MB9417.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCkxlIDE0LzA1LzIwMjUgw6AgMDQ6MDYsIFBhdWwgTWFja2VycmFzIGEgw6ljcml0wqA6DQo+
IE9uIFN1biwgTWF5IDExLCAyMDI1IGF0IDA2OjMyOjI1UE0gKzA1MzAsIE1hZGhhdmFuIFNyaW5p
dmFzYW4gd3JvdGU6DQo+Pg0KPj4gQ2FuIHlvdSB0cnkgd2l0aCB0aGlzIHBhdGNoLCBJIGFtIHRl
c3RpbmcgdGhpcyBpbiBteSBzZXR1cC4NCj4+DQo+PiBNYWRkeQ0KPj4NCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJx
LmMNCj4+IGluZGV4IGEwZThiOTk4YzliNS4uMmNlN2E0ZjJiMmZiIDEwMDY0NA0KPj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9p
cnEuYw0KPj4gQEAgLTI3Niw3ICsyNzYsMTEgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IGNhbGxfZG9faXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB2b2lkICpzcCkNCj4+ICAgICAgICAg
ICAgICAgICAgICAgW2NhbGxlZV0gImkiIChfX2RvX2lycSkNCj4+ICAgICAgICAgICAgICAgICAg
IDogLy8gQ2xvYmJlcnMNCj4+ICAgICAgICAgICAgICAgICAgICAgImxyIiwgInhlciIsICJjdHIi
LCAibWVtb3J5IiwgImNyMCIsICJjcjEiLCAiY3I1IiwgImNyNiIsDQo+PiArI2lmIF9fR05VQ19f
ID49IDE1DQo+PiArICAgICAgICAgICAgICAgICAgImNyNyIsICJyMCIsICJyMiIsICJyNCIsICJy
NSIsICJyNiIsICJyNyIsICJyOCIsICJyOSIsICJyMTAiLA0KPj4gKyNlbHNlDQo+PiAgICAgICAg
ICAgICAgICAgICAgICJjcjciLCAicjAiLCAicjQiLCAicjUiLCAicjYiLCAicjciLCAicjgiLCAi
cjkiLCAicjEwIiwNCj4+ICsjZW5kaWYNCj4+ICAgICAgICAgICAgICAgICAgICAgInIxMSIsICJy
MTIiDQo+PiAgICAgICAgICApOw0KPj4gICB9DQo+IA0KPiBUaGF0IHdvcmtzIGFzIGxvbmcgYXMg
SSBoYXZlIENPTkZJR19QUENfS0VSTkVMX1BDUkVMIGVuYWJsZWQsIGJ1dCB3aXRoDQo+IGl0IGRp
c2FibGVkLCBpdCBmYWlscyB0byBjb21waWxlLiAgV2l0aCBQQ1JFTCBkaXNhYmxlZCwgdGhlIGtl
cm5lbA0KPiBydW5zIGp1c3QgZmluZSB3aXRob3V0IHRoZSByMiBjbG9iYmVyLiAgSSBndWVzcyBp
dCBuZWVkcyB0byBiZToNCj4gDQo+ICNpZiBfX0dOVUNfXyA+PSAxNSAmJiBJU19FTkFCTEVEKENP
TkZJR19QUENfS0VSTkVMX1BDUkVMKQ0KPiANCj4gb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
DQoNCkkgaGF2ZSBub3cgZG9uZSBzb21lIHRlc3RzIHdpdGggYm90aCBnY2MgMTQgYW5kIGdjYyAx
NSBhbmQgdGhleSBiZWhhdmUgDQp0aGUgc2FtZSwgc28gYXQgdGhlIGVuZCBJIHRoaW5rIGFsbCB3
ZSBuZWVkIGlzOg0KDQojaWZkZWYgQ09ORklHX1BQQ19LRVJORUxfUENSRUwNCg0Kd2l0aG91dCBh
bnkgbWVudGlvbiB0byBHQ0MgdmVyc2lvbi4NCg==

