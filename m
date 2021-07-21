Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B297C3D07EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 06:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV36F4SChz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 14:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ObFvdECS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.237.63; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=anson.jacob@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ObFvdECS; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV34m09MSz3bTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 14:48:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWM4dlKWpdXIvioaZYHt18r+Qvjr1MI3q3yn7gE00DXNdx8LTmXbVsJusoLLfwf5qnuFX7nNGMQFBjwuaNBDckifiJGPpWFHZNjcxrTiZ+YReZ83Xo0A3CgS6NljYRWsXx0LwCG9Ili7bYEwepsjVkJAJKVOGALNFCgfiOnYNPVNh8Jbk1oLt8mhUjLqTErqsfkpkXNeQOWor5NdVqPhmQdZZnWt3s9OvBXEcZZRpTwnA0JLfMk3xXp4i6589397le7gtK/GHJiGjT5eo8poDQ6YqGEGASs460TaIbvvvNM6T4LDgOjkpIAeFxV5fR4Z8dHaXQv4RC/LXdzZRdDubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbtVLY3/SNAzZ/q6dAPqNpQpqBEP3+dwnKNyCcuyZ6c=;
 b=dF66Zldw/0UGRzvpwLxj8ZgQrcKCeW7k9JDbCUBCrrHc+D3xxZS5civhWCtQpFobHE4O1eIrjYyF7GDrkh4fpNQI0igOJm8+mORJiAK3f1+LGAP3Fu72SJvm+ynTqpMqnhYRUE7fsqLPJBb3lZTKWchhJNoFThJAWDyB+bfu3XooOZtBVyUxQld16AwC13FZh9D4s8vGRaJuE//qXvbaf4cux9XPOPeXTACU+q/JHuWSaEoezGk6BTbhFRnovySt1A4MZRyu//FflRLr59cykB8di9D1jl4F/+M2D/bfPpYWPWJMF2APCVFFv6QkOCpAu1O0f03DLPdGIbBohw/Law==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbtVLY3/SNAzZ/q6dAPqNpQpqBEP3+dwnKNyCcuyZ6c=;
 b=ObFvdECS9OMpqW5K5Xb4DvYlDQMH4RPMw8Kt46sg1Aa2Db+NB0EaTbQBmvIeRs/DpiwCAJGbahMxRcEyQF9lQ/bZuPSBlICPi8z60cFkIxhZgweXprNpgsY5fNIbUzF9q7WwMQgU+UdWXCQ3PRUSbYFIrmFyHlCsFoaz2NGKxKI=
Received: from DS7PR03CA0180.namprd03.prod.outlook.com (2603:10b6:5:3b2::35)
 by CH2PR12MB3686.namprd12.prod.outlook.com (2603:10b6:610:23::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 04:48:19 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::2a) by DS7PR03CA0180.outlook.office365.com
 (2603:10b6:5:3b2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 04:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 04:48:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 23:48:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 21:48:17 -0700
Received: from Bumblebee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 23:48:11 -0500
From: Anson Jacob <Anson.Jacob@amd.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
 <amd-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v2 2/2] drm/amd/display: Use PPC FPU functions
Date: Wed, 21 Jul 2021 00:48:01 -0400
Message-ID: <20210721044801.840501-3-Anson.Jacob@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721044801.840501-1-Anson.Jacob@amd.com>
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 181b8a50-9300-43ed-bcd1-08d94c02c28c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3686:
X-Microsoft-Antispam-PRVS: <CH2PR12MB36866E871A6F91C818349AF2EBE39@CH2PR12MB3686.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xDa9zuJFMNsVB3Qh7VO9H0mmFAhb2OEVY6uC44qZh8hc+MZtp8YgBMKqol6jE04Aj9vqAGQXKO3I6K3xt0YlDb5Mshk5MPD5voqtzfKsA1YUI+ATddwizA9nF6IsVfvZ31OIT0OfKPwGfAGNN6pucx7kh10Xu9C5ecP4BWf/bTjextL21J8HL37roKjzI/xUNXzLmMFP+4S2ZsJdZi6VOZMINZRGuuKn+2PQqC1aVQLL91Cr3frD/YbFv3unJ9fmGYVmqIBcABgbDprjzgVQ1wVSoGVPutAvskWWbdqJUH0W6E3txKHJwK5/qcYb/b6Tj3GMyrxgqwmLWYCXjee+ImpLLIZAnxmEXJSwLEN0Gd/ulPDyR8B0y1Fr4fz8XgvNl+Om1+9vBFeCmgJ0TcRrKT8zOWx4s6GHu0BfLNOScJh09Xtu2NgFfpvICCEdTzWZ3wFULhEETd+tNQZ/MuhcHoPLcE8ZPi42iqEPsqTJAJlnodDRR+IuWenpMVjsqFnBQlZNZkvSvAfRuiU6T7ExyEvRKjhL9xxXg0I1KWPmIMk6edwsCo+NnZSFuVaZxZxb3UBQMhzsBdLDZNpiXtZB/VliCzzFxlSdCjgOWfOdT0sSYibyGsZzPINC+CdvsV5xCBx1YNr/xc1KnpiDPDzf10hZau/JqltwZdbjRFfsYhFg9jdX8JNPTjH92yeH/oB8oR9ugPS/FSpe7ZYlHy7POQQXf0zWjyp28Rd1crjIU9o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(356005)(81166007)(6666004)(1076003)(82310400003)(2616005)(8936002)(336012)(36860700001)(316002)(70586007)(5660300002)(4326008)(70206006)(110136005)(83380400001)(426003)(508600001)(26005)(36756003)(186003)(54906003)(47076005)(7696005)(86362001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 04:48:18.6315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181b8a50-9300-43ed-bcd1-08d94c02c28c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3686
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
Cc: Sunpeng.Li@amd.com, Harry Wentland <harry.wentland@amd.com>,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Christoph Hellwig <hch@infradead.org>, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use kernel_fpu_begin & kernel_fpu_end for PPC

Depends on "ppc/fpu: Add generic FPU api similar to x86"

v2:
- Got rid of macro switch for PPC as header file with same
  name as x86 is added by previous patch in the series

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
CC: Christoph Hellwig <hch@infradead.org>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 29 -----------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 126c2f3a4dd3..47ef434f93d8 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -51,38 +51,9 @@
 #define dm_error(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-#if defined(CONFIG_X86)
 #include <asm/fpu/api.h>
 #define DC_FP_START() kernel_fpu_begin()
 #define DC_FP_END() kernel_fpu_end()
-#elif defined(CONFIG_PPC64)
-#include <asm/switch_to.h>
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
 #endif
 
 /*
-- 
2.25.1

