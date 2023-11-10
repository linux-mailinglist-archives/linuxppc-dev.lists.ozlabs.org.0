Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9927E7D44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 16:07:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jnm001PI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRhyD4mBYz3dJD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 02:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jnm001PI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::61b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRhxK3m6nz3cTM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 02:06:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E30JYyjYP2ZRp+ciUIb1x3QZtvfGraTuYcW+F0KM1P+SiQtzZJngYzCWZyddC2eZUnp/JHNXjvJvpjS6iDu371/nb9jOLl7i43FKtN63cnKUj6DO+XEjl5Yzp+d3d/vN61PZaCCOsKKOvkemMNixxwfwD2uTd3UgKPeFJ2wznAm8yZsR1L5oH1z6StEv0pjxrSkjYbNnFrkmJ+qI+gm/IKpJqPHmbJ5uiNEx3AjDDBzbf2zcqwJZSbnl2lx/ILDdRW+EQSGSJAzk8+QAg0DRmlIol/5kQ4tKQU0na32Vcii4VMZlYE26OnqtXHfdmV5Eva0LfZ4lFcxhZ8WVOqF5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCkofdvjMXYNSFlDIyNp8TwxBV7wGxyrp/yDKjVQ3kI=;
 b=A+ii1o8cf1ButrJQWnEvn+lok590iaKuyLPOz5M2JNBxuEUdPDVSxjk+qaX1rWTRHjzXaBLvbhdURwTATH5dplE36ulUEecydtHT1mtjUK+wHKP3d4aIJnSBd8iDvjuzhRZQ73b/2rnejg0ctT8YuU5x7eYPRjua3tMiJb2nijGruD7NO8LYbQ5kjq8Zi5wMWMhcGvs8oWjDFn/+Wq2pRolpJDQRsBLgpA1hza5mzDQK9g8fIzNh1W9GkMmTj/hu03EOS/EQ58rrPmbNN787mu1y9HPjLhfNpjlgLXw/mfys8uNvTjbs3kX5lBAY/wgJH1KFumitLSyCEyPXAI6nhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCkofdvjMXYNSFlDIyNp8TwxBV7wGxyrp/yDKjVQ3kI=;
 b=Jnm001PIt8QwMtCLmS4Z0rcSxgVSej++xGbu69dgKSwTkBhfurs7LdUjPobOjcaYIjigh6Gabgq58jWVYM2tOGcHamJ8mvhpiuBEBkft7NzQRl8OkbfenwouxoSbX/upd+U+QJDb4NBEYvJVot+U2KHVo/QUaVXwkhBU73czQ3JuidJSalvFkUNNArp9VdZCZRuUOaq4F3Bcb5NS9nTUHEtuc4JEaB4e3UziCTdFIWvPLzWRfxUBo9POYQhkfhtIfrzMvGWG/JlhxdeSHuh+JCXgBv0z8JV7XjhrgP5tbcI5h18rxkavTUGK2j7bYTj2sYqa/pZP9v0b4s18pdKnMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 15:06:22 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 15:06:21 +0000
Date: Fri, 10 Nov 2023 11:06:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: get_user_pages() and EXEC_ONLY mapping.
Message-ID: <20231110150620.GQ4488@nvidia.com>
References: <87bkc1oe8c.fsf@linux.ibm.com>
 <20231110145306.GP4488@nvidia.com>
 <9a51f827-6bf4-412b-9feb-37cc41ad3e90@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a51f827-6bf4-412b-9feb-37cc41ad3e90@linux.ibm.com>
X-ClientProxiedBy: DS7PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8efe2d-71e5-43be-ddcc-08dbe1fe9994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rSvbEYjJqnTfJquyh3A6lMkntcvaE4luKFK/0aVchYNqlWWNuBEXGpFB7I4PBMcgHqWo9CdTFINRnwcarlJklJOcrvHol0Nxb79hh0WBzGrfgUQPskzpDARagmC3goPRfL8JWXU527OI7AYXKQyBOmrr7RbeC1up5Oweic1xSbw0qL7D2SqfgkcDl6426yDwZm1IdxMBwoVLB5lec8Oqn19xvH9qs8yHE5Xxl/OJU0iIj6zRQ0IcYtxWuIxVapW/nVnQq17Ii1B+LbnmLvpvkUfCNRYdKOkfhztDdYpLC2pSWJ2nGlO8q7pEPTLbJBA8nBvrKE9qlZdwPHmsNVIotwqCyx1mUeDsqaCxGPB5aLigC4pHHyeZPoH1vYhNawTKXTIx/CaqPKBspkcLIWE/vxXNNXTxy+NVWzd/aJLZN0syI1kUSREKMwZQicFlZWqSVInLve3qvAI1o/+q6QU4P+fJ0vAU/ZdB/AXchnKoqk6dYtYsphWZ4h6MQDPUdQf7UzyKt5hF+SOlV6CPCpq7OmOE5KnPVUFIvwNdg2PA/1ezhaX1lrclQwzcvGBiGTQr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(1076003)(53546011)(6512007)(8676002)(2616005)(6506007)(26005)(5660300002)(2906002)(83380400001)(66946007)(66556008)(66476007)(33656002)(54906003)(478600001)(36756003)(41300700001)(6916009)(316002)(4326008)(8936002)(6486002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?r8BBwykEqfjfSERl4H/dR0P4CXL4QO/PwKbbIjfFib4gpI+MElLAkzdfzx52?=
 =?us-ascii?Q?UPJRp7wL7kkUUuEA3DyOYT/ikFTG9CWR1CxbqLuFYSTvAzOsNEy9AUowOd/P?=
 =?us-ascii?Q?MVsaPEDfyide86em+xldZa89Q9U3gJr6bWnjwW42eAsRLV1qkgaVC62D3Zqg?=
 =?us-ascii?Q?PPdMBnLm+FblRYiGBgc3xdowKRDjeyc+EokE3HChfyW+lvihHtq+Ucu7fclf?=
 =?us-ascii?Q?T4c3uFP6PWx3zbaCbafTuwMuUfhIQPXr/Sx3RJERjgbEvOwSEzlVy+AwfS6W?=
 =?us-ascii?Q?N+O9gJ1vyRdlp6xUrMsxGli6vkNQ4fic8hJ8m8JEhS6g7fP/3Qe40nFDNDVH?=
 =?us-ascii?Q?HeNvdj0WjqXdaRJ5zT1RHXMgJiA3VZM+kq1RBeK52TvX8I+P2106WNLFGm8M?=
 =?us-ascii?Q?AdZesHpZENqDZ+uT/MKogPuZ46Eh9puaKktNFy27UBlnK8XgrS26DutL1Opf?=
 =?us-ascii?Q?r1DmpOulTbtdkLI0sRYLzXtDavWJeb6JbvqBD2tFzjMibjHsL2VYtmhpRMDc?=
 =?us-ascii?Q?dTkc2g9Si1Hr3KrK+MEqANNSvayExUxFGdXNluhkr6aaSwPbaC//6p/Y+ERD?=
 =?us-ascii?Q?W4VoioXhid1QpU3MTcJt6L068FSB7neNn8YZs7ZrqfURpMyzsoLGXa55Y+5y?=
 =?us-ascii?Q?4yv9Ol/sYMBMGz2UwKwj/W8YoJRk1WQ6wQM5iuorYGU7T9HUcgIAW/RnjSDT?=
 =?us-ascii?Q?WaXRcTla7VNWDoqZmyicTYYAm7QkJYLUSOQqKwBvQrC9VcYlb7vGc2PHNqDY?=
 =?us-ascii?Q?Gc/UeJnomaaXQVSA4tKSDehfcF1AYbXtEadaOrOIXeiFBSi2hqxJ9gtL+S96?=
 =?us-ascii?Q?CuwowCK1DFSNFg7EVG61R8HAiyo6qrFrpmVAcET4qdY0DS4Xzmjv3R8F2k3u?=
 =?us-ascii?Q?JaQShQRFkxwC5XWoel6awsocRc4ZKmAkiClS/EShoxcwrk+z2sVpYl7WtoLg?=
 =?us-ascii?Q?KSw4SkIdItEIZgMSzTfCL29xu/1NL4vkla08LHZx+VBMWVOrAUhGOPe5GLg/?=
 =?us-ascii?Q?L2GLl5Od4S71x6nPjA334auZJASCZe4ju+9SGtHblhpmGItsVZ1182T711QT?=
 =?us-ascii?Q?smNXUVtBtlld1C/XaLzyzYhhEP8vdY9k+80jfaXkHYYxwavEXE/BvplCYAb3?=
 =?us-ascii?Q?LUbWsQixCmDFpOQOIWdKzZoFyyJP4CCiPmxdQ96kHkVI1lAoWfTg4pTta+m+?=
 =?us-ascii?Q?WWf6VA7gud26+C/Y5cvgGe172Yr77aQlQh20+iO2zWpizfUa0B0ZOy6eBjp9?=
 =?us-ascii?Q?VF4BTi/8QLTgvTGiE5FE9laUg2LdRr+tmn0DC7bfb6s3tywacMMYdMqpfTf6?=
 =?us-ascii?Q?6122Zp6DLpI1iZrqfMvh8dPYAU+tuD/qOA8zi/txwLjYNRRFXxMUgpGUiePQ?=
 =?us-ascii?Q?KDf4VU03Josgl3ESmlLEFmBaBpHLyfuynAimeeVelRMPFbVZYyzOJV4WHQxr?=
 =?us-ascii?Q?uuu9syG7s6NOaqXBFqIIhw+C5e0ewwkQ6ArQ+kl9mNJWT9ckj9ChM5fM/t14?=
 =?us-ascii?Q?Xg7kBbHf/ifUmysvZ/oF2Mp63ApGe1VLQxGk0x8OS0Jd3aEievRolPVbUddp?=
 =?us-ascii?Q?O60UkofMXOiCjzzQ8VY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8efe2d-71e5-43be-ddcc-08dbe1fe9994
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 15:06:21.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSLcjy273Dbr8jd/E5Pc3RW/FidIz0XYdzX+Xe3uYbfemG+AnswKAvS0syBtIUj/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023 at 08:27:19PM +0530, Aneesh Kumar K V wrote:
> On 11/10/23 8:23 PM, Jason Gunthorpe wrote:
> > On Fri, Nov 10, 2023 at 08:19:23PM +0530, Aneesh Kumar K.V wrote:
> >>
> >> Hello,
> >>
> >> Some architectures can now support EXEC_ONLY mappings and I am wondering
> >> what get_user_pages() on those addresses should return. 
> > 
> > -EPERM
> > 
> >> Earlier PROT_EXEC implied PROT_READ and pte_access_permitted()
> >> returned true for that. But arm64 does have this explicit comment
> >> that says
> >>
> >>  /*
> >>  * p??_access_permitted() is true for valid user mappings (PTE_USER
> >>  * bit set, subject to the write permission check). For execute-only
> >>  * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
> >>  * not set) must return false. PROT_NONE mappings do not have the
> >>  * PTE_VALID bit set.
> >>  */
> >>
> >> Is that correct? We should be able to get struct page for PROT_EXEC
> >> mappings?
> > 
> > If the memory is unreadable then providing a back door through
> > O_DIRECT and everthing else to read it sounds wrong to me.
> > 
> > If there is some case where a get_user_pages caller is exec-only
> > compatible then a new FOLL_EXEC flag to permit it would make sense.
> > 
> 
> I was expecting pin_user_pages() to return -EPERM and get_user_pages()
> return struct page. This was based on Documentation/core-api/pin_user_pages.rst  

Not unconditionally but you could argue that FOLL_GET should
succeed. It depends how much do you care about absolute security of
unreadable memory vs compatability.

> "Another way of thinking about these flags is as a progression of restrictions:
> FOLL_GET is for struct page manipulation, without affecting the data that the
> struct page refers to. FOLL_PIN is a *replacement* for FOLL_GET, and is for
> short term pins on pages whose data *will* get accessed. "

This was sort of aspirational - have we got rid of all the FOLL_GET
users that are touching the data? Looks like no from a quick check..

Jason
