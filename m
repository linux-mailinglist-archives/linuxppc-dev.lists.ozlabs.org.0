Return-Path: <linuxppc-dev+bounces-15099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B61CEB463
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyVc40VMz2yFm;
	Wed, 31 Dec 2025 16:02:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155574;
	cv=pass; b=K/wvc9voefo83zpByaWmXW2P6rL9DB62DiD1zZ3iJ9wJDhf9f6Psjk345oDkjgWEL4pDJSg5H0Ga/Fve/1o1hDMSwFUPZ5Pdki+4kFhUfb4u7f2BOLxyTG8TlKmmfPGMrvN7mfS5f31JkTRUEag/lBj0lsDWEQ07C6oWYGpm4CNq4J9gnTDpIavsVGNXRgGn7ntm8r+p8pcZP1jEpCnTqjQJheAYrYuphnA1GT4VDM+XvNNY93OWcv3ar1ZHc9zNWnvYi2zE9Sfd2LqtQ3vE7Vnp6tKG4iAYvV4Ya+6MehrkViXpWj53kw2ZtIdeQtfS0AGhXdBlzpCTn+eKjYX4gA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155574; c=relaxed/relaxed;
	bh=Wd04w2eF+OegCBwh6Tl3Cg/lo+z+2EG8wU01bAHcJx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P+YjPHY1dAdkT8ZvijEQm6DOOfNrc30M3XABcFzwOy0dgu04EUfhhH0iAM7D+x/DQIOt3lSzBAYPR8TqkbvORHBHCwkJLrMF4YUY3tNaXKLnsw/aQii3TxA09L+Ye4d+POYsDOy/8AW8ZNVCx4FrEPTQVshfqFc78rFzHcMqMfuENo7zy0r0vqvxTgkgm9LbMXG4GXCEdK9yy4FKJMI6MO516HEnK4w47OJIiHythmnHAyslprsPgFGvAH+rP1T2ghSVIFzxo6mNZs2FKY6GjYWNpcUeY/F2vIkTe/ZyrPmEJeyW3s5AaVdZf39OOUfTFwDCDaWp3ISdBF0Rx1/15A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YIwqHgBQ; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YIwqHgBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs14q10z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APnhQpTJrTLrf80WVjVdue8usk7sCDy2muOyoAcbMkOqtscvm2k8k69RoxyKxaJhA8bUYZnsr8CJTaNPNMU178Hrw1arRvlTf2vej1P3tR9a7V6J3ODHMLyXRNG7Uq6Y5/XFJH45F/TN/nVi93End4f8RS2bDxHxhob7z09G637vAIT0xZBGu5lEl4Fk+UC75SNSoKgOeeyjxvj0HRMrU19DOIFb95oNoGTUtES6cXbONEoTL6BPY8D4CftJ1/85hIQYPIpHncJXtCHfrBXCAd2MRzQucqKwhDBmw6FpJCwY1A/t9lwpT7VefnJUhM0RxJCvYAtcvN7sGJqr25Ti9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd04w2eF+OegCBwh6Tl3Cg/lo+z+2EG8wU01bAHcJx0=;
 b=kjqJfxNbREoHYa9m1LoJGnCjDpcApl30kzKTzdxbtZfqxTokRyIuevb9csPPhlJdGpULk05t0bohOu3TyuQfJgCq+syvee5QjjW0Yd+jdcauaIomm6/StXu8dDY2ocuQCA38sq+EOrUiY4yFO3uM2YYSyXyNaIxosnQYwVJ+b1/l4SYwXuHEfTSZpqvy9yH2FVFe2DBJxyEWp8z4AncP+vGIyh1TPPhlgeS0cdT0WpdEuhCmWS0fb4hAeM+F0tYloBNAwVEnlxPiQ0bcno61A1Phb0FNzvWmAtGGHnH6f0JZAL1zXw1vulGdMO9AFeWOIbGqgKCxr7Csz61idtCzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wd04w2eF+OegCBwh6Tl3Cg/lo+z+2EG8wU01bAHcJx0=;
 b=YIwqHgBQwLy5gP483qIuup0nZvNAA8S1zUFHofMGSlEVAoHgyeK+n41Sln9WJEBXCMXHWwBpCX8xHXj/73+2L9McxDnEbW3l9VBA49LnHUDdRH+gUqV4m840FMNqE+LXu5tTCHZ8sSThHG9kFFRAwp0fnbWfPYjm4ZK5wErcLeAHnW1M58v8gXsTwW0qB6mnwQsgZjgyQoSeELPe1v+vf75OXaoxdRBX7TAvSuIz3va7czjiGLzcqr0JUvNVi3pdDPfdTZJZqRPCYZOxzlZYZUFh+Lq6jg3iFLdUGB1HrMKKwq6ZtWAfPhWd3CDGp5AaEOdUEarX2vyiOwn7hVC+Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:30 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:30 +0000
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
Subject: [PATCH v1 3/8] mm: Add helpers to create migration entries from struct pages
Date: Wed, 31 Dec 2025 15:31:49 +1100
Message-Id: <20251231043154.42931-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 01eb2fca-5efe-46e8-c7a8-08de48259c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j7jccLwNWmj6qRt0BxaS9vb0rlW6abZ8yAdCJ9l3Awh4FKt/4YiRumrbWBMO?=
 =?us-ascii?Q?9whsC7S1O/Ajtwaz9zR+U18etLHk1+m2tCabkaWqPjvooukEQxWOLDWO7Iz5?=
 =?us-ascii?Q?FepE/ZNwLT00StqHRanPUROAMYAnBLAUa962qhWJ3mC966XsUBWXvjypYmo9?=
 =?us-ascii?Q?9zqJb6sZcxsWRykf/C0bvsnGBenHG6yc4+3wAFvmSdh6LLCBJNN1lQl9Hr4f?=
 =?us-ascii?Q?1974R/MVQ0LmNrUzsfp6d9ib7oBcSLukukSUSP1fd7fvecQBeVl10hMrOeZM?=
 =?us-ascii?Q?4H+e4gVxvsg6bPNZ0WTC6vlo6//fbUFyx/VN39c+VLRVWvgpwQ6uVx9lEx31?=
 =?us-ascii?Q?6ZAlcnfxXf3u3KDxBCkhUpW+8nEx9L23U8JuwcYb0gFRmpccRofUrXP6p+tC?=
 =?us-ascii?Q?YtUrTUcY+ouYg77AQNZYMlmUexwTsm3wlOsDlwjphoqnlCWhkRjTPglJSRy5?=
 =?us-ascii?Q?wm5M+dFTvnR/JqcWPZ86XEf8W9r8zaI2c+nECoNPG8zqqiIMgoe0FGj3CfdN?=
 =?us-ascii?Q?CNTqppF5futYw0982oATP7EGVTMg/br3VJd8+2CPnqdFq9AVEzm1Jq5x5g/K?=
 =?us-ascii?Q?uWiJqfrRq9/jo7lHnv1LBrYqOCm1Pobi7bSKsaIqCvxU+RPXJJGLZHlYDNBv?=
 =?us-ascii?Q?9NrGCXtV+mmq+xWRJ4IpzmvJ9XLtN9ob7+lPzb6yirz4f3c79cmVP5UZkJZv?=
 =?us-ascii?Q?mTcIvw6zoPki326P3BlK8ko2I8Qd3N3MiZU1KFu/ZcSQr0SfPAVuWf5bmAR2?=
 =?us-ascii?Q?Z2LkpRtZvxS6dxX3DPW9T6r6QdYf4N2XdXmMdtb2abwx2Q+rL1zLyP59hIMT?=
 =?us-ascii?Q?LsM3D4W1dbGpjIJLM5uV7aO0DW39bsGtQMWwk75uwl8iHwqrBWL4fJgCRPMY?=
 =?us-ascii?Q?xkDVLmGt8ta7Fuly5H/NHIrT8nZLyBHxv/UxCgZgdAhooncaIaaf4W+FwsIq?=
 =?us-ascii?Q?X5m1slPdTrU8oTHOuShaI9R8J7l+Tv6/p0N2Zk7ZGs2cs1Eeb7BKzxRz48ts?=
 =?us-ascii?Q?n5eoizvP3YhucRnBnyDFUaFVNWf1wk8rO3akj2r+n3yEhHSKxBXWmvtFTxPd?=
 =?us-ascii?Q?civISKjI42pmLJSeGvCIsbeSJXFNxRzWucR8RvGGvgreAFNC1l4nU6DYVbn2?=
 =?us-ascii?Q?eM/RiBAqvGYus2GJwkXh1XtWGsZmZtdQhIWJzAgqX7QuJIfZYIGlZvrEJy1E?=
 =?us-ascii?Q?vOL6Ot6C9tS5v58XHqtXQwVMrKIrkmECjnhkBe7sxkZdjddeOVEsYl6+PyjZ?=
 =?us-ascii?Q?F8YhyUEXeUL9DiBaWcjqO37olbgfqyJvRBsOgwl4PfSyauMDbYeeDi8LSFio?=
 =?us-ascii?Q?KXL4T3J/PTvjAhR54eKc9gsnPd5ZuVwruGavzLW7fMuyKj6ocrNdmM+V2q1Z?=
 =?us-ascii?Q?tiE0PxPcGVCdyHebODtERjVTLqwodjc+Zbs1AfAwOk89IlCkPBHmB8oZCdP5?=
 =?us-ascii?Q?CH4UDHmmdzvndJe4hUwB9X4xDPhZKNgx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ELeqYrQ9NvLis9fOBxUoUQzM5zPl8EWcVKj6L8YCfkGmC2lvejPuBi38aIN/?=
 =?us-ascii?Q?dj1jf60GB2egkQDfknKfi3D25D/Mdj/M+IvEB2F+oZnCI9v/vSpj88yTelfh?=
 =?us-ascii?Q?+lSZMh8hI1P0YZwzZDdiSsoY+iU6+St9yIvEyjJCk3R9vxTD9r19AAVRB0+3?=
 =?us-ascii?Q?4Eg9Wz+FVYwraoO+BEq0Kd79b/omXAphB6ceTlogI+EcpDvTretKLqM+rtC8?=
 =?us-ascii?Q?s0q4Y4FtetxMrSh/NrRLIo+hdT4gILFptlqXuWrS0e5YlJiqtmSZ/Tm5V0Bu?=
 =?us-ascii?Q?vtGFNFHNRdjxYNg+t2WTPz/5c0yFWsKvfoUBYOkTkRQW1bCTixO5uAcxFhnZ?=
 =?us-ascii?Q?r2spRi7UUK/A5Q63h0pk5zus94jpdBmuk+eeFaePWac8KgNrRucXY5F3cqT7?=
 =?us-ascii?Q?AK8Jg7/PUojFqnlWhXu+7F9ftivL1WdhX+oPSRcNVjZXVUM8p58hrnRQx6lm?=
 =?us-ascii?Q?wj1iI5nAI0GN7+OOKZAIRfEEYSwueJS1WaeWs8DU0feej8MT8A+wsMPO5h+r?=
 =?us-ascii?Q?656H3g4pOLSwOtOqeMQ4ljitedYMGJTSDd/2MXsroaDqxxHWVR/JFyTejoqJ?=
 =?us-ascii?Q?cLxGhcb9gDTccGiBRDlG7cnbgzkBqDzBX5ypyPRSDPyJXbZIkO1gNjol9T1z?=
 =?us-ascii?Q?M/vtcz0ty4yxHlMLcYAym2vdE7n+BYAwXq2D+LAcOT7Xy2UQtGNMlcnc6XvF?=
 =?us-ascii?Q?bIkxJMgQylt+2Sok77ieVJCnNeU2AWMBtCIbJuWpeg6PEjb6IOvnswLKoxha?=
 =?us-ascii?Q?Pc9vLUCn4CCwCzHbNXvrhI7CQuBlxLj8iwIQ8Hq0zTnsSotmqcHZ2d8k9zmy?=
 =?us-ascii?Q?inOwXq5sCluhsNjlZC+6c/bL3/2RcDCoMKERVXuAJOKGQyKUN3h6OnYZleHq?=
 =?us-ascii?Q?OPCdVT0XycAwl8/RdcBJ5K3NMH5amQIZQVvcEdYPUZHkczfHl8psM5x6QTSK?=
 =?us-ascii?Q?CqVIvs6+D8D3RjcDM2CIJK/bkCu8nC91i52Xp9dFWdokELS84CQCNQqf/m4L?=
 =?us-ascii?Q?ZYKw6KL6MJHxJYNGSLh9Jbr0P2JcS4GVUcCzpS6G4ykGMSGMYGTYBFd2xxK1?=
 =?us-ascii?Q?+avFm9EHyLYB2Kj0WUyau1vf5jT8DFS7k9epV1wwZOpu007ElqP/kurlZrRg?=
 =?us-ascii?Q?jT1PPwZI/cHKGHHBBahEvZXSSdJxmLvbxnsYiT45kcU6rICRCsz2OXUWxmBG?=
 =?us-ascii?Q?DElxUAQC1F1XeVi+vFLKFKxyoPmZZfhBkl2Rsu+w1ajS2vK1XaiTO/19NubR?=
 =?us-ascii?Q?+ycdE5F0k1OlsgVCHhuUVP4b1W3znOtwhq6PhNV6alZdGMUa9oGTHBts0g9V?=
 =?us-ascii?Q?OJauZJMpaTuWuVX1BMuufNzylhkevagaPsq6oktmzF+v0jnBM8ulnDiksjzd?=
 =?us-ascii?Q?lxFtVP5a1+MrQxHwnKZfAfcBlbRvOCCDryVth8pwudksyuNig7o9K0Kwsqid?=
 =?us-ascii?Q?/vD7YGmn4erVtdyXXWn0PC8ppZ0pGMmQbTH67lvexbw8dD3q0QrnQd0ThNq/?=
 =?us-ascii?Q?uzFC7tD+RmoOJgPla7GKnHOlX8AT/hifj6zTY/0ZBvgihluwLwy3oyUNRgkL?=
 =?us-ascii?Q?TRhc0F2cu61ntkKaEXGSnUDN6/OFVguoLov6ZOB92xohZrIEwa4JU9ielulK?=
 =?us-ascii?Q?FzwCu79oC0546Nhh/z8qd1kFgxg1hIOzsZ51dZp72r5VpGkvX9StzRsH2gXc?=
 =?us-ascii?Q?Y4fe2/cp5NsDpkLM2KqjG2Ua2y53GnrrhpNU9fV9Z0Ae44LlUMyLgGLebpyJ?=
 =?us-ascii?Q?nHFRKfKc9w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01eb2fca-5efe-46e8-c7a8-08de48259c0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:30.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5xEf1gVkb6AovUVTNaobkKXWvy33HElQDwqHPRHQkaMZ31+10AnwGIWgpHsB9k1Wf2jsmu6RPd11lfMQKh8bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
---
 include/linux/swapops.h | 25 +++++++++++++++++++++++++
 mm/huge_memory.c        | 18 +++++++++---------
 mm/migrate_device.c     | 12 ++++++------
 mm/rmap.c               | 12 ++++++------
 4 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..72aa636fdb48 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,31 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +237,21 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..08c68e2e3f06 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3183,14 +3183,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4890,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5d108ddf1a97..7eef21d63364 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -438,14 +438,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/rmap.c b/mm/rmap.c
index 79a2478b4aa9..bb881b0c4b06 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2539,14 +2539,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


