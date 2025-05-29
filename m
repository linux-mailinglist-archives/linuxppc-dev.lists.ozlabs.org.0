Return-Path: <linuxppc-dev+bounces-9000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A281AC78D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 08:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7GlZ51Ttz2ygL;
	Thu, 29 May 2025 16:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748500394;
	cv=pass; b=orDtOjDoSWRec96G6TIYSFdd1G9gtoiOXlQDuPPs+RDwNX97L/XE7Fyb6lHDaAlmJrkj89qlWjrCdbvUYYTIeMJeGhqCibcwpHVQBaWV8adJCMtzv8I1DXlfw7Djc4Ga+LyBB/h0+LHEhNd2SGCM2mD/ksWp5slJ7tQ/VDE234FPh6U3bV422inDBjtqGV8bqlfeqTYGkbAGo5nQl/u80SNfuFKw859lCEqMFULzVvt6e4sDN5iVoGI4so8cfckSz6N55k1rlz2m1fNnURgss+4EQdWSpZ7Jj3Fhvh2MnrTLQjBxroAZAKub2lZ7zT6ETyU5iDIKEVr2HIg8WS52WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748500394; c=relaxed/relaxed;
	bh=Pk2dyADuLccAqcn9npWgUd7+fhDgX9kk48k/S7fdrqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dTU2vLAn1xmfpuXzWf4mxPpJdTmYiO7ezDmI9R6yVP/lDgsNxYlq75y+J1RXtMWOr7/BsQ9sefX2ulxKNuEsF0bB3/Tmqss0BRGZdQ+BTldnSUr25DTilGLdi7r1dP/hy6y22gqnNpbhrr0icHNR/mkq1yCCahRCHCyTENLehSLVYhvvm1BAzeSTWcec00WaKSRj8UbKimTp6MTOpUKCFuoqscnA1G99Gkk7GJbiY3MIpwVw6HEBs4XJEb4a4D9xcroqHKa5UrIgtvPxNLPMXmcECDhKWmB7fqtBVqObjj6zV7m8k4oqU7/lnBugcd4C+hmrdrejG2O4UM47jq/ipw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZTJdEC7n; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::62a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZTJdEC7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::62a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7GlZ0Kckz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:33:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQdaJD8f/LgNcu81XZ1TwHqFEGrVnlCPnXMJTRog8PuG96Gopeh5jAscYFvS5RlHEUyAEbqbckPiHkocLIGns3M0yb6TQUq/bF2Cj118KZC+X71tSzpVGHKcOl1dGa/hpv1xj2zBzy38+drOCoL1c7NLE6U1/mvcvvhEqGZZWnDIQZBA8hCBgxLZRC//ai91yNQl5MfxgI0gwMyScZp8aK8PVqvvznPnsPDasz/CuyxZQugGj1wRYvAQiWq8/3Qp3SP4r4h5GTjp0x43PE1CbE+bq74/X+as2LIHYsmXAUx4EDzETqPnOk8jRHouaRgiAEgqDyoCugwT/tNt63ZtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk2dyADuLccAqcn9npWgUd7+fhDgX9kk48k/S7fdrqw=;
 b=AX5XesjOOEB0F5RW6UCftt/gPbtTXIvwWqlpQW93Nul8tDUCuO1zzDst+BUKBXwzRLwduVn4GVVrXuuy5yfNtJ1vvUgUeP4IAID/754ReWqw9ooyg46tiYElPddEcxD72k9V+teK53R+v7uMqdjreJlAqoSHWj3iunSdlrhnuPJfK3vR/Fojf3fRZ7kaLD0txlB5ivDL/D31webxDErt2kNgeIOjlOi/XKPa6di+vgb3adaJuN89jFUyC5lPPEHB6d3OTs+/j++ZsKdQkqstHYWybNQSMTUR+1JJq4JZQmtITlx9OunakgiT8rypRGzSW6mGo6clq7rwdrfs7wH2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk2dyADuLccAqcn9npWgUd7+fhDgX9kk48k/S7fdrqw=;
 b=ZTJdEC7nEHvsJueOWmlud/ER5D6L4mxWKMjWi4I8aQYzqR41VeW4+i0Xej0Xy/vKUak2BhqzWFj/4/JbN/FhSXekNkRt9qV5XeeQrEuwKeVjWpVFpJ6cIYSw3vQo6NCP52yllQCLkxuqWo2kbtLwe9u6vO/C82JJ7VWH1LVW3BO5Jc8Y/a0edaNblWCwcbgU8FkWb5K1MaZzJm/PZD408xoq5VMmXDfIAG4bBksPOJHCVzA2ZfwYGVW6E8s7snsL87snoIVuq0XvURME5kTPzkZXc/QCy1Tr/xMOvRgbscBkhJykPvV6/dfzqDrBAfWNqq/kdJif75VuC++O1wVHiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:33:05 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:33:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com,
	jgg@ziepe.ca,
	willy@infradead.org,
	david@redhat.com,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	zhang.lyra@gmail.com,
	debug@rivosinc.com,
	bjorn@kernel.org,
	balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	John@Groves.net
Subject: [PATCH 09/12] powerpc: Remove checks for devmap pages and PMDs/PUDs
Date: Thu, 29 May 2025 16:32:10 +1000
Message-ID: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::20) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|IA1PR12MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ae74b1-1c38-4395-64b8-08dd9e7aaada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKdaw7zd1PRCEPDUGacm9F9a/PgyaaE7sMnIGTBnrsUX2Ys1FvYw/ScwwaBO?=
 =?us-ascii?Q?0thvYtlU3lhhaD1wVTVVESwUYitx08JiTB9S3e/BHSaPE2KR2ObOyOA0G+ww?=
 =?us-ascii?Q?vK8DhmKlwQ7AOLYRZl4p4T+z2IkzIuPX5yojuPouOekiIx1T6wm32X2dXUHq?=
 =?us-ascii?Q?SbF8k1qta+u80Xz0hZnd5Oj6V/O9L09HvGfR+up1qB0bPvex4aTUPD+lk2s+?=
 =?us-ascii?Q?ild5pPNwPeggk1Gv1ASlHdwyUGDllUjPvate9yBb8mCVKBf1Ldmf5FtH7b+0?=
 =?us-ascii?Q?bFDICxm2EP7CcHeMqThpvmByelBOrk9KTFLZyqSslF9/MFb7MKlDZeRxMGuW?=
 =?us-ascii?Q?CiHuSSm/ncTeDs/OGg9HZ2EAx6ALGTvOMysUG2CrjE89vzHNqUV6HGjqYZ0o?=
 =?us-ascii?Q?PfnsbkimNsZVbGOoZjHaUylz77j/iObvslZ8ZYUVJFvfFZNNIfsYctwo592W?=
 =?us-ascii?Q?G45yHfF9XspXrMI3/gge6iFpHdKEES+tN1QfBzvjJX7cXW2ivvXvd08Jcb1X?=
 =?us-ascii?Q?jtje81iYnA9W2q2ga+eTe1jIe/L2irdaWGJ0FDVPYMyXilrXx8NeMqV0k/NZ?=
 =?us-ascii?Q?yX4Pmfbcjit2ljZKqqXko3BNNXxmd3lUbfpGoryRXtZCCA8qWkdpGe27eGNm?=
 =?us-ascii?Q?JwYDYXVer2WmMl0iRpMLsLq53TcCjszG08x2C9Ub+VTsqw5mOShetEB2xKac?=
 =?us-ascii?Q?3YZpRal3hvRaYdr/OgajIebz+ZOJ4zTCHvduIPvKbryvjSNqoCd45kZw/xCj?=
 =?us-ascii?Q?XiaQo7JTxIvJB5ZsdDM3hxVgSybvM8T7krC3GmuxawJrq9JJx4TAMIZ8eErw?=
 =?us-ascii?Q?K5x7+UiD3BLhO9SY/m5pQBBQ9KD3nwVs+PabEaX+xwFyEzM3DQnRfQILr/e0?=
 =?us-ascii?Q?fcIiWdi//oHm2WGDTu6epS3vB41e1tAcyVwyd7j7RgdNGeSZ/aWsk5Xg3zrq?=
 =?us-ascii?Q?63nbthkzuh0lbfi/Wrm3Gg8192q/QSPuGTBde2DFCrisfdM8OOY5KimQlntd?=
 =?us-ascii?Q?B9FrI3fsIxCVCe/YF/TKnJIOqpogrymQoyDRHJUGQ8/zwZTGh6qNJRtpEUqU?=
 =?us-ascii?Q?nazEfkHDvB+7c8IyWD75fgz/QdqhTBNRc5Ja7ScJG9ptBKfXs+/ps0EJe2/z?=
 =?us-ascii?Q?thqwFVNU1qGkGv8Jlax55YAtUWRBzLHPuJaMZomA59wproIzU1QjXBdmBD91?=
 =?us-ascii?Q?GJ70w3EsEpLhOuV27OBW+S4W/edO95MrfLXVDxvoHsd14fnunraNeAp2yNYh?=
 =?us-ascii?Q?D2fsLtT3P73fhMRfjzKqHKbhrwf7zLzTov1DaXTIG3/dXTxgI9mOPG2n6gqT?=
 =?us-ascii?Q?VZa204rep++6cyuUerIvdNib8etvEm64LsUF5oUcVizvCbpRvt+ofz1FdDOq?=
 =?us-ascii?Q?y2XlvYAUy31+JO+bE81Te4TLKs60smxKzMFa8fc8rCA3OFbgwegoW6zsHOVM?=
 =?us-ascii?Q?YMKZBx33lv0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sKKUidbjrgy+rcQESCDOo1fR5n6We+PdhLimadZ+8H+kv9RRPZZbOv5JcRwk?=
 =?us-ascii?Q?H/CTEh2MR6BQ82JII3L4mmKUwzy2b81PJF8vo27a6TiD8ALjZtBVQic8X49k?=
 =?us-ascii?Q?cUPDYldc3+PfzjPv/b7wDku8iFBozT3rXTlf/97MWI4b7TUArb17hgtIsvLe?=
 =?us-ascii?Q?Nb78g4Z/tGkEKIbKzvP54FGh4UHZ9pZyqrP9xL2CEwEAMFIjj+lh4mhYnS0c?=
 =?us-ascii?Q?HNL9uald6lWusWfeP4iEPodDEd3tK6U13esUfohpLcBgAFZOxy8kAJbKLTSp?=
 =?us-ascii?Q?oaxypAZ2jXK0gpPWB7R/THYgLjW+WuhtYWySJC9iGaAZin2jvWSdwt00sKyC?=
 =?us-ascii?Q?F8tKgnC7SoB7eX3AxOR5on+GipraAnfvdKXAGnjgeAWY7lvU/VSDAJCOuKVP?=
 =?us-ascii?Q?0Y3ARQG6MCLHSAE7hK3AdekNia4CJ6VRreiGKqUCPd8OY+Dn4JPEa3Efg8OS?=
 =?us-ascii?Q?kBQ/1z5dZRRd5ZDCuK2jrNxKgKZI4aeNEwvsDxGUUGBVHl1GjNYmt76iQIaX?=
 =?us-ascii?Q?GoXhKecma5Es/O/j5BcVncRCk3mR9g4oBlX3IFOIY608Ou68LaxvznqinOf5?=
 =?us-ascii?Q?cEpde+e+j7lxLfFruGhgFEIf7WTyeoXYrCM2rjfypMSIA/n80plgVl4dYNwp?=
 =?us-ascii?Q?ZjKsPKVf9MlgK0LH9CjD/OttLASpJ/xUBbaVoYyyJSSANS53/lkudSRcADjM?=
 =?us-ascii?Q?ICBh1L8BGba6azJdvXzL8SntN13ZTmIY8CHm7ier2A4H4vtPuPzCp8aA6se0?=
 =?us-ascii?Q?o/uVTtq+U+K3MrxcLcKzLSJvkk6KHkTqpyfKwWcgaw+mtcdGOqgu220AYnzU?=
 =?us-ascii?Q?0q1E2dmqTiq71YFjVsQYwNLVlqkJ/ezf3SGbQukcwOHEjXARV9uJnWr5Nqbl?=
 =?us-ascii?Q?pWPXuR4VquGcxWpWvNPZKre0t76fPmt9V7tNEbBBDiym/EfqovuUdPnWzyhG?=
 =?us-ascii?Q?YIpO+HA6vLmwk3vZlitKCcFKexeXzElNhiElvX7gQDuLGSjh2YqyP8NWXWSx?=
 =?us-ascii?Q?9HmhrIxWPw7VxLdHLVUDjwvn4LStkYOgVLDz6+NtB8Pjs2s2aREJKE07c9wa?=
 =?us-ascii?Q?WRSUMdGzZIVtHbrKBjXWzzKBF/ugjS358TDGdfdySJxH1aq2t6GSqrG7OOWJ?=
 =?us-ascii?Q?MfOpPhIYtoqIC7Cr3ji4SoWDHGKjYbOh3QFYj18pkhBNKjqQtINYrMU4FWw9?=
 =?us-ascii?Q?2D+//W5W0eJzQEsxxzL0DejVS/7I3Y1LJXnz0j9CzZE6MW/DgTR4BfzycIQ3?=
 =?us-ascii?Q?yqdKCcvIUWSroY0lAP3hucFIBBi1M9cGWv6clmw3qdMHN8cJRo7VTCKy93NK?=
 =?us-ascii?Q?Hy8UMmF4JfkobnfGAOtcXDEmsrYShv3rYe0+efE/YycyeiZhfaOokU/GZrVk?=
 =?us-ascii?Q?1Ys9gjuWhl3Zg8ev1R1SoVRXn5SSselnZBXCehG3n+sDSTblUIrEA9uwTARD?=
 =?us-ascii?Q?Cgy9MA/d0liaqG5RICRRP0OQTWnE6WvKWUL4YxWv34sYvLwXpZBB0hspZBrG?=
 =?us-ascii?Q?GAldmTEjMbmJ63kRa6Aaq7nxHY73PdTsoy8FXiDNfTSRYbgV6C1zLcBAWkFw?=
 =?us-ascii?Q?KxKDDL5xjOy524qqTXKI5C586hg23bx+14EO9FEe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ae74b1-1c38-4395-64b8-08dd9e7aaada
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:33:04.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XekZTBKvXeaCWEc/9kMgCSO8ftUIZ9rYQZvhGEq6GlF8C/hhLNRyJtu+SMYm46QhCBE/+ta5s3TLFATfDh59ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
created, so checking for them is redundant. Instead mappings of pages that
would have previously returned true for pXd_devmap() will return true for
pXd_trans_huge()

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
 arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
 arch/powerpc/mm/pgtable.c                |  2 +-
 6 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
index 15d6f3e..cdfd4fe 100644
--- a/arch/powerpc/mm/book3s64/hash_hugepage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -54,7 +54,7 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
 	/*
 	 * Make sure this is thp or devmap entry
 	 */
-	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
+	if (!(old_pmd & H_PAGE_THP_HUGE))
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pmd, flags);
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 988948d..82d3117 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -195,7 +195,7 @@ unsigned long hash__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!hash__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!hash__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -227,7 +227,6 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index 83c3361..2bcbbf9 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -74,7 +74,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
 
 	/* Make sure this is a hugetlb entry */
-	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
+	if (old_pte & H_PAGE_THP_HUGE)
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pte, flags);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 8f7d41c..4817db3 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -62,7 +62,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(vma->vm_mm, pmdp));
 #endif
 	changed = !pmd_same(*(pmdp), entry);
@@ -82,7 +82,6 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
 	assert_spin_locked(pud_lockptr(vma->vm_mm, pudp));
 #endif
 	changed = !pud_same(*(pudp), entry);
@@ -204,8 +203,8 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 {
 	pmd_t pmd;
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
-		   !pmd_devmap(*pmdp)) || !pmd_present(*pmdp));
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
+		   !pmd_present(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
@@ -223,8 +222,7 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 	pud_t pud;
 
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pud_present(*pudp) && !pud_devmap(*pudp)) ||
-		  !pud_present(*pudp));
+	VM_BUG_ON(!pud_present(*pudp));
 	pud = pudp_huge_get_and_clear(vma->vm_mm, addr, pudp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc..877870d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1426,7 +1426,7 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!radix__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!radix__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -1443,7 +1443,7 @@ unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
+	WARN_ON(!pud_trans_huge(*pudp));
 	assert_spin_locked(pud_lockptr(mm, pudp));
 #endif
 
@@ -1461,7 +1461,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(radix__pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 	/*
 	 * khugepaged calls this for normal pmd
 	 */
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 61df5ae..dfaa9fd 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -509,7 +509,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		return NULL;
 #endif
 
-	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
+	if (pmd_trans_huge(pmd)) {
 		if (is_thp)
 			*is_thp = true;
 		ret_pte = (pte_t *)pmdp;
-- 
git-series 0.9.1

