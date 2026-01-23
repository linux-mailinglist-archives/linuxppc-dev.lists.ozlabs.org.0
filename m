Return-Path: <linuxppc-dev+bounces-16197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF1vLCkUc2lksAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FD70EAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Dx4FQcz3cFw;
	Fri, 23 Jan 2026 17:24:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149457;
	cv=pass; b=OYFQ7J64IstMmVIXbDe56q1xTXNajgCEkYQNx+oDphidqNS2G171A1OZIGaP9BpXTLOe6EysMvzg+1nP2dGiY28E5iBTpe+chsiWt47aHBKPNtg5TryY/2aNBDCtbrzwOA+OvxQp7jBHjadDyGegtDD8HmB3GCsPQQBwXyJNqNxwCqFzlgJn0rjkjPEi63SRnRN2D10h/+8lc5nKzHF0U21kJFIAb56PCvtQIpq0paGajanRU4XKrUeveJfiKANg7/lRCglrx0q8OhHMROosQJecSLUgPyS76nxskjxRODn0KLVtx4tdpx0++EzPwc/Qr7tcyChfHBCGKfP6/lqQoA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149457; c=relaxed/relaxed;
	bh=ME3Zsw4WxxYj5k+L8A81RYvg4/TRZvXP0NaSpRQ39Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z6W0BEldNS4MkxmsOus3Qg9p8iHLfckB8TnBVkz1dwMwUcX3TIGF6YDB9X1RIoAJUHiwGLuGmBiJ/NeVSfuLIhYOAs8OcmrBo5GdKkpH1uQzQ1DRqJVCQ7Cu4H0NIS9f/Eb2/5ZO6kqIJWs8VeRIwCi8BS22HLBOlX/IuZwDGrF0yDsCOoHbTl4LJ8IkaQRj/Gm5Vn/VZop7QMFw+qVH9/pk1UzUBvWBIqGub//zYJ6pchgsMOYfclZ/DQAwiO+5vnFg4iR6NqQjr9NQR7Yrxwvtqsm2koW0TMVHVAXvE6mER3CwDdRFqjrD42CrFgBiFL+3qqfszqWsTW+QRBhaGw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uSnOeLoy; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uSnOeLoy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Dw6XJxz3cDV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvsypvc8nowcYKv7X8QJDoFjzjxSXVEQyqtNPgwPj63x8aTpPKGRHQnxLEmp3kFm5D1I15W0rhe+qnUQ4pCV2IE2fQImw+66xeZ91keDEVDhPqqhc+9AA5WSNKP868IUySdmoCyLLLklQF7G+R58tPjwwklMc1Nin4u1P32lWboZr4EsX68+PmszOZOxEuqZE8TgQ7RtcbjZOnwKMcJuWazkUtuOI1ifW7MdTiSGwVCKGmW+6ghJnFzWBOSWVn0eEJ+6UXI9u7/qwHHjUhl8FeojstijNWVDjg4GBEs8xTFZRzFnut668D/xFsexrLPOvrNRWgVoBLAWIgWOPtJK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME3Zsw4WxxYj5k+L8A81RYvg4/TRZvXP0NaSpRQ39Yo=;
 b=CtHZiYFTGybjJ1aE+LOI1OjTLI5VvduNAB705jSeAqXp/X2IlzdA5IoYOoPEM9Fr+epgxmynlVvf1XH0rfe9YXbHmQELd29QC4R86Dr7CGOs4ynS5vtFMbw1BDxSgqn0B3v77muSn5WShmKaLwme6srreL/kqrHPX75dY+W8E0yNaLFssApwRSVAT1XuKv9nOdGwvrI0CLF5p6KUh0vQys9D9f1ubfxB7Fke9Zw/bJlNTWw9Kv8lHq/PlpdHSUOIuOv0ilgzpOFR9NSoYYEEMIqGObZ/PEUfHG5QPP9leatSVytOXB/9PbrLQ5v2eAFqKbMAmrh4yqIf+WZFmvi+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME3Zsw4WxxYj5k+L8A81RYvg4/TRZvXP0NaSpRQ39Yo=;
 b=uSnOeLoyHIeMNF8wLuql6NfMA2x4QzUdRRr/6D7FBZ03JMkKHZUMRSvSPSXIR8jhVnqRTU9FObED1ZPnagNItheJKBHatGVSk0SNxtKq6hsqehMGX+39mItVjnDkJoXcjrhAxfg8vUzzAoTiFGMpPuerWhScHLEhsAYDEjfmbPzQzgYeX4z02cy8pHEg/NnOWZhY6Z2A6iPeeMu81pKAtHnJwAErptd+I/6xDxDj6NoTEeyeiD70nZ2Ic+knwSTOC34l7o0KXyx3jNzomxTaafwgtgFpUKqZRDd7TRgLlieBs4PGrtQsjCDeTud9WaI+OrmKnkNdoyStHNcieknzOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:24:11 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:24:11 +0000
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
Subject: [PATCH v3 07/13] mm: Add a new swap type for migration entries of device private pages
Date: Fri, 23 Jan 2026 17:23:03 +1100
Message-Id: <20260123062309.23090-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e7c84482-c884-4f6b-79d2-08de5a480540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQY70CwuLXA26sKJIH0rWWTPYOrT34Z+CnrIxLbnlTXbT+Ky5dxIRQrkig2Z?=
 =?us-ascii?Q?lVs0DC0IP2JI5iO34aAN08FvumxBeJCQFkT4F8bmWdBP+XITYNGAbwUx6r4Z?=
 =?us-ascii?Q?quCWjEgjn2qm1WKninVRdLnKGBnV9+eE33IrzP5rejhA60AWptVUptZa9RQ4?=
 =?us-ascii?Q?vr2u1MBNiSiMBlvKVKOrVbwXHqTnx6ylADeMfktNFDfU8rgWhn4T1T23kmhY?=
 =?us-ascii?Q?JacDylFkJ6SUACIBEnzmdXHDBIYhBCKIsw9v6eRleFRwfGPX48oyQHEVQeHo?=
 =?us-ascii?Q?KBHkiGhp3obW4WOkUujtJMnLKBLZk7oC1t/8+y3JB18Fpt1FsMo5nn/H2g2q?=
 =?us-ascii?Q?FNVOA9h2ODceqFWWGtEGx7x++ZAwPddZo+XJPqlRH2TSwvA7Dz506NSr35xA?=
 =?us-ascii?Q?/mGaoBATvNr2s1mY5/0/QR6XKqO4vw2V37gagWvvwV2n5jR8h384st3Y4GS+?=
 =?us-ascii?Q?pzajezNkzp8QLcGi0fwil2Zcp2iN+DtauO+/VIEGgXtXhoplsZ7AtUw6IRNO?=
 =?us-ascii?Q?s3kYEkTxcVY5Bfg2VfgITlFlYv4uIz3GWq+NIgZ3paUabCfceTm+cKmDt7Bm?=
 =?us-ascii?Q?RMVOPvbFGFbz8lgsN+/Uv8vjAozWtNy1M/mB0OVXzA7UQxogR+6w7WIK2sAt?=
 =?us-ascii?Q?StrzeRlUkL/k/ef7dOKZ/Akn60sG3tgfdoTVG/nDLCoI8TZK4K/TNMH0/8Ez?=
 =?us-ascii?Q?tO6QEDTHrIk6zwSb3DaxArSjhwlihxLIRXKUrBb7AgukxKrxXEbIJWDjR8so?=
 =?us-ascii?Q?7wnpSpCH04QLnooG7bpvytd/yBlRnvXog4IYNzCMa3GkfiJG8VBH13hJwyWL?=
 =?us-ascii?Q?T/ocqPD4JPUKaNE9NOk+SvWQ7NtjjRnxuE6FzJlTioLzuLC2WGyzhFNHu3dZ?=
 =?us-ascii?Q?i8Sea8mquL2eVvohSHcF5aYDG6i/87pu+EYkO2PViGnR2ukAghKmz/s1p2kA?=
 =?us-ascii?Q?xOei43QL1ZN0QmycrSmw1/5zY8LOrJNmduivYoE3fh6E9+sPn0gOuh45jgSJ?=
 =?us-ascii?Q?3JClyckVe7yM883AYXPvrJa9208sY1mDYJEOHtXst/ulCB5U9h9DOs/lvv3v?=
 =?us-ascii?Q?S6/bL5KUpGZ4fYaeQD4Q55qk+hT3PzXU6lIYS663QrNgcm4eHZRbUTwIem+k?=
 =?us-ascii?Q?m18nnpQWTHTVOjLabXbAl0YFkYGtRvQ03y+7Xt7nOVTRrRo+lLcZQgYlndXZ?=
 =?us-ascii?Q?m18XtBc963LKZVWPVrffRFjuODhfZMRbcKeAUDPwkMZVLKcZr7pjhVq/wUmr?=
 =?us-ascii?Q?it31/T9n69LN8CSINn2ouvLw2J6ApRZi1ZCtfbKSVzMvBJQZdjiHlcMAYxID?=
 =?us-ascii?Q?MxU3nr0uZpC1Hullh7TltO0ZsFoE/LBTD3C6ZOcDyf7MYDxx9ud4itNmpCYC?=
 =?us-ascii?Q?Xdo5sZlx0ZvWpRqSynkbE+B4ccjL090w5K91OsgLVGU/4UZK0fMI7T1DHaw/?=
 =?us-ascii?Q?HJYzCJjvMBzFGUW6lYX7BMsOBlfHX9zSEWRRZhlW9In3Ku++2O6UGIf1FECF?=
 =?us-ascii?Q?OEgCC4ykke36Dsgwzr4DK9BPSbqC1i8E8IAW9PCjUFSbDnuVLYtQnOcOSKuM?=
 =?us-ascii?Q?WdveSf+e8/HZe6rdVm4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FKN4UvSVOz8VehuvcKwsXCpVtTvUzUfDKAlroKFnAlSRcpzl09CKr5dcC+OZ?=
 =?us-ascii?Q?mWVrV43eBjcI/UmDCYietJ9XJ/FAhb+pv/WlmRpdLtqNM+oS8VkFvLyVWh+r?=
 =?us-ascii?Q?JW46W7mU2ymHp7OuF/e4k4K9aIb6wKYmCUnz/zRt/p5nhIyroZZGbHCrcnYj?=
 =?us-ascii?Q?DAcuMZFMcqfMLuTeTEo5/0KTXg3E3MiXG3ezQNEMD7eLYJlzriTW4Z90Bygz?=
 =?us-ascii?Q?EYOtLY4Ie2BQqD6q3jnqwZX4s1l77APEkP5UUt3z5vBTjs8zLA1gpZ5hpXwJ?=
 =?us-ascii?Q?CmKAH5087bfbntZeRnpxtu7Lsdy4eku8bsICucJjA79CoBM4ZN06G3SwBZw0?=
 =?us-ascii?Q?zLgxxJfSDdfS95Zn9wFu+3YjPkQKeclSa4tSm7EWjaqUzwrzmQh//KMaTMG5?=
 =?us-ascii?Q?kRmLp90LyAZdPvx18yOw18rChKsFAIpyzMmpa/S3kw75D875Wzrgbo7uo/s4?=
 =?us-ascii?Q?wMfg1jJmPZozWdLWJNDQs3NqAWVvqfpOZS8Fb5a1SghOCQLzZRybDwxRh/fk?=
 =?us-ascii?Q?f472tP0k/1iJn1hnzTtqxr4PvvVvcHM9OcJw+IsG8JOcZN+UTmvJcw0SjbzM?=
 =?us-ascii?Q?ThUeQ9+Ngvf+vYmv/qWZbh6SIYsXzTVSRBhWcMeXzY3t4BRlHS5EQ8jH/N6y?=
 =?us-ascii?Q?zHbZD5ULdg3L0hoso+9gcu49JihlDL2qaU4C3XAtg+anQbTlXyta9GbQZpSt?=
 =?us-ascii?Q?iNS2m26rzrT+RqLflsoPHhZuZXnwXZ1FFIqjC/9jwLKWr6FA8HzT+pF7MM7L?=
 =?us-ascii?Q?pZNOujuJTENqwbhcMLz5/OM8AwaPjjK3Ed5Dy1lMR0FKx5CmTii5a5EsDdCN?=
 =?us-ascii?Q?G+ZrIvFFr7fXD7qVG1UTpm+0chcH7B6DYxhiMyzhMkztT4Tux+5O3qRE6C9Q?=
 =?us-ascii?Q?UILNRITFQm15xttzgPJ9sq8/3EarP6GcN3K3B32wJlGgfoEplcPe2qE9AIcb?=
 =?us-ascii?Q?eQiwsXzoLr5i8D+XHyGigr2G72IcmHG3AKJ1YiV8eZtvmOhBio9aOO9gxEjF?=
 =?us-ascii?Q?1+LFITprIs13qBqzVN+/Ag8HOI48yfd7/u6Oi1RhFp9HXghlnEHP7ruOqM8x?=
 =?us-ascii?Q?jrWtYvIfCRv/y/NuoKWdsEE4a4iXUQs0duA4AZMZC2KUslXkxU5JntEW4SJe?=
 =?us-ascii?Q?VAyoabYsMrvwrWy0CQv+/ue4u7zQNv8+TuTqpLbvfRRys4YIVnQ2oQeYvh5a?=
 =?us-ascii?Q?P6hiX8yZLkJs16TopxHUhexyofG2lqUt6dnyJ2EMRwbnvW7NuAWPJCbMtgi6?=
 =?us-ascii?Q?crTmfeXQA+v9wJNkCqpIDRrQhBoVvfhZ9vpy8AozoFdSWSUG9jGQwFbHt7Ys?=
 =?us-ascii?Q?QPGX6v8Ozge1t+aGCVKa7y8zh3dFknk+Wsm1168YlTKyXXtM8R/kY5kYccMm?=
 =?us-ascii?Q?ZOprbO5wrhAxJkL9rMJTxgG2s26z+6FK7lSEZz684shSU9wOpy7/7k7uyuLC?=
 =?us-ascii?Q?lVHr6FpWw22A8Mbz8WsHOFq5MVrRBsqKcI6VCN+A7YDDUNqh0vgK0FOIh1PE?=
 =?us-ascii?Q?yvNvvuU+BdyRT0GCpbwNQZn5RUXX8l5SdB97yKiC2bcry2DDv1N7PNqedQwU?=
 =?us-ascii?Q?UIkMXn44lAbPfYbhgJonWi/qEnFebEENDD6grp06hlVCzZd/+lDew3Wi+36D?=
 =?us-ascii?Q?tlD5TFdt5H2qt9ueHqvlkR2yZDgR4E6BNHpneUWCaOp98vxKF6lKBPpRoH+6?=
 =?us-ascii?Q?LSSnOvDMF6lumzZzZKds4ILjduCgoPn7/nM2e8j7Zsakwj/dITmG8uAziPHp?=
 =?us-ascii?Q?Th17GwWkQw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c84482-c884-4f6b-79d2-08de5a480540
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:24:10.9047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbBt+7uk92GBhVvtm/mY+HSKAHax5SR0T9+u+6Du8YFa9fsYfLP0QfTm1UN9tHQy2VL+NVILII3WBuBmS0mUQQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16197-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.102];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B55FD70EAA
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page. This includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types that correspond to the existing migration
entries:

  - SWP_MIGRATION_DEVICE_READ -> SWP_MIGRATION_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SWP_MIGRATION_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SWP_MIGRATION_READ_EXCLUSIVE

The SWP_MIGRATION_DEVICE swap types are meant as specializations of the
SWP_MIGRATION types - they are equivalent except the new entries
contain device private offsets.

Forgo creating new predicates for these new types in favour of new
softleaf predicates that will be introduced in a subsequent patch.
Currently the softleaf infrastructure does not have the means for
creating new entries so provide swap entry helpers to that end.

Actually using these creation helpers is deferred until a later patch
when the softleaf predicates have been updated, otherwise the existing
checks for migration entries would be broken.

Note that SWP_DEVICE_NUM is increasing from 3 to 6. This reduces the
maximum number of swap files in the worst case (i.e.
CONFIG_DEVICE_PRIVATE, CONFIG_MIGRATION, CONFIG_MEMORY_FAILURE) from 24
to 21.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
v3:
  - Move softleaf changes to new patch
  - Update commit message to explain the change reduces the number of
    swap files.
  - Move creating the device private migration changes to a separate
    patch
  - Remove predicates - we'll rely on softleaf predicates entirely
---
 include/linux/swap.h    |  8 +++++++-
 include/linux/swapops.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index a9ad997bd5ec..a70a6809e9c6 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +179,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
-- 
2.34.1


