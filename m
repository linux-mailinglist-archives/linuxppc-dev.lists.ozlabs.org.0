Return-Path: <linuxppc-dev+bounces-16191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKU5EwUUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84170E15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:23:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7DM4Xc0z309N;
	Fri, 23 Jan 2026 17:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149427;
	cv=pass; b=KIMSaCOzRGXuf1UWjVANoDPSJcBkmP5u0VmKuHfhXoUlgCxiYgKo+Brb6UeO4vE3mjzzuVBTjTfpshy7pvD6QJkckKklUEN+LOHOv1LahRKuoA4+XfOQWBLqYYYm7g5W4Q6ugO1cnsUhLPQNNaJzvKtwROfXnKyqrlSW+NMFAZPYHzz77Xvvr/9zIbr0G8AA9b76zLdpzhldxxWrLWhV/cvKC7WNvrDUFFt3bXT5rV4SBVCp+7BUHlJ032DyWCcBc9WTxDdCQvN5H6wlcUUZ2rOi4XWPSCe6yURPlFFzULgyg/YC5DGNJt8EiklVc7AsRs2ZwsOMtcXGREtvdz9OhA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149427; c=relaxed/relaxed;
	bh=r9761pla97hR+32fnTnJlZ/+l6tFzzmjhvFdkGVqpX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lJxD55gz+7Dmt81pcPleoe7YtBQMh1Z7ib4YFWvGCt4gZZvQ78UktfgqvSV9vKCF5baOmCnQ0CEPAWy0qygGIBup0B8AYAWui/gMfuotTprJaagw/LmclGm6IkBAuRn1HJhfjtustXBAQRS0Kf7JVYpIyr9pp48itC2vBPSMwJZ3lrBfOw8xdaJIqm1+dad/kN/ZNOBGxqyoU9iTNpha1a7rTaJ/wZ3gLHLt1D0S+0SQq4Gmr5Gy2MK92Br+LhXBVQzgqupnFoLChkWOYbRLAEarnk2cZPzmBawMagaZNtFf+T7UGEZIhd8uIbc9zCD35iF/mPn/Cwp2LMav9FWC9A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cXbob8Il; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cXbob8Il;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7DL577Vz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:23:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4Ta8hFLGuHFUhxOyETo7/RlNUDSTSwA414oOSoXRezNVDaPpMRNe/BmO5VmwHd2fFP1EJf4LtxnwCdioUG177BeTYD305Dzf4hbRgRrEdNyZS2OfT82YJ5UdBqaLU86Od/J1Yh5v0wcWM81nk6lcS/lefHvg7vG9dI/UJMwayHN/4O70fzI0goMdD4m1yKhc5dB2+xYjrAUf4CW/BOUQlXRNgVATA/8vIwRlMByc7EqrdxXHGLGsZtBI6nrsfX5F5WzrlvVSXZCMSmo/e2LkNqGrjniW243WWtgK97CQMZAf+EUdB16ZesP0h7WKWewuCUX2bCAGBwJPN+JdH1WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9761pla97hR+32fnTnJlZ/+l6tFzzmjhvFdkGVqpX4=;
 b=lfmQ6BHg+1dLyDGU0LMUSOWbRXF6BN1JKxawhWF+9UESXt2uEePrByE5l/euvSlPzsMRUEhcVdBhWhqnVzA1Pe1gJCEaFyyoI0dwZmktqeJGFtz6w9vW9/MTQDMBjNS60oJCmmo2ImUNhhFHVE4aeRjzmwZYvA2pz+YDNvZ5QddmMp/BXNlkWGZwu5dPxfZBaqRoDen37P6Sp9GSOO0Sy3LqaDYNGb70RKEQwcPnwjlRplyvNNGK1G9Q1UpUSqF6qAN9/ySW7NLOqTkug1siYlJJ3+wbBWNp0K3PYtiX1jkNrO2UiHQeX+oGyElVet9VKZYoV1HIJBKRnGKb/ITJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9761pla97hR+32fnTnJlZ/+l6tFzzmjhvFdkGVqpX4=;
 b=cXbob8Ild21yjzoMpkqly8MRyXKB1jBwlYn2nHF9ulXQI+qwVQ18pE+3faxlVs6uzGdl/GBkXeRUzCQlOjLIwzCCjEqIZHmk1DYzNMViqDncycyWHJj1Ty23xyi362V0SouUEZSHdPdq/EjCFMalGnAxl3/vOGNmFt9U0LLrZQTJjiPzOv7yHcxdc8f3IG8h+8ZvhaMusNNDlfLjt+bI3btXi/Tuh+jGAKauxExw4yhoFeNdYNxvio29Y8RnoJ6SB6pNmPnNW7cuiP/G+gCiwHcmKqDI1UEkj0T5m5EXHFKQrwGp3r8ydY2HVPgIt+i2M3Ct2wbpKifA3E6ttj0peQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:28 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:27 +0000
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
Subject: [PATCH v3 01/13] mm/migrate_device: Introduce migrate_pfn_from_page() helper
Date: Fri, 23 Jan 2026 17:22:57 +1100
Message-Id: <20260123062309.23090-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3ad5b66c-cdf7-490b-8dc1-08de5a47ea43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DTX+Qebd7x1EidLv7i+Fe94/14Vw4lBs2DBD9kW/VEy39+peid2caGZ07hk9?=
 =?us-ascii?Q?2ZkVoCSTv3xgXFtDq3Stwwrq1drK5EFM4xFprc/eGyEQm4seqvf97nsG/E4H?=
 =?us-ascii?Q?bqSCX57aPQE1Q4H1Khen5RimoaNNzZY+ku3Eh4dyAhZeY0B+GKnYRysaRhoI?=
 =?us-ascii?Q?2/h9Do4i0cx6676ivWIeNMPIesHMgtJle+vI6MN3OvOp4/GEwZ7INgYpQqev?=
 =?us-ascii?Q?GhUZUPPIzXfpYbYQSzwwFp3YNP5DntXFvdAw14rq4UxzYV9ggsbK54F2exha?=
 =?us-ascii?Q?kN/U+CEo7iD1Kl3H16VtzWlSR+LCs3KfBHS596WmiVJQDEwtTQ6ODcD2o2q0?=
 =?us-ascii?Q?kQcypBmiVaHB4ZaSKOt1ippCpNRJ8y1iMS7tRVgiK9q28rbSKV/hyFNg/NNA?=
 =?us-ascii?Q?SsC0YcomDNM0cazSuA1T0mpIDmSk1HklIVee3PqnHq73W6r0Aoq18vAb/HG2?=
 =?us-ascii?Q?YOlcAMf4FHsmKVt/x6ENo7QOnJQXCR63V6rDCRFLgd4M3OvG/OXzjbuLjO06?=
 =?us-ascii?Q?n/Oj0qmRS/u5OFrwqpBglk8WoCFeQYrbYsQZif1Mmi37JsMuGbnhDTzG98He?=
 =?us-ascii?Q?a48ie9nDNJaK4J+wV42s4VPAjdU8ykwHQxZfmUxianX60f0HnVZ8pgCY9fme?=
 =?us-ascii?Q?G5Ow/FiDJSGuQvbm1JfH0yi3lKaHYdZlg7J+Bp+0JSvAUF9/ZH0dfXYzozOZ?=
 =?us-ascii?Q?lL/maLm7IpiwCuHtxDHacuAcMM6m9kqfPBsip7zQHvUMs8xn8lzNhmdm52Nt?=
 =?us-ascii?Q?QFSpN6aQ1tfhR4DSCvkJ7GDPGPTqk0brhQn/SuumZzl2TLfhIizdpZIN32Uc?=
 =?us-ascii?Q?T87wQtX80MT5at+B6MBGlF5aKh4BcJCl5irfTdVpUJLJZo4G3o3GSs9y0jqQ?=
 =?us-ascii?Q?WJnBxZ5WuoZ6zfQr5ZNaphGUbMEhXCFSqy5ApoIyBA/jLXmt0kbJjkpaZa7v?=
 =?us-ascii?Q?cz0OR60vAGtWShHegH2VMrjaemn3kxPV4UFWvRmq5D95Avk4G/KXt7IMlGBL?=
 =?us-ascii?Q?gHEO9TLvj19qzSefbiZSKCRv7pU9CI2Ux+nfDEe9o50olmIpEOQS13ttBi2u?=
 =?us-ascii?Q?BYa/ZHwhyC7e4jIWzs4QjZXX7iBq4wGMG3FwhmBICYAPfpaSXj8FTdgK6+Fz?=
 =?us-ascii?Q?O8htCGb6ggqOodojxVgB30H6N8OoLNNhmpCb8WKxPPZsWhJJrO7seRLWk97X?=
 =?us-ascii?Q?Z8qvzuZbxgicshvq0JlEwins6pXuQETYRWZYOWSQApJICKdihSyGa0Rm24t/?=
 =?us-ascii?Q?n9cWTHsfigNX2b9zhUFRjnl1dBYWXkFNFiDwtsGkStWdB4kW0FD50WgFmDSt?=
 =?us-ascii?Q?GSgAXAYkOHed2eXMoTGuDKIH5As8F+qJaF3WvOTL5WOTQPuLb3XM9UjRg+O7?=
 =?us-ascii?Q?CYltmNITtSz9U7I56l/e8zfYh4Uf+FhsS/zisvRl62G8E7NxtDOnW8mj1dIA?=
 =?us-ascii?Q?27gl0u8GCD+z59yvfmY2Kl6OI/8V9mKAvp/dajGfCLNGhbzBjGWItz78Rq+r?=
 =?us-ascii?Q?/YttF3ze4vIPdKJEB7kKB8gUyFEgI1P+sXeXajSoioEi+ZBMcmF6EzRrEQkx?=
 =?us-ascii?Q?aETTuy2VgWDh6hqHdX8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzYB0gfP7INuVtgBPesK84Kvc9LZZoTDhYoJqDNkhNg4CwcDq4YII8DHNvgU?=
 =?us-ascii?Q?m3WnNiNOd9rA2ic8u8Ye0N1W5tLT+EJYAuosJkT5Xup31U0snMQneNfc07MV?=
 =?us-ascii?Q?5e3SVySIVSuyFEqnRn8RkHFcKEIYD0HtK//RKBkAiWSUU7kr8ZXc9Nat6BxB?=
 =?us-ascii?Q?FpC02cXZDZ0y6ikrv23M4qosFupn2j1Jk/jsl14ZOqeGaDgmmuw6GuQlrQjF?=
 =?us-ascii?Q?FgEY/yfhVo4DFiqILCAmPDlzCtf9eWaAULLVmwBP6X6RBaQ/Hbr4dCRKXnyl?=
 =?us-ascii?Q?FJYxNOYfDfZYSjZb/zLyMraU/VdNYCg5laAYfyURKCwQ7lbpFrHamNnW8s5S?=
 =?us-ascii?Q?lLTdxwgh+plv3J07RmbjYBj3uYtwnzF0h8raXgMO7zTfM5raUdPQGwJWlj3g?=
 =?us-ascii?Q?x5nr5WgzCaC9L9fb91mpNPuwI6Ucy28MqY3BRMECzl8R+1MNvXual53MAa4P?=
 =?us-ascii?Q?4/Z8DKW/tBt7O3vkILi0xjqOkoQZuAmyJ8qKg9dkTBqIlxK3wyE2nNXkd/XW?=
 =?us-ascii?Q?Zixoj0zIUGX+Lqaf4xAL8Awe4Shb7ckCjaZ4oVvASs/1K5+O5fFgVaRokqmP?=
 =?us-ascii?Q?h/7F5Jq0CT5qA5y5Xv1TPXxko3yJcBOlrGbqoz8KviMcCEtWGnAFvNmuQ4cQ?=
 =?us-ascii?Q?QKyemdM0E1PbjUySiBUWrwJwh1/QIEKSgsE9j9IT0p408orYQZmenvsVn4/h?=
 =?us-ascii?Q?+8+R2ET71TK4swJ4KTQT3zfLhtsjdpsFB2SC2wYu1ZOeXT2CM5BAeafgQJZE?=
 =?us-ascii?Q?DALT8AjlEyAvjnda+ff3Z0LzA+IIX0ZJFQRBsSJwLQ+Yx7//UXVSFTS8QFfJ?=
 =?us-ascii?Q?u+zhmq1ahs5oSeb/AuDSfs78rMgSBSKjYsqgyoOrgXIB+hT0NYfj2bqicAdv?=
 =?us-ascii?Q?wL2satwo8uOChkjuUHTXLRHLPr5/RbA4XMds1mW0/ccIDlU7cTVJXPV/ubcb?=
 =?us-ascii?Q?yicPBToVX/HiFE5y8ytoAXSxrZy+A+WtRQsUcPBvlQ8fWNlclNXFRN7DXXNQ?=
 =?us-ascii?Q?TVZDLCITtahdBPWQ5owFEvtw/qskJyBVdTzkbhkw0kMskoa6RsKHDNz+Pee0?=
 =?us-ascii?Q?tMcywMF1FsRvZl5NwIq0z43hNsoy13i6xN4AR2sya4kUtJtPiLd8dVhyUNia?=
 =?us-ascii?Q?OakD5hjv7vlP32uGz987oYrDVOf5HZVWVElRu9WpnivzT0TmMwEKzh59WGak?=
 =?us-ascii?Q?XwwzUjBDkwyBFA0mMqFgqvmD8AUIxbz4xIIxgWqhqniYrBATE9QJm6FEU75G?=
 =?us-ascii?Q?dp7M2Gw3zMnVCHOtBYUaByRaMg5oiBrj88/L9lWAQLfVznW95rTpWV1//u28?=
 =?us-ascii?Q?ZXFh62FpEQPhM/RxflbmadyNSKjNCU7NkChrQY/ZVps5DqSon0lp9YyGt7JH?=
 =?us-ascii?Q?aDbEywGQScx1BaCwm5O8E4JkdqWxE2W4ZQOzPjIaARoUEodJEm0LGXeCmeGU?=
 =?us-ascii?Q?l2pAO1AFD96TJQqJO1XPstprY4ZoQX3dBIyQW15e8bT2pf4iURDy8jhd5AB5?=
 =?us-ascii?Q?T9VtVW+LSA9UgUPgnCNZywvD1EGD5ZyDRGYs1ZSUFJNyPLscoh206KEGor74?=
 =?us-ascii?Q?5qrCQLue8glBdQ2ULu91v7K2YP8zl/GBfNjcyilIhIHSaUeX/rHryz1hvdwn?=
 =?us-ascii?Q?s3OZyaW7E2qYmOnN7n/PFolkDHn07St5aLSEP+6jHBYmMHGts4PQvjkVzjnO?=
 =?us-ascii?Q?RGOW3p2ZSnLrrPNeW6A9Tlt+YFuff/Gosu219eYXXx7hHCUliARqw2dRfkHM?=
 =?us-ascii?Q?vUiI8e7zMQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad5b66c-cdf7-490b-8dc1-08de5a47ea43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:27.1319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUxQ3XnojG/jfPIbL2OTNjtkw+0zcxJEd9oZ/PJLC6PGzSA4H7tQH62YsknrrVPuC9zhn+2amJg1nxFd0FB7nw==
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
	TAGGED_FROM(0.00)[bounces-16191-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	NEURAL_SPAM(0.00)[0.125];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MSBL_EBL_FAIL(0.00)[jniethe@nvidia.com:query timed out];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: AF84170E15
X-Rspamd-Action: no action

To create a migrate entry from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..67910900af7b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7a8990b30fa0..1f03cf7342a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -652,7 +652,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..526105aa4b05 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..a7edcdca9701 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..7e5248404d00 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1


