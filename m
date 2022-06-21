Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B5553F4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSNlj1Y8Zz3dpr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 09:59:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=l9YIxHFO;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=c1Ok8Hto;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=l9YIxHFO;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=c1Ok8Hto;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSNjC6P4Rz3blR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 09:57:01 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LJ1TjA009747;
	Tue, 21 Jun 2022 23:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=H8vBK/cfd2DyRppzomYXVb7VYoZJawa6OPvFwFWS3TU=;
 b=l9YIxHFOTAcUYdaBCChirKaJxbci0AoMb3b6adeRx8c2cksZJOZ405ENMzHRLnXtd60l
 FhXTy4TbHew4Wch/jLpjenl09FbXNLIDGLyaCLI1/gDmLZ8bwsjxz8EuYk+oOMZImgWt
 j99PcFlMbQMVmQs6EWNb0gjfSoSyLf5f/7KP4lSd1t9cMbIVmNjSNk59NJehlmRWZ7F8
 0CiWx3zWKRU6KICXMuHhTX+uVX7CG7eVey0IDiDbLeAW57n5pAu4njhEkjQSM8XQbvU0
 Nufk4LkwivYUJ05PWte9C5qbx6++exL0FrRSowWlyA3f6m0g3TeGmQbZZirkD+h9Vu7e Tw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78txyk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:39 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LNoXqh013303;
	Tue, 21 Jun 2022 23:56:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gth8wwujv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ognY+BLxOmmvk8sUFG2/OMR0BoufWuoSSa7Amr8+2D+CjhI3Ts9e6/VkFXZtakyrGeRO6BSCjOmYfzeZmrjzlJ75U21yGVA+RQnxgxiQS9Idx/MxsgjlY5z/Q7nZY5Y8mJPlcPX+gkKocwtIYxpf/qW/228n1/juYdtV3tfhzD4kaghkD1hGUekIIyGeXuu3QDaEstUxCGf6VMPaWGdIUe5MfD85ek8ElC65CHlfwUt0cPn2e994Ru9IKYUYhlTXmXF3+ot/jxBRMw5bRGzAoS+jeI1XcC03fctiVP+OfFuu4HS7fc52H2HtiaiUO+rp9ZWCiCv6HGPO/+cD1DbUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8vBK/cfd2DyRppzomYXVb7VYoZJawa6OPvFwFWS3TU=;
 b=AZW8MCqlhlBsn8LQRTE2tWFkTBCrr/Szau/8la2VhFn56ai3pt4pbGurB2TltC4R6zwF2HLE5MkTiseQhbtLzl5Vr4NTyfkj+T9LrUhI384g9QDbd32ceyuLoHBH6yhKR6jMKesRefOuUSRsG6wCUqHtv9ErZ35YC4M4imtMalD8opE8ZtUaCHxdZNaXQs0HS4sNSUAHhcMWqv/4BGoxzBzAKz+nzd6bCvGYqsfGUu7itQEGe3VfHzYjwB2EMX3q35HZmTqxXYyrzT9oPd0kJcsgy1caa36DJFOYVKyn5ODeXPV+F7pfGs4/SFIU5vxdP43pf30YqWYTwknVT8U4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8vBK/cfd2DyRppzomYXVb7VYoZJawa6OPvFwFWS3TU=;
 b=c1Ok8HtoSQDESjkKLBCdf4hQVWcoVTxFblxp2MyWHrAt1uPRtrz8C5LsG8pGuvFITBg3FddVL5HthGxAXr1i2/P/Ff6ADIoDBN/MEBbJ3GvP00hiQNpbv7IbMsLiSIgAN7u7jlBYCD7T94MQpemkt0vcZVRilAMVS7bPTB/NeNc=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MWHPR10MB1501.namprd10.prod.outlook.com (2603:10b6:300:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 23:56:36 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 23:56:36 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] hugetlb: do not update address in huge_pmd_unshare
Date: Tue, 21 Jun 2022 16:56:19 -0700
Message-Id: <20220621235620.291305-4-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621235620.291305-1-mike.kravetz@oracle.com>
References: <20220621235620.291305-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:300:4b::30) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e24b1717-31a2-443b-7779-08da53e1ad3d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1501:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB1501C1DD459C71E72138913AE2B39@MWHPR10MB1501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jVoGeoikeK2VKH8UQgKT+OM9PjsZuNpHTTDnY6Fsz+y7FEYX6VxacfAklWvMdnTIf0iAau3sUnDOpLSCoshfRb3bxaUuDzVFRHduvgx0Y3CoYgdISPqJhvAarInFkRma879/zw01r9l390zpwNecZWHpcz3zgoxLj6QrUvppXFi72/fdULGZp41TU3u3UenONRk7CAvdXX/kL2NnmWZ8OnLI6B0ueSygtJu98QcpqGATT88Ar5nehw0oUyXZMNLSCs0PzSucWvhO/NVse074JiVNsXicFxE+CutcPSVqtyJQBDNIjeACtOsHjWU/3B6z7IoUBbQw2oY58+2tij6ntOL+lHUbSLiBKuDgvvFt9C2jpHw2xwd/nvlBYXxa+IbCOXsVY/6XAfQzo85My82YXWuAGs8f2E6vWDqEaxq5F0U/2IrZFsqIUPnOl0WOgBw/qEW5nPnMzSszoXZTtlFTAVVYWm2fSCPejTbqQyqCQZUZ3FmYG0Mvxv0niIYkoBidifdOqEowfLDsm/O6stBHcXIdmAnSzNbKkTymqgBX5UlKhHQLdGJZm29fMvD6hUFAj+gmr1BoNdStLQr7vRyDeOQj+jojV5ghERjsOzV9IM0de9Ced4EI22gR+YOrvMCFjrh3hJ7mdBhODmsswVnRJA6HCrdE+BoH0Z0F/XnoI1EUqEvQpsoJGxay2YzPHUP1dcw2CNY4XGQ7wu5xtc/jEw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(2906002)(86362001)(4326008)(6486002)(44832011)(6506007)(15650500001)(54906003)(921005)(8676002)(36756003)(66476007)(66556008)(26005)(6512007)(66946007)(186003)(6666004)(38100700002)(7416002)(316002)(478600001)(1076003)(8936002)(2616005)(41300700001)(107886003)(83380400001)(5660300002)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1tha8jc+RrUV8KbCGKGgMAp+WJzuNIz6hmNwzXxg5LjCY5HqpmgwSpufh+c5?=
 =?us-ascii?Q?zICrhv/uDuAzk5ZFQ6z38Y0WROrjS6UnJ01CsIDd8Hy/SM5Ab16Ct61m1zgO?=
 =?us-ascii?Q?6i9FSRSRDvwFwos4LYKKhYiT+2gZCv18MLALQP4Fb9qVfOq7B+TWxVh3TsoQ?=
 =?us-ascii?Q?w31g798bW4sUzRAgh2ayL6q0TIoqxBT/DOKfzha8iTy8QYO0GJUU96sY4V2X?=
 =?us-ascii?Q?0a9aSqr0WCNd2t+x3RICCw2eG9ximnoAr18hC7k9ob8zC9RwzDXbhVEYlm20?=
 =?us-ascii?Q?1WF1eXKNEF5lwK6wbVkNflp7Lle+g569FzwVEBSWCJx9e9bW886yD3IyozT6?=
 =?us-ascii?Q?bObUcmYO6tz/Bzs6GSgoBS4ep6Ec7wV/xVDOURrGcy0bUJW/x5V3FnE3h82q?=
 =?us-ascii?Q?PwOtz4cDjEqnw7lBh1fnXBOo+KmLc6SJf9YvvQqR3Y0cpf3VQYao8xy82wh6?=
 =?us-ascii?Q?Sor6HI12P4zgXWevlE8g3EkQWcK+jyNv2VacPYMLX9lOoqMlwBBz4Z0hR7Dk?=
 =?us-ascii?Q?7WYoFLCjbReK8RDx28yL1HZOg8rHzAHr0RPbw5lSPzG20KZH4v+In+sLNkra?=
 =?us-ascii?Q?W3Mo4a8AQLzsWTZ1PVXWXNqrpoCiuS9vY9Z18mfwia3JVfVF+I7G1FX4n2lx?=
 =?us-ascii?Q?XyA9NblS1s2sVqqeNuiAE6yi0Fgy0ECX9TfXp0xPiv5W067mcn5t+7DgIzxu?=
 =?us-ascii?Q?oPm23mL21lM044+OagQfxNCFxtvocqo8LJyDOwFfFRB3pjtqvp0+AfieCKAv?=
 =?us-ascii?Q?Nw5r0cvLA6+z9/21j93YAfj46hJTCw8nVV/iz80wxe0//8ZFlGrzuz9gUr0q?=
 =?us-ascii?Q?rcA6+YjLU1c8rajg7BUnNsV0zeoUbvsBB5uSODON7lJ3D9x3trwYIvxFFO7a?=
 =?us-ascii?Q?yVztaXBldIpKbs6BdBzEa1GluhSisVGlDW+o+bn6A7jTzaSL5YyO+k/38yR7?=
 =?us-ascii?Q?FLDRu9LILMK7rRIJLiGhaLqL56f4g3lOjJHLGR0pHu4m1IJgwlpj6gQw6miM?=
 =?us-ascii?Q?AAwIZVm0p3j0YzJJJPI+tQ4AQC7ii2jBiTKDiwnEWErUwMj7o4Oo0tpBv6HB?=
 =?us-ascii?Q?iTopvgCxqJv68rPnDNJRUsBHYSJMIIDTLr+NTUBqTh5oZsU4wd2oagO5IcCz?=
 =?us-ascii?Q?NAA0cte3hnWRoSSLu7iDTcZjkHIDbNcvGPA/k0qvHYgbPxuCwnyQrxS6NJd3?=
 =?us-ascii?Q?/d+TuslpsfOg0eXNhYNj9ddJp3PJphaHzU/Ql9HuOS0B7WL4qAODZt6MHdQv?=
 =?us-ascii?Q?ZycchcLjbNXh2Mm1pPJt9lj4EUFuUxQ+9rukZG/zNFYxQuA6Q0yk+TDsqoEp?=
 =?us-ascii?Q?QAC+UZ1b+lnYWfs0vven9904m2YJsdVjeE4K7/skv+at1iEdVEqMPjj/95AR?=
 =?us-ascii?Q?KjhyUTQxryuDIWk0Eu/LMZnF/0jwvdYv7NZjAd8hVANLropm/uLnIz0aUAot?=
 =?us-ascii?Q?ZGc8u0EJc/FO7hADv2enTxGuHbaAojMAJ4itn1RXP7ERffQ9M1w29FvyTOES?=
 =?us-ascii?Q?LzU4gXPCT+SpOgQl6/+wNEgINY0lGgdDrzK7/eHd6kWHiSpZUO/T2qNXMQut?=
 =?us-ascii?Q?VX532Uswi9IfW+s1AalOmV266y8hS2/SEPk029G7YSsPUdg0UNQLgOdfENVd?=
 =?us-ascii?Q?0LJLapmDKlzJHto8p6YkBjtPIbnCyy1rSE1hxSNhIcDg7Qcn5HG+bMIz5a0W?=
 =?us-ascii?Q?UrCoWAoflyz1hnTUj11XFvXzBcbgEq/3lowhCdzmyDqZiZH6EbNNFiz90yi4?=
 =?us-ascii?Q?4zykMJ+GfpEZXkn4bbsr3yr3SWKWUc4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24b1717-31a2-443b-7779-08da53e1ad3d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 23:56:36.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggK8pdO7VUGzi54icS8cjPuLhE/OPYoFu+WWw4h6k6C8QcEigc4yGMgtHGGlD/qwEKfoPDlpio2k2MFZ0Q1WOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_10:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210105
X-Proofpoint-GUID: b-YWIN4qsZl4phYCYBaRfSUkplTOj4iG
X-Proofpoint-ORIG-GUID: b-YWIN4qsZl4phYCYBaRfSUkplTOj4iG
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

As an optimization for loops sequentially processing hugetlb address
ranges, huge_pmd_unshare would update a passed address if it unshared a
pmd.  Updating a loop control variable outside the loop like this is
generally a bad idea.  These loops are now using hugetlb_mask_last_page
to optimize scanning when non-present ptes are discovered.  The same
can be done when huge_pmd_unshare returns 1 indicating a pmd was
unshared.

Remove address update from huge_pmd_unshare.  Change the passed argument
type and update all callers.  In loops sequentially processing addresses
use hugetlb_mask_last_page to update address if pmd is unshared.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 46 +++++++++++++++++------------------------
 mm/rmap.c               |  4 ++--
 3 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index e37465e830fe..ee9a28ef26ee 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -199,7 +199,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		       unsigned long addr, unsigned long sz);
 unsigned long hugetlb_mask_last_page(struct hstate *h);
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-				unsigned long *addr, pte_t *ptep);
+				unsigned long addr, pte_t *ptep);
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end);
 struct page *follow_huge_addr(struct mm_struct *mm, unsigned long address,
@@ -246,7 +246,7 @@ static inline struct address_space *hugetlb_page_mapping_lock_write(
 
 static inline int huge_pmd_unshare(struct mm_struct *mm,
 					struct vm_area_struct *vma,
-					unsigned long *addr, pte_t *ptep)
+					unsigned long addr, pte_t *ptep)
 {
 	return 0;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0e4877cea62e..2e4a92cebd9c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4945,7 +4945,6 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long old_end = old_addr + len;
 	unsigned long last_addr_mask;
-	unsigned long old_addr_copy;
 	pte_t *src_pte, *dst_pte;
 	struct mmu_notifier_range range;
 	bool shared_pmd = false;
@@ -4973,14 +4972,10 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 		if (huge_pte_none(huge_ptep_get(src_pte)))
 			continue;
 
-		/* old_addr arg to huge_pmd_unshare() is a pointer and so the
-		 * arg may be modified. Pass a copy instead to preserve the
-		 * value in old_addr.
-		 */
-		old_addr_copy = old_addr;
-
-		if (huge_pmd_unshare(mm, vma, &old_addr_copy, src_pte)) {
+		if (huge_pmd_unshare(mm, vma, old_addr, src_pte)) {
 			shared_pmd = true;
+			old_addr |= last_addr_mask;
+			new_addr |= last_addr_mask;
 			continue;
 		}
 
@@ -5045,10 +5040,11 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 		}
 
 		ptl = huge_pte_lock(h, mm, ptep);
-		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
+		if (huge_pmd_unshare(mm, vma, address, ptep)) {
 			spin_unlock(ptl);
 			tlb_flush_pmd_range(tlb, address & PUD_MASK, PUD_SIZE);
 			force_flush = true;
+			address |= last_addr_mask;
 			continue;
 		}
 
@@ -6343,7 +6339,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 			continue;
 		}
 		ptl = huge_pte_lock(h, mm, ptep);
-		if (huge_pmd_unshare(mm, vma, &address, ptep)) {
+		if (huge_pmd_unshare(mm, vma, address, ptep)) {
 			/*
 			 * When uffd-wp is enabled on the vma, unshare
 			 * shouldn't happen at all.  Warn about it if it
@@ -6353,6 +6349,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 			pages++;
 			spin_unlock(ptl);
 			shared_pmd = true;
+			address |= last_addr_mask;
 			continue;
 		}
 		pte = huge_ptep_get(ptep);
@@ -6776,11 +6773,11 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
  *	    0 the underlying pte page is not shared, or it is the last user
  */
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-					unsigned long *addr, pte_t *ptep)
+					unsigned long addr, pte_t *ptep)
 {
-	pgd_t *pgd = pgd_offset(mm, *addr);
-	p4d_t *p4d = p4d_offset(pgd, *addr);
-	pud_t *pud = pud_offset(p4d, *addr);
+	pgd_t *pgd = pgd_offset(mm, addr);
+	p4d_t *p4d = p4d_offset(pgd, addr);
+	pud_t *pud = pud_offset(p4d, addr);
 
 	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
 	BUG_ON(page_count(virt_to_page(ptep)) == 0);
@@ -6790,14 +6787,6 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 	pud_clear(pud);
 	put_page(virt_to_page(ptep));
 	mm_dec_nr_pmds(mm);
-	/*
-	 * This update of passed address optimizes loops sequentially
-	 * processing addresses in increments of huge page size (PMD_SIZE
-	 * in this case).  By clearing the pud, a PUD_SIZE area is unmapped.
-	 * Update address to the 'last page' in the cleared area so that
-	 * calling loop can move to first page past this area.
-	 */
-	*addr |= PUD_SIZE - PMD_SIZE;
 	return 1;
 }
 
@@ -6809,7 +6798,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 }
 
 int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
-				unsigned long *addr, pte_t *ptep)
+				unsigned long addr, pte_t *ptep)
 {
 	return 0;
 }
@@ -6916,6 +6905,12 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 /* See description above.  Architectures can provide their own version. */
 __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
 {
+	unsigned long hp_size = huge_page_size(h);
+
+#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
+	if (hp_size == PMD_SIZE)
+		return PUD_SIZE - PMD_SIZE;
+#endif
 	return 0UL;
 }
 
@@ -7142,14 +7137,11 @@ void hugetlb_unshare_all_pmds(struct vm_area_struct *vma)
 	mmu_notifier_invalidate_range_start(&range);
 	i_mmap_lock_write(vma->vm_file->f_mapping);
 	for (address = start; address < end; address += PUD_SIZE) {
-		unsigned long tmp = address;
-
 		ptep = huge_pte_offset(mm, address, sz);
 		if (!ptep)
 			continue;
 		ptl = huge_pte_lock(h, mm, ptep);
-		/* We don't want 'address' to be changed */
-		huge_pmd_unshare(mm, vma, &tmp, ptep);
+		huge_pmd_unshare(mm, vma, address, ptep);
 		spin_unlock(ptl);
 	}
 	flush_hugetlb_tlb_range(vma, start, end);
diff --git a/mm/rmap.c b/mm/rmap.c
index 04fac1af870b..1c22e5e1219a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1559,7 +1559,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
 
-				if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
 					flush_tlb_range(vma, range.start, range.end);
 					mmu_notifier_invalidate_range(mm, range.start,
 								      range.end);
@@ -1923,7 +1923,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
 
-				if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
 					flush_tlb_range(vma, range.start, range.end);
 					mmu_notifier_invalidate_range(mm, range.start,
 								      range.end);
-- 
2.35.3

