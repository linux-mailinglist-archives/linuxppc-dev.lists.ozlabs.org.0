Return-Path: <linuxppc-dev+bounces-16192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOxbFgUUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37E70E17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7DN755Lz3bkq;
	Fri, 23 Jan 2026 17:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149428;
	cv=pass; b=MCtZlmPbkyh5DVxZz6RuQUX4pP2Ld5wGQlLVQNfGB6bR2dDWaYW/MCAaF0YsYa2clm6b1wKVMslDP8KdgPVjfEg/XiWItqsn8GAX8qS4kQ1fAVnsw1GdCZbF3ryXzJe0PCiciImmiPSxJYT3BY9QRisQXNi5HCW7szVMgoSgJbgleDvlZy5MZ1DbhU1WB3JQBl0YJFfTvfloDExo8HGbc+K2gEyAFldJ4BFniDts+50Ig/avYDAxAvu38+xNlhkWOBo9WXq9vjM6MpGz54/sDnQdEXkSO7hCZhZ+chrKuPecKOlUTArzi5wbIMzrnqQKO87NvGejDPqisAtTLHLFsw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149428; c=relaxed/relaxed;
	bh=Zq9yB2Q75T6ev+UeG+NXPCq89M8WhkWOdV6RX7Ks4CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZ5d3KhBgujxxNLSOIDrWd4xiwdA/QuREha/+VEXp55MWqJ1a9y997n1n7lypcUMbT/C4y/odBCF/1/NIfg1Xkgh7jv+WdlN3zYpheRC92lq8JL1iJwTfo1JCRMbyUsGFmhz6+QC1cfUg9NzKRLWKCAXuZKC2Aqxu5VPl97UtbZ1u6XQcY6BHXhOkR8Cxwl7qs8p/qgVqhT4WxCNextGBIHQ4fS0iKTMexNKQtut/JPNlUB42GNoK/dEuV/in7dqNOffc7fAwmhZp0XDfSpdgb+AXlDHqKm2861XoeRj221OEmWXU4mNjOqsB5hyqGQ2O47FRtnipRTy1awQSoIjZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bqA2euvm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bqA2euvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7DM59fzz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:23:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQeVW421tL7PeJZKYATIyO0ESAKOcoz55rOh+EyyIlxWqLnMjPdC61VklpnFuflckUqsZaLeOp7tpjeSG2nKAP9TeXGrn0lXpoQWwK453/CcuB9kZXVIGMJG/0k5DsJ1WDsT5PulW3d/7cdLv6E8TaZW+Zp6LWyWPCvy/3eCuz05vFP9JaN18xeIfrm39tL9o0rktOsiz9rIq/GAtnd007jusFIC6xJlTRlArrZcpI9bdDYlR2lUdrTdQkdAuGB51zMeQwOVy62VeCE1ID0bd7d2NUq4f0IxWJNKXZIRnHQV0X0Y4evfHj/ww/Jv8Z7T3o7hXKkORKBwsn1GUIxQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq9yB2Q75T6ev+UeG+NXPCq89M8WhkWOdV6RX7Ks4CU=;
 b=CSxJisUhsmzVyMRQ9z93fJ6hlQE23b5o16VHtOO/WpQoBE4epggJ1JQ8rWUGZqTIHoJ1w7HDC2ey03NKNi+L+HbqxZH9HuZudzeW20NhPqifzm1ONQV8RuioZKEIR8Coi41CSp9jeogCPep48LxKZeMHfKzOaMUkBKH2ThxbvYY0HZjWDbAyuEbnpSrWQ9J77wFmgbMu8w3yXM9c9TA5T9sW/Q7wvaANghcr5ATUcDca1i/SttXkBdZ6XlmBs7yliPtqmu+TqocV1sy4x1cuA/qyTCBh5iyYn3aEsKK770LAsUqc3QM69/gqPeD/dZpzP3v5ZdseLPYta3gCzC79gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq9yB2Q75T6ev+UeG+NXPCq89M8WhkWOdV6RX7Ks4CU=;
 b=bqA2euvmt+WbIHdRQJ7Nw1poZwmiYHJaY+TrzGOYE7SE5NasYUl51EM3gw5EIde6WaU/F/VqdAua9cxzB2e+TgwwWZPwcTu6qDwhgxjv2v2c4qo1+6Nk3mjIJgWi97jyWZ6of5NTc9Dp5EJfQo8Zo9xsru/5Iuh3x8AN1VZZ18lnGR40gb9GGQ3mK68Q1Usvy9M4lUqTCi6hwGjytRnocLhX9XNBhb51Y9RH6Ge8vEdOKi/N/SBjRO/NnOqwsWPpoAmmfa/X9W6/WneCnEuI1B7r9yNYjOFYPNYSo3d85eCAYsDI/wmKpwy0xSc+o1D/pwwHNkF8trdJJ7UUMs8Xfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:35 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:34 +0000
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
	jhubbard@nvidia.com
Subject: [PATCH v3 02/13] drm/amdkfd: Use migrate pfns internally
Date: Fri, 23 Jan 2026 17:22:58 +1100
Message-Id: <20260123062309.23090-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: e8985c26-9fa8-49b7-ff02-08de5a47ee8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DafanmMlP/3xN6ecIdmkKxg+vhlZM7g52HHH2+cV9igtChbFsHDW3D5wLg9S?=
 =?us-ascii?Q?7d73Eb4448W2Sj7gKDEZvkDyYxVkqtB9OyjGc6w6E56gfwHwD85XI1WGCOTF?=
 =?us-ascii?Q?/GYwoIk+ybeitGTK/mfmRvgmkp11CJSVldCZuszbtVdynCk42iKrcv2WjpWy?=
 =?us-ascii?Q?70j0+sAmHPa7ktLqiISbnAmK3r2p6o2rWXmparxlpreYu/FK5uCB7lQsns7k?=
 =?us-ascii?Q?fTR2ZplXvlYrUz3zG9B3kb6MGeL6GZZJrT7BAcurVnIR70uwCItOUrol/oNJ?=
 =?us-ascii?Q?48B+MyQ8hPiPu4fqz/nYlZiN/TOODnJo9VJlTuhekxoeGv+5IoaOKJzWyCAC?=
 =?us-ascii?Q?bmvGuZQ/Tzm6GUuRT4XUNSM0DeRmAIVscZBRgL4N77kYXAsJpisjuN5LT98G?=
 =?us-ascii?Q?86aGjboM60hxhvX1WQI+OPZL438eXgVvF0HuAJWnJMswZzSIGmCYvfR/2QkV?=
 =?us-ascii?Q?qhw0wKJC9Tz8DORuw37EPiEEB1QuNmEAiMG9KFMn/DoLdMIx4vwz7slJrUsg?=
 =?us-ascii?Q?Gskmn7lHNhX7+rNiskaKrVH3ojFYti3Bwdxm81aVQmhk/c4nzGlwwV9lbQcQ?=
 =?us-ascii?Q?2P+f5FGc//9e7WCsN4Zd2jFYH3it/8/yDAFU5C4mM+wAhjASA4d3aROHKzqz?=
 =?us-ascii?Q?6c5bofjI4zCUJn38UttIJ2ARdfHfGxo/VKXVkWBUa8xbJ89ge3d0P05qRAOJ?=
 =?us-ascii?Q?T2RbXkUBunzsrNWrrztW7FAoF1SeOz/KpSRNQ5mGGskArp3JFhn4z09CNonP?=
 =?us-ascii?Q?QFwOQul4gelRzL/SCqy7dPd1maede8UCwkyKVVMENd2nm6GI3yimuZi2GzdI?=
 =?us-ascii?Q?MGKFZ6kENis2LUr8w1fWOATBp/pXMkgLJwhee0WddNSFlLotsf2nBIQi6khd?=
 =?us-ascii?Q?EV54XQud+nt193ujcNFtj2C4H/eM3VKzJMHQpj4Hrfg/3ItlcdoPKQYEkraV?=
 =?us-ascii?Q?EdnQUvf9n91bxvimd5LFKbqzLVSFNxVw9X1AlQHYM6LGOx+FtDerWmCxb5Lg?=
 =?us-ascii?Q?+ledBgXO+jzsciTd0sAnUhp8GB/s3sGobQjxtvpFq0XRFzgUd1NlKIzVJ+LT?=
 =?us-ascii?Q?635x4z9ox8XBJuwwccBMt495W5rAXGoAOBveywc4Rk/5UiQ+2xzM4BRYGJyP?=
 =?us-ascii?Q?YD8dlQxrR1/LrxwKMTB17KSKbCUeE0et/vftoZAJr3FhaEh2rmkOJ2lXyQLR?=
 =?us-ascii?Q?kAhmxu0R1VAHJ/nbLnkwMb1yxpjPu7yL1efB33N7muwgQwyQmXbDYjK42Pj4?=
 =?us-ascii?Q?Uyb7uKxujknqHkkFyH91wthzVP40id7MRtdOlZ5dFtiA5L7ZKgAfUDEmIOuq?=
 =?us-ascii?Q?nOM8fxwZMm+hkqW9UhOdmloPpvBOmL2GPJv9Ude+2njeELLS0zgDnqtBol1b?=
 =?us-ascii?Q?fHEtYVtU90wvuAS7jZ1IzZxTwWHgwnLdkS5YWRdnSsTqfg0doJtUnBxGcSo7?=
 =?us-ascii?Q?KQHw9DujCj3mXVHHnXcwH5pKJ4IngxJWfdG2I7nnF7wWqqQOK8eq53rsWhRq?=
 =?us-ascii?Q?wo1upst23ki02q7N3gTm40Tq/DWmBQBm/1373v9krNXzwMuQIH0deN7mLQHG?=
 =?us-ascii?Q?pd8Xul9Z36QGYW18IqQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?reCnNCM7U2YAVA08zyvRiA5nqCDjdtyHmsQFDgqYuELFax3A1uTuKB/Yz841?=
 =?us-ascii?Q?meyqEhqZzLbDZwylLgwTGoom4j+F2Xdl6nzyvgjnu+JHzNHgEVuv/iGuMCst?=
 =?us-ascii?Q?VAU/l/jssHDtwp57xKgP6JBXaVDsNmsszw92Iv2xn9FIeAIfYSBetiNW+qC7?=
 =?us-ascii?Q?GXoZSGDOGDHvnvO+MFtO9REvUld+1rJwaXGNHdnxwVdA3Xh717bZN3Tc02Ja?=
 =?us-ascii?Q?3OVIATjksupOF13dZhYficdapVnaES4frVZXt5BEYyc/F6VJL49quJj+J0mV?=
 =?us-ascii?Q?SbIO/4Ahgxu9LYOZfbJtn6R9SBWtsp58GUn26hW6gewOafMnDBf5wrB2AemP?=
 =?us-ascii?Q?nKGbBvPb7aL6jrqMtWLN4ojM6ZqL3x9fDKEvi3RLfHO6ep3Bg/0xGet5iK16?=
 =?us-ascii?Q?deZ5uyhgyYo54MI9ydjJJQa+03rcqN8hKmwX0jrQ64JM4lvTVHRc93embKPW?=
 =?us-ascii?Q?+P+55tpDPllsprydSmFOh/M+ufL63o2Ke0lGx5RKTVjn7oX06zVzRGNyzUjt?=
 =?us-ascii?Q?aMWZteDBaTrTRmyXh/GD2nICsiLdoltWBKuPJV7FdoZqG4rxM5luW4bxpsHF?=
 =?us-ascii?Q?A+ml2d+cyYG/7sirpdryOv+064JmRwXEevr4rcjZJW41yfPSXJQG0IIeab2p?=
 =?us-ascii?Q?xxEAFy8KuJYC7qW7hW9/LAhVCVrTAQvMys2GdNX/N6w1VF5M0uw3nmPNYdXh?=
 =?us-ascii?Q?miPqU06csODvCRDKYxe4Dt/9cFVgE/C9ZoO5PpTy7wSfJsdV+JGts90O4LVr?=
 =?us-ascii?Q?tcAeQLNZQakT+fu9Os4k/0AKJYDdKlZDa5J3ExVIdXbmtc87TC+ADKgfz79E?=
 =?us-ascii?Q?ZsTQ3IuPmw4d2NGDxA7XNe3zaz1L9ARRuxhh/KGliPjIXbeGbVn040RgPt6j?=
 =?us-ascii?Q?jiVYucl4jjpCQTD4vSsF32bmObuvjgY2q0oI/dobtnpj74KJnKDZK7FHZgUn?=
 =?us-ascii?Q?65mD6CKfqfzrOCufpYlxlTxcSZH1testlJNScCJGFyafUWdbdOCIreVe2ugg?=
 =?us-ascii?Q?YL2O9/dC6eURyfUzmeCF5uLZioWnkeS9/47s/oiYnK0Zie/bs1aktqNatrm+?=
 =?us-ascii?Q?4Lic3mbPaYqlpe4yFppSCXeAAW5iIptPqNs+zkl+K7YcG1USsFgPSqzw8VAr?=
 =?us-ascii?Q?NcbxPRAf6HP7Ewo8SC4Fw4JDV9gX4eIeXTYeiipEKq/7U2bKeZyJ9Kz8UYuf?=
 =?us-ascii?Q?Xr5VJTsyVszhSSDtfBlVJyQb8jCFmD3CpYiF/fd+vfkjqcKK8QUYiOZm0x+b?=
 =?us-ascii?Q?Cry75UHnBPV4kJqFdM4V4IFKuBgghweQXf9NQRQoLVK0vKGha2eXys0gOlF3?=
 =?us-ascii?Q?ivO1nBiOdxUrTBQVkKW9f9JRxLcRB/ljqXUQMHr/F+8qjS7cLUp/z36UH4Hi?=
 =?us-ascii?Q?tgvahgmlG+4d5YFDxa7ilgORwqemQ0NmR/IT52LKmF3dwMDv0wYifezoc/f4?=
 =?us-ascii?Q?Y7krp7xy9bKr+oii+cwapztJFB5f/uY7uUbWVlGIj0qBLs6zkIsRKHn7wjph?=
 =?us-ascii?Q?YOMmsZfO+YOIsRk+p9gp/ylCbm/aypfhEgP01O01UU/MNLIELRoxyXbumwU+?=
 =?us-ascii?Q?tS3bYPN+dmCkAtM0N6TrUvFQO5n1CeDqI7e5Hk1trDUgS1hfXNUTcJ+waBF3?=
 =?us-ascii?Q?RPxScIYxxpaUJGZBT5dGhNgkwQPh8TT9p9j091+LSKexO+W+YTg8OSP93Twf?=
 =?us-ascii?Q?kOpZbpEGJii/HeLVQ3/EbrXTMjpHS7K/rsdPHvoHx5F+2vX4dBtDQfuSs0JY?=
 =?us-ascii?Q?Rxs0fOfT1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8985c26-9fa8-49b7-ff02-08de5a47ee8c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:34.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tpjp4Q71JAYxZsmXjN+04LNjDLKYu1+tmygAAW8QAhaQ0/wUivLDXe8bk2T6QsvxvQBEbLhwGCh7ee/zwwYung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16192-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.161];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BE37E70E17
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() with mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
v3:
  - No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1f03cf7342a5..3dd7a35d19f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, 0);
@@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1


