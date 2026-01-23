Return-Path: <linuxppc-dev+bounces-16240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHBQJ9l8c2lowwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 14:51:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A927678D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 14:51:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyK8j4Ztgz2xdY;
	Sat, 24 Jan 2026 00:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769176277;
	cv=pass; b=knEUlVrYz3iPdyE353v7LHMs5Tu5BpA88w56dwTDoFZPhqvqXO0HXqxbpw5SRVBO2RnuiBG2WZHegP5Xy8bUYP+3cyzb7eqgGogIQ78kdN+g+fHMHDDvyKoP6RzOxf+X6DPQtCdreCLCxdaO7Og0a4XyXTH6s6Tv3Ces4bfZzEIhmMIIRfdqwBCOhOKdGv23DU5Fcl3RLiM6KTsWGKtdq2giAIErLUslZfuEfs59qBv190/u3xYOBVmDsi5ynWwyZ8gs/oYD9W54wltn6uzOyzeS0jCtGAUxJ2k0SVmvc5nHwqKguUBVcP8iEjJJPs70ejWdQAnrW22owdYi7z778w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769176277; c=relaxed/relaxed;
	bh=Kwkv0CPCm+LrqMV02WPMv2mTlRAudQjYt+uuDKxdFjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AQ9INTxUpA86JwDDYlwCQGmrkXa0YUOWz6TL5PY4fRJHp75njSeRemAjGaFPdiwVzG29eG5B2rEWwKfCqThzb1lvtqv+vF/dovdf11A0GztMlFX019HRrD1EokH9/JVDbQSrPYzPPNzosOtR93En8woUE8xRiyAfNa/pT2e1tls12lM0Lp8St1LkFVCkAODvqYn3CG1trVj2K6e57mj5rX95lSRBMjyS4jKxCWeXV4qQQIXvEGcakWiuPBpkEK3XZMdZLEV7AcowdfTYDl5V7fHgcp7RXB/gykqQuulXPUNmt84WxfZvto926Sx6JHCkfO7dRvwi8+3yeuzf0hSb1Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EvzMft5Y; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EvzMft5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyK8h0bV0z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 00:51:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORX5KQb+sUpI+3viBQ4yY6j1/Kca4/35sLpbMQE4IJeUYVdG3mQTHywkT/skGTQHRkGyqb4QWZ64aIdCDCdvH77oJv6XC7CraQN2Hlsw8SBwyezC4eQU3GxTy+WZgQ5uRN2F0FBWgJZG2XsEQgBcJt6/nGk0taSOFcUfqmC7Put89V3VsGsO+w1XdAlpZzPXUgKYFOfe/ia1KJs3EJIirkN902A4L+qUhsWkh1MX3LJHI56d8gUV7Z4azuolWKbjwrZEk3Z+cHeyB2oS9CtsvzyvhlEQEftJq8ayCtwhpdjWPsy/Nb5as9oIhqWbvtdC5cJB2NLSgc7qQOhN9jwLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwkv0CPCm+LrqMV02WPMv2mTlRAudQjYt+uuDKxdFjU=;
 b=UVYK2A6xpKqAGR5StexFNtdtnj+7Otj6ZsgVwRUzvBk2FacvmFCc7oC2y8FWO6IXV2md3VV7KFYeSH3geX36KLCk6YdVXG9qzdTnbAmgVi4gwslErB5AYbL4fHKwx6Lk+jFQL8Y+WBiiG5bFBckkFIV61nncxKv8ucmuNECuqlKTNeSPNyxo3ukELWIjsUvoaXkCo1s+InlQSM8PMYNXpkz4jUeuNCJ+W33z0maJeiQ3ma0v4pi+O/r1LM0d9dsG0f8A64e/nozqaHHUXiicfaoRT2dPZ0CdroPeAcJhaL9/Y/LdqYv09shzKuVtZFOTWo4ginVcISz93yHJha6ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwkv0CPCm+LrqMV02WPMv2mTlRAudQjYt+uuDKxdFjU=;
 b=EvzMft5YJ/df9prsh/xcQELZ0389OaP1QN7p+DHYbTYBLLW9FCN/HPzsy7gcRGekfcx2SMtBbvd5TAmA4KEoiPbeOMGz5P7IWLZYOl/ar3uE0o766B0PRRZyMevkS00WSPABZ5RmxE7jl0fTV3cuSDV/SWIyNpMXdzXJnDy7560AJC5kv1YMMxHQftWMXawAs8nycYQ+2RIIkkpWUte70/Du4aJUJC6nGIF1VfI46h2H40dVROqk9B1Q9K5SMJKXaLV5VGggfxtUT7wQQ0cWDDJb7UbAqNuf+ORVLwk3iDBGmt/clOkY3tfDCdN2cdvuZvjPNWdxAReSz+LIlwVAag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 13:50:51 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 13:50:51 +0000
Date: Fri, 23 Jan 2026 09:50:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>, Jordan Niethe <jniethe@nvidia.com>,
	linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
	mpenttil@redhat.com, willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
	Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Message-ID: <20260123135050.GV1134360@nvidia.com>
References: <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
 <DBBD65CA-A8F2-40AC-AFA0-FC95CBDB3DF5@nvidia.com>
 <0C16A79F-5A7B-4358-9806-7F78E7EA8EE6@nvidia.com>
 <l5jxxobpj6shwuuthsyxlzfnhs6dx4spvzcqxrycn4chtywniq@e2eaio4nhorq>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l5jxxobpj6shwuuthsyxlzfnhs6dx4spvzcqxrycn4chtywniq@e2eaio4nhorq>
X-ClientProxiedBy: MN2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:208:23e::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc29591-dc62-40fd-74fd-08de5a866b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A4wW0D44C/oxAKRogWI/ujFJVZ5ltMY6Hwv9i533fwU/IYuc0hvogf0Xp89F?=
 =?us-ascii?Q?16ovx/A0CCymnP8pNvDrjf3TBz/SXlFg/us6O1YlEbJ3e8gA25uxnIhqCLl/?=
 =?us-ascii?Q?/Qzk7SGZBlQetyeR0Rvkusa54TgC2NyBXtDuWRt4WtHQQZaOaguYnPBS8Isp?=
 =?us-ascii?Q?B7cUyK61uZwd5BHUsjzwfIuHM7oF9kbBMgOc+O5h+b0FHCLRdwua259YVA4w?=
 =?us-ascii?Q?gV+SDy5aheZLaAAujauhBbx5AEh3Wztt7FtGjnjwfC9w4c2R2r/6g5wRXC0r?=
 =?us-ascii?Q?9F76QufySD5yrAo4MqZ7uXX6SolaokBm18yWiSIqzmQ4UQbJmJeUnT0tByvn?=
 =?us-ascii?Q?BHpzHb6qO0He3LgeVSyQBpUSNbc3wudeEO3PrD3PwciU9bZtEyzWexg708Jc?=
 =?us-ascii?Q?jnP1x9WXfb9zA1STgR7cTH1GYMZkHHMsEferQxwat7mIerZ5TeY7pC3+zidE?=
 =?us-ascii?Q?vi8x2ownDAX9GaDgYJSZD8OS1QHvjD49H7zImGENyzWUVd9+LZV5rchvIB5a?=
 =?us-ascii?Q?UDHp+UThp+oWufc3F0BXaIh3aOJvCPW+G2kK/gHJYLZ3um9uACQ6dl1dA94T?=
 =?us-ascii?Q?osS/rsRQgMPgZywARHZxgAXfzHEq+vtbiXq0tjwC1GDPKcOsV5CwsYxeFBUv?=
 =?us-ascii?Q?f9E2LQVpCs8DFttH+iLh13P8lFHemM55WVOeD6xTTZ4sCTvB32r0aF4SyEDl?=
 =?us-ascii?Q?GDri7sGaLor87tHBbCziKaAROZ4KQwTbdIkUVy0YtmgVqAnvCFh4CdImZo4h?=
 =?us-ascii?Q?uY38wuPGAKaScBUiCkYUw5wofnMi5Rs+kqSH6LlJx4cBk2skFwstwv0Ptr5i?=
 =?us-ascii?Q?J8xVwn+/71jWwsttbcorUkg1PXEyj0uS/O2fXWXGfBdmwY9BfcrhNXe0aF59?=
 =?us-ascii?Q?5ejo9GZjqaV5rOITZoeE5uqKUqPtwurDhOqXer5cB4EwliIEGH+HZh8G8GhF?=
 =?us-ascii?Q?2Uvw4xRs0aJ8Sj0/xsXYlyD/Hj0qAWuQP/NjR/qZGc46EQZmsPF1rLFFZFnb?=
 =?us-ascii?Q?hmdZ0I8mz8nCJgLeLNINY7CLsyy00TVAxuhbeVKD4twx4g/XWg4ur4DEollQ?=
 =?us-ascii?Q?lEHI31tasCTh1B7vdm+mqzM3MGsBUucKeZca0ROZymJ+DPybREQDLDLqB6mB?=
 =?us-ascii?Q?JZyQnX1MoNYTOigZkUQcN3rAYUhsINs3MfhGHM8IQmvLtGdHE8uIcIjm2PU1?=
 =?us-ascii?Q?9Jurub3cWJ20JkeOBlNGcWr8Y91v1IhTH0ResGF41O+rgqurCe75YfA2zshg?=
 =?us-ascii?Q?EvMsWtbuABtySbth8TxD/RbTaR0vVlvyJzC5Eea2b15kuuw/i0ahy+6Vb/gz?=
 =?us-ascii?Q?d8m/qV+FvJ6t6CfAINgDrBsF6IaIQhvAlT4H1XicGb3O1IzVkYx7UP1lpUcd?=
 =?us-ascii?Q?vg6L+Vx6P5HjlgKS5fp9c1NMdNhLh/CyuuIEaJnaXJR9kw1cv2jcoTCJstBj?=
 =?us-ascii?Q?s7/NuC6Dxn4UAZm5BYXd2QqGASuE9eJ4bPq8Pu2xUjsDOmiN9e8GK1hjqfEV?=
 =?us-ascii?Q?js5152yil416hxUKiQa36GZ4gq3wNMhISObW3MFnZtiRuenku1LcKYKOylaV?=
 =?us-ascii?Q?aIJ84syENlqjOWhrj4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6n5bbpHPt/ZRXAxW/cRAjMitrJ6ClygL5kppuG9OHQ6EygfERfSxKMVcKnaX?=
 =?us-ascii?Q?EXAJ9Z6PTt+7vvNNqB+a5L5nA1xhnZhSP/DmepcJ+fdoZ1lYbm5jn5pqIuPN?=
 =?us-ascii?Q?Fh77mzDZRyt4LyNe0eYWAEjd+/NWV/htkko+aJc12VtlNcWmLJEIwT+TcpUy?=
 =?us-ascii?Q?EqzvrlvkcFpaLGkWFpsMwciaOR/XZ1eTi/lUfvef5gg9EpySurhxP1klqkep?=
 =?us-ascii?Q?9ytiUBjeSgiCeUF4umD+7AMQc+4++I9MKJvm1HNOroZ94/4S8Flk+qlKOIKM?=
 =?us-ascii?Q?j4wkLm9u03kjxRY0OizkKYpwue4H84XodEkJzh8hDGdTWP4minypilOaBobS?=
 =?us-ascii?Q?eOx7ZpPJVneetKQ1UxuR3aTP5l+sjKxxzpiaqIOZNFP1MZurYCH5NIvWaiF3?=
 =?us-ascii?Q?yYUCRH/j65owbS0Dod/nGgvctaGVT+cq5sCOFwoEOCL1+YpKXav20lM3KCmv?=
 =?us-ascii?Q?6Ubvru98qtXQR9CY5NyTihnhBq9OGmPbEA+xQ+KwOb6LogdVpZ5fiyPKU6DF?=
 =?us-ascii?Q?/6cFw/3sJOxRzfYgq0IVIWhcPsJOK20knximwCN2XYQ0SAoCBqhnPq6oBVkq?=
 =?us-ascii?Q?9yaNx+YO7ATDJ24w/nbUvllcxwjW+AkLHzfmxMBsIzFREuJVoELhuFZhKm/8?=
 =?us-ascii?Q?bH20imouET3K4uHD1R00XA2HkU4KhnM7Zuq/2J/gTnwkfc7818IF70xOjsXA?=
 =?us-ascii?Q?xYZBh5IWY97ffjwIac0hOq4G3IlK5SHa6q/kiehpzrE4jq/4RdjtDorErXrl?=
 =?us-ascii?Q?vRc3t5wcqQBBpcHCBh4TXzwjbMnPMHranGJzB3kKnwWXXlzD+m2oiiJYh8Z+?=
 =?us-ascii?Q?uvdrodRxJluwG2pQ0j3mYInlAfwD+pAfcls2dy48irnXdopiF4uNDq7xbpdg?=
 =?us-ascii?Q?ddi0vRbNJ/WnEJ71aUtjBJPVcY0As0ECUj4oU0llYSmLv5aa9rtP+sJ+hY9z?=
 =?us-ascii?Q?QHiFyOky+ai+Fb0CjBUXiFHOR8m+2VcQGk5/mUdcBNLfRV0tGjM5NAkSYO38?=
 =?us-ascii?Q?ncAxVK1wrpL+V6ehVQWeSE6GTCquOv4EuogoTw+wOoksOnn3D1gE6jzHFh0U?=
 =?us-ascii?Q?NxpamDRX9hYgqEqJNbJ4mRd1/LLncCO+RaNJU4Mnk5N/mLvaNIb/q0+61iim?=
 =?us-ascii?Q?HqzV5FggZSYTUEFBLraCdwoYHQb/UgyBRrqHv6TOVLBle+WPNYXJjU556WQV?=
 =?us-ascii?Q?HV/ORRRRbgjkmvlS1+hZ3iuY25EVVTp0SZUhxrOPZOiOGDahQ58c4wfIxB6t?=
 =?us-ascii?Q?PufVzs0BfRUPQxjAntD1gxsk/rQ0+JXmI7QyBkzWO74P/i1dFV/0wTnp43OG?=
 =?us-ascii?Q?nJtQvJ8E7N/1LALj+lPePNyGisA3czpxZR2kivDJpZatLyjy98CN/oH41xoq?=
 =?us-ascii?Q?v4R3uVRTYWI1rB+fCc1JR9FMpJDX6xIjiVwDlChA1O8jApsQd6CjnaoW4rqu?=
 =?us-ascii?Q?+K1zF9mWcsQq//DdDH+lOeaBvZgWkjVPCJyAIPA5lPrwwWJBDSCf05VXlR/u?=
 =?us-ascii?Q?wP4lCle2VLx45LOMRQYqXTH8C7faBTS2KQms4nQBBjc17WeF7cf70P57BHCx?=
 =?us-ascii?Q?HP3zntQ80Ikt9pfd/+f7cgFv2BBYM/yQBDNPrfHzPIrjZDIxViX4eCmDs9Tq?=
 =?us-ascii?Q?JyADniIUhyZrF/ghdob41Ecbex8QP9lwwKxRctsEdOUjPkmHosvUqUAi2uT2?=
 =?us-ascii?Q?XRuuzlioMzCwody3epeVaLh0x3hdCVvUn+6WKR1pBaNTEXxIOg9aJ3T/FKLu?=
 =?us-ascii?Q?p0cw5dzvQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc29591-dc62-40fd-74fd-08de5a866b85
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:50:51.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0Dcu+lYo9RzqG09W5FZTgTlAgHF0BbKGUhWGGo1ryzJTCTzDCMQ+18J/9Hb54CE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16240-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:apopple@nvidia.com,m:ziy@nvidia.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.484];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: B6A927678D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 04:38:49PM +1100, Alistair Popple wrote:
> > >> We need to be a bit careful by what we mean when we say "HMM" in the kernel.
> > >>
> > >> Specifically MIGRATE_PFN_SHIFT is used with migrate_vma/migrate_device, which
> > >> is the migration half of "HMM" which does depend on CONFIG_DEVICE_MIGRATION or
> > >> really just CONFIG_ZONE_DEVICE making it somewhat arch specific.
> > >>
> > >> However hmm_range_fault() does something similar - see the definition of
> > >> hmm_pfn_flags - it actually steals the top 11 bits of a pfn for flags, and it is
> > >> not architecture specific. It only depends on CONFIG_MMU.
> > >
> > > Oh, that is hacky. But are HMM PFNs with any flag exposed to code outside HMM?
> > > Currently, device private needs to reserve PFNs for struct page, so I assume
> > > only the reserved PFNs are seen by outsiders. Otherwise, when outsiders see
> > > a HMM PFN with a flag, pfn_to_page() on such a PFN will read non exist
> > > struct page, right?
> 
> Any user of hmm_range_fault() would be exposed to an issue - most users of
> hmm_range_fault() use it to grab a PFN (ie. physical address) to map into some
> remote page table. So potentially if some important bit in the PFN is dropped
> that could potentially result in users mapping the wrong physical address or
> page.

Trim the quotes guys..

hmm is arguably returning phys_addr_t >> PAGE_SHIFT. This is a lossless
translation because everything is aligned, it isn't hacky.

The value it returns is not a "pfn", it is a hmm structure that has to
be decoded to something else using a hmm helper function.

I think we take a number of liberties going between pte, phys_addr_t,
pfn. If there are arches that use a special encoding for the mm PFN
then range_fault would need to call converter functions to get to/from
phys_addr_t.

Jason

