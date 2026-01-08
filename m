Return-Path: <linuxppc-dev+bounces-15401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7BD00BD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 03:56:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmqL925sWz2yG7;
	Thu, 08 Jan 2026 13:56:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.53 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767840993;
	cv=pass; b=d7UvstAoCn3vD0Yqjfx/0ZaivZI2dtY8jm3LBuORrSyR2StGvLahnpEdQwP4RpKPYVnGPs/FZsrxN9pzlc7AI2HtewnUEDRGn3E37hhgEDKRkMWexuYbGnESjRz7fWCI/yIAxUe+e6ua7aLQNF7rQmKmq/9atFdBD/PJX/nucH4XYxY2W6KF/KTa4hkkwTUVOxSfKl9jM6VkhbOxPoIXGFxPnaG4nhAHC+Anlpw7NEwBJHvEYJ4YLtotvkKzVse3MqUCWt1LSGs3xXFL63yHkjAimBedXNLqzG/Z/tH/CMSjhQ7uGNr93clsrO+ck7uKyKGXEXb05tmgvgzW3Ti7vw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767840993; c=relaxed/relaxed;
	bh=Mkc8dK/xTuMxU0RqpiITwhQL26k8tDmz7IiAN0ioyrc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GgtJeld5SUCIzxrCkZSuOaq/ioLep6z/Lbuf5eGP6uVTqJoc67+B4U22Wr0oV+Nq7zAO7inkfoW49PlGwzObwg+7BEbz2NiqfYr3+q6BZZiy7tkm0p84s66QjhJcQ2gd7clR9/1YBdp6tDmpEzB2w2g+D/bP/Rat7Qqc1KreJ540aNN8y8STdTfbtYEbx0paMifNY8qB+V5Dmn5bRuUIJ9QMcc95YF72Qi70knOArWH2y3Ao4b5TX/NuRJLi3z9yCMO3LBJBxjlDTOsdXaDkSwM80d/3/vgVtxj0mcahUizqJJhburqk0OcMrx1No6DDQmSLFnwG9zUCH1Gjtc1f1w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jP1ozXG3; dkim-atps=neutral; spf=pass (client-ip=52.101.193.53; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jP1ozXG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.53; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmqL80bBtz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 13:56:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wd70jZX/9356FkYFB5H3HWTluQXNCE4m0Nxku6/H3Rpqjk1yt6f6psceStzj/mllrWVDrGcQuGy+QLQ63KvLitt0WgLUJ6S9zBEqru1h97TxZK0BH6WNOMwSvR7QEmGQmI1hoHvI3HtnMJRcXKLvfT8vPF/Ku/qZfYodhxJPUPiN8/7JZ3z+OtlTiKFhyBNAJJBwMnPipaBcxZOt7Kuw8Xwez3hCWw5fOlpgsvbujvAe/5CdqTqrIDdYTfhjy8ZLi+XG8L2Hq2OO1FiN3fmXgSlUQD/GN0ZVQ9tyhdVpi62BeA6vxXnED/rMn7oJuIs7W8HhlzgEibZABh3ImRG9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mkc8dK/xTuMxU0RqpiITwhQL26k8tDmz7IiAN0ioyrc=;
 b=pZDnpWcjh2OYAV5qdyKb/7wVBRdT5fhbkFWM2HHTRLp289ff0U5Ku90OFE+1YQJjfneM/BfgcI0/2D+PfC47TtXhvghzgiybGygUl+gkVAmKNpXhYiRn5pRGsktj9DAf8LFoRJ+8vCd4TDTGTbLeFRSpO9QSXRNyyIP95tD3GU5obo3tAd6PGcd7Y24ehoucNDW+HvSVaxjdjiEdSc5uZb6MT3T9pgX52/Pi1KH+DkROVO6cUr5rVxrqjZS7XcEVsge5rF0y1oMDBFx4MES01bR/Dykeh75ceiMFJKznYWf3Z1JWVDB+7AmFRApbIZGKtijCt2snOTuyClnuNPU3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mkc8dK/xTuMxU0RqpiITwhQL26k8tDmz7IiAN0ioyrc=;
 b=jP1ozXG3ena+DqeJvsWO9PSaauivlkbX9nU36HWZCTa5gx/jDz+yJBoy3+v1jexH57VZAEZyrVLuGtLPsapPmuS7/hyhhNeB5j9yHDRHzAu4GFSjAajBqipOFsEoCNwJboY9LeJIVRKaGmYpdm2k3CEEDbL/V5+pFgWr0bceTiqNbiHhYk2EOa5jYVJXcxgVSTnkOz8T1GSHcGMEW5CftFJAEqC691lwmpbg2hnU0Qc9sniuePEG9PbE6A8qwxtGzP17ar1hj1m8AJjaNlMY9THzkuqr+LrZ6IiIT05xO8axDmt/Bh5cZkox0oQUT79jliNVEchZUivtO0+4n7BZ7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.3; Thu, 8 Jan 2026 02:55:49 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 02:55:49 +0000
Message-ID: <b0a48e72-72c8-4549-8798-b73179953d54@nvidia.com>
Date: Thu, 8 Jan 2026 13:55:39 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
To: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org, linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org, jgg@ziepe.ca, Felix.Kuehling@amd.com,
 maddy@linux.ibm.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
 <3qduomzahrrn2s35xxfjem5nud77qhshr4vmg4kwmizyn3twp4@rqoinq7e4yqr>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <3qduomzahrrn2s35xxfjem5nud77qhshr4vmg4kwmizyn3twp4@rqoinq7e4yqr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9feb0f3d-1e02-4f32-f4f4-08de4e616d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dpNHREcXBObTlxckpUc1h4ckRpdUJjajlTZTlDcjNRSCtzc3hBcGFiQnBh?=
 =?utf-8?B?amxHVGdkT2xFNEdoSkdUaE12RkZQcU1uZ1RSazhxeGQ1S3k4NWY5VnowZ1h4?=
 =?utf-8?B?OFhjTDBzYkFnaW85NmdGc2JWRVNibFYvZCsrQ3FZbERGUGhkdnQvZUs1MUVx?=
 =?utf-8?B?ZmhaQis2TEoxQm1SWGxZcEZvT09XNlVGVFdOOHoranNIM2JzWGNYYnJBRWUz?=
 =?utf-8?B?T3pFYzE3MjYzeW9LdzdLNWg0Lyt0bC9jT3d1ZDIwOTZYb2EzVnl5TmRYMXZP?=
 =?utf-8?B?VWpHVTZFWDROVTVpNW8xb0R0L1NvUm5IOWNpSHM1cU9ua2xqbkxEOERMcllo?=
 =?utf-8?B?ZDFGZXdiVmRFdnplU0R1TktPZXNoUWlaSFhvSnNPVEhQeHJQbllTL294K1Bq?=
 =?utf-8?B?bWswVng4WmhYZEw2SkpSNkpTVGZOc3pmRzF6NHdSUnowVDdzZFhWcU5kUjNZ?=
 =?utf-8?B?WGlkVWU0RFFDT3NOamcwS3QyNVlSRGthN0NKNnVMODArWjluSWpWekR4WEVW?=
 =?utf-8?B?ZXVvWGFkT3VzUUNZUmMrYVUyYlhNdXBwVXBOVEoyYlR1cmNBOXFzSFR0dktT?=
 =?utf-8?B?MWN0ZzdGVVg1QzlQWlMySStIeHlvckp2bUJaWE9XSTN0b2V5UEYrbElDUC82?=
 =?utf-8?B?Z0hpQlNMOFlvRDlzS2NBR2Z6b212c25sOWlycXBnYU5JWDlHU3V4WS9haHFh?=
 =?utf-8?B?dFk3b1kyZEdzazM3NGc5Mmd4MVBvbVN6VEgwcFkxcGRGb1pxWENXU3ZvdEFy?=
 =?utf-8?B?TjZUUkRjSFRoSlUra1QyS0NEcmNCUWJpMkVzZS9ad3k5blViNWpyL1NYQnAx?=
 =?utf-8?B?c3FKa0RpL0xDcnFmK3luTnljN09UckVVSkQrWkRRN0RGajQ2NnFIeW0xTmdP?=
 =?utf-8?B?dk9ic255Mmt1Y2VkOE1qRnE4N3FVY2lidlpkYmFSYklub28vOTFVeWNIQ0tH?=
 =?utf-8?B?REcvV2FXZXdwaVI4Z2dQdFVUYkd1U2ZtRE1OY2FDUG5QbXZUeEQrRS9FMGcw?=
 =?utf-8?B?dXkyeHJYemVGbk42c1BQWmF4UCs3UlczYndCeVc0Y0hFRkw1V3hCWUhlNHBh?=
 =?utf-8?B?cEhOSzBNU1o1V2xtZWt6a0t0Vi8vK21kaHZGY1BERlRhVmZiSmJpbjZiRUdC?=
 =?utf-8?B?VTVPeVpnTTk2UERnUWpyTTJwVFM2OFN1aTlKb1ZFY1FPQVlXRW9SL0NBMi9O?=
 =?utf-8?B?NzV3Y013WVhLdVRXcldlUHR1V2VHVnpRQmlUTy9BVW1FVmVGZzk5VnB2N0tp?=
 =?utf-8?B?NFlEUTIxeUo5ekNEU3RBNGt3S01wamRTYlRpcXptcHRJTHdvTi9rVFkxU0FB?=
 =?utf-8?B?eUw4V2ViODFQU2N5MS9xSFZRU25CaHM1S2ZERi9SemhOL3lXRGRmTVpxUG9v?=
 =?utf-8?B?aU02R0N0OGlaUXk5UmorSzFNKzl6UUJRdlFiVEZEdCtuT3I0R21YSG9HaEpU?=
 =?utf-8?B?Sk56QTk2bzdoV0tEZ3ZPcUhicXMvK1BXMmhGNVFuUGVWbmxaOTdJbml5bjVy?=
 =?utf-8?B?ZXZISzdTSkhrVW5SVnlsaFMvK3FOT2V1UXNBUnpJUFZqOUVBYVF5UUhGSEVa?=
 =?utf-8?B?NmZmUXFtY1ZIWVJnQzZaUlcrSGJ0eFFsdWpNNjNpeTQ3MTFOck1XWFdnTTlT?=
 =?utf-8?B?Z3J4Zkx6S1RKMGV5dFNhU3RNSXExZStoMnI2aC85bnUrUlBRWUVwcStCMjlD?=
 =?utf-8?B?N1dBdXBGeElXdkxjZ2tQd0crK2kxRGJVbFVPWlQwcjVQazk3b2dnWVRpSmJP?=
 =?utf-8?B?Z0hDUXVGNk02OXYwWVVQMCtkSUg2dm5MK0M0S2pCOC84UXFPNXFQVDJiQ1Av?=
 =?utf-8?B?S3F5bFR6MldoRmIvKzl6S2tEemIvZXE2VGFsNzFhaDhIcVUxYkYzTVJ1RWFJ?=
 =?utf-8?B?bjg3UWZMRUJJV1BZeFFZVHBJb05UR3ZnTXpYdHJvM0xGL3Y2V0lITFdzMW8w?=
 =?utf-8?B?OU5PTTJwVTBkT250cFNjeUdHcm1vZ2R3NGxsbUh1SzJwK20zcDg2VG1LOE0w?=
 =?utf-8?B?bUZVNWZGN0dnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9nK3RkSy9WOUFLTXpFSzNCMnBJRktpUlFJOVNpNCtwSHlDNWJKOVpUcGRa?=
 =?utf-8?B?b1RHYjBuRW1DSjVFbFpjcDVhNWFOMy9KN25TT0tyUkdMNmZXaW1ObnZ5M1JD?=
 =?utf-8?B?RkVzcXMwczlIeSswQno1WXBjczI3SUxwdE83SGpuQTBHZ094RnBwKzU0ZlJW?=
 =?utf-8?B?VVRCTFlhQmFZRkgySnJmay9ENWYvS1hQZWNzQ20xYllXR1FOcWE0UjNiMENq?=
 =?utf-8?B?NmlISUFYRUpTMExpNzhJdjZTL3R1bVZJdDVMRXkzem5VZEpRTU5oM20rR2FZ?=
 =?utf-8?B?ZXphNEYzYlVWczFiSXM5c3hnUXptZWtIY0M3eGVmNndIWjlXZXlTYkRTU3Yw?=
 =?utf-8?B?ai9Zc2toenBJbWtCL1p3QXZjbE50b3RUb3NqeS9TdXhwRE0yeFB5aDVUaXM2?=
 =?utf-8?B?N1BpUmxOVUpZd2xjdXpFc3htS3c1VkF2WjZOUWl4anhTTGZRTE5UWlAvUU5G?=
 =?utf-8?B?L3pyTzd6eTlSMXVYRFM1bzEwblZ0U0tjTmdQVzBmZ2trVitudUQ3OUxER1JY?=
 =?utf-8?B?M1QwRlZ1YmlGU1pITE5VRXhYZnpmVVFrVllHZGErblNnd1owSHFtdkd1a2tH?=
 =?utf-8?B?TFY3NzBxM2JOa2p5azVUSzQzUStneWl0K2FTWEtLOUZkVG9BSEp0MFJ3RHpS?=
 =?utf-8?B?aklZcFJ5b0pXQU8wQzhrdFFObzlsbkMzVVdVb2xORmZja05ibU16Wm9SMGFz?=
 =?utf-8?B?ZWdHVWx5Z21TaThhcU9rTWpKL2ltTnlFR0hqMWxPNHZnTzc4cUNwUlI5c0pE?=
 =?utf-8?B?QlVGY0FlWmdxNEF6aWVwOEl4QjhDZFVYdGRLK29LYjZ2WGY5N3k1ei9CZVJW?=
 =?utf-8?B?SDNxZ2o1ZE0zRENKckRHelJ1c1BIWlJnK29tbTcxZUR5bWtHS09SVUdBU2tK?=
 =?utf-8?B?S2RJd0xCb2VKSGRVU0prbitCK3R6QnE0RDJrMVk4R01BOEN4Z1RHSG03c0J6?=
 =?utf-8?B?LzBMN2FaRTF5MFFLMnRkalJZR2ptVDhweEJIMWlYYzgyc1EvUmFPU3NyajE0?=
 =?utf-8?B?R2doNHZGTEZ5ejNuSC9MTjZSMkJaVDQwVndQR0syd2ttd0RXQVBYYm1VUUZD?=
 =?utf-8?B?OVlqRms0WXFCdms0bmJIWk53K0t0a0lmVXRSdFBKU0dlTmRpRHUweVdUYWFn?=
 =?utf-8?B?aHJQVEFkSkJoVjd2QVMzN050a3JXV0lqa2xmZ3AyZFAxWWpDbTBzaWNaWWVY?=
 =?utf-8?B?Nmh2ZkM1c0dxM1MyQjY5VlVYdCt6S1FzZXRsL05IRmhJOUk3cWgxcDN1bGhi?=
 =?utf-8?B?a25yZU1qbFBQVXk3c2RuVXF0NDZLSzlYTjk2WnpndlhDemM0dCtsdmhpSVNh?=
 =?utf-8?B?dXViTENOZW9nUTZTNnArMk5DVDFmdnhUT1VvSk51S000eTdXRG9NOXRQL01y?=
 =?utf-8?B?Qzd4N2huTTZxS0R3dTlzOHgwZldiVWFhVi9aTXB4c0xtdzQ3T085cTVhMSti?=
 =?utf-8?B?N3pZT3JHVEQ0aExxcVpTMXh2OEhKNUp2WDQ1ejR4d1FMbWhrV2FBVER1dVI2?=
 =?utf-8?B?VUV6ZVpORXJiRk9iT2lCVTcwVnRtb0E0YjZNYkV5bk5WWVArdm1nemtTeFpH?=
 =?utf-8?B?TExvVXZmOVZONUlRQ2lBR0Z2L3VUQTlrQ1A4RzJUdjhmcVNHaXFoUDVMdTU4?=
 =?utf-8?B?VnlWWG1iektkK01iL3lpMjBqa0gyWW9GMXBNM2YvRDR1ejRWT203L2tFUXhK?=
 =?utf-8?B?ai9JVk5QamhVQ1MvbmFsUXZoUEt3MENQQ20vRU5MemxJN0JaUjkzVzd3bTRs?=
 =?utf-8?B?Z1d3NlNTVEU4WmVBNzdEVnhFMXc1c0lYVmE5SEhBNmc3MWpzYXgyUWVQWlFZ?=
 =?utf-8?B?Wmhud3Vmd3FjOEFKdXE3dmZCMCs0ZHVSV1pMbjBjT01maDZobzI3UmY0ajZD?=
 =?utf-8?B?VjJ3RVl0Y3Zac1JFbDNDZ09Id08rcHFDQzkzQXpKNGhPa2FNNnl2c0M1eXlL?=
 =?utf-8?B?MUVTV2tJbVh6c0d0dGh6Z0g2cmhobDB5SW1SSjNvc21sQW1XV1BwL2RlWDE5?=
 =?utf-8?B?Z1JXTHByaDY3VC8xWml0TnFPV2hhRGxGa3hsSVd2TGg1Z0piREI4eDYxY2lv?=
 =?utf-8?B?U1JFSFluNk9MVlc5a2pMVllnZWVDQU9jK091K1pmR011RG8xc0FiRWRSMnFU?=
 =?utf-8?B?eFRYYW9WRFlhNWlDNVF5c213Q1JNbGkvTkZ6R1p2bnltWE9TMFFreGlXVEZo?=
 =?utf-8?B?QXprbGQxcnQwUE5lWFVwS1FEc3F2aFBCekZGTXFNS0FnUUlKSEE2SXNUYjVF?=
 =?utf-8?B?SncweHpOUzFBbXk1TEpWU2k5U010V3JuMkgvYXdqWk5LWkVGb2tRMzRUc21q?=
 =?utf-8?B?NVI2UThIWnJmdXVRTG8rWCtBVEZzTDhVK2FSSE1xdjZ5MzlTQmQ3dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9feb0f3d-1e02-4f32-f4f4-08de4e616d75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 02:55:48.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj9cIYzmkJuDSjmFZNChb5+U/yJvyqfHyoHvnbDOmeB9Y/vDTQDxZO3YIa+UW8f+S8KPZ9UTmPVtgRA4gblqDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/1/26 12:49, Alistair Popple wrote:
> On 2026-01-08 at 07:06 +1100, Andrew Morton <akpm@linux-foundation.org> wrote...
>> On Wed,  7 Jan 2026 20:18:12 +1100 Jordan Niethe <jniethe@nvidia.com> wrote:
>>
>>> Today, when creating these device private struct pages, the first step
>>> is to use request_free_mem_region() to get a range of physical address
>>> space large enough to represent the devices memory. This allocated
>>> physical address range is then remapped as device private memory using
>>> memremap_pages.
>>
>> Welcome to Linux MM.  That's a heck of an opening salvo ;)
>>
>>> Needing allocation of physical address space has some problems:
>>>
>>>    1) There may be insufficient physical address space to represent the
>>>       device memory. KASLR reducing the physical address space and VM
>>>       configurations with limited physical address space increase the
>>>       likelihood of hitting this especially as device memory increases. This
>>>       has been observed to prevent device private from being initialized.
>>>
>>>    2) Attempting to add the device private pages to the linear map at
>>>       addresses beyond the actual physical memory causes issues on
>>>       architectures like aarch64  - meaning the feature does not work there [0].
>>
>> Can you better help us understand the seriousness of these problems?
>> How much are our users really hurting from this?
> 
> Hopefully the rest of the thread helps address this.
> 
>>> Seeking opinions on using the mpfns like this or if a new type would be
>>> preferred.
>>
>> Whose opinions?  IOW, can you suggest who you'd like to see review this
>> work?
> 
> I was going to see if I could find Lorenzo on IRC as I think it would be good to
> get his opinion on the softleaf changes. And probably Felix's (and my) opinion
> for the mpfn changes (I don't think Intel currently uses DEVICE_COHERENT which
> this bit has the biggest impact on).

It also effects intel's driver because the mpfn changes also touch
migrate_device_pfns() which gets used there.

So also looking for Matthew's thoughts here as well as Felix's.

> 
>>>
>>> * NOTE: I will need help in testing the driver changes *
>>>
>>
>> Again, please name names ;)  I'm not afraid to prod.
> 
> As noted in the other thread Intel Xe and AMD GPU are the biggest. Matthew has
> already offered to help test Intel (thanks!) and Felix saw the v1 posting so
> hoping he can help with testing there.

Yes, I should also be able to get run this through the intel-xe CI.
The other area that needs testing is the powerpc ultravisor.
(+cc) Madhavan Srinivasan - are you able to help here?

> 
>> I'm reluctant to add this to mm.git's development/testing branches at
>> this time.  Your advice on when you think we're ready for that step
>> would be valuable, thanks.
> 
> Will leave the readiness call to Jordan, but we were hoping to get
> this in for the v6.20 merge window if at all possible. I realise
> we're probably running late given we generally like to let stuff
> settle in development/testing branches for a while prior to the
> merge window, but it did have an early round of review last year
> (https://lore.kernel.org/linux-mm/20251128044146.80050-1-jniethe@nvidia.com/)
> and I reviewed it internally and it looked very reasonable.

Matt has kindly said that he is reviewing the patches so will wait for 
his feedback.
I'd also like to get the results from the intel-xe CI first.

Andrew, I'll advise on including in mm.git after these steps - but I don't
expect any major issues at this stage.  The changes have been solid with the
hmm selftests and with updating our out of tree driver to use the new
interface.


Thanks,
Jordan.

> 
> I will take a look at this latest version later today.
> 
>   - Alistair


