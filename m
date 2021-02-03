Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E830E7CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:48:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWJK312pgzDwr8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 10:48:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=NQGceTWc; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=tjvCr9fE; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWJ6M2JlmzDwpq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 10:38:44 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113N8wg9103664;
 Wed, 3 Feb 2021 23:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=cOkwV9kqyN08qwK1NmwlE/kmA1LrE5vAxbf45V3rJbU=;
 b=NQGceTWcGnFSzxuNLWlAT7ftp0+qtrFa+QqxyH4luxuOx/4CbpdhaoE1Woq2H+KFeerO
 qHYOHjtQMoRtQcteMlRdRh0gRMZKRjAll6TtCIhagOKGAtHQK+a4RnXZyZtxYS+eWhO7
 Q9zk3YuYVHCYkJer6I5mEs0RWCDyNsLtfty3ihQJahSEH+AOAXeery6C8G+lw+Wve6VO
 RrakFbj29sTk1eqKCA6k7frw/kNvX2KNbYKUY73dlVBQUUazqqcpjvB7x1UWhf7Oxjls
 +JVF9g5XDO8m4yApyiGveb+BwV1HXWmNq5cuIY7dNvj4EEXadoMkUTRMO+SamF8ipE9/ zQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cydm2q16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 113NAbHS112134;
 Wed, 3 Feb 2021 23:37:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 36dhd0h98t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 23:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzeUWNcU9Mj4e0TYMjDEEa04Puyz6RPQSjKZYKBWfmB0YwXGpAgYd9oM8VKYP8KXENITMV8yDMjP8CYacJPwv8DWmD4pSTiPOoRhlSV0oSyx0fWkiuokgpZ+MNc10AjBFlPN3fS6+wmdDwxaSMmr3AWXeIHjleiC2b90oOD5l7lecsd4TJ9inlejRmA0LhPrJE+i4qIR9reLEtuATKI0CpBOk/U9dhS+oomHA0MkWrlzRvDNVn3m/crta3/rFfJdhqMD/lwZ4mioO+D+XS7pQ9BYpw2e4rYERQEKbrZv9QIBXA98liYSs+uPxvIe4cpX6aBF1q3jWKa57MKtPPxTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOkwV9kqyN08qwK1NmwlE/kmA1LrE5vAxbf45V3rJbU=;
 b=oRgVV+HDbkWsmdM/NCIX14g0sj7/IHgOUpcV3ziyxhzl7Gd9U6OrO+hsNKg1+9hy5LFfkCdBPZ67Gvymn2hvh0EzIWmwXrCGTGCBKlXzcua2sNyEM6w6d04IriWe5nKG8hbefsrZXYHtfl+nck4edJFi/egB74dCn39TyjYaAlQT5uc3NlHVNJY8OU7o92ZDnbztY0QqnurGr2ImA4x5GETYQOsOk+i8iBEMYO2ycotIs7s6a2T4+epsSq3dofegTAZpSmjSlWo9yQ7cTq2AF75IrKWjRMvAxpe2iczboLVN5wyQgvGjq2ox9eG5EPbYxxMX81tkmyq68p0VkxAEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOkwV9kqyN08qwK1NmwlE/kmA1LrE5vAxbf45V3rJbU=;
 b=tjvCr9fEZnS/1sygRCnSm5Q2dXA7fAn8eTEtv5NpIiQ6sP2WsjoRLTtl1Z8622ok/gg2EPDiZ56/V2lbBNjHiKgjEsauVAX7RlT/FjXK+64C4N6hsxUAM+k9NP1EKmHYkVkYTH8WDGFNWmhbaiWPaHdLUdqB+5PpwCiQeDtoIs0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 23:37:42 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::b52e:bdd3:d193:4d14%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 23:37:42 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RFC v1 1/6] swiotlb: define new enumerated type
Date: Wed,  3 Feb 2021 15:37:04 -0800
Message-Id: <20210203233709.19819-2-dongli.zhang@oracle.com>
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
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 23:37:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95a27da3-82a5-4fa4-cf2a-08d8c89cb345
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47847DD3B5C66C7017909B5FF0B49@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyMvFO94V89ozWj18bC0Vn9q8FAfrj1y9eDdojT3KXhZ3Kb6y0lMwkIUajPU89ixDjx/OGTr/llm3guooQuOtVd+PpQ9YQUQhSfr0VFSEaouKp9j6rQxBc2TDkU3n5TWws0P+gsQ9ClTDsY9obcuVuIpjWx8canMnExyJCp5opcTw4kGqQW+2+W11CZ3GfQA/4/tYYsbBhNweERyMTssLgeMrtTCtHAaB7mU9lopLRJxj2jUoeCAvT2jIcoEdnUPcQsrrvYmOO0jFqky9d3sZhy1e0161Va50YgEy72BmrZriZB7Fl1RBIJTb13rVgOZCbpYnWmPSfKYKtobkI66O/AUHyUDOyZMTNQBR2Mv1wasGM4dt/FVklQoggzHlBFeKpjEo6m1rahep0DWs5s3iFzqE5GbyMkd7KlvzTs1OY1vFoh+bHjv8LoQzMG7W+6nLoal5vB2LR6vIuK2+agcXr4rLiYxXl+a+AkvVQmNmsI6626FXj3SqSvLeM8oEJiQZCJ4U1Q6g3nnWr4d83pSjBwkmZVCAyR8hTQR7DHXcHQnZGjwHSyBmM0W44hGWgRhS7GVj+ds0MKOwrTfTcagGfrroQKUBZjTQBUCad4qCbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(6666004)(316002)(5660300002)(956004)(66946007)(6506007)(86362001)(7406005)(4744005)(1076003)(66476007)(8676002)(186003)(26005)(36756003)(7416002)(478600001)(2906002)(66556008)(8936002)(6486002)(16526019)(69590400011)(4326008)(6512007)(44832011)(921005)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qeAfDC+0fc/jTywdxpwqkCaMRYdTCNWdYfhK/QFffR8uC9UvZ9YkUddjJqj8?=
 =?us-ascii?Q?LMepJPhT0a36sLGoYCc8pE42XpdTs25YEvJgJbE+r15lAPOhZ2uG8YaqDpie?=
 =?us-ascii?Q?YBy4aMhXnck5XH46LZbJJ5Bc6YzUGPA/RpT5PCmWbcQzB8peKv+pFSlMP+73?=
 =?us-ascii?Q?gIpYKWEVF/EtR6TOku8PeSlGV2dRHpAnvJ67O+hahgMBD7bgCaFV694aTg4w?=
 =?us-ascii?Q?KSujev4hlObPNbItkXf5I4GifCbVNuALJHlzJ8DOx3jIyR3vPyw0wng4LXc+?=
 =?us-ascii?Q?+9ix1gN2MitGR30SK1CJCpvNbznMmFVfpzPTnriq0kYWtNemlOD6oInjEJhz?=
 =?us-ascii?Q?lX/MAKiyokUXQ0qit/KLj+zLzuAH3F6pVaMRrXRn4VjzBw0wtn318NY07ege?=
 =?us-ascii?Q?hHXyWnZhyM9l0kHMf/ze9KlQNE6Sdg2p3vYo/Hq92jn1rRbO59GTtLfvxPn5?=
 =?us-ascii?Q?QxqO6FkLHZ/88+48rGj194umjw35pFBKx4rrKzuzS4pWSvhkdzyrhRnTCVdM?=
 =?us-ascii?Q?I7qC6QKCOzWDkQEVzuMBoOZzNkUwie7LrRumo3wMlr/8czcevewuo2IXNIzg?=
 =?us-ascii?Q?D7TJxw98KoyA2iOs/gldXx3CPC4SiFaEvp6dq7I4fh8GdU0qF1MVOiPdvsoT?=
 =?us-ascii?Q?rQQ5UWwcFD6h++pJRtaYAs0C+nUc9goj4CFBgjdYM+L4Dlgz5tEzQlMNUsnq?=
 =?us-ascii?Q?XSXVhlVhkhC9yEZcOc5IrfZuT2dzHSy7+Qbe5nInBellfHBl+CWcEpWn/jjl?=
 =?us-ascii?Q?wX9HL0m1ighHydAXVY+AV2URNDoOpHzWjwqPs8PpDN+JOoS9P98XRkJjFge+?=
 =?us-ascii?Q?4Yje34H5B0XWticmtwtHcMefFIsWWY2QXorWYako3rd0RzGNYZyuYX2uCp8i?=
 =?us-ascii?Q?sVTcOvSqj/a8gFakwJ+4nV154Vi4eug2Wo+C5oGTWB4Hswx1HebZVaMqKvKR?=
 =?us-ascii?Q?GbCdRkVX22oK6iyaAiiYpf5nB1Ep2AUAYg+Qx7ut96diFZLdXYFfNfoFZwVG?=
 =?us-ascii?Q?ussF8YCLj236NHMPrisyvb5av6Siy21oV3RqJshiJW95ZfJqpRrmbUTOdTCn?=
 =?us-ascii?Q?J9a7MZ47?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a27da3-82a5-4fa4-cf2a-08d8c89cb345
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 23:37:42.3473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk+fQUFRjPWPo8X09lgguRz1ZQvV/Q3+611J76qZ14X/Exg/9tU5P18MdXg55YsgQonrvMBApO+7wQjpLqZc+A==
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

This is just to define new enumerated type without functional change.

The 'SWIOTLB_LO' is to index legacy 32-bit swiotlb buffer, while the
'SWIOTLB_HI' is to index the 64-bit buffer.

This is to prepare to enable 64-bit swiotlb.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 include/linux/swiotlb.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d9c9fc9ca5d2..ca125c1b1281 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -17,6 +17,12 @@ enum swiotlb_force {
 	SWIOTLB_NO_FORCE,	/* swiotlb=noforce */
 };
 
+enum swiotlb_t {
+	SWIOTLB_LO,
+	SWIOTLB_HI,
+	SWIOTLB_MAX,
+};
+
 /*
  * Maximum allowable number of contiguous slabs to map,
  * must be a power of 2.  What is the appropriate value ?
-- 
2.17.1

