Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9D3B9AFC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 05:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGL5D6PJRz3bXh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 13:23:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ISrPg7AQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.94.63; helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=wesley.sheng@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ISrPg7AQ; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGL4h2CVqz2yjK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 13:22:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhlbwW8y2iQii9UdZRrX7xrSCBXrk9YYzQNvy9kol1DoP/ceDlnj64ECnN28tLlhKxopqYEP0euMboIF7HV7qHUYUy/D7CM3HpdsrrlqW4pcIu7rkTyYcVJcTbNOpayy87X/Pjx6mBJtOrUQ9050j1So7jIM65A9UI8czMoHbOJxfCLXItHrFh/oaMl+uQAF1PJeilR5YM4cjG8bk4VnIJVHXtDtu+LdOdrpFW3ImNNV7ZHphVcO4i3G9F0ynFp+0TSMkVrcdFKGEDOWQsHeNxmyn3EaBUHTylCobrw7ZasBQAtU9HlU5PmJgrGQDq0ty9XTbVfh+mRNolUtHO15Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvCXO4SJ+TiDx+dMDHSWlACKeFJbrHDeuVczQYAxIfo=;
 b=Xs/uJ2B9B/2U0JnJpOuEcBVSIxNzcV59iABx0LLxOzzpArUsKndDPq0JJsM44ZFRFZge650CuvEZ1uPpbwPUGoqh/cz6NtXbNw6PaR9scfuAOkZiW4iPZUgrhKXtVK76DGbvraP13iUe8nvlyB0MD/uTLOeZ8BNi51LOSfUaqrsoqJlKSBWK+xr5YGg9lmbtO+DjnwL33IcyVCB9FUILd9IzLzC5gt5qTaTGFOv38lM+h6omi6myTST9BTf8TV+H5B4/0KCneKftaOX2uDZly6Gh8SCg0Aj75MUsyp5SpQ/vTsiRWAH/qV1gXEHmcZggQ2V73+iF78VYPt0236/xAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=russell.cc smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvCXO4SJ+TiDx+dMDHSWlACKeFJbrHDeuVczQYAxIfo=;
 b=ISrPg7AQzEP+ltTNbtnXuA6bG7fX32WEEOQ+Ci1/uOaeVh7jv3JESK9C/WryxEBNQ6QGdA4pjz8D9ol2+lSyjB039BBQ87mq+q4Z45WqT/SdJBYsl9JI219V4Y/QN2y7lu/FQg/tYAPJN7fNqjZFYBjJ3Nrp7fyRaUrMbIs7Mrc=
Received: from DM5PR21CA0070.namprd21.prod.outlook.com (2603:10b6:3:129::32)
 by MWHPR1201MB0207.namprd12.prod.outlook.com (2603:10b6:301:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Fri, 2 Jul
 2021 03:22:37 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::b4) by DM5PR21CA0070.outlook.office365.com
 (2603:10b6:3:129::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.4 via Frontend
 Transport; Fri, 2 Jul 2021 03:22:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; russell.cc; dkim=none (message not signed)
 header.d=none;russell.cc; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 03:22:36 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 1 Jul 2021
 22:22:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 1 Jul 2021
 20:22:35 -0700
Received: from weisheng-Pro-E800-G4-WS950T.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Thu, 1 Jul 2021 22:22:33 -0500
From: Wesley Sheng <wesley.sheng@amd.com>
To: <ruscur@russell.cc>, <oohall@gmail.com>, <linasvepstas@gmail.com>,
 <bhelgaas@google.com>, <corbet@lwn.net>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] Documentation: PCI: pci-error-recovery: swap sequence
 between MMIO Enabled and Link Reset
Date: Fri, 2 Jul 2021 11:22:30 +0800
Message-ID: <20210702032230.7518-1-wesley.sheng@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b17ba83-45dc-45f9-cb71-08d93d08a3fe
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0207:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0207A980A88DF91836A76353951F9@MWHPR1201MB0207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjVW7Oc+M6gdMagwO94mXvscQQ9kAfktE3mmfBNW9IDkRruOFaK9LpPydvE4X5H8cdxjTPeCS6ZqLRv1tNp1m2EXcDINeUGwS6eGSlWuLZn3dpvGJVJhM8aDaPpIuBNK/nBibKNM17tWOzuUSLd9GBqnYLjDrk7Q+WfAWR+fwcPYEPnbGAm5b6s4QSngcmEMdMZzNY+QYF/WIDRxPWbWcFy1peUQTdKXn9U+rqbWmDiiggb76RoXKJ+gxzzjtklxlNc1l+zy2CKQpp9cja2HhGyZBQfGE3u4I75+LBWoZPTAuD0LTnMC8vbKeVi6YbLuX6II9fuTd0u32wxB9aeY38pyel/P1irnW3pKnUWimrYX4PA7rTD8M+qqKsXUqEREtwAUtfY9jQ5NB/L+uu2OqoPeemgZRQINT0sRdrxYcFwxiSZS/F7oXicTo4x2VVqY1a+x4evd4zgYU6iDyvGkeWOvl1BgLPNFkBzs9jQ0652ijVpJ2yfdxpJQWgUsG+kqvln96vGWunpK3C8WFNOpVnNOJVKVlm6xBjm3MLqCFfhQM+El+uADGjb8DeXnSMNcgv0mcajBv94V7zoNHCpn05MHsAapFCUC3HCXUfE2vOFd3eMgEiEGELPkQiLn3LQOUbCdDZJNLfa1C7HYGKNObudk+t7AmXVjmZc2t0WUpV/EPggLhUbp6IT0HOHu+74cBCef09JvdbBfteQ94qEvYlmic+LbAPbVQs6dbEwvxmO0RqW53vKLzcaGYNLskcWm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(7696005)(186003)(47076005)(70206006)(2616005)(2906002)(36860700001)(70586007)(82740400003)(44832011)(4326008)(5660300002)(1076003)(26005)(82310400003)(336012)(478600001)(110136005)(54906003)(316002)(8936002)(356005)(86362001)(36756003)(83380400001)(426003)(7416002)(81166007)(8676002)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 03:22:36.9073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b17ba83-45dc-45f9-cb71-08d93d08a3fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0207
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

Reset_link() callback function (named with reset_subordinates()
in pcie_do_recovery() function) was called before mmio_enabled(),
so exchange the sequence between step 2 MMIO Enabled and step 3
Link Reset accordingly.

Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>
---
 Documentation/PCI/pci-error-recovery.rst | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 187f43a03200..0e2f3f77bf0a 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -157,7 +157,7 @@ drivers.
 If all drivers on the segment/slot return PCI_ERS_RESULT_CAN_RECOVER,
 then the platform should re-enable IOs on the slot (or do nothing in
 particular, if the platform doesn't isolate slots), and recovery
-proceeds to STEP 2 (MMIO Enable).
+proceeds to STEP 3 (MMIO Enable).
 
 If any driver requested a slot reset (by returning PCI_ERS_RESULT_NEED_RESET),
 then recovery proceeds to STEP 4 (Slot Reset).
@@ -184,7 +184,14 @@ is STEP 6 (Permanent Failure).
    and prints an error to syslog.  A reboot is then required to
    get the device working again.
 
-STEP 2: MMIO Enabled
+STEP 2: Link Reset
+------------------
+The platform resets the link.  This is a PCI-Express specific step
+and is done whenever a fatal error has been detected that can be
+"solved" by resetting the link.
+
+
+STEP 3: MMIO Enabled
 --------------------
 The platform re-enables MMIO to the device (but typically not the
 DMA), and then calls the mmio_enabled() callback on all affected
@@ -197,8 +204,8 @@ information, if any, and eventually do things like trigger a device local
 reset or some such, but not restart operations. This callback is made if
 all drivers on a segment agree that they can try to recover and if no automatic
 link reset was performed by the HW. If the platform can't just re-enable IOs
-without a slot reset or a link reset, it will not call this callback, and
-instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
+without a slot reset, it will not call this callback, and
+instead will have gone directly to STEP 4 (Slot Reset)
 
 .. note::
 
@@ -210,7 +217,7 @@ instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
    such an error might cause IOs to be re-blocked for the whole
    segment, and thus invalidate the recovery that other devices
    on the same segment might have done, forcing the whole segment
-   into one of the next states, that is, link reset or slot reset.
+   into the next states, that is, slot reset.
 
 The driver should return one of the following result codes:
   - PCI_ERS_RESULT_RECOVERED
@@ -233,17 +240,11 @@ The driver should return one of the following result codes:
 
 The next step taken depends on the results returned by the drivers.
 If all drivers returned PCI_ERS_RESULT_RECOVERED, then the platform
-proceeds to either STEP3 (Link Reset) or to STEP 5 (Resume Operations).
+proceeds to STEP 5 (Resume Operations).
 
 If any driver returned PCI_ERS_RESULT_NEED_RESET, then the platform
 proceeds to STEP 4 (Slot Reset)
 
-STEP 3: Link Reset
-------------------
-The platform resets the link.  This is a PCI-Express specific step
-and is done whenever a fatal error has been detected that can be
-"solved" by resetting the link.
-
 STEP 4: Slot Reset
 ------------------
 
-- 
2.25.1

