Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E08BDF07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:54:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a6KN1hRy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYXr6s8Zz3cZC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:54:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a6KN1hRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYX645Dgz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:54:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqbaEsenmywj7Z7FIJZo1Q3+OYOiXrvvXa21r0bs93Ayu2PuWUIDwQj6QhGKwVsj8I/KzmRqV8z/687fyXlilmCK4HESX5bYAA8l9WVzuarTHL/J/Epb3t45FdjP5iS5eaWTXgwKRVmhvEZX0n3QG3/0MGsLg7vQ+e42HgRhp++oADZxESJPVtlNaSwG3MVpCT/Hasyz4v11dowGTJsjAyqIoIIYugd7tTubIZd21BuK/BizulewEZhLg2uFF9WEuc6Bn2FF9Uxa044b6NCvvaHgXmYH6eGPUpDG/5P8817fG0Z4KmeloRtP3ni8ENT7Z3O8ZKGtsQqFL+M0cBdE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH6BGYy7mf1fyXku731S6zxgWMACbhu2tlkuVTdptpU=;
 b=SY0gFW7G35cmsOq5n8GJEfG79u5wJij+asMuyqYvKwJg0ediNma1wkYRsXFO04r/ozJ851seGkkJpa3kBOu90anUm5Il36hxY6myREgMDmkgTcGPG7DEIbJCyG31+ux8xBYlKfo6pfnpfsPSxSrAX2Jy+1rMN0VGiIRWZjUudiVIY/WJPHw3rARLbpfPs6iyC3GeRL1ZSp6CvOByOJyTJumnepMQgQJLwknZ+niGYJQkv1O7PrxyFekWOBeCz/AVmK34w/MGDt5jLBuCRK65p1g0k7ivDyXr9cAMKyb8XGfkylT1XI6Ki6sd4lcLFDT1jgdXuTPHDz0yRMNgSr6SSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH6BGYy7mf1fyXku731S6zxgWMACbhu2tlkuVTdptpU=;
 b=a6KN1hRy0g9scoTMgNoBfEK+ZvknG++l/h6338HZmRRXlRpahemwYALpWIMVOpNpYCd6MZP/sPZvhwyeNbwKc5GOKGalPbmy0PaT4aBGWP9lAtkE9KCJLhB9wwNJRbwzyrdPpc0gBdbD80/WZ/Yit9J+UGpYyJC6OSlJq8EGgUk=
Received: from MW3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:303:2b::18)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 09:53:53 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::3f) by MW3PR05CA0013.outlook.office365.com
 (2603:10b6:303:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 09:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 09:53:53 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 04:53:47 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v2 0/1] Add XSAVE layout description to Core files for debuggers to support varying XSAVE layouts
Date: Tue, 7 May 2024 15:23:29 +0530
Message-ID: <20240507095330.2674-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: c95f30bd-0af6-4c6f-483f-08dc6e7b9abe
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|376005|82310400017|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?a5h32qQDJ5N4mMwpegucBR5OfffU1jYv0PNCM0Y+OddR2ULUJnQEUMZbIbWj?=
 =?us-ascii?Q?raTeP936Sgo7TsFYc8XScTPEJA4Mof/P3edkL0SAlPNc/OWSFqemklHQLskT?=
 =?us-ascii?Q?u7+/UbewWieDPJqMrU3B/sE+9z8PLvItVcyRnnQbt7CpCHAiKLz5Kn6ClCEb?=
 =?us-ascii?Q?7W4IiA3sV4c2wrKhlTC63QMuZvbtjnZwUOGP/0+VByrAvVhQgB0Y/inEwTRC?=
 =?us-ascii?Q?kP6nSmfpPL9XehzAcUbFVIGqyhaNwLCeHtiX/YoZZ4gKwWYFuCBcYgy1XdMd?=
 =?us-ascii?Q?ftZX9aW0FIY1KyKTIWYBa9TCEpTEdOd9y8dbQPBWU1GuUbR8/wJLd5YbK2fB?=
 =?us-ascii?Q?OGLpulO/xT5HCAZFmyatky0puu2EHUfgeGtfSD/Q5WHT+5+DGWbsFz9xWmqh?=
 =?us-ascii?Q?ugegp7VJQvW9teYMuZFk78CD3xmuNRjHyogDvKdhCkDDOD/GX+nP9eajygth?=
 =?us-ascii?Q?jfHeHtnmNPO2VSLZ+20++AfKgopqE4SIh5zEnFUyWylCa/WA+dl4Ka3y17cc?=
 =?us-ascii?Q?kSx4Dh1evYUZys2tHJtu2bXYlp91RtdCP7LsNO0fgUdz3asAC+3zIBHI/Ps9?=
 =?us-ascii?Q?fzZmIzcuJoQFUNVEP+kjqVdj+NKR0UC2gvqP63oaUXgMxhNJbjrV2jQqUkFs?=
 =?us-ascii?Q?Gtahj4zzlWe/3lg4AHoFEyWAbfG+l3/KKUAF5gKaQdN9m1bD0VILAOlKzKV+?=
 =?us-ascii?Q?Q5bnP8PDKOIZgmCCt/Ezk8vP25CFB4qL3mCfkDhG5m/yYoETOhJbt2D5TO8M?=
 =?us-ascii?Q?5k7EGoL0YAlWIn6d1ftZ7CKdU6hI3PAxRExulSopAImHJTz9MnFVXumtxIZs?=
 =?us-ascii?Q?f6dHFPbPCj35tSTSb9p96ZezwV8Vo9yQZmMdix8Gk63rPWT6uHTyZBxFFr2Y?=
 =?us-ascii?Q?OPyVplEc/6qXFA7zGDtLQK5wLteKPoDnAJVRlLVdDY91bq5y4aQOkaNRjWpR?=
 =?us-ascii?Q?1oImJJHSHd2VBwS0LbjQ9t6qSUmgWA6yGV45qfRWOPK1+7DTTykSQ8TDFJZl?=
 =?us-ascii?Q?ObHje8cEqWc+rvNFRCD4//uT8DfL7uMw3cvn4mgXYsWZ01sPoyd/Oi4ICvUg?=
 =?us-ascii?Q?C8B9VTPOQGLbRub0Mpg5Bc/Zc4sTecLakGU5OgOE/1sNiZRf7lbdabbcbp6G?=
 =?us-ascii?Q?q2Ar3DOeagGsO1IHtXsdlmHU6f3ludBcrZnfLMh+a4zrTC6g2kMpxum5+zsj?=
 =?us-ascii?Q?xuRV76JmbOzeKdtqbPyhF9+Q98UGFHmpZ6oHL5ReBpa2/qUR9lUSbjitd3m+?=
 =?us-ascii?Q?u9o3A0zKNc6FgUkfoApchdiBWwLC6v/ej+YljfTD25SvObq3KBqHFVNxBVJB?=
 =?us-ascii?Q?G95/RO1cyRWqzOVlIl63aIDL?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 09:53:53.4399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c95f30bd-0af6-4c6f-483f-08dc6e7b9abe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch proposes to add an extra .note section in the corefile to dump the CPUID information of a machine. This is being done to solve the issue of tools like the debuggers having to deal with coredumps from machines with varying XSAVE layouts in spite of having the same XCR0 bits. The new proposed .note section, at this point, consists of an array of records containing the information of each extended feature that is present. This provides details about the offsets and the sizes of the various extended save state components of the machine where the application crash occurred. Requesting a review for this patch.

Please NOTE that this patch has to be applied on top of the patch (https://lore.kernel.org/lkml/874jbt7qz3.fsf@oldenburg3.str.redhat.com/T/).


Vignesh Balasubramanian (1):
  x86/elf: Add a new .note section containing Xfeatures information to
    x86 core files

 arch/x86/Kconfig             |   1 +
 arch/x86/include/asm/elf.h   |  34 +++++++++
 arch/x86/kernel/fpu/xstate.c | 141 +++++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c              |   4 +-
 include/uapi/linux/elf.h     |   1 +
 5 files changed, 179 insertions(+), 2 deletions(-)

-- 
2.34.1

