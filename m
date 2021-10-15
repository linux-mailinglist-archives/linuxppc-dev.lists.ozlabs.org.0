Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281042FE83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWMQ044QYz3c7M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=bsxd7mzJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=59223cdcd7=meng.li@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=bsxd7mzJ; 
 dkim-atps=neutral
X-Greylist: delayed 465 seconds by postgrey-1.36 at boromir;
 Fri, 15 Oct 2021 17:44:24 AEDT
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVxZc1LtDz2xt9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 17:44:22 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F60123020169; 
 Fri, 15 Oct 2021 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=+9/RWztobMX48VXIRfjVaITc3jQ09VTGNm/CzZ6n4iM=;
 b=bsxd7mzJNQJkCz/17HVd1t98HDklVMVCKlOzdv54CAzA2AzgqyOIDQe+b5X6XqkrN662
 yz8ccMJN2mf57TXAKZQpa0ACHMZWn7zCKev23XpBaNeUsgVB0obc0fp+YvimycnYEAWd
 yECjVja2jQxy8XRy5gpNbuKT1yFAFy+oRaNMzCORxiJ8Pf3atAkazfE5IgUw2RF4FyXz
 tlIHzPNNnV0rZP5/mSanVAwcsSg9Jn7hl74zh+hAx7mfxqotc17EoBzKCwVfV4B9RdA1
 Oargyi46IQ6oB882SJU3jr17Vr9wG4FzqxaelyQE7wb4QyBQSoNqazed8hJdQ2lJsfCy vw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-0064b401.pphosted.com with ESMTP id 3bpd1cs5wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 06:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIq7LY+p5RFreX7zLzVg1MLFj7cUyaknjJ3RpIYpbCPSIUAFJz0VVyxksgr6AqMD1Sqr8JeeFUH8yd7oP1MbTZfOIOKMs8aeJd4QFlIu/AoXHQHSYMX2Wfg1gZq5VrFVl89TKFgfSl0+MZFfyuY0casvIdj7Hyv8RLyP1CknvbY+6ms0loiBxAdg2Y5X3oWPATgsAAUYjzdxfzPOavHd89/FfGSZP9ifiHbLYACWKmcb7M1Bg2ggzm7Z1WW8n9mJ3ZNuUNrcvMpscXY43d4O60+jcreyIOCisASa7yQSV7QsAt57wqsTkJrkZNAKnMK4bfmT6b5PYaCx41IpSoAx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9/RWztobMX48VXIRfjVaITc3jQ09VTGNm/CzZ6n4iM=;
 b=nQ2NvrRA4Emyz9J6kfGCem6LGNMB9r4PM1+vkau3yNYHNUAPtLKs+gPCMMMpGORQ0R+NiNhYu//e2HET/oe4oyvKFUwuWiWdX8jhx9muSNNY67FUDNUvbhhWxJniF35YxUpjPM4QnllOI5kow1/7qjnblM6pL3hNF9FuN1VmsVAIPNgO5nEiwtEpsSdS2MX62bNRQZHCR7til6dshtMeJiEd1Kg2FAr+WFxi7zqRI0PLN9aBiKUR2nyzd1OIiBMLfG6l6oKj+f6H8hECUwzY5l3cAu80MRZZFTkuznS3tNERvFd2iy3pPmeghHN0wrIF7LOjlzA5KbdRhArRMGNfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 06:36:22 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:36:21 +0000
From: Meng.Li@windriver.com
To: Roy.Pledge@nxp.com, leoyang.li@nxp.com, ruxandra.radulescu@nxp.com,
 horia.geanta@nxp.com
Subject: [PATCH] soc: fsl: dpio: protect smp_processor_id when get processor id
Date: Fri, 15 Oct 2021 14:36:01 +0800
Message-Id: <20211015063601.23303-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0025.apcprd03.prod.outlook.com
 (2603:1096:203:c9::12) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
Received: from pek-mli1-d2.wrs.com (60.247.85.82) by
 HKAPR03CA0025.apcprd03.prod.outlook.com (2603:1096:203:c9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.8 via Frontend Transport; Fri, 15 Oct 2021 06:36:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c00f66bb-d566-4215-204d-08d98fa61a10
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB4792E2E73B176B01BB1B82EEF1B99@PH0PR11MB4792.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZqcAqHhoO+/wNpzOhAFMr+Uc+LKAx6JKzTiASINGQDcYZ8ZQNb5Bz1boITzPDZxMwnIm3fcXH7TULjDyyIZj3pFFEU/RjEb8AFxj+YZLQspgWuoMKEwePLK04hvvefGHDZGD5W5GrPInh0e1v6zW8+FzN/Wm2FyqXjSYVqzt0rawW3eakA9gZJAAwfRmqSW75FX606JcMPMo5DM1+qeBkh8CrpAvMoI++vQyT0OIQgkR07uvz88W4mtV1CFPFPo0IkH9vMIMhBGl55sxSKlUWoNgLkz9RabHF1g950gUPo9RT4mgZ3uLT8BqHSBEP4U7qfCerfY/zAIqVr83yEzV2GnvqKa93R6NjhETGNqG3FtuiOD0i9TgCWBAxpXzu4lldcRal/CdF3k2OSUmsRBzuyWtppGZU3p6kCRbEZZQGbS1IsxWT7NKHvqDI+7m2hojn1ITfTlJao3uTG4lvvUYUhAvxt1zBofQo6ANyqn/QTUeIYcRff7FBcYrMUZKSf//00hfhfj+Se8znAnMZKQVIKBHXSiCy16iebqWk/ZbJVHryM+mU2hJyGe1e6/coxKMGu+mMcZm9KHZ08unNK/s63pDRo60ybVftU4yMRk1WA4JRICzc3FrpFTaWLQUvsvcJmGG3J20g9ZRcOPSkW+akX0ZEOaHHCK5NJ4o6SBt77HWrclJcncC1N399GOxcCSy0khlWS/IzYdXvW5hQZU8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(508600001)(36756003)(26005)(38100700002)(316002)(186003)(83380400001)(86362001)(38350700002)(8676002)(956004)(52116002)(107886003)(1076003)(8936002)(6512007)(66946007)(6506007)(4326008)(66556008)(6666004)(66476007)(2906002)(9686003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7RpdVahCmzhcsdhSx3YElqL+OM8xfuVwuRbG9y9LFqIcTqoOqo87Eks3/kJ?=
 =?us-ascii?Q?Ke8j0BH8HORpJR3wV8I728yAzSNYmtwqZLzT+CEKvxJA/udLxFM7jeuk/P/x?=
 =?us-ascii?Q?Y5Sr+BtcTtGSTAT39pZGMMWtoVsJ+KckMacQMBAF/bXm/oytAy4yfbJZTgOa?=
 =?us-ascii?Q?E7UEiKZpGE/RZeQeOwkciyiHB9lj4hDcCsbaB7FrRuGRmfwBBop0N9xa8prk?=
 =?us-ascii?Q?9e9ufp6jIWLuEcPgtFGxix2BM/MwUZjeH+rKipBUUlwCmEwsfYIRHw1UM3CS?=
 =?us-ascii?Q?OdxvfT6CwomBi+Qb0yMMpz7Ks+/uI6XmlEmjKgOJceDzpwUuN+wGf4NfDWut?=
 =?us-ascii?Q?AyM6P5xLO9odhzdfqP0aavkx1CFcESDGB/7hVV0ZzC6IorHLdyxqqfv7Ai2t?=
 =?us-ascii?Q?ps4flnGt2kQSGN61yePTzA//2LTGw0kY1iuBJlcbIFWxOejEjPj+3Sop8cUM?=
 =?us-ascii?Q?WvC+lDRS6dq634HD49Jq1DQd0s5fF9S41g54GM91p8/orktMUDBYKUpqEwdI?=
 =?us-ascii?Q?q8CaReRrnVMGe5uXLIPofzd4laRUQj6GNLNR+aR6bIYRJ8c9Z9TN06JLYSpU?=
 =?us-ascii?Q?arwjE22htkLaZl3f9pPbfHtFwWaC/4sTkRNNK6+JHCRxgBhC4tBZWGeMTS2d?=
 =?us-ascii?Q?yoqYgVAeA6BxjUlDL3lAhmrPScfRbV0tkZEMQkULXatWOlg8jiUkcmQlL8fK?=
 =?us-ascii?Q?IbzzoL8fV7ToZcVUTZYMFrj0/y84/0KIAQnnUxNe7YBnZCntJvbg3L1Ujh8K?=
 =?us-ascii?Q?nGydab983Sr2FE9HCQ/1YFv2uWOtCpW+owM7hfVGtd2vCiaITXtZjxICwUAA?=
 =?us-ascii?Q?eONgPVu1yxTeoL6hmdpUaXDzjp5O16srTx+SaQxK23zDjcym3fkN6jtin/y8?=
 =?us-ascii?Q?lguJGLemmVzPoQTjhBDeu6fyexEFQ8gDznDZr3Ve98dDjOsvCWZTMbNV2cW7?=
 =?us-ascii?Q?0XcZ7Ux+PEGHFBMJnFKoULWowIXVjdXh1GoCQpjg8R14LjODkdDcPxdXXPuJ?=
 =?us-ascii?Q?rMbH0+UR2CmSK7xa32DgpQtWT3nvbdV3+8/+eVcULYDUHeiXtpwRXD/ZiEQH?=
 =?us-ascii?Q?/Hqk9cbG97CKtvHf3kEDZFzSgQSts7r1Qrd31bMPvVLEHCl2nXJSXWJQzsj2?=
 =?us-ascii?Q?XS/AlXT902ZQnbixrsFdek2qOW4xK6wpBk+sXkL/VbE45egoxpFG152JpqVD?=
 =?us-ascii?Q?UKoDs2uVIT5E+3vdf+SAXyWwccrPxjVtlHqIWMNQPK0O/8buwikpjPFsA2o8?=
 =?us-ascii?Q?oGbROTHK5UgSPvAPUYEJW2WLPIQWqHPCZQwCc36DwW9AiGApfyyQhzSzjXvz?=
 =?us-ascii?Q?Er4zEQINK7CWyb1YM0f711lT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00f66bb-d566-4215-204d-08d98fa61a10
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:36:21.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WpICt0ri9uwLN+JY3IUnUULAGHR2BxLKHWaZOuXVmL2PK4Pl5ZSh95kfbij9hbs62wTs29GgqV1+hrECv7bow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Proofpoint-ORIG-GUID: 2NXwBzrD7qcRzIeXww1gDOCJSnxrKbaF
X-Proofpoint-GUID: 2NXwBzrD7qcRzIeXww1gDOCJSnxrKbaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=681 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150041
X-Mailman-Approved-At: Sat, 16 Oct 2021 10:07:44 +1100
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

From: Meng Li <meng.li@windriver.com>

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

Because smp_processor_id() should be invoked in preempt disable status.
So, add preempt_disable/enable() to protect smp_processor_id().

Fixes: c89105c9b390 ("staging: fsl-mc: Move DPIO from staging to drivers/soc/fsl")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 drivers/soc/fsl/dpio/dpio-service.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 19f47ea9dab0..afc3b89b0fc5 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -58,8 +58,11 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
 	 * If cpu == -1, choose the current cpu, with no guarantees about
 	 * potentially being migrated away.
 	 */
-	if (cpu < 0)
-		cpu = smp_processor_id();
+        if (cpu < 0) {
+                preempt_disable();
+                cpu = smp_processor_id();
+                preempt_enable();
+        }
 
 	/* If a specific cpu was requested, pick it up immediately */
 	return dpio_by_cpu[cpu];
-- 
2.17.1

