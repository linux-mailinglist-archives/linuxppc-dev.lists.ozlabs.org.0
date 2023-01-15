Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A769266B13B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 14:19:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvwj43fBgz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 00:19:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=n+vy36Is;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=40.92.99.103; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=n+vy36Is;
	dkim-atps=neutral
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2103.outbound.protection.outlook.com [40.92.99.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvwh36LfXz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 00:18:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEln0j2HXMkwsRKCAIKaOoAqx/Oo1PWouIPzFkoaPTUyZmwXbPUL6iB70ZHS8k4IAcUcCzB6QLkZ6z4xEIQ8zoju97YF3xRVAu+9tq0O0sk8t9Ln3w0Y5pOpB5nYDPpZMHc0y1peM0/memREDhQxbawKrj4cTfGwkxigFRqdvRwvov5mLAPXmDrjlilBI4DwdCnUoEQ8R7RT7fkFiknpS6L5tERlFQeLa0/lQISE7dHe8Y44gFW0AaObZHQc1eTOVXLzwI1mGgVfMIM8aLh9cQ/Euy9JdYDeJHTtnu1QBKTYIDTumipF2cVTa85t0lxWay85QXbNnDL45J7XWBf54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTGgcu9nbcsTzwM68ASnYaGrFz5GUfbBvv8qIlBZX58=;
 b=m2NpFa0pBnPIgvvUbpOUjOeC2B1+nn03hyktGHJ0d/hZxC79+cNrYea/WCcD3S2RcuVczQEDNygPduLGzgm+E24RYqf6ugYFFPsUZgUSWTSz8urbHmfM5TFad4ZCuEtLNCNH7HWiQVErLIIkVtQWXkYf0+URxrkrAaon+L/Q7GRYZhCn9JRZFbVwLZAIdTqsc7BgIk90pR23OhICzSLRZb0uqYKQBDLr5DWgtLT7s0vDta1EP1jJKW9zy/3ppG5UpyDDzUVwiJhIFTbhoSj5gB5ktdkOQ98BCoWNvexxIXSJ3WonXfDPwK3DH60DlVyT7M90U5x689X+gopgXrbORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTGgcu9nbcsTzwM68ASnYaGrFz5GUfbBvv8qIlBZX58=;
 b=n+vy36Isi3Qew2njx6W2FDT2zwWDsH0fuWZMJnXvgTYfs9vnap+Mqn+p5FRJG8yqVnXrX/jzFhwEJqUle6VVNN8C2onhNsjQDrdR5RtZkHGo0QcoJVORHqkHh0tPBD2n3NSDLDFUzBaCIhxuHJp7kptZ6OrpeGtR5z56H6rmyXoUvea/YSSWQfMpeE9HSReWDHyXzGZ9faPE2Q/vLxLwLsx+T1vV0/3U768D1giULFSxGQokMC2aV/E8MA0F3YmslDu27471uAQSPSQJlzKHl21ag+HIlP4E2Q6XZJR+e7iF1SnD3OcLD8+rl1sstk549pe+WhlQqVzI0x+gk3ofzQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1905.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Sun, 15 Jan
 2023 13:17:51 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%4]) with mapi id 15.20.6002.012; Sun, 15 Jan 2023
 13:17:51 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: [PATCH v2] powerpc: macio: Make remove callback of macio driver void returned
Date: Sun, 15 Jan 2023 21:17:23 +0800
Message-ID:  <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [bUJvojJuZa16BsTSJLyHJck8bEAjCx8VshO8+z72WPo=]
X-ClientProxiedBy: TYBP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::29) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20230115131723.739700-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1905:EE_
X-MS-Office365-Filtering-Correlation-Id: 64abd248-982f-4e53-de42-08daf6fae749
X-MS-Exchange-SLBlob-MailProps: 	a+H6FLLcF3qYJJ10Bi9Rl+nmsQ8Ed8Hr5tpuwao1W7pQNTSMrRuPrD+BF2W/62kp7kf74lFg5ZF+aVAiZdTs/b/U79cMwPtVM3fw6sMC8w5WWl7mAFIHiAN91M9WAy1bc91iajhGGlLs+yiPPkFaTNDc7PN5t51qnxqk3+b6g37QntwZnD7Y1tsWmOzxGy+NV1forns1O+Wi/bm58BB5dFSM3uPlc5P5u5dKX10sbJsUCywP1wiY51V2+w6uVA6iNgVok96NqJ7xzDLE4FcTgUaoyQnWPFfxmKaJ6IiyD1k33Yg3jVpzgJ/jVm0kGC6a+nbftpU/PmyPq0Eab1VcjmkK46p2pqnYVaWZMLdu7Wke+L2nN1U6IoGI8PHWmcNiba3i6SLb5imLS9yJFRLW+d2cSK2qk496rOMec3EDMnnz75JJgc7FnzlOCHIxGU1huczsVut2YPn9g079H82AFPcIHzGROL5OZEHuruJPbKNUwMGZQdLFkbm+Dq+RkMex9KJbiCIfnDtRLaa+Tzpab0RXZNhS/vJSsy1YY8tKbsEyAzCjRSlYMaUJSaUUQ14YEm1g+Xo3GD69WVvT2M/6u1kHHrjd2GurHBoOgIG1HFl7sW3yKRbE6s4cRpG2RAUo2S99fQyzkELc487NZ1iZJrihkpU0DaJTsvVXaW39UbNhpcdQPm1UVzNDdNnr4HYT+KgzdS0y6KTehkN9L5okkpZbktb3Jrvsfel1ja9UKOPDHeqVZCclDHlimRENcZj9nUmZrQ32zx+7D1nvA2ywJkpNF4WdsfXYCzEA9UBfTF7EipM9+RaypvGXff7HxLW1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mWI3mRuk7a99L6WoiEokXNy72FC0lfZHeTmleCs0ZNl/4dFcbsTr0T4lkAyV8Kxq52vWohz6L+mZA+ulj+Lp7T+8EO2dyGbbS6oXhvTjRehYKYyzMpzka16i2iRY/0vdXzY5NZCK0ivah7VWNQ9dRq1STc/+4jSRvE5I+yRDmAf6vgWz7gomdWzc8NjA8pLgSxqa008BR5wtFsqlHm41BId/SVnvBKZaq95TXQd1Z4A7jD551sFBCXP7GnTAImxTOm399VPOHtK3DvcY0f+4lmE6PZFUTsYmN8u+LKQt8hJLgpDIoW0JVUPdFUxG+WR2aUEJPOZekReVj/VgugnZX+HxuKBPssw7vaREobE8sNPnDHCJZoyEZVZupsT59h8aSzS+NGlcbL17kfpg5S9IBm+mU7lvWioFWs7lBI0QMgc5MWqFtgBdlStEAKJGpB0aFNJ+CE/lMEVT1/+/L5cWBmFYiknSg31bVGb4JvpJ/8+rmvTw9yzRSQKOVwlMbgWMbQlcsyst2W+3mD5ZEJbdXn9IQLgQZzox5p+JH7eNYtfiVOmP65fsJnPoIDbnj1KbonMeKjbzkODuTn/Syl6sryQLkgOii+xSCWY8xolGnMe12QsLBcM07vDZkbfYNiKgF833ODTBorqs+9Eshl6+Og==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uG8PZtE8TRpJZ9+OmD6wIge9j/OOge4riYajz9PMAo17kLur4LC06/oliYWT?=
 =?us-ascii?Q?OMUs2V9j4vrKkaDeDEWv4SW52nydv4SiPopOkQ1U6qCzMzbcZkZ46ZFNviDk?=
 =?us-ascii?Q?DkFPjAXqkJ/RlIpk/auzqpuXN3TA8NcYo2Lb5q/rniIclGuE8eRnAT317YYn?=
 =?us-ascii?Q?iE71Tc7buHoaBkywDov+6Rm1PDCgaaUK4mgc4IyyH6Ydtdb+2Y8v5UkZ9Fsx?=
 =?us-ascii?Q?dqR0XM0Fs8ybLaRjKvireLvcsofzr8DCAGmhcMODHcC7H6RSvNIopi4L9DsZ?=
 =?us-ascii?Q?JAfzf49Ry5p+jKKj0YVXJBa2b99FnIG3rRWedvJWG5rygVjZiW+Ypfxz4k4h?=
 =?us-ascii?Q?YtJvmi2jztePkJeAhdGsJ0T9InktcHerdrCeEGveUn/pMD+/GiDTmd48JUTn?=
 =?us-ascii?Q?b6knwby47yTFGNG6iPamHdqRSUQhMIbmXSrgg4jNCruRap4s81rSxLQDZ6TB?=
 =?us-ascii?Q?ftjhIw6Okr/BdD+AdCSMU71w8n4QJT1KHDyTxlQ3+pcfcOH8xr7z4rL+po/j?=
 =?us-ascii?Q?EqlUCRaSUG/IPRXYvbrFsh9e89vI69CZIg7qac1sYeUtAn0UPJfx1KiETrgz?=
 =?us-ascii?Q?M2BpXr2bmFIt8y3pnc1a7/3sxRhjdTzG7WIwS2ufWVkWp/EOl9fWTFseJ1d2?=
 =?us-ascii?Q?EL13iWJGaYtboJg8GyjLAh2V7G3K3txd8u0AoidAFo9YvT+JSGs52xKWXiQx?=
 =?us-ascii?Q?wbrsn/AYb9q+GwrFgsqgyAry3HV1KGWgbLZJeZy3mHFoipodfJ4GTt9td1vP?=
 =?us-ascii?Q?yH2MK0+5hyMyRAqyVGrsqZo/JDwkozu8rL8mJhDxzdFNMcf/znKQI3xaOy1m?=
 =?us-ascii?Q?az/+LTus3CugFYHXEcMqjHzJdYCHc3IH8cxm2fadoDhFbzV8KQS2+ASQik7j?=
 =?us-ascii?Q?pKilCF647ew5pauqm3gbN8FP708EYyVKm19m5+xDI4TNX6ilvrxCkOzX+1kf?=
 =?us-ascii?Q?zTiFHcgzupKkgiumpzk5s7g8bQxnCpQJoDs4uFAh43UAJd6xYdR1MimFnWmZ?=
 =?us-ascii?Q?daDuQa42l1dQ6jtO3x3CZHQziWLKluQXxfoRCpVuoTSdtwR/Gjb/oWFfdivm?=
 =?us-ascii?Q?L1QRqCa57di1u6L2EMhnqQwxKzPZ6sm/h+kMJ/4LUQsb7ctBmnPEvsn5qVOm?=
 =?us-ascii?Q?7K1sgDlQ8yJW8cWL80114Id3LqjrzmKu7i/njTH+lK/6+rnQWtHT15/xVown?=
 =?us-ascii?Q?qVfZwCfq4kMCX8Tsub15L//L7c/yrHDkzji1R6c807FZPFdcrTSJipvnSKTl?=
 =?us-ascii?Q?bWX/r8YNlzPBPB+oeZTu4u0/kvVvt4Ff/P6rIzc5/v+/m8hTH4fXI4bWhPYB?=
 =?us-ascii?Q?Ph8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64abd248-982f-4e53-de42-08daf6fae749
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 13:17:51.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1905
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
Cc: Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit fc7a6209d571 ("bus: Make remove callback return void") forces
bus_type::remove be void-returned, it doesn't make much sense for any
bus based driver implementing remove callbalk to return non-void to
its caller.

This change is for macio bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
v1 -> v2
- Revert unneeded changes.
- Rebased on latest powerpc/next.

v1
- https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
---
 arch/powerpc/include/asm/macio.h                | 2 +-
 drivers/ata/pata_macio.c                        | 4 +---
 drivers/macintosh/rack-meter.c                  | 4 +---
 drivers/net/ethernet/apple/bmac.c               | 4 +---
 drivers/net/ethernet/apple/mace.c               | 4 +---
 drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
 drivers/scsi/mac53c94.c                         | 5 +----
 drivers/scsi/mesh.c                             | 5 +----
 drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
 sound/aoa/soundbus/i2sbus/core.c                | 4 +---
 10 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
index ff5fd82d9ff0..cb9c386dacf8 100644
--- a/arch/powerpc/include/asm/macio.h
+++ b/arch/powerpc/include/asm/macio.h
@@ -125,7 +125,7 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
 struct macio_driver
 {
 	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
-	int	(*remove)(struct macio_dev* dev);
+	void	(*remove)(struct macio_dev *dev);
 
 	int	(*suspend)(struct macio_dev* dev, pm_message_t state);
 	int	(*resume)(struct macio_dev* dev);
diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 9ccaac9e2bc3..653106716a4b 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -1187,7 +1187,7 @@ static int pata_macio_attach(struct macio_dev *mdev,
 	return rc;
 }
 
-static int pata_macio_detach(struct macio_dev *mdev)
+static void pata_macio_detach(struct macio_dev *mdev)
 {
 	struct ata_host *host = macio_get_drvdata(mdev);
 	struct pata_macio_priv *priv = host->private_data;
@@ -1202,8 +1202,6 @@ static int pata_macio_detach(struct macio_dev *mdev)
 	ata_host_detach(host);
 
 	unlock_media_bay(priv->mdev->media_bay);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
index c28893e41a8b..f2f83c4f3af5 100644
--- a/drivers/macintosh/rack-meter.c
+++ b/drivers/macintosh/rack-meter.c
@@ -523,7 +523,7 @@ static int rackmeter_probe(struct macio_dev* mdev,
 	return rc;
 }
 
-static int rackmeter_remove(struct macio_dev* mdev)
+static void rackmeter_remove(struct macio_dev *mdev)
 {
 	struct rackmeter *rm = dev_get_drvdata(&mdev->ofdev.dev);
 
@@ -558,8 +558,6 @@ static int rackmeter_remove(struct macio_dev* mdev)
 
 	/* Get rid of me */
 	kfree(rm);
-
-	return 0;
 }
 
 static int rackmeter_shutdown(struct macio_dev* mdev)
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index 9e653e2925f7..292b1f9cd9e7 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -1591,7 +1591,7 @@ bmac_proc_info(char *buffer, char **start, off_t offset, int length)
 }
 #endif
 
-static int bmac_remove(struct macio_dev *mdev)
+static void bmac_remove(struct macio_dev *mdev)
 {
 	struct net_device *dev = macio_get_drvdata(mdev);
 	struct bmac_data *bp = netdev_priv(dev);
@@ -1609,8 +1609,6 @@ static int bmac_remove(struct macio_dev *mdev)
 	macio_release_resources(mdev);
 
 	free_netdev(dev);
-
-	return 0;
 }
 
 static const struct of_device_id bmac_match[] =
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index fd1b008b7208..e6350971c707 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -272,7 +272,7 @@ static int mace_probe(struct macio_dev *mdev, const struct of_device_id *match)
 	return rc;
 }
 
-static int mace_remove(struct macio_dev *mdev)
+static void mace_remove(struct macio_dev *mdev)
 {
 	struct net_device *dev = macio_get_drvdata(mdev);
 	struct mace_data *mp;
@@ -296,8 +296,6 @@ static int mace_remove(struct macio_dev *mdev)
 	free_netdev(dev);
 
 	macio_release_resources(mdev);
-
-	return 0;
 }
 
 static void dbdma_reset(volatile struct dbdma_regs __iomem *dma)
diff --git a/drivers/net/wireless/intersil/orinoco/airport.c b/drivers/net/wireless/intersil/orinoco/airport.c
index a890bfa0d5cc..276a06cdd1f5 100644
--- a/drivers/net/wireless/intersil/orinoco/airport.c
+++ b/drivers/net/wireless/intersil/orinoco/airport.c
@@ -85,7 +85,7 @@ airport_resume(struct macio_dev *mdev)
 	return err;
 }
 
-static int
+static void
 airport_detach(struct macio_dev *mdev)
 {
 	struct orinoco_private *priv = dev_get_drvdata(&mdev->ofdev.dev);
@@ -111,8 +111,6 @@ airport_detach(struct macio_dev *mdev)
 
 	macio_set_drvdata(mdev, NULL);
 	free_orinocodev(priv);
-
-	return 0;
 }
 
 static int airport_hard_reset(struct orinoco_private *priv)
diff --git a/drivers/scsi/mac53c94.c b/drivers/scsi/mac53c94.c
index f75928f7773e..42648ca9b8ed 100644
--- a/drivers/scsi/mac53c94.c
+++ b/drivers/scsi/mac53c94.c
@@ -508,7 +508,7 @@ static int mac53c94_probe(struct macio_dev *mdev, const struct of_device_id *mat
 	return rc;
 }
 
-static int mac53c94_remove(struct macio_dev *mdev)
+static void mac53c94_remove(struct macio_dev *mdev)
 {
 	struct fsc_state *fp = (struct fsc_state *)macio_get_drvdata(mdev);
 	struct Scsi_Host *host = fp->host;
@@ -526,11 +526,8 @@ static int mac53c94_remove(struct macio_dev *mdev)
 	scsi_host_put(host);
 
 	macio_release_resources(mdev);
-
-	return 0;
 }
 
-
 static struct of_device_id mac53c94_match[] = 
 {
 	{
diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
index 84b541a57b7b..cd2575b88c85 100644
--- a/drivers/scsi/mesh.c
+++ b/drivers/scsi/mesh.c
@@ -1986,7 +1986,7 @@ static int mesh_probe(struct macio_dev *mdev, const struct of_device_id *match)
 	return -ENODEV;
 }
 
-static int mesh_remove(struct macio_dev *mdev)
+static void mesh_remove(struct macio_dev *mdev)
 {
 	struct mesh_state *ms = (struct mesh_state *)macio_get_drvdata(mdev);
 	struct Scsi_Host *mesh_host = ms->host;
@@ -2013,11 +2013,8 @@ static int mesh_remove(struct macio_dev *mdev)
 	macio_release_resources(mdev);
 
 	scsi_host_put(mesh_host);
-
-	return 0;
 }
 
-
 static struct of_device_id mesh_match[] = 
 {
 	{
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 13668ffdb1e7..d4640479c338 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1507,12 +1507,12 @@ static int pmz_attach(struct macio_dev *mdev, const struct of_device_id *match)
  * That one should not be called, macio isn't really a hotswap device,
  * we don't expect one of those serial ports to go away...
  */
-static int pmz_detach(struct macio_dev *mdev)
+static void pmz_detach(struct macio_dev *mdev)
 {
 	struct uart_pmac_port	*uap = dev_get_drvdata(&mdev->ofdev.dev);
 	
 	if (!uap)
-		return -ENODEV;
+		return;
 
 	uart_remove_one_port(&pmz_uart_reg, &uap->port);
 
@@ -1523,11 +1523,8 @@ static int pmz_detach(struct macio_dev *mdev)
 	dev_set_drvdata(&mdev->ofdev.dev, NULL);
 	uap->dev = NULL;
 	uap->port.dev = NULL;
-	
-	return 0;
 }
 
-
 static int pmz_suspend(struct macio_dev *mdev, pm_message_t pm_state)
 {
 	struct uart_pmac_port *uap = dev_get_drvdata(&mdev->ofdev.dev);
diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index 51ed2f34b276..35f39727994d 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -364,15 +364,13 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
 	return 0;
 }
 
-static int i2sbus_remove(struct macio_dev* dev)
+static void i2sbus_remove(struct macio_dev *dev)
 {
 	struct i2sbus_control *control = dev_get_drvdata(&dev->ofdev.dev);
 	struct i2sbus_dev *i2sdev, *tmp;
 
 	list_for_each_entry_safe(i2sdev, tmp, &control->list, item)
 		soundbus_remove_one(&i2sdev->sound);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1

