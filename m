Return-Path: <linuxppc-dev+bounces-16190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNyvLfcTc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:23:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A970DFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:23:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7DL4Nndz2xJ5;
	Fri, 23 Jan 2026 17:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149426;
	cv=pass; b=GNb0yHTlcbcgMIlO4yyn6wpwYR3zNnKmeWjNQJiYUN40I25FAyUQwLx5ffoVZFbVVtz/qfqYrhIj+vGclACEc5A3TKgaQxOQfdgP9AiH4lvyVm4zGmfrob1BE12yl5etpEIcAcAjfppT7gNrjGeZVuj1IYOqKPi5HMaSZ8uZPZ70SF7B9O2IDYBbBh/Heu3ek8MROpjgqx8furzpCrRpyIYWm/y7xeJ1QOWC9SMqvndX56u4tsJRqm95dR6bO235m+WxEm+al8wSMIDSGxsv/M6+u8wIm+NAx6DZ8puaBh9GfQjkFA2NuUadM9JWeK6XplSEmrL/bpgVOVntFbdqew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149426; c=relaxed/relaxed;
	bh=UgXpgu9Aw73r9+XTKFX5JlMMU11yDwiFIoU+Dujw3R4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S2/5g/5CsVywBMOZP4qNjdjobYtxO4nKoafLkzdKuON24Qv8HxwPi5VK5K/kQOAC9bDlC+ID8eTGDnu6FcyYa3+SH7chIPlQjRYQqL0/l8BbXOZ9gUdkWRd7mdwgyUTeO3t1RGKkNW8wtdm1LLlYgJLDWlGw4iWWChe3u0+8kR0JhqQrdbSpb9mF/kAji3BVIf4H+twO3SVAK5OYPhaKXEDMfYOBLjev0iXlHRylLH0DkaZ0DAzMu8nixRmw8HyLmw3XjEMNicZxtRTuQpFoCWxP9e2VYOrpiLEufauhH2CERLoUt0CR/+RDBigUGudHtmrcfbkxoVTTR2tb5rpggQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Dq9kIKi+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Dq9kIKi+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7DK35yNz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:23:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQnsMyB1PjH3ZKhJGRvKu9OJlWqha5QTYd2J3Tdpa57E34khFtMTrGjLfPVdSGsqYPBJg31MEt/XHw6cmBNW5sVyMKZ7BqG+NW3wdarDoRIAizdAs1/cmHlstkKBf8AQ7stT1VsOBo17vZSxLn4zDQ5IgDnqMDaYGooOZ9sCQr9/pEWFKoom5xC/8KnqL1+Q04vkH1wuXFEgUarTAZE0QdyHAkbS8uUgyIPvVtipMe9yWJQEaauCl47efTCZWFE7XqvwNjkrfy5TlhdXtdMRviqiroi+dkByOhISsB6G+4TwNqQwv7w/8arYd529tJ2TTbynWYXO92+0Z3hd5COaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgXpgu9Aw73r9+XTKFX5JlMMU11yDwiFIoU+Dujw3R4=;
 b=boK3YRGZlsh7zrEM1TbE7pddgMuJJTlIXehqRPE3wS1G55Jqf0wmC1JhLbf65XVAbM6md3aSSx+qH9pcFzh1Y7taHknVV5xhSe/jhXcVujJgn6OR5tGWCNCI9ad9dN40h97kJ2ZwmwYg6OjIWyX/HH68kDeYObPEV3V/s5LRhVQB+tDDlu7o96mp8pHNQl6c4POc89cqQuEf3a91He9T4p0zgIbtNFQAF3dtzeIPht96PRD04JsRLXtWCXlTVS4OlG9hhG61EjfcfIzcrV5mtFhz9/q4hRFU1ftN94VkywkmAkm66AzUfzZwRiJCCRQM+rttYg+2PDBkiEs7pItqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgXpgu9Aw73r9+XTKFX5JlMMU11yDwiFIoU+Dujw3R4=;
 b=Dq9kIKi+KdpmGk21X1iSMWsK4kJaApWKHDbhioK9wf/7fA0aUAzJ8CnOaoZ4dbx3z7liIsAQ3abPOTi6JBzbkIrb6kCvA5deFuRb2i4UG+xiW+ZgDcMHkseIGNsOp61R/74YNTD/v4fkE2JwUhXpRY7up0BGwZ8fdAWGL0sEDYSonEX5Hn+BfzIYj7EPikjrHhJWofTKQ0kig9KNFtm1mtYCQcR4JvdrLPJBaazcopRIELES/tn7jNlCSmaCsCAAca9CpB9iRL+nFE6FCN1n81a/5XVSS7/WMSQjS8fER4enwG1JozKB6Gzel9uwWujwBY4Sg8lEDxwSB11/PLHenA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:19 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:19 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com
Subject: [PATCH v3 00/13] Remove device private pages from physical address space
Date: Fri, 23 Jan 2026 17:22:56 +1100
Message-Id: <20260123062309.23090-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: a0240c47-8c13-4578-1cee-08de5a47e41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ra1FBNv+Tv6rdmslAxWK+1qgseglW07dxc+vIxx0ujdeD7So0XVBmPuC2JEM?=
 =?us-ascii?Q?wOAl+GIqbnxJmbIzSOgh66og4s4oNCV5UiVJAy2WvMHId9ZJjC6uSsccdsiI?=
 =?us-ascii?Q?uzdfoOieV4m/nvbqzbOqqTMNnKyFzMU7LjqPMw/2/cR+9nTNSXENukXBwTaS?=
 =?us-ascii?Q?hLP19MSC1gHvpnFufgSaeLimNCLMdWJMcfa+yCiFCFf8KxkhKNNweViqTLOL?=
 =?us-ascii?Q?NLJpSScRQ2cvvDhEAUaSM3BGikeqTbXGR1pLXl11PyY7zfxtN2UQ3emRW8jO?=
 =?us-ascii?Q?jsdkY5UvxlOHcys9T3CWJABxMFDu4qCJ8ANAVCzLz9cUMclMI58V8rctFNTv?=
 =?us-ascii?Q?4s8UWM5YQdHV1/YUvFLYuFujbtqPt6rGU6g1LtoI+1kMJhEqe1PtqzqnNyOe?=
 =?us-ascii?Q?AS7iR1curYAdBTyKVDrnzKxEs9eG56lJofCW+bvI60mwmv/yHwfmR0mw/ruq?=
 =?us-ascii?Q?ZFYam/fWgfRnoQRTSyhRBJ6SUQGUBfo/Ii+CY0z85XZLKZhaWdw3trr4J9BI?=
 =?us-ascii?Q?z318RJObXEBlFD8PpLOQg9stoSU6wD2dYjXXYL1TN1WujDnFibD38ISMJZQs?=
 =?us-ascii?Q?bWW/+UbQRc6h2cPN4llVtXvQlLlWL1NDAuG21jk1HHB3OFoUwgmiY8F24yN/?=
 =?us-ascii?Q?2nc7icUyZBw6BIPaIDPeBVo5jyrWE+dqcX3Xj08JZSQU3rnoV8ahLpNyDTBZ?=
 =?us-ascii?Q?kFasZv2UrhbzeNbJ98aXm4+QEWjMg4Uhl1zXtjWdrziuMqZ9mkSe+JOuO1p3?=
 =?us-ascii?Q?eS4Kok2mlNgLdE50oJGXnJNIXSoZJij+gPyXnwmY82idy2kZqxfFRXwpTZcz?=
 =?us-ascii?Q?6y3PFND9ehoEv8dCHKDawvGhzsF8MoDcMd+Wxs5XlLXdWHawy19a6QuFej+0?=
 =?us-ascii?Q?qc7G3PL1C9cjWQrHFfIO+5eA7E1oFaRGFdLuNwv5z/QRWtRnkgcQReMMce+s?=
 =?us-ascii?Q?EE4LF3WwUJorvr6j7r2d6nraZm7dFX52Ajv00DpM3OeKFN4m8j2D5wuguslA?=
 =?us-ascii?Q?etROOtgN2c0nPljZqcQV3tDuYaqZ7C+JWZmnUmkN1QubedvkFQNqvLTO4KBI?=
 =?us-ascii?Q?XrCdLRySg8hRqbs7sBNLkDW760F6BwuCz3U3Bj0G2I+EJC1a3xLEoYXQVgll?=
 =?us-ascii?Q?P+dL6sApcynhKzDHWWuJ5guMGgh030V66a9/4pAJ4sfloXQvG68/gZoL5APe?=
 =?us-ascii?Q?bAF5QcoAv66cuUNAdLyN40we63gTQB0FEs4EB5/HFQXszgQt7TMwXXhUpbui?=
 =?us-ascii?Q?5tipgwgHhPUzZ+Qajz4xpfJdH83cuD2BrR3p/Hxn6Q1/75/wEFeJSAieprMw?=
 =?us-ascii?Q?u4d/tQYKd1eeQwA4yAxRFocxbEZqQ/4D/FkAbajwBjXKVrpatRHQdBRGJFtd?=
 =?us-ascii?Q?69l38g+L4Re1Zyba7zRYtkYVhDc+XB+c+Ps9sHmeYJyjhnpg45hFSi9fB9X6?=
 =?us-ascii?Q?8vGchq2Z8hQnXMKAGGwdBCbpHCim/wi90U8VmYzR4stG3EzsvBsRo4HsAwow?=
 =?us-ascii?Q?6j9Nrdg6c0LiAGMau4KX2pvV2KWw89M7qebmLK4NJy9EYI9DX7dK85sLYdG6?=
 =?us-ascii?Q?WD/yomuoXtUqCd2BBlOPy0lD/4euePTkghjxt0P3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jeKkaIcBb0gYf71JktXOs/Rrrc47ktwgIUE4B+8V27zuJJYc/KlJbAnkYutj?=
 =?us-ascii?Q?A9qXWcWsnZTQSjxc8p2SRAGTvYi5Df3g4+/8hNsnc2maSvyHBDAkGqzROS1V?=
 =?us-ascii?Q?w2YhDMIT8UN7oXn8vEzzm2s0JYzknq60TPTI9dHGSZ5SBbkkvadJrxEF405p?=
 =?us-ascii?Q?UkGgf9TuRK+l/6seB13XK7M9Vl/iElDQ2e5G9oPfiaQsBoEBNcEXqm+R8dkM?=
 =?us-ascii?Q?5pM5HWemBatku/hpxcpvPTyMM5OeTKCVluakht5GH6TO1fS42WkV/CqLYpaW?=
 =?us-ascii?Q?4mYl+Va3rSU4PA0jKFlDNSV37FKt0gVEYtVKtfmwoiDW8tRbhOnXkkz4x/ul?=
 =?us-ascii?Q?UDEQ4d8BnwPBkxr9pg1SYE3TAg+nWNOn3t/ijp75ebWpZjBWsTHDEphHRPRP?=
 =?us-ascii?Q?bH0ciKjJPs/MoBO6Z/LK+LImlAcPOkeuCpbACAbzHGTP/TQWSOl1A+WlbU7B?=
 =?us-ascii?Q?koSx5+qq0T0kdBekUljH8GulhIhynFSbShMboSZwihbcuKCF4yrKPXEHca3F?=
 =?us-ascii?Q?Fu+T9vros34yzFLq1deAWPzchK1szzVavFPyQUYWa6mdH1inxacvOayYo9yw?=
 =?us-ascii?Q?yZnbPiPiZTMR/KXZHyAI0xdx3UuIQjk01eXpBhdMBmGFydviIV1spvfvehyw?=
 =?us-ascii?Q?IoGEt5Z1q3BxiPNO1C4v2j2yox7Z17WcKG4FJ4Ckl7ifkQfzNmGMFudPs/NL?=
 =?us-ascii?Q?N8Q6bn6pKUsNvx8u4yEt5akrSEYsF/beDwD3lxrY/b+ZSAeNT/xD99q9wP5Y?=
 =?us-ascii?Q?B9UFea1yPq8Rnem2Ncj/09HappMjJ8unNCekVCuQwKcqLgi14z46QTQYLhkg?=
 =?us-ascii?Q?ZM6iN0jUGYZYkgRs/gU+EmHgUkqeEXyFcNSpSw+7NQmJo+tkSmFKi4l5/EpQ?=
 =?us-ascii?Q?4W2CgOfELHqfH9ZM5TeeRzEG2HJVREjXUw1TJRt32ky2AW9DZdDxXfghEgJa?=
 =?us-ascii?Q?BuBYBSLOERdAIgkZyB+FZXbOhbTIRss3ufhnTDGxN5B1NM95W9LG9bRqZ1PF?=
 =?us-ascii?Q?8Zye+ow/BrmO1FxdwGa+bQDh+fkhBOzFOeRcNBS/h9kLGllKr20vCdtInZ1C?=
 =?us-ascii?Q?ieEaCIv/YWAbimcEtchJREWcoAUecTupVYDX9pDSyLprKZ0DTDINucn/zeVl?=
 =?us-ascii?Q?ufrk1XP6qEuOcKteorx+V+aLni7tYdpaDAVN3lSZ0Kf/SYPUEbfpI+6DbXSX?=
 =?us-ascii?Q?JCHY/AzhaT9gB8xrkYUB6iaJFO5XX/3vb7P0BNMgLAmVn8XBNaID3jeTwLjf?=
 =?us-ascii?Q?7Tg0ZJgq16mdNGTK9xFPBKywmq+Py2dbTigmVbXTwn0K665DOf8+H7ltkijd?=
 =?us-ascii?Q?DK7Oa3JON9PdK7gGHZPCOQ/f2PqapCpAaC+aR4FtS6LOL5GCm55BPxsCDA8/?=
 =?us-ascii?Q?mpoLiO+sUPy9JWCJizid1ASoEQA3Cq4ycP2GHoDoxhXav819DD/Xl0b3p4VI?=
 =?us-ascii?Q?YI3qdzRfewxZqGpJ5BX4xC+Sqh4uZpdfMWgsBXWhTjom6kKzowJZRDWcV0Oz?=
 =?us-ascii?Q?TRF9mLVmEg9cXAXS0Ee3J+4czBEfbRRqEo54mo9AmZGj6hXrt/RXfhymJ4BQ?=
 =?us-ascii?Q?QPWi6QuN2zrG9SMiSvVLVZ4GIhgr0T9rITJKH/V4cN0lMIE+uRdbug6vplQ8?=
 =?us-ascii?Q?dEghzwoH9snmZ7Lu9AJUzJqNK5v4YdFbAzj3chk1f9WWKClP2lMjJEAViS22?=
 =?us-ascii?Q?yUx0x3WC2jC6TCF+TZaGGtcKpB7X/8eaWI+G/oz2KkprfA89b3WEYr6OSrPw?=
 =?us-ascii?Q?OH2okpzOYQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0240c47-8c13-4578-1cee-08de5a47e41b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:18.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HwQOu0elptO5cAjoBa5UVOPb3T8tG1Duft2RlienVmZh3gb9jVopNvaXt1xtELGhTr/3EbGe4BGuyW7RkM8xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16190-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.238];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A06A970DFD
X-Rspamd-Action: no action

Introduction
------------

The existing design of device private memory imposes limitations which
render it non functional for certain systems and configurations - this
series removes those limitations. These issues are:

  1) Limited available physical address space 
  2) Conflicts with arch64 mm implementation

Limited available address space
-------------------------------

Device private memory is implemented by first reserving a region of the
physical address space. This is a problem. The physical address space is
not a resource that is directly under the kernel's control. Availability
of suitable physical address space is constrained by the underlying
hardware and firmware and may not always be available. 

Device private memory assumes that it will be able to reserve a device
memory sized chunk of physical address space. However, there is nothing
guaranteeing that this will succeed, and there a number of factors that
increase the likelihood of failure. We need to consider what else may
exist in the physical address space. It is observed that certain VM
configurations place very large PCI windows immediately after RAM. Large
enough that there is no physical address space available at all for
device private memory. This is more likely to occur on 43 bit physical
width systems which have less physical address space.

The fundamental issue is the physical address space is not a resource
the kernel can rely on being to allocate from at will.  

aarch64 issues
--------------

The current device private memory implementation has further issues on
aarch64. On aarch64, vmemmap is sized to cover the ram only. Adding
device private pages to the linear map then means that for device
private page, pfn_to_page() will read beyond the end of vmemmap region
leading to potential memory corruption. This means that device private
memory does not work reliably on aarch64 [0].  

New implementation
------------------

This series changes device private memory so that it does not require
allocation of physical address space and these problems are avoided.
Instead of using the physical address space, we introduce a "device
private address space" and allocate from there.

A consequence of placing the device private pages outside of the
physical address space is that they no longer have a PFN. However, it is
still necessary to be able to look up a corresponding device private
page from a device private PTE entry, which means that we still require
some way to index into this device private address space. Instead of a
PFN, device private pages use an offset into this device private address
space to look up device private struct pages.

The problem that then needs to be addressed is how to avoid confusing
these device private offsets with PFNs. It is the limited usage
of the device private pages themselves which make this possible. A
device private page is only used for userspace mappings, we do not need
to be concerned with them being used within the mm more broadly. This
means that the only way that the core kernel looks up these pages is via
the page table, where their PTE already indicates if they refer to a
device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
use this information to determine if the PTE contains a PFN which should
be looked up in the page map, or a device private offset which should be
looked up elsewhere.

This applies when we are creating PTE entries for device private pages -
because they have their own type there are already must be handled
separately, so it is a small step to convert them to a device private
PFN now too.

The first part of the series updates callers where device private
offsets might now be encountered to track this extra state.

The last patch contains the bulk of the work where we change how we
convert between device private pages to device private offsets and then
use a new interface for allocating device private pages without the need
for reserving physical address space.

By removing the device private pages from the physical address space,
this series also opens up the possibility to moving away from tracking
device private memory using struct pages in the future. This is
desirable as on systems with large amounts of memory these device
private struct pages use a signifiant amount of memory and take a
significant amount of time to initialize.

Changes in v3
-------------

Thanks all for feedback and suggestions on v2.

Most significant change is fixing an null pointer redef when
memremap_device_private_pagemap() was called with NUMA_NO_NODE.

Details:

  - mm/migrate_device: Add migrate PFN flag to track device private pages
    - Use adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE
  - mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track
    device private pages
      - Track device private offset in pvmw::flags instead of pvmw::pfn
  - mm: Add a new swap type for migration entries of device private pages
      - Move softleaf changes to new patch
      - Update commit message to explain the change reduces the number of
        swap files.
      - Move creating the device private migration changes to a separate
        patch
      - Remove predicates - we'll rely on softleaf predicates entirely
  - mm: Add softleaf support for device private migration entries
    - Separated from previous patch
    - s/SOFTLEAF_MIGRATION_DEVICE_/SOFTLEAF_MIGRATION_DEVICE_PRIVATE_/
    - Update comment for softleaf_is_migration_read()
  - mm: Begin creating device private migration entries
      - Provided as an individual patch
  - mm: Remove device private pages from the physical address space
    - Use numa_mem_id() if memremap_device_private_pagemap is called with
      NUMA_NO_NODE. This fixes a null pointer deref in
      lruvec_stat_mod_folio().
    - drm/xe: Remove call to devm_release_mem_region() in xe_pagemap_destroy_work()
    - s/VM_BUG/VM_WARN/


Testing:
- selftests/mm/hmm-tests on an amd64 VM

Revisions:
- RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvidia.com/
- v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidia.com/
- v2: https://lore.kernel.org/all/20260107091823.68974-1-jniethe@nvidia.com/

[0] https://lore.kernel.org/lkml/CAMj1kXGtFyugzi9MZW=4_oVTy==eAF6283fwvX9fdZhO98ZA3g@mail.gmail.com/

Jordan Niethe (13):
  mm/migrate_device: Introduce migrate_pfn_from_page() helper
  drm/amdkfd: Use migrate pfns internally
  mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
  mm/migrate_device: Add migrate PFN flag to track device private pages
  mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track
    device private pages
  mm: Add helpers to create migration entries from struct pages
  mm: Add a new swap type for migration entries of device private pages
  mm: Add softleaf support for device private migration entries
  mm: Begin creating device private migration entries
  mm: Add helpers to create device private entries from struct pages
  mm/util: Add flag to track device private pages in page snapshots
  mm/hmm: Add flag to track device private pages
  mm: Remove device private pages from the physical address space

 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/drm_pagemap.c            |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
 drivers/gpu/drm/xe/xe_svm.c              |  37 ++---
 fs/proc/page.c                           |   6 +-
 include/drm/drm_pagemap.h                |   8 +-
 include/linux/hmm.h                      |   7 +-
 include/linux/leafops.h                  | 120 ++++++++++++--
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |  23 ++-
 include/linux/mm.h                       |   9 +-
 include/linux/rmap.h                     |  29 +++-
 include/linux/swap.h                     |   8 +-
 include/linux/swapops.h                  |  99 ++++++++++++
 lib/test_hmm.c                           |  87 ++++++----
 mm/debug.c                               |   9 +-
 mm/hmm.c                                 |   5 +-
 mm/huge_memory.c                         |  43 ++---
 mm/hugetlb.c                             |  15 +-
 mm/memory.c                              |   5 +-
 mm/memremap.c                            | 196 ++++++++++++++++++-----
 mm/migrate.c                             |   6 +-
 mm/migrate_device.c                      |  76 +++++----
 mm/mm_init.c                             |   8 +-
 mm/mprotect.c                            |  10 +-
 mm/page_vma_mapped.c                     |  26 ++-
 mm/rmap.c                                |  59 ++++---
 mm/util.c                                |   8 +-
 mm/vmscan.c                              |   2 +-
 32 files changed, 781 insertions(+), 341 deletions(-)


base-commit: 7a45b8f10286a29b005fdcf1e4eb0ecff8675c75
-- 
2.34.1


