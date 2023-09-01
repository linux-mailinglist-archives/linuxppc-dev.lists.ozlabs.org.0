Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1746790154
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 19:21:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=aZFxO66D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RclDb55w6z3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 03:21:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=aZFxO66D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:7e88::80b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=mirimmad@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10acsn2080b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::80b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RclCf1v1kz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 03:20:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCDFvsB23UFQoUHUNl0yjZOI2SMO+FGK/IbMs1hj8+dDkIC1Zt5qvJs48oOPXFbhel8d4eV7JhA9mSMCcLCHE9J4Dp5QsxF6REPR62Bb5FbmVwG7jftw5+RSa30U6m3yNpN87oMTfzz43GOZtS9JCg32I33pPEcQtAB9oPxxZr8OMraYM43sew3wiziltehSih0BPQabv2QzM/o+7swdZaJAu85EKkqHpalQoJe/z0udkv5bYSkUJE6cE0LpYEpv2c6Pu/l6e8+m3BhFUtBLq98NZSUkcIj5m0kSWj/Fj+ndqJEhi+TACO1G3sqQXu1QOI6Un7937ycL9wsMLfcHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9breyhrL75wDpZLbXVWtXdSvRbG6KendZ+1/6qc/P98=;
 b=laEn0AETTwl0oMjhMSLdw03ptcSRmF1wZv1vUfTYq9C/gmZge2ez2HC/G0i9aFw1S7Q++ZojVBefrYfb57OWz0M4MfAn3VEORbzGopPz+XzowROyp+6kAqztIy9+YU3Ptukm+PZKDL+gOO0McWHaRLaRPNHcP74QgVRh8RGQ8k9JJ0Gpf4IgQBfS9PD/bKwfqm3lgnRaatb4NokF5ccaG/U25AZTkwSKYuwwvSl8SDKva6LmzvNvGkyPG5vEbkNSsTc88BnwAUqEbHkUsPbBaRJ/IkVAelTDvJEYDk6jxVnKPYPtrMW2fxMlSHioA5tdrWpo6xv2GO/lFoXh7cXj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9breyhrL75wDpZLbXVWtXdSvRbG6KendZ+1/6qc/P98=;
 b=aZFxO66DKR7/CLOdJkGMT+FtwPE6DIimG0Ak8JNeo3wW7Bh7VIGFxyVL4hEexGs8FcJZcVgSXQQaFcTHPPjVUSTgu0t2bYKWwrgd13n75Eo37Cyu6mSjoGcqa6adUzmmuILK0LuEOLrnWwKyGkeG72vsrzQhMxwSiL3JjJPjNawICg1P16y2HYHQGSyK01l1Xl0yz/wab1KKcThrpr/cGuc/4EbCH2vGL9jubg6tp1WmRxclN/LMnIvXL3gbHCayy+xGLC2ApT4EBp6vyuxbx/APX9YP+NTnLPeIzGLbtP+gdc8BJSahhfa5YnmwtqdYuEserEK34wllAOlF/l/EDg==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 17:19:52 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa]) by CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa%4]) with mapi id 15.20.6745.015; Fri, 1 Sep 2023
 17:19:52 +0000
From: mirimmad@outlook.com
To: 
Subject: [PATCH] powerpc/powernv: use appropiate error code
Date: Fri,  1 Sep 2023 22:49:12 +0530
Message-ID:  <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [qaoOnCIaci6F7glq4M9BFB6A5gam/uhi5iyllV7plUW1p5aKRYEjUHuFNuWmTMqZ]
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To CY5PR12MB6455.namprd12.prod.outlook.com
 (2603:10b6:930:35::10)
X-Microsoft-Original-Message-ID: <20230901171913.24677-1-mirimmad@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 34083b1d-c169-40b0-de9e-08dbab0fa6db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+e93XboYK1MPesvocZmqXgCukVgaXEr+C/PMOQ+C0gqK8luYhlxWF62UOw5v9Esr5g8t8S7NUy/0xEPbZVgxH6PwgTRBVZAuDzSurJ9uQCcLKp32eByNhyzc3o7cvgbfAJGvAt25Hga0k9MWXupD8T2m8PwJrUkYJCCBi3vepAZtpcvYkTC78sFS20msOlTSKAqE0z4QeN2RCL8Fm949LsCp9FhLDolIcm/z6NqOUi9TuP7B+4nOgwJcFj2P+ZE5dP0Ae+txAeYrjUvEV7I+519CwFo1PoHNylgbm8S65hgn0zw+vcm16Ah6KiXS9cjamUEYaEZ9vnTx+DZTU4DE+RF8hszuU6KJ+OYgowUrE3xSaSNMIwxTb/HfP8BLvQTS7nqSwDLF8rk5vaELTM166jzSReFDVnV0/Nrd4roG/OUHELIdtfUVFrpF/3zeNOe3rJ7mFR7+uPjsdTndaniL1aaifEf1Y06Uzmtck3Hun8QboeuUhJvL9YukAQcv6vityQEpgvKxiDI6xR92R6lBogujptrX4mTKZk6PQcu01s/4aYPFH7agNNQm3x9ZggcA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FfU8SiBREa3goMgyNnpSsu264lD8AGuUeoaFppgjLw3MfD+Zw066DsEVqeR3?=
 =?us-ascii?Q?u4pl9wHzBggFFIWU8wlpJ7IFabevvg7Q4TpxK64RNpofoi7xtPlCQG1G+Un6?=
 =?us-ascii?Q?Inod4FR5WNKBa+RMu/pPcU8yQNhhjc8o81X5pN5LT+wh7t9HWbbhCO0Waqsq?=
 =?us-ascii?Q?krGt6ljtW10ICRbMxia1qRIFBC+XdXPFV/4JQRJAwO+xwHpabvZWySVBY9m0?=
 =?us-ascii?Q?jd7fRb3ahyoU0aCF9BVhvjiJA2TcLTLoW81mVtEIyrUiEHELbcpuaUHuIND0?=
 =?us-ascii?Q?mmRddYmdsyDpPAZj4bt4GXfmhH+FEuyQwxjvbsS+kgdsBLEkTpRbi0dSYeQc?=
 =?us-ascii?Q?q86q74OMpHHn9kYrZQ11mKYDnrCkWc9mtMeZxD/voEK+r/Q2np0Hm/kMscC9?=
 =?us-ascii?Q?DsnlgltCTE2hm8ElGbfMZ+yymtNHSbnSDFNX/qle1g4AXuwE8hnsDP2Z3YQz?=
 =?us-ascii?Q?7baiBolkcqD/HSL6KJSq83+13kVr/LP/7BlsbNd7MbyrdEckQ8xdo0xusYFi?=
 =?us-ascii?Q?Nz11023mjIaMSthtmSyZ+6wLHbSXgBgLfUVH2Ow34KuQovtVQ9+BB58UfsSd?=
 =?us-ascii?Q?+QkuS/lU+9USYgVizui5Nz3cCc4fcgeBPLc0vFlQwqA4a99TxAYVvQgn5jv/?=
 =?us-ascii?Q?GGyrMWbnye+tGJlOZ4sGcfxvdgTb2VnevbWJHQ/+YN6FuwAQZhuU+LBswzt1?=
 =?us-ascii?Q?CUgtcNxIX1Hpkt69i4a6IQxRtNsqNgas268VNApuxYzVmgeFysiYIX349CHt?=
 =?us-ascii?Q?RdywjMNjJ0drUSHI0k2bHHMZYvk0ZPqWjO1PBJUuVg1WRKJM6rlFnLMGAtbL?=
 =?us-ascii?Q?q4Qb5fxtlevFU7qUqkVLLgGLgKzW7v6a9ELApYzadwWoSpx+qn82DTCNnRzw?=
 =?us-ascii?Q?ZFb+TuuWDuKMbE5rLl4PxCN6lL9Ejtk0CT0fCExn/ctAPhYyCsrX3zgceLr8?=
 =?us-ascii?Q?jdQgEc91Bbe01+/bimMQo06YyYjJaj9tAILhsvdEoQ5DSJXF3wnSt++WNsEo?=
 =?us-ascii?Q?Oow7WZoCH2JU3gZuMAKkAwfjOtv9HuGat8v9Vmz4HGFGlJYMDtyXuPepz1+T?=
 =?us-ascii?Q?3rbwHbmZQnsXBNkcZJRKmm4VL7g4dlPR57vG4DRzJfX7YDgSaBsbf+udXeg0?=
 =?us-ascii?Q?aEo0jCTAcy9qMWi/DhIPBihFx1ZeTm7h0rg4hRx+ad0uevWKylW/en2oU4RT?=
 =?us-ascii?Q?vRk0MhI+3f9jyxGXy/B2tnaBdORtkJ5z9pf0xvJe7hb+VhHVlfnKm48qTUFH?=
 =?us-ascii?Q?4mI9PA7U+plwVyaJYc/zH17a2Hp3TpjrZsGyMJVKow=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34083b1d-c169-40b0-de9e-08dbab0fa6db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 17:19:52.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
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
Cc: gregkh@linuxfoundation.org, open list <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT" <linuxppc-dev@lists.ozlabs.org>, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Immad Mir <mirimmad17@gmail.com>

-1 is not a valid error code. This patch replaces it with -EPERM.

Signed-off-by: Immad Mir <mirimmad17@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index 262cd6fac..ce4b089dd 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -171,7 +171,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
 	if (IS_ERR(dir)) {
 		kfree(ent->path.data);
 		kfree(ent);
-		return -1;
+		return -EPERM;
 	}

 	debugfs_create_blob("devspec", 0400, dir, &ent->path);
@@ -191,7 +191,7 @@ static int scom_debug_init(void)

 	root = debugfs_create_dir("scom", arch_debugfs_dir);
 	if (IS_ERR(root))
-		return -1;
+		return -EPERM;

 	rc = 0;
 	for_each_node_with_property(dn, "scom-controller") {
--
2.40.0

