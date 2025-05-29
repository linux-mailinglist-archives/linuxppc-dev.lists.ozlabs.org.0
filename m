Return-Path: <linuxppc-dev+bounces-8996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F76AC78CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 08:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7Gl63cvvz2ygH;
	Thu, 29 May 2025 16:32:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748500370;
	cv=pass; b=m8GToEj/kYi+9L6TE8oUk7JpKCucJWO8axdIEHHouvEd7xLC3T+LNo+baNmx1g4qKXeu2aaIb9j8eaFQVwDNqph9enGSlTFsqDaUHdkUNaM6U+J/H3Tm0J7xI6pgMBe5N1JL1VerU3fLOTRG3hN8Rzj6M5+I08HDnR0bPqJ+GVe/9wB+bHmjQG8I3YFKtqkbMKPB/YmoorxBq2FxiOmz91WzdER1x6INY0JK1/Z7SM5H6+++t62h4qle0QrXJgyphXSkYrFNNmWT5k98sX/qtIdPU0cbzylYrT7nAr7DAOZ5n4pDhm7/91h0+bhT/ZllDHclKICG9bUKuSXF4LZkzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748500370; c=relaxed/relaxed;
	bh=3efWzzR4zkoRet3n6dNXIHdogi1hlv6gfJDMKneEdcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a6/Y1WQ+xREyw8hhSiFYox3WtzgSkgVAKw7f7pjh3uTLusmOfAVj+0KLUCq09VTYZ7Ff9cTMHLnR37ThmpcQcuSGnEuLOfLDT1gGymnedu5YqeLiKqjQP7J5al62l5+tTRKIK1TvfgK6zHxFyRFR2f4nrH6qNnI9qrLCf+zP1OFvm0NxMFkQgwjUB2bMGAyGO1HGucP5d5v+vcJIchti5uSDbC/CuF8LFKTMoE/BLtJ1X1LI9Chdtwr+lmgW+lvBMkMBhIjumpYQ2AIDfmWL97dqV6cT+oTx0R7vt/xAtbrd/JXnsnw9i81x62pC87DDNpYXBmQYAo+oZ2jvX6o77g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eHWtxA1W; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eHWtxA1W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Gl56226z2ygf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:32:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLBOxSeSKbyEQUvp+ADzocfaDE9hpE8+gON7PwYy/153VI0pj+tHwi5uS/f2gchjG9jXaadJrUYKteKTDEUXGfYL6jNCs9hhHi4HYhxvt66cmmxPR/Zl0+SakSPklWWX8mnpxKii0IuOIqtK9ZeFD4K9aodfmrTHzlZ3g6HyIr/dXNLgnzyhNX5786aW8HnGj550OPAR+HqvUwKrWPJTx6DSBv2UkQR7l5liXrzmvOZ565JnA57lPkiAqiW6PILCdo/7MHZTXLOnt9p/aC3WsxPNqBJFyhQdVrgz5pKyOrbKKujmCM3nrjecVQYJ7AixKQdzDJwZAVj60ayAmHaWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3efWzzR4zkoRet3n6dNXIHdogi1hlv6gfJDMKneEdcQ=;
 b=I/7Y+QY1JbB/FqWfr5pttTK2/3+QKyPZrECb/qjYHL78XsDYeh00O3AFvvLF0XFAXLGUqN0nj3/Fln0/Al1XclsfKgJ8ImWQkcgf7Yhs6q5xNaCqOHj3wbtV5pkpweK0JgiO9ia0wWwL3oMGQkXO28+TIMnIN5fh7LJj1mtMyy4Bv2Vg+hyPzQo7KHkKRdX/QqErYzZdlorDXkXGeQVXoEKXgZpB7G0LwwZQUo+Mt/l0HAodjDlCoYn21mmSNM+TiJNLuG6wEXhTxfH0kTAzjZJaJKYhxYt52TtkhSA2/3mFvS3uUckSQ/TUKVnWVbjs+Ddn2HuKwgKXOCKYMIVLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3efWzzR4zkoRet3n6dNXIHdogi1hlv6gfJDMKneEdcQ=;
 b=eHWtxA1WeO3FiKIJALKgeu9bS1Io2kMrYUC26xNydyG0IjUtzDc7s7ycjz3S02i7Bkk9p9bfO6/ziso2/KdLMC5ceDAEbyGgcRWFgQS6I+Erl3H/3eukbSw9S623wbdopsKTyJOknu+y3j1SVl+MjqdsxrgUhKbdHjNEIWlCRaYM2fqaV3dkyDdhkBfVq6PrT61ugjFd7nXkDwb6bBray5qlHnV7jC6J/bhZBeBobWPOP6dkGI2w78sFsBRmXByYZKZy78PKLsU7w9dsd0GZYeqlJKuRxt1dGqzGuLsN15xl7TJ1MNmRFXEK4kmgoptGDWau0yBP/zaV/Qf1QBXAeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:32:45 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:32:45 +0000
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
Subject: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Date: Thu, 29 May 2025 16:32:06 +1000
Message-ID: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0214.ausprd01.prod.outlook.com
 (2603:10c6:10:16::34) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3d40f371-78d0-4dec-50e9-08dd9e7a9f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5XrCIrt/08cbQ3sEOpjludcoBAC52ulptJiS4j3bv5xCnf70v+xzw/xZQyTt?=
 =?us-ascii?Q?OegIZdDUOkp+XGEVgxRpCF4/c2gwCdA2BnQ0KuqusaB86m9U7SQ3gLCTbGfu?=
 =?us-ascii?Q?dwQ425pyAu8B91EFC+vTbv9XZOpje5RV7mE9p8fKI5uMOQ5RHB279Z/5WOgD?=
 =?us-ascii?Q?NlVrTc2hCnVhxRg33fSVe5S/CIpzzmpSf0NqGRVIcUqGOERyuicyx72QrsAd?=
 =?us-ascii?Q?DiT7hg5aBbtAqs40N5C2Ox+hxd+duIJTIjFVOJqy/nqy59c5yWm8lCYABIgZ?=
 =?us-ascii?Q?2y8tuvhyh09RcyNcgcyfNhBMji+HnmwFvWhgfwhBsvQfQ0Gh1BdOzbngNAeB?=
 =?us-ascii?Q?AlA0twzrAx2NAV6euCRZKmDnNXBZqRC1Fn3/ek3sZ7neoBIJRb5x8OtqlJSF?=
 =?us-ascii?Q?cMMKTpSuUNDr4fiwMgeCbwRdrTnFj5JA97+CHFI75zfEcHO8t7lTjDuAKJDL?=
 =?us-ascii?Q?nRZoqImRZmfGO6C5OasNO0CvGIFjUNZCqskjAr1JGIR4q45sMNrLYa153/xs?=
 =?us-ascii?Q?URcaWTp1VW1Y8r6esBkiMR7/76v2oCwB1gv4fwkYd24D2kyWtkp6D8oDnndh?=
 =?us-ascii?Q?DN2wBtYKxk8bQ0+w+qGub0IdJ7gnAmASjxTfD+i89qDPMLGrouoHGe2ZxWTy?=
 =?us-ascii?Q?QyeqF/OEniLWt1BYaExRCabWxFccBMP0m37DGkKLx11EYlbM19zHLrgpT4Y/?=
 =?us-ascii?Q?KNFEb/OWwjdL8LaPC+SvUSaGLVfdLZBVR5W2O80er/PU6i4puLCjOJ27Czee?=
 =?us-ascii?Q?n2uWva6l9W1HrBc8ur+fsQi2bY3tM/kA3eRoL823NE5Ctprb0r/Q1+qlbElq?=
 =?us-ascii?Q?4OLpfX8QpRmtTrXoAOTKEcj8kArvg6CXw6K57o69b5NDV3akkJ2TXEr1vRA4?=
 =?us-ascii?Q?XUg+PPz0ERJpN+/edSwdvNvMd48rnZ9k+QGcgmsAvMWj9wbHGuP9WV4DgOZ1?=
 =?us-ascii?Q?cbfpApDSV+DuTsr1RqNKiP3rN8WMRTy7ZeKFleBNon+wvSv1kCitxZoE59rv?=
 =?us-ascii?Q?LOLnXD4asa4cOky6S0/w/soXnia1DBAzEMbxq4unUKuXfCtc4hDQvZVF3j6X?=
 =?us-ascii?Q?tGhM5oJdVlGt92okwGTWFsRG0xVDwBx3QOekpE6ckeqWHksxERo6rCcofE5K?=
 =?us-ascii?Q?340YUKPI8YL+WsfUpbazwG2h0i4P98HnnbhqX3lcXfAPlF89Wty7A5ESZQwE?=
 =?us-ascii?Q?WXkeaEfYTo/MhERRdWRPCUxKF23Mb2jfO7mAmdkdqBngq6EOeWA2aaxya6Hm?=
 =?us-ascii?Q?y08NafUzNrcRG6ieG9hoG7h63LdYqo1gB0vh+Y705C6HCyKIyN6KnYopEozE?=
 =?us-ascii?Q?KYDUalIUecfjULkjbiwvl4/hAr0dNCecqUOkAfnMqny4Q9aJGHG9/an758QV?=
 =?us-ascii?Q?VG7rOsPetN+GLczfZzMFhzcfRGf09q+R5E3pVj5c+LLX1RNT1SrizZNaoOt6?=
 =?us-ascii?Q?I61SvL0k2hc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84obnZ0NQkHquGAs9Ti9DFBo4UzmCIDwaAjF30EkoxSopG8LbxjADdPaALDb?=
 =?us-ascii?Q?8JlPCrrEhEGg7pFxrIy60OMvKo0TSMGdMuuxyYonPLq+g5xmnNVHolJBFMv+?=
 =?us-ascii?Q?AMNwOxswONsyHHBzikqeqfnVWVfR+jy/sqqKsXaH1F2DjfcdjhJQfrw1X7ml?=
 =?us-ascii?Q?J49E0+zegGM1b9ZNkIqjnNKpnfsXtc2quPe1Wf0dJwrEvpaXrzmtZq4aufse?=
 =?us-ascii?Q?DHUMzGAXmHw4u04TmkVMY50jCRjrkdTGBjQqmgFk4mgjAoP2VcWtSlks39X/?=
 =?us-ascii?Q?3Uuku+U9879oa1d2OsiWD4jRFciwXCN62O5yYPaJpxa3eYqhxDRrhO8fCojg?=
 =?us-ascii?Q?qa+9PnASBpZl2YnXvxLHMhSFI/jSwityE2RIqr6xuNrR8Y7IDewHohifhh+6?=
 =?us-ascii?Q?GqGPqLMtU7Awh6IR3XV+FLlTxuqvMswxWswYEEvnImmgAJPDCLThED+nmZPY?=
 =?us-ascii?Q?0jJYuBpgZ/bxE7duJl/BFFP4/tvgT3l9fT1sv/Vnr9LfRvBK3S+hwnrJFfY5?=
 =?us-ascii?Q?Bsj3skuqMN6uiWHyjeKysu77dMOUKnaPXiqp2zah0KmISSZi94C6N4GN+dTE?=
 =?us-ascii?Q?MHefvCR/Y/0VUaRdZMr9sH2DZvxhdi19++HagjLgv56c380G7F2tDbZ/KTMA?=
 =?us-ascii?Q?JTA38uugSgUjtKIceoc3zz+obyv9oJnowKVZ5xTCGr/2zb9sKYPOPvEI/QjQ?=
 =?us-ascii?Q?/niBN4x+jITeLzQWDiA5nbmhEPPucHaLZXHmPn4KY9JKtrFHEnWvI9kOpKtf?=
 =?us-ascii?Q?qpvA0a4pzNc9M7rrR1ge2OVytFDpRf9Jv1BiyTDtVsO5ArmtyzGjTzUZriXZ?=
 =?us-ascii?Q?QWNd2DuEuaI4ccLdmaIL840ptfg6xFyVhcQx4IzYA8gqrKpVDOd8i6O2wIj2?=
 =?us-ascii?Q?xJDEMIF9ABQUZuxCisCtZiuxnyYkQCnZYAQ+py55YV7fmw8inJBI10SeVRfU?=
 =?us-ascii?Q?B3PZXWTmIG5JcSD8oTo7w7pBLTPYRJT3NqAhVxUbxYhMFXm34g84NQQGUbYi?=
 =?us-ascii?Q?DimaJJlkZIv+aPh2Ral6DPn3rmJNz5y5eO1790Ih+vZQ5EWgM78E5WH71tvI?=
 =?us-ascii?Q?TSIA5xRbMfn3eBdskgl119LvRZavBT5ueDhp9xSM4gxLDYPz1Da9iDaRDMJ4?=
 =?us-ascii?Q?1tfaZ+qxeHX7wB6ibyMAHCa4hqunHsRr9zQ5vzFlAa3QD+LpQqAGwe5UMsLl?=
 =?us-ascii?Q?hkicMm0HAkZ+f4pwAXh180k4YUIau/vPnb8FO1C3KDxlmG0TvnsJqhh4HGVi?=
 =?us-ascii?Q?IZ//EWg7kMdc+adbO2+Si/9GK54Xf9FzKy94LDv9W9vF12wSgyl8UD2kA616?=
 =?us-ascii?Q?tyA+r2R25SlIqJq/2wQE00pH8fDNqaadOJpQBqxk5cWPKcQUG1ailPGZmi3N?=
 =?us-ascii?Q?xAWpA9PE4eVjTJQIJ/+je13qMTGkvE/DIedTrRnBnW9nzjjPqlqDZMOkYlj1?=
 =?us-ascii?Q?WbRwXUV3uFWOGS5AjrgfNxEkdDIFpM28UdAUkruhp5FwYJ0K88x8foVK6Al1?=
 =?us-ascii?Q?n3KzO4Uv9ff9dlKNrftx/QkHm3Fh5PFoThLX0WoCk3xVRn3cxwinPU7WcClV?=
 =?us-ascii?Q?V8wpiV8MHKBWunq7gSZAiaCZYhJDgar5e/xk2m+T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d40f371-78d0-4dec-50e9-08dd9e7a9f20
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:32:45.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE2SahGkhX3a89B4q/39Yr9T7bY8ZPiZi08bYIMehVAGv6hoO5A2re/f8bMZjisX4ZJU/zKXKuIvBpUmhCHLUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PFN_DEV was used by callers of dax_direct_access() to figure out if the
returned PFN is associated with a page using pfn_t_has_page() or
not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
assume a page exists.

Other users of PFN_DEV were setting it before calling
vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
relying on pfn_valid() to determine if there is an associated page or not.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/gma500/fbdev.c     |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
 drivers/s390/block/dcssblk.c       |  3 +--
 drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
 fs/cramfs/inode.c                  |  2 +-
 include/linux/pfn_t.h              | 25 ++-----------------------
 mm/memory.c                        |  4 ++--
 7 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 8edefea..109efdc 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -33,7 +33,7 @@ static vm_fault_t psb_fbdev_vm_fault(struct vm_fault *vmf)
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	for (i = 0; i < page_num; ++i) {
-		err = vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn, PFN_DEV));
+		err = vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn, 0));
 		if (unlikely(err & VM_FAULT_ERROR))
 			break;
 		address += PAGE_SIZE;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b9c67e4..9df05b2 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -371,8 +371,7 @@ static vm_fault_t omap_gem_fault_1d(struct drm_gem_object *obj,
 	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
 			pfn, pfn << PAGE_SHIFT);
 
-	return vmf_insert_mixed(vma, vmf->address,
-			__pfn_to_pfn_t(pfn, PFN_DEV));
+	return vmf_insert_mixed(vma, vmf->address, __pfn_to_pfn_t(pfn, 0));
 }
 
 /* Special handling for the case of faulting in 2d tiled buffers */
@@ -468,7 +467,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
 
 	for (i = n; i > 0; i--) {
 		ret = vmf_insert_mixed(vma,
-			vaddr, __pfn_to_pfn_t(pfn, PFN_DEV));
+			vaddr, __pfn_to_pfn_t(pfn, 0));
 		if (ret & VM_FAULT_ERROR)
 			break;
 		pfn += priv->usergart[fmt].stride_pfn;
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 7248e54..02d7a21 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -923,8 +923,7 @@ __dcssblk_direct_access(struct dcssblk_dev_info *dev_info, pgoff_t pgoff,
 	if (kaddr)
 		*kaddr = __va(dev_info->start + offset);
 	if (pfn)
-		*pfn = __pfn_to_pfn_t(PFN_DOWN(dev_info->start + offset),
-				      PFN_DEV);
+		*pfn = __pfn_to_pfn_t(PFN_DOWN(dev_info->start + offset), 0);
 
 	return (dev_sz - offset) / PAGE_SIZE;
 }
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 6328c3a..3f2ad5f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1669,14 +1669,12 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 		break;
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 	case PMD_ORDER:
-		ret = vmf_insert_pfn_pmd(vmf,
-					 __pfn_to_pfn_t(pfn, PFN_DEV), false);
+		ret = vmf_insert_pfn_pmd(vmf, __pfn_to_pfn_t(pfn, 0), false);
 		break;
 #endif
 #ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
 	case PUD_ORDER:
-		ret = vmf_insert_pfn_pud(vmf,
-					 __pfn_to_pfn_t(pfn, PFN_DEV), false);
+		ret = vmf_insert_pfn_pud(vmf, __pfn_to_pfn_t(pfn, 0), false);
 		break;
 #endif
 	default:
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index b84d174..820a664 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -412,7 +412,7 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 		for (i = 0; i < pages && !ret; i++) {
 			vm_fault_t vmf;
 			unsigned long off = i * PAGE_SIZE;
-			pfn_t pfn = phys_to_pfn_t(address + off, PFN_DEV);
+			pfn_t pfn = phys_to_pfn_t(address + off, 0);
 			vmf = vmf_insert_mixed(vma, vma->vm_start + off, pfn);
 			if (vmf & VM_FAULT_ERROR)
 				ret = vm_fault_to_errno(vmf, 0);
diff --git a/include/linux/pfn_t.h b/include/linux/pfn_t.h
index 46afa12..be8c174 100644
--- a/include/linux/pfn_t.h
+++ b/include/linux/pfn_t.h
@@ -8,10 +8,8 @@
  * PFN_DEV - pfn is not covered by system memmap by default
  */
 #define PFN_FLAGS_MASK (((u64) (~PAGE_MASK)) << (BITS_PER_LONG_LONG - PAGE_SHIFT))
-#define PFN_DEV (1ULL << (BITS_PER_LONG_LONG - 3))
 
-#define PFN_FLAGS_TRACE \
-	{ PFN_DEV,	"DEV" }
+#define PFN_FLAGS_TRACE { }
 
 static inline pfn_t __pfn_to_pfn_t(unsigned long pfn, u64 flags)
 {
@@ -33,7 +31,7 @@ static inline pfn_t phys_to_pfn_t(phys_addr_t addr, u64 flags)
 
 static inline bool pfn_t_has_page(pfn_t pfn)
 {
-	return (pfn.val & PFN_DEV) == 0;
+	return true;
 }
 
 static inline unsigned long pfn_t_to_pfn(pfn_t pfn)
@@ -84,23 +82,4 @@ static inline pud_t pfn_t_pud(pfn_t pfn, pgprot_t pgprot)
 #endif
 #endif
 
-#ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
-static inline bool pfn_t_devmap(pfn_t pfn)
-{
-	const u64 flags = PFN_DEV;
-
-	return (pfn.val & flags) == flags;
-}
-#else
-static inline bool pfn_t_devmap(pfn_t pfn)
-{
-	return false;
-}
-pte_t pte_mkdevmap(pte_t pte);
-pmd_t pmd_mkdevmap(pmd_t pmd);
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
-	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-pud_t pud_mkdevmap(pud_t pud);
-#endif
-#endif /* CONFIG_ARCH_HAS_PTE_DEVMAP */
 #endif /* _LINUX_PFN_T_H_ */
diff --git a/mm/memory.c b/mm/memory.c
index 1a0c813..7a9aaae 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2512,9 +2512,9 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 	if (!pfn_modify_allowed(pfn, pgprot))
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
+	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, 0));
 
-	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
+	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, 0), pgprot,
 			false);
 }
 EXPORT_SYMBOL(vmf_insert_pfn_prot);
-- 
git-series 0.9.1

