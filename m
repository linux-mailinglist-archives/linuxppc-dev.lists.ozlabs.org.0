Return-Path: <linuxppc-dev+bounces-17531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCXRMHCXpWmPEQYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 14:58:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C41DA3C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 14:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPgVz4DnLz3bW7;
	Tue, 03 Mar 2026 00:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772459883;
	cv=pass; b=P9OpasK3EVKWocQujBMdaRk7LsSDQim53ledeM7LORcOGvBu4wavAJ1K6Z3XKIF8LcTh/18Z5WzrrCqaF0PZDsqF/tHlWUxdgQt+qkpQGuCbeM3lxglL6Lm4dnuxxsLGxm9ygBpFPHePSp9VfALCM+e2mJyCMwRHFO+SRxSZOkiwmoM+PIxBv7pZPKItEeFU2fUwXCZzZkNickCGHeAAGALEEToq0GOkm7gUBCrmq1gKAeH6MYLLHlJW7nogOGiDJ15HKmctsKzfomDMFrY1ALPvm7A/ybNOtWmRUn7/qU2donocloqspeAkNDVN+sNOxo/loswWg90O8bNi2Zmjuw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772459883; c=relaxed/relaxed;
	bh=s1qfasEMWmDS4VaeKimxkxaDdhGdG52aNCgLcbVuORs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QeZnrkauvHSJr35Bip3Wb9w6L3ffjQVJNC1vuLqCPE8A14WXpkI+P54zwlhgcWjPcfKvQk2vpzxBVBtiTjqlgNyiLvKhSX1lFh3DT/pVsNOpPd+vEcBPLlu++4VDlhv4KFiQuPeU66t5q2lfhMjNL2Z0AOM+C16ExosXUe6MAPBLFosQCnUDCEjcOUQzH0f0Cf7zr0fXwwOqlVKm3l8DyGbnYviS8ghMgy+ZpaDV9OTEaMJkXzgtMdI8TxCZDfED5n4/GQIbizwClKHSjtNEm09E6GbYCSDH5AZrxlMyaI8UJpJ3vSmHrNhWbOgO7DioO/FCj6U50JRKhiEQXY8qHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=DsF2MTxI; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CY+RNJkr; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=DsF2MTxI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CY+RNJkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPgVx5D8bz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 00:58:00 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622DLiF03498359;
	Mon, 2 Mar 2026 13:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=s1qfasEMWmDS4VaeKi
	mxkxaDdhGdG52aNCgLcbVuORs=; b=DsF2MTxIVqIA5Xu5Y2/+bbvSkYziwU+7rI
	cyP3rsnA6Hi/cFkOs5WHQyR831i0yHLUljJ7Empnpqucz+1dKUt/E76r4Zu4a27W
	ysIHnqBF1c5kZV6jVyXqDHUYMTNEbRhcyguL+VRQcGgbuE7ci22+5KgWIPtJ0LIf
	4pGObV2o3Hz1jWD2CI/qMJ88AWuUMC3/iZVBOfzNDUpFZdTaFSCz1A7c5VMO7Rc+
	MmPeP1Loapj9uhzCy4pEgo3kCQ0aYjcLqeYS1PuERXkljdACRSaNyj0n6b4zORrO
	FDMpHjek1fwIaim95IJRVar7IOkV/mRvCQi8QJtf1Oo28KKf8bwA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cnbc902jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 13:57:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 622C0Jib037769;
	Mon, 2 Mar 2026 13:57:21 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptd8802-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 13:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PptwxL6iE36TWrwiRMNwlfyez9pBSS/AU9HSiW8pVnlQg58Z9V5dwWOBb9A+/OC7Ny3KXZfzfuHiOlHwEJyC2tauAaWyNRWDVa9S3JTZYYPQisiRz/BCfRQKC+eE8zes72SzbW8OsjKUJ2xD84d6/33BqUearhMcvI2JVjGKPLqaAB2gDcCgMDqCHonzIUZgoPTqewrVms5VmR72rmeKND/nzYcBhJj5Uz6omKpCOvzeP459uyM5zMzLxTTJf2RLQpaz2QRTGnywMoxakHmW4VT5epywYY+SMd+X9TDIOLYNlVxdTytVbmT+XTGLu03MRQqs1wtjxntIvkX28MjEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1qfasEMWmDS4VaeKimxkxaDdhGdG52aNCgLcbVuORs=;
 b=scXbBOxwxcg3pqFoHeV0GXU/SztwuhzDTekyqCv6qL6hhER3ADVYV+xFWThqeUl5ho1tpCwzboUwzwkymzVvZbu/nL20F0PColW3Joqg1lo/C9KnFh4dt8zgrzrJYMDdi2R+AylOAT6O6Dvq1JPZe/o0x7+NiGaHZoUcwaNnlTjI+Z5Kfl2PJlF6RJeYInJGb6ht+5dBabUxmNLINSr5I2ryVmF3FWxpiR/RqZdjfdMG3ljDhzWDLQoXAzpXUHfdDTHrKFXOdTL6HSU6Y9+6qy6KPKqGhBCH19eo+dAsJ+PgML6R35MSsz0P5PhmUsNekFk5jkB+IGIjSlya+Q0ASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1qfasEMWmDS4VaeKimxkxaDdhGdG52aNCgLcbVuORs=;
 b=CY+RNJkrNkZ5UGJbqJLpZSNRUPjQqTIl/1pvYwJpQAtmuKQecD9ZkLUxLJXzvxRmOoZr01+E2aB/8DEpCjgclrO81dMvc182g4f4t06ykqZuen4SCwm6vh2I0ZgCfEinXBx6vvf9n5eaiyCzPtgmust5BUrvhNDGUrSc576qL18=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6838.namprd10.prod.outlook.com (2603:10b6:8:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 13:57:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%4]) with mapi id 15.20.9632.010; Mon, 2 Mar 2026
 13:57:17 +0000
Date: Mon, 2 Mar 2026 13:57:13 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
        jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de,
        kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au, chleroy@kernel.org, borntraeger@linux.ibm.com,
        frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/vma: cleanup error handling path in
 vma_expand()
Message-ID: <877a55ac-b12d-4997-8c0f-fc0405220a63@lucifer.local>
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-2-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226070609.3072570-2-surenb@google.com>
X-ClientProxiedBy: AS4P189CA0049.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::27) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: a67df607-b719-4fab-3ae0-08de78639d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	8A6Y/xYV+RA6Ypswg0Gai0lSpAWqjBHt4vxzw9dpPVFqloFafj6JV/bzD9CFbUMMI1Za0eJvra4FfiCsJk7exuNlftnQgQ4d3QDCFm7KjgxmnKX7Xz7WlFbpMC1Vm9i8S/TgllGdqKe5XMx1Q5CVZguaPwSnHgLTZhDmuM555QDtT5NVPXrbRKA0tYaNVhiwmXtufeOeuNnZ6XVT7ZHx2Qx242YkH9W2K+pZ4tTciLZSHlBVQy4qzbyjaXOtXuSrfXfZ+rZA9QLlDRZSg4DQtuegxBHQgEGHog9uLoQ8zZvLgMM2xKzLaHw9pobx47sloPue/CcGiV6ZBSVZg7CYu3sMCKNyKd6b3w76gzSppRXNhstyFCurtxgWb2CCLBoEQRtcaeBXCbpYSpRnS/IFJQB20PwCFVMEXs0AMjFI44Ez7JTro3reWB8RH9+AOOZjpQO/1QiJRy21o2L6rfbsDjqfmGPKnkLPpqnfXJ3wvUmuFcVoAbnrbbkkIlTKM0Mka+dNHy55yBuIdUtO6FkIfqJva7Ugbw3Z+UgI0lC2U+aSrKTJNg83z0PSGev0W1Ngt6UvR3KZ5c2f4TjA5dsXPlnoexFaCOpYypAFYEGec+1Y4Qlz+4Ohrq8Tv/8CCTHKgb+6VFNuepsN1YR9X66AMcM1b86T3odmog5hfudGVB/doAsjWBBjVhzQu+ogyx3p+IgeNwMDpDqAzBXkD5C/ME3HfP6T/CEg2rLBxTifh3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NuqvE95C+y0binJuSuabrgJ/KlmDERlv3duHTuRm2O9S+YLYaJKVjrceVId5?=
 =?us-ascii?Q?uKH++VjxhUVbHPOUcQGUKKtu80Y2RegCyfw/6T3TMUDI10q/XfBQ1d/iEYvq?=
 =?us-ascii?Q?MqzoldLloqmf8PXT6dvM+oODdbX2hEi8uTooiNp7hJRfPYWdvd8+yPfDqtsN?=
 =?us-ascii?Q?KeInnuV5tHWerpJfax3xJBIpHH6LhMezTx+Q92zHyJGSlBJ5zsSVeHXhmHYd?=
 =?us-ascii?Q?vmD+UuCpIyEcBp6SnR2rogfzssQyCUwPoRmqN3T5LE3kK0KFaQLHUclWtRho?=
 =?us-ascii?Q?OiEVW+LD3PCJqHvFKipUKYJl7htvNp5iTMjhn6hUUhTE9/QnzzJdYb6KgjuK?=
 =?us-ascii?Q?iOV0v15ymY33+iXboQYpNFr+sNjdoVAcaHXyoMKwRSZWxrs/9GexaU3RsN6O?=
 =?us-ascii?Q?2GjqgjvwIrbiz4r4XoZWA5DEZXXuwQR/9k4jwxRgZWyHWRDzWsKhKMQrzaju?=
 =?us-ascii?Q?HMrQlaV5lO6+yAGCgPDaH8uYvKQaiPYUTUUNFECjMaytLEBwXKyqWscKugZb?=
 =?us-ascii?Q?9lJfTv+0uV+Ae6TvB3nWZyBjA5cWAqUsJVsxR0AKPg+oROzGo4o63tTbFK15?=
 =?us-ascii?Q?TE2XICVhohOZu5MFsUmep93OZ3AOLyJWSZCTi05Vpo+19GlVqjQyuRGdsB8A?=
 =?us-ascii?Q?PaE3y7cX5uIo4f5dlfIvSrXfyCVzrgv59MV+B+aKNKkv+4swB1fyOVebjruY?=
 =?us-ascii?Q?ya9O64jXm0tv3fUrkILmQsd6ZPUEwWNAgWzmT25wXcVfA19+uCNuKWW895qP?=
 =?us-ascii?Q?diPIANkOhZk459OQDgPHKNrCm4RAYEgwc/Yunr9tHV0U1iUiTiH9T6a1OzEX?=
 =?us-ascii?Q?zSCLWvn9vzIQ+tuNlgQh4CzFVOnF11GlJd2SGvSKHM08Im+qa/JaQOXZ2hfo?=
 =?us-ascii?Q?kkkl+g4mz+OfCOJGQ4OKQJZ99/ZqrcdNpeXFHZVJbixhPCLqYQ73qoV6/l3D?=
 =?us-ascii?Q?AS2q9EZi+9oEqzhQgUvov/YEFpnojS0PWY+K8IErM1PW1J71f4ZGovmY5jEa?=
 =?us-ascii?Q?CTQojZlGxJ1quzSL/mDS7XWP/wCU3hqKyXgSsiywW/TKxuIBvVlv5Yh2C9le?=
 =?us-ascii?Q?kCFgg0s/2ni9t6cNg7YO/bECrnHZsCy7ajh4ZNfxD1/RRUkIZjB5iMKjOCjA?=
 =?us-ascii?Q?toIRzGCYZxNX8WdEmdvP7VIHTv+lMdzLcNwLtoO3E/PA5aQOtQBmfctsp1av?=
 =?us-ascii?Q?MQ/Ztwqeo6FqHcWTXh2OfgpuZrHo5ucPbseHYM/EyGVOLfUwRRksGs/2pu+Q?=
 =?us-ascii?Q?QZWAZYRb+s6HvgKg3RqCLDQqL7WgMzeyjbgd9ChdC+FoIKHRNScwbhnnl0D9?=
 =?us-ascii?Q?eNC0kTWQ16Je4LGYh9QinsTzxyeujMfwdtnP57TMqPo6mTewOh4FfML4KRvA?=
 =?us-ascii?Q?BO7+AqC2vKmtD0GP692PGrT9JtndZ7W1TcYv3cUR+7f4D+QcUbZqSYQmfTio?=
 =?us-ascii?Q?WZuY49+MBCuCY1FUgkUMyMtuUbPqdb9GfkPIJ/bzBfzSywereFW+aXPdn60i?=
 =?us-ascii?Q?uoJqoFJSVMYG5yOse2RSyU0iWmI9w+Z8s1SmkUsU5m+9fKIz5Wk7ngtILr4Z?=
 =?us-ascii?Q?/h5IZjZsCkPL6GClvHH6uyjrNc3wJM4zHd42GQR1f4bRa4UbOmRJrjB5d7rJ?=
 =?us-ascii?Q?wkh3l+xxpy8NRQz020xB7ZVigjFSNDVowgt5zf0Av2+LJnJLiP+0re+a9e2L?=
 =?us-ascii?Q?F/swKmWyxBryIjPQzPgngxVgF6FKlZSwsWLQqa+xCb+Q1KiNeFdvl/HDfEgD?=
 =?us-ascii?Q?r+Z6LKYgDIug0lsM1IWJ3Et1DjVOVOs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bk1zATV3R3FeIgrJe7mEomPMseFxqwSUYwWErki7n1kwM3BQ8aQEDxoQ8WqReOGRdzU51y7pUIf/DjeCOeUIjLYjQXlCMDjGWBnLbK0HIoYU01s5h2CyFAqaeABVLKx2CzBl98gEZ432sTsAdYZjd7+vtli13j9PsFI5WsSaougRWH6eYr9imHmBQYrfwtPvoAzY4hKcka59MakXe8vzISaU1r+dH8BtLU1ZBxACdLorLdINHRi/NO4C0ZQnWf+45OpJXO1W4l6FMDWdfFnSP0zrNS4vagFVjusxX8d40yb3f7vmGZDfxuEaikwuVV0/W+t990LRgR5UBW38izCcuatefo5IdgqmTxkH0qbPdehPPaaTPN/dDNnIs1Ju7BAj7HJTVscMIPCMG8ofMW4vrqfnQGZCPAqTO4eUYJkgoLoXdjvw+qowOdzBWGi1bz+cULmh7v3kLESzce5GGt4Em/ONctJfuW+lylVBDY4VPZ5HWzzcJ3++Ta/9ZreIhN6tYrXQbA5kAL0nrZs1V34WkbMJoidPfcMenjBdRaqNGnfiUMmqfV0EI0lADx5EhtwAod8dMPqqc/fiGOT4+2VfqHAtZZnmrHvGLh4KNmk3qAU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67df607-b719-4fab-3ae0-08de78639d5b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:57:17.1629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X/QwnK+6+JZIG0ZFQpetk4MJkfjGhIWvm5jPqHqey/OEnY2+5Y3vWFB/kzZuSU9KmztowggRr+eSpQ0baJElKgVjmuHxMKrhxwRw+luD+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6838
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603020117
X-Authority-Analysis: v=2.4 cv=cYjfb3DM c=1 sm=1 tr=0 ts=69a59742 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=1XWaLZrsAAAA:8
 a=yPCof4ZbAAAA:8 a=OF6kxwJpqsOYwMMz9xMA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13810
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExOCBTYWx0ZWRfX7KGmopciTqX1
 Rog6iA4gZxul4xvWr+McBbyh1nJm1xHDN+Y2zMrVvnSFOxY6cV83CeFAQC2WBWphp1Kaqq104P3
 t4jtvvB+n+K8+Af4vAzQ3YzhaEI3fmAEK1oXvVIK9858m8FLUjFMaPPkjYdZDleVnGeKZG6KZBX
 UfAlP5rQPjHFej+/hz7TRX2lL78u3+Ci7tmvU4s4vI/CrCD50WCHiKYtCbRUdBoFDkXVQ/Aju6X
 W9nvHypay8EFcdHXzQBdyRsTE0f6RgrJv6aLUe8nZhlXbhoPXt3dXliik/rDXBgY88NOu1UJJLS
 qhYFmUvNUAjyADOu+y+E2CZEEjQg/JMEh3kT3OktPhr54yQuuMfhUzg/4Lt8KDZtA+zsPQLifi7
 vIXRdXhROL1Ky5f/8z8Noo/UJ+wvoxYjI36MwrZbKJAo7aYbTWVQ1fbh5sHN7dG/nMKqLQ23c7H
 DVf9vcmZxItiSi6DOhCMd+X1Ig26lSNFlj4osykY=
X-Proofpoint-ORIG-GUID: eimM0tO95bqLedeoX3idFtBTupzaw62l
X-Proofpoint-GUID: eimM0tO95bqLedeoX3idFtBTupzaw62l
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17531-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuahahnjy@gma
 il.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,oracle.com:email,oracle.com:dkim,lucifer.local:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C21C41DA3C3
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:06:07PM -0800, Suren Baghdasaryan wrote:
> vma_expand() error handling is a bit confusing with "if (ret) return ret;"
> mixed with "if (!ret && ...) ret = ...;". Simplify the code to check
> for errors and return immediately after an operation that might fail.
> This also makes later changes to this function more readable.
>
> No functional change intended.
>
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/vma.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..bb4d0326fecb 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1186,12 +1186,16 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	 * Note that, by convention, callers ignore OOM for this case, so
>  	 * we don't need to account for vmg->give_up_on_mm here.
>  	 */
> -	if (remove_next)
> +	if (remove_next) {
>  		ret = dup_anon_vma(target, next, &anon_dup);
> -	if (!ret && vmg->copied_from)
> +		if (ret)
> +			return ret;
> +	}

> +	if (vmg->copied_from) {
>  		ret = dup_anon_vma(target, vmg->copied_from, &anon_dup);
> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
> +	}

Thanks that is an improvement!

I was going to suggest declaring 'ret' in each block but that kinda adds noise
so this is fine.

Maybe rename 'ret' to 'err' but not a big deal, this function could do with a
little more cleanup too I think!

>
>  	if (remove_next) {
>  		vma_start_write(next);
> --
> 2.53.0.414.gf7e9f6c205-goog
>

