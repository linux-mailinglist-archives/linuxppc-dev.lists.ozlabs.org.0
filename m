Return-Path: <linuxppc-dev+bounces-16520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCeQA8iMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269ADCBCF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4Pjn1GLcz3cP3;
	Mon, 02 Feb 2026 22:37:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032253;
	cv=pass; b=Swh0RcrKjbExjNByQV1kEjDQgDPzYZ7oLvsAOVU0Tshj+kwacdCsICj3bWuN+frew1V68PNQA9tp4J9UZJDrFxh3Lfz2k+2gsSDXV9TFdbpvgl/saXZYvTVu+YY5506T7cUMsRWR2zYknrPqdd+nHXaoHMwC2/VScH2fWlpJh/O5zxsePkdxRF/1d8fmYmv2+uT3bXq8iGDzUUVWAz3TW0bGtX2GsNxgzYCmlSqChTRrp/YIHm2AYry0FUq2qw1BHM9ms8Zj77vuT6Vi6Mtqvv9QoWgrAsOzoO2YRulTQt69i880gySipU8udZP5ZwbeDfkOk7aIfuuPTcU06IpZJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032253; c=relaxed/relaxed;
	bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGY1NiYlihzlAsNFXFQzAnKN7WcTfbm/2AB8behP1hwzkAhEDJeOGas91WLMeRQbogkk9kkNzVNjsKO3QP9NEXvNndRTWbhc50uYVpmNqZN15jz0TQl+v0AQYrMyp35RLkkA05+Ce4iSQytKnyk9BW3K/Dye6PudWHQSviPf9j6FkJpTvWxB+kv3jhlEPX3e4PvJQO57l0A7jx8h3fegYF2B5X40rwCNHOhq1aX9V6kMuYoh9O4jNnQTxeHN2cI7+8LltP3W+7nFIvOtIe3pjABINUCfEbsaZYuAnJ9U2gpDzdQvvkV00mAbaD3IVUc3p6j359qUO7XXv20+3fFynw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SH7h6kTe; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SH7h6kTe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Pjm2h5sz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wezuVNAt25/A7GVP3ZapDmnbBvNIMgGJY3M/cI/r1mcjOjv2mqlqPhC7niG2VfvaB5AqCtVNgxXQ/c50/TMB6YEKWp4RAgtvJL+/do7RQ+U4ja+i8dhmt+GQtHOBUT+RlbRmH90fqtnShmjgJ+FwKlUEBZuL1ZcmSbozqlBt+g4Z+vAk0VczE2q/WXWRNnRfGgy2Xw/uGsVneOiswk4+Vx6fZCDErhF3XGwzGqGFiidRhuuH592NzQ07gTauVpO90hciFgdx6UdMjZIUZij22rdADY9hsKmfhQEQkDv7BCWO0lCU/GI0SOOna1yoguo1TDO0Da4hQOAMfYoUC90LoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=O/j6B8BES4LDDwAjmwiXX14jIjacYG+JdPSzbQOs2uujG+gJetcuCjIzDOf56lOvAbCFRl14Z9aSFXjhJLXxcnEYvCn9fus2DyVpC3Kn9l3blI3tTEIWah77YEuPIKjyVdCHSwWrD02RFLnLx0eyb2FiSO/JzXSckO1+9zy33q5HpR1hMFSzWwWAKqAegrJ42/DZ+vgcua5lPSs5+LR+I9gKv6BQR+d5naGxaB2V/kOJ3O3PMLVBDDKj6jKydPe0Ae71l8NTlcR/yMviTBjILW1cdzypOkPNO/4KMUxsUJLYZVyFeLORlG8cjPg0/JAof7TINGTRmeTk1SITohs3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=SH7h6kTeRYlIAwFeYs4iSjzrJXDKFaD/Wn6jjrLrnQcQhBpPjBZpXOzCj2fnYvxyq1AV6iRQ9Gu0AnXRVRret+sjoRsTtjgcypglgvhcbjERvKIuKFE3GJtNngAFRa94JgtPM1t/Dh1dnKY5tfqHNWNyroXtYRQK+JRh+s0L3lBwv0y3qoHRDQY2xbfhWCOjdfzvq6BR19aVgvCmuqRB4qiE8JgcZHjY+Kl71JWhUz3osnp+sMiw3vWL0s4mcAx/h/b1mMvXmeJCa5t2WM46vlprZYhrtICWjztmnTDJMZeSYubuaLsXD3seJ1QHV9noab8lrhL6DgHdJ7x2HuUK2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:28 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:28 +0000
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
Subject: [PATCH v6 12/13] mm/hmm: Add flag to track device private pages
Date: Mon,  2 Feb 2026 22:36:41 +1100
Message-Id: <20260202113642.59295-13-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: cf577d05-f614-40bc-1ffe-08de624f7169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0IqMZWrv9JekDV0DrCZkQUBrcnbaGKxQYGVkxcI1TCkohevK6/E2OtdZSxpt?=
 =?us-ascii?Q?wqv5628AeQ/cl5oK29tJ4CxYvrmPd95JpRyeNTiERZ2QgqAlnBw0Rb1AP85c?=
 =?us-ascii?Q?yb/mJGqgDbnvhesbTjduxqPF1DADYSFwBovfQX3+Kt96YHb5O9Dzf5PD/D8G?=
 =?us-ascii?Q?9XZpyi7Qjd6icp0j++9ObThZxR7B6NUwCIUguF6xx5HzH2iCYLYzMW26DYzR?=
 =?us-ascii?Q?ewsJaQLjAcrRa8we6ljxZVxscxSs3sFRjDsQf6PtsGODFldbUKLEKWYpomHj?=
 =?us-ascii?Q?tkPsGTcLYf4GsmlU8caBt+KhAdUyt9ysQdxgxeUSeAkl2yKk/R4SP5fHLtru?=
 =?us-ascii?Q?l9QEbptXd0wXXEgo80zCrhuZrl6Y/PPSWNmRGsck0dF6u2u7bCTxSMwAXF6p?=
 =?us-ascii?Q?9QxCgOzE2gzjFeem/vIjwbN1L+tyEJra20y5/mqyV7veRFnKfASnT9sJbYmL?=
 =?us-ascii?Q?CYpz86Pr2KFdIMNsNWh2lYqxK9NZ8XKCtw2z19q7RjnLyyTlyc0LL2iI4WAV?=
 =?us-ascii?Q?1qcEQNkJb8+lRyYJ1ZyRnbb0c1DrBnhMNcA2pj8XTsloCezgmGIRCr614+NG?=
 =?us-ascii?Q?DX5EKBUq9hW7WidTn5geQIDZu0/mRIL9nusNNH/BGACcWtYyQndr3J5C1w7j?=
 =?us-ascii?Q?gsLa9WlxuKWdfBKWCxaEiwKwpX15NqJw8Gmga/Xs7HSwUdy6gYSeghJNNv2r?=
 =?us-ascii?Q?+e3HtPelVoPpTDm9UgJuvGRDzccLG1mzf7sE7gYtT1iL64uY/zRsYnM4Q7tb?=
 =?us-ascii?Q?v6MciNuYX6eqv4drD7iHYAgmrVPVaiJAHlUcHvad6hxQCJGxP7lsj/cbJia+?=
 =?us-ascii?Q?mWaeXJFB+RJC1vi3YhwUkgHrEC+zEz9qGtq1s2hl4A1zGOuzZFgsf2r7jdnj?=
 =?us-ascii?Q?ReaH2y2EWccVYlBJgLqiKymhOm0XpqdeMP2voYjtfR632oyqMLIwNTbKXf2E?=
 =?us-ascii?Q?oCS8w5EjoQvaJPCbxSyN0OSPrxq/VmOnUnf/4/F5BAosvu3LQUq5inWkMlOF?=
 =?us-ascii?Q?HidiKEZ+NoC+H3F3eS/FspVPnP+2olocsnn3DG7B7MW3gPR3JO4SsKiIEM92?=
 =?us-ascii?Q?oWT1an8Pj4odnd8z2vXcOaxSY/I+/GkaA2eT9s4FBvYeGMF+L+59P5CyQOy2?=
 =?us-ascii?Q?+miK76RqlFJ7AQAIDUjI6LdOP8DymUH3wSZK1ISUGm64HkR1G5tqo1foYiOl?=
 =?us-ascii?Q?WviGnb6RCBcIAbRQIcBVh8Q51v4CKKy2iX29TXiRLxX3B008xbh/WzroD0z1?=
 =?us-ascii?Q?lGcZ+dWBwaUNFV7tsCBco5vz/9VIpCOTkLTJIvnk7QsEhhpY34G7zL+43nOL?=
 =?us-ascii?Q?1uvsAdCp38KABG9ulUIeAT/bJkA/kObmUol0eP9FwKCaTWlctHdVe7TMHIqE?=
 =?us-ascii?Q?hpS0aLeG55sUC0KfxOb4XQcZgr9vzq9oVlnGQ9HvtF3kyHZMjucgSN18Bpbc?=
 =?us-ascii?Q?P5MrD/j5WactKLikfHMZKaWbK6p8jy5Qy1XtWC7nViWgLchQBmWqPwZ0ImwP?=
 =?us-ascii?Q?/dpDuqO12Fya2/YXO67NxsyxkhFGC4CNVNrNG9K+Da7ICpL3kCfNK2f4rsYR?=
 =?us-ascii?Q?lXE2QfJuSNVVGyI7uoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Jo6vBI/jQVmd4U3KPK4BnpDGaRhyR1GktTm7crXhpuEwP89/t0tyKHJGXSM?=
 =?us-ascii?Q?IanIJgBJ1oNdqspXaDwMU7l71Xv4pA7CuQPdZu5AkHgDWXdFgPyWjw/TNA7x?=
 =?us-ascii?Q?nct3aUl9N6O/DPxLd30klIV/BvCzcimPBMvXbJ2OpT77wCTVaxIh+k4DHBXZ?=
 =?us-ascii?Q?/vGKo8k3u0TfDDzn9rhF+/fqXKKCPYnfwIwPsQO1seBJbdfSyw/lVhEOJg+9?=
 =?us-ascii?Q?jn/5MJUXnLP7IlllZc34v7tR1BJOynKSWOtBxh5Gk/V1kLXlSOi2+j64yRZC?=
 =?us-ascii?Q?XkpJzgmJPGzPQfrEnHsvO+LCSgC3ZEN67tuitleBMYo3l6yoNwz1a0PuJk4q?=
 =?us-ascii?Q?7f4KIYWNeBOwmkeA4woVX1IjeJ7SMUcokPPpdgcqfITXpnHhE/2fAwOGJbPE?=
 =?us-ascii?Q?6atX68adU+LXhk1fHwJlnU2E3oEHysNo344kP1EfJaWzTQtQqEH0WoIKT52p?=
 =?us-ascii?Q?UoFDhAIZ328XP3N7Rq+g3JPHeYHNUexUpc39EwrRkIm1Yv/q30FoJ01MOxzi?=
 =?us-ascii?Q?ZtZXhgQ5nPOCijC2ZqNFFQnzP8P4FHs+u2qIKQz2gzSAXwn0gwtxUgWDbo1h?=
 =?us-ascii?Q?ghLH+1sqgDPa/Vg24nkOJj0Pf4xdx+ztV/FXT9UARp1udEeAqLSMh2swvdOG?=
 =?us-ascii?Q?qNR1dBwE5Y9dwOFtY3MP5Q3i7r2Iu6oV6F3W91VIlTM/UiE2oHlmPbhqt5Zl?=
 =?us-ascii?Q?EmXn+hvu+MY9QTcRbrsXvzHZWGNOzH6Oaxthc1yQR+ZO8jdQAp9PwGK0DiiA?=
 =?us-ascii?Q?mpc0LXVHyLpYXxA1ffbQEXMdcLGYHwrh9YGdVwn7rsXQ023hbko97ZhPTzXU?=
 =?us-ascii?Q?IGrwYxjpSfSnjdcBSEB3U36pIMHWNfpurb9ISWvWne6HTlZQ+KQX+6u5h855?=
 =?us-ascii?Q?CW0ocIldAqjVqOrL8oNyU//oladoLw8iXS98UOtroza7B9pJ7+npxRA36WWm?=
 =?us-ascii?Q?PTk4dctJ0Y5F44ksfUhPZFqPbcQ9ieB7+vGgDDRAop2p4vzMdr+/DXIWe/KX?=
 =?us-ascii?Q?PUm89Fc1YmtePuUsJyUq3mwAty5wxpT/WRxOVNTAgk5n0dSTHvGnL9ZcfN+v?=
 =?us-ascii?Q?viLcnxmKjvSfvLFmvGTcxzVRgyKPk0ylpZ6XB8nhZiioe7sSOGvYQcW4vMIl?=
 =?us-ascii?Q?o7pXXr+wwz5AUdpdRt1aG3LuIIiySHwj65L7XLU6ryzncsmeZibif45Iy4BU?=
 =?us-ascii?Q?UytXyii8omd3ZePnAMZAaCEzNMx+7CmPhIHSN3AX9H7uYbm1CXrQqqcwpEVA?=
 =?us-ascii?Q?u0eupxRXKikpON+AiFhVWkZRAZKCU1gzyQL4xfUfiJK761l8H4/95R5OEDME?=
 =?us-ascii?Q?5LfN7gEufCyr9CZBri0d4k8oUxaJkTMJtGxKUK8NaRQsBzS2C68HlEqoMFmP?=
 =?us-ascii?Q?OMKo9o6EqIN/NZPLILVfTkHFtARhHTyv48xpb8IzQiqRcYVnIx5Vilu50+im?=
 =?us-ascii?Q?tryBmf8AJyCLSGxEH1XGSPK2eGxh8VLfLimNhoBiE1Y/3eTV0p4eWcTvIMVA?=
 =?us-ascii?Q?MhfliRyY9WzqZ+PCKZgd59MwgaD5hT3pLfB5KiegAomjFdShy3KRyTnjUBsW?=
 =?us-ascii?Q?8P0xTUWLIJWeLSjHU6fHuQDbsKPQJ8SeqxfYvzgfBxV8lgyw/pMmuFkWoWoE?=
 =?us-ascii?Q?GHZOpwJdAyp0B7/3e5/7s9x87BIUZCcBzM0ZbTDLYCviV/gdsgT3JPep6A54?=
 =?us-ascii?Q?SD14bHyvarnEbQMMzziKeqMwtziiHimu/YQvqzTl2MOqSU/gQwaL6LuZ53XN?=
 =?us-ascii?Q?nHfu7IDTTQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf577d05-f614-40bc-1ffe-08de624f7169
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:28.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrPeYIhgjVRtRV4URDJO6EPjGAP1eW9kZsea/CYtv5zXS2J7ovpN3mfskKAqs9TC7tE+JFf+dlX3qX/+LpOg3w==
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16520-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 269ADCBCF9
X-Rspamd-Action: no action

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
v2:
  - No change
v3:
  - No change
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


