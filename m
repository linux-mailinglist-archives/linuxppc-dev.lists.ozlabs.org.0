Return-Path: <linuxppc-dev+bounces-6295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9CA39199
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 04:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxm1C45y9z305m;
	Tue, 18 Feb 2025 14:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739851007;
	cv=pass; b=I//GWUJn+QltoQe+ZxjcTqKW024QSU/YOq+yzM5rE02xanPDRVYvQVgbN2m+ZXRsQDD/pC5S6nxGhHx+5yErk9GlMJvfIh52IDX9hTbq6JT21QQzJXFyqElEcsIUDtqx53y+OfayQtXsHMweaFI86uVpNYnRxU5QBrPnFsM6DIByJOwgF8xQTxCXnPEl4Ti5pP/86iap3nkoMdcGyddHb9/OkdYToha6p/2g8ZBeDvMlkYWAoY/RpRgXInzyneKSjxeILd3/JKmhTLpQCBtl4JDGWxVBitvwRGQiTjeHJGGKGiaG3Avd41aDryjUkXBNe+pe/hKD564VAcE5IUB/mw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739851007; c=relaxed/relaxed;
	bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MoVDinji99VnWEICy5DOfxBINDGHZFY6080LoEDLmDgw3S2/kPnVgI7wNVOo0C0FTYQB4NpspNJch/+fqQq1+wZEepoYuDCTf+IPEDT0MRuQz7sl0fAMQ8jL2Zymy1nBZu+hlQgolmFwK9H+UYPqieF+SFuyB5C4MM69XKrzF8w9aafOjwoAfKci16SleuFTleKLvhbRQVYvklO3v6oqQJnvcUMK0Pn0ZYKTUh8hiky19lFPzJM+Xt3qnaAv/7Ec+tg3r2yr/0yL9cnaXZMyJeUjd1g4LYzV6/lPZf9IzDW0Wk/TZiyOUYdHGxGaAS0v7zEAQa++Bu9cysrzTQZuLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qhducTfs; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::60e; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qhducTfs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::60e; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxm1C0zntz30Gf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 14:56:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7WMQcvlqNxlmT+SZYrnpzdZ1jR/nPviDtEuw+qVly0GllFVlbkY5W+YEffccyMnhlN4+F4EheleRYHfucqdzLMeYwy1LxjMVDGzzOvrGw/yWHFw5ere2EB79HQoT5Si+oEoARTi6nmmGEIOVkeK2OtxG1oaei8tqBZMdmGQfvKsGslt/ePDD41OsAFiTvJf2OS2v2NYvscaT6vIU+Rd99f4cWeuICoVgQRtyA3nrF4BPBRXGmq5twXM9//ruZ9vc0e/Twyfkh3H3DZUZ4v1CfC2PKF/NI/dPxPB9WkYc7jtlQsK9CdN5CAnIY4zlcdaI3AgeMjXXgnHIZt1HeZbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=;
 b=TzaTqOYYIivOZCoDxAX7w4bKkU0b44AVjg6jCEPDhSqGBa+FkFA+NDZWvTREslXFiCgJyB8Cv9MIIRic+xE046feGyeaJS+hG4XrfIvzTrG8u0UGVGKxdeIljcHE423ggRMOsIecNJl4LStGjpj6OzyfMYSHEetBzO5FHrGlX9aGHL6RtRBa+Ne5UfyUnKV4VQ04QHwiXAhy+Kh2y3PhCbItTm7O9AsI+9dU0lFhHftY8Os9dPwE6wmAvRRQBMcPbyoTUq8S9qbiNTJphkmkvCJF2TgI/ZMt8kCvm0iv7Jmk86uf89WW7Td0DGLndZpnm+x7AtOg8eNyBPhgfUsiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=;
 b=qhducTfsTZPkrUqB/tOI5ck3zLSJVC4R45Df2O8jZShttH/J6JrRIUDBpIXScLLKB5T2FQ0h65hEdIWXoQsvAYE5xkQpBf20lXAHMPiyiuPnRXUDcehdyrdWKJ4k6rvTGlMXJzjhOyYmfQb9PYN5etiaB1qFkQoxpBhbJ3mdqH2KMwuA+Os9/9bp146weYzoGFg25JPpkBvEOWrTm/cr5ZUsWK28AI8mMB67xGO/Xj3E00lRVlAK5mquZpASv+2QoSFW9Qk0oZSxyJANr+y3WvCzET9Ek8+xmQF6B2TLajoGMgTYjXOLG/O5zETpsBlf4EvtXpQTHMk9HHR3aiBV5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 03:56:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:56:37 +0000
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
	loongarch@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v8 09/20] mm/gup: Remove redundant check for PCI P2PDMA page
Date: Tue, 18 Feb 2025 14:55:25 +1100
Message-ID: <260e3dcfaf05ff1c734a49698ed4332b5dae04c2.1739850794.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
References: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0048.ausprd01.prod.outlook.com
 (2603:10c6:10:4::36) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b667c414-988a-479a-4ddb-08dd4fd03e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5clS6N+OTL1i7vvuaCUkdCX2o0Zm+ISqF9kgSAnleGtVqudKHKgaz4c/hsUl?=
 =?us-ascii?Q?YXkrmVlCyNl4RfFKq5H9YiHVtFEM6NrbfHCY4eRx6Nbkd+Cjw2XL5V+0f0Gv?=
 =?us-ascii?Q?ZbDA8URdeWT1LF8nu5hI6pTuORy/7m3L6dwbv/0sM9IIAn2xp/DGMuQDvEug?=
 =?us-ascii?Q?VvXiUD2eIY1EoQb/HhLhFGF9ous8zVjRy8caZociGoJoUzlS39TwR7Gz14gk?=
 =?us-ascii?Q?jsxbfLh/TZ/B8twUpocCcIa3TDzZ431LU/UVX5DjRK5Rvpp7Mw1KmuNeXRVt?=
 =?us-ascii?Q?o0OA4ZqiCYf9H6G4ZVlgJOqgTo8jrbf56ilwugsMkBcLVpif0xgW+aDinBxd?=
 =?us-ascii?Q?GiWtFmXVBnm/eWVKpRaJGi/YMRCfzeeO15QrBZfi5smr9uN1bJV5cnDCODQE?=
 =?us-ascii?Q?bDa5fsp52yvAVoPCpQx84g3upjOZFO+p9GP452YypY3z3UWuK8UY7hUrfcNP?=
 =?us-ascii?Q?1OEZ+smR0Fjo2jdTvM95bzKiwTVlayxnIH9I7ecEgjcCEX3NRsJA58G7hYXt?=
 =?us-ascii?Q?820gFok644jOypxNOKxhRgz6Jk+MDkuFOSAOcqickuvvnF03Kjpld8xP6A9r?=
 =?us-ascii?Q?lb1VvHqGOQwVE8+pvp+TYqpeVz8lZjbxCLiUUNYocDX0jTE3+4Ern6BQc0ca?=
 =?us-ascii?Q?oUhDAn39pebgs/WJi4ib6uLIa+DGSYsfvKEFMq+KWj4t4JUKZQtqhEWukYJs?=
 =?us-ascii?Q?G4Ha8Q+iGFPGr6/H8NWss+8K14r60kO6uY3IKpuFdw5switsrJjRaa6xKwfA?=
 =?us-ascii?Q?DaNz0VS8TrbFKvs4SA86hpcp0gw8IF4FEVPQyPGL8MS2716yOdLmhpbLUEfP?=
 =?us-ascii?Q?j10HjLEdZXBp3eZgotddAwKmWQH318ZZ5RvIoMe9IRj7FYZaXLixkE6sX7b8?=
 =?us-ascii?Q?HVgoH5b5GeNnEFCAI1bLczc/K/9zpu5L1Ro6bT7fcl1vrcuegreF7iOt+mwK?=
 =?us-ascii?Q?vUFkvzBO17H3PhtAGo/bWjDeh0/oRnL96U9c3l3q6Thx+e0fCIsDd+DVrHRg?=
 =?us-ascii?Q?66g/jWE/LcZ3TU3jaC6sNLKjRdXZ91QF27URj7EKBcUvglyuy+4GwQzXP5al?=
 =?us-ascii?Q?Vmg9jLKdjih9JkF9WjHSldkjftH0GhhL9spas5ijJeExC6W1EaU70c336IQQ?=
 =?us-ascii?Q?ArgOPR30VFK3rICYiPFpwOM3ZsvYtaY1wfrkH9r//hDFLeHM9Di4xL4oHIWv?=
 =?us-ascii?Q?prQwGJ9suEvgVZCcM7DdHx01YD6Cdfg4n71gauCKWwKH1H1MWc9wlrX44jtH?=
 =?us-ascii?Q?c1hb0/yXCavTcoN8SnN0PO4LJn7S1/ajIQiIrYr09e3XUPztAG4r1u2V8zVe?=
 =?us-ascii?Q?9BRGd9LqwOFx7d3r5ZIBgaAugM3SMYlZR2W0B61UzrHLS0hprRpnVOcGgI4p?=
 =?us-ascii?Q?leqd5yNVcwDsIMVzcdwhTMcapv/o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JzwW3jXhQKFbM9kRzzv7UbBIbG96xPQUm3O+a1LPQBFFScuhbHzsdcQ2xNcG?=
 =?us-ascii?Q?4C15qGvoL1VxZuUD7WabqbMo8ZOeywu7NAc2P/A/xHleIaFXFsJxcSqyykx7?=
 =?us-ascii?Q?RARf5zb4NifvTwPbcDJukeY2l6Cv4EmXB3gC0DTH3/bGvOHkT2PyqPVUjNRE?=
 =?us-ascii?Q?q6nQXrEp3EAz7OPEYhCTx3lKzy45L2RQnbL1pZh0ACX4N7oylPeyeHnEKP1S?=
 =?us-ascii?Q?5Uyz0tfjDPbSvx53lrlKoUugKo+lNdA+V+kJGoeIqzzsN3nODNcOQ4ghKlkX?=
 =?us-ascii?Q?tP3QTI9t6QY1WaHs3cOOd8woAzYVGFS8giLeh6CX8cMdMvFQqcZtm+eh8U6D?=
 =?us-ascii?Q?YWUNVzfNZAbvhPZmsNqQAVGytoswPlUp+mP7N9eHdNlq7SxDg9aAhsF5OxDN?=
 =?us-ascii?Q?zYcZydEyk4QzaCnx62fU2IaN7i6JHo6qxtS0+eeIQcWqB/0FaFTnQlxtAu+e?=
 =?us-ascii?Q?ieHSpe4IOoqlBb+tFz89+CP2Gj3AegjCiZtbuO9u2+x9S5F+3+43we4FfNld?=
 =?us-ascii?Q?jzqm6Fvgnzdtu5cIv/yvICgL9Grt9ry4N1Gi4W+9ZgOINQjInEyZf2rYZDXN?=
 =?us-ascii?Q?ZefSt8XhQE04OTqLWHyRQJrqouCqbUfxBlBiKiDoAH9VRAPKJlJa1edeli4X?=
 =?us-ascii?Q?ck4L2ZnxKuUv23lKoUF0Votdeg0WWgXRi/hWjei9zrRavVLyHOeF82Fd2iBL?=
 =?us-ascii?Q?pLp5aHCoM+CDT95TcemSvg+nFG0Q7wH28OQPHvRrG3vvAxJjv75kYaHyCBGW?=
 =?us-ascii?Q?TdhPjpFlTbI+JBTwg5TvvrlnaiEfOJ8Wc4ubKcd58q1CAlMdUxaQUOd9bEDL?=
 =?us-ascii?Q?UjH1slX9K4Q3lPRcApPy9KqZOCwwZvE9qDbPVoz+NCaUsc8XmBjJl31Qfj1J?=
 =?us-ascii?Q?+Ls+rnAdJJ9ZXn072J69vIrfwXwmyS5QszDc6U6rgaQqi6cuwtHpbh/ijSU7?=
 =?us-ascii?Q?0j4cD0JhnxDWalr4rGqf6B3eeXY7R0wWTZM5x0PzMb0jjlf2A2/q2dLkxMxV?=
 =?us-ascii?Q?IJ7Qc1AVEIhRs0gPO8Q8r2siNpXv+uXnYN1fhXiUXaF2R7fLG4kr9zPR4KAI?=
 =?us-ascii?Q?98WL5rzGV2OxQPQlhXlc9uEOZCoU+V/9w7H6orrNHtsUisjhe0MpF5GgKXUp?=
 =?us-ascii?Q?YaFaTa0eWitE5qCuGTkdUFNHlFjWwMo49pTp8ziPB39cvTkGHj61CdbaES/C?=
 =?us-ascii?Q?G6cHVqnsXRF9vEAOSZbyLJTnGJX/hX7CWOoqaNjLVAfgxoPFADcAHeBbWYEY?=
 =?us-ascii?Q?fN+1mifoZVUsamN/TD8aNuHgSIoMhiu3xbhLhT0KqWd5A87sac8FHCVm35j0?=
 =?us-ascii?Q?GFhchADcDNgc+B/bjWbG9ZQp3w4Uf3ts3Geh66Gb1SrBYKhkj3O3E12SktaE?=
 =?us-ascii?Q?VsDORrkrgb4/Dy/jEy5EvSvEOZhKuPUCxAnep6AA1+VoqqaF9LIoNmA7wtJB?=
 =?us-ascii?Q?21wVzuFxeEA6eC9LiGHcChfXZK9Xt9MvtSCE/Jdw3hDsILhOTSQnY/ACvDDF?=
 =?us-ascii?Q?ky7qAzeLD43DXJxQmpcXtl1DkOjt0fAk8Cr26f7KnS+FJrQ0q57OX22LrKAz?=
 =?us-ascii?Q?kMKKlF+Glw1a0KC4gTRqu2y0h3hgeziEm4JBqUm6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b667c414-988a-479a-4ddb-08dd4fd03e0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:56:37.0648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aY9RXJvW4OoNkDRPQtKemLPN5gDrFu2oBrL7Du9f0qqAwKkhO87SPhGzEsAEFTY03psRiTQ3FN18Nh62epnHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
check in __gup_device_huge() is redundant. Remove it

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e42e4fd..e5d6454 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3013,11 +3013,6 @@ static int gup_fast_devmap_leaf(unsigned long pfn, unsigned long addr,
 			break;
 		}
 
-		if (!(flags & FOLL_PCI_P2PDMA) && is_pci_p2pdma_page(page)) {
-			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-			break;
-		}
-
 		folio = try_grab_folio_fast(page, 1, flags);
 		if (!folio) {
 			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-- 
git-series 0.9.1

