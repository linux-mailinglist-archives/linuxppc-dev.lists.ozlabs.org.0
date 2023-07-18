Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DF7575FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 09:59:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j4QKh8qv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rvT5bmFz30P3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 17:59:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j4QKh8qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::628; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rrc6BJKz30Cg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:57:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwgrfyfDFouK5vcOkm1Ayk/e5XN+JiyxqVYckZfJmTIxrk9IrfKgAa4Wgpct84lo6wJtAzDZZf12zqv28UKFVEn0b/LKbO2pDj0/0vzIR+4UGNMmclQ8qIpNteJojT62/4qzS5sOPHjkxIMzbXpqaWvDUZ4wgPtIbD/E8eeQM756i5YAGZuJcbIMXhfJIHlyUAhPL6YNSJwxeTytQ5BV2EGQax6Ei3UU+HuhPeNulWhPk8gmWN6eMgvCj2mmxrHHqfuusY1hFXDxyLjJxBkrWMOaJbWeojIINosha4oNknjcK1tTvIQjdjt5aMM99IeLryr+SouarZBw41EygG3gsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvW9mlxbGnKVcvKQfEGVo3jXEFbWzwdMBMfBGVX5oxk=;
 b=DzUxocAfd9pQmzItZHuz4+WD60roqofXkDKMbXahTdaq/2ur65SNGToC8nS2Vq+6qfQ5ic/7iU0+5fOAS/wVJTE4p3XXRZi4Oko683x+xm+UU86/AjYmwfAdLcSgrphz2K7vUwhMTfaHlM1ViIstUmmBjYEQD3eDY6r8CoGVVng4de2M3Ahc/jm+XeifxZBIQB8vzo7G8NlAuCsYz2Oet785oMWmmPXU46ZTdDDRIgg/p8AFsDqx2/qOBI6B0d978UrzAw9wWOe/F9czJv8i2FIx0zLdSkscbQOSZWUqKHZG4BtnKaiNS/SrCD8P+MHJ/sXeqbfsrB1ogKugfKXEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvW9mlxbGnKVcvKQfEGVo3jXEFbWzwdMBMfBGVX5oxk=;
 b=j4QKh8qvouPOodSoSRdkI9ECVmRu7kWz4KJDJgA9XgDTpH9ZZziW/0zse1CnGXC5R9xGKTa6u3Wgq7Oef3amzElF5ruewt+woyuMN4kSU6KsaaBlYdu88CBc6z3LzG0Ow2qXb1M/DEpdNa1k7Fu+WMS3ZafvKqQHWQfXIuCcNh4ULk1Wx3kgkxBzFTSVOZxGocDP347xSVzKaG6Y9xN3DzSNTU0kM9EG/iUUR+Llbdqo/kUI6tDDhDTRCR/08c2XPNz9ohRw7CgAo8ewMzRxK3birVl0IW7B/w75kcbQNZHV/KjcsyOF5t81r+AL7U0Z806QA3m+vXFrztPa7eSqIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 18 Jul
 2023 07:56:51 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 07:56:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH 2/4] arm64/smmu: Use TLBI ASID when invalidating entire range
Date: Tue, 18 Jul 2023 17:56:16 +1000
Message-Id: <b29f31c8cbdb2b7d90443eae522a88218eb639ee.1689666760.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0008.ausprd01.prod.outlook.com
 (2603:10c6:1:14::20) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: fec065b8-87e4-41a7-3db5-08db87648bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vgdPwCgZpHpmWC+WVz0BXYPPiLMbjm/lQZC+2D5Mux7CQVoo3EzakekiJz3A0FxDW7FKT9FbqrPTkN9l5XDsCuxZvqb+6aM5iX5HsWx0cBPLOfiQcwPIqwQoW6CaxCLdpyUeRNJIWEyoJ1g0reLt9gHrffd032DzlCqG7mXxIFoXI6krZ+01xiwhnPkQovU++ZyohHYX+VUYVfsYRKx4ZQ85qsggzsLXeowsRPvSRLJMzD5TxN3k73HBQR8+6Ajqp7IpjbIvb1JtT4rqzAuaEp6/2xiwc1Bi7+formeo9OwlAmf8R2y58Gpldfa4cYpd33F9hiK2HJiig3T9jnjJ1Vwxk8oG3T9XoLhLuF+zgdIeXRLRmd9wQqfA2OxIqD9Jxd/dlaZy7NxihTYLMYu2jw5F2HqITns20cdSy/iMjZInxkxxz6i71rA2Fzi/KBzoD6nNbxPrWYx8bevqpV6xMiqnAflJjL3cz/9i9gdVgrdoRgxvT8HrfJfV9aauVdYcel1AtGSRZm13cy8BF5Czo/EYMkaOdnEoUqrJBqeKISuR1ts1mGVYmYEqAFCa9qS0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(36756003)(66899021)(66946007)(478600001)(5660300002)(26005)(41300700001)(107886003)(8676002)(186003)(6506007)(6512007)(8936002)(7416002)(2906002)(66556008)(2616005)(6916009)(83380400001)(6666004)(316002)(4326008)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4ivI5Nh+TWpV9Ru7dx/obF7K3a+hCLeW3c88V29AFcawzcX21qU2Jrhx6Wl0?=
 =?us-ascii?Q?EVyg7I520/ZslZiy+M3SH+GKEWyq1g8PZgdCpeL8RNkV7+Ze4NJMPkcsnMVd?=
 =?us-ascii?Q?6L2DMhrebLPOm06Z76shc3hw9HO49QGlTcXAUCs6UsCg1WenOiM8bSLkmxhZ?=
 =?us-ascii?Q?dI0qIHPUCyJ+fxW/JEo/Y6R/Zmw+Zst3od0qA/pfN2iujKpJDaxXkxHOtTea?=
 =?us-ascii?Q?A8rMpUZy7A4G79TMNz72B1oCkFgoEzAFE6CY9AVb8Pra5eROJI4RKZ33deGn?=
 =?us-ascii?Q?RpajVib57FleyrThVXfqUR33GgAbI5lkWVB3WSYwDEgJw534UO/dbm6ZCfpH?=
 =?us-ascii?Q?JJbk9d+HfJp3Bhvms3hWD7nyHdZsSJwne9dGSi6vLfK2GkgGds7KP+x0wnee?=
 =?us-ascii?Q?S7pUURPsLow4X6h595991zZTYwE/ZRuMxXKR8rRT+Lwgh/B63EoWPsxXfKvY?=
 =?us-ascii?Q?lApcs5O3Fkd0egqzTVWgtKOsLcjNtoEIFIaAPyEvfVcbF+aJ3cfljMgRutzJ?=
 =?us-ascii?Q?zL6OHeFT/CpsZSmgWEQhJoItXXiwP3xUMa7TXYqLTMlq664O82xO8N/VGmBh?=
 =?us-ascii?Q?1LV2Xr9jPMClVmRDJbqahgz7PQZZUMNu4a750VVqc5sr6njmU3UrhJ5kdDQ4?=
 =?us-ascii?Q?HBLjLC7rPdx1dJvL7jaRcd+HF7FrxNaUUUqg8NmbWX/+KISycHVJHNuJwdQG?=
 =?us-ascii?Q?jMAcxhWeMkCFENoeiCdc6FTunZvpE87ux4QsO55vWBdAbReRTAvyRnHhQj/k?=
 =?us-ascii?Q?lZP9jvi41dcTfMYYFZpya4vrPWyuy93wRaZop0iYYrl33pcN+Hb4TvcMtgo3?=
 =?us-ascii?Q?jY6OodaAYDVpzB2MSaB1TXaVVDW2ikFHm1ku6VCeBsU4hFiq4L+/DvNLgP6m?=
 =?us-ascii?Q?3RYYdF9K6oGpXZahjriejGKU/q1NkYbgrNJBVfLrRwiXeUxLwaTgwS2KEspm?=
 =?us-ascii?Q?DGs+T9dTwL6DDQoWwdaRGtbt1EjFziW3mbPafpXi+UrMvA1iC4kaVC/oRKE7?=
 =?us-ascii?Q?CwnDKyfPqa8OoBZoonZgcZXmqmn5Ldjp0qdOalNpFTKndddYRA1+6bsBn5Ue?=
 =?us-ascii?Q?bLy10EU/0QgofhX8XdUoEwIfeisEGijCYSujen5RqUlgl4tE7gI+HwgNpyXF?=
 =?us-ascii?Q?tuIeU3rlVz6fE5JafbYEoLegKZ4wqPh4wl+tFjhUJViP+p9EBxVNWfyp4qQO?=
 =?us-ascii?Q?3LQT3LtTfSBjGuiqyCTEzRBbK7NvWUJVBwqTLl8p9UHiw7OXNkWT+ypWGxMS?=
 =?us-ascii?Q?+0XaR3/j5e/7bqJnJqgZEK+ejuMmsAoT9vJpO7wEbRmys/SOUUXi7AZuARPi?=
 =?us-ascii?Q?3Qwt6EeQ0lZ1nn9PaQ2QqEGDh/nk6LCcB0/FK1KIN6JagORHjEp1wloneUCO?=
 =?us-ascii?Q?d9xsfcn3DCNNa4mMXfRuV9En7I2drw8yczH3Sbat6jTsq5qRL8tPMVOXrm/R?=
 =?us-ascii?Q?lmm31G+L/+X5eyLhjZ6dfVET/ZxzPmsKfC4RFao0uTSvTyJSfBGe6O56PoBt?=
 =?us-ascii?Q?1weo4OSPbSuLjC07wCFjSGsvorJqp5PwXnmPwkWs31tAA//wSA8uDXuO1n65?=
 =?us-ascii?Q?oGgHPa6998pGSavh8btwalzh1cYVLeWmDLIa69du?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec065b8-87e4-41a7-3db5-08db87648bb2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 07:56:51.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9rU02Z0uYoTdnuqMaRaCs67nnBgD5xEtuSoqXDfN5XFrwkkA8zdSOcxLsZpfeLX5lCANncgBsdSMYMMdRALsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

The ARM SMMU has a specific command for invalidating the TLB for an
entire ASID. Currently this is used for the IO_PGTABLE API but not for
ATS when called from the MMU notifier.

The current implementation of notifiers does not attempt to invalidate
such a large address range, instead walking each VMA and invalidating
each range individually during mmap removal. However in future SMMU
TLB invalidations are going to be sent as part of the normal
flush_tlb_*() kernel calls. To better deal with that add handling to
use TLBI ASID when invalidating the entire address space.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index aa63cff..dbc812a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -201,10 +201,20 @@ static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
 	 * range. So do a simple translation here by calculating size correctly.
 	 */
 	size = end - start;
+	if (size == ULONG_MAX)
+		size = 0;
+
+	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_BTM)) {
+		if (!size)
+			arm_smmu_tlb_inv_asid(smmu_domain->smmu,
+					      smmu_mn->cd->asid);
+		else
+			arm_smmu_tlb_inv_range_asid(start, size,
+						    smmu_mn->cd->asid,
+						    PAGE_SIZE, false,
+						    smmu_domain);
+	}
 
-	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_BTM))
-		arm_smmu_tlb_inv_range_asid(start, size, smmu_mn->cd->asid,
-					    PAGE_SIZE, false, smmu_domain);
 	arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, start, size);
 }
 
-- 
git-series 0.9.1
