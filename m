Return-Path: <linuxppc-dev+bounces-4871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D46A0664B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 21:40:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT0DY0Mywz30Tr;
	Thu,  9 Jan 2025 07:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2418::613"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736368844;
	cv=fail; b=Md03GGGHyz+gvhl8y5V39GCW6Unz7z9RtVH0mGtIns3AmXFCiYqjoaqaVMdRdKdNDr9SopviL/6URg9wG5/uQz56piD8nifbgbuGX6fekVkcAF1cPlgOP9XtSXvX8PQUO6reiSZl7IXNyM0r3GI/O7oN6hx9ll1O3JOmad0AfySXFV96+7Ewpdj0aknfR2zAad3T64Qdg4ohD4LaO++DgpNayX9mNdM90g2B+Yf8D/sLB+D7Y+WvYki25LTYFHC026Z/y8R9Qss9Ne4InjhiUzZzubOqGyoUyPZM93gjeIArkAPXMCKbuvZgqTQRVWcyP1ue4SCij93V0+lkfAAhNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736368844; c=relaxed/relaxed;
	bh=vUcgnihHjvSQfa6MbcS8CEdQJsemMKoeasfwkcPOa6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BH9fTNGY7nMnjINtrdlGQnYnfaYlP0wweorSENJLpy+mkbW7Le15Y5evyc49Dv3p2WnySE4xrAQSRC3Ko4kT9Q/lNNW8qzwi8nVf1pHqJemnk76FRXYd7ifQIVX6mzIyfy4MAZobLugYaiV4xuokmdrPDRhW64JU/5H//2vkZB5VnNLL8lP94Pn/QKvo71JDt8BiMYOW7dNRZZMjnVUtQxiDFBOTqJgxwxqDwJQqF/mTnyKspV5VmaToUutNYRYdV1pwgnRtazUVEHd9ov2gN6ctRFMdcuPQpHnTqTqZGgJa4GIW+PT+vi81Ij5IWGMEvKA0w+cCxZIp0zZDW3snRw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iANCfvr/ reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::613; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iANCfvr/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::613; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT0DV5gFzz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 07:40:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gi/IXW8jvfsFkft3EK2sKCftT+YNVlvO7Dy0xcDdqZqmhVPDOAcYBftm0dxD/hDVyy4F8eITjaEYyKFqD8F+UrN3xQI81ThW8mv7G+JC4KBTM+qQxhbxfVqputND0w8M7PxAUg9WrPblQmP6Qppk5VX8Zuljs7nvk5Y6wyMX7q6GQN/mJsv38OSwhcwWbRW61YJDxNolov9/R/5eEuYX81OPo0od2hikQG7YoQzPmXCheWlx8xKZcacPQdq2hno5J9Zw6BHblLQo63xVz+sn3VnyJVYZsLHHzP4FLooGlabSgZevKKGektUgRtYz91OiJElxwSIyAJfWDUSEvsX+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfylhOeVB3Iz2n8eqJZYT0nIxHV8ZRiuZHIzYHJoPfU=;
 b=utX6sly4Hydc0mrWn5yoUKMli6Jv5CraNeWhDQZcd58B9WcqiFGFTEIHvIX3pcL3J7wKw19B2TwXv7zwQIhkxkrov2dTf1Edor3SjRm1kCJLNP+gMQYH7/qPdAvHc0D5Y1uTA1rHeP728Ydggx82bRhWK5tQajGp7zn0MCo183bVqAsuADk6g5wtV7xlVwpzRoFUxh5A0lWvhfunOXSCBjYQzsVfTfGPr0z+IwXbJVVEd3evoWqgnYxHSJhAaNywItD7XiX/jk/bdb6HNr65i2hO0Fp5qPrQ/vGgaFIe7FbksofUK5UJpK/LDZhIbjAKkRbvHsubZfAfXlffwnld6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfylhOeVB3Iz2n8eqJZYT0nIxHV8ZRiuZHIzYHJoPfU=;
 b=iANCfvr/S9BGvZdmP+E4DkF3HMs7vV2kbX0fJb8IiRN2KECvR+GDcum0layOIvpkbVJkgxlccFCy2rGtJBUotzqf4TY0H38SOLkaxmgonOk8zZ0sJZp9UTm7ovA4yVwQlBGFghamfl5SNsotxLfPW20yqN1pAm1tMd3KxPFgmZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 20:40:15 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 20:40:15 +0000
Date: Wed, 8 Jan 2025 15:40:11 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 3/7] PCI: Make pcie_read_tlp_log() signature same
Message-ID: <20250108204011.GA1342186@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-4-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-4-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BN9PR03CA0721.namprd03.prod.outlook.com
 (2603:10b6:408:110::6) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: fa41c2e9-c156-4a10-dc8f-08dd3024a7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?flQDXN2MckuKYZgJGzGvlOZZVMPd7OO0x8KrH7IYNdovlAugFyznpmL+L3?=
 =?iso-8859-1?Q?3P1FjbRXPSndTVa8kPckP1cEE6XlIpuf8durI+4KQv0/s+lkkliF4yne+K?=
 =?iso-8859-1?Q?O/xtpfXlw03NQLt1JvVLHmmMO9Kb2UJHW6Pa5TXg0fFpFX3027veKYK10k?=
 =?iso-8859-1?Q?FulkOpjVo0tOONO8eEzOXPUbWmCxf/4Vma4PFCZrWlEByKmkUlsgNxi/Sm?=
 =?iso-8859-1?Q?oVHwU1o2PgDKrZ5ZfbT4kN3XIBQO8uCvmBXa9samfN9Fizg7BFeM+6Agoz?=
 =?iso-8859-1?Q?8151lHHIUcHLEJkD8nsMRGU8YqitNi2t72S3f0/aZcCzW0UdLR5wj6OUx2?=
 =?iso-8859-1?Q?iyQHQcfjfsmucM/dhCOODvcPZekDo8vHjQSAWMaK8/oTUTWk4/LXvhOJue?=
 =?iso-8859-1?Q?qRul22boXoSoFpjrQmYoseEKnQvhLSuvmArZUYawjlQ6tAhc9UNXabs30D?=
 =?iso-8859-1?Q?nHQEAL+zjAdaWNWNjpvzTYfv43eJwbgwlo/rS+bHJvWlQUQFVSxWNwFvzg?=
 =?iso-8859-1?Q?Yxnq0Pc2VSnIRmOh6ZBHnZ7LGZFZmsKnI5lqWyZFgAXJa9IjqYiFtkDcex?=
 =?iso-8859-1?Q?1dFqENDm+zvKR3mGq+r2A/A1H7jQxoyK2l1Vfuw6XXdYC+y+ZKOfAIq2qS?=
 =?iso-8859-1?Q?ZbLwCGxinSJpm/YVU/luRkO3lTZUXSHAfptfyLWKbTTPc/SdOfMLqmfvny?=
 =?iso-8859-1?Q?QfqPj7leVJWwI7O17JLw5wo8KO2n8dcOlijDoXXbuVz08FCbrCmTdRkPKT?=
 =?iso-8859-1?Q?8U7Qs93E6sKPK4InE8whz7muqc9r0WM/fyfcHyzUneFuvlS0But10+zaCQ?=
 =?iso-8859-1?Q?toOdGO4bBKdjk/kMEtbmtiZEFYlGhdIaGlxo1NQjkXWs2oFoq2A/+ZIi62?=
 =?iso-8859-1?Q?HnHsMDt8wiI1BLdgq8n2ZgcwOcDJ7jMbNFJ+4oMiLF+GQkFBFItkfvuHD8?=
 =?iso-8859-1?Q?am1dXzC+1+9aVl9o21I2oQIf0OBlRRuv9ltafMUGtCrfMTcCBF6pQQIHIe?=
 =?iso-8859-1?Q?WRr2ramk/BgTFURTvlUlEBrQhkvLY6+MHGCTQLXdqVaUKyMkuU1L3Ip9Ey?=
 =?iso-8859-1?Q?UeHmxCkCwN6ONMbsFn8tK+2+PmbdiZv08TTvLGaMs22PS7ixzlrxS9XCAm?=
 =?iso-8859-1?Q?gGVhhHsJzpWLtzsb9oUPRB6h8C/NBIDejyY6yxMVCEDkazXALw8zEXQSXT?=
 =?iso-8859-1?Q?THs7H2MrH2uL6Tv4gGfWOvGcWLWZ/KHmnTzajJJje89AUUTxC7a/4Nc/rq?=
 =?iso-8859-1?Q?MRUvEsXSHhm9CemlI02DTawIGTT79ll4/hJRAcdKXzVHpazbQsBbH/wIen?=
 =?iso-8859-1?Q?FrnjBc+ToJAWNibJMai05SQmRlXhWXuOOSbDNFscuyYFNTYeVsGt72vJWh?=
 =?iso-8859-1?Q?1V2U9R8SpjKVJ07ZrHp/ut18VHbvfwDKdUKvyfL0Ix5T4sNPyQ57fgVeAp?=
 =?iso-8859-1?Q?M5Js7OfQdX9jFXtZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bh7Uicmvwa2652lIb9EPbc+NqTKTixQVxz93/vFIhu9GMgAa1mDyOx7BM6?=
 =?iso-8859-1?Q?JLOl3QfaNGbLFWQJoRGq/ObD3cAUyQs2Me1NMOtWuE+1tYh2d7tSyO2DdL?=
 =?iso-8859-1?Q?1QE8XzKEyOAuHVO9Cjb28w//I2Eda3jHUG5o4n7tdvcS4YHfz/tessTgB/?=
 =?iso-8859-1?Q?FHfXwzXiGDrrFGxO0L41+SpnOE2J05XGy1ZKwZYUSfVkfILjSvAcQTK4Be?=
 =?iso-8859-1?Q?KKChVH9KcB0MC1pn6qkG58sEghOj5QeG7MgnNoLY2ArWhyNWIreF5bVvtU?=
 =?iso-8859-1?Q?vj3EUpwJuUDYAlpvPUNi9r4K1VkoExAMLFTY7z+RGhqwrDmB8hvM6Pc0yy?=
 =?iso-8859-1?Q?0VQY1VFeG1fatEeSqxVtVQoR5FCLFvo/qTMb/F9AxFNeqYFCaHHZse64Gq?=
 =?iso-8859-1?Q?flebN6nktoDBBQoZ+fHcY7nHjYDE8kW2VhH/7zWQcpQltNopCQvj3pR/dX?=
 =?iso-8859-1?Q?C28bFZpB2CQxWFrFppEM4o05NO5f9TG3rzZ0OeCE8Q4EPZdjzfme2WTqzq?=
 =?iso-8859-1?Q?Kes9lhboOPZp8BfFVqUHWoqKOS9TOcbxpHUxRPvsRIaksgcfy2FpYbxJQp?=
 =?iso-8859-1?Q?NtxUrTWpA6FP0JifL4PI53yk6gbOsAARiQlxatQ6b7co76spJh9ZkoznX8?=
 =?iso-8859-1?Q?8hpT3ZOpFkBorKs8HMu0/i/9EWo5wkvl8ifAmIpUyTYF4r97Egjw1F3fjU?=
 =?iso-8859-1?Q?qwJeFSKFEj1BqL4jb/8pP2eSvJpbEifa1JQ0ekTwd2qW21GhbnKN9lXiC0?=
 =?iso-8859-1?Q?BYNLXBceMHWBTUQdwKFYzpSbx0rIsoSn/TqPW7Z/R3o+0qQ83zpggg6BW6?=
 =?iso-8859-1?Q?0xlHLkLyV1+X8NcR6G24ccYllEtDSJ/gp7+zKe+6bhMOXDxKBPWg0OC6Oq?=
 =?iso-8859-1?Q?ysoSah9b1yeMhga+klkiacOF/GVZmt33d45dw4Vw/hoMKthgJlXSgxWRYK?=
 =?iso-8859-1?Q?50ludLmLj/sBxXtNz32ALwhXcAeg3AQkJeJqlqLSqKKkvFg8I4lXxwkgWn?=
 =?iso-8859-1?Q?Mc8OUXQtVZvG1SqKHP1rUCI5vtw5JBRy/m3MYuiZJJDKxHI7uZT0/mAADY?=
 =?iso-8859-1?Q?e0WRMs551UuP2ci+eLqgrra8KMneo0/NBhrdSSAxUe5BVQUtIgrL6AyiNH?=
 =?iso-8859-1?Q?gPgVdfMVuBBD22+Z8PAcupu4C8wtJqupNC+bgZEj6nBAD/EOcFyzrh1r/5?=
 =?iso-8859-1?Q?3EzfmOPZltGbJTiizRHxjL+ITsM4WSHRJkLvACBcW7iOaXhExbciABUpE4?=
 =?iso-8859-1?Q?8Rlo03hxoaEW7CHB4JGs12eYOQxhBy9TXy1Y1wT8R4ysPN00kvyyicQz94?=
 =?iso-8859-1?Q?xBpfKX8EeimIxu5jwoyAnG/xc5kdizXjwJoQWL1Tq334LjdopcucYfjqTQ?=
 =?iso-8859-1?Q?F5GvdgrztE/okcslZW1Z76Eg8lfP5O+iu9WO73mIYGy0J7iJR07UtIElPf?=
 =?iso-8859-1?Q?i/IzuRfTHw4GfDzDbNE3QiWWYq8QRVTaLbd8PMtqHhCcCfZJU3K+l57KKu?=
 =?iso-8859-1?Q?eGeRb7s6+Mn83gNy1NZWBedr15h81Chl7ky2EhjN2rmvTuooUGRPtThXIb?=
 =?iso-8859-1?Q?qtsmhDnzUrs5oSWOjDw2N+BhhHUpNGSxMisvHG/0Zq8QHo7Uou0HuSJ/ae?=
 =?iso-8859-1?Q?yKT442CFWiVtrFdZere+47emJ0Xd8M1M8T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa41c2e9-c156-4a10-dc8f-08dd3024a7d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 20:40:15.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/EAVjDEVQecD19K//E3lh2oRor1wjchOe1ywpw4gpmz+qiNmoUDfdDBY/dWfgRwY08/UQ3GkWwEuGhIiMUaLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:43PM +0200, Ilpo Järvinen wrote:
> pcie_read_tlp_log()'s prototype and function signature diverged due to
> changes made while applying.
> 
> Make the parameters of pcie_read_tlp_log() named identically.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Just wondering, could this be squashed into the previous patch? Or is
the goal to be strict with one logical change per patch?

Thanks,
Yazen

