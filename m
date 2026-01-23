Return-Path: <linuxppc-dev+bounces-16179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO2EAunWcmlhpwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 03:03:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC606F6DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 03:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy1Rm4HYgz2xJ5;
	Fri, 23 Jan 2026 13:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769133796;
	cv=pass; b=P+Jmwl9Ka3tKChBo1RMh1fdCbcpV3heYtosmZxTez7C0mirW4hwtItlF9EwWpSFxhmfupBI8bM2rS0YE7+1n7P5406AwzVSNStZ1OIB9rvdB2JekNCZaM0GIm0nuqLWzrRKrJgF8C78/CIBQqPBOl+qH9ou1rwt+Ahnkmlc8CCO8OT8yCGWdM6JVFTjtPbMHMxzoDmtQqsZsZeHXYtctBbEEkZM/+b8nsyzYVCXgQdIDt7xv2uEiGpWLVEAqpGU5a55IiMqkV95QK1YedEvWxotv42P31Qsb5b/9jusXvXhNzSOZ0VcnamYZi8JT6UvmY8SxZxRbrwN3oWEBvDfgig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769133796; c=relaxed/relaxed;
	bh=Z2+gfhpbAKFnoGbDKDGaL4VqP6A6VQbCIUe7wbNIvL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fhZViTj7SxOc91Enzw1URJpME6P4VADHPNvFjYXWiN5kiaRFqKEBetwTP6+wh9nGYPRmCj9OsBS3KXsa1UbJk3GQ1LWTuvZUsjqmKKEfcEHAU60W6vNnwB79gOKMs1SArNLk4MGL7rhAaDqP16KzhBae+HLhv1khru+I8MM3MEhBwSUsk23GeDGOSN+mFrC02Y2G9WxM8NwcB7KIwj7+WrrJlSILKnoocgzQQxol/1uVUuGJX7WS+kc9EEjTlglGEMCcQ2WxJHhjybhl5PtdhiIKzGyj7SEEyut+zAE6I0X60Sw/qwj+ulYtZevhCa/T29Ji7yEW8a6T/H4UmmdDsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iPEy6hLO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iPEy6hLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy1Rk4RRtz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 13:03:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFFp4vS2uAG0rSoDZqsQi+gdcLezrxVU/UKykKmHKo1B8nWLaUEMyQJPd+TLfDGpSq06aTN306tdU374NqQp8eOnJCGpjp93VK++EpGpvbdnJyq9yTxGt2SgfkXOskRncVAdSLD0rm0IoXoJ/lMJUDaU3LijRgJTsgqZs/czJzlLghwpPHfwJ4AkqrWDc9X7x2efMYXzicRRmXyTJ9506SXrZr/sLHVv6+YpeOPLxxsyWdsVPd2oN9v3rgOd/UVmCswwILIkI0yavzAG6DyftqAfKYuoPXjHBjqcSOnqaV1IxlOiN9prUDedUy6F8esZGHLLxpwAzRJA87YApkRfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2+gfhpbAKFnoGbDKDGaL4VqP6A6VQbCIUe7wbNIvL4=;
 b=AhhQtulBeVgduM7hPazvlDXcqDLPHUE3SmxV5S3ru3/Of0F+mDzB6ak0YbVjHZCIGgeV5bktB7U6xivONA7TukqIpGWf1gVmYLjtrwyYHxcdT9XxeYp3L0xij+SwIHBn6M4SnbcZgyy7bBpKTr3QZWwp40zPhDPJcO1ki9UAfQzvNnfFYQXwLPTJYytqvS3KuKbzKyXbuaX5Wuk+0YGiOCM9chv9dJfaIKx2lwecLONxROWwBLD8DVBfwfSUl2iW3ccez8t0re3sXZaY4wLCMdvhq/fuyBXtf1naolkHakporbDILhmUUtu5KHFj8t3+9pY2nS0Wo9VFjcKHrngodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2+gfhpbAKFnoGbDKDGaL4VqP6A6VQbCIUe7wbNIvL4=;
 b=iPEy6hLOeGlIEWlLpyP6Cb37kdZkXZMWoOnwE95kdUb9GtE6UIICM9eUKzJhX5+XJ4mmcQdwsxz/S8TeP/goPIAMaFhdy3lmjnHdryu3VAkBGxbRfWhJnWuSYVEf8Vt22jeAhRvVPTTc2SWtOq4UQKfyqy+uIwND6at8bBkuuglbr7NrKNkY3FGYHw3g7/++eUAAUIZPNypFSXgdGmFp2xIsUNhYh3346NoY/VyhGDT2kk8YfNUoS4Wbqbv/sy2jHTJ/r2aEmO9fH5lIBH4KfJjGTJYeERuNFQW/tDF0Rmlzk5tDdDO+VFjbiW1+Wjz+XkG00NLQv06TEKOwNlyi9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Fri, 23 Jan 2026 02:02:48 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 02:02:48 +0000
Date: Fri, 23 Jan 2026 13:02:42 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, david@redhat.com, 
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com, 
	willy@infradead.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, 
	jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Message-ID: <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
X-ClientProxiedBy: SY5P282CA0153.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 07921699-b4ca-47a2-89a8-08de5a238182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG81VFFBZ3ZSZFF2UXpKcGZaMnVoWGRObEUralZLRDZTVG9UaW1YZEJnaE5x?=
 =?utf-8?B?bGpmbStCamRySGtMMzJjTnJKaEliazA4VGdjSCtNUUI1aytKV01CSEYxaXhG?=
 =?utf-8?B?Q1ZlSS84dVJURzhPYnovaTNwOTVvM1BkUFNzNFNnT01nYSszNzVITkR0VnFt?=
 =?utf-8?B?RUFSdzNqYzNmVlRBSFBvUmNUNCtJYVcwdHBiMHpGV0gzWG9YV1YzM3h0NWhH?=
 =?utf-8?B?TjVzcnR6cGZRU0JDd01xckhPRWQxays0cmh1QU1jcmZyMDF6Kyt6VFVQYktn?=
 =?utf-8?B?Mk0yZ3NSN3ZUallqdUFlSU56Nzd5dGZaNXp3WFduRmRuNzBvby9NWi94cDhD?=
 =?utf-8?B?NG5Ma0xZVGducExTRFlFZ3VPT3dZSDF5M0RhT3E1WVZQa3hWRFM2OFlVZENs?=
 =?utf-8?B?SXRJaVJXOWk3UTZBNTJqeDdNOEFuZEpwNXpOaWN1UXVFRUpyWVVjQy9XMkl1?=
 =?utf-8?B?VHhsbHRTbzhKUlQrRnNqcENmSHJGWE91ZkZ2cjZCTHc4TnkzZFppb2JmTHhk?=
 =?utf-8?B?TUFpMS9HMkxHZzF1REVjVVZXY3JQV1RLVko3Umo5SUoyTVVnSDdQbEhRVWNG?=
 =?utf-8?B?YUNYbE1xTmh4UjR5ZWN3eUJ5TGp5ak9wOXUvemhraEVvMS94WW1vRFZYRTVl?=
 =?utf-8?B?Q0t1SnBUaGIzNUJRWUcrVTdrTVZ3T3ovdmE5bEphSUY5TlptdTVrUHFrTnQ3?=
 =?utf-8?B?NUh1WUZBS0RYdlJLek9pWGljNmkvNTdObHhKYXVQTFlYTTFMVU9jNE8wd1lD?=
 =?utf-8?B?bThMYVJIMWdhb2cybVM1QnhBaE5IV1hXMyt2TTRQeXFlSnJDRXhyNzdNYmh4?=
 =?utf-8?B?c2hDdW5LTVRSaC9oUE4vYXRYc3E5UUNpWG4yVkQ2RU9wMitGay9iYXdYWngx?=
 =?utf-8?B?TGtBSzYvQ2hsK1dyWHBuNE9uYXFIZzNoNEFEM0w1YXRaMlRBclVYaDlTVWRt?=
 =?utf-8?B?NFFKeHYrVC9TejNwSkJRMEJPZkYzYmR0SEJKNXpGODZUVlVYK25VbjhxT1Bv?=
 =?utf-8?B?OFdlbVUxU1BOa0E4MVU0cWxKeTNHSDZwRGRJT2V4NFNrc2w2SUQ5aGg4VFVa?=
 =?utf-8?B?M2ZkaklTcnlFWFBJUVFhSlZBOERkQ0Y2ajc1dFE1NnhucVZ6Q1l4bFpWbmlH?=
 =?utf-8?B?QmhwOGdxYkVreWRyUS8vMWRMRkUvQUxpRUM0RGJLMXZoaGJrOUtscWd6TTJR?=
 =?utf-8?B?bi9va0x5dXRCeTJtSTFDRmVRTlFYc3ZTbXZsczhhT3NNNVQ2c2o5cHcrclE1?=
 =?utf-8?B?MytKMXFtYXM1czdYdjBwQzY4Snk4TDI0Z3d2eUJLd0Y1MkJqbDljSnRtd2Y1?=
 =?utf-8?B?d0xieTB5bTFYVTNRSmdQSGhqTEtpb2d5aTV4SXMzN0U2aVE3K1oxMEh6SG9q?=
 =?utf-8?B?R0hQeGMyWlN4S1MvZ3pJbTFTUnU2dGhWSHplbkN4eElNYytoMk03QWtXV2FD?=
 =?utf-8?B?OTFrVVdZOG54TjM5Vm4zVXZ4TEF4VEFvWkptcHZ5SmJzMk9yOHRBYjFYbk1X?=
 =?utf-8?B?Mmh6L1plbE1lL0RVazRwelhHYXRTMzl6T3M4ajJXOWdkdGdKazNRMEdSYmxC?=
 =?utf-8?B?djZPQUR2d1Jxd0YzOWhpTFhWZEhDRzRPY1k2V25mVnY4NGdzWVhpaDRuTFZZ?=
 =?utf-8?B?Vy85dnhsaklUMDJ4Wjd2US9hbVZzYUFxcUJkMm1SUEIvejM5ZEY5ZXUvdVVN?=
 =?utf-8?B?Q1BvcmQvbzJMQ1pXL3ZPREl0WVJqY1phZjRUZy9Ka1djUzR0d08zWVV2aDY1?=
 =?utf-8?B?cFZlSkdQMXNVNWJsb2k2akFTM3EybGN4cWt1VDg1Zi9iZzRsUHorRG1SS0Rt?=
 =?utf-8?B?UXErOG1kNGczNWJkK0dUMnlFYVY4eHBCRkd6YVdaM3VaZURrRzF2Q2ZsRkQr?=
 =?utf-8?B?N05pTjRXSmgwcjJ2UW52VElBanI0S2Y0YXExM1ROUWNqak1QU3ZtNUloU3Nk?=
 =?utf-8?B?dEsvYU8wdGpYZ1UzbnlRV3RvVFNLQUpwV1EyeVBlUEZkMytGUFpKVGRkUEZs?=
 =?utf-8?B?N25KRVhsSXpCQ1pLN2F3RGlaN2F5aGNPNk56Vk5ZZjlRTjFnZVVRaDc5NTY1?=
 =?utf-8?B?d3d4YmN4YnZ3eGNJZEdaRGphOHkveXZXa0dDYzI4UTBQcDV6dTFJTWdEdDdr?=
 =?utf-8?Q?QoMs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGxCNkd5OEFvemUrb0EyRGJ2dXFTNGdZRGFWTm5XYndiTVFXRThYSlo2cTY2?=
 =?utf-8?B?bThCWVlUMmM5Vm9Oc1VzQitxQVBDczFnZjEzQitaWlFDemgxSWpYRkU1SGp6?=
 =?utf-8?B?SGdrQlRVT1NJWTQ2YVpMdlJ2QTdEM2JVWTJKZ013NkNzSmNEV1NSV0l1a2N5?=
 =?utf-8?B?OG1CYlFDZGltVUg0UWNPakRZc0xZZmxjRUR2OW5Sb2FsSHBZZVFzZ3Z1S2p6?=
 =?utf-8?B?YlZVamNobFRtR21uS2htdVJ4K3I3dDlaZEFXelphOE1SKy9kVTVQaDhwRFJq?=
 =?utf-8?B?REdERHkvSUZud2wwOTV5cW9RdXVCMDVGeXh1T0YwclJua2h0NitHMlQzOFN1?=
 =?utf-8?B?Si93WXhSOUdUT2JZKzdwbmtxTHFyODBZR3ZXd1ZWWlhHUWJxNEFqTXdWL1Z3?=
 =?utf-8?B?WThINnVqbmlkcWpSTzNKVWhtbWRSWDJoRzBQSHdtdlF4bDUxbzdGcWllYkZI?=
 =?utf-8?B?WE9Qd1g1VEtqY0wvNWtoNitjVmdzNlZnWUozMHlva2Mya3VFWFBiaVFtZDha?=
 =?utf-8?B?RFBwaUhsdEo4eXFac0xWdW80OGFJdUpqT2E4dVVpbHhvOG5vU0tNbXRPVXVH?=
 =?utf-8?B?YUFJTE9zVEkzQjN1cXZnSDlRZ2w2VUwrRVhrSGFDeXF5YnJmcGJYbnZJb3Q0?=
 =?utf-8?B?L0ZYa1pFY09nSm9TWW5tMUgvU3ovZGJ2a3JDMDJrdVkzd3NDa1FkR2t3OUt1?=
 =?utf-8?B?MXJ4Zk10SnJYakRCZHM0ZHZheE9qQVZjckJtWDVpUnk5V2Fvc1U2T3kxLzlF?=
 =?utf-8?B?b2ZHdXJtbDVQNzYvV3hoMlc0QktjSmVnYmw4RkZtemF3a05BT0NoMWI1YjZL?=
 =?utf-8?B?Rmd6NkVETTRxdHU2T00zUWt2MGFJeVhTRjFYV25LZFVXWW5nUmlrOGFnS0V1?=
 =?utf-8?B?K2hRb1ZURzRGT3NlNU8rUlJ2SWs0elNhblhCZUpXVE1GbGxMUjVhdkF6cDdL?=
 =?utf-8?B?VFNTaEcyb0hiTXE0Q215NHpueGNYN2RSMGx0WnJiZFdzUW83ZkI5ZkdHa1Fs?=
 =?utf-8?B?cmlQaGpDRFc1RWhFQndZV2xaVmFkczRFV0hEK3pQMHlBMktBNndDLzNiREdP?=
 =?utf-8?B?eEJNcFN5b3V5OXNNSGtTRElFT2d1S2dDaVVoeVY4a3d1bXEyNkE5UlNCUi96?=
 =?utf-8?B?eDdWYnZPQldWeS9NeUJ4SEU1QzFKUUVzWlpoOXdTbXhVbVE5Z3QxT3hZZ0V6?=
 =?utf-8?B?KzJlOFdpcndpSXpic1cyeUl3Mm04dnhZUk1XNzRzYmpqdG1OUFZTUXEvM29l?=
 =?utf-8?B?emZPb2V4VkxobVJLdFN1TGlTZU1SM1BxVEd0MFN2NkROZm8rYnp1WHlsejJG?=
 =?utf-8?B?YjJMSWNoUldmcjNHZDVNTmt3L2hGcFpMNGhST2lDMFRLNXpub1c1SDdPb3hR?=
 =?utf-8?B?VFIrVk5uTlI0WTl1NnVqTlNFcmxOYmFNRlJ0OUpEOXg0NDZkOHl0bSt2bXQ0?=
 =?utf-8?B?cWpPazZYSXoreXRhSzAyRG83bzNHMXZSc2dya1FBNThvczkwelpPT0p5bTRI?=
 =?utf-8?B?OTFNcW8rWEs0c0VqaklpOHZXZU1vL09uaUdjcmZYSldzZVEvQzhjNEZ2ZWgz?=
 =?utf-8?B?R3l6VVNSRnhXZXRiZDAzSlgrRnY4WWVvMUJLdy9qSHBneWNMZGw2TWUvSkJs?=
 =?utf-8?B?Wll4NXhFeHYwWXU1RG15aWllbFRKVlhXcmQ0amgyVHh3NVdNTHl6RlZvaTBm?=
 =?utf-8?B?Tm14UHEvV1RNZklhT0lBRlBkR3d2aHlPeHhhYVRlVmUwTkhCbkprM2pHVmNN?=
 =?utf-8?B?RUNpMW9KekNSakU4Rk5XYnhmTGNBb2gxeHIrbHRkWGQvNGlhRXdmVmVXVGFZ?=
 =?utf-8?B?a2lRclVhMmovcFdjZHY2SHRqdGtURnBEbWc4aWN4QWFub24yU0hYSE1CTmU4?=
 =?utf-8?B?RGtURUtEUnZTTHpEeE9oaTVUeUMrL1RWRWs2SklpYXVCY0hXU3VHMU1vbmV4?=
 =?utf-8?B?YTVXN2IxR2FIM3VLOEhLeEdweXFQY01URmRsZTFQTHBsZkE2UlJJY1ZmMEo3?=
 =?utf-8?B?elhXUU5ldUdaYXFvcEdhWjljWHV0ZVFoemtybGtPL1U3UG01T2tvRno4eUlo?=
 =?utf-8?B?amJrTmxmaUtEclZIT3NRVjg5VHp4eFZJOENRRjNHa2htLzVveUQ4MGx5MVMv?=
 =?utf-8?B?bUZlUjRhK2x5eWRxWnIvREtxQk9uMHJyMGt2VnRrcmJya3NXT2UwMUU1ak56?=
 =?utf-8?B?cDBSTU5FbVJoRWlEbmwxS0FMVXNLYkJvMEV0SHY0a2NQVjNiS1lOY0wycmds?=
 =?utf-8?B?V1pZOFdkVXp5VnM3dFluTUN4WWNYVlZGWDVXajRUZFVIallXdEhGaCttYUxx?=
 =?utf-8?B?TzNrNElibENTZ1JsVm9KL25WR2E4MHZjL1FVM2lkWVdzYWhJR2VQZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07921699-b4ca-47a2-89a8-08de5a238182
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:02:48.1858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXhScdCwRM2ixBrAiO+M7oKJm7YEYRttB8b/fRcu3IMNo6HEyag7hpZWXoyQ2pd+6MhEKQkWIrppHl/lkIa/hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16179-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.378];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6EC606F6DF
X-Rspamd-Action: no action

On 2026-01-21 at 10:06 +1100, Zi Yan <ziy@nvidia.com> wrote...
> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
> 
> > Hi,
> >
> > On 21/1/26 09:53, Zi Yan wrote:
> >> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
> >>
> >>> On 14/1/26 07:04, Zi Yan wrote:
> >>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
> >>>>
> >>>>> Currently when creating these device private struct pages, the first
> >>>>> step is to use request_free_mem_region() to get a range of physical
> >>>>> address space large enough to represent the devices memory. This
> >>>>> allocated physical address range is then remapped as device private
> >>>>> memory using memremap_pages().
> >>>>>
> >>>>> Needing allocation of physical address space has some problems:
> >>>>>
> >>>>>     1) There may be insufficient physical address space to represent the
> >>>>>        device memory. KASLR reducing the physical address space and VM
> >>>>>        configurations with limited physical address space increase the
> >>>>>        likelihood of hitting this especially as device memory increases. This
> >>>>>        has been observed to prevent device private from being initialized.
> >>>>>
> >>>>>     2) Attempting to add the device private pages to the linear map at
> >>>>>        addresses beyond the actual physical memory causes issues on
> >>>>>        architectures like aarch64 meaning the feature does not work there.
> >>>>>
> >>>>> Instead of using the physical address space, introduce a device private
> >>>>> address space and allocate devices regions from there to represent the
> >>>>> device private pages.
> >>>>>
> >>>>> Introduce a new interface memremap_device_private_pagemap() that
> >>>>> allocates a requested amount of device private address space and creates
> >>>>> the necessary device private pages.
> >>>>>
> >>>>> To support this new interface, struct dev_pagemap needs some changes:
> >>>>>
> >>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
> >>>>>     - Add a new dev_pagemap::pages array to store the device
> >>>>>       private pages.
> >>>>>
> >>>>> When using memremap_device_private_pagemap(), rather then passing in
> >>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
> >>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
> >>>>> private range that is reserved is returned in dev_pagemap::range.
> >>>>>
> >>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
> >>>>> MEMORY_DEVICE_PRIVATE.
> >>>>>
> >>>>> Represent this device private address space using a new
> >>>>> device_private_pgmap_tree maple tree. This tree maps a given device
> >>>>> private address to a struct dev_pagemap, where a specific device private
> >>>>> page may then be looked up in that dev_pagemap::pages array.
> >>>>>
> >>>>> Device private address space can be reclaimed and the assoicated device
> >>>>> private pages freed using the corresponding new
> >>>>> memunmap_device_private_pagemap() interface.
> >>>>>
> >>>>> Because the device private pages now live outside the physical address
> >>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
> >>>>> et al. are no longer meaningful.
> >>>>>
> >>>>> Introduce helpers:
> >>>>>
> >>>>>     - device_private_page_to_offset()
> >>>>>     - device_private_folio_to_offset()
> >>>>>
> >>>>> to take a given device private page / folio and return its offset within
> >>>>> the device private address space.
> >>>>>
> >>>>> Update the places where we previously converted a device private page to
> >>>>> a PFN to use these new helpers. When we encounter a device private
> >>>>> offset, instead of looking up its page within the pagemap use
> >>>>> device_private_offset_to_page() instead.
> >>>>>
> >>>>> Update the existing users:
> >>>>>
> >>>>>    - lib/test_hmm.c
> >>>>>    - ppc ultravisor
> >>>>>    - drm/amd/amdkfd
> >>>>>    - gpu/drm/xe
> >>>>>    - gpu/drm/nouveau
> >>>>>
> >>>>> to use the new memremap_device_private_pagemap() interface.
> >>>>>
> >>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> >>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >>>>>
> >>>>> ---
> >>>>>
> >>>>> NOTE: The updates to the existing drivers have only been compile tested.
> >>>>> I'll need some help in testing these drivers.
> >>>>>
> >>>>> v1:
> >>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
> >>>>> - Add devm_memremap_device_private_pagemap() and friends
> >>>>> - Update existing users of memremap_pages():
> >>>>>       - ppc ultravisor
> >>>>>       - drm/amd/amdkfd
> >>>>>       - gpu/drm/xe
> >>>>>       - gpu/drm/nouveau
> >>>>> - Update for HMM huge page support
> >>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
> >>>>>
> >>>>> v2:
> >>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
> >>>>> ---
> >>>>>    Documentation/mm/hmm.rst                 |  11 +-
> >>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
> >>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
> >>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
> >>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
> >>>>>    include/linux/hmm.h                      |   3 +
> >>>>>    include/linux/leafops.h                  |  16 +-
> >>>>>    include/linux/memremap.h                 |  64 +++++++-
> >>>>>    include/linux/migrate.h                  |   6 +-
> >>>>>    include/linux/mm.h                       |   2 +
> >>>>>    include/linux/rmap.h                     |   5 +-
> >>>>>    include/linux/swapops.h                  |  10 +-
> >>>>>    lib/test_hmm.c                           |  69 ++++----
> >>>>>    mm/debug.c                               |   9 +-
> >>>>>    mm/memremap.c                            | 193 ++++++++++++++++++-----
> >>>>>    mm/mm_init.c                             |   8 +-
> >>>>>    mm/page_vma_mapped.c                     |  19 ++-
> >>>>>    mm/rmap.c                                |  43 +++--
> >>>>>    mm/util.c                                |   5 +-
> >>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
> >>>>>
> >>>> <snip>
> >>>>
> >>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >>>>> index e65329e1969f..b36599ab41ba 100644
> >>>>> --- a/include/linux/mm.h
> >>>>> +++ b/include/linux/mm.h
> >>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
> >>>>>     */
> >>>>>    static inline unsigned long folio_pfn(const struct folio *folio)
> >>>>>    {
> >>>>> +	VM_BUG_ON(folio_is_device_private(folio));
> >>>>
> >>>> Please use VM_WARN_ON instead.
> >>>
> >>> ack.
> >>>
> >>>>
> >>>>> +
> >>>>>    	return page_to_pfn(&folio->page);
> >>>>>    }
> >>>>>
> >>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> >>>>> index 57c63b6a8f65..c1561a92864f 100644
> >>>>> --- a/include/linux/rmap.h
> >>>>> +++ b/include/linux/rmap.h
> >>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
> >>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
> >>>>>    {
> >>>>>    	if (folio_is_device_private(folio))
> >>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
> >>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
> >>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
> >>>>>
> >>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
> >>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
> >>>>>
> >>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
> >>>>>    {
> >>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
> >>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> >>>>> +
> >>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> >>>>>    }
> >>>>
> >>>> <snip>
> >>>>
> >>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> >>>>> index 96c525785d78..141fe5abd33f 100644
> >>>>> --- a/mm/page_vma_mapped.c
> >>>>> +++ b/mm/page_vma_mapped.c
> >>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
> >>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>    {
> >>>>>    	unsigned long pfn;
> >>>>> +	bool device_private = false;
> >>>>>    	pte_t ptent = ptep_get(pvmw->pte);
> >>>>>
> >>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
> >>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>    		if (!softleaf_is_migration(entry))
> >>>>>    			return false;
> >>>>>
> >>>>> +		if (softleaf_is_migration_device_private(entry))
> >>>>> +			device_private = true;
> >>>>> +
> >>>>>    		pfn = softleaf_to_pfn(entry);
> >>>>>    	} else if (pte_present(ptent)) {
> >>>>>    		pfn = pte_pfn(ptent);
> >>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>    			return false;
> >>>>>
> >>>>>    		pfn = softleaf_to_pfn(entry);
> >>>>> +
> >>>>> +		if (softleaf_is_device_private(entry))
> >>>>> +			device_private = true;
> >>>>>    	}
> >>>>>
> >>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> >>>>> +		return false;
> >>>>> +
> >>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> >>>>>    		return false;
> >>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
> >>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
> >>>>>    }
> >>>>>
> >>>>>    /* Returns true if the two ranges overlap.  Careful to not overflow. */
> >>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
> >>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
> >>>>>    {
> >>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> >>>>> +		return false;
> >>>>> +
> >>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> >>>>>    		return false;
> >>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
> >>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >>>>>
> >>>>>    				if (!softleaf_is_migration(entry) ||
> >>>>>    				    !check_pmd(softleaf_to_pfn(entry),
> >>>>> +					       softleaf_is_device_private(entry) ||
> >>>>> +					       softleaf_is_migration_device_private(entry),
> >>>>>    					       pvmw))
> >>>>>    					return not_found(pvmw);
> >>>>>    				return true;
> >>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >>>>>    			if (likely(pmd_trans_huge(pmde))) {
> >>>>>    				if (pvmw->flags & PVMW_MIGRATION)
> >>>>>    					return not_found(pvmw);
> >>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
> >>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
> >>>>>    					return not_found(pvmw);
> >>>>>    				return true;
> >>>>>    			}
> >>>>
> >>>> It seems to me that you can add a new flag like “bool is_device_private” to
> >>>> indicate whether pfn is a device private index instead of pfn without
> >>>> manipulating pvmw->pfn itself.
> >>>
> >>> We could do it like that, however my concern with using a new param was that
> >>> storing this info seperately might make it easier to misuse a device private
> >>> index as a regular pfn.
> >>>
> >>> It seemed like it could be easy to overlook both when creating the pvmw and
> >>> then when accessing the pfn.
> >>
> >> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
> >> return the converted pfn instead of pvmw->pfn directly. You can add a comment
> >> to ask people to use helper function and even mark pvmw->pfn /* do not use
> >> directly */.
> >
> > Yeah I agree that is a good idea.
> >
> >>
> >> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
> >> there is no weird arch having pfns with bit 63 being 1? Your change could
> >> break it, right?
> >
> > Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
> > thought doing something similiar here should be safe.
> 
> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
> by almost every arch, so it has a broader impact.

We need to be a bit careful by what we mean when we say "HMM" in the kernel.

Specifically MIGRATE_PFN_SHIFT is used with migrate_vma/migrate_device, which
is the migration half of "HMM" which does depend on CONFIG_DEVICE_MIGRATION or
really just CONFIG_ZONE_DEVICE making it somewhat arch specific.

However hmm_range_fault() does something similar - see the definition of
hmm_pfn_flags - it actually steals the top 11 bits of a pfn for flags, and it is
not architecture specific. It only depends on CONFIG_MMU.

Now I'm not saying this implies it actually works on all architectures as I
agree the page_vma_mapped_walk code is used much more widely. Rather I'm just
pointing out if there are issues with some architectures using high PFN bits
then we likely have a problem here too :-)

 - Alistair

> Best Regards,
> Yan, Zi

