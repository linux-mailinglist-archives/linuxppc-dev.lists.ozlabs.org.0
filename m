Return-Path: <linuxppc-dev+bounces-2128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CC99AE06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 23:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQKRB3Dlmz2yvy;
	Sat, 12 Oct 2024 08:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728659076;
	cv=pass; b=Gehy5R9LdLLL4ez7RmLR7L7TsTdS5V9ql/1YrVFM2oDmCwm2IG90CS0jxNIM5XmknqcjZIQV0p1NCJK+nOZ+v4HKDWeoM782tT3Mk7kq22hEIanCy/p7h8pXF5aekPg6bB74raUdc9j0EkGRpNzLuxKkQ/y/fmEpXsA4hfcNVNGQ+rbWSFJfNNaQ4mJd6WJYA6ljh3I9s0YRYixj18DYOGohlCGpji9ahU20dT6rlUpWKw2ZwezV/t6qMFf6KuF/r7ni0jkGD7Km7xMwc3qDtjk32oPzDKvX6ebG9NVV7EKMNdx3e6oUyJxZcPKoWapYaGGrMIKV63uQlq/PSGHtig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728659076; c=relaxed/relaxed;
	bh=SzM6jxJkyhqXaEu8ErVRE+ONRM4wn7MsEhsnUJgmuB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uu7rPQ/q2f0FzJzRw5Rv7UkZVKBiLKIIzkhNOcPlt5bYI/GD0D7NthfeFZ5yMWPJR9vCRzjVRUHTjFYhSO6sCVgS02tRvuSzWoauRLFHZl0g8bFYmz7QPOhFyVBdKfyALI9f90DKYltGaFn6qddxeFZWnsQLNCqSwrQskNS+DErsfmbZ06oUTgkH3c//XN5S091NaPQVcnEjH6NcJliB/KBu10M6MZbjLn3kEM9FWGNVrMIRjTf8FS0+NIX4QW6+2sN9NMa13JbQN6gvEo+Tl7fvhYONnIYSp9+8xmUABkbveHHnzZq1dTsydA3+J/q+HzTQeffhWm4e7dbpaubpBg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lZbUmsQt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::613; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lZbUmsQt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::613; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8zk4h6wz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 02:04:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLV4mKf8rbmWoa+adzRsP2r+ccu8ZI7Or9FFpJE+y6Khxx4HzcNYsdNXQbh72NxoVe2MaD8XeackZdKzkgLtXjfAgQWgqsY4+3iRhUDtWI9OmR0nRPCQZt60xiJYh+GbYpZOoVgydJBXanHI0bTRi+366Eoq0/5iQ1gV3yIXirTRWICTQdirWy0RxkagEKWvTRuyOH/bgWzmU3/sBcBQW4a7NVv8Ep2YUIeHo1ECUr8EMgdLu+5kr4KjndLfZSuw0sfK+NFpS+o5vfRJ4sJa5ll6LYgN7w1AYdgX8e3dqvtyzujysYOSycVYzApaVsK6b4unYSuGkq7f32LgyWkSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzM6jxJkyhqXaEu8ErVRE+ONRM4wn7MsEhsnUJgmuB0=;
 b=lzn/GZMFTkQveGN0iG1364BynNgDGw9YTeLCYLyYsxk4XTTeIcC2oMhsJ9VMRXyKPon+Kwo9IiE5Zfl83oCCrLbIfeQUmmfTmTpfJrPZleNtytkRQQSWgxODD2aGS5gmYs1LbAvfT37DJp0rkQLDjSuwg1TLYaXCw9DWPoolNAD30TyF9A4G7cnGxBQczgGxl99jMGdvpH4yN4RaRC7/Aey0Pj/eMsjxcKyfAdGLZKFg+8jcc2vn1QTfjKYe/cO8pAdkZODELLJU/tfjEPQzITIPpHZWYkaprBpIMU/sI7l9DlLfp+fDAUj2qlmaJx55TFlDtD85N5aV7dKyb3hoow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzM6jxJkyhqXaEu8ErVRE+ONRM4wn7MsEhsnUJgmuB0=;
 b=lZbUmsQtYL+YJSlFuRnJFuJM6101xMi3yDot6HajxFRd7uOv0c/5gskLSH03gGPjBuRdupAB2orwv6OUQi8Hw8b8ql2kOCcxkEhZZuh7Xz8MsH8AsIz6eMAD92/xRgWlgRqrqVYNchZAMzhWv0PxlMaQdeLJ7Qzh/aohNGkKjyoivexJcaP8HAthyK6pF45YH87w5bTPXV6LIG11jykOyWRHAT4PCQwwXgoV1OogP9RFs5V4Bj1MeJuu0N/8syjCrFznbwUz0zM5y6MbFBjnIAgsD0JUpsZGBsVIzKJISVpBw0oJrxuptqJxlVnewZKfr0UYxop1u+lyzUcOJ4rCTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 15:04:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 15:04:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v3 -next] cma: Enforce non-zero pageblock_order during
 cma_init_reserved_mem()
Date: Fri, 11 Oct 2024 11:04:09 -0400
X-Mailer: MailMate (1.14r6065)
Message-ID: <098B28E1-187C-498D-A7AE-CA4F098B0B2D@nvidia.com>
In-Reply-To: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
References: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_7CE6BB18-5E4F-4A20-9E11-566BC7E32CA7_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 7426a8bc-0158-4c82-c643-08dcea05f780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJ+Xs+M+1Nla0Jg2fSuy1eYcm+UOkW8a1eAJxAVsAfSo3EWq454EVwI8AIIB?=
 =?us-ascii?Q?/nnooi+PJfCbvuO2Bw+t4D+HnWXrtGJ6UFdgh0muijYhOEEpHlCS7c9Q2NtR?=
 =?us-ascii?Q?jAxhExkUQZikOdnAsD2j1HDoBrPcySDMFdmEEsRGa9DU7rEuDLqksq8WxYJ1?=
 =?us-ascii?Q?63eLoi0eoM5zrrVYwmviJ7axR+k/3xNmI9KhbXGeeFTC5OmszYU/YQWR9YB1?=
 =?us-ascii?Q?1mVoyqOfJIEq1yE/+3AG4RJZAT3vtus9mcntR1ed7dzpzfKYvRVeXWTEY0pD?=
 =?us-ascii?Q?rMDT+QTQzYoBrAROfkbOMbaicaqYDRFrCqosCcIaNWgJxgD1NfClyVOcRHSw?=
 =?us-ascii?Q?hAGToCTzZoE+bKMib18gPDwDlNiaDzfOQcFuBv019E8v8JbyHcC0VAZwfzzj?=
 =?us-ascii?Q?yHJStVG34/Y/O7aZAhx46Oychh8ip+QsRuSIm7VxlN1RMkFMIVeXTs8TczEV?=
 =?us-ascii?Q?gf5vKsDLem1FgqC2q8UMCU8pCIZSuiYmGUXcxqJzcEWtL6Jr2Z9Sh2Zl4au8?=
 =?us-ascii?Q?7I3ntI+4l9E8qnd7q9jMuC+uGDr2emMTrLf9PhJKNSgouDT6GvrsUTLG5UfB?=
 =?us-ascii?Q?+41JX9EuidBVYN+cUTX0nORfjhKArtpqGCY8bvTr7JBqRRtMuQYtmECpBiO3?=
 =?us-ascii?Q?5igT7YXeVupH8Q2ivpqrpCyx+3GXDT5qQ7Y7PLneAcFWoNcORFCnuMt1Fi++?=
 =?us-ascii?Q?ngYu19pyEm3lyiZ0TvS06gjKPzqihevze2nJI7GkQ3wq0J7/EDdFRTeUBAcj?=
 =?us-ascii?Q?9CZ1a2W8N2cRIb0RG65FGk8SzXSPqrvaBig1wJNjRHK9PQsSoD4bZRFpXC8R?=
 =?us-ascii?Q?MaiJiJPok1G6NS9McLhOvREhhYtnykQ2SyQI7YOuxFF0YcVZQfOYcyFzVS1D?=
 =?us-ascii?Q?VptgELn46/b5icEwt6uU5GCirhv1Uz6CcbT5kQm/5lv6/FyzVsiHNAx2VS0z?=
 =?us-ascii?Q?3DGmow/jXxZDgOXcGyC//5FbrMRmCxIH1uU4AoeginVsB3On8ZhfXRG6ICQK?=
 =?us-ascii?Q?5GxQVX2U+nvtjxjprF3dR3LilVYucOZDQO2rAr4zF9i47ijrXtOY1AoAzoNZ?=
 =?us-ascii?Q?nhlKWKpGki07ziyoX+U+LRx4bbosKYiOAH4M2dGKtCUJXJsxKUvlJQlF32h9?=
 =?us-ascii?Q?fANLTG6U5WZ4ZfegYPBALjthgljREdTP4d6ENE2RdT1R+vzMYg4nQwaIVEqy?=
 =?us-ascii?Q?795ohvjjwtP5Axpzwnt6iG/Xmbli0z0xCDT5sh9schu91mMVccR0ShSb0gb/?=
 =?us-ascii?Q?+M1HBPrM4YKBuX8wsIQ6P1qgXVY/8lSK/jerLyTwvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P2z87VIbisIS2who6fEIzU2r3w94MaD6nwidH4wO+w79KduFtBuneXzrNkHI?=
 =?us-ascii?Q?va9n4U2h+gQNvibCJG3Axk+ApIZaNwYpWulCcGO89zsKeqzXrFJV74WAS9UD?=
 =?us-ascii?Q?WqxgAOwlMhEi0sUccUp/GZ1k78lMQ/sED6+M5c/NrvFW4qwyblP67UmEE5h9?=
 =?us-ascii?Q?gtqQV22FHkKnmhSA6sS/kxTcSAcBRwqxoLh7i7Iw/um+fJf0tti1Uo06XYL0?=
 =?us-ascii?Q?Z0/MXEfdzuHDK2IfeDKoUXrhYOqxiSX2JELnNOcQ72scfoHaGYxVt3ruoDpB?=
 =?us-ascii?Q?Vkmy9+IBr8jwqvw/qP+PXRzaHQbe75OtHM/GAYMigsET2qrReZ9ceTV9nmtE?=
 =?us-ascii?Q?PD1IPBv26S1N+cu2SmOBjB9ZM5R1eDP+V1nWO5mHURJ3Gs7xTFkyvAoAWues?=
 =?us-ascii?Q?O4sqKpEQxRR3fc4kN2GwpxKbX4ouk887zsqiW3KCNot2+fNRs5W29SFjruPw?=
 =?us-ascii?Q?XIefHEv+1yRhPpCgsOw3oR1b0MO80+gNCy3nxAETCtSeyMIN+fOkz4AP6iNi?=
 =?us-ascii?Q?WCFELqauINMMiSK6BOr37bFx9aVBpJvPiGr2J5pbQrGjHQEbFQIeYGMhkCv9?=
 =?us-ascii?Q?tGEWnkvCpZI7axy+0s0Ho0JvpHFRq+/12Sv+fKJSAEA6Z9PGc03+56xyJZXY?=
 =?us-ascii?Q?a5YYNNVeOj3tNYx9F6uX48AoT+KhFlFv3PKUmvM+9O+w7pif8zKtvxuR4ecQ?=
 =?us-ascii?Q?NeN3TAFpNhN57eGme/U1paKmwQSlUAXpE/ItZFG61J6fSEJrecaiLGx/hwRA?=
 =?us-ascii?Q?J/ukKH1uWX9uMlQFCgvKN7gthen6D0scuPyLM97ks4o1uADKt6z8SaA2vL6p?=
 =?us-ascii?Q?zsU2MkXA7pdKREX1qcsNropPu4rRiKCZRqV3yGMLNOjoMU4R7JusoCrD1qaI?=
 =?us-ascii?Q?uxPFaQk/kJDqgh4lua6yJpcI1cfljY/g7fb83lLieL89XulP30obHa9Gu+VB?=
 =?us-ascii?Q?5lALqnLyvM8DhzfAI656mtOu0I5GQYRvqG0hUBRjI7OQO9lf1oHUjHNYzjTl?=
 =?us-ascii?Q?w9oDhojX58mFm+n/H48pzIx6mp5BZsLwOPP6nNR/TDQV8tOoWSGM6mese75f?=
 =?us-ascii?Q?2XF44lEPK+Z3bdhQeMVXp/3UPOZfNlgGr7h2tZ7YisuB0u6UBqj3ZeybKOif?=
 =?us-ascii?Q?atZodZtsJHE+9fPXZsb21f2dVNxlYH3DIJubE5rxHBAUCA4pXG1lj8OTBMbo?=
 =?us-ascii?Q?9mkfzR1CWULP1es+sS/2S1K9D29bNsQy9NThyH/+UWHIJ3Kt7LQvXR7n/T+w?=
 =?us-ascii?Q?2rCs+fTTxkYc0eXy1FTG+MI4KhR43k2au+A//pCgOVp7z7hl8KfnseOkGAfN?=
 =?us-ascii?Q?PPEMVk8YRros1Lm/+kNsA0t7+2+bI6p9jiLSX2hdGMdyjBUY61knD49oK1Mm?=
 =?us-ascii?Q?FWN0Rnog4Pvb/oGYdWtU9tE56bY7IueaumN9TtLy59omRanp1cmQ/hyWnihd?=
 =?us-ascii?Q?BFSIFviQeOKmSbPGxq2yoicAQibcrtAyGpgrJz1PQtAn6Nmg1BMSI9ctt6xU?=
 =?us-ascii?Q?edp7v/o6Rt3HI2y3Uq8i8Ga5lo0lhBZ8rWgBuh2iR6NzGOeH6F5jOvVvO+Mp?=
 =?us-ascii?Q?dADcFajwkXzE7IuEVH4FeEIM9lk07MQdpbIpoPAC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7426a8bc-0158-4c82-c643-08dcea05f780
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:04:12.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBrsDUi2uhvA45VrGlBNGi+cuxXVPSURG8kO+dq09+UwnhoJ2EZzNsnmJA4iPpqh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--=_MailMate_7CE6BB18-5E4F-4A20-9E11-566BC7E32CA7_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 11 Oct 2024, at 10:56, Ritesh Harjani (IBM) wrote:

> cma_init_reserved_mem() checks base and size alignment with
> CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> early boot when pageblock_order is 0. That means if base and size does
> not have pageblock_order alignment, it can cause functional failures
> during cma activate area.
>
> So let's enforce pageblock_order to be non-zero during
> cma_init_reserved_mem().
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
> v2 -> v3: Separated the series into 2 as discussed in v2.
> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.=
list@gmail.com/
>
>  mm/cma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

--=_MailMate_7CE6BB18-5E4F-4A20-9E11-566BC7E32CA7_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmcJPmoPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKObEP/3lRbzXWFqp0sbvtUdZdE45HG3NFfTKc6xxm
ya9agQ1pgW19FM1nbmk5AtgsWuO/4PtIh67Cwp/3Z3X5DKzFnD2HS510r7hDzBTk
he2yGjRcShpz9NV0yhmCW9/DR4sY0O0QEABzCxXJAUl9w+Ku1x+YVdM3yiSLCAcH
vQdxsqymvFhfwwqw1LtoNXlYw24/v4o1iIO8bxqhpU1LjnbDFK0pVA0i7YOCBPNO
/dT6YQN5w3A8NakjzAWPYtG4s7iALfbj+ePIdG0sDVJSCbVDemiICRDEfyCPfk0e
Mre9xUq5OEQZHeWtykUreME4ZDcQ7PNfTqS33a7y4QSEOOsR6tFfCszy3TxCpLS2
IcsSaHIbg2NJGJobBZcvsnsSpgZNZdsQLq1idJG6SeysbEHwkwBHzNaFSFfq43hq
+tIP8uzRjIEsHMDfhBlgvG9OcgFoO5uCC/d+7Yd0BbSvot7IeVzUijHzeFl4QpC0
CSgsIDu0e3o+ZrdNUFDf8W+3LS9ukkK3PwM90MHpmZqMlgSbtxRcD1JDLS8BPfIN
D2J22yjpiBZCYEcglu5TjDw0YxPQ8P9neRX8+9B/7GeGReytoBUsXuA6PIujN6Wg
UamdMDI3GMmrSZRayKB6CbPGkK6KYweYH7nDbwtidkyi5l4n+ypTRMH0T58vLT/c
KhmA0LRq
=Xkq0
-----END PGP SIGNATURE-----

--=_MailMate_7CE6BB18-5E4F-4A20-9E11-566BC7E32CA7_=--

