Return-Path: <linuxppc-dev+bounces-16450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAI1MxSSfGkQNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FBB9E99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YHC5T7Gz3cFm;
	Fri, 30 Jan 2026 22:11:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771495;
	cv=pass; b=SIoTzQ1oMrGkw4sevTAIQHnTS3Hxey1ewywbnaOX/L6WWAcKg4cvMIDMS3wQnxE3YNfLhOnobr+qQEbnKoBgqBhl1Z2rt8gGIGppav+vf3YNCDAMuhOeh+s9KZ7JcIY8VlEIHg/b4hoBBptX5rUwYFCIIvoXfuYPUhwDp/oOtTnwp3W8KHyiFwA8euhw53fQ3IFW4gsH3031U0+hr69Oz9q0YRvg8oA+hH4W8AqMYf88c0ONFWQFg5oSqNPTIlGZ0jgeYP0UatAe1szlF0twfU9APP/b4fgF9OO8aaFl8sNJQZ8dYL1dZiU6yE7rsK7bO2aRiRNRjzXIIT7O7MKeeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771495; c=relaxed/relaxed;
	bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vj4zMzP6hK+uCHaQ9UpMvbGxaEpXhnepieboXy4bFVcykuZn0hx8Gi1hwqD7bfZmDkOMxobtodkkOyvcLdUm899Va2G9cxFOIWS63GeJN/Pkm1T9uM5Mkmu0vIkmv60YvdVnEGORXFm+bZaTcYDLkeqK0GLdjz2iboitkNaCOgmuSlxdtP9TrdPxGkdy+ZJpKUXdkzZG9qozfzY4q0WymN3fAS/Qo4oG78I9J6zQ2t4RarDMZbkCEdKwm3foiGCPiXTNol17AJJ09nPpyxSN19/H53aae2HjlEzv4RMXIiIvehGiizPn1zTBKNPcsLFz98N0fqY3GVZk0UWsfKefAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Lxut1tsZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Lxut1tsZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YHC00k9z3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VamDEumkwjbeSA5iEujXkNhDvfYz3dREjCmE2aoYQszxPx/V/71g/0yUccWHVGCKovSCppQK8x9KqO6pBKXYLygXQOfiDgie155M1GE/PLmS/6fsgIc183al2agEQJYnwnmo3fCpk789JE+JjLPPGHYp6Q37dUpR1I9AVFTkfdiTm53roWqfvO1oS0VAN+JXPIxa9W9fdXkYfUsM2E6ISgVeuxzZRY3J4vPicgxNwF7k8EsaExIeRHAOzJ6u6sYf89bf/XnhHkxk0HnG/TLnAihM7c9mhIstS4PDdkiAIFScGfRE7h+3BVr7o7z+FiQK94pPUJpyZRqoPUm0RcOW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=OlwdjWQaK0uu4RPyMAH1paNnNxi9iufC9p/bfATS6kIiF/gx554k0F9MGJlu8ekiLvcFjx0DChrf75llqdq+N6n4V2lEO5gQPqDRp7i3OQnyIKvwqhlbSFiaawQAePI5vuy6tDOs8R8Qy1aqEDUDwzDU3sZkbo6pdxrTsO3PiBUwyKyW1Dy+tWgmENyaxI07tNtsClMT5cn4hfQd7/T/fxvuOln4IgUQNlXEuiNaumIRy5AsJN6unEKXleKWnaerJIZwEc7JxeW1xuAgtuhg/64E7xXNUHSua2QIhHRa45xs0Y4v2GYK/Kp7W4kwzceVBFAAaWqJwSBHvdbiKB5p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=Lxut1tsZD9vvP/+2/wwlJ6u1+pA2yIL5SWz+e+MenVynRdkNWmbd9j4QiIxPAopCmNiRVpEPhIrnb3FP4Vm3AD0Cw1WvwK6rjKVaE71gN9cbOBgDVv5G1lo1YhA5l46sjZmRU1KhHUxWp4UCtT5/lip1lHu/aGA1j+RFEq8HFku4KzcJuOOZTZFZkLj9oVvfl9MIXuF+z2FtaPGZzPRLKQ9rxRxmPWydBj5Q9Kiqae9O0kb0WOiMTdO9YM6quHiGLqDJJoSXJHKthhpmTNpvX0Ql6mNKztasTLXqHcjMvchyAR/mCSqNXSkSKW7i9qaL6V4Q31/uon4275PVPFHTeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:23 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:23 +0000
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
	mpe@ellerman.id.au
Subject: [PATCH v5 08/13] mm: Add softleaf support for device private migration entries
Date: Fri, 30 Jan 2026 22:10:45 +1100
Message-Id: <20260130111050.53670-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 484101dd-66e4-4386-f3f9-08de5ff04db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsSDuEwbMg+PhRSHjdNfRC7wK5TmHB+U2K/ut/kiwvFkFg5yXR5skQzTrL+L?=
 =?us-ascii?Q?tU9Y2PxFWr+tW0W+9oVedBcQ6aEK0DVVorXENWlxJeuD8U88SdQ661dLUFVj?=
 =?us-ascii?Q?GhFoHXOEw613po7D7Dhmw1lPcnLH13wmHP2UIzlCk9cAbRJQekltL3uzcElu?=
 =?us-ascii?Q?/p929/VUvTIhbsTvQ7DaAX7NikpvL+5Za/SZ1yzR16JqDYnYflbxERi7wveE?=
 =?us-ascii?Q?JA4B5oZ9/RgOzoXxaXe4jweUkKbxJ0Xl6qfqU4p9nX/aCjBygcgYD93L/5/K?=
 =?us-ascii?Q?gPACLIZKciJj3v6xDvPiWbuf/4o8sk4+yH87gnEKlYWzXqtFRY5FwX+IpMEG?=
 =?us-ascii?Q?qaJE2O72IJTFDR7taSHMGf07zXw0wEErJcLLSXXGJA0hBfeuFIjW52G+H184?=
 =?us-ascii?Q?blnaZPK5umpT4UN68ZnNxsUlxOK1FkYEatG/ICW6tEJlPasXaIp8ZZv4/zti?=
 =?us-ascii?Q?oiwoIK9Ec49L7VHx8/M7/HLx5o2ovr2mKy97B5u0ag5qjCJLZB+Gz66aR+e7?=
 =?us-ascii?Q?198n7t3qfyMQICu29GbZFn49KjxDY8lOs5GTfcPtyBITvQHQggsf2EbuEX7l?=
 =?us-ascii?Q?jEZpTmQmCUE1vMgRYgfgCQqwS2UYXVYjGjC2CQ6pYb+AbcFmjvZ9ixmQll1G?=
 =?us-ascii?Q?5U/bj/OZu8FgLnNhy5dljbd1S+NdSzRGFeadGzBPPY6fo4mCgmXxu25t6MJD?=
 =?us-ascii?Q?3X7iKzUvYSUjUQcYgzjtRDgioLN87by24Uh6kjtyITtfXhQaqcA5WaKc4UZM?=
 =?us-ascii?Q?AHYpsboYyNRdlc8sc/Jx8QmUMIlWiJaN0+3+VusdB3Lac4BFDFEQ2DMoX+GN?=
 =?us-ascii?Q?67XiNL6QAsOQ2zMQvoF0ZajT7JA/MOB6atcQ4f2HXqBOrPiBbFUTu6Uh5Cdd?=
 =?us-ascii?Q?4C/56XpnjuG5PS6CIkHt+zBuOL4fn137eS9TvqH3aZcTWGynlQHFR1ASyZ3l?=
 =?us-ascii?Q?u3Qr8ekgq0qXCR++heljW1RcS2OdlZl9xyhoD9SwPgdGggfZs0J1sH5mgody?=
 =?us-ascii?Q?zgKtSimCjJTQ7f2pQdH6xM9wBnMJjkcNglTauhcADjp7tin6zpjzx+EOSuxU?=
 =?us-ascii?Q?wjOsqVW21ryCTJ4dyY0XCaIcxiNbA3TslyFKsIc/Gu7aCUwp0wCPoF5Jka1i?=
 =?us-ascii?Q?69t8JZXCyFRIynQ4cIEfIPEPKcuNYuhuLeEaURqBmn3n84zvrS2N5sNkfFYu?=
 =?us-ascii?Q?kMSHuUxxRsRcSc9bSyIwUHz+P61z8EuwpRIY73eKRigR+nLWfMitHbI6qDVc?=
 =?us-ascii?Q?a/sV3pJf7BY9653S86km+UeyKN+zNDTyn4h7pVP1lan7egMBvfb/Iu/dTExZ?=
 =?us-ascii?Q?Q/JYMMLYb+YnPBVIy9UqFDYTKTdwTUXQ4GXKK9RyawAGrGT5yHjL8eoXcj+S?=
 =?us-ascii?Q?/CQHsZ2vMptDc2dYEaWYDXcXOt3L3UQWtnbd1CTLrjvx4NW02KSyhkN0Tb4/?=
 =?us-ascii?Q?yv8kjoQ0fmtmztlj8X80kzvAtPduVf0Stt423UJ40NJ7LQx2J3maZED7HyNZ?=
 =?us-ascii?Q?BMmjCmDftaHBz5ul1LqWpbE5GIlqxRItC+YBEe5UstSBdgo8/8GPVUIbSjVB?=
 =?us-ascii?Q?pyU1hkxn8+QNmihm2c8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PcgbiHA6Vyn3DH2qm0YaTR5qmp+OHoBNe1uGniFVhRHcT3NW7dO9Ce70z197?=
 =?us-ascii?Q?K6F5bO2d/sGjtFdXD/RTXsD46VRrEVs/Q8gkLJLq5pX+IBCv0QXKq+Ri3WzQ?=
 =?us-ascii?Q?O3YxV0NUfJ0cFwOGr4Cw47c+CISZqJgTvS3+G40ZNS1ZaIa/0/h1nZKr45mv?=
 =?us-ascii?Q?gtLqu9/diL+jryWS27onlr35RRV8jpYcJiPoCKc5VHLHFzjosCz+Ws5l142e?=
 =?us-ascii?Q?v+yXUkFbnkOk3oLLCutkR4j6BGdkSu81ccYcFk3ZHTtp/3i5RP4TYmVSzFQS?=
 =?us-ascii?Q?A9FNQMKZUYlk+ho0v3FucURNaN++i1PhysCg8BbLjVSLnh61VqHbIkovorbg?=
 =?us-ascii?Q?sinuY0JZtq1ZejlYAYet4vtQPoGgGXPXzJD83cSXLHybq+vlOJzcNgrxEKwQ?=
 =?us-ascii?Q?8MyA+JHbw/kOcL7Z/IdfQ1G4kiNf1yPO6biLPDj6bBB8nX1GMt/ZvVhgGNpq?=
 =?us-ascii?Q?pHZjCpelWR+BB3ivkq7zWpgw0DrlcwkQvKjce8QqFRfBmde/mrJE94PKsy6O?=
 =?us-ascii?Q?HAfmREnK/SK1JwZfAjfGZdXr/VCI8Z/8SZN5EJgDOh6P7d5Ynu/bzB8bIZYn?=
 =?us-ascii?Q?Mr6VpgwiiN93Jn29O1nOJTVYt6D3dEJREKHUxIE45hjwZvH3uSi18Oci7Vpy?=
 =?us-ascii?Q?1SBhSL4luFHU5IF+QFNg7BGAwvRnHl/EqWkwR19fz/kL9dBsH+dy848bnCz3?=
 =?us-ascii?Q?uHpbnKy2m6lDXgmXhGAK7ArAZC8nbHEsvoUl7YaWma/DzFjpsicJ6qq4AR1F?=
 =?us-ascii?Q?8s2uMUp0NqMjVPt4GuXCACpOqjZp4HQ1iTyo73+hQLyYPEKN71QXAmpwwXL/?=
 =?us-ascii?Q?Tyq0+5zFHQUotw8kwfMQM5q8hAos7ZjaV2+5RRUNuqiCqHpDYbilMvN1sGB2?=
 =?us-ascii?Q?Pf7b2Th/B+M6VXcChrMryeAoJ4YbUXIg/fIev3/9nUXY5/+eFqNm4Q/dqkSp?=
 =?us-ascii?Q?9LLrJV2a+Zwxykx0dAGSQolN5hANvV6CMAsMa5mkQ0L5Alc6yLl87baVzR34?=
 =?us-ascii?Q?sTE/TeWza2maBJd/J/0Q4ELF8pJ32z8Wh3cTKFRrKeqFIsfUdzpCpGk+DkTO?=
 =?us-ascii?Q?VdNwUalmWnxN/vcztoxw4yc5DGWBGQQbhJ8E5ODjgjwhR+3dY6y5B1+iEDHz?=
 =?us-ascii?Q?CuWU5Rp7D2K373R9BI2jDKp7H2hn8+aQlueLEWksRFTA9k6PCGsjJ82xopTH?=
 =?us-ascii?Q?0yAo9TgjhvKmHDP8O6qWHWbVc1eRsABki3gCLOnxzQw24xVNQYFFRXxSmR51?=
 =?us-ascii?Q?DvvKaXroG16s2opgfQUF2smjlYaJ/K2YbQHQltB3GhZFA80RVcsaXdfkjBoj?=
 =?us-ascii?Q?BQ75H5d6sC5DH9AfPbgef2HiBOWLOt8LvGGOiWDAx4sFYvHOtldlm4Z0afs3?=
 =?us-ascii?Q?H2PkHBKfZ+rz+iC6bnsn/gu4bktOXRxdbm7xqQw7YaDfFUEJroE3z0I+4lc7?=
 =?us-ascii?Q?QQgBB8hkMhiNnvf7EJOEqN/nm5PLc2vK74ijdnOG3jJUBt6ib4iKsum0eAmV?=
 =?us-ascii?Q?mIGuQemgMbBo62eCsOldI/Dze2hsUFqUmdQIp+E39V1yPvItbkPd3FoqSN1+?=
 =?us-ascii?Q?p6ctZMn90BTIjSe0eLdPK+myMSgiNhar2wrrd3nB84pLt4jb7i0hdsETu5E7?=
 =?us-ascii?Q?c+ExVqtSV+2yldNC9Ht6fatPGBD6AMNGxQ1dPN22C0qhqsRewZnlSGDgkb1U?=
 =?us-ascii?Q?Njyq0dYf8z2Q0j+4sjoemxfBv3A2zUfBLfziEco8raMXGiKEUunz5oR6LhB5?=
 =?us-ascii?Q?Z1MpDUaDAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484101dd-66e4-4386-f3f9-08de5ff04db5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:23.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6zbziQtv6ElXCRX/Auc3DquTDiTxRqYe8Sdfu4mJn1tnPeQroSQoQZ+8KZrm3pw27bTmAM3gpSBnfWCjqm4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16450-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 0C4FBB9E99
X-Rspamd-Action: no action

Add equivalent softleaf entries for the device private migration
swap entries:

  - SWP_MIGRATION_DEVICE_READ -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

As with their SWP_MIGRATION_DEVICE_xxx kin, the
SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx types are used as specializations
of the SWP_MIGRATION_DEVICE_xxx types.

The new entry types have the following relationships:

  - SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
  - SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

Update the existing softleaf_is_migration_xxx() predicates to reflect
this relationship.

It is possible to distinguish the between a
SOFTLEAF_MIGRATION_DEVICE__xxx and a SOFTLEAF_MIGRATION_xxx type using
the softleaf_is_migration_device_private_xxx() predicates.

In practice, the only reason for introducing this new type is so we know
when to not call pfn_to_page() on the swap entry offset once the device
private pages are removed from the physical address space. That is the
only time that the difference matters.

Creating these new entries will occur in a subsequent patch.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
- Separated from previous patch
- s/SOFTLEAF_MIGRATION_DEVICE_/SOFTLEAF_MIGRATION_DEVICE_PRIVATE_/
- Update comment for softleaf_is_migration_read()
---
 include/linux/leafops.h | 90 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 52a1af3eb954..60681ada7b8e 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,28 +199,88 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
  * softleaf_is_migration_read() - Is this leaf entry a readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a readable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a readable migration entry or a readable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
-- 
2.34.1


