Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8F75950C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:22:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ES6Mv60E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zgz5ckRz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:22:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ES6Mv60E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zd6224nz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:19:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKMbvPwvpAweqgY/RvylKOCqKTJq0H9jmQH255iwaYeV5h2MRuIlenrEysloJY0aFgCHjB9+WRryG/w2B3+qwwMgktQmdaspmfseIwda8JCbWavwqyeMaoKAJmiOiUUEC1bJ5KVaeIx35wfYQ7kJyF2UuY9Nn9Dxh4gU5ZToepUYSLqejip7JiL4PPvZrnoQ6AkkIVfZYJPCJoch++Hlx3r/1UJIKQFMfJCQRKJzOPKubOP7iLJzB29+iO3HMAHDFCiWX6vhLT3Ao6V4k+5bfV2jdnM13knMkMtgr4WMtnw3zqN40j158mI1liXcUd4tnGzJuvoyzCMV5hKqEA4+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/cCYj8Xd7PDxmlOmxc7ZGo63wZ++XgwVNU3j4KQgOc=;
 b=fuBoXw++8+YlmiA5oHZvxI0n23X2qrmeM6wFiFD4XWRA4W2WloMkZvHgJA06MOGwiT8GqniE8dpSEnDf8hdBECjC7aYeYJ9rLqBIZC++E8KWgS7G7u2uMyaP0sGz5mT9mVguX3zYUS391bW6Gdw11f038MGz2rTJqRpPSyWa4nNmWnvVR/k4NfTuvHZDAWJ0+EpmZ+A2x349skJ05UBWIua/8mNc+4plolSf2bzNCf48yDtwhG4BgvIhqfhzUGiWoC/s8IOHCmPXmgQav9YHhiPA9ZZUeQ9BqD8S1QTst32LLWgZ+cJxmG8mAAOq6EWuyJHq9UnPdqXhFJ3//xuuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/cCYj8Xd7PDxmlOmxc7ZGo63wZ++XgwVNU3j4KQgOc=;
 b=ES6Mv60EaoeNnd2UXqJedDKsKRF5QyUWHkcwW5VbVt3i7RCs9zJZlyNlXmX2phyMUSn9wGM6n1jUrn9Xwmli/fX01cfgereLIxFi8vGS1/c/41DDQp71sQiestpW+a7ilYHfSER7FeEZY+wMdNPuFosvT5uKKf1jUaUmSf7kGAN5QBIiWC9g+8UrU9rw0C2qYGtY1TjfOQ/He5oMQYkTH+WuppbPk3+nbjWZdm6YfPBP93N7YkD8AQ3X0lrIyk8iUEzBX+iylirkIf6EwZwCgVrVoWOtD5oqqL1CvbeGU+QkAvlDos5lvVoFGLh7nOv/WynWNvKgaTEPJ+wv+cqRWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:25 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 2/5] mmu_notifiers: Fixup comment in mmu_interval_read_begin()
Date: Wed, 19 Jul 2023 22:18:43 +1000
Message-Id: <06fa82756e4d6458895962a7743cc7f162658a54.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0038.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::7) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cef8a73-7383-4906-8c12-08db88526460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xYM3m+2pxTxkC8LtX6bSv4+1tdfbzlTasnOCGRndjzlB2STFoCc3lyTs2+ekxgOm6TytWhcZqaJOdsD3kJeTxIyW4uHgqS7VD7vpet+2uczCLvZqjCT4QS3IPbokBVoKmuNC2gI4ZJoIxztSLxCFW9QacCuX6n5iDFumGswI0vcOZusc3UbiQfK5Y89s5vjy++1E+/ktjZb6F483lQhJyNYxYfRS054TB7qRaa9J8cdzrCeRD12CrF652YcGVDJbvkJSRppWIC6o/zgqAtga/WIuYSCXg1yNJgwiDqr16pMDywFXrObQ5sAtNcI9RHwny0KVtKuIuoDOB3oZo7fIhJZglgaGR61IQOiBpKCx0HbnUjxyRmV8lQtlXYmsyk25QRh6wUdx83jCaKlxCJXJVrNZXdJW2/r+W+GILlwFSmpac/nYKC45L2gwaT78pw4aKQOsNEyc1/ULVG3DxUTX0V+zOhY579qp+p2vkp5jOO27kLZArBdIo/14ZHoGdxaG0DeR2+vKNWxyo1Y7JVs7SNmyjZ5+4YQOgnbPpWSwU/Ip39KKc7brGGw/sjPF6kJX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(186003)(7416002)(66946007)(66476007)(66556008)(6666004)(6916009)(4326008)(6486002)(86362001)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?I8Hp/XEt1php+k0PQt8VT07oZc/s69qy3zImfldRciLIoGjCKG/xIEnCP9UN?=
 =?us-ascii?Q?mmn0WSw9gDx6uZomtAGZpPP1qCYRA1GZSo6i5UHujo8VDqNbFcSnm5N8ZU+Y?=
 =?us-ascii?Q?1JE9+30sW8w0y8GZ0xxkwhI6u6jPGK6+gNvLzqQjJ8GfIIMKZMWsEYubErwp?=
 =?us-ascii?Q?Wi/6iBd77F9NYL9hPxzvfJmOZejAH4thW2wGyLZvCAz85aKcH07CYWbfN+FA?=
 =?us-ascii?Q?rp469VbccRU6i2bMUfA1pxITOh/o/31YqzeYzTNskRweJVtEJv45WHGHLIeC?=
 =?us-ascii?Q?keIRj/Fyvy+4lHwQ4aSjMpc74woH6N9CZULd3P533Gf5a79HOz7lgldCDHNj?=
 =?us-ascii?Q?Ps8ZAhWvwqNVgbFRtx3ojhAP6CTtv+3bsvhQP2uaisgO1pesvHqeXHNEi4GW?=
 =?us-ascii?Q?5u2EbN4L5e1G8IeYahLhTzZmy8qayzonkp1oVDF9FkDrGIHWr8qksh9jK06z?=
 =?us-ascii?Q?YvT4MutaJ4fNes5OFzWyJRYjwczNSUedy1UC5DVS7mItwFZgwEiKxmqI9NQT?=
 =?us-ascii?Q?yH3vgCAwo/q7zyzjD6fjA/eeZolsi/qskohHazkkkLfOj92wUQc1Wyc2SOsD?=
 =?us-ascii?Q?YrpReRHpLYGXUsiClD1F9s5CHsTJT+hgb2BhIL2FYhemWboEwqhUAXUbScPI?=
 =?us-ascii?Q?id+GnpCSvyNO47gkECSAlMfz6m98d9p2C2yLXbU0Sr1Bzkpr1XW0DDguIsXg?=
 =?us-ascii?Q?fS0eM/WO2tb+IMmDtMPuZkE3LBrt26WWVyO74FN+PaeM2kgADTJjPqjWIbIS?=
 =?us-ascii?Q?CBEJot7wdlTu7Wbhsm5itxs2/f+eMfl/0sb/WnGjxk1Mz1nwRoVMuncBe01P?=
 =?us-ascii?Q?AYfBJnmEuktIDSkoR3SDFw/6cKFHBSIwoZPQfWqwqSHaDv4VjCdIbNFt2q1Z?=
 =?us-ascii?Q?ePaB22M2fS9qHwv7Jv8jqwe4AW8qKNGK+Ll0pnnYqiyHJZvV45DdJrt040an?=
 =?us-ascii?Q?S1dhVmPQUo1DQyr+20OQShN9xyxpv6Gq6jaD6i8Ddn23wHBR5u5vsXvYTVUR?=
 =?us-ascii?Q?eDST3jPZEV60JxGoDBagg6FWwZqQ6H1zY9IwE+NmP4vL2xXY5VJ4P+QpYBQA?=
 =?us-ascii?Q?Ykkgia02txlm7dgblWunX/fkPsslB1rod5v2DBDgwwbrhPA9CF8jZh72O3Ov?=
 =?us-ascii?Q?G9koikX1gKsCiG4mBOvZliRFR0Jx77eTrq+zgVVWiBDX0W0TD1+R7+pNJ5ot?=
 =?us-ascii?Q?Ou0kCFd5zHZChR7fjUQfcxymuzuZQI9hABotddF10IpjtfmSQG6xJnxnZOGH?=
 =?us-ascii?Q?c5dCEZc2cre7d/RyTuPme1DvFeHmcxn+tQEvbvFCJMqSCuypjsweWGzgyGWw?=
 =?us-ascii?Q?2BVOjWxxWB1WJ5rDPKsB87EdpqB1Kd3gEHPnO3KyFUmGLjBUo3iTuM8NFGUu?=
 =?us-ascii?Q?F59RfenU0kvElvaWdOBSu/KrL1ETHimtBShgSvkWjExH3NdjVqDeszZ3ovEQ?=
 =?us-ascii?Q?oGIgic45+zUzqcd2P6ko5lHlEUbP2MASni7OUUm181LCiM0vbmR/i6QSnJEX?=
 =?us-ascii?Q?ZcYXT7Hx8moPOpvOoUqxwx8OL2tbNdE/WffUnYAXBl4onp6Vo+9XR252HlR6?=
 =?us-ascii?Q?MdBcluv1AG0gIYlu/wSyQUJmnnkICDsPwQHwaQo1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cef8a73-7383-4906-8c12-08db88526460
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:25.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwgSOklKX1mT7jpeoxQbtLqLIWiAzXuIO60vK6dEAeLZ57Hm/zrJM1sUAr4Gcgw9dwzjM6+vKuwzBF2wz6YABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
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
Cc: Alistair Popple <apopple@nvidia.com>, kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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
