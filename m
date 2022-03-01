Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4594C92EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 19:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7QZ30ygQz3brv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 05:21:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xt7vB76B;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xDglO4tW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=xt7vB76B; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=xDglO4tW; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7QYG4NZxz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 05:20:58 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221GibBC021769; 
 Tue, 1 Mar 2022 18:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=uolvxQacXYmhg6H3oD0H5MVWhM/QphFrFeGOHREHM6k=;
 b=xt7vB76B1jEYqBcWNxIQQ4P9qzlf8BEunkxJ0fLEEPaSz2GzMKYukPUvMBfXI3ojVWsl
 lOL+Thi951bPUYwk6m9qcV4CHGuLip9WwL5L58eozoxuOXM18y9A/zWA3LI0fHjTovWI
 gZgYxH6RvBGo7qrC/dUpLXuydn0HnugZTz2trCH/MzOPmcE7cNfrTOruFizMG1vh2QBD
 VgvPK9SRD9s7p4TESSQ4S0gX+o1/cxEROfAwZJpgkroH9+lRyLkQbZZ+kMtgv8LN1Zn6
 vhChsxWRfg2NzTFWxQi+zNuCNFPg+9fqqfilEtL6nC2YgMV3289FOj/9/dEgYSr30kWb BA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehdaysxfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 18:20:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 221I1JQc108032;
 Tue, 1 Mar 2022 18:20:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3efa8ehhee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 18:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTEkQ3+VW0KrT7/MofZKpdMQUN7WPAk3KY0OKVReLptjXfFUjz4TuQPnLxJVvDyHU1vzmfsejbdWUWz8yDRg5Aau4gwceJBdr4x2Hb2AAUtJmfA7eeLHnH5HWvIoaWir+GQKlWo3QAz+X6hQP+T3090iV94KG0gKdLnb91kUaS+iP+XP92LyWc1BnDmOBAbZo/0FmyxtMOD+Buk2jKrsTEB08+1medsg82zY3m+r4SrTYRJpth/OCjchimLOS7VXsMqmbXBo5R2qO+jHpCrVpQZ3ZGXotDuCdl6ZXMEqvX8BRRvwHyOZtgbQT6m7gBE/Ox180bqdSNEJPj2qPF0nyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uolvxQacXYmhg6H3oD0H5MVWhM/QphFrFeGOHREHM6k=;
 b=ABUYj9cyWP8PCp2htP2NAZDrB/GO3uGXY6dKkHOdbPsf2gK99sCcHHyLLCkve+HYysqKYNyLXXlQo3bKdGNzN5nEcp40VIAR+KK1dPClJhay9/gqacJ7WwQgmGLNh0ulo1aoKzGirOmpJYYiFg8TKvYshXPQSH+lXlKp/zHJ5zgfjybFpm5rdtm+Fg5SoaI4Va30VtCH07mQQlrmWo6+WYNkJBWS5fIiI7pCnT6eWip0I8Q+nTR6C0dDI9t64JVkjY50PO+KDa6B8jtUwaftHqLhtC+JTVCxXot7f3PRu1bHkJ+d9GtFF+FVrNuMPvd5xl+eyXgeYMOU2jqALFCuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uolvxQacXYmhg6H3oD0H5MVWhM/QphFrFeGOHREHM6k=;
 b=xDglO4tWOiUv9F1nbCfdc6cvuc1CJyDdCfLuhlBPhDzmv0RN6mggAgilvV4rXkjUKJ23vXFuxdwvaltsD9xaBkjbqw1OytzEN8W4o5SDe+MxtYofbojHgB4cgVvTfMQO+gJdygPTkeWeMjktRvL3FAETDPhX5jjMjQksbWnJ90A=
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BN6PR1001MB2145.namprd10.prod.outlook.com (2603:10b6:405:2d::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 18:20:27 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::d06b:5108:1d72:ac6c]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::d06b:5108:1d72:ac6c%5]) with mapi id 15.20.5038.014; Tue, 1 Mar 2022
 18:20:27 +0000
Date: Tue, 1 Mar 2022 13:20:22 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
Message-ID: <Yh5j5q5n/GyU0/1n@0xbeefdead.lan>
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-8-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227143055.335596-8-hch@lst.de>
X-ClientProxiedBy: BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::14) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9d924ff-f2f5-4ebb-efcb-08d9fbb028f3
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2145:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2145D7E888BCDD1AEB014F7589029@BN6PR1001MB2145.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFIez9K45UjxTdw10wtEbimJWr0rXFnLt/ECe7AxJSP92ZPCU9waRxNp6elQ2PCYJoAsEfhB/13zdpEYlo2kBmMY+ayIpbILRGF9jPuxTIon18MBm++qRVF7+7tni/ODB6zkJ6FlplNyEZnV4zacMhBjUOy93eobCEyehC0I76yzDqN5JbF6pEd5fpoScOWKYF2jSeo8ztRRL8peOiuCg2NMc5KddwxhBKp556AzjYzN+F9JZBSxn7D1Vjb9f6Qn64gr+Mo9s1IQS6xLdeS5Fk7GE7gJUp5cov+l0bAHwaqSLkGKw96ceoOPYT4Ws25RMr5pW87W0fXB9CvXhulFHD9DAHH0KYNFFHCd0q0l+D+Z0/rKuWOWUPMFeBSn1fsa2Uno9yBFNyr3Q0l2mlYcg6CeDo+9RveoVWfMrO3tZKYDhi1S1WOh4E6litI9IKN3jmBwF17hdTkHhPg+iFGOX8Cilmy7sFT3anFMZRR1rjVOU/agfYWqxwd+rVxQsp0vJWwp0EgNr/z7KcyywH+xwJbjdZFIw5ybYRJPC+wl0DEiEI+pRANk5HQ8QVnTTAGxFdI8L5BmBflmIaP0da0UmaQADrN9EGNSn++zejCfFH/YprZmqBZl41psnTxKCUHR+KoIqY/Qbh4pQKMTeSONCtlXkg1rVdgL9zFuUOIfJvKEGpgHFAvbmmuNM+AmnBfn9OLE0gKq6kRQ3GOTurBCjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6512007)(508600001)(7416002)(9686003)(8936002)(5660300002)(186003)(83380400001)(6486002)(4744005)(52116002)(86362001)(6916009)(54906003)(66946007)(2906002)(6506007)(38350700002)(316002)(6666004)(36756003)(66556008)(66476007)(38100700002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7srtht3IKXb5mVU5m92ELUiYvGhBogF9JhMOfxwcCeBRFJHpeXs1zxPP9qt?=
 =?us-ascii?Q?AKL2LY9LVzBPhHu5V0T3WBj7Gay/MwLcXS2CAup+h2z4iR78ovr89+Dnm2Ld?=
 =?us-ascii?Q?UrUnj//6W3vo3QZODXSxJEtSpSiFj3SX9iKeZ2Exe2TfCDONWUjIMHQdUbSC?=
 =?us-ascii?Q?dPEMc7YiNoEZVAPrhazsupT/Mgkg9vNIZ4GkTTdt9st8obEOslwesXRwp7v+?=
 =?us-ascii?Q?Ae51MH9W767t9gcwRGjn26j9l53B0nLzZSNWdlssi6h5fxLbLiOxaB3frNfV?=
 =?us-ascii?Q?gI4rCv/p9VnifZ8HUkY5KJnEMSTvxKkCcXmlyTgFnOwcWg8i4I7Ltn5cSSks?=
 =?us-ascii?Q?UqFdUyUuQCF0z899mJzCuyF0AhB0iuChSaHyhxA8uJ2i7N7Tohqzu5zyqKpu?=
 =?us-ascii?Q?wkXzeu3MVB/q6xJqeg/UQq7G/5cedUN8Ul0FHKPeMYF3xSYo7QDheyaKbziU?=
 =?us-ascii?Q?Kg+2Yy2lnS5q7XKEbwoMQ7XfuN6yl24DijBSte6N5zJZ+BM9x7M4VEZBGhT4?=
 =?us-ascii?Q?UgJxbfnN+gW9kXlGXsOsEclVWmaimxjCsYrf96AqHDMGsIdqziU4LjNREDSQ?=
 =?us-ascii?Q?bDdGNMAJEY43lVSR2Go7P/p6vGcp4C5DKkTA/2Y51VdiTTueU3ig7AjXqGIK?=
 =?us-ascii?Q?V7xIDgg8eG9+ZClcis4Y+e36nBwNKqaattKL+GuEGvh1lOfRmg9b8hQwzeGS?=
 =?us-ascii?Q?UEJaQGUVW3gLBIsBQeBZoTVo0MnHXYMI6uVak39zNk0OVDNoP8MeM8uWX0sj?=
 =?us-ascii?Q?XBot+wVPWI6rE7d9MupXZI/FJKnPl38Z/mZpZrpB3FVHafMujOO7mCHZwO31?=
 =?us-ascii?Q?oOi3uegaXOeuvbNSc1vyxfFz0zL9k+WLv+qpZPme6mv9/mmDa/MsEkSQe9xs?=
 =?us-ascii?Q?wY26xnM5bKngOZ8YI8rYEHlKKR9etqCD7z+CMGbT4HOeefIY3ZuBu+4mkJvq?=
 =?us-ascii?Q?PoGymggFXNwaQzw7SGMhF9y/vmP/niCoftXhnsrxJXlSObDM0UgtWeLjXGGu?=
 =?us-ascii?Q?TxrqsnQRDWeifT/rwDUSR/daQgUfAbr9Jswki7o1NwLWjqTdUJUrz7fWudH5?=
 =?us-ascii?Q?ySYhZzJHVemfam4PwUMoR9wShPO5kxTCsjKl++PjVuyvlFccMOqyRb9Tpw28?=
 =?us-ascii?Q?JNbn/S1EidVmIVwnCNL1pwhoTpJ8Z1pKWXL1eG4FqCxghELuZogZL0KYtZj1?=
 =?us-ascii?Q?iZVzjNOBHGQpu6gcJPHNU6zPpOIB/UgA4bdWOcCcw7XjJMY85rAHJPRQjx3p?=
 =?us-ascii?Q?5DqKB1hOPvpeA49iESkLGGENz8Tm9fLZdC4lTfSvFp5qVZUKNdzROzZXbn3h?=
 =?us-ascii?Q?Sy24x3GYe5tXWTevh4dE1aL705aMggtxKCE6/kc839b/Q9srD3JI8m3z/Shs?=
 =?us-ascii?Q?H6f7P6hW8ImEvjOmxujqZ/aRcRYNLKZbBwZkUxjvguifoUoAJlcCWbVaodNG?=
 =?us-ascii?Q?fxyoJW+TFkNCs8BUaNnrKU4fFtQLCjG0qDJMC4EEj7L0EZ6pkd3f5b3Gl6/T?=
 =?us-ascii?Q?cZStqh8Gq5+ulKQSfHPFv9NK174GYE9vwRZoAMsFPs8Xo6Xgd9YIMAf66dOu?=
 =?us-ascii?Q?WGD6hHk/QMzfp01L9PiSN9oLXkFb6ujEJMAQyIlIgdhMMrtz/DYf8TCl7LFH?=
 =?us-ascii?Q?EWCj8xCGlCXK2x9JCfEVl3A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d924ff-f2f5-4ebb-efcb-08d9fbb028f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 18:20:27.1245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHKZJHL5Fd9+ay+RKT4Mc3Poar9CEw1upWk5crVmkMULgkWOMgZ3NUaCBjzcs/Yl3WKLXUK8gxejnIBgqEkSDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2145
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10273
 signatures=685966
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010092
X-Proofpoint-GUID: Wj3Br-e4L6ngZnnKtFr824BC2zi0-dGS
X-Proofpoint-ORIG-GUID: Wj3Br-e4L6ngZnnKtFr824BC2zi0-dGS
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -#include <asm/swiotlb.h>
> -
> -/*
> - * History lesson:
> - * The execution chain of IOMMUs in 2.6.36 looks as so:
> - *
> - *            [xen-swiotlb]
> - *                 |
> - *         +----[swiotlb *]--+
> - *        /         |         \
> - *       /          |          \
> - *    [GART]     [Calgary]  [Intel VT-d]
> - *     /
> - *    /
> - * [AMD-Vi]

.. snip..
> - *
>  void __init pci_iommu_alloc(void)
>  {
> -	struct iommu_table_entry *p;
> -
> -	sort_iommu_table(__iommu_table, __iommu_table_end);
> -	check_iommu_entries(__iommu_table, __iommu_table_end);
> -
> -	for (p = __iommu_table; p < __iommu_table_end; p++) {
> -		if (p && p->detect && p->detect() > 0) {
> -			p->flags |= IOMMU_DETECTED;
> -			if (p->early_init)
> -				p->early_init();
> -			if (p->flags & IOMMU_FINISH_IF_DETECTED)
> -				break;
> -		}
> +	if (xen_pv_domain()) {
> +		pci_xen_swiotlb_init();
> +		return;
>  	}
> +	pci_swiotlb_detect_4gb();

I think you also need to check for IBM Calgary?

> +	gart_iommu_hole_init();
> +	amd_iommu_detect();
> +	detect_intel_iommu();
> +	if (x86_swiotlb_enable)
> +		swiotlb_init(0);
