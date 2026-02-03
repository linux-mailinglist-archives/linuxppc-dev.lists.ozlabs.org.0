Return-Path: <linuxppc-dev+bounces-16558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKCRBn85gmmVQgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 19:07:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B204DD54B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 19:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5BKj3pm0z3bZm;
	Wed, 04 Feb 2026 05:07:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770142073;
	cv=pass; b=RLVRu1wSdIK7Ff+ZNFpK5D8QSzPa4weOHlVz3cI5V1YwVDhHjZ6zhbnUVQxblM/+XOs7HREx+cjRhu1oFI9q8HipQSdopXay404LydxhaYJuoGRqKqeU4OyPA7wzerCegzoeHe3GeO35YgSjpQv/CoqZ/xiTOZneEgJz48u301+V77otkvSJ4XUohrx1cAmgvEFwgNc6vIXGQ7/HBcYGEIvl+EFLf0ToWl75em417qiN73AoRr17zBlBWbBYHlnjWsePUGdQZ8v5EidQQyeWdHCYXlaIBFcYoB/Ue4dRJhaRg2ytggc0wNXnTK1mztHxMAL7cp6o4pXdCObhodybnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770142073; c=relaxed/relaxed;
	bh=pMX1Rm/Lx/s1MZTwDD1lvbG96QRHq+oQv9rLAHe2Z1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EALA/v11Uf6eJF4J2xgFwYUemjtkkXZN9UNqDTkqA+MQIRe5ggySAXRvShXH8SMgclVEtZFz9TTqJHskWeNXrYqHJemUiG82tSxXAK3RkhvsncPeTBEFtg5lq+xGu2HygdhltOEV3dMEAW7xKe4LzPjqZCQuaJGrB72JOZCokqoit9MmFNK3xZitsWO+SbkjLuY++ceoNT6QXwSITFC3pUPQvbjcGX13pmFR1PgVpPEi1ZckKgo4CDkau4VHc06bhV6BuHYD8gaKjmVph9ZZqwlPpu1rqObg1+O+DDS76Ss6XEUbnHz6j7l4zefvOv5jwrdalbA70DtVFuPLjQnc+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ljHGOxDm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ljHGOxDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5BKg1M5Xz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 05:07:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV+VaQ4Jh8QHTaMpSOR80Rb63+NfEwF3kNnoJsSrQLsGrXKs9uRmS2c52rNhp2HHRiki+aM8qbW7di2QV5R41qrO59JDu20fbHcIs7NE6uGXeYyu1ArZDDqF1PtHxaCJc1BvGzkbaxfJo8xzfOrNxXESulb9pdXxguMfQiy6dOefzORmxNqV0gDHqKZmc1C1IJr2t8v+Ja4/sNu65nMp8G8QCTiILu9kmzEENIHZPQ5SL3rzwTpEgyEDiYh/jbxN6JsIMWV4PQyE7s2Br1vPQRKpVMPM1ExCfBRjJgi9SDdO8r2pxPTU4KFlhpDRneJeZNOVYdPYXtn30M1PKBfGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMX1Rm/Lx/s1MZTwDD1lvbG96QRHq+oQv9rLAHe2Z1Q=;
 b=Pz7cuV4+r41NgVVPIsC4YJuTD/GE/stIM3/+9/4cm5S1KphNOWyNpVa4p8fZBkIG0V+GNvGUI8dYNrM/rK1LrDV9OYIeDglxd5zYPbdjqmBFE7U0HNe7zbCRypFj/iM5DqeP1WqvMg06nuZzZTLWReVI70zv6p9bPzuacK/26Fuu4EN0LpK2EULk7Bacz9VxMyLxPlpW0bfU74X4IYwsyqshMyDsYMmfUL0RWZFE+oZBx/+WgX7vlsZTATvEvzendsroD70cO9nNZC4sce+50lQTvmxyk1FnWqzgnmf757KrGkv0ROnxKD8l6ir3LniyoJRlqG9juUptRPnhA/izZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMX1Rm/Lx/s1MZTwDD1lvbG96QRHq+oQv9rLAHe2Z1Q=;
 b=ljHGOxDmFiT3hfYEiwUy6BwklAOkQ9AN6tySpUuLH6gtUNVlvMyhLW44+37OLzEBFHYLyZyb6pKInw8RD4EpWtnLge6aebczSpKlcDxw2ySGMVl2Ss2i761d/A6cub021pW+dvpAj2zLJQmeewIqkDAiw36+D4JpHt3J0WyH1B1WhndpCutr2L43VZdg2cAaN2cLbitfWqeTpfCXHOdfBKEUFgslToDAGVHyDrIq68kp1tcBrwHTQCQ5er3/9cTI48f25w5o++yGeqfirNkpf4blFjZYBUMV/ULU+EaFihpw6m3Nk6rWaoQOo9IbLINoMLq5VF1G1KbP03kRM0X74Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB999106.namprd12.prod.outlook.com (2603:10b6:8:301::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:07:26 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 18:07:26 +0000
Date: Tue, 3 Feb 2026 14:07:25 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev, chleroy@kernel.org,
	mpe@ellerman.id.au, maddy@linux.ibm.com, npiggin@gmail.com,
	alex@shazbot.org, joerg.roedel@amd.com, kevin.tian@intel.com,
	gbatra@linux.ibm.com, clg@kaod.org, vaibhav@linux.ibm.com,
	brking@linux.vnet.ibm.com, nnmlinux@linux.ibm.com,
	amachhiw@linux.ibm.com, tpearson@raptorengineering.com
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
Message-ID: <20260203180725.GD3931454@nvidia.com>
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
 <20260127191643.GQ1134360@nvidia.com>
 <2127b181-2c3a-4470-9b79-b508a18275c9@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2127b181-2c3a-4470-9b79-b508a18275c9@linux.ibm.com>
X-ClientProxiedBy: BL1P223CA0033.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB999106:EE_
X-MS-Office365-Filtering-Correlation-Id: 467e179a-9a7a-48de-b324-08de634f1647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkJQVWpuL2pSSHJoek5qYWdRNVBVUFE0ZERHQ1Z6SUJVc1RJL2VDeHVrVkJn?=
 =?utf-8?B?MGlBN0FiUncwcjduYnFJeGVQbzVoem8zUVE4N2t1NzExVjE3c0pzeVd1WjZK?=
 =?utf-8?B?UmpXSFdnOCszQSt5WHBXbVJaTG5Da1F4K2paOC9wOEtlN1RDc2Rnem9SZitF?=
 =?utf-8?B?S0lNWW0xYk9DUnNVb1U0Q0hZNEx6bkY5YzkwOTJxQS9odjhoTFNNN2NXYlFm?=
 =?utf-8?B?MnluU1liYUVWcWFweGxQZEw1N212TUwzOHY5SDNtZUt3dEpFSWNLd0lZR2h0?=
 =?utf-8?B?OG9aMGVNTGpVREtkd21uMnRIUUNlQ0RDVml1bEszalRrZS9jYlh2dGNOOGdY?=
 =?utf-8?B?T1JOUFBpZGhWS3lWSDN3Qk1zSnlybHFKSTFCMlUxaFYxV1diQkx5MG9XU2JB?=
 =?utf-8?B?TXVIUTRueUFBbGt5YVdHMTJPYW4vK1RkUnV1T2VHbFpSZ3JwcVR0RlpldmVK?=
 =?utf-8?B?Yk9XTkwxNHpzR3hQZm0vNlIyUjV4SkJkWnYzMzV1ZFg3ZkFxRnBYckRvQUlF?=
 =?utf-8?B?MWFoOE5oUDk2cVRRYnRDUlZETW9sMEtPSHBpWGRMbG8xdDNjSTlSSkQyeVJ2?=
 =?utf-8?B?MWpCZGY2M2huOWxyQmVPYWttTElKaXlaQVIzeGVwenEwSHU0bGdqY2J5d09v?=
 =?utf-8?B?Y0tmYzRBNEZzQ1ZrYU1BckJDbXpJMkMxdlB5RjltUm9QSEQ1dWRGMGU2Z0M5?=
 =?utf-8?B?cUdHa2R1bURBMStTazh1anRNYUc5c01IY3l1UTFDTnFVYTVKNUw2ZXcrV3Nh?=
 =?utf-8?B?Nit2TE5iMEZFZlN6ME1uU2ZvT3k5R09yTVJBeDhsNEhtbllucGtONnpTRFht?=
 =?utf-8?B?WGZRZ2dvVWlWdXN5dE8vZklBOUQ5ZGgxcld5b1prSXV2M3crK0xKc3dUZ0Ey?=
 =?utf-8?B?b3JPUXJ1a1B2UzVwMVJYTjArbkpxRU1pMzhjbnV0NWxteURkZVp2b1JhU1ZX?=
 =?utf-8?B?d3o2SHdERFFaWUtEdjVMNW12QytJSmYwVWZySE91dHE4YnJTenpLRmdxOGlp?=
 =?utf-8?B?RGtabEsvSEFtQUpkdXk5WDgvMXFYU2JyNFVGaVRyanc2bm94S2s5dnZJZHVB?=
 =?utf-8?B?RVhucjFNbXIyOHIvOXFrSUhWMkl1NmZoeklmU2RYMURzTVNqcXAzZ2oydmk5?=
 =?utf-8?B?NGNaaStISGM4ZjNaaHM0ZG1UcGgwRnYwM2QrWjJlNkFhR25YUG5tRWl0UmFi?=
 =?utf-8?B?YkJKa1IwSVB3NGNZRE5XYUVDMXI4cUZQSlVSbEJJZSt5dXgzVytWRzcwZ0g3?=
 =?utf-8?B?YTRsYkZ4Q3BncjBERDlnano3eTIwekhzVlg3UXBrN3VGQmVBNzgySFBPRmE2?=
 =?utf-8?B?QjJHYXZ3VFBjZ3VJYjR1L0JjRTVRSllTNVV5R1hRMGh3NnQ5eXBLRStjVkhM?=
 =?utf-8?B?MHhFRDJtRUtiZGtsNUFWRUF4TGNRVXFFWVVVVmQyUWxxdU1zQldaQlQ2MndY?=
 =?utf-8?B?eU94dlIrS3lxbjl1TmNKbXF4MWw3eW9tYm5xb3N5b3FrOGVLUm52Snp6WHRC?=
 =?utf-8?B?NEx0eXZ2WEFrZlVna0Y4WWdFU1pud2xsNXZhNi9LYUw3N01wSEk2cjhKTDly?=
 =?utf-8?B?QmEwRW04OGkrdTY0Q091aGMzaGNpaDF0dWFhUlNWQUU1c3ZxeWFsdUtYZlhk?=
 =?utf-8?B?QWo4L0ZkSkJMemVQbFg4ZXpRT0pVNFF6L0RMUUhvTFVURk9BQU92MnY2UDFF?=
 =?utf-8?B?Y1h3cSt4L2FpL0F3WjQxM3FxbVpYNjNlT0RUSWpxeFkzaElaSERzVTNZZXFi?=
 =?utf-8?B?WTNaUDY3WXVYMUpoOXp4SzZkM3d6aTMzUEkvdFJ5Unl4V0k2NGxPcDRtRjl2?=
 =?utf-8?B?aWUzY2tiU0xxaXNFL3lIZm9OcG14ODVmZ1IvWkoreGR3N2JPdzUrbEZtSERk?=
 =?utf-8?B?M0JUV3NlUXdwVTNjc0Z1TTVsdHY3eWJwMkFkY2Nya2JoK291dVA1dk5UQTdo?=
 =?utf-8?B?V3ROdGJzNGkrS2xYeTcwVmo0aDZyMTZoSkY2WFZJNEZNT0RxZHZGcjlMaXB4?=
 =?utf-8?B?RFVWdVFwc281OGx1b3dXVDkwa1ZaZldFb1BGMkowOHBxckp3ZTFlajc4L3lH?=
 =?utf-8?B?Z3NFUmppY3RxWkZjY0pCdmVIYWxEZnZaSVBITU9Bc2JrSU5IVU9JTU9JVlhX?=
 =?utf-8?Q?cn7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXY5TUJ1WHRSTFF1NGFnY1VMVHVSVHVxd3c3WjFlQStJYWw1VHY1Si91NW1T?=
 =?utf-8?B?MW5uZjVoa2NFN0xpUDdINDBtOExYWDJ4WDZibnNWMHhnNmdsMDE2Nm9GZ0lM?=
 =?utf-8?B?OHNxNjhmKzJwcVU4bnA2R1RJeUwyNEtGU2h1Ym1oMzNHdHY2S204UFRGWVlr?=
 =?utf-8?B?a25HcHBXQXEyd2hPRnZsSUdPaHBFaWZwWnlDMEl1RVBqMElkOUdWLzlVMzdC?=
 =?utf-8?B?VWVjNmV1UVVUa1ZFOVUreUtxOERGemtNWnVib0MwNVZGQTE5NzhZS2hIbjl6?=
 =?utf-8?B?RnlHbUVLeC9YQkQzeEliOTd2UFRReUFUTFJvNHBwWXlWZ0dGZHpJNzUwWDZs?=
 =?utf-8?B?VGxIMVgyT3NFV1JJdG53SmxDUEhidWxWQytEMGFaNmQ2akZRNE41SlVqc2R2?=
 =?utf-8?B?S0JsV0N2ZGFud1gxdzZaQTNId0RYdjB5WHdDRUF6S1Y5KzVXZWNkSndBRURr?=
 =?utf-8?B?VHpkNHJwbVVrdEdKakhmVitORllKZEdKN3dqWFZDMTRndlFwVnFLR2prOU1B?=
 =?utf-8?B?dmQ4VXEzdllQUHJXNFE3M2J3NmdpNDYzcUtJcWN2a0RUT0dZRld5S3hRbis1?=
 =?utf-8?B?bXFWU08zd3V2TW1hNkt6aGVXWFFPMGdsY3Z4amZJM1pmOFpkQ2pIWDZjZDcr?=
 =?utf-8?B?WXBqQllmMmVzWlFOck1IQ0p0cnhZSUlnQklVb3hLRnpxaDFwN3ZCaE1hMkt5?=
 =?utf-8?B?VHhyN3ZMZnc4R3hibnlrczEzRk5BRDdmVVdjN0FBdHhqckpqRTA4RzBKVHcz?=
 =?utf-8?B?TkpJenZzRXVySlNqbVJmMDJrVXBraDVVTFRnWmQvV0hxY1ZmbWx0M2xuWUM0?=
 =?utf-8?B?NHZMeFJqWWpscnZaNFoyOWZOUjk0eTE2L2JLUktlTUpRMU1DSW16dURvK3lw?=
 =?utf-8?B?VFZtWjV5RzB0NURCcnBQbEhzazJodHZLZlY1UGhwK3V5eDd6YThhYTZpQUZH?=
 =?utf-8?B?KzhFUE9ZQ1ZGYkMxVy9uWEhTS0E3OEhwQzBmdzNWYmUveFBWOXpEZkgwTmdR?=
 =?utf-8?B?QTAxRWhJOU9MU2tvNE8rUUJEZ0xGWlpBTUoxTDd1L2pGUG5pZE9RMFQ4WHFq?=
 =?utf-8?B?VWVPVm95VVR4bnFwNUpubGVvREVibTdTNERETEVtT0lQS2plUXVHbFJua1dB?=
 =?utf-8?B?RjN2Q20zZy9JV28wNXA4dkQyZkJIcEsyMDBYRTNwdkZXTWtsbFhLWEJLZi92?=
 =?utf-8?B?NnpTRnhoa2F2dGJpMXlUT1NkU1RxeTFBZFprekhPTHZxZjE5UEIyc1JsSktt?=
 =?utf-8?B?K2k3QkdmN3hIc2Y1dHlHUmp4SnBJVDNGTldYQnNoV0NXVFFmYzVjR1NlWTZi?=
 =?utf-8?B?RmViK3U5RVdwa05WbWl5bWs5WitoOGdGSjdRdXhYYUxUVko5NlN1TjBvZHlF?=
 =?utf-8?B?c0pKOW1odWdIdElzMm8yUE9OL2ZtRTV3QU5raWdTcUFMZTFtYmVFWUtsTUNI?=
 =?utf-8?B?d2JvNFBPdWNyUFZkUldKUjNlR3RjUThOOFQ3ZmtZbk9CNWxFY3BvSnhZRnpB?=
 =?utf-8?B?QXR0dWFOdFp1a2VZN0JPd2UyQTdwSHpHSjdxYTE0KzduV2g3RVp0UjZYbGov?=
 =?utf-8?B?ZlViTW4xVFdvTUtxd3RtRDBkV0xGcHhQbnJxWllwS3d6ZE0zODNWVllQZ2hJ?=
 =?utf-8?B?Z0h4VG1ER3RyWXdOekpoQmFlZDdsbENhNUZqQTRuR1d0ZWtkZUh5MUhscEtn?=
 =?utf-8?B?YVhpMXJ3Z2lydHAweThWMWN4YXFaOE9aY3hzaE82ekFOUFVZRkJDaTlpLzlH?=
 =?utf-8?B?REJqV1hkbTQ2SWc5ekxFdFBpeUc0RUUxd1VEWG44bnFtMUpjelNxa3JWTlBC?=
 =?utf-8?B?RXlxM25RQ2RuRENqL3NzRXhKOXRvQWY3Y3BBb3A5MFdZcncyZjk3Z3NjUTBt?=
 =?utf-8?B?eUNVZncwdURGRVl5cFd2aGNpVFNkYWlvOTFLR0Q2YlBPV2R4eURXbTlBZ0pB?=
 =?utf-8?B?aVhxRXJrY1VLTTYzZ0E4YUpyUHlJeUZ4VDE2alVwQldZcStobWNSVzZZYml2?=
 =?utf-8?B?eUYyc1Q5L2l1b2NkTVZKcGMvSUxqaVJPaE1MMUIzQnBxZVZRaFcwaVBiaFZr?=
 =?utf-8?B?N3NhUjZHWUtNTFhFT3RRbXdNUmlOZzZBU1AyVlBNRzZpVFYvSWtjbmhvMzEx?=
 =?utf-8?B?S3JHVlJiWVlDb2lyQXNLbXFuMzVBcngyMzFkc2ZDUkNTMVZRSTFDckQvUzls?=
 =?utf-8?B?UGNjNnFGK2Z6TmlJbTdMUXJBdDFHTlBOMGUzZUhjOFh2YU15eHhoNGJLNXdj?=
 =?utf-8?B?Vm1GN0llcVhiNld1NENaa3lkbG9jdUdWRlZkQ1BqWHlCVXdadUt4TEFObEty?=
 =?utf-8?B?QjlHVFNqajNwQXpNQVQ3eVdjMUM4cDZyM3pzVG43MmRscEhlTWFRdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467e179a-9a7a-48de-b324-08de634f1647
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:07:26.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOWSKD12qxg1l1WX8xTXizQ16+vS+Yzwk/yxhcJO/nMiknhn++b+eZfAFDfrCZ/2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999106
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16558-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.linux.dev,kernel.org,ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sbhat@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1B204DD54B
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:22:13PM +0530, Shivaprasad G Bhat wrote:
> > Then you'd want to introduce a new domain op to get the apertures
> > instead of the single range hard coded into the domain struct. The new
> > op would be able to return a list. We can use this op to return
> > apertures for sign extension page tables too.
> > 
> > Update iommufd to calculate the reserved regions by evaluating the
> > whole list.
> > 
> > I think you'll find this pretty straight forward, I'd do it as a
> > followup patch to this one.
> 
> 
> Thanks. I will wait for that patch.

I think you will have to make it :)

> There are ioctl number conflicts like
> 
> # grep -n "VFIO_BASE + 1[89]" include/uapi/linux/vfio.h | grep define
> 940:#defineVFIO_DEVICE_BIND_IOMMUFD_IO(VFIO_TYPE, VFIO_BASE + 18)
> 976:#defineVFIO_DEVICE_ATTACH_IOMMUFD_PT_IO(VFIO_TYPE, VFIO_BASE + 19)
> 1833:#defineVFIO_IOMMU_SPAPR_UNREGISTER_MEMORY_IO(VFIO_TYPE, VFIO_BASE + 18)
> 1856:#defineVFIO_IOMMU_SPAPR_TCE_CREATE_IO(VFIO_TYPE, VFIO_BASE + 19)
> # grep -n "VFIO_BASE + 20" include/uapi/linux/vfio.h | grep define
> 999:#defineVFIO_DEVICE_DETACH_IOMMUFD_PT_IO(VFIO_TYPE, VFIO_BASE + 20)
> 1870:#defineVFIO_IOMMU_SPAPR_TCE_REMOVE_IO(VFIO_TYPE, VFIO_BASE + 20)

It's Ok the compat codes will know what type it is operating in before
it decodes any of those.

> You are right. We do have some use cases beyond VMM, I will consider compat
> driver only if it is helpful there.

You can also use the type1 compat mode which will magically start
working with PPC..

> > You should also implement the BLOCKING domain type to make VFIO work
> > better 
 
> I am not sure how this could help making VFIO better. May be, I am not able
> to imagine the advantages with the current platform domain approach
> in place. Could you please elaborate more on this?

VFIO always uses a BLOCKED domain when it opens the device, then it
changes to a paging domain. If the driver doesn't support a native
BLOCKED domain then it allocates an empty page table and uses that.

A proper native BLOCKED domain has better error handling
characteristics since it is not allowed to fail attach and it doesn't
require allocation.

I think you will also find what you are doing easier if you push the
iommu_domain down through the PPC iommu ops instead of retaining these
unnecessary historical layers.

Jason

