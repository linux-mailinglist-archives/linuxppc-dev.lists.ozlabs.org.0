Return-Path: <linuxppc-dev+bounces-11882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05210B48DEC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 14:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL6BS35Smz2ym3;
	Mon,  8 Sep 2025 22:45:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757335552;
	cv=pass; b=cM1fS0mELL+uuSY9zWrHaqKi3ON4W8tvslgvnUlkrFaGDeJRTA8m/nj2G2OSPK0O+BV5I7v5Iiiuq6NgMPxlQGN8Z9lWiPPkcKbijRejcbyqS+Y8NWIzfBw2PXXe+Rf0GVkX5f3T9sEshZzTLOoBBDgKDzEcbXd9Q54TqYRX7tzqoGtoNLCYfdD1NXvU/2q8OSdQLXgNz5TY8YT42UMij6QCdOHKw/5XVKQcMbPWcj76qZUOOGRp5uQYO3fOe41gHgYWEFmPH7WLtAa1fSsaBss8paygg6VJ+KDKc1/jDoXNfanKA/Sr58XGRMIBYCbu0wIoiglV/g9t/ZTeEJes+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757335552; c=relaxed/relaxed;
	bh=kVtJy3VxH0BzMR5kUXXhlP/z9wRsHc79lEhpuG67Dec=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HHW0ZLvKRpdQ6Cdzs+/FfHaM56IwnmK413IzI+7Kcms8ryUohSBZYIlLekpD671MBYCGRxxwogbufepp8wKnsDO9i3wimjMcCWI5pV0CjMXqSrpmoM28M7WmQubC5ChpuHvxMXsri4lBxNzrnZgPS2MzoOY87we/aZt4kmNDWuggg6d5mSLhhPfTvLR8SaJ2iuQJrpolIMt0yfeSkL5VdTLs4gDDN2PQFG8q1nccIFirBptUI08lDbHMMZ2bHGo4JjnO4HRdKYh+Bxji9EaNZo2jN2Ki0YUkyJlZcdQowDPAmBs8uys7J/433mVG67sj4YUjjhyFqyMwEQ7JuYFBIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TTXRCLKb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::61e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TTXRCLKb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::61e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL6BR2BsCz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 22:45:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdxQVyLbcPIzsM6sX7q8x7QmTn6cnd1lfXvY+FyzL1eEYsJhq9FOb6iapvK1Vz5owlYgWdY9IcbGDYG8U3EX3/aLA0nDcCYTJC7wHenAsnAO4Czyl77gaCg7SpKYxFc8vCEpuna490IbfIxsgf/ViI+4fzVEemqsS3aVW9Y2MZhLbVZX/uF/wNgSpbNCUvPBsT3kU7vL621wcjdrvJSbzaGGNtfbB6NLqSbDi0YipLdWfMOWLkamlIDFiHR9w25kDbwO3pu7Wt69fsWct0/Y9gw6jnJwFKcl+JSZ7v3pWCEiKmz6+YXiu/WBXR8/4CyQC2eB+n0kBVADV5jrPd0Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVtJy3VxH0BzMR5kUXXhlP/z9wRsHc79lEhpuG67Dec=;
 b=o3stciIRY0cSJ/aOoKNOmkPUysvopr5Wx/viD+gEzJmMnFkak7IdVhQbwrw7tsvA6T0FYwu2yQ5Nwoyj9qlnzkWKTaMRsALckATri7XTNhou0MLIyx2PuHCYXgCae/ZCpiwvzum50SCvDdvYJ4RAuY+eym69GzWs317bloT3QfKrPljCpgtlwN9FbC+UElJQ9nliFQDE2C/dHiswGGaVahPyeZI/oP7dvf56EbFJdVUZTHCqKDWGl3FY8GPa0201Ebw/riZkCBLrxZ0fJZQfdLnHV7BMPixp9lP7coa48gsTnOOWWAkA9bdBVWwItKKN47qeov3W/7ZsaJHd45YQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVtJy3VxH0BzMR5kUXXhlP/z9wRsHc79lEhpuG67Dec=;
 b=TTXRCLKbvDNzd5KMxBGwU4icKF5zN/F9rZAVOPQTpmAe2H1urLUqSZ2vgAtmyfMBWf2HsCCEc4/WtbChsSNi/3Pv1Zjk4Hw/+mt+mAwb/ciAqfptFuWataPLXR/6jj9igzgfifaMhvXm2ezJ1OpLfQ6e2qbAr7QTqZ77/fkcJxFV/bBTDr1R6ILLENwXsFGUIay1tWYhYlgNNt9JznW+pdjZ1NeaJ4gwuVbS8dzJhOiLGhFS/5QRDDAetxRUDr7ApoBQvjvcnk/iLP4GU5Wki5LlxIOK4JHlJVE6cLyfmXQCp9wzQYACVXV12CbG7qHf++PrC5Zn1ciQzJNCTG1moA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by BN7PPF915F74166.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:45:29 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9094.017; Mon, 8 Sep 2025
 12:45:29 +0000
Date: Mon, 8 Sep 2025 09:45:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <20250908124526.GW616306@nvidia.com>
References: <20250905174324.GI616306@nvidia.com>
 <20250907142509.GA507575@workstation.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907142509.GA507575@workstation.local>
X-ClientProxiedBy: YT4PR01CA0305.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::13) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: a297ed27-88a7-4d5b-a32b-08ddeed59743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+6uZKrS/rFG7MRbc+Kg/J4Ot96foh2BlZEiEN1Gc4OuIi39qI6yHkY4PEkfG?=
 =?us-ascii?Q?jA/PRoUyT1q+EIGXzX7t0ApHKIxeYDeEAl20/rgmrNPntcmc8Iivg+AMC3Lw?=
 =?us-ascii?Q?WOAXYZ1L6evCFL9T/bmJmFODQWdI2MH4oHxaX1HopkzRh91IxyGj+9peL8RV?=
 =?us-ascii?Q?9fSFLbno4AmTJ1fSiEIyyohEE064gEroDSm8XNq/MB8OEEMKSIj0TriT3Ssw?=
 =?us-ascii?Q?VortqCOKPGT2hv8cT1JPF44pejI0n1LsWAyFLR1gutdbrehx8vokd3u6KVqI?=
 =?us-ascii?Q?GgPqNSiI3YrCnTVCk+Tz3GPC0uJ5ZIw2yNL/us3HAvbtqxm100PlHVaPKdYe?=
 =?us-ascii?Q?2V7O9MKWWOQeDozXhmfBSqmAUYFqt1oH5vl0hq4APA24BfIXU+HWhyrEsuz+?=
 =?us-ascii?Q?wq0KXWfVrz0k82RLqVQZ/J4eKXhnTPDrOA7AaaickgYp0gQu1EwhU7ifJqHV?=
 =?us-ascii?Q?rqQ23Oqz9AD/ntgir855KqvA3s5THBgyckszj+V270BVldG2vBOQkZhkBQia?=
 =?us-ascii?Q?e/Tr7EoOPpmzkqHbtsiw0H68hrG0eqMTcuE6RCl6X8SmIa+hl/4V2lg41ndB?=
 =?us-ascii?Q?EuqxZyKqlPaSw2MjBw8QvvlvhUWWiUpC97XjmiGOrmU5+WoChm8Zts5NOuVt?=
 =?us-ascii?Q?A8Ki/8+2p7ahT+pimvRT2prrUpAQcHs5cA/Fx4PDgspNgL/FwIU7g7Hccb+H?=
 =?us-ascii?Q?aqiEjctDv2j+q294LXOSulq2fbOjnK1RZtOSSVSPy1WhZZ1Alz3sTuPF99tO?=
 =?us-ascii?Q?udZXTc4yis+0F+KaFGNDjVCDRJc+lOAocmfLdbmKFPwbbIjX3mPFE7zajQd5?=
 =?us-ascii?Q?qfo7G1Gfvl2ydc15Lpk0AS5qoTk9zwU54HbX9pg74pg8KTlE5hRf+Pa5ocmO?=
 =?us-ascii?Q?cHlGOnwIcdwg2nys8IcpbhTR9gkPhnBbid/BFf6fcWoN3cpUWYOylZPFUk03?=
 =?us-ascii?Q?HywyUTCqV/tnz1EUkeEfa291hPquovP6yvS2pL9GrerxVbQaXpVgzcTJLbIg?=
 =?us-ascii?Q?+8EYx0FmnXIPtYM4tFEY3dbme+u69ebfrxAQIKIQVCNwN+nDWv0FHN5t7hbf?=
 =?us-ascii?Q?RzY9nK7LKxC9CAhWPmtD/3kHWAlIPWMC61O7+alpounDIUmQRJl3h+RGct+y?=
 =?us-ascii?Q?6eCVWNGJZe+TjhGMDjxpT33n6ZSxSyUd84vSC8czzPWG4JS/IhDOzsvQ7yDq?=
 =?us-ascii?Q?56yBS+5JjbfIywsP/qiEAV728XS198lNNAFaAmKvHE9QknNxJQTLoX29Kgl8?=
 =?us-ascii?Q?5WqbAaDpYtAJhHDkND5bkNY455cdXsjt0XTjDWEbD9A1p/r6J4Yf7kIXShZF?=
 =?us-ascii?Q?/IouUBTbEb9MU4sDMEZz8eKXYjmBhmh/Da085uGm9qmpvGAmnhn/4G5G2r+R?=
 =?us-ascii?Q?jOMfKZc3Z1rR6MN+r7VxpOBLd+Th1pqOiT7cDdD8m9TfkRZoSjdxvivtFHft?=
 =?us-ascii?Q?YZW6miCbA+sYYRu1iRXK+Yn5tSAnkNiRV8QX/Ztjw3FUI5xRUysfEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VaRDYGzlyPZ446X9cUFcoyBn4ZNwDpZl+Wn1SszX+e8axirqjy+8nBXqF20N?=
 =?us-ascii?Q?9aKtqeEbs0Jq8B7NCS/khSfonEox/eWnFHb6kOf966QYkVg/ET8FoUvKKqBs?=
 =?us-ascii?Q?V3SUQYRMwHo9y8uXX3e/RdmPF/pmvKhvdm0Spa61mTHuGNXRojfrkkKuaOSU?=
 =?us-ascii?Q?h8XBNpQ8CHYvnI0fJHnJc2RyhrnvyE/7KZ1ah9zOSyDw2D6SqGFiMN5S454N?=
 =?us-ascii?Q?9CUDie0XpqHCbhArrhnYqWk5yEPecvZDL/ADhpHbKH+XYubEnKJZraeW4uor?=
 =?us-ascii?Q?8lEdL7JGpHDvrxXJ2JFAXFwbTCLSVPFx+xVqa1N1ByLX1AIjkCTQXU9th90X?=
 =?us-ascii?Q?Z2YrgDTc9Lq2tLjCMN6A6a08AckBGfEaFnPnABhrWuGD6Dx/DUECxnxL4Smm?=
 =?us-ascii?Q?j180nsWWH0EKFvhP/fwJuixzWKoj1gQL4jWDtJBormM/nSEDvS2OKF+4SVZ9?=
 =?us-ascii?Q?zxK2/RCBGAAdzl8uV0xrBNNFkpkRAnlez7v2PCxpTEzfAuollRpheC1xqfht?=
 =?us-ascii?Q?3HjN8M0xDa4a0wr8CW65uMdG1gwwRt9qrU5jnaWgT2n5gicGXcRSAdrRhx2a?=
 =?us-ascii?Q?/XmGx/189f0TGjStS02vZHAtQ3L5vtToX4bGwAKFAUq479985fhUESmNttMA?=
 =?us-ascii?Q?6Q2vmD6vLFaWZGjjpAY3kTV5LVzOtcFf7w16oM+Hddu70x29LoG42kbaNSGm?=
 =?us-ascii?Q?1lJm3SXmb2ykDFOcSeYoT/GONUv2ewDZqf7gh4rs8oA1HHXhs5UqzY2r3QJQ?=
 =?us-ascii?Q?/VOjHqme64F4KM8eT/nGkZeryj3tBQZ00Om5sH++YOs4GxP4TthE7mjG9o1/?=
 =?us-ascii?Q?+NREwv4TdTRck4CFdchOtToNAVaFsdjRNTXm6iC4oYgvGhvrKLBErUBPlCJI?=
 =?us-ascii?Q?wM6BKktsOqabF1AcVFQDveUBB2ClsKavMm1QNxk7j1UDVX6t0mZUvW8c0AWL?=
 =?us-ascii?Q?WLBJfWnMeOHkFjgkxv8t8rAbh6zXRa4kufED8fRgRu6RJ8Q0rg4V81zwsWQT?=
 =?us-ascii?Q?MwbMgIvsOD+RH4YMG85gaI87L8e4duL2bwy3WNN0OLmdqp33FDZ/e4D97/GJ?=
 =?us-ascii?Q?0CXch8MTyrNJvUgn3Ngw98JmGAOCsAAcutZbuaLFNbdfEBQVicuoUpHDnIyg?=
 =?us-ascii?Q?QGZFX8AolMrtqoIKanyrjxkT9NbIT+G0mDhu5k2puPxH+HKCAAqSUi7cmpiC?=
 =?us-ascii?Q?0yMmruH1U6FSi9mmYUfHUd5wY9LGYJGPiGtc2LQZx6wYSmVeVdp8bWT04woR?=
 =?us-ascii?Q?Y2RtqT6jhSLWiIxIAfZJE+xzPzLHyCBCRVL1/0s1ZJyqd54qkpczi5Ee4MhE?=
 =?us-ascii?Q?EhR+5d9FZQG6oAWosn95jIuApoA/2+iVxkRbpYQMoQJDUzegBmVqovtmhCbS?=
 =?us-ascii?Q?G9bErnrTylhfFf0su/qLKauImRiYfpG2bv15tp1wxP6EIrokn7NqJBrpF2fV?=
 =?us-ascii?Q?dsytqeOyByJ1NKoQ3EBtGBe2ts4yIFdPjYbAd7U5CCARf9OsQF01liBQECFV?=
 =?us-ascii?Q?lmxnQJL/+8WPn4LrX61pDLzje5ZofXzt0MPyPqqFj6keh/m1o8Rf/X29YzX7?=
 =?us-ascii?Q?pyTTDKVvBwcaN+fjkt4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a297ed27-88a7-4d5b-a32b-08ddeed59743
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:45:29.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpjeEYUBSzxhLqO+CFbT2nbSUFImadVFjjLPJK1baSpu1/pO2lfM5uOGwpCMQBKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 07, 2025 at 11:25:09PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> I'm a present maintainer of Linux FireWire subsystem, and recent years
> have been working to modernize the subsystem.
> 
> On Fri, Sep 05, 2025 at 14:43:24PM -0300, Jason Gunthorpe wrote:
> > There is only one user I found of alloc_pages:
> >
> > drivers/firewire/ohci.c:                ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,
> >
> > And it deliberately uses page->private:
> >
> >		set_page_private(ctx->pages[i], dma_addr);
> >
> > So it is correct to use the struct page API.
> 
> I've already realized it, and it is in my TODO list to use modern
> alternative APIs to replace it (but not yet). If you know some
> candidates for this purpose, it is really helpful to accomplish it.

I think for now it is probably OKish, but in the medium/longer term
this probably wants to have its own memdesc like other cases.

Ie instead of using page->private you'd have a

struct ohci_desc {
	unsigned long __page_flags;
	dma_addr_t dma_addr;
[..]
};

And instead of using page->private you'd use ohci_desc::dma_addr.

This would require changing dma_alloc_pages() to be able to allocate
the frozen memdescs..

Which we are not quite there yet, but maybe come back to this in 2026?

Jason

