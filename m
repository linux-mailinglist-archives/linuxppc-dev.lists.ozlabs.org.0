Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2003AC313
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 08:05:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5pLs6p0fz3c4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 16:05:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YZvIS/uV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.92.69; helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=wesley.sheng@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YZvIS/uV; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5pLM1RwLz3bvv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 16:05:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RldX2oLBw+Ls11LySRNF66Iz8ocZH1pzWdfdz7zTW5/T5L5YGTy6HKHRej1KM1VxoVaKUjh7sp4/Q89lwYw4rpYb8psd/tvE+LqdXU5ijz5IERwkb7DUdcHL9QsjaKbAzo+L+x3s2BJEkF7PUkpVvuGE+MIlnQgT8pukA9YuBetiAN9bkKPDaFICOdZnvEOq4o8sW6O+umFRyQgCQRWMDEHqn/SG1L2F5CHPZo5kPU+OlqY8HDde/yfrvOP/cI2NkYF/UguwwgyjA+DvYeie0sv0UKxuuXVOcTiKgxFdiPyWlGbBVn7uOcm8BZTWiOsns7O7iTQih4cdyLlskKEEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8vRcoqGTzGNRzbAI3bgcHDVggQrU0yQKccQvm9Y0dw=;
 b=Hv65vD9nCvKjlEq3hE+/MAI45wo4oawBZavA6YjGkdZxxDAux+Fdfgo35Ii2sLMKlbKBOsUSYkUf6Nfzx0RSD46E5UTOFop+SQBkv/6yA4WE4qEcWKyBGkdPH9s798JXRkof53Ih2psnjQ3siH0sBPlWa77Sppa/aNNQ7YRWooC9wCkA6ygId+ixwk/i0P9l6VQ7cHdvfzqqdKhzBMlBM2O6ttSW6yRvi+kaD0T867ULHwQu+WxN88vZKYBz1Bhsrb5kfc5lAlRMpb2efxFzCfwKVUfSDx6g3kiDOi7Eqk50pg4XtLRLt3SWRhz8XSnqQHy3siJrGY3NkiuFeRyGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8vRcoqGTzGNRzbAI3bgcHDVggQrU0yQKccQvm9Y0dw=;
 b=YZvIS/uVUHNtkN4jbO7wDfmX8Tmy4JKUgtNVj4ZiZq6I5KVxdsScSUASD4E5JQw1Dq/IJ+u+xHmzVlTyaloQFbvpUwPJAS3ShpRPt3ahG9Hxnh+FDCovySM7eHzzyBD5bdv46NkNfex7ieMt2G7KBLYOWXiU1xYA2XxKgxRzshc=
Received: from MW4PR04CA0364.namprd04.prod.outlook.com (2603:10b6:303:81::9)
 by BL0PR12MB2449.namprd12.prod.outlook.com (2603:10b6:207:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 06:05:00 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::30) by MW4PR04CA0364.outlook.office365.com
 (2603:10b6:303:81::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Fri, 18 Jun 2021 06:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 06:04:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 01:04:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 01:04:59 -0500
Received: from weisheng-Pro-E800-G4-WS950T.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 18 Jun 2021 01:04:56 -0500
From: Wesley Sheng <wesley.sheng@amd.com>
To: <linasvepstas@gmail.com>, <ruscur@russell.cc>, <oohall@gmail.com>,
 <bhelgaas@google.com>, <corbet@lwn.net>, <linux-pci@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation: PCI: pci-error-recovery: rearrange the general
 sequence
Date: Fri, 18 Jun 2021 14:04:46 +0800
Message-ID: <20210618060446.7969-1-wesley.sheng@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c335bac5-537b-40b4-567d-08d9321f018c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2449:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24496B894077FCD6D378CB55950D9@BL0PR12MB2449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hdb3PO/yundkY2G3PysnZ7VtPs6KEzhwwbarZaSqmfsVtrXUbLgkaF+UbO2BK1TuUWzR0h0ZBWSnGSXs1Nf00xHWPdBMZW6NtzceY/W4qZC2bF7unyAchFg9zs/brqGsm16jX51ikNpQv1ex218Zjrq362ihnk87h3/XGK36iR60TGsSEEn/mX1Ty3lGFUt3fQusyYVcc8bMC1bau/v0zmdIYbgAPPMa/DINK7512yexzqp0J1PKLcOHOGL2T3iD5vBCZpm+VyoDhrA68IW5DtaKiYAxCUdO8R6VNbVuOYt19LelhVl24mvKfVHjK7b3ICY/HN2pz+/cyulKtRGoeNLkOhd2nn8f2k6wGsbUSFC7a0CaxL/qPPgsdJdNrbmzGQclHN0+mh9JIDMxoul9MG6sPHiiuD9z27Gk7/7dtoCvOZkpEOMRo+ImHj/Jl55vrKrCMSK8zzosuHS0e4KF/xD7bq6MjD3HtQH//bQbSMt4s0d1HryYyAqJUYEb67GL18sP3yns5MkDAonLSdDhWdrE8s1RL8uxPF3WSqtnXDlce3ApiRPguoW+gCNCOkTLe/6Q47/b4wUXQ8/nd5IdSTi8sMBm4y5w5frN5Ftv373rXRntR4etdayqKOqF2kP18Jl5ppUI3U4fSLooTRfYwDdffOYnV/bsQFKIBcr7ohJMlym7LmxlU93QF05syK9MmENMGSZMJPC0/sy0fam97A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966006)(36840700001)(7696005)(2906002)(83380400001)(82310400003)(54906003)(316002)(36756003)(8936002)(44832011)(36860700001)(426003)(8676002)(7416002)(70206006)(110136005)(6666004)(70586007)(26005)(47076005)(186003)(86362001)(2616005)(478600001)(81166007)(356005)(4326008)(5660300002)(1076003)(82740400003)(336012)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 06:04:59.9396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c335bac5-537b-40b4-567d-08d9321f018c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2449
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
Cc: Wesley Sheng <wesley.sheng@amd.com>, wesleyshenggit@sina.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reset_link() callback function was called before mmio_enabled() in
pcie_do_recovery() function actually, so rearrange the general
sequence betwen step 2 and step 3 accordingly.

Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>
---
 Documentation/PCI/pci-error-recovery.rst | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 187f43a03200..ac6a8729ef28 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
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
+instead will have gone directly or STEP 4 (Slot Reset)
 
 .. note::
 
@@ -210,7 +217,7 @@ instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
    such an error might cause IOs to be re-blocked for the whole
    segment, and thus invalidate the recovery that other devices
    on the same segment might have done, forcing the whole segment
-   into one of the next states, that is, link reset or slot reset.
+   into next states, that is, slot reset.
 
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

