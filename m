Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C444B5942
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 19:00:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyBpg1xL1z3cQs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 05:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AEYqAeVU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::61c;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=AEYqAeVU; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyBns1qfKz3bVL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 04:59:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgLIXLhBWdX2TcRwth3xiSEdsMcRl8HZwdWWmCouI45sdDJReJlWHhw4E8WCmwBvMOSroFW8KylU2CAbZyglMRJCteDtg6P7qEA/oBhDPG2M+ykDufFFflsa8g4j6yjIHBD6/RCOWlOgGNhjEirgWD7V2iZ6R8Us64T+AnPD7UMTS/BxseHXxztvIIRkZ9+F50YLJN7c0hJ3RKf3A7dUHdzPSH4r2S/WcN3ftuGKFNtSUJgc9lvqaaWoYOtXvzIsyNMubFpeJi6RPxOrZo7eHn4EAxcBzf/nJoFas7SdqMR33lCfE3873VGhhvQNG8pQpZCzmcmi19xi3yzRiMfHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LLGNECXTxj2X85KV2FMmkg6haP1g1eBjRbiEZhA+4Q=;
 b=cMT9bkeSGqeXS+FwvDJJRrB23ZZJUiJ4R2bJ0KYJ9YnDS4Rq8HnHszomfIf8CbYD0gCgmg2rtwADSojmLLEV3NpO2CFzqR1GDNUbyZVOOTa0UnIkWfjA2f8Re1RAnkioNJBM/tn30JfoJx7DaPwozeAs75h7NTfI1JNwVybEkJ+A0S7GgVo1xfM6tX7trXRv3nBTWAo6wxaASASQhsj9Clu28Lfe5fmzDX3k+GxXwjLjMnvgM0mHb0ZUIbnrWFKYkBtXXFB8aXfFSIqHRpSKebIKULUIsl/hIelpNzqqONG3UKWZ9Jw1pVjrFqxvJj7s3lQn3Hn3+l520eWsJlotOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LLGNECXTxj2X85KV2FMmkg6haP1g1eBjRbiEZhA+4Q=;
 b=AEYqAeVUb/JTznA6MWU+Wn6K2An4rRQcXUCA9uyN6DcZzHbhsUJw30CClX7DxRwC6nBFu6P89r2FD5xswykc/dtXKifodKvglWa3Z5ybMDV/GtQhQaDpKDIoYT5/j4+vRgBaOSSRmQ3cEt3Qhaee9ddnuSrctUkOiwV3uZcWW/imNduje1oLgrAWpqWFq5k18n/xlv/97R6e2zZWD6fJGvCCpNBbijR3XLuAptZmL0k7Sv7QExCO7RRVJ6FudOuSbC5HT1VBndQfyOctZa4f3MQVZBEBk6/hzY2aHyYsfdQk92rePn3to0Udwc4YNVYNT6OyspEbC2VaYeTURrmYDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 17:59:37 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 17:59:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] cma: factor out minimum alignment requirement
Date: Mon, 14 Feb 2022 12:59:34 -0500
X-Mailer: MailMate (1.14r5869)
Message-ID: <3807992C-588C-4187-9232-89F478D17AE9@nvidia.com>
In-Reply-To: <20220214174132.219303-2-david@redhat.com>
References: <20220214174132.219303-1-david@redhat.com>
 <20220214174132.219303-2-david@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_DCDACDE6-76E1-42D1-9F2E-DC2CBA67259D_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::11) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f89c438-299e-489d-a4dc-08d9efe3c3ae
X-MS-TrafficTypeDiagnostic: BN9PR12MB5227:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52272832EEBBFDE0A665B9AAC2339@BN9PR12MB5227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0cH1po9VA4pCRQPgEpZzMmnRpfi0FGEK5s36+Y0/VFWmmeMzGGXoeXLXD7ncf49IqIwzkMtVzgaO5UhrY962M2/Y6kvJfMd2iv+trvmx5Prto//AKmDnTwvowFWRE52D2nHgSLc7rq7hOL7LAGPNjLUwXOoEpVr8b13GryNp38xIS5JpwqeP5wGrLidgWsJ0GyZ7sdHtiwM4VWm4ee7BwlyJSy7tUq7AwYPQVOJR1jk+R7CgNTQl4MHLVC4faedyYEUq6vijak4mpf5JHQ/Jdk7Kl4IDeDWyrHgMZrE7tVl1aSM06WhMZqOexz7fG76cE4LaCQNKluL0H1pc7HXVGAV3e+LnQM1Zv6AzCJebt5YqxuqKxC8kqcTa64o8OrDiJYcXmh41TBf2Cosvxfvg9/wejTpwzb/xQUTskPdoTDqsSVvGFUcGjExSP0PasvIFVzlIUb6hXe7JqIhuwBEPQJdg2EC4e+dXZzYSyO4ArCUPrtf3mIg41C7tqyDfHJGb2miXAfGYcGX2yo+/Xd4MuICp5Ysm7KOVlWQtiG/5zEbQOJ5fdpMJrtc1tb3RCFnSAdL23E2DSi0VJPayakmpWW98euTNVR1J8RcAjlfWSjLg1c3xCUax16NhPlxs5B2ymJWR8J0iGOUgh8YL9yIDq+EOskGpb6rJgxlR86onRBNPT+i8NoSqzZkgt+OjA3re9HMhcfc8SKthk2k/LWOjnCZfnvJd1ArzSg8RPQ3Zys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(235185007)(7416002)(2616005)(5660300002)(83380400001)(8936002)(508600001)(21480400003)(6512007)(6666004)(36756003)(33656002)(53546011)(6486002)(6506007)(26005)(186003)(66476007)(6916009)(86362001)(38100700002)(54906003)(316002)(66946007)(66556008)(2906002)(8676002)(4326008)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vOR36d3QKlaCW8fTkBKuooKRENKFOE7QAzNIHJMcfDtRK7j7zOSM1CFXXxo2?=
 =?us-ascii?Q?11g9qaO6XTIzV47uXnTe+c77FidgxNTNpW5IRCsoIXOhaXHuAUbIb3CPhVQk?=
 =?us-ascii?Q?vYbS3oDglPAgwoCJRSnxvbDZw0F0MG0apcu/5SLVrbEL5+X+Ze0Exgs0DXu/?=
 =?us-ascii?Q?eGA0NiaDGmpAivp2OlD5PSeRvtAZ8K3EHCu+WMqAD/o6SjgHqTtY/ntJ5Mkz?=
 =?us-ascii?Q?fgKkTyVdTJ/cS2J2yr4jbYsm0azCffL74Agy+k0GBbJMeihpvZFUK95jFCKY?=
 =?us-ascii?Q?EQ4HpgFLOv9wuRvBg67uWpL3UK0y/xn9D0rA6ZZAuZ9C9P6HK1FWalUUjRhP?=
 =?us-ascii?Q?XV8gd0ntLWuNXJD2tEAOH/0X5JcPezmDzK+vzdSU+EB2cs3Yo2IbUi6oKwVS?=
 =?us-ascii?Q?G/e6Yw95DoV+ExEAD4QNMyChVTTSibwT3Q1ywxpJ262Q62jCUCwAGYe5fq6z?=
 =?us-ascii?Q?VpRxm+9e6w0sMguiFQYV8d+UaRd4qZe6rGgyaPjKWa58rHN0/fDfS31U87xT?=
 =?us-ascii?Q?r9LlufFqmTcwJiFcBz+2DCC1fLEhhDuDSKmwLEgK6JzP90AZxdveH84QtvaV?=
 =?us-ascii?Q?Mz4eTeTmFJ4/7ah+rBZm7uDekLlvIQeGI/Lm5RS/hl9rhGjznnPQ8IbLNmvr?=
 =?us-ascii?Q?kycTInLW/gdrhAIeYlpacNmBq7nFqy4Xh1VjebGu9lkLu8t1EZSsAmBW3/+7?=
 =?us-ascii?Q?ZwdvpTL/RTuGwNYKr4ay7tQCr7pbHl1fHcEskBX5TjFlyYH1GVsCiy5PDvlZ?=
 =?us-ascii?Q?aAn2kA1sihYSH1Ym/rjK0EhVbwUKdiYspZADWuhy3WlVTYwX9ylOjO7l4I7b?=
 =?us-ascii?Q?DlxWlKZVRhWRoMS2mOeNkfEtxkNa/L3YdDUHVjah2ceiP5tTJKaWO1L9G0fc?=
 =?us-ascii?Q?9fhGYR6RWsx8BFXTHWo0OwWSlepgemmXKCMciV9z9G0heVX4YPeFNxN/Dzea?=
 =?us-ascii?Q?3UL8lfskMINQThiT3ufFFjVF0Ah3ZA+vbEPuhyT/+kMgByfwF3VwSfB2Qtjz?=
 =?us-ascii?Q?af+AsEqfZi4jOgtjl4G85vS+riL6tA4e2yelmx3HoT8ZEOIHH2ieFzVlcve/?=
 =?us-ascii?Q?UuVfSOZmdEKNnLraZRpb3aL63PncxdxmfeD32mGGZcL30C6a6lj042PvqSr9?=
 =?us-ascii?Q?S6wS7c9a+SS3mYx6Eb99MsZZgshBeHJGiVpuvKz1Sl1Y1PmwAi1MwZ6L03kN?=
 =?us-ascii?Q?bRtxL7ai3Qfle5TGHymmzIBDUQOcC4xcdcJ9Su0UVWmTgWlKuILNoBzjb7Es?=
 =?us-ascii?Q?ESVS9wEmH1JDNc7CVxfquGoZ/ps892tUWYQW0dLoZFRDIhC2Y1+r/XMBvVAD?=
 =?us-ascii?Q?H/mnN8RP0fXnu3jg/LbGsBA1jA3/rzdjZAMZ1smO78EZLe5xU6ONJ1z3QnQ7?=
 =?us-ascii?Q?b4OUUnQF+8br+ASsoBQEUuFLltow5ZAjcadmB3yPcxj+LwArrqId20U8FW2r?=
 =?us-ascii?Q?BaqZqjmw/+EtCR6MMdzNNN5+gyFRNWpoFx/bdDx2JLhoIw2SVPcuZI3MN5RI?=
 =?us-ascii?Q?5QHr4IWMyKW5/XXVZtkRmJJZNh1KbMdOJ7liaZHPunTgTs3qjH1EpjzPEmnI?=
 =?us-ascii?Q?0l6Qv2pF7n79inx6tWs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f89c438-299e-489d-a4dc-08d9efe3c3ae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 17:59:37.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stytwWeA6ih/a+qk4RLe4VkHMKKpYNNEO1Wnkf37ghBtUaXTfBSRrGYTZtQHelCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
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
Cc: devicetree@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_DCDACDE6-76E1-42D1-9F2E-DC2CBA67259D_=
Content-Type: text/plain

On 14 Feb 2022, at 12:41, David Hildenbrand wrote:

> Let's factor out determining the minimum alignment requirement for CMA
> and add a helpful comment.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/include/asm/fadump-internal.h |  5 -----
>  arch/powerpc/kernel/fadump.c               |  2 +-
>  drivers/of/of_reserved_mem.c               |  9 +++------
>  include/linux/cma.h                        |  9 +++++++++
>  kernel/dma/contiguous.c                    |  4 +---
>  mm/cma.c                                   | 20 +++++---------------
>  6 files changed, 19 insertions(+), 30 deletions(-)

LGTM. Thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>


--
Best Regards,
Yan, Zi

--=_MailMate_DCDACDE6-76E1-42D1-9F2E-DC2CBA67259D_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmIKmIcPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK9VIP/1E5rSNrwRY2Y0JGuut3WbyFC5S4DZDP5ykS
R6PmfL2Fpo5QgUvgMqvraRLfvbdu7De4HJCg4LLRJr8grdp4UAR2NtrTR+CY1Fd2
G0LL8jaz7sZu31C170tWW7UMuPvLp0Q+1Lb/D7AWM5PgKch//9H/GFj3P0Hmt7Ze
GtJh2u199mmJG7bk7xd6MseXgmmJTLZG0DfjRAeipBFzc2cweWD5IL6+ahKe5WX3
zx22BSARaggpsMiJGxAn4Bp1PS6pvl4JLpVg/m+Kotv+o4TsEgYizpnlU/yoAtIj
X+iD+CMFb/CfRhlqqYk2szRsDZLG5nOVpJUNqpmpVfh85mqvjdn9eQN91GcEhCMn
ZBTfIHv2hcutfrDbVjnC10DW+7vQqJHH5CSvNQslYkgakM5QTYOTPy/5ftIl8FoM
+ZoIXKXGmfMGBnXNmKkx8QEetMNjU53KwpIL7UFdsp7YN+Q6VWiR3May7WIHRCwQ
4911m1l64sxDCnVckz7/6hT6KCBoMq5IKEyd5jOMYOCfl6t0Vkok5GKlEgC/YHcK
S5pnA7hcJyrNrFlHSkxbChJVkUkkkUafAl3PxsmmNg8MWLuGPElHb8N0pk1RLKGL
M5+/PsyKxR6LSFlKVYSdfX8tbXhjK5gzfyJnMqTosSX1LtNCCS1vkP8FEL8hzcvm
guqSQBY+
=0hvN
-----END PGP SIGNATURE-----

--=_MailMate_DCDACDE6-76E1-42D1-9F2E-DC2CBA67259D_=--
