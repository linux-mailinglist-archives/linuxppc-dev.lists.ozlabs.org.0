Return-Path: <linuxppc-dev+bounces-15819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DAD24248
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:24:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsLGQ44z1z309H;
	Thu, 15 Jan 2026 22:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768476238;
	cv=pass; b=iA2QUY3exjgUs3/AMT1jh1FJZXEsbtttKRgx5NRpT8cTC0qGf55/2ZQR1VcfekJQpUzKe2Zj2cE05SW2mdn+u+4VtDsa6mdmCfY8zmdw0gAH4HZVH4loZ/XMZpelCpCfM1UXoxsyJ3xqE0pcokY1TNM18zzD2o3/bDCH3vaBod8TJpuUnAD9dmV36sCMOrCSXFcTFWmqeB5h5/nPRRvP9uyH/q7hDzs2ROw4XwtBm4pkLvxn3FyFZUbg9yn/6b5u/9y4+TEK5h1Sr9kIihXub3Kt5WbgfTrdqxBiCil0vJnFRFnmZ+C8PdILnJWqy84pYeZc0IEFDUI/AuGc3+LRLg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768476238; c=relaxed/relaxed;
	bh=hnkktXkgDgJppx2+9J8dhfjf/XnJ85GL+Bv89u5EQ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bOFHt9TIJPcTLMawl+d7KPIqy0X74xbCTupeS9MRSxQDCbkrqPNPtJRQkHqP35M0b8IwGjF7wo5BuYFgUE3ZQirUdiDh0QxwHrPuHDxeLRobKkgMjNv+VyCviBG5Cw11ra3BUoLjAo5fPk90xDqkP4Qkjo0zoIEUDuEmsi+T0DZtO2jU7A5h+xZuY+dfAHQI1Z57Y/7MoMG6hqTeqrhi0tXaCbkETIsb9jbjlfVNpc75Nc6qKmO6x+gLrH35/JfesKg+5TUHZn/VQOcCfjBCxryyXP4mNXsLeBxy80JYfl73+3TADnjdJ43a9otVNvEOKHWhh9B+/oqCLfvMnLNNyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=LJRZJWVI; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=x2aO+LzU; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=LJRZJWVI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=x2aO+LzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsLGP3k4Lz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:23:56 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5T6c31360897;
	Thu, 15 Jan 2026 09:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hnkktXkgDgJppx2+9J
	8dhfjf/XnJ85GL+Bv89u5EQ/U=; b=LJRZJWVIZHVqoGrMCyahm+bBKhGSRtjrFs
	irqSy1PeL26u5gsox96RCwXcSqEPfLZtPOM0GLQ0idZpbnXonUX5o7T0UQhY8++J
	E78Ieu3E5sPBtfk2SklpZHATJ/8zp3LKlgCOL+4I+yQ1jDsPfz+Xy2uN/hsojXue
	vnG0JuJk4jcGGS0rzhExg/B8HynMrtib2xzLOX3tYtwMczY+sXoK96mSwO1gplPa
	+ZH5BgAo6bv7miEQxXjv8Q8u/HR/IEUsyonKgd19q4csjtdGMiBMH0tAtWwLQz2p
	8C4b9n3gxP+RlhbYkUwxcq0mUkaWTtDeityEn/eqIlqXY8bSkrTw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp2fau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 09:40:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60F9Snui029308;
	Thu, 15 Jan 2026 09:40:03 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010013.outbound.protection.outlook.com [40.93.198.13])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7mwyvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 09:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9UYRKkGPMS8HBviCDvA7wXw6KRjHenJfX+OUpVBQz2rfRyPhJ8HE+hINLQONSqujpwraCO0PTOzbl/wdZC+M/Q9x6TZ2szt/Vpm0fQ5VrZlhxW3+/a3IbWG133JTCPzCEt+vTQrAN7hogSIFAnhIrsiv/Fa8O4UhxDD/o4+qEQLwWFKQrHxANJwwWvWAf5cABPP8ftvkqs2xUnguCA6nR9xMtL0Z22mZldMnioyC6N+Kd7oT+BMBzB/G4QWZun0RLXa/p0aDUO9ILVBJffRVXn9XCPiS2EY3lkw2mcooDj/XsPoQNT6mtYgAegHGGoD8T2TZLnLGCd5lhygEgGYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnkktXkgDgJppx2+9J8dhfjf/XnJ85GL+Bv89u5EQ/U=;
 b=XbGWOZ6wrZB7kZJyLLQxphyanDGqIG42caXzBArVrtYzgX6IC4L0Dbf6+Xitizyy6f7mWV1DwYS2ERLjHv8KJWSt6F3TSqnFsZorOcXr9LsqbZYgjHQJFMa3nwHfTEy8VvBSfN7vL36/EBRtw1sXkWh/d+WP//2lOEOQ6wzTNKu/Rpk+thTdk0m02hU9IB834ME92JsKyjy1xq/wzaAy8xVPJTaQhZrHtuEOWpl/6tzXxk1Blz9db7ualQEmwlAFeLCuZwWe2mkD75ZdnXPq6MYcooWrzJNX3YzCn3N6PkxqDqgEej+PHYRjqjtfV7wngnPeRhJHakLgd7el+J5MCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnkktXkgDgJppx2+9J8dhfjf/XnJ85GL+Bv89u5EQ/U=;
 b=x2aO+LzUvMWBiMoTraPqrM1G3AiYem6ZuYeG29fJgMS2l+BImFXW60Jqfe4jLErW4dG5BhKx5U7ggQKqVhegDpM0hO4Ozz4KnmsQmJQh1kS+6r4x9ee4/R48erYysQvf3vuCeeN7n0KkQ0UsKgpY1p6A77S87/C73tJh7Hg5Al4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4325.namprd10.prod.outlook.com (2603:10b6:610:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:39:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 09:39:56 +0000
Date: Thu, 15 Jan 2026 09:39:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure
 to "MEMORY MANAGEMENT - BALLOON"
Message-ID: <f2ce1126-0059-481c-b54f-0b09518666d3@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-24-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-24-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0609.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::11) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: b50b77af-d2a5-4fad-52b3-08de541a0b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9rEGBxXGm/o69SwmsMlWKlooAlgwLZIRS9lGKOc7/06lFJMxq7rI5VmzgDmV?=
 =?us-ascii?Q?LKyUY03QsYiDjgIfs6H/Wa1vUaIM42Ng7/rMEmnn9HFp+ywBQ44xqpNM7FSx?=
 =?us-ascii?Q?CK+73CuWG9rF8zECehsYONUOqC1g5u8qME3ic1sKF3TLwChy/9xToL7BGuEU?=
 =?us-ascii?Q?AhKNah/4LjXedQtWBsKKgq5S9Q3GaxwGGDE5//3N5YpqPxEAREZbG6Z62Ho/?=
 =?us-ascii?Q?1TmvAhiYcwsArNBPkfaJFvLjMu/hfBo/8o/ygxoCuPHAtVawoKnKqmDSNgPG?=
 =?us-ascii?Q?Gg9arTzrdFaPcCxdrJ81iqpnK1Z3KSnjwLdgkyK2dRJUJUk2/m+B5IzdJRfb?=
 =?us-ascii?Q?K7JeGfvYdXDAsxrxL6w4DLLZATsI/LvmJatVBP1Qzo7qzkqP5+fKuA0msJro?=
 =?us-ascii?Q?2y1sgq/Z/GPTj27SkZRiH5UHqsH1jF8rh42vDIxuZkYFXhHULd/k+QOC5vI0?=
 =?us-ascii?Q?l6KJGm/GyhBHG586q8M5HRRSYeXMihz8D+sS9aNSN21BVDtTvlkuRyL8loWL?=
 =?us-ascii?Q?oOnVI7ZET5+fIL7HpUEqV0HRGzERm2S+c3qhqbWrdRpeCgwyxp8+zBRAfP+9?=
 =?us-ascii?Q?HaPW78G7G6jJNPe2ui3D+Ao21mifTBw7WOzlC9vGAvGYah43lTuebvz5aTOC?=
 =?us-ascii?Q?2IIlpu+ZQ3f8L0i1/5aEJYHbpzGubE5z9KOu8cf2wD1rZ2q1NI0rkstX/gDY?=
 =?us-ascii?Q?mYsVybKLfqe/a+D9FinxL5l/TDk85kzoMCbyAJ9glmyPRej7W2EuHHQaS//e?=
 =?us-ascii?Q?LRPkcKz6/ycqO+zkQ51zePPZBXrFvjyabAYrngQS3p0wSTP+6qLNfZ1Gkyof?=
 =?us-ascii?Q?24hgWJkcABBjXwDmqQT6EUpupW0sF5NQcSGlqZEEf8ft70IBy8+/kxZHoTfB?=
 =?us-ascii?Q?CoU8Y1zqHWLarcY4rW/rv3BUjwxl9C6Xi3QZWw26eh6yL7YRAQC0e0yyq6kL?=
 =?us-ascii?Q?nm6xOzaAOcEa8Vz5ztWCdz4mYZKLJDkvu+HKLsact+o/UvGXlvA+yOMWmxNK?=
 =?us-ascii?Q?hI+noXw061Wh7h4cOUX3/XM7QEsjJo9fD0Iba/j+X/H3zy88NcB4EQtKXb2U?=
 =?us-ascii?Q?J8cVj0nikw8geAs/QPuKV7q4EdGtFxGEZdFnC0AnqMTH/Z/HBZi8m06Y4ydS?=
 =?us-ascii?Q?Xc/px2uCBth7uieaKu740zk3AgWHqW/O1VlVT6SCMHVX5dwWK3hO9KU0NHQP?=
 =?us-ascii?Q?fDfGxfp/ldcnG33alPFXUZAL33n732CkzH99S1Bt5lnkCCydd4j2gO8pC3q2?=
 =?us-ascii?Q?pZKVTvNycfQxkWDdVjlviRn1AjiAJQPaIOF7zRpJsKZRzTOwkRFwEs6QLl/Q?=
 =?us-ascii?Q?ikdcsVbJsDWABgWrvlkzzaWdNNPhxp6BPs91zSSSA/6LPRGFJ8c7kSB8zu2R?=
 =?us-ascii?Q?oOXzCTV5Tg5eGZlwiEBDmVzW646kC2gdgQhgRU2S4IbowsMrPN4e5gZs5YtO?=
 =?us-ascii?Q?z4cUJdbSzlcLrblBrL7oMWVZhdrakiZwCpKmzj9i8SA8hwRiLDMrI8S6vrYR?=
 =?us-ascii?Q?+d7Zni9L2fIsoYX2wQT/135md/4j9lozTOB1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oaOpsv0Iol6fRgKmj9a8FyF2GIh/Rg+YF83jOqwLDcuMl3YBysTRM1PiK/1u?=
 =?us-ascii?Q?Htefb16WpyNQlo1cdOkKfvjDm0jrhdD5JuuLh2mTPbmuYrvMDa16WLKtfjgo?=
 =?us-ascii?Q?C2c7vR4LbGUocRLg6lGeoq/3PleiXUutOQ/FHPt4LSx0HvKsKSAp/Pv0d53c?=
 =?us-ascii?Q?mXjDGoCgTCAd5GKjtOpFUsJxO0ScwlpmwNtHsQr2IAaXHweFdXfZgDI+ZBxz?=
 =?us-ascii?Q?h6A0B8vRedwK/ZG6y3aEuR0Ar6uwXp3sPA6UGggyHfyzB5w29RuPVk1m9ESb?=
 =?us-ascii?Q?5aW2z8WiWutvwGwySI1wHuO6RbDwAR/4/uYc2KP/GpKMeu8OOWKfm3jA0M9D?=
 =?us-ascii?Q?/K/LnvXOS55DqC3TcB/w7yy4s5fZSvLsOQMj8flCSND7KYUxcyY+yIxgUnao?=
 =?us-ascii?Q?uVFzseM7T4mUPzmYYOokorIgo3wSmIVzhEuGz+zHjWPqyPQ24rTUIu5gMg/j?=
 =?us-ascii?Q?y5Now5oeX0zPh5cteJRd6oggtyuLI4mU+LUAwpHOp8Uhi/RL3cmiqXbJY0lX?=
 =?us-ascii?Q?Jd/Hnz3KtoPoCwqImPjC+Va/JtEdqTluwoPSJTO3ji3X6kaUpYGVDLRZF8WR?=
 =?us-ascii?Q?5i2ftB7bX5eFHg8LwDYzKg96syGF/axfL02LFnYov/Sm7ahb7yjGijRnDct8?=
 =?us-ascii?Q?wL5lze8TRJY/0rqXZ3LJHsh1CRCPUUUv2txFxpQoKr1saK3coCxAh2suFOXb?=
 =?us-ascii?Q?DyB0TfNo1jqBPDzugNt6f25xOjJfolydgs4d/YsgMUjTyfjdg8+x5oEfPJmE?=
 =?us-ascii?Q?O0uHH5Be5ody2qlYvmokbLQADqzd5U+b3AzO/RZRGgjoH16tDu0Cpp7sPsN/?=
 =?us-ascii?Q?pGx/1UphOSEi6RqN8SR+b4wQunZc5xQyseDPFVKXWI1KplRGt5+Xd3GZSKjm?=
 =?us-ascii?Q?O7b8Oeojm1pgHz+/ZhcNRKq01e8XD/WuLj0HB0iTUDJyjdRpJNtyGZLB84HZ?=
 =?us-ascii?Q?yg98qZjJQVSXQK5Me5ny8ipMVmmnFk28nl/2TmMXkEpd8vH/zimoSVCcdrnR?=
 =?us-ascii?Q?DKraztIXEvzFlNj8IPfNQfxeHduLqGYteow5YHD7kuzTzgCQGeHZmOLYp14M?=
 =?us-ascii?Q?E6IjBLC2HEFmFv5bPqzETYw3yDGOZJyUwG5kDOE+P4d/OsIhlDm2blhrO2wv?=
 =?us-ascii?Q?r+GcdVmufiDKRPNPs4OLSejlq+r2CdmoAAezky0qvy9AB3PBf3M4Bxtw1n5J?=
 =?us-ascii?Q?B9P8Xf2NdyRGzq7fWY2S8kGiQ8C+oVrn6HuMqmg4JNeqgTpqUHIaAU+53wMD?=
 =?us-ascii?Q?rWxzv49ZatlbsZBuqJaObkaTnQrCvGLmKo2vlaOIn1Jk3xGjKiVNApbIzkxM?=
 =?us-ascii?Q?nM0N92L0XrT/0dMSujMHkOZLFQWBsKJSYHqgeA1qG0XunRO8X4AkSGN2xs83?=
 =?us-ascii?Q?Muzb1yshr8ABmycIGvmsUSr1ewXXLEFc+u0ZBBEMH2avu5m0cW4PNQuhUqz8?=
 =?us-ascii?Q?7UwRKZSOatYJexpArsL0AsUxf1/V0J+6J5lMc7jVj4qRQhazTcod+mWni+aW?=
 =?us-ascii?Q?HVbQX4Q18TrbWgeH0gb37eHA/2QDfHXn2CnHY0eLWplsxy7wbEvXFJF1WA6W?=
 =?us-ascii?Q?bFFuF4zeg03n/U9iiuKx6Lbez5QW3vw2TzNa0W+F3pugtyN11yY6GfwEOqD7?=
 =?us-ascii?Q?IWQqoTdsO7z8YzBvqq1YQtCG+2ra6PUybYd6IoqkR7lg6RPHf+Gk22WCy7GB?=
 =?us-ascii?Q?5EaVPPwnzynvavLvcTkAEcx7gaEnex1nwoGX/JYYJTqFHMROrUqe57gB9YOX?=
 =?us-ascii?Q?dxxEoFpHgcqXPg9YrY4w4rEEEv6bljc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iO13XQk1Wg9J+rU+ef62ENR6ktxN/G+XbP67aVRfDdWeKfbVsp0kCmqcEbOBeHOZ1kSfQhE2GPfgzT0YjEc0Gz/25Q+SzfwuSkc2r/tOt2RTMBhFHERVqJs7opxtOp5gUJouWu24iUxwQxSQmszOoKIK08+yKA7MEznUadSuSXiFbxVmKxDyRryTxkimbtv5J9Om2SqbK0kbLU9dj2O62XfhCHiBkRqNgxpyqiXEErYClI7FPJ/WZvnhz8U5ZbinA7YMWoXkPfOBagPc2zhseHcSrytsNYI1+WNHICUg9Vtznxy3DzimHa2dPCFd+dodXyBehNVqDImL7HldSCTeFkuaDUCvr6jJIjnZU0+FPmW30q/hbA1yeMpmnh8Cf0x3nGjHWE/Nl7kPRK20A3pTDZ61hMM6O2onlnEz+8ciJTGi4qXyfU7PRrI9a6tTmlukulWgbQGRVQi2Z3kGcBkLRELBp6/MU6Av/Bn2pjT7+26rxsx5bFNaQvpJRpK+orKA2tSUDg8JTUbqOMycNXER6EO8k9EDkOai6UaoRzY3BtgT82i3T4inVowR77K9igTGTxoWlYCxeUZt2PCqI2fs0y50YkmEFwT1C3+v2BQz9h8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50b77af-d2a5-4fad-52b3-08de541a0b27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:39:56.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94/OxEwWjuWU16CWTwUoAwIYmqItPN2aNMliZL3AKMwwEWG3emLKtiHxhH36rAGAaWY5qCjYbEYyS94yykAYnwiBV58bfH656YBX4DZX4Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4325
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfX1p06m3Z9NpW8
 7CBR8/+WRhwVfI16enKOYUaRSA6hf+ywv6LIYvrRYJHnO636tjMZVmeS7Mq+qzky80Ajvovsd1t
 ZuUjqkt5ooCS+QToH+2eciV5OBEUr1XFWyW0Lj4ZiX7ezlWnbe7zENI4HLXCptGogEhscuoF6Qm
 C9CO2A42bHr0fozCTT7X97Qm5dKgf97HVGJpYx+Bcv1dHACLlDsTu6WrskGC8NsGGzhJj+4XsO0
 16mvTUetO8eXAbBjCy5YBPr379dyLxAldZ8ILzhFly7ERh1wWxabW5MEoX2y9IacajpHemwS37P
 2SzGul/3pOXuyTdyZd3MFvfX0Ex67b+3Oivvji7MOsADmTptzlwbNtfLdv79RHtbygUaSJe23y7
 sQizJ+l3w97QsK0d+hSxQNh2WS1rCK5Hczd2JTPb/GzCT3A8vBkJrFoaKlOJU8HIR2kygulxnY/
 Q+o1ik0krCvYoPsZjrd9IF4klojkbkuD2jOvLSqM=
X-Proofpoint-GUID: TGZuevTBpq25uSFIA47KVguhH0tzTB2X
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=6968b5f3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1-S1nHsFAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=37rDS-QxAAAA:8 a=Z0ii0WdOvcYHKYbhqQ4A:9 a=CjuIK1q_8ugA:10
 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22
 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: TGZuevTBpq25uSFIA47KVguhH0tzTB2X
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:13AM +0100, David Hildenbrand (Red Hat) wrote:
> Nowadays, there is nothing virtio-balloon specific anymore about these
> files, the basic infrastructure is used by multiple memory balloon
> drivers.
>
> For now we'll route it through Andrew's tree, maybe in some future it
> makes sense to route this through a separate tree.
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Assuming below fixed + Michael's concern addressed, LGTM so:

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  MAINTAINERS | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de8f89ca1149f..b974f8c1c2225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>  F:	mm/
>  F:	tools/mm/
>
> +MEMORY MANAGEMENT - BALLOON
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>

david@kernel.org you mean? ;)

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/balloon.h
> +F:	mm/balloon.c
> +
>  MEMORY MANAGEMENT - CORE
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -27536,9 +27546,7 @@ M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/virtio/virtio_balloon.c
> -F:	include/linux/balloon.h
>  F:	include/uapi/linux/virtio_balloon.h
> -F:	mm/balloon.c
>
>  VIRTIO BLOCK AND SCSI DRIVERS
>  M:	"Michael S. Tsirkin" <mst@redhat.com>
> --
> 2.52.0
>

