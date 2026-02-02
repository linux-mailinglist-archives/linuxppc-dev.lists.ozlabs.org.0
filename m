Return-Path: <linuxppc-dev+bounces-16513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK8vKZGMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A2CBC9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjW1F3Gz3cBb;
	Mon, 02 Feb 2026 22:37:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032239;
	cv=pass; b=AoD+FqtrHRd00gdrulX0clBP3XjHC1IWSSQlXx0UgGhBCb86SeA/43ztqp+wec0L2kDdEastb4ivV7u6ZSe0TvFlAviVJfbJ/faGarhICOVsvGPKO1dgwPd7CU1rC+stKM7qutydB7lIWNJkeHs3VZrZ0CjMq6VnU2KZ989R6vCYgdqIVBEvybGMd6709r1bkwiU1yJBbvt1WznSDx9TOGiZ+uhEWoYWvE3OwFtl15wqf3ls9HmdHe/SMjUE+JiM/MR04Mg4QtOJvm2ZgcthbFDOdMI4NjbeDfMn06kwHhif9G5PgH05/klPAD1/IyBF3hZ0sd6b3/H8+UE5GwnBYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032239; c=relaxed/relaxed;
	bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mom798FNSCAtDiB24GRBPl1dxnuBDZgXN7AyC6xAMOy+x5qnr9Y+kQNIEAymh9cmFx2a/tlxcKTU1OT1FR7LJ+3xBQSmigKwJfOfJ4tRruJI8VQs58wJOV6xyxIjWyvIvf9fNosVZ92H/epb15bclPzD5hYOCiBMeNlrXrdLHUYzMY1Z3BIe1NOqCrLe5uJ9Enc8Pd6czvXDDs7uHCaJOqmKJjYFkiVr0lnNR+fZDxwPcENmmaWF1p1IePRJAu7YUEx2WCacCd+wAbir0DdDaGfbW5rm5GNeAcMl3qT//OCmknx6Q47Jto4j47MhulTo2RPJNRLs2h9D0Mw1BND1CQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hu2xEtAc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hu2xEtAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjT6FxLz3c9j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgBYCxTrSzOq+LyzmltIcb6Y7SuOBuqgzUYqF8WfIE/S9aXMyEFmSQpWW3Q0NVteGj1ycxa7RPDL1k9koMRO15jV84otcDSaQrb+cYJ+mQK9TAhBLQG2+z/NJbP9vam45vfXknEidYj5vu+p5DJx2TWNyQaMMNpVGp6NqTe3pENnx4zoFuyaCDcTOi4FHdr/Q7B6t/qPtsddhwvZAFlrUS8EuU6tMIleuwOC6440RJfgJm/uNbRIMTVR5PgNu7ivldoPteSugbP5DU4kJdo0cDs89Sqp5IqGtKiCDWBzsGTFgpLxNDKvJnn1L6IpfnHFLyIlVtz4LlGNFkiUc9M6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=aR1tHikLHEvQ904MnLi+jcntur3BPpcexCk4y3x3dZbk0grE7CaFJK0Y3AFdJMskUFSIJ0ib16udZLwWkpOvdasO6UCPJnAat04AqM1tOSY9k2euwT9Z9XsGMl35a3hUsu39M+OTlGzwUNSvacL9F0mkQWSgret5aQWQ9uc/UvRiwJRBsHubn3prGFwSHiqNU0aled/RG54rUWg2kdr/OiRVbL/OA1biM9d/WbB2GOKO0tLZV0mx0ON6n9w1WIBtBrqbqZbgPJHDllCwXA/XOuepMpecpki+ggr1qUVxK/JKMJJ0lwibLdEevho4w9icNmy49lQxW4OveRvF9oZ+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=Hu2xEtAcYO2i2EjzOBlS9jB6mUp9ckPkZVKvBAdWtrTYJHvZni0PxC0cCImzr0eS29emKJgkCHMS4Ut0vj5xfzrAQnKVHmDs4OD0G/I/ysKkmmQ1QC6QgOWo7I02QF3cKRFFeFf0kboAf12yo0zmJKWcdjuxrqY5VDi+1fKdyG1VK59jb6EsCQjlVX/7eI1wx+y4zkg6YZhfYhzdVuVV8FRl6LJPiNOF80zazuNi3229W3LG4PG6v0Ucr0OG1QUYgQuJ3m8KI6y23mBg9+hsq02oZ6QIaldvnkSKUjFiVtxkFEQsgfe3kOJOs1GjSrOzsuuGs2mdH3Bmlf1Re2bE/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:07 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:07 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 06/13] mm: Add helpers to create migration entries from struct pages
Date: Mon,  2 Feb 2026 22:36:35 +1100
Message-Id: <20260202113642.59295-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9c702c-4d13-4da5-e04e-08de624f6506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7v+f0yPnqv2DfAhAmSYHqt/LANvUM4bkxxO4fdYTzfRmzSXUNZOSFIFv7PAT?=
 =?us-ascii?Q?QTPgjze0BOL7sm/wsZpYz1uubyNmkKkXSDU9w1wVi2t4Z/2vgnM4CoWfjv+8?=
 =?us-ascii?Q?FqhVQnhcbH9QxSZ8jAz7VzCGtZA6p9k56Xi7UtwR/yHoW6mOrcdJgXfRgaeQ?=
 =?us-ascii?Q?D0xdfTSr1L7LAh6ezcdhjLk4WfZ0arHw1adJvrnjJEkFr69jdUmNwBA4NBIG?=
 =?us-ascii?Q?hp7td3R7wZ63BrjwfbrEmTGV45IynWYMmjr2+9aIdTIeXHETGlwrmbYpgt+4?=
 =?us-ascii?Q?3ZJ1+1fX3Jka007n77ODr0fur4v6tdK9R430n3RIUMgHN4Gdm3fVJCFN6WJx?=
 =?us-ascii?Q?ys6A0P7QlTYBGIyd3VWjzrhXxD1rGwb+s/FfGJTAdLc0RgHHa31f2gKrr1Fz?=
 =?us-ascii?Q?9vk3TsiPM4qybf0bA8oqIq0PBjDkH1L5C6JzeHzicSPxM2Je7zwtITlZ/yby?=
 =?us-ascii?Q?Cjw9s90ZlR1QMQh58qPw+r0ARPGQl+EYjt1Uf83WjVKg6i+mkDPsNVcsgTcE?=
 =?us-ascii?Q?IrUQZ3FBV+i8ueqKnjuI7drsbMaYtFhTBQOl28+n7t7fdX8HPtkMYLqEE/G6?=
 =?us-ascii?Q?XfAm/JeOMjokgp06arUdZm9NpkSXZgP6c+6EpHq6ooI+GtH/PxCNJJW77Hw/?=
 =?us-ascii?Q?iXMdvCDlBHUlgXuegjmwyVKqNxTUhH9i8CfylSCDrZwTB/iRMG812wNIfkTx?=
 =?us-ascii?Q?fBYFf0jEaGS4XU1CaQd2YNfYzkslHfZ4KIJttWCqW8HH+2XMZteyIzbC9pc2?=
 =?us-ascii?Q?iSATqd0sIrbCbHurX18z32PnKX2WM/uIFC+C/OG/IMqKQ9/LtmHRM/3EDL0r?=
 =?us-ascii?Q?IBXNN5AU1EZYP3muTgl6KH4e+P1izzDhLPPzJOMzGSXpKeDa08vVPW5APnC/?=
 =?us-ascii?Q?mJr6wEuKZZYK2ThBID3/JTcfpTfCgRvUVakDe1A1lxFx4fyPR9iYjFFj2etM?=
 =?us-ascii?Q?o28NmMnDSAVaObgTEzY8KHi0K75S7evsrm3b/g+C6YE0vODmczvsY2q30Puc?=
 =?us-ascii?Q?h29rI0oLvSW6Q2A5q82MZIgy+w2AlLMRecg9fRchfgKaFH1DzDPXhhJtP9QQ?=
 =?us-ascii?Q?WNt4hTu0yKfWWJYuGe7/17GKMf5k7zYJjLQkMCRdZDs3pPiG7pjAaIL/CG4c?=
 =?us-ascii?Q?qoZFWZv0Sm8q8IEbVuZoTmnoLJ6kniwmrBQfEq4uyyyDrWL5D9fwAv9MiMzc?=
 =?us-ascii?Q?u9fV7KaboR4B5nn6kZxMP7w3yCmoJqlOF+ih9nhFgOMrOHkOr3SwOcAdGP47?=
 =?us-ascii?Q?tUvU1BLO4lO0wvFVr3+RBLoWM/yMyoPrIURn9v75xUtL0KkLtQtC0SEyvsQj?=
 =?us-ascii?Q?nck8BQ45u+v+t4HCDe68b3kTW9vnekdcd6tSgaLDn0v0Ks9o+px8ODP/uOXC?=
 =?us-ascii?Q?b9AG+D8cLGNJ2M/o6ixZrKiDTY8oIuxYWGSRHuMfb141rSwPNrAtClXgH5Gp?=
 =?us-ascii?Q?1g6bL/m74uPIkU4PlGm5S5QFrzslBL4RF5YrobcopMKDwRGffCj299DCSscr?=
 =?us-ascii?Q?4TWG5xI7mAepZ997BxGzRlPRnuJHLAXKwJCAxffDF5YtD6QnTEc+bc0SAJ6g?=
 =?us-ascii?Q?ZbxpDzWY/58Iv/MROAM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?51mmAc0fnRQwipHglfgdeMgxqyP7+NUXVgiEFE/jCEf93oUNfCbTcHomfLMI?=
 =?us-ascii?Q?c66MFXoaqTlPx/w6Cq0nKFpMUqR1jmmSGbF8Bns4RnyofAvE2fsJ/OW/XRnd?=
 =?us-ascii?Q?H99VVL5/udoD2mKszzQAOlzD9WEsvbhL26rRKajRKZWMfsZYQ48352sn94Wb?=
 =?us-ascii?Q?ZVACFZEYgB7cAOmM/ps+nMyehtpkv0cB/WEDcQJCvvEg+MKAiQFYsMuHyda5?=
 =?us-ascii?Q?bIB5gKSvAWMVLP9lJPdYG2RwuAxWVunhOS8nPW+N7uDR2KgCja81bHf5JGNy?=
 =?us-ascii?Q?tQkT5q+jZENdXRrwSSA3lx93bszNUIIa3sPdgadwaFmKGSHWMAN7sA2aest2?=
 =?us-ascii?Q?Gm7C3VyJcMdfF8fh5szCwDr53FuHN+JY3p2z62wUtTT5Unp1qW6xstVYMA/r?=
 =?us-ascii?Q?fjvh1Yjo29hMIB40ZeEaduk5UuH3Vdjj6NIWkcxpBJNlMdq2xtFFad435X0z?=
 =?us-ascii?Q?k7Je++SgZHHog952e5y3a1z1hECpatvyU+92n7AsV/B84gs5EB9USj1ZnuBA?=
 =?us-ascii?Q?WbHzADWlwlCtpUWN6gDWtKKMHh3sqFsMj1LyzselrdmHP9q/pqM7cYNESYnH?=
 =?us-ascii?Q?JCajqG5tKx4c4hlmMhFTNr2KxFnbMPDTKEcPYg9/osnc8G1BmzzrjOqQlrvE?=
 =?us-ascii?Q?8aCCg6xOgyw4gYKXmEMBHDWh8GUPteMrcC4Coj9MoTlXg9AGPGQlN2gz7B0m?=
 =?us-ascii?Q?VmSFmoCezVDLeJz0yymN+q0/UTohmMNN6yFL7OZZ7CGHRyUzp4ri1k8vf9uu?=
 =?us-ascii?Q?1VfkUqNa4ReGCG5y3gntYNB4HiXhAKXPDVYFAyzP9JmH5qI7cufxluBAk13s?=
 =?us-ascii?Q?agI5F82EhmLvM2oRDBmRc5ztBoLFBJFeo8dw0ZoJ+zOIjh2PGvrxgbVRkxcm?=
 =?us-ascii?Q?SDapB+CitYm+yDW0Ve4ZytJpip7+MXPZrwSlTDdv8AwIGqYV8x8qSFzPoUg4?=
 =?us-ascii?Q?TE4OIe3sL5xFYhotgpcxMXTOrkNyV2bAynXBiqj38d2E8cxlltMMynQ6e1F1?=
 =?us-ascii?Q?l/uck/MTgwfEnFSPFDyAuN53x3wpWA6eqIdo3qF7YNT4QFKxTNpXdney4ZhG?=
 =?us-ascii?Q?UuQZSomnrgRPidPRL/J4NbDLtBF9hEZpV7JMPH1iPbWd0SLAaMVv5cPftTbk?=
 =?us-ascii?Q?Y0vsGfp5LbyDNosh/9NcRnO3U+hO5UJSNXR0wVzkLTPYmbDGmhPXMvTqJKSI?=
 =?us-ascii?Q?C3CwGfXiOS51tOJxmWkBTiF0ZL3eKRiYIpD2V57J+sXjLd17La0s/Y3Fhvx/?=
 =?us-ascii?Q?pwZB9sKEaWDtC97vz2AIFPFnE+nczfaZ7Lci4UrGwNIxeVVC5lBhnAgmtyHA?=
 =?us-ascii?Q?lj3GATZyFM/SxGRS9q39CKJxS4EbCBvwcIwhwAXih5NFS6tOif00ArKvi4UD?=
 =?us-ascii?Q?wjBUDicT3uG+O5+43bBz+ZVDOVOJHYgJXMkj3aVKEwApBq2//DU+aVLbWeNP?=
 =?us-ascii?Q?4URnZx14ym2qHhpnG8UHAtESWi8vYmb74hSWWqD3ZYARTkWHmCHQSTa88bsf?=
 =?us-ascii?Q?V2njxd/HUVu6lXsvzkFQiG5P/9XieHxFnGUOEqye4aXNnH5jhTJcAwXUhwoB?=
 =?us-ascii?Q?m53iW8NQoxMNKJa6b+hfmL1LZLNG4m4GUMW0i8bvDzZmwJADO4zgzMqYxbbD?=
 =?us-ascii?Q?VBy/gWbJ5fxAepJ1UFiRobFvEa/tiMfqQjCI77DJCiGJLfVsqoQhbPt6Twdd?=
 =?us-ascii?Q?dAix5Rn+rMfJm4XGx1GPaSWjPH930ECdCLryy5lYGAQ3V0ho1X4WfjzSd/2y?=
 =?us-ascii?Q?L2ojNUJYlQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9c702c-4d13-4da5-e04e-08de624f6506
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:07.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzS3SiYbWECs/04m8ZecUWUo2nQ/b+3JVA1GMHebwGj55BfEXMzU8DPbN57eYNgfGA9uUtelH6ahvJ6RMbKbzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16513-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 064A2CBC9F
X-Rspamd-Action: no action

To create a new migration entry for a given struct page, that page is
first converted to its pfn, before passing the pfn to
make_readable_migration_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

  - make_readable_migration_entry_from_page()
  - make_readable_exclusive_migration_entry_from_page()
  - make_writable_migration_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flags param
v3:
  - No change
v4:
  - s/make_writeable_migration_entry_from_page/make_writable_migration_entry_from_page/
    for the !CONFIG_MIGRATION case
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 34 ++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 96 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index a9ff94b744f2..52a1af3eb954 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..c1d3c0e8981b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,34 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +240,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1832da0f623..a2f9ac8a3177 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4955,8 +4955,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6491,11 +6492,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..349f360d82b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7fa976b7fb5a..79cba3d441c3 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2536,14 +2536,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


