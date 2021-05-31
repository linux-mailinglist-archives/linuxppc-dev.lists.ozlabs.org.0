Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC95395A83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 14:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ftvj81LBRz308c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 22:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fz8Hxe0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.236.48; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=wesley.sheng@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fz8Hxe0H; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ftp1d2t9Jz2yWx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 18:12:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V094U0PoGNTiMfB1Uf2iBIUOnVyWi6bEIdxQOTNZ1D0ZMCE9yQ+ub3kf8ehnPkLdMyfFHQbVSVvxqB3i1g7kjeVPAZc84GWG6+V+9T1x55ILDL9W8SLNodGZ1jpOdal1DM5miYc8gobKUvKGxsD2fitwjrF4ZMtIDhJVmaNcUAxp8GadVQRJhEvEbGLDawC6jTgx02xHF2u7hzxrMb7pzDAXkZTF6igeh9Y26IxJQ7dD38MO/tc3GEaZZ1DN/aEt1vf9pui6gXpFvDNaszfK+JKnPVyj5Kk+JzoMzQ6px60GXEuieOf2ufH8G+UgFqywrE68BXsO0H2a1i0z/IZ7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XId56xhNNfdRa9xX7oshueAieoYEzbtwOjlk++lG9q4=;
 b=NvXWn0JrA+m2b5/GRcIisW73EIY+zYOHARb3nO0lcl7yWA732NT+u1srB18sEMiIBfDC561jFjH8pxBY+/dc/qhWDa8hSIuKYVzxbySaoOGdWgeju0wGb+SsYUEcE6M09MXtLirAQyBuVcm/P1UuM1XOaHIOYh9qs0EmBdEtlGGShZh+tvppCZkqA3oGeyQMo2z+3s8+Zp2NGxWBQhz9O8TqR8nD3Bit76cRhRRMWqEOE0iRsTzhQq/1QDYNGWEbc9M2Zgw8KQUfOPNE2Ta9a+H3itre8TdVDrgMxWgTGTc9nayysvIQ9fZrDIh4BNdcOcrGUGxaiGTz4C1YNDjGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XId56xhNNfdRa9xX7oshueAieoYEzbtwOjlk++lG9q4=;
 b=fz8Hxe0HepbbfoDBVeQA9iyeKEBR2Q2Qaht4vtsQMmzKl02fYrAXLLR0Ice9DFkTpW6OkAadkOv3yXso+qDfZlnLD+ip3IOUO8ieuMR3f+/fNOEUZDtMUwhxwn3OsYIGP1vgEgVDmJvTVBLUlqeKW855d+e/iAP2UhZNk/1HuIA=
Received: from BN0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:408:e6::13)
 by DM6PR12MB3738.namprd12.prod.outlook.com (2603:10b6:5:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:12:27 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::40) by BN0PR03CA0008.outlook.office365.com
 (2603:10b6:408:e6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 08:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 08:12:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 31 May
 2021 03:12:25 -0500
Received: from weisheng-Pro-E800-G4-WS950T.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Mon, 31 May 2021 03:12:23 -0500
From: Wesley Sheng <wesley.sheng@amd.com>
To: <linasvepstas@gmail.com>, <ruscur@russell.cc>, <oohall@gmail.com>,
 <bhelgaas@google.com>, <corbet@lwn.net>, <linux-pci@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation PCI: Fix typo in pci-error-recovery.rst
Date: Mon, 31 May 2021 16:12:15 +0800
Message-ID: <20210531081215.43507-1-wesley.sheng@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49086c30-0922-40c6-aa50-08d9240bd3ae
X-MS-TrafficTypeDiagnostic: DM6PR12MB3738:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3738040D79A3083ADED2AB62953F9@DM6PR12MB3738.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8cS27x14Ch6aGqnA4Qx4ZC12BJezeFEvzidOxQk8E7PywIeix4OzUApGqZ0yUwx4qLPmuAjlErR+b9nfqwkMZOALQpTgtQlHj6h17tmZZ2YZM6Z6KtG5/LJU0yNyqJyEwCF4T0T8kCvdPcDKwxYkOl3rdsiXeiXFuHvBDdY8Rp5/OqXmxmnHNlo1ArXDJgwgdpzY6bagNpthu03bJbXd39urHcZeCywKFSDp1OiDw/9fJxQ8JmAHeYOWqRIk+JR7i9Pw+ZkeegErjd4vG/9uQU3uIpyQckIOdKaqEApvil88dtjEcKpHA7duvXv3OTck6WU+3F1RbvL3zAPeekcQPSWAOhweUm4czO1AdLhpHQXp+Nqd5Y7WGXREkE5FgwijB44cjify+0x0AzJYJ1IRCZXFMOtV6SIxLEn7YeV7fMtC7cbs+gmonxjFii+pp/GYTQShZJ0I2vNjwnOeafubkQYRh5eSku1FLsd+M8kK4NRd45Y/219oiN3Hwx0CpAA2979qwtjSh4lj7oRrYYdn+dKFpUhpdln4cq20mwB8F1mR3wTgZPXXKwQZdoaQPD8guObX6LSZP2fUlrNce6tZnID/I4l1c7J3dQveLl+R9hSJ+ZIUQmhhwum6vVHIWf51a/yMVxe9XVh1+yhu3dSistN0aI6xFTqtIKcuV7OZJnz8LgLBff/+NoEUMHvQfo0FIgy2kVAxWJSzKLi0SJPyg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(316002)(2906002)(426003)(2616005)(8676002)(70206006)(36756003)(44832011)(70586007)(7416002)(6666004)(26005)(36860700001)(7696005)(1076003)(82310400003)(82740400003)(8936002)(5660300002)(4326008)(81166007)(356005)(336012)(54906003)(83380400001)(186003)(47076005)(86362001)(110136005)(478600001)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 08:12:26.3875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49086c30-0922-40c6-aa50-08d9240bd3ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3738
X-Mailman-Approved-At: Mon, 31 May 2021 22:28:20 +1000
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
Cc: wesley.sheng@amd.com, wesleyshenggit@sina.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace "It" with "If", since it is a conditional statement.

Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>
---
 Documentation/PCI/pci-error-recovery.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 84ceebb08cac..187f43a03200 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -295,7 +295,7 @@ and let the driver restart normal I/O processing.
 A driver can still return a critical failure for this function if
 it can't get the device operational after reset.  If the platform
 previously tried a soft reset, it might now try a hard reset (power
-cycle) and then call slot_reset() again.  It the device still can't
+cycle) and then call slot_reset() again.  If the device still can't
 be recovered, there is nothing more that can be done;  the platform
 will typically report a "permanent failure" in such a case.  The
 device will be considered "dead" in this case.
-- 
2.25.1

