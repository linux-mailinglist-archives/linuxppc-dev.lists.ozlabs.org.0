Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DF432BE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 04:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYJ4s2Q09z3cNh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 13:45:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=RSivVhNL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=5926316744=meng.li@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=RSivVhNL; 
 dkim-atps=neutral
X-Greylist: delayed 669 seconds by postgrey-1.36 at boromir;
 Tue, 19 Oct 2021 13:44:35 AEDT
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYJ431qfFz2yg1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 13:44:33 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J2Vm16015197; 
 Mon, 18 Oct 2021 19:33:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=av0pFAZuAC9yCalHf+z9B+B59xCF8MlPS0x9Dyf97ac=;
 b=RSivVhNLj75+h4/7f1Fa7mSWS7wlz7TrKLp9IzDUZVtC+AmnvJziBVxCip+hyG1ttpL5
 WitiO0ASNuQZXrkI3HStzci6LdiTxU+/U/MkxQNCri8Ac/h3cVHmZnR8/po6idc2TPu0
 6nCBAxDpbF6aUGSJhKEJyc6MaLlUFIi5Sue5TtDgYt21tciw7yltoWP49cyFMmjX5ftY
 4YeqrOD0xoKDL0tVX/gwTb0v91/e7xvQG5a/ZDe1RTdQdqGRfYHIkfQi4LLjyfFMs77x
 +MgWmqtg4GdhYSM5a3GP/tvsv9jlyTmcpxuneVxIQh8ddwHEPP5r45rDiJBh9vM01ZpB Rg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0064b401.pphosted.com with ESMTP id 3bsab70gk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 19:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrALPQcOidmNFoTL6Evkprhd+o6EZS2StNeWI5rLxL0i3LgZPSqCF2R4Zdh4qMRyw7QewOIWA8I90jvLyXqZOA13f3VTBFFN6IcVYOy35Tq+l2esPmnQSzhFzBn6jHvyx9mgmmdX6FxBipxroboZ5U908fGyrwDpWfdTh8PYYIT9hEEETiYq0CCUvRPku3U/s9gO/ahmHCCctJdtUxjCS26XmSwNgGmQppoXmgRppHu25QFDRC2bWPJc3BcZ63smZzQC/Y94xl5iGiG3ze5Lytr/WjCDTkCbDJ+Qj6M61RO8bEe2TH2jYqJOW1pCh7mwRajv6jmLJCvJiRoOAEH/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av0pFAZuAC9yCalHf+z9B+B59xCF8MlPS0x9Dyf97ac=;
 b=kUTXtuLBpyUYHLDIvpJ5isMqeTeeBwDUlGLZS1AX6mNdjQcPtCjx0NbgkItaDmwKCkwp9DFd5g/iUW+tb06h7nvMukEbaUY3oAih04CvNAUkW2QG1QIQKAl3GZQF/YksDhy+sR199ocS6+M0Y8vV++dqfA2mUMijqQ1QfQe4C0YrBQPQGbuGfQ4DHr/HomyBoHzhJBZhfIUrqQ8RkzuSsE02hoXP37TfId628ZBy1o3sQPb0Yvb0Ktm7nWD3+pRD3Q09DeHRddGzJRLiZefZmlK1VnP/Ex+u/N+yxLrZdFhHD6XTbhBjnfDkPKijdOrN87W0YC3ird5eZGhPncPuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 02:33:08 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14%8]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 02:33:08 +0000
From: Meng.Li@windriver.com
To: Roy.Pledge@nxp.com, leoyang.li@nxp.com, ruxandra.radulescu@nxp.com,
 horia.geanta@nxp.com
Subject: [PATCH v2] soc: fsl: dpio: instead smp_processor_id with
 raw_smp_processor_id
Date: Tue, 19 Oct 2021 10:32:41 +0800
Message-Id: <20211019023241.17466-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
Received: from pek-mli1-d2.wrs.com (60.247.85.82) by
 HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 19 Oct 2021 02:33:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5507326-17aa-43f1-f70a-08d992a8c997
X-MS-TrafficTypeDiagnostic: PH0PR11MB4901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB4901508A03C588EC2ACCAED5F1BD9@PH0PR11MB4901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgxyV32QRjajNlX9ul2HSO40eyiE3cqjewlim66Xvz7k462C3qBEJA94qJ+SEF1zNepUquPv77RwlYKtlyFhHUENTjfKtgYnIYdC1ODNKXt0c6XjNaXvFvQCf4EtCV+TB4AnL0kXpC0VYoYs2LPGJfoWO+8oSTIWXarNSNfwpjwUfcA6Q+LJWF/o5OVMTnwB/hNolvmutHFJ3kZUA5e7QI8F+96bzLuxgso/WZLEQ1NjAUB1lJAvOd/F02evIJnJ4qS97Z3v/O7kk2qbdx/UQhkzDWGRlNRIJ6seK3zBOMsXgkKXuGYG3GswRdfR1l7DBbQ93AGUAleHOvxiPowucAlvmuuyFe3EOEj/QDwuFqFzujUN0Y4RYdOYcqcAyw+bkritxhYBLCmhpxbflILY1LusiGLDdGODTYNO7u+rmmHg/tIrwfGWIYzS1h0yoRcXE6d1fJTpd+rHoTy5RPWznQrHlB9IqVEmUo9YtFAPiUJrDTwNg1CjlumNW86QsQwUmBfRye8lYG9XnDxNWkUcCLvY8W5NpDQqH/cNpBosDRyOKXlsmoYYVkCYZvp2e8pyTl2kDyzGZXxutCU9pEtbpwuWsGYtbXl3u7M5NcgNo2uhlVpC8sGDSZ9eGYda+V5Ph6yo/as+QqBF6VJfUjfuJ0IEOt7Happ9K+ThBIZJeHoJjIV0rYc5YBfWbCoE2iSvruKU6nl3xYCWJLAFNiVudA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(52116002)(2906002)(66476007)(1076003)(2616005)(83380400001)(107886003)(8676002)(6666004)(316002)(6512007)(9686003)(186003)(86362001)(4326008)(38350700002)(38100700002)(508600001)(8936002)(6486002)(26005)(36756003)(5660300002)(6506007)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PAGSCP/Ywe1dY0HfsqJJRBhpSSdV/ZelfSIJcTr9gQti/RqAqBLZVJNYvmyn?=
 =?us-ascii?Q?C6w8NFyN+y7dk3EAJHipaRxg912mRe04/2O3yV9XnGDrW3/s0i5yoa/JAUZk?=
 =?us-ascii?Q?qU2ckQGJqRX0SOZH0kOUBmUq6riTt8r8n5mQHyp0A2aef5HF/qJXcpMCNcRY?=
 =?us-ascii?Q?+XntiBINrMKoaItk6OK0iRTau64upWLZz1KTN4WTZVdyNVVk3Wzo/r5xPhG2?=
 =?us-ascii?Q?U3y73Eb8KlrY/1CQJJmfiXOSrxlwWOnkf4qOA6KF7c9gSXtAtR0SdkuPu2WK?=
 =?us-ascii?Q?ajIuqPT3/yh+/VijelM7/fM1tCjwzFgDNW7lZKD1VAvUZmV43/0SEQIn3IO+?=
 =?us-ascii?Q?pc5m4fz9vE6T6KvKBN0Ns5ZQ7K0wAG5EdeeRaO7ImIWfWcVNe+4Dwxgg7QNT?=
 =?us-ascii?Q?7YdDO+FrpEmwvdYbOPeDXZ9K2276+244x0CtU0nva/edoP8330VAb5AMduzb?=
 =?us-ascii?Q?AH4m65ZWYH2R616YIKBkvNxYXfEXttZUnQfy/lFL8md44hZiGjAVajz03aKE?=
 =?us-ascii?Q?FYKFZilWE8FcB8EjzoEgPFGu1aDCHe0xpv4n+YOzlqUhTBblt5efoGOo+oQv?=
 =?us-ascii?Q?l3WK3UihZQ2rOIuXA2LArQQ7a6Z5vjiv0OF9cSwaD+dmFn5zOZgoOzJ5akJ0?=
 =?us-ascii?Q?1232ny1SB9ZXQN5TuYpCmsuAztKkb/2PJwRLTg3hBxzMkP+xh7ojF2x0IZZB?=
 =?us-ascii?Q?FOHFLokU0aKsl8chL12qTvh5g8fgR24eZyaS0DWp4/vdWCUv/bhw9czIauVx?=
 =?us-ascii?Q?a4172z1ghZ2BnC86DDwMfTXcrWRZGpu1Tw45rXnNvgOrZ+WSCcy+JxIYNHvL?=
 =?us-ascii?Q?KHdW4e19KtGWe7l1LJHcjZWR7KdgpO8NDW4qvhH/RnwtktvOqqiO6c8WaDfG?=
 =?us-ascii?Q?j+Ed+KkxikYIdxSwmf071QUGh6pzMgbGJnl3sb5MInb5dzS9Ca1tC22sonTZ?=
 =?us-ascii?Q?u3F+LPvNUV2WSHWlKZDK+dhS203SlfBP80q1/TORmGrR3pfpZTyMidv1/dB0?=
 =?us-ascii?Q?m86j0gB6GS4I1vm1kbCoJmjWBJaRcAwPTxwy+qkBNxFGWYmSG0R1WgzQXY2O?=
 =?us-ascii?Q?DpaFSFondigrGjbxf91dMKRPQgbfdgBXw0g7CySCyWiBq359Nu2MbleddsfG?=
 =?us-ascii?Q?0GENd/5uztzxu7fy24C/huvP9y+Q4m6exoivFEVQsDV8+S87m3SISB77vudW?=
 =?us-ascii?Q?y+0FbLG0qwM7LrQh8w8sYWplCuYCy972i1O6Ui2+XP4KUkMSweiRxVeSdxAi?=
 =?us-ascii?Q?Rm4N9phzEzCCL2bG5IseuuFunNaLrBHXJBz2zvUHlrBFlZ79EgqZeWunXv55?=
 =?us-ascii?Q?8Gi5NnxxiDjDqN657ZZs5Zdp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5507326-17aa-43f1-f70a-08d992a8c997
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 02:33:08.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvfVVu6CJ9T8oolwXwTi+ET1+Yk6dtSqR88Sn+pVn77q8mnZ+s4QtNiCZVp8sWU7cjcVTU//PZgjUocWLkuiQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-Proofpoint-GUID: j5dDbfU9ZfirxDKTWg77VGEJKPdQJt17
X-Proofpoint-ORIG-GUID: j5dDbfU9ZfirxDKTWg77VGEJKPdQJt17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=615 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190013
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

When enable debug kernel configs,there will be calltrace as below:

BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
caller is debug_smp_processor_id+0x20/0x30
CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.10.63-yocto-standard #1
Hardware name: NXP Layerscape LX2160ARDB (DT)
Call trace:
 dump_backtrace+0x0/0x1a0
 show_stack+0x24/0x30
 dump_stack+0xf0/0x13c
 check_preemption_disabled+0x100/0x110
 debug_smp_processor_id+0x20/0x30
 dpaa2_io_query_fq_count+0xdc/0x154
 dpaa2_eth_stop+0x144/0x314
 __dev_close_many+0xdc/0x160
 __dev_change_flags+0xe8/0x220
 dev_change_flags+0x30/0x70
 ic_close_devs+0x50/0x78
 ip_auto_config+0xed0/0xf10
 do_one_initcall+0xac/0x460
 kernel_init_freeable+0x30c/0x378
 kernel_init+0x20/0x128
 ret_from_fork+0x10/0x38

Based on comment in the context, it doesn't matter whether
preemption is disable or not. So, instead smp_processor_id()
with raw_smp_processor_id() to avoid above call trace.

v2:
Remove the preempt_disable/enable() protection, instead smp_processor_id
with raw_smp_processor_id.

Fixes: c89105c9b390 ("staging: fsl-mc: Move DPIO from staging to drivers/soc/fsl")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 19f47ea9dab0..3050a534d42c 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -59,7 +59,7 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
 	 * potentially being migrated away.
 	 */
 	if (cpu < 0)
-		cpu = smp_processor_id();
+		cpu = raw_smp_processor_id();
 
 	/* If a specific cpu was requested, pick it up immediately */
 	return dpio_by_cpu[cpu];
-- 
2.17.1

