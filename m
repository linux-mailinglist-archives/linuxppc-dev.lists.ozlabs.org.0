Return-Path: <linuxppc-dev+bounces-15105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A9CEB478
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyWc0lvGz2ynC;
	Wed, 31 Dec 2025 16:02:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155576;
	cv=pass; b=SkU3ae/XC43QCzEaZhTHwJt6YEwiS2URAmgHZzLKxDugpScx7/QkYGmxE16WSwrs/xi2fQdUHajHzFqNYnsFHB6NdW0yyDR9gLRaBKx7Jr0U1ODDyffAohELsVG8KpgoaEAPkTGk1vtv4/Bw0qlATQiI5yzGCyp3nktg5yjFehyyh5/ToZjsunRDhsaJdk+4KWKm6gYbZN59jSGlTjbkLbxO44pNwPBTEqp2Z0oYLKzFBvKCijlzAyBy9eE+vUWZMnw6zhMlWNPIghcqsTq1QamUtD/Xte9+oW+wRMjqlowFDrLbJSHQB0dc5eidA+pdqAkCgLsZL44yC+CsjzhLiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155576; c=relaxed/relaxed;
	bh=xLG2q0VP7Vyh1Bsb2NpKSu79+UhLVwrIjeauB2iDFM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TL+fQew0g4w/7kEqS/LCGbv3hIaYsWuNytPhFLS+MRhIOVe3vCC4MGaed9CtCPA47EOH58Ox0XP7wIi4iGxO4mHi7b/ztrgTnO90Cv0diP539LoTHQITjq514EnJyh3pS90n4topad5KPqKp1b3LIN2chJHKbpfm9L9KkmSv//Ox22mzgAN7NiAV/C04VC9jkLd+lnMzWFwBPlUVLo9fx/RWN6g2fFVvNhMQqPXpSOTr4BcnBHLDy/GKzPeOpa2lgHYvJ0yEEwJGfuNvpX92q1G5pBtnMrQRAKASpNeiBb0/eB6uQHJHcG6tsDqOYF8f/Sxi/Z5kaZ9mmF2UsfObew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OTWFgZ7Z; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OTWFgZ7Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs42t6Nz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeO48Xrx0uDovOV5ZgZgr28QWpJtCpZ1O0T74LkyMNUN8UqYMMSECszfHpoWSvQJKgAFwCEcImgOmkKIgVrWwwoyWc7LNEZu6sGhgW39gffJW1avjTHNt/oKwQjnxrfZ1J8Oyl8DeqwkG/kNBvAWiuamJrPG8rHsnLy96Nej2bUndtntv0BqT3UyzcNsjAkxQqtFsWB5+0LzPECV0tmfoGYmT0zfti6APb1KvOkIjx+XzGEijid4pUJiefHj9z/sDb1u8wjk1tekCXMM7yaibrKka/9jYV4CtAg62aMLyCBHp1wyjYJk+m2saAkzJYb2h0c1WTDWa1L3DB+xgusAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLG2q0VP7Vyh1Bsb2NpKSu79+UhLVwrIjeauB2iDFM8=;
 b=vYRDN+1Yac3RYvnFVgXKl+KazBxDAIii72ziAWU6KcXOQCgnzIxDpDol9yavJ/xJ/a3tzwx0mVeYwStTP4Q0bzr/ct/EPitD5KaOl6znEiTk0I+nOJ/Yheh0AaJ1/a7TwuD5vUKEHgC4Yloy4eeXXzY2BxrGuKhgXPafuEIG38THnS24FvwO8h9LnH+9sCDR6xi7jZA/Qxgq+KMGMTGpwmqSjDAX2l3f9Fhkc9neqtIQ8M/hSu0NZDbPcHeO2I9evthU3dXCHorBl7illn4YwFWrApQtae/ugfeSyA/LUopBrNQAjy8I+mD5kdQ0JtxtI/1V0MjBQlmm36ETlILWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLG2q0VP7Vyh1Bsb2NpKSu79+UhLVwrIjeauB2iDFM8=;
 b=OTWFgZ7Z9bKR0+2clwQDZVTGyrbT6Z1Hmj0zB315VM9PSBTWuc8DJtjmlR5aNDQiEC8n5MeRm3w7i3b1m3J38iSKUSCMfxMsPNy+IVYkAorCrQ5luM4tb/rFFcWfQOM4e2/oHrA8nGRGypm9Pzib6WCZxzUyrDAyCcnRR5jbqg7v+wPPAiYcg0m+Ug538XdwMk0kVNqwnl+Afiy2yIiZmDpx+Fss9LNorJH9ekglbLGtVwkUy0CHq/kZzfKTQLVsxyW/BRepOHl8OMSUtRBDRm8wpfSJgH80aX+z/Qqlkr4Aou3Mx30IXo/BUsZy09ra2gUQKG+tcNlBVIX67GJ8Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:49 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:49 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v1 7/8] mm/hmm: Add flag to track device private pages
Date: Wed, 31 Dec 2025 15:31:53 +1100
Message-Id: <20251231043154.42931-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: a9682556-285e-4dfa-bff9-08de4825a705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?awHDZGo0yKySAI7O/jdjpN8WbYpdkEF6Sm89gvzjhXR67XypsUX298qgo15g?=
 =?us-ascii?Q?oos2LwI2KBKOYo34/SCX0FunSA2tw7PvZsuXTSQ+Lk+oYthQ9rmHAGwfmFMK?=
 =?us-ascii?Q?cB7E0NJnih3jHIbkAC1WzZlr16SRSy5f99ifsf3fdLUm3HE7/2owmhSeYBeu?=
 =?us-ascii?Q?Tv6Ggox1Fv/kWzzbPogbrIdhNy1RQCq2nUvS6oMMhhFe4J9m5lW3lG//SMEn?=
 =?us-ascii?Q?jFwPF8qRrwAsv98bLYuW3eUzNohq+NCoQ4F0ZPfeuDsJAot1/2H4eeLkmxLJ?=
 =?us-ascii?Q?6vOmtL/ClfLegjauEwm/CY7Umt+PD8pKjZFpIfp86w63/63xajPDlcvs4t5I?=
 =?us-ascii?Q?Hl8nKs3IEgi6B/xPJf2YZYvqiwHSkEWTSophBDcfaAYn+1yKgT42Daw+VO4A?=
 =?us-ascii?Q?zrICzzrMcbXB2uwSeaFpwEPv5c868lmYuNy5hf9cYB7JeVa24G0slW2uYasA?=
 =?us-ascii?Q?yfvN/o/YgrZb2P6B+oZsLFsEKgGygIKYdNosm0L7KSEOt5GYV4gWF7JS/tMa?=
 =?us-ascii?Q?OX7rXNVeKKdzh1p6MYP5S1oeYMBnFNHPSrgupvv8WAa0qS760zh0u0kVVYR+?=
 =?us-ascii?Q?kQrAisFjYzOvERnoOWUmpxls9ob/+0TGGVglfpr89nWRl/oi/HpKTTARQ7xQ?=
 =?us-ascii?Q?buK7W9ToAxHsSfLOcGbDjCqN8+i1DghLzDruNUT2lmZFaFl8Ljkd5MbGgq3k?=
 =?us-ascii?Q?y8lMvJMwlDAhglGe2OTyhqrVO/la3V6y2zcN/LTmMJKezzQwhArslrFtmfv6?=
 =?us-ascii?Q?Vy85DnzxI5nfHfeS341ffqq2FFEWYiATiGkRUbB8HvNVgA1xS02YVoNJA+E6?=
 =?us-ascii?Q?yA//OWGbDMh0Sl5RMWxKxJki6DzdLkaFWaeX901zbfxbEu9KVAcXmen7aypI?=
 =?us-ascii?Q?teWyAbV4TI92pi7HEygQG9rtZ1gHDDTGJmofQvrMk3djQ6bi2MUSv5XBJ8lS?=
 =?us-ascii?Q?biKbOvO1yZC2p9hW/K3+lJ+Est2qr0yHG441LHkxWJi6Mt8Oz8ACOqHvU444?=
 =?us-ascii?Q?JQB/i3sxO5CTF4S8Y9i+VFSEd7xPv8z51Xcu0PE7BCn4yUd7mem327GM0ypE?=
 =?us-ascii?Q?H9+ADdc4OT9fwtFhHN8D9TWittefMos9pHGcVFzDa0OEE4rEjcDqbSc+CtUN?=
 =?us-ascii?Q?/7Mp+9cjPVc45IM7QJ9UtSF7oWsQYnfia3jTykhoeSk6se7+2xGHGyqRdlL0?=
 =?us-ascii?Q?hm5DIlbUtVp6UWYbfk8vGMAp8Foi2nfL626rlAIIHo2joXfQO5MDD4P3s3Kx?=
 =?us-ascii?Q?w+0DOHdnrI3w/TBT5V+2F42bLfJS/AKYSnVmvfaDVblQyHdXfSBuA4UlxJ1J?=
 =?us-ascii?Q?M/lr3RIopTbTqQFN/LHqAKGvjlzt4HL9VOXRABfp8t7y6auXH86rPdUqg8HS?=
 =?us-ascii?Q?EY9JyOWIQmDxPaez0olxMq+T4HsZItZIxNW497PybsFmZoxLdxcxf6hLrWsa?=
 =?us-ascii?Q?eIUw8D0nkWZz7CnoVfE7nS0Q0CD2kvKU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w8ca40s1XjPBmzGkhVwBGHGeoc5yd6uaCqMUNcVOtRA6l3w3QcushJTXXfnF?=
 =?us-ascii?Q?7TLJ95drlJHz2Fp8ji3RKD+q2IeYl2i3UcsCG2M/5edfWB0Oxa+kzoei2ust?=
 =?us-ascii?Q?e4vysgvg52FWbM3CdL2mXhT39ZjC0/myTv+AR2wvP98J78dQir8591eRYRvl?=
 =?us-ascii?Q?xl5Iqjm1Q29aia/Y+VYjk0wXi3CZWmoN8TQgYeKKakuO0zmzx+bVP9Vvxfvl?=
 =?us-ascii?Q?DAK0DsxwV1RWU+qV+xDXCQH6Kbr9iu3lyvZ6GAuAh8Rrt3riq0FUOCMK/ANv?=
 =?us-ascii?Q?Rybef1U4IEb2N9Gyl1/E6jcBZTp6URCVsUbuuzKv22vfcVdyzDLgdCkd+ity?=
 =?us-ascii?Q?enAAIZoLk4bbO4LZAsPjoyArvxWcrQTrGZH/0ZQT/2X+xzcL2tU9g6GWyIL2?=
 =?us-ascii?Q?Bny92QKamNCulwXa03Sauf3uHK9TaUBaS9V4Z3LVrwuyASnlxgisoafE4ml6?=
 =?us-ascii?Q?KOQ51Ir4oSkjF9ahDRrI4yKqc3smB3b0F9+9lmn4I5PoGm3TuVHrOy6TwcGG?=
 =?us-ascii?Q?I5TKeta34gaqvxHbJpYlUsWjBDCKBvYmQz5R28Vkd0uLFtN/CV8PjXjKn+mu?=
 =?us-ascii?Q?eashSteDkSlEKQRP07/rslvMLCkSVpt6eoxBjES7JL7HIiAtQ0uEi3LPB151?=
 =?us-ascii?Q?w01Nz4LIxwKYVhQ3sa5tPGdFIatW4LNLiCTqspDfEaboZ/t9M2wFGyeoSPXq?=
 =?us-ascii?Q?pjX5uJyiqudAQvRz6N0IrTXrD8p2OE0tkfERwZegR5TBH+YsA7dXDFyPIj+e?=
 =?us-ascii?Q?1Nl9xSi8JKfs8v2gveW+FUQBEnbWfNYhqQhjY7EoZf5zSjfjl4CKctvoH37L?=
 =?us-ascii?Q?C4GiYjiVZ48hyVMVObqHEuBSz2BLTK+gkMY2icujsdBzR7NMr1o9cKhjRVjF?=
 =?us-ascii?Q?iHI1qxgnWmtEis2UKRiCAHfcNyXaRm0GJwA7KOJ/AAniYMRo50geBJKXPb6/?=
 =?us-ascii?Q?TKGBFc3ay0g/nLFW4cbupnCQT0epykn0cZgj0zFOCqyhHx6CraxrjuGI9AEu?=
 =?us-ascii?Q?NSbFwyzFVwQYuZk0dNuCoMX3sZLI/oMZ7SaJFJnnP3/7TFU+tE8DwspSzwSr?=
 =?us-ascii?Q?dNAy/5Dt90I/BR3hCEW8rlgF+Dr9NzRlImyDsJlhEDVO+yOryGd8NG/gV83e?=
 =?us-ascii?Q?CCnn0+357hWetMCKyKAAVfFp6FSk4DomZfnlomPQ1XWuNDTmO2517ayMTs3S?=
 =?us-ascii?Q?dvJmJBnL2jSGF6bsH7KhinySPAVomB9uqm0cSMcPkJnTTpIfYH/4WAoaTvvg?=
 =?us-ascii?Q?+WSJZXPBs2RDvR7E2TYVdezkrKUFQmdqzj7UCZg5rSfg75PoyXw9i9X7Rppn?=
 =?us-ascii?Q?3wsVv2WeY1vhQzJ5dShPAaZ3kXT8LqC94rsMIQhUjvlDo9luTPSnnB2wMlRB?=
 =?us-ascii?Q?AbPy9WqqxKg9w1docTwuO6HTqDDAIw/kzj9Urj41Fya439pkVvm/KcV4QBwb?=
 =?us-ascii?Q?DlkDaHoUA0mOm7LrgFq9Oyu6RU+20KiYI4XYajlc841Y8ZdAZVGUn/APPhw3?=
 =?us-ascii?Q?36kjnAfhNjcsm7wisvn1BQ0WZrJLsH73fZ0zLOHIgFKn3G1CIQwr8X9E81I6?=
 =?us-ascii?Q?TzeQbwHcPfE4GiX0noHFamnJKeWYFvKHP4uHxar7TXtR6Q6jU4yj7vziBzr4?=
 =?us-ascii?Q?pJBG3cbGN5g/X9Z4J+oXkWP7CayHI9LcclMIIW+luI0YdfAxZCzVsR7fUqY4?=
 =?us-ascii?Q?uURco5eDpmj7Pu58cafby15yUVU0cYX8syBkCTWpmGhPuGz657BDIF6XkJIB?=
 =?us-ascii?Q?qf+Xn4QDOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9682556-285e-4dfa-bff9-08de4825a705
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:49.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 538k7vD0b1aZWy1rF1YKKBb7ces0ddhICYH4GdgMcrwt4RAqmiS+41LvS1kRJgXs7AtD4k07OxMMR6n8Oocwyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
that a hmm_pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
  - Update HMM_PFN_ORDER_SHIFT
  - Handle hmm_vma_handle_absent_pmd()
---
 include/linux/hmm.h | 4 +++-
 mm/hmm.c            | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..d8756c341620 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
  * HMM_PFN_P2PDMA - P2P page
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
@@ -40,6 +41,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
 	/*
 	 * Sticky flags, carried from input to output,
 	 * don't forget to update HMM_PFN_INOUT_FLAGS
@@ -48,7 +50,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 12),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..14895fa6575f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -267,7 +267,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
+			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
 			if (softleaf_is_device_private_write(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
@@ -347,7 +347,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    softleaf_to_folio(entry)->pgmap->owner ==
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
-			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT) |
+			HMM_PFN_DEVICE_PRIVATE;
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-- 
2.34.1


