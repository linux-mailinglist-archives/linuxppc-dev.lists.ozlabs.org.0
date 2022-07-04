Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBCE5652D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 12:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc2md5y2sz3bcy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 20:56:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=b9HQ5n7Q;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LGGCPI0K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=b9HQ5n7Q;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LGGCPI0K;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc2lp5SdWz3035
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 20:55:43 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2648Q3CS006304;
	Mon, 4 Jul 2022 10:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rKWKFgZCTlsm7UOXDBp+ZRWo2mW1/S9hQREhLCz9Vzo=;
 b=b9HQ5n7Qar6P0s0JwopLYfPi37Hzw56O6TbNz5xba86HbQ7bSqzPn6YTpQ7Q/rk2Lvah
 HzW7mehpEBrTEOIPsgEnXau+zyyR+XHbakiZvtMfyIZUUQOmpscp2D/28RTe8eNc2J1D
 TV7Pqlvq2G0fswGLGDzo3qrQcWp/ybtX9C5Pc7/E8RWhaf0lO95QmZAaDn4dNeT8B3Ab
 e1CzzraVALo7qJvYNSZSc0zdkgj7vt/KYPkHA7T86PrwVQBHThpj6+fcqdaFISveulG1
 kgWOiOJCv8Pom4z9MCnVQXaXFq2a0wrwu1WnQzbqVUCkkGLX5Df7jYWBHbwTYFaTkH+v xw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cm0k8t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Jul 2022 10:55:30 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 264AtLul004161;
	Mon, 4 Jul 2022 10:55:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h2cf7npmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Jul 2022 10:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD9IhmUYUcdmMT8e/Himt/kYeA+Yed5xRDt1+DbmOaQvtBiXNriHCvpE7csBzznrGiQvx6ps3d1uwvuF6BO9QSSxR2W13q4C7jla/h7vc55ueDfAGdBjPfAPSERO/GZ0Ru6Fe58lNrfWhja5ktLoVnPEiZGi6YkCJnjERdNt5RZk7nGOjikzb8MGAQC8UV9re2ICPol87iD9i6fbAzVTja8hNMmdHztbmwLd6wbzZ06Se2U6vGtZl17lM9RzIJ+K/apEhQiszYutaiWgveLVHcByogBDI4LfHuNPvvc1tudPcaBz+2vKcxRRI09mKfq6uiTDF96ZT7KO8jn5D6NWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKWKFgZCTlsm7UOXDBp+ZRWo2mW1/S9hQREhLCz9Vzo=;
 b=A+2M7Pl3bo4nbAgloVJikPhEgPNsDHwgEige+LgsuFPCeu+hTeA41tmZEtLoxfSZK2qoH4XYWreBoOUKrrKF3KuBEETG8aeoy03q/DLTUlnxgNDTX7nQdg2oYrRVK0Z5N0NWxp6uxdf0AozjV10NCzC378DQya8uYBwY72guHh/J7CH7csHKWC7hgLz9If4xYrw8p9dYfUIyESqAsuNMo/Q8kdeRfy9DASvgFNvChcz/2jTJvfOK2tCbaAJCJ047jdgJrASQOSeHfxNEpGJlMAHcEBIJ89VMg++LdvoCwnC2WniGhcaUDnWAPlyzZR45JXDVaBX8mVRfA5+N7ztq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKWKFgZCTlsm7UOXDBp+ZRWo2mW1/S9hQREhLCz9Vzo=;
 b=LGGCPI0K5w3exo83qxCg0bpziWhX6pr/gRzP6qbNvDSW60WxIHLrFqTYTGEftMr/ysqP0aJR7Zv+SoX7k98yAWT/R7wxTcM/ihu6fk8sP1F9EeWIiD3rYmSqjVTFfuvKr06WXUGYJmIorN6LutBQOQD3kE/s3jXPceMK9jLWSZg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3563.namprd10.prod.outlook.com
 (2603:10b6:5:154::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 10:55:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Mon, 4 Jul 2022
 10:55:21 +0000
Date: Mon, 4 Jul 2022 13:55:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH] soc: fsl: guts: fix IS_ERR() vs NULL bug
Message-ID: <YsLHCE/ttyl/OeHs@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::28) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff6e8ae5-8649-425a-869d-08da5dabafed
X-MS-TrafficTypeDiagnostic: DM6PR10MB3563:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YV5LEkJafSiWkSiQY/5VjkktZOssm1R3wTlzZOfh9iVi8VMgyV2XCNjDVkkCNuq1TQZ2ir1XSFU+cDcGlHcCUaIXKi+xVf3SdNcK1DE80DX56MCxF/2soinlOdJRPjzDAnt/wB7r+blKqTceDeYiZ8rJvfp1m+BlZ7nZPDozkW0IJBBnvq7ZlARPvB6KEueziCewrdX0FIxIo7WPSXXv7vcQ3JSrIPavR64RUkT7lG4HVTdzMF1shMeTrAKdBM7f1QahVKKoKso0S7ANEDCVA0vhe1yEoBXrmffGAFDAbERiWVAP/fd3+W2Eic1+HbRL9cOf8M+YT3KEnAC3b0GXVSgbVioobFhCywW0DTOGcRrD5nRIXPLt1xQZHkXlWnPJKhKvgja8wYJJrMZRv2p9Z91TovsxlntyS9wZYahFe9F2Em4WD4uTjs4ExH25f4FHzZRsldgkYPgDz4EyvFrMDfNonVWJVwZJhn0Fcyy5XL5kQGBH81DJqAZcjPd7WS4ep3NFlBf0GL9tiyTXH/zl9HZyNP3cbYwA/unUVOKMJLM2/mj7Caqo7bfj5si60QWaM2xj+8RZgVGnsHiRIjBaewoWvUCjCY66lejs50J7nC4mcpB1qNKwcmhSnxXsCRXYcVpu/nhZtIWlXK53zULp7KyWTihrQl+CuZ/Nxdf61JVhQV7m/n1LQVqPEhmtz668EA5HaFyv2pxlmtIeOcDi+cdCM0fIPVr3yASj9AsMsuvE+t0f54frhC2oHO+3oBjIqluNWxC1BSBIkhKAE7DCEmRVoQe9fG5mjW/e+e0Zapu95AmrRkozVzBQEIby5CRN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(66556008)(478600001)(6486002)(38350700002)(86362001)(66946007)(6666004)(41300700001)(66476007)(26005)(9686003)(52116002)(186003)(54906003)(6506007)(38100700002)(4326008)(316002)(8676002)(33716001)(6512007)(2906002)(4744005)(44832011)(5660300002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mEA9xdUzqenbkSNCa7jNFfIdTBY+MotUGFgsciZGBYRtEHwkf6UvfR0BoINA?=
 =?us-ascii?Q?kfXZB1lxm5qfrdHeOaqmZwNOqWrk4zNcDb702J+ANAr+BPI8DMIznVzzn3xu?=
 =?us-ascii?Q?iVRs2HydsNy54N2T3KbnI3+MCShQ/UhDdtjKJN5PbSBqrCM2/u/xLJg2IVnl?=
 =?us-ascii?Q?lAZDWtI+OtNz0lyN7vkSSq/gAVaHObyeSOEGYZPcD0Iq3vtGoSppzvJN+Yfz?=
 =?us-ascii?Q?sxQjxPlT7Lr3dLkMI8kfua266atGvhLfWoGfwevms8KQrCrFGK6RbyxcxW6v?=
 =?us-ascii?Q?bp1MpRDZ7spgWKT3FLlbq1QJnFThO0vMZfYxfOhSC98EewPOWhKrddxJR87f?=
 =?us-ascii?Q?RdvtqnziSMi2Ib9Knhtx6ciEvGtUVtnufwopqC+LpjIDQWzuqPhlfc+AZvkw?=
 =?us-ascii?Q?6dNMHzhuMHMxUg4z9F6MrOcJ6jmgpNcG3wYo2ogRKhQ8yOIuds6vTQC2wf5v?=
 =?us-ascii?Q?i/Ewx1MUieS7jALFf6pE0NM+POLGWZyldJJVhdXLe3fLC3YfS7+Qtgl5JlNu?=
 =?us-ascii?Q?c566E7YlUQh8HlfurGbtUnuMDmMl1lOPzAwES+1irbNNJGoK6T2Nl+gj/bcy?=
 =?us-ascii?Q?l9QWUBfp6/D/ukzfhOYVjByM+NCWwQCTjImAVyupA6l9mS/Vgibvw7VRqfpZ?=
 =?us-ascii?Q?T/ZNqJYTpDieXmXs5c4ijICpDHreXGK/6yhj55EhL+v5dKAgwLrfXRXOROIu?=
 =?us-ascii?Q?G6bRI8ywgdv8VEypLpGItMASuvI26cMqU2Zhvb81eCikvcmM7+GcHn7fHqJg?=
 =?us-ascii?Q?w1ewezfrNI86D/sHhGMAWWcXXdZSwx3AsPQnklyw4oaJ5Ys0dDsquY2E/yCz?=
 =?us-ascii?Q?BZsnUOqp5Dy3cKeyl16OCabzOTyDr0JtnZlXivi7vIykytspEn4oeyzCk+2I?=
 =?us-ascii?Q?SNEb4tsPTF8arIdzM2gHQ7z6Rl4P1+zf8GlYAMUcxEs//frf7/yTqLuMqLd6?=
 =?us-ascii?Q?TeDnIFm19c2WZKvfZqee+GAutA3wESSAQE/GtBdRPIvWqZriJtp+hjo/KfAf?=
 =?us-ascii?Q?cnIXpKrUs7Ye39aMQkrNIipNvxrjD6LcNA7jLYYqkxvkMX6sM5P6VqIdPh3U?=
 =?us-ascii?Q?QFYuO+/xBWEBDyt/adhDdO2bQRIoBhJGQJ45mUZj8hyikzDncFB79wBkKU53?=
 =?us-ascii?Q?loWoXBnfwRuctwyeXadpnhRAqrrytdrW5i6y+3XODwGOw7fF0zlsw5X3MKkC?=
 =?us-ascii?Q?m6prTPtXP/hIvQZkuW1JX0I5DW5AAhDa3P4sVNUu/RPicdFz1HVEpX8Ew1Rd?=
 =?us-ascii?Q?x43ZSO+nPQ6pI8UQtad1ouyI+w5mWtX+ByO2GxfqDoWAQIidbT2sVqpfCkJX?=
 =?us-ascii?Q?MbgWwf1t9BhqfA3cG2cDz6LpBzCOtL5/bbljtNRoHdzZM/ZOafTTYIy+o3DC?=
 =?us-ascii?Q?jfa3yMHE6HRNJh90fx7SCqYHJveX2MGPl8CAMdClx4zCHMWnb7wUYApCVQt5?=
 =?us-ascii?Q?0FPTwrdYq9k1WQ7Mjgi2rIkOYZfeJXgsGZJgkwzwJrPJu89umAMgvyJYtSh2?=
 =?us-ascii?Q?0MdWxEI0teLXwman9vv/2GzErbIV2yxWDLgCoWl44OAsMiH7+5HA+c76638c?=
 =?us-ascii?Q?4bbkGFc/Xj3Kjwerx/pkLJcSO+pHeidFVaLDX5bi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6e8ae5-8649-425a-869d-08da5dabafed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 10:55:21.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ3zKZSaY9xpDdOkhpM+xlppeWgUWWus2lFIhY1K5IleymyJQv7Q99wtGJjWt0vyHr8xHbu/NoXRKRE/gIBVM9t23QDFElPttjCYtb1kQ4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3563
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-04_09:2022-06-28,2022-07-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207040047
X-Proofpoint-GUID: 1B6VlqVfRgqzMmP96YQArdv7ZlJ9j5cN
X-Proofpoint-ORIG-GUID: 1B6VlqVfRgqzMmP96YQArdv7ZlJ9j5cN
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of_iomap() function returns NULL on failure, it never returns
error pointers.

Fixes: ab4988d6a393 ("soc: fsl: guts: embed fsl_guts_get_svr() in probe()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/fsl/guts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 27035de062f8..8038c599ad83 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -195,9 +195,9 @@ static int __init fsl_guts_init(void)
 	soc_data = match->data;
 
 	regs = of_iomap(np, 0);
-	if (IS_ERR(regs)) {
+	if (!regs) {
 		of_node_put(np);
-		return PTR_ERR(regs);
+		return -ENOMEM;
 	}
 
 	little_endian = of_property_read_bool(np, "little-endian");
-- 
2.35.1

