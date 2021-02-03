Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35730E7C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:46:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJHD2s21zDwr9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=zphOpY06; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=fIEZVuK8; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ6M2VBQzDwpr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:38:44 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N9nvp104113;
 Wed, 3 Feb 2021 23:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0whQxZzUvZ1N9ogSDF2hvQXVIr9wVe/wZlYPojmN3Dw=;
 b=zphOpY06kD3+7Df7x1mRIRAudIRvGVbxfV7cm1VVALzVaZSFojCB+pC1TdF6+kyhyfzb
 zw9oF/i9Jchi8EOMKPzhFIW1kNwc+TDKDxJnkptpBsmZnoaVtsUoiBM7FejgZ6Wb5N2U
 VvUVF4YiNFcEyDlZHFFYMHqBWlAzWfcK3gbJfhbfLToNfdyKRvjeTLmRoHGcpsXK/P06
 YabOHIUEmZ+/pENHIs5BZwh9W6R0gEZns8pQy97rO+ULFv37KBdlsoF47pA3QDP2wFeV
 pXGKqZ/W+qJrFG46V14gJuom5a/zmWjo4xljodpZnaKmieEerTBfh9roxByjB7vqJvSD yA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36cydm2q1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NBZPD083375;
 Wed, 3 Feb 2021 23:37:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3030.oracle.com with ESMTP id 36dh1rp03y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEf0apA+fXDQBhkVC7p6RZiPW2beDGTJR3LkceZiUkSsKDlLcNRDEu8E1RUZ3dgWW3myJscl18/EraARgi7vRA5bI07NqJRHhXCRH75UJW8H5ew8k7XI6IKjGY5l1aUeMLYQA9ud84B2ewTHlqDc55qRJPCaIO0PI8C23xF717q5jori67CvUsACD4t/z+b63w8PfWcda/EZE/M9GpNSmIw7FGjsXH2u6t127XHqmaeVW+s4pUYJmTXN/tXZ1W9Jw3YhV5H8eR53Wb5Hm+YXFEIlpeRNwowt6QgMV4Rg+oHWldmDkiXyed3LFNrUTYu20+kHcG5zl9omEJiAOTEfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0whQxZzUvZ1N9ogSDF2hvQXVIr9wVe/wZlYPojmN3Dw=;
 b=EiRIIAV+sSfHbA+ePNhanxwPg1PWkEuScf9GKzP3zcbHvD+RyrfCz6G8PQrE2Sv5vKM6R/S8DZuSj/l9X2gUFLSoLZpoD8HGsTBJZEGRitUGeud7S2nUxbRrvLCiTRXSS/A1kLjDwRzY8FJAozzdCmWL5lGIxS7lAY09nbUCTmcEPxji1fV2UBcxH0cuxnJZnx+WNaHvwa84+aVB6sTxxt0lxUo5HPkmyWAH+JKPx9C8vnb3+DFO+V4eFIgg7mdjZ8mOJk+WNq476bTRNxHyKEBhrqxKdYO9opot2nR4drhsRxAEfVBrCnseyftZL6CcWr8QjKkdP2ReukhKdC1KEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0whQxZzUvZ1N9ogSDF2hvQXVIr9wVe/wZlYPojmN3Dw=;
 b=fIEZVuK8vikYtyA8/X72InpkX1VCyox7gcB4puyv3oe+AQIFBZB8t7LAmvH/gJtpDdyOUb0CM7ki4FYRV6TQX1ynrT3iJDkCW8ENf6cVoDcVaoMkMQJ7+zib8Mr7Qc1ebqDdOUUaun9cdrR7Z9khq7AC+KgVRdYiQ8b+2cnaA7E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:37:54 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:37:54 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 3/6] swiotlb: introduce swiotlb_get_type() to calculate
 swiotlb buffer type
Date: Wed,  3 Feb 2021 15:37:06 -0800
Message-Id: <20210203233709.19819-4-dongli.zhang@oracle.com>
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
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2add3f4-4994-4ff3-7c96-08d8c89cba39
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47845B559CD5D0A96B095B3CF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLsEchawOksK0kvC0O+w3T4N1PAe5DU17fjViBpDniy2b9oX4Ufj/Tfq8EWhO4frB7qnX0pHSdDvzHQ0ACCSnNWfnsvXXVueYSMQ5bSKOZehrHUM+9L4t9jd07zu4gKv68MoOqFldDvMmK/RiQtDnCKrSM2k9IjjrO+HS1Rlbcm5FzAPQvsMhdbyVoX7IEnuLpd15jB8NLzIr8vnz81spY0Jx9+eVAjhguDVPT9rRmXtSMC60dsfHS55lCeB2Vj8k4aIvEOCTXTSZp1WxfoYpfjD1hwoDYtSG88vstblEjYKKMuirJd4Js35MVoTNqUwk1P1X1Tj8qKpqNzOOpZRVFed6WoSshwWCHcsJNCGyLxjNYzcVdPLuONOZB908nFsFlXunhMqmi/lRV97Ls5v1hy4GLXqaK3/U1a54rGH4ZkOo5lV264z0LOuJRpB36z47uumkrbQ5UUuslWuE+eRzmwO+YcKeLFn4t+gWi1VYhe4eiRqpTWdJidXGRDw8aGQs8A3hCrTQL7tDzrV5iwAsjl0Ko2cLCh5WY7v/FkOx3gVL/dv/Q+VQhrCbgmuT3dI8Gj5pg09+18zfV4CFs9ZM9xmRdm24wkCCVIxO4FyP+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BcXfwKqgNX8nkepJT4kFsuW0EIqFSZAcYDSzc+4S9iOuag1d/bCyiGVHpKCl?=
 =?us-ascii?Q?0xddX9Vt5u5HL+mT7aWb9G412UZ2PypY26RbGIwvafGZmfYU2ipDw60fgBI+?=
 =?us-ascii?Q?2vlGJqSUe5+9mVeMO7ZexQhODHbppbGlB0dJiqh0hzET7CtRzkcaPOEBLead?=
 =?us-ascii?Q?eyD2nlmSlc5No2kjos3hDOdsYfccm3bdhp4+HospEB8JYSFBQXqymJD7f4Rv?=
 =?us-ascii?Q?f55Ab6RpmXbwmZyMu7dHwmJz3Y8FcNNB0hWUXoaypkZRGSBlRVkZR9EmJd1p?=
 =?us-ascii?Q?BxOl+Qww8yUt2ra7p1vhgyXbi0uzLhyHb+wMaAk5dmzqIdI6pvJLt2lQ0gmq?=
 =?us-ascii?Q?XPRM8W01An6c1LGPJt98NXX3Vr2i2Ewg4A/ZYxzQxp8p7EOlopuUkptkk0dT?=
 =?us-ascii?Q?sJSEkHiLb5d5VGS0uPxWoj2AWBgOtdoUSVkm4wnGdkVUTjl6bICOnosAxKIS?=
 =?us-ascii?Q?lt/aNZpaJfN1OdoUJDCwvK0FV06TLlUWCvgL7pQ3jkx04TFwALqHEw2h6pY8?=
 =?us-ascii?Q?UjsnjBGnDqRx5abwprSSt98LprW8Ku7VTHgBjJTpkIS0lmowSvcGN+6GR/Ny?=
 =?us-ascii?Q?jjxnQLNfehLBjybnbFKE3xBGxAxm7JeEJx2T2+76mWmughTZ8blz9CHrXPVS?=
 =?us-ascii?Q?jg2y+9HokLfKQTXsYCSR/6EVLJq9uq6awiLWDE0QCQckSWSHGVHuKG6JyAuG?=
 =?us-ascii?Q?3C7KIfe6ui6VdJZs08ZGxFpymfTPuhIccI4SHGRlfi14K/rYU/MuaFJisAyq?=
 =?us-ascii?Q?cQNK95FM7wog6nn4BC/mfaofm4rmej2BXxc2lB1iyJbjx1/wM2+GNYv7yTCj?=
 =?us-ascii?Q?CN0hT5a+kx0Bw7AJfaYQ6O5V9qeLoIf28Y3J2IOqHv7lD3GlMsPXfQiTMPFN?=
 =?us-ascii?Q?ToBdrV4ZsFelex4fxzffuc7L6v4rbAo0nqBqbXlUY754pa3VgZv5RlUmqSzE?=
 =?us-ascii?Q?FOPk8qIkDFXXYDZ0OJhx0HlhLiscF+5PyapcsSgifjkTUZkUBcvOV8YJadhJ?=
 =?us-ascii?Q?2uP7WM1UsT0zHDD99sInRccYSNY1fvpPMQehmQx4uO9DwTC14NuAIjcqgFbu?=
 =?us-ascii?Q?0tNfNU2D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2add3f4-4994-4ff3-7c96-08d8c89cba39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:37:53.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2I/HMS0YUJZk/sk/Cx1bLMo0oJIxcGZe+VqnPykaL7Pm15QLnMEIREVpFCxosN1Z6mZbgwEQo0EBiVXG7K/oQ==
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
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

This patch introduces swiotlb_get_type() in order to calculate which
swiotlb buffer the given DMA address is belong to.

This is to prepare to enable 64-bit swiotlb.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 include/linux/swiotlb.h | 14 ++++++++++++++
 kernel/dma/swiotlb.c    |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 777046cd4d1b..3d5980d77810 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -3,6 +3,7 @@
 #define __LINUX_SWIOTLB_H
 
 #include <linux/dma-direction.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/limits.h>
@@ -23,6 +24,8 @@ enum swiotlb_t {
 	SWIOTLB_MAX,
 };
 
+extern int swiotlb_nr;
+
 /*
  * Maximum allowable number of contiguous slabs to map,
  * must be a power of 2.  What is the appropriate value ?
@@ -84,6 +87,17 @@ static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 	       paddr < io_tlb_end[SWIOTLB_LO];
 }
 
+static inline int swiotlb_get_type(phys_addr_t paddr)
+{
+	int i;
+
+	for (i = 0; i < swiotlb_nr; i++)
+		if (paddr >= io_tlb_start[i] && paddr < io_tlb_end[i])
+			return i;
+
+	return -ENOENT;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1fbb65daa2dd..c91d3d2c3936 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -109,6 +109,8 @@ static DEFINE_SPINLOCK(io_tlb_lock);
 
 static int late_alloc;
 
+int swiotlb_nr = 1;
+
 static int __init
 setup_io_tlb_npages(char *str)
 {
-- 
2.17.1

