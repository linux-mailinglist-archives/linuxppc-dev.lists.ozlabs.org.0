Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C1659385
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njlr52nQ3z3c8r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:04:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=eebienqC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=eebienqC;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln5523Yz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQAzXcqFkEoixxDdZPssfF5D86nCUGmIcMwhBMlUzttV/9eRGb0U38X++GEAA9VOL+jK3JjRUjS1H9aWQ9usEqVNQq2WLrWg0XvE+fWiRm+zCFNEbqOJAm7fvphbIFP9FHRGA82m/RIfg+OJX2nAsGS8qKr8BhoubD9KaZoZXKzenDv0DQSV4VgmB4x7Fdt0bBTOxeMt7p1hnmBusMRFniwzTevUbof9GaBQ624/W1UWc32pLXQqnAETiEsWfwJxfZ6LbMxMNXVecxAop/ybZ8lQvsvWaYfk62yoY6re+1b6+/I8mC2jbKrv7QgRVDqvi/HnDzjAEVuT1ZUUNwn8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=JVMIl4ofjFJL6+4uGYJbVHYDo0QMnmtZ1z1wIfc0i4qEz2EsAwZrAmyPw0sZJZJqyK2Hl6pw0l5mIYm9OVXs2Iac7XjcCL9LkV78qBtqwK4UXjSFEliQzGQ8oNDbf/TsuuBaRoR/b4pOf0IUNtN0oRdk7SobE6TazuBJzHhO8VnLDCTPXUzlaSDh/z3okEmVJ5dnGUI/X6Hi+ZzjewLgkRseYBK5/lq3aGSk0/rmnO0ZSCW/q5onOXXqqVf11w8P8bFr420YyKimCNfmLdFIjCaIX2TACgVzrUJpvLi5HgqWIb6UmFxzc4gnJP4d/wz+UW6TnMDv78YYwIDcRI5DFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=eebienqCfz4EIrVssSwOtzfQ7prM9iLFlWlN6dgmr6CXS56En0WeGuHXtgOQAVrZZLraI1X8WgTa9SuMvQHPNr50xFNXB7DC8prGx/E/+TNQHcjY0zBTT+UIylkbpWKqTgVECAd9gfKFGCPjNO6M8zlzsTxpOvdQ5cl/pN2gcaUb8IvHYdzKfwBXxna96H5pKm8V/74hWHNwA2jrmSOpJMshnNnhmgQhvDa4m4IW58xSxT6UH9TnnQYMdcsKPejnCTdK2dLVKdaHEzYRIhIJT2hUX2zv0NXpCwRkrVXBLJYhGeBKyNiUOP6uUIkhq7GUCX+MUo2X41ep6IAbkGt8Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:54 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:54 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 03/10] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Thu, 29 Dec 2022 19:01:32 -0500
Message-Id: <20221230000139.2846763-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a1a240-1220-4934-b09b-08dae9f90fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RN/3f3A2v7XhazO55F1p9+muRyhl0X4jFw9wyIvysJxutgHvq4y419iN5Na938Mc4tkqkVKm5HzxOfgvp/GsYASvZCb8m2EyrfL6CHBDbDAfR/U/oFb0jWNRfYq3KMGvArPqmgpnVprXxkHtlRJV6zLtRBNPA3rdIu4j5h33E0zSnodhcBSxRju+lX9AlTjfyj3Kv7nVJ3Fc/GPSdKtuuey11GRwrTMPeUzCiWxvpHLhTv4GbOePxV365DQ09kzpNnD/0EuXQt18Vpq42/VOtzmByJQYrxSch+C/18L7UCnVfGWfoliUbwjOMhiEQUXLj6HarHTBEgCaiIed6ZdNfkTWb9M6WglcNK8g12N5svmRiTDi2jLmsLm+TSL2gzGDKOn4wcK7ByKP1a0K4FoaZFuGGOWgXdJPBxw7WxwEax10QYqac6WV9ED0cGNlfu/YWMIC/OFoX5BTGFGaze8RS4axZ3gsuZiwAVvELgGy8tmv6eBn3yITpCZ5c259Xy7qFvrSda3OC965M5DfAY72STKsSqrnEqvUgbMMA1N3rczFS9JFpPXlC+JnmLVj4exjdREsDKeSctdzqiuSurWoaZalU+IJo9dkVG85LbTd752i3et/I72t9fVVGNt/MkPElzAtY+Cd4fN1Yx8XaBhV3LBYl3hV6QgG4Uj1U6UDI8vaBBkfAz1mRZpDwKbmS4l6cB4r1T4uxi9JxkvV2x3Gjw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?03q1QGLqMvYKt30pFIq95KKXGetz4yhLDasHM/7syC2aMt5JEu4RU6a/aQDk?=
 =?us-ascii?Q?tbi9b7W6dJegZeR1VjhDDMRXBBs/Gn6z5ue1/X7Jx5NWkqlYFKYux6vKsSOd?=
 =?us-ascii?Q?M/v90UbP1amTRjKHqrN+4JBzRTAepVMrlQK7P5CrKgbsKUtEa6y5DAORUS2N?=
 =?us-ascii?Q?Yt9wfyBmYIYyEvJWKLjg+OoyJ0s29uV5hgHqvLeSyk1dCiBttIKDALeyXLjp?=
 =?us-ascii?Q?nQyzlTgSFCf2Zh1NQ03Z0aX4XCfirhKpO/ph8cbzTRU20t5I9p8nbKXYO3S9?=
 =?us-ascii?Q?CnsrDmv+tcur8ljUUavF47uBtXWxcNLUEQ6cx3/tbJMqT1J4iKIQ1efmUz/s?=
 =?us-ascii?Q?J89gkhGRnwysNN5IVFXI6wWuk+jwjA01GfvVqRf+SYeupoa2L/umRI83E8Um?=
 =?us-ascii?Q?FvS2YhAXSaP/fxwBtQ7fRlO/lKGKbZam4pIZc5I2SfA27dJjrVMRsZERiiUt?=
 =?us-ascii?Q?9uyuqrFL9MKuFoDMZqfFFwIMzatfHGG3QH9cqOinqdJLeZG9NqY4Y+yqdeR7?=
 =?us-ascii?Q?H/PEZPMQHvNnDEyFYhh31eGvJikcOqKgvYO1ZFaH70TNDA26wX0bMnCR6Mbk?=
 =?us-ascii?Q?+tME6VlXJdlfXZdLbh/Y6Of14Rxz09E1sSWScZjEtJQAhjrheC7scHgjtNnr?=
 =?us-ascii?Q?0iwkcMbLqP1cS71GyI+4LYJQD8cqw/DrQJZd3hF2HZ2gsKgI4ZxfKHND3UJe?=
 =?us-ascii?Q?Lj7+9vP/d938mwqpSe9IJwWOJuuHH099Xw/7uZKM4A/PnS5KSaSGYYG6Nw2u?=
 =?us-ascii?Q?RBCiRS6PyDFlvGz+b8UeK6bF89E78VcbuDMuMpu9tE9et1vJZwdJmuXr/kED?=
 =?us-ascii?Q?0izyatPm7hunqaAmL65/xWctY3ZSNGyBtiSfbAoDUokBPjKoCyy0C4JyCgNG?=
 =?us-ascii?Q?x8CKColeKvguG7xz0BS8EC8FoNp9toZWjewYwTET9LEs5b8RiLR8N/OGiZ83?=
 =?us-ascii?Q?IW56HtGU/9KhupD5RCytPxs6392bcb76YOy6QsXitua7RGyIyf5YBWlCQf8I?=
 =?us-ascii?Q?Oqjk5R8cFXM9XnHUmbQ0uZWFcQa4ePO1Qy0s70kA/3I+SiD/AVWtyxwwFrsh?=
 =?us-ascii?Q?jij60P2NqbpQ4FYCNdIJjWnIVh3YgoaERkUnAs5Rx3KHmbR+3E0LrNVdmuVn?=
 =?us-ascii?Q?bDmbaaAp1QYIuZXTiRXpZvIKrVYJpmuKZBFdy74QH8WLc2Awpza72PnuJ7Ga?=
 =?us-ascii?Q?sT+MbgxZaIN3AHuyGiPf37xWMblsOatkdnuSiZo1SAdxzEhYAfW597QsI20Q?=
 =?us-ascii?Q?x3kN/jk5LSr5ZT+zyQs6tYOf8Tmm5tQNbYxgpSwP+5juK8k115YAEU/xBwbi?=
 =?us-ascii?Q?y619QMuoTwrKvwuVGc0Kpxgi3eD/2NwKJzApeyVUpbWnhYQu00PvROtJ3IA+?=
 =?us-ascii?Q?/X0i+vrLCjNg6r2MZCE82QUJGfaKGQ3dwbD4ZcCEzHpybohnLPlmjZOW/XMK?=
 =?us-ascii?Q?/a3TWCdXOrxBHgtEC0f10QOtlOVJu57uVL/51L/63g6VbQdhIkmNE6Yl3ueh?=
 =?us-ascii?Q?SWYa3jBYKZRpfmw4mk5Xv3rtW/vlb7wsW8wPSBPMrhrHDy6D/a9vEP7M3tfd?=
 =?us-ascii?Q?GJDrBYOm+i0345myXpmE4BcVWid+TnoUwH8zFvlR1zp2l/dDA1d3btaK95m1?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a1a240-1220-4934-b09b-08dae9f90fc5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:54.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7sPDqF0NuDtr7p5e/MuwkeUTVkwVBluIum5L4RW39yhP7r+rSCUWPWUAoD0ZaTLkAMkQ7ceKzDQmeS8T898hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
with assigned-clock* to specify a particular frequency to use. For
example, to set the second PLL (at offset 0x20)'s frequency, use
LYNX10G_PLLa(1). These are for use only in the device tree, and are not
otherwise used by the driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v6)

Changes in v6:
- frequence -> frequency

Changes in v5:
- Update commit description
- Dual id header

Changes in v4:
- New

 include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
new file mode 100644
index 000000000000..15362ae85304
--- /dev/null
+++ b/include/dt-bindings/clock/fsl,lynx-10g.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
+#define __DT_BINDINGS_CLK_LYNX_10G_H
+
+#define LYNX10G_CLKS_PER_PLL 2
+
+#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
+#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
+
+#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */
-- 
2.35.1.1320.gc452695387.dirty

