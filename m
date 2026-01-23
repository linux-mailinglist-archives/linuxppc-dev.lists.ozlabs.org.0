Return-Path: <linuxppc-dev+bounces-16193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDSxNgoUc2lksAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7270E3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7DQ1F3fz3btw;
	Fri, 23 Jan 2026 17:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149430;
	cv=pass; b=lJIWf9BFsoFsr6I5qtHW1xU/9QWQJO+Bxx3MoJLnS21dne2RRaTty4kXZXhEtAmowNWMGvOPIgcwgsfGKunDg4z55mzg3L7JSjMEaoVIgrT3uvbtkxf6L8bEu3DZUi/yKgTHYgyC4Q/4pSmN6sAcxYYNG7cwRbsS8FDMFV3Y1Og+5XW3odIEZSE83SMA2t6zFzZ734x8m4LQvHOBd3DWQRphQBeVs/C/oqredk61+iBMQAPlNaWMXIL7CjSJb0emAKpyN7ioJLCfo12M1KMzSLwc1a0XNxF26FpH5HCacP70Qvj8ghLTd9roir2uu7Ohqf2u4YHENCsB6jMG9o0LZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149430; c=relaxed/relaxed;
	bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P/M6Ox1ulqPrptd5pGtXZA9OTCNO6LJIF77oCFrpSliEHM6Y7aLard/xurQIwTt/aNxWgxcHnKfWJ3P3UWreqaO/aexmpqEN/2GlZchJVprrRU42jUJOIv9olb/E1o4B3U2Kb8Y3Ze2A1fJGag+yDVMdriTHFWlPB/gL5lJhD1VDvuD3J9jchTXIwZCx3Tt/IG8q+ii5D0gbBRTI08/ftENlH+4tZabMKUHlZlBXa5yXMpJa5JT2Urh/hAkYCFUdJgQuHvdB1TuqY8A3R5Lg7bom71tN8qRFBmRb1nOnjpVU8ggQvYxySzrkBpZ3Iwh4/cFOY96Zlf89FNmDOX2kPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hCui4t0R; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hCui4t0R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7DP0Xk0z3bll
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:23:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYgWtDcWkWUmHDFlqop9QNT4nfVz4H/NTSudxVVQrhGc9XduEOaNMMCKmgNC8KYls/1JT8b5qReVBXxnnYioHpUPS5vCOdV8mowo2glSnZtQn+OZqHUPAqQ8P/8hDOFoRXvstUlMrLyfvp51TjjmW+zuwQHH8pMgkus38yK5F9bqTWFebvOfQE/WbsnChUs5bPEzZMni6JUR7Acfm5nGWnuIocdiZjouGZDyn2lYe2BmGALdRwLzRyEGYQQPPAmzmvyfkRPD4+MBRv/Kc7G6y6ZRL5ImELX6dV4XplK3YE0nGz7nO/fmHX3s4zP8kAiid4AGIRwIeKMCsJYpy/4LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=yq9RSDLk4GeC1yzrePpKreBcT9+w6A4YTNc90kHAvT7sG8sSCd0d9G/BCNQa+zllb+681Y3ctFj77rHXkFTgh96GIYWg6mrfS/2G71ouuIrVCNaUeGBW3NAxUKuaIVKmUWqsY7p5sI3CZ/MZPbtiVYWmarHyM7UyUV20rYzgxVG/+J9TSz4jmivj9Hv77zBlDapcvlwO/7Etf4lDRl2ZxeiAlisopZT9ZT8MyHvlZP+cCAy68N6vYOKC1Q7BDNQMKBxZ5UTTsi6jXxGeyY4a7WsKFL5CqWEBW7/mXoMiuc4Gk2cN3Vax4bXyYcYXh82uTOPJBDvC5q7GCNSjI1Gv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=hCui4t0RPCLAQrLuTScBpY9r5Wtkqbn14vAGx48YZZdWyOXkTFha+RWLHJF8thAayJkxhU+MNr9/RNU7xsmyOwp3WGGP9Ji5ybYoDsav4/MJHlBBjBEqfh8LXWqhNrXBttUBOvAmcVObeJnwylqbjzVOAThjEVcU1ZZeQipO+tWjS72hMyvuEK6E3l86oKvLmnocjdxDeRX4wS7r+bHwXqguPFdhrVTl0BpP90rEdqVcy+lDypbw+MqTbrOVCQzn2pwbtN/P07B6hu/rCs91a/PeByP1WBwYvA+Bz8CI/FgKJW40I6d54RBwNsQQHYWvJMb425XsuWVr5EgVzzDlBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:45 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:44 +0000
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
Subject: [PATCH v3 03/13] mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
Date: Fri, 23 Jan 2026 17:22:59 +1100
Message-Id: <20260123062309.23090-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e255a22f-e7ad-4c43-bfab-08de5a47f5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIdW+BILR5wQwuOtB0P9RbvIaTdZ/eyGWMlaTtWV3q9PeBRyhfYAQJvzP9Fd?=
 =?us-ascii?Q?9PqrBoOeVk3LG+iJC4Gy3jy/67B/7yOVBV0YQ7GLQsg3fltyKD+PtBaD+NMC?=
 =?us-ascii?Q?Ci/ia+nPbgkRp5Te/MGmvZxfKg1RtDHBeMql96keUO/4mDsArKo7jCcSr8bX?=
 =?us-ascii?Q?LzPI9kLk9C/Iryb4cUSvGO70IrmaSD/Efv878xLUWVpIjBWwBgUS5+dltKvD?=
 =?us-ascii?Q?r8Km9JN8QdTlcbNxh7uoCWGNswAl3Ux2S1A0oIdpNCGBwB7EONPNN6eZ3+hK?=
 =?us-ascii?Q?9Zpixg7yygL3s8eJomFEIb5PUqOp0zS9hev+U5+MgOyNIsAd7AuyoVr0BqbV?=
 =?us-ascii?Q?+LBSUoR6Dif8gC6dzIQw+/dDow6/DUvGEZ+Cr0CUHfF+/Nnn28VaBL3bRRS4?=
 =?us-ascii?Q?zykQ469t4p2F2wJgsD0PuVEGOt3nIDhQJKh5H1hINuUm68KU9nVxaOzoCfvO?=
 =?us-ascii?Q?SUqIbkRORBwU4P+Rw8L5ZiBMcCsnKWB2PmIwmUL7emYhL3+Onk3g6cQJL/OE?=
 =?us-ascii?Q?gfBwmXUjCpdRxhJwFWIoNzjTKDiKrsP2yox2hBnxZljVgDFNQPkIF4SvEq3p?=
 =?us-ascii?Q?YSOovgMZJFIDpF9fuyyUE6koUi7lBNHmTiu3d9ufYDeCX8tHYcv3LE8GWdW3?=
 =?us-ascii?Q?JvJOlaZ6X0rxYrceV3kFf3vM5vEDFaBNjjNaGv1SOXq0N8NTtYBqTzTsFty9?=
 =?us-ascii?Q?v3Jh8iulDCDfbCDsjk2U7AcKK7Mfx290e6wTA+AsvYgsATTlCQICSFirHl2H?=
 =?us-ascii?Q?ojj70DBQ4dFruMWH0Yp2qA7CeNCGIE1WKZUNSqm16D/WWKaTkUniNxFFcIQA?=
 =?us-ascii?Q?leCaYmvZDzXTbD5cvd8HZriIJhv5b+a9AnWD9SqVWqmzw9y8re5uiYvVqqs5?=
 =?us-ascii?Q?bO7gnwJm/O+4Ifw48FyMyviJjiebuK9eONbOP1QBqQHIFxNzL27cZS6t4yms?=
 =?us-ascii?Q?/8nKliYd979CTOcSObVM7b1KVARch9TYZVakn7JdUTqxW1RrsVTftQfL5adD?=
 =?us-ascii?Q?fjx3idKDTLT+gZhHeGwcqo6AniyZ+9kALhuM0opY/7V/9TH5FY1pSqZm/eWM?=
 =?us-ascii?Q?3mv6b0LPb3zCdEJAQLELxCFlh8ZNU72C+ocEau1t8I/uoiBX3cKSbF7D7s35?=
 =?us-ascii?Q?TzRI7gqBO+9Q9xTZt1CbFEA3ANdB8DsJih5o7c2y27FGuCSX7Q9fzpMqNRMo?=
 =?us-ascii?Q?cLo6c0KZwedIVk7XGCAe76BeEGEXGcjOBYHGwVR0M6xCc9/mPyRbU8gqFPZJ?=
 =?us-ascii?Q?0M4DR8XZRJYPN01+KSasKxfxFL2eSVJNAG6f2OCr9Z+2eF0WG5XCVYQMAJWO?=
 =?us-ascii?Q?xQTZV9cYQT7BA/SeBa154jrVTjv3jnvqaM3Ww3MMEC/HaSpNo7sZjCmhFSQF?=
 =?us-ascii?Q?0ZtCAyOBlQYZgz2V5oaVMr3kZ6nPLnisfgiwenWRV5X9Zf4shg0mzRAj49wS?=
 =?us-ascii?Q?ySkANmg58GRGzKtEf0a9+THh/Z9VUceeyiLG9pzDlNcDrq48swx/mEFMm4X/?=
 =?us-ascii?Q?8CcMwGLnKQ2gU8aXFEX1Byx2+8IQHiuG9e1oIutLdpP1CV7FL3vmFGCqROjh?=
 =?us-ascii?Q?jUMBXiwqmGDXu27PMTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iyTjO2KaJia0w0b7TKtb6IDgA4pCtNV9h/HdnDmo3Z6SBDa69js4RAtv8frV?=
 =?us-ascii?Q?h8yUtXflQPCyUhQ9FGwYIm+ImnHSb8OyUq7KkemhejYVvX6EHirKN9pTScNQ?=
 =?us-ascii?Q?TNBalw4qF67rrhue2p9vLPiJMoN32iEyC8Yp9GGP+dp++UmOCQkP0yuyq/Ou?=
 =?us-ascii?Q?Br6VnSOtkH5ieFH0xL/TLkXrm0TR7fFotaQJVrf6b3KKr8B0MLj++9ucP+z0?=
 =?us-ascii?Q?hvt5wnDtVYwz154Hd8JBvda7w8xWLOcRGr2xlAP7ihVFp7krhbIqtwXsX1BI?=
 =?us-ascii?Q?4Hhzhu/DGn9h4Hfo/fjiBK4CGXtz567lv4XLDbgf5fMwWoG76y1OGBkce1it?=
 =?us-ascii?Q?zIbOFz3Q9yv5gM8c5twim3ZY9StjqVD1zXHzUY0pS1CmJRMjOt+yT2jwX/DR?=
 =?us-ascii?Q?/kqKgPvodciOl65EjAc5t0JwdsXxnkxC1ejKYbO4WXSdbQ1B+Q3AekHFrN12?=
 =?us-ascii?Q?qo1IBCzrpShAABQ1vs5XeDUJ+W1pohD5WizXqgTnJfejv3+bmwtID8XlykuQ?=
 =?us-ascii?Q?713GVDXNk8ATU/AuKb6zQbGq24vclN1ohyiyH4Z6sW/THCgjIOvNXH72Rkry?=
 =?us-ascii?Q?Ufbfe+ggVs6O+HPAwPL30v+je09BSeZMBZBZvf4Hu6bKzW92SHblhd6O3Eqs?=
 =?us-ascii?Q?nTCHPPZw7Re8HWJ923B2wRLHQOYh/4P1wTb4/+mnoUUDebP4cXXDsb0XS1LP?=
 =?us-ascii?Q?Ok0EBOKdbjcCuCiG7yEs8Ma2tisUp++1I+oObiehJQOzf2dqgFaNfan7CMQb?=
 =?us-ascii?Q?H1w14ejZORLz0xMhoNlIsv0myYpMZlXq86Pr+SoEWybV/pN/Ms1TWxVUxuMH?=
 =?us-ascii?Q?LpNyU8tvdXXa51ZaHeH82h3naHlgcyZnd93D8nbzVqIzAj3+4ZVIoHls9QVj?=
 =?us-ascii?Q?n/97VbDyVCkHXJWRa4Lw783rOtYyOkiRMEDa2SuEbiDl7g6um6n6qbrfmvxs?=
 =?us-ascii?Q?6jcAOYeun/zWO0uZmgismt0DB5qKyci8+0aQKCdaTXSZWhg4NOH24WQaWlxN?=
 =?us-ascii?Q?u5QMVKrE0qdCIR53hDgGOr2DfFXduRa350JT/UjUsSIW8qA76RHKxOG+L8eK?=
 =?us-ascii?Q?XMbENvW+dayO67Z4nlwYMz7nWLcd63w4ZGkSNO5L7Q5RtFQcjfnyNowdVxNO?=
 =?us-ascii?Q?+gIg/D7NfhVYDLNyzX64pwhfWF5msloStaHBtd646srvMUV4R0TGxn4oV3xQ?=
 =?us-ascii?Q?1gDPvfYCMeeStjOFjYfBR7uOE7dQKnKO6FdAG6945ulT12EqdH7ICo0qdgUS?=
 =?us-ascii?Q?s7aq5pS9Z5GkbgELV1ACXb5mrWGojiVLSkF2ySg/URfoFLrx1+hGpXmfTqOm?=
 =?us-ascii?Q?zMSRnciVyMRUGbxhcMbtc7YRnvnolYCHcV0KTnNxfCbJlDc7hPJCbCeQHm4X?=
 =?us-ascii?Q?pB/WACNUO1y0XbWGHA+hebXkYa5XGG16VfoUhOE7t5tA03RVB76Vuwg7K3TX?=
 =?us-ascii?Q?uh9exQ7ZPA1Aoilf80GePlvC2pLnKsxd+SkELpz8bRcQe3IQzeKfgloUIJ3j?=
 =?us-ascii?Q?EG8uqdHG9C0cZWnsxpC4SJOryjsR6N2RC7AXhmdhuoHr9mPbh1OKZTtL9zgc?=
 =?us-ascii?Q?VkZXIdw0W8S/V3EcYq+eGQRkVZpPyqa1gOI2V6YnM87uzrrUMtLW4vliuIKg?=
 =?us-ascii?Q?2R26jt9IY4BBwrk8t5150OATOG1XOVbYbxzLk5EA4XO3/V92J3vRUKGw8pRQ?=
 =?us-ascii?Q?9e11iriFsJTZjqkHYlSZg5kuEo2gC3uFfxL4dWfn2GR+sDZTjM+o9HjQrLnd?=
 =?us-ascii?Q?uXgkvo4jqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e255a22f-e7ad-4c43-bfab-08de5a47f5a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:44.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S5e3HtpcQPIEeQ4H1q3/O9zzyOxdA41ZithKzZuHLHUWPrTyxd9A7SyDXup+KMYHqf1KTpBSBi7eCAfmOi9ww==
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
	TAGGED_FROM(0.00)[bounces-16193-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.118];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: EAA7270E3C
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters. Depending on if the device is MEMORY_DEVICE_PRIVATE or
MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 526105aa4b05..13072c8665b9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -505,7 +505,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -590,14 +590,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_aborted_migration;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -624,7 +624,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -979,7 +978,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a7edcdca9701..bd3f7102c3f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..fbf5fd284616 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -10,6 +10,7 @@
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -752,8 +753,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -769,7 +770,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -777,7 +778,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..bffc7fd5bef3 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -192,17 +192,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 7e5248404d00..a6ff292596f3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1389,7 +1389,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1


