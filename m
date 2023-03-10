Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEE6B53A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 23:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYKjg5mkzz3fhS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 09:00:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QRKYOAcI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eab::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=amit.kumar-mahapatra@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QRKYOAcI;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYCry72Xsz3cJv;
	Sat, 11 Mar 2023 04:36:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMw0Dcn4i2lMHSuR94HBa8W0W8xL9ZGK8zZccEDcEcZy/NBmtThvHaWqUxP52SxYNCIzzn+qZWqcJASIYM2zfYzzwWBwsQHn2oJYV3cNF3kKUU4tecy6iqxnWiKS51Ia4epHbvyONoWAVuu4YcBO9HbC/BUCeIh7eA56bYOpmg5kFeamKTj20ZFOeit0KjLjrwMH3AWhcH7oe1CR9+F+EsbYCiluLMqzM2aOPC7v+YIvdVHAoT27tp82gMVEqb8yE7DQyA8l7CEG4FP3q0MZNg2B6Y3DNejqvGaBjE6tSODUO6nz972ldyXOgPA7juEa0/MFr5eVeQuaLWwxKYFWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=Ex3c01p3cFHEUQttEwX5xSPmMxaetY8325KAx2LX14MR2IusC/msw3MBfIWNOvpP+rwoOB5V+6RZSXocGz6O2v4+KRaFQFgYBs4cqw2bQucd3TkKTgJEzHDpI/y7nAjEXpmCbx6IhJEGS9TJbVHW1dlh7eJTQF+EYMeIvVgk94jigSciRWY4fcCict03JwYv0axDfI2TZCXUr9Eh8ivkyqKAGXKDbgmneM0ZdKdGHBchF4VKOxzJTHb8TGJNbwvGP1mWOPoIDj7ZsUEP5Ra6w71oKlqP9JyEhydLSxopFC42gOU4QlM6Mmp1ljFYoqBflzU5p/S3eqKuamMl8S6k5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=QRKYOAcIzWqQDjSSZlZxk3IYX4qupJgbBbm2TkkFYJ+W693rvPFxbtU1z4V8IyUYZUxDxQl37mPLd8MAV3sBYR2r0caKJzO+YlCSxtcsob1DK0dWzrGrn3ufHsQpX5EZfwpc2/VS44SyDcHyEJGVCYU183WlF/6EF2stg7dVx1s=
Received: from BN9PR03CA0161.namprd03.prod.outlook.com (2603:10b6:408:f4::16)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:35:58 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::19) by BN9PR03CA0161.outlook.office365.com
 (2603:10b6:408:f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 17:35:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 17:35:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 11:35:56 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Mar 2023 11:35:29 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <Sanju.Mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
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
	<windhl@126.com>, <yangyingliang@huawei.com>, <william.zhang@broadcom.com>,
	<kursad.oney@broadcom.com>, <jonas.gorski@gmail.com>,
	<anand.gore@broadcom.com>, <rafal@milecki.pl>
Subject: [PATCH V6 06/15] platform/x86: serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod references with function call
Date: Fri, 10 Mar 2023 23:02:08 +0530
Message-ID: <20230310173217.3429788-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT039:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b2370d-7b69-4441-85d1-08db218de874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HgzjGDTgQNd50moAmQMrWv1cZh62MM1NJ7CJQBdDrrX2ZZwPX3OLTEj812joHmQPb8dtNatvdqGFgzqbqIUEGH4zdSrTASsuIZlzxqCjTHjd4HU/1CGPSfd5cdhU5zgQfDPbd5gsNF3ZjySpsNi98F7iksfvQdbavrNCi3RwoS+yKS/WeieOwkHdSHkIrhquiRC2s75pkjUiJGBajRAX5eu7O8HdfGH5klUNqakFKAFhm/VqbQOaaNSNsO1QkJuAMAEhjcQfynzYjc9sFoIqnQlKBtU0epqp1BF50Pr07qk7FJ4PtU1lJWWD+mbAXggXLl22BN0FpwNqwzZQ7mHJAm9fOIFlKU653CCBwr+x6dxiwjwPuGmWIrOjXHA2kaoEBFRj40n0QTe3RovjG4wt67kUXf7aVLzF7DMBFoe0MG/ba07GGzvXQCjDS8gb/spDKcr1GVvroPyS+bPNZyohmHgHcJfNQAtLLHKTsxDuQGew9XHrmUEvcpGENpserZYyBRNZThif4wq+VQ8fUsurB+1Q+yoNtgecaU1rZWXjHNtTRJt+zrJA7U9v5JjcEkq++2vkkc42iBs11KuafwVAd+oCTBrwLo0l7V0stOpf1/fji/1zJpCSQw+0I7QSI8gSRNBbEPivBVz2i7qGLLAzSvmmnUQ+fCCRA7xNVxTUDzud+NlovWFctyyFOMilbmp8xpkG6/zlSgzvmXljN7RuBY1zWkIoZZvnLUhIT8mWFc4XdLSRvWeIAf59/0sH4kRa57zc8DFhfgACUEeylZWweFh+K79T6Ml2u3sqrt6YR4E0VnnM1DpsaKYetoFA3P016IcwASFI/ZBRiwEZxOCUHlQhTceHg+W1VYvqv6aamsw=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(47076005)(336012)(426003)(186003)(110136005)(54906003)(36756003)(40460700003)(356005)(40480700001)(7366002)(86362001)(26005)(1076003)(81166007)(82740400003)(36860700001)(1191002)(82310400005)(83380400001)(478600001)(2906002)(6666004)(2616005)(316002)(7336002)(7406005)(7416002)(5660300002)(7276002)(4326008)(921005)(8936002)(70206006)(41300700001)(70586007)(8676002)(84006005)(2101003)(83996005)(41080700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:35:57.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b2370d-7b69-4441-85d1-08db218de874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
X-Mailman-Approved-At: Sat, 11 Mar 2023 08:54:20 +1100
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, konrad.dybcio@somainline.org, alsa-devel@alsa-project.org, tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org, alim.akhtar@samsung.com, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com, linux-samsung-soc@vger.kernel.org, benjaminfair@google.com, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com, amit.kumar-mahapatra@amd.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de, linux-mediatek@lists.infradead.org, linux-rpi-ker
 nel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au, michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com, kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
members of struct spi_device to be an array. But changing the type of these
members to array would break the spi driver functionality. To make the
transition smoother introduced four new APIs to get/set the
spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
spi->cs_gpiod references with get or set API calls.
While adding multi-cs support in further patches the chip_select & cs_gpiod
members of the spi_device structure would be converted to arrays & the
"idx" parameter of the APIs would be used as array index i.e.,
spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 5362f1a7b77c..270a4700d25d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -139,7 +139,8 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 			goto error;
 		}
 
-		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
+		dev_dbg(dev, "SPI device %s using chip select %u", name,
+			spi_get_chipselect(spi_dev, 0));
 
 		smi->spi_devs[i] = spi_dev;
 		smi->spi_num++;
-- 
2.25.1

