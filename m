Return-Path: <linuxppc-dev+bounces-4733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C40A035F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 04:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRxjL4BXMz2y8d;
	Tue,  7 Jan 2025 14:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736221414;
	cv=pass; b=TNSih53l2mQIhoiY79+wEHlmLmrmFcimPNsCm/C/RL81cpPEIeq66D0WWz7DKFpcZXg68VWRUywFMRvZfQjoG+AYhLPYywp8N17513w+voWz19mjv2aXNKnRpSHwXmgtLflUsDUw1zslGGPmRYoNhshmdLT3kawKlINpYkdKt19v5RL6PguEmYhBPRjAuRFpdZYb4X4WYjVO3PMzyl2AwPBErYghPw510FzmfaxniG+0xGEilP/yfz+EleCgLM9Fg1Jv/kn9MXQYja49fnumW194XsEeu7Q/GU/BteoB25dSyUR2rcJ/aPs0lYIfjpEM7OcXKjAQk/H/jIjrle9GHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736221414; c=relaxed/relaxed;
	bh=p54xDpSMcpfpFU3zdQGXgiKs6ViJz/NPgxrzUcuVzcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=le3FD6xFtHmQTytwhiBJIh/rEn4zlIXt/SaLo38QUQ37L5JrYnlLcHpNHKY0gzRYe02X+DJIUgUnepj5lAfZGWBKohARmza8gDkXrpRCfrpm/xm3zDGdEGlOq+9Dt5Opu0qZ//TX35+RHp42KMzYK20KDNKo2nTY30Vq8pmKyXb6uqxjzZPLGqNSYpbJjdQM9Nl0Pw3GKcKhyL4RNxEBYSfpRmcpk3d1xDW30Q7KAhuTdHx4B3dBtO9hF5ZY2UVyzvtfYZismde3RGGV+iDU0XIPtqzhBXxRiOjwOfK4cEDW2xqCBbb89p1NRrFDv37DFad0ff0zCJV11GRacd5IUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LfOrDeR2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::61e; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LfOrDeR2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::61e; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRxjG3sJSz2ysv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 14:43:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfZnwKpy394sqAKEs3ozlkbHrRv/FysXtzjPD2tgJTYcCCGhEiZb03C1DsMGsG15Hr7aIfNUD60WSvCwO84ZlteTMowLnGr8rJvhbcF8poDg2OA06SMJndcBHSmrt9/gNNBR5rxW4ZTYqmXiiBUjlcz7Gn8qIIdfmkU6PtdlpoOjgAkEcDDirNVKbkikKLVvw+1gBDY65bcPI2m8ty2Y2ZiG92HCf8BU1zhOlT7+pCuWg5a64cEBAFsUS74IaUJp0OnfjJPhNhWf0FOh9rSSNvqOx/kFPQoJu4qxpXktjw3bO4Ycjq53fwoTfbidjtWmvj/RVAzbhZjh4k4bAqKwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p54xDpSMcpfpFU3zdQGXgiKs6ViJz/NPgxrzUcuVzcQ=;
 b=K6mcsk/i1gkWgA7lk6c7E/PPPixkYRiGaqNXq4N+3GB/VUx6NxvqQlAKdndcPvJABZYEKBT9YFpNzn+h0JCnIdmxegHTxww4uliOfJmBNyFzHKnqfOy/78PTkZoelKL4Ai2uMIZTCRVK+44uZU8X+kA4MgwIz3B721bGY4l9O/Dq/5+5qI1RN0Y399S4v5M6HDGvA1vJhdPke0X3kUoTNkKp/uetdK5cgArqbmMLZ7N4ra7I37LG7xHROobO2Us4tFfbwXlWAcYNaDZH5QE5PlakVK5nttpTtvdY+WSBlnlNSJSaLAHw+QRMz7WUGi8y70wYw+Zdh/D3atG6oyszfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p54xDpSMcpfpFU3zdQGXgiKs6ViJz/NPgxrzUcuVzcQ=;
 b=LfOrDeR2ogwBZrfEXmnayxqUeMPq9FlNboQEJ6Re7U4akOJ5Qd6hrJGMZ6ldbjP0oAbHEpbNjRarxWhIT55iJnCMX111opcLPvjaOfT6z6Lar54xfoUK29OZpzIXNeXJDNX+g/MF8wc8hakW9JnJc/jEQhpmnnVWSjQ0ludTECETwQn50yR78DG6WnXnWGo1HfTD8GSX6NJ2ds7CF1yoWw7vgaP001Icp+E3V4fkIITaj5jmkdGJx5yWI+faObemmTxrDHo4dJXf3jU/yM22VZCR/lPnMI3Dt/gIlOoMdoHh//v+E7obae+GOb57I7WFYbyIwe9kMOK8hPCXimffvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.15; Tue, 7 Jan 2025 03:43:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 03:43:07 +0000
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
Subject: [PATCH v5 02/25] fs/dax: Return unmapped busy pages from dax_layout_busy_page_range()
Date: Tue,  7 Jan 2025 14:42:18 +1100
Message-ID: <db02794f12a4cc8c659a1123bdc90fcb4dcb1104.1736221254.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0106.ausprd01.prod.outlook.com
 (2603:10c6:10:246::24) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 50f3ef15-c25d-4e5e-f9f0-08dd2ecd662d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dp5gI0xRBOkG5n75skity/By/XlYbi2N42TXmQEnyrEkfH6ROwVD8N/X+0Fa?=
 =?us-ascii?Q?SVCMNv+WDEnDaRUEAZwizu7R3bAIsK3schXWg66ZJ0J1bQdEpW4KWNCyeAT3?=
 =?us-ascii?Q?tim7LXQ9ZYa5spV2YTDf54P3mDxqhfJ0Tag0FEalZWjJvIQm8trp72Wzpf35?=
 =?us-ascii?Q?F2GXXPy9+TW1j84CF9fRVdWPi4+TbGORD+Fjb1Zh3GUJsjmSmYMYnevA9m6E?=
 =?us-ascii?Q?g3PRlPysg2T3p3aY9ZV2012rksv1Pjtjr0Xni83G5EJV0hThTIZZESgtHwmj?=
 =?us-ascii?Q?rXplu+WojGE3qpePA00m6RNcwOpW1MMNPwfZtYeIaYoEeuBXxCv83it2HuRR?=
 =?us-ascii?Q?sGDtRrcS7rnRaAjgoT9GsFv+1IVU8fdFv6J1haygWnqJ13ahR2zIxLwWT2mN?=
 =?us-ascii?Q?zPSQB28VkRVzQm/AIeg4yTtrqXxn21hgJ3qS7xV/pTVt/xVXABK9awYIxKxm?=
 =?us-ascii?Q?6B3IdZsfJrc3WAey88rHSf7d9SSPal/ha9Ie2nk+s++xTr1jNFZ+zvdTYEsF?=
 =?us-ascii?Q?kn16Bqs/7KNqPCcA/G4NyWAoPRlHd93gJGdfSj4DeOjd7qaWlftZaceYUsou?=
 =?us-ascii?Q?r6PC9ZyVAXNnTj8ljnUj1Hc89T/i4yR4A523U2JGx+XJO0XtctzMDjDxMx0L?=
 =?us-ascii?Q?7hk4WQDS0bZxVeMsLqyr2NAQ50FStI4B0Q6TkccSUEGyCpRJQlRsAu4lUSML?=
 =?us-ascii?Q?Dag1etqd1eqqhsLw3aqnWOfiaI2mTGbe0WA9dD/kZ0VADRmMipjYPeUScHEW?=
 =?us-ascii?Q?khcOvsi5O/SH1Tlb4vn2EPDX0tEq12kPFIQLvQfpmVsWor9eilDd1POkWgjO?=
 =?us-ascii?Q?d2F4fkn0JBgAySXQ272aedjNbRHHeuxXTk0KQiCaaTkp1HXbU1MY/lqX8C1p?=
 =?us-ascii?Q?UXK+fVJYPc7VaPkL8Pwq7vXGve+IlN2saQwOGTsti3s62PlRbKdX0tK5z5ho?=
 =?us-ascii?Q?PJGeZrUHBI6BImZJm+0hUByFUvo0f4uc/dspV4rt9q9DBSwucbA5gFuQ2mXZ?=
 =?us-ascii?Q?/Kr5Lar04VicZFfakLw3QRkFD173I39n/amKvLkB49XC8Y4hM8GVXcwMTCHk?=
 =?us-ascii?Q?onWk6UOXDNa+5H0G9iuaja8rRv3xfhmIE46VAodNLg1goUkA2DGXk1KcpauA?=
 =?us-ascii?Q?/ceWqKYOszr7VbZn5KwDoSx/FIxnWat6/Vaxsol4djvd4NlQyUEaZpZb8eNq?=
 =?us-ascii?Q?P8SDo+Wvx8zG9p5c1dNFXNcIFzJbDecoGHvWq9sTMyvh+lZlc1zbgc7y4ooy?=
 =?us-ascii?Q?f9TqrqCmM/P4o6LczIE5TCuUc4UoyykQE2BWonGKQ2xofCnJILUfPkfcKjtW?=
 =?us-ascii?Q?wdeaHCN0U4Cq1QcAgNoIaPGUjvTg4zlPO+0DFLJRJwDUux/QU8aI0Fol8AhY?=
 =?us-ascii?Q?FS44QdpW6hjnYay+p0wTaWSUs7pM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qj/Nqim71hA8rQtPsVN4XktDUdnzHmje0EE4A7fwOeeQN/A1fqzD2SpZmIuK?=
 =?us-ascii?Q?fsmSd3NLcWUd5iuak7gAIdDlnMucXgnXOi4GzEm5IrDM4MOXv2cA+osTYRDL?=
 =?us-ascii?Q?88I5MUqAcRlQQ5xlggiruKgiPeqmElPKdhssbXjaPh6S5aJq5Wn5LQSbbzL3?=
 =?us-ascii?Q?57hmdnrXqbcf3xtELRJaqa0pqFCNomPEG+AavsFDDV+kli/M9Q1Jh4OJ3zPB?=
 =?us-ascii?Q?z1D9YTCchQykK5seEGWXWM/wdKTNahemWL9ceaWl9jsPKovRPMTHqycs/4yX?=
 =?us-ascii?Q?M3zYx5FmFFHvFMPVcxACjghxJq5TQM8QdzRISDxRWuor1YCI1NWWV7MzftmS?=
 =?us-ascii?Q?/62zSIHav6MboC6ptmODSzzKP8lKL/NaGii9vJAU/V8SgTgeQRhlvHJMIh2b?=
 =?us-ascii?Q?SVOKBBtl5+Q65JN7KjhxINvkSlCG0x9T6aP+roaZH51RlZO2lq7cKTbxT9Md?=
 =?us-ascii?Q?5uUPe8ocgGEQ5dB4jaPuu38A4YyuUgW3iIr7CC2PcBH10fJjWpzqHcv8EOTZ?=
 =?us-ascii?Q?oTjnkYI8bc8SveDH7ZloaxyXOlo23flov11bh1pPjhsX4LSZFp71eVlH4qnu?=
 =?us-ascii?Q?HY+285dTAN/fdeNp1MVtoSXP7Y6pUdzVUpdjBR61T1yIgBPzEDJcHVCxXlFQ?=
 =?us-ascii?Q?8t2qbeLy7eQpx+1+RR9EjXgafFyJu8kQQ2nJeiwm4jl9zI9gAeVxKnodq/9T?=
 =?us-ascii?Q?w5JALDAJQqm7oquWnWymM3hSjdk/H2EWLSleYM3/l+KNpFHtKrIZEglMZ59j?=
 =?us-ascii?Q?tkxqtrs4iCydulZSCH93e4xLVwLz6yr2odPAggISzUzqQ6qwmWShQ1KGJ94l?=
 =?us-ascii?Q?O2o94xMkeSq6EqHg8erS6aI2SZoL3wniBNlgjnkyoEPjpNUejnsehN+hJrZZ?=
 =?us-ascii?Q?CxXeumFgxqxdQl4o7ecImC3sAWqaR0qy6fEaaZN20NH856hz3ywzTq2t1qpP?=
 =?us-ascii?Q?tHP5un+JCsrRHBWqEWtysXIe2zeLeHLOY6Mx3TeiRpX2BTBA/upUC4gQmftS?=
 =?us-ascii?Q?x/j8Hh0PVRUZvYTQytudokQO0bS9Bp1Wip/jRwfrpE3DbdVgzVwBmy/5KDIq?=
 =?us-ascii?Q?LQHdSZsHZCErWnbVy+sZwk/4sIGsoRuMP7yDKyvsbUdfRDvlPCFQInhOQBA7?=
 =?us-ascii?Q?G7+dOHRA6bPqqezZ6oAOZiIODYnMKazkgWTWMxvFV4F84R3lC4+dYWmxRDdT?=
 =?us-ascii?Q?wb6Zalq0slEZ6lSTOGZOgQCV2oZyvw+s2gtH8HXVz01dqjHUMiMgbtTRRqiL?=
 =?us-ascii?Q?sQBIFu7GkVYsYf7A5yJj89NGdYKy1JByHXVzCs3Kqc3PtOhjomqxXqOiFG3/?=
 =?us-ascii?Q?hggx07ynUZfUJNbYeQXZhsIkADBNQs3yRqS+xyyNJ3sl7iGfMc+W8sUeEW1E?=
 =?us-ascii?Q?6eq025/+79usp98EPbDeY0g7YE4QLZbF6Aym5fvoWYbvxpRJnN8pksbSUgmx?=
 =?us-ascii?Q?ztUp5lrcyg97DjdFDqo21XfMy3kLX7M86QcU+ep7fUEgMuwOEBdDq+lonwDK?=
 =?us-ascii?Q?u4ROv+JpHnNJoRJIw2JbGk/ARewU2ymnk/07s2IOBk0uiJzzIY3/PyXVn8XP?=
 =?us-ascii?Q?IjpY2eHxOYkmjB9kciVIZPjo15bu36u0gQNL12le?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f3ef15-c25d-4e5e-f9f0-08dd2ecd662d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 03:43:07.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzGjNQ9z6uEiLtMx5xnxTlaT1ZZEMAa+aX+0BV2uepNtspnFNh3gR1vzfg77ty4Pz5JeFNED7qhrXUB1jzwelA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

dax_layout_busy_page_range() is used by file systems to scan the DAX
page-cache to unmap mapping pages from user-space and to determine if
any pages in the given range are busy, either due to ongoing DMA or
other get_user_pages() usage.

Currently it checks to see the file mapping is mapped into user-space
with mapping_mapped() and returns early if not, skipping the check for
DMA busy pages. This is wrong as pages may still be undergoing DMA
access even if they have subsequently been unmapped from
user-space. Fix this by dropping the check for mapping_mapped().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 21b4740..5133568 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -690,7 +690,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
 		return NULL;
 
-	if (!dax_mapping(mapping) || !mapping_mapped(mapping))
+	if (!dax_mapping(mapping))
 		return NULL;
 
 	/* If end == LLONG_MAX, all pages from start to till end of file */
-- 
git-series 0.9.1

