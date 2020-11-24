Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1C2C295C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 15:23:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgR7w1xb2zDqcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 01:23:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.20.73;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=NuCjJqot;
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgR4f1PgvzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 01:20:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE/eJThmzdwyCkFPD2mRkoTKakRU+Yo7Loj1jKFXOBvnSkJxDdO0MBfJlaZA1vHSHf5OHm+YQ2o6Kr1YK8tsanPop6mk5bhl/8+yLwK/GTKduhHzz3yalexgUVJkbQ7tF62UXDeTttEHTxjD8ThDpW2OzWGbiXLz7xuWA0ZjpzqI2JJOAwde2qR7Af+LamDnXRCwjfiLgZGAZQghsCd9uAuidGomycHQPsZRXcdUUjj+s6RJJT6tFzH/nJRGl5xAySdxvO+y55kVtHPvdK6DhalOnPGgDvEe1p495bD8d4fVt/OA+NKJOpeIoiLSRrLLNVRIyyM6Cwa19ENUsjiotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj+w74wtYN25gAEpHmTY5oeimflDDhYidr5h3+1uHCE=;
 b=YA3ybpuqOTrdk/w/w4Q2DcWKixIV4rSfV4M8dbdA4D4nLTqecCUbJ0FvrhXjWTVLPww+juzuJtQh6ZjJsEmY3J0xpO2uJRaQy1DeO2UV+nwpnXIOZIKE9RbFeQ64BltoiRBwptqsvj6JZ+d/739542DWccsH61pElcxoYb5WR4z8dT5XFCYBO8fEutmjJOun4rvjW82yYCAaYVx+R4pGjj7T6uWoByEjf0WJgAofnRud1Z4JOi0SeXdLqn2uuxEI2HRwQSerPPFEtwwQsDuqxA2ONUX7LRFglhlFUCTjfinHIrImRF7d2xCtPg5jgTfdqzeoKL+23rOdITkggEIW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj+w74wtYN25gAEpHmTY5oeimflDDhYidr5h3+1uHCE=;
 b=NuCjJqotKjc58EsKuaq7D/as3wgYY5VnlKWDcGlXLB4ZwNdvxcjMBteaxoGg1WWeYdtjqyO6pcsCmGpnCvFKk+mnl6fUg0tVkZsRqRJIJ10E9DdK8PP/wEcR0t6l5R1vAL9wpqT6FxSmpnTt9/NpGUlVaFfBihuKPK7NJD7Ncbw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5984.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 14:20:09 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962%8]) with mapi id 15.20.3589.025; Tue, 24 Nov 2020
 14:20:08 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: fix potential resource leak
Date: Tue, 24 Nov 2020 16:19:57 +0200
Message-Id: <20201124141957.20481-1-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [188.26.42.16]
X-ClientProxiedBy: VI1PR08CA0095.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::21) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (188.26.42.16) by
 VI1PR08CA0095.eurprd08.prod.outlook.com (2603:10a6:800:d3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 14:20:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 867a952b-a8e1-4791-1ee2-08d890840c1e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5984:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5984ADDAA20FBC28CDB3E087D3FB0@VI1PR04MB5984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMHMS4xUiMpFLVfYJmM+mF8N2oXN4MuKNtNbPV4h28/pWL1F9JyuFxv1NPyD7eI5MhWfE743PbPMsitH9zw5Q0JL1VxVmgFRe1YeCeSBiPZk7tYrOxfZRleMbVnE0o5Zd1jR8J8bSjJfrpGptNsbq1V4rN6CEe9g3ocy7TO5xkRkQn7yaNKucPzntaMGk7OjIjuXL2KNr1Tayr4DUAL9ms/GqtN7mxv6pFead9eTSHES0DwdO/in3ZazuZNBZQAy+S631p7QCmE9H8cidlMR2rypyXaObQcjKD/7LAjRls+klel0dSw2aayZIjWhoxpqInFSTwBGgNUmX243XWLu7270GSVVh/fZd5K8jNORSfsovaWDL+Ow5jHWEMdbWH5Ojq6ybw/2ag6/mEf9hXR5Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6506007)(6512007)(2616005)(956004)(66946007)(26005)(52116002)(66476007)(66556008)(7416002)(6666004)(4744005)(6486002)(5660300002)(498600001)(186003)(16526019)(86362001)(110136005)(921005)(69590400008)(8936002)(4326008)(2906002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: agQvQeo+FmwFwkOgdHcSkHjSfV8aHfuWp1JarBRphbcY02LiwikyKiSzBQWVN87/cjMZGg37GKwSYdug7daUJEAdkAwW3pLnv/vyXxOi5F7sFPhFzSQh0MgotxwgJ+GFraGCBR4jHJi1axdwgZV25g5ySARQ/XhfJWj8yx6mTdq9GHCUtYg2MgSL21zYorOiC20nm/PZG07ytWKqjtmRH1LejyDnK+i37EBUYnyEI4Rf0/kpbQ/QO4ft42RfH2YHLlEOz7IChBRgEQKra9MyrPcbt/kRAyJhr96RTIh2iBEf5D0RjChztNFte1a66PcNtXAbcOJK/ST1oPnfGs7/cmt2YABj23xXtmvrh5YaA5RzG12x66LNSXIpngfA+MgIhQvw3IE++kxg+L615se8TKkI8m/0MoB1wlPSU/iwkC382hb9GDweLlViOVJG+3VPr3acsd8XhVOrFMQCaWtVJ6s6lGLKfaFz6T5LiltMW6iBtsD/EDKwyEuQC1o6ruhIQ9EblMtaR7WIPvjCycKiJ35dTqqyzRZ/tD9DA0m8nLnZh896xv3XKxz1f/sxwkJ68wtap8EAb2KZyiw276S+paTkNd3GXuCJ3UMNzaa2OiOb6QsHQkG3HHMmmf8pU5ElAlTb95W3EKyT1wC3xwx1utb0TRLKqLsluZS82KOjvYFbLn3/lp3LJATl7o0A24ZDR5J0mf9zViUjeMhsHv/7Acn9Ep9xNb4Sh7VVLrkY0w1xQFdOmdBFXT6QQlHCa/UBWtJDPACkjdw+xRsNJS5+TS+r7H5bXvR4F4ayBcqxphV9TJY3Rp4I7oNt6bIJPlBw06ksQ3HPjxr6ba7kSPVTlPIsenjiXM/qRNiy30jNOJZYsD2I61VazWlSLIuW1h1D3FS4e58/amhl3eHE/C1HYQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867a952b-a8e1-4791-1ee2-08d890840c1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 14:20:08.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq9NwSI1vM1VBkRytpCZulntE2ZNdsW7aNZYTlY7J8GF9rQN79TD3rsvh5JvqBDll8ofbneeUB8dkIPqE23nig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5984
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
Cc: Viorel Suman <viorel.suman@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

"fw" variable must be relased before return.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 2a28810d0e29..3d58c88ea603 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -706,6 +706,7 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 	/* RAM is 20KiB = 16KiB code + 4KiB data => max 10 pages 2KiB each */
 	if (rem > 16384) {
 		dev_err(dev, "FW size %d is bigger than 16KiB.\n", rem);
+		release_firmware(fw);
 		return -ENOMEM;
 	}
 
-- 
2.26.2

