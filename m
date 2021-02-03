Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CF30E7D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:49:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJLs0b6nzDwtJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=PDiUbWCP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=KBGnY6O3; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ6M39MCzDwps
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:38:44 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N9ap2053612;
 Wed, 3 Feb 2021 23:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZgEJ16guRlHHGFLq1GmEa8b8Efy41uKiY1bY40epmsE=;
 b=PDiUbWCP0RoZ0o+0J6rJ82slOeerEQmqJVyEs8T+MB0fEhBfsGsSWIwqwm28J2BUvfMx
 3GhIn5+GC36EMv3B+VM8eymanh0ykin4S75rWtxZb+QFNQX0rDCjGBMkI0gqEpThb/uJ
 omXeDMO5ZDETMdUqWYPREYpc2NzB5FOvEWNAiPEMQJZsFqltz8PS1ve57hK79BP8KK4b
 DuinwA5fzl1srAvdpLjmDRpWqzeNS//FSO2lsdaaIJ0gyw1cPeFQNM1t/UvVqio3m+kf
 z1APfuDaF+0akGUX1oM47qB6e84KdbL6F8Z7kQyYmoztKHNkrwYGfNqY3xw98XA5bYN8 TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 36cvyb2we9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:38:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NAc2x112310;
 Wed, 3 Feb 2021 23:38:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 36dhd0h9qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2V8N3xyJCDJeonH32RZQlVQ3jWrn+DzvYDIYPRzfZIPKWdEUnvGUWRxVzr3IaA2r5K0sWr+mMda2VvZm7i281mTPMbUVG13mzN/s1k9XOuo9nY2Mg/EwspJQHXt/SHYA+JawBEQKUWA+MsWyURkOC1WPrlN373wWxbwQ+KWI6Gj20e+tE5dawri4ldj4eqRPrL7ukb8LT5zoj0mXIraqp7Lqf5IFNnoMgjoVLFHKIspbQxHqI1LlI/3JnIHz4TC9O/M8oGnoQ5dzAOeKhzaLRy+Tmfy+uCNrDVpV8ifA8EpIuBGZdcF387gqZVG9XCO0PEJndUgfc55JZbpTP+1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgEJ16guRlHHGFLq1GmEa8b8Efy41uKiY1bY40epmsE=;
 b=BxlqyxLITubnbBrCASW+DgmsD6m5lKdslOGtcgEEA3klheiMkFHvokQofbOz36W3nPGaPJLWwNXiwA2SNvLNV2RUbvx0f01Ng2eqFTCBOKdRGHCimI4mPsEDZUXZJJcoUUrv93VEMkZSDAgTbQGErkEYr8GD+ioPY6hX62SUNgnW4WR4sipV3s89DhfAmy0habEz8BXbBVfXRAWxTD2A83d+RO57WUgWCrDAt/+VAaHzrgGkfCZA71AG4ZvBduMF5ucIdJKeklVOr0xRTEnNRqR8M6k6xcm1QBZ51X52bU+UDDWekmdVMhKv+06hgJ4ttuXReK6uARxAaPBRT7wxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgEJ16guRlHHGFLq1GmEa8b8Efy41uKiY1bY40epmsE=;
 b=KBGnY6O3w2Ms4RJHjtgtaazCdGmZA33iy4XS3yPOkIcJmhvgtc8iVvTVgW7SHkiLMzZl51Sgkh57gfkguYZmsGZyKFYiaK9TT3/BZLhPsYEJdeeSisnb6COfLtX1Pegj3wHT3kXKurwWCk8QT0mGt6ukgaUqj0X5ph+jt7Buq1U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:37:59 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:37:59 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 4/6] swiotlb: enable 64-bit swiotlb
Date: Wed,  3 Feb 2021 15:37:07 -0800
Message-Id: <20210203233709.19819-5-dongli.zhang@oracle.com>
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
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e551ef0-1c3f-43af-134e-08d8c89cbda4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB478471E7D05C4CA41F206321F0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbOoLbhvjEiDwHn8YwqCH2Td6GURxyVXGBbpEnzKivEpvSx1TMcc1tDPUXLm2G1iCCYpsHfGcyfK5XIBrrkdNzKgwWpTFllDUfRgGuhXvLvXV58G6oFYWt9hXdgAamvuPUnQbueb9oF8s4k2Ndyd8drmTH/hydLPayryGqY8IUH8ctaWDETvtZEy7xlWb5BaPjsTBQy8RUz4O6XNTteJa4m2yZrDk+fosLMy6sk6ILGjZhDX5dfs9P0N1l30DvDDuxo+gxdjtVqtQIA+KzaCMWiVtnMncLx04xkhSOhSQT7Qnz2cxkJMj74fTGRwZ/almYaVnuS044fZw21O+le6UKYMtMlcqp1ow9Uu6G+N+NXBNOZ+6+hdIlxFSuoeHWx+7RbD6FXUSP0ZGJqzqyCJTjR0vmTxyEkk2KXBPQamjbXTpMAXrWDBI2rwT9R6Qk/ENZ3Oh/c1xo9N0wZ24SeFO7M0dmWM5p9RYdcky2gtp4QKF3VCOb57QH/+F4WKnKPG/ZgKIISMZYgdgb1YGCNAMs5VmFkl8deuxiryaUTVtfdNfljtQG2h/TBV/LTWvwox9MMEmCOlbx4TlyJLcf5+81Fz24zPbZFUUumMxaXSCYvlwv3NrC9Y21FT63IIWAp9s158c5ATJozi/tWiZxsLiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(30864003)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002)(461764006)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JhNrVSwnivNA0yGVGvlva5dhTOSQih9UrxRsxZKz4yH6/lyJBR0Ta03BdYsi?=
 =?us-ascii?Q?Efizf+QiqksJDR/a50wFo0OxP+67Xc1taIThJ0dZoT0SeB10DaYsZxMSyv59?=
 =?us-ascii?Q?iND8s8vlQIQjB+asig/RVQdH48TcaDcEY2mpYNwLhhcy/IogpyMs3MjbHDtw?=
 =?us-ascii?Q?OFEvizRSi4XPnJkiA1KEUaA9lRq+0inM0ylqWxOjcSxyW+TxemaemDvNtyG9?=
 =?us-ascii?Q?H8P/MaJZqNB3g5ypXpOCXXcG5hxXx4N2lQIW1a3T0vL61EIULNSs81ubumzh?=
 =?us-ascii?Q?tLEwz1FCm4AXZMAXFn0IRkXXj0dVthKKuGFQaoPc9KRZNpSZBMrvEOgdAmPG?=
 =?us-ascii?Q?svt8Iu6gmUkmQQ4ff4hxoo7/sptgepb3AXrX/1LSl8RtOrzwUczumr2lRkYp?=
 =?us-ascii?Q?bL77QVcFLWNZbHkfvc8brSIY8Lpbs3EKOHXgOlFjMeETOH6Swou3eXPEvDCU?=
 =?us-ascii?Q?/6ijLg4w20HRk//A0yOmqeLhhrLn1iUxtFksdQ4ETSlXkpsofHKN6B2pzffC?=
 =?us-ascii?Q?4NhDRawkeZCnoeoM+I06xOZYnDfawcIMpYCKUPBdcONRVEIPO01LHUQvPAPC?=
 =?us-ascii?Q?0KvKVI9yINtDl33q3S90op3YH6MWHd3JucEZJeyy0gtk7w8NWmQ6Xd01r262?=
 =?us-ascii?Q?QP13TUfZkrPwREs3TMnlr9ujfTFZ/BX7txjmf1eDDwJQQZG6iQCKBxROhMAV?=
 =?us-ascii?Q?fx32ZMYy4GUlunJ++cB6bd5eHgucUERVOXFBQaOlxz8CELVKxm4r8JHJrFgF?=
 =?us-ascii?Q?mJh9BgiZC0qoLmZR1/VJ6CmJKrhbboog5/COx7T4RcUAN8b34i3dcjhsqdPs?=
 =?us-ascii?Q?15bBiXV84rDDITpi5ZcztoLQUQrIgZ9uYkXsbCaOHreg6l1SVMUuwUuzkRtQ?=
 =?us-ascii?Q?j4SbOjDgRCxZB/FGNPv9UUpo7O+5TVxxzpcxTlnwxaB06uzKn7bGkTsMnNON?=
 =?us-ascii?Q?yPKQbk+muWeYNpIAMVqSHMnVoS+g/0TxEcmkZ/Ypwt+8utMehD9qEZ4rRLdh?=
 =?us-ascii?Q?Sm1BDIlsIvGoJWYx3QAouthQZOsiA5slqflXe3+vPcLLBXno4lEtbqGRij85?=
 =?us-ascii?Q?zIrxnGER?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e551ef0-1c3f-43af-134e-08d8c89cbda4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:37:59.7094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0/PqwuIPm+eM+UxJJTP5oTDHWgjhBJlGqrrr8kTAtm9rHRs7gOc3APX+g8HPiptyPbadCkPBGWyyZPafVE50A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
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

This patch is to enable the 64-bit swiotlb buffer.

The state of the art swiotlb pre-allocates <=32-bit memory in order to meet
the DMA mask requirement for some 32-bit legacy device. Considering most
devices nowadays support 64-bit DMA and IOMMU is available, the swiotlb is
not used for most of the times, except:

1. The xen PVM domain requires the DMA addresses to both (1) less than the
dma mask, and (2) continuous in machine address. Therefore, the 64-bit
device may still require swiotlb on PVM domain.

2. From source code the AMD SME/SEV will enable SWIOTLB_FORCE. As a result
it is always required to allocate from swiotlb buffer even the device dma
mask is 64-bit.

sme_early_init()
-> if (sev_active())
   swiotlb_force = SWIOTLB_FORCE;

Therefore, this patch introduces the 2nd swiotlb buffer for 64-bit DMA
access. For instance, the swiotlb_tbl_map_single() allocates from the 2nd
64-bit buffer if the device DMA mask is
min_not_zero(*hwdev->dma_mask, hwdev->bus_dma_limit).

The example to configure 64-bit swiotlb is "swiotlb=65536,524288,force"
or "swiotlb=,524288,force", where 524288 is the size of 64-bit buffer.

With the patch, the kernel will be able to allocate >4GB swiotlb buffer.
This patch is only for swiotlb, not including xen-swiotlb.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/mips/cavium-octeon/dma-octeon.c         |   3 +-
 arch/powerpc/kernel/dma-swiotlb.c            |   2 +-
 arch/powerpc/platforms/pseries/svm.c         |   2 +-
 arch/x86/kernel/pci-swiotlb.c                |   5 +-
 arch/x86/pci/sta2x11-fixup.c                 |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c |   4 +-
 drivers/gpu/drm/i915/i915_scatterlist.h      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        |   2 +-
 drivers/mmc/host/sdhci.c                     |   2 +-
 drivers/pci/xen-pcifront.c                   |   2 +-
 drivers/xen/swiotlb-xen.c                    |   9 +-
 include/linux/swiotlb.h                      |  28 +-
 kernel/dma/swiotlb.c                         | 339 +++++++++++--------
 13 files changed, 238 insertions(+), 164 deletions(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index df70308db0e6..3480555d908a 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -245,6 +245,7 @@ void __init plat_swiotlb_setup(void)
 		panic("%s: Failed to allocate %zu bytes align=%lx\n",
 		      __func__, swiotlbsize, PAGE_SIZE);
 
-	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlb_nslabs, 1) == -ENOMEM)
+	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlb_nslabs,
+				  SWIOTLB_LO, 1) == -ENOMEM)
 		panic("Cannot allocate SWIOTLB buffer");
 }
diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-swiotlb.c
index fc7816126a40..88113318c53f 100644
--- a/arch/powerpc/kernel/dma-swiotlb.c
+++ b/arch/powerpc/kernel/dma-swiotlb.c
@@ -20,7 +20,7 @@ void __init swiotlb_detect_4g(void)
 static int __init check_swiotlb_enabled(void)
 {
 	if (ppc_swiotlb_enable)
-		swiotlb_print_info();
+		swiotlb_print_info(SWIOTLB_LO);
 	else
 		swiotlb_exit();
 
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 9f8842d0da1f..77910e4ffad8 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -52,7 +52,7 @@ void __init svm_swiotlb_init(void)
 	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
+	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, SWIOTLB_LO, false))
 		return;
 
 	if (io_tlb_start[SWIOTLB_LO])
diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
index c2cfa5e7c152..950624fd95a4 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -67,12 +67,15 @@ void __init pci_swiotlb_init(void)
 
 void __init pci_swiotlb_late_init(void)
 {
+	int i;
+
 	/* An IOMMU turned us off. */
 	if (!swiotlb)
 		swiotlb_exit();
 	else {
 		printk(KERN_INFO "PCI-DMA: "
 		       "Using software bounce buffering for IO (SWIOTLB)\n");
-		swiotlb_print_info();
+		for (i = 0; i < swiotlb_nr; i++)
+			swiotlb_print_info(i);
 	}
 }
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index 7d2525691854..c440520b2055 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_late_init_with_default_size(size))
+		if (swiotlb_late_init_with_default_size(size), SWIOTLB_LO)
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ad22f42541bd..947683f2e568 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,10 +42,10 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (swiotlb_nr_tbl()) {
+	if (swiotlb_nr_tbl(SWIOTLB_LO)) {
 		unsigned int max_segment;
 
-		max_segment = swiotlb_max_segment();
+		max_segment = swiotlb_max_segment(SWIOTLB_LO);
 		if (max_segment) {
 			max_segment = max_t(unsigned int, max_segment,
 					    PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 9cb26a224034..c63c7f6941f6 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -118,7 +118,7 @@ static inline unsigned int i915_sg_page_sizes(struct scatterlist *sg)
 
 static inline unsigned int i915_sg_segment_size(void)
 {
-	unsigned int size = swiotlb_max_segment();
+	unsigned int size = swiotlb_max_segment(SWIOTLB_LO);
 
 	if (size == 0)
 		size = UINT_MAX;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index a37bc3d7b38b..0919b207ac47 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = !!swiotlb_nr_tbl();
+	need_swiotlb = !!swiotlb_nr_tbl(SWIOTLB_LO);
 #endif
 
 	ret = ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 646823ddd317..1f7fb912d5a9 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4582,7 +4582,7 @@ int sdhci_setup_host(struct sdhci_host *host)
 		mmc->max_segs = SDHCI_MAX_SEGS;
 	} else if (host->flags & SDHCI_USE_SDMA) {
 		mmc->max_segs = 1;
-		if (swiotlb_max_segment()) {
+		if (swiotlb_max_segment(SWIOTLB_LO)) {
 			unsigned int max_req_size = (1 << IO_TLB_SHIFT) *
 						IO_TLB_SEGSIZE;
 			mmc->max_req_size = min(mmc->max_req_size,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index c6fe0cfec0f6..9509ed9b4126 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !swiotlb_nr_tbl()) {
+	if (!err && !swiotlb_nr_tbl(SWIOTLB_LO)) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 3261880ad859..662638093542 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -184,7 +184,7 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
 	unsigned int repeat = 3;
 
-	xen_io_tlb_nslabs = swiotlb_nr_tbl();
+	xen_io_tlb_nslabs = swiotlb_nr_tbl(SWIOTLB_LO);
 retry:
 	bytes = xen_set_nslabs(xen_io_tlb_nslabs);
 	order = get_order(xen_io_tlb_nslabs << IO_TLB_SHIFT);
@@ -245,16 +245,17 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	}
 	if (early) {
 		if (swiotlb_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs,
-			 verbose))
+					  SWIOTLB_LO, verbose))
 			panic("Cannot allocate SWIOTLB buffer");
 		rc = 0;
 	} else
-		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs);
+		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start,
+						xen_io_tlb_nslabs, SWIOTLB_LO);
 
 end:
 	xen_io_tlb_end = xen_io_tlb_start + bytes;
 	if (!rc)
-		swiotlb_set_max_segment(PAGE_SIZE);
+		swiotlb_set_max_segment(PAGE_SIZE, SWIOTLB_LO);
 
 	return rc;
 error:
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3d5980d77810..8ba45fddfb14 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -43,11 +43,14 @@ extern int swiotlb_nr;
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
 extern void swiotlb_init(int verbose);
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
-extern unsigned long swiotlb_nr_tbl(void);
+int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
+			  enum swiotlb_t type, int verbose);
+extern unsigned long swiotlb_nr_tbl(enum swiotlb_t type);
 unsigned long swiotlb_size_or_default(void);
-extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-extern int swiotlb_late_init_with_default_size(size_t default_size);
+extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs,
+				      enum swiotlb_t type);
+extern int swiotlb_late_init_with_default_size(size_t default_size,
+					       enum swiotlb_t type);
 extern void __init swiotlb_update_mem_attributes(void);
 
 /*
@@ -83,8 +86,13 @@ extern phys_addr_t io_tlb_start[], io_tlb_end[];
 
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	return paddr >= io_tlb_start[SWIOTLB_LO] &&
-	       paddr < io_tlb_end[SWIOTLB_LO];
+	int i;
+
+	for (i = 0; i < swiotlb_nr; i++)
+		if (paddr >= io_tlb_start[i] && paddr < io_tlb_end[i])
+			return true;
+
+	return false;
 }
 
 static inline int swiotlb_get_type(phys_addr_t paddr)
@@ -99,7 +107,7 @@ static inline int swiotlb_get_type(phys_addr_t paddr)
 }
 
 void __init swiotlb_exit(void);
-unsigned int swiotlb_max_segment(void);
+unsigned int swiotlb_max_segment(enum swiotlb_t type);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
 void __init swiotlb_adjust_size(unsigned long new_size);
@@ -112,7 +120,7 @@ static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 static inline void swiotlb_exit(void)
 {
 }
-static inline unsigned int swiotlb_max_segment(void)
+static inline unsigned int swiotlb_max_segment(enum swiotlb_t type)
 {
 	return 0;
 }
@@ -131,7 +139,7 @@ static inline void swiotlb_adjust_size(unsigned long new_size)
 }
 #endif /* CONFIG_SWIOTLB */
 
-extern void swiotlb_print_info(void);
-extern void swiotlb_set_max_segment(unsigned int);
+extern void swiotlb_print_info(enum swiotlb_t type);
+extern void swiotlb_set_max_segment(unsigned int val, enum swiotlb_t type);
 
 #endif /* __LINUX_SWIOTLB_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c91d3d2c3936..cd28db5b016a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -111,6 +111,11 @@ static int late_alloc;
 
 int swiotlb_nr = 1;
 
+static const char * const swiotlb_name[] = {
+	"Low Mem",
+	"High Mem"
+};
+
 static int __init
 setup_io_tlb_npages(char *str)
 {
@@ -121,11 +126,25 @@ setup_io_tlb_npages(char *str)
 	}
 	if (*str == ',')
 		++str;
+
+	if (isdigit(*str)) {
+		io_tlb_nslabs[SWIOTLB_HI] = simple_strtoul(str, &str, 0);
+		/* avoid tail segment of size < IO_TLB_SEGSIZE */
+		io_tlb_nslabs[SWIOTLB_HI] = ALIGN(io_tlb_nslabs[SWIOTLB_HI], IO_TLB_SEGSIZE);
+
+		swiotlb_nr = 2;
+	}
+
+	if (*str == ',')
+		++str;
+
 	if (!strcmp(str, "force")) {
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
 		io_tlb_nslabs[SWIOTLB_LO] = 1;
+		if (swiotlb_nr > 1)
+			io_tlb_nslabs[SWIOTLB_HI] = 1;
 	}
 
 	return 0;
@@ -134,24 +153,24 @@ early_param("swiotlb", setup_io_tlb_npages);
 
 static bool no_iotlb_memory[SWIOTLB_MAX];
 
-unsigned long swiotlb_nr_tbl(void)
+unsigned long swiotlb_nr_tbl(enum swiotlb_t type)
 {
-	return unlikely(no_iotlb_memory[SWIOTLB_LO]) ? 0 : io_tlb_nslabs[SWIOTLB_LO];
+	return unlikely(no_iotlb_memory[type]) ? 0 : io_tlb_nslabs[type];
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
-unsigned int swiotlb_max_segment(void)
+unsigned int swiotlb_max_segment(enum swiotlb_t type)
 {
-	return unlikely(no_iotlb_memory[SWIOTLB_LO]) ? 0 : max_segment[SWIOTLB_LO];
+	return unlikely(no_iotlb_memory[type]) ? 0 : max_segment[type];
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
-void swiotlb_set_max_segment(unsigned int val)
+void swiotlb_set_max_segment(unsigned int val, enum swiotlb_t type)
 {
 	if (swiotlb_force == SWIOTLB_FORCE)
-		max_segment[SWIOTLB_LO] = 1;
+		max_segment[type] = 1;
 	else
-		max_segment[SWIOTLB_LO] = rounddown(val, PAGE_SIZE);
+		max_segment[type] = rounddown(val, PAGE_SIZE);
 }
 
 unsigned long swiotlb_size_or_default(void)
@@ -181,18 +200,18 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 	}
 }
 
-void swiotlb_print_info(void)
+void swiotlb_print_info(enum swiotlb_t type)
 {
-	unsigned long bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
+	unsigned long bytes = io_tlb_nslabs[type] << IO_TLB_SHIFT;
 
-	if (no_iotlb_memory[SWIOTLB_LO]) {
-		pr_warn("No low mem\n");
+	if (no_iotlb_memory[type]) {
+		pr_warn("No low mem with %s\n", swiotlb_name[type]);
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n",
-		&io_tlb_start[SWIOTLB_LO], &io_tlb_end[SWIOTLB_LO],
-		bytes >> 20);
+	pr_info("%s mapped [mem %pa-%pa] (%luMB)\n",
+		swiotlb_name[type],
+		&io_tlb_start[type], &io_tlb_end[type], bytes >> 20);
 }
 
 /*
@@ -205,88 +224,104 @@ void __init swiotlb_update_mem_attributes(void)
 {
 	void *vaddr;
 	unsigned long bytes;
+	int i;
 
-	if (no_iotlb_memory[SWIOTLB_LO] || late_alloc)
-		return;
+	for (i = 0; i < swiotlb_nr; i++) {
+		if (no_iotlb_memory[i] || late_alloc)
+			continue;
 
-	vaddr = phys_to_virt(io_tlb_start[SWIOTLB_LO]);
-	bytes = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
-	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
-	memset(vaddr, 0, bytes);
+		vaddr = phys_to_virt(io_tlb_start[i]);
+		bytes = PAGE_ALIGN(io_tlb_nslabs[i] << IO_TLB_SHIFT);
+		set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
+		memset(vaddr, 0, bytes);
+	}
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
+int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
+				 enum swiotlb_t type, int verbose)
 {
 	unsigned long i, bytes;
 	size_t alloc_size;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs[SWIOTLB_LO] = nslabs;
-	io_tlb_start[SWIOTLB_LO] = __pa(tlb);
-	io_tlb_end[SWIOTLB_LO] = io_tlb_start[SWIOTLB_LO] + bytes;
+	io_tlb_nslabs[type] = nslabs;
+	io_tlb_start[type] = __pa(tlb);
+	io_tlb_end[type] = io_tlb_start[type] + bytes;
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
 	 * between io_tlb_start and io_tlb_end.
 	 */
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int));
-	io_tlb_list[SWIOTLB_LO] = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_list[SWIOTLB_LO])
+	alloc_size = PAGE_ALIGN(io_tlb_nslabs[type] * sizeof(int));
+	io_tlb_list[type] = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!io_tlb_list[type])
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t));
-	io_tlb_orig_addr[SWIOTLB_LO] = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_addr[SWIOTLB_LO])
+	alloc_size = PAGE_ALIGN(io_tlb_nslabs[type] * sizeof(phys_addr_t));
+	io_tlb_orig_addr[type] = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!io_tlb_orig_addr[type])
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	for (i = 0; i < io_tlb_nslabs[SWIOTLB_LO]; i++) {
-		io_tlb_list[SWIOTLB_LO][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < io_tlb_nslabs[type]; i++) {
+		io_tlb_list[type][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		io_tlb_orig_addr[type][i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index[SWIOTLB_LO] = 0;
-	no_iotlb_memory[SWIOTLB_LO] = false;
+	io_tlb_index[type] = 0;
+	no_iotlb_memory[type] = false;
 
 	if (verbose)
-		swiotlb_print_info();
+		swiotlb_print_info(type);
 
-	swiotlb_set_max_segment(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(io_tlb_nslabs[type] << IO_TLB_SHIFT, type);
 	return 0;
 }
 
-/*
- * Statically reserve bounce buffer space and initialize bounce buffer data
- * structures for the software IO TLB used to implement the DMA API.
- */
-void  __init
-swiotlb_init(int verbose)
+static void __init
+swiotlb_init_type(enum swiotlb_t type, int verbose)
 {
 	size_t default_size = IO_TLB_DEFAULT_SIZE;
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs[SWIOTLB_LO]) {
-		io_tlb_nslabs[SWIOTLB_LO] = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
+	if (!io_tlb_nslabs[type]) {
+		io_tlb_nslabs[type] = (default_size >> IO_TLB_SHIFT);
+		io_tlb_nslabs[type] = ALIGN(io_tlb_nslabs[type], IO_TLB_SEGSIZE);
 	}
 
-	bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
+	bytes = io_tlb_nslabs[type] << IO_TLB_SHIFT;
+
+	if (type == SWIOTLB_LO)
+		vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
+	else
+		vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 
-	/* Get IO TLB memory from the low pages */
-	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs[SWIOTLB_LO], verbose))
+	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs[type], type, verbose))
 		return;
 
-	if (io_tlb_start[SWIOTLB_LO]) {
-		memblock_free_early(io_tlb_start[SWIOTLB_LO],
-				    PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
-		io_tlb_start[SWIOTLB_LO] = 0;
+	if (io_tlb_start[type]) {
+		memblock_free_early(io_tlb_start[type],
+				    PAGE_ALIGN(io_tlb_nslabs[type] << IO_TLB_SHIFT));
+		io_tlb_start[type] = 0;
 	}
-	pr_warn("Cannot allocate buffer");
-	no_iotlb_memory[SWIOTLB_LO] = true;
+	pr_warn("Cannot allocate buffer %s\n", swiotlb_name[type]);
+	no_iotlb_memory[type] = true;
+}
+
+/*
+ * Statically reserve bounce buffer space and initialize bounce buffer data
+ * structures for the software IO TLB used to implement the DMA API.
+ */
+void  __init
+swiotlb_init(int verbose)
+{
+	int i;
+
+	for (i = 0; i < swiotlb_nr; i++)
+		swiotlb_init_type(i, verbose);
 }
 
 /*
@@ -295,67 +330,68 @@ swiotlb_init(int verbose)
  * This should be just like above, but with some error catching.
  */
 int
-swiotlb_late_init_with_default_size(size_t default_size)
+swiotlb_late_init_with_default_size(size_t default_size, enum swiotlb_t type)
 {
-	unsigned long bytes, req_nslabs = io_tlb_nslabs[SWIOTLB_LO];
+	unsigned long bytes, req_nslabs = io_tlb_nslabs[type];
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
+	gfp_t gfp_mask = (type == SWIOTLB_LO) ? GFP_DMA | __GFP_NOWARN :
+						GFP_KERNEL | __GFP_NOWARN;
 
-	if (!io_tlb_nslabs[SWIOTLB_LO]) {
-		io_tlb_nslabs[SWIOTLB_LO] = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs[SWIOTLB_LO] = ALIGN(io_tlb_nslabs[SWIOTLB_LO], IO_TLB_SEGSIZE);
+	if (!io_tlb_nslabs[type]) {
+		io_tlb_nslabs[type] = (default_size >> IO_TLB_SHIFT);
+		io_tlb_nslabs[type] = ALIGN(io_tlb_nslabs[type], IO_TLB_SEGSIZE);
 	}
 
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
-	io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
-	bytes = io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT;
+	order = get_order(io_tlb_nslabs[type] << IO_TLB_SHIFT);
+	io_tlb_nslabs[type] = SLABS_PER_PAGE << order;
+	bytes = io_tlb_nslabs[type] << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
-						  order);
+		vstart = (void *)__get_free_pages(gfp_mask, order);
 		if (vstart)
 			break;
 		order--;
 	}
 
 	if (!vstart) {
-		io_tlb_nslabs[SWIOTLB_LO] = req_nslabs;
+		io_tlb_nslabs[type] = req_nslabs;
 		return -ENOMEM;
 	}
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		io_tlb_nslabs[SWIOTLB_LO] = SLABS_PER_PAGE << order;
+		io_tlb_nslabs[type] = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs[SWIOTLB_LO]);
+	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs[type], type);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
 	return rc;
 }
 
-static void swiotlb_cleanup(void)
+static void swiotlb_cleanup(enum swiotlb_t type)
 {
-	io_tlb_end[SWIOTLB_LO] = 0;
-	io_tlb_start[SWIOTLB_LO] = 0;
-	io_tlb_nslabs[SWIOTLB_LO] = 0;
-	max_segment[SWIOTLB_LO] = 0;
+	io_tlb_end[type] = 0;
+	io_tlb_start[type] = 0;
+	io_tlb_nslabs[type] = 0;
+	max_segment[type] = 0;
 }
 
 int
-swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
+swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs, enum swiotlb_t type)
 {
 	unsigned long i, bytes;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs[SWIOTLB_LO] = nslabs;
-	io_tlb_start[SWIOTLB_LO] = virt_to_phys(tlb);
-	io_tlb_end[SWIOTLB_LO] = io_tlb_start[SWIOTLB_LO] + bytes;
+	io_tlb_nslabs[type] = nslabs;
+	io_tlb_start[type] = virt_to_phys(tlb);
+	io_tlb_end[type] = io_tlb_start[type] + bytes;
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
@@ -365,63 +401,67 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
 	 * between io_tlb_start and io_tlb_end.
 	 */
-	io_tlb_list[SWIOTLB_LO] = (unsigned int *)__get_free_pages(GFP_KERNEL,
-			get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
-	if (!io_tlb_list[SWIOTLB_LO])
+	io_tlb_list[type] = (unsigned int *)__get_free_pages(GFP_KERNEL,
+			get_order(io_tlb_nslabs[type] * sizeof(int)));
+	if (!io_tlb_list[type])
 		goto cleanup3;
 
-	io_tlb_orig_addr[SWIOTLB_LO] = (phys_addr_t *)
+	io_tlb_orig_addr[type] = (phys_addr_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs[SWIOTLB_LO] *
+				 get_order(io_tlb_nslabs[type] *
 					   sizeof(phys_addr_t)));
-	if (!io_tlb_orig_addr[SWIOTLB_LO])
+	if (!io_tlb_orig_addr[type])
 		goto cleanup4;
 
-	for (i = 0; i < io_tlb_nslabs[SWIOTLB_LO]; i++) {
-		io_tlb_list[SWIOTLB_LO][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < io_tlb_nslabs[type]; i++) {
+		io_tlb_list[type][i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		io_tlb_orig_addr[type][i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index[SWIOTLB_LO] = 0;
-	no_iotlb_memory[SWIOTLB_LO] = false;
+	io_tlb_index[type] = 0;
+	no_iotlb_memory[type] = false;
 
-	swiotlb_print_info();
+	swiotlb_print_info(type);
 
 	late_alloc = 1;
 
-	swiotlb_set_max_segment(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(io_tlb_nslabs[type] << IO_TLB_SHIFT, type);
 
 	return 0;
 
 cleanup4:
-	free_pages((unsigned long)io_tlb_list[SWIOTLB_LO], get_order(io_tlb_nslabs[SWIOTLB_LO] *
+	free_pages((unsigned long)io_tlb_list[type], get_order(io_tlb_nslabs[type] *
 	                                                 sizeof(int)));
-	io_tlb_list[SWIOTLB_LO] = NULL;
+	io_tlb_list[type] = NULL;
 cleanup3:
-	swiotlb_cleanup();
+	swiotlb_cleanup(type);
 	return -ENOMEM;
 }
 
 void __init swiotlb_exit(void)
 {
-	if (!io_tlb_orig_addr[SWIOTLB_LO])
-		return;
+	int i;
 
-	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_orig_addr[SWIOTLB_LO],
-			   get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t)));
-		free_pages((unsigned long)io_tlb_list[SWIOTLB_LO],
-			   get_order(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(io_tlb_start[SWIOTLB_LO]),
-			   get_order(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
-	} else {
-		memblock_free_late(__pa(io_tlb_orig_addr[SWIOTLB_LO]),
-				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_list[SWIOTLB_LO]),
-				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] * sizeof(int)));
-		memblock_free_late(io_tlb_start[SWIOTLB_LO],
-				   PAGE_ALIGN(io_tlb_nslabs[SWIOTLB_LO] << IO_TLB_SHIFT));
+	for (i = 0; i < swiotlb_nr; i++) {
+		if (!io_tlb_orig_addr[i])
+			continue;
+
+		if (late_alloc) {
+			free_pages((unsigned long)io_tlb_orig_addr[i],
+				   get_order(io_tlb_nslabs[i] * sizeof(phys_addr_t)));
+			free_pages((unsigned long)io_tlb_list[i],
+				   get_order(io_tlb_nslabs[i] * sizeof(int)));
+			free_pages((unsigned long)phys_to_virt(io_tlb_start[i]),
+				   get_order(io_tlb_nslabs[i] << IO_TLB_SHIFT));
+		} else {
+			memblock_free_late(__pa(io_tlb_orig_addr[i]),
+					   PAGE_ALIGN(io_tlb_nslabs[i] * sizeof(phys_addr_t)));
+			memblock_free_late(__pa(io_tlb_list[i]),
+					   PAGE_ALIGN(io_tlb_nslabs[i] * sizeof(int)));
+			memblock_free_late(io_tlb_start[i],
+					   PAGE_ALIGN(io_tlb_nslabs[i] << IO_TLB_SHIFT));
+		}
+		swiotlb_cleanup(i);
 	}
-	swiotlb_cleanup();
 }
 
 /*
@@ -468,7 +508,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start[SWIOTLB_LO]);
+	dma_addr_t tbl_dma_addr;
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -477,8 +517,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	unsigned long offset_slots;
 	unsigned long max_slots;
 	unsigned long tmp_io_tlb_used;
+	unsigned long dma_mask = min_not_zero(*hwdev->dma_mask,
+					      hwdev->bus_dma_limit);
+	int type;
 
-	if (no_iotlb_memory[SWIOTLB_LO])
+	if (swiotlb_nr > 1 && dma_mask == DMA_BIT_MASK(64))
+		type = SWIOTLB_HI;
+	else
+		type = SWIOTLB_LO;
+
+	if (no_iotlb_memory[type])
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
 	if (mem_encrypt_active())
@@ -490,6 +538,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
+	tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start[type]);
+
 	mask = dma_get_seg_boundary(hwdev);
 
 	tbl_dma_addr &= mask;
@@ -521,11 +571,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 */
 	spin_lock_irqsave(&io_tlb_lock, flags);
 
-	if (unlikely(nslots > io_tlb_nslabs[SWIOTLB_LO] - io_tlb_used[SWIOTLB_LO]))
+	if (unlikely(nslots > io_tlb_nslabs[type] - io_tlb_used[type]))
 		goto not_found;
 
-	index = ALIGN(io_tlb_index[SWIOTLB_LO], stride);
-	if (index >= io_tlb_nslabs[SWIOTLB_LO])
+	index = ALIGN(io_tlb_index[type], stride);
+	if (index >= io_tlb_nslabs[type])
 		index = 0;
 	wrap = index;
 
@@ -533,7 +583,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		while (iommu_is_span_boundary(index, nslots, offset_slots,
 					      max_slots)) {
 			index += stride;
-			if (index >= io_tlb_nslabs[SWIOTLB_LO])
+			if (index >= io_tlb_nslabs[type])
 				index = 0;
 			if (index == wrap)
 				goto not_found;
@@ -544,42 +594,42 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		 * contiguous buffers, we allocate the buffers from that slot
 		 * and mark the entries as '0' indicating unavailable.
 		 */
-		if (io_tlb_list[SWIOTLB_LO][index] >= nslots) {
+		if (io_tlb_list[type][index] >= nslots) {
 			int count = 0;
 
 			for (i = index; i < (int) (index + nslots); i++)
-				io_tlb_list[SWIOTLB_LO][i] = 0;
+				io_tlb_list[type][i] = 0;
 			for (i = index - 1;
 			     (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) &&
-			     io_tlb_list[SWIOTLB_LO][i];
+			     io_tlb_list[type][i];
 			     i--)
-				io_tlb_list[SWIOTLB_LO][i] = ++count;
-			tlb_addr = io_tlb_start[SWIOTLB_LO] + (index << IO_TLB_SHIFT);
+				io_tlb_list[type][i] = ++count;
+			tlb_addr = io_tlb_start[type] + (index << IO_TLB_SHIFT);
 
 			/*
 			 * Update the indices to avoid searching in the next
 			 * round.
 			 */
-			io_tlb_index[SWIOTLB_LO] = ((index + nslots) < io_tlb_nslabs[SWIOTLB_LO]
+			io_tlb_index[type] = ((index + nslots) < io_tlb_nslabs[type]
 					? (index + nslots) : 0);
 
 			goto found;
 		}
 		index += stride;
-		if (index >= io_tlb_nslabs[SWIOTLB_LO])
+		if (index >= io_tlb_nslabs[type])
 			index = 0;
 	} while (index != wrap);
 
 not_found:
-	tmp_io_tlb_used = io_tlb_used[SWIOTLB_LO];
+	tmp_io_tlb_used = io_tlb_used[type];
 
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 	if (!(attrs & DMA_ATTR_NO_WARN) && printk_ratelimit())
-		dev_warn(hwdev, "swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-			 alloc_size, io_tlb_nslabs[SWIOTLB_LO], tmp_io_tlb_used);
+		dev_warn(hwdev, "%s swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
+			 swiotlb_name[type], alloc_size, io_tlb_nslabs[type], tmp_io_tlb_used);
 	return (phys_addr_t)DMA_MAPPING_ERROR;
 found:
-	io_tlb_used[SWIOTLB_LO] += nslots;
+	io_tlb_used[type] += nslots;
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 
 	/*
@@ -588,7 +638,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nslots; i++)
-		io_tlb_orig_addr[SWIOTLB_LO][index+i] = orig_addr + (i << IO_TLB_SHIFT);
+		io_tlb_orig_addr[type][index+i] = orig_addr + (i << IO_TLB_SHIFT);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
@@ -605,8 +655,9 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 {
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
-	int index = (tlb_addr - io_tlb_start[SWIOTLB_LO]) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[SWIOTLB_LO][index];
+	int type = swiotlb_get_type(tlb_addr);
+	int index = (tlb_addr - io_tlb_start[type]) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = io_tlb_orig_addr[type][index];
 
 	/*
 	 * First, sync the memory before unmapping the entry
@@ -625,14 +676,14 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	spin_lock_irqsave(&io_tlb_lock, flags);
 	{
 		count = ((index + nslots) < ALIGN(index + 1, IO_TLB_SEGSIZE) ?
-			 io_tlb_list[SWIOTLB_LO][index + nslots] : 0);
+			 io_tlb_list[type][index + nslots] : 0);
 		/*
 		 * Step 1: return the slots to the free list, merging the
 		 * slots with superceeding slots
 		 */
 		for (i = index + nslots - 1; i >= index; i--) {
-			io_tlb_list[SWIOTLB_LO][i] = ++count;
-			io_tlb_orig_addr[SWIOTLB_LO][i] = INVALID_PHYS_ADDR;
+			io_tlb_list[type][i] = ++count;
+			io_tlb_orig_addr[type][i] = INVALID_PHYS_ADDR;
 		}
 		/*
 		 * Step 2: merge the returned slots with the preceding slots,
@@ -640,11 +691,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 		 */
 		for (i = index - 1;
 		     (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) &&
-		     io_tlb_list[SWIOTLB_LO][i];
+		     io_tlb_list[type][i];
 		     i--)
-			io_tlb_list[SWIOTLB_LO][i] = ++count;
+			io_tlb_list[type][i] = ++count;
 
-		io_tlb_used[SWIOTLB_LO] -= nslots;
+		io_tlb_used[type] -= nslots;
 	}
 	spin_unlock_irqrestore(&io_tlb_lock, flags);
 }
@@ -653,8 +704,9 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start[SWIOTLB_LO]) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[SWIOTLB_LO][index];
+	int type = swiotlb_get_type(tlb_addr);
+	int index = (tlb_addr - io_tlb_start[type]) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = io_tlb_orig_addr[type][index];
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
@@ -737,6 +789,15 @@ static int __init swiotlb_create_debugfs(void)
 	root = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs[SWIOTLB_LO]);
 	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used[SWIOTLB_LO]);
+
+	if (swiotlb_nr == 1)
+		return 0;
+
+	debugfs_create_ulong("io_tlb_nslabs-highmem", 0400,
+			     root, &io_tlb_nslabs[SWIOTLB_HI]);
+	debugfs_create_ulong("io_tlb_used-highmem", 0400,
+			     root, &io_tlb_used[SWIOTLB_HI]);
+
 	return 0;
 }
 
-- 
2.17.1

