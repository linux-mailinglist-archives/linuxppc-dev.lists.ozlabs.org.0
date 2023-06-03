Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE6D7210B5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 17:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYNQc3YmQz3f0D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 01:02:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rDFBvqau;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:7e83::816; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=mirimmad@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rDFBvqau;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn20816.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::816])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYNP51Y65z3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 01:01:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czREagGwMwnpuVF5oOSrPMNxtg48pbB3wvY2BDHM+DsbKZmSo25NfJVrKC3JTcxeit3bTxfecr1AUUiXcFHkzhmXrw10cuYSklUSqt+La1cWyhJ6iEpgfa9MwbGDeSnjDEraUMnFAEVnLC+2PiW+rOEX9QvL9FJdHBG+cQx/rBh4kRKkOgmDQRGNdcDQOIG0H3bTuWYJdkg0Tn4YP2ghZih6NqN+IEOuWZ45rag0UXv8VBNu3BYS2VHfZ0coP/F5VPSJsr/QId8HLAu2njUsgGRxR4gKW0LJrV0WwnQ8hAOI/QMYQubp0lU9clobopz2K1X5YkmN9Ry6/2SrauHbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqCsBM8+/NDPtklgA5tO3HD6BVKPrK4A9rNVt3cJSds=;
 b=T+8g8AjETmmLxRthLd9MXJ0URqSkEhChBPKoJIWZWbCFvlDBuJrF22HwfUZC21dVxaIeUo2n9sz6zKjUTaP3Tg7pYWhIIH04TZY9zVOExUxAPQvN/gvICV45CKycC4TeiimOuhPk24ZrrrWDTKyjxhnPDOs5Zj0eWHox3qgqQqe4IJGR3ECNUd6irynXZ4T48f0x7s8z16mISptzTAKMFti3sVv88WlWpcnAvVOqaW3YoE/l25zVub8aaFSsrPn/KJumyWU+sbaO1ogr3mLj5WOW++cSTolj8ZuvpRrXzeKu7JfVN9fXCk6QL5Mme1y003oF1iuIlw/R29hOpKR7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqCsBM8+/NDPtklgA5tO3HD6BVKPrK4A9rNVt3cJSds=;
 b=rDFBvqauHkI3v1uce7vLRquks6z/6bCBGvqS7B8SqK2IV934apl7P3CsxrsD8Xmfpmno6ba8Vj5AnwbQUjIUXvKszo4w6UyBvRLBjeIGIMSHaoGSxM7nYyIagvjmPVIEJe4HuMVC1CnYAk6NLDUSvltopZFVgUXKKT4LsM10qKx4QGAl6HMZIgjKaBP2xX3qV7Y6HNIdxdXHMzyjuP7qdVv/VTIJzYE8Rl+vWu55CqHj+TlDUIF1UZE8LKv55I1Ss/TOTyiM2dpnbocfxoKmfJQSz68FILgbqK06scY8eD3KzFGTIVTkPGit3nwm37O0xqgXtVWbp70QP+PUa8g22Q==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Sat, 3 Jun
 2023 15:01:18 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::a39e:3607:29f5:9cdc]) by CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::a39e:3607:29f5:9cdc%4]) with mapi id 15.20.6455.028; Sat, 3 Jun 2023
 15:01:18 +0000
From: mirimmad@outlook.com
To: 
Subject: [PATCH] powerpc: use appropriate error codes
Date: Sat,  3 Jun 2023 20:30:43 +0530
Message-ID:  <CY5PR12MB6455D90BB75D6CA26C00E873C64FA@CY5PR12MB6455.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [1ua1v+cdNo9QRNu6smC4w6KBhF3tSskufLzEZ/+enMzVrRKCtjUBAZut/UUuwq3h]
X-ClientProxiedBy: PN2PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::21) To CY5PR12MB6455.namprd12.prod.outlook.com
 (2603:10b6:930:35::10)
X-Microsoft-Original-Message-ID: <20230603150043.16779-1-mirimmad@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: 692e1597-66de-4438-bbe7-08db644362a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QI54r0ysamcVtO62bkw6r2/V8j25ISPODtxzapcHoGcNW9Yw6TvEeVHz69JPmzy7g7paj2pRXqzJndLzd9Xh9O4zPbj8RIVHF2rLnWLIk5hUtYjvR8a0GDyVtm7oy0TwoXkh70kol0W7eB5ggp5Ow+Is03eY6zluUWWLrcx/7XPnQf9FG+zZdMEL219c4A+Gjb8qHCW7XsoNcNMkuCVv6d+F4B7sn/g2eQCskFAdZxCzO2+iobsgzE3acCU8xXEXQKRYS4IGlIna5jocp7v2B7nz7YUhp6Mqy8eyVrg0lvNWpHnKiA97j5zL5vRU9v3eplqxhfYbPjr3Xnq2ZHJViPkXa9sbb34FGS4pKVhhjFByNv9fwCg9poF3vZ8P9E2SflRrhD8wgEkwcjbygRz7y73AltGwW+X+tF6131DdxXD0FAjEpVuVlwuOvDYES5cK4XJFYjZVgvHXlo4GDRwB0VKI6gntcL3b1S6DD198U4MTP0VNnHhXvEjWJB4XuR7llsHHSNSnSkMUX39bvF9kwgKv+IlTNDkzRrd1bT9asblZYKjoam/Wz5aG6tb4k+2/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/p3XS6EHY643qOI4/v9+kohIYb0PljfN/2CJNpSNZjAx9r8eNfB8ajbk4O4P?=
 =?us-ascii?Q?XtlIxHHLFtp82aa2VxzRlZ1u7UI2S0mxfkQwDEEEdRSTQt2mRVJtLnBdCxrh?=
 =?us-ascii?Q?AlHplLcB6jV2GxtexPu1lhvgoOr1yO8gc0MHbhScrTtliBt3NkUSgsFmCYXR?=
 =?us-ascii?Q?9XrzUnK5BFwlTVpqNuWTmyuKGferx/V8skTfTfGdVoGRgqMF1gbWO+QH2kb+?=
 =?us-ascii?Q?UWx6hu2O9N8KYNoQeeCH4yprmYtPjWR5Rn4uqA8GWq+4qxTAMuqxLYZFjunf?=
 =?us-ascii?Q?Vks4P+XV+w8a3Y+7ljTu+zgCcypeEO3fBgb25k4L36EzZeh4FbrDZZrpsL7G?=
 =?us-ascii?Q?gzSo2lWpy8s97DkRzEioEACSHm6BwC3TnqHFdCerpvPbm/bBgTvorSNq5wJN?=
 =?us-ascii?Q?4fwEriBX5xgulXVz/tBLYgoucS07SG4lwVZbYSReTQQMgFmvfsaF1NXEDGAB?=
 =?us-ascii?Q?m9aUZzUrLCnXdhGUkibPr74BXXCME/1X3usA9szyg3K3NvyfNirdrUoV/9xF?=
 =?us-ascii?Q?nlqac+hT+cEj4oHZ0MHyjZYCJT/oNUGRlXL5vUSeRARAtJ+rgM3HbFP972HY?=
 =?us-ascii?Q?siMp6nEkMyQ6Z7+ooetB6c3IZUP+pp4+FvmbEpCKK9MncaJ1Pe96fhibGU51?=
 =?us-ascii?Q?64JecPLZe7GtrNU8ycYSIFkCW+rwbtUsLhFXuWjeYiuoYc8W5jJhY8GjaWBZ?=
 =?us-ascii?Q?mkhh3R61tl2r20UuLBa/WJYoSQWcL8ocM8TmaBMOGaoZTTuL+amioLwXmqUQ?=
 =?us-ascii?Q?wUt+PEf++6I7oVi6ZunnOK+mkAOkOwOxGNJxSFIMKuxJYHBeajTAxtvdFBov?=
 =?us-ascii?Q?Au26DLc5hWeNwUu0ZAnEZ8xjR+00VLcHCT/YYUmAmtkLJDQm50L7DIntV+Ot?=
 =?us-ascii?Q?whLN0neD9xlEfulzwLJlGEpbhn/IdQl4nRZRoFIAikBRdvLcZ0S1rFCO/doR?=
 =?us-ascii?Q?lh39q3x4J7e712BUdV+09reIGtOy1zxzzK3xvN6Wy50FxAAq35yEjfqF1Yao?=
 =?us-ascii?Q?tYZDNDwZikUP+VEbp7mYY9nkkdHE1JkVwCWLkGWnWF3b+miVtYPF9AvALO47?=
 =?us-ascii?Q?4a10ADBIm6o9rVdxa669W5u6kLP0aMVGnWdPYMNcGVVvmt3t2x1NsT0r+b3z?=
 =?us-ascii?Q?MjXDciNFC+nF58EHDck8UNOHsyn4hkMUj4RPYODsDr0LiKK3gRhUnkO3bdIf?=
 =?us-ascii?Q?Mxni7hvIdDCZclrajCe64Yqs7d9J1Kd8t3NKzARcHc34KDA9LyI/z1UoFe2V?=
 =?us-ascii?Q?SI78jNIxPVmEghybYkd0lZrqazT2sJchBZy9jCajPw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692e1597-66de-4438-bbe7-08db644362a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2023 15:01:18.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Immad Mir <mirimmad17@gmail.com>

This patch replaces use of returning -1 by appropiate error codes.

Signed-off-by: Immad Mir <mirimmad17@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-elog.c  | 4 ++--
 arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 554fdd7f8..8bb42858e 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -309,12 +309,12 @@ int __init opal_elog_init(void)

 	/* ELOG not supported by firmware */
 	if (!opal_check_token(OPAL_ELOG_READ))
-		return -1;
+		return -EPERM;

 	elog_kset = kset_create_and_add("elog", NULL, opal_kobj);
 	if (!elog_kset) {
 		pr_warn("%s: failed to create elog kset\n", __func__);
-		return -1;
+		return -EPERM;
 	}

 	irq = opal_event_request(ilog2(OPAL_EVENT_ERROR_LOG_AVAIL));
diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index 6b4eed2ef..6df52404a 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -171,7 +171,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
 	if (!dir) {
 		kfree(ent->path.data);
 		kfree(ent);
-		return -1;
+		return -EPERM;
 	}

 	debugfs_create_blob("devspec", 0400, dir, &ent->path);
@@ -191,7 +191,7 @@ static int scom_debug_init(void)

 	root = debugfs_create_dir("scom", arch_debugfs_dir);
 	if (!root)
-		return -1;
+		return -EPERM;

 	rc = 0;
 	for_each_node_with_property(dn, "scom-controller") {
--
2.40.0

