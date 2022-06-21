Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F2553F4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSNks4n7Gz3cjJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 09:58:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=T18rVsD1;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mKEijmcM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=T18rVsD1;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mKEijmcM;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSNjB5lMJz3blR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 09:57:00 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LJ4NE8004714;
	Tue, 21 Jun 2022 23:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/njx8tIRQlEKSacMJRax+vR+jPe8iUR+lMo6N8dU5mE=;
 b=T18rVsD1HFWCVvUX7/Fg2Sk2hozGFobULjXSBPVBzoY2aBPQ5WXRqNr5j0FXsF0ii0pj
 B1gWNxHSa+Vfoe4evs9rMpdFMBAh00JYNOJn/ZQJ+LaJjrwpQo4T/4xsYbQ9jvMKeS3q
 U4UzZUMBvgnSh0QMEUyx0MDkVdfd/hLUut+KFvMwnfEFilJr851DH8WhywdbfGWoXoQV
 pw1o0Zo3iYD1fm5vWQL5jvHo+GOWnO8NKMPLs91Lw83myYamHcn3VoEaP2mpiRXIKrZf
 ZX5BYvP9G9NVmQsNvmP+HvrH7BYwWBaP8vLb4cUv/gXn5UNxfaFfFKmYjx345ci0j0aE 3A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54cpxte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:36 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LNoZ7P027173;
	Tue, 21 Jun 2022 23:56:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtd9uq3gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcEX+UF5Wvp9A/f2DcGTBV97d+fawlqV/BBfDeo8yMvkXcIRh9/MntIGaZNYaAhYW62iqtQuLzFTcUnubLh8R1a0f5BeSVR02WWigW6q80b2sc4BEFT90TfIRFVSAgRjCoROveEPJyb6O77UCp2W+yKQCd+fFybCVnFmxYv/S1FwWBpMRvy0vtsa38j5rzXr2zn7dF5XMnbrPelWguO2ESA+aJfWsRIbo9/97yiEC9x5CznyQpB7ahatEeX1wQATsQVFvowDAZzxeTorBqh0L0VkmeJuw57DAZ3dTEe8fGxesa9vTlbThSLvIcx3rLoHjgyYSRcPq5hXmtfKoATkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/njx8tIRQlEKSacMJRax+vR+jPe8iUR+lMo6N8dU5mE=;
 b=S0zR5G27MVpOqQoAHt69GpDMEgqkAPZxFJsqLFi90mlAdtHjp7UTm74V7FkwNXzF+SufUm4upllP/bPWNW+jEOuHgVJvt4/JBHG0kHe8ailVnI/eJj5O2LkjYLM4fmbgYWRGaB7A0RQ262NMsvskZBl725PTH0W5XC+VhxfvhdCPXwBxAIHc5pcusbEQX/sh8n4nLAAfLsnL32qp/nQdvcIMe8S+sA8WRTJXg6d4IYRFmkJEeSfyLI9aJKBFok7xPfbQVy57JLE6oYP1q2h3+2XNnZp45o9En/uKFR+ev78iV23oWphpBB0I4tRuBQrLMto7Lfz/ky+1ndw2cT9C1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/njx8tIRQlEKSacMJRax+vR+jPe8iUR+lMo6N8dU5mE=;
 b=mKEijmcMKu1+rpUiJqYFCtaqURyKB4at/cuOHfJ++RCrVunocl3L7b7ppEgSGFutoojW3hxzltwiT5fWy9pVSKIzeXefaTrUDVUGKgWgI/xAs3bgqzFeXMB4zhw6eYynXBNjQZ6ShOS4+reyB562OeEa9VrjvSvzAH7RFmq76Gs=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MWHPR10MB1501.namprd10.prod.outlook.com (2603:10b6:300:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 23:56:34 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 23:56:34 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] arm64/hugetlb: Implement arm64 specific hugetlb_mask_last_page
Date: Tue, 21 Jun 2022 16:56:18 -0700
Message-Id: <20220621235620.291305-3-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621235620.291305-1-mike.kravetz@oracle.com>
References: <20220621235620.291305-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:303:b5::33) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3db7010-cb91-40f3-4755-08da53e1ab9c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1501:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB150100E411A14B23EAF8A19FE2B39@MWHPR10MB1501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VgBSYfnlIkwMdOsK5c5KxW+zFR8mpyB0ugs/TjE+WOVMlBid0oaEIePiV0zLqpqQRbPjH0tK3CXBbSB63Z6OXt6j+KM54LJChvmedxKuo1yUXI3iE+gj6G4H8MYsbLCaVH743oOfnOX+YHPV6FkEWJeKgIDCaTXhIyIGTWNDbXLcOPhjMszbF2oS63taXSfnjrzc1QoxfwaZQHtuR3wQfQMxzffWkYHVRUMdbsnx1Kblac6FbqTXfS6JcXTit6nVLrBdCTFyGfm6ffyxdR14WSwZAb5bK03k17zlY4N9AZWORTyX7DUA4q6KfKFc4Krvpb0IdycW9vIVTD+xrykF7eCZ+KD+1nLaSnmP8XfGlg0aCrXuMaE23/cshO5NVu5uxV8sd0PDxDBcVp5CfQhPL4nH1F+XS6smgA31/RSuDFhLJcfxWHbXLUnoPF6e8rOspNOv5z6+ub/E0W5nFDkFRC9CdpDJmH2FzUBRIZ40U1/31DYMcYcCXVtYJXbhtVE4V5uYGjCD6Nwx0ae3R8qJG6K1U1FHbOmDEJABlHo5evUXEjBTt0DxQX14/6ox2bCTfMKGwYTHmHUf+xxb3iNANirTQPTcDPLXa4ZQv1tHrM6fUC2Vq6mcTvAuaGhuttDj3GKjLu902qHCZ0fS7LOVYABlbfwdGSiA2rKc+y0NAcao1r5glPYnsmBLwFSkBTEd6od1dl8shVKWFUbYVfSUt9zWojnULne9oySmwfugfMx7CYxvPP6KbBGs3oNxjFvAsF1RnmNmvF402ZqjVIZNjg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(39860400002)(396003)(7416002)(38100700002)(478600001)(316002)(6666004)(186003)(5660300002)(8936002)(2616005)(1076003)(107886003)(83380400001)(41300700001)(2906002)(86362001)(966005)(8676002)(66556008)(26005)(6512007)(66946007)(36756003)(66476007)(44832011)(6486002)(4326008)(54906003)(921005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UjSIQb5u+M7qVdrndS2qe/bIojB1qsKEwubvBV4oyvGfhhjYBOIcumAlb0kT?=
 =?us-ascii?Q?JvxGdKrNGdyRtAYsyWOsOqKSCfFy6i15HoxuvYN1XC9sqf93F3BiUuI2chdm?=
 =?us-ascii?Q?vPshj+BIu7TvNXy9rCxb4vFq+6LPFvpLfHgJUBg5g4743y4uaL5JERe0ZwRF?=
 =?us-ascii?Q?c2kRk1a/0K+Zmc3RVhIJiSBnTjXM/zDuGMqE8ddyT0Ymz6mFVOdm2id1oT6I?=
 =?us-ascii?Q?L7EY2nTBTcESNZcw2HaSy8qYfUq3Psa9AE8qQi3eQCMaEfxosXNwyqXpPpnm?=
 =?us-ascii?Q?fj1aQuVfxOGUyW+9QwSThfAB5aqD+OTTzpAl7zPDHG1heaMJ6EAi6Pc9L2bE?=
 =?us-ascii?Q?SskL9HJviBjLyiKedBOEl7B6vfx2fHqUKPxth5Ghn675rOXIvqaabr17OxqS?=
 =?us-ascii?Q?N5wzaM20ddcuS+imwz2110EXk8h6r3r+ubHfI8fG0j8F22NF0uPStx2c9zp8?=
 =?us-ascii?Q?TWJNdXmyRQDktHg//oazWbwEp5fqWoQbArcDC6m3tzC6lakT9f9p5qnk4vkY?=
 =?us-ascii?Q?VlV8LHA4qz4yQa7y0LEl49r6EXnIc/R/nJOflgoTDm6kZQopFAGMGIvYsA1w?=
 =?us-ascii?Q?YkLH1W5Ke2ArqTOriLBch8dmWHPNjP1xQwe1Ee8YAjI7YurS3gVysjI7KCpV?=
 =?us-ascii?Q?byuQlpfHupeCRcBmywHiDg5Ubqfg629d3rFgnF1BmEJC6xopUFCz+gZ9dKLa?=
 =?us-ascii?Q?gJeO9pqxrJzw9O/zcmEMHsV2gaSRZEWUIZmwLNvQJtRprFJhxXfdYJuIjXrO?=
 =?us-ascii?Q?/LixcRLcf9XmNYxc0fMWEFtjA6KPi7LtHvdhM4V8QWqC7RRvzZfDU1hDtWWM?=
 =?us-ascii?Q?tW9wwtbH1gIrBcS9duVqp32wJhk1TsEGnXIAxYdPntazefeTJoyAdtgI2c+G?=
 =?us-ascii?Q?4DM4ys0d9TRNqgqxEXEXiVgEh7wrZnRAB8Acejb7FyyFEOvsHvxrSEij6ZpY?=
 =?us-ascii?Q?VjdxcSki8ypxuKZWa5mV1rEX/ys48DElL7RUPpbm7MuK0thnOspIJPFvkgTL?=
 =?us-ascii?Q?IS8rKoeD+sU4Ed6pXqM0e5hAyPB5IYUBCUNrh+Ad1wQDiQD6vMKWdI1Q3xtt?=
 =?us-ascii?Q?MlAn57Bao87G8raXsRFFvGxoqRk8tVfTw0vJis6T7Qy7lDQTidP5VFxFa55S?=
 =?us-ascii?Q?q3u77LNdwfnKah+30v4qJOng8Hzt2oqhU8dWWdLS/PBru3jQ+snjyMuETi1z?=
 =?us-ascii?Q?/bLuak3RWKPyCKQ4gOugxwWKlCylOvC487dEZiMXSBk/aWffV5XlcvERCEFB?=
 =?us-ascii?Q?VN5k92aFyfwhzD3f5mTMfnooxVD/NZjkXSvZ+vLUtJNyrBHN2ETyCq3i4k74?=
 =?us-ascii?Q?Z9c+BYaZ0ZkAgkTtlg3bD/CSRXnKfhoz1TeKqT/qXwhtOevua336rbZw9rNG?=
 =?us-ascii?Q?miE66kJ8VnjUAbugdq2kZu0mCJ2Y138k/0KiCRtwJf/oFKwnUSTkiWeRukUJ?=
 =?us-ascii?Q?H7Z1J96LrLjHaHLQYFahcMIbZOeI7tfYVe1iYrPNWpHM9v4dduLxR+MjgzJj?=
 =?us-ascii?Q?7e9ED7G+7dkyROf9jif+I/g4vPWsjOjgSYdiuWh8kU9bFeiqpQHMinXfbBoS?=
 =?us-ascii?Q?heAa3IZs10TClvsAPPUW84KlYKAUOhOTA7xIv3NLCYdwskUSZv6QPy4JdRc+?=
 =?us-ascii?Q?u/lzzquRxKFNfVm4/nyEBAVfsAc88waWFLXc3UCtgJ6Vreze+Kdq07hxjzZU?=
 =?us-ascii?Q?8LWQTUlhqtL4Qu1LPvizPuHcOYgRpg+W9B9+j4zUsGyfVXapjuWc0dmZ0Dyr?=
 =?us-ascii?Q?7fpLLsMLGOORpgbXzOoqwDfSA6gTA34=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3db7010-cb91-40f3-4755-08da53e1ab9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 23:56:34.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nt0D8F8wiDpq/bJoOnEkUETD5iOcYRFeD96r1TgtXT/4dkqZFYGaKR347PJ8eQM66s72cflgnCVGRf9j7Phusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_10:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210105
X-Proofpoint-GUID: 49wNhCOG5H4MhZkQsuD4KvT3K_VsaFs_
X-Proofpoint-ORIG-GUID: 49wNhCOG5H4MhZkQsuD4KvT3K_VsaFs_
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
Cc: Mina Almasry <almasrymina@google.com>, James Houghton <jthoughton@google.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baolin Wang <baolin.wang@linux.alibaba.com>

The HugeTLB address ranges are linearly scanned during fork, unmap and
remap operations, and the linear scan can skip to the end of range mapped
by the page table page if hitting a non-present entry, which can help
to speed linear scanning of the HugeTLB address ranges.

So hugetlb_mask_last_page() is introduced to help to update the address in
the loop of HugeTLB linear scanning with getting the last huge page mapped
by the associated page table page[1], when a non-present entry is encountered.

Considering ARM64 specific cont-pte/pmd size HugeTLB, this patch implemented
an ARM64 specific hugetlb_mask_last_page() to help this case.

[1] https://lore.kernel.org/linux-mm/20220527225849.284839-1-mike.kravetz@oracle.com/

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/hugetlbpage.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index e2a5ec9fdc0d..c9e076683e5d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -368,6 +368,26 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return NULL;
 }
 
+unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	unsigned long hp_size = huge_page_size(h);
+
+	switch (hp_size) {
+	case PUD_SIZE:
+		return PGDIR_SIZE - PUD_SIZE;
+	case CONT_PMD_SIZE:
+		return PUD_SIZE - CONT_PMD_SIZE;
+	case PMD_SIZE:
+		return PUD_SIZE - PMD_SIZE;
+	case CONT_PTE_SIZE:
+		return PMD_SIZE - CONT_PTE_SIZE;
+	default:
+		break;
+	}
+
+	return 0UL;
+}
+
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 {
 	size_t pagesize = 1UL << shift;
-- 
2.35.3

