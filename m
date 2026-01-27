Return-Path: <linuxppc-dev+bounces-16331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMGaAEcqeWkIvwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 22:12:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E88389AA36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 22:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0ym31gffz2xQs;
	Wed, 28 Jan 2026 08:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769548355;
	cv=pass; b=U20vJV/5K7MN0BPo7ECnCjQOB7CGuXu2pXODyupsF+F+64EqprOPzPJjmbhVsLpdpbtdXFWGNmqC4D2MzfZkhpWwCl0Qv2/G9WwYC/u88b3/v+9ZmRb6pfiGReyZ1CmIu9wWHJbkb5S/UCrdmLo0rIuqpCfouw5CJEBB4K1FWyG0v5Zd1NF1cKAdxLjXldYrXQ8757tVSN/Qsu4++xcElEDhpevricAPbQZVcgEAhlQaowepnNcEakIwFzTKWl1fByWpxuRAjjnJVOSv5rwAWI+0Mh9U6quU/hQGqS4ojfKIYHtobrzLAWinLdCexVQx2Xrw4hjSlCr0h99Fsx6mhw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769548355; c=relaxed/relaxed;
	bh=yOAA4htKexbNjTTUYGujs4eA7VZzmIKpDrV0LIMasG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtlPXK+Xjg7eJycE7B6pb5o9rq32vBDuhQaC53lXq52xyKfJFOJDmmojcVIC1vAniYivls9DlUdthoJktUQJsXXZrBvNARj/j6C4fbLdzL3uS0aigyUIEsnYDW5Pq9zKXqCqZhaL0+zUEGQRUtrt6kBXM+OWc290fAhcFZ2KjoUul2tGuwwaOjY+T5mDGHLZ1mrMdyFdvWx8S8H2jWkQWqWp5l5ymy5P0abO1836I8Kfhz19WKf9KG4xIcNVp3+Vt2HkNtOAuHSM4xk/WpyNj0UZfCgkpfwafsjzuUWowGiNhVd5ZfgEhc2gMSxrDIWYSzOIpnQbTNixTlJsuaIKMg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DbjMTLKs; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DbjMTLKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0ym16pxyz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 08:12:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO5ygMJmDyuvK8K96BQuls89P9YPy5Q32LHm1/hjdcdhOjFtFDUdlAY58g8bkFRfyyrCyAZxWW8MIIgmyNi8r0th4LvU32i7WMLbZLkl70lQA9FRbMNgso5Uxc5qV3qQF0P+fH+1lo7bFbOQoNhCIwhw4Q6hVdfdhC0W70Ar3CwXsJ/dLgKSa2GvyjQdrBdjNwL9+DD/Wa8+hFXXcRoyMUwcmZBhE8IMDZQpnqxtTaDJM3g3pq28WY8jlhmeI3SR2AIqsOMolQNa1t7biCqbWoY6Ri1funB3WKvviJYeel3A/eX1SfFlyEPB6JJ2105wAjyl4+1NAlTjjfKxNsQIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOAA4htKexbNjTTUYGujs4eA7VZzmIKpDrV0LIMasG4=;
 b=c/BeI2885uLtDaEIr6xD1FO/M1mKa6yOzxmoOFppIUMbNvlKt5NlPi5FjlHyEy6E87B8oQgxKHOwXKZDWjbxj0q+3dn5pVSFSX/LJiYUzdkZCeR6bf9vufbAghpfvk2YJMfCQl7G1cujwZTzWxd8z1nJ955UZsfRV6PHlOS9tDOEPA1nB+E2CqQwOT4ZPqPCcEHVVkcUBQHSdq6emE62lTujD26Z9bhNlj+9rg9s5RtVeJw/HM3RPuGFkgy62M40tgf0syOdcOCk3dADDygH7dX0DMB3rocW9grnhwm/em/HL7w4E/cobS8Dg6nuvK7gcnc9vySkqs3YJu4ZGcEQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOAA4htKexbNjTTUYGujs4eA7VZzmIKpDrV0LIMasG4=;
 b=DbjMTLKstOVHNICQuYhnOQp7I8KQ2qGmyj9sZxl3kENc1fpQmWNzqu98OZAMF0Tg9f6MEaEj9N2SPKNOsaDJxQpWCiWVi5oRg7S/JTqiws0zK7FmPC23w5PM//d82E0LI/2zHsj9knaUd5Fz7WXfMn43IuEDxkceTkvrCxo49LXMRtNsZXicrl9RyLhm3AVe0SGYWTTiIcuuThtOKdOTm56wCww1WFG47OoMGQNvu8Bs7Qus9RgTX0q1ldhigJ1mlCf3Xua+RIPHyknSGsD64gmsexevoJ9RoL5MaNheNQ/Iy7eATb5c/O7DWxaTHvDP/u0/qSPi2dYe54v5DcgGug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 21:12:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:12:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com
Subject: Re: [PATCH v3 13/13] mm: Remove device private pages from the
 physical address space
Date: Tue, 27 Jan 2026 16:12:00 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <1ECE2357-DEBC-4E46-99CA-34BE894161CF@nvidia.com>
In-Reply-To: <20260123062309.23090-14-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-14-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: d629345e-b3f0-4aed-2033-08de5de8b9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2JSRXk2a2ZYZWFOVmIvWEN1QWRvZEM5ajZpcjRHVlVVS2JTT01JczdiTEN4?=
 =?utf-8?B?MGY4dEFncHpHd0s4L0JZYjBpZExwSHlEaStnVkZJcHJnVTJCcU1uNDRQekhJ?=
 =?utf-8?B?QllGRVJTVndhOGpEd0pBVHdQb1hUalBJUXRtbFNSRjlzRDdJWEFlVG1LUUpP?=
 =?utf-8?B?L1VGMnhrVmNTME56Y3lzOWJEN1ZRM3paZ0g4cE9nSmcyQXYvdURuQU41aGJ5?=
 =?utf-8?B?aEIwWmxWK2JmQTJDeXlLeTAxOWV1MXJRT1A2c245emVRcW5zR0FjSFZlQnJX?=
 =?utf-8?B?WWIwQzZEL0d1VkhCQXhUbFVKN3B2VmZLZkhpTWVLNVQzNklmREFUQzIrY0FV?=
 =?utf-8?B?dDJhZUIxUnhKYzVyRzhibzU4d01HdVBFMmRPdXNLbkIwV2NMZC9xc09HSkpJ?=
 =?utf-8?B?aXg4dmZjTWFWZE1ZcGlVMVZMYU1PNDFKekdWTmIyYVRyOE9wU24waDlOYWtQ?=
 =?utf-8?B?SVZUN1JwcWxiR04yTjhYSWlVUWg1R2tscXp2ODMzYW1EbU83QjJkZEFQckRk?=
 =?utf-8?B?R2ROSXh5ZlNtZ2F6WFdrMTJiL1F0WTQ0bWpZNExJc01hZ0VTTTJraXhKaFdX?=
 =?utf-8?B?WEh4VHZCS1FPN3hTSGtRazYvRlFkZmtoMmpISGswRUQ4bW9Ud0tLRG1icStz?=
 =?utf-8?B?S0xsK3ozNnFrVDFCeFNBTnlpalFxWkcrNWRKTEw5WndnK0pscFgyYVBlZWxP?=
 =?utf-8?B?NXIvZW5wSWhyQ3pORHVoRVJEZUlPNm5VVUFOOGU2SzlhUTM2MVVhc1ZHS2Q1?=
 =?utf-8?B?aGRPN0hmUlQwU1YzOUJrUnBYZEFwZkdvMkFXZWpzMG1YY29rdFVlWjlvNTJn?=
 =?utf-8?B?TW9JNU5qY0hGdk44Z2xvTTlkOWNvUEYyWVNXNEFjVmRjZzk0d2xxSEdkTUpQ?=
 =?utf-8?B?WjBqWHRqckdQdXQrWGZkWEdvR2ZuWU1MTTRHN2xUWlEraTJQZ1V6WkIzZnQv?=
 =?utf-8?B?RVJBcDRwMkFDS3phbDRLaEFDMEJXOHN6MzJGcGhtL0RuMXNZNmd0d3BYREZS?=
 =?utf-8?B?cXN4U281ano2VDc1QWJSZVdIK01hU3phMGRKZkpub1lsTFk1ekVqa2ZOa0xM?=
 =?utf-8?B?WlBLMzh6c3hLak9UMGlxS2ZJd2xheGFnR1dwMG9OZmpDMUhuOHNHSDA0aWE1?=
 =?utf-8?B?b2lsKzQ0bVFQTGpFeWJMNmkzSkJmZFBQdFJRN0UzUldHTXVSM2ZKa296N2gr?=
 =?utf-8?B?ZENmWUlkcXNPUHVKUEZHYzVPVHVmWm03bmZWaStRemE0Y243K0g5cEFEK0dZ?=
 =?utf-8?B?VFVidk1USytxM1NzSVMzM001emx6VlIwNlhHVXh1VmNlNEN2US9zM1d0a0du?=
 =?utf-8?B?aFBrYyt2T0dLVjRoRFFLMTIzR04yRmp5YmFDanIwaVpHWDRVSnEwdFA5Vk9j?=
 =?utf-8?B?TW9zU3ZVRVFNVk9ZbVY0b0RXZGw3TXNLK3lYdTYzMU9RV29Jbm9IQzluSjRJ?=
 =?utf-8?B?R3ZWeE96Wm5vQnpVTFoyQ0pQbThXNFloTUhja1lOZUZaR0NWZlhPRXA4YzRE?=
 =?utf-8?B?RTRuWFR6aHJGVmFPajFySHlNVFZSM0daSWhTdEk1NDJmSGtMeEVMVytFYS80?=
 =?utf-8?B?cmVHdGpkR2Fwa25idFFUM1NsRHExeGFrOVBpL1djRG9NSXN4U3FCaC93eTVL?=
 =?utf-8?B?bzVrd21pVjZoa0M4UUtkKyt0M1gzN0hpc3BwTkpZNmcxTFVGcXE3QU4wYnhl?=
 =?utf-8?B?ZzlPREFiSzR6bXBvQUhlMXM3UUdZbjgwVVE1WVlmMjVKY0JSdVlUVjAwRG9Z?=
 =?utf-8?B?eGI2TkxpcEp2K1M4Y01qSzZrWHlPYlo0L0FwdlJJRU1VL0YxREQrQ1c2bGla?=
 =?utf-8?B?NFo2WHllRDRTSlZWVVFpcVJ4ZWxIcEdIdG9VNVFrMlpYc0lUZ284Mkhkb0dF?=
 =?utf-8?B?VGJjRS9lVG96OSt3RDZaVTFER01SUGtGZkpvSit1R1pFMUtUUnpiK1ZhTHRB?=
 =?utf-8?B?c1ZnUlA5NHVUeXhQbGZPUlJMQjk4TlAxMUNVN3lzaTAwOXd1R3R0bjgwbStt?=
 =?utf-8?B?MzZkTGd5NGJCK0pEbmk2Z3UxRUhzNm1wY05GNHZtSllXR0FuViszZ2xuV3l1?=
 =?utf-8?B?TUFzaUVITmcxSHZxU0hOcFZzSVo2K1lTYkVON25lV0t4UkNwbFBDN0UyODVP?=
 =?utf-8?Q?SL0A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlYdHZBaHVPWGVvMDZJNkdkNm5nMWV1MDZLaXRrc0wvS1F2eVFGeFBnTTYv?=
 =?utf-8?B?am55OWI0Mk1kRnBXZEZUaEhSTW1qL2wwbnZ1TEg0aTFyc3dtNVJhcDJWb3Zw?=
 =?utf-8?B?MFhTVERMSGxaUjYxbHR4WTMxVlVEd3cybmV5S2V0MGhXSDlIV2V6Mml3T3J3?=
 =?utf-8?B?RXdvTUhjem44ZTRXZDlyTURHcmdQR2dXNW9aQ3loS3NuTmxsNG05QjBDVjNj?=
 =?utf-8?B?SVI1a1Z3RGJBbloybVFvMElrc0MrQ1hTOHN2aTRoSVlQa0NmVERKQ25FVTJ1?=
 =?utf-8?B?Z2lKU1VnNGZMRVJVcUNLQXNIcmgzdTF3REtYMUFiaDJIckZNUFBkZGdBd0Yw?=
 =?utf-8?B?T2tLdVVlSHIwd0RUUkp0UjRKWkxsZ2hmdmN2REE1U2dieG5xQ2FnWGhTNzQ5?=
 =?utf-8?B?RytXVFhrWU9EeFpoVXFxL1VLVHpqY0xlZ1RHeUZ0WEhJM0RkNGtLMlY2Yzk3?=
 =?utf-8?B?VG1zMjZRTExMajZxZnAzdU53aC9BM2huNnU5eWkzUmQwN1lpRlhEc3AzVWZU?=
 =?utf-8?B?eHo0UC9lejgwOG1uSHVPNGxjN25YNlJNWU1vaG9uSkRzTEVLRThjeFVTYXFr?=
 =?utf-8?B?Z3VVMjBuOHpTUERvZStkeFpob3dTYUxQM3Q3YzRyZ0NxK21PY3laL1A2ZVoy?=
 =?utf-8?B?U1lXUG5hbTVWU2xJZWZrWndHWHdQMW90TWdUanNVOVBGeXJDV2MvQUdJZEg0?=
 =?utf-8?B?S0hxbDJRMjVONTNmeXVxSnhPNjB5OXNhaFdwMVFQWno4SWVhdHBCZGVFU1U1?=
 =?utf-8?B?aTh0cXYxTmxwQjBoRlpWVGtsSEQ5OS8wMnNnSnUyYngzNGRWUjdkUnJrVVFG?=
 =?utf-8?B?ZlhXNmxBUTRnczh4U0FsRHFZUFZMcXJyVXhQR3R0dkFVd0FucmphUFh0QTg0?=
 =?utf-8?B?aDVnV2pTQWF4cHp3OXRDbVlKWHArMlY3R01hNjF1QnFuYlI3NjNneG9JQkhk?=
 =?utf-8?B?TUFKbTFydUxVRFBFU0RjNnRQbzYyckkvWWhiZm1TZ2NYbHJVMUVHakdieW5D?=
 =?utf-8?B?ZHFrZ2pvVEJQMnRSdDRNRk5LTkJnRHNFNW1KcFVhckpWeDE5aEgvQVJDNjhh?=
 =?utf-8?B?dzJScWdiK21sQXl5YjhGVmFzMmlBeHl3M3NITUNWaFhxN2NUUGcyNSswK2NO?=
 =?utf-8?B?am41WUZwcmRkSk9kQ01xMWliZ1FyaTB4Q3ZSdHFBTk1UY3k2aDQzMmF4VTgw?=
 =?utf-8?B?cEM0QUsyMUhZWEVIcnVpK244K0orTzRBTDViNmdKWXdmSjc5eU9qMmVVSXd6?=
 =?utf-8?B?R1B2TytRU3hvQUFpU0oyNS9RdHFKdXZZTXYzZFp6V1BzUnp5cnFLZytUbjVQ?=
 =?utf-8?B?V3g4dWI2dC9FTDNDcm8rSEI2cGROWWc1bEZqNzlLcXJ4eDlvWHZZMjRCb0xs?=
 =?utf-8?B?aFJxR3V0SHdGd2hPdVg1YnVmamNhbWpMT0wzTTBSMDdQNlhraGo4RWxKQTlk?=
 =?utf-8?B?N2V3V1VxcVVwczdKb3B2ZXpacm5uYzVVZFVQUFREWnNNdUdYNlF2SnpXbk0z?=
 =?utf-8?B?SlE5dzB0WTdqNjRyZTJIM3ZiQUgyRnhwOGtJNXpNb05rcnJjbEgwbXkreWZL?=
 =?utf-8?B?QTdjTU8xZGtkdHB1QjNvZS84WlhCT25ua3FabzhNZWpuTGo2S1NBTjNvcGZr?=
 =?utf-8?B?VmV0TzlSSjhqajk5cSt5RWxlNEVHYWFsY0M3VHU5RVBrRzMrZHVtMTVjYzZ0?=
 =?utf-8?B?VGlGRFZDd3EvQnI1U0pLZ1BRck5rbktPazE5ZWpveUFLMWx2YllBZjlIU0xX?=
 =?utf-8?B?WWZIUi85TEZLczRROEVPWHhYQUxVWGVVZnEyeHdiTXNSdkVYZjhPc0tEd2pt?=
 =?utf-8?B?aUtZd2kxdWhKSTRLVDVXSkRJWnRDaUpOUlJBOXRTSFR5VHRhaXVXcW5vMnpu?=
 =?utf-8?B?R1hDaHlraTkrODhkUUxwRHpsTzI3TmgvcXd5UllpR0pxWDlCUlNFT3l6S2VY?=
 =?utf-8?B?MmtKNEY2UnBSN0xOK0hIeURRTyt4R3NGMFR1Z3EvU3RSS3lveTA3TmxEc1Uv?=
 =?utf-8?B?c1Nxam5sSEVuUWVObnlBdE9Yb1FzWHc5OG5JOTQvN1psZXRRczZ5QU4wSGVX?=
 =?utf-8?B?MVJBTjJNcFJBNit3NDB2dG1IdXJ1M21yNkhRc1JSSUMrdHM2NnRHSGpEREl2?=
 =?utf-8?B?bGtUbTliWjgzTWZ5eGNNZkIvSnZWUjJ6YnFSU0l6czJ2dS93a1U1cE9UbkFM?=
 =?utf-8?B?ZlVLMFBMVlNvK3ZJMFNlZUk2N1RGODQxb3lBaFRPdzRHUExYTXdJaWxOQyth?=
 =?utf-8?B?UVQ0dmlBWnlLRytSTlhUTk11WXFjcWY0YXcwd2NQdFNZWitvU2pzK1BjdVFt?=
 =?utf-8?Q?KIHX4sgUM+QIlDq94k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d629345e-b3f0-4aed-2033-08de5de8b9b0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:12:06.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMOlcwMcUKNgr6dRUcYCxUoHVq6Y1MTrV8YPeu2PpZxd7e/yrvR54mlSy7ObUuGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16331-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: E88389AA36
X-Rspamd-Action: no action

On 23 Jan 2026, at 1:23, Jordan Niethe wrote:

> Currently when creating device private struct pages, the first step is
> to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages().
>
> Needing allocation of physical address space has some problems:
>
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. Th=
is
>      has been observed to prevent device private from being initialized.
>
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64 meaning the feature does not work there.
>
> Instead of using the physical address space, introduce a device private
> address space and allocate devices regions from there to represent the
> device private pages.
>
> Introduce a new interface memremap_device_private_pagemap() that
> allocates a requested amount of device private address space and creates
> the necessary device private pages.
>
> To support this new interface, struct dev_pagemap needs some changes:
>
>   - Add a new dev_pagemap::nr_pages field as an input parameter.
>   - Add a new dev_pagemap::pages array to store the device
>     private pages.
>
> When using memremap_device_private_pagemap(), rather then passing in
> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
> private range that is reserved is returned in dev_pagemap::range.
>
> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
> MEMORY_DEVICE_PRIVATE.
>
> Represent this device private address space using a new
> device_private_pgmap_tree maple tree. This tree maps a given device
> private address to a struct dev_pagemap, where a specific device private
> page may then be looked up in that dev_pagemap::pages array.
>
> Device private address space can be reclaimed and the assoicated device
> private pages freed using the corresponding new
> memunmap_device_private_pagemap() interface.
>
> Because the device private pages now live outside the physical address
> space, they no longer have a normal PFN. This means that page_to_pfn(),
> et al. are no longer meaningful.
>
> Introduce helpers:
>
>   - device_private_page_to_offset()
>   - device_private_folio_to_offset()
>
> to take a given device private page / folio and return its offset within
> the device private address space.
>
> Update the places where we previously converted a device private page to
> a PFN to use these new helpers. When we encounter a device private
> offset, instead of looking up its page within the pagemap use
> device_private_offset_to_page() instead.
>
> Update the existing users:
>
>  - lib/test_hmm.c
>  - ppc ultravisor
>  - drm/amd/amdkfd
>  - gpu/drm/xe
>  - gpu/drm/nouveau
>
> to use the new memremap_device_private_pagemap() interface.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
> v1:
> - Include NUMA node paramater for memremap_device_private_pagemap()
> - Add devm_memremap_device_private_pagemap() and friends
> - Update existing users of memremap_pages():
>     - ppc ultravisor
>     - drm/amd/amdkfd
>     - gpu/drm/xe
>     - gpu/drm/nouveau
> - Update for HMM huge page support
> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>
> v2:
> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(=
struct range, ranges);
>
> v3:
> - Use numa_mem_id() if memremap_device_private_pagemap is called with
>   NUMA_NO_NODE. This fixes a null pointer deref in
>   lruvec_stat_mod_folio().
> - drm/xe: Remove call to devm_release_mem_region() in xe_pagemap_destroy_=
work()
> - s/VM_BUG/VM_WARN/
> ---

<snip>

>  include/linux/migrate.h                  |   6 +-
>  include/linux/mm.h                       |   2 +
>  include/linux/rmap.h                     |   5 +
>  include/linux/swapops.h                  |  10 +-


<snip>

>  mm/debug.c                               |   9 +-

<snip>

>  mm/mm_init.c                             |   8 +-
>  mm/page_vma_mapped.c                     |  22 ++-
>  mm/rmap.c                                |  43 +++--
>  mm/util.c                                |   5 +-
>  19 files changed, 396 insertions(+), 201 deletions(-)

The changes to the above files (core MM files) look good to me.

Some nit below:

<snip>

> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 039a2d71e92f..e61a0e49a7c9 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw=
, pmd_t *pmdvalp,
>  static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long p=
te_nr)
>  {
>  	unsigned long pfn;
> +	bool device_private =3D false;
>  	pte_t ptent =3D ptep_get(pvmw->pte);
>
>  	if (pvmw->flags & PVMW_MIGRATION) {
> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pv=
mw, unsigned long pte_nr)
>  		if (!softleaf_is_migration(entry))
>  			return false;
>
> +		if (softleaf_is_migration_device_private(entry))
> +			device_private =3D true;
> +
>  		pfn =3D softleaf_to_pfn(entry);
>  	} else if (pte_present(ptent)) {
>  		pfn =3D pte_pfn(ptent);
> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *p=
vmw, unsigned long pte_nr)
>  			return false;
>
>  		pfn =3D softleaf_to_pfn(entry);
> +
> +		if (softleaf_is_device_private(entry))
> +			device_private =3D true;
>  	}
>
> +	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))

Would =E2=80=9Cdevice_private !=3D !!(pvmw->flags & PVMW_DEVICE_PRIVATE)=E2=
=80=9D be more
readable? Also I wonder if =E2=80=9C!!=E2=80=9D is needed here, since I rem=
ember modern
C can convert =E2=80=9Cpvmw->flags & PVMW_DEVICE_PRIVATE=E2=80=9D to bool.

> +		return false;
> +
>  	if ((pfn + pte_nr - 1) < pvmw->pfn)
>  		return false;
>  	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *p=
vmw, unsigned long pte_nr)
>  }
>
>  /* Returns true if the two ranges overlap.  Careful to not overflow. */
> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pv=
mw)
> +static bool check_pmd(unsigned long pfn, bool device_private, struct pag=
e_vma_mapped_walk *pvmw)
>  {
> +	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))

Ditto.

Feel free to add:

Reviewed-by: Zi Yan <ziy@nvidia.com> # for MM changes

Best Regards,
Yan, Zi

