Return-Path: <linuxppc-dev+bounces-3674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC669E0AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 19:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Bcg1H8fz2yh2;
	Tue,  3 Dec 2024 05:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733162947;
	cv=pass; b=Oxtk0vWObcdhXx33x20MzqMvn8DlBOlcog2tOtFZNf55UrgGVETyihQAixN1SRs2rxqTmVOzpO+M0Qi43GQVzkJRR8he8t4eq17Hg226bSjKkjOTl7y6Jv/UrIklEw+zLove/f9zWS4TJJsITEof1MYLIcCk1L+t/+iYDD92H3eQ1i2Q4TnmfeHWmSbNMxhQvkD67sjSDdAWq8WtFmXszrrWPD3Zm/VHFlM7186e+BAcsygDZH6Y8R8CEAUzVBd3LPfmDRGt4yjHQVSTtYinD0Y2OAJD6424LkbSYxwLu1KbzreqG43f1/xlLRHAnCa2OiHlUW9ZtBLo58WPvxi4GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733162947; c=relaxed/relaxed;
	bh=thCjgzNJiCM2g6Pp9BYSlFxJ0y5I5dcxwgAyxt8IKLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k83qabsYZx1QX76bq44KlwOzAjoTpoWeET+Xp5Z/jRcUFU6o3lZaXbnWAeITGo8gok1/uoZCVLQJpJCWbD0YUDMzAPofNaWIet+EnrnGXxd6Ez6W8aDV/iDorOsUmV8hO3Ds4mjLKQoAWfBuKaYl1xAvrUCSusRcr1pg0IidNb/JHilW36nnfltucpBeO/tFc1wcnkjfYeijA8SwomT1SOWsyBH3D4sE7fOoZUyCxoYKwGxPUuhfhPXrJ32SjA051oNOk3r8ik+O/qjgShvfMvY36rlauMDqaSTZDgNdn225V1boVP61eDF2xWKYau6evzNP5d3Y4B2lIhlBCYs3zQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PvBecX+B; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::61f; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PvBecX+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::61f; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Bcc1DvBz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 05:09:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtj5mQ1nQ0zlthydZ3Us0I8KogrAFsNvS1kzWUaV88y+D8g4kb16uC586v+fX7H1v8ao3CWBnJareA5u78sTCVHQdPeISMnehDFM6J+zUKufxIvqyepQBvD5IYwE+Cd7624D5y19g3mXtJnCf04zpY1FJ1xtv6tBfN2NrqNe17srdrqBUWHlE6svIIpr/seDnFhsUSZpx6+Z9CBser2e9HhffgguG5hdEq6Ft8Dy/EmDQAbOUdaKtr4EsIYMCwVv9MTvtahKaK6KcR00oxdwJ67+Slj20gG2On37p4z8JumvZRnoFDQLeOZ+v4s5MeFeMhDROX8USti+XR29wrU9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thCjgzNJiCM2g6Pp9BYSlFxJ0y5I5dcxwgAyxt8IKLo=;
 b=FfSeipxgT3HHGQEF8koQ4CGGNrcHdagLNKYCFyD9Z4P9iHhKRvLHsDz7vh7m0XqGdLGIYtKLfCo96vAfNQBgVv4+Jlcnjvwstqawc8o5IZII0xJtWsbrfntt2aeF6JR9/7H2smOi6UaFVmx7HJRVgVqjXfxM2QoLh4mxOLNfE0eZzl7am3VwD/047nXGLrTATewjyr68ouOn91byJDzp8L0NrZgAOlTU4ICnIojpmElgcgd63f5rraWjj2n1ODc8REP6BOAW+3Tn5sWb5NGEcCED9BJdya3tckhkpbJb31Cf431npDxOG/xtAbYlhRpuAHiW2m6AYym4wBYvXRK8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thCjgzNJiCM2g6Pp9BYSlFxJ0y5I5dcxwgAyxt8IKLo=;
 b=PvBecX+BhgRCPhCvJbfbiLp9Z0GNGdGsx5kjHcTgGx80luSeMLoDjF1upfyl4N6kd/qlnBGGSEwuRfkw9LpCJhXQBG7hUUVL1PHn0fYPcUJyQSLAjT+4hLC2aWDry74ogWcR/kaNlW9cJlpbsXKbibAcYVJpzvWYNHcZJbz3bI2RPNEccVdAGM1WZKcGPwYciivsTZl3trBAV1e+mZK0tlJpjiTiA+B/28Tiwj24mTv+XaHIumINhKMP1Na+wKQy5s5jIoNjEGUnXa5u4K2GctMUpLkyO2lYuG/FxADI68bdpfpl90XdNAnWwYTC8tzgK3p/BDfl8zpR2AxH9aqp2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Mon, 2 Dec 2024 18:08:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:08:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 1/6] mm/page_isolation: don't pass gfp flags to
 isolate_single_pageblock()
Date: Mon, 02 Dec 2024 13:08:29 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <ECFA727B-F542-42E5-BE32-F9FB27F5DCDB@nvidia.com>
In-Reply-To: <20241202125812.561028-2-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
 <20241202125812.561028-2-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:408:ea::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e90ff17-2393-42ea-86ce-08dd12fc5787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6cqOyrpLmqy9vpAJk7sRmjcDB0eobxtJ7jeBA2EK1DbffagyVc1olVZgf5MP?=
 =?us-ascii?Q?0lrdF6w2D/w0x7UxIp71bN77GXEHIvcB7nX749ypq9X8XHGLzZ7jqfqAFjqj?=
 =?us-ascii?Q?BBcc1LzNLB9YybwYQz1/ALBXnEAeqPgMdh4HdLfscxS71z496B0z+oVz1FeD?=
 =?us-ascii?Q?J+c/VoKRGrQkt2cc9aCs0ynzojXcmHgPCQOpL71b7sPls+WTzwcKYMpc462t?=
 =?us-ascii?Q?wp95/3cNSreUv31UfMqJjfTbjhF39vay27BMYjgMlGftjkPX+UhDUMYm1QGu?=
 =?us-ascii?Q?JImeeQGkdRO3t//s6Qho/ugY+zU8OJTSfqiXZ4W+0FwanTUPtqeG/6QXMrhE?=
 =?us-ascii?Q?m6PQaY4wbeSG4NX5mvNL96wpFkbo150X8S5ncdWFMuj0qqOz2sPrvsakEhIi?=
 =?us-ascii?Q?9PB1ky/PQSqVZr7LJTcaGq15FpwE70HBPvkh0A3wMbcIK3gaKVv3ISBKkOqy?=
 =?us-ascii?Q?CKGZ4rKV8Zkw89AlYXqCnn6pyhabQYyq0JCexHdQ1mQKdp7OxyKWi4yZPqkL?=
 =?us-ascii?Q?3KQ+gqvjAZxSB/yes34giv7QuUemOCTTPdilrf3qrB+Ec9Ua8BSAfYPfbwYj?=
 =?us-ascii?Q?KhdKbYwU9fKWldsByrDFqocW8Cfl6wAsrMRBfgg9ZLYcUu5WePOFv8jHEjob?=
 =?us-ascii?Q?gcxYUJTHNALADBnASCxGAZiNXVlWiIZ9MSQ7A5XLSbyxVLDNiLRlkSpyuSXQ?=
 =?us-ascii?Q?MTdK+yz4dSakJxxUV6hZPmkQion0P4h27be/I4bKDuqr9eJAxKDhH01e+hjj?=
 =?us-ascii?Q?MITtmJvBCzU3/oRSfLnJtP64YiEMrhPiLLDRhb+vgv042RxbNuMCqApLBzwA?=
 =?us-ascii?Q?ZzKU4d4Osib8yS+/3tsNFVtT9YG1NeuglCOWI27O2vEINUXM66gc/ApYWQ7r?=
 =?us-ascii?Q?05NdwuOyIU8CaTzIMNEPfNuet6eiJdjsEAHFzueG6HJ+ttRMgcoIxl4DZ1Ol?=
 =?us-ascii?Q?nkzV3eaVOPO6bF2cGnJI6bVvSGvh0fu3EbVx+XysceuldDME/BX1Nv2DSNuP?=
 =?us-ascii?Q?pQiFAJoiS2iyMyIvuM/QqiBJY3NM14p+THhgPTbKRW0fso4MoMjsZHX1EwZC?=
 =?us-ascii?Q?x/lMdXTe0tiILhnEKCyE/MIZCzLvf1IrDa8WMejp2newzDbhwhOZMWMAK9/F?=
 =?us-ascii?Q?fUYb+U+gKPKUtsTgDmjLVtxcFQxd/HarP9mZrLHnmPwEYXifZ7aIpijZVAUa?=
 =?us-ascii?Q?njj5B+6bylAx/sZFvKPJuskCXeraiEkDlLpoSAgSqtacPEa/MGT++AjRzGtA?=
 =?us-ascii?Q?y5GZ3x9OWP8XW70Z8TCv+PaoREH0Xm0sN1unAJeCXmh04Tsc7h5+xA4GhIJn?=
 =?us-ascii?Q?alcskse3VBfC8DQHnh9Nc4P7pxdLIGlk/musNNGwv27S4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dQNNt/6r5R3peixAU9FkdLESIRy5zhXXgjNrt+Q8XsWMgkSmv9vjCNZxpBhp?=
 =?us-ascii?Q?6vGX8ka9bDwpepS/DpW8xrtuZvwVCMFhe7r02BY/5GRXHiFuugZJmfUgo0Hg?=
 =?us-ascii?Q?ULGa7/AGCofikmM92BYaztPgwBiLOmZ/0LXQKT+m8fD/5oqJJi9W01MbYPOj?=
 =?us-ascii?Q?Q0JQVdtPSXSSbMbDEoFovut5szmRDQzl0NiWdTONpaGa2uK09RjDL2Elf/MG?=
 =?us-ascii?Q?8O0wVTVy5jcAowVC5G9tbLfofBjQRQPFRGzB/vJcAsN2XgEtGMnYSXf9RRca?=
 =?us-ascii?Q?vowsp8ki+3BhBQ75tRo+DBhJ8IPNWyzs2kdxFpVoyTpSJjY0SJilclZ+jpNA?=
 =?us-ascii?Q?H4iMbiUirsRPHhZzGKxnQ7uOtZvAb/MCc9TWRgRzgVU3XCqbBy9X0jdq09RC?=
 =?us-ascii?Q?EuQgYeglzBkp8kkfDPrDE5WvW+51elQHRGbcUIH+60s2/yfxkOhoi/+bj5t+?=
 =?us-ascii?Q?r1/X1UTn3xABLEK2B5xsBEY5Nj/V1HRp9H2Ffl17dc/VZDQzBode3u5Knd0m?=
 =?us-ascii?Q?zGErk2vdDSbBa9JFpCBVyvEEnv/tmoL5FHUo9oXwgwMtINkNgXORUQBU6CpW?=
 =?us-ascii?Q?jKcNxE16QybEcPoauBORQ1nvsjHkhAufzxwPjn/iDjPEyA+luezXklsbj2+L?=
 =?us-ascii?Q?VdomFgiiCqv3XH1RxfNI6MlF2uWEo9VbKv/XGyP7ufCX3OtifmLZ3+AgA1tX?=
 =?us-ascii?Q?Nck8jofz3+VT59PFiyKrrVUA30mIpjLDJ2L98QMDo2k2MGzmwaYrTEya0e5d?=
 =?us-ascii?Q?xu35fQRz8o9U4KpOHNF78apUlMZgn9hj5mx1C9CAXmd6E/QdR6Dy6QecU2qK?=
 =?us-ascii?Q?QiegMFo7+2s7bEBaw4iHf9A8F2WINjLWHdzsrtHPcu6pz3Qb+/8UOJQab8rr?=
 =?us-ascii?Q?NqqHx7PB/wH+uTRKaTh8iuwrbvSFySdrgydOjwT2Zbv5p6lVqOY4kdQA87GY?=
 =?us-ascii?Q?ZU6wqVJBgIOtoT0Qm/UBJ6FTg4NvkgGq7dVxnwh4tXSwPGPBeWkLv2pDmfPc?=
 =?us-ascii?Q?n2TsaN7p4tBKMKSzKzKuKj5BfXOSTevRxriRf3Y4RSDbI+7WSt9joOwYJ64q?=
 =?us-ascii?Q?20DYIoAD5/a9YGBO6ZJLo1rbHqV0bvkEINhRCxan+Wc5CTDN/dcxyPOMU60a?=
 =?us-ascii?Q?oZcVwUxq0XH7kXjQ1lKPCAojKyVKkIgCKWiCQh9cL+61+oRF8XOIhTsUFlJp?=
 =?us-ascii?Q?A70tue6RlQJf4wqjXNrlbG7KB4ulP58+bi869kqcHwozL7sJHZu88riCkAx8?=
 =?us-ascii?Q?AEDmRGVUGveEKOehPSMoqkQ6gyBl9dviEYqV0TYxZnxcBbXMJ1ik9kEKJ5+6?=
 =?us-ascii?Q?sicrfujn4jj9hX3qIQyTOcQ4S/qDVxaTNYxSMU1HjkOYQYFLRhGrUAunYtQi?=
 =?us-ascii?Q?cU6ROtUUEwLsTC+MHJQW/THsRF+gZZ9ribUzDIF/2Fu4zC5mPtAKuwdZPHbO?=
 =?us-ascii?Q?+0+FKf724lW22KByOTk3YkI0UKcCO5+bUx9z8J0tvJmnnLKf91G1wgZL9t0a?=
 =?us-ascii?Q?pmEzwTz1OkIIpFoT+tsw6GcNYNm6Cq9tuOx80L8JwZpn6NEvqEBNEY2664Q3?=
 =?us-ascii?Q?RsJz4Kyicc4y0/QrIXXCkMpUlSfEpUSdBFEZKSa4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e90ff17-2393-42ea-86ce-08dd12fc5787
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:08:36.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffnGaDvPNUegRKi06d9FjKrzUfNaLe6e8lZD9ZjBxJ6ZFXxijSpFSqmp7Tt1kew5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2 Dec 2024, at 7:58, David Hildenbrand wrote:

> The flags are no longer used, we can stop passing them to
> isolate_single_pageblock().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_isolation.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

