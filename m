Return-Path: <linuxppc-dev+bounces-15203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59631CF18E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 02:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkxJ55zB6z2xqk;
	Mon, 05 Jan 2026 12:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.62.3 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767575893;
	cv=pass; b=oX1Fr63e1orR1xTrXDYBh9J9q0yC9KBqwD71TW7L/3j3YojDqBB1emsymwYH+CQx2Dyn1sM0X0O6/LGesBgjmvxlhg4iE9U2L4nS54+k1aLEtAhTIjP7GUyJp8Lu/ZKh2RqyYal8kSorVq60idZUGtmg4wJJzdSDGZMEZ1vhJJmcYFYbR0SIPm9n1acjKoKVDdJm6yaiXNIWToKjOIxSjKwZTpLmzFAXzULAO6qIzjb/FNloPN3181gT8MriNT2fpnInqOVWE29MxeRWFrPTkDjz3ldY1TtOhAN1A3WT6YkeXFqMQNFDF3DX6qCwF+sVWlfIn0/dcu1gnaOhQByiSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767575893; c=relaxed/relaxed;
	bh=lwyUYXuNG+BBhxyEjMXtpMh0XxTRjyUFSKo4MQWQnok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ITiWc6DKnLNj6Ww98gk21t5E+cX0bGAahs8AiGg3CmCz63LBZwU5UNLSAosoQaBuxnrH3Rcws28rpuHU7EPHE0otNEkfaAT4GhimhgFUcSzQANzO+3x6JOqkk0Zp+Kimj7RE+lUhrrIunXuEsvNeGmUpPinaLEysJaOAAh71I16wH+OEN2et2kiBpcVYBVGkqTe2bhltwNCGCXSu2ncV1odMeCL78vqemG2i5PO2R0WVXIbwav445ykn52H5JzuQQOh3GvBajRjFZG8V375/zD7Uy15ZXMP8ekiBqLZhLitj6IReIgubhsR9bLQHeYebCKzkL2lH08ESnnwtO01JPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qmRNYTFy; dkim-atps=neutral; spf=pass (client-ip=52.101.62.3; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qmRNYTFy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.62.3; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkxJ43tH0z2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 12:18:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xncPgcH48tXyPUs+uz4Tmvl81QOrRdnSY1A5L2eC9dDcxbzD5yUltNwG154TIpldDOOPZ+MQFZEY2eQ8gmvH/grCyccXtHxBnDIMh9V7ESMmI/YHdA9pma5oZgMO2Png5jLUek5CZ3Y+GKg+DVUgOGqCUNBD4TTWwcWTkYAFOiZ190+YRzGyn6pIKdBC/EjWIWf2PAEbPjfa5ofJ+WyIrCfn6QNDQa7WjeLwP2MsDhqub5CDtrHlaDQboVSx9slKGtQl/pHmhOartxZvc3BBGhEkEyqeOs5Oyo2vS+qvn7Nn8rez/NM/iyOI4iH5okM1ZVvtgkmv/KQQZfzJObWfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwyUYXuNG+BBhxyEjMXtpMh0XxTRjyUFSKo4MQWQnok=;
 b=aBkv2kWHwlnquP4+5pO89vXo+oEHRR4E4l45MSZUdImCuArhniMxTasyYWblAxUVc4pLDFNHkRu7J4Ur0dpfV8SBqqIpytBnm4/9Ie+aIojNuxcZmRiTTRwEdYd+FFcsCxehog01l/7J+IJfY5QcmTfYkTlJAQt5T8NtdeTv9LqenTncZfchl68V6zRJKY3ie9jeE5djJ2ALxmzkwpVKY22htX5DLwVJgTPkBBUWYKQx3ItHNaVPzNwfbq91eQdcfS5f9gaSfxBisdMD/irve5w/UmhCvaZcpCZ5nedRV2dSMO+vqjTbJkv978O5YdKmcg698SCcFDmF7P+sGjgWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwyUYXuNG+BBhxyEjMXtpMh0XxTRjyUFSKo4MQWQnok=;
 b=qmRNYTFysruWplMcTk9v6bYygpiUU1mSZaCOeI5Kj23GhUsuxRVNewkVk+f2IX80sXSmdkUTCR24OAG1EMfpSLHB06Hxa7aE0hE6y/7u791AKpTF7IbUmSDZOIk1GTMeWR0eatF8hamw2ig04pRxpELxwNlDW0yhWm7qVkIDMedjpzc+8NAeStyePWyIiJJHIMNPeG376ekBzX3Nid/lIyKaz36iupquJrCFroRnAf4UhNebJvuE0BCHBbvPkBDAf9QIj1T6Z9m4C/K+RhCO+oIUcdtLONiFA8HJ+yr/Nz1TJcOqYgaNAKG0orznodm5L7Q0aAmYU48U1QXmVMLcQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 01:17:30 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 01:17:29 +0000
Date: Mon, 5 Jan 2026 12:17:24 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com, 
	dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, 
	mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org, 
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca, 
	Felix.Kuehling@amd.com
Subject: Re: [PATCH v1 4/8] mm: Add a new swap type for migration entries of
 device private pages
Message-ID: <knd4e43pwy3stoj5ydld4fl4kjzzjnsod5kpucnnhzgbs5hrmv@fxrcyzo7e72x>
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-5-jniethe@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231043154.42931-5-jniethe@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0128.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::8) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: f69cab80-09e2-4284-6c53-08de4bf8316f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8wJGB98IyBetxQv6yd28DHlCcq6Ygy59skohyrUD4vEyO1IoILwEJj1pZ8Af?=
 =?us-ascii?Q?OBLofdTf7SVshUpny7eXZNhv18M5gHbFEeaN9TuXvklqE8TnmpTtzMWWZKTo?=
 =?us-ascii?Q?yB+XOrEizETxTwrKK6CzG4uE/zPlnx4bvMd1xG4XLgIdAb3DRmPNFEXI/rBm?=
 =?us-ascii?Q?o2XsqAB7HIIPm87EcRyGvDhNQfr0DwZx9vhhiJY1YMuxW5rEUbD7Sk8Ekztn?=
 =?us-ascii?Q?peL41IqGyKDj8ZzAiufhL1qliH0pOyN2LTnAmLOTjxPqSJt8B4/XuLLQxUuF?=
 =?us-ascii?Q?koCXqCbNXZ6KgcZmWCLRs817GZ9lL9Dibmv11t+/UFrQxGLJpB3+6krGDtyF?=
 =?us-ascii?Q?pyu3eDYxeeZNNefDRe1OUX4VlYq0bGa29QeCkvp95RJYxm3GG+maqoXMP/Lh?=
 =?us-ascii?Q?Uup90kfoQAbVunUCclRfOvT4q9CsGOOWlPoM3/eo9Uha4ECsWZtlHaJmHOMO?=
 =?us-ascii?Q?cO3A5+VgNwizhHH+BIrgjqM406cZ08ORUr7UG95BjTjZWc8NqG+BuvAA4MJ6?=
 =?us-ascii?Q?QC/VueDlDgIBW5StIj7njIa6F77NJHyZy3k4CHXNHhK2TcoLOTo4N9sg9EV3?=
 =?us-ascii?Q?sDQpWlZaU+XtuNhydtaTAjFMuT4ime2fkJbg7h0eMTFKnoj3uFdmCOxjTEqN?=
 =?us-ascii?Q?J0Jgiiglcq5PI745ZrpLSsu0i4n0YJdYs5NJ6Wc4/cipTX5xN0ii8+tjZ62A?=
 =?us-ascii?Q?Tz4alvbETd9fnPCbqaqsOtW6yv7V3djZRrqN85l+9waxruUsAW5oBjiKI016?=
 =?us-ascii?Q?LIDXHjieQ1/tyho4Cw/R9LFkR8c889UlvxU5ThTHSRR+x7wpU+t3WX4wwH23?=
 =?us-ascii?Q?lXe7fovLjOv0kryMxGxbDOxs8ATKvsWoOy85h+wmnQptOcX86/xKzMPWJ8gU?=
 =?us-ascii?Q?g4dpgPZSwQgaSMg8EH4um19FxA2tnSzAAkqaaQe9e6qjJdmNhSwjM8tAOtwY?=
 =?us-ascii?Q?zmygOMNn9Jm9vhUpChAa6cSDD0CpEvV0P9u6FdNyWC346OMjIMW8zShC7w8n?=
 =?us-ascii?Q?cjw8d/swP+9JfksXSEiVPlf/bV+O77LhGEvW77Kd6CfSxXCvgZqFNUjli/G4?=
 =?us-ascii?Q?pvNQ81N7mBaUbip2yPCHt7Vers5iTx+hGjwKYNK0H7IgC5L6AqJrxDG8SojI?=
 =?us-ascii?Q?V3Vy1lWa0mTHgLK3ROjLB6EXb1d+NHyKJn214LdrmXOtkL5ndOso5z/jNo20?=
 =?us-ascii?Q?PwMpf0hbWO/XnAvI1XAGFtqueQSwW0GISzgdGhI6Hn6+dWYj/se2BiSw/M3J?=
 =?us-ascii?Q?1D+0VPUqkyt6BIAEPvDwgSuJDGPDCYzX4vIIstPQBf0Oc4EtvAL9/6z6uAoC?=
 =?us-ascii?Q?P+uZ03siDoMy9BttiimIUPZ79+qkTsoaO2iAWpcvAYPgc9ngdZsg6sHFSqo2?=
 =?us-ascii?Q?A9K8MXzxDqDKVp0+uj2mMmsp6zhGrxRkU4cSJnJTisP1vmTjYyPFeaQAjnUa?=
 =?us-ascii?Q?3zJtX30+V3IhLGJSeNyAUkAYiz2Hchgn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uzG0I/oQaTOl+3DEWBJDKYxJi3fZdmXx/0aiAoU+j6KI1XOD+tVoquHEGIor?=
 =?us-ascii?Q?kj4Tm00rL/XNcswzpxA6dbFb5RD0MhZG479g5Mc1f4fVCkpaNfn/B6eZzs9l?=
 =?us-ascii?Q?q+eZQrKJkokd20RajRCf5UJDshANyf8TIrtABvFjlRXjyvioRZlDnShlTDpG?=
 =?us-ascii?Q?8COlfUABPTeqqWZRL2/+Zb8ZsOvdcHokSKZPIbCE5VnyW85U98qQ3/Kjtsi8?=
 =?us-ascii?Q?TDTaOdzhoTqHU7HJM5bz/wsOW9lB2Mwr4VSDcPnY/P6t+7JKY5gyEJHZjPGw?=
 =?us-ascii?Q?DC0MNnPgiGQ3YvN/OFZzYR+MD+63+A+rN/hg52HbBA6cFLceFnsrtwdtyzPQ?=
 =?us-ascii?Q?bEz0suv4Wl5lZYzdpsEVTXNXLtHZ8sWnSHXvMcwdebiT32qsKqlb9M8XasgR?=
 =?us-ascii?Q?/KGMqcFcF1smlmjXBDuOG4cVX+avdMMJiau98JqqRZbFMvvbA4Gf7vEDcULL?=
 =?us-ascii?Q?dLUGFGFZwywzwWyLdMZnILuXQ6t03iJY0taJqjslFS8QHcYLZSGMB74vYw0G?=
 =?us-ascii?Q?sbxfEdj6kA72/YVAqVyZcpXb8d+aK8n+dAyqDMApJX82zcSKjXtjYZWJO/d4?=
 =?us-ascii?Q?SOHvyr+byvaxfrrD8RLXbbne91YGHHgbH2+sywCLnTIZ5lq0mWzh/UnhfKga?=
 =?us-ascii?Q?9jW6E08LhvOVsIHQzJ0WCjfN7wFraU8U5s2XsKSWcOBxrUiwAo1cFoWrlu5W?=
 =?us-ascii?Q?j7avD+MxhfdkYogp54MWnFQDQoZPOw5H0ygFENEw0lQElyp0T+eF+Ait0ROT?=
 =?us-ascii?Q?GoDTFbhoNzvzvivCfWRqURAWWAC35MzdiLZJEBiDDQ1j95ukeCTLI5EiC0dW?=
 =?us-ascii?Q?UFevM+EMqBDZ/yYZDm5ehi8/DkATJQ7UzSier1TDubGZvJ+cxh+xxyQKwF4s?=
 =?us-ascii?Q?1sGlQDTwj/4BVBzg4bOFK0plcssNjjVGCNwPPs/Gkb1TmhNJHuXwrFNgxLca?=
 =?us-ascii?Q?Ax+asY2HYgFuTwQ9mvm5yJLJ3c6tDld6E12vlFlD8aonySmdTfBLwsbqm1fA?=
 =?us-ascii?Q?XJfGJT8H6ai9iTdEn5bNUehUYppguujHB0TEy4YOCKx6tLty6+remx++khye?=
 =?us-ascii?Q?LubTwl7kqY5rg7QWPLN6r48/NL2WU8UVv1R8B14q6QsRfHCn95hBm8Qw6IOQ?=
 =?us-ascii?Q?QKivbaOqMqACmnWkkcpRRA68GpQnivndo0xPpRDeXyUAABe28lJpeax+WACg?=
 =?us-ascii?Q?49fhQy/Jr6U6kYYN2KvZg+inJNyPE1mpRi7dQKgdwJlBGvU5raQbr6Fup4vJ?=
 =?us-ascii?Q?OPQc99Np2TMBNFFoSWJEAshLonAxmPIAUBiT+FDLPzPaduP/4DGXanV7zgNa?=
 =?us-ascii?Q?C+681jpvo+stNWT/pKqZzsQXfz9+iK8H1i0gUiCbNWE625BtJWqo6+sUtNkf?=
 =?us-ascii?Q?lyO6fhRxhnaXPQ4gW8bST9DIAEA6WJ9azFvbbhQlS/7y4JekAJ9AYI6xpfhs?=
 =?us-ascii?Q?v67YVBAQgA4ALVbMfciFLPCOLu3fK/4LduKTvOO1TjM7cQ1nF8EbpZl9Q5Ov?=
 =?us-ascii?Q?HxB1hH41Dg8gteurOifzo7TDIg8O+RJEXqw6BkTdp6fn6NikcyECi4zP1i/V?=
 =?us-ascii?Q?neUuKkBNL0J0VnbNhB0wJgpptWg/sHT5T6EYA+ZI5nhkU0tsCEmunDnw8Lrj?=
 =?us-ascii?Q?aDkjwadff/H6DsnAzw/E3YV4XnzJ2U9/sDGcyjfly+VPEdfWhvM0b3cp+0D/?=
 =?us-ascii?Q?K113HOLLodcywAzypaxa8mzd/vYicKBWHrfjTE9VBKSzb+BMhajP8rQO/xsk?=
 =?us-ascii?Q?xaYPg1ly0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69cab80-09e2-4284-6c53-08de4bf8316f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 01:17:28.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZH29ju0hi5sya8bhVoIRWyU6a9ypawe/kEl4Ju5HWPcjAPa0lgtRfXbOnhUjr4RDR8/DzhcVIduZkG6a+Lv2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-12-31 at 15:31 +1100, Jordan Niethe <jniethe@nvidia.com> wrote...
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> pfns and must be handled separately.
> 
> When migrating a device private page a migration entry is created for
> that page - this includes the pfn for that page. Once device private
> pages begin using device memory offsets instead of pfns we will need to
> be able to determine which kind of value is in the entry so we can
> associate it with the correct page.
> 
> Introduce new swap types:
> 
>   - SWP_MIGRATION_DEVICE_READ
>   - SWP_MIGRATION_DEVICE_WRITE
>   - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
> 
> These correspond to
> 
>   - SWP_MIGRATION_READ
>   - SWP_MIGRATION_WRITE
>   - SWP_MIGRATION_READ_EXCLUSIVE
> 
> except the swap entry contains a device private offset.
> 
> The existing helpers such as is_writable_migration_entry() will still
> return true for a SWP_MIGRATION_DEVICE_WRITE entry.
> 
> Introduce new helpers such as
> is_writable_device_migration_private_entry() to disambiguate between a
> SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
> 
> Introduce corresponding softleaf types and helpers.
> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
> v1:
>   - Update for softleaf infrastructure
>   - Handle make_readable_migration_entry_from_page() and friends
>   - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
>   - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
> ---
>  include/linux/leafops.h | 70 +++++++++++++++++++++++++++++++++----
>  include/linux/swap.h    |  8 ++++-
>  include/linux/swapops.h | 76 +++++++++++++++++++++++++++++++++++++++++
>  mm/huge_memory.c        | 21 +++++++++---
>  mm/memory.c             | 10 ++++--
>  mm/mprotect.c           | 21 +++++++++---
>  mm/page_vma_mapped.c    |  3 +-
>  7 files changed, 188 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index cfafe7a5e7b1..a4a5c3ad647b 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -28,6 +28,9 @@ enum softleaf_type {
>  	SOFTLEAF_DEVICE_PRIVATE_READ,
>  	SOFTLEAF_DEVICE_PRIVATE_WRITE,
>  	SOFTLEAF_DEVICE_EXCLUSIVE,
> +	SOFTLEAF_MIGRATION_DEVICE_READ,
> +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
> +	SOFTLEAF_MIGRATION_DEVICE_WRITE,
>  	/* H/W posion types. */
>  	SOFTLEAF_HWPOISON,
>  	/* Marker types. */
> @@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
>  		return SOFTLEAF_DEVICE_PRIVATE_READ;
>  	case SWP_DEVICE_EXCLUSIVE:
>  		return SOFTLEAF_DEVICE_EXCLUSIVE;
> +	case SWP_MIGRATION_DEVICE_READ:
> +		return SOFTLEAF_MIGRATION_DEVICE_READ;
> +	case SWP_MIGRATION_DEVICE_WRITE:
> +		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
> +	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
> +		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
>  #endif
>  #ifdef CONFIG_MEMORY_FAILURE
>  	case SWP_HWPOISON:
> @@ -190,16 +199,62 @@ static inline bool softleaf_is_swap(softleaf_t entry)
>  	return softleaf_type(entry) == SOFTLEAF_SWAP;
>  }
>  
> +/**
> + * softleaf_is_migration_device_private() - Is this leaf entry a migration
> + * device private entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is a device private entry, otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private(softleaf_t entry)
> +{
> +	switch (softleaf_type(entry)) {
> +	case SOFTLEAF_MIGRATION_DEVICE_READ:
> +	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
> +	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
> + * device private migration entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is a writable device private migration entry,
> + * otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
> +{
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
> +}
> +
> +/**
> + * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
> + * readable device private migration entry?
> + * @entry: Leaf entry.
> + *
> + * Returns: true if the leaf entry is an exclusive readable device private
> + * migration entry, otherwise false.
> + */
> +static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
> +{
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
> +}
> +
>  /**
>   * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
>   * @entry: Leaf entry.
>   *
> - * Returns: true if the leaf entry is a writable migration entry, otherwise
> - * false.
> + * Returns: true if the leaf entry is a writable migration entry or a writable
> + * device private migration entry, otherwise false.
>   */
>  static inline bool softleaf_is_migration_write(softleaf_t entry)
>  {
> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
> +	       softleaf_is_migration_device_private_write(entry);
>  }
>  
>  /**
> @@ -219,12 +274,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
>   * readable migration entry?
>   * @entry: Leaf entry.
>   *
> - * Returns: true if the leaf entry is an exclusive readable migration entry,
> - * otherwise false.
> + * Returns: true if the leaf entry is an exclusive readable migration entry or
> + * exclusive readable device private migration entry, otherwise false.
>   */
>  static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
>  {
> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
> +	       softleaf_is_migration_device_private_read_exclusive(entry);
>  }
>  
>  /**
> @@ -241,7 +297,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
>  	case SOFTLEAF_MIGRATION_WRITE:
>  		return true;
>  	default:
> -		return false;
> +		return softleaf_is_migration_device_private(entry);
>  	}
>  }

See below for a bit more context but I'm not convinced we want to include device
private entries in the definition for softleaf_is_migration(), etc. It seems
to me like it would be better to make callers explicitly deal with the device
private cases separately which most seem to do anyway.

We also need to be consistent in the definitions - softleaf_is_migration(),
softleaf_is_migration_read_exclusive() and softleaf_is_migration_write()
all return true when encountering a device private entry but
softleaf_is_migration_read() does not.

> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 38ca3df68716..c15e3b3067cd 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
>   * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
> + *
> + * Because device private pages do not use regular PFNs, special migration
> + * entries are also needed.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 3
> +#define SWP_DEVICE_NUM 6
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>  #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 72aa636fdb48..2bd01f97b4f0 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>  }
>  
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
> +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
> +}
> +
> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
> +}
> +
> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
> +}
> +
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  	return swp_entry(0, 0);
>  }
>  
> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> @@ -175,6 +242,9 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
>  
>  static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
>  {
> +	if (is_device_private_page(page))
> +		return make_readable_migration_device_private_entry(page_to_pfn(page));
> +
>  	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
>  }
>  
> @@ -185,6 +255,9 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
>  
>  static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
>  {
> +	if (is_device_private_page(page))
> +		return make_readable_exclusive_migration_device_private_entry(page_to_pfn(page));
> +
>  	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
>  }
>  
> @@ -195,6 +268,9 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
>  
>  static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
>  {
> +	if (is_device_private_page(page))
> +		return make_writable_migration_device_private_entry(page_to_pfn(page));
> +
>  	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
>  }
>  
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 08c68e2e3f06..bbfe5e87884a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1800,7 +1800,11 @@ static void copy_huge_non_present_pmd(
>  
>  	if (softleaf_is_migration_write(entry) ||
>  	    softleaf_is_migration_read_exclusive(entry)) {
> -		entry = make_readable_migration_entry(swp_offset(entry));
> +		if (softleaf_is_migration_device_private_write(entry) ||
> +		    softleaf_is_migration_device_private_read_exclusive(entry))
> +			entry = make_readable_migration_device_private_entry(swp_offset(entry));
> +		else
> +			entry = make_readable_migration_entry(swp_offset(entry));
>  		pmd = swp_entry_to_pmd(entry);
>  		if (pmd_swp_soft_dirty(*src_pmd))
>  			pmd = pmd_swp_mksoft_dirty(pmd);
> @@ -2523,10 +2527,17 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
>  		 * A protection check is difficult so
>  		 * just be safe and disable write
>  		 */
> -		if (folio_test_anon(folio))
> -			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
> -		else
> -			entry = make_readable_migration_entry(swp_offset(entry));
> +		if (folio_test_anon(folio)) {
> +			if (folio_is_device_private(folio))
> +				entry = make_readable_exclusive_migration_device_private_entry(swp_offset(entry));
> +			else
> +				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
> +		} else {
> +			if (folio_is_device_private(folio))
> +				entry = make_readable_migration_device_private_entry(swp_offset(entry));

Note that device private folios are always anon, so we should never hit this
path. We have enough other warnings scattered around for creating device private
entries for non-anon folios so I'd just remove the else clause entirely and
leave a comment saying they must be anon.

> +			else
> +				entry = make_readable_migration_entry(swp_offset(entry));
> +		}
>  		newpmd = swp_entry_to_pmd(entry);
>  		if (pmd_swp_soft_dirty(*pmd))
>  			newpmd = pmd_swp_mksoft_dirty(newpmd);
> diff --git a/mm/memory.c b/mm/memory.c
> index 2a55edc48a65..8e5e305bc2dc 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -963,8 +963,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  			 * to be set to read. A previously exclusive entry is
>  			 * now shared.
>  			 */
> -			entry = make_readable_migration_entry(
> -							swp_offset(entry));
> +
> +			if (softleaf_is_migration_device_private(entry))
> +				entry = make_readable_migration_device_private_entry(
> +								swp_offset(entry));
> +			else
> +				entry = make_readable_migration_entry(
> +								swp_offset(entry));
> +
>  			pte = softleaf_to_pte(entry);
>  			if (pte_swp_soft_dirty(orig_pte))
>  				pte = pte_swp_mksoft_dirty(pte);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 283889e4f1ce..61542a80074b 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -327,11 +327,22 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				 * A protection check is difficult so
>  				 * just be safe and disable write
>  				 */
> -				if (folio_test_anon(folio))
> -					entry = make_readable_exclusive_migration_entry(
> -							     swp_offset(entry));
> -				else
> -					entry = make_readable_migration_entry(swp_offset(entry));
> +				if (!is_writable_device_migration_private_entry(entry)) {

I had to read this code a few times to convince myself it was correct.
I think it would be better to not make softleaf_is_migration_write()
return true for a device private migration entry and to instead deal with
writable device private entries one level up, same as how we deal with
softleaf_is_device_private_write().

> +					if (folio_test_anon(folio))
> +						entry = make_readable_exclusive_migration_entry(
> +								swp_offset(entry));
> +					else
> +						entry = make_readable_migration_entry(
> +								swp_offset(entry));
> +				} else {
> +					if (folio_test_anon(folio))
> +						entry = make_readable_exclusive_migration_device_private_entry(
> +								swp_offset(entry));
> +					else
> +						entry = make_readable_migration_device_private_entry(
> +								swp_offset(entry));

Same comment as above for non-anon device private folios.

> +				}
> +
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_soft_dirty(oldpte))
>  					newpte = pte_swp_mksoft_dirty(newpte);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 7fddafed3ebb..b19820a51e95 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -255,7 +255,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  
>  				if (!softleaf_is_migration(entry) ||
>  				    !check_pmd(softleaf_to_pfn(entry),
> -					       softleaf_is_device_private(entry),
> +					       softleaf_is_device_private(entry) ||
> +					       softleaf_is_migration_device_private(entry),
>  					       pvmw))
>  					return not_found(pvmw);
>  				return true;
> -- 
> 2.34.1
> 

