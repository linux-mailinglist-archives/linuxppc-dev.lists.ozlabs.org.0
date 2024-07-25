Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8A93C703
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 18:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gorrHwtE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVG9J522Zz3d4H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 02:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gorrHwtE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVG8Y4Qslz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 02:11:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6ePeL3WnwEBYj3O6jnn/FS7l0btSVBREFfz1lH3Fn2mu+wWNNQkxISg42eiIkX6wk+pRYwHO0hwlXxkcaQbQ/tqQNFH7Yb4FwGACA6vsl4ddbcob3DtyM5+fYt22qwDiaqXsgRppq5rja4D8IxLnXMC28i0zmFJZ3GjHC4JDyUYJ/KftqKr0++0D8a94KEJd7otGq/WR+bwhynXKqq7h9G7N7WTbAnTKocGObyu5Xauh187IUTkSHUYx2dN8pgCQ5stn2VS5wMpWlb8xqssUYU0aXOMENn0Wvc5u4TFM8YsjivZnT38soNy4hkZKhNpyOK2yaMlj0QzfpmP+N0qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GX2Dm0FZLsDAuFl+oWdmqcNYtZt907eQ00u9m1llZVE=;
 b=VgSddc8GlaE7QyQhtgQB9ycx8NP8GsqYgGLwk7g3InMM3HQBdQHS/e/qH6lq8fulZkt3GXurldZmRK/f60bBwNU9WwJiEFge5KF26mZkAIgY3IlBJDr4u26A88OQu661bDx0smZshy7+e0YLCHGZnUcLDWhhl6j/y/m8WdBTAW9zvCF+6HQBRhAahlImwyvjzLZhUZNkzU4BJa4hWUbKtvsMl6tlhHgDHSVCtx3jYcwtBFk6zLGqVtGVA6QC2WyK2RlJWU3/y/HwWL0yb5MYlPfNQntY9teh01Po12oT3R9ZaOImNIIeKvhDY3KFKNbZmbScPQ/VuGwRUfHII6NHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX2Dm0FZLsDAuFl+oWdmqcNYtZt907eQ00u9m1llZVE=;
 b=gorrHwtE2k+LVNXHVFcBMOjaPeBHKnt4GONk4/SEEZDMKj2Cfx2LE6DZcdfIsYyY/vupDWgaNjB6RlIRnEtRkPIeCWyM7YrHMpuTLW1sz1JzNqCECiFPT5HfAHdaobgb3w3p/g4lwow8MFKoTB+oxc/42TAEt5qDpNkc+YpcauY=
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 16:10:40 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::c) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Thu, 25 Jul 2024 16:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 16:10:39 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 11:10:33 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v5 0/1] Add XSAVE layout description to Core files for debuggers to support varying XSAVE layouts
Date: Thu, 25 Jul 2024 21:40:16 +0530
Message-ID: <20240725161017.112111-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aaef931-fd53-4e67-8211-08dcacc45394
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?UeJpGMaOIFtx+bUjh+3NnPq339NahtuFvUlfegiQcZL+hwtlK5THQjC7YlyX?=
 =?us-ascii?Q?SQYcmWac5Bmyy9UBFHb3yAm0imbz+dsG0Qh9jeAQOoK5pjleJ4ynDZD8wJHX?=
 =?us-ascii?Q?ppBlvzMEZcMfDTsQlNmiLP5ibUe2wQj/zcmyA7WgA9yCOmSgZRZr9kZCiDuk?=
 =?us-ascii?Q?em3ZDjlPFMhjhdEUdc8adcK2q9Qs8MIPWxswG58AoXOCqXlHMhQBSCNIiVQc?=
 =?us-ascii?Q?Z6dU5urVXPcSVagsTgGVApBey0rZQCUm51c6d7Wyr+0GiI87ydK/6xrYbOJS?=
 =?us-ascii?Q?qX387JFelXJ23Jf/hlxU3gAB1cxfi0n8OV5Zwo7Bx4qrbM101SgMP4rCAe+h?=
 =?us-ascii?Q?RMOhe0+7twPhkkWP2N6rSeCqPFEEjwkE3pFL8UHA4ubn7haHwpDiqhYkQmeF?=
 =?us-ascii?Q?vsAFWjqp3GBzKNas7xw7vMi00A103/YeLps101DHZ5jEXi/uxFdw2iaaRMmH?=
 =?us-ascii?Q?tHn6wMCW9ibzKJzEmTqCknD6pL0vfrJmTiBUgnmgvHEwUDR1Fb54ccEkPXOn?=
 =?us-ascii?Q?qtMUONV8hx0OK/4Nha3eplwqWQEXmjCo6UXkO1v3VuspRo0JOt+flIi22tAW?=
 =?us-ascii?Q?89MHpqXqmZisCYKe4wGs1VXM1ZBSH6hXzOYv/eWLWItfHp/HFOwzY7J3cZTe?=
 =?us-ascii?Q?FkhZ2wU6neRfWUVStLxvnxyEqO7HdqEKXsqCPtlAU6DY7aZxuQrpj1kK/3Sq?=
 =?us-ascii?Q?VY4WeEvEVUVWYvdLHnrY/M+cbcyZaSUDMeKzMjmi9Suk0u+jj+6a62K4q428?=
 =?us-ascii?Q?zeUYKg0WBsKESpBItNf6lZ2Ll04i0isH+ZTKRbIBfqoZOxZeHDmeSX45MYnR?=
 =?us-ascii?Q?GPXyfqlZDe2dkSiLGmfJmmDhXW7VjbRG5bU/TJFHVtmTlSuoX+aUOiHyG4jw?=
 =?us-ascii?Q?rnt+KcmCcEBGRQ33Tlvjt8HQh57X83YKmVZ6q7ut1nkm7SBCioE3Q43W0Ysv?=
 =?us-ascii?Q?10tdIsc8+L7mHX2EbWCjLGrdnmpBCufIPUKUBUla2TYn/udMjO6ox7mEwnCw?=
 =?us-ascii?Q?0cb1DLiLau8493fYQ0bsDW92LLbFUZN+8YMwote9hVHy198nTDqm3R0omsaq?=
 =?us-ascii?Q?w99A0kB480UlywxcGyxxR3aLCFMoZRTAHMTdGxk6CxSK1wMLhUQHBpH+kkZz?=
 =?us-ascii?Q?XQjIebKzhCXW95h8mp9LdklQkP1kAofEkzjHdWpcQ1HSDhKdiRm7b9zxWiKj?=
 =?us-ascii?Q?/0M5YDpUeV4b2L8aVAogGNdiERBQ8MQojvDiuEh6nrq85Tm775qOsC6EcMGz?=
 =?us-ascii?Q?Ajn/ziLgkw+Obnw/7XMbvXfURJXyC7YT2xQcnd9hYfX2taIE793WKxGFxTpW?=
 =?us-ascii?Q?R6EQ7pfGE3HqE244/Y//LiF1ULmqPfhHRmlCcjbUiijqs4omVNct9ET432qg?=
 =?us-ascii?Q?+aUEaOsXMLtGZfjkHhbN5B1LTo+rvVd0k/PzC9DXwoSS6h76WGke7Xn+x510?=
 =?us-ascii?Q?6ssfNMyLmGiJEcd6PgiydpEvXW+OjhAi?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:10:39.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aaef931-fd53-4e67-8211-08dcacc45394
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch proposes to add an extra .note section in the corefile to
dump the CPUID information of a machine.
This is being done to solve the issue of tools like the debuggers
having to deal with coredumps from machines with varying XSAVE
layouts in spite of having the same XCR0 bits.
The new proposed .note section, at this point, consists of an array
of records containing the information of each extended feature that
is present. This provides details about the offsets and the sizes
of the various extended save state components of the machine where
the application crash occurred. Requesting a review for this patch.


Vignesh Balasubramanian (1):
  x86/elf: Add a new .note section containing xfeatures buffer layout
    info to x86 core files

 arch/x86/Kconfig                |  1 +
 arch/x86/include/uapi/asm/elf.h | 17 +++++++
 arch/x86/kernel/fpu/xstate.c    | 89 +++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c                 |  4 +-
 include/uapi/linux/elf.h        |  1 +
 5 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 arch/x86/include/uapi/asm/elf.h

-- 
2.34.1

