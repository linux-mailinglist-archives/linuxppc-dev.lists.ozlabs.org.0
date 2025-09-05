Return-Path: <linuxppc-dev+bounces-11806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5AB4607C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 19:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJNxf2qlMz3dKm;
	Sat,  6 Sep 2025 03:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::623" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757094230;
	cv=pass; b=LbfDgPyTmZ+sKOqoBtUo4S1nFHX087EekKk0Cc5vseVajGyLtMQn8fE6O+g9VXSegDsWUrj6fhO9+ivcnRviB7e1SxhJr7LbVfNt54HfnFavP5G5kZ2KOHd3rlJ+Uvioc/aXk+LAVOgVnMSKRTM98aYQkvVWatxDs44xPV0s7BJ73dRMNa2MjvTL2k6VZnW+4uV1OjPYcraDBAjXA1PcfkRadihr+YN+b8aq1Tb3GYSXm7mcWcYMHU1hVxRTceV5t1Ch++DzfD4KyJTcVikrVw1MfmsXxnw0nFH4zvIVE0ojfCJ6G8LNa5gtz8CMdDDavaob9YrrOgOWfbf1quWCdA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757094230; c=relaxed/relaxed;
	bh=vILuWYAAHp1MhRoYT7hppsLaBLiTCuQw0wAnrfxfM18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gqUdptJtLVEwsPsXcdx/A1B3JZrNYBG76UuQf/J6mqXF6pxW26mLbDVK5bRSujNe9bi4bsjTM78GWAMXlLnhTPJgtSIPIuJFFjKyffzmhuoJFXJkb7EhcAaBZiGrsrFT8E5KBTMTqDeLSuCs4i15/uLFanTVxp3kSqeJMTuIfQ/8ZQ3hRuoB5agnF3/YGy3Opay+od8OVwPmwLX/IwW3q2x3WNIblRl4bXLDBg6dd+9r+qyQSpYEBIZmi3jcAQmDkkKUdmZlEjtXBPvLCZ/Z5Xz8d5ZDEkIdwsK7/gqDFqDzb+bvDUHaq2V1WWMfDqN9e0ehpRvvG/wNHshcib5jIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hep32/Rk; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::623; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hep32/Rk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::623; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJNxc6lp3z3cnK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 03:43:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmQBnyGgLjdP99D8mr1ZZogFkvBu1GxixVCgMdOsUWxb7Y7dqG5e+koq3mTeMPTToZgitqTT6e1UglS7EbP4Rw9TUv9UnB90iMWx0RLnpSdBkLknwifgJ1DNtR9E933WXvlc/V5xJ7OAvMdnk3f6v2JVKVglxVOY34+bvJvnTI0LsHB0nn6Z9EfrwT3k7Y7OHjApHh14YlyE9fO2PIn2zBJL8aZxaNf+CWSu4cVMEeF+1ot5e3511WnUG42G185AlKfOy+r4WoEcWrFAUgHChpIOAwdiVWsWUj5VEvvYEV0MM84KpdabrtEiHLn72sLP3bN4pBYFNb6p4ozf9FEN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vILuWYAAHp1MhRoYT7hppsLaBLiTCuQw0wAnrfxfM18=;
 b=VxD8f7g/AHWTj4kRyxL+bwM6OhT6Mq+UQdCsG9L/NC1IDywcIcLByLEBSsh0gzCeBPbtpAqcrmM701hHjqznNoZxyMnwKdhXdxnPJsQ3TkGH6L4u/rL7RUVTralSADDnDRv6iZA3Ty5pC2mR4nI3fosiRGUJmkno6cs8lhx0UUFjpR0jcfPizdAQmWDSLIwdg7qsukogILm7siHujIfBUzcDUkUFMk9jIipTBRQWiCJxofamNzt7GQUab8VyMViLupZfb2UcHLtRyc9bPMZegqAD71c+Vf6SJkBy+l4OBEyMOJfDCflXzkRURoji3f7Xebtb+0vvCTtB6NyV2ALP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vILuWYAAHp1MhRoYT7hppsLaBLiTCuQw0wAnrfxfM18=;
 b=hep32/RkEYW+ok3gUCMJe4RtW6SgpBDdBVE8CHVUTzQCa5m5v/1yx87NmAhrs1K5hhzKD4b52iUL0I88kmVtUEGPWQUl5/akQe4PFC7jj3GgLtelFz6U2KmwrI4ZvIR0yKtLmIuuc1rZIUOWnuNC53CKj/bM1Fyxk+7EH30TgVpz9Fq9/B/rTeRXDKZOnoDCwHfDs9JjhednG2648vJ8op2lBrZ5h/IUJa6jNMf5IRJOTUzflxRbmiCBALaZ/RYo7DNQOvrzShcEl0WZ6wagOzPxGkjK0M8fl61w1MvbhqX4sAYaY6Qkwt3tRDp0Z6yA4hTPuOTJy3IRT7aQfbAb9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 17:43:26 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 17:43:26 +0000
Date: Fri, 5 Sep 2025 14:43:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250905174324.GI616306@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250829131641eucas1p2ddd687e4e8c16a2bc64a293b6364fa6f@eucas1p2.samsung.com>
 <20250829131625.GK9469@nvidia.com>
 <7557f31e-1504-4f62-b00b-70e25bb793cb@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7557f31e-1504-4f62-b00b-70e25bb793cb@samsung.com>
X-ClientProxiedBy: YT4P288CA0088.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::21) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 170388cd-19af-4e89-c8e6-08ddeca3b7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnhUVWFhVWdmcThFZmlyQS96TlhJNjEzcXhwUm5sU1lSSFcxdkYwUWhkNG9P?=
 =?utf-8?B?Y3lobithTmZ2SzdianR2NEQ5Sy9IYUMzclFBeExOekUxV3poRXExMEtSc3Ro?=
 =?utf-8?B?bFAvWUNqRUhyaUxmQ1BYM2o5dDYrMFpUeUl0N0p0WXppVm9LZ3BzM2RLQnBC?=
 =?utf-8?B?ZFE5U1QwMFg5Wmd4TUs5UE5sRnNubUFSdHZsVGJQQnRxT2I1cDM1MkN4Yy8v?=
 =?utf-8?B?UXRKVHRWd2RyN3Z3QStUU1RUSjlQR2U3aFN2S0tnSk9EOWxpZHpsaHRyMHpZ?=
 =?utf-8?B?emg4TUdSdVRkMitYelIvMmlUY3daV0RmRXFCbFpRSGFHeTA4a1UvQzBPSElF?=
 =?utf-8?B?Ynh5NHRjQ1FmZlZyOXhueUR4Wml2aEloNUZpRnF3bytpRWJPNEZzeEVZK3Rl?=
 =?utf-8?B?dERBdHZMWjFzak9xNklUQmRYaWlFR1pQMW81Wkw4VEZWcThXQ2tkOFFKeFZD?=
 =?utf-8?B?VzhsR2hJSDBCMy9qQnk0YXMxZ092Q0tvZ3dhWW9XVnZkZHpNTnBvL3BmMVJ5?=
 =?utf-8?B?eTBVVHREU1dwOGhieWNGQUNFa0pCRjJCS21KTENxb1JsQ0kzNzM2TWJkV0xH?=
 =?utf-8?B?eUVuazZjMGc1Zk9CVlRKS1IrQjBhSG9CN1R3d3pGbjNUR1p1Y1RSQmpiTkEx?=
 =?utf-8?B?RENUTkI5OU1zS0IwaFlJaFRHNk84UWJacGhNNXowQ3pQR1oxYzhhTFRmZXov?=
 =?utf-8?B?YmFTUGRqbS82MEYyanI0eW9ydllVREJHL3RsU040VGxQMFpsdXNYN0czRVll?=
 =?utf-8?B?RXNacE1BSDN4cXNLNnZneDh3RVBoM1lnaWI1RFhDMUpvK3cvVlltWTAwWVBP?=
 =?utf-8?B?ZjArMnoyQVMyTGxHVFFMajRRMTlwdy8zaDNFMmpvYVdXSGFzK3ppL0ZIY0xL?=
 =?utf-8?B?elRFdjdZNDZjUmwzTTNsamFNbUJPeU05cHBxV2l5c1Z3QU5VemhMaFZzOVV0?=
 =?utf-8?B?Z2JMckpUTXBRckJKZ1VQeHRHaFcrUFpnNUNOcG0rUVBHM01SOVNONEpzZktN?=
 =?utf-8?B?MEtMZ1FEc0ExWVNkTXB0V2wzc2gxQnZmUExidWU4TERrOEJqYWV0WnliamQ1?=
 =?utf-8?B?UDRFRnoyazMrUlNYN0hvK2dnc0QrVy9mNHJzN0xZKzBIY05wRlJBWWxzc2VO?=
 =?utf-8?B?NE9iNnhISHV1YWlGWHNNVUdmQm5CSjh1cmY1M2lKcXRDY0ljdWNLRXFldXdw?=
 =?utf-8?B?ME1yR2Jtd1dYclVHVzNocmtYQTZJNTF2b3VuQU1Tb2YwUnRFNmsvN0ZaWlJT?=
 =?utf-8?B?VmM5dURBT3hKYVM4K2xjQWFCdkZZUW9lRFhwV1pRblQ2V2tsZ01OTzdwSlhU?=
 =?utf-8?B?QXdlaW81bEZjYmNzaktzOFNJa3BSRWZ3STFQTzBJYVJjYWxDTHVFRlIrRFU0?=
 =?utf-8?B?NnBpTjhpZWZ5MFZSRjg3REJEd1I0TVM2c3RsZkFITjNKRDN6QWVKbUxhSS9R?=
 =?utf-8?B?K25aVGZCMDR5anZrQ0daa0VoTWJEYnV1SEx2YXdWMkw0QjFsMzNrWHMyS0VX?=
 =?utf-8?B?YkdaWUhhYVh4R2J2Mzc4eUVCMEVoRVE2S2F4am1KZ3lYUE1rM2N5Q3ZtNno3?=
 =?utf-8?B?WjhiTlNBZWlUUjVHSDc2c09XZ0NYeEczYkdmdWprQ3BNWDhtWkVQUHR1UWt3?=
 =?utf-8?B?UkgrZWg0clpiODVzK29QcXhPWWYyL1dRYjZtbzFVSllENUtoVklEdXR2NHU2?=
 =?utf-8?B?RTM0VEJXTndHVmVLVEJWQ1ZaT3dpREpTMWdHM0RrTDFZMlh2UmNPM0gzNVR2?=
 =?utf-8?B?ZU9aMy9kSi81RU95TUxtbzVJT08xYWxGUkRObGVCUTF0TWhjeFVYRWg5L1Zh?=
 =?utf-8?B?NS93YWN1MEk0RU02bkFXaVFWd05Wa2NMZS9BR1FsMk9nMHk5VlBBcy9zY0tM?=
 =?utf-8?B?M0F0Tmw0T3NxRlMzZzhVVjlLSXpiRU1JSk1XRVJtdC9rbWg3L3hFb1JOMHBp?=
 =?utf-8?Q?dAcJtJ7InDQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhuamJtcWlrMFVvN3U5bzl1djN2Q25JSm9lZnFIT0tReXVQQlhTQ0lTUnlj?=
 =?utf-8?B?VE5raGZ4cXExVmtCbEpTdTE2am1PYXJjTm8yY3N4VVhTcXJTdEFvcTh3ZGVT?=
 =?utf-8?B?WkFQSzYxSWJFMUhmZE5CQ0pFL0lwM2hUM21uU2xQcUtvcjJBSllJdmJlbitO?=
 =?utf-8?B?MEtNaG4zS043Y25oY0NDZnphWFJSUGVyOEwzOHRLRWFGSHNVdC8rQTIwS1Nx?=
 =?utf-8?B?MHduWi8vRVZDZlZVMGFwQzBjNi93SW5UcTVMa2FQb082V25BNFpKYXdaWDY3?=
 =?utf-8?B?L3UrYm80UkhBTk9GeG1WajFHckpkeUZ3VWY3MjF2d2dWcytJK0V4VWFNQmxh?=
 =?utf-8?B?UkdtV3JlZUU4NkNKajFDbnkyWExMTUJZaHA4c2tWbTZwOWpiWXBtcUpXbWRD?=
 =?utf-8?B?VkR4ckVmVFdPallkdEo5YjUxRDhaR0pxNzhPQlgxd2JFZnVobjhqbGE2Q3pP?=
 =?utf-8?B?aXpWTXV1NU5CL0lqSUdwb2FkdnBvQVN2dVRxNmlOY3BEaFhjZERXbVQwMVo3?=
 =?utf-8?B?b3UyRFlnZHplRDNpRzVwNWxnZUxFVEt1U0VPd01EOFNMaHZQcDJoZ0wwa2R1?=
 =?utf-8?B?WWlIYWFlV3dBcy8ydlFLb2F0YWplMy9kSmllZ3BPR3dIdlcvWGJ4M056cUZz?=
 =?utf-8?B?UERXamJwV05oUnprTTZzQ1dkTk5FYTRBMG16N3dFa2xPSUE0eXFSQXcwNjFa?=
 =?utf-8?B?Z1lXRUU0Z2hERmNCR1ByVFFiUk5jZzJZQ2pvMURLcjU2bDYzTERWUWtCTm8w?=
 =?utf-8?B?ak1XQzBTb21vQXZCcHRXYjQyTmRVOGtTSzlMNlpFVVpxUU9oUEUwZStBWmdB?=
 =?utf-8?B?T3A3OW5CV3QrL2p5a3h2cGRBeFVKVnozaVNESTVaUmlJSDR2OTdyZzFrRGRh?=
 =?utf-8?B?ZmJwVTdFTys1SjRLeldIcFJEQ1RPQWlLOUhEK2FBc0U5L2hSSm9lOXZITHJn?=
 =?utf-8?B?N2xOVVo0UWw4RFRpZE5iZS9rYlpNYVk2WDcwZVNCR2RXZ0xzK3hzNElBLzA5?=
 =?utf-8?B?U3FNN2FpT0Z0bEk1NWtTdXk5cDNQUm4wd0RzallzaklCSTdLcXViSitmYTF1?=
 =?utf-8?B?bnhYbzdnMHQxd3hwRi8wRGlPSkJ5d0xzSnMwN0tmQ2hVelpZcEZYaEt4b0hS?=
 =?utf-8?B?TjFZeDUwUVhZdVpmQmtrNHNQNXV1SGFsSFFaUWJDK0RRdjJSVVBMQWYvYzB6?=
 =?utf-8?B?NkQxNU8reERzajYwNkozUEpjWFBxOEZrN3BLeHF6aEh6TjNDMjZVR2diUGtl?=
 =?utf-8?B?ZVpFWmZYYXAvdjRiamZmY0FGWGs1SUFlR21Dc1pvMzZ4cHdrZ2V2ZmNXZHlj?=
 =?utf-8?B?VktRenFIRjl3YTA0SkMvYTR4SHVoWkticVdLcVVzaHRnZmZBYXVCWnRkV2kw?=
 =?utf-8?B?bUFqbmlYd0tqUGlqR3dGUExFVlFQMjM1VWZGK3hadkpsWXdGS2pSQ0h3d3Iv?=
 =?utf-8?B?VnMveDQ3SUhqb2VwaWJOVHJQNFg4Zmh4TGRBSDlRbklKK28yaEM3V05mY0Fh?=
 =?utf-8?B?N0QvNzdoRUVTU0NMaEFqMFlTSzVPb0N2bVlSR2JEWVBCVmdmR1BxZ1Nuc2NQ?=
 =?utf-8?B?U3ovdWQ4L3RFWmJVZ0tWbEJ1ODhmakVrNU45RzM2cVZZZWRFSWx3MlBMME5z?=
 =?utf-8?B?Z0ZiRTVkYXA1dmNIVVY5dDl4RGlkRVFQZmE3L0wwSXJVVVVzY2JmeXgwK0Z5?=
 =?utf-8?B?OTBHbGM4a2QvbFNIT05mK0pBTzBHSU5PbUtiRHNWVk0xdWFIcmtyTjMyY2lD?=
 =?utf-8?B?ZFZJM3BJa2lkZ0ZmSFk1RXZJdituTitIOTcwd1NzQ21YenlnWkdlWXBkQWJq?=
 =?utf-8?B?SmdVU1hEdnBsVlF3Y2J1OXYrUkdEZlM2cTRLRi9QUUFIT2hXUnJnNWs3L3JQ?=
 =?utf-8?B?YkVCdlIvUzR2ZEwxV3hBc1p0WVdLSHlOcU1PWUNUWDgrL3c3YUMweDRNMXVi?=
 =?utf-8?B?enJYdDA5bHF2bWE3eGZqNEQ1UDlOcENyQXFVaFIrMHNyc1cyakQzK3hXL3R4?=
 =?utf-8?B?c2VTSEdnVUkzS1dEUlVtWWhjNEVBaktzRWxCOCtMeVpqL3pMT20yZG00T1hC?=
 =?utf-8?B?R2F1dmpxaC9jY0lodTZIWHJ2czYxVkJKa3kxWnNTS053ZG11Mm5RZk5vUFA2?=
 =?utf-8?Q?fPXI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170388cd-19af-4e89-c8e6-08ddeca3b7e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:43:26.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6B6cBXSQbyRzIh+uShpttmXlQ1roo6BeAEy92OWbRCVfTXsxw7FpfzT+ScCWlKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 05, 2025 at 06:20:51PM +0200, Marek Szyprowski wrote:

> I've checked the most advertised use case in 
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio
> and I still don't see the reason why it cannot be based 
> on dma_map_resource() API? I'm aware of the little asymmetry of the 
> client calls is such case, indeed it is not preety, but this should work 
> even now:
> 
> phys = phys_vec[i].paddr;
> 
> if (is_mmio)
>      dma_map_resource(phys, len, ...);
> else
>      dma_map_page(phys_to_page(phys), offset_in_page(phys), ...);
> 
> What did I miss?

I have a somewhat different answer than Leon..

The link path would need a resource variation too:

+			ret = dma_iova_link(attachment->dev, state,
+					    phys_vec[i].paddr, 0,
+					    phys_vec[i].len, dir, attrs);
+			if (ret)
+				goto err_unmap_dma;
+
+			mapped_len += phys_vec[i].len;

It is an existing bug that we don't properly handle all details of
MMIO for link.

Since this is already a phys_addr_t I wouldn't strongly argue that
should be done by adding ATTR_MMIO to dma_iova_link().

If you did that, then you'd still want a dma_(un)map_phys() helper
that handled ATTR_MMIO too. It could be an inline "if () resource else
page" wrapper like you say.

So API wise I think we have the right design here.

I think the question you are asking is how much changing to the
internals of the DMA API do you want to do to make ATTR_MMIO.

It is not zero, but there is some minimum that is less than this.

So reason #1 much of this ATTR_MMIO is needed anyhow. Being consistent
and unifying the dma_map_resource path with ATTR_MMIO should improve
the long term maintainability of the code. We already uncovered paths
where map_resource is not behaving consistently with map_page and it
is unclear if these are bugs or deliberate.

Reason #2 we do actually want to get rid of struct page usage to help
advance Matthew's work. This means we want to build a clean struct
page less path for IO. Meaning we can do phys to virt, or kmap phys,
but none of: phys to page, page to virt, page to phys. Stopping at a
phys based public API and then leaving all the phys to page/etc
conversions hidden inside is not enough.

This is why I was looking at the dma_ops path, to see just how much
page usage there is, and I found very little. So this dream is
achievable and with this series we are there for ARM64 and x86
environments.

> This patchset focuses only on the dma_map_page -> dma_map_phys rework. 
> There are also other interfaces, like dma_alloc_pages() and so far 
> nothing has been proposed for them so far.

That's because they already have non-page alternatives.

Allmost all places call dma_alloc_noncoherent():

static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
{
	struct page *page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
	return page ? page_address(page) : NULL;

Which is KVA based.

There is only one user I found of alloc_pages:

drivers/firewire/ohci.c:                ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,

And it deliberately uses page->private:

		set_page_private(ctx->pages[i], dma_addr);

So it is correct to use the struct page API.

Some usages of dma_alloc_noncontiguous() can be implemented using the
dma_iova_link() flow like drivers/vfio/pci/mlx5/cmd.c shows by using
alloc_pages_bulk() for the allocator. We don't yet have a 'dma alloc
link' operation though, and there are only 4 users of
dma_alloc_noncontiguous()..

Jason

