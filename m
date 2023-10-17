Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A47CCC64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:36:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pyqb303+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S943q4bbbz3vnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:36:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pyqb303+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::61c; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S93z86zdGz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:32:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvfF3kjbsqChm6GXJEOdtbZWSK0aZy0ZkEb3/TSAre88jr5/eP0KM75plf+FyEFQryi5G5f01zXPSUl92Tg5IuTIz0uznYfvvI+jRyjmJP+w+C7fyKcX0z7CfCQD37prZqp5aKaUdI6dmukSDss/qoJzz2zDiLoPvSJgpES2XwbGcS4E9IK8y7JATVo12XpsS8AHqUEqEEtBfMoLzQfRvictdk2jaloW3HaK66sNQKCIdvfygFjXAVft2/fXLc2KOD5R0bbQW5coDgCQGAFH7JvVue6z1xSkebpCYczVW9v1IrL/IiCDSj7GXNBDSz8UwrFWrNiAWGXC7XrwlJttUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WlrkLBB+fRC84m/Ncrmr7Y6VDuPmKBShIK1YkfnCDE=;
 b=COK+8V+9L9wdL361sJmk3O7Q4/wI76Q2fEZ4PCl43bzSuEmeJi5vpS65USMGFo5ayVnaot/4SuhPY9mjC/NPnaNZl1wA3JefU+my+VeCyTxy/JCFUZB+zwYrPyc/COwtGcQSXN/Cj/CULwSl6gUMFZ9EJbVeo/Fq09bmFokR+NY5rbm+XOio21vVBfKb1Pb4Ky9aumInPjul5s3ea7JOgwERqweXTCks/XPiAw/R5bO57n4h/egc2Gyk9OtZHISiAAHicSM1LHjhz3YJ9jXOuCm7wdLbEW5bla43j+uX5MHWdiMnKXyI2dcTSbK7L8gqJtMc3yTH8+6rARHN2ev3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WlrkLBB+fRC84m/Ncrmr7Y6VDuPmKBShIK1YkfnCDE=;
 b=pyqb303+qolgrLKIG6RU354++pi3hMl/MtRWUHglVCGbK1CjGOsMegdCKw+OnjDDzMl6NEmsMQjmjRW+Lsz6tbu4sq0P1Kej84Q50vgaoc6gLWsn+Gj7b7Dc265eKbB4Xj9R2RHqD0RgRnf1aZ4Xn3J6izBXwEh62hWabYpkJxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 19:32:21 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:32:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v3 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Date: Tue, 17 Oct 2023 15:31:45 -0400
Message-Id: <20231017193145.3198380-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017193145.3198380-1-Frank.Li@nxp.com>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f6e585-9c86-408e-1705-08dbcf47c849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mrpgXsOAGEyAHJUoJbl/pkPueSJ04mWSA76ETJ3tBjvUprUgJOmA407qOZyroSkHBQg0D7yNw7WdZaq3996XfkaArj9yLPlLpc4aab5VQCu5m3i0xOix4Bg7eglpBntufopqsnjhihFuxNfKsqtU69/gME/PRhGiWarPBWj+c7WeoQ1DOJaqQe6yFi1v/Om5eXlxsU/ovD8YYHi+jTYszedoWvHbWqlyWeI0y3vbJ/LKQrJS+Nw6xKFZTJ09zuWf7OyQwsgs5inQ49DhH+DtYdRY7gIodvskTrRXLb57vezUkLpyifsLGQlpIrgm7+B/4Ep66eqSJmmpmCxUvzIAVD0RF6UOxRnsSqlVaD5jY9ArRLuIrEPNhG5MTwqaS4mbFv0AOcVxwieUZbUYp86/QALv6kRQMZEXpR0lOQUl0z0KLzzCks7ZI6Fx6cbinjwYRzcdErNbHPRYqyPb1JyyTb1batrxdSI/Rnu04bz0CIsNPSTgTXlNKB2G9vP3yza+Nf4+R8hvoVO6Y/KuHan7kY7xu8n7vO4k4nGdnjy9fx73N7u381pe0t4c3PQsOOXupVVt3/4OkKh2WziGMAmefllEZT52WREzNMx6nV923GM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(52116002)(6666004)(83380400001)(38350700005)(26005)(6512007)(2616005)(38100700002)(15650500001)(2906002)(86362001)(4326008)(6486002)(5660300002)(8676002)(36756003)(8936002)(41300700001)(66556008)(66946007)(316002)(66476007)(6916009)(7416002)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?b1Zt95IeghmeGvn9h4tBqaIEt2wDzWFaB+y74GS13qhDD38XskYvvXlagxQt?=
 =?us-ascii?Q?2Kk14Oew2jIT1ffcuYdHgJFII9vkjfw+xDUrtcYDmP/uHmTW2j7bBEbIawtt?=
 =?us-ascii?Q?DrMwzqBBRrS9kIfPf+uDSG6pPM+V4VIvqHiL5RLzk0EHHYPzzXnlGXytEFcH?=
 =?us-ascii?Q?qZ9qRSJrTj65O2zWtnqZ1k8v/9UEXkmjVo1eDkW+Yoqh3kKedlF0qnqcUZz2?=
 =?us-ascii?Q?2MAx0L8dkvoEo2pCeZ/MXgEXpXRHmHguleVn3O/VWOgJVmtjZ56k7Nq9OK1W?=
 =?us-ascii?Q?Of8SNv6X3SFmsxGwj+PPtL7DCMaSzuWJGk+oA5ozn+j1DOofjn9YCWZHxn58?=
 =?us-ascii?Q?3uXcdaYQnmyn8pUcbDaDFOSZty5CiqaUgOuqc7SUSm07OskfpYmK5V/3sJWM?=
 =?us-ascii?Q?jvr85OhQKSxF7kYT64CgUSddpPzLePqlYTOITlHo8w/Hlg2v1yPZRIaNchdx?=
 =?us-ascii?Q?+QjkBcjdW9RXg4YwSufP7O1qXkZOLRQH/mlh5NrZfNW9Q0HDuQmBSvIwNX/B?=
 =?us-ascii?Q?3a2Ftu8hO+F3v3yARtSdED5njG0FxusjGB4ZoK/aPj7sRAcxd5fBxfFkiPh7?=
 =?us-ascii?Q?w1C0G8ZH+Xx3oeKLOE+H7hhUTJvEDvgFFrXna8c/F3R42LY9VeI7qsPikpEK?=
 =?us-ascii?Q?Zjh5jWRcMLNXIloKONOktVRWHFkB8OSsiDx3zF5w0N3nob61fHh3kxgZ0Drz?=
 =?us-ascii?Q?QbX2JbQ1ezOLdAXp4HkuvA4ngQIakuxem61oXYbzqEVceagF+T/UBXELdJ+9?=
 =?us-ascii?Q?KbHYG28B54dPfV6bQsn/+a4IyRGmM1a8nnSJ2BQJJlGECAHAoc3RWufU2vqQ?=
 =?us-ascii?Q?77rzdNRzN+tO9ZAj990QlJz1hKhVFaFtzkVpzyLSIi1qcrzOVka6YLw5+nxG?=
 =?us-ascii?Q?pDt/8RcWWRxff9HkRU0gG43p4EKsG91/KAxPuUOvTLFlOlZv59Unkz/udXjb?=
 =?us-ascii?Q?KyikO1A4G00k7tAKIyZCQAIBu+iXUKiese3oBMil8LnAXuV+OaS9Ic/TCr1p?=
 =?us-ascii?Q?K+LWvAqYncdmXWkNfiMYrAhHVP2X/I+Wo73pCdpsPaM8KpHzlYBlwuxkcNsF?=
 =?us-ascii?Q?OFfr7p9xaYFytpr8Gpoz9tHUSHXsUG0JDe28G6FvBEI6LEreEb5anwFkZzph?=
 =?us-ascii?Q?jXHX4uewFvfixESA5vjiWwV0qptFn3WySV5hZesGgLxqAcTzA0xFsLzOGGAn?=
 =?us-ascii?Q?HLbUwaM64BQyKZezHTDEEYAZaGqsGMKk1bs7TOnFJUm4hhyVMsQTFMoMojb5?=
 =?us-ascii?Q?bFnQp6glJPAOTXq3Fks8tow1WAWO5cWBF7yQy8cAz9IAJQGIez+u45zu4ZkN?=
 =?us-ascii?Q?hzaBgk90uLI6siWFHwiP7cEmwRJyjZohfC4kal+lv9gYvoVQIqHQV41H6rBK?=
 =?us-ascii?Q?9EzU3gkhgRB+zZKYEZB8UGoenlyrJgBZ4WONXBnIpH4iw4guWfkIxV8kGr50?=
 =?us-ascii?Q?p3+EjfJs2NSqKLGNdTgGS7W4rMsfXI8nn/eNYP/pYS1QhNJLa2yagPEO1K9i?=
 =?us-ascii?Q?k5dPVnaguQJxnQcUrPDpXHEgkng/EdaYihURIjwTFtn+sos1TeVyuX4NDZ3H?=
 =?us-ascii?Q?GDPi+7B24cBFnfDPqsyyGFWpC4cc7meqxGk/UZf+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f6e585-9c86-408e-1705-08dbcf47c849
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:32:21.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CttJn5yErEm5kOEMQ+jAVuVLN736ddNpOdZnhVhJWhzAZ/AbddkpFLLmtT1NFahzAPmTlRlcPmDb+u9CU3q67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ls1043a add suspend/resume support.
Implement ls1043a_pcie_send_turnoff_msg() to send PME_Turn_Off message.
Implement ls1043a_pcie_exit_from_l2() to exit from L2 state.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
    - Remove ls_pcie_lut_readl(writel) function
    
    Change from v1 to v2
    - Update subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 4b663b20d8612..9656224960b0c 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -41,6 +41,15 @@
 #define SCFG_PEXSFTRSTCR	0x190
 #define PEXSR(idx)		BIT(idx)
 
+/* LS1043A PEX PME control register */
+#define SCFG_PEXPMECR		0x144
+#define PEXPME(idx)		BIT(31 - (idx) * 4)
+
+/* LS1043A PEX LUT debug register */
+#define LS_PCIE_LDBG	0x7fc
+#define LDBG_SR		BIT(30)
+#define LDBG_WE		BIT(31)
+
 #define PCIE_IATU_NUM		6
 
 #define LS_PCIE_DRV_SCFG	BIT(0)
@@ -227,6 +236,68 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	if (!pcie->scfg) {
+		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
+		return;
+	}
+
+	/* Send Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val |= PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+
+	/*
+	 * There is no specific register to check for PME_To_Ack from endpoint.
+	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
+	 */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/*
+	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
+	 * to complete the PME_Turn_Off handshake.
+	 */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val &= ~PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+}
+
+static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	/*
+	 * Only way let PEX module exit L2 is do a software reset.
+	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
+	 *	    clearing the soft reset on the PEX module.
+	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
+	 */
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_WE;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_SR;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_SR;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_WE;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	return 0;
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
@@ -244,6 +315,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 	.flags = LS_PCIE_DRV_SCFG,
 };
 
+static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
+	.host_init = ls_pcie_host_init,
+	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
+};
+
+static const struct ls_pcie_drvdata ls1043a_drvdata = {
+	.pf_lut_off = 0x10000,
+	.pm_support = true,
+	.ops = &ls1043a_pcie_host_ops,
+	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
+	.flags = LS_PCIE_DRV_SCFG,
+};
+
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_lut_off = 0xc0000,
 	.pm_support = true,
@@ -254,7 +338,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
 	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
-	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
+	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
-- 
2.34.1

