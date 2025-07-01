Return-Path: <linuxppc-dev+bounces-9969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F8AEF393
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 11:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWdMl1fw0z307q;
	Tue,  1 Jul 2025 19:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751362899;
	cv=pass; b=ZauGv0ZXt5q3Df0WBvr+0H5AL7MZN/3g/UszZmetTPG+8a0xaV5tLyRGsdqFsXX9DmhTnYyyEXcm4L746Fzybu/ZOpDfMxjvA90FwWBd59YdRzVTxfPGnbsOKB8FGCveO32lj1pUuW5mTkpoTjfbEBkkxIswbaZTpLhVVRJCCcwH7fWVnWqyBGrRMO0Ig80N4dmEV1jEYq4PD2MojXaqzpx6OrJMKZ57hzYX0C2HQdM2xsHBGoYWz5aiH3kmq/aqM4ZWLFOPxo0+W04pjI9mzBNMYPQX7os4NkbeB1Aphi3DwMJhxiuiNDsnVf5iOdm1hfnrG0h2zg4yz7TA7lmdUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751362899; c=relaxed/relaxed;
	bh=DzTOP7TUiQs8sTxzyKXDXDcSC83Ju9IFc9UAzY77SoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mpgRBZIlHwXjoQR6kHr5R2G6KJM/ouXarZTkava34TwqgqMlSCSkB75t2Y6UxTT4e43E1a5a5LgFSO7gStimkfkQgbfTJXTDy9eF2pJZtJoMDWswim9ET1PLnNGtPRHgfsnOsjmHfi9jF5FdtcDiIyijlgfUfgPb32YGMwkuQscT3pzZQIWnXFRGZD8MFJxZ7aNO8I8/J7H8SGDMzOWNtJOWhd19SeIsCKKC3cxu0OTEfcGWcXEasmlt/pDGLwiDXRNiWTWuj3NXPJ1+8jIVo//O39TCoPYUp6s+qWFOPtLoKtP60KbWYCC6WeVzYTmvi419jYn8mOrblraF+lAAdA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XzvEuaDG; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=M0KH3vJW; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XzvEuaDG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=M0KH3vJW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWdMk1lckz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 19:41:37 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611MjrH012608;
	Tue, 1 Jul 2025 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DzTOP7TUiQs8sTxzyK
	XDXDcSC83Ju9IFc9UAzY77SoI=; b=XzvEuaDGaM4Q8ANM6JK39nEKg6h/mtk7Al
	2JOt5IRXaJNrCUSys8YI1z9flTPvOeyx33NzryIyZ27fptH0g0BChOP/BS/cL+OF
	/njNrgwxgprHQAiebYRq0DgHNPqNOt4YPmBH9ftv9DBeUULnnu1yHIjydpwTd8s+
	xmdFMG9h+Qst50BX71Ra4n890UcImghIhrRFFxXW2qTXJef6P1FD4HJFM1QMFc6B
	YOlF+kF+uJVsF2mB0gBeadGovarnJkEvXFXQLAkF0xFlT78+IzYYSV5H2YguOy2d
	725SYKhwVdwQNikL/xQlqLZsAGmNq6qGVuq+ZxuoXyTv/x98cxpQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfccvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 09:40:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56195Dm4009076;
	Tue, 1 Jul 2025 09:40:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9htrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 09:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPhtuR6uaPVyS6vZQ3NEPdXZt4r7CmAq9NGp1RBPkItc9QY7NluGUWEk0cl1bUOpzGt+v7rvp3cTbyG72Ebi502bpirpi6gxZ7Xw5Lv2xwjzr0m8SB9UKeW+/cVgrRcGFbYYjnrXB20FDvOBDrJT8TC73Dw4wpCV4pzu7j+Vih7mLmDiFa2ODmSVAczApV3ucQ5qFWtmPv8dlYjTCOP7YxhnwRk4/fcK/1l+j35VjTDIUX+WoXUTnGZeic8cr4AnGLaKNhyJ4Kyj0v80vyqHFoST8LlM9nTOyCmAo94ofrvoZ76yiwnhM/zTEdSxKiFRunDLfRb84sFpuH5T/+kupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzTOP7TUiQs8sTxzyKXDXDcSC83Ju9IFc9UAzY77SoI=;
 b=QUUwsJp6ZtvU+8V8z0wB2TUjuPSDTD54PGe+ODSSOGBNb8smKJI6IZ28k7Zi+CN+8xZOpRBlkhV4nMaW+uwT8Frdt97ypVBnLEf/GNvbFO0yWUJfUbnySb/NsnytxTis7tqoRlvT90htPwz2HDhpUQc0fjUMhIbMdp2sb+wM8WKIy8jhgcKwWPPqMCvjgkRrsDZlMmIC2rDNit5G1Ty7AJ90bNi2S6d5fG1B5/UCW/jayToTDCVMx/oLQU/pat7lA8EKUnqbq12qvMRRW9hKCqEM9ndj2oz1f2qPLwP/v5wWiVVtW6d1BT3PgedUswRMU4MyljZVDX4umPLP2SMZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzTOP7TUiQs8sTxzyKXDXDcSC83Ju9IFc9UAzY77SoI=;
 b=M0KH3vJWugjwxqries0nMtMJIvhKMxzFPDH5+U/UTcLWHzVns06DGXmgc6mez6BZqu/56fMvS1e7sDuwAus6t+nual2zngXKYVHs5ugSZ56LaA2CWr+SzTNhs7YtmFBGIhxBAJS13cKAiJ/8ITWChMxKEsWsGnJJ/xsfiWBhwPg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPFEDD6F73B8.namprd10.prod.outlook.com (2603:10b6:f:fc00::c56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 1 Jul
 2025 09:40:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 09:40:42 +0000
Date: Tue, 1 Jul 2025 10:40:40 +0100
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
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <e10e82ff-190f-443b-bed7-3a8c45397600@lucifer.local>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630130011.330477-13-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPFEDD6F73B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7756e721-7a9a-48cc-fa35-08ddb8835881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oiWgDA8lQve8t6+hAieGITcw7gTkYVvMsB/2UqE9ZyoR8T/4HFD/pDQTqRjp?=
 =?us-ascii?Q?LsZV6qtMCdrGfKRMF3OtShkSR2hkiKzPRW5GebLB8Zzjgl+3os1s5Ff5o9Z/?=
 =?us-ascii?Q?55hD7BPBmZTNgi2Fn4RHCftwWGP5SAX6bNpbr6scSt8Ze7boKO6MMY+WZkiH?=
 =?us-ascii?Q?/Cg3Xo8wnllOJOT96AWPDBDcE21K9a80+z4vG3CellaEwKdCcsxaJwWGMXhq?=
 =?us-ascii?Q?qC59p1v3T7rLgFZQBENwgZRjEH1NnAVZUCiS/UiBdrvcQea+URnLy8yHk7tJ?=
 =?us-ascii?Q?A32FvdzNN6Opq670exqzgAQfTczhdTw00jd5fL0xc0mL7+EMJxi1jx7Fx7GF?=
 =?us-ascii?Q?ythPDMd/HXwA8gLj44SPRQY2L9F2wkcBoIJFyhu/zNy340BomFb9zCT8lVmn?=
 =?us-ascii?Q?nkjKhK/hKFt8VfA3q9IF8cOvio3j/iqG+In6e3xPPN8OpArhF4jD0xnPP6fV?=
 =?us-ascii?Q?52xGHu5CJicpJzQsMhaki/PxLyGXwX0Epnq29tpvRUs8Md4sH/g3/U6Uekw0?=
 =?us-ascii?Q?aa5rursD0cjEj6zQmEIvI93UzXwrTd6H9YsvNUJqyCEZqr/ybvWSl28M+0Ar?=
 =?us-ascii?Q?PNOAaqBr3ufRfoSredxaaBePKZPZ00awrGRAWlwOsTWhZg1qDBL0n3hbdNas?=
 =?us-ascii?Q?TfuQmAXZaFErUDmpjn1mLxH0jpadhRYGC0t6g0jYSn2pu7BuX8D3tM87xwwI?=
 =?us-ascii?Q?2RJZW0Eudicta2Dp5PPCdIuyRMrapZa6YydB+aSEhftIun8hEsAPmxwnyd5K?=
 =?us-ascii?Q?UdI0Jhv7vl5K479MIF3gvS4eqUNDUbleNhGPt3PMRFpPnEveBBIQYNru0X3H?=
 =?us-ascii?Q?Pg0qxltl7w7oZzRM/Kjn36iD3ilY4iXrmvjTAdawoeN3hP+o3TR6tFVyuELn?=
 =?us-ascii?Q?hkJwCwk0ZIpu6wRxlc8tBlunj3qL6nHO3+o3m5da/0BFvm6pefTbOTdHUk2W?=
 =?us-ascii?Q?vNJrHVquC1h7sjdnFsgrz3GMPH+MT5p+pzq7TIqlwrScukM8vqxjA2eCESK9?=
 =?us-ascii?Q?l0/ZDQpfBWAXNzP52ugFf4by+ppPuRSW9DzBt/VeyHlsTgEnFGyLWKe45xup?=
 =?us-ascii?Q?sLHvGDLpI2lxRvqBLqTL/Q+3uYT8dPqrCZzle5dnLIh8ie581mLX1oxDTv3f?=
 =?us-ascii?Q?6Iusdr8bIVDqwCdiGvLekiU2e5G6rpwgMB4C5qtyBeYw6+31oU8DTHbHSwo+?=
 =?us-ascii?Q?t1GxRImyyQLP+yuGu5gx2D+HCXEOGsm5TC4FRwMan8w2lFeO0rIfIMYE046W?=
 =?us-ascii?Q?pUf/UA5+/ATgIpC8O8LE4ExIoedilXOW3S6l4ebZvpFTuQEn08+qGTj3aAYq?=
 =?us-ascii?Q?tpWhpgnA2QNOmNdRtdfMJo7lzJQlwP/it5THi78pWls55eAU1DoQABtSimxX?=
 =?us-ascii?Q?kT0ICfbshvs1cYtPqLe2bn458UD2yNvf4XOTVYWBAP//o0QlKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RgRw5lWIN5PaelxHVX1ceBwA4auLu84IwXCANdHlKqdp4sywfTs9HBSu96PU?=
 =?us-ascii?Q?i9k7kBUDciund58CqqWEAoGJxgHFhdSe0rsAguf5AmuuhkJVbGZ235XgsdlF?=
 =?us-ascii?Q?5hmwlQjdbLAX3DMQbqSVjtARVju6wJ6XRqT3TA2fyEXJ8us6l0L+GwyGVPgD?=
 =?us-ascii?Q?uUH+higv6wcngLzxag94jDH+lBlogPPEFakdDDMm0MynlJfmle+ntbUaf3Yy?=
 =?us-ascii?Q?EsNlj1mFr1ZWUj2BztTlX9IKFuxyIDK06bnmnN0LsElkR99Ry4ohaex0hgSk?=
 =?us-ascii?Q?oyn96D1ZOiGMUlT/r+voSf7xGBCeOSZkPhP7UtOYo6RzRQgTJ/CAflyJn8Fj?=
 =?us-ascii?Q?Yvr/9+Z2+NM5IGfOR1ZWJ/bsb4RKi9h5BA0h9rD39Zd0PtqHiGvEypvfShCR?=
 =?us-ascii?Q?ZLzDyGPKuPxeDe9QiDJZfQtTD3bRypLRsuD6OuxgTwc2PfThNHahOayoQLep?=
 =?us-ascii?Q?uFxG6hlww3KCUWiUOJKP13CBOALxljBGgFTxjVWKrdfzU1bgz2EyhTngvYjg?=
 =?us-ascii?Q?L82fXFj4UJ963XIVicw1wVrVp9ktheTajS5tfITYELpWxVLPohwksFNz3q0t?=
 =?us-ascii?Q?Z0c31Mn2zhaeLHYGhGPo5ZzRVqGbUFP4iBNEHJee5Dv4PsNyN0jxZ+tkx+ga?=
 =?us-ascii?Q?/GL9F+DpJHY07+TiU+yhS8tDqKdXcxW3zq10bxic5yvRz+4FeSdnuOkTOTVM?=
 =?us-ascii?Q?NosvjMwRJrosx02Y9E08ViIPl0VmKKc7ASfya9mieTFmu4jWRVhdX6MEWKjq?=
 =?us-ascii?Q?wYYG7Fa2A/NIdpo2hIN/ntc3JRfe4e7zQjsY2ipKK9o9rTMYY8cxYBNV/mvm?=
 =?us-ascii?Q?NGlfVPHAYCPhxRr4r7UgMu5BHq3yGbkJlREnOpbD3YFGmpmBRXE6438ekKjX?=
 =?us-ascii?Q?bT4LAA5/hrOrPNKLGIYpSETKLqd+eS7Lo18DGCk4fgpAohWhsDHK0Kh6RkeA?=
 =?us-ascii?Q?LtB8AtVY8c6fAD80s1mmOgQSf7pyp/2cCHw7Kz+zebx5tMFxYvJqL6VpT1M8?=
 =?us-ascii?Q?slgl+PoXl26NIQkT+WBeGzXkjqlUrTN07yMR7Pfy6B4RnGFrNaAs3OZbTnyB?=
 =?us-ascii?Q?hJqAdmynrRV4R7Kk0qA/Lj5A0+v0ZAA/GGl0VNdfqCQkZJGE3DbhQTMl+CEp?=
 =?us-ascii?Q?pvb97IfWgODF8kb2JI4oQxflNWTNdrlaO5xyp2CyQAVOnk+Yuv0hUnGI/AIc?=
 =?us-ascii?Q?H1Q5g8DrhXO4IN7+kspXSrXXKEqlK25yFQmKq0jUNqYIWnPe4KhC57X1VMYk?=
 =?us-ascii?Q?Xzdr14y3KGnYpL87OmgtZdBHRLpNi97fNK950s5mibDi5tsaj8LV2L9JzvgC?=
 =?us-ascii?Q?9kZajy04MWS0T8EI2fevJ/CUGXAyk6w1I6ddlIb0hGabxG+7PMy97gNjpYjN?=
 =?us-ascii?Q?RLDS9x/+R/R+/pPwd4b9BcmrAi31s2RiJX9/uNAU6hcNoT4atQ2uJ3My1/yu?=
 =?us-ascii?Q?q8euvFmsjvr6lGO7LXib1C/ORgfEGZCMPwW19FrHYdaPqgjbmv3Ec+pQJWmX?=
 =?us-ascii?Q?jS0hwVj7HgsyCeyYrCm2XEW9Iy68ZVi+vejqkv8yHtQkC/hOFAYPvTL8znHV?=
 =?us-ascii?Q?3Ug+mR+pNzhrPqEG5CTfSeGWi7G3K0XzLW/iZb/gr/JDsRh3GAIhICHydrLa?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k2iu498Rg3YNRx4BenvpbvC841BH2oa/+eOxf8vK+fucevHwibTD7P2veHvWosFPhdU+dUrXRGSurSShohC7HFlE1cbVjzW/8LrY/2el75CbfsfIiUBI6n2BFn9y3CFV5+bdMw4PVDt88gtjmA90aG8+szy4Qytgu2a3hl4DjFOD0ewgpCaXwcKlLvyDe+oPR0AUcZ0IeA7tc4Pk3bt/lA3eaGgdYOAuZMKOcGYA2oOA21jM4bLzG+922DeDw4JDRZYnjoUBYM20/rtPyDyFDkVMym9LnWtYFc+f85j2q2O00QilK2l6t9KCm7mKajr1sRk8QtfKx+WvXHMRftNynLzNheM5yJ95CavAhfF7IlNKgcAsgpRbwdgNUK3uDXF2F32JHnXvrygY8CGRJMv4aPDl4cVNOalkHYcTpGXDnApDJYrWh9yUUbAc0WaTzaOUbnwaOIhqM+mhYTcB6P/Od5I3svCqf+WmrzQHMapGS5bwy0fzl+9kwTfgAuiUuFyF2GAUk1HQIVFXOHNsGFRvXLUHiYylnol+aaWaf60S39PMlFDCpap8teg8pKggdYu5CsZgYruAGyoAdwMR3e1ajEa/VmjAFw+qMmdLZUXVAe4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7756e721-7a9a-48cc-fa35-08ddb8835881
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:40:42.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QNPcpCi4GR++GV0wbqdOvMosoh9wWquwo8+HMPnn3xZu50kh8TUmipB4i+BAK0gpxXHgxlDFW4mrLPoAd3MJGyO95EII0UxHMYP1BS4jtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEDD6F73B8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010057
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6863ad1e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=nCi1l6IOqr0Szu5SiHwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-GUID: CkjjWM2RAOEjtTU0UFeptrn6M38cLl4u
X-Proofpoint-ORIG-GUID: CkjjWM2RAOEjtTU0UFeptrn6M38cLl4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1NyBTYWx0ZWRfX33viAgEzBdNA sCBDoeFetJJqYdjCx0XSxNXCfUfX4t0TO67UStXeqaMhyJ1Sg6ZeuO+NiAX7DLVW2S7Qf5vOhOw AbCFPf+Ot6tCDSIN45DXcKB1c0vkT2P80oTR1aU57SkjeITttT3pzDFRVfFBhwu6VDvKZtOQ8Sc
 BFrx5ZFmP6C46T1ejIEHAYkKEuKuCeMIQzETA/QdUrAJ3kgCz8Ni2+T7nz3HfVaExjdL36dqLDA gKk3GMD8/KLsg0hJf06u/0vTS24nKuLHgrPkCXJ3a/RTFFctofpk7hyvg9UuCpZ5M6A1UtApDrz n240wu7P5UAP80kq4wMNgRJ3HNzJ3IezJVOa1D/gczTeW/gWp6UUSOoHdYsiMuSReO12uHN4Tfg
 FEhGU8kWVBFo1awNoBX+N39HuoyXnbVnSthOEkp4ih4s+XduU4nINfSalh5B9xVEEA1qCnms
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 02:59:53PM +0200, David Hildenbrand wrote:
> Instead, let's check in the callbacks if the page was already destroyed,
> which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).
>
> If we detect that the page was destroyed:
>
> (1) Fail isolation, just like the migration core would
>
> (2) Fake migration success just like the migration core would
>
> In the putback case there is nothing to do, as we don't do anything just
> like the migration core would do.
>
> In the future, we should look into not letting these pages get destroyed
> while they are isolated -- and instead delaying that to the
> putback/migration call. Add a TODO for that.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/zsmalloc.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index f98747aed4330..72c2b7562c511 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -876,7 +876,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
>  {
>  	struct page *page = zpdesc_page(zpdesc);
>
> -	__ClearPageMovable(page);
>  	ClearPagePrivate(page);
>  	zpdesc->zspage = NULL;
>  	zpdesc->next = NULL;
> @@ -1715,10 +1714,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
>  static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
>  {
>  	/*
> -	 * Page is locked so zspage couldn't be destroyed. For detail, look at
> -	 * lock_zspage in free_zspage.
> +	 * Page is locked so zspage can't be destroyed concurrently
> +	 * (see free_zspage()). But if the page was already destroyed
> +	 * (see reset_zpdesc()), refuse isolation here.
>  	 */
> -	return true;
> +	return page_zpdesc(page)->zspage;
>  }
>
>  static int zs_page_migrate(struct page *newpage, struct page *page,
> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	unsigned long old_obj, new_obj;
>  	unsigned int obj_idx;
>
> +	/*
> +	 * TODO: nothing prevents a zspage from getting destroyed while
> +	 * isolated: we should disallow that and defer it.
> +	 */
> +	if (!zpdesc->zspage)
> +		return MIGRATEPAGE_SUCCESS;
> +
>  	/* The page is locked, so this pointer must remain valid */
>  	zspage = get_zspage(zpdesc);
>  	pool = zspage->pool;
> --
> 2.49.0
>

