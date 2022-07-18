Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23D5787CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 18:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmnzC0GzSz3c4m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 02:51:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PPlLesbC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.100.48; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PPlLesbC;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmnxj4Q8tz307g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 02:49:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKHimqpwIrccrR+yQuNQJ+4AEdwQf6sx1zlYSp+8ELGteQHZMOTOdbVFvFqnd++8J2WOqhq3wPMf+XQ9Cyhg+CCGu5+yFcBMX1pdDs/4XWrD71GmfJnRY0x901v+Ik3hml1w9gymD5Dl6+g5227HyTz9x1/MmAwT18/3LYMs0q/RL+wxePGyAp3qlCYiQizq/rVQaIhzHryd6dVl7lAZuk5uOOwa8TuWvDO9qpiGuDlpthTIyp+wKAWPBSN2EpV1r1Ja+ikODteaTnvCTQdYlv3HYIMutRiPPR6k7Q7z1atUn5R1+38rzj4yCQWEKbLRQu12OCfB0ElsAWchrMzLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLvR13GAKH5vTisHpwd4wigQRtDNgsa6+OfKjMKJjys=;
 b=hvcK4nRUlslQpCfN12n5KeHKLoXfBrAtBeBz9VtG4WIj7MSnoYcCmXuwE/BUhRLEXcE/rBjTiA0ufIUKvOrbNWRbkgws4lna3qKSniSSCI/Iebuzi2eck38IjtUBRMMKGyV6UalbeA8cyIPgTCrubNBLM+hkaQdzWPp/AQkjhCe4ZRKyQk64KloUW0ysVk7HVJKEJrV1ajFZ84YruCtTo2gd+pIYbQL0Ws33l7k8mxJwhBR9EapUCiuwLrFOCVsOtw7/jyaM/21JAUycPx8UKYpO+yEQm8Unkk7bfBZmVlfbiXqplqqevCN9laMP09w5z7smKm8QOYoRZUKPSUg7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLvR13GAKH5vTisHpwd4wigQRtDNgsa6+OfKjMKJjys=;
 b=PPlLesbCLCs6dtOotQZY3rvuv28k3Ud5hA62t/RCoPq7i2dnd3xXo7Oy0hPy7nBYjw+puwpwFkXjSJvpciR1FKhrykFziGjsmJztasIsn5h0OmYZSEYZLzXqqDx8BJ5cM0NzxkofIo6e7jui9l9gNXk8WRQETZsk919kwHRkbiDXTZRsQIJ9Pv22+xrtmykvNVPR+FZtce+Xqjx9QgayRZtN17DPBrwhZIwznBuL8uQOAQkcWveLomGQ9s7z7CV8f4sRN9v+fxnsA0Zx6El2+mxm/Mj8c1OFbbyQz6sPi3nNc6FdqHwfOJyUBINrzRp1+Miwl+eQ0vIiRxs/R6jRPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3529.namprd12.prod.outlook.com (2603:10b6:5:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 16:49:32 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:49:32 +0000
Date: Mon, 18 Jul 2022 13:49:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 2/3] powerpc/pci_64: Init pcibios subsys a bit
 later
Message-ID: <20220718164930.GD4609@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <20220714081822.3717693-3-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714081822.3717693-3-aik@ozlabs.ru>
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21754d54-436f-46b1-c222-08da68dd7cd5
X-MS-TrafficTypeDiagnostic: DM6PR12MB3529:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AXiOvHwNjOqi1aOFo9VyEof1RD369sb8nLHeuu8HnDjeLwZ5ZwY+RFIuieVwUrOuvm0iRp3A9ioALutZTzS7Nl0KFq3IBWwE9Nxgk/9pHa46DxXJYaJ7EgezxzLGgEE97MEuorU6vTcZsbegF1oCESxm53892IfUKmdgDAFQ1me6SO8V3hp7Va5vV9EASav45Wwlc2QbqpK8sUNYe+4/Gt3pcZnJUPi3tef8k3afJF/SgoMXXN8whZAfmPxWmvPH1ORQblVQ17opee6ym/tcVXvfel9+mq3nF1xThCE/Omh+i5dVuEcM/XGoENxrzhnNkDi6fMUEaRsizyOU9mqfJQGm5k4QU4whY/xGhRFXGPdXCSHYH+qexicVcQHaTwzmvEHdHIqGG1YlfeMPR/1bKCJWS1+ziu6IeOEgnDK6+VldxOeZd4xWH+TzKQKPQwd7B9gQEGMGRhQTH31BhLvG+UwiXeKhU9+KYCx7MrAN/Yn8Uhw5ssNRmsZDYcjWQo/4YMpsNakJahmgF/PhH5zo5zLIZVjYqyyWZsDAj2kgukXIw4ct6FafgJiLUriOG36ZuDW0PDic2BSCeB4AH9zbG3BmCt42gfjEL3w8A7zZVll1UIUCG4VmuhQFw3XkHJovQ5tguSu0L9JC2ZWoVz/7vRhoBdFBgjkjCuN6/X2OQpUO/axiGJAaa2O2LpNFuCMPGdgI5BVUYd2qY/56rygDVFD6V5klgKcB5ThHIN0UkvqNx31OJjOIR0CrPkRpGAaa
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(2906002)(8936002)(33656002)(316002)(66946007)(66556008)(6916009)(4326008)(54906003)(86362001)(36756003)(6486002)(41300700001)(66476007)(8676002)(478600001)(6506007)(2616005)(83380400001)(26005)(6512007)(5660300002)(4744005)(1076003)(38100700002)(7416002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2zt24alOb+NXsQza8k6i6XPb1oskilxS8P0JMxION1dBBwWoq5M94Op+9+fk?=
 =?us-ascii?Q?hm3YEW0Sj1ha5hBxNFxtG+/e6Eon8OfIje9oeB0A2KKC6HlTIkrRh+ksAF61?=
 =?us-ascii?Q?nbfFmHJ6VO7pcduKeT1bItiheW87Q+pQXGP6j6eHzg8e7e000CQvTtdwF9ve?=
 =?us-ascii?Q?dvQk+hckU9QaPHmqMSGWuLCk/gWdDwLq8BB6H/4d97DF7xfbervRAJvDYi8c?=
 =?us-ascii?Q?1nFmWh2rijuM682LD8AUUB2o4IoB8X8m338B5OiLdZ6IEDFE8QaZMRUwT5me?=
 =?us-ascii?Q?ocZORYd3+6VoZqrFULJX4gzNglUrjlK4thymIBWHq8PY/Tktm3/PbuaLRbPd?=
 =?us-ascii?Q?jQ+F2sPSQLUq5Tn6E7VJrB/TGAOFBGgqy7hpWn+AON4KKgC6K17sUs6LJKIg?=
 =?us-ascii?Q?gc0lwK8J8N3yG6vFHUgzZoi1iDAW7Yhuagyl1rf13Ebxb9KRI4qaAmOpcKFs?=
 =?us-ascii?Q?9ehdDAFocWW6hmSCZ9vZpjzllmJlZWX2tgxlW8Pq1slE0EaojiTZ9wRco8Dx?=
 =?us-ascii?Q?GbetqBPJt/Etd0Adp5HrGKpLPF4PP91WS3lM5LaGAxPpXqmJAj/9bcCXAouy?=
 =?us-ascii?Q?nQBe+meoLy5gCB/dUgbe/s654wzSDzh/6Iv5Ve1X7Gh8zknCZ0odRnCchfBc?=
 =?us-ascii?Q?710ibKqAAeAqWM9nGd/CFeg9k5qmi3oH8ZXN67WyraBgvhqQTI8jfwEbZrjA?=
 =?us-ascii?Q?RLgGV62EnzMgOBNHXDNkTbcfI7Fo/isXP7N62ENt+OW/vCSv0sIvtAgNNI/u?=
 =?us-ascii?Q?PDvdExGBrOmYV7am1F6nXQQcl5MKKL1Um4spZaphS9fjbBSZn14IDYgbUSdQ?=
 =?us-ascii?Q?td3oH3EZ1ndEdgA7UxBe0am74/JuWxq1TlvC85cEXsHtr8W7xe33HSel5HcJ?=
 =?us-ascii?Q?lop9AJ5myhTs/X/9F74U82ugI5SulowabwGhe2k/2l3iG/H5NpUXYQ7c5SVS?=
 =?us-ascii?Q?3XiPSb5JjpEPpJldOqMFKymiZtFlW5ZQw6pdYSKqYPoIMrorB7Us4jTdZ73D?=
 =?us-ascii?Q?itsindavThbCprtsyAQ+z81UaPEeBKM+X5LKTb2b4e1kqXyFZ/cIFjoXx/Rg?=
 =?us-ascii?Q?GFDQQzVwQ4z4aSbKoHMIZ9kahx1Atu9LYz/2QPeBlymuDMfFhyZsyvvIGVg0?=
 =?us-ascii?Q?v0WmiZpXwVhT0x8vPkdnue0pbATWZVHNnz5RFpsrbv7qyp2ptwMkv3baotcR?=
 =?us-ascii?Q?qlyDY5Fsv8T7T0/RG9kXWWPTPDI3x23FvCVV3xMG6ueJhup9c7DmCt8huxOM?=
 =?us-ascii?Q?KZJf0E0zkgJd9CNKZNWKGZLRODrhJkIcrXe+Lc9MLxxVGHc+o0GK5D4L6ZFM?=
 =?us-ascii?Q?gJFdxzyWkArJ/n5ARJ63b9kb19zpDjW+6uM6yVWEX2x+sG+t/kTgWS4czqt/?=
 =?us-ascii?Q?58QOa19/SnRIfshkoMSQVc7g/y1XxLsa/wFq3tG5crBhS5NLkATz9MkePr+h?=
 =?us-ascii?Q?MgiiV0IJYVmEnMmLxkK7XBKnLTPu7RT74SIzkYjY5Dts9sZNkaKJWH5Qm0RD?=
 =?us-ascii?Q?iXpQowmuxu/IoA9h6602L9A/NSxdXtJWlbe6H1f0tfXSLzYWCCe7IthHORUD?=
 =?us-ascii?Q?kXCkNWbu4nSO9snOo99ai0DW2qMDOLZXQrQvluHT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21754d54-436f-46b1-c222-08da68dd7cd5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 16:49:31.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o16Q80ZVwCpC312tTXydxNimoPjfmSIURAxq6nOOd6TklZIL9vrBpel9wKL5iTm0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3529
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 06:18:21PM +1000, Alexey Kardashevskiy wrote:
> The following patches are going to add dependency/use of iommu_ops which
> is initialized in subsys_initcall as well.
> 
> This moves pciobios_init() to the next initcall level.
> 
> This should not cause behavioral change.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kernel/pci_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
