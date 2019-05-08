Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC817D49
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 17:27:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zgMR3vbTzDqHh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 01:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=analog.com
 (client-ip=40.107.71.65; helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=alexandru.ardelean@analog.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com
 header.b="Z7XBk7n5"; dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zZ615HNGzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 21:30:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5hQTyFwHo/VxRdFALVMYiR+QOhFLU+yQ1fnnnSWX8Q=;
 b=Z7XBk7n5vKKBDgXCP897D+5V1Y0FLQdRTDHnUWULRUnoOrwQ2xkh9EzaEl0pwQeruiqUJOD9GIv3hXLd9F5aq1UqHCVFSPaWFY19RldYDESvUrqGCU74eR8dJ/StDdxc+q9DTKHUAlBb+h9/h5TGntoeFTD9ZXAJpweCEH/OhDc=
Received: from CY4PR03CA0081.namprd03.prod.outlook.com (2603:10b6:910:4d::22)
 by CO2PR03MB2264.namprd03.prod.outlook.com (2603:10b6:102:b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 11:30:25 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by CY4PR03CA0081.outlook.office365.com
 (2603:10b6:910:4d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 11:30:25 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:23 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUNwe023807
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:23 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:22 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <devel@driverdev.osuosl.org>, <linux-usb@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 12/16] rdmacg: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:38 +0300
Message-ID: <20190508112842.11654-14-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(199004)(189003)(7636002)(316002)(106002)(4326008)(50466002)(126002)(2616005)(486006)(48376002)(478600001)(36756003)(54906003)(476003)(186003)(110136005)(11346002)(107886003)(16586007)(77096007)(426003)(51416003)(7696005)(76176011)(4744005)(47776003)(305945005)(44832011)(446003)(336012)(70206006)(1076003)(70586007)(14444005)(8676002)(86362001)(7416002)(53416004)(246002)(356004)(6666004)(2441003)(2201001)(50226002)(2906002)(5660300002)(26005)(8936002)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2264; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ea226c7-d664-4182-eb25-08d6d3a890b6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:CO2PR03MB2264; 
X-MS-TrafficTypeDiagnostic: CO2PR03MB2264:
X-Microsoft-Antispam-PRVS: <CO2PR03MB2264CA36634DECF7B647076FF9320@CO2PR03MB2264.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9+T9KOQ5N1uqSNzRRgplR6sHTKQb7qlY+DBPxxdCSaJYco/p4QFiyK/dDR0hB1IOFmQXuX5mxyj18B28K6d93VjxihCj+rCmQnGHG+YCO6GrqNFnq/R+gtspHAUOD35K6bnQr18zajdkHnsgf+QKRbi3AQukLYK3xBiqqryjbGYGjjRlCqPYQrzhbT+v7t96Pxm0FHxoT7kykMNu+1w4N2KbrJMgDpMtY1XAHVueHSW/1Hrp3kOm+CFYWu5LQ+2t5MTCEOfBhm2wbNLLQTpoyj0DhQHzLCeF6FRFDnPnJNhXTBEOEJdYK6LFjoWOnt1QNXc3j/TxDqk5WgHs+pPuEg7e3rtTvXcq/rVdNvuTndv5eIO1qBO51WfXuWrhJnCT8Sl23SmiUZfSUI8Vpzk+y9G/FLbIygwUT4rW+hoQ81g=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:23.9644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea226c7-d664-4182-eb25-08d6d3a890b6
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2264
X-Mailman-Approved-At: Thu, 09 May 2019 01:00:52 +1000
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
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 andriy.shevchenko@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The `rdmacg_resource_names` array is a static array of strings.
Using match_string() (which computes the array size via ARRAY_SIZE())
is possible.

The change is mostly cosmetic.
No functionality change.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 kernel/cgroup/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup/rdma.c b/kernel/cgroup/rdma.c
index 65d4df148603..71c3d305bd1f 100644
--- a/kernel/cgroup/rdma.c
+++ b/kernel/cgroup/rdma.c
@@ -367,7 +367,7 @@ static int parse_resource(char *c, int *intval)
 	if (!name || !value)
 		return -EINVAL;
 
-	i = __match_string(rdmacg_resource_names, RDMACG_RESOURCE_MAX, name);
+	i = match_string(rdmacg_resource_names, name);
 	if (i < 0)
 		return i;
 
-- 
2.17.1

