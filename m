Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738A7511A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 22:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gd6P6YQW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1TMd0SGkz3c3K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 06:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gd6P6YQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::614; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1TLd5CGhz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 06:07:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3Xm/FMpJdc5x35i7TAJYnvpyMQEv2ulvRUa0RWU+curzfLWcOXk8GJ/67hGhwS859f6AJ2w/QnEo/6jtSUHSRn8plM+H2ytJHIrGIC1+Rr/VLYeP/0rrhBfljcaQ5SLQ9rxGTvruEZqFG2NfdbYSeAqYxLsdowjbzPZYHQ5mIQUjVaRbW3FXdLSllpjT+bOBsUZGU0AUOrM2mYzp6Qf2P/iWK0zVHe0k+KOzp4uSvpJ9UccLwHvaEttyUpZ2jR59SKZ0DNszxeEQaq/vCuGX2FTjPefB2eTEssPHmWbsMrBu7vlx0skfwj+W8PV0+NmMzpGdn8BxgWQXF2znc341Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nTNA/NLXj4t2KHz6shPWV2xv/BRczwnRfupTcfXGkA=;
 b=cbmdwAUD4PjPu9l44nugf8eFrPIGl1k3/rOM9FKXIoDWj1FpyOceqOjx2K/UlUOnpMkgoETodFXXpdgHLkR91rAdjQp5Hk/Zd+RdnBz9gOStxWsgj2Cm4oZlPRUe6cJCkkiip0PsKnhF4LHswv8orwX2NjhyU6yvZT7RhhiqFa1NZ1AcxL6l/oLFETIG7ItNhx4TAqV8/2FZBjYIkOaOmDRlrlsYVCbE3tcrcGmZvn7KEEsiCejJsKZBFTx8q6Sp+WC/HpiRy2fnCd3zl0yiwpoEOmeciz+6Qd1b9ucG161ruxfZ17vjCk0eN9XHEKWuLoJA8eIH2tw/dTqSRyFoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nTNA/NLXj4t2KHz6shPWV2xv/BRczwnRfupTcfXGkA=;
 b=gd6P6YQW1/xySPjmy3QI7/sEBpLimL3oJzG31+ayTwDxTgy3RiYQw+K4kbaJtlH+OBr9ydgG5M6HDkzPChbaAsbpZrgt5yVeWh5VdAe8WC6EOF6Xey9m+9tjaONP/DTec3mPdBYR6DKmoYxXGdT6Lvd4BzrpWj3cUEJmDX0kENC9t+FfVY4QpMYEOAhkv7RCEHA0xdQcVWSN0593wYtRtanHMYi2EVuQri4vkwyAYplXihxEhe6EuK7vMnctH9yhqSUk6cWZwod8RXWPvsZUdLM4ztX1WzCUhlDBk4LzZGvO/F4s4olrXDh1hw0/lhwcoDQdLt7Jisbtp25/K6iCyg==
Received: from MW4PR04CA0252.namprd04.prod.outlook.com (2603:10b6:303:88::17)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 20:07:27 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::1a) by MW4PR04CA0252.outlook.office365.com
 (2603:10b6:303:88::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 20:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Wed, 12 Jul 2023 20:07:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 12 Jul 2023
 13:07:14 -0700
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 12 Jul
 2023 13:07:14 -0700
Message-ID: <89d500a4-b639-bf00-ea65-6f2690c74867@nvidia.com>
Date: Wed, 12 Jul 2023 13:07:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Aneesh Kumar K V
	<aneesh.kumar@linux.ibm.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, <mpe@ellerman.id.au>,
	<linuxppc-dev@lists.ozlabs.org>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
 <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
 <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
 <641a4276-cfb9-bd1b-36a8-cb4bcae408f6@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <641a4276-cfb9-bd1b-36a8-cb4bcae408f6@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT007:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: e59b062a-883b-4997-ee09-08db83139d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UjYgQ6jXZIY0uinvC43hQbLl88T2492YUdbMGxRsboIXmRumcen4KfOp3CmK0P5sY6otxuKjIJIIGe3VQ3sYo9lRAuQzaHzYzUhh3oICrW3bQkBLGOIcaU/FHjRlc0ZuTjyMnJc9SJPcWz4sekDh9CyGAXFyMSr3CQgPIMskwUh+144eCO9rUvHQIYEA8ErkBjyVS62hKBnjYKnULgnTbIAFLaTBKC9LDddy+3YQ1yyaSkuO179Z2RTMSnx7jVHiV0cR/Bz2W7Up02IfjVc++NodUYjEZSoNnxkmOCH6d5Umy28M48IREvWa5YeCa9HYl/ps1lNTv2q9hq3BECvzz+xnA9PYM5YjMo+cR1+TaFvU5LeT9dA5ycePNCKaYQ27bnJsByJx7q/MooRDMmq/TCH6e7Qu96PHIEOQ7F9wnhG0Y8OpwzpRHc/0Z3nB0XxUJKSnoLqmjcuvjpFQX2SokMiJxqzgcNKY+gd+Xhv4fknB0cMNLAPpYdg3uP3Sqz8K/0gfkt5FiAwpquynR/Az05a0nBXIrldHsb7lE47fmq4aQLKAkY7O7AQqKtkJ0hciSzPaE57svSu4QeoPBIPsQXdWY+m7pdcbkPQ/NxiDOvsOi1nXJPkjLO99Ltg10ZBbcrvoD4fqh2ZtM0+rNmv6K9dPH+urADM7bdWYiYZfRY1jwo7unfiqm8soYpePnzq+US/PkCwbnWX00o0yiuZeAz17VzKuS4oodoBeAuE7GwGz/3kldHGa4QbL/K4bwZmnbkEa2J/uJActleWZFcY6mg==
X-Forefront-Antispam-Report: 	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(8676002)(8936002)(36860700001)(47076005)(83380400001)(336012)(82740400003)(356005)(426003)(2616005)(36756003)(7636003)(2906002)(31696002)(86362001)(82310400005)(7416002)(53546011)(40480700001)(5660300002)(26005)(16526019)(31686004)(4326008)(70586007)(54906003)(16576012)(70206006)(478600001)(110136005)(41300700001)(186003)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 20:07:27.2043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59b062a-883b-4997-ee09-08db83139d87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 09:09, David Hildenbrand wrote:
...
>>> Can we make that a __weak function instead?
>>
>> We can. It is confusing because we do have these two patterns within the kernel where we use
>>
>> #ifndef x
>> #endif
>>
>> vs
>>
>> __weak x
>>
>> What is the recommended way to override ? I have mostly been using #ifndef for most of the arch overrides till now.
>>
> 
> I think when placing the implementation in a C file, it's __weak. But don't ask me :)
> 
> We do this already for arch_get_mappable_range() in mm/memory_hotplug.c and IMHO it looks quite nice.
> 

It does look nice. I always forget which parts are supposed to be
__weak, so I went to check Documentation/ , and it was quite
entertaining. There are only two search hits: one trivial reference in
Documentation/conf.py, and the other in checkpatch.rst, which says:

   **WEAK_DECLARATION**
     Using weak declarations like __attribute__((weak)) or __weak
     can have unintended link defects.  Avoid using them.

...which seems deeply out of touch with how arch layers work these days,
doesn't it? (This is not rhetorical; I'm asking in order to get an
opinion or two on the topic.)


thanks,
-- 
John Hubbard
NVIDIA

