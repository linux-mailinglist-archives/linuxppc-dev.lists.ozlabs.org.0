Return-Path: <linuxppc-dev+bounces-16434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPu2GF+NfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8EDB995E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Xr96Qdzz3c9r;
	Fri, 30 Jan 2026 21:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770297;
	cv=pass; b=j2moGPj1XNz4y166HI01YBGM2e+DoQX4sZLc2LlDDH2n6bvxF/aIFDDDq9xziLXwrfjJYGCMj7Weth01mfUyXl3XurJKfdohl+4/hBYjJ3E7L/ruSqQrmr2BIvJE53yqOmNcYCl6GZsvUL35BE0Ry6NEfuv+nFetBLQYP0Y70nX8RxL/qI4P9Nbieis2vXHgO3tetZ2sTv0yyHE7gb/d7fdPjMTrH6HKTohmUW9PC/d9biWUX7+7K4vxglowPRzUuXGRc78sHwAVZvILx7g9flmuMXvrz3ZKle4GvlkYwZIE1IxYSjboc0xJK1US8H6cynfhuadeVaOF5cyq7RVImA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770297; c=relaxed/relaxed;
	bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H4ADAMjsRjG4jXd7/qRzoVWh/BXQTs92KL6K2YzZA3lDoACmnJ48QnH6JIEcVSrkzWc1dY3RKv1n27tKkhmg8E3QaOIG7sj1FIWnKg99dfvD1mysQfKBX/Kmhga+TnO8x9NwKDwWY8ZgZftFG5t6kIwO9aduqmLB7nxD3Cc2YWc61mBkK5deNP6K4x/kzDoPQEn0jn3s6lgrpL0r6VZeL51Izn8R/2ixxORx3/DN3oQ+zBAaLnpIZjZSr4KA5jBYep6FLlXfMRtpNwrU0DGBPcO3h4m6AHSK2LdvJOVVyughdxdmJF9pBRzye5xZn+dYw596wzXRPVXB36f/Bquuig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lo3trObm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lo3trObm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Xr90x9mz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjqaMD6tC6lLtZUuDKH4P4sjMuzkgVsJWTy0Ufhw4srsN6MNdEl+pNbkJDKwRIwdXcHzdmaMPZZxO4MszgOkUQC7dEexi6kXwRsM2cFiXPxfl6okqoc6ME1vUeBymfB8vg/59EPM4UHcl88JM1Njeh3KUUe3CPhbiIEsnTCbE8P04tXtpr3slUPoQq5iz7++eB/sz4AYvP1g74BOuNYM7EQ5PmLCtuA9lVoDMA525R/8xVKoymFgh0sKQ0RLo8tPD6K0xOmN9q7Y56ELEjrhoLB9zGcghuMA/gdApvcl0CHnVwhprikKhPD1pzxccgQB3jFSfS9Ulh7Ramb0T2iCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=VekrFsa5VdJys8UJGZHuHmTiDb7L6P+Ng+eMY3/PCJDtRHQkWbg+Lrdj1/X5VgigDAFDzF5w4HbvkNpytroFfT1Qsvq/PQABZnFKf/lGQ3lF/RrwKmPakpuz1aJY5ZYvDGhhqMg1dEIjhg9/BPYUWwgP8P9nBhLoGSMUo2VEDt13UljV2rEEiJFbyOHtLZJIyrkQ4WCkn7zHh4ONgWuZ2OoRuX9QcJeBP57hOBW0ZNz322SUkWJ6MxiSL83k7heeZHTOqn4N3i49hHXomQ+tjz8yXm9QLTnd34IjLGR3fReDKw+g0MEnY57/vWcmhl2ZfPB05xajyiLzJeAZL4PlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAZ/+mizc8kZ/p6LbUf+M8l+8hYCGW8mEK4HmxV2eZA=;
 b=lo3trObm+Kq9Gy/1GWFhh7YikJhFY8sVQhEpVxlJvnx0jTdA6Vf/1pSQXK9XXMDtuxA3dDvDi4UVT5F6GkKPUS4yhXg0bTX2OUjOH6EDSm0+GecYFQXBkBr22OMDauW34ogYjHPxBnuYd3AsmNacOpCl424VEfecY/XCJeR8rD5gKgd09c94wFN3FSHvbxXPrn6ZtpCxqMkfs3dMkqp/l6R/jjgXIZgY5Uy7+h48c4wfgxWdAscej5aeRQNAD9PWC/QR3wfrlMxArf2uFWsbE0+mqnZK50HIfB4808oIX+6MfuOR9zIPuVtjiEaNgXRl8wDpD8iszTbjqkaGWj8T7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:23 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:23 +0000
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
Subject: [PATCH v4 06/13] mm: Add helpers to create migration entries from struct pages
Date: Fri, 30 Jan 2026 21:50:52 +1100
Message-Id: <20260130105059.51841-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9515cb84-1b0b-494e-4640-08de5fed8268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LqNbmChsGPBGWEsMlcNic9gZoCmuh9G8um5gJy0W+7CNQpeSRpgD76PZBGaC?=
 =?us-ascii?Q?XeUe8D0xYa7JxEIxzZra4F3qT1qXQP5dC+nLBIf/LqDLtPCMijyh3eqCKYkU?=
 =?us-ascii?Q?JQGjUke/+pz2tnMtvWGV5OsvQzcWrHjFkuXxd+60m7IVSj8U1NqXv5lj3RKj?=
 =?us-ascii?Q?EYa4YoNzba/KOTJdNyEQESwJLXFIThRIrszy0JH7E9+pP7onwQudZSYXTIGF?=
 =?us-ascii?Q?KTMRBnMwABSXDLr26WRxeXCBnRfutIBX7465IrUNAGpi02b9gdkwNbp2mo9G?=
 =?us-ascii?Q?I/THEWfdsR6Fp5+L5dc9v11PSqLIjEydIVM9vSwcduwti40nWS2CQx65YHqN?=
 =?us-ascii?Q?+Tt/IKwLtfIDuclSfDuoJu5FFxCKXgcrEYTVkTeF5r3GsW+pQS76NstJo38P?=
 =?us-ascii?Q?IDnZCmHdTynUaE2BLwQVBFaZHynO9CYWCu1s3ZpB1421pjDvcMgThB9wUhV2?=
 =?us-ascii?Q?pn+8Rn0R9rulKKCo2Du4ZiIKpaZL65j2R8+RrS+xfW+1DySdHz3ppa/+KtcV?=
 =?us-ascii?Q?/R4ZTXAg16dd271k6CVo/Nl8uPvod9gfm5Xp54KalqjuF5YlkZCj0peMiVvd?=
 =?us-ascii?Q?PrSYu3luTwPV3pCJom5ium7B2yvkcMiKbvr5emH0X+f1eIHv1uMxYX7W0t0K?=
 =?us-ascii?Q?2gd5VtgCRPcYTVd/ugJsOtx14JGJX6Smjqh1w6rGII8vWowYQvtLSF/mPOYL?=
 =?us-ascii?Q?xdMIF9sQgC52b5rfYgYmN07rOy7+cTb4e1azYY5V6KFO7Y2blwwseCgI6xoR?=
 =?us-ascii?Q?jCpPA9PQbFih3zg5o/rVzsJo9Tmjqyxyw9IgGNa4UwgQlALrNS+4LsKMKNQA?=
 =?us-ascii?Q?pZBFxRSdDLTfpsM+ElUaeXSiXUaee/vvgYfjjGUgHeTsGJQ3ryq3+TAJkoR/?=
 =?us-ascii?Q?BG/J8PzLLYxdmLg0KILqd3lMXBCaPmxVhMBZfeKhTx1Ah331k1HJ6lA9aPXa?=
 =?us-ascii?Q?mQd3ugv2kZpG3ummnMMYV0WSg+CBzkEYSa9aoCjwR2NHTUP2J6KLaedmBUQm?=
 =?us-ascii?Q?RThN3gA576SUsn+A4iibtsZL9dI5f5E1Wl2/tguIjOlPsMZnwUmhQFcdzIQ2?=
 =?us-ascii?Q?BS9JjyTItC9RXpKFwkTMiDVYy7N6ZowGl9nvaOHdis5RptzzEqJW9IwXuEPb?=
 =?us-ascii?Q?mtWjgmXCpPpGr55x4CHmoHwR9EPkUFJMiH4HnCcxtsHBfALHPx5ETdjLGgrT?=
 =?us-ascii?Q?jfjS0Z5nuEjGjCzNcQsVYDocnEx9/fQp/d0h78TyFyOlSU7HppSOkQjw96BI?=
 =?us-ascii?Q?mz+digzzgpqWCvrRH6YFwfUYke4C8inXrGy+XWr0XQ1tjmt4tMuWtM/hNTPl?=
 =?us-ascii?Q?Y6xoRC8BVLiHPv97dYGvluZEUThEHoODO2fIS5ur/pbZdZEcmdHR3wo8Hgk0?=
 =?us-ascii?Q?fsPFUFNb51Nx+cEuQ6O8PobFaaJbGPqvDkYsBTCEbqaKq6UASnsUKn8zN623?=
 =?us-ascii?Q?RKUxK+oOCpZf4sVB3n3i1Tk7VjZOUoY2U4x991zAT1SeSXHSgYg3tYPW3spO?=
 =?us-ascii?Q?U70ZO3XlEQ3rMtX1sdGu8IpJ5oBS79tzq4SrHWVJtBu+m5s1Bv/DML4RqUbB?=
 =?us-ascii?Q?ROYaEo0gArADdqsXTy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Isx8vSzu7t0jqD3qwsw8ejHlF8284hYF3VmCdt535aW9m3bM3uMVq3fff4cM?=
 =?us-ascii?Q?AizMKa3gWYYecvh7XH6zQf/ECMbcouhok7uOGsNsTcEH+Z4nyf+dYdJ7RtLN?=
 =?us-ascii?Q?VtvjCQxVFBpxhh33qM2luNgsE2gCafebLs9c1koaqSJCRXtwvajFt1WLbcOu?=
 =?us-ascii?Q?VLc1GbQqfaCquB3EgZfhNMDj2ReK5357GmO3bih5x+ZX+N+Q/FasFiLlaT2I?=
 =?us-ascii?Q?ez4RqEdZ9zZC1qiU22sRxFSxmqW6YkG7dEdRge8rZ6Zd/JPthFvXWYPvzvfo?=
 =?us-ascii?Q?qZGmB6FhYqJCAPLg2tom68JgSVDvIQ+9E48YX8bPe03Ok8ShAXkF0zv0ogrK?=
 =?us-ascii?Q?5An2Ve6v9SS8CHe6pb5wHNSbDhtshOZVL4ydmlDpUeDZ4QRiJNeEth9NmKKh?=
 =?us-ascii?Q?5I0ICN292iWcfOSVQBnWHsjJ0c5idb2iRfWjvMbqOlaId/Ac/NHmySWGTyl4?=
 =?us-ascii?Q?WcbleofdJvoZ3itOBrQbYkSDV7vE0AWXO2c2TBkwUh6M/943DI02veGZ5OZQ?=
 =?us-ascii?Q?7/lmZ7Ktb7ZUEh13qwmUtQ8ViedgTEj207888A4rvvJdmeEFt+6suNt0SVnA?=
 =?us-ascii?Q?ltddt9R+NEJ9CIJcVMNWRMHQ3CNHusuG25JsjkjFBISk2GJJ4U7iuBov+ywC?=
 =?us-ascii?Q?8K6X+m26w+DOITtwxBZXe43W+u5IbCzHPQZH+L9fIJ4AXH0/37CwTseyo4NH?=
 =?us-ascii?Q?aAquTgBPLfTInAHUD1EKHm/r11PdE9dJeXPAu/4+NrpTPiV/1ky0ZjtJKk7b?=
 =?us-ascii?Q?EVGoGyoMYSYClj9i8C7fAvcFOU2E7sFYVkdDTX+aXJwCyV8joQaix9gZJiyn?=
 =?us-ascii?Q?r2SbUWSiySoDM3aQeXB+xxuIxDM/75S9dmjMoG+dekPWgY43qAN0qGPVvPQd?=
 =?us-ascii?Q?ofTKxIhvXn1K0lfaFdsUXmgL0lWC1shJ4I2rvuj8wTVXokkwNJb5uhJTSuRZ?=
 =?us-ascii?Q?FrrcE3HysDKL4o6Wkh8AfhUoBAmkQ4TM/fNwWMRSqsNnZzC70yeyrhIw8wPy?=
 =?us-ascii?Q?30TCHeduS0Ncbvj6s+qN5T0eJMTf2xDv+hdcP1xWsu9+XyUlHkPFbIcWoH5w?=
 =?us-ascii?Q?KmaQhSkgufyrImdLQG3E8XlyddDZsHkkabWI4g4dT6VfxsMIH7zCwnaH15M5?=
 =?us-ascii?Q?7hy/zPhqPARUaZYVhIWjE4lbSIthCbEr82qi+iw7VjMgEZoe/fl5o6r13s2n?=
 =?us-ascii?Q?5Rkai7Aa+R2ZrHBNO19t71zjHnE9oGcfxJPUlxaSuWl+iK1+o0vaiUqQny9E?=
 =?us-ascii?Q?fEFbNP6fG7YPKgrBKbj3Tty5fViMnhr6gYg5zFnlzfVfpNuR/SuyzMp+IVlL?=
 =?us-ascii?Q?Fc5DE2QojgScpqCzqqcHiMZS5TJ0Qm8tSkTg0ujomnIPdDRU7h10xTToHgiE?=
 =?us-ascii?Q?o7gwASnlwoK7RzLRaXa/H+9t29ixlspVFM2F2lVr07RL39b4whlt97Jkexf1?=
 =?us-ascii?Q?rR5DPwW6Ak0D067C3Bn1RvfkY2N7P10eZ81TNrZJ44Uz0HyyFhx881OBtSy9?=
 =?us-ascii?Q?d1oikpah4ACBB39LVy3MjD47woiF1/JzORDSAio59rSlcTXIUQLZrGw7BeJ+?=
 =?us-ascii?Q?pXMGGQeMS5tNdjN6mKwq0U0AiXr44bx2g/YKnP9Su69HbzpXO0aBzkP1OHEg?=
 =?us-ascii?Q?55A7f3ICexC9PR2PdRbQb/Lp5WD7dHVvMU3948i5f8lGdCV5+xmksa/W3bk5?=
 =?us-ascii?Q?klyZ09aKKnWyb8v5DnmdiLQJSMzI+OfpS2+1gaBP9GC5FMoYF8bQzabq4l0C?=
 =?us-ascii?Q?YJ2HIo+2tQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9515cb84-1b0b-494e-4640-08de5fed8268
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:23.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZuvbF8Rn/aCNlPhH8yaj7VvCr8wOK4v+pdmt7J+e8UlZifQBh0NBkK95xvTem7o7ToLIrp2j4GYc1VJr+/sgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16434-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: AC8EDB995E
X-Rspamd-Action: no action

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
v2:
  - Add flags param
v3:
  - No change
v4:
  - s/make_writeable_migration_entry_from_page/make_writable_migration_entry_from_page/
    for the !CONFIG_MIGRATION case
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 34 ++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 96 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index a9ff94b744f2..52a1af3eb954 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..c1d3c0e8981b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,34 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +240,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1832da0f623..a2f9ac8a3177 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4955,8 +4955,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6491,11 +6492,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..349f360d82b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7fa976b7fb5a..79cba3d441c3 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2536,14 +2536,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


