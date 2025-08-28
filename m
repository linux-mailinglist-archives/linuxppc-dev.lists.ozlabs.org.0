Return-Path: <linuxppc-dev+bounces-11455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383FB3AE8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCdMN2TTHz2xlQ;
	Fri, 29 Aug 2025 09:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::628" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756424768;
	cv=pass; b=XNl8E307szN8YG7MVwdHVeycHl/Fa43jG7HeK14hqJSVg0ywLxucUCHOD4klaOrnETEM2xjkx/s4phTZOZucoH3ReFpLPZ99EVN2Eknh8LljazaOMtVTlbYreOjOOR/lnCwNVwCgSYkGd3x5m3UjHErI3AlupgSaBPgjhCpZj3u4nZfS+/XPXmXrFN2Lf+8Wwx54x1K/y9Fn7fXXPtYAoWsrGy2PJkAOOaMW7ksNjhIma3Po5zAoXvuZGk4az0cf66vXzMZJUkkVyjCs5H4zREf090z7GdPUNVgdUkhjrSDHPXwFN3l3l5rjPVeqAjkCP+RId4f5am9sqboYMh2O1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756424768; c=relaxed/relaxed;
	bh=1JzfVyfbWEkwcvRy5E87In4bJJ84qEkwC/j9O+RskB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cCc5EtlLX4aoafnb5SdYi5YGhn5MEr+/fjfymbGMoY+88dZV77gHOu7uGm8qU8K0nTWRmxLOYqkmuXAaD4yAkdVyGxy33BPu3sgZ+qfhSf0qif2uZ7z8Ne20TZXyT9qV/ThJkAf78YNZa3OvtX8WFoZe+0Fv/puf74p6Ov/BPZjxAaVCBqhdNq0paRQUVwVPvEhzKI0o6AfXjAbOR3XP4zgqpP5y79V4Q7NVU4d4NSsSqdnd91NxucN5qK8jzckwhQpCmTsg4XE/+Q1NDsxLBC+mXuDNGsyaHUsj32VkPMCbZJTX7ZjVDBrjbRi0SSrGVJ95cbPq+jzARydwGkQGQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VxRX8y7v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::628; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VxRX8y7v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::628; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20628.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::628])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCdML2wKJz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:46:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC0j4lwL4dAZkVK7ch7LF2nEtfdyfLuAA9ArPob3ntYclDYP9WUWF4lzLgBjVEWhKD5fzKCHCvGY5+ndBoRrUZwm7waYZhpSqAahKYwgQ4pjljsudSoVim6I1hb9ly7jMQqHnr44z2LJClAFi82An2v/KrYyR5ZeA70EU+uCXT/rleKxZWx+PAzM297baujTy8UZVntNmF6p7b2TJOYuME78pNxz1HsfZpzErVOVNYl6GiqZ5yRWCRCzttx+jBI51JngDmXcWelvtfVyFMvxw+62K7k2qBxCZ8Fc4e37K8Q+jGpjWdeifbVUhI00fggE7wEQP4jyhOoXizMoJ8tVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JzfVyfbWEkwcvRy5E87In4bJJ84qEkwC/j9O+RskB0=;
 b=OuXuVM34IS1TM0+6lpGfRyQyiWbMArhtJHiPyAgIiz4AlR2A9iMHh2iJjDR5UK+PYaynzoJXM12KvSYb+IA2KB2fmTlbiAUz1r2mUfUeZHRKqxSwV0LmV2GkOPmgSzQ5MYzn1hZJFRWDqoYgBFtMNGuMPDBJVb8P/9jqwjbguKt+hkYnD+ht+QDLJRox2+wePM3TpqbrBPHyqOTkdOJZycEjFRPmJuUNApFbfzhw1d53g2o7cqRI0vZ+VJTqLbGS1YEEO/x5afwsJ/CT40bHaWRqBIKvugAMF2pDdPIOcs4D6WdXb0OSJy8SlnmEMFsA7TmpWwIyN/tzZN7HLbt84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JzfVyfbWEkwcvRy5E87In4bJJ84qEkwC/j9O+RskB0=;
 b=VxRX8y7v26YTcy0pm0Eq8/JX3RyQj1mvosIjLgJoJ5Hf/erONZbAQ7UuB2aWAyT2Y9SvfMSp6863o2b0yAt8wB7s96NROj09PzDBubXJK6wCzBNuANpfqrfKDpKiEKHzCkFH0xFvnRPG2404BQrGZnqFLwXObqOS4VE5W5GBq72z+BFFaXecgJpi+GM4ZHGo7Z8QckOiiC3F4ZiRqFFGTyxlqPxg+w740BlwXy/nfyhOAsCIH96eFyZ52v7TOe86DZC3T7GEjM2WE5G5cjtR5BftO2oXcDldH+HDfD/hthN/IqlvNd32XXJQPecBtJF+qCipDVffTR+6xDrsOKEwUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 23:45:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 23:45:44 +0000
Date: Thu, 28 Aug 2025 20:45:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <20250828234542.GK7333@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
 <aLCpqI-VQ7KeB6DL@kbusch-mbp>
 <20250828191820.GH7333@nvidia.com>
 <aLDCC4rXcIKF8sRg@kbusch-mbp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLDCC4rXcIKF8sRg@kbusch-mbp>
X-ClientProxiedBy: PH7PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:510:174::14) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 753e419c-5ee5-49ef-69cc-08dde68d017e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BRmB+3sKM17VmapuvDAanENDABDoL5Vpjr28rLgku94+uoeQ47+jUimtSCp1?=
 =?us-ascii?Q?u0ol1dYjEgBvhO+ruK3iz1KEP/hZe25IXKS3DBr3YL9i7oeUIybZm61bc1EK?=
 =?us-ascii?Q?ySVKFefar6hxK0//rT6Je0GyXftJ2+WIKk+gQVSVNjs+Bkungz+C7gvV7FE9?=
 =?us-ascii?Q?JWTCKInSOrbbaQQHrNsl6Z5VBvqOljwWpgr3qXQvyL+Pg+MscLmm6SArQcxY?=
 =?us-ascii?Q?DhRw9/ZD8E7yHpahJ58uR5uiRAi4+XlAVS2evL/9AMATYhX1mkLmURS/z3jc?=
 =?us-ascii?Q?1V8fE7B86lb2Ht8o66gydqV81PLbS1K7px3v2ku7KKgIc9spCDxux52V1e9X?=
 =?us-ascii?Q?2498Hip1BaWsm1qRiLue87NQN9Z8AJishXg/2l29DTeQIEgx8BvWPqqlHtMI?=
 =?us-ascii?Q?LZrzHSOQwD82enU0XZ4QvLY+EpJrrsG0aR8cPF6lU48eUz2Bwk19vFp5xmob?=
 =?us-ascii?Q?FBLQcOaGyTp3p1DF5P/fDKAKIx3KFyk25UzYulT6OPKOJ8/nAaUAfoELdNwt?=
 =?us-ascii?Q?gJJsBFxQ7TZfd+e5TwigthbjSdVMfwZu4ntQ3hbIPzZ3X8i+//nTBmsBv2P/?=
 =?us-ascii?Q?9JHw7gf5BC5M7B79SHTbr3VxCjAxyblS+ecONyQ7+pV0UZdx4ZkJaEYtITXK?=
 =?us-ascii?Q?/Ud/XTouTFMXZ5sLYqFF7qM81eEraAf2qP9fHpukUza4yBXVwCBf3mZem0Vf?=
 =?us-ascii?Q?OJRavtRWTGaJ+pLqvA6Ou8HUKqW+yoROq9n9FY6r9a2ShUiGDeBHELGNMS9I?=
 =?us-ascii?Q?dL7jH7kqZnUOoBBf3mGbE+UqUXxdaXpDchRzCfuEK4FnZ7zr4gN9ep/+4aJM?=
 =?us-ascii?Q?sw6wi+XaEogKqqzViWPfuAemHi05HSfMS4MdRfkPchzCEfzJFlwSv+GLxzlD?=
 =?us-ascii?Q?HCWlPg4s9cg/K3ly9v7KncbEKuyZo2TZaLSvdiK6wXEvmt5LLMxwqXZIWgFn?=
 =?us-ascii?Q?xWdsfLj+2G7UfQCHxukuX2UQYJuI1WLdvSDOw0AGKcw+99YC77IRY+OL92/D?=
 =?us-ascii?Q?21dNzr7nLqsmiYEFtY1EJio4JyFTMe3ec10oPKTUrkcsGkjr1/ks+6KSCtvn?=
 =?us-ascii?Q?HA0+NJPHPPjzq4wQhCZDNTDtkDziamYMNAFgr0N+PteMCcAxrxhNkG5ZyPDo?=
 =?us-ascii?Q?Ua1raoxaJ5NswslbugvyjHR0iXjibH3cEoK59tkDZ1f/uLlg+VQy3QNMGn7n?=
 =?us-ascii?Q?HCK6PdEXVn7LemiRnfbB5fcOxtdaUEPFW5lJjVHBVf8vHD2B4Bo1bM3mIXwL?=
 =?us-ascii?Q?I9Jn/tVJuGDOr+/G4UBoCVpEef7zxZjVhIs5r53tho0Sm441MIodgr3hTnDX?=
 =?us-ascii?Q?65dDh/vJRvQ25+EgjhJh4yNobd1W8xoCF1IhGxQbiNrO49hN+w8dOg6USblN?=
 =?us-ascii?Q?ZdfJit9b8mGe+lxErrCIkoNOdCD3aQ01k1hLoZQAmRwv/zUPd+uDvm7rBHth?=
 =?us-ascii?Q?Cvvs6vcbnBU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Guohg76/pkR5ZgCdXgoXw1W3mQ00oIzJR+SdpQh5sfjJMXbMJ6diFn7nFxpV?=
 =?us-ascii?Q?idifmlCDn6s8kevNE8Sf4gg9m8QK3+NtR2NSUeO9qNsfGDtGDFWFwjrJ5I5k?=
 =?us-ascii?Q?Ox4PeX8sLOraVXU+a9YyVUbixgamtzWXtFVqTFjAYxe7tJjQRhfS2cBo+fi5?=
 =?us-ascii?Q?kVVvQnY8kZ3FnBMRjUQZFrfMSc7Mi3mxfiW8w7B7GKRGTOIBn3rkqXeyvfl9?=
 =?us-ascii?Q?D1Q7+0cmtHVDvXMJiug98HJ17TCVxynsb1SEjZxEdfB/d5l5f17QzUwpPnVN?=
 =?us-ascii?Q?Gplf3AcoLO1AIGH+gwg6UqRp0s6sMkSKs0xwRZigys9wH5XBl9W2216ei6tY?=
 =?us-ascii?Q?vvR5O4PxY3fkdAsxQQKZfY3GGooMAF5guVzbOllo+zUmGHGYzSN6di40Xba+?=
 =?us-ascii?Q?ngFmkM1zsb8jSY87arByWlr7nB8uWwkhGYuLFNV0c8xY/D6x46jEvCrDrLzN?=
 =?us-ascii?Q?QdaBljNNtZJQpa7uhXrdwcbQHLktyV87FIGiljAjlhL2tDE8GgdWmjQ9I07Q?=
 =?us-ascii?Q?cpe0ZtsvokBQR0zYqw6t8PkI1eqMRH+E8s7b2oIPX61W4gxJPmeMgjkokkN4?=
 =?us-ascii?Q?BePhnvjrhX+JARM1FdSryWeoCtJ3m77i7OSY+ZS+AyHeOn2IUYgxh0ArUlvq?=
 =?us-ascii?Q?BvNDMGcSBFWJu4hdNZztzTi+5uLEGmsdU2p+6i9UE/XqPfDiTD88psrco+fb?=
 =?us-ascii?Q?fY/xzqHaiCEj1rxu6vxJXwfiTL+iTcSA52Gl7mFQGOMgADdAjDbHTUSLIaQw?=
 =?us-ascii?Q?cAixtwK5ed5SN/lVyfz4rS2BpfHcflIlkrhPN1NLFiXEJogyMcgIUlslIWfc?=
 =?us-ascii?Q?N4SxOFYJprB/AeCcdUG9CkiCGanv1lbz4sFatvqfIBj/Cz07Fs7w5EHoVrsl?=
 =?us-ascii?Q?BkitYeS6X6zNKItXzPlD0uehnMerAtpbspMmXMkfgDTxVQqDMRprgWSEZTs4?=
 =?us-ascii?Q?3ceZRuolwKKM2lcKQL+tawp818fSy1l2N5KTgPhJGK3DAjHmnUPP+DExWgQ8?=
 =?us-ascii?Q?62AcQmC0vE3imo5f6Axz3FQHoBp3zbuYc7CfhCuDOe+6hSguUTMHfZfnZyII?=
 =?us-ascii?Q?7fnKE8QhQ6zMbXSZMUPCXIEWZRaSfB/x954fCwGQFhgCqxiCxkE4w5HzBMOh?=
 =?us-ascii?Q?dLeCGlEaAsHoOcFROZCGOdisGP9Zlit0/k6rVQ+J9tO3D6iXu8tp/2c3Wk/L?=
 =?us-ascii?Q?euhoY/rX47hr8ctR5Cp1zPCIL7Hk1EtfflIpOZwE4I88A1Tpiw/JVGWBpoK/?=
 =?us-ascii?Q?wQGvzOztsizk77wdlm2KI4QYnPVWD3gZHYmFEVNhuf/cdumvV6iho52kDZbC?=
 =?us-ascii?Q?urbjXb+V0k3ksRa5Yl6SkXgRGvaBvJVo8pShoQITY792C177/Qu1Kzp8TIGs?=
 =?us-ascii?Q?jaby0wxn228VgUWgqaGu01nkxL96Q5xrnXO7hbCRmfyOPPyasuMfwZLX4EHU?=
 =?us-ascii?Q?e9ljeB3zqOhiHYAVmIosgGuhi1Wif+QzpP/frMqCpXzb0vpi6c19NhWE3vG0?=
 =?us-ascii?Q?wdimmMQp2Hr+zsdLF43kjsQZlHnbRGTNKGJW5xxYHTTjqo4bwYiXSm+YG9UX?=
 =?us-ascii?Q?+1fyZ2DaYg9/ErkWntpBMRbOiJM/hdBX7nHaA03A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753e419c-5ee5-49ef-69cc-08dde68d017e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 23:45:44.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stKDrPdUYg+cKM6Zaii6EJX1iDXReQlwcCRvIIs2DW0PSsQcsndv+JR8Lnf1GfOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 02:54:35PM -0600, Keith Busch wrote:

> In truth though, I hadn't tried p2p metadata before today, and it looks
> like bio_integrity_map_user() is missing the P2P extraction flags to
> make that work. Just added this patch below, now I can set p2p or host
> memory independently for data and integrity payloads:

I think it is a bit more than that, you have to make sure all the meta
data is the same, either all p2p or all cpu and then record this
somehow so the DMA mapping knows what kind it is.

Once that is all done then the above should still be OK, the dma unmap
of the data can follow Leon's new flag and the dma unmap of the
integrity can follow however integrity kept track (in the
bio_integrity_payload perhaps?) ??

Jason

