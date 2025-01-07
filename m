Return-Path: <linuxppc-dev+bounces-4751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E15AA03629
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 04:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRxkw0WxGz3bSx;
	Tue,  7 Jan 2025 14:44:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2407::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736221496;
	cv=pass; b=gooIaGEPOfJfUnX5Y599lUCHSYNa9L7XLL6vzxvZWr9SFNvTrMxLNLzlaxRXpQ7UX9re380kIDF9/CcmhVU5rOqWl9jKH0+03a+GP8Jz1r+r7Xvt4ocHRO0Y5imak92QO+qFxB20cCxq0Tt4BFpUuRiwK/hGm/kNUNBmBVAn4LMr1/rYmAQSVJmTyvMR/j+R9v/TDttiVWDbECfzoslNkbHkAswGZbqJX+ZMkpn2XZB0QORSQn1KzvHGV7bLttZ+XtbH4rtcvYyECsRbnQ3gqP4h1VCUHd2i/rS2tyznFhJmX51JgP5yLrrTPinYh1QM0b1WOo9o1m5VE05CCYcKNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736221496; c=relaxed/relaxed;
	bh=vjp6m1j2W9OFBUPeqNP0AlhzXfJRFG5q0VazBoZoLDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A24H50XQuI8clN9l6FDjjZ+SKVd5D76kvA0/A0e1211uOYWPO78P9beBI2NLa8aROrCADuBu+JTwVYLE0qqKepFh7lHDuF4sAlK8WRBb6YlGjsJROxeldqO+7pUnToJxDaFiCTK8d2XBmw50JMqqlPR3xWMzLq6VzZF4WitADZKfznDVxKEL4chALXIfnUDhCa6umCsqjpqKkfekWj9MWYeZd4kDI9rtqIGCCHgxfzZU60H17RE1zBGBIgMiIRDEHGxOXjQ8SUYDvV/powbDP6OsYursrJbY+NYdR2nQZED8fZGR9b/l2YlTdd87ZsAQQDiZXGbjv5RtyfSkbW+EMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofXTc970; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2407::61f; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofXTc970;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2407::61f; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRxkr0Nkcz3bSf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 14:44:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPybrIsxuOL88MeCTAuFNJ6lZPgVaywLHH/FPRRePXsp/SEwwixlasgL1ekpTdVCf74XB2GHm+rceDAiM58NYS9h1IlqA8Fx3QVoMufAki/GnLjVMjeNoAbnbPsDkgVdDTyrGnJ4JTPJglp0BL6IJ+Sdq38z/+KqVKh3XIdqDxVVk93Xn1O7U50jnoE8cZ2mgBc7Uv/UOzGak2byz+EH6L4LrAQLXd6vchOqDrSfj23Zcb79ExxMbHU/D8aYmwQL1ykujQ5kUnfVbAOyWoma1qIL3GxjIptwXlz8PHfUPQ+UCY7qJ28GlTuhgVZRmLExk6AYUA6AVa+sDWz5QnQPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjp6m1j2W9OFBUPeqNP0AlhzXfJRFG5q0VazBoZoLDo=;
 b=Deg6PZvJ0yo4KpYVo9l1cbfOEI06r/CC7okSFvM6ixTjn1HtBM+hhH7iMrv5ol+qCMIrLF9GK4QmAIBr2JnyIn5uNC83O2pVq53DfW04mpAj14TMiaQk09AIbf3Kb5V8n3d4KvxHN++1h39zcSsq4FNpekCcfpK28KttQsYVgXtQKBcTr1ZeH8GQAwx/bkS7wGp/WYD14XTJLNgu0MGtMhqoqP0GTgw3oxEQBgPB/0iiiAL5/HLMcflBNM2OCSjUNMOD6RRb1D0SJdHVX7puOmYU0hQ/+BCR4rXoh1SwzDWPfpJSKwBS5U/8nD9mr3SQ/q912nmzkmDYNcRfQ09iQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjp6m1j2W9OFBUPeqNP0AlhzXfJRFG5q0VazBoZoLDo=;
 b=ofXTc970lvm2iDg36wWlSJWa/kU98VNR6IR7uHF6EUy6jEjUtAmFbDts70qcNvQ+2BvRTHwRP3rVbk538uz0YOgmLWi602+c1TV+20wUbB7rm8fudx5+d7Y4nZWwbPbMZENEFEWLiaO3CNiSM1ASzzNrtWXK8A8FZI+RD1gBH47AO9JmNvKupblYqa1QOIvPrIbSS3Kj7gGb+4Pfovb+aJVy325rggjnLiDt6T2+OgV/8HJqEmC54N5tZMpt7FGts0DFudBpDlEmJ0AOsp9TJKtM04eM2Vh+9hkyPLvWgMH8BG05c+6AfZncKxR66uy6k0qEpcBaJ/kHkD80JKSjkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Tue, 7 Jan 2025 03:44:28 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 03:44:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com
Subject: [PATCH v5 20/25] mm/mlock: Skip ZONE_DEVICE PMDs during mlock
Date: Tue,  7 Jan 2025 14:42:36 +1100
Message-ID: <735ecdeef28a03b0e9114b2435e0ef7af7a73c66.1736221254.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0010.ausprd01.prod.outlook.com (2603:10c6:1::22)
 To DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a196f6b-c868-46fc-3068-08dd2ecd961d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gnXpYpFuy2ZTc8Vg5MB/kqYnLVrZln6jFJqUPm8J7qNoufIupACndwY0lkXO?=
 =?us-ascii?Q?SfVtzeIwy5glLZ8VnUyxAHUpSEM7FQUOMXcebVmqiw8TRcyQbip9oPXelF6t?=
 =?us-ascii?Q?YgRtE36PLJvVq2KIy1P6xJwor8yzpENSNLflDtDEeWToyE4QRu8stYnGnJKc?=
 =?us-ascii?Q?FXdEdDmKjKBSWwzlSnv+aORQaGCyKuVOXBRBDG5x2nNyJ8RLiqLgrXCNu8Wr?=
 =?us-ascii?Q?Hn6C3m9lvHbufuHWdrQbIt11DqbRGzcg5egY6PJdXxEQD5sbd0WmN5XuDXYQ?=
 =?us-ascii?Q?jgmt0r7vP46cPCW8jtJ5AgJOIieiC5L4nP6ot95gMFawdBT4yoiJ7iA2OTvF?=
 =?us-ascii?Q?7/F6VZHVf3sVDQogb1+62zDMAQhrxfh/3kSwYGS6uVldE4Kq0Gj0A0e1aci+?=
 =?us-ascii?Q?RsPPtweoUAmLydVikahp0NOXh1lA6Y485nVuOIM4FvtBJVZ5DUQv9QPb0PaT?=
 =?us-ascii?Q?RATRmMaU22kSbfQ/05+/HEl8fkJ8lNSZT5BTW4jvGTVMgt9coRi9Thx2S0Ie?=
 =?us-ascii?Q?L04xMjqXCtK8s5lK/NG6MjFZQO2Nw67KVn+FfQEf7vyrxY7qjCtxFlXiTIWl?=
 =?us-ascii?Q?SvWyJUY/pXo1oCdbjbPtEfD5EK0y2gzMZylTRNS8OU8bECkJUpwWGxpVSmLg?=
 =?us-ascii?Q?ODCy/6He3QfssoDDbbSgAcKonVgP/BGH9vjXq9W6Asxe765Bfc92XkxsN+aH?=
 =?us-ascii?Q?ztinfVmcJGBgYWUA8NDQKBkTGv4KDpTQGoGYFf2bdAw+3uSCBnYoxcqeFwgN?=
 =?us-ascii?Q?PaXW1S9kaLNGgU8W/33X3yhKtpRq9jnvQQ3nkiPb3Pw35yc7SAYerCVPyuUC?=
 =?us-ascii?Q?nwGaTkF/Y6smXIjkk+ondEeI1nCbms6K9QCLM4za3VTCoDQPMw3Z+q3CW1rA?=
 =?us-ascii?Q?qCMTiOe7neKCfNYRU6sGkBUMbivIxF4pGTxA/zjRflgJleDv5AvwxdLMEPgi?=
 =?us-ascii?Q?m1W+n1iaccmLTMJdyDujIEsa0uXRwy82lfVViOXiUQxHA9BbEr5fHUvgs+L0?=
 =?us-ascii?Q?Dxi3SrLxY8IGfDWl9bgJCsQA52AJQbik2YydsTdRB/OVDDuimXPh3G7XpEph?=
 =?us-ascii?Q?IcnEI6PQYvkRm3dKtjeDUpfVUKco8QTcxkMgJ+bD2IkN6on+ND6NUqtnpDJa?=
 =?us-ascii?Q?YGiYe+ZvnSLOW0vnM4eNWY4l2k/Sgxx1UaYfjNxLSfdhMfs1Yxu3QHZQVrzV?=
 =?us-ascii?Q?foC805inLwGzmgn81Dm86BhH7KdHQ3JVWwX7fmUWZ52IlwPCHQOUthKuydvl?=
 =?us-ascii?Q?IdyhO1QTPm55r4jfV60qI6isuxI6/TB5M/wwc6l5GBh5QctrkYoCxshoKcO9?=
 =?us-ascii?Q?E7+mI4YATS8uJ3LMWWsOES2G5EZfZy7ztOtqhxuLFN29/+g7gz0K2vOezS/V?=
 =?us-ascii?Q?KgtxZCa7kdbEoi2v4kVhie5nKlXf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5NGLl4RTBtCQ4fsX9E3I5tdi/Z7Kg59K9JcInO0vO/Co0P6Q/SzDpQinbYdb?=
 =?us-ascii?Q?OXpQYUd5SAhp1AAf3D/vsYroWJJpUbDcj7cvGRLMLpK1qI5DuOaY5gvSbOz5?=
 =?us-ascii?Q?73iNpwVwi/VD+0nqiHAnHgYxg9rd3kNKtNDRTJ3FeWIG6e6vmzNpyS6+pxso?=
 =?us-ascii?Q?yQwLoA9SO1aVkbt2Gw8MWxFAACqEpKuttkTkZXbSsIyUM36vVYzKjsFWHOT4?=
 =?us-ascii?Q?APhatH6DKMvgJIpu+RdO190zyMIut+mkzxRHIeOYqMzCBx5QJvmQfxBUTYsi?=
 =?us-ascii?Q?Tf/ddaqF3o/vD3N6d/svqPjvZbBh1+/nJKG1LKSs05/Ec1ZxNZcbFlibYovC?=
 =?us-ascii?Q?6P0ZyFjUpvn/OrzRSLjfn43EGxf8Da1BFplJMPdQqjSySeLvgbzwdWB5SjOV?=
 =?us-ascii?Q?edS6NcB8XgSZVd3w8K+WwR9vZwSqVHEiKsKKXAU6r4bNUxz/6bpjEGvTmn4f?=
 =?us-ascii?Q?KPE8WvWYuD+rKG2Yd4QlsG5urGmspsADdg8u3G8tLDPJ2oLDN9dKWNed6aAC?=
 =?us-ascii?Q?MVZPprn5Pl08MVPj9PXXmNTjGg1X+PrXkjCWaV1w+noWKOLjrZL3TMrtSgIJ?=
 =?us-ascii?Q?SDHsSJP3ZjwTDyuuC/nBCgFD8VPsQ5WJAefeucGteWje+rzbxZGZqqwFa3Jo?=
 =?us-ascii?Q?uUesKvlSfVN/SyRnGhs4SyHFtKpDbM2wQwEPaK/UWXIsto3Uuw3y8oAPociB?=
 =?us-ascii?Q?8Z5+FiX8bVsro9NCJKvEShNXz8dv7G1j26LKYsdr/4YucOEL2z9tHQher9Eh?=
 =?us-ascii?Q?BF2Gj2rHp7Mr666sAhIuv5KboRQFuZL/lsbMGbuYOAktCher8AYD3QMrHptl?=
 =?us-ascii?Q?iho4vUAJzg13TmROAy0XlEvXV+E6AWiRof7uGh1r0/CTp+H2mrmWLGchwlLG?=
 =?us-ascii?Q?ACh/ktmJ43gQAcobRQAijjYDnzIwiq0haCunL83dNDK96k3F4TJQaQLxw4lU?=
 =?us-ascii?Q?kWIq27cK9t/yfOqyeC52qPcDK2Xs9RtmlGhyO0e4GLw22AP67TCTRoztc4yH?=
 =?us-ascii?Q?djdnMbTu4NU1N3ke46ThD19ckfGjlYkHl0Yu+HpzgKkVF+RDAPBngShN0YzJ?=
 =?us-ascii?Q?Crx0z+Z1K0El4OKaBpzv9WbqopDUAJ0hRQs+ZiboWvAAOvs30p1aco1pqlCK?=
 =?us-ascii?Q?CGI4g5P5/Vw65ujg35UvuMC6++OxJRaoaRmota0+zP7X+BHb2xJuM07MCVJ+?=
 =?us-ascii?Q?7vUqvefExHg8bZh0bOZr0hH/RUDY8uV1RTixDzOkzKZ2HWPZFy2SBI0PSgMY?=
 =?us-ascii?Q?ibi0IdvtF5ng8BEl2t/C95hC2r7nZgHQVAjHq1d6th4F99E8lqk77kP06eSp?=
 =?us-ascii?Q?LydpNxo6rc5Fy5MxH9+B+fK6Mkn2gdee+B+yLTH11cvkYxjv7IWJM4q42RFG?=
 =?us-ascii?Q?kL7waXbi2bip5x7bfDLpkDjOYfVA0m2vCrcgl1XGpJvjvxK6vavBuFCgSNbc?=
 =?us-ascii?Q?e5rSbR7MjM7ugLODLtcCYkVhhU32IFHfhsa1muIbAnzLpKQqvSNSBOFBYDbo?=
 =?us-ascii?Q?pRhK3MH7L+pzceR1jVuqVjL26CsqjvcIeJMhGzMQelAiRDeOg1prff4L8YJQ?=
 =?us-ascii?Q?sErSEuaD6jtFBzhabSUzZ+NuWOX/kWjSkAlH3nVb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a196f6b-c868-46fc-3068-08dd2ecd961d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 03:44:27.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ge8npubYQpIxEkHObRZ4nVWsc/pvk5jFciR5yplg4GsdBQvuefdakQJS8mdDYFgAEkQ0jsDTl8M8jqoBksd3lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

At present mlock skips ptes mapping ZONE_DEVICE pages. A future change
to remove pmd_devmap will allow pmd_trans_huge_lock() to return
ZONE_DEVICE folios so make sure we continue to skip those.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/mlock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index cde076f..3cb72b5 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -368,6 +368,8 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
 		if (is_huge_zero_pmd(*pmd))
 			goto out;
 		folio = pmd_folio(*pmd);
+		if (folio_is_zone_device(folio))
+			goto out;
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_folio(folio);
 		else
-- 
git-series 0.9.1

