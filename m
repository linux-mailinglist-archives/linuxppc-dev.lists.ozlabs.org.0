Return-Path: <linuxppc-dev+bounces-6303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48351A391AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 04:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxm2302GJz30WL;
	Tue, 18 Feb 2025 14:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739851050;
	cv=pass; b=Nn1iciaRY2m0hT+RtrL6amiMsrDxagt+BEo2c+Njtyp20t4jWDv1mSoMNfZQL7w+JmJddRjWvqmJ7kjdeELKok22c1lFfQ6ox1F60rUfz+V6f1uCKIqh9PvGl6Q7R04NieuFPJ5FQ5WNQ3QlvJhXoR9tdVfOtLzIyaXFnj9KlRxPGeo7UnKsem86fyp9KuMJoleapiNuxNCoUMi8V/+6n9plI7WcXu5p6nor7vFF2kkvxUL+ivx3X2ZMhwZ7i7h2UR20KmIw9RY9aBMbzXOH0BisiSXQWGPOoVV7gLRsqXgOf3TjK80EUm41WStCa3E1l2XxXrd7t2mMEDEjaQ1Zkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739851050; c=relaxed/relaxed;
	bh=VENjcw892hS6S6Ehnh8sjwSOcKFsy/z5WoqOWPzB/Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AzJb5VTq9lVqzyavjc4gfZukbjzdVpFHjWPxkdbpyj+D0ragkswCa74w5fsQ0MEtW5QVF9U/a04KpC60TiBMdKbQt774jmFr1lJ1muneXDdP/As1hEGKl5ngEFdSaD8tW+3IUj2r2eHu3+6rLCaFd6WMt+sN9bviKZHWl0+vUuWEuy4aT3N0LJqBbc1Aq8LoYqtP9A5RtojJryrfs4EhXcUhU9YhK8UFZnThNZXjj6f7ruzhsI6yyppMjYa+9Benlrw06jYcA5vbjUpFtPFjLs/mfC6aNVtFsmqhC5Ml/ai0ACQqI+JiKEWDeSOC6TTubWyv14NF1RIZPUT9JBLGGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PsFAQY+U; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PsFAQY+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::616; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxm223xZsz30W6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 14:57:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0JMNz6nM1+LJRi2GdyGpE8rYrj/aKHWgLLtlLasdWoox/86no7Brf2Y/PSlDO8csNxHlWukeXZyXl2ucJXQkcEvkaAj0K//NQsBvYx06RTkkzvYYppqrf+Pye9BuUub1wWiIoX0gGErp3Sy6azX5h2Hh9VAClg6NEjXQjgLTAFHkcBXPRlqDYE/+YTLBsQgL9IcpJuOmZEJV8hvA+zUuTApThxfj06YpRXgK8DWGhgsuCR0rRyjnthkWmTnrhWSbfsuq52EY6D6Hm1NvUncA+mgF84RXPXUfbghjSdCxIJC4DFb12wTwVLuOK/EkiiQiW2Mw2HQDlhlqGJApPGicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VENjcw892hS6S6Ehnh8sjwSOcKFsy/z5WoqOWPzB/Kc=;
 b=lOKenUJz0RumIR1kmtb484o0agXCnV3RZOP3t0HGeyvxk+/rqJLClfSeLa1SIfv1E9nMl1GRMfJ8/hJ6Z2oGpYyD5i2TyZxRwmX17WkPWNfZi+x45GbcuChWl4pYJEixGNrpH9eh0eVb1eFlYJ6pyP74g3/FtC98QPjAvET1qWO7y3yntvbHlYaLvG0GzbZbVXJn37+tZ0tNSn75XRyzcVhQknlN0T5I9D7v7ruPmo5UHe/D0Sx0HRQtTQy1QuTh0CDkXivqCH1PvzoLbvnSQ6NekBaV4wns0QAasXAB6Fw+yyvhBAQSK7q8WPqDAqQ0TgIx4GPHRUSbt8paFltwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VENjcw892hS6S6Ehnh8sjwSOcKFsy/z5WoqOWPzB/Kc=;
 b=PsFAQY+UmmHvg+C968klRHvK0jg6L3RU/fID07uMQ17GLQHGphQK80XisDQVb14Z3P6CL7W2KYRkbkgHbAdWf0gkC9fXZc4H419UuXI3UV8qX1SRRyhEvUvStmmmP4lB+a7DsE66yrQVLd155gfgfCaWW5TqYlSBuIbVuy7F+R36qh/h6wh677z0bH8SWU3Z+22TbkZJYiJ7NP6Kq8mGdPhgXw0sX+CCe1afDSW2xBlOeu2+7aReEyXRH4YeS+hzonf2wQAIu4ILE3h9SHU6c0GZW+a2k1q0q8tMNM1t/ead/NJp7v66ZseF4IfA9NVOlzU0aZ6DwJcbTgPjzLXivw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 03:57:20 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:57:20 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
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
Subject: [PATCH v8 17/20] mm/gup: Don't allow FOLL_LONGTERM pinning of FS DAX pages
Date: Tue, 18 Feb 2025 14:55:33 +1100
Message-ID: <9cc175f877358da2fcf1b2b769030d457c16c5dc.1739850794.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
References: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0158.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::6) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: ba988643-06b8-4cea-a580-08dd4fd0580b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1aLv4yCLz2bzH0/2XPEileWU1UF5G3LQntK8G8TQ3jvJrKdyYsNXq7ydVgHu?=
 =?us-ascii?Q?u3yd+d/KBUYZz0XTn3AdwKLEjPYxhGUZ5vuiIu6ALFnW418n1plC1h/SseYP?=
 =?us-ascii?Q?qrXgKCJ9N3wUQ+UTe9AOQ4fDbHPNUhPfzP0Di1b/jH1R/pZ8z0M1SKWIpyN0?=
 =?us-ascii?Q?qDO+id3mDf39uYzU/qBViXwQXAunUAY4b8fyidLXdOdERoG7q68Y8l2QZvQJ?=
 =?us-ascii?Q?Dyt/FTv1gw/z/f6CiGg5AZG20nS5RVg23RiF9qWJSQnQXihHIbMuV1THXDIN?=
 =?us-ascii?Q?hr1cPQ9jkoOq/walCSxzbqDth3udeecTD/msDpO+m4Z649dwLPItO6arFwep?=
 =?us-ascii?Q?+OrvZkWNXxkXBRybtM/vhiK1RNZBVnG63TlkVQzwQEOiZUFcxbjTS2RyUZON?=
 =?us-ascii?Q?mMH2UbsT4h4P9R7WKImQHsASkDe0pxDepTayZuIyyiiBc5Wpo0P63deKsaS6?=
 =?us-ascii?Q?VXfbGmoYvKQjk8KPi9yasLl8df1SkeivjlJZ+O/W6X2JxW/mz5uKCnL5l2Mc?=
 =?us-ascii?Q?2vOM5vGup3T4so0DQ4bKzIf9Goxvnzqjqxy8KtvjBhmNS/Bwq/d7+MJalUsL?=
 =?us-ascii?Q?KOib/ttHRu5xI4i+3p72MGAm3PDb++qhrX9fcf2V0eb/bFbzz+4g/RcMFBHH?=
 =?us-ascii?Q?FNuDGqpyKTTD3STl09vg6ASBNeL5zCdI7cIugq3yZInYeKm3x34U7t/7XRhb?=
 =?us-ascii?Q?RuxjGN7P9tkJ+MBgCW6JDxfYMxjKHFTEMNMSxi+ZA/MFmekROSGg9i828oxI?=
 =?us-ascii?Q?njotiNsAkh2TCIR1e2IVeFur5rExg2sheanZsm1Lhs36vsJGd0GO4+fzp5De?=
 =?us-ascii?Q?CzYDAqv068VwlGaY0oJosc0HSQeui/Zr5ObH6VoqcqDCLDvU6F8JkWae5AC+?=
 =?us-ascii?Q?fzQ68ZcKb+fA+sZYxwZCk8ynbVtoXzBjfOAgJC4Zn5FZFdB8XS0rJzio/7a9?=
 =?us-ascii?Q?7AeVGKo5DM9h3D3tCV0Ozam1F39ktk21GCDfj2XSUAwU5p1hZGZQfXQLpddZ?=
 =?us-ascii?Q?GASAtIsPoDoaKTvUwLPoU9oZWdZR4FK/aZzO4iq9QkkhI3lb7c4kT0HoE3q0?=
 =?us-ascii?Q?fmoNvYuf/Y5GS3QGE1JmKHQh3FGG8EBE7oSr2A2X0ueQPnkfu8um8gHPr7ob?=
 =?us-ascii?Q?sNxG72fmhs0gywg+oc3ZGX0XnKrTYubAhAQ+KiEOP56uIYyYzsy9cGfU2l+n?=
 =?us-ascii?Q?yVwDlnHIu2F8wrziuP/CcKio4fk5i6qJZQfqOyeoiwEoqbVc7yg9q+PGmLuj?=
 =?us-ascii?Q?wlUFjURoxMEQq7PB5AVPoQXZYt+EINJuEImTLg1tCm8z+lfscfaOwDszyoFb?=
 =?us-ascii?Q?qotQGsq5unlVVkkkCFHwVMKnsEk6H76iSqrmG7S/SI8tPFQgXM57IwNv9eA1?=
 =?us-ascii?Q?KVp2txSM4Af8dw2CFvB3URM6x+GK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?78ezF8xB1qAbdsZ57PepyzZFnn67AHx99HmY0SC/LFOfIRT4DOSvwYQAiZnf?=
 =?us-ascii?Q?8i/KF9rnNA5OwxIvEbOQZiyXgHLxUT9D5mEoJKf0gAK0LH12ceTYHVbCF4IQ?=
 =?us-ascii?Q?AqfJWcA23R2s/eFZyHOV13Zp1W2bvTaoj8j8+jkzgqJM47vTLAZgcbF82zcG?=
 =?us-ascii?Q?3VBeRfN8jf2b/VjDmXnYNz/M/e3x6MVyaHjs6hSK3FS4q/NlNuOeOrG6azII?=
 =?us-ascii?Q?CpsUzNvckWXSebgCtfA6iNNo/6LiXAeZKk1ju5nrq75WpKD/3/SeGJXFP5qj?=
 =?us-ascii?Q?Ny8tQrDhdCohf/7OOWm2GevvvnzzU1bLC9TKIdN7AL4d8trVYNQv6ChFZ/NZ?=
 =?us-ascii?Q?fRMgKj+ItJCQxfCWhFnlNBJnCvRwmN/nJeCvCYAUj0fMyHVYoJfdchh+R6xz?=
 =?us-ascii?Q?WEe0SDGKcGJp0QvorVr/BE8Cp0Tl63M+ebTdogSWBQtOYoVNJ5K8/SaBb2WX?=
 =?us-ascii?Q?j75oLlquDF/9VqeEAII1YW7MhBZ+Do6i2WV6CMpmgRd4b21mHW12cHT4yMLq?=
 =?us-ascii?Q?E+ZxMBFNuJXuHzioRtL/jdxLGQ978wI4npS+gYxtN4E6qwewtf6xtCW/jHcN?=
 =?us-ascii?Q?iEWUXxKPyH2UvWJnSKqDCsX2MMneylBB7H0p5cuUpxBCm3ls+Cv3fB4NYU7i?=
 =?us-ascii?Q?3CFRnDFs4bHOM/2HhHomwIiFcRCvfUTVSRUplAx8mQ3nCTv6E2QonNbxIApb?=
 =?us-ascii?Q?rnss1ZdLHWuS0HmNDnPpuIBnnFfCW0gYOe2qnAH/1w9WEj7IGC8Ppy90KlyX?=
 =?us-ascii?Q?SDtIfOzm2BYAKzfI+P7xdvHBItY3J2OwmSkuYf0n+ESpxLxAOvbeHNf+YcFf?=
 =?us-ascii?Q?++K39xGwdNrYW1B+SO99nQj8SPjlYrYxsAVxdpsR3rlHT6ojDQ9BduJmKXmd?=
 =?us-ascii?Q?dTkIeRMn0LQT0ud0a9dlDXJoGbTc56crzmDKjwCZKer8RlbcUhMNFD8gTl2W?=
 =?us-ascii?Q?t0O8CtMlwG18DlYeKvH1MN8Tkj4UIb9Qf27cb3paZui0yXrS3hs+aYWaB8U7?=
 =?us-ascii?Q?/fZwFT/Vh4jwnp7GwZYWNCwFQ27JDubve7i/wKUF37DTrVgD+WaoClFR2Iaa?=
 =?us-ascii?Q?IGjGdsZKQzoNrZpbe89fHHIh64AD/Qc7kF3kUAvP7V3f/JwM+gf8+iuMSnJ0?=
 =?us-ascii?Q?xxiGhF7XOMG/JPttMgykwEf+amJsb8Cf2g1Nn6kI4JqlpgNohK6EyPISZfWS?=
 =?us-ascii?Q?Owc28RCzxiuQMxTSPWKYYqRDnRtRC0Gdmgw3MVCQ0/2Ql3BmuLucgfkRZIas?=
 =?us-ascii?Q?uF+ph/1gMBH3iCcFXRbyQrDJumbM0yCxgeLstjsev2ZebwuFiBx3KF1WHBDH?=
 =?us-ascii?Q?gdz/mB0Zjfxmh5Jh6N8ERd2tbv84JASqyW6Y3Thp9+BgJ3ZrUEJBFQsnOvML?=
 =?us-ascii?Q?SDiJuH9IG8YUUq5FD/xub3u1J6HKO+58Gg2/Fq2whRPKdibwm054JXrSUiMZ?=
 =?us-ascii?Q?sdFjrJ8orVk65wHi2AU1CjVYATjwoq+wXSRTgT6SJOhSdxDaxSFZ4F6eEBlf?=
 =?us-ascii?Q?knJlbbu0qlQDYNebO3CfCYBgoJs5PNdyohTetPJRZyn4LmXnu/rvXLR0yUNd?=
 =?us-ascii?Q?24PWq8He12ioGgeE4iS8uHkYbBPaW30cUjJrfc65?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba988643-06b8-4cea-a580-08dd4fd0580b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:57:20.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOQlpp3/9Y35FBNRUJ39N6zZcKN6+61qJMZYaVb+d4rJEcxcCCmcGtPwyMFzYI944mpOHtwrWmSf6rRqPqsvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Longterm pinning of FS DAX pages should already be disallowed by
various pXX_devmap checks. However a future change will cause these
checks to be invalid for FS DAX pages so make
folio_is_longterm_pinnable() return false for FS DAX pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memremap.h | 11 +++++++++++
 include/linux/mm.h       |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 0256a42..4aa1519 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -187,6 +187,17 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
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
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d1f260d..066aebd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2109,6 +2109,13 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
 	if (folio_is_device_coherent(folio))
 		return false;
 
+	/*
+	 * Filesystems can only tolerate transient delays to truncate and
+	 * hole-punch operations
+	 */
+	if (folio_is_fsdax(folio))
+		return false;
+
 	/* Otherwise, non-movable zone folios can be pinned. */
 	return !folio_is_zone_movable(folio);
 
-- 
git-series 0.9.1

