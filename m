Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EE642DBA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqLJ1Ymbz3chV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:50:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dx3eJWRa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dx3eJWRa;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjh07bzz3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG8uj8NBjE5PUuzn6Ic/I2wJdxn5/mJzy48ndim6z1trD8Lmi4GBfKgXXDLmxuIs/4g1fCKUSa2ZuqeQU4jHE1Xinpr3CwIlEHiihlpmErHywIrvyFCBIlFohjSjNSd3nGmEUGwm9Ou5pygtvweNiQQ9aFl2hBudTdnoYtPbAI/Ec6dkNQDW4dpRABX+zhrb6zygJQJJU/QDdtZGcHbXzBiKQPkH6C6oaTsYvB6DzVg7qsraTIWISBfl01hKdq8w108YjJKpwgiAWLeWuMFxZ0oZwgHSIQbVMiTpdsW0bo/e7/v/bQCZJVFUQjGmeaubgUUJYhNEq1QUct6VMRNprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE0/eQ+6q+25iqD5ZenU2/gHmtgukmMINoE3za9MCQE=;
 b=JD9x2ZO7WGaw9uDcFTbKoNqcSNJbIMdCHH1TMgTgpnyYslO345m8Fjutjy2Zn1DKFpjUTZ9wioL2uATH7+F6oMEuDkzEcDvOCkqDxhsbGfW1urFOQZMppq7lTdu/jBK6HDq7gobGAp3HFSQ/8/DSj6I9Spmh7bthg5a55BUapM2RKjv+YPgJ2wbV2L+bnQM2tkTiZtDMmj4bc590+GoOA5l3ZPzklGsghyzIsXmKor2QDZej9YE/yFCw35AePw4nK+qcz2/5dhw6Ff6Q6+WPIUaK6uqA4mCWtS8X60fr0oNvgsu8A1SEbR+Pw/hfAVPfCgqJ33wNfNljG/d/WLhAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE0/eQ+6q+25iqD5ZenU2/gHmtgukmMINoE3za9MCQE=;
 b=dx3eJWRaBTBpNwCoHkYi2RXXcegnG2VYD8lU60lzx5bw1EOyNycZqgb/9eatsqH8hdTlupt1L0Et3uB4zfm87Dm8tZPMAFSluMDbDeQip6DWY6laPJSHk61AmrNy0yvc9uC5YtjmZWULZf4Igy2+48D1A9bjK+e4soZ2AV8if1GyuP++c4uDx+0GNhgCcTsif/w1z3gtKkPoeOUGEGCdZxxxSc8QkETrTgeyBosfKu686VbZsjccfjoLNd32GJC1BvvwkxwxyXcSpTCS4R5r5Ll4DEIuA8v4uS9Blf44Lx+/+iwKf2MHcmydM5VyBa16rXTMJOK5z0nK6PP/aglmMg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:07 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:07 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 2/6] macio: Make remove callback of macio driver void returned
Date: Mon,  5 Dec 2022 23:36:40 +0800
Message-ID:  <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [xkiGoP8CYtlHfMaNN+v2tHJgza4DLRGN]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-3-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: 192953c7-e272-4eaf-ac9c-08dad6d69148
X-MS-Exchange-SLBlob-MailProps: 	/OoUGmN/RpVKD6y7RJd2fRTadJ6Pq1otARSEbI97kVRmQMivREdx/fj4xvoyz2Zq9680D287XvcJfvbpYLWgzmmRjngDq0kGxb/k5K6aOfp2gz1qD+4htLUHYy4q0uG6RtozbuMbhaPV54ULJjuqx0X/uqMnZEyOUq1/s2fYGDtf/3uVSMEisii35FvUzi12oL4x/WSREC0moS45NWFGeif8HLP0FMgivzl1phxJQV6Xiy54UqsasQPza7cAhpw0Yi45OnLh7EtTtBo4qfqktDg4rpH++FaEBWI+mKxMZYziAiASW4Rqx6JlQE+0qKNuF/cODHfxLAYMTR/arsAlFcUKKjVyC6szIaq6q5TF+06W9CT5D2y9G6DcypuHbgq8KenMt7CIqt7y1NH20Rhg0wDQh/ULFvd487BWo1st6EUra7IyKKRRga+Gf226dSPsmwl7yyXLWfkHR6hsqgE+4II6VnVGnJ3bhXisgVHKWOPC296OcJipkalvfT7ulyR6M1YObXLAGxGROXlc02+XLIUAYZTA1zNPlQnFN1zSAY9kPcLd4YOx1Pzx2nU7obCOarZJikcBhVBRby2lLi0eWnEeTa0rt047HMEzgbwsn905UGRUJKyiIg/PEn8Cfh3/raGhf11h3VadG4Oe6+I+e6i/YY6bXFgRdCtJyDXIVZ4TzYE2lm7vRgyPl/2HyLDZtF+xKwZyn+R7hfCiRcNlqsTsjr5zCWw5VrwxxiV6Op9OjJkFj/CrZBzoJ+z/E251
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mBT40HvRhGQ0coBwCX43Ch3gb9SuzktfgyO0+BO0iqhKuEqM7S+gZlMSg51OAZiGMv5x7EbrqhtDJZUhP8fgVj6BBSW2UcSvpwwTnBo4E59dw9dgPHb8G0dzDRzCA55U177yvnf6BuHb9wyHIigIkNMn2bei193EVo15Gi7DbCYfdHaztrI3OyqThhvDWV75dPuLmdHjZWu2xjiR5wvNF48pv7uNJgxwlgZXsCPKqqpmMWHcUYp+AGZ8B9K/vX5vsERqC9QQOUfud8YFUHmYaoMwgIA4awKCBrtTzR/MzbJLuOWkTRcCgBCV7Cn5+OA2qPCeDXFfalVpuEYT6BH4bYofviJolpe1X9O/iyix6sz2G1nprpxQbiruGyDXAWSlK591weGFhsdUH5a+iINRjAPBFwV1L6a8E+zm2Vj9WggBQz1Bqdpb9Y7h/M1mao1njsrTjK5VuBHVEy9lMEXn4wYxawE1E1LEzqEm11mD6sZgPAlPJ9dUhx/n8PFH2SqYuAFzU+rgRkVcQnI1xdIyOXaHajS7wQ4aU24mmrnsGmfQL4vSKCLgyYO9VLJqgtLXTBbQN5YgszMIU692viVQ4AVlbXD+qA4UM2vvqrWLOLHMaAvr7DnNi1GUwXZbJQiAsURY9XMAyR/FeJnAf1ftYQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rQg4ccoCdqEz63snTfCGUwVdDcppMyb7YVU/lhVPvlUYjOatj8zx6LwhbfxY?=
 =?us-ascii?Q?QSSmemqqzUUJfeR8YUjNVVDyr42vgAa67IBg1iALDNIvIPLgEL9lC9wvyCiC?=
 =?us-ascii?Q?oTb4DREah1ZjSCbm3j7HeVj+4jLa4lmHtFEvMMvzP7n0xWyN5fzGRd4I0hfF?=
 =?us-ascii?Q?vsd33pcMNrPYRQTB0YR8WENQtsDNtP45sLEgcEcnkfssvwuYfI7fHYAFEb6R?=
 =?us-ascii?Q?j9gy3tOn40nBr6zZDby8P5jiszu4OABXuXpb0l/lt8CDgxMtN2l9KfAbuEUK?=
 =?us-ascii?Q?nhC0AD9Callt7p6K9FItkSzkNmk6C/zJCFdCCJ8QRYub8n4lq92X/o7drubk?=
 =?us-ascii?Q?XyrQTrZ+5Nk8bVTzQc2qa9jOxMzPUyhEGSQQB6D/J5FfjC5Fcufk1mMBdDtP?=
 =?us-ascii?Q?5Drk56dqpzW3fVvm+flwBEvNzQcc8EN5cdt4X3ePhBdj/YALGj+gY+Y1ifUy?=
 =?us-ascii?Q?PE+aEEgUwscI6C689R1Gz9MKeadBC/7zGhP8a8vlpedhIaZ0zPABqkgbVXQ0?=
 =?us-ascii?Q?p2i2h8tVEWSusu30p4FOuCpuOyQfdI7icct6WvWMcLDwLX+1hEP8Vj6L7G+J?=
 =?us-ascii?Q?/LvZuuIoy9sOAIVcMhp7708o2TqSyBlHdQceaNljjHRpQh3Jp97zdubsaqsf?=
 =?us-ascii?Q?PfMk14HHPvqfuMmee+5WOvkemrCjABalSTPPBLiFPxyasdJBLMtyaqQxtWSn?=
 =?us-ascii?Q?+drueudJ7twriHfwaH2gX7iNYtLdCg/iOLvwvhIYn/FHMDG+eIWZsOmDdw3z?=
 =?us-ascii?Q?926DsSq1VeneXGBZCSrbVuq3lR6EfY5AsPVdTmxkjKe0F4SZNgNBeUNBbWur?=
 =?us-ascii?Q?yVAcUh0nMr6Jzw9O/rF3PHTs1L2q/JsdGZQv/Uom+wRInssmOKjS42SJExr+?=
 =?us-ascii?Q?Rf2QDTd8LMmecI/zwu9By4Uuxl2Yvenkct6xfpW7kIcXZmWrXfJzGhlPvJaH?=
 =?us-ascii?Q?/tjmRlmWhkyH7qaZpADJEq9Sp/6veieJYR0To5t3+79m9xAgzPjvesrdGqB8?=
 =?us-ascii?Q?sQD7I9GK9zAA5cQaYt5DaUy3f/rV/CxICWHOR8MzwYO6hpqzaM7tP3cHkJ8/?=
 =?us-ascii?Q?UAGvkxnr4g7w9qF2wovwJ3FzVjfWMwVN5JI2rSZAJZtHdtHnl6kR5V9tTqsF?=
 =?us-ascii?Q?SA4K5iwHBqtj+uBhMpXgXRVBFgWVoHgL5ZjMJ8rM11XhkHfsit4293mcBfYm?=
 =?us-ascii?Q?x7nvAh7dF79tMGy97eIgn3rgJuQuyxYhTxcxx2xwp2qFYuVKomuKD4GMxkcE?=
 =?us-ascii?Q?8D4NT8vvglovbn0srcEcODNX8raPQbdK42TzCKEErQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192953c7-e272-4eaf-ac9c-08dad6d69148
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:07.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1787
X-Mailman-Approved-At: Tue, 06 Dec 2022 03:48:37 +1100
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, Dawei Li <set_pte_at@outlook.com>, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit fc7a6209d571 ("bus: Make remove callback return
void") forces bus_type::remove be void-returned, it doesn't
make much sense for any bus based driver implementing remove
callbalk to return non-void to its caller.

This change is for macio bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 arch/powerpc/include/asm/macio.h                | 12 ++++++------
 drivers/ata/pata_macio.c                        |  4 +---
 drivers/macintosh/rack-meter.c                  |  4 +---
 drivers/net/ethernet/apple/bmac.c               |  4 +---
 drivers/net/ethernet/apple/mace.c               |  4 +---
 drivers/net/wireless/intersil/orinoco/airport.c |  4 +---
 drivers/scsi/mac53c94.c                         |  5 +----
 drivers/scsi/mesh.c                             |  5 +----
 drivers/tty/serial/pmac_zilog.c                 |  7 ++-----
 sound/aoa/soundbus/i2sbus/core.c                |  4 +---
 10 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
index ff5fd82d9ff0..f641c730c3b7 100644
--- a/arch/powerpc/include/asm/macio.h
+++ b/arch/powerpc/include/asm/macio.h
@@ -124,15 +124,15 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
  */
 struct macio_driver
 {
-	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
-	int	(*remove)(struct macio_dev* dev);
+	int	(*probe)(struct macio_dev *dev, const struct of_device_id *match);
+	void	(*remove)(struct macio_dev *dev);
 
-	int	(*suspend)(struct macio_dev* dev, pm_message_t state);
-	int	(*resume)(struct macio_dev* dev);
-	int	(*shutdown)(struct macio_dev* dev);
+	int	(*suspend)(struct macio_dev *dev, pm_message_t state);
+	int	(*resume)(struct macio_dev *dev);
+	int	(*shutdown)(struct macio_dev *dev);
 
 #ifdef CONFIG_PMAC_MEDIABAY
-	void	(*mediabay_event)(struct macio_dev* dev, int mb_state);
+	void	(*mediabay_event)(struct macio_dev *dev, int mb_state);
 #endif
 	struct device_driver	driver;
 };
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
index 334de0d93c89..8b37ac1cc3d1 100644
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
index d0a771b65e88..b214524a5964 100644
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
index fe2e4ec423f7..b8e2279cf60c 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1509,12 +1509,12 @@ static int pmz_attach(struct macio_dev *mdev, const struct of_device_id *match)
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
 
@@ -1525,11 +1525,8 @@ static int pmz_detach(struct macio_dev *mdev)
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

