Return-Path: <linuxppc-dev+bounces-15847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7AD24CB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 14:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsPSC1LdFz309H;
	Fri, 16 Jan 2026 00:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768484859;
	cv=pass; b=cKV4Ehwts300hJK7XuGktPOLAQ3SDJPAe/CKmR1tQceNxMHkiKpqwBFsGX+SQwELliOAifhnieyZQOFd7pgsVBi8KS4w6oTIWkDs4Pb54Fc2b2BmZObVicX6t2+ui77moLvN0C5bDyQe0griyQ05oalyZ9TwMK48R68x7VpHy2wM4szCXhIqXLsehxuPq98iHBV6NNeghBnsL2F4AiG2cMiltCyGxz+aCs4zLPUddxmy2WesIUqtus/qv/IoeHQ9BrvlgNgHQC/1IIo2vCL5hojJ36koLgJSZU4isRE543F/0FE5s0Mb+LhjqFPEKI9ED1Ox9Up7c5d7LKTPWJtpMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768484859; c=relaxed/relaxed;
	bh=ZUamO8Ah86E6t5RjompyWUa5TwsuVyMjfL536GRqhnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SKa893hCPU0E2u6/6Z+ucbxZaRLX+OdKR1xEEy/EIJvxyyMAZvjlagrVQkpToXdmdng5Ebo8lql3s03d+wSX4wFtcFh0imMv6wd+7Ju3tKD97zYtWB2fnv/WZMJudmfKdgiyFU7inqeBP3lDvkfyBJE1FOK1tEqiXUaOeNDyl911nNyEFElvTF7l7GXeP3/MTcGuQ6jhdxBCGKgLtnNh1+zC4gawdWR5/RzU6zsPbY0imFMIAHpSJybLfI+Em6xel8Dpk29r2dkX29RIsCJ/N1pokPuHqE1IgjQHA7FyxTXqHNDeP2y5IzUgS7WKT9dJij3X3oaCXnvFW6pilKrh7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VfGfW2px; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LnkwvMD8; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VfGfW2px;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LnkwvMD8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsPSB1XxPz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 00:47:37 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FAgb5N2755030;
	Thu, 15 Jan 2026 13:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZUamO8Ah86E6t5Rjom
	pyWUa5TwsuVyMjfL536GRqhnU=; b=VfGfW2pxqFisHspPzO4lXaSiNKmye4kWcq
	+Hm9StFsrwz2wjIDX4m4BtPaNyFIWAoomYWSsJFzI3RiPOYidhCGN2oS/e0g5VQv
	vLd6UZh/g1u8f8SBWeG9uIxzRs5v43c/tza4HODPSNGt5ZTJc1rPBL5xCPQ9eA+7
	NAdwJcfBEc2pEpIZU7pfCkWzsgzmbyld/W1EUrE8/t3XJPoirnJNyF52ao6qzagi
	xq8TH43sD45sByzq05s8dt1jELMvAzAa8OmOWxc4iezBc+aEVuwXLI4H6RPM7/x3
	8GORR+eGifDzlFjh1QmvinpLl5eGvQR5HfKmENiL2naSa/fMaOxg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwgqumy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 13:47:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FCtgI7035569;
	Thu, 15 Jan 2026 13:47:07 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012043.outbound.protection.outlook.com [40.93.195.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bbndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 13:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/xaokgo1kUJH51PRTc7Ud8HNes4zQQ7Tfa0tZE8X1Gna5UAjo4+Vyr4LkzYwXCwoXautqCCblPzS6Q/UkVrKDy+0tv31GZjURMWP9+drU6JQ/pWxoe7No69I1hkV943B+eRuSQ/KZ0EewvEVovSvjzBR4R912BeIfJ839PGy6B4Q+IPoTaeoxvc4Qj52pQuvyEzLtH8SWUlcTbRzEahOS84gPksatXaty9+w4jrrLPC7IB+A0RXsEnpgBduQaW7aVKXai79q6PrIvBrRFTqPYvWfLdJz43gwGcXUOIMgU5vVjz/srFp/6ahMN3vG+lF9awI5vnJL426SJoU4xmvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUamO8Ah86E6t5RjompyWUa5TwsuVyMjfL536GRqhnU=;
 b=C/1L4+ZHjm+ZTcP9l1Dk2I3BBYl0ghXEGiiVkgXUKvFzTtTDkDbDsRx8fkHIQc157oEeN7cWvly4UR1sITlE8msuygqkjS/AnfJgDV2mDoJmOxgec8hzzi64otKN4qWNanX4ALsiOktPdVSyfEhmCPcjbPz46PAu8mrc28DGXcavjBep6P4J3hHH0pDZhTF3JEZOYGGzsOBUZOdKT43TvlZPZNfudckrf0RehEIANR6nWwLwNdcjlsjEDxhdPu+QQ3Ibe1L1MVO9lE5FGkvcypq/yrAKkcySC7hYUqIFRJyuelF5malOk7laeig/Noa3+J45AmYjU3VXvRMqLkxAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUamO8Ah86E6t5RjompyWUa5TwsuVyMjfL536GRqhnU=;
 b=LnkwvMD8IXJhf00hWWrqgzgrU1CHrrPgDQPfjf/v2WV7ttAxFCvtg5n0rJUWVvt1Ia7rWQgfuxFPV9cbsSSGKWAECTt2m2pDzgMfqE9fjHId0qzFL8im9HSFO04Q6GUJ+pWSX/Co9yzBqNTxVXYp5HrOV1M5Tg7dkxmGxwdcbDY=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by CH3PR10MB6763.namprd10.prod.outlook.com (2603:10b6:610:147::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:47:03 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:47:03 +0000
Date: Thu, 15 Jan 2026 13:47:06 +0000
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
Subject: Re: [PATCH v2 20/23] mm/kconfig: make BALLOON_COMPACTION depend on
 MIGRATION
Message-ID: <c2dd5cb4-9303-489f-bbd8-2a09a16dd973@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-21-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-21-david@kernel.org>
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|CH3PR10MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8662a325-b575-4994-dd95-08de543c90d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iR9+1UladbCkUFv0GSsswI0xqo2qizQi7x/VmfmrnksPgeavrfnAX8/icjG9?=
 =?us-ascii?Q?RkH95dvrt7OUU7XqQfWOR5n6TmTsM090rongoaeqh4MsWxsNNif9ZG663tlN?=
 =?us-ascii?Q?kcDDzdhgT25/dwr8fvL1LNDaVD9ka8RANS0uI/Bzbi3UBxJqQKI1ZpHw863V?=
 =?us-ascii?Q?8+G9SL0G2mRhiHp3L2Bim/4m/faFNZA0b996DXLeQDRgm9JsShpLRXrdlYry?=
 =?us-ascii?Q?0Q33itf1sALCqDM8GfCVu3Li1vG2jbbTKlYbeAn1fvCMv+YIV4jjpsVnzU8+?=
 =?us-ascii?Q?r5SrzRU3Krpg28L5uraz425r51NuMF5wdvGVDlx1RMBRf+cBzbolLkV+Xv2x?=
 =?us-ascii?Q?dMudQuPlC7qMkqHROMajUCWPVHLzcrrwTWz4rPPBUcyO+EOp1qDI12vN3+bC?=
 =?us-ascii?Q?asaC3s5HoubwcnN+E8g9XI2KUtXkvxbL2ogt3gkh7+vJTnF9vOENvqFjHp3o?=
 =?us-ascii?Q?fbr67VaHoJgqSf8kxVXcwgwC3aKfq/qlVfsWzFFRlXfWJ5Nx5d8JCnMgFKCb?=
 =?us-ascii?Q?iE3wa/Zk496qL5RyzxwQuIx92LAYyyrXbiv8NER/WzQybOylIihdUMAjZlGg?=
 =?us-ascii?Q?78ihS8ZJ44FmiMtY7lopyM3fr1V/xyrDpjJZ2+S2Z0kFl5xMN1HeCOFWsyhB?=
 =?us-ascii?Q?AuWjUNxvIVhzvIiFRD0cAwM9kF4nvPmrwQHz88/iOq5s1qadyCmRBx5QHQre?=
 =?us-ascii?Q?k++eMU4hqNrZcQFf8GUNI5iE3x3QrXr1vfN43J9Ovo8LDuM0wqsSwsvzATfM?=
 =?us-ascii?Q?vU/ifIZSw3L9zI+dPqVYsMoobKgb5O8i9+neFlyv8pNcGczJApoGc5CUuKkb?=
 =?us-ascii?Q?hHO14fo5spLkbifjRsHVpYDQsz1YZnrhRsxecZbnszZvvRvvWSIihb11XfsZ?=
 =?us-ascii?Q?KBdL/jxMFA3UksFQLWyBwg03DBL+LS2rdODgB1tnPXyglQacHfwfJBCkUhMg?=
 =?us-ascii?Q?cLSLhTZ/x3q5AaHulwnqLObhA6RUzfwYmXmM8DwHYaDRRjO2n6mbZ4irHlL7?=
 =?us-ascii?Q?oZB/QxJ5TwJYCmPS9HW+pK+WxdovxWFLvQ3pdp5iui2oa6dmbrcrvmR/7Qqz?=
 =?us-ascii?Q?TcntMQ+lZzsBLVOiguxoxSlJpWyLLFGWp8gSWmLFtkSHUr9baEyoFJTMay6I?=
 =?us-ascii?Q?zoXLWdw1j4wojdZ9T0nRXnubWv4xjmQSLXasjJa+X4ffPFRsWUsEPL1i7Qtq?=
 =?us-ascii?Q?SN+Dk9tZcz0nO1sp6iR5EQeyZtE+pyDItLk0TbfRqIHYshReACcwu+12/TCd?=
 =?us-ascii?Q?ID/mH1IZrLxWQ0pzbRYQu3z0Gex8GkI/9r0dwm7k8eZJSVXcP4E5KhHX/kW1?=
 =?us-ascii?Q?wc+jMMWBs/Nh/MsxDYSFyQ0khk7zjT06PePl78UsKzkXM3/FtxDKPExceu27?=
 =?us-ascii?Q?IyXXIY6qMuLBBAA8E/codOBGVz1aJ4ljO+mOG7avyKcnv2ptXoypjv4tNpE6?=
 =?us-ascii?Q?ganqXzL+jDiZuURCmHOvjRwMQ2LFV4WUv9C+pMLLFwRvSYT2JEcM65Oa6z23?=
 =?us-ascii?Q?et/QBzmh51oRxKE4AyAKLBbCuBXptn+PlsCPYix9/rYR/vvKGGcgD25KGcaW?=
 =?us-ascii?Q?lbn1+ql1lAgg+gk1dlA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hz3VY7xFYoAdXTZn8y184RP8I2ubUT3VPBOr4O5jQOLpoMljWFsBfZU/L//R?=
 =?us-ascii?Q?PAn/DdtBPbtG6JuE2QMLGQysiRU5BJoG+9wKjaENs0SK+fy18QmeeVrC2Xmm?=
 =?us-ascii?Q?A9ngy71ewJrWsIiJDMPVpXeec8g0yWCx6gilzRDbtttdI5O0SFHylrfrIUk8?=
 =?us-ascii?Q?B82bRjvKvodeptxe59TyvVSKQW9Og9KgwAakGh5rvPogy/uiVbLJNNxru2hI?=
 =?us-ascii?Q?AlyYE5e5tQs6OJBQs/dgoomTCHWwSZqLeBtfB03erQ9KV13VjYXbVmi4pk/+?=
 =?us-ascii?Q?cBa4r/M4/nulFAC7RuP8sPlaQ4fWpXCEbgMrHtQUk0st5dYZUm6P/vEDQzTF?=
 =?us-ascii?Q?bsD+6Wm5iKx3G7JHuD/9Ce83oaNFZt+NFPsYu1212HO5lGn4OrareLsJBKhE?=
 =?us-ascii?Q?axHKJuS/o42+cW5cVOKvd52pTEHDQ7FSmuzrZ39JYZkuNAqtzA12FpUTw0PX?=
 =?us-ascii?Q?WLRBHDFjr02Xbzla6KjetRClVMnG/XDl3lukPs1O7wfDBnr5DqR2LSfeJp6X?=
 =?us-ascii?Q?+4TnqXcdH/aZWneeRRXxkL2mW+WolMWzsfC39ApwFOLka+HU1HGTckNlVdg6?=
 =?us-ascii?Q?Co9HjVtXF8RDAQD7393KGlrG+mibjpbDEZo47qtWEKsUVmvztPOwBh8R180a?=
 =?us-ascii?Q?JM5ldD+UguyYnX7tV1pey4TRM2vaq3/GnFB++NcuVBFTpBaaSGJHZXRz213T?=
 =?us-ascii?Q?VgYuCiF8abVmZ66VwwznH1t8/8g7dY+EP1bmhtLohnD8J771JGeCEpYonJ+Q?=
 =?us-ascii?Q?YHlrxD5q2Hu7RdWCvH98VQjbI23GEZV2KcY3wEbxLlYG05oDi7hP5Ujo9TiB?=
 =?us-ascii?Q?xqaouqsTJNoGOhKtR7LWXfoCvpKBoHoUpGyfHtZjjlTiIKrz7ePpcCuHIsi9?=
 =?us-ascii?Q?LpqDRLJKy2MENO/Q/dXyuwkuW7cHma9xd9czBvZh7WWgNL4TZUs+mr/KgY5+?=
 =?us-ascii?Q?RlVxQ0jJJDBxa8ZNqp6fMGxspduTpW7icifZTNd8AmZon91sG1bnvg8JvxQg?=
 =?us-ascii?Q?C2lxjn4uw6+F2f0mdg0DMbqoj5Rgqut0fjV5LFDnmaZ0Oe0q6yhAIXg2b0yo?=
 =?us-ascii?Q?AOK5ANlro2l0lz48YzHq4014M2bXTfnJifgWAn95bvyp3o8DLaD2jpA87h+Z?=
 =?us-ascii?Q?dzmPDfTxrmgXyt1korWgIPByG6pnTAAZs8QdhHsw4wYwuF2e7qW6MM+6lmTl?=
 =?us-ascii?Q?47PpspOAMz2HB3xEz/b/7fJJzYJTjBwZ6wtzdc0FwB3mgep6dJLy2cBe9GnT?=
 =?us-ascii?Q?/QyW3A1Rtb07G2HtCY47MNNQQnZSNhGGQgyFe5cTmb1Bphf5+l1OLuN7rsgo?=
 =?us-ascii?Q?TOLvdrCnjOu1Tnt0UB8VDr8rNUdjC6j/2nSrYTyjPmpZfK/clL5MtDrIW0Ej?=
 =?us-ascii?Q?5xVr4SQAWzHfFHbk0MUvggimV7FXJiyWtbpzWzvbEi3oN/NV3JpHzp1YLAIQ?=
 =?us-ascii?Q?UwHq691wmlKhnHu8cW9YyQGviiEXuvKv8eqWgjeNE+dSKlEkEHsZ78sFvBKq?=
 =?us-ascii?Q?uI9J7I7SMD1m3Deuv1s9tmXouXr2ltOzhWbg3lMdBEzsc8uS9E1VAjPHvC7+?=
 =?us-ascii?Q?gWjJmmJugO0gLIZDDrD7HeIq0pUtFX3QeBTRb5zEyhO+asdq08CtJWreGkmp?=
 =?us-ascii?Q?im81NXhnptMkIgiMWmdgiyGwE+RoQcPFZq/W8QPHb1nfKL0Ga7i6mZkNHpsl?=
 =?us-ascii?Q?v60zoSdq8/nIpjePfY5UGVXGp/Uc22LpxlcTL9gkWExRun6+D+t3BZX6DdDH?=
 =?us-ascii?Q?aW+zFvNqJloq8SmmYIYQMRXf594oA7Y=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J2vs7vqi34YcdP19uvu94S71RkoeLGubavQ5f7PZgW9SmOxplnHLzjLO16TYzcWqAcpmpryxMaawugQQDlQKGKbKN11qoSkqIo7UGqV9XnjbV7mEjgown4dNmVEsuSSR6unlzD0+TDBw3fyZ/99PjgviM7hDjRJhaA6dpeFJnM4K/kJDxjoSMdG6kwFykHanD1fgqfshxLGS2B/h8H2KCxoqm3RyrAbacA4vEo0LeYG2Y+o+cfRbQ6PT2EtHn9rSLbfwzlVSZjv+mQ642mizYrDc3QOozgPsRwTCOyB+E737aIfR8N2eiDJ4n+web4ElLrMMg3xs4yHHBtqGxkDrL7KJ+5iocHG6bUinRoYoDnAK8G76cIGDdy8+Ujg+aUdgUoO4GI2zqeUq68wr7rMCVNMDrZ9XY7zflUNBSWPW51eD/nv3J0ILFBm/sDWAnAcPtcucihkLtsliU0HA7WqQUBH9lmewKsoTgCydzj9MYx5fYv/5YSdeMMV/fJ6UmYvl50ziY59a6iqxFNjLcrpVqS/CeQ/MqJj/5Kcw1+qecLhsVgfCmlFwpT53K0ZJNTXrd39wUgeZ191DeARIAtgXqSk3T9fLekwgV7cFKkNfoJk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8662a325-b575-4994-dd95-08de543c90d9
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:47:03.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKkWPnr7z8HhGJMmuc/EtyALCA2kmk/2ikr9qIIH33WRTPGbfeGpA1C+cg5ej/ecjbAV8a//UnEtZzDYvuStHAZgepu4nCi/mTiYB4Fict4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_04,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150102
X-Proofpoint-GUID: W6gY-XAeMnrwHgR_I4Y7VMmrZ4l1K3pk
X-Proofpoint-ORIG-GUID: W6gY-XAeMnrwHgR_I4Y7VMmrZ4l1K3pk
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=6968efdc b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=puuS-rSIhbKgJCg3g3kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEwMiBTYWx0ZWRfXzXFCeJZ0VGwH
 OfwcFPpKIXuQQ5S5x/ajmq7AjJoyRB630o1shdh214yF/YgyCKZaBgPUxk/Id1y0FKtUHiCQF7A
 NrAH8Hc06PEK+TR2iL20T9TusHvxYQWgpIJvnl37M/UCSJnA4ld6G1NnOrmwowVidq7ENUmA5Fk
 o7NtinThu88LDiH3ZF14ETNnk8r/HoDsGzuTBe9b/rDXuBK52tZGuiPh3MwN81Iud/Bqb3ZXoOM
 B01Y5f6DVYlQ1pzOT6WIUi/kNgKveXeHDKEzqxKpTqbTgkCh/mHYamfzNyisdsbsEq+W8SXhO51
 pT0sJF0MVNIZFL7HqwfK1XtCdZp5dllxonO7N//vO04PqMF89io1CXhPauK2u6B0g8BZNU3B/sC
 9R96f8WNPZfUMqQ+yjqzouFtZyjXbbXMnm/Imjz2mrT8FTlGTvYSYWuV8+4zp7X43UCITIv9zp4
 gSCSsRh9EsKEIGsN73g==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:10AM +0100, David Hildenbrand (Red Hat) wrote:
> Migration support for balloon memory depends on MIGRATION not
> COMPACTION. Compaction is simply another user of page migration.
>
> The last dependency on compaction.c was effectively removed with
> commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
> page flag"). Ever since, everything for handling movable_ops page
> migration resides in core migration code.
>
> So let's change the dependency and adjust the description +
> help text.
>
> We'll rename BALLOON_COMPACTION separately next.
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Far pithier also. LGTM so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/Kconfig | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 24a3ff149a1b0..0d13c1b36e1c1 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -599,17 +599,14 @@ config MEMORY_BALLOON
>  #
>  # support for memory balloon compaction
>  config BALLOON_COMPACTION
> -	bool "Allow for balloon memory compaction/migration"
> +	bool "Allow for balloon memory migration"
>  	default y
> -	depends on COMPACTION && MEMORY_BALLOON
> -	help
> -	  Memory fragmentation introduced by ballooning might reduce
> -	  significantly the number of 2MB contiguous memory blocks that can be
> -	  used within a guest, thus imposing performance penalties associated
> -	  with the reduced number of transparent huge pages that could be used
> -	  by the guest workload. Allowing the compaction & migration for memory
> -	  pages enlisted as being part of memory balloon devices avoids the
> -	  scenario aforementioned and helps improving memory defragmentation.
> +	depends on MIGRATION && MEMORY_BALLOON
> +	help
> +	  Allow for migration of pages inflated in a memory balloon such that
> +	  they can be allocated from memory areas only available for movable
> +	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can be
> +	  migrated for memory defragmentation purposes by memory compaction.
>
>  #
>  # support for memory compaction
> --
> 2.52.0
>

