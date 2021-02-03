Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BE430E7F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:55:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJSx3BjRzDwly
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=AQgAsmYN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=SH5E9mnI; dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ8x4yqgzDsJQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:41:05 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NAGKe046541;
 Wed, 3 Feb 2021 23:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=T1bb0XTc3eHB9TaU/o5/wnJRnLYt5yXAz2mfRftNqPk=;
 b=AQgAsmYNKDuhJEXkKCCLjZ4btVMHNAaabw7AQaLEHjRQ1DxQ6rsmXgUd7yOAwDKP9eE6
 /jn8Fue+dSJnNLWUz8OvbspBrcSBTd2mFnhKJJYcoRiHLkKv0pQ8floQsGn4dTpuwT0r
 XCDo8DnyDk48OzkHCP/OfGRAcLmqeSD7XxwLuh5HakhRJ5fe0Xig1IQqnm5Sxz235Ir8
 mKVab/Wc+yzfaXw0POZyJ5aL5Tt0Magst+aUTkPD5NEilXYr61/hnUQYX8qpWRJVIPie
 lYzpfQkSuh7hAS2ER2mkomqrQd0Q61hS4+sZxC14yRf+48hMe4kXNeamnh4m+vxdT9M4 3w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 36cxvr5fk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:40:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NBZKB083400;
 Wed, 3 Feb 2021 23:38:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3030.oracle.com with ESMTP id 36dh1rp0e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzvh6TTjCKW6F/TBlPDxODMljmdU5b4U3YAZ35m4YjhLwwteroxdqRsIJXe6JrhtN/uUMUOElMzdZF1C1ENAr/iL1fuHxcW3WJ9TRa2Y0XqOGJ2RXu4LZVIpUtij3CG7vhsmbZ1bGXtFSLQSpltPFLoYkclDIu0iNCjpPLnCFanCiIOQeozHW9gQkSabewgu0PiVkxwh2PAy2tiAC2ZMA4AA/5FujqwuP3Nlw9VXAGOYvJkIEMSbYJTTzYk4PkLiBnJZ210q0KU4xFKDBtqO2M/kgU6/BGf2v2p/32pOyIlvd4KGSKYlFzG8qCSOW5qaNusG35HP52alvI07I30YpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1bb0XTc3eHB9TaU/o5/wnJRnLYt5yXAz2mfRftNqPk=;
 b=NsRvqL3XdcmO+sHJOG6vt9wkb0lFGLkVs6UQrK32rQH1C6R8jsab1XeW9C+xmQrrhtcwtO5GxWPtzwIXzsM8O9wJTXQuqvAStPW7TRG97ZtI5TvX4TDX6474kqE5dKXn6VUYTXneJWWSzuWVrQRtaDNPHYyje0YbkIJyeB0DNXmsHkgkcQhXEOq3Mo/jyelM3Gwashr8bKF3DUTo1jq+QEbtnAJ01VklerV71acJhDvDy7a/Ire8LPupCxJia7la3+S9IN8ZGoTIvoRHTyek2iSGphT1pDOi/CDJt7lme8U5szvXIZQNUyJQ0o071z+guAhUzAl1uYzMbs5TORkCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1bb0XTc3eHB9TaU/o5/wnJRnLYt5yXAz2mfRftNqPk=;
 b=SH5E9mnI9UFqO/gUOeqFccVa5MYZdZsvoeyx68oFPHzx3hPsNVbSgm9Rh0xvUBc3Y2BlVvygdWv1haxHsNTj+TY77T6AJnfyqKjAeQADPPtP4bn59/aq76NOgrPOqOgNASnEzJEpRGcsQNg612h1i32PshXf4qIM/gTJXU7V5V8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:38:11 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:38:11 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 6/6] xen-swiotlb: enable 64-bit xen-swiotlb
Date: Wed,  3 Feb 2021 15:37:09 -0800
Message-Id: <20210203233709.19819-7-dongli.zhang@oracle.com>
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
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:38:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a6f39ca-831d-4584-1671-08d8c89cc4a6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47843A529EE3238F834D6E8CF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1MdwF09ZQsQBk3V9QOQLj3Q2J4L21DedJnj5zLtjikYKElnwxG4upLd7TjhmJPnAU7VpjSHxPeJkqoPBRqm6qLeK0CHlFugspJnxi0iJI55XYooo19FwHgiOqBWBro0DzURhQTcUKHg2pt6GcgakcdWtajKr7YhF2oMlQ9TwO3PVCjJBIHzVB9ARp0nbm7zuhWes6OM0DRHYiZShiKkwZu7s9DdAyEDvWn/Gl0ZL4waWfYydjw/WkEc5/ennCc9OVPn+TREYJxjo1DWlOpdvMoTMaiSx8AjE+9jEXwuXzWLjL3qbTLDi6ktPwxxXGQs8U3Irr5/M7ar7bmutYlTQ2ed6ghggKY+GkYuKZFNMtieoWviD0NZJ01fhMAb5gbdJWAM4p1gONjFeoyWColerWY0LMjTOXUAp3dPN8tNJCXJ//c8+I3jztzLAk5mNt4e8uVOFDvvw+5Ri8EtVZZgmhOTrLSuo/OqSS6VgrbK7WOcJCGAIwNtW19s81SglVsppCFxB/JYDVlfn/XzOiteTG9HHCwH7jJTeIGHi0vZYowFiLlsq0xIt5bSbDcpMaMnWCnR5Cj//oWPXtmR2wvTgnI8gqLb36wjoJGn9DZCM2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?v4+k5MesDHa1MVSGi/UHPtmaF26L/lVN8GcJ71CBITc1I1MM0IDFIyBYytE4?=
 =?us-ascii?Q?53IGo7YT2EKkghBW/3Sk9E+bozL8K8Q/9nt64yNP1VUKTKWcNXGh0x3n6L54?=
 =?us-ascii?Q?xVW44nCRVbatRJqN678ro8ZSzYt+2fRymUty+3o8u/17/PwxyEk9Ady2ePJu?=
 =?us-ascii?Q?MOCoTjqlbeIOOmbEC/N28xw5dHvOPOovzSUgb9BAxSKqZmaCGbKEKN2DT/bR?=
 =?us-ascii?Q?zqtS1Di8iAHNISKyT5Kia3S5FQ31jIr8lU9eM3naCerZx5CWbllDRJPUggXy?=
 =?us-ascii?Q?PDUKaAxh4cXAaHrxbUuSXPbWSf2dHDC/0daQlqTmIDOHhAzikT+ON4WOwr19?=
 =?us-ascii?Q?NAfx9YwHYZjSnq7QmKuypvDXn/4sFWZ036E16UhM22ZhF3yCJSsT3DjLdG8U?=
 =?us-ascii?Q?tOX4toyIsdgCmi7p5QlaizYNgW+RH61ZTyCbLfrdr/vqHzBb7i9rreaXl+1c?=
 =?us-ascii?Q?guCiLvEr5Go5xNdVG4uR7NyDFOlzkkVsbMfELRCU0p1mRPrIQdx6GL7zHrWH?=
 =?us-ascii?Q?LhATraTb6GMS48zXasH4Dla6lHfNT/es/ZkxUzm5az8Zdjsb76SNDY6Qy0U9?=
 =?us-ascii?Q?dVdWc5Wr/3tykSq/9BWFCam6QyHfXpzywRf5L/GutdWeL2qGZqKhTaUTXeGH?=
 =?us-ascii?Q?EGF9kybhdDX9WoEPRubZZkhbyNiMckO0VrgM333uXg5hUIhn8B+PqVQen7cM?=
 =?us-ascii?Q?0Yf1gM25kWnPI3xofo9GasPaYo/sS+suvzIvlhb2ApKpM6Rc4MCuXBM8KsXR?=
 =?us-ascii?Q?BMlDEGL0r32OC2U3k4ymsoa2g5qKu7wKo3KGE6iz6Ya8AkYKuoW4nUzA9F4P?=
 =?us-ascii?Q?aSeXvt2DyQABYPMdHHv0KPr9+b4R5tmZoteVrUkzO/IDIxlQAXE/0MOQs2aR?=
 =?us-ascii?Q?jwCOMJIruq+MmWnpzVoZ5Wkmc8RWspNBAP+lJpmBZcIUeuUp0Z8vKzuqSteA?=
 =?us-ascii?Q?2Cp+CP+6w/Vxi22Q1FuM16M5VQ0xW2fIukRt0PSMYAsj9qZln0bvBSCk4r32?=
 =?us-ascii?Q?Tzd2Gh0o0RoulKFMNHy6Y2VjnRy43NW+4INplMPcCZXk7WjQgKv7YOEj3syO?=
 =?us-ascii?Q?x9uYpUo5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6f39ca-831d-4584-1671-08d8c89cc4a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:38:11.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1RSaXkF0zyFxShGIWuzhyAUNVmLQ3O5X3zrZzuMcrJieYM/HHT4wwktIQz2k01o9UKkfGFBJpMRNiO3jThp5g==
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030143
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

This patch is to enable the 64-bit xen-swiotlb buffer.

For Xen PVM DMA address, the 64-bit device will be able to allocate from
64-bit swiotlb buffer.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 117 ++++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 43 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e18cae693cdc..c9ab07809e32 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -108,27 +108,36 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
 	phys_addr_t paddr = (phys_addr_t)xen_pfn << XEN_PAGE_SHIFT;
+	int i;
 
 	/* If the address is outside our domain, it CAN
 	 * have the same virtual address as another address
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
-	if (pfn_valid(PFN_DOWN(paddr))) {
-		return paddr >= virt_to_phys(xen_io_tlb_start[SWIOTLB_LO]) &&
-		       paddr < virt_to_phys(xen_io_tlb_end[SWIOTLB_LO]);
-	}
+	if (!pfn_valid(PFN_DOWN(paddr)))
+		return 0;
+
+	for (i = 0; i < swiotlb_nr; i++)
+		if (paddr >= virt_to_phys(xen_io_tlb_start[i]) &&
+		    paddr < virt_to_phys(xen_io_tlb_end[i]))
+			return 1;
+
 	return 0;
 }
 
 static int
-xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
+xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs,
+		  enum swiotlb_t type)
 {
 	int i, rc;
 	int dma_bits;
 	dma_addr_t dma_handle;
 	phys_addr_t p = virt_to_phys(buf);
 
-	dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
+	if (type == SWIOTLB_HI)
+		dma_bits = max_dma_bits[SWIOTLB_HI];
+	else
+		dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
 
 	i = 0;
 	do {
@@ -139,7 +148,7 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 				p + (i << IO_TLB_SHIFT),
 				get_order(slabs << IO_TLB_SHIFT),
 				dma_bits, &dma_handle);
-		} while (rc && dma_bits++ < max_dma_bits[SWIOTLB_LO]);
+		} while (rc && dma_bits++ < max_dma_bits[type]);
 		if (rc)
 			return rc;
 
@@ -147,16 +156,17 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 	} while (i < nslabs);
 	return 0;
 }
-static unsigned long xen_set_nslabs(unsigned long nr_tbl)
+
+static unsigned long xen_set_nslabs(unsigned long nr_tbl, enum swiotlb_t type)
 {
 	if (!nr_tbl) {
-		xen_io_tlb_nslabs[SWIOTLB_LO] = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
-		xen_io_tlb_nslabs[SWIOTLB_LO] = ALIGN(xen_io_tlb_nslabs[SWIOTLB_LO],
+		xen_io_tlb_nslabs[type] = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
+		xen_io_tlb_nslabs[type] = ALIGN(xen_io_tlb_nslabs[type],
 						      IO_TLB_SEGSIZE);
 	} else
-		xen_io_tlb_nslabs[SWIOTLB_LO] = nr_tbl;
+		xen_io_tlb_nslabs[type] = nr_tbl;
 
-	return xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
+	return xen_io_tlb_nslabs[type] << IO_TLB_SHIFT;
 }
 
 enum xen_swiotlb_err {
@@ -180,23 +190,24 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 	}
 	return "";
 }
-int __ref xen_swiotlb_init(int verbose, bool early)
+
+static int xen_swiotlb_init_type(int verbose, bool early, enum swiotlb_t type)
 {
 	unsigned long bytes, order;
 	int rc = -ENOMEM;
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
 	unsigned int repeat = 3;
 
-	xen_io_tlb_nslabs[SWIOTLB_LO] = swiotlb_nr_tbl(SWIOTLB_LO);
+	xen_io_tlb_nslabs[type] = swiotlb_nr_tbl(type);
 retry:
-	bytes = xen_set_nslabs(xen_io_tlb_nslabs[SWIOTLB_LO]);
-	order = get_order(xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
+	bytes = xen_set_nslabs(xen_io_tlb_nslabs[type], type);
+	order = get_order(xen_io_tlb_nslabs[type] << IO_TLB_SHIFT);
 
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (io_tlb_start[SWIOTLB_LO] != 0) {
-		xen_io_tlb_start[SWIOTLB_LO] = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
+	if (io_tlb_start[type] != 0) {
+		xen_io_tlb_start[type] = phys_to_virt(io_tlb_start[type]);
 		goto end;
 	}
 
@@ -204,81 +215,95 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	 * Get IO TLB memory from any location.
 	 */
 	if (early) {
-		xen_io_tlb_start[SWIOTLB_LO] = memblock_alloc(PAGE_ALIGN(bytes),
+		xen_io_tlb_start[type] = memblock_alloc(PAGE_ALIGN(bytes),
 						  PAGE_SIZE);
-		if (!xen_io_tlb_start[SWIOTLB_LO])
+		if (!xen_io_tlb_start[type])
 			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 			      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
 	} else {
 #define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
 		while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-			xen_io_tlb_start[SWIOTLB_LO] = (void *)xen_get_swiotlb_free_pages(order);
-			if (xen_io_tlb_start[SWIOTLB_LO])
+			xen_io_tlb_start[type] = (void *)xen_get_swiotlb_free_pages(order);
+			if (xen_io_tlb_start[type])
 				break;
 			order--;
 		}
 		if (order != get_order(bytes)) {
 			pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
 				(PAGE_SIZE << order) >> 20);
-			xen_io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
-			bytes = xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
+			xen_io_tlb_nslabs[type] = SLABS_PER_PAGE << order;
+			bytes = xen_io_tlb_nslabs[type] << IO_TLB_SHIFT;
 		}
 	}
-	if (!xen_io_tlb_start[SWIOTLB_LO]) {
+	if (!xen_io_tlb_start[type]) {
 		m_ret = XEN_SWIOTLB_ENOMEM;
 		goto error;
 	}
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(xen_io_tlb_start[SWIOTLB_LO],
+	rc = xen_swiotlb_fixup(xen_io_tlb_start[type],
 			       bytes,
-			       xen_io_tlb_nslabs[SWIOTLB_LO]);
+			       xen_io_tlb_nslabs[type],
+			       type);
 	if (rc) {
 		if (early)
-			memblock_free(__pa(xen_io_tlb_start[SWIOTLB_LO]),
+			memblock_free(__pa(xen_io_tlb_start[type]),
 				      PAGE_ALIGN(bytes));
 		else {
-			free_pages((unsigned long)xen_io_tlb_start[SWIOTLB_LO], order);
-			xen_io_tlb_start[SWIOTLB_LO] = NULL;
+			free_pages((unsigned long)xen_io_tlb_start[type], order);
+			xen_io_tlb_start[type] = NULL;
 		}
 		m_ret = XEN_SWIOTLB_EFIXUP;
 		goto error;
 	}
 	if (early) {
-		if (swiotlb_init_with_tbl(xen_io_tlb_start[SWIOTLB_LO],
-					  xen_io_tlb_nslabs[SWIOTLB_LO],
-					  SWIOTLB_LO, verbose))
+		if (swiotlb_init_with_tbl(xen_io_tlb_start[type],
+					  xen_io_tlb_nslabs[type],
+					  type, verbose))
 			panic("Cannot allocate SWIOTLB buffer");
 		rc = 0;
 	} else
-		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start[SWIOTLB_LO],
-						xen_io_tlb_nslabs[SWIOTLB_LO],
-						SWIOTLB_LO);
+		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start[type],
+						xen_io_tlb_nslabs[type],
+						type);
 
 end:
-	xen_io_tlb_end[SWIOTLB_LO] = xen_io_tlb_start[SWIOTLB_LO] + bytes;
+	xen_io_tlb_end[type] = xen_io_tlb_start[type] + bytes;
 	if (!rc)
-		swiotlb_set_max_segment(PAGE_SIZE, SWIOTLB_LO);
+		swiotlb_set_max_segment(PAGE_SIZE, type);
 
 	return rc;
 error:
 	if (repeat--) {
-		xen_io_tlb_nslabs[SWIOTLB_LO] = max(1024UL, /* Min is 2MB */
-					(xen_io_tlb_nslabs[SWIOTLB_LO] >> 1));
+		xen_io_tlb_nslabs[type] = max(1024UL, /* Min is 2MB */
+					(xen_io_tlb_nslabs[type] >> 1));
 		pr_info("Lowering to %luMB\n",
-			(xen_io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT) >> 20);
+			(xen_io_tlb_nslabs[type] << IO_TLB_SHIFT) >> 20);
 		goto retry;
 	}
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
 	if (early)
 		panic("%s (rc:%d)", xen_swiotlb_error(m_ret), rc);
 	else
-		free_pages((unsigned long)xen_io_tlb_start[SWIOTLB_LO], order);
+		free_pages((unsigned long)xen_io_tlb_start[type], order);
 	return rc;
 }
 
+int __ref xen_swiotlb_init(int verbose, bool early)
+{
+	int i, rc;
+
+	for (i = 0; i < swiotlb_nr; i++) {
+		rc = xen_swiotlb_init_type(verbose, early, i);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
@@ -566,7 +591,13 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_virt_to_bus(hwdev, xen_io_tlb_end[SWIOTLB_LO] - 1) <= mask;
+	int i;
+
+	for (i = 0; i < swiotlb_nr; i++)
+		if (xen_virt_to_bus(hwdev, xen_io_tlb_end[i] - 1) <= mask)
+			return true;
+
+	return false;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.17.1

