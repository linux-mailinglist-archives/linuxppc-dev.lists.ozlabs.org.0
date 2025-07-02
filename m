Return-Path: <linuxppc-dev+bounces-10049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A4AF5AAA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 16:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXMKG0JZvz30T9;
	Thu,  3 Jul 2025 00:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751465521;
	cv=pass; b=Qtn+PH7zPW1xTQhUCw1zW5Fde+Pd58aPtbcjkpblaSqwTtLLbULt3UNEXEgk4vE4GnbJakH8MxRRzvfhRBmQUG0vkYMyD/F6cqlBTM5LpPJ3s5TX4fsm61kKDDRrRUMkf00wkuXDdqwOVw2HUB86x9iOiLmIJyI5su49UYPjHoMysp7a/3IxbR+Ms1yFRXzkt/72wdxzesrrbMpd64oXD1SavQ4slGU8WR+biwVmvlp7+O4ckJyAfh+OcTWizJNG+KU/MOt8he0FfJmT74t2PSvV7tLgWCPAPp9ajs+neSB+BAZtWYfEDimrH3Zf99St5EeWvtTtXcvZMAL458DlMA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751465521; c=relaxed/relaxed;
	bh=q3tLMTmyA6GQDODYJ+s80/YJ8IqRouxOXJvwBOXKEH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PiLWjfvrC2iAPy6d4GvlE5HRajfHVoL25bEyZXKT5LRcfQMMXxTZpAK6nX/hPD70jzcLrP2MKiyicw7PYclQHSDM7er0XEIAPBxtFUkSCG8flfx1FolArpQTA96+Nrd6v7xj36qZKYvZSs3EuN8I22NlioASP9hzPL/Jv66g0Z5ENoNPSmizCfBtlRxGSkqCWBuX4KMvSAvrB5L3FWfOX3uVWOx55eoa2/yr7Sbphdc3nXIDdNqgf/Sof2lvzKObZXtuM2Hi9SyhYr0bwDj1bqqvYVp9vrshfL29ynPLmkTS3yjzYupVHIMH+qi4D5ZtU2MXrVsjwu3RNJOtJG9zNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mMzEnvcM; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pPtSizRj; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mMzEnvcM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pPtSizRj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXMKD6tzkz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 00:11:59 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BifkH020679;
	Wed, 2 Jul 2025 14:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=q3tLMTmyA6GQDODYJ+
	s80/YJ8IqRouxOXJvwBOXKEH8=; b=mMzEnvcM8F9Oka9Mj7z0gkfWi/fJQy7jcH
	Cyrc7YfdO2P21o8MWecP7nkc4DddGaRkLSmlqFxVCbqi4Ft0LwvWcKQCDjjaf50y
	UP5BG2ssFESrtMkQW7RLv63O/VYtrWbE9ukRHc4VRTs2PiAVKv/T3c7+mtSWAPDs
	/SXGM4vlicH2JqqF7qFMdiPDzRGxOnx+xW+aBS98ic6bKiGbtXnikD8CS0zYTy0P
	1uFWFe9MeNuEjImaBuDAoFQhLeh8bIkV85xXX4j5wZaTzpASGL4ct6US33DnrRBG
	xrvmLYKbqhDOID8Gslj8SqXF1dgSDF5N3YJV9eWd6z11/08aHvSg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7x9up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 14:10:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562Cb6H7019299;
	Wed, 2 Jul 2025 14:10:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1g1g6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 14:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw91+UxHqp2+NsbMWOhrhppFFwlfVGIMdQ6Zu9yR7gtYGRNhe62qvvmMrWuMspjfg55ThEx/YSQWy244sNc1LDmtOiWls6VrPDFsEHwy23/2TtQlMV1xfpXC2AKv44QUnIqyh8+CPPvj6rhsFqHgjzIwbYwHImW6bvREjkqoQqEQHF0KMUqj5gAUp7/ZMrzIlgxC+v0NamJrhoZfTDbmkXqJtH9UwZiX4ZPxQ/4cW3ZS0tZLogMvORHw50Y408NV9Hv1QMjrRsveniknO3iWGE52GLL2MjCgzIk6YMnXruY4gjJTPXF7DiIV6YuaCVg2JoCIg4RFptbM/2dkdYKHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3tLMTmyA6GQDODYJ+s80/YJ8IqRouxOXJvwBOXKEH8=;
 b=pSLT9nIGFyyAR3kShJKZ1ACQ2Dzy5Wk+75nXelouXPO1oGs7jDjJyi2CTgvcfMAOvuk5dCamDBtf7631sn2/2gt4QAwaxAwIEgrxeJpz8FxpQHYXMIyuO4quXG3oNMTZUWdo+k6RAWS+9CJa7FGKuQJ3QUqGyPkO6a9T55aa7dN0WvGaEtIr0kes867gRLM6lfbOHsEOa/wBT5nLnpKfok+HjCLxlylk9FxcNbOZroJoU64STNl9YRJHSsRx+59yRw1X+3ZtF9gXSRgRZzn0gRTvTFYUMuJ6F20r8Cv17zq5MSNieSIYsCatRjL5YuC++fjq8VS0NSrABgP9MIBxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3tLMTmyA6GQDODYJ+s80/YJ8IqRouxOXJvwBOXKEH8=;
 b=pPtSizRjPgFc1A0PMSMNdQX8bWe4dKdrOmrHiZZbEaO1zK/R5cnCrlMQWr7dwvgFI6nBZxDFvV1vUUeNd1s7P8O7FXDsZALj+vrfpV/pncMyBPGoFr5NGvacigqj3R0NIuQosTQZRXea1IQzprQsBNQ6SH/JI9+VYyFAExDAvfE=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BY5PR10MB4114.namprd10.prod.outlook.com (2603:10b6:a03:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 2 Jul
 2025 14:10:52 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 14:10:52 +0000
Date: Wed, 2 Jul 2025 23:10:33 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Minchan Kim <minchan@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Xu Xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 26/29] mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
Message-ID: <aGU92f_62PnZrig2@hyeyoo>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-27-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630130011.330477-27-david@redhat.com>
X-ClientProxiedBy: SL2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:100:2d::31) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
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
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BY5PR10MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: a97fcddc-71aa-43a1-7885-08ddb97240be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2IRsJOIEGsGCJtRiQjb8UbbCawY0V8k0OR2qa9Nk6C73sP4jL5TbiPtJNXTJ?=
 =?us-ascii?Q?rHQ9a9fE7/IZ6FrtoL5Q2thD4MnM+7DjGOFqwzZqh7LY4c5ScJn4TMuNxj8T?=
 =?us-ascii?Q?+dDJYX2vyKdiQF0BPIj32d5jvhGeoCp1tv6NAofrwTYJaP8Z2rLKXaonkZos?=
 =?us-ascii?Q?tzPc9VL62dsLNCUT8qUPc4jr0YJ9wIiAqNVNmJ2o53wK39gSQ69i3A1WJFWB?=
 =?us-ascii?Q?RpD85gj8LXERGJTMMEcDuT4jj+PzkeJLcQSGoBruQ5ASidE7gx4/XwzYw4a0?=
 =?us-ascii?Q?Ts6eojDAfKzEDdmXWYasiz/tSBD8GzPeHAJUcKt02mLtHiZcQeeCoPjki1fw?=
 =?us-ascii?Q?li7wKbQJ11RsRJcjenyoqJkOPx3RvsKKHQZqKNcLqCEVw8dm56zs1w+v4ZqW?=
 =?us-ascii?Q?5EMSPaVer5IjC5YnAmK6mEabd8ZX4Thh0x7Qf1i0xddzNGkLH9uuSuFEldiA?=
 =?us-ascii?Q?0Mgz18ozQgGTBnvf3+ChmJNnsh+6dAwYe54cQkF5BZ4HMDJYWGcz+k4FWNU9?=
 =?us-ascii?Q?xmdPr+aeQd+vRSIidyFolERwhV9xwWaPgx4jflABRS39v49uiolNz1FQVE5I?=
 =?us-ascii?Q?cT3IIhXalLDK+jFr4ncap1Rg9kxJ4UaPnZAW/2bwWwpWNMkh6owPMLMoUVJv?=
 =?us-ascii?Q?GpR5H/3W2ckaMzh0BtWByLqGPHEuIf0Pxrt3MpflDlCWjWxACAKO4m9yHk96?=
 =?us-ascii?Q?cOa4n3kUSXm77xa1/ecH9rGnk4NYB8LeL4F6MN3ko3tnLHFPaThHZfg5vIr7?=
 =?us-ascii?Q?tapz5mNH79ILmAgbCNlkbWteo5zh1qdzEa4CH3MXAW2mVL6YTEYVo1Gi2NDt?=
 =?us-ascii?Q?mnwhahKCU780Yh+Bx0wKYRKMIf3BlVOyRmOpAbox89+4sKzFZlj4o1F9HlHd?=
 =?us-ascii?Q?kOc4hbYAZ4fHqwrBkyPy/F7t2Yj3KgSsGDWLSHT71Krhjdwk4o0apVVTuqr7?=
 =?us-ascii?Q?+c0hn89/tfEIgx8o7i/+w7PT8ISJ+STEtwNWlA3hqC6yUGASzzIlVOsPYGYb?=
 =?us-ascii?Q?EvPbgREr2vHvfcgt7EvZVXgIXcGeYQuu4DwVE3p2mLeR/uukRpjmzRYVpSS9?=
 =?us-ascii?Q?w3HgsVUMmRCMfmobJH8Sv1RoGtH7SvFy6wKNJbzsGG9fjvSghdljSHS3JAYV?=
 =?us-ascii?Q?+MXOvbmrQ9QJMLOtgnJa2NOSZtkxcnAjdRba/zVYH6HTSa84irj/+ltCV6IO?=
 =?us-ascii?Q?CUSCocDLyhEtjHWTfIGtNlfqz/dSuQBN0pllPgpe1Ui8f53JbOP46DE1HhJe?=
 =?us-ascii?Q?nRWbOTmFWiTRPaPVd97LRDLzvbVLgSDU8fw8YhelYz+N8VyKxuJFPaaMETSo?=
 =?us-ascii?Q?W8qcvS8/Nw10aGH28b3vNx741y/egt7k6mRYha4M29+ENS85VPcETH1XTu1D?=
 =?us-ascii?Q?fyH8Yf6Sib8+6Mz+XPxDF/dvWmXBbWG9FTHvJD7H+/3v+f2AGLIsCbCqhhVv?=
 =?us-ascii?Q?/TAQEvyRWEs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gpsdE/OjDssrHnQXw1dDoJv8cHX/KN8aOEUse9OIRnHqoPQ56kVqHBF1fGAP?=
 =?us-ascii?Q?XzAopt7kKnVGNY2f4NNUW6CSNaGMBeGZqDuRUWK6J38knNADjXWInFWt/8Ps?=
 =?us-ascii?Q?pCjnTauHaDU3TkEGFdofIF6xTqFeFsNjwKtWixeO9BZrK3RO5t6VAB7hRg0O?=
 =?us-ascii?Q?DslYmiAO3if9nVPxbeVPRJlDKyl7XTzkMLPLhtQxsYaYreyaeOkkuOmtUvSn?=
 =?us-ascii?Q?Wmx0NpVwO4UOLPsiqzjut0aPLP897xYDR1mEDdhZFFAB0Ulh30JoO1iINEpR?=
 =?us-ascii?Q?1tRNkCBtnLwdggokocNf+6rx095HoU3rI71B0nO48G1NMxKEvguh2VfoDHf5?=
 =?us-ascii?Q?bwqmpa7GhsU3r7UkwiB1+zj0FroM7o4YalPy6kXCDeKOnZWBy0mHLDmVQ7f+?=
 =?us-ascii?Q?fW6SruK3pbCBjeTr9Ch8fdkJJXSTqsaIpeKfhrVHb2DxWmisM0gWoG1MkO9u?=
 =?us-ascii?Q?RbAFmHeMz2A7c0MP1zfQ6+btEqkUX1scwiLJl5yuIKo3qf/U38f1G23pFRwj?=
 =?us-ascii?Q?6qh6CcniobXAifU5P+fhvQmhL/vetIWebI0YM9i1ScelO3L1WH93jwlmpYm4?=
 =?us-ascii?Q?8qy56hKN+w40v0aCFi1xDSqktCXpNP1FcEwu2RTubh2FMYsjNOXjxpM2GK6/?=
 =?us-ascii?Q?pw+HQ+0isLvnMHHtTbiNhJJdJ8frsxP34o4czPx/vwUpP58DyvP6pMSUoev6?=
 =?us-ascii?Q?/sDs5HST2tYhgoBOoG3yrAgmtOpxzQTdideo7MnUwbQfkF+p5bnZpg+Kg87d?=
 =?us-ascii?Q?Nktrq6okKXy/o2cU+Vrr8SIGIVy2qjiLyNvruXKG+E0q7UeCAiBqh12RrrER?=
 =?us-ascii?Q?Y3Xc798Sqwyiqp6RHDWVhAKPMwPCUn2mFvKxO3EharmnXyZTONRs6lFGGqTA?=
 =?us-ascii?Q?E9229QVRhM4u9e+7sLjP7VT12TcMouc7P7EyxF2w3AwREE8d9J1sM9DQKTVH?=
 =?us-ascii?Q?2Yi62GwHxCCs4m1BWzMGY09tHsPobGk+UJ6EEdozI+U1VdAly4g94Y+hyxP6?=
 =?us-ascii?Q?mGor9Cv6Ne4uWA+DeR4evwinRBlthXfOlY0PG2HcwPf+Cf9a5KPYB13PqXwz?=
 =?us-ascii?Q?POSnGC9YxR4ALPzsGY6JxjWW1RoPucdDYBJewy4jy5b52CYQuO/3yFM/rXDg?=
 =?us-ascii?Q?iY/6pBwCIDaNAJWIJkWXzvZ81EX+TMXMoN61S+pDTvUxziL3kwQsodlGPxWo?=
 =?us-ascii?Q?zsdD+1K+jn+MfRx3PM2iLTkJBBfWhuBz8tCBodur4yU0Yz51RWHybQnctTZh?=
 =?us-ascii?Q?xAekoS9PrwWnW6Mz2dVaG3gECtIGcGIXWp4lnmdLZuC7pHGzNHYEgKkY6517?=
 =?us-ascii?Q?uVcUfcvVGaaogmsor2E8I4Bmm+bFQn6v6aR/SzcsI9ErQ+Tu0iYmonF5BAtw?=
 =?us-ascii?Q?wHJ1E3dELu4a5MRWzfGLJQeP6H+36MzULe4qps9jqw7Rzt/XdaarpSLThgzY?=
 =?us-ascii?Q?tw964OtduaoET1iUwD8iFlh3DtVVbSUA7vPQhTa2VvVCRmawMScwj649obZk?=
 =?us-ascii?Q?x7M0kM971wpatx0uVm6nA9dzwcCFLDSJt38pHbA65iZuTMWWP1OdQZYpzqEg?=
 =?us-ascii?Q?YWRtpRXtBvUhacLIm/eunJA/YE/1MwzcAbxWNFRa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EESh+OouPDZ1bjd3Ckqz4WdUoxmKVtPJJxbAFd8DHApF9qVmpBD6ELyAbhqaqY+vLL4moLghHhKd8RAyF/A9kginJrel/oYuBgSFGY+qvmy3RLKKTDE9xx3/emyjWh6ScZJZLQ57vjjzn5WShcK4yf+UfB82YXe2g9kjkj10AvHlSS1ciLnOt/JnLOYRAMr/UM3pev2knWUm6NX1GdyM6x2gW1cDSwCy0medOOBji+Whh4ARF17OZE1Q556SZqXZD+HqSZyHl73IjrQaz17yHTa9y5lwLpe8jPAijaiOgaJLCkPz4g4GqFbSZqlUNx2nqsktZ2wvZY+B1ybR8EK5SH5835r/qU7jtXJIpmMxWtnRzsONHDSAzMIGtCCp4eIhr3curGadamqw5iA9ix80Aq0jHdvN+2UMoe5EGvn/ZJq7vCN/+9TLxXwi/EnXUGcXtsNvslNYOXCv/0v6h+OTThY6lD74jzN8+LoZVP42zx8IHZn66nNDpe8iSACnwOLV2CepTVTL5QmbutFlEiwiKMA2OXUwjN6XXgC0JLDVHjT89h3sa1dMpXFITsI0+l1T1l7BGcz0kLpyzdhyoIRV8XqLcy/fEa8zfRo/A5k30kY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97fcddc-71aa-43a1-7885-08ddb97240be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:10:52.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkXt1FP9J668eZTnD1F/0nOVgRkt/MTBXRoWldvOLq38m9gTf5a6gI/Hd2zyEZUndYXAYcgA8Z8dWdK9nVPArg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4114
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020115
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDExNSBTYWx0ZWRfX52xBKUwfS5tk w4nJVG0AXzWxsYCeag/tqbQk41fZ4BchV+HaQ4y4SqIQf9iIb43izPE9dn+cZH+rcdy8aUSeCnx NqdW20KmxSghImXxjorLbuZV6W+Jixkt1EuT6oBqLt9xeGx1c+3u/+cdRU+1gSuWBJ22K8/i+ou
 gk/Rhxs66QQiDB1t2gGoGh3sOZFcoj4W5zCYpjhbY/PXTgPD3kZshqbVzHIPSVAlM+XTrxrqSfD Zy7mlwtkqMrC0aiyTAyQIEFJmIQfnEM1EXL9NoJfHpDWgi3oEGqKUzJDFC2kWx82ic7qvMHW27E 6kQkIquHGfTA3xyZHoBX5UlmwOd2Qgn9c+wnwmqKHSnEIgV2ZCs3VN9lrTRafi3+0dsEps0Iivm
 oL4DHlXE4/Mwpi1ZJClXtjXyD4kjMS+syt4jNnOpSkYJXNjYCnRDirtZg7USmLyANDWbfETO
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68653df2 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=hZtoV8VgQzv9vhPcnNwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: 6KTn_2T-MuqootmBcnFSPKEi49Uj6prb
X-Proofpoint-GUID: 6KTn_2T-MuqootmBcnFSPKEi49Uj6prb
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 03:00:07PM +0200, David Hildenbrand wrote:
> Now that the mapping flags are only used for folios, let's rename the
> defines.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

LGTM,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

