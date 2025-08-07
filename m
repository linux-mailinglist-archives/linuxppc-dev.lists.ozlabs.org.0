Return-Path: <linuxppc-dev+bounces-10718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0FB1D73A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 14:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byQs61rfzz2yWK;
	Thu,  7 Aug 2025 22:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754568458;
	cv=pass; b=CEMq5aLUqAzpO5q3lpEF86EqxCtkgowvJDqsFYcM+eeCjhTeI3YsN9iWmcXp+49Vl3QfwS6CG8TK4l5Mg9Dy4w4rEuxTiI/vM7YZdc/82qcvhkEkzuOMbCQUOOW3HMd7aZZ7YEG+RAfj6ZN9HhBGQyIAIPVVBr7LdagzCp9LsBh2XFIi4QhGj/XQUikm0UeTI4CjeqhkTmavC4dwudDIWsRwwtmPgu/GQkS0o9LcDoIFd23aHI5IOfYgNZJfVWcLMGsZlxnDQAHF3UT14ZoBfujcjFTzvQ/r6AVD6FFv2rNZplekbDOHqIi9FbRgg8Qet68jIiwi+IsouLlsVeS7Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754568458; c=relaxed/relaxed;
	bh=03milDNUHNfZEReC3MBhS982jj7JRdpYUpzYTMR7X0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cQ3d16yusK4DoZSq7hm1QRfaJ93dOQXQQlP6cfQ2ArXc7uOvGeXMmrpb6XxSKMoitavrZlrQmqoOZCD7IVjf142r1n/YObFyKK+5+Pbtmp1Kf64VOM0Aal+E/PBwBeZl8FjtN7zgTDbhstOiXl6fw/Pnh+Vg/MAgGXiy8xOqNh6SdYbIT1iv0wFKpTU9MNisRp0dln9xG0Zw9VFfCc3eYOAilE6JHvI5TxCM5qcydXz6kZ4Ti1x7yz8siUs6qKuLmCl+2HocwwNWZFRR3TjNv9vrxhUJwmZPEuHZiY+GddS+oTKdt2kyfeTg5WfkhjbpITwQC3QHn7TrTFnQDNqnrA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=emzVsmSr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::61e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=emzVsmSr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::61e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byQs52hSwz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 22:07:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fmbjdm0YYvQX3NHptTNcgJSEIDsX5MasBpOwKCZ1LfEU+ySBuC3nu24SslkObfDngkjZqMo6dLkASJTqVVQW+vBWYvPkeRUosrx21jkNNZ4FxK9GlXCOnaLbV+aduUb/S696Pw5LrS+AVusUw/CIAlDp+ygzgllK1n983Cyh5pMgqJ//TRLSzyg+xG6k2GwsYeJneI9u5I9vQ7RSg6tkz11qjd4cFbgVDMgxTM9vC4Vi3gdBP6zu7TEhEtISqVcqSGMIu/2kzmXVAVbFwcpjzuMbXXCUa8HbFdb2vqe+GvtpsHoSfrzJQm74sBzXuC52ya0ZDszJlrrNwA4P0cHpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03milDNUHNfZEReC3MBhS982jj7JRdpYUpzYTMR7X0w=;
 b=adMiGpMMBcE4ybFOcngMUwoeO4U1sYS6egTAHwmeLxgkqN79ZLAD2dGoWpkG2/W96qpRsWHZsgpJ7iWaHaxTx1Rpt81GYR++16AoEuWFjqWFx3RrczLzO6kTXXnlJl7vMRyg0yzanOSfs4r2V3uCmEYs0Ij3xz4agx2j3odCj2Wcy3NlXMVeUlIs8jtSgC4S8RoZwWRDycl99Jk6sE7kz4DPAQoJgUvph7qB9vaNL7HGqGz/dk7x9n8xcCK2RcuSOLS2PQRpO3zAA4VQejOKb9v4kShnBO4S1Jqi0rEaqKMu97OPmS4acprn6vQLSzQO603vFV/ThwlmARzzOyqs0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03milDNUHNfZEReC3MBhS982jj7JRdpYUpzYTMR7X0w=;
 b=emzVsmSrMdk5PONvW+U/XgioET3O2UKbW20frGRjl4IvJkhtM21ZHuZ2S3BUukHYx9kXF9r4mDKaymNcDCDNLZKbh0BG2t0DN/uffli51tjTrFSHlnExzQtWcTE4y3KYdl2hl5YpuwEaK6f7il4q9MJh29uH4mGdYTsu4NuctxKboLrs1yr5WOo9hE9DK9EuS6KzWC36xAB9ny5Ck7s30iT8Ad1AVexLiB1sp4zYRNnPR8eJNUzLjC4kABnohuy/Spt/RWFvVn4MY92mMpM0aSmxPFC8pw+K7VsgCQiz8wZ/dfG5aW3A8lMtqVYmikTW54RxM2rbIq49zhSSX4AJBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BN7PPFD3499E3E3.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Thu, 7 Aug
 2025 12:07:17 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 12:07:16 +0000
Date: Thu, 7 Aug 2025 09:07:15 -0300
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
Subject: Re: [PATCH v1 06/16] iommu/dma: extend iommu_dma_*map_phys API to
 handle MMIO memory
Message-ID: <20250807120715.GF184255@nvidia.com>
References: <cover.1754292567.git.leon@kernel.org>
 <09c04e0428f422c1b13d2b054af16e719de318a3.1754292567.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09c04e0428f422c1b13d2b054af16e719de318a3.1754292567.git.leon@kernel.org>
X-ClientProxiedBy: YT3PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::18) To CH3PR12MB8659.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b6be84-2a34-40ae-527f-08ddd5aaf3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pBh/2s3cwq6fILG20A5H9xSuWRz7opHKY6yWWOEfF8/OX/NC0xcMFsjf2hTC?=
 =?us-ascii?Q?LWrLGR1cH2WZ/2utXoQcD6+cesHNDfMQtmMienGdzWMjm+gha4LMb/BFIYMv?=
 =?us-ascii?Q?8CYSObGkQxnBv/Vx681Ib0nmXdebOCg40k+F0KRpNtbmdoCR+p+DVRFWPOYg?=
 =?us-ascii?Q?yLEcQtzrqghg0n4Rvxt5CRMYvmUrFhKc1uJDmKnSw03dP7ljTjC6C3rlWNpR?=
 =?us-ascii?Q?QKbiapBjd+WSOGHQnYE6djvNbu+kR4pHZWt8akQbuCysL8WC7jz4DhZWrw9I?=
 =?us-ascii?Q?mZGCt4lflCXxe6Gp3UV2syIl8/aGJTzeR+GltwF1p4t0ZICqkeMgY4meIYDo?=
 =?us-ascii?Q?xy/a43toECNxVTGuzREmsPrINijJfseloUmZ0d72XGngTXU7NwYFfREPxM8t?=
 =?us-ascii?Q?GiHRH9HFHg5W5glk4uEKnhQ3gWmpBBHSkSwVGF6S1JmgsARU3s6799Rt8ccK?=
 =?us-ascii?Q?uV0tKc/aV7jLqgbORnSWpHp1UCGpA0I8j66vilp8iLGNnc2W0qUuGA75RYD+?=
 =?us-ascii?Q?nyOfXErs0VKtmHdaZumP83j7sIDzbSwOu5RwqZLAs74YOneFu0/69/N6hB6V?=
 =?us-ascii?Q?S/onsuI8vjN0h4XQKsBC7IOeXSTLl2ZkU2GpMjqYXavVivQnZU+IRZTAf9Cx?=
 =?us-ascii?Q?RcWwTnw3luuuf43Uz5UVSnI8ykvekDhEV+3hBCTh+Dy3XgNVcBfgXRWbl0Co?=
 =?us-ascii?Q?x3+lJ8rYWiaKlPT1T4Xm8U7uw6byzf93NgtfIF4ZO+ci9JKvqFjIK/gIiQIu?=
 =?us-ascii?Q?Yq+q71ZrJEGqS++mWfEPYG9Gus5PzMVN8XRMZYxglM/9IlKGC364qMr+ZNVl?=
 =?us-ascii?Q?Y8A1PSjAsuRoJ5hOjxKdxPfZR1Kb9AebERqAADl8ns/W+dLprW75DpgMVyKl?=
 =?us-ascii?Q?nlBDnJZct8nnEeLbsrg7OpWVatIYGU/h0vc7A9H/AXc/3MPxkD9CiUd0KG0q?=
 =?us-ascii?Q?kfV2Hb2w+QK+w4o58Xnw4S3GcPgx7idMn+8gS/5PtBHKTPSFyLcMl7ZL7etf?=
 =?us-ascii?Q?Z0xOD7dlB+YUAjKeXuuQOexO3+fKjyweNRw2rLqpnc3Qt63riL2PqY/C2jgH?=
 =?us-ascii?Q?uHc0TxsSFRBklM0fmTM6K44n1ElQqDHRCB9wNGqBd6AcmuWtM+SkF+VJ/5ys?=
 =?us-ascii?Q?xe9qLbD968i3CbuubbQH2+X8NQi9Trd9U3DQKrhh6CKPk9jLt4P5LMXN/JpX?=
 =?us-ascii?Q?W5gAYRLv0gq2fZ1RLZX5LknmcxEdD4pBBDuz+53dusXfGIYGYRt8NizWrzFt?=
 =?us-ascii?Q?Kz3Km81YwBEEDA7Wm2noV1T4/byot2igcPnGyjaoY6JOsnmot5mRnoCOagXk?=
 =?us-ascii?Q?YNHU/tOS44r94V8+iFwwEUbadzp7Y954hgJrC9iLzaFKrHWEbIzTyoNGDAbP?=
 =?us-ascii?Q?+WRg5/52Sb2zFgXiBKFsOIqJpPU2Estp7POw8OVLqnyQCJJR4S5SKrmTCQDf?=
 =?us-ascii?Q?sKrb35QARtc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWL3nMVtTPvIQWWfT+NUjYkqDLD9cQkfZORT3ejXzsCYW8FuJtNBAW0kUsCG?=
 =?us-ascii?Q?PaoqFp/oRnLsqfFbbllAqt1q59DnY3gcKD74KPHtkx+0BRuo8hzhe9b7co83?=
 =?us-ascii?Q?xSwMTeYj0smV0MF6qobtDBmB0bYWQ5C8Vb29I/PPDp1KpknCIEDGKogcA0K9?=
 =?us-ascii?Q?TUvaHOwZPIbWoB1R1ulF4ffWCuq1HnNZ7ABIiOltJAnVAnHOjUg/0B4LM920?=
 =?us-ascii?Q?Xfz3YYntlEg5bj6zrcv58U9t3CDP6/vpzJsz5e7YK4PAmcd0sKb/4MzLgnTT?=
 =?us-ascii?Q?U7N+FJZfeZ4rfEv2+9W23/nAVWQkKzhhlq/mNIFnNdTY9xZGobO0rsQba7Dw?=
 =?us-ascii?Q?kclREk63x995M+8dmpoRXskvRu6nMYpwcXyA0JO+zIKI2PkrAuIH7EOBovVp?=
 =?us-ascii?Q?iuWOu3D7GKalaVyVWIzKhNBjtOy5oVwQSnYjM+tAHxmqDNptGQKP+KwWkXw/?=
 =?us-ascii?Q?yLOWcRcAbTY8bHorIif8DIaY945+B+NGBezzUk0lrQQM4uAHfbPfbFghhurh?=
 =?us-ascii?Q?zWqusBVnX8M3cfljGV1lulyYTQ5P4Rc2G0W8hoFBZkOKthdQ30uYUSJF2DQX?=
 =?us-ascii?Q?vyVvM02Ve1INp3saX39l42GF7RQ6EPkr6BjRQ/fTEP7USLSrNFNCgXZC2rMc?=
 =?us-ascii?Q?QH5BCK0yTWvsn1VZYVsXRRZluqyfWmk/y1yRj7evE2TUoF0o4+fgLS56v2S+?=
 =?us-ascii?Q?4YfTq6Y8ltCnouUQdqROt+2OQwYiFwAjJnNgujtrta52QlUugpE1KdaAce70?=
 =?us-ascii?Q?N2gz7EHb83C0mKza1DaCheopM938xsveOrWnp3wt6ylz4Dfk54ddhrwMbxgN?=
 =?us-ascii?Q?dwEVR8Nr+ZTiRAtizoIuwFNydrBAl0C02g0rbxTLWGjDH4+PyYvRrG5YrC9n?=
 =?us-ascii?Q?TnGZOSYeK34mS3P42CHl1Vr7Vx1EcTbgbfvGjexr2yjyTt8HnKUtrKs0dTzs?=
 =?us-ascii?Q?xjKUXXLqWNcr4N3DakeIZpZKbICSqwEc57oYf8sHYq9IaozV0jpivIdqUaR2?=
 =?us-ascii?Q?J+c1nXZaAzT12271Ol6xD2mWseZDRfxUHzliThwNljWwT61AfRnPdh69L0gx?=
 =?us-ascii?Q?zidzNzumLor4V1TBz+z+yiozv6IH8DM+90aTSq8dhJprwlS3Hmy0f8LzT40s?=
 =?us-ascii?Q?48srtSKtYiLas6OMRCPKR+1cS+DzQGcDfAIm50ThUB+bc5BynjNhh9bwYV6n?=
 =?us-ascii?Q?WVyYPEeyuJh9lNYFZvm89LmgemIiAOqmdbY6noRXUi4VMUHNaIKZtGIJI7cA?=
 =?us-ascii?Q?L+1Rd6+PatXgbpDef4yO+N4VGLxe0M+++SCsg53cjVkiWdGns101Pg+PZBxd?=
 =?us-ascii?Q?PpMP2liM+8G8Q+GorMujpXYSam7XCBdFNkREGnbZKTULtBSTlKMuA2JD4KhE?=
 =?us-ascii?Q?WsQh4NhxH5KoaWh/XgYTEAMcTT0pq2vidf2rIr9/KZL6aLAOXO8wuQRAMT0r?=
 =?us-ascii?Q?zQJ5Dg4HliQ2v9/TMc5XDNQA8ztGvVZdpydNDJRa9pO9QV+VXlrxGR2PwHzN?=
 =?us-ascii?Q?SB4KwMkIj7NaEmDyO7yAgUgB7EohTKp5uSDy9Vbln/d/Myo9fqoMxOGCiSEb?=
 =?us-ascii?Q?gJAg8/IjOtjrrAA1Stc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b6be84-2a34-40ae-527f-08ddd5aaf3b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 12:07:16.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEqLsam7ft2+HePdRB3GV9fZ3kWW/9+5neZee6v4Y+c0QZMNhmIivmjas2oxsFdA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 03:42:40PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Combine iommu_dma_*map_phys with iommu_dma_*map_resource interfaces in
> order to allow single phys_addr_t flow.

Some later patch deletes iommu_dma_map_resource() ? Mention that plan here?

> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1193,12 +1193,17 @@ static inline size_t iova_unaligned(struct iova_domain *iovad, phys_addr_t phys,
>  dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
> -	bool coherent = dev_is_dma_coherent(dev);
> -	int prot = dma_info_to_prot(dir, coherent, attrs);
>  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
>  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
>  	struct iova_domain *iovad = &cookie->iovad;
>  	dma_addr_t iova, dma_mask = dma_get_mask(dev);
> +	bool coherent;
> +	int prot;
> +
> +	if (attrs & DMA_ATTR_MMIO)
> +		return __iommu_dma_map(dev, phys, size,
> +				dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
> +				dma_get_mask(dev));

I realize that iommu_dma_map_resource() doesn't today, but shouldn't
this be checking for swiotlb:

	if (dev_use_swiotlb(dev, size, dir) &&
	    iova_unaligned(iovad, phys, size)) {

Except we have to fail for ATTR_MMIO?

Now that we have ATTR_MMIO, should dma_info_to_prot() just handle it
directly instead of open coding the | IOMMU_MMIO and messing with the
coherent attribute?

Jason

