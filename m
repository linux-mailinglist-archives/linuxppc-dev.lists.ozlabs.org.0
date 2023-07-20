Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32F75A986
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PlVmjHQs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65nV6kMQz3c30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PlVmjHQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::61e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65jM0S74z3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:40:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECvaaA3ySZDw5vHoY+JC9P8vXLYkaBk8MF4sYWcdmjMjl866XZlPdPmXXspCr2Fs64JXZuKEw/QfmJd4IZTj/gF9LCrNhCH3KTXtH/iRpa/Cr4x5K61RLU6Ql3bopGPA5J6gc1btkf60ZZQc2FJ0EZvrHQVLP+qpnX5gTQ+bkcoQSHkXxc8ppnhgo7MDtVvDDed6hlZ3CI+3bEnARdUniHs6L2arz98HuPg1V9eTm7/WjqeT13e+evf0C1PiS3UkFJYkVya0GyeIW/ln1eSszVyo15PUaQpqFPmdcUXOt1uR+6HT5HRzZLyspsXvCANqUTj5cdRE5DqEae75NhUQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/cCYj8Xd7PDxmlOmxc7ZGo63wZ++XgwVNU3j4KQgOc=;
 b=HOwjuVjj3bdkRRRf0+MyuOjBoIv6ui061C9eMFXHos//+uKfc4kQTUswHKR/xaKiZgGKv91Dqr7cToZCVhUKnaCuGGOfHqGHyp6zOgGX2G+OO2BVBDUCV0aCiKDv8fSGrPPJKJWJX+UKdWFZB7SANkAKfdp0I9brzdvN6/oe8Wl+oKlcH2j7DlwEpOpamGQhovIOBBYkHX9JHeSuO7Fb87EBZeU1kL6zJH8ONsIEKxK8gtta3vpJsWYHAa3MEmOLGAD1Ta2LlKYnWSvqqNcdADr7SxUwdUOL+EDT0sZB44ZaWvutveWbf05h3qLFBOfpEFmjnE+nE/coKbrTTwMp/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/cCYj8Xd7PDxmlOmxc7ZGo63wZ++XgwVNU3j4KQgOc=;
 b=PlVmjHQsWvDa8c0m9WSwFzKwG7DCZ4Z290hPqi2PT5toTVVL+SGoB8m8A+DdY+UGmG191MmxMkTc9dVPDcqSNsuve3OZWnF62qlYJL8WL7ZlD9ohDSaPtdmiPMcv9IG2+XQEV3R/yrB38DUqsWwag8DPey4DBspxKGleN92Zs48XrAnAM2Pu0srKAfLZHirUsbNiBr+6p24bvAVFJILEeH0X8LYoQOO/C41y4gL11bvtuTMA2RoOFwcb9v7WinQmdIg80Lm5X7xqI+0hXwyIdjvZCsJl2qczjiW1i0n9Jv7Tyc8EzGFamsZZHkN1nd6rxfizEvOGlgaeS4zKxKgqVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:39:52 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 08:39:52 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v3 2/5] mmu_notifiers: Fixup comment in mmu_interval_read_begin()
Date: Thu, 20 Jul 2023 18:39:24 +1000
Message-Id: <06fa82756e4d6458895962a7743cc7f162658a54.1689842332.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0076.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:201::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b834c26-30b5-4686-5146-08db88fce2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NKFgrMSkEbwVZAmEFXKbnVft15qBKTzeInwePEcG1hrohOUbz6IiSkRTPGx9PLj1Y8p2la6CZoX+RYqMweJwM8eEWc5lPu31BfApk1Rqov10/F0xgEia8id4Mv9WkWcKlAr4cUGw9xyZxn8UA5LIJWtxxIDMyXgmBJmR7ugeUGIcA9fvda6z13SHnJE29cOEZePN2hAzVqkZhAz9Hu154e3T5IYyxznDhB4lP8GPbde58T2NCOBIzo6c00DEvAkzOmhB+iOVavCxksdbmLPjmZC1qhywVgVfceFP6K4Arur0Bv1OK6g2udVgvo7pBAZ+1QMsbJv0Q0fGk8iS+5xYkI5NbmF/+RN8eiQ+7WitilRrpyzJND75e+1b1+yg4aAOK7GfpdgRUTmSquC5HeCWAsZaLpEbkoKV87Po/V2TzBXzqnOpXJjA7+ZF9Pa6EQodp1YDMG/vA/UGhXDgMJMcRjAqUpErNHiCQS47Ajl8KqAhqDpVU12isoLV2xjdAoqtYUtyhOEOY8H4/y4ONMTFfo6UZUvrJF+Yn4dfEP6hfS8Cwkpe9NHXBShpqNSgtaOt
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(186003)(7416002)(478600001)(6506007)(6666004)(26005)(41300700001)(66476007)(66946007)(4326008)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(83380400001)(6512007)(107886003)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qCUN7qdsU7Ongh1mMS76qCO72xN+/RqD5YHQAwUkrveGbNzXZ7WuMZEi/RF8?=
 =?us-ascii?Q?xZwgBd3ng2KbxVo+SWsqgRhv2fze2oIr6mO639CtOmCxRLgFo01AJ6DknYsC?=
 =?us-ascii?Q?6IwswUZWHPAXkWT5XFQvL8DvnBFkDQb4iSnk+/ZgOh+YfpF6+5VPoPnKA5K6?=
 =?us-ascii?Q?gtCWmBjj65s9zwHTbFzk06WS6P0Ec1VpWpUTpDBDlOONZv+OK2OsWhH2x8cm?=
 =?us-ascii?Q?tF1gyJsuQGIHgV++Rp7Svia15rjEvT/F1GbW8dQUWk9oLixC+5R2mINHLfG0?=
 =?us-ascii?Q?EPywjbjqu6x1OUiO9I+Cz3DH0o1goI+ZlOed71HHr40+RvA6Y0A7TAbGw6k7?=
 =?us-ascii?Q?3m3zrbDGc5rG/1hRkubpDuysJfnYby4c7Y9ooeTatqBJJOQTmRvecy2RY7qE?=
 =?us-ascii?Q?QB3DJitBojNpvAHmv0Naj5gpWGxWQdI3ioOJcCgrELdPdDg7Mk8rUra/MyrU?=
 =?us-ascii?Q?Mqf3qldeLoe+J/H6EqI/Yye7H/cNy1lNDOS0vkpjceaUjeG1SHTjNbgW1xoU?=
 =?us-ascii?Q?7b3iJceZ8wbGd4VDUZD+TW6qjTha88Wd7gVCewwQ2uecV8ysQQHbO9NeIIVa?=
 =?us-ascii?Q?nr2kFtvoBw3rJCm7w+qYvG6MKDPI+FtuN6x756A/7x0ntL6xLOVSVjhzEG5M?=
 =?us-ascii?Q?fES+YZW2MxQ+kCI3CUARcCvS+igFf5kbT4AV+Cnnaf8EnW5KMHgS/5O3NVwT?=
 =?us-ascii?Q?OC5RC/6CPtJKjNJQBfbjSo4kK8dGcgeEWwokQ2lFAbWfRtc8k2yQCcBhkp5B?=
 =?us-ascii?Q?oGmTAv9Hx4Ljaysbp89Hy0g9LA+L8XqA7yBTdCfD5Pmf7YG81fo34B4iVmMb?=
 =?us-ascii?Q?Ty+dkPGYcbnYprEkXHHpsyNgvd7mNpTE15274Xfosb8+oqszrN4OxufdiReB?=
 =?us-ascii?Q?2d7vkaGMs1mzLofRsPWVpH5AiZUL5uCR8HgUrH3s4bklc86ur2VDBzEVnexO?=
 =?us-ascii?Q?wMvbVAq/oNofAD1d/FppOpMK3mYhy03+jNwcalo7q/EoGVwrN2dF5nvmPN67?=
 =?us-ascii?Q?Qxq/OyxHOjuiEh5whqGkWDnvvAajdmMXPSC5lC43owilhQhGLA5HVlITKSKg?=
 =?us-ascii?Q?GGeMT0rvm0iuXLMqEOQcUxe3iig6WqLJrfAyD42tpKYkYcdGwufxSWYTVgSH?=
 =?us-ascii?Q?mx0C72HaBS5LdQnbhi6n2zlzZwntmYk5LKYSI9rfUsM7nI7L+itvBa6HRwYY?=
 =?us-ascii?Q?ctzLj/Qyo8aicfCyiDj+zMT4TpXKgeRB5sWdH062c1/wccQHaYBI8HJ52CUc?=
 =?us-ascii?Q?6nUfoiyumZhg75RMwVi7iUhdXUVEAsBwhMCpt5qkf4wLweCPALlcp+UIwOJx?=
 =?us-ascii?Q?iY24VlmuUHmhvxPn637597fJmCvumnCfz2BRD873WMieAiw0hnOy9aC2J3BI?=
 =?us-ascii?Q?rCNZbkpyfA7nANbDLTNUJPob55a+f7uS2ekOBb3DcCF2AjbVdtHQiwUw9xse?=
 =?us-ascii?Q?vW0yxr48z0MZ3MEsXhMoBF+fkcerSRv8v4ViY6qbeVJChUjMiAzD8A5vxkY2?=
 =?us-ascii?Q?W1YfdJBoqN3zvpW4X68fFb8rydn8BPV3Lr5sOLP4Ienwsjap6/ydsWRy5XnI?=
 =?us-ascii?Q?Voa4FOTLCsPixPjk5Qj3J8NhgQNTZK0t/NVbGX8r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b834c26-30b5-4686-5146-08db88fce2b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:39:52.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tInQ6FJ2kzkNrjSLGbp/KoHQPBAJiteOD2LGi/O4vC0tNaD3WT7sJxlDmWe5wvnMCUeuRbjF3GBNIzxUnNJUaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: x86@kernel.org, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, Alistair Popple <apopple@nvidia.com>, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, sj@kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The comment in mmu_interval_read_begin() refers to a function that
doesn't exist and uses the wrong call-back name. The op for mmu
interval notifiers is mmu_interval_notifier_ops->invalidate() so fix
the comment up to reflect that.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/mmu_notifier.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 50c0dde..b7ad155 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -199,7 +199,7 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 	 * invalidate_start/end and is colliding.
 	 *
 	 * The locking looks broadly like this:
-	 *   mn_tree_invalidate_start():          mmu_interval_read_begin():
+	 *   mn_itree_inv_start():                 mmu_interval_read_begin():
 	 *                                         spin_lock
 	 *                                          seq = READ_ONCE(interval_sub->invalidate_seq);
 	 *                                          seq == subs->invalidate_seq
@@ -207,7 +207,7 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 	 *    spin_lock
 	 *     seq = ++subscriptions->invalidate_seq
 	 *    spin_unlock
-	 *     op->invalidate_range():
+	 *     op->invalidate():
 	 *       user_lock
 	 *        mmu_interval_set_seq()
 	 *         interval_sub->invalidate_seq = seq
-- 
git-series 0.9.1
