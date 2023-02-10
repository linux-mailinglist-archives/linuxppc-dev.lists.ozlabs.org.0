Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D157B692E35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDH5z5CWlz3fj0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 15:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PyDNs6uI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eab::606; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=amit.kumar-mahapatra@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PyDNs6uI;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD3z02rsnz3cgs;
	Sat, 11 Feb 2023 06:42:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyWkJ8V/JfL828T20FDi5gri0syXPJ+4oPBsx9u9iQhenxjFskvg8bIwVbgr4JFDvAUQUEuGE8Oua5iI5zk/vJoS7gifuBxxi2eHGCKnFRHQHBeGsbWyW1jVyXXVhsiXMfxHyM22laa3t7CEySkYUBlRJd22NQxKWQhtm/UoSv8OHTkNm4uxe6tBgvW/dTzcOalHL5VMrncvCyjE2OPaCGLw52IKAbhhFL7IJea1lZ1+jwXk7nIfM2NK9Szc+kO/MUKJlWWUh+25ZrajvQzm1KHYYkKkJuW3VVW1iP2yqZSjti6VOfiXv5zhJjAKbfsFA+88jYJlrlywSVU1uEXx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81s+8TCJ7jCbm+CdMdkkcrMQFPnQni896CqX3sAY8EM=;
 b=htsAezE8muImaVi3LUSByFPfzFqfUFJ++me1MuRA0ge5BqSFZ22XDSG9EMAC1lE31xfBwcZRjwhcZa5lu5MQm31sZEI574M7ZPZ3RU/opzLRtb936G1dWlbJ4pamhXZL6Bg+yVIMF/VnV8UIZVxk+0GojTCZ5KI5qxWy/Obfq8HIxHmv4VCx91vJQAtpEMxPj54hC9oGOxiFT7Gwq23cVXMNigVHRAG4pheuxfnPdgdA2G4BGP/WR9PnAuGrp+cuSXlcf/3Uiv/ze2GNIKZ56Srlovmp5yErn7LI5+nwDtEuK+GoYzV66mkXNOIDTO2BpCoMf81acfC7rm9t3S52HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81s+8TCJ7jCbm+CdMdkkcrMQFPnQni896CqX3sAY8EM=;
 b=PyDNs6uIR4ZlyRsJKT6iuQegfBJ+ODo4oZbjs3lSMgvhGQJrrTowqdc1eVhDKDhnOajlPthumocP7Z+6XkvK1Tcy5Zy9Qfh9nyPgETWXjvy1RKg6yKWqIZcDGvPRm4qhy6O1SY+4GR8q0hblFXwTBt/GwjMGwM8Mf3VEICLfp2M=
Received: from MW4PR04CA0055.namprd04.prod.outlook.com (2603:10b6:303:6a::30)
 by CH0PR12MB5057.namprd12.prod.outlook.com (2603:10b6:610:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 19:41:43 +0000
Received: from CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::18) by MW4PR04CA0055.outlook.office365.com
 (2603:10b6:303:6a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 19:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT112.mail.protection.outlook.com (10.13.174.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.21 via Frontend Transport; Fri, 10 Feb 2023 19:41:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:41:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:41:41 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Feb 2023 13:41:15 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
	<olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
	<khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
	<linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
	<robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <oss@buserror.net>,
	<windhl@126.com>, <yangyingliang@huawei.com>
Subject: [PATCH v4 10/15] mtd: spi-nor: Convert macros with inline functions
Date: Sat, 11 Feb 2023 01:06:41 +0530
Message-ID: <20230210193647.4159467-11-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT112:EE_|CH0PR12MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fe6854-f086-4766-bb68-08db0b9ed62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MptqgS/5YCFscdoS/jxEHpRw0e1FF8r9rD32XN/pYndVHcL7fP2KUiq79ISMuHaaieXCtGL0zLuIHzHWrzX+M+90oJC5aJNKzj2hJEn/6G+i9CrKV73jTr5G+jnW2uKnctZPpmlMuPeD42bFhVHgEYJc7tMQj799wwSuFpGa3Vy4Mvn+86aM7a/jApLWcWTNWWYhe+fYBnVt+dDcAfW2YYXcDKWqWTV+3Awrt0dtC5wOMoJ158wUxtEjDzGNdUgyElfdNUHMHXeiM5x+x7Chrf3piDdMGdy1GoPQPjEm1PHaXnM1dnkQP5aaZDzQNiWeubTpFhgC3muwZe9s0oLKkIXnQlEkdwnfI68c7Viq+YRFkdQmDuZCKS38x00rYNePyei2Nr+Avc/+TdcjaPC9HJdpgJL6pgOqr8A3P2U6CecTS9PHwMJKk2YkZaUAMcbgCPbuMZSBT27pmonZE1uwJcSF+ICajJNe7DPhnl1xbnOfGviszWlQVAbWIBo9xUo98SgL8D+QWHtjJgjvBKXtfkMCsUIeEQfxYGQzybMNHcMQJMoQU2RACcVfrdFgZsKvGMksb2EgEtKyX4jjOoKJdFONGNhG/f2Ztn9Um5NQ0jy+kqHzO94DKVuE3OjwlK9TEDJON/+Pz2PFdE9goygx4wUisYfYTGrlybYCAfA+oYvVAROcsqcdhcEqkOq121YiId1b3xifi6HTdb/MXVX7KldRUFvG/k+bi0TODOKIaImtdDRmQXe/dIZUP/SwWeae8zKa/y6hv/pd5rwltR0d9nuggEEO+Ua5HkiBCl1LmhgvLkXUNsTsTLRI9lY/2yp7p2ujXJTgY+r7xQjs1HqQOX5Fr4wHstEnRVd+PVmB0AM=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(83380400001)(70206006)(316002)(54906003)(110136005)(8676002)(5660300002)(8936002)(7406005)(7366002)(7416002)(41300700001)(6666004)(4326008)(7336002)(70586007)(478600001)(1076003)(186003)(26005)(426003)(336012)(2616005)(921005)(356005)(1191002)(7276002)(40480700001)(47076005)(36756003)(82310400005)(86362001)(2906002)(36860700001)(82740400003)(81166007)(36900700001)(41080700001)(2101003)(83996005)(84006005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:41:42.7060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fe6854-f086-4766-bb68-08db0b9ed62f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5057
X-Mailman-Approved-At: Sat, 11 Feb 2023 14:54:09 +1100
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, konrad.dybcio@somainline.org, alsa-devel@alsa-project.org, tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org, alim.akhtar@samsung.com, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com, linux-samsung-soc@vger.kernel.org, benjaminfair@google.com, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de, linux-mediatek@lists.infra
 dead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au, michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com, kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In further patches the nor->params references in
spi_nor_otp_region_len(nor) & spi_nor_otp_n_regions(nor) macros will be
replaced with spi_nor_get_params() API. To make the transition smoother,
first converting the macros into static inline functions.

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/otp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 00ab0d2d6d2f..3d75899de303 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,27 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+/**
+ * spi_nor_otp_region_len() - get size of one OTP region in bytes
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: size of one OTP region in bytes
+ */
+static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
+{
+	return nor->params->otp.org->len;
+}
+
+/**
+ * spi_nor_otp_n_regions() - get number of individual OTP regions
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: number of individual OTP regions
+ */
+static inline unsigned int spi_nor_otp_n_regions(struct spi_nor *nor)
+{
+	return nor->params->otp.org->n_regions;
+}
 
 /**
  * spi_nor_otp_read_secr() - read security register
-- 
2.25.1

