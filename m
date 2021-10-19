Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA3432C0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 05:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYJZD0DxTz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 14:07:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=UmeFKIpB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=5926316744=meng.li@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=UmeFKIpB; 
 dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYJYM6VVQz2yQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 14:06:30 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J2ZK1r025234; 
 Tue, 19 Oct 2021 03:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=fE0lxglUEH2rUj09qhmKPE0wUI444bua2uVZXrL+j+o=;
 b=UmeFKIpBPddPjfivmcLUky7Y1hKGVcfJFjjSECBYnXKM4ndBBjec4XxL83m8Rh3eF9ee
 cKmvG3POfn/6MOB4bn9aE1x6N5OxHIs7dAAxzNF8yqbP62UE3agVO8n6Gx+y6Vo32rZj
 B8QS/lUcfz+aLE6n+hHfZyGrHTnrET0B+IMsMn+2+rGBkn2XTJbquwBWHlNIRa/a0nDN
 sYBKBV/tsO4wuhnyesv4Qt/BF9qJ93NqrAKIjTTOtewRPKDQcGNkqC/c5TtDiULNgAeO
 S8wr1gmlb3229r60wKxzERYR+5Juz4wuUe+h23M6lZsF9y3GLOlAa9jVpZu48meuVKPJ AA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0064b401.pphosted.com with ESMTP id 3bs9apgk9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 03:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofKgJjgoavR45NPAc2+ph8NGPEVikX+xuAQYtbTNXRuX4YeD1VwFXH4eGiQpYHRHt8K+ebYOlstOnhXT2zJ4YlcW3lnWHbtGk3ITpwzkR8+Wi169zR505wPJfPyRFwiVz/w5a+NS6c+ytxqEUSNcU35jy4jj/Sqw4jKb7HgaOMQKLrRWir2hVCPr5xTNgjsW/7BQbnI3qGpB36U7t72Tz4blzvUW0nmFe05FJYQdWXPox9wlnQh4iYvqg96P5beyOXDeRPgYPQorGflk4cmpE2LdPfdyPDcekItnaSENvtkXfDSn033XKAVHCsHbDOhmo1bhb9mWMyKLwnGvjEqW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE0lxglUEH2rUj09qhmKPE0wUI444bua2uVZXrL+j+o=;
 b=lSe+UuL4QRRVuM6b3sFLBZMT7kYZTAYPK6AeNUCaL2FcwzEDkOJEkfsPd6smDaGqYLOBSJ+pI0f6LzKFqQutyWJL1ZtHRtpERYpH8XxmZb1iUHn4GEzEJJrz6QuXweUdIdS/gQpKrE8fu+/PPKeWG2nXxgj3/XgBmiK/t6+QInwDJn1x4pZrSIVVIGwbY6HCGO63u/RE2rtcmB7GNJv8eoku8uFTD+snkuR9dlOVloYh7vlkvtp8nDzAoiFvtRAwawe/AVt6Y3zwxUmPtciFeLPsZ1eEzmRSKhMBUyrmTbFSOSMkAw5XJGwqcluqP+OBn3yZrObejxnxyYYp+WrkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 03:06:18 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14%8]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 03:06:18 +0000
From: Meng.Li@windriver.com
To: Roy.Pledge@nxp.com, leoyang.li@nxp.com, youri.querry_1@nxp.com
Subject: [PATCH] driver: soc: dpio: use the whole functions to protect
 critical zone
Date: Tue, 19 Oct 2021 11:05:55 +0800
Message-Id: <20211019030555.29461-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
Received: from pek-mli1-d2.wrs.com (60.247.85.82) by
 HK2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:202:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 03:06:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c57d1f-0c5c-47d9-2dec-08d992ad6b8f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5927F0825FD1AB1693F9A742F1BD9@PH0PR11MB5927.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEOraeYWAhbYB+XAitQCrMFnHV/mNImGRUDWc2jO+dMxsGwU+P1FIAJSKkQeswcX+t9NbhpItkRI7XN9nq+2GdDgQUaZyAidEiCtFsHN8xb8IP2vE3uAL5tpES2K8pemX5KFzldrNnkGHZaADRCTxDJeNPOJx2ZiESm0de76KqRCfABaaTvqZRhoOAeZOVUzA2V6Ygb+kUCSz4T4opEPrGsnjP9TJHdo/iuTCSg3DajZZlRKlDPGZ5gc1RcGbAWrwq8CYxs82JdNqvsQELpXznNPECOGU1p8Xkxd7SpwcLTqkrgIDUozba+i7E2eGOdsFPDdjubL9nrtFCAxBIXzbYz/mbEh+4Efb4/iQ/ZusYpekDHezWnxSYMgeHuiRWuODwg2Y6WC8Ttx9nADmFoDYUgDV1shgrDyDFyti2/2Ss1IdSqCnukLQMGOtfV2rDffbn1MIXH7Lg5UDPwbrcq+Y2gWB3A6/tjjSD9wzB34dIvN0NlawZGH761opyVrbWXWC6Ix592rgeLb3bvmkd0qndKd+C3QqoYARVvjL47aAZL002s4It06c9nUXYs/ol2C2wmCAztr/Fyg26ZN54QVcKFiDeYxJPoUej04lynZiASeLtl+k517aOQFFblrr8EKARjOwPsR1U2McvyHJi+jcPP1/vd2UgSYN3p9VxNFEz83t4IxU0mpgmMO3vL86Un/CuAfmA1EM9zGOU2g6fA2Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(9686003)(8936002)(6506007)(38100700002)(8676002)(52116002)(2616005)(107886003)(38350700002)(1076003)(6666004)(6512007)(956004)(4326008)(508600001)(26005)(316002)(186003)(5660300002)(36756003)(66556008)(6486002)(66476007)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4DdH4d4qSYeYXitr2lhPMriqwmatpMoztSziDi0RcESMW+0FxlRRKhgLdUcf?=
 =?us-ascii?Q?3qD2S5idXDNiGU748SuS4cbtO7BCGee8wHqhAKFcKqlJLmQQavOksbPMkZWH?=
 =?us-ascii?Q?uvE8A4RtgR3ZcepYWnbi6dyy4JlY8lzu9xZqi8o5vnlLI1X+mHECUgRDQ3/i?=
 =?us-ascii?Q?lCvGPHyCiq5l2OSM9NKa8N6spV+96v2X2RMsVKMU/e6Iw7L+CyPJW+SfBKO/?=
 =?us-ascii?Q?n/IRkg7DBhkROP2eKQEkmF8MxfeWW3aEJN8xlLyEpgTD6+iiZnO0pOTgq1xG?=
 =?us-ascii?Q?UglPG0tF9TZtHJ2nkChLm/M1UbLYRXRIMnjD01BGAc9uB+v365B42A4DUr4g?=
 =?us-ascii?Q?QyPKG1/OJFDjQIf7o8ID7OhQnGXA2bCyoeSHmxexLhwWvKn5vvrh/nK8f/3+?=
 =?us-ascii?Q?0QUWAUjkMxzKV5Io81HYfJunSI73+vdk6c1JlVfAM1hyJsB4GhGvKFA9lc9z?=
 =?us-ascii?Q?QEAhNM11N1K8WSFOzE6Sc1oVFD5B8v2TpEo3d5Kbsm5aa2B6Q+qeSbr8IvgY?=
 =?us-ascii?Q?AEv22wggUGxjLa9N0zXrYrzqbP0Q2tZGRp7/ObuGh/e6TAgQ59JQvgoAaCza?=
 =?us-ascii?Q?mf0CN68/B8U9o36EUr96yt34Qua2T5tXlrStx4eecF3hOuuPhfyoEcM/EivZ?=
 =?us-ascii?Q?ovgvka8Vyd+LU+rNf7ODsAiqoX3gzu5qD28FYBzqgpIjL6zSIpRulhJbJ5SW?=
 =?us-ascii?Q?EAZrMXrSEIAwwdHes0bua+bUjYTJIIw/X6Y1h+aNyCNp2KBQAh38fPv1tXx5?=
 =?us-ascii?Q?4PFNQnihiOPszsGBp8gwET7ytFYeNrD3UEi3yuhVF5IehLPG5VcYd3Un2P8s?=
 =?us-ascii?Q?2GsvN26+ssJ0JaqKY73cq6WLpc+OzXaEbZ7xtmp+POi/CU9tT+mOAtzk5pf8?=
 =?us-ascii?Q?yWCbb6O7nJNvgTTvSVM1RhJENYC4mnBHRw6FJbEQh57WPiaJIjogPYJ+QRAN?=
 =?us-ascii?Q?SVtOjRdmcZINMfACOTH+YK2or00M9D5jbDTwO0B1Yt60m5MWZ0EVgEqR8miU?=
 =?us-ascii?Q?MG2brYqkfU2Cps9/LdQAodng1NvUKJHJqYYNRsnB6oR39pihRZfRObiCSPay?=
 =?us-ascii?Q?2+hYTupE+QPWt0W7/gtx1PoqvCg4BZR9tAFyRI3U/DUGOnOBwbsTotOuJzSl?=
 =?us-ascii?Q?qosL8trBEzjcqz0G7YVR2ZZ8ldIpQb+pCaF3LpyDQtRGio6OCtEoIBBAwNzz?=
 =?us-ascii?Q?BL6nh4i6KOsUwul0u28SKqa+VjOSXwqXvmXtJwLpIpLIrY53vKPmXihz7ezW?=
 =?us-ascii?Q?LoyYB76EY3tW9/zUDG97CYNp4xuqkf/1rspYspm32P85KD5QYV0ecrLBSQAA?=
 =?us-ascii?Q?eyjVKrkKQ1xqU5DX4Oud0BuJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c57d1f-0c5c-47d9-2dec-08d992ad6b8f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 03:06:18.2672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrRQMHjeiuQU8wcDXQVDf85l45Onm6L7gyPeqTVkamA0cRooCrC95vD056dO2gQLjeVVhtgGmgRIq74TVoaeKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-Proofpoint-GUID: atanGH9l_5FrpMRtRI_FRs-tf4CTVbUM
X-Proofpoint-ORIG-GUID: atanGH9l_5FrpMRtRI_FRs-tf4CTVbUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 bulkscore=0 mlxlogscore=259 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190016
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
Cc: meng.li@windriver.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Meng Li <Meng.Li@windriver.com>

In orininal code, use 2 function spin_lock() and local_irq_save() to
protect the critical zone. But when enable the kernel debug config,
there are below inconsistent lock state detected.
================================
WARNING: inconsistent lock state
5.10.63-yocto-standard #1 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
lock_torture_wr/226 [HC0[0]:SC1[5]:HE1:SE0] takes:
ffff002005b2dd80 (&p->access_spinlock){+.?.}-{3:3}, at: qbman_swp_enqueue_multiple_mem_back+0x44/0x270
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire.part.0+0xf8/0x250
  lock_acquire+0x68/0x84
  _raw_spin_lock+0x68/0x90
  qbman_swp_enqueue_multiple_mem_back+0x44/0x270
  ......
  cryptomgr_test+0x38/0x60
  kthread+0x158/0x164
  ret_from_fork+0x10/0x38
irq event stamp: 4498
hardirqs last  enabled at (4498): [<ffff800010fcf980>] _raw_spin_unlock_irqrestore+0x90/0xb0
hardirqs last disabled at (4497): [<ffff800010fcffc4>] _raw_spin_lock_irqsave+0xd4/0xe0
softirqs last  enabled at (4458): [<ffff8000100108c4>] __do_softirq+0x674/0x724
softirqs last disabled at (4465): [<ffff80001005b2a4>] __irq_exit_rcu+0x190/0x19c

other info that might help us debug this:
 Possible unsafe locking scenario:
       CPU0
       ----
  lock(&p->access_spinlock);
  <Interrupt>
    lock(&p->access_spinlock);
 *** DEADLOCK ***

So, in order to avoid deadlock, use the whole functinos
spin_lock_irqsave/spin_unlock_irqrestore() to protect critical zone.

Fixes: 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 845e91416b58..a56dbe4de34f 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -785,8 +785,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
 	int i, num_enqueued = 0;
 	unsigned long irq_flags;
 
-	spin_lock(&s->access_spinlock);
-	local_irq_save(irq_flags);
+	spin_lock_irqsave(&s->access_spinlock, irq_flags);
 
 	half_mask = (s->eqcr.pi_ci_mask>>1);
 	full_mask = s->eqcr.pi_ci_mask;
@@ -797,8 +796,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
 		s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
 					eqcr_ci, s->eqcr.ci);
 		if (!s->eqcr.available) {
-			local_irq_restore(irq_flags);
-			spin_unlock(&s->access_spinlock);
+			spin_unlock_irqrestore(&s->access_spinlock, irq_flags);
 			return 0;
 		}
 	}
@@ -837,8 +835,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
 	dma_wmb();
 	qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,
 				(QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);
-	local_irq_restore(irq_flags);
-	spin_unlock(&s->access_spinlock);
+	spin_unlock_irqrestore(&s->access_spinlock, irq_flags);
 
 	return num_enqueued;
 }
-- 
2.17.1

