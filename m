Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AF8A2670
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 08:23:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aKi+OKzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG6200Qbwz3vkq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aKi+OKzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::60b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG61D1tk0z3vf2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 16:22:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7KQ4wWvpVyqUo0jrCyNjJseOPw+ufQJ2lvd42xlEDRbzdOYnP3m2xiGPWBEB3tZrSXIOmxFnDxlMTIW9FfUi/wNkhujmwUgv4E7Y3U8gML51V0Hp77CtpVLPaIeFryobJIATYa22tt9Og6CoMM1bjMiw3xt1GpFxNgLlii9V+edw4hna4pIaaN7DLgphxOj/hvCrQcl15HTx9HzAXQImdlkQs1fIuOz4Lf+ggTnbuz9XQyRWnwonhhVRjd2uotcLthkgBRWqz9E4lowBdHd4k0OCDry4qrw6STWHLD4qQ314AQktFOTN/gpATPQ+jwo1/PjLcErr0Sd4kErwTHX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+Wy8HziLGiQ6367N9s58GyicPrcV2tmvbm4xy93p3M=;
 b=aDCZEV+8zffxkvA10mfDUiaLNvh9WEz3PWqTQYEK7uY6W475AGVHdwRTxM0f6Jqvm48saDJLkifQ3AKvyu9F1S+hnxz59dT58ucSHn/f1BkkCo0hkcxlc/JC48YZTc+FIg051vwFzCNkVmkvrlGF9003QigPo8esG2C1LNJJRsivl6pZg0YmuUC/R3x2agWebzTT7yqEZzguOnVo0xw6XE2XKhOGoYPI7pUHGocAnvoP+hSsfNEX9QVmptwVwPnyTNhD40gU8p2H3lCZv6qSXGFVuv5ljW13HONu3plKb1NvaiPfoUNiCxIMlsRKlN4mbTHXYKjj9AvRhw609ZstKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+Wy8HziLGiQ6367N9s58GyicPrcV2tmvbm4xy93p3M=;
 b=aKi+OKzUxXuGKowJzBv2JR+5RQU/Ul9SsTaUQ1SkU7+7iEDDkrNV+vnbeRILRoXS6VjK6mpk9KtpwUh1bjbSOUVsQEEZW2dgAvHdM/QzBNbUwqnLWSg7ETBevnlQX/vH2DX4XMEBFwMN1DsQ0t/821bsFq5tWh9qp6hpeBWkpnU=
Received: from CH0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::29)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 06:22:00 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::3) by CH0P220CA0014.outlook.office365.com
 (2603:10b6:610:ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.46 via Frontend
 Transport; Fri, 12 Apr 2024 06:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 06:22:00 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 01:21:54 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH 0/1] Replace the macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
Date: Fri, 12 Apr 2024 11:51:37 +0530
Message-ID: <20240412062138.1132841-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c7f989-8689-4339-bcd6-08dc5ab8dca7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k4lkyO6DQFTl/3yHDCnnFMMvn3gU52ENOhlLgzlAnJyJNQgim9ItPE1nxe9zWwGbRWYCFHasT1OuEToiRP4hUWzgKWltOFXoSJ+qlpJYp0w4lDvsg9M2Tl5k/VuddX4cB00OH/ct0XFBQHbASC4/Dhuc+ebFvGAueXB2l3ypyi/rCyksw1wnolkdI1FHaxnX0Vyh9f6yaskDBbjOk56yElkZIjQv9qxsNPSp28hpDbqfZnyyI1h+VixRXNI6kKqzSEI+rBC9LoLSgrVl1MZygmQTI/XemSXWjuUhCXhqdxvPVaSWeZuk3KWNNfCfhJtOZ7w4dGD7I0SwLve2pEGhzeAsUis/YmoB0yTxZI1WvHm5+0nEpV/l+wtLTiyzZFcHmvsXY1XMQD7/JFBj6J3yz2EGYZ9mGc3krGnAUqmg+LhN/HLfrfzxnSswBTIag0r5+5srC+YyDTQA0Tvj1E5SCmBQow8TfcCh8YxSNigVPZieqzjIRHDE5g2vYNmkRgOle1A8Kem8DKwAElSwztH6DdxPpCyRYg6JyqMOyL42wQhrZLgrfDUQTVnAQWD12WkQ195OGw6nfrCXnqF0vW2OAY5S4WGBUcG8Ag8sJbFTaRVOqG6nr81FCMJYzQCGVb2mZrQaOit6/B3urBsCXWl9BJRhXjE/xZONDz85pJnNyU0IcuoRzxIAaO2LvdJe9bIfOvmyyl6K2a2pqunrAcWJ9yD5/8u7Iv/N82EW/Pa44RNuvbFXK6Q1/W8MlBoSlFOlRafSxicrVyvURd2IUIv8Gg==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(7416005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 06:22:00.1605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c7f989-8689-4339-bcd6-08dc5ab8dca7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
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

This patch replaces the macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
as discussed here
https://lore.kernel.org/lkml/CA+55aFxDk9_cmo4SPYMgG_WQ+_g5e_v6O-HEtQ_nTs-q1zjykg@mail.gmail.com/
It is a pre-requisite patch for the review
https://lore.kernel.org/lkml/20240314112359.50713-1-vigbalas@amd.com/
I have split this patch as suggested in the review comment
https://lore.kernel.org/lkml/87o7bg31jd.fsf@mail.lhotse/


Vignesh Balasubramanian (1):
  Replace macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig

 arch/Kconfig                   | 9 +++++++++
 arch/powerpc/Kconfig           | 1 +
 arch/powerpc/include/asm/elf.h | 2 --
 include/linux/elf.h            | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1

