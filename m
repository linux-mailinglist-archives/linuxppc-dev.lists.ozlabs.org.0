Return-Path: <linuxppc-dev+bounces-12652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C2BB73D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 16:49:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdWlQ3t2nz3d4H;
	Sat,  4 Oct 2025 00:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759502962;
	cv=pass; b=M/KPs3QmW+UJwKyMVyglnw/VPFlCnsqcfLomkp0KiyQBcuBY3gxL0ro1ZkanU/0srJB39jlvxgZPu7SLXHoLH86Spj0d7ckEWZqvxggY+U1h9BaC5t/ncSTmT2ulJb+KtGID46EO0Nneuy0/yrN+kCuS7MfbyxoSbF9pnI3Jan18xj/bsSQLdvDlz/rzPo3kmjc/0hxgNjU7ohAMURtxZx9ak4pdz7gxG5fZP2mUB4EzLc+zNmfSqaO7oGJpi5ZimpKiPm6ISN2V2EZmu0jPLet0CmeyeHeAFY0PjDpvFRHnihgId7cMvDdYew2Cg+AFufxmjVkFYNYXRu0d62m1ww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759502962; c=relaxed/relaxed;
	bh=AYkpFpGsPlj8CmDsSoEgGxyUmgiDL9vdiz65x05Dd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L1C1uq2zq694HNQ8hzly9ZNP1VEfHlB2P+ytIUHZq/UU//qdlPKl1s9j/gigV5afaaz4TrOewJzDeOPUtOyZvM/2xXKxH96GgIc/RLZVMOsCGsGB+TwBb+2p5zHlxtuJYcxvVN4fbwzMaGdirnJAADVisPQy/lpWUGCDT2aUHp2fCF+N0CoRvkxP3++HZpy8nQdgBELhTSEXmo9m6iRmRpppqMdb76ii2DNkHBOdgYfG+PWLFaqCwDcN70Ctj5lbbl9ofkMDpaMt4T/rc32J86AcycxNUnP0darVffJ442uRsfi4VDEPVe70RnRiA33qIe+zbl8AhqxK5Nsg/Pr5Rw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pkfBVoJA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pkfBVoJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdWlN01zYz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 00:49:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhwjUKPC2KYAJt1sjPus7C/PiLD7KLzKX36jS9As6t4UWkKZxX9lhbEn6WGA6IJWvXvki6E9n0eVSc9pMYXra43qvMh8+NOhsXTArucuKesrEQDvZFjmpik5bH4yTjdDlI0QTqtZCEtgXxSnDnY5xRkunhVTbfI+HEkjNR6giWSiif264ucieOrbIC1jOKDqP6OQ3X56McIxf6hBxEzVD8vQ1jMLle9QGQ742DLS47pl/byX7OijMkBeWY6e9xZBQEizaDzxf5j9Or5w06A60otrLWLAGo37+OnGZzNQ8SfM99fx/ClEwtsgC6t/xojJjOmaEVYw3mAFbApy45iY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYkpFpGsPlj8CmDsSoEgGxyUmgiDL9vdiz65x05Dd7k=;
 b=hCtz2m8tyJbHHkQBM3mYCT38fDE7us52OfOBwkGmKZn2wHQX6fgUwyeDdB4eZ2COnBkBEoVksSoBIYUrvdA/l1eFRQiGIt0G/ZqyngZft58mHQnaVTLdIP1rJHmKw31MFdOUXoQtC5b7z1+rLxWMRL7Ykmhx7rKFIObaC9EWtJWkhyosTxJUAkkrWDNwMTI/EprvbFoCWmOIvONE07ZsOcdq3Ri+3EjkL0zf/HiSaT3JvfzjIK2lWbiLjtTl3FSbdK44JsD/o4i6+YmAnWLQ1xwtQsiSog67/amqzgHjNTToiqVylGQizazpCiAnKikYXk9Iv96nRr5kKFMsKq9Spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYkpFpGsPlj8CmDsSoEgGxyUmgiDL9vdiz65x05Dd7k=;
 b=pkfBVoJA9lww4ioBs57olZiLMicrvGsV1eAS8WrvytXZQUIsp1xr9JOUpaYDatQ++wOKoDO96xiarIV5s6VcQsx5ZFzc6iCfR9ZANbuR1nJ5QdeL+S4Sw+6xQxm4xWVMeJnQv1t4ruWf7b/QT5Pez9yRxjPvLiPa50f1xzh1qBpMs9QjoznG4/yK3g0hZwTmhTQIpryDKaeH90fPOtbOhopcA7g/v3VmJVLfbYTlBjUARhxvKRJLYuCgkOOruoWuHrDssysw7jkWsSYtSBr7m0eeVGxgGJ5XHIXm556vl0flkKlwId90FwbdzTjgL6xte2JZhkxpdIJlqavybtXw3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:48:50 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:48:50 +0000
Date: Fri, 3 Oct 2025 11:48:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 2/9] MIPS/jazzdma: Provide physical address directly
Message-ID: <20251003144849.GB3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f64ece5bdf9dc4c7e9407a5089be68a8c5c011a5.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f64ece5bdf9dc4c7e9407a5089be68a8c5c011a5.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:408:e5::9) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|LV8PR12MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 26de6d79-bb1a-4ef9-be34-08de028bf738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IUAl/VgXUmB/mhWWSJmxf09dnIZpes36QCEAd8eVTXLbNI/e5d3NcJm1krOk?=
 =?us-ascii?Q?ARayVKxss3C2w22Opx3viDXeC1fSr95fTLJcRfQSMJkpFVZnptDP77QoSuRF?=
 =?us-ascii?Q?asc9JdzxNiXG/Sa0q0XlAwFvM/WftwNU4Jrkspu1UVCgWNr+glHgIatNokFw?=
 =?us-ascii?Q?ZwQJ3L/phGCM9Z7TULplmfUxIUPgv9yoyWszrdMQUzkjt56P04d/v+Utz6rl?=
 =?us-ascii?Q?6IoMwufH04Qw2QJxF4SLgFhRvyijORplp8izkuQ5Lswq1GXy3/nZcF+tZM++?=
 =?us-ascii?Q?/kznBAEiq98LUj5sU39zYQCrPhsfJMk3p5o0wYjR/Zb5FyTordsFbiX/AlqU?=
 =?us-ascii?Q?gZpxJqsHZMjUAxf/saq4Ybfv8IAIEoYue2Nfo65i50+TZ2JMJCDMewxwrtvj?=
 =?us-ascii?Q?AJnchhyjbeyh/HSzfind+lV502i3X9Yaj9bMDWH7lYHZMXLrPZ6767uzfumP?=
 =?us-ascii?Q?f0RBlFq5UAlJYNHHDemkCJFA4NIOPRuVL9VgPU3gWCz/Gw/61Jv80B0fKgNG?=
 =?us-ascii?Q?qrgxQdmS7iWVxrcmPCwKCk5V/CwAswuY7C0zBjZJnLmCKfhReB7X+7QWA+db?=
 =?us-ascii?Q?t51J6HfJC3TkxSZQVmy/u6VwhRNJsw+As0xt3EF/NUpjvDDqY/4xpC1KyiH3?=
 =?us-ascii?Q?ld4DgFSxSoM1ODNP9HO8WylxgEL0dVorBwVjEqydJwULjtV09zrM74jtcOwj?=
 =?us-ascii?Q?C6RQy0slxkCLfwTBSwDFD8Tgnmb8Xnt35EFiGQ3AP5n3Ccw1G0T1LmZA0EWU?=
 =?us-ascii?Q?+ULW6BPK7/OfCgL13nHFoUGAgopaqry4MYsZDIvEHZV4LrtGjN14ylrXRjfV?=
 =?us-ascii?Q?ZgnMBlFQno7uvAqTx8MUEKV2pb1husUL1bE16SC76Mka7TATm0Ydrb6xTPd+?=
 =?us-ascii?Q?Pi6720dbOQycZrniuLvIqeoXirwrvC7CD2bAcnh7YKBhIg7PBsO1PAnT0Lvm?=
 =?us-ascii?Q?hgvGYyibhLxoyCN08y0VzMfT1UMgq+V0QOibx4bfmGSSCKdcP0efcQyCLNbP?=
 =?us-ascii?Q?LCnix/tBq87ntzAAd2UP9mpRWwEK3IuNqJknLm/YXnj5mITKCnOwpBt7m6Uk?=
 =?us-ascii?Q?Y8wAXUe+O7sBhVH2ElJOxwVaz9YWTwJ75Zl0ogzReft30fbxOOzpga4gUurL?=
 =?us-ascii?Q?kj+FZZgF14a4q3DBtLNaPDF1A2s+atMzpE1mIfL5uZOjPK2GNNXxRuYGBUQ2?=
 =?us-ascii?Q?4c1tZxtN7wZ46t0Mt8WmcRiyIVzuy/w6jHcpMnFlfSRq+hppT+LUz3OKmILL?=
 =?us-ascii?Q?N8uyf7f24FJVTVa/plDikXQeDaY1GV5aZu23cRBvy8z4NN50BSU0L1WQxLm4?=
 =?us-ascii?Q?MTgcqncU8HXjpSYeNGfSTKg7r69xLWHHN6nV97bFSWnSBpwXSToM0Ehsl2R7?=
 =?us-ascii?Q?Twu1ABY5O6DFmZdYBh2+nQcTlgF/mGf0KS3jzf6cL4qVQRrxW/UjY9QRyjgX?=
 =?us-ascii?Q?xLGuHIIrfmgE7AQh0n+uyQP+Do4rIXQT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkR94ot8rQN0q3H0Yh2p9ZnNn4KIsMlaiiNOxdKfg9U/trl3P0ak3ox8Hoa8?=
 =?us-ascii?Q?uXPl68CuiE89TSYOsSnzUEEXTK/hheNDrj+KxCJdBrWwnHfOTF1WF+TTbkdq?=
 =?us-ascii?Q?JOV5wlfJLWbABq6WutqjjxqnxZobocPH/6EJh1lKgbkRpRsVxWpk9X+/7dzH?=
 =?us-ascii?Q?JmoV67o8ojoY+HA/BCDlGJXnqSzyWwZUL1nugMHQZ8EXKtQcWlqAD1uQ44hp?=
 =?us-ascii?Q?e51q8HdOW3hcv4o26SOh66RSaWRael7vISSHYNMtBLCVOd034PRX7fsbX78j?=
 =?us-ascii?Q?s9nwzWp8CKaC1cCCz3nid6nPXLHYiwZkIDR0zFtTX7cnBnxi1rAhRsFX+uUJ?=
 =?us-ascii?Q?Xr/dN7D+jB+IUwCDydZKf0w0NB15n6PPZiKTAIEt2LyTBIxskFOoMdPp8Kyw?=
 =?us-ascii?Q?ArOJthsTnUY9lWbjaQ7t+U8lT9smjiczl3msM2TDi0BlR0Ie5zNulVSNJplg?=
 =?us-ascii?Q?KByB3nrkP66PkDcXoIO6vnsZUZiGw0WLUG93Dv97CcZ2GH9MwSUdVKFKUXrc?=
 =?us-ascii?Q?uURZHj55KNRnuDL5X8UvMnUYj/UV6uwRcjEsHY0R9V54vmzB8WVfKbJRHZV/?=
 =?us-ascii?Q?ifZ8cQOdn6qezhAHcgaFXuWVgdCRkQE+bY1LOffdtwB9LzVBouonMHJJr/7/?=
 =?us-ascii?Q?B0nR5etSwkY5P8gv+1K6DkN5shVGMu5gyNFadHgI5y4LkR9F+tDG7sDA2lyj?=
 =?us-ascii?Q?3wiHkha4fXZAx5R/xCZ48Jqvyk4ffcsH66gNM8gmWMfVwHh52yhO6HXfbvUi?=
 =?us-ascii?Q?TqGBZ/X2wpmnnt7g86W3Vm/cl0JyuUipw5+h3SNitvMp/YKr5UOBVMKJO2QU?=
 =?us-ascii?Q?KAqijQO+rhiivINM3Q0gfhpSAbQ3uCmwm2yN8eq4cmk+pzC5pUKzK5AC9KWg?=
 =?us-ascii?Q?HtjnLtCPTD6+tTq82MQnky1D8ZkWfsud3cSNPQE3TQf1biTOVYtbE8OD8Uii?=
 =?us-ascii?Q?w68fHHXwp4jrI0BRFI6V9BNwlMbGxG7q/VtBlWXLNd40IZD21k1/ThLwG1zh?=
 =?us-ascii?Q?WJSTjoKvdV+xiWmJ+inFqZ9DVPF6F4jcBKP8DyLOEzXwcLhm8/o0wm4cGFoW?=
 =?us-ascii?Q?UpnFttz6O5vzMcziVlDJV3im4XQRQl6UIqZUq1OmK8N9RpQ1XtVw8z7iO6Yc?=
 =?us-ascii?Q?qB555/yXwW3xFuNZi2eIxOSg53TTc/dmghqsqv3QIkdWWMtVjHP5otm8olhB?=
 =?us-ascii?Q?eox9JFHjlfFQGz/z8Ybdx6QWLJmW5Vol8S8e9RSUiwQ+P47dgEJ+acG1AV+i?=
 =?us-ascii?Q?wY6e1mQXbDQeMririPM4ip6vhl6B3pDjnJRVY1HsKxzCh2pQXu3M2F128y5m?=
 =?us-ascii?Q?jBXUSlsuzwJgnCyal6S84CeUvIhpW+kg0/rw0Bh5Lh/QDIor8hIfdNzz4mCg?=
 =?us-ascii?Q?Kg5O9UOhC6grp2uAkn1sU55kZNFenINWN3ny05s4NlRHiE/ndOGizx1cw2vx?=
 =?us-ascii?Q?o2Z/zcUVejT/AWwuRYKwFIVNMe463s75palfL3ntsUHqkCUB72QgMxiXD1F3?=
 =?us-ascii?Q?5sfOy23Iy60z/T7x9AcYg9yzC/aeVT6kDSoKUK3pepawDDBjADNL0PQi4+sE?=
 =?us-ascii?Q?wSkYVmNjVownR8Ibw8g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26de6d79-bb1a-4ef9-be34-08de028bf738
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:48:50.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DfvWFGhPDOeJ8LDiBifmPUdvIgvbh41vXmGSGLetL7t3rCyCH5HNGymAuvhVYPg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:22PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MIPS jazz uses physical addresses for mapping pages, so convert
> it to get them directly from DMA mapping routine.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/mips/jazz/jazzdma.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> +	if (attrs & DMA_ATTR_MMIO)

If this has to be respun I'd put an unlikely() here and the {}

Jason

