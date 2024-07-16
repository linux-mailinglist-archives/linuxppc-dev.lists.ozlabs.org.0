Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F031933496
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 01:32:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wAptvQyO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNwMl1vVjz3dXC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 09:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wAptvQyO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::60d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNq5z59rZz3cWD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 05:35:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKSMDmbTMgnmz5zr6tQ27VLRRTbbghkOVfCOVS8sBl+XHAYw2U5Epq6AFpU47IUw8E4yOMutIMsjGx08yGWTnbwJ2tfNHsVf1NizR5T62o3d/+i1HYIyooBXe3vmFlsAuGMtxs/xC7of2PMJxCEj7fvfE58U0QfyLrZKEw7DBARza57taFCH0f0NEsReiEwyNuVFa8oAbKy/kYOjxh83tlNDvH82x514ROZHYz3EyQMT1tumb3qed7zVpWlG5WW8glD9xLJIbjAyVxe1v1zvz1ZqgAlFlh2156rxWeioLT2gln730frZk+euIw8CDAuhjRQ2+B/uXS/dAT28KRns9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nmYSRHTvVFlfgXKAiLo7DQR0vXr8xcIIp0ykn3mfdU=;
 b=Bm2A9JlznRgoKAa0/5j4m4xKLSwfBEgaqr2SUKMUL6IO7x7Y/18XIT8A2jlLjYBNcO4ycNQ1pVWQqdpNzz77XDxU8rDoo4o9EF6tp0qOCFOUZvTbOpRQW1vq3QFSPbsH4SSsufbyXE2XhUuPN/9xHM3tzVdnHmxoTXCI9GkDS2OiNoNqDqY1Th2nbclMl61ixp/9zfSe4U6Xn9O5S3eVm/q/SZQBbMcxU0lxtemuRQmnVrzwDMMgXEijxS5EeISySLwH4RaAtQa7IeTk21LGDb8FOsTnnze2wh+HQTB7JmcER4HMG2UoXIue7owRSzMAClDPG7MvUV1Vo+tUOLQCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nmYSRHTvVFlfgXKAiLo7DQR0vXr8xcIIp0ykn3mfdU=;
 b=wAptvQyOPRyN701JLT8px65aqF8tddckYWPeP1Vw3xV4rK5IBTlOwMX/Vf1gPytr+LuN309eCPMst2H04FWqDwQFOH7IlxmB+Vw7Jz0sWmqDTPb0tUMb7+zv8SRIG7htLXnYgKq/bOSpvamOowgP2PHwp9kSbFlHdXqhpx97xaY=
Received: from DM6PR13CA0056.namprd13.prod.outlook.com (2603:10b6:5:134::33)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 19:34:41 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:134:cafe::6b) by DM6PR13CA0056.outlook.office365.com
 (2603:10b6:5:134::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19 via Frontend
 Transport; Tue, 16 Jul 2024 19:34:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 19:34:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 14:34:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 14:34:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 16 Jul 2024 14:34:39 -0500
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, "Sam
 Ravnborg" <sam@ravnborg.org>
Subject: [PATCH v2 6/8] powerpc/pci: Preserve IORESOURCE_STARTALIGN alignment
Date: Tue, 16 Jul 2024 15:32:36 -0400
Message-ID: <20240716193246.1909697-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
References: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SN7PR12MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a17e6a-3e82-48f7-0fdf-08dca5ce5668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?rHxASgzUv9lkB0oP2IEHJFdA765HI8lVU332TD5fLY+xvvLp0xIBZgn+xn5y?=
 =?us-ascii?Q?JInkRqoiX+8Rq8ywXVBNBM67tfCxsCi2KhjFYLdjJS0MlC82iwMTEWiXInU9?=
 =?us-ascii?Q?Z5k8kqXXStxlJaGs/zE222JBe48lTagFP7mwdQ7H6OTIAUmpr6fkkalOOvE5?=
 =?us-ascii?Q?oZ5gx3LkhzJkdSUzq6nX/crMswi1b29aMtpaes1cqg76XkPWiNQol+o6tNgo?=
 =?us-ascii?Q?F7y9hQUYquvh6oZ34m8L9pqsuUmML9IvUQdr/m5RMTc69f4sLj5chy68kKY7?=
 =?us-ascii?Q?r0Wlh9fwZzCciBOUp/2RgKryh24n3XSi39q6nvs8TE6VX/BVX3Nt/zOnRwds?=
 =?us-ascii?Q?stcEECyZ+/iUoRXCpkygdIaCIxdKVvHALU2WeFpwebi7CkvwWHKfZUTuJ+25?=
 =?us-ascii?Q?M9PwVQRZKxGUgBhmdQ22h+Z9XPH1Uh0f4KLMXFuHB+G6pMqW5i0JxjOIO5y9?=
 =?us-ascii?Q?W+J+59svviztC2vakw3o73Aq3ITGQdIWjM/3RaRCWZETl1dhLTSnpdtLSFjB?=
 =?us-ascii?Q?EQ1Z9G/OwIyWXpTumE3R4mszB68dlHKKPI5o/RBA3gf4tBcFyEdTqfeH9tGI?=
 =?us-ascii?Q?AzyS9jxaVxZu90q6cwr6HTxD1P7i+IoakmN6qdN6bEjEaOOa9/imZG67Q99G?=
 =?us-ascii?Q?YbdPIFTB8jjJuYTq8DFfw0mpv7Cl1/r+OOlmQMbLn4VR9V3bJZL9DVU44RK+?=
 =?us-ascii?Q?HNhseH0qDALDsnxyC1G2KvJOBpl71fUDnWvlq6M/mfgsAWOjqAWfbNL44H4b?=
 =?us-ascii?Q?SFQ/rmOaPrLb/0d3WJiI/cRojKSZZQgQsPHit3w7CeL5pG5bMMTObrE+RFfE?=
 =?us-ascii?Q?ifIn/VSJnePlypEIAukk04+WUT4AR4iDZEvXInBp2sjVgP9wudl0HSZaHAv6?=
 =?us-ascii?Q?z31WdJSBYujhhPmw0/ouGl7ukkyGfRfuF6egZ7n0ANT+sE+/H4erkXLXhQIc?=
 =?us-ascii?Q?8YzzEAmb+IbNp7+Frv+lTM6JiclbhtBCgS1lLK+HSTnd//zYk73dHzrcO8OE?=
 =?us-ascii?Q?tok6IEdQadDDHjvX6ZpB2dmg9yvcnh+LgMVJf+E9RaAvlcQXiECwU+QN7MhJ?=
 =?us-ascii?Q?ZotYnDJ132AfhjLxKK4FUsCrQj2roQnCuT+ZN7NP2Xp6eZTgzxmGkVjZ+MLP?=
 =?us-ascii?Q?5RYGEO37Nm1vjUA+JBPs4WHThHw04dK3uU/OMbFKDy0g4m5EKaydwR4lULmA?=
 =?us-ascii?Q?W9bY5jWXfrWEkQhuOAqRC8giSfhdZqVu8bf4M8jxHcTwR6sO+Sx95L9uW8NN?=
 =?us-ascii?Q?8mCzW58pAtxOpNGxs1eS2NB4X3HbzPeLPfQq3pI2PEALJnH5GuIjr/0mQbY9?=
 =?us-ascii?Q?KNE8kWs/SNSiXPkyax/nIbtna5Pknhmsqyb0+YXne66kE6IHjOcj2VeBca8r?=
 =?us-ascii?Q?/AsjayWLRGvNXuTZF/EiviJ9ovFhMivHR8rtfZmdvyqxjsPYH0dSLwL2MjqY?=
 =?us-ascii?Q?af16frP3oYONNlkfTERLCxViLWPkpDVn?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 19:34:41.0024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a17e6a-3e82-48f7-0fdf-08dca5ce5668
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:31:04 +1000
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
2.45.2

