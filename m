Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEBC30E7D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:51:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJNv15TNzDwrm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:51:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=ymt145DO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KkkR4pWc; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ6M0bv9zDwpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:38:44 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N94Pp103917;
 Wed, 3 Feb 2021 23:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=RuMDDnvFCWO4p61oFgjtmLkCJi31pcutirwlqEiaVDs=;
 b=ymt145DO0qO8TYm1a8EXesRs01fgiJRugSzEz3L8IRKdQBTYNNcfAUB+RSZT40m0lM39
 hT0O4IvkHJaQ3YjxBzh7fjBnWopdXNkkdzlGOnCTK+p7wr7kvSY7xYESFGKQfGNX/5AK
 4wDAnYH83AMb50mWUSaasQk4TwKZDassXFqS6DbdFsL+GGA9K3Y6JNC3/hybO0fpiY6b
 cWuYhdxXTgMmDeQ/jHkvmpjk2ufoDbruAHJ73uSOB1/lYzO+9wak7PU7G3VIk9kuUTzE
 dLPLyCl3O1c3gqLwNfxmUuvWIya8O820xwCbtkv8ZZIA3Mhoy++AsgHriwsanUEndgAM RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36cydm2q1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NB4Nf025252;
 Wed, 3 Feb 2021 23:37:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 36dhc1wj64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHORM4V2tKdZdkRvag6BlOp1gQc6R3pnvwq4BJ05MpTLvFoH8CiLTNWzFjD5mORYszDmIQBOy66uGDYUw/owH7Gq5WnziLRoztgLfcjzbML2I+VcP/YmZ0YtqkZ/jFZVAStF00fkT4IIWoSkm3XLUP0A3fCBK727jkxBbw225t6FbWR5ZI6pigIgjU+y5JP5/41iNhRGir209Uew0ZdwkMFuIXIw7q649aWD5mjXE8CmOWPL7j0FynJfZt4k2YHtlMyRP7Z4x9yq85r5eElean/5WxDslhQ5j6ChYGIfDqNiMRfct/zi6i5GBKkjVtocdlyIabR9VdWrHDZU0QfJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuMDDnvFCWO4p61oFgjtmLkCJi31pcutirwlqEiaVDs=;
 b=lYqaTZ1gCuE0IaPruIsmjn+pEnTEG8UFYUTHtgKUmO2pAPbraM8USj+TQyiDb+9OLGoihxSc9KJYD6/rNsGzChdJSAsmu+MtCYS0cdv81qpQ+aMWwBA/wq2Fg0ewMOm3EGbKzJm3c8wGlfQ8ZuLccr0BRBQvtPMqwp2/uc3ftgUyckKQ5XqeAsAPe6wf4dz4he2e3LQ+G77YnSVfS4/LTI6nycd/nitj0KAAXo93Wo1w7JYbQXbkED0bQI6lF4+Thl/u5iUPu4mmmkZYD+6JnnlzUOKt9k6D8BbMtf8k0zU2xUOLeFZNti6gK34KhnAqdHe6ZFFZ83xaV3dEoNPR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuMDDnvFCWO4p61oFgjtmLkCJi31pcutirwlqEiaVDs=;
 b=KkkR4pWcwFNIbO525g642zO5aq6uRD472cAQzoWX9B9gnmZsp86vDwMDZMJWv9XzLoktBUgh8Q/RhcbTzZI1CrxP3E2z6Q6bsmZ+eV7pczJDUgT/RPy6direwT+yBCBUg0IlsigTH14Aysxhi912DxXdyYxeL+j/nWCHp4XxKag=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:37:48 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:37:48 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 2/6] swiotlb: convert variables to arrays
Date: Wed,  3 Feb 2021 15:37:05 -0800
Message-Id: <20210203233709.19819-3-dongli.zhang@oracle.com>
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
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6944969b-97db-45a0-60c0-08d8c89cb6bb
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB478473FF8C57D2FF7554B3CFF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nr78D0BKtGfvFg+Zfn+Ls1e+J8xHXLnIJvc4gVLi+ug2eClaIcZ6uhzFtYpjSTwp7e7R5plVXJ8NBrg9zON7LXhMatgSgfyGlEx91DqGFigMBLa4Nmq/47L/XpbNffcydvVTC0kxSIp97xQFN+wQj1yexDtR8ALIiO/dbrPMKOsdPxwSxtOSZoGgo21vH2w2zIPpeitK5rCORhh3jWnaWj/PfWhFWAUAysHzS3e0HzAybFNCXagGOyl4jmAoEWOG+BCGOTBBAkc1HA96vI0nujtkQssrb/WEJlDSa/h/cS+42jr4R2iEsogttCi/42xJGvKGof0y+JmB8c+0RQuGOfh/cmeSJTGOSEmS3xv9JBpUqJu4VWPBGhu288UKCmvW6rsIgd644MWC8WWJvZxQMmZUI8D/uaKp3kL92CaeLj4qk4nYG5n/0JJjnblSYTBdejKWy9hJ31wAgQ9Lu7C0hdDQiUxmZjM23VdjADjiGmUJGAJozKbN4McGomAArxPJWcYNMObna0G4jz412XvSAGLyJqlJ4Juxlc8uRj4OJmaMTg4XXTUAXWfuHXhDlH3yU0+DSq21chBMad/htHBMrEvB60yr4BTBW4ER+x38C3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(30864003)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WYrdUlsRpAm3qmPfNVC56GiDTxiaAAF5RDWBwCeb1MA7PZAa7AztQi35fgIg?=
 =?us-ascii?Q?joIVm+NsV+Ah7jJJGlV4C/3sLzdgeF3L222clfsCi59UaNnXDM4oTZRfOt0F?=
 =?us-ascii?Q?3UmtvFrkybHGvmbWbt6paglrSI3R/dBm0mGWzhWP51NkHkfEsY0QzUaBQ9MI?=
 =?us-ascii?Q?I5VeiExjTUj3mUkymQUcuJZD67uvmuZlkfAqKNnN6onUgkYRAdghXc8VyYaQ?=
 =?us-ascii?Q?kw2+Qka/eHlnHvDUdFPSurF2/oEGXe2OkaM4FzGUOO5df5PuqVVzYCsbO5pd?=
 =?us-ascii?Q?PsvPjOIs5t/ppnFbTmyGjqJewvY8+PM+KV34tZFig6vdx2YTXtsLQSYXOb7b?=
 =?us-ascii?Q?Xnp+m4waCuEnynwdXSxRIAyD2DM14JPtzR3vtMuklmjsFla3p/wSLj5+TeXa?=
 =?us-ascii?Q?EACzsAHOM/MXDubyFke02eTC1jtUsNcSnXt51XpDgXgtROTmvVQigPmfoDrJ?=
 =?us-ascii?Q?ph4CQqa+zNk/LjkzYKIX7GUon18vkSWT+Z69KRioyesR/l2g1mU06fVzLlD4?=
 =?us-ascii?Q?Nk0KxBGumDhO5E49v/gLbzBJne6BGW9N4STIsLKj3xLwiFbQz4Mhhphw/k/D?=
 =?us-ascii?Q?dNKtAgmt/SKWp71gjcNdpdgdUVDvOFh2+iCb/IlAOhYTcnbkKmFyuLl/Bjsn?=
 =?us-ascii?Q?6tOPAQ5K0mSk+3L5Iqpm6Aj9e8aYDi1aReE3eE3ZsPNPqOFS+VVQRUBdiKA+?=
 =?us-ascii?Q?LWRN/aBP0m8D9w20N6d6nvI21mehLFfnG8KtJrxFy64I06UymiZFX2mZiNPG?=
 =?us-ascii?Q?+Pq9fErWxR74DBC1KJn/LpDvK1Aoi5dfWK3BMZPPUoPhQD7JMXaCOtSVr7xm?=
 =?us-ascii?Q?UTi19khibasCepAGlaohSQQWMzSOR9LIqKoWlk/AM1VJgZmQmXRwSe2IR/OG?=
 =?us-ascii?Q?MsvNEI3rfRIOhwIuHT0xaT8N3qalx33VhrStF+SQCoHvKwT7wL47xmvXUaP2?=
 =?us-ascii?Q?JoUGpiMn39DHFhMecx22MHUd+nVE/Ty3GireUN5CgFbhJv/Rbh/YTnWUsvqu?=
 =?us-ascii?Q?exuwJp1rqFe2wPt7gVRWU6wPpFrv/m1BWe6h3K15s8HVGR1g5f4oCessiCAo?=
 =?us-ascii?Q?G/u7pE2P?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6944969b-97db-45a0-60c0-08d8c89cb6bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:37:48.2080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2kKZBo1cJuaZ1vlofMVuU/CWkd5ocmk3yTATYVa2qs0VNH9hXYDL5HmeRJwljQjfwSD3en40D8igro5q/vAyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
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

This patch converts several swiotlb related variables to arrays, in
order to maintain stat/status for different swiotlb buffers. Here are
variables involved:

- io_tlb_start and io_tlb_end
- io_tlb_nslabs and io_tlb_used
- io_tlb_list
- io_tlb_index
- max_segment
- io_tlb_orig_addr
- no_iotlb_memory

There is no functional change and this is to prepare to enable 64-bit
swiotlb.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/powerpc/platforms/pseries/svm.c |   6 +-
 drivers/xen/swiotlb-xen.c            |   4 +-
 include/linux/swiotlb.h              |   5 +-
 kernel/dma/swiotlb.c                 | 257 ++++++++++++++-------------
 4 files changed, 140 insertions(+), 132 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a9..9f8842d0da1f 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,9 +55,9 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	if (io_tlb_start[SWIOTLB_LO])
+		memblock_free_early(io_tlb_start[SWIOTLB_LO],
+				    PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..3261880ad859 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (io_tlb_start != 0) {
-		xen_io_tlb_start = phys_to_virt(io_tlb_start);
+	if (io_tlb_start[SWIOTLB_LO] != 0) {
+		xen_io_tlb_start = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
 		goto end;
 	}
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ca125c1b1281..777046cd4d1b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -76,11 +76,12 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
-extern phys_addr_t io_tlb_start, io_tlb_end;
+extern phys_addr_t io_tlb_start[], io_tlb_end[];
 
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
+	return paddr >= io_tlb_start[SWIOTLB_LO] &&
+	       paddr < io_tlb_end[SWIOTLB_LO];
 }
 
 void __init swiotlb_exit(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7c42df6e6100..1fbb65daa2dd 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -69,38 +69,38 @@ enum swiotlb_force swiotlb_force;
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
  * API.
  */
-phys_addr_t io_tlb_start, io_tlb_end;
+phys_addr_t io_tlb_start[SWIOTLB_MAX], io_tlb_end[SWIOTLB_MAX];
 
 /*
  * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
  * io_tlb_end.  This is command line adjustable via setup_io_tlb_npages.
  */
-static unsigned long io_tlb_nslabs;
+static unsigned long io_tlb_nslabs[SWIOTLB_MAX];
 
 /*
  * The number of used IO TLB block
  */
-static unsigned long io_tlb_used;
+static unsigned long io_tlb_used[SWIOTLB_MAX];
 
 /*
  * This is a free list describing the number of free entries available from
  * each index
  */
-static unsigned int *io_tlb_list;
-static unsigned int io_tlb_index;
+static unsigned int *io_tlb_list[SWIOTLB_MAX];
+static unsigned int io_tlb_index[SWIOTLB_MAX];
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
  */
-static unsigned int max_segment;
+static unsigned int max_segment[SWIOTLB_MAX];
 
 /*
  * We need to save away the original address corresponding to a mapped entry
  * for the sync operations.
  */
 #define INVALID_PHYS_ADDR (~(phys_addr_t)0)
-static phys_addr_t *io_tlb_orig_addr;
+static phys_addr_t *io_tlb_orig_addr[SWIOTLB_MAX];
 
 /*
  * Protect the above data structures in the map and unmap calls
@@ -113,9 +113,9 @@ static int __init
 setup_io_tlb_npages(char *str)
 {
 	if (isdigit(*str)) {
-		io_tlb_nslabs = simple_strtoul(str, &str, 0);
+		io_tlb_nslabs[SWIOTLB_LO] = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
 	}
 	if (*str == ',')
 		++str;
@@ -123,40 +123,40 @@ setup_io_tlb_npages(char *str)
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
-		io_tlb_nslabs = 1;
+		io_tlb_nslabs[SWIOTLB_LO] = 1;
 	}
 
 	return 0;
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
-static bool no_iotlb_memory;
+static bool no_iotlb_memory[SWIOTLB_MAX];
 
 unsigned long swiotlb_nr_tbl(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : io_tlb_nslabs;
+	return unlikely(no_iotlb_memory[SWIOTLB_LO]) ? 0 : io_tlb_nslabs[SWIOTLB_LO];
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
 unsigned int swiotlb_max_segment(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : max_segment;
+	return unlikely(no_iotlb_memory[SWIOTLB_LO]) ? 0 : max_segment[SWIOTLB_LO];
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
 void swiotlb_set_max_segment(unsigned int val)
 {
 	if (swiotlb_force == SWIOTLB_FORCE)
-		max_segment = 1;
+		max_segment[SWIOTLB_LO] = 1;
 	else
-		max_segment = rounddown(val, PAGE_SIZE);
+		max_segment[SWIOTLB_LO] = rounddown(val, PAGE_SIZE);
 }
 
 unsigned long swiotlb_size_or_default(void)
 {
 	unsigned long size;
 
-	size = io_tlb_nslabs << IO_TLB_SHIFT;
+	size = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 
 	return size ? size : (IO_TLB_DEFAULT_SIZE);
 }
@@ -170,10 +170,10 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (!io_tlb_nslabs) {
+	if (!io_tlb_nslabs[SWIOTLB_LO]) {
 		size = ALIGN(new_size, 1 << IO_TLB_SHIFT);
-		io_tlb_nslabs = size >> IO_TLB_SHIFT;
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		io_tlb_nslabs[SWIOTLB_LO] = size >> IO_TLB_SHIFT;
+		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
 
 		pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 	}
@@ -181,15 +181,16 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 
 void swiotlb_print_info(void)
 {
-	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	unsigned long bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 
-	if (no_iotlb_memory) {
+	if (no_iotlb_memory[SWIOTLB_LO]) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &io_tlb_start, &io_tlb_end,
-	       bytes >> 20);
+	pr_info("mapped [mem %pa-%pa] (%luMB)\n",
+		&io_tlb_start[SWIOTLB_LO], &io_tlb_end[SWIOTLB_LO],
+		bytes >> 20);
 }
 
 /*
@@ -203,11 +204,11 @@ void __init swiotlb_update_mem_attributes(void)
 	void *vaddr;
 	unsigned long bytes;
 
-	if (no_iotlb_memory || late_alloc)
+	if (no_iotlb_memory[SWIOTLB_LO] || late_alloc)
 		return;
 
-	vaddr = phys_to_virt(io_tlb_start);
-	bytes = PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT);
+	vaddr = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
+	bytes = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
 	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
 	memset(vaddr, 0, bytes);
 }
@@ -219,38 +220,38 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = __pa(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	io_tlb_nslabs[SWIOTLB_LO] = nslabs;
+	io_tlb_start[SWIOTLB_LO] = __pa(tlb);
+	io_tlb_end[SWIOTLB_LO] = io_tlb_start[SWIOTLB_LO] + bytes;
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
 	 * between io_tlb_start and io_tlb_end.
 	 */
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(int));
-	io_tlb_list = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_list)
+	alloc_size = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int));
+	io_tlb_list[SWIOTLB_LO] = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!io_tlb_list[SWIOTLB_LO])
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t));
-	io_tlb_orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_addr)
+	alloc_size = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t));
+	io_tlb_orig_addr[SWIOTLB_LO] = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!io_tlb_orig_addr[SWIOTLB_LO])
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < io_tlb_nslabs[SWIOTLB_LO]; i++) {
+		io_tlb_list[SWIOTLB_LO][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
-	no_iotlb_memory = false;
+	io_tlb_index[SWIOTLB_LO] = 0;
+	no_iotlb_memory[SWIOTLB_LO] = false;
 
 	if (verbose)
 		swiotlb_print_info();
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
 	return 0;
 }
 
@@ -265,25 +266,25 @@ swiotlb_init(int verbose)
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!io_tlb_nslabs[SWIOTLB_LO]) {
+		io_tlb_nslabs[SWIOTLB_LO] = (default_size >> IO_TLB_SHIFT);
+		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
 	}
 
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 
 	/* Get IO TLB memory from the low pages */
 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
+	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs[SWIOTLB_LO], verbose))
 		return;
 
-	if (io_tlb_start) {
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
-		io_tlb_start = 0;
+	if (io_tlb_start[SWIOTLB_LO]) {
+		memblock_free_early(io_tlb_start[SWIOTLB_LO],
+				    PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
+		io_tlb_start[SWIOTLB_LO] = 0;
 	}
 	pr_warn("Cannot allocate buffer");
-	no_iotlb_memory = true;
+	no_iotlb_memory[SWIOTLB_LO] = true;
 }
 
 /*
@@ -294,22 +295,22 @@ swiotlb_init(int verbose)
 int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
-	unsigned long bytes, req_nslabs = io_tlb_nslabs;
+	unsigned long bytes, req_nslabs = io_tlb_nslabs[SWIOTLB_LO];
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!io_tlb_nslabs[SWIOTLB_LO]) {
+		io_tlb_nslabs[SWIOTLB_LO] = (default_size >> IO_TLB_SHIFT);
+		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
 	}
 
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(io_tlb_nslabs << IO_TLB_SHIFT);
-	io_tlb_nslabs = SLABS_PER_PAGE << order;
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
+	io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
+	bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
@@ -320,15 +321,15 @@ swiotlb_late_init_with_default_size(size_t default_size)
 	}
 
 	if (!vstart) {
-		io_tlb_nslabs = req_nslabs;
+		io_tlb_nslabs[SWIOTLB_LO] = req_nslabs;
 		return -ENOMEM;
 	}
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		io_tlb_nslabs = SLABS_PER_PAGE << order;
+		io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs);
+	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs[SWIOTLB_LO]);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
@@ -337,10 +338,10 @@ swiotlb_late_init_with_default_size(size_t default_size)
 
 static void swiotlb_cleanup(void)
 {
-	io_tlb_end = 0;
-	io_tlb_start = 0;
-	io_tlb_nslabs = 0;
-	max_segment = 0;
+	io_tlb_end[SWIOTLB_LO] = 0;
+	io_tlb_start[SWIOTLB_LO] = 0;
+	io_tlb_nslabs[SWIOTLB_LO] = 0;
+	max_segment[SWIOTLB_LO] = 0;
 }
 
 int
@@ -350,9 +351,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = virt_to_phys(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	io_tlb_nslabs[SWIOTLB_LO] = nslabs;
+	io_tlb_start[SWIOTLB_LO] = virt_to_phys(tlb);
+	io_tlb_end[SWIOTLB_LO] = io_tlb_start[SWIOTLB_LO] + bytes;
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
@@ -362,37 +363,37 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
 	 * between io_tlb_start and io_tlb_end.
 	 */
-	io_tlb_list = (unsigned int *)__get_free_pages(GFP_KERNEL,
-	                              get_order(io_tlb_nslabs * sizeof(int)));
-	if (!io_tlb_list)
+	io_tlb_list[SWIOTLB_LO] = (unsigned int *)__get_free_pages(GFP_KERNEL,
+			get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
+	if (!io_tlb_list[SWIOTLB_LO])
 		goto cleanup3;
 
-	io_tlb_orig_addr = (phys_addr_t *)
+	io_tlb_orig_addr[SWIOTLB_LO] = (phys_addr_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs *
+				 get_order(io_tlb_nslabs[SWIOTLB_LO] *
 					   sizeof(phys_addr_t)));
-	if (!io_tlb_orig_addr)
+	if (!io_tlb_orig_addr[SWIOTLB_LO])
 		goto cleanup4;
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < io_tlb_nslabs[SWIOTLB_LO]; i++) {
+		io_tlb_list[SWIOTLB_LO][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
-	no_iotlb_memory = false;
+	io_tlb_index[SWIOTLB_LO] = 0;
+	no_iotlb_memory[SWIOTLB_LO] = false;
 
 	swiotlb_print_info();
 
 	late_alloc = 1;
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
 
 	return 0;
 
 cleanup4:
-	free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
+	free_pages((unsigned long)io_tlb_list[SWIOTLB_LO], get_order(io_tlb_nslabs[SWIOTLB_LO] *
 	                                                 sizeof(int)));
-	io_tlb_list = NULL;
+	io_tlb_list[SWIOTLB_LO] = NULL;
 cleanup3:
 	swiotlb_cleanup();
 	return -ENOMEM;
@@ -400,23 +401,23 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	if (!io_tlb_orig_addr)
+	if (!io_tlb_orig_addr[SWIOTLB_LO])
 		return;
 
 	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_orig_addr,
-			   get_order(io_tlb_nslabs * sizeof(phys_addr_t)));
-		free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-								 sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(io_tlb_start),
-			   get_order(io_tlb_nslabs << IO_TLB_SHIFT));
+		free_pages((unsigned long)io_tlb_orig_addr[SWIOTLB_LO],
+			   get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t)));
+		free_pages((unsigned long)io_tlb_list[SWIOTLB_LO],
+			   get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
+		free_pages((unsigned long)phys_to_virt(io_tlb_start[SWIOTLB_LO]),
+			   get_order(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
 	} else {
-		memblock_free_late(__pa(io_tlb_orig_addr),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_list),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(int)));
-		memblock_free_late(io_tlb_start,
-				   PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		memblock_free_late(__pa(io_tlb_orig_addr[SWIOTLB_LO]),
+				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t)));
+		memblock_free_late(__pa(io_tlb_list[SWIOTLB_LO]),
+				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
+		memblock_free_late(io_tlb_start[SWIOTLB_LO],
+				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
 	}
 	swiotlb_cleanup();
 }
@@ -465,7 +466,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start[SWIOTLB_LO]);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -475,7 +476,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	unsigned long max_slots;
 	unsigned long tmp_io_tlb_used;
 
-	if (no_iotlb_memory)
+	if (no_iotlb_memory[SWIOTLB_LO])
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
 	if (mem_encrypt_active())
@@ -518,11 +519,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 */
 	spin_lock_irqsave(&io_tlb_lock, flags);
 
-	if (unlikely(nslots > io_tlb_nslabs - io_tlb_used))
+	if (unlikely(nslots > io_tlb_nslabs[SWIOTLB_LO] - io_tlb_used[SWIOTLB_LO]))
 		goto not_found;
 
-	index = ALIGN(io_tlb_index, stride);
-	if (index >= io_tlb_nslabs)
+	index = ALIGN(io_tlb_index[SWIOTLB_LO], stride);
+	if (index >= io_tlb_nslabs[SWIOTLB_LO])
 		index = 0;
 	wrap = index;
 
@@ -530,7 +531,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		while (iommu_is_span_boundary(index, nslots, offset_slots,
 					      max_slots)) {
 			index += stride;
-			if (index >= io_tlb_nslabs)
+			if (index >= io_tlb_nslabs[SWIOTLB_LO])
 				index = 0;
 			if (index == wrap)
 				goto not_found;
@@ -541,39 +542,42 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		 * contiguous buffers, we allocate the buffers from that slot
 		 * and mark the entries as '0' indicating unavailable.
 		 */
-		if (io_tlb_list[index] >= nslots) {
+		if (io_tlb_list[SWIOTLB_LO][index] >= nslots) {
 			int count = 0;
 
 			for (i = index; i < (int) (index + nslots); i++)
-				io_tlb_list[i] = 0;
-			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && io_tlb_list[i]; i--)
-				io_tlb_list[i] = ++count;
-			tlb_addr = io_tlb_start + (index << IO_TLB_SHIFT);
+				io_tlb_list[SWIOTLB_LO][i] = 0;
+			for (i = index - 1;
+			     (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) &&
+			     io_tlb_list[SWIOTLB_LO][i];
+			     i--)
+				io_tlb_list[SWIOTLB_LO][i] = ++count;
+			tlb_addr = io_tlb_start[SWIOTLB_LO] + (index << IO_TLB_SHIFT);
 
 			/*
 			 * Update the indices to avoid searching in the next
 			 * round.
 			 */
-			io_tlb_index = ((index + nslots) < io_tlb_nslabs
+			io_tlb_index[SWIOTLB_LO] = ((index + nslots) < io_tlb_nslabs[SWIOTLB_LO]
 					? (index + nslots) : 0);
 
 			goto found;
 		}
 		index += stride;
-		if (index >= io_tlb_nslabs)
+		if (index >= io_tlb_nslabs[SWIOTLB_LO])
 			index = 0;
 	} while (index != wrap);
 
 not_found:
-	tmp_io_tlb_used = io_tlb_used;
+	tmp_io_tlb_used = io_tlb_used[SWIOTLB_LO];
 
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 	if (!(attrs & DMA_ATTR_NO_WARN) && printk_ratelimit())
 		dev_warn(hwdev, "swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-			 alloc_size, io_tlb_nslabs, tmp_io_tlb_used);
+			 alloc_size, io_tlb_nslabs[SWIOTLB_LO], tmp_io_tlb_used);
 	return (phys_addr_t)DMA_MAPPING_ERROR;
 found:
-	io_tlb_used += nslots;
+	io_tlb_used[SWIOTLB_LO] += nslots;
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 
 	/*
@@ -582,7 +586,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nslots; i++)
-		io_tlb_orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
+		io_tlb_orig_addr[SWIOTLB_LO][index+i] = orig_addr + (i << IO_TLB_SHIFT);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
@@ -599,8 +603,8 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 {
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	int index = (tlb_addr - io_tlb_start[SWIOTLB_LO]) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = io_tlb_orig_addr[SWIOTLB_LO][index];
 
 	/*
 	 * First, sync the memory before unmapping the entry
@@ -619,23 +623,26 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	spin_lock_irqsave(&io_tlb_lock, flags);
 	{
 		count = ((index + nslots) < ALIGN(index + 1, IO_TLB_SEGSIZE) ?
-			 io_tlb_list[index + nslots] : 0);
+			 io_tlb_list[SWIOTLB_LO][index + nslots] : 0);
 		/*
 		 * Step 1: return the slots to the free list, merging the
 		 * slots with superceeding slots
 		 */
 		for (i = index + nslots - 1; i >= index; i--) {
-			io_tlb_list[i] = ++count;
-			io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+			io_tlb_list[SWIOTLB_LO][i] = ++count;
+			io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
 		}
 		/*
 		 * Step 2: merge the returned slots with the preceding slots,
 		 * if available (non zero)
 		 */
-		for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE -1) && io_tlb_list[i]; i--)
-			io_tlb_list[i] = ++count;
+		for (i = index - 1;
+		     (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) &&
+		     io_tlb_list[SWIOTLB_LO][i];
+		     i--)
+			io_tlb_list[SWIOTLB_LO][i] = ++count;
 
-		io_tlb_used -= nslots;
+		io_tlb_used[SWIOTLB_LO] -= nslots;
 	}
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 }
@@ -644,8 +651,8 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	int index = (tlb_addr - io_tlb_start[SWIOTLB_LO]) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = io_tlb_orig_addr[SWIOTLB_LO][index];
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
@@ -716,7 +723,7 @@ bool is_swiotlb_active(void)
 	 * When SWIOTLB is initialized, even if io_tlb_start points to physical
 	 * address zero, io_tlb_end surely doesn't.
 	 */
-	return io_tlb_end != 0;
+	return io_tlb_end[SWIOTLB_LO] != 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -726,8 +733,8 @@ static int __init swiotlb_create_debugfs(void)
 	struct dentry *root;
 
 	root = debugfs_create_dir("swiotlb", NULL);
-	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs);
-	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used);
+	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs[SWIOTLB_LO]);
+	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used[SWIOTLB_LO]);
 	return 0;
 }
 
-- 
2.17.1

