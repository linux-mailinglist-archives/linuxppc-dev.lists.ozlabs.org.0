Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6DE666B8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:22:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NswxB4QK5z3cfD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 18:22:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jrpzlr2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.236.40; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=vidyas@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jrpzlr2a;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NswwG0jHVz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 18:21:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzJ7p0PD/B7FkcjuOatmbyk3HGsgXOOzgPuQ3DEIlMYNVp3vp+K5AvE3Aw1PQxLMIGxfzZhp1Tni+7YVtscBbJHzl9BjA+tw2yvpN85DHrzuve/RnQIM53AXF79K6EWbe5jvFsTkJIMEHFJNh4DoXCWTY3OFHdNfc3KBgahjjW6n4YRH15tO5+vbz3jpjiTycahgAtT75ulOgeRQwkp/T8GUebOR12iHKlKNMfNUq8beMBVvgYDUalY7rocqTuVJJBMw+AsGIsOM0M3xjR1tGT6CK2IuIY8sigUPNAO7GLGQMx8AlaoXLcWxT6NL+j0g8LiPd3/51B2WcgdJo56p0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG6pymy5MdVXlb9R6BEKHV0VziNyFrW3PllbBIhqPEY=;
 b=Kc+Q+4KiBNFz3vYxHiyYAH0vSAVnPen4NOCrFgL/b+nMMPHr9SGCHucOZBoR254RrWR/TMC1Sh8+1d16dfGqBCX+MW1c4RQwrkYjGQWDbqmMbJGeqPYPKLv6zepNW0TdN0h6O/Pa7FVClBK73ZgY/ZlHwLaSG7yoRdiLPKu286s1TsSuBUZpJ9woy7Z7OGo/9pYDvWdPptprA5uKZo+8bq52rUoieXAI0UdHA00qBRwwPuoaFr6/qFPMEhd9tqGCZY2RtlZRefIy2Mleu1f1Ul+aik2Ww76cGYp4xqMDOuU8jak69eQ5D4X7uZJqejvLV7wESilynanx3Yk4sqwY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG6pymy5MdVXlb9R6BEKHV0VziNyFrW3PllbBIhqPEY=;
 b=jrpzlr2axAfdTHMCNKbqY3fi+O1+YrV1N3AauV35V+89naKKqfBpbQa4q9pbMMbPAAqvsUyqYcI1JWL2VaTqxw1uluVlTxX2ApcvLeQu74EZ5RwsJDqBeptANuQKSlXeciFFXB9cWSQQLw0Z7iYaeVJ39ZDKr2yJHdVWdK001QaOg7rmRn0nFyoo10nw4KvRRTCqiT1F/2tVWQbKADRrpcC96DVxyU/fujc0RCwNS45fvdDCDi8YkXYAZMffHCuDlcL9OoStTUIkEO1iN+Uo605gvqMkiLqGuM3Hdi3kxXXs4cWitHHxGvL3bfRaVbvJXumSd05VE33XAaQeAKb0qg==
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:21:28 +0000
Received: from DS1PEPF0000E638.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::a) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 07:21:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E638.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 07:21:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 23:21:18 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 11 Jan 2023 23:21:17 -0800
Received: from vidyas-desktop.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 23:21:14 -0800
From: Vidya Sagar <vidyas@nvidia.com>
To: <bhelgaas@google.com>, <ruscur@russell.cc>, <oohall@gmail.com>,
	<treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH V2] PCI/AER: Configure ECRC only AER is native
Date: Thu, 12 Jan 2023 12:51:11 +0530
Message-ID: <20230112072111.20063-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230111203116.4896-1-vidyas@nvidia.com>
References: <20230111203116.4896-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E638:EE_|MN2PR12MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f48d19-57c9-4228-5351-08daf46d9f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oN0dbua3UWSpW8ozqC24Uy5I6oKFMYHxkGPMrpqdUzPWDqG/xDAESnlloJ4HWAcWH/PNb7quFIB/uNlpjuw3n/uv+GENId1LftmN/tFfkgDbdxoMEG7rJOx8vYPUkKG86FneH9mOH2uWk3Loek/7JaCnCzMlrjBNNw51SwnP9R0Q/aunFaW5T+wVDHCPiiA1skv6g7NKNZqRuo8p1uv1I1ZJfdAAShxfYyBBlYrRfVhMKnVfpm1/zQi04kfORQaqEXr/0wzwHRW2DbDMCM/GSmYf54ma2HTUTFkvN2wiaOcNg4kH9gqLiVGni6q5UfDFR93TI3xIfUquXn03l3CGu4JcHmZJqJ97wD282szXBMDZuwjkbPcQVt09tqXRk0PGim20GGLGku2uKCEmZ9CQaVkRnsr2YMJaddP5DN0RuoUTh1xEdBPo7dvcCkqOhTLmKenLDcFqn0UOLgz8vkldjGTdfcC8DK5JOz7sJ8SToh5XJrK35zMBWf8+4qXOgOAlDRZRZAjfP1dDJ39OYMxUcubXvya1QfCcUVLmeyNrD02cwbwYw/cA1nwca3VYdQ/psEMf77aBp7sVMOJbb56o96PqpMQ5HwaJRpjz9YvmA3fJqPPC3v30QZQPLqbMnKR/9brsGERPT6KIdwz7VXD0+XJS3kXhcnFBoTobE7ehk3NQFKBp6FmExkDmEJ/LJ/mC2TKrXhMKQYTRSKDa71p5zA==
X-Forefront-Antispam-Report: 	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(82740400003)(6666004)(7636003)(356005)(2906002)(478600001)(2616005)(1076003)(316002)(26005)(186003)(5660300002)(40480700001)(7696005)(86362001)(8936002)(83380400001)(40460700003)(36756003)(82310400005)(47076005)(41300700001)(426003)(110136005)(336012)(8676002)(70586007)(70206006)(6636002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:21:28.5819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f48d19-57c9-4228-5351-08daf46d9f4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DS1PEPF0000E638.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com, vsethi@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the ECRC configuration bits are part of AER registers, configure
ECRC only if AER is natively owned by the kernel.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
v2:
* Updated kernel-parameters.txt document based on Bjorn's suggestion

 Documentation/admin-guide/kernel-parameters.txt | 4 +++-
 drivers/pci/pcie/aer.c                          | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 426fa892d311..8f85a1230525 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4242,7 +4242,9 @@
 				specified, e.g., 12@pci:8086:9c22:103c:198f
 				for 4096-byte alignment.
 		ecrc=		Enable/disable PCIe ECRC (transaction layer
-				end-to-end CRC checking).
+				end-to-end CRC checking). Only effective if
+				OS has native AER control (either granted by
+				ACPI _OSC or forced via "pcie_ports=native")
 				bios: Use BIOS/firmware settings. This is the
 				the default.
 				off: Turn ECRC off
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e2d8a74f83c3..730b47bdcdef 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
  */
 void pcie_set_ecrc_checking(struct pci_dev *dev)
 {
+	if (!pcie_aer_is_native(dev))
+		return;
+
 	switch (ecrc_policy) {
 	case ECRC_POLICY_DEFAULT:
 		return;
-- 
2.17.1

