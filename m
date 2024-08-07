Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239394AC9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:19:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H5N6vJuZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfDNl0dbrz3dHj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:19:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H5N6vJuZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::61b; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfDMq0fnfz3dJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:18:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UocXqFLjpS9FzTpoD1iWnKKF83LxuWIq3ckAt98AmuiWmvqWVo1U9Vr43+cWl+J2AzlYIJJuTxpqp33o1SP0pOMVd6fuZVvzd4kxW3WvzwZ8PShmcNdyc5xuf2PPRxl935xi62a2FgApL2QITu6KWcJtZcuAwpoTzucSaW/06gL0LqZMRamW0FyPRS+7IHlXOLQb1u8g2RrlwC4I6XP6cNKzkqMiAs2IhQgpcGK/APYyTkEQHPuq8qqSMYmyaM2VFnFTfoVwYppAYHzcmbXhbdJ8tcgHskBLbaWM4W3F4ntxdl9SyCeKdwWLtRWWYZ763jA+tcVfov9SNX8MM/Vdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQjW1+zPJyuNaM4nJsShFENsz8wXgdGK0F+W2U3VryI=;
 b=OtnGNZhn2SqU+Bv4hZgqNbW0jWUhMSn95x3vb4crytNs0UJJ38brLP+sCL8DJ984OtBoNMO2FxSdJl0JG7s3+vk1ayjO8sb0VG1CSEtLI5c4sBtC6iG7bUG9OVOJbaLhpFRYWAsJpHlKe7IoryLaQLb+LwWNiQnieNqwWBqtz82wZ7MyndRvj6S1o6qLUpvZchQe0SyeWkTNN7sakld05bbfvA5DCgRNZ/iO2Kdic73b73bG12IhuDAOwScAYf+vE+/zPoWrEf+E1NswO1h4sGSWAN6Y3srC0Jwbl+WwR/d8yQrtFmnrh+IHG75HF+7mOey2IFYD9waN+F6AKhbgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQjW1+zPJyuNaM4nJsShFENsz8wXgdGK0F+W2U3VryI=;
 b=H5N6vJuZvcp7y7p7Ts4YDYpwkIPfT0IeSaK8M164WT72PjjX/WTReHMIVNMMS6ApK7vM+WoU55H6bs4uu5FzLAwThZpIs/+UigGxh5Bhr6kmmO8fQ4RCcr5ih1PLDhGiuGoYjRWcLRe5pwDod4ULiWuF258FGqeJn3zfGT1f0lM=
Received: from DM5PR07CA0063.namprd07.prod.outlook.com (2603:10b6:4:ad::28) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.12; Wed, 7 Aug 2024 15:18:09 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::d3) by DM5PR07CA0063.outlook.office365.com
 (2603:10b6:4:ad::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 15:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 15:18:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 10:18:08 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 10:18:06 -0500
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, "Sam
 Ravnborg" <sam@ravnborg.org>
Subject: [PATCH v3 6/8] powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment
Date: Wed, 7 Aug 2024 11:17:15 -0400
Message-ID: <20240807151723.613742-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807151723.613742-1-stewart.hildebrand@amd.com>
References: <20240807151723.613742-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9166e00d-17aa-4d2b-fd6f-08dcb6f42582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?ERSb8i+uJZA7FSaFG4UpLyp1bA59gwJp22mhZGMHzGHQ6GFQPgGorrEtAYuq?=
 =?us-ascii?Q?cYEutJ8pd4SPR5Aix6MwmjO9oK3iiu/0K43M8xtI+HmqRVxgZ2orEiSICszz?=
 =?us-ascii?Q?VRf+GFxQhzfhh9F9yyCwpDxV8JnpXUav3w/izG0Ni3vpPDAnAAtYbxfVCK3F?=
 =?us-ascii?Q?xq+XqDzP4J7wcnkU/aLUyUP2eb+X0MktfzbaeELzt69wpm1xtl7Mq7ggRRnb?=
 =?us-ascii?Q?BJC2moC6ld9U2CEykV5zlNkZrL8VO8AwxYMriMUthReF5Zf5aPplyJTqnPe8?=
 =?us-ascii?Q?p6Yh1NumAa/vTW7PbGb2R1d0A0ZHgwE8qwXsVLHcjSh2fHkwNKkgKeS49vWy?=
 =?us-ascii?Q?LQo/zGgX+Kor4lUq9LrZZ+baDpLnkdnMkyrtqd47RuX/6mo+FMFVhy/13CNE?=
 =?us-ascii?Q?p0k/18F6+PSwg2dCBPVhhwdYYhlxcJX3yJER1A4l5mCxPGRNeWOUDZZLRNP9?=
 =?us-ascii?Q?d2/xGXxZnWRFiHxYdy4UehSNytbuDEEPtk/XcC1QNJk03+wa9HjuyNbLLyPv?=
 =?us-ascii?Q?jAeJ8pVFDx0DZWe7+2Yfw4apVu/XGNrg4kgHQBBdWGweNVc8c8j3/gmbj72u?=
 =?us-ascii?Q?e+YAM4+T6T4nacwbbzOUd2dwO27bZ+QX4srccS0JsQH6iF+p07XnVHUR5XAx?=
 =?us-ascii?Q?REAE6y4USm+3qk3h+HiJFWmdbL23FKOzFFcDIFqFw/eiLnhBU4GvXfRqM86M?=
 =?us-ascii?Q?rQEXhbK1wlsHkQBzupZjWKE+MSwOtk1uuYv7Xs/hAQRwT0bCRA791PEy+5Et?=
 =?us-ascii?Q?ywUmEyOZl2ZNwRwSTbpju9foV8VNEpdb36zEep5OS8u/vde3e6ZFTwvtyZcu?=
 =?us-ascii?Q?Xaj5/lbR7nZfnfMKHKepLNw6EI0aQJ91nAusLqy/aJqCYD61rvwOrHRgcb+/?=
 =?us-ascii?Q?DkuWip3FiHP2nEzWSlr+SdCtF1Sh93SmyKt3Fr/8oxpPIiUuOwdXsVrDUJ1s?=
 =?us-ascii?Q?27vw+k4Tr5sM0UvIQUpUoj2JpsKG+DiM1nFddnUEtzVVw9D5d28gwi0SktCy?=
 =?us-ascii?Q?d5mmM3O2QGOTxCFWgjSy1+NvxoXMeK9RW6zGfUcHjEmu6KBW/HUj04Iz/8pq?=
 =?us-ascii?Q?wkeqSF+hPGSyPjs39Yc7IXzd9dlTQqIUY5oTOWL1CysmSyCCqng0oHc5I0un?=
 =?us-ascii?Q?jwmp4W1ZxfrA5mikI8G3jcIS7aMGSaQlDTUnkvCzR1+47wlHbiSLHKjgmxVn?=
 =?us-ascii?Q?LfwRm5maRUJVY/LdwnreJDdJd7bf8eKzh94kwzHPIsk9c1RLK/x3BJ7kY3EI?=
 =?us-ascii?Q?7fhJnFrgzoBdc5ohjv3mcMH0TZmVO0VtsBuBevKX7gYVNbYPWmByW010ipyF?=
 =?us-ascii?Q?Fip9ivdxMW8ELzp5ZQaFisznIIPs3A53gREWO8plphrtNrJuinQYd8FEq6S+?=
 =?us-ascii?Q?Gtk55WCGykCkpWSt0JAG1nAeJkr7fH0TpEAjxwaLxL8871joHBONVSWT1EaY?=
 =?us-ascii?Q?dqwLOn0ro3Sou1WQx6zSaqd+XPpYhmHM?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 15:18:09.6291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9166e00d-17aa-4d2b-fd6f-08dcb6f42582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stewart Hildebrand <stewart.hildebrand@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a corner case in pcibios_allocate_resources()/alloc_resource()
where the IORESOURCE_STARTALIGN alignment of memory BAR resources gets
overwritten. This does not affect bridge resources. Account for
IORESOURCE_STARTALIGN.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* no change

v1->v2:
* new patch
---
 arch/powerpc/kernel/pci-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index eac84d687b53..3f346ad641e0 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1303,8 +1303,10 @@ static inline void alloc_resource(struct pci_dev *dev, int idx)
 			pr_debug("PCI:  parent is %p: %pR\n", pr, pr);
 		/* We'll assign a new address later */
 		r->flags |= IORESOURCE_UNSET;
-		r->end -= r->start;
-		r->start = 0;
+		if (!(r->flags & IORESOURCE_STARTALIGN)) {
+			r->end -= r->start;
+			r->start = 0;
+		}
 	}
 }
 
-- 
2.46.0

