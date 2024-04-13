Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A08A3E5D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 22:12:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nmfir8gM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VH4Nt584hz3vkR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 06:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nmfir8gM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4N91nQBz3dWC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 06:12:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVdJkg9kwxmRyi4vK4j9Fl8I+hiOSR8SJ30R7K50R3Gz5wQw7LkbDWsOEBCneDet8Zxqg6tFeOEcxvsKK01QF4bgoqwnwqJuc35p1XYUb2tSiIai1Cz/2G6r+HcHF8vtuYxRwn+OWRZ4w2aICRhdkaowBOMywEaUgjzdsuIUdmByoWz0zok29nZp7BYn//8awilXHvQm1MAdRvHnr1rUNsoQ6y788ZRU0xyMx7w2MLvkm4Yc2X49ohgXNhqs7ANq27NmRjAONBUhgFa0sQgvDc1JlWMQqBL+w6qlnwKccEugQj2P3HyTmbStt3e25O7YyIMyPuxKWzdOvvWKOctPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvbgM0nbSRR++dKE63DLhPKzemAtqFm8uS65NgB7s/o=;
 b=mkoQ7bctfUP7i5BrwnBfaAVmxdZVhkoBp/Qx+10+6aJdVA1zUYSow2Vz6SL6K007A/XfY9wsdsnFAYRpUj+UGTx6nyn3Ajcloxqp8WxssZrKZTKe2O+38DvqUwbnK0Ay909+STlSG0CgYU1/TtHFZD2XBlvbbAtHRosu2ilAUyrdUKHIdI4jLBiMtgHkdFch1K7ZnUA+ZiygZl+fkba5zQx84tJTFTxBIbssxiJhnz4/mdDQS/L49YyicLYJGjuXyGFXANuYA2nb/6W+2nfWf+9yV0ZMmDD2tojBTmGRqINtP5/2hpC5fAUMJGhc2DB8hBoGAXyGiFbkp5A3+AYFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvbgM0nbSRR++dKE63DLhPKzemAtqFm8uS65NgB7s/o=;
 b=nmfir8gMLxbFB0qhOQTSExJ3DJFL72bluhz+GSeSB9NT0bzat6B5wLeyVhmJAJAJWqJHRAHA8I9Rnoexi927yHTgPyVEIbRxyyYaAxoqLmKQhGAJsL8mc4ORzwwPsrZYmWewr7Iu2W2qu5KqTLSC4wCjRudon48X/jUhTI2u7gxgOawg61bGa12zr6PR2gdF3PyHhfaz84IvzoSfYw2GPNg7x5u5grG5aIdi2ZFj+ucpltS9FTSF/qeb/FTrT1uq1djS3QTynAKbo/Qx5zxGbSdOg+E1zZ6TkklrbFoSB/PPaftdZW55pp1k324RzhXDWRno6oJn7dpTMVYyqinv+A==
Received: from CH0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::21)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 13 Apr
 2024 20:11:48 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::58) by CH0P220CA0027.outlook.office365.com
 (2603:10b6:610:ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Sat, 13 Apr 2024 20:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Sat, 13 Apr 2024 20:11:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 13 Apr
 2024 13:11:37 -0700
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Sat, 13 Apr
 2024 13:11:36 -0700
Message-ID: <4a83f46c-83d6-40b2-8242-95c05df54f5a@nvidia.com>
Date: Sat, 13 Apr 2024 13:11:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] mm/treewide: rename CONFIG_HAVE_FAST_GUP to
 CONFIG_HAVE_GUP_FAST
To: David Hildenbrand <david@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-3-david@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240402125516.223131-3-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 348fc778-ad8b-42b4-4506-08dc5bf5f344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OTref7pf+vPslq3oRBXnungJbG2JdoDEuoL3H1Kb/ofpEejPG/2jzwPRb3F/p0HGgpGbaL3iK6R+j5xLJpi/fkgHspezzoJkzQJ4ZDCrh8cKma+UQSZBa65OgXQzH6/ZIQZl2nW5oz7olyQifhuTyT9v6+KtOItkfBbJJ0hSiWpo9MQgVho1qOpn1ooBzIfL0hnKOt33/W3UYyZhOJvVwZGDM8bXyTPKETBq2tou0ta72zmXgDIKWIFrL83xn3FoXoqrCnoZi3sJSXY+Oxp2yxoeEkJ9H/TcdxOp1IhNhI27HcyhEuJJfN+iEVqj8vi6V472jwVDX0oUdK6m5fJvN3A69eAbkd4pdZEDwZy5/QoiFz0iWq/l1jaWukpN+BwLROCt7w1L72LKYj0NE6vfcyNFdBGuePsCei63TWIIJkAEsUJu5RPiESXpphvs4AbXhUhCeV0wKtgsocTkFWi6iEluaqKX98g67iPTM6731tTU1ZEd1EUOOjtUtHlVZb9AQMJ7zKyqnYfdXILEmgl5itLWvqGFkc6DmUWBQF1ZbIbu1drq1x7o3TKpvf2jaR1o7H6T9PuHGGECNJJoii0sqYs3WFQmy/FUyqc8chrlEfAos1fltk2H1WThpyvGQKW+XGh9S2HBG2g9T+auDbAxpmDV46TWaUDfZAYX+2aZOkosvFdmMombkIbH4WLmzHi1RZbMTQSbzlMisiRSRuxPzQVaFmfiCVFb7hYhJtAZLZkSjyfflpIm20AGJS26xPaI
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(7416005)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2024 20:11:48.4658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348fc778-ad8b-42b4-4506-08dc5bf5f344
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike
 Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/2/24 5:55 AM, David Hildenbrand wrote:
> Nowadays, we call it "GUP-fast", the external interface includes
> functions like "get_user_pages_fast()", and we renamed all internal
> functions to reflect that as well.
> 
> Let's make the config option reflect that.
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/arm/Kconfig       |  2 +-
>   arch/arm64/Kconfig     |  2 +-
>   arch/loongarch/Kconfig |  2 +-
>   arch/mips/Kconfig      |  2 +-
>   arch/powerpc/Kconfig   |  2 +-
>   arch/riscv/Kconfig     |  2 +-
>   arch/s390/Kconfig      |  2 +-
>   arch/sh/Kconfig        |  2 +-
>   arch/x86/Kconfig       |  2 +-
>   include/linux/rmap.h   |  8 ++++----
>   kernel/events/core.c   |  4 ++--
>   mm/Kconfig             |  2 +-
>   mm/gup.c               | 10 +++++-----
>   mm/internal.h          |  2 +-
>   14 files changed, 22 insertions(+), 22 deletions(-)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

