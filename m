Return-Path: <linuxppc-dev+bounces-9939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7AAEE491
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:30:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWBTf4BRcz30QJ;
	Tue,  1 Jul 2025 02:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751301014;
	cv=pass; b=DHbwU4YHZVDCEof01Cy5InjJTRknoJUgMpY2vvHUJQUZeWS4QQ/Boudf2cgWG8K+HNYr+WEw5bA7NkHBsqOQTBoDkl5WCQchQIxYhkumJqPphqGcrgJ5ygIoa89n+BTXb1QZ6jvJISJQRR/vzseLDKzh4+ItLccCllyeHHhk6Tv4N+70DFWI6Bvpw4VQACNU0iZtS1XhIPczr4M8FR7WF6TI/6nKr5GEmThiIGxzAuXzJtec7fMhT2T50zBO4oMdvH3KOhu47MQb87DpC6yt0ppT0/Eb+lSDmwVHAc84u9MrqJvmC4WdQbJNWcfpaXVKcZopGBZoWk+PaTtQetM0PA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751301014; c=relaxed/relaxed;
	bh=/Nyia8xicKVJG/X53nKs+XVDFWgBJLuV4dSigohX+zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jXaRSnuf53SZe84e+8cgvUzOoD7s/ihiYRZfi8l2ICRipYvD/oo7CRst78Tw7s18eUUzgz1Xs7NKLIwdMWrLrxL4ZfcHYrhfP25vAD+nzaD5iP5dOvz91/qff02hTnJhnOSfIDZQ3HD0TGlArw2OH8qz8PHk70lQ1vLt1tMWjxmmKMY/A7HnpPUaiKa60qoqCZQ3jfHI2NBhJzRG/X8RraFzMFJ0v8CwE+1TkE/qpR0Px9nfJbyCN+TY9vMwa+gT3cvmiBIBky2AOiVvCdQJHjNNvnxxtfb4WF/DsZf+oWh51B+cBKRmIvE5fikhykfnyA7eg4otWRBXseg+LrVKXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=rhg8Pb1G; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gLYOq+Xx; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=rhg8Pb1G;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gLYOq+Xx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWBTd0XCrz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:30:12 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UEl9LY020113;
	Mon, 30 Jun 2025 16:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/Nyia8xicKVJG/X53n
	Ks+XVDFWgBJLuV4dSigohX+zk=; b=rhg8Pb1GsOU6aT+1DDY+TlY04FVS1ZZntv
	A7sjKGlVxMAwuiJHTwWuofFlcUxKLaDQKLw/c3WFJIUn0rOBrQryWLa39zRzpoYQ
	3BcLXKH7uarZ/PewqMSBcTjwLieTlxUuTB9YkY9xXEJNH/rsxs4esC0LXRqyfrW6
	nvR+n/UWXaBgUMZoDv+ThnsTQaELUO+afEETIAQiPvr3Z14Vwxc+NyIMkJ0BtkxW
	Y5Bwa26bkKZFyWMnG2uKjd7eDa1vjBvM8djpS4Pi8zIWMg1GcAGwTkjKzQGlEOyZ
	lngeI43CzhVkhAj51xE8z3jP84gEg2TSLJRHnQY0rqZNeSxn/hfg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7t7eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 16:29:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFdJ2O025760;
	Mon, 30 Jun 2025 16:29:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8jp6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 16:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmPnmqzNKP5yXYfeywGlRMfVjNboZkLPmJu9Vn/l7jvVMdNaTFdoLVJuK9MMfScLWYqaVxwM9Osc3mavXIKd9gEXIpPNFvX3sdhZaCa/4Ic/9XP4gLtBqbtSa+/PUG41rxTZskEFQsw5fixbaaQGHfIgz0yfC5IWA3NEJAROXUvV8riFAohp/hqnMa2BjgIRrGiY33MKuJAPKApPkxFP9B1fux+R/k66xVa3Llxip80i1SjqFfjJxxzKH8yklOZwtZd5sBwyn6nbgRZXX3cDd4uRBPgWxW75drRknbYhQI4Yh5MDjg+89xvLfSPbEMasOwNnNNYZ4RVxJ/Ni6VLb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nyia8xicKVJG/X53nKs+XVDFWgBJLuV4dSigohX+zk=;
 b=CLkAOPihu+CX3UaSlEfa+xb0ELTSLEKm0vm4xZ3CfF2uGNWqeR4nqBrbs8SaOKoHqW5HQRroAI8AmbebQjcp37I/PvQ1fZwgfbg7nK9d9OmS20Uwob2eS1V+OGh7vDpmrJnLWanZxj6j8Dm2UWMDletsHMl5aS3lJICDWTzUMuA45HXAxHA4fN7+rROBBDo09oI87lXFJz9yMPObtkESPgQIHHoIfCEE+bUINGqDizYkn+0ohXTKsZPLcOZnaXVA9esGTjwphU5aGl/wPU7CZOyL68EwdbaSG7WhNGjpj/IJcN6YuT8y7MExSaTLTHyfUackot1Xd5BAsty//ojrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nyia8xicKVJG/X53nKs+XVDFWgBJLuV4dSigohX+zk=;
 b=gLYOq+Xx5a9NAW1qVdmgqBwtOEVD2iVmuHYqhLN2sHryAyvA0xNy7yYmRY/goY+AnjY9VplFt3rAUeLNJ7jDkOZL8vpPl2fmCh8pz2osc1OTWnPvpWn0IyMLTdZJCF9VJ9YGwJPqKF+gz7/xSRcL5kbFPfPnLbtzVz5Da5hfMUc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6624.namprd10.prod.outlook.com (2603:10b6:510:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 16:29:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 16:29:16 +0000
Date: Mon, 30 Jun 2025 17:29:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
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
        Harry Yoo <harry.yoo@oracle.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 08/29] mm/migrate: rename putback_movable_folio() to
 putback_movable_ops_page()
Message-ID: <76821278-dfcb-49ee-9ebb-90ca5e5203e0@lucifer.local>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-9-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630130011.330477-9-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2085a2e9-6c28-4355-f087-08ddb7f3419e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XprhFfPZR7iF92UYlqgCgC2EYNAJ6VNtty0giKWqWCiw2IT2WVzjoCXD+xD7?=
 =?us-ascii?Q?mtbYWjFBFhr6r0TrLRrFSeHDH1jXEYNaJpJHvJOKJr4FxBGyCH/bf4eEDBd0?=
 =?us-ascii?Q?muWfBVpnAL1cxaKSW2AEiQqrKbfUw6yOVRX8Pjze+Ve29ZhN8kFlt1rtLcOg?=
 =?us-ascii?Q?hCJDt56WLpUIAPSXoRQveG9bjxs5qZw8B9tbhoHl7kLAEeahEWQ0vQUa2z7W?=
 =?us-ascii?Q?LmHPrwr53NaNcbpXmqdaz0Vd7ZpPxVO40NadrL3fuaHBiOaX01XEzZ69ijay?=
 =?us-ascii?Q?83DYT+vJ5B51ey6Roi5OMtbYrFOtqtMm+knPdT3rL3zLGOMSJDbM8Zj6PLW0?=
 =?us-ascii?Q?O/PVbz6601G97PNy8urljcJ/NkOAD0INDmuR8daFzOlm9yA4sMcUPNg6VW3x?=
 =?us-ascii?Q?v0/gzRTNKszzE1sgSLSuZKmDpFf8ZYrZ0VkBvSGVRsTdHVeg8CiXflm8/xX0?=
 =?us-ascii?Q?ayWQ/xQcWTOr7vhb3qHjI/ObMkklqDqTNONvEIb1FuiKBDtbEybjIQ0DlCxn?=
 =?us-ascii?Q?cXdqscr6kyikqjGZIxLU6pu6aMSSQoahUI+t5B14fQlwxsW2v6m2o1jqsH4M?=
 =?us-ascii?Q?7tbyY6uSK+dOxnGoIo9YoB6TqJBGGuVTEDOKdXxIFdyr4Y1jh9OY5p7RxZ/d?=
 =?us-ascii?Q?AOoKR8VrvKr7dVtZy4lnCvRnlSz0ZaaYH3NoFQRNqma3bp4IAPL7QwprCgcW?=
 =?us-ascii?Q?Yc4V9sl7Br0xtAz1xwuWQbIUwXAsc76f7LpifPwpUD2cjcJf9YVGhu1URT7/?=
 =?us-ascii?Q?ib5kM/trHTlkvZB+QamR1zFq7Vd/2hHugu6HjW+ZvHJlxj16yErFZVteM5/x?=
 =?us-ascii?Q?8KMywlDBg9f3ZPcMNaKdjRsAiGPLxBzzr5FLR1pT9k1o0mwGbeXzYkMm6nmY?=
 =?us-ascii?Q?LW4dCO4n7KAlrWWj0mGyefH4HEYzp9wmQ5MITEjk0nXTT2gVaWhgr5CnVoi+?=
 =?us-ascii?Q?/XKd0uoIXlc3UBRLSzkMAKE3E2p66pcMznuI1U87fwHc8J8+J/uP2oMPPj9L?=
 =?us-ascii?Q?hrX36+PniYpgDOm/hSXs/Ft4hk1EdBiyQLKwOCSf/FVJLAMZaj0nse3UpAGx?=
 =?us-ascii?Q?5kEdMEwDb46/b54JCnnCLQcVToZS21P6Yg0iOvVgP37DDlmXB95RJ/Rfz0wc?=
 =?us-ascii?Q?Q3fj5bsZrP/+06o9SMiY466eLJB2C66L7pXwZljdQsgTpgknaN9+F3eCpEab?=
 =?us-ascii?Q?4YOAVeHa4IR+joFZezKk3gXsKDj9gasJILPRCoHB8qzGO4w9fBKCgM3PpzYK?=
 =?us-ascii?Q?Xr3BbfaWPDWGIV6FPCXoL31hCdsgQbB4PORGinJvfSmz3JGYJFJjiFXZzVQY?=
 =?us-ascii?Q?1YnLy4mVN77wAjhUYyaogipB4J/QKhYQWvjenudtYiodQapNUmOCBxwxGxSP?=
 =?us-ascii?Q?4FsbCHx5sbaHlj/ED1bK6Vefbcn0hrld3ryDTUF/G9SFHSQqhG8JqfjUe7If?=
 =?us-ascii?Q?tjV2el/cMT0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WUN9jHxRNeaBgBOrFTa6rvN5i5KGbggaQekWhzA7HGapQu0m84M5b9DEEA9H?=
 =?us-ascii?Q?YeY8XjR07eyoZ+xot+tltP4F3toH1VKzweRgqzdy073lVFhIC778Ce165C59?=
 =?us-ascii?Q?GYRiar275BCVgXjzW9H8LUiwHjxsyqReQfdzwHpvCZDcDhtugGE7if/fGvC4?=
 =?us-ascii?Q?yBv+5+Gs1nH6Nwd33FK5DV2vKsBBawrWEJ4/JC/PK4Os7KPCnuSFdQpi8Vj1?=
 =?us-ascii?Q?eOT/g5QLmveHbecKdSxPJFjk6LLftG+PTXhCB/vKwpdm+xvibs9owZiTy3OZ?=
 =?us-ascii?Q?szOoYlKrE7IyKnNpJ5mg+FoZnlMglt1YHR5wETYnpIrdPi8Oh/2IF0Lr6qax?=
 =?us-ascii?Q?hq/TukHakzjDLm+b4qqgL8DEkVVYTW55p9PJ9hUAIfsFD8CqwLyPUDumZZYY?=
 =?us-ascii?Q?umQF0GL6Edl0TH4VptGbwRQtveKkYzEoZt+TnV588+f4PQ/BlmmenXOcCDai?=
 =?us-ascii?Q?jxZgm6GK4O6fKbIJR+NMtF5iqKJHykzBCKIsVd4kfGd8C731aWnITE6fZx98?=
 =?us-ascii?Q?mZNP9ZH2ZnhG6s/AbSpKptbLAGraMCgq3TGUGAGgttzVUnYZTucsquAoPGzU?=
 =?us-ascii?Q?dlKpav/p+xTqauPeLOJ8oK+i3W+OJzO2PS2vxrOyAX1mUu3lgxfF7Bfmskh5?=
 =?us-ascii?Q?iyHbbezmgX5Qp3FaODO8AQxvA7rS1aof7qSo8rkIpEV1LehGyNI9UxIOF8Xc?=
 =?us-ascii?Q?3AFmWJLzn8SYC0w9N4JqnHXYVNdVDl43lqig0aPKBMvCxxu3XLp5fulgw5vy?=
 =?us-ascii?Q?W5V3PlO1hQE3Zl9IdTzS6Od1dwPFozrOmEg1QNKkEWVKZwEJ5J2iDrTdnkQp?=
 =?us-ascii?Q?bnBGwv36RLANs1CQ91st7ZbOS8sSrXTXfFCbPVwq0A5IkHCIT2HvP+ktR/y0?=
 =?us-ascii?Q?S7K4r1ccYKVZkj086KG54RH7DMV1Xvs4rWunPswnVcmTNS8m+LbFU5t0oEIS?=
 =?us-ascii?Q?2pIYRgk+rnzOLM+EgSQ4ok2fhXD8aF6WW2GZCdxtjTjMm+mDS25mUQnatwsI?=
 =?us-ascii?Q?IJcz3W60+z/E00egOZmNngeBUmlCFUnUjD3Q7NyNSaviA4FRC0FHNsKZ69al?=
 =?us-ascii?Q?RYw8s4ZU8qWOlG87gLbbqv4w3TWxKFsFWm4P9ecdrqeARTRVcpLqnxI39Bc1?=
 =?us-ascii?Q?TUC0wcMZQ8guubDsLzEBuJEg0Lu3HcFdJZyV9Vy2OpAApEPKU6dwzXZQI9ZE?=
 =?us-ascii?Q?aUTDXxPEgjChrBYUK9Kwrgz7ANBvyj0PTDqGUsyEyLuPi47ztsBTyRfi1lgL?=
 =?us-ascii?Q?H9EF6dkunBXuE7VWvcFwhf1Xy9q4QVb/Gh+hz2mxUfhHkwJsHasISULy/J/J?=
 =?us-ascii?Q?g+9AbEhwppPr551CRtJbMcvNwp4Y24NbArwtudUk6BQKSRPjgmLSd5I8FB+s?=
 =?us-ascii?Q?V0hj10DnuMCTRiF+LWetrLNSjf23gzYqKx2EJPRDoyu9Qfj3n75HyUgDSfpA?=
 =?us-ascii?Q?aaxiimC+gpbvzD76ZsyMjJCxXcTnvtqSbqGDDHeYE8W8zp/S7OYmuCBtChui?=
 =?us-ascii?Q?RUBvqYXaXD04FJOSzszvKQEg3wD9P0ytIxaifKy0NomJ6+LQSKmQyZ4sqgPV?=
 =?us-ascii?Q?mJryE+EQgr+SfVJGbr+7ojPIHQqv6JDGYALnQzWaHkyC43ydYlez3g0dbKDV?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l9Gr6tKhXTeXqK0EV0RTyZcaW7k0h2Bl1gO/kvTzHO3XES0UML/6MY549Q2VGlOpoJwp+B+kl5nfOu1kg0JCeQbQhzJsd7EtTOOLWg7qaN25DeLL1jr2TKjUpiHTcARer+beCweu9Y8TRyNAAmwi//p5FbAXyqSCboS2JptNRETpHSAD5Osqd8es6FvVTknJjDuHTBpqK6URTkTwK/ar7lwXFMp6yfy2SkfC3rHOCxdiIPPgBOOXYRDKpOtEhe52Rlm4sMf31pH4KPNYCoOSJReXSd3OYTqWB4ewxI0s5HyLRn0pPSGs90ek/0V8T5TZ2vrJQuPANUICgGJ/TLAqZDXOwR72RFOlHVv0MPNur7jSWNBmfZq5QO4O8E7917i3WtatfbQ/6AzR0/wpHQ6fZKkZgJnSD5W9aeFYHDFMQCSHdr7rOvMwTds3pFFsFDRnyhl2FSy5B+oEovrNBWBay+a0NSdXhjx3lALhwH/KS6ezE5gtAGhs7b2kDTgyiBOrKOdL1Es3yqe61SlrEjwTqizD3rcKbYCNclDU8CmbTOODGdfNylDvdY5rGSAVM8HgV1MtVA5utucXJJLpe1Bsn9+i92xCdwHFUilpVAtGMnw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2085a2e9-6c28-4355-f087-08ddb7f3419e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 16:29:16.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03nlFWl5mWY7qq+cvcNMCIyOM4ukOe18KiM60yc2Ki9LwDnj3ofRvq6idaCaIimZieurHeo0VeVWS5bTs5jlcEKOFzLSpCtVzt7IwF8AsEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzNSBTYWx0ZWRfX8U6b0OC6KiiR VdmeKgcqmMh9xSbkY2MBrFDYoOIOiXAVKMhpQwhtrait24g9Zq6zAdMoezum9rkwHtOlR1h+kjE Xghd9dbUHdpR98UQOe1EQo8BIL/OnZXjOPvUMEX2mo6OIKAx/mO7QKydviRKrBUMR/1sOwrhQdC
 t+RTZrbFldVTVUygeoyYfRyNDRPQbnoTY6C/u7NI9wBLb1VXL45AFUv6pNWZAtP5cJBDNLN4Tfq /rZgL/CI76QgSQTxLzaQEhUUTx78DLWwiplB3Talt2E6DBSxRcxMjsyS60xJ25PoUK1cMPKvo+f VUW6KNFSWpBAwtwiWtJXOZKQQKg23sGXRdf85nExKK0GiydftS5b7P0ip+XAhaWAMgeq2KyoWYC
 VaBROjXfgFgOuqoSpLqXjBGk6wO03TZoXPJlyNMdPbo5aednurO3F8LIGPOkZVM2viHcq+OR
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6862bb61 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=SzivUD_UlwWUK9n-g9AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: m6njT_YF8UFORV4Y2TYApuB5GzmSPwzu
X-Proofpoint-GUID: m6njT_YF8UFORV4Y2TYApuB5GzmSPwzu
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 02:59:49PM +0200, David Hildenbrand wrote:
> ... and factor the complete handling of movable_ops pages out.
> Convert it similar to isolate_movable_ops_page().
>
> While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

<3

>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/migrate.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index d4b4a7eefb6bd..d97f7cd137e63 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
>  	return false;
>  }
>
> -static void putback_movable_folio(struct folio *folio)
> +/**
> + * putback_movable_ops_page - putback an isolated movable_ops page
> + * @page: The isolated page.
> + *
> + * Putback an isolated movable_ops page.
> + *
> + * After the page was putback, it might get freed instantly.
> + */
> +static void putback_movable_ops_page(struct page *page)
>  {
> -	const struct movable_operations *mops = folio_movable_ops(folio);
> -
> -	mops->putback_page(&folio->page);
> -	folio_clear_isolated(folio);
> +	/*
> +	 * TODO: these pages will not be folios in the future. All
> +	 * folio dependencies will have to be removed.
> +	 */
> +	struct folio *folio = page_folio(page);
> +
> +	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
> +	folio_lock(folio);
> +	/* If the page was released by it's owner, there is nothing to do. */
> +	if (PageMovable(page))
> +		page_movable_ops(page)->putback_page(page);
> +	ClearPageIsolated(page);
> +	folio_unlock(folio);
> +	folio_put(folio);
>  }
>
>  /*
> @@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
>  		 * have PAGE_MAPPING_MOVABLE.
>  		 */
>  		if (unlikely(__folio_test_movable(folio))) {
> -			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
> -			folio_lock(folio);
> -			if (folio_test_movable(folio))
> -				putback_movable_folio(folio);
> -			else
> -				folio_clear_isolated(folio);
> -			folio_unlock(folio);
> -			folio_put(folio);
> +			putback_movable_ops_page(&folio->page);
>  		} else {
>  			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
>  					folio_is_file_lru(folio), -folio_nr_pages(folio));
> --
> 2.49.0
>

