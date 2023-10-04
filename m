Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F27B7E51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 13:39:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CSHXI36V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0t5G0gM2z3cdx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:39:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CSHXI36V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::616; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0t4N59W5z2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 22:38:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW+ZuT3gNC0D4qRUxTLlrlNZvq/TTXoHuZxX6bzoIOI2QJGIQ66YThzIOXMkr9UecPff1eOWTRSiRbde0+9pen/iBmwPmdCqAX7svBNC8p0zSg+i69o6d6RxLo77VRxoGjm062c/P8Mx9+WTCNRpB+245hv1TyDad4tAKx7eo0Qzvg6zjJW2jPTJAOVCIQ7yJllnYiABpHs75vaUedXErABkzc8i3CC3Bbr4a8y/19D/27uIXde9vcVbvlWJxbVL9TtK7+jYHx5KulwYCSgYpFfnG08iEIwpPxhIbcQtQqOZejuxra6u1qH1LKdMRCjO/uTJ+SKY5EUAi+kNTepYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heIzw+Cyzzf1ywUyw8H54iFOzA5ZEOHkbmycMUTkUIc=;
 b=C8pArpc5ecIE65NtH+NcsWPU+p7qaIdEG3f8fF2iJBpMavTIIFkr8xQ32xaDVTlGfCUdnuMtwZwqbCI/mlyO3sGxcMcF2g4KBZRj7cPcRcfguNgljnsPJlpQEkbV1XnIl1vEoVy5pFBFv9F9qcDgzc90Bn5nFc3uKas3HbYeegYSlo6uWe9YbOq7mSErANkMAaesJDlIihie2RLC900JMCoJo9TRckF4+qFMfh/r6EecFJvalDIu2LHQLbU1s1VUFne0gnrS3ZYR3tNH7eAFONX9eKuJ3FQThMX1oLtEq89vnNE1l8ihYhLAzHHGRB40wkgwoYZb5j8qkHm0yebW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heIzw+Cyzzf1ywUyw8H54iFOzA5ZEOHkbmycMUTkUIc=;
 b=CSHXI36VKR0ff0DqJiAI9ch5RcwWoc3ppSptA4QNHkFee3+YiwnGUZPa95hRuN+ZIeBfAGiCO1u1PAB3unHlbTWFJUtCKnJfQxoCim7BCPn33+IO/5ivoqp0WU5r+l6/5cwkecCy1dmpSovixtwldAfa0HAzM839EcsRDdG9M4lZhC5oNAdZiA4MdsyS32qNwT4wF49VAmSa9q51FQcGZLacRYVcDZKmn/rIuD2UUZlogm6pp7R/WWCGJduJKqejiWr/DsZw6d93QrkKqtE1S9j5z4e2DosV4IgtHYYSEjPo/idcxeS6fftyf1BP8kfSRlNMOD8mr2nkvhvqAUU/Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 11:38:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 11:38:21 +0000
Date: Wed, 4 Oct 2023 08:38:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [Bisected] [commit 2ad56efa80dba89162106c06ebc00b611325e584]
 [linux-next] WARNING while booting to kernel 6.6.0-rc3-next-20230929
Message-ID: <20231004113818.GD682044@nvidia.com>
References: <d06cee81-c47f-9d62-dfc6-4c77b60058db@linux.vnet.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d06cee81-c47f-9d62-dfc6-4c77b60058db@linux.vnet.ibm.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf91c25-8eb3-44df-0938-08dbc4ce698a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Jr0bLDAy2QFhMN4pdR5hwzpDpgpSj3FcP4KBK1T2qkD6kFbUnK8bSHfo1/uKxbtDDAJlR1aA6HD2UCm1YyQUkhSmqyWQAuZZ1qXhRQSbvAKrE1d5J2Q4OD+uxEPePdRJICRMLO/d4JSUeOfto6EuAKj8cY1AnWdsIrhpVSC06UQlzzvPwriZmpKRqCYqCTma0jmjLa/gO8p6X+LmIAPwZKiV/qCdsOhVr2MEmeBOrrem9Kkr5tMXNEE5Bo6ggiq6R57YiTZA+f/Q2iji9KUsORDm4wkkZ0z43AEQOOld9CRnhuVP8DGo6as/+qJeX5jrmYxujHiDdLiguc1ewJrkgZ4KVR53m4qcGMzECSkq9y0Z+7j4PNV2Ga+FpOTxEKYVZKlKkoKGFHvcaxQRgAuekfji3C1OQuZIMy41FBeoeR7aqXvQiPxoFqK4AFF5lNVWni3btuYcGv16SqMWaXjltz/4QhsBeOzpZESLmOP9l2mY/Hj8ksvND68iaeqTCZOe8HhJM/mdyR7T436oV7pP4ZGFyk+vkKSKNvLZhzU1lJugsCGssJlNL7JZmQyFKe4Hl1kWYM+p30LWA8R88E9awyqIFkK+py2O4r3BRXU9M868jeS+A5y6xBwtHs2yEsrX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6512007)(86362001)(26005)(66556008)(66946007)(66476007)(36756003)(1076003)(83380400001)(7416002)(33656002)(2906002)(41300700001)(8676002)(38100700002)(6916009)(4326008)(8936002)(5660300002)(316002)(2616005)(6486002)(6506007)(6666004)(478600001)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?S727dAEdSpBaJKzMKrF3Cjb14KZr/BSeVbpsez1avZsE+pCA+VF4UFFiSpFY?=
 =?us-ascii?Q?a1nRX2v7DTe11lDU92TEGOY29CmvHopscjKcNO1i6/bRmaj0OEvF5SsW/D38?=
 =?us-ascii?Q?uwwe54qPIF0ERTcPy2pxae/T30kHHZ4eWzPLRccH8yg61c4etu3v6+kIwNFn?=
 =?us-ascii?Q?Hl3Lq+181PsQ3XPaA8eliQ2OTYOAoIOfet++0ncR6SAPkXfeNB1iRWqai7Ry?=
 =?us-ascii?Q?EZOtW2PgWkxHs7ZyHqMLQnVIsVghDyaVw85/ogvgP1NJitVwwWm57eAmRHIU?=
 =?us-ascii?Q?QO1dfVy8TH8JUeGZONpKUxDt/E40k2Q+DYTw2x4bcDPHaH0H63d7EzSkc2ds?=
 =?us-ascii?Q?MlfGcSfqAoqW06J4o7CmozVQjvdtM0aKE6wwwk5QmnGY7FRXmWYe0dTtJrCA?=
 =?us-ascii?Q?F4i47qRiYMvdLS08uKmhNxL4RmdEv5ldmfEnlHLjNR8n1CQsWsMmMF4J3p43?=
 =?us-ascii?Q?dL79KxqbXp1l9WIAQNCht+QEWZpsBX4c0yts/kf6U8qrcbLzbH1byJCx3YUz?=
 =?us-ascii?Q?aJB5cjsHmMgrY4IgPb3ZuF49i3uBPYpFFyRyvPO94IyFZfgAaH8r/f+pR5l7?=
 =?us-ascii?Q?9J0nLqcQIg6ETo0ro/tHdmO0x8iw36GpXHVqFebnHF18+k1lLss5T7eCnyH3?=
 =?us-ascii?Q?1cH3H9yx5F47BvPSd7CzSizrNkAfB6+8avRv+st23cTXMtNtXBuEc4b7GXNx?=
 =?us-ascii?Q?2eGwOWHhHmicGrS7DDEV/nCeDSVuvEddjbGOd3i4P9N0atNWq07tHaHphHiD?=
 =?us-ascii?Q?gm3k2lSLc6lbg4O7H1EX+EoqQe0QdBTXPApxmK41bqfhM5dRT5rmx1MhNE0g?=
 =?us-ascii?Q?UZIWxKnqSR8V8CpGe43vDxv/0ltgu9RQtulFYBZWvXVS5dhh6HTXCTkcsGjo?=
 =?us-ascii?Q?03+jkpgouNqCj5ebRr/kdFr8lEsjm/JKG7LLy0dQ8mpcVvx5RhBrtis1ovVF?=
 =?us-ascii?Q?vJTMj8LLZwhK8a9HSB2lGED32JpceToeH7AvTNMtK6aKC2AbVeA7qlkRk/fk?=
 =?us-ascii?Q?IseoGDVzTo82KptI+0VzAB8RxXm5C0g7ZNr7dGFf9IrKfFGsb62fcCUrgciE?=
 =?us-ascii?Q?aKFoTkNl7/mSMgtC1I/BRP1GJFSreHoNgEKG6xqpjONPjUDfhJhshWfhOfTp?=
 =?us-ascii?Q?wNHzP9bOhcDCL6m9pYhHtMs/bCCB4tEJQUr+cNDsX0OH57xkRbBwk+zP0ZuT?=
 =?us-ascii?Q?zSfKPYkq0+AXgz/cTbORMaqQ/26fk44g08/Cq6bosiUt+8iA099pMJlf5188?=
 =?us-ascii?Q?iK64HtrgGBz5+egjKDZqD15hMFp55y//kzBZUYticZBBYE8s/lTzxY4zG6iT?=
 =?us-ascii?Q?NgQURuDXfpEYfPDGsdNN7WrGB2fzym3vbQxpNPSuT6ziKxbvcFByY4VKhoLs?=
 =?us-ascii?Q?/uejwK2E4q9NGqHT8cndK09a1mpqoaOtLJLWPK2rfsKS5JSDUA644z7Fn4Oo?=
 =?us-ascii?Q?60TCXyd32jGKIaPnhbu6zoSdx3hFtT1cC+KClIEE9wnFOcVdPRhDmtYkJID4?=
 =?us-ascii?Q?tRruaa+CL5+6r30mlcQpFOu5wq/wXJ4PU3JF+JBCnpgV/AKRkr8saAY7EMcS?=
 =?us-ascii?Q?VNryRydCcKT2iIeiTcQKFYBO/Wr8pajudHKcU6As?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf91c25-8eb3-44df-0938-08dbc4ce698a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 11:38:21.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgk1vmGS0zTgF508HZvXrnlUSbHz0MGNxOWK0wPdWQhQiNTyRJroIsDJre9fVPvj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
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
Cc: jroedel@suse.de, mputtash@linux.vnet.com, gbatra@linux.vnet.ibm.com, ruscur@russell.cc, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, sachinp@linux.vnet.com, abdhalee@linux.vnet.ibm.com, linux-next@vger.kernel.org, gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 04, 2023 at 04:37:10PM +0530, Tasmiya Nalatwad wrote:
>    Greetings,
> 
>    [linux-next] [6.6.0-rc3-next-20230929] [git bisect ->
>    2ad56efa80dba89162106c06ebc00b611325e584]WARNING: CPU: 0 PID: 8 at
>    arch/powerpc/kernel/[1]iommu.c:407 __iommu_free+0x1e4/0x1f0
 
>    gitbisect is pointing to the below commit
>    commit 2ad56efa80dba89162106c06ebc00b611325e584
>        powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
 
I assume this means there are still sequencing problems with power at
boot time. eg we turned on the dma ops in the wrong order or something
like that

As far as I can see the only difference here is that we do the
operation to claim dma ops during the iommu drive probe. We can avoid that.

Does this work for you?

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d6ad3fde85a212..115b9031badac7 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1280,13 +1280,19 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
-					       struct device *dev)
+static int
+spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
 	int ret = -EINVAL;
 
+	/* At first attach the ownership is already set */
+	if (!domain)
+		return 0;
+
 	if (!grp)
 		return -ENODEV;
 

