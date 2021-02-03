Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2E30E7E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:53:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJQw3k5vzDwsK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:53:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=pnoIjQjR; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=SuQhKsBZ; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ7Q02dYzDwpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:39:45 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N9lJ4053674;
 Wed, 3 Feb 2021 23:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ufcarBGag7Sjp5Mq5hX2uNHVicBXg/LdEy+UArhzb+Q=;
 b=pnoIjQjRAimCOZGBFABR649EZDLrKxG6Rg+Koe7dVE64t/PjnvnPZt/5g7CWcLP5cu52
 P6eBa7EAlCqK/BoeTW6vxGAfUKSPLS3hYYUXkTTMlMMLrZJQygd0WggDf/bNlyJP8Ach
 upL7IU+DgF9INdgJ9Jy5KwJ94emFs97z0p49t0KEbZLYH0NU/Sb0NQHW/ppSJ3yG26o3
 UeDWaKBcm9re+ww+zpHOsdb45vWIIZeVvU1aF7NtPhh3qxt8DftSnQAzVNbztT7vRnVD
 YMckMHkzfZaqs8LhaE/YbExCu0PPhS2LoJDTbRxu8k6i93v+Qr81JeiCNCaVBw2IXiJY gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36cvyb2weg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:38:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NBZjm083373;
 Wed, 3 Feb 2021 23:38:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3030.oracle.com with ESMTP id 36dh1rp0ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:38:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmNqAIq6lFOC9ainynSrQWiPZxnortBSHQvRtJoXz7LQpCjd3M+ye/KymfgLmc4EJeh2XCmLTv7sCAmczKH9xO6EESx5QQPcX+Pi7PAwsZHkIVs9jytyNBNZzT7htfvXU2mXGVhPDPF8lK3ulnVkvhUwo1A5ir4EXEtkyels3vUl6KvXxEcvwIm2MDJFYwcUTqh/UucspnoQEOV8WVWhuFYFSq2XCUiFEB4+Ab3cFD3LxCQ4ykD/RpE+H12AZCxjEr7u/lzXFuPUI8Zv0e3N5tAI592Tt8HieDU7Kvn4pctbe3RetR/iBRoUwm+WRjHjjpFa08O/i2TIZv7u00nzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufcarBGag7Sjp5Mq5hX2uNHVicBXg/LdEy+UArhzb+Q=;
 b=A0ZPOADVVWV+Uj0/W8XGR394r9l5spc0nvzBnJvU0/rTEDb6RY8kZCTqRuBygUm03fprvI9YUgzPZSqNagCDc+RUmdqhN5fGnTrQjiBIWvB/iSZEi9cZNa0Wo+8mJ0cCs/gG2FQ7dICg5b0HcPS/TXK+Oul2GPKEgXO+M9AgitIDNtj+krmSsZ/d16skFak7nXurOhCJV2OykyOc5O43pjwcbIGL0mGuIPyxH7Fh3saJ2ELcsTlsC9i+mJQF5CBt5B9t9dRRTbxRDywZI2QkUHhz2fNRvEnMnX7d3RBnwoXQjwgTdZ4+zhrHBk6KPPfcFnXVslNmWK5xJfg/uCzk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufcarBGag7Sjp5Mq5hX2uNHVicBXg/LdEy+UArhzb+Q=;
 b=SuQhKsBZuPC3v2+9NTZ3wq0i3I8MSiWjwvz1ZyiiwHaXki6ngpjRZXZixVoFMMxGo7dPX/PYBT1Mt+IFEMuaxqcskcFwb4xhYy3KAWa+xsYaoLVcsDiiDtHDgTrC9Xu95xQBHdW8C8/ibsPNos9Abpi3nPaCoF7GwaiyZTzlIDU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:38:05 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:38:05 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
Date: Wed,  3 Feb 2021 15:37:08 -0800
Message-Id: <20210203233709.19819-6-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203233709.19819-1-dongli.zhang@oracle.com>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: CH0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:b0::13) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 CH0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:b0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55a79f1c-f122-4636-8dd4-08d8c89cc12c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47849DB7651ADA2BD0D3E36EF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w77riGtFxYZxbwSzlnLDDwaRSpIhQOZiCo7C6NAvJRIvk6fyvrnj5N07AptsCQM8Ls9ytt1iCLVQDJZYrEFBvlTjOhbcE9YJtxeD1SD4ad6x9UmE3mT0P2uDXh8kPTr3JlWDod/q2PNM7LqKgCTowQDE8jXR2bOUVt4ix3LvHciJZ4Xcq7H2GXDhKzdwXTKGu5Mgc/3Qev9FMhOZQ9g17mKuf9xfaYHfo6Dx/rzxrLP/DVQdxytqGBIVhk2jo8iq4rZtbHv6iYSfNqY00vHZ5r8pP9r/N/sEP6WDw/6JBKAm61IGhvf3fQ4beQAIaqw1aErcezXYVibpPmEofuXM6cDBnRgIULXs8zoronpTqW1+mLoTnkuCPvTmeSFbnUNJrCY5zMjfLQ0N8HxWz9APVN7Nik94Ev2ddkvwXkbddkqR7lfedjlniJnS/LArFITW5iqTd/xi5Rd/D2U5fDK3tMSSEh3gesvmGePlvsfgi7IXv3dlgzrdtausINCULlW0JpnJJvTOLkHQAU9XC0cmLmrBmfA2STeUzp5HCTZj+w5DWGhq4YRjzIAX8fbqqj3pDjD9QI5Ij9O9xtbwOV6yI4oi1pFIVamN9ei02syvNXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JOaqLB/L6hqA4VUE0kNmiLvAjzCeznvsu3Cr6DfHJWdEzSttbELTyL58Z9LL?=
 =?us-ascii?Q?ahqD02oPjGOF/MLn+QNete/4x2BQJuL4BmpjZaT5x3TRnVBy3Wlh9xgE8fsV?=
 =?us-ascii?Q?VVNkDHHxkITVzis4PdWG8B7PXb6R3xPxM0QnENF0AWmWS0HLV//9XazhbpcK?=
 =?us-ascii?Q?XmpD7trzVCKsUv/WpjcjAGMVXKneA5Yx9kIDfqSh2UhvuP/rH/n+QP8S4tap?=
 =?us-ascii?Q?ug1ebPrVG9itaWj+Eo7WgCgjWKxoSAvVt+KOeHIWfRLUqo/YZv/PNnGFKZ+y?=
 =?us-ascii?Q?NRYwucUzawHwv9EQHRyZFuai97VEQVwIwWJ2DLh++ktFL0aowH4Gvmdd8Z90?=
 =?us-ascii?Q?ZfR5Q7VdIg8DkVImvEfkossqIUJsaLEFQDuZd8Nz+NKlaD0i9iv7xZ94+Hj9?=
 =?us-ascii?Q?Ief7D+OF+3JggwgSKfljSwLBJL/KWwEDLU2o0d4d7quP9dsYji4Rn3zSQXCX?=
 =?us-ascii?Q?YHnRjGhSYQlYYS/8C26DWtMF625wdFu5CBgdLqNzwb+3zPvxYRevw5JfCUgW?=
 =?us-ascii?Q?WFrWq3wn6Q7MAEKly0t06OpKuQ0D+oCxW4p+ne5TOvvdBZtPbsP4j2KQc6L4?=
 =?us-ascii?Q?pTDqTV9cebXeNKgw6DSqPvEugv2EDgIyLGfD9/zqWV/bhTwdKCyRNx9bhc2E?=
 =?us-ascii?Q?1OTjvA+ijbnKDcbZyG8qz24UhYVmZ3I9zq5gwD9KSfRvOIYTra0O5OBpz0j4?=
 =?us-ascii?Q?UQmsYodAQ6aGaxH1t8bAK5xJpBz5YosKCtXuFLJ3woygzLUCpZP18fLGTX0k?=
 =?us-ascii?Q?Z5i4YGVXoEOHmO6CegU0vYFLYpo8Q7bhGQZZkC/3xIO/eJ3swYnN35uaLnrh?=
 =?us-ascii?Q?LkALh+TdMNC8nTUvCIKwfWipsx0goweO3wb6MA7OD16mRv9YAvLKVcGdEWhn?=
 =?us-ascii?Q?29dEIbdkSRoPkfangpUGDOiCXyr1ikK8v7DWDY+Fqy6sP0ws4RBvDBzPZAdK?=
 =?us-ascii?Q?5pnYA67j39+xPNsLLKTIWA534gYGFUyyumFunSj+nTgjPmhYRHfKLKuwGfQW?=
 =?us-ascii?Q?CFj1qI/H08Qh4n7CyGJB+7XEsrHq52oARzMGKYALm/GGwT1TOFAH/QKk8Ixg?=
 =?us-ascii?Q?czp2pmvr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a79f1c-f122-4636-8dd4-08d8c89cc12c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:38:05.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUSQZrsRsfIIenrB0i+mXbNWLbyi4KAfiByVhFlKYSye86P0YY8sKEgjzQs4qhhWqfZ1mhwlltkYXlrN55IWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030143
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030143
X-Mailman-Approved-At: Thu, 04 Feb 2021 10:42:50 +1100
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 adrian.hunter@intel.com, paulus@samba.org, hpa@zytor.com, mingo@kernel.org,
 m.szyprowski@samsung.com, sstabellini@kernel.org, joe.jin@oracle.com,
 hch@lst.de, peterz@infradead.org, mingo@redhat.com, matthew.auld@intel.com,
 bskeggs@redhat.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 jani.nikula@linux.intel.com, bp@alien8.de, rodrigo.vivi@intel.com,
 bhelgaas@google.com, boris.ostrovsky@oracle.com, chris@chris-wilson.co.uk,
 jgross@suse.com, tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, robin.murphy@arm.com, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch converts several xen-swiotlb related variables to arrays, in
order to maintain stat/status for different swiotlb buffers. Here are
variables involved:

- xen_io_tlb_start and xen_io_tlb_end
- xen_io_tlb_nslabs
- MAX_DMA_BITS

There is no functional change and this is to prepare to enable 64-bit
xen-swiotlb.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 75 +++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 662638093542..e18cae693cdc 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -39,15 +39,17 @@
 #include <asm/xen/page-coherent.h>
 
 #include <trace/events/swiotlb.h>
-#define MAX_DMA_BITS 32
 /*
  * Used to do a quick range check in swiotlb_tbl_unmap_single and
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
  * API.
  */
 
-static char *xen_io_tlb_start, *xen_io_tlb_end;
-static unsigned long xen_io_tlb_nslabs;
+static char *xen_io_tlb_start[SWIOTLB_MAX], *xen_io_tlb_end[SWIOTLB_MAX];
+static unsigned long xen_io_tlb_nslabs[SWIOTLB_MAX];
+
+static int max_dma_bits[] = {32, 64};
+
 /*
  * Quick lookup value of the bus address of the IOTLB.
  */
@@ -112,8 +114,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
 	if (pfn_valid(PFN_DOWN(paddr))) {
-		return paddr >= virt_to_phys(xen_io_tlb_start) &&
-		       paddr < virt_to_phys(xen_io_tlb_end);
+		return paddr >= virt_to_phys(xen_io_tlb_start[SWIOTLB_LO]) &&
+		       paddr < virt_to_phys(xen_io_tlb_end[SWIOTLB_LO]);
 	}
 	return 0;
 }
@@ -137,7 +139,7 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 				p + (i << IO_TLB_SHIFT),
 				get_order(slabs << IO_TLB_SHIFT),
 				dma_bits, &dma_handle);
-		} while (rc && dma_bits++ < MAX_DMA_BITS);
+		} while (rc && dma_bits++ < max_dma_bits[SWIOTLB_LO]);
 		if (rc)
 			return rc;
 
@@ -148,12 +150,13 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 static unsigned long xen_set_nslabs(unsigned long nr_tbl)
 {
 	if (!nr_tbl) {
-		xen_io_tlb_nslabs = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
-		xen_io_tlb_nslabs = ALIGN(xen_io_tlb_nslabs, IO_TLB_SEGSIZE);
+		xen_io_tlb_nslabs[SWIOTLB_LO] = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
+		xen_io_tlb_nslabs[SWIOTLB_LO] = ALIGN(xen_io_tlb_nslabs[SWIOTLB_LO],
+						      IO_TLB_SEGSIZE);
 	} else
-		xen_io_tlb_nslabs = nr_tbl;
+		xen_io_tlb_nslabs[SWIOTLB_LO] = nr_tbl;
 
-	return xen_io_tlb_nslabs << IO_TLB_SHIFT;
+	return xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 }
 
 enum xen_swiotlb_err {
@@ -184,16 +187,16 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
 	unsigned int repeat = 3;
 
-	xen_io_tlb_nslabs = swiotlb_nr_tbl(SWIOTLB_LO);
+	xen_io_tlb_nslabs[SWIOTLB_LO] = swiotlb_nr_tbl(SWIOTLB_LO);
 retry:
-	bytes = xen_set_nslabs(xen_io_tlb_nslabs);
-	order = get_order(xen_io_tlb_nslabs << IO_TLB_SHIFT);
+	bytes = xen_set_nslabs(xen_io_tlb_nslabs[SWIOTLB_LO]);
+	order = get_order(xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
 
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
 	if (io_tlb_start[SWIOTLB_LO] != 0) {
-		xen_io_tlb_start = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
+		xen_io_tlb_start[SWIOTLB_LO] = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
 		goto end;
 	}
 
@@ -201,76 +204,78 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	 * Get IO TLB memory from any location.
 	 */
 	if (early) {
-		xen_io_tlb_start = memblock_alloc(PAGE_ALIGN(bytes),
+		xen_io_tlb_start[SWIOTLB_LO] = memblock_alloc(PAGE_ALIGN(bytes),
 						  PAGE_SIZE);
-		if (!xen_io_tlb_start)
+		if (!xen_io_tlb_start[SWIOTLB_LO])
 			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 			      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
 	} else {
 #define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
 		while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-			xen_io_tlb_start = (void *)xen_get_swiotlb_free_pages(order);
-			if (xen_io_tlb_start)
+			xen_io_tlb_start[SWIOTLB_LO] = (void *)xen_get_swiotlb_free_pages(order);
+			if (xen_io_tlb_start[SWIOTLB_LO])
 				break;
 			order--;
 		}
 		if (order != get_order(bytes)) {
 			pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
 				(PAGE_SIZE << order) >> 20);
-			xen_io_tlb_nslabs = SLABS_PER_PAGE << order;
-			bytes = xen_io_tlb_nslabs << IO_TLB_SHIFT;
+			xen_io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
+			bytes = xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 		}
 	}
-	if (!xen_io_tlb_start) {
+	if (!xen_io_tlb_start[SWIOTLB_LO]) {
 		m_ret = XEN_SWIOTLB_ENOMEM;
 		goto error;
 	}
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(xen_io_tlb_start,
+	rc = xen_swiotlb_fixup(xen_io_tlb_start[SWIOTLB_LO],
 			       bytes,
-			       xen_io_tlb_nslabs);
+			       xen_io_tlb_nslabs[SWIOTLB_LO]);
 	if (rc) {
 		if (early)
-			memblock_free(__pa(xen_io_tlb_start),
+			memblock_free(__pa(xen_io_tlb_start[SWIOTLB_LO]),
 				      PAGE_ALIGN(bytes));
 		else {
-			free_pages((unsigned long)xen_io_tlb_start, order);
-			xen_io_tlb_start = NULL;
+			free_pages((unsigned long)xen_io_tlb_start[SWIOTLB_LO], order);
+			xen_io_tlb_start[SWIOTLB_LO] = NULL;
 		}
 		m_ret = XEN_SWIOTLB_EFIXUP;
 		goto error;
 	}
 	if (early) {
-		if (swiotlb_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs,
+		if (swiotlb_init_with_tbl(xen_io_tlb_start[SWIOTLB_LO],
+					  xen_io_tlb_nslabs[SWIOTLB_LO],
 					  SWIOTLB_LO, verbose))
 			panic("Cannot allocate SWIOTLB buffer");
 		rc = 0;
 	} else
-		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start,
-						xen_io_tlb_nslabs, SWIOTLB_LO);
+		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start[SWIOTLB_LO],
+						xen_io_tlb_nslabs[SWIOTLB_LO],
+						SWIOTLB_LO);
 
 end:
-	xen_io_tlb_end = xen_io_tlb_start + bytes;
+	xen_io_tlb_end[SWIOTLB_LO] = xen_io_tlb_start[SWIOTLB_LO] + bytes;
 	if (!rc)
 		swiotlb_set_max_segment(PAGE_SIZE, SWIOTLB_LO);
 
 	return rc;
 error:
 	if (repeat--) {
-		xen_io_tlb_nslabs = max(1024UL, /* Min is 2MB */
-					(xen_io_tlb_nslabs >> 1));
+		xen_io_tlb_nslabs[SWIOTLB_LO] = max(1024UL, /* Min is 2MB */
+					(xen_io_tlb_nslabs[SWIOTLB_LO] >> 1));
 		pr_info("Lowering to %luMB\n",
-			(xen_io_tlb_nslabs << IO_TLB_SHIFT) >> 20);
+			(xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT) >> 20);
 		goto retry;
 	}
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
 	if (early)
 		panic("%s (rc:%d)", xen_swiotlb_error(m_ret), rc);
 	else
-		free_pages((unsigned long)xen_io_tlb_start, order);
+		free_pages((unsigned long)xen_io_tlb_start[SWIOTLB_LO], order);
 	return rc;
 }
 
@@ -561,7 +566,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
+	return xen_virt_to_bus(hwdev, xen_io_tlb_end[SWIOTLB_LO] - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.17.1

