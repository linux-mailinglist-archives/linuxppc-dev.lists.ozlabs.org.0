Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E566B537B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 22:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYKbb4vS2z3chg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 08:55:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FuhWBSAy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::60e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=amit.kumar-mahapatra@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FuhWBSAy;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYCp32SvJz3bqw;
	Sat, 11 Mar 2023 04:33:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SevqSHsmxp0FmIc40ttGp2W/TCembJTSWorTbaX5kRc61DT4EKLB8DtsBmUf6xkWd7w/dtVQtwt1KGbdFzeHiajKMle0iwu9nbqxhlwQcy0cRQn16gGFKpl2du9GJzZYpHRhZhM1Cp+X2tbT5nTlc++YTnXKoGaz9iOC7MsmUE2k/XL7cmgjtUxtOLa5mKTD4GaePHaXUoPrDPzH40eZAaMuCW6fjsATNxT8uF3AQTSL1x05kB4h+R/j7wfYo3mFVHYPXNCGdx9lpYRb/Q5brm7MMZfiod74nbLtXHCxReuGtvOt5h/VsOxif1rlJnVc8Qua0A+vwW2dSQacMNWPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNw8EK0TddiKfTFg9Oikb8cmErBYSKJrgEvq5Os+mfQ=;
 b=NwBYc/pZrmYRSMdKUug9jslCxMsEC5IdXh5h9ahaFmjRnuX8XFuDNsET3NyT9bb6TMwVgiWdLuGkUwpAnlqz8pVAHjHf2g8dXrtFOrtnfBs4Sf2+00YuqqjRiHglSfhQg6xhSOK+H5nZATFn2vqfOywClBi3pQJ9fGB2YUF32zjfKEfokGMNMRBQ1BPuQUy+kYeTtkGPSNPCRC4JO+6JGVJ0qzkL6e4usXe1CP1szhtW6TYDS8P7KSLLeymBNk19jsFvimbkDD91Vl8S+9Mpf1CgauTdcM/XTA6zXhDDurbHTjJjZUfUou21YO1yCvIF/z+ZVrCDbWoYu1qXQ22gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNw8EK0TddiKfTFg9Oikb8cmErBYSKJrgEvq5Os+mfQ=;
 b=FuhWBSAyMJQFBFl6fK+Shd2Zlj1wvhK5vY2pF5LQyDow+MKl7PVR9CYyDi3rNO02/kb5B0BZwIPAKm99qGcGS3PVBQ32xj+Pji/aceJfRMsnmt/BEwaR/W1QF6ORuNBw6C6KxTja+q2jybZDEHAldT+4tTTBke+9whDcEWSbP9M=
Received: from DM6PR03CA0037.namprd03.prod.outlook.com (2603:10b6:5:100::14)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:33:16 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::b9) by DM6PR03CA0037.outlook.office365.com
 (2603:10b6:5:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 17:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 17:33:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 11:33:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 11:33:10 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Mar 2023 11:32:43 -0600
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
Subject: [PATCH V6 00/15] Add support for stacked/parallel memories
Date: Fri, 10 Mar 2023 23:02:02 +0530
Message-ID: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a81058-4db1-45a1-4fe7-08db218d8748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	owApOUK3Pzn4UiTIn9y5gnWGevi6zIeaN9Yjhuc4znPVFBCpmH9J9mJuBcqK8sv1jeV2Y7Bl12P8aX7B6PdRTAdcgs1o9/jSK4WS5z0gZqrxr+9ioR1B9Q9wXN3YisswM+tMeWLtMJ51QjtLqsZ4CuRsA8ALiyOJT3xFrSmBeylyV+Ev6bOqg3RWGp0fxiWwutFtnXBEbs8bskE3bfBtA3ofuraYRX+OgrbWN5rtE++qSZ4OG6FZrT9MDzzeZgauu4DoOEB9ukP185LQ9Bx6dwg92w8iUvnNygQZaukUUKFWVwbmGKdGQBjr8CC6DppQ+AZOQATHLg4D2PwBIa+RnIwhOiHRX7j1dr/wpSCpwjMwHg/YhXInEdrrOCJcQ+FCkcRxlx4kHBlmBalmTtmH/42jNZ8vgqDVur2DvAQh/OqOlnc4RFffmwNJ89UcWBDW1x080NV/uh9EgKM3z9fDqStDA3n8BNrUJHBn5eMzyqP1h1vY0UbckSL9innt3TrKhQMUYry6vrVGgnVH1f3CHrPm+MhnRAibhq3C8MM34s73WymULLDZ3w8jzyOY1n7Bkirj8ZSp5VCY/REsx5qaUvmsoZfySHjwCndyo+RUP5Ytznq2exGpQ4p1DqMwwd6KZBPBdxFyTr9gG2/kEJqVL8C2e6Dga9mVU526TZXz/AYuphL1NmPpHlqZSc+We+55157mzQHgmUdut+vDpo6uQIwIGEoBmlHb5NuppZro4rz0Mm4Cnfngl3RI62dA2B4i52dSTJJAtlvZ1SKCYRf5avU1iFHAIZvqdQa6IO2D4E3gvAzepMG1QOY/Sx/WD+1oYJgT/2l+di+P7/Y3up1cCXU2UBZmqTWmTWhF8un6YuMd7JtGzbbuhFjVCXZfYrxE
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(36756003)(186003)(110136005)(54906003)(966005)(7276002)(316002)(7336002)(5660300002)(7406005)(7416002)(70206006)(41300700001)(8936002)(8676002)(70586007)(4326008)(921005)(36860700001)(81166007)(82740400003)(1191002)(7366002)(356005)(40480700001)(1076003)(86362001)(26005)(6666004)(2616005)(63350400001)(83380400001)(478600001)(2906002)(63370400001)(82310400005)(47076005)(336012)(426003)(83996005)(41080700001)(36900700001)(84006005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:33:14.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a81058-4db1-45a1-4fe7-08db218d8748
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668
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

This patch is in the continuation to the discussions which happened on
'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
adding dt-binding support for stacked/parallel memories.

This patch series updated the spi-nor, spi core and the spi drivers
to add stacked and parallel memories support.

The first patch
https://lore.kernel.org/all/20230119185342.2093323-1-amit.kumar-mahapatra@amd.com/
of the previous series got applied to
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
But the rest of the patches in the series did not get applied due to merge
conflict, so send the remaining patches in the series after rebasing it
on top of for-next branch.
---
BRANCH: for-next

Changes in v6:
- Rebased on top of latest v6.3-rc1 and fixed merge conflicts in
  spi-mpc512x-psc.c, sfdp.c, spansion.c files and removed spi-omap-100k.c.
- Updated spi_dev_check( ) to reject new devices if any one of the
  chipselect is used by another device.

Changes in v5:
- Rebased the patches on top of v6.3-rc1 and fixed the merge conflicts.
- Fixed compilation warnings in spi-sh-msiof.c with shmobile_defconfig  

Changes in v4:
- Fixed build error in spi-pl022.c file - reported by Mark.
- Fixed build error in spi-sn-f-ospi.c file.
- Added Reviewed-by: Serge Semin <fancer.lancer@gmail.com> tag.
- Added two more patches to replace spi->chip_select with API calls in
  mpc832x_rdb.c & cs35l41_hda_spi.c files.

Changes in v3:
- Rebased the patches on top of
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- Added a patch to convert spi_nor_otp_region_len(nor) &
  spi_nor_otp_n_regions(nor) macros into inline functions
- Added Reviewed-by & Acked-by tags

Changes in v2:
- Rebased the patches on top of v6.2-rc1
- Created separate patch to add get & set APIs for spi->chip_select &
  spi->cs_gpiod, and replaced all spi->chip_select and spi->cs_gpiod
  references with the API calls.
- Created separate patch to add get & set APIs for nor->params.
---

Amit Kumar Mahapatra (15):
  spi: Replace all spi->chip_select and spi->cs_gpiod references with
    function call
  net: Replace all spi->chip_select and spi->cs_gpiod references with
    function call
  iio: imu: Replace all spi->chip_select and spi->cs_gpiod references
    with function call
  mtd: devices: Replace all spi->chip_select and spi->cs_gpiod
    references with function call
  staging: Replace all spi->chip_select and spi->cs_gpiod references
    with function call
  platform/x86: serial-multi-instantiate: Replace all spi->chip_select
    and spi->cs_gpiod references with function call
  powerpc/83xx/mpc832x_rdb: Replace all spi->chip_select references with
    function call
  ALSA: hda: cs35l41: Replace all spi->chip_select references with
    function call
  spi: Add stacked and parallel memories support in SPI core
  mtd: spi-nor: Convert macros with inline functions
  mtd: spi-nor: Add APIs to set/get nor->params
  mtd: spi-nor: Add stacked memories support in spi-nor
  spi: spi-zynqmp-gqspi: Add stacked memories support in GQSPI driver
  mtd: spi-nor: Add parallel memories support in spi-nor
  spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver

 arch/powerpc/platforms/83xx/mpc832x_rdb.c     |   2 +-
 drivers/iio/imu/adis16400.c                   |   2 +-
 drivers/mtd/devices/mtd_dataflash.c           |   2 +-
 drivers/mtd/spi-nor/atmel.c                   |  17 +-
 drivers/mtd/spi-nor/core.c                    | 665 +++++++++++++++---
 drivers/mtd/spi-nor/core.h                    |   8 +
 drivers/mtd/spi-nor/debugfs.c                 |   4 +-
 drivers/mtd/spi-nor/gigadevice.c              |   4 +-
 drivers/mtd/spi-nor/issi.c                    |  11 +-
 drivers/mtd/spi-nor/macronix.c                |   6 +-
 drivers/mtd/spi-nor/micron-st.c               |  39 +-
 drivers/mtd/spi-nor/otp.c                     |  48 +-
 drivers/mtd/spi-nor/sfdp.c                    |  29 +-
 drivers/mtd/spi-nor/spansion.c                |  50 +-
 drivers/mtd/spi-nor/sst.c                     |   7 +-
 drivers/mtd/spi-nor/swp.c                     |  22 +-
 drivers/mtd/spi-nor/winbond.c                 |  10 +-
 drivers/mtd/spi-nor/xilinx.c                  |  18 +-
 drivers/net/ethernet/adi/adin1110.c           |   2 +-
 drivers/net/ethernet/asix/ax88796c_main.c     |   2 +-
 drivers/net/ethernet/davicom/dm9051.c         |   2 +-
 drivers/net/ethernet/qualcomm/qca_debug.c     |   2 +-
 drivers/net/ieee802154/ca8210.c               |   2 +-
 drivers/net/wan/slic_ds26522.c                |   2 +-
 .../net/wireless/marvell/libertas/if_spi.c    |   2 +-
 drivers/net/wireless/silabs/wfx/bus_spi.c     |   2 +-
 drivers/net/wireless/st/cw1200/cw1200_spi.c   |   2 +-
 .../platform/x86/serial-multi-instantiate.c   |   3 +-
 drivers/spi/spi-altera-core.c                 |   2 +-
 drivers/spi/spi-amd.c                         |   4 +-
 drivers/spi/spi-ar934x.c                      |   2 +-
 drivers/spi/spi-armada-3700.c                 |   4 +-
 drivers/spi/spi-aspeed-smc.c                  |  13 +-
 drivers/spi/spi-at91-usart.c                  |   2 +-
 drivers/spi/spi-ath79.c                       |   4 +-
 drivers/spi/spi-atmel.c                       |  26 +-
 drivers/spi/spi-au1550.c                      |   4 +-
 drivers/spi/spi-axi-spi-engine.c              |   2 +-
 drivers/spi/spi-bcm-qspi.c                    |  10 +-
 drivers/spi/spi-bcm2835.c                     |  19 +-
 drivers/spi/spi-bcm2835aux.c                  |   4 +-
 drivers/spi/spi-bcm63xx-hsspi.c               |  30 +-
 drivers/spi/spi-bcm63xx.c                     |   2 +-
 drivers/spi/spi-bcmbca-hsspi.c                |  30 +-
 drivers/spi/spi-cadence-quadspi.c             |   5 +-
 drivers/spi/spi-cadence-xspi.c                |   4 +-
 drivers/spi/spi-cadence.c                     |   4 +-
 drivers/spi/spi-cavium.c                      |   8 +-
 drivers/spi/spi-coldfire-qspi.c               |   8 +-
 drivers/spi/spi-davinci.c                     |  18 +-
 drivers/spi/spi-dln2.c                        |   6 +-
 drivers/spi/spi-dw-core.c                     |   2 +-
 drivers/spi/spi-dw-mmio.c                     |   4 +-
 drivers/spi/spi-falcon.c                      |   2 +-
 drivers/spi/spi-fsi.c                         |   2 +-
 drivers/spi/spi-fsl-dspi.c                    |  16 +-
 drivers/spi/spi-fsl-espi.c                    |   6 +-
 drivers/spi/spi-fsl-lpspi.c                   |   2 +-
 drivers/spi/spi-fsl-qspi.c                    |   6 +-
 drivers/spi/spi-fsl-spi.c                     |   2 +-
 drivers/spi/spi-geni-qcom.c                   |   6 +-
 drivers/spi/spi-gpio.c                        |   4 +-
 drivers/spi/spi-gxp.c                         |   4 +-
 drivers/spi/spi-hisi-sfc-v3xx.c               |   2 +-
 drivers/spi/spi-img-spfi.c                    |  14 +-
 drivers/spi/spi-imx.c                         |  30 +-
 drivers/spi/spi-ingenic.c                     |   4 +-
 drivers/spi/spi-intel.c                       |   2 +-
 drivers/spi/spi-jcore.c                       |   4 +-
 drivers/spi/spi-lantiq-ssc.c                  |   6 +-
 drivers/spi/spi-mem.c                         |   4 +-
 drivers/spi/spi-meson-spicc.c                 |   2 +-
 drivers/spi/spi-microchip-core.c              |   6 +-
 drivers/spi/spi-mpc512x-psc.c                 |   8 +-
 drivers/spi/spi-mpc52xx.c                     |   2 +-
 drivers/spi/spi-mt65xx.c                      |   6 +-
 drivers/spi/spi-mt7621.c                      |   2 +-
 drivers/spi/spi-mux.c                         |   8 +-
 drivers/spi/spi-mxic.c                        |  10 +-
 drivers/spi/spi-mxs.c                         |   2 +-
 drivers/spi/spi-npcm-fiu.c                    |  20 +-
 drivers/spi/spi-nxp-fspi.c                    |  10 +-
 drivers/spi/spi-omap-uwire.c                  |   8 +-
 drivers/spi/spi-omap2-mcspi.c                 |  24 +-
 drivers/spi/spi-orion.c                       |   4 +-
 drivers/spi/spi-pci1xxxx.c                    |   4 +-
 drivers/spi/spi-pic32-sqi.c                   |   2 +-
 drivers/spi/spi-pic32.c                       |   4 +-
 drivers/spi/spi-pl022.c                       |   4 +-
 drivers/spi/spi-pxa2xx.c                      |   6 +-
 drivers/spi/spi-qcom-qspi.c                   |   2 +-
 drivers/spi/spi-rb4xx.c                       |   2 +-
 drivers/spi/spi-rockchip-sfc.c                |   2 +-
 drivers/spi/spi-rockchip.c                    |  26 +-
 drivers/spi/spi-rspi.c                        |  10 +-
 drivers/spi/spi-s3c64xx.c                     |   2 +-
 drivers/spi/spi-sc18is602.c                   |   4 +-
 drivers/spi/spi-sh-msiof.c                    |   6 +-
 drivers/spi/spi-sh-sci.c                      |   2 +-
 drivers/spi/spi-sifive.c                      |   6 +-
 drivers/spi/spi-sn-f-ospi.c                   |   2 +-
 drivers/spi/spi-st-ssc4.c                     |   2 +-
 drivers/spi/spi-stm32-qspi.c                  |  12 +-
 drivers/spi/spi-sun4i.c                       |   2 +-
 drivers/spi/spi-sun6i.c                       |   2 +-
 drivers/spi/spi-synquacer.c                   |   6 +-
 drivers/spi/spi-tegra114.c                    |  28 +-
 drivers/spi/spi-tegra20-sflash.c              |   2 +-
 drivers/spi/spi-tegra20-slink.c               |   6 +-
 drivers/spi/spi-tegra210-quad.c               |   8 +-
 drivers/spi/spi-ti-qspi.c                     |  16 +-
 drivers/spi/spi-topcliff-pch.c                |   4 +-
 drivers/spi/spi-wpcm-fiu.c                    |  12 +-
 drivers/spi/spi-xcomm.c                       |   2 +-
 drivers/spi/spi-xilinx.c                      |   6 +-
 drivers/spi/spi-xlp.c                         |   4 +-
 drivers/spi/spi-zynq-qspi.c                   |   2 +-
 drivers/spi/spi-zynqmp-gqspi.c                |  58 +-
 drivers/spi/spi.c                             | 225 ++++--
 drivers/spi/spidev.c                          |   6 +-
 drivers/staging/fbtft/fbtft-core.c            |   2 +-
 drivers/staging/greybus/spilib.c              |   2 +-
 include/linux/mtd/spi-nor.h                   |  18 +-
 include/linux/spi/spi.h                       |  34 +-
 include/trace/events/spi.h                    |  10 +-
 sound/pci/hda/cs35l41_hda_spi.c               |   2 +-
 126 files changed, 1350 insertions(+), 615 deletions(-)

-- 
2.25.1

