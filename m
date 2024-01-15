Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4D82DEC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:00:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SQASNvCD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDKgR1FY5z3ckk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:00:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SQASNvCD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDKfd0lZJz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 04:59:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R17Qka/rylLOUkUyaQp91yKUuZzVpS75yLHTMXO4PUgdrN/hW+I3udZhKCeUT+c4cHjFUi0nBjwWczHYPYAJw8BGvZmQ8bNBFNU0TJKscGfM3APnAe9myk1LQZPUgJ7mmNzfhY4l/w6F7mtYFjVZkDdpVa3uWiDfeelAQiusDJDUqBHAXiQcPOR8KjZzIGUrQDCqDwvXp35mTHjwRf7BkxBD3Ufg/gF1KwRc/hLkjhaKK3hG78qWQwS0dODXWo7eFLQ85w5mOifhOz6H8Kr4CTLAcLPbhVB9eH0fZV5eGc8GLoOMyItaQSAT7iyrluNG+/QFeTgavpwTlEDtiLkXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksLpePSBq6PmjKCW2M5ZXa1Htde2E50HKivahBQ1Bmc=;
 b=F9mCn5sBiyytU0XeS0+c/DemXWxlD56ffTOwVyBqroAHm+DxqbpvUenyA6O7SFm3zZhsupQ7GXK1Er+eMyyHMtt7Hf4KrTYO8U/GPBbBGSdhQxhdBUYPQWKDUvj1YD3MwjpY9kUyC7S3BSlfziVZBjwIC/karVRvp082WNmL99kYby4Mx13H5IOHa1RXv8DAVs/TFjxanHc400Jgs3xBdEuKLMSMqY6OFw3Vijt6yvGIPVmBUACfhnGFTDLb89/G8YN5I8NUBsePDUPxXnW1HMnZPbC9oR4q9ER5LYqHZ8pNYZQOmTnGY3xr95+6W46Hy8/mU4rooaThWQdC6FiExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksLpePSBq6PmjKCW2M5ZXa1Htde2E50HKivahBQ1Bmc=;
 b=SQASNvCDU09gG/AlbvBR+aLjw2e9TKnny4IW+2hSa9NsX6sRBisDU9r3Lm9M58v/F+eOeiJt0QOJkpF2xVW62cJW+q0rylGupFJ6V3677CAFRnzTEWh3JEECAy/4W5K8D2zuqhyxgPgp4XY4yvYZoesUoJUtof8sc3WGCF/u8N9Y9I4D+2AwSYe7m/FM+lzf2/9sz+qKNQurdOEzneCTkZzu8AaE5C/HL4XcI5IOEEe6xxEaV7Rcn45jFUdWgDnKVa5fq86nMdeFq6JgecdHpRNK+k+aXHRsaUi0ugcgg8CdJbqqCKIaNt21L7Fv2IQi88QAEPc/dkDoAQQVHVMwbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 17:59:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:59:30 +0000
Date: Mon, 15 Jan 2024 13:59:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 04/13] mm: Make HPAGE_PXD_* macros even if !THP
Message-ID: <20240115175929.GQ734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-5-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-5-peterx@redhat.com>
X-ClientProxiedBy: MN2PR15CA0063.namprd15.prod.outlook.com
 (2603:10b6:208:237::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: faaa8dad-fea4-4bb0-1971-08dc15f3b8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DcKa+wRpHTJ+inz0qDwjVN+ozM5Y75YTSNe9FudoYpRKLX/6M766n844UDiyw3QewU12+3k/d7QXkyLR19S++8ND+Bw3BPccDTBirU4J5bIBeo8ZZb08SeoynS8EgEnynDyTjaF0ybnHf+OEsXbs7L/x5H1zcm0/v7QhBKYv0w9HM/2SERVxbagGkKGyY1MBffTC6SDR7ceLCOKC2v6rWrOFUtat0Q6V0ElS33h4lpGMGIcqZ0+vngsB14DqyD0eNv9K8W4ixThRkLTUzouhkT1y1Z35CYIllJX29cXm7TGZEGlwmln72aO64WK0i2pJ4D/+c5GhiOKodNsYg5sHvqestCcY8sxMqsRy9NE92u4UxoUelniKizT/iNclT3jQi2u1deuRPiFMWH5s1R6O5CgvS8DFBYFJPCp6jBswA5Uim37IPHZVRFKBHptq+BlfQzEyAe+/1n5oo7SKwM6dcmK8fsobrFEWBRBOK20inDy6NbsfYyhzgwxfA84/BY0Szf7jfmSNAwMDZxhfi1tmViV82uL3OHVB1mbXQigiiTIE1Jz5N+1u9WOssaNaB7lBugpY+cWkJpT8rUwwJqHvfWSjzwv4HTXhVtkNsBMBbFS5L7Jv2RnG3OxKJmdBOiyY
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(2906002)(7416002)(4744005)(33656002)(6486002)(86362001)(2616005)(6506007)(83380400001)(1076003)(26005)(36756003)(478600001)(6512007)(316002)(4326008)(41300700001)(38100700002)(8936002)(8676002)(54906003)(66556008)(66946007)(6916009)(66476007)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VwBIHHNaxz8P3ZKJyy+BP3O/i3l15Ec+UPvMiMccJsW7okBHBJg4VXZEzUO2?=
 =?us-ascii?Q?q1//rhxv83SGO4CjpnrbAhpTpWrGWpV6OFQR7cYpu5iZPDyCjxCO4qNX5Srz?=
 =?us-ascii?Q?sdr7932rAEnvKtqXJT3YX8+574oPV+yah5CMwm+N17eTjGfVddiwCgs47JZf?=
 =?us-ascii?Q?tCYP1mWKKD/YxaW4Rg6Odmor0maLUYJMkJWD3bLytdPRxK5LZwfqgpy8K4bh?=
 =?us-ascii?Q?mSeZriVMCS0m/GO9GrepGs0YDQTnmXutpMSwj9Q4LroRfeqhGUbTkVMDAtU4?=
 =?us-ascii?Q?2pyb3spwKMeVgeirDTfW74VzjcvuY9aoRDL2xprFd6DFQTeojq02UDYMzFPN?=
 =?us-ascii?Q?qRCn2SgSRkBfRG4imRRt4A7m367Kve0NMebqZV3kt+Hy6FEclh4pk5U46b8U?=
 =?us-ascii?Q?4JmCvzs7TfXF4nlRCFDMs/g47f5Q+TNwFMUVnlfKQcwYDfQaetqOrbvfOY8Y?=
 =?us-ascii?Q?p7rydTsBQKNcqR8tJYpJ1S+kkKuWLgycWrZcbm5IK5bu7fief1siJ3lg1OAV?=
 =?us-ascii?Q?rR79BljsXmSpELhsrPRjUhM+JM7KOxBWVa67nAr4VGGScASJFFpTdwBfgLHp?=
 =?us-ascii?Q?U5aUYzYmugRcLTgEAQduKbR1XvNseKdjl/gk1I0dXWpsETZqlnX7KFo1PcSQ?=
 =?us-ascii?Q?G0nQCCuquOf8kNk+IupcaclH/Hev3wkJL4kKj6yMjDnv6BqtWCvPjt+1GHEv?=
 =?us-ascii?Q?059upiAHwIvg/Rko599l3b6mjJ5ivHH3Sr1B1fXOdgU2niwmoPDDMkG+PCWd?=
 =?us-ascii?Q?biNG+UDSVa9iTyon56oS192vFhBCjZ9wFNhHb/9oC7P48nhaCAT+d07MyN8R?=
 =?us-ascii?Q?2VwAuHal69goITBylee/G9jYgweD/QVOLW2Dg9MF/QAssZyKOptjxpFj1iEQ?=
 =?us-ascii?Q?ZleFABEHq+Rlv1NdHwjVmPqz3JDKOa3PMb8nFZo/9Lik3juBPanntDem6wGe?=
 =?us-ascii?Q?aWeaXoCiv0JPzjLkyAvYeYHqgtcjNUSdRbmSojnqeEwifskhPt/6ZBgDUwZo?=
 =?us-ascii?Q?+31clwO8uZlVLkGRvnb/EztWweHo8h0Vb2nVQiUkVSByjmdjv+u9ftVFQgTI?=
 =?us-ascii?Q?w+vHKPR9mwMaQxj1Wwhq1DTFxMNar0lyMPjrNxoGAcGCRtb2UnoI3U7j/cO7?=
 =?us-ascii?Q?wS9FhCADISJ8cI8KCt36z89Ud72flA89uYdnE435jpWHGPzG/Tw+QFEKFQnT?=
 =?us-ascii?Q?Km96TX0j4mhOHfRAlYQanyp6hrAnWj/kEpric/y5Z6M0HHEY3ppvGj6pfM86?=
 =?us-ascii?Q?mmwU94q39fTiDy8f+HkUs7GxUNSpuXrc6c0on2L1RKjmSVWAsshOmKGNNrZ8?=
 =?us-ascii?Q?GpNbz6fVXJbTeHfNcZibNrUtZd9rYJCwoVv/iJxKz6/G6oNUm41tPF5b4s+2?=
 =?us-ascii?Q?W217ajxEFfa2lfh0xAPPewE8ewQtTNkapHFbCkgBDgVAYvm+2sRExO2tGdFt?=
 =?us-ascii?Q?xTmRP8Gu6O4wa/gMFOElCPsAdgfHik1HtctJazm38BiO25Tt4hCoeDU3MT1d?=
 =?us-ascii?Q?GrvYdcxnxVUqRxuRxPSsZ+4bLkyOBFw7V05T3/tASy7oB2ohtzs6pWnjGaTE?=
 =?us-ascii?Q?CVtFOmUDXhZsEJfPEuOapDj/Qzq5JaU+zZEu2qYA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faaa8dad-fea4-4bb0-1971-08dc15f3b8d4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:59:30.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0xMPm6PzUQr0909ReNgMfD5+dpRNn55evNuKhFVlyrndL5W/LNmjry1oiBsmkdw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:14PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These macros can be helpful when we plan to merge hugetlb code into generic
> code.  Move them out and define them even if !THP.
> 
> We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> Reorganize these macros.
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/huge_mm.h | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
