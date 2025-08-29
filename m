Return-Path: <linuxppc-dev+bounces-11487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85285B3BC38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 15:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCzLw0Db2z2yrX;
	Fri, 29 Aug 2025 23:16:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756473415;
	cv=pass; b=kxF8SAAXdzL/Z2Z24OYY8AjLiubcUTYodf7t/mrGg+etzAxlwCcOEIeyZRxxX0ti+waWJgMexz4b77y752DekRRpTZvMqw8bB2B8eloX525ZGq/Yq2CeUuV6oYJpg2+sEtZzaDdZcxdbx1dQsaQUfxvfeGT3ZzzZqWb3OSiKJSk9/w2ukDphggoYq8zZ4VNCidwDCiFVgF6LbqH9kmsdIcrJyTmW/imimRyXPnJcImL07rTpnaGPfdaN5wyTInsRzVncqQoav9ZdES2o9kFVklDdlkwIGiA+cch+Wzh84e6A/tDgXfdM8LSfx9qQDfm1e9Ec7LIoIl5flr8zoZgALw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756473415; c=relaxed/relaxed;
	bh=JCWmjjTdSUkiBsGmYNgY8r0NYQl0/mN0Xq0HSP0LaZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QnX3aX8Xcp3YpHmiSa8twkzv86QgRwrhdxYcNUmzLWjDRR1o/A6NIuLXFkJewfA+P28vifiFV70jZoDGNQRfv7yumsmDo+gFY1J0P8Fd8pYyy9VHn8YAQLnt7OYpa7fYkh+EuzrScVST3DyU3ghtM5NtZ/1/iuCGr2nnir8AEE+KGBGV1EDTphNqAWXqtpRxwKKH5amQNASKox8Jj26SByBcukEelOg3Uc8bePvruZxJIhUHPJUmoIS+h5uym6OsNe1uVWEDCPoSDLLGGNSlcAyiG99FH70pAh5CPkYBhMD9YLb2EyPv8Xw5MXoDVuyoWW3Q4zOKWajLeS23qUv0oQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i/HmXQce; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::60e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i/HmXQce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::60e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCzLt6W7vz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 23:16:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeGvuQr0Ysrbr+MzudNf9fRl/IF+8Ww+1/UsvbO8U0UKUp22FhCMWxvNNvuD0itHcRjAd5WaDrI6uJ0lhcI/IKDEhQ9UZ+5j+9JCW0p8SiEcAfrTHxyhV7TZMRNE28DDni+X1lrq2M3793EKWmmPYeO2lT4ChgR1JKrY38rkEJTUTEP52J4aXz8YjbxWEzrM/J5pclucoymBFvGrdVULMTtrRn6FAlWWESvzqtCnnJZcrK2lz9aNUcr56lELdvKfQ3+/ZLQyGEvjFe5wTv0yKhfLL8BhXPWZx8oxnXhoD4CZf4Sr1iB9zIVW+7uo8rYYFFbjQerhUA7+6zHRPQEtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCWmjjTdSUkiBsGmYNgY8r0NYQl0/mN0Xq0HSP0LaZs=;
 b=bwSi4uTVQzAGZpm8nR7mfw7Zo6RixsU4Xquq8NVPlKw/JuQoDODaLvefivB6GOkfsFDsqJX4GiC2OjJ028Ly5ZvNE4A/izUA4jt0mv8Sm3Q2UHFTJ3GTYyyl/l0wPf9KWI8dzHgRTFlIT5S2Y0ln746dwq4QIxsi207Xud+jpY0w4x86T3gaJuxHT0M6fbVHV4QGnwhUt8FDIgW1uxErMR50Ld/Eiq2js6bddfM+qChjIiZxzRJeeHAizdj7vZOdyrVNGlRWrdYCboim7b7Hsj2FEd/KSbkEl9rTrM9r7jpQiazthKgG0WJZkUiGuxzUwZqggkwgkCrGFAZ2RAbqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCWmjjTdSUkiBsGmYNgY8r0NYQl0/mN0Xq0HSP0LaZs=;
 b=i/HmXQceGXNCOvexidulAQ0kC8o7yfjfECBkeBHjvQF5BeuA8hgQXtsFcVrdaCC62J2FCd2V8fMZzz3PTumh37UvAbH3iIXL/73mp/tVN0gMhBMEM32iqFmiMN+kmW1vNMtre46kzEl2SvhpR28QFiQVDuMjdNtsZ/H7oeGCDNuV8LPAGPFOp28hfysRfy+4ZP4s5U98ECO0TuRvzCND340G8bK6uc9Wq637XZw2zl64qgt7qX+2TEhHEaL25U2net4s+y+Czd91G4Sv6x8Fz+pb+PqDPCLvPND1geKt/784az7VLfLwLg95zeBhRYooO+E8BgIxhvNRtEPSNImP7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Fri, 29 Aug
 2025 13:16:28 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%7]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 13:16:28 +0000
Date: Fri, 29 Aug 2025 10:16:25 -0300
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
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250829131625.GK9469@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755624249.git.leon@kernel.org>
X-ClientProxiedBy: SA1P222CA0056.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::8) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
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
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: ba19d7ec-1bfe-485d-d6d3-08dde6fe431b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j9VFqPDzvWCSugcsFZk8FRKZSbP5XUc8PO8hHBRkFrxG3PV5kB5sPfbUJe92?=
 =?us-ascii?Q?qM0CxUgtXXI7t6zdv+qXHeS/lN53bNx212jQJ9v3L+Hc23xLOb6UUptvjU7z?=
 =?us-ascii?Q?0nsgu+opQ/YYez+5mzeYkADogU4B0i8D47uiMeLy3LzYnrQIHKgNCHcZO1yS?=
 =?us-ascii?Q?LG+8lbyIJozKkFtjoIotPpC8K7NYZDG3KtJT/WWPuHQAmo46MyGR4IofXut3?=
 =?us-ascii?Q?je1OWIV0WSsYK4ukVbnQg9ZYQKr1OHm1DjwIwiNTrnp0NQuUIZCsF156iBEm?=
 =?us-ascii?Q?B8zNikV+SA+/4Qfwqp1NmUkOyiagQH1plfZRm+LUo92lJgB0Qmsd6LcX62LM?=
 =?us-ascii?Q?gFbiQevxrEKfmYj1RUUU/xOL69n3rNSrLKiIMqnNrjV5yPGaNa0tzyi1F94a?=
 =?us-ascii?Q?GhaoOM2I7fQIqxQndqWWMESGG9xiRwa+Mv7ozbT7r5zo4wd2ti8QljFc6LFK?=
 =?us-ascii?Q?+wn3vHsEe708TW+TVt8bXIzew8QVhx/fZXNI9i92CwccGJWNDdsx0NC+PZlU?=
 =?us-ascii?Q?C7506ogxRZvWMiEuEXkVNtzx1EYNVX96/n0U5mktuMVXhwoipSXKnH1qojab?=
 =?us-ascii?Q?9J+silk9IMFoa7A2k/W4/Iu6i3P/NWeoYoz+XNtLBXHhL1S0XYt6tO/4UOme?=
 =?us-ascii?Q?vomWDP8TRhDyKciwsbOZP62Raiqxx50YaH4V0R8YQlVytdSGZ6IWiLNLDq5C?=
 =?us-ascii?Q?ptw+3qyhWSPC8kqhCRYqnIpFWRA4W9rsv93pjkTAGdMdDINsZgliTFijLYPv?=
 =?us-ascii?Q?8cO+ic2nAYNeAqOUPe4ghcpxyfBDkc00HL0cBBk8DGw7IeHTTfUaoBi2/2KR?=
 =?us-ascii?Q?La1M+ngOqXBhts99xfBpbxRqrscFL+7GndFI1b4IhwodO4ZeJCWWJpgzLchS?=
 =?us-ascii?Q?t2gNzDyQyP/cUQKoiEA8/KXW613z9c0e2fdluhgpvOFziWzkd+DF9VHwC036?=
 =?us-ascii?Q?6QsIpabpQEIBVuiY92nH4XHlDFfHHtnflDSIhb+QGgYzGrFrfjm+eD4qIlGe?=
 =?us-ascii?Q?m81qxYrhAb8gguLUv/gIorbJbOcg5qFMCQ+XYOqnf6h8JIy2Yt6IiULdW4FJ?=
 =?us-ascii?Q?fUIra0gq8JbHZh8RLxzKzBKYbsAopMLfMzMIrtW9vzvoaGSaeEEHPlnZGemP?=
 =?us-ascii?Q?BY7rtxngUTeL+OLq6/F1QQ1vhjSpdEGRDcuzi5cvww3rf31DNcAIW/bBi/RS?=
 =?us-ascii?Q?oa0KPVhb5LjKn7l+XAT6kwi1xZXdX+e1YiaCFNymCyhy7vWtGJLN6SmQvgjh?=
 =?us-ascii?Q?AnFWFiC7U0Td8YqtXX8z0/U4aw5aqUJKg4CW4H4Vsxj9dKoA86MQ0BYy6gcN?=
 =?us-ascii?Q?/zaqzKi5XiCdWrHgiug0Ss0YQ/LjuLyIZRVRTNPlsL4woMRNUGzxojLdJzi5?=
 =?us-ascii?Q?j8gdLTa8o2fZ6t83iMuZyGW3j57C6es60RHXRnyS9nDqS+Gufqi6TATubaAG?=
 =?us-ascii?Q?9Pk99+LH3rc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cuNT2mQMuDj2wUn+wdVR7TLhMYcPNGAj4gfzF3MkyBXvsYN4Os9nDsr7fyUq?=
 =?us-ascii?Q?TNCkRoX2fkf9TYXv9J7BfwijmnDHHTl1Kz2atZMVIwcHAn8aLGPqkWO9wemx?=
 =?us-ascii?Q?SYZfwEdgLcATAcQ0icpUHgkbH4sZMV5uMeTM0CRhEQP233jRtGtJSHD7Zb9A?=
 =?us-ascii?Q?/VNBySpyIhOMS/xAOa1dTvjc+eUBcZB8RwergxIQvssbWzG2lHG/6d0CrCaq?=
 =?us-ascii?Q?MZKO5RI150CwyCxyErlTUkGoH/JnmmYl9WRo9G8THd/bmxMIb0bVu8zdLq03?=
 =?us-ascii?Q?wn8duUi1UEoj+7adHkevd1hUYB/ZvKiqn92487xMuWDwtNFpc2CBxJpXd2Aj?=
 =?us-ascii?Q?4rAswgCTwaXhQUAdOd9oTyhnGk06OZ0qvTgchDp4KIh+blKM+RAhPZjH6P5H?=
 =?us-ascii?Q?aDlub8g7BHRjMB149QSPoVkoe4fl4+wGQ/peeR9v38rGkzcEAwr2uXCu8W39?=
 =?us-ascii?Q?aX4aURUAX2aPA180UfGsIRQJcDKsSxcy+ajZyn9XjmhIXuxI16pgufiKY2Zh?=
 =?us-ascii?Q?mtcPn6jVRM57FP6gFiuDnJ/PoZOLFL4gKQt50Jf+f/l0Gl9xVE9AgybQFF4h?=
 =?us-ascii?Q?Akt1sAOYFCmAUTqEI1xP+NQi9gyGPCWVWwVnaV7Y2gGxeXeWXiRV3GMlULIJ?=
 =?us-ascii?Q?FrpUNv+kUHkhmffgL2u4Ue2KMsAPO+X/H4eudxnX9lPp8/seaWeahuQ9JCMJ?=
 =?us-ascii?Q?f/XtU9ukdygN3ilosvYT6tpKcXPXFvPhSHFOl7gF/6nPfonJ5nmlOiDOgPrs?=
 =?us-ascii?Q?vmImJmXNnbWT1Nx2fmYr3Dhjth5OuYIWYFuTM2Kze2orglg6dg5O+I6hnnes?=
 =?us-ascii?Q?g5KoeoSeeV0PE46pehALs51tBDJgJR0E0jpMA0he0D5j5pmcdaDGgp3fPkin?=
 =?us-ascii?Q?uy0SykIa/i0gywHJcL1xn3iLiqJmrEaa9tcpB7jcbSNk9DWGy4WYa8koUQYL?=
 =?us-ascii?Q?SmDLUo7iRD5beZ+cQOSH2mQRT7aJvVmeWu7VXTSv45GXK9FobtcaAdimZL48?=
 =?us-ascii?Q?V//a6c7S+RDMz6mpw1NxvbNEX9/njiS8LPPsYMbYscSJi5gMah3JBejGu9Dh?=
 =?us-ascii?Q?wQeewTP1m96pF0NnJiBla7AKohhddhvfDWNqaIYLULY+XPyeGvzh8VgihpjZ?=
 =?us-ascii?Q?EDZ86DzqqLyY62FRfcFY49QSyWFhegdUmnrBPy/bg4q/FoHlTR8CQ7X0Vp/k?=
 =?us-ascii?Q?ggoYP7qoiHmLhZ8jjwFbhBaV7dfmr/skBTWtgMqPftUpOnhDLVc6Q4MbFXTS?=
 =?us-ascii?Q?5Jogn+C/+tvOQMSH49xsUj2WGiN8L92Vu/A6hPS5k5+yl9aGnLKw6hibXFAQ?=
 =?us-ascii?Q?EBMGXSb1mK7hmNJK27drHaKAY8FuJzDnWw1ipP/5hClrEhX8rFOSuUVbNbBt?=
 =?us-ascii?Q?Xs46jGnh7go+N5aYvzW+dLHRB5MCj4nsZJQo2ryH816xUvVO8lyGJ8j1piZc?=
 =?us-ascii?Q?hFnbKBQ1yoNC6l02T1eNYhEVDxYjQCfPjlFwYmES49rbsJig0wT6HO3HXcJl?=
 =?us-ascii?Q?3DGaXwPlor5er17Fo4mnTPkqb8/VYmV4ZcgbF7eU8lofOaEJZpSS/MTZ4Tgj?=
 =?us-ascii?Q?id1HcAcrt2U0YrhZ3++Oi9FndBPquNK8mchPcaOR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba19d7ec-1bfe-485d-d6d3-08dde6fe431b
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:16:28.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bixKXGNnNyPvA3cISmgXhm5zsYWSDMm/Kyz+5gZZkusXRtgA2Nwiwx0P8zrTZxwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:44PM +0300, Leon Romanovsky wrote:

> This series does the core code and modern flows. A followup series
> will give the same treatment to the legacy dma_ops implementation.

I took a quick check over this to see that it is sane.  I think using
phys is an improvement for most of the dma_ops implemenations.

  arch/sparc/kernel/pci_sun4v.c
  arch/sparc/kernel/iommu.c
    Uses __pa to get phys from the page, never touches page

  arch/alpha/kernel/pci_iommu.c
  arch/sparc/mm/io-unit.c
  drivers/parisc/ccio-dma.c
  drivers/parisc/sba_iommu.c
    Does page_addres() and later does __pa on it. Doesn't touch struct page

  arch/x86/kernel/amd_gart_64.c
  drivers/xen/swiotlb-xen.c
  arch/mips/jazz/jazzdma.c
    Immediately does page_to_phys(), never touches struct page

  drivers/vdpa/vdpa_user/vduse_dev.c
    Does page_to_phys() to call iommu_map()

  drivers/xen/grant-dma-ops.c
    Does page_to_pfn() and nothing else

  arch/powerpc/platforms/ps3/system-bus.c
   This is a maze but I think it wants only phys and the virt is only
   used for debug prints.

The above all never touch a KVA and just want a phys_addr_t.

The below are touching the KVA somehow:

  arch/sparc/mm/iommu.c
  arch/arm/mm/dma-mapping.c
    Uses page_address to cache flush, would be happy with phys_to_virt()
    and a PhysHighMem()

  arch/powerpc/kernel/dma-iommu.c
  arch/powerpc/platforms/pseries/vio.c
   Uses iommu_map_page() which wants phys_to_virt(), doesn't touch
   struct page

  arch/powerpc/platforms/pseries/ibmebus.c
    Returns phys_to_virt() as dma_addr_t.

The two PPC ones are weird, I didn't figure out how that was working..

It would be easy to make map_phys patches for about half of these, in
the first grouping. Doing so would also grant those arches
map_resource capability.

Overall I didn't think there was any reduction in maintainability in
these places. Most are improvements eliminating code, and some are
just switching to phys_to_virt() from page_address(), which we could
further guard with DMA_ATTR_MMIO and a check for highmem.

Jason

