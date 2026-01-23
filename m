Return-Path: <linuxppc-dev+bounces-16204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HrpKGsUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:25:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A660170F28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Gc2y0Cz3blq;
	Fri, 23 Jan 2026 17:25:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149544;
	cv=pass; b=RtIWQRTs8CeYoTTKsUbCyupSrhSXuVb8Y9Jj23ctRpN275VzzUZvM4JN4WVOVKbEhO6c2CXtpIE3la+d/p9aabTM+CZHNhwU59dHqRMMV2eREeA0zqmlxzyV5gDNlI3Z4QnZZI/nRVBio6GNIxsNrIpoHmsVcPIwQbxXYXKdszmmpQFrEWPunBut//vcR95kCXvKZwX7LGhzWz0YF2KyalfPCr17jp1M5roWXauLiv1Oicgmw9RusxqkPiN+s7zWwp1BmDrE1S/hS7zRChwC9WseHxTlzn+3jZNkAUkpfTOm+4uW08vlpI7G7JE4KIsRRESSq4i/206ZhdVLysOLcw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149544; c=relaxed/relaxed;
	bh=i5J1rpiHRpfCQc/BFCNb8Fngc4dZK5qasWF65UrhwFc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BEaOr9yHnkgITMpNC/H+/r+K8tp8oovG5UAT0kQWz7VnTz6cJM58VbVT14fLxIXbZHiwUPArprCXdIhurUfFTIS5CnDMcrG1QplzjoKqv4HjruKx9Ddb94uM4VWpzPCFZmQy+ftQV+AhhWL7lbtR8uUX5w77OY1AOND2cN1ZTDjktNofXBF2mYOatx9dPu2Tohan3H1OEByeDaOu5Ddf9Owf7oQ6ngNfWARMMCVt3zVjpbaSFyjr/6Zl5zDUPxxHvxRAkwNd+fO5WZ1haivSTbR5iQZjcopg+a4ba9pCCy+VNErf+wmFOzgPCQ69/b+K//nJqowfuL3KDBJgDYFihw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mqNFJNWU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mqNFJNWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7GZ6bGXz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:25:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSRNZtWRSaXEg7AjA8zAEHsaxGhHZkjaRCTH4bsrTXm6auHuMwrQKDyw1opdgyav1CUs4xDRisy+2rjYUknZ4fHGRzhHGut6OHk0Qpz7cTHsYD5xqXM0MxH0BxkwfAI/JpWJJ73WcdJhFRsswabw3c3OQA1+tKm5M9t1spoEFu1NtBh853PvaOLrTN8hwZFRoMbQTk+zH5/xbRF65ABwYFGrbRWHcPHcH4ZilvAU5P+cjkKmWyqLRRiu9wLaXOO1okgxwtEgps5cvkwL6+dYs5nebuWNBl5FJgRH+5YGhbRwVcRpBDcQ7IGb4FwmxMsip0dxwqcWJeJmv2YLG8jZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5J1rpiHRpfCQc/BFCNb8Fngc4dZK5qasWF65UrhwFc=;
 b=JBdzCiULswg80YeT7bGLsnph+5TX5v/kiIHdsYKIxXlwRouhwgD0UUdIdfemdjYWGTXO81VS/vbD4err5Pxkzg8qubzj0o60OgTs+IxRqRmgwwZdB81CBEUAKaZEAAIa1p7AccPrHUgUeuAOBKfBIEZ4i2HR3Xn4ca22EQTCcKeiwiKXuGHdOfVJp95t3xDwJmB7cxHW/Ukd3CD6yOiQn7MnS/pkaVbvdsGs2K9Ga4Evcxb4BIH3C62aRBQUpJ6z5l4mOYrvwaisRWGau/9CrwbB607W9x7k2BsU4Oa2YOafDbKkakg/GoZuXLFeGn3GslB3s5c9nomZAOquKqlejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5J1rpiHRpfCQc/BFCNb8Fngc4dZK5qasWF65UrhwFc=;
 b=mqNFJNWUSsJQlRwuJo0UbYnpmSpYSOJvmle3hWKJnXLZ1w06wWvH9l48FAxyTFDPOSbPuXEFDmkihaqTEzn48m9rZAKJPV1cq4GW3+LeZSnnC1449S43Qc0YZar9nBSC58oEv8hYjRl4xB6eQUwsmjvqxu0lNoa7YJdOG+dIihrCixHzD2P7OWABIHn1/gdTJYvMIUWjjwaFTgpHvqodOpMbtzGVDHj2u3n1gteVc9rR1xx76h3ufTofxTBz012B9bsE3hVvDjR4hggw2wGPAnlbGqsd+ClYUv5MA8+PybvUyC9fOOmW6FYEEH4oHTSxi1aPWXzOA3Qey9jwPx3KgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 06:25:19 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:25:19 +0000
Message-ID: <b2b81b99-29ee-4122-99ef-4a6094f4ec5c@nvidia.com>
Date: Fri, 23 Jan 2026 17:25:08 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
From: Jordan Niethe <jniethe@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
 <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
 <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
 <ad2a0fe8-6d00-46a8-8f4c-fd7fb6aac8b1@nvidia.com>
 <aWCerW4QP0t7CrC8@lstrano-desk.jf.intel.com>
 <f295d9ba-bbef-4a11-95b5-c468f08f992c@nvidia.com>
Content-Language: en-US
In-Reply-To: <f295d9ba-bbef-4a11-95b5-c468f08f992c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a110c9b-0436-49a8-59d6-08de5a482e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDljOERLc3ptS1p2RjdLWGhDVDZ6QVp0eGxWNzRESC9ZSlBjZDRnbzY4eDdj?=
 =?utf-8?B?RE9uV2VSMUEzaFpSMGpmQWg5dFl6YzZmeUdIQVRSYUZFaW5CZURyU3hzWUtM?=
 =?utf-8?B?Vmd3ZzE5UDFYQU5FRmU3RE5PditmT01NVGRXWVpyYlo2ZHVJamNmcnU1S2k2?=
 =?utf-8?B?WGQrVUlwQ1Z1bFJCTGZVZmU2UDBYb1JkcDZPeW5uSTJPNG5ORDYwNW5YOWNZ?=
 =?utf-8?B?WWpMYVlwSGphKzBlNUZBZXhYNU9ESVRoK01aSnV4VUI3bWFhTGZlOEQ1V05T?=
 =?utf-8?B?MGhOY1RYeXBNbG9kRDhpVW83UGw4c3pYcEQvZ3dmcWd5YnJMaXpDa01SM08z?=
 =?utf-8?B?VExZczQyZ0U2cjJoWFllT1BieGVDblVLYXhoV1c3a3VTQStEdnpqTnlBRTJG?=
 =?utf-8?B?S3RQdEQ5bTBpSGZxM2RvdFcyRlgrK3N4VzRlR0gzUkcrLzNNcy9HWVhtQWNM?=
 =?utf-8?B?ZG9oZVllRDRJUEdMYkgyamhaM205cWk5dVlkWEg5cnEzK094ck1DTm9hQldj?=
 =?utf-8?B?VnAvYW5zLy80Q2EybUp5NUkydTZMdDBqRDdsQ2h1MGZWZUNHaHpvaHNJTnFC?=
 =?utf-8?B?bXZ1UTVRWVRlaXNPYVptdU1aMXZlOWZvdlJ2UUJJZjB0MUU5OGJ5WlptVENi?=
 =?utf-8?B?YldUb1ZEdHNBWEF0YUVETE9reDFvbWkrVytqOXpMOWp5WlJxZVVNdmtkb09P?=
 =?utf-8?B?d0FsWklKcnQ3NFRLclZPUXBSaXNOZDByQXdUTS9DL010MFhUVnFWaWI0K1BW?=
 =?utf-8?B?UnZQUnl2QmYrSzUyMSs5QUord0FLY0pmWndHMC9wV3dnT0dCK056MjNBV3F5?=
 =?utf-8?B?V1QwZEJIcnMwU3Q3aG9VU0F0NmdseFJCeTFtMHFwS2hkei9HU0FTSUw3SWxS?=
 =?utf-8?B?VytubmF1cHYrdktQZlNSVStHL1dLRDNOdmJ4UHpmUitONUI4dUJDQlNnVDRZ?=
 =?utf-8?B?SEtOdVlzM2pXbmpvVG5zY1RLTnorZTE3cHlCVW9sbWFUNEgvT1RWdUpyZ05p?=
 =?utf-8?B?S3lMWW1TMEUvTjQ3bzZzd000VkV2ZlJOYlA1TU9IV1dRMDh5UEEvYVFwZzY5?=
 =?utf-8?B?TGRYZnRmTnNLenNRRksrVnZUMXppQ2FkaUNWd0REclk1dzFDZVo2b3Ftblhz?=
 =?utf-8?B?NC9qOFFTZjE5OEdyNzREVWJlVEVydXdlR2pIbFU1VzJUbXpxZ3ZlY29na2h5?=
 =?utf-8?B?RmsvQ0ZlMmdLWnFQK1JvTVlWZm5tTHZjVWo5MFFxK1ludkw5WkcwUlV2NkZZ?=
 =?utf-8?B?RVV1TzhudjVISUpQeXdpaGh3anNrYktCWU5yTVphOVBiQlMvS3JFd3VGdmJ2?=
 =?utf-8?B?WGRWb0JGOVZSS096RkVFdXNySFY3NzZTTmRwUFp2WFZtVTlMSVRoQVI1MThn?=
 =?utf-8?B?d0JKYzduQjFBZWdwQ05PbW5RRE0wMkhZU1pWdzFoblFhMWhnWENsWmhoM2o4?=
 =?utf-8?B?dVJTVkI4am44WEowSWF4aVdqZktmWGFzN3B6b2NDc3NhTzhQS241Y3NSV0Vs?=
 =?utf-8?B?MmZkMC94MHdRK1JsWE85VURhdGVnSG8vOHdISFFpNG5VWkpmYkduUWN4MjdH?=
 =?utf-8?B?dGdvaGJTbmNvMmt5MUF6VVNzR202TFRXQS93ZVJ5SGY2dWpGMFdUVzJoVE5y?=
 =?utf-8?B?ZE03OEtGWThHbjg0VDdja1M5OEhWWWFCSjUwb2NEMHpBZTRBSUNpb2RpdGNt?=
 =?utf-8?B?dzFHZHptc0krSVgyc0NpNmhmVmxoUDBhUHZiaGRabVBDSmFRNVFYTWliY0hh?=
 =?utf-8?B?UmZUUUd3NWE3bFJ0RU5qK1BtWXVybHVhMmwxM3FBaVZtMDFIR0xQY1VhQzM0?=
 =?utf-8?B?cjZrVjhUZm1yYnBZZjJtS1NwTVpxb3JReHRKbS9jSDV1Z2dvVlp6YzJWZjdY?=
 =?utf-8?B?TFR5cytkQzNFSEorQWpRZ1BYd2JlLzlyZmNDVVprTjNiakxyZjdHajczelRU?=
 =?utf-8?B?RlBOdzJzem05Nll4d1l3TzNKUjdoWXRIOFFUZFFOdXZBQnYxSFdzejdoRHZ4?=
 =?utf-8?B?dnQzUDRXNEpWTHBEZm50WlphZEtTbnAzcEZ5bUprQW8yUGtlbS92c3QzcGVY?=
 =?utf-8?B?QjhlNzNXM0lMR2JwbnpmVlltRjJVQ3dGOVJ6V09UZDUvR3R6d1hpVnd3eUxu?=
 =?utf-8?Q?Wlm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXN1YlpFQUtJNG9nQjZnOTI5c0pqNkhnNGE0VG05a0pOWjROeUtoaE42ZEx6?=
 =?utf-8?B?Yk1pYzhwWXhHYm9yQnBGQUFmY2NISVFCcFlwSVFDMU1PUkI4WG1KYW1lVlg5?=
 =?utf-8?B?UjJFTjJSckQ5ZWRSWnZQbld2M3h0YU83RTZaREU0bW5KWGZtcXROK09KWW5E?=
 =?utf-8?B?ZlFHRnE2dFNXUWlFVGRkYk1hZm50V2N6NG10TzdGdTRuMXE3dWNVZmtGaXM0?=
 =?utf-8?B?NXBObS8xeVJYVEl1bFNod2QwYnlpOVhaeVlkR0E4OXQzc2liT2ZpN1U4NWtn?=
 =?utf-8?B?ZGR4TEVoeWJLN2RqUGpzZDFFUWNBR2FqaytLTHkvZDhuUWErTGVBaTZnN1Zk?=
 =?utf-8?B?eVpxY2gwSndjekI3RWFuN2hSb1Y5bFdmc0taVmRNNmMxM1NEcjVJOE9sWXJ3?=
 =?utf-8?B?am1lUTFzNTNuL3BqWGljOUx0d0V5UXF2OUtHMTNFMC9KZllVdDl6VWRFYzR5?=
 =?utf-8?B?a1NvN1MrUHNkVFR1R256M3J0UWZCU2x3VGw3VkthK3d6OGw2N0xQRzZ5QkpZ?=
 =?utf-8?B?Rm9uUXB4TkJzcVo1bmZ5WWorNEtOTU1MZnNwd3BHYVpiZS8ycFUyN2h3dmQx?=
 =?utf-8?B?SFdFZHBJMXd2bTQzeFBOWVYrSFNqckxEbkpUY05oWUlzZitRK2NmRFZ4YWRh?=
 =?utf-8?B?UGVuSTI2WVZwdmFZTDJNMVVKZG1ON2hub0lndUhDS2piY3hVaWRnenNKVlY3?=
 =?utf-8?B?dWNMSmRjRkZONmVCZ2doY2d2Wkx6TVROaloxNFJVK1lqblAwak5iRnRqNkE5?=
 =?utf-8?B?RjdLc1oxeENrZDVmL1lmV3o4UFpRclQrS0J4NUs3azZFVnVZOGhod0NIdnVx?=
 =?utf-8?B?UkNmRXN2OUdGNWpWZkdHYXFVVmxLaTlocmFCSFFHdzZWTWU1bjE3TkRMRlVy?=
 =?utf-8?B?Vm1xTm1WODNhNjhWKzQxcmZZK3ZQcjQraWVYVDM2TlRNaEZxeVZaazFxdUxK?=
 =?utf-8?B?a3p5bE82d1FsRTI0ditjWnc3SjA1K0phVlV1MURqbjNDZnpad3JUODdubU5B?=
 =?utf-8?B?QXpNc1dzR0haN2ZCcVF6OXZ4WEMwSDloU3RwRjdFT0J4dEtnVy83SEw1a3Fh?=
 =?utf-8?B?djlXNEswZGtFRENhb0gvemxadmw0Mi9KU2xCZlY3YXlKQWhPWXIzTUFCZWdz?=
 =?utf-8?B?SEZPOUJzeHIxazk4aEFCV1lhQWx6MEV6Vlhkc05vYU5mQnhMQlJDUXZVR2kw?=
 =?utf-8?B?WEF2ZWZQNW43UmlJZVVpQ1o5L3JzL2IydnJMZjhaZXZPZEJYcUsweHFVWlJh?=
 =?utf-8?B?K0NqS1RNNmdiK3g4TW9PR2xRbHVMVDlLZlRpVGVUNmRsamRMOUNDYnJzNTZS?=
 =?utf-8?B?bGdlRHdWWEcxRnVGOHNQdUNLdEx3dnRrRDFtRmxhaHFrNEk0Nlg4T3EwYnRM?=
 =?utf-8?B?U0p4K1Y0VlMyUU41NTl0R1pyMmp3RGs3cUFJRkE0aEk0S2dOVE9mMXRackRX?=
 =?utf-8?B?cUwycm1kNWRPQzhVcW1yMUsvRjBHcEFKVk9HSGNMZGZCcXV1UXBnQkpuTGpC?=
 =?utf-8?B?SS9NcDNSOGx2Z0lpTVJ5d0daR0JCcVpndzZ0dUNPMTlYaHQwMDlWaGZTeDlQ?=
 =?utf-8?B?QUlLSHdDanp1MWpnbTczMmliVUhDL2ZyQVZVMWo2Q1pWdHpoT0cxbzNQWEds?=
 =?utf-8?B?bytKdmg5TnNLQ2hhM0x3NnFoUnp6clpLMlNhekF3dWhqa3M0V3l1OVZmeTVN?=
 =?utf-8?B?S1JZSFBBNy9FMTBWdXFqekxSL3g0bjJZd0RkWkQ1b3dZcWJPV09aNlZ3Wm4y?=
 =?utf-8?B?Vld2a2gyZGo3ay9Ja1hkMXlURjlxdldxOHpoaDZNWit4VWJ0djRqemdhc2RZ?=
 =?utf-8?B?Ly9NSU0zNFBWRldIanNSTWNTODc3Zi9aVXJuaUNIcFVHVmlub1ZxbjFzY3lu?=
 =?utf-8?B?Sk1LN2tzNmhPUGF0K0FieHJlU2hZN0FGTUlTakJweXFmYkNIbEFYd0cwb0JN?=
 =?utf-8?B?cXlRV2xPSlpRSXcwQTFxSTE3UDhVenBqNDBraXAvQWNoWUo2SWJFOWcvSWd3?=
 =?utf-8?B?dENqeUx0NXAxNHFkK2ZUcEdlQ1VrVVp0dE80d0kzSTd2OG5VTk1Qck03TFp6?=
 =?utf-8?B?cXNSTmY0bnpERDBrZzRZQ2RBQW4rUVVvTy9SWXdjSWdUUUhsREpMb0xPNGhV?=
 =?utf-8?B?TXpjYWZZZlFtUTBEbTU3bWlUSEpudUlPUEkxOWJRcUFnVGZhR1Bwd1NUelhC?=
 =?utf-8?B?THFEUHlHZEErYllQeTl2cGVCZXZYOTFRVmljZ1hJaWc4dXFvSkpMYndPclli?=
 =?utf-8?B?U3VlWDdSWm8xTDhXMXRmVkkvcStPYjNySDNlbVRCK2E1L24ydStRaTB2RDFi?=
 =?utf-8?B?emxJT1ZtT0hYVlVyTHZpa0hoVThWU2FjL0RVT2lHaUx3T1FTdUU3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a110c9b-0436-49a8-59d6-08de5a482e45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:25:19.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV48n2fcwMpSoztZv48oFpyWzyT5QaW6ZxWUZ0IOD428dfbA7RhrtDSp4DFBbAW4f5WNmoGQdPUEkSmAa2Rwmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16204-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.008];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,nvidia.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,01.org:url,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A660170F28
X-Rspamd-Action: no action

Hi,

On 14/1/26 16:41, Jordan Niethe wrote:
> Hi,
> 
> On 9/1/26 17:22, Matthew Brost wrote:
>> On Fri, Jan 09, 2026 at 12:27:50PM +1100, Jordan Niethe wrote:
>>> Hi
>>> On 9/1/26 11:31, Matthew Brost wrote:
>>>> On Fri, Jan 09, 2026 at 11:01:13AM +1100, Jordan Niethe wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/1/26 16:42, Jordan Niethe wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 8/1/26 13:25, Jordan Niethe wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 8/1/26 05:36, Matthew Brost wrote:
>>>>>>>>
>>>>>>>> Thanks for the series. For some reason Intel's CI couldn't apply this
>>>>>>>> series to drm-tip to get results [1]. I'll manually apply this
>>>>>>>> and run all
>>>>>>>> our SVM tests and get back you on results + review the changes here. For
>>>>>>>> future reference if you want to use our CI system, the series must apply
>>>>>>>> to drm-tip, feel free to rebase this series and just send to intel-xe
>>>>>>>> list if you want CI
>>>>>>>
>>>>>>> Thanks, I'll rebase on drm-tip and send to the intel-xe list.
>>>>>>
>>>>>> For reference the rebase on drm-tip on the intel-xe list:
>>>>>>
>>>>>> https://patchwork.freedesktop.org/series/159738/
>>>>>>
>>>>>> Will watch the CI results.
>>>>>
>>>>> The series causes some failures in the intel-xe tests:
>>>>> https://patchwork.freedesktop.org/series/159738/#rev4
>>>>>
>>>>> Working through the failures now.
>>>>>
>>>>
>>>> Yea, I saw the failures. I haven't had time look at the patches on my
>>>> end quite yet. Scrabling to get a few things in 6.20/7.0 PR, so I may
>>>> not have bandwidth to look in depth until mid next week but digging is
>>>> on my TODO list.
>>>
>>> Sure, that's completely fine. The failures seem pretty directly related to
>>> the
>>> series so I think I'll be able to make good progress.
>>>
>>> For example https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html
>>>
>>> It looks like I missed that xe_pagemap_destroy_work() needs to be updated to
>>> remove the call to devm_release_mem_region() now we are no longer reserving
>>> a mem
>>> region.
>>
>> +1
>>
>> So this is the one I’d be most concerned about [1].
>> xe_exec_system_allocator is our SVM test, which does almost all the
>> ridiculous things possible in user space to stress SVM. It’s blowing up
>> in the core MM—but the source of the bug could be anywhere (e.g., Xe
>> SVM, GPU SVM, migrate device layer, or core MM). I’ll try to help when I
>> have bandwidth.
>>
>> Matt
>>
>> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html
> 
> A similar fault in lruvec_stat_mod_folio can be repro'd if
> memremap_device_private_pagemap() is called with NUMA_NO_NODE instead of (say)
> numa_node_id() for the nid parameter.
> 
> The xe_svm driver uses devm_memremap_device_private_pagemap() which uses
> dev_to_node() for the nid parameter. Suspect this is causing something similar
> to happen.
> 
> When memremap_pages() calls pagemap_range() we have the following logic:
> 
>          if (nid < 0)
>                  nid = numa_mem_id();
> 
> I think we might need to add this to memremap_device_private_pagemap() to handle
> the NUMA_NO_NODE case. Still confirming.

This was the problem, fixed in v3.

> 
> Thanks,
> Jordan.
> 
>>
>>>
>>>
>>> Thanks,
>>> Jordan.
>>>
>>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Jordan.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Jordan.
>>>>>>
>>>>>>>
>>>>>>> Jordan.
>>>>>>>
>>>>>>>>
>>>>>>>> I was also wondering if Nvidia could help review one our core MM patches
>>>>>>>> [2] which is gating enabling 2M device pages too?
>>>>>>>>
>>>>>>>> Matt
>>>>>>>>
>>>>>>>> [1] https://patchwork.freedesktop.org/series/159738/
>>>>>>>> [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>
> 


