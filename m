Return-Path: <linuxppc-dev+bounces-4948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98668A08763
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:03:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrg20cQQz30h5;
	Fri, 10 Jan 2025 17:03:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::630" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488990;
	cv=pass; b=HfaEyB1LgF+jDXxVcAOoCG7NxsIykcRexafSoVGv1Sj6bu324sGPOzAYbDExhs1uMpQJwi/Q0tgzjbVO9sI5PqHM5Licb4VoOukhu83x3o2zszRuw6AhnJ08QD68AZF4QqMzgajGVC7Q4deHbeZmoTtX9+FLeLY7ts7itGCyWXoz3Z2KOv2+K2d16g1clKgY9g1limI024JNU+s816/6zh/4Yu/D5bO6oniiI3ORBVtND9NCBCr/yxNp9IHbX2oVJEEKa02Oumy18+V0drI91h4n1qfsjv9EOYUK6QuTt/exNoqrXxlFRm0u9FfV0yhG3l19bU6HO2bbFe8szz3o7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488990; c=relaxed/relaxed;
	bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AmT0DSUBq7eOMQY1e+gdPrEECPOnlT9vhxHVAxFKlu63h6oPONriir3NowO2vhO4iPg1gN/gTNG6ILjiPx4HXKFxf1K7xVmLBURFGf79Np31NdVn7WElCYdxipjLKxidVCuGd39abimcXEykILJeC6P1Xx88fK3Vzip2mvksUutB0UFI2GAcF2L8aWn45PKPDtJTVftkxXJl78opv407kejo55OgzYM+WsLcTAqRYTmzsbE2bcVKp2ItC7BaMugCwlQkN0kb0LJuEP31EB10DFLEcRuC/QLPAx/HWbJrvCschZIsii802mGjDahR41LR4a2Dp3jsGgPRyrBmoMEU3Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L1vXwFWj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::630; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L1vXwFWj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::630; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrg11KKLz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:03:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmxH2JMN1fECXK/UQWkGpBm4Zp2t2g8QV2Nlz7U9MrdKdCSj4Iq39rzTvL5/r1DQ3xj9qSErx2ppYpuNnGu3r8oAIJa6sk6MsFLrPMPooYRuG93aF/T5J86MaG+EfDJ9DOJBG3kuIunjdHnNA6GA9w9RimCuH00bcCnLhc5cOO2p3QszZocmXqEhEiWhDzak/B4QtKyEwVwmkxngNd2zgW8zNXdNBoAMrNKUDR9QxnsFVw6wXfttBzllDvALz34VLOiBnx25oQUbXuPoJFe8JV1jnolT4I2pZlB35KNHOWYw2ACjjYxe/3w78AwfnP+gotkuUPYr0MBfnVjZSPb/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=kBZFUnvb/BkS87rRzHyjfdx+AU3o9Lw3bX+3I7So4qNH5+odnTPKFwB+JNgxjMCEkJGy0vSwNgttN4hl/Pz71HZqcI5o4WxAaPsHTC+KbUuHad65JBsLx8+T/H5vYfWQeu3hTnWIokiMeR/E1/CIDFnJW5CH/GFOt4hgPfYEtfe/0Q7PDMrqORxB2hc+M1FWFGFDQOeVUGgbe50Q5y1SPhUX7PYEjm5Zkse6JZ0z6+yuELBVg1sLMDAd5NYUZZ6amhkOy33/ncvgxf3SNTmSoClSGPftf1EFEo2eTU7a5ofsTpp2MQiwFQzgV9GirejFa+CguEE+mqXAKaXNcCnsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=L1vXwFWjm7WZTNzLNJN0Wwh6i7Mo7n1obzO//hXblwqbYdAPPddwaUrq3JPaSeG2d/ouK602G3NtEv3C6PN94SCNOkZK9z8vNkE1e6CNUb7ZWtSW+CDoxaJFb0jGO3qh/i6yenZlvxE/NuTonFgO+NrKmW5yfeHMPwvV0ZSHXf+H1RMvbdQGDdINKCr9YfuYZAfCVHcb4qrfeDvBmudSoXyqVR0kgbNTTfrhITDQ1ORKcnKI6/7AFJ9RSzRu75ayOBctbbTuzmC2tosbK397+WhVcq1SoodP6OydvtNbFizYfOk8gLZxI29g1p5hCfKfXvgowfD4mpm8VBqC89WnVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:49 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v6 17/26] memremap: Add is_devdax_page() and is_fsdax_page() helpers
Date: Fri, 10 Jan 2025 17:00:45 +1100
Message-ID: <99041691148ed3ef92546aee0dc0cd78ff143ab1.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0070.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: c158d73d-f968-4f23-1952-08dd313c6967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWz0Bk/2hGDOzGkglyAPRKjSCgEDEDk4wvbXrXT0CqKEC5ljjrnI/INSIDDX?=
 =?us-ascii?Q?4QHddbUP0gYZ2t5wz/c6j5jt+8oq5/Fm5f4gvOuTGJrPYlg0zD7s4QqUXpj/?=
 =?us-ascii?Q?E7prOpwJlzYm8OAZe0CjbneItz9bCzZ/zSmdGNCclAp3wkgt2PZIDqw3EDGi?=
 =?us-ascii?Q?LdmYl8K0h1POgN5+mrUvFSQ/5rzBHWpkOSfp3XdgRYz9PagEgQb0ZRKLFWEf?=
 =?us-ascii?Q?XxDGiWaOZg08Ql/vCkbO95vL7ZfL1vU8IJN5glFPr7CwnkJ2jbv/ln4ocKQk?=
 =?us-ascii?Q?+ppRfyvkxX2SASN2F5Kku+EvvtflioNwNNF5l5W5H2Expdt2b/2MyIX5zlk5?=
 =?us-ascii?Q?NiFDg1HY75TmlcN5uQ5uNGaMPB2UhzZZ7+UXPPgw0Y/7XC/GV5U8vgaanLWh?=
 =?us-ascii?Q?w569hrSXWwr1YLVk4foY92zz9Q2WOLDzzkkZOHCj7RyqG2LXjc0YKvD5X4oD?=
 =?us-ascii?Q?tdA6IA4/iQJ3qAP4g+zLmmmJvzmBHFRuzRnC5yghI39tNFgBoVrINztiEGj+?=
 =?us-ascii?Q?U1sye/kN3VsC2m5Mp2+wWU/vEPl0YinbGqNzuGhXt7UvZUbTM0U/4Bw73Kwt?=
 =?us-ascii?Q?HCLi46cZYXghjqqzthCDhGpH3VPoYfVJyURHYlk3qn2HUVM0GgPx7i6xzQkG?=
 =?us-ascii?Q?9COugG61ad0iKH/UEw8DOyfY1AhCPeon8mZWnEcLbF5aBU66U/2yPZXG+zd3?=
 =?us-ascii?Q?spNgEAuYwWSnlVS68aRV3ztM9P0BtmsICZRXLq3OBDeI2OaA4gJjMOkrCzuA?=
 =?us-ascii?Q?mPeVLapBez30o26Zhg8AZMD2dTfOh1/ZvDpFwNreMl7nFDUTKkoRZyCbsnPr?=
 =?us-ascii?Q?DLRLlxwEomYZWBH4P31Gmsh0FnBOVsUgmtt4zo5cHVF2+0hPQjoNDDTC39ci?=
 =?us-ascii?Q?R60TRy6WD+JRvFVYd/Ym1ayn87FyKDyrBvd/vm0Oto8vQrQVC486Jcli7BrA?=
 =?us-ascii?Q?l0C7Kuv3PRMC6VSmByRJVpmCrXE9G2LDFMWFTEChOTYvYsR3K2IGlADSXXwp?=
 =?us-ascii?Q?eSD+D+RRZq12/lAXgqg+nFI+EWiiDe393nXRxv138GtE1degNH88o0LIf1Ez?=
 =?us-ascii?Q?lBSsVt56Iyca0ksmhiP9M4yCJCzlxjxhomZqmlyeIuDZV/k3f8h6T6Wh1uRR?=
 =?us-ascii?Q?G4Oq1vdXeOjZFO/ml1dLQ0M4z+DReK6B++LvFO7l3nkD9wyy6IZgmpuFWQcl?=
 =?us-ascii?Q?BoQzoJn4vyMsvM6TAv43Ub9KJg5bHBTaDCTSgi+qtYZYbW/O0+W/sPLsS4nR?=
 =?us-ascii?Q?Gy2QvIv+rV8zL1JZlpuS+BVLlNA0Hzi+9NqrMkxOx7f/AoDqdkrpckOfKLtl?=
 =?us-ascii?Q?2BAyB8h/UAtVZ4ZYJQBeriJfKimZ1drd+OoBb5bi7Wh44DHDy4cUvquwCWGT?=
 =?us-ascii?Q?ARdQJo7anFZMAJ3y3xCTttM9mv2v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h8W3PVQqU5qS/0AuU7etOCdGBrZv8hPNMxKA2jAbTCXhoJdRYE6pikxjmcjc?=
 =?us-ascii?Q?ix9NtOGZoc65z0L4heDvRxFjlYUIdPsCjQY/1uFnkFsPaE789oPxtfD/QL7X?=
 =?us-ascii?Q?i89jEbH5RuQDp1xOM7vBZ0mp0tr35ZQLN1orhVXGMd97xetVZjlNLX2GRLff?=
 =?us-ascii?Q?CyYlISbj0cycNRX43Zblo4B1LqBEuKw5IMS97FcfJcs+QXCfHmR9Xw43X8GD?=
 =?us-ascii?Q?4Sme4PmzWF0fTQubeYUS84NzMfkXeAunKx5G0o0jIABxNJVoBwZveCPOi8Pa?=
 =?us-ascii?Q?k9fCMW3vGuAtonZbhGE7N+0Xi2BPpu81MPqcVEyiQ9d/ZtlasZfsEp6Klkzy?=
 =?us-ascii?Q?MxV3JGM8zgQGfhsXSs/m9oXF2ROhcPjtmxyUoE0cWTcVBtOR9llQONonCoEw?=
 =?us-ascii?Q?S7BygpJkTA/M42jBTSAb4d7b8TBtfqZ2GC+Oh6Xikn5LbwaYQu6BUn3PG5Bo?=
 =?us-ascii?Q?GxJiEUJMn7GXU5piFR70MLY2C3KTLw5Q7IevVRjI5PdUvVq6gfU8vbkzPq0h?=
 =?us-ascii?Q?dG5RB4uPrk5EI0wP/CpcK0fD8nK8cPfk0RCjrGyG8sQdWIPV9gzvEjNYbQ9Z?=
 =?us-ascii?Q?DVOrqSz/nL0TFoF6g5rkgzvl47YgaGj52xk4yNlQ7Kp23fzWWo8F+v4x1TnT?=
 =?us-ascii?Q?G1sX2EfL2PRWh5HCGZpGsSDRqJNUoVjryVofvvz5j91ivaggP4VM6lE4FiTe?=
 =?us-ascii?Q?asNDWwMcwDGrrqfCsYArziLbMYm5MGMXO8ETerTOM0wU/gDBvnOroqUMlcBK?=
 =?us-ascii?Q?7MOgzdg2HLE7HbkUoj2srdcJY5rWPDuiiiwZshxVxFUBUWFwgTsLstGq2bPX?=
 =?us-ascii?Q?bHDaXwGxXmHEujdCwqRhzAZuIHiRyXZ7fbGK/DTOm/H/HIqhCkwpE1vFptMe?=
 =?us-ascii?Q?LdAr518ofF96D40rk8bo3ppZ4H9GwVc7GyaUyIqdPhQJ8YSxPiJwa4hcY6FD?=
 =?us-ascii?Q?A002vaQxfgjFmzy5ldYcAgAXF/tQC3KKldcwdJdzhw9YSo00pYBEY/lEBS+h?=
 =?us-ascii?Q?zXwsHuYev3p5k/Qj/mm6uo/eW7Ml5xCd72wjHSIwFTHyA5MYTn8RbM2mzqQU?=
 =?us-ascii?Q?qMHaHuqTEq9Rmpqlz0F3wwBcekxZGj/khuoRcqUJZuCiNEd9YVeiI4KpUDJO?=
 =?us-ascii?Q?dKdtPODfixueOq0afoZS/ieBaPsCkeA2jgFXXliNBn9/r94Cm+rNfuYGi8mC?=
 =?us-ascii?Q?6b/+rkg9yijN2UwlO7NWaFxdUIo6jIBI3IHTuSH2W80gkYQz6mieY4BprfXB?=
 =?us-ascii?Q?7oRneaVim1VfHI5/uLLpsqlHGBojIricp8B4itnn89cwqd+BfYyfZzozazy+?=
 =?us-ascii?Q?UpywJ0K8JmeDQ0Lo8Vk1YCZfJjlKotrLMYFPXd7zTXjdz3iQV+3RQIYYZtFc?=
 =?us-ascii?Q?yHl9ESDD5lLx9nJRcdGLrlVVV+Vzs9TBlcWL3+jvltdI3IkRatdPgAfXTe/l?=
 =?us-ascii?Q?rhY2aECNw5CoiKs0xh6yTF0vuueYGrxpdNLGV/TcEhjy4u+UqoO9jFX83OuR?=
 =?us-ascii?Q?4pVEo7r9UA8SJCxGYCYoFdrX6ayAisEDvkWjKFOIL7Z7IHGn46NXFU51iYnQ?=
 =?us-ascii?Q?BO2JTUafvsPMsF97+ndrqj0f/ToydrqxrcwF29+E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c158d73d-f968-4f23-1952-08dd313c6967
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:49.3931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1TIMPwYjd6dD+quS327qa8/KGUQjK13ahTLWEWJgcndQvcwaj8xe77MaL5qDFbjcisN3t8/M8m1EusYO+h2dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add helpers to determine if a page or folio is a devdax or fsdax page
or folio.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes for v5:
 - Renamed is_device_dax_page() to is_devdax_page() for consistency.
---
 include/linux/memremap.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 0256a42..54e8b57 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -187,6 +187,28 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
 	return is_device_coherent_page(&folio->page);
 }
 
+static inline bool is_fsdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_FS_DAX;
+}
+
+static inline bool folio_is_fsdax(const struct folio *folio)
+{
+	return is_fsdax_page(&folio->page);
+}
+
+static inline bool is_devdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
+}
+
+static inline bool folio_is_devdax(const struct folio *folio)
+{
+	return is_devdax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
-- 
git-series 0.9.1

