Return-Path: <linuxppc-dev+bounces-11006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9852B2651E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 14:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2kfq70dsz3bcj;
	Thu, 14 Aug 2025 22:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::622" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755173619;
	cv=pass; b=ognIV8wFO1piqMkjngC+wvviSTzmPnUwKxt7zd46bPVDz+Wo1ZHI76m8ueJXwxuOMVF4dcGHRCY2xb6NR8H6iaIptNSxjzdSMU8jv9pYmjYrWNj8b/0oPFI8ogJR6qkNEdMq+ScC7HT5TawgCGWK0IwQLxo/TPm+Kq9tv8BLalVjxpPcgOooEh3xXcu8Xondiab40G8bTPs3AmtcyB+oTQ6+hk2akDqYMGXo3Zkfl8zUhdSU5XtM2SE3vF55wbuZgV9fCNReF8QNCiSmMBTN6u5Ca2GleR+4fktQ4BBb6gzjS/NzJdihBV4yeRxMOXAZE+Q4BBwURJLLm4zwhKTZsg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755173619; c=relaxed/relaxed;
	bh=FlwP94jh94JMwUUIxviGkpnalg6FRzIqI7Hx8eS43Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CBqRAoZBMp4oD2AlLER+CWSepf1Q+H8TR7gp1hSmUZU5fdznqEGMeLB4NRQxEcy7NtJBVsQ1zrwiLUnPfwUz/cOYktuEivP66g96rpz8BiU3aSIMoQtZOOwGQoNPJitVZOyIAagb6uaRDmafdtsO+vgj7werl8XAPqNSGMrrQ6xWrHmmJtVLCajLXWG/lXcZMyW2Uz4R4OgkdQz9MU4Hf9YQmqSmVf9uOmd25xRPvmxHojXpIaMVWRhyqQREp1Uof0xqfOKhIc3ZErynd91b9yQcLYbk4GzqsN+EuaMHLxqGD8/pbYTzijnGh5IuHFCCAmWQ5Kd/OSAuFgS8Cacn1w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aalz1iI3; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::622; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aalz1iI3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::622; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2kfp4vcJz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 22:13:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAKEtyQy7PB+A1PDOHUokV1jcIj9UfR7JconjD+A5MEjcxtLJBHt7s1JSxpYDJeFKoc5sWJx4wW1shd8ql7I3qTJZcwz3MctE3NEmzWRsFPG2VFGU/MQiHZt9mUOme+EpBzAUiW7zaIwY7YDkZFaExex9NoCDX/m0nLiwm9zNYLNU+BODSee0P9uELiE5PwlEQD/soOAHFhzYATz9xTjESL8svTEPoeC5DuOPX9bYqvMZYb+OoAzG2VHKWVdhyXsEgDV8Z0Qqufg32ZOxkdb/2HBXee0yJDeGv8czLQhiGocnSgLjZMoNm5lsrsvq1x6bKm0ie3aRRgobp4BmlVDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlwP94jh94JMwUUIxviGkpnalg6FRzIqI7Hx8eS43Sc=;
 b=Oehq8j6FUcLM94fx6qjmCt32BwKlHbdp/R9Cjr714mCkxOFOAYezhgWw1Q2FVMVZ+JJ+HscSy5OhEI9vRAX2dtazgHx9KZFCmNPWygY8/961iJnx72iSUzP9z2AsCmsP0EX45wdQQRSDK8GBHO8J0HPRZSQvFJDxcY1xhR4+lPA5RcU8lu4gZHELDVT83ywGL7TzCV6dQnstmMO8/YPO3zYwfbdRtxahESmvjE7aOVFxrBgBa9NEPVPGcxpWyn3kALOf0OHCjLn10VDCdiinbzoWPhbmUTis1/9qljuRUIvOr8AD6e38KHG0cNPjTmI0kkz68wZyAXg5ueZiOs/CAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlwP94jh94JMwUUIxviGkpnalg6FRzIqI7Hx8eS43Sc=;
 b=aalz1iI3xvR52yHRC59vX93/JGLpTP/avlPpDPOBN5EawU4oI+lnI50GHsCR3Q2iiepbhmaqUidgBuT8veY629SGFeS+M/vBZX9kV5h1oD9tC2GV9ZgKR+FNpGbMdhDyJ7UZo6wxdbeShHKK7iVVESeU9XDeyfA7IVQBuXRGhMnLvd7MzUS5R0o9Jxt+gUO8AixHn7t15r+Hv0c6HUYR6n2oh/5+Jm3WZ3fvJli1TuV7NlqdJiSo5bqmxF+5w7DFfT7cRiPdwTx76BqukzEqq1jbyVjpCjZtUeqlxBGEeRavYfdlYC3VWZjRbNA2Ubq4k4Gm9QGx1zOJlK+QzbAHIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS2PR12MB9637.namprd12.prod.outlook.com (2603:10b6:8:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 12:13:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 12:13:18 +0000
Date: Thu, 14 Aug 2025 09:13:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250814121316.GC699432@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
 <20250813150718.GB310013@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813150718.GB310013@unreal>
X-ClientProxiedBy: YT4PR01CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS2PR12MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 279f1ed8-ca25-4aa5-3a88-08dddb2bf3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zfap5jlwHnvm4haUSb1I1u4N0AYZZ2KLHtDBCoIrE4Gi2C9ESB1fzLeClr8g?=
 =?us-ascii?Q?Po0B5nsl30HuAPa7u5AiQbwsghkebjwNH8mOhHR0bD4z54R42Dzx8MEcayL2?=
 =?us-ascii?Q?Ny0Fuzk+NA/QVp+GCNfuQM6yO7dmKlD+x509Tbm/U92QcimKEgduCBtoUCh2?=
 =?us-ascii?Q?qx58uTeOTNBo1wPcG9lhUnBpqF0xpkNheC8VuAQIqjEMwNqpiySBlhGr4flj?=
 =?us-ascii?Q?7XIZQ46DaGxrfWz4CMgv7DAIOeAGrvvX9NZzZXVPpPRrnGs7Db14yMfMqZE7?=
 =?us-ascii?Q?T69Rx6ny10FmsbRYBGO2aaa8IvokaM7v1Zjske36whStXuywywpEB9Czq+7s?=
 =?us-ascii?Q?FttnsFxOcFYbuDA6WZFYhl2g/vclMnkQ63sDFB+2WLXWT9rOheuT/GI4x271?=
 =?us-ascii?Q?z0eSBD/9lZoIxBeMLj7pfSmrU3fsm+O0E08mNAfLpKMJv+3gSTjUTiFQyhTk?=
 =?us-ascii?Q?W+oiLlIQclE3NlxPNspv4F88wcuqhdRLm4tcRjRM9pFT56tKMMI3HV832X5s?=
 =?us-ascii?Q?Y62rNuRSEpZwLr8Fpxg/JuT3vt6fo5tvy7LDuFIpkNwEq+JfgXJCgNjq514n?=
 =?us-ascii?Q?pScnXQjJaLr9jV8lGDySR3Jh/yKwl+mTeHqQForkE52YdyLpIGFGz/VX7kFL?=
 =?us-ascii?Q?V21qqQX9+VeHR0basX4y5i84UeUgTC+LxOSHB6WLHRwXEUQub0N9a0uJLRjG?=
 =?us-ascii?Q?cti3fA1ySfhsSXuDRJrIfRATiiOzVtpc16n8espmFLRtnFKL5vGG7zIhzaQu?=
 =?us-ascii?Q?CzhIvbDMD8AzsmdSPeg0orsDr7NfL1q2jwdBsVZfn37vV4F7AywW7+Mx8Rjx?=
 =?us-ascii?Q?BQjFlFeq9TPp4qQR2XorfJ75ZzhAHpLZqmHawCuyfZlLwWX75Kj70SYl/u2p?=
 =?us-ascii?Q?0ldem62ZgcWwo3zLIkmQ7KhHxBOYkKRse1co2TrSvO9FH6p4jnpnedZXLUz0?=
 =?us-ascii?Q?IUaA/2CEX9/vZ3g+BqTpPANqKOqvsmsRHbmUcuNJXZ5+Scu4GhZzukho+YTX?=
 =?us-ascii?Q?5vpxynA+1/KbrrgWTrcibewjEbWqlg+gMbREVojMfishVHlo7REm6+aMHO7C?=
 =?us-ascii?Q?CorP5S+BwtK0kiI3YAAjNaTnLfH4WF0utrdFEgG2fsbKZsRuXvcGU+o/adTe?=
 =?us-ascii?Q?eIh+75cMgL2EJG5TroOvL7+AM+biLp2JqQBhKXXfQcKXOGkVc6137VU+U39X?=
 =?us-ascii?Q?xAy6IYzi0mWr2A4PPoRvC4+VGkbh26GP+0aXTknZGjlPythxxj2yNxy575R0?=
 =?us-ascii?Q?GIss8Cu2ZR7TZpJCDh6yfzFzT30Q+U3KAS+JjVc05wfkZ6dg7aPNON/nCTyt?=
 =?us-ascii?Q?QkEvvW8E9SMgrr7irEyuWMtIaP0HkP4vYKVS26P/evOAtCxllRL/Eo2b5fZr?=
 =?us-ascii?Q?7Vw3Uo23TQWiw4aCeHMHakcJEPlF98oVO1bTl2Lf9oMooLCfjnxs7ZfMgIfG?=
 =?us-ascii?Q?A7Bq3mIdDFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BJ6T8GYc9fCjO8k3crpC+I79EjWVbBmkej3GbVh6YO6TbL0OqbQrSUJOiqtz?=
 =?us-ascii?Q?kuwDzaSS2iAjqPqT6/xMXY1GxeKEE+SGRLExKwcm7U2RpRXbwjVkB1JjOP0g?=
 =?us-ascii?Q?mwWo5OeALd6PWDJWzSiQKXtSY8zE/OcNfUUnT4g7Tsc5BXPMNDe4J06Quxmx?=
 =?us-ascii?Q?CvSmEhksCQk7d6KmXts2cfzzQh402x6dxkETCWcjMUl2Mrh21HAPUUDD5YRp?=
 =?us-ascii?Q?qNdcITj0HPgy5o95cYNcKbb0P8IBjnYyqDK02UpSFYw4igQkazOFIjwWzPs/?=
 =?us-ascii?Q?bC0/w4Pfp0gUELgmtawEEWFFsqoA5bK5bQifg6TZjJ6gYklEA5/LiBxw3aEn?=
 =?us-ascii?Q?zsgbeJ7LBzkZbMvg+/PaPupYNbEX2F922ePnw/s5eK7nmSXcm3dEtPXwieNj?=
 =?us-ascii?Q?fDMufX0aQbP9pnCwDJAKC+lBu2f/7FKhL/4LdxvxXBD+sUbRB0kEGN4RORsV?=
 =?us-ascii?Q?ChFyMl1znz+uZFWGpIQCwueEKFNKgLpy57H1INxbwVNw+jeWPSQiLvgVF9Uk?=
 =?us-ascii?Q?wh0O35bGr5HSDXXniiEIalB4SJv6pSr50admQOytjtJkpE+aWjs0MLfCNtio?=
 =?us-ascii?Q?KzTfHpWNpfXUCby2U9ZHN3D8JO1ztQwuR3X0+F0wwVp/d3QR1HX98mzKC98F?=
 =?us-ascii?Q?5JXpLim3n1FxPtlLM0/OQik1kqw9VUwDv2K+cbYBSvCgR96AKS3Wmbg3kTMJ?=
 =?us-ascii?Q?vEEhBJG1++MWhrj9P0SKJy0tNoxyHxzeVqSfTjdJ1l/bpbRZ5LhUY3p5PiK4?=
 =?us-ascii?Q?SjDwyBPHNr90u102+omowP7/nR2roCWOMqZta8pQfMqlluHQXPYn5TEeUlwk?=
 =?us-ascii?Q?ob00tBMKS5K5RIAgrR6ZeSyjSYBx/fLM+dnXhWHHrTKufif2JK5igttmCB+W?=
 =?us-ascii?Q?bkjOTEFA1LYnVPRomGTsP0VWx5nte49f1bHfctZc/4BYtFxYt+xFdce1IxKJ?=
 =?us-ascii?Q?gnIzFmcFLaFBkTQI7TcKoFh2WeFu3/xccHO/AJkgHN/rmjboLrjYHTDhGCYe?=
 =?us-ascii?Q?JpmxzpBSj9u8iR8/W/qEN7+McztTUM7DWt4dG3PErl/RDeEJM2guMS+CNz3Y?=
 =?us-ascii?Q?9iOxztCm/JEDfnkOUgO3bd7kJDZ5Lg2uXLgx2+OAXxrHUr5E4ragJJ8pa+Qp?=
 =?us-ascii?Q?lij2fAU2z35Dr0CjLYjHpWEx01aBPHc2CM1XxRU1jWNsEX1eIqsnb34FbQLZ?=
 =?us-ascii?Q?AF1O0CDtpRMJ16FJ6/p4hCc+pBu1ibtufywPbc70bnWZnUbbtRIQYoh9H7Xl?=
 =?us-ascii?Q?em5I9GSdD4yP15MVzBpq2pJqpyIhPQSOQqzEx4oBy9S3A8CH9sV9n6a1qpbf?=
 =?us-ascii?Q?4EdeE/SjxzChdO+TtmJl4Be1ROtrLqIDaCzAmRFignpIe2N718tntI5gOcRh?=
 =?us-ascii?Q?HCAoFuKgut4tVLRD602YB7SHOvNR/mDVkd57XbT8IvAbsIooDrHuxUWHJbvF?=
 =?us-ascii?Q?WjQgfLKyVzl7BKQK34JZjT/sVLU3z8ZjICf1bMhDCNoHPKktQeBXlQScoyVm?=
 =?us-ascii?Q?8aJ3stlS4kxTOc4c9otFns4k1a4ow5ogbGKdMO7CEY05BtmN3UAGMqjMGDhR?=
 =?us-ascii?Q?bKpaIm2Lv4LRdtFqghA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279f1ed8-ca25-4aa5-3a88-08dddb2bf3e9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:13:18.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIeclwU55ZGGwEG0nH+auFyY17BxFLO5LtNAZAlU2ZH6n+eMbun0/BrHAtl/v+8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9637
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 06:07:18PM +0300, Leon Romanovsky wrote:
> > >  /* Helper function to handle DMA data transfers. */
> > > -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> > > +void kmsan_handle_dma(phys_addr_t phys, size_t size,
> > >  		      enum dma_data_direction dir)
> > >  {
> > >  	u64 page_offset, to_go, addr;
> > > +	struct page *page;
> > > +	void *kaddr;
> > >  
> > > -	if (PageHighMem(page))
> > > +	if (!pfn_valid(PHYS_PFN(phys)))
> > >  		return;
> > 
> > Not needed, the caller must pass in a phys that is kmap
> > compatible. Maybe just leave a comment. FWIW today this is also not
> > checking for P2P or DEVICE non-kmap struct pages either, so it should
> > be fine without checks.
> 
> It is not true as we will call to kmsan_handle_dma() unconditionally in
> dma_map_phys(). The reason to it is that kmsan_handle_dma() is guarded
> with debug kconfig options and cost of pfn_valid() can be accommodated
> in that case. It gives more clean DMA code.

Then check attrs here, not pfn_valid.

> So let's keep this patch as is.

Still need to fix the remarks you clipped, do not check PageHighMem
just call kmap_local_pfn(). All thie PageHighMem stuff is new to this
patch and should not be here, it is the wrong way to use highmem.

Jason

