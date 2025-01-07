Return-Path: <linuxppc-dev+bounces-4749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97417A03622
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 04:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRxkp4hjqz30YS;
	Tue,  7 Jan 2025 14:44:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736221490;
	cv=pass; b=nOpd/SMYolbQq3ZeRuEkfPVW8F1UEW54hGJy9tUySN33lZunuPvMpAL7glsfYLZkFs84b/BI2tSpa8TCP2Bt4ENhDk3r49rdHyNbwl0DM0872TjnzHiLSPoy1ie0okO60E465Q5dQoCXd9ljihyE5J2wGlqEU7WQZAXIKfoYO+nYXI4hpM8mxBUVvBjYhTflwdqN+MqPe8afy4XJm3lix1dWuj3xHGfP3UTvGQhvxy+gB/5YS8yfPhAMJcR0WL6pNus7/o9br9qXaAO9Gx304WmSugONszfHlKVNED2hBLf0nKnoEfCxEhhtp7DrYnYp8INTIwi14IxCou7o3C8P/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736221490; c=relaxed/relaxed;
	bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDTTRukS1xce45/D7iXXalX+vbWc8w9+9lbMM/ePJlFGVbXUxTn0ZS5GwGGX2fzaJXaLFmHv2kOSO/MH98hLQN7Y8d5ewrFmjv40P2Ib968Iue4Z7PqXO8Thcpg5zROAbgaz68bKyzE1W6T+O3FB0w/f4Gl8MNUIlABE+TtholOxvZbdpxbuvnELU255DSL8+gX6DOKbnhKND6Cwig5h0VYdNK2YiRuT0lldnz2hbKKrYI93LDTA/7W3b7s37n9y7iAO5zqAzSqafIilKZamqzonoytfDYqcYNr0kPH2ye/cpJyCt8KYenWZddSDSDUMh8QHCVbmYl0E/+xdUt2MCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kc9guk5/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::602; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kc9guk5/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::602; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRxkk4d8pz3bSf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 14:44:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwZIbQdp5RCxfrYxaWkxTx6WprxAnRTYCP5DCtcqMk7RJjuumaGhvcmT4s9if8muWE+sa25NZVbieQDjFvGMVUhY54c1+E7SL4LGiCH8m4iAUc4HCz/TcvRcrEL7AYQ5IXo3OOVCE/fZlk6Dm5UntRUy8Se2amI2BU0gC/Hp/LqjHdFppMOMD3eX6R/owjqhiV0noVW4bnTgWj5mwLZA508B9f1OaYixh7hvxpM0YvGnRZ2D5qVAcqktTHEZ42sc3TGGW1JiAdZhwJo0PxrKoyQkG8OCBP8ImAFWbe3ucNZLDFjuDmD4EFV/Ei6VejBWVj90CFOwWmjLToGp2m4bUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=quQPkSr5XEocmUfzxOJPYTF1iFljHlltE0wSVKIw++vzdwjwhBrfQibCxDOArdhion86X3ZaTJxxXtDmKp7GiDAZjU8ffKBZu3VIuGReKW0ntBi3NsIMU1qqMfsUmLaf7MMcVt0v01WhFC9PYMMCG7+kq5Mn609M0j7g5pK5Y+MQejuWggT+IJnnJXDz5JG8osB28Z9r1a5rcvQWszN/SY+OrLAslRnoHpF1Gbv+MKLA/uwXGNOx1ijTabXSYOCySe95MPgfcYqApflIuO3EgJRI0QDAnmnsOO71NV3+QibWTp/1jWf5rnQ46/kphwXDwLIhBO0dY4zbDPQ+bYRXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=kc9guk5/hZlOibp8zY4AWPq/qVuK51V/I/1c6BZ2IjL+1Ut/P/eqsBCRliBTPzneleIb5c9sxKK43jPWyOOTePZEUdjWEo8BlJ0fo3USSEB7c/FRA+ZwSBrsp0dOkF1tyBb5BllXmXRGDgwnjA/cGGdcS8kG05cVmHqO/LfWVfn/kC+F/Flvl3S8+64QJ+G25qHySDCghLGx4b1VXbrCo5Yxf4Bj62BPpM1o7sMeOeXpNtmlHxVFJhqjsfUJkBFJGNWWzFpM7dxjbuqgWTVeuoJxnNwOVQAWcHDmjRwI7M6swnpohoNgy0U3s7A2TlYyygV31wzwx2fQwiuBepVIDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.15; Tue, 7 Jan 2025 03:44:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 03:44:15 +0000
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
Subject: [PATCH v5 17/25] memremap: Add is_devdax_page() and is_fsdax_page() helpers
Date: Tue,  7 Jan 2025 14:42:33 +1100
Message-ID: <75b434c52f386c6078cd4fa7b92ed826d95d033f.1736221254.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0024.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::26) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c9396b-df7f-44ba-a9fc-08dd2ecd8e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?40Lsq17uE6APPjBzJ8OCiwNg0CXlJtYGz+ju9/1rezjFBB1dJgYP5UOZZsQk?=
 =?us-ascii?Q?H0Ea10qMVfZdY97w3JvXsUvKEcOoeCDvvjlMmgc2iOsXcwA8zGz1deTXeTqe?=
 =?us-ascii?Q?LJ3X0wHcuAYixMei4/5+QjedHUMdcij9rQLCOB+e+ODJpn4h8GeCRZmMHX9E?=
 =?us-ascii?Q?+rfQf52BBShVPnyAP56y6vIr4lEyprPC0zunjBYOaWESxAQ66EbyHLXtuDkb?=
 =?us-ascii?Q?urdQatmXYdnskxz0QoQoXdFw2O4u4Okx7vP8pHC8tU2JvUPALW7UQ4z2szis?=
 =?us-ascii?Q?EapG+SVBsj66/JrlCB/bJ73EoguS9j6h347iO2jVzcvDocyv0i1ulUFm3XT1?=
 =?us-ascii?Q?p7WAtsJv+V9l2Qk8Z8u4jBWytHitMbSvSU3N1FLQjDlpCmACxgVDAmcownNu?=
 =?us-ascii?Q?YMVeZ1NNJJ4NloKgx5l+vD+1ZGSAZmt6mlMy6XvszpwrK471kddqj2ztMnkH?=
 =?us-ascii?Q?3YcMCkkgcep84R37O1kuEIw13NKy1OGBokjETmge8h34qaE77KkwNk63RTh3?=
 =?us-ascii?Q?bTaJINL7u5o0qcTC5Ie80j08rZa2TwnvW4cbo08+N2FjihJ9/i9JsGvnOYsx?=
 =?us-ascii?Q?qg4DOtFSBh2l4iZ4awrmxVV6fzd2zBm77JKS/k21bHFlPuXsOpClP4Sq3yqr?=
 =?us-ascii?Q?dPhrv/xkEClYfI8cwJN/i+0U9r80ouGJTNoBuG53rHi0XVb7ejE+EgNt6WYY?=
 =?us-ascii?Q?ih3zfGWaPi11sm/RfR/nbKrrnw96gD6ft8YsvcOckiw7OtX7lHn0fkHFlelq?=
 =?us-ascii?Q?5h7aySG6usNH7YDNdfn48+kNLOOzVZWHckvAvRo/U57wyrTJkC5BOskg4vUc?=
 =?us-ascii?Q?Jrn5nmF2VMbi24HewRT/VxEbKfzrZJRjAVCElm5tAbzrNX//8Zbl3zr2afMM?=
 =?us-ascii?Q?acFRCv+/zC4Pmxi0M0nb1vxYPGXBgSbneYjj69CbOyAcv+UQqTfsy2cEjNIg?=
 =?us-ascii?Q?1DVVYlemIKBXE52k9Z0dzlMi+MRLmvSv+64And1nAXwaZVD5uetw0Rlno6DA?=
 =?us-ascii?Q?cO5f2FLFe9JE5CzlXdlauYv206JC4MUSeJAgsYFct6mVkzWDNL28tnNdMoum?=
 =?us-ascii?Q?SuqFoLX5AJ1DDfO3W3TQtHnL/+ZYHNMbCcDYIBXAAG/rq/azQOmlJtqjY9Sy?=
 =?us-ascii?Q?FoFcXuQ+VD0ae14knRmn0awoWvMjWia80zK88Kmk3cTs1nb8Kb8gu6vjK0sT?=
 =?us-ascii?Q?aBmeJoODd/kfOK1PIN+XIec7LiEw0gDA7Bz/tjhlMPCNE00OzN8uzHLfxSJW?=
 =?us-ascii?Q?WHe1b+VQ/paC4rkALvBNgsFgTo4pCfTTFx+6pY+pqG4tJ9J0bffn4hXFIbmE?=
 =?us-ascii?Q?XxV6FrpsNSKObfKG4uwN/dYp5ddT3KlskbL7ltzWCLT7+eliFrxDMc6Yo7Ts?=
 =?us-ascii?Q?tOlzwPrwsUlG66zF/iMBzJnbgiFN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UnGyL12rj15VjNDWBHl4Kk69ftlMWD42QSRWiVv0pIOoVk2arj7GHxhjf4e7?=
 =?us-ascii?Q?LIVo0y97iox8rjIMW4iGgrorBnmP3ucKZ11CFkR4sg+7fv+KVg51Qio/t3Mi?=
 =?us-ascii?Q?GXGo2eMMXUqjf+lF15gbiDDHurXtUo0XfEpIck56lLjXFVNSGKY+GSkyxUMO?=
 =?us-ascii?Q?H3dij3pBC7Btq5HFYPtcx3xMCudgzFGwHDoj8dwVOh/Guy2FzLp7eRF/BQA8?=
 =?us-ascii?Q?62+epwThOKvcD6tksy2AQAodn6enM6HIwTJ1g6gTSns5WQR6Q8yfR2YvVcRs?=
 =?us-ascii?Q?rYvaMy43xJQ7xgmT86l9Zmmn1ZuxWN7nZdyujKGn05qz1vn7Q0u8kK7QY9Jw?=
 =?us-ascii?Q?zYPRXhnfgyFDIihKNO1tCE3bzTpugpWPfgQ2bP6mxg9jDptlZLjn0bGU+JuS?=
 =?us-ascii?Q?Yr/GExvZsODthq57u9Rn4+S51N6K47EH7MuqIkD4/gao4tBFc8K4WHYYXKtx?=
 =?us-ascii?Q?7qv68Uc8cQFPo/zNTxrSRrHLHAT5LQCaGl/lZGipvYXoYTN9EAZBm02BZW0w?=
 =?us-ascii?Q?KUj9ymP9hg83vL2qTWjM78DcVXzbB92mX+6mkWCaQWtu0JuDGYNOHASwRAtE?=
 =?us-ascii?Q?TuQBxpD9iKj0bim+r0aXDWcenSZAZondyGsyKEFLSKksVZ9fxAtQBgyeiSb/?=
 =?us-ascii?Q?sK85vwIOz6iHIgLOAfceObBdlNO6g1/E4LgYFF080ol430PYU+8Vfb2syzLu?=
 =?us-ascii?Q?MSnP+DOwW8+Yh3c8jdGeuKYDWWSy2mWjNeUw0Q9FpQG92iPZRYEG8Zo6RoSn?=
 =?us-ascii?Q?y1rjcV05fOHWjN/SVOr0br4DYQpZmt//ujKMVFTFQ1oruF+/UtgBeBXRo0gy?=
 =?us-ascii?Q?wAI0pn6ztGw9Wmj0pQXkvbqTMtF5MXl0X5/4e1oA9IubSjqKzAJ8tZH+KXWI?=
 =?us-ascii?Q?lQfGm2QMdsEgo5pYFCFWZUeDVf9EqKIHQ8fy6Rz9JBJQJpcI+5Wy3MeG7sID?=
 =?us-ascii?Q?sDJb8ysH3X9mGaGdbEVvjTxlq6CQIUNkcI52Gz0CxmUKdGI3XRoV3/x2wfXQ?=
 =?us-ascii?Q?1NvKhK//rijFfin8AHknS4VjqCVBJQLJth3lxcITyiYVfvrOFq3MnwXyBjNY?=
 =?us-ascii?Q?XKBI79EvIw6BHJge/1JYya5oRQ83hzygepe36KF7WIVyx3DwHuXIyhYvgxOq?=
 =?us-ascii?Q?ylL+oVlSE4Y7FJNude2I+JHU3iWS1QHGtLEa0G4y/ZhEUzGqVoChbL1hjxJ2?=
 =?us-ascii?Q?2KlRSimZV3seEP7iriqxQJb4mGexcaaBhcN+JPA/Kb+Mh+4a9Yo0E/zPMtTD?=
 =?us-ascii?Q?pc7d7v7vCZ+zXfXGMF2dOQSz5yKchJPqDaVstFDuJfECMks5RKdKegFh9hpQ?=
 =?us-ascii?Q?GD1ZbZU+Gd4ea79gBC8f2F4b9wwJMhWihNlEpEfZq2Mn/EThvc903UyDA2jR?=
 =?us-ascii?Q?399Fj/2Zd+ugETf3CnTXQc1i1o7sVAQCkZHnkyNhYdR0vMLI8ZffQJnyoiJ3?=
 =?us-ascii?Q?EgV8f1ds6/Z7bivU5zmST5fN9HB8/HaI8f+wh/0YUcz1mzBf35WsGZjdPPfm?=
 =?us-ascii?Q?/MRCB8tpS2PbMeIJESBGoSOfZR6+8Mzojb1NmZZpUGrl7EH6rhjwl46rLoo2?=
 =?us-ascii?Q?Xkqp+7wmurwjhUReRyubgEbMLoP2Eey3n3T+0Ijv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c9396b-df7f-44ba-a9fc-08dd2ecd8e68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 03:44:15.0611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL5qzyf/U5xZcgLjgRd/PgT9UPEgjoG1WTGfwQBfn/j83sU/By6AvXBeHZRyySbFJd9zGk4IU6XrKQc/2N92Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
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

