Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1CD3CEF75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 00:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTHJn1B7gz3bl1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 08:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h3xBJ3cA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.95.70; helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=anson.jacob@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h3xBJ3cA; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2070.outbound.protection.outlook.com [40.107.95.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTCDb0srQz2yMr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 05:52:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z05x8ZCvFSOXkWs9J/TAC+SO5I1MqFeKqh9QvR3tJMYpUJ0Ka39/DCRh7zlsAqU6ewMcNpYvhjFSxIHfQwJn02FolX1ftuuC+UDz/3ox3I2sxhwmuISFQrO/Kzr7JWjnHvzkl4KrS7cwlH3xwbMQ6b2uuwREP5VWaZDTMeYBwu5xRRDPz2LqV//B5hxwPxJBLlQ6AelXIG34pWUglkG21qNUZMZFT0vDzD475dufn60AOAZzoG4jPIN7NytRhw1hlBAiMppe8BGHoFVBsYc8xSe1h6tvJ22/9Ver0pOa/svhG9X5kOPQQGS/N6u7A5kUBRUe2N8P3yYwWSsQEn1l7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLFru1+Qnm2F3+nuTsQb5+NVH7GScQSMOczwtI9TwE4=;
 b=M8pt6kIzl+5loXOP/2t6fSqdwyyKpQzpDCBBI4+9v4Sz2MxRh7HwrYWZxzmHo7z8XOJK+grMvzE0l5/hf4rMjQf5pLW+CJ0yENBkSyEPa+sotFj21BVwlY/Hi5sYJIQ/KD6Jj+3dFYjBzWGlc1HCgxc8taZoVFFR+Fx6dzy0U1VFdJ3MUhMR+zrGPaoG/ezubrs17SImpe92roiYMHuFYp765qLzca9GQNNhvvvfBuYpQ2R0JJuDFVGxGFiRjvJUWMn9S6FyI0IswHjci+ptFX6oRNpe6ZAlD5SGtNERx5cl9OQx67DadTgQchE4B3YztdzAJWMuLajtgEGqzP8GyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLFru1+Qnm2F3+nuTsQb5+NVH7GScQSMOczwtI9TwE4=;
 b=h3xBJ3cAukHg4plzNaB67mJ71mKJQNjI3Q5Batjsk8jjRaPqxbrszQfDlyPWDFr/E8ZJMJetfiBIR4NsUTSVwUEfd+TSqSAomL/3S6e3MtOFnH6LH0W8lJLmyV55/XfaUB9Abcxn4jKzHMlqzFBVBu1acA1dQAVNFkIh1rhLQag=
Received: from DS7PR03CA0297.namprd03.prod.outlook.com (2603:10b6:5:3ad::32)
 by BYAPR12MB3125.namprd12.prod.outlook.com (2603:10b6:a03:dc::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 19:52:21 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::9d) by DS7PR03CA0297.outlook.office365.com
 (2603:10b6:5:3ad::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 19:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 19:52:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 14:52:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 14:52:20 -0500
Received: from Bumblebee.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 19 Jul 2021 14:52:17 -0500
From: Anson Jacob <Anson.Jacob@amd.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC 2/2] drm/amd/display: Use PPC FPU functions
Date: Mon, 19 Jul 2021 15:52:11 -0400
Message-ID: <20210719195211.520428-3-Anson.Jacob@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719195211.520428-1-Anson.Jacob@amd.com>
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e0de346-eb8b-442f-06f2-08d94aeeb8ba
X-MS-TrafficTypeDiagnostic: BYAPR12MB3125:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31259C6E1A4135ACF5F5986BEBE19@BYAPR12MB3125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2pFJexsD8XH2SfhaH4qbZ3O0Uh8hUkozhsgJT73TK1WkW9EGfnY2Vg8yw016Ut8KaksrKCmH4Zz7E1zBCwnA2z8i0zmxdvLAAMWswMp4feka8Bvf9dEh8Mf3oeBX1dMWB9cdQPUeHREmwOh8nzQ3JEFe7V+Qz5gNFTIu8+75HYF1ckTNXRSfM3Ugb7M3UbYg0ite75Vgwuwbr6qP3oNTUI6r974EyUZWyO3f2e42eA/qiC+vNqzO9xmGwH+micoonRmYlKjSLVrUlUTPKxFkVKB3x+/UcULC6TMYiWMkTjwM56ews2S6N3lUO1qJGXXBO9wJhY7+VuMCIw03LXcm0cu0wTiz+5nc2UCq6VeA80nGp5htligDqdbk4dcxZFyXHyPN9TsO1c/QNxoAd/N+dRnrfvBMYP9tsHukTSo4pa+FHG+EUbF10wd1mFvLd8mjY9Q0eG7q5Nd2LH7lYo4VslRqc3SOlfx/6fZMSMmVC3Gc1Pcu8vMuEihUGmYq/xGSXCuf/fE5bBqbZ04Wkju2LJfyxhys7a9xri4VmiyodGBcOgt0LlGe65PgBzTCAVmfqAbGyIjiofoEeOOK+jwcAsGs28YK3+FOj2HFge4ETfpA6go9jYhcSTclESyZfAqEWhPlGax1FcGMCGjCE1QmHKSOSShtmZwGzWx+W8hsD+LBgAjAFb4FqRlASKVtsdzzr/NvEPv9I4AAFDaSE00hWQMzEqahqP93xDAF7na4kM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(186003)(82740400003)(4326008)(86362001)(36860700001)(478600001)(426003)(26005)(356005)(47076005)(6666004)(8676002)(54906003)(110136005)(336012)(36756003)(5660300002)(8936002)(2616005)(316002)(82310400003)(81166007)(83380400001)(7696005)(1076003)(70586007)(2906002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 19:52:21.0467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0de346-eb8b-442f-06f2-08d94aeeb8ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3125
X-Mailman-Approved-At: Tue, 20 Jul 2021 08:55:35 +1000
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use kernel_fpu_begin & kernel_fpu_end for PPC

Depends on "ppc/fpu: Add generic FPU api similar to x86"

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 28 ++---------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 126c2f3a4dd3..999c5103357e 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -57,32 +57,8 @@
 #define DC_FP_END() kernel_fpu_end()
 #elif defined(CONFIG_PPC64)
 #include <asm/switch_to.h>
-#include <asm/cputable.h>
-#define DC_FP_START() { \
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
-		preempt_disable(); \
-		enable_kernel_vsx(); \
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
-		preempt_disable(); \
-		enable_kernel_altivec(); \
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
-		preempt_disable(); \
-		enable_kernel_fp(); \
-	} \
-}
-#define DC_FP_END() { \
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
-		disable_kernel_vsx(); \
-		preempt_enable(); \
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
-		disable_kernel_altivec(); \
-		preempt_enable(); \
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
-		disable_kernel_fp(); \
-		preempt_enable(); \
-	} \
-}
-#endif
+#define DC_FP_START() kernel_fpu_begin()
+#define DC_FP_END() kernel_fpu_end()
 #endif
 
 /*
-- 
2.25.1

