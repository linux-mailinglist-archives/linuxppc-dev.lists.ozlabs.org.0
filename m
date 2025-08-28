Return-Path: <linuxppc-dev+bounces-11433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817EB3A53D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 18:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCR3T0f9Bz2xnm;
	Fri, 29 Aug 2025 02:01:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756396901;
	cv=pass; b=dKgWFaFmPXzyAPiNUXurp3BE6NqgvZMPmTRyRatwIA4dyVz1uufquKaWmi3qA0kYYarcwGGskrvLpt/TQ7BcpSgXtxZlFhlGdAIqHSPuJn7tL3di1H/T8wjzlfNViZgjmd4PVFIwRwBcqFEaoqNZYW7Li3SY0XpZ/UWEgLnpDdCXQ0FQEnM8BTh1ZGt3gfQZ4ar2FrDQSm8DBijDESokbpbyMG68Lceh8Dc8QyIve5s/Fz8E3nsoJUGSOakkk2nw7iRLN2pUegc+HmA4rbN3JubQH4hemroY6zU980iKbdQWytNRyabztmlPsWktmXUFKj2uTl9Fwy+cA6fn2sciCA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756396901; c=relaxed/relaxed;
	bh=EdstHkCHpawpiiJfH9Q2VpWGfYVCpet9NlPpEzQD2U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G9EdKONn6C8SN1bqRzhLj0MNdvX+inT7UWq/gXYhBf5Is3fIc9A8hZdwvQJOp4q4ENMOFhqjsSHn0PbUWNzl+ZtWjl42IfMeYNVGG/4MRylg+hq/UPML1nsDFm6KOTuXO9cp+K8F1EJC4oKrGb6OqDB+//3LpLgHaGW9WPahAUN2L0/bUyj+OlQfLQyzE0gGIbkphTPU4zFf2O8EaCCJHsKOHZUj1l7FYTvVX05hanp2qdSKRmnCH6PBhYI+wmcAWLcwnu/lSnmOoqKtxxkriCDgdmhUtIQ6KQuI+S2jdFkyJqU3QcYixwNFfP/Y7F5Q1cAeKEhmMakZOZJxMrJbWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NK/a1uBn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::61e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NK/a1uBn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::61e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCR3R67z5z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 02:01:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Om/BPnGW3ybONVhhNEzf2AuwccXH98py5hPVxqOuSAk8HTsfTTcptHZMlv6jpYYBU92ZK+PNh8ZUsKOXl40b+OE1tjbRZG3kVZQt5Bl3l8Ct8euqFGDFQqPhYNI+Wb98DKmf9vt7PclZM01wuVO66Q+CRRZFOKoIlIyrEptnCSCy6lrKRu7TNj/FyoID8j6b2VJ0tmbeE84DFMOwJhel4Z5zOmxmog2aBLvHoLnKE3k46CC9rnzWZMZ+L4JkI6u1Uxs0uZEYDOrtcqkJBZKasDFE7MkBg262FA+FYTt/34oZ0SI+utZNuFZ45UZUNM2l9G8FPMRik398ojmybHIRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdstHkCHpawpiiJfH9Q2VpWGfYVCpet9NlPpEzQD2U8=;
 b=u1T5CCxCpwnppSirsnQ8EB332l2COzmGJ9dSqceybYnbMD6+MOvb1+w7vX4UvZoQ4Sq6DGTEyf3oPYEnIP9ylgzpEaonEAF2nLmEsjKRkG1sX+oep5dhagKK63dGQsq4Ec3mOLRsiIJi5lxvxoh0/MeyHHotivEEzl/FXRiQnoRjGcIDnVMrvg774MySaNpZvYsFUy3ZUYVGy0AomzyoezwyBUJMl33iYpA+zp9K7fu7ClFNZgY/ZFacz+KJqXkhhskY9Iu7vS9r3wWgUh+Hsqfs2dvQELAuY1X4iNk3kN8FQgYe3K5KI3GH+KLJN4uaQQYOn3+KuRx9mPtyrVR1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdstHkCHpawpiiJfH9Q2VpWGfYVCpet9NlPpEzQD2U8=;
 b=NK/a1uBn2bAOPxY5btMMiD3DOxoyxkytv1FmKKE8Akl2SQvbJUkG+GTS+YiaIg/JP0/wXKF12JdQie5OBuRVoCR3MJU5mQQQCbL5/r9mbURKiSRltov7TayyGfXmZVNyVuaavfE5NS/+7Mme2tuPNAcSvd7qJ20wEFm6X73Y11iH03fs3sw0TZ48fUmStwO39m39qvAjKYfgDCkiQNfAUSKqlTVAsEJyWzSU+TYM7/ysF3S9++WDyig8UYJZoxsMrdaRRoheDr6EZBBQ0eTcAQi7nDduHrIXGxKImTJVkl6qgstGFE0LvfPpDtNePI5cB3a9iRJ/j8zfIFSJo+E0UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH0PR12MB8550.namprd12.prod.outlook.com (2603:10b6:610:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Thu, 28 Aug
 2025 16:01:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 16:01:11 +0000
Date: Thu, 28 Aug 2025 13:01:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
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
Subject: Re: [PATCH v4 11/16] dma-mapping: export new dma_*map_phys()
 interface
Message-ID: <20250828160110.GJ9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <bb979e4620b3bdf2878e29b998d982185beefee0.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb979e4620b3bdf2878e29b998d982185beefee0.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH0PR12MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b90076d-92b3-4e53-369b-08dde64c1bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h5QOdmaL+pLjklwJ1hsRTUJ0TU5FA04/ChUWDKTTEIqoQR6UG8DtCAMxdfY/?=
 =?us-ascii?Q?lK3Mfl4rfLLltCVSN5mDcwgJqgbNufDwFgGtWFjs6ScwJ0jcR97gU1LEqURR?=
 =?us-ascii?Q?1Qom41k83JxNkuc1HJMc/tT3qq1nEdc6MbzoYJZpB+Q+XmgmKcVP0B1lnSeK?=
 =?us-ascii?Q?LfjDFxgyfyV7oQTjibvCwJpJW6Bxh1Ps+o93NY5EKKWKCZJD7E76EC4yOIge?=
 =?us-ascii?Q?3QOBIlsZsXdFu8+ziTPOZe4bukBIQcSmJvSgo2/vY/DbBllOJ0ndP4YhNZjx?=
 =?us-ascii?Q?m8H3Fas4GJXij5lUQChQFPTPCoPfCZr1nrGARzLf99lU2FkyTMfF0I3xuYBx?=
 =?us-ascii?Q?DwYyIyJ9csKTf4EXyEsrwKwx3qrcnWoCqII5HkuOEKG1/JefAdeVs+7v9tLF?=
 =?us-ascii?Q?6vb6T2gj7Jk2s9ttmqUF29eaGFMf6u6i/Mo3LvOwtB0WLpVNGlCGgu+tWhpm?=
 =?us-ascii?Q?04w7sZE75F/r4qldip8G91NgKjSpUYfARvDxILl1Q0yocdNf1Urkg+HcGkRv?=
 =?us-ascii?Q?7ha0KWl2DLagKMUArRKtMOT/PW7y9kiC9n4RVj9/7OG0Fdh+U/cauDu4P0n+?=
 =?us-ascii?Q?KQKskgvtRUjpeIBGNIMmc3ixSwcEIVe0Z2qhBsllZ+jUm6mjffbphwI30gAP?=
 =?us-ascii?Q?Lm1Xopxg9YnOFFGEVQGUOlZrKc8YFaWn/01NCqTS243i/o3AdHPjMoqlmgjT?=
 =?us-ascii?Q?VKZF+H0BRsjUq21SxZYirHgJanOtCxwPyt23Y27qMYBQxhynXpKBOC/pfUFt?=
 =?us-ascii?Q?RO9rGjkwIRsY0bR7Q3wzxFfyvyX6WrZJ+mxuHUdc1TX/FLT6LrjUjqAgAC9N?=
 =?us-ascii?Q?IN6p4sGFDiRFgwxAJtAsOmMg4kb4WCysg7Hi2UGE1MQXK383JCIToz1Lnd7/?=
 =?us-ascii?Q?oTXyHs0pkjAvn5u0IrS9zoTwYp5tnNnPkX1PZWrK0G5pmqD/ZUVkY0l164IE?=
 =?us-ascii?Q?erul3smld5KgOtIduhg65GNKa6Xq11iWjivCWxZEZd3pXpv2orkd9v2h1spy?=
 =?us-ascii?Q?vHKR1w6GA+KsxrE/8GDrNdUXJssFcdaPf7Grj5eGUyHwTd5bfUoBxrDhArCb?=
 =?us-ascii?Q?MX7LUIy6jzi7kRwAVK5+WIAiQg4J6zYF+LaFSpCnHde9olb2xyoS71dgDd7c?=
 =?us-ascii?Q?XzahdIlMbpPO0Ic/VN7aGTWMXaQqDDmExuWXlv/yig4nTbcUF+5OOwUh/XKH?=
 =?us-ascii?Q?hcTb4CntXjiR+6qAMQy7jVCVPgMUuipCBxyowj+VZ1YwokJstnCUYrvU4mxO?=
 =?us-ascii?Q?3N4fQrL1Gy6cvV4M1t4x1bEgwtlNyRrdh66bUr0+BOrgUGzGHV+EH0DvulVM?=
 =?us-ascii?Q?+NeQ5uqiAcAQkHind7ExXp6nD9Ik34uMRD4TyRItoXasxcWdMmG4X2bo28Lw?=
 =?us-ascii?Q?IIWn5AzUZ6A8w7GP9UsBFCuTvNd47A2xjvujqV6E55ciZoTxgq1rzRPwdpkP?=
 =?us-ascii?Q?QYK4ULd4kbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emov0xpwdzd0eWxrHayyQ7BNIYV0B48ZSFkY8q+Iibu6uGJ1cqJOC//YpdY1?=
 =?us-ascii?Q?4ttE+ETLilY0wpbs3ECP6dzeOge9VxxTZfTKfaTY4Du6hNH2VFPxiWXGaHdI?=
 =?us-ascii?Q?OnjnmtgMmhIZLhwJ6BOA7+6kixnJyYYRhzUiRhZLa/EJQ4Tpmr1uyGFzzwqI?=
 =?us-ascii?Q?X3bYusGsggfolYa4h3kQq27IiMGOQchw23QUH5DBm3EppzV1bsLWwkAbKA1E?=
 =?us-ascii?Q?xwvM/3mjQlSk7VKa/GqQ/7MgtC19p8lRT5XgZpcSRvgLeu0LL8xS25kHgxRx?=
 =?us-ascii?Q?w9M5gnmrn1oF4azTs2w5dFKqlt6MZRY95P7mH3254cYanv1PR3NWxpZMWbJU?=
 =?us-ascii?Q?5at4WjuyDP3YQJ97njw8klZ9uBNoOzi1O8SjmNwbPpqEJ/c32qjajdBzJi0H?=
 =?us-ascii?Q?TX6LhgmZ9ixJ1XQX49fS0j70h1fmEN5PdLojmVrS31pbr8g3tOyMnE2fXtVJ?=
 =?us-ascii?Q?ZDAX5j2Nx6CYOIm1SLb/MIYg6VJMwVmCk5Ba9AKt9GPhAqA9KtngB1sq3+Hf?=
 =?us-ascii?Q?I3HT9y7DYyyMpuYWoBgzhi+8jhj/pgc9UBBcc6VxJx6bD6/So/FUZR/3zttA?=
 =?us-ascii?Q?q/cT3T1PL7qWwIda2n3zyjYLHCTVSuv/iCIXC2m/om2THcpzvlJgL99BV1AG?=
 =?us-ascii?Q?4tltcoIjgDSCt88uqUIn0BIZITXm78neuB9uzKtZ6pV8zWHLfnA/Jg/yUZjb?=
 =?us-ascii?Q?AZXtMiYgHSXip7KeMP2VDoSI1S2DnVfiTD2kkr8rwptPYgzxk+ChXDoziLRv?=
 =?us-ascii?Q?aICu/DMElz5cNpMQQMOjXFBt/tiRkWV3LcTOf/iWPhJVgrKxI0dMrkbqBmwn?=
 =?us-ascii?Q?zMJ6hf2tc4JGPV7pBUuUOIB0N3RWN4gH9C5h7uPkrRgF8frKhQaQ1JFkZ9Yl?=
 =?us-ascii?Q?XyWRbNtHwOeeWJyXAFB6IysmuBL6HPOKlwSSw32/1UaCk1m7nXWyPj++7TeO?=
 =?us-ascii?Q?Cwuzlstr0xgeCB5WF5xcCmlxFLhGDhKGemzZxZ4CgwyY8GM5XYXtQ7HHRAkH?=
 =?us-ascii?Q?ATGiUdAGkBQGR+2tB3caEYHXdLD7u9r+0yQ+/NmadoGnQXkNwFbMCP2HfHso?=
 =?us-ascii?Q?HWIsCB3MmK8O6rVJJASq+fD0dQqee6+fgGgtmVRHG1REhBnBJfTewWxjwpPH?=
 =?us-ascii?Q?3vFJJuTfC+AZEVd2dMWG4foAEYqa1Uxd3Dmwzt2Zu5HMTaAwXB9AsI3MTHc8?=
 =?us-ascii?Q?ku26jTqXKcIapCsE3uQeSWYxScVNsWovY0Tm4MzvLrvr6sCMO5iUZR5PxsM6?=
 =?us-ascii?Q?TAL/g66tPit46GdzWbNKlxn6ssNEBQg/D9SeF180iiEd7pDlRkmf+pSKUnVS?=
 =?us-ascii?Q?+Ye+hPdcAn82qJWXjDqLnWsXXH+fScnGLJcDOCsTAXrvRzdsqE0sBwSYUrxo?=
 =?us-ascii?Q?DmpW0gKJ+PN9QCd0/+43ejjl1wXVy/2jMVR0gwmeR+WqjDktDoxwqvlclysf?=
 =?us-ascii?Q?sFn9A2x+oErF9eyl1YK0uKVbSM+0ihycpm2qq2Az3vAT+iVMRGjDkwPkWAoy?=
 =?us-ascii?Q?ipv81rex8L8KP/jH6zKVwrsHeAR9OJkSXQJVqVhXogIJdvDYYPR4D3nUomvp?=
 =?us-ascii?Q?1Mry+PoimqGoaKlV1jE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b90076d-92b3-4e53-369b-08dde64c1bc6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 16:01:11.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynsF20IHaNaMECo0lQvm8uXEaRXVaxJRSfgxp5voMi10rNTDoRaHMZISyi080voU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8550
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:55PM +0300, Leon Romanovsky wrote:
> The old page-based API is preserved in mapping.c to ensure that existing
> code won't be affected by changing EXPORT_SYMBOL to EXPORT_SYMBOL_GPL
> variant for dma_*map_phys().
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/iommu/dma-iommu.c   | 14 --------
>  include/linux/dma-direct.h  |  2 --
>  include/linux/dma-mapping.h | 13 +++++++
>  include/linux/iommu-dma.h   |  4 ---
>  include/trace/events/dma.h  |  2 --
>  kernel/dma/debug.c          | 43 -----------------------
>  kernel/dma/debug.h          | 21 -----------
>  kernel/dma/direct.c         | 16 ---------
>  kernel/dma/mapping.c        | 69 ++++++++++++++++++++-----------------
>  9 files changed, 50 insertions(+), 134 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

