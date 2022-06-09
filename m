Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F340D5440DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQnC5kvyz3f68
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:02:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=t6xvKWaU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Vfuabbv9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=t6xvKWaU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Vfuabbv9;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjN57Mkz3bqp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:36 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LSC3N017882;
	Thu, 9 Jun 2022 00:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=6xdMcHGrZJvq1N3Xs9DS/AuUbrlxyN/JsBYOw/WhJRg=;
 b=t6xvKWaUO1Cb0ACv7O02JNBKWpGQyRAYaff/9fxmix1NDt/jq8NGujUtmuPavqtyrum3
 61g0bZzyTMIaO6JROS9hBKDXKiWJ89lItnvbssDhRA1WibklKPZ+xDd/uGbAQQq8nPgq
 LDnvShp5gIqP7Vs1eXsbyphCOE5Hslnk8GjOwUeOLRpnuIfBlBgo9jyAm0ksr3bBYIAc
 jVindzTJHJGCX2KArbxTZU6+GjOlC8eoyXJFRWv5QvsJnmFfNt7HPikFhYLDIZ5S1Bgk
 oENEGNVWEyoCic4H+Uk/AWeRDyXxOJh6plef058kgU1srT3p1UUIKPzyRuQZA2OsnIdj IQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexefa63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:50 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub33032517;
	Thu, 9 Jun 2022 00:58:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juVTivBgEKe7m9kue76MVZTdZz5I+lX5bC3X1Dwiev8pMdPfD/lPoPq7i70s+l2AiDQkGz4jutHa87Y98v2KjGfj2ICGGe2cZUN3KssJmb21PVOjoCxiMRyjXawcpQxN2M+eX5Jv6VYQzbC3xTmWXUMMrljq6QFxUbKEK1oBg1WbZ36hxudQ5hmNmJ5k01wRx3/zNQ7DEgud31mJFWTUtlMy1W5j5tA3WoqwaDFuL5ERuc8swc23L2YE+XVChddl31WEi1Kb8xlqZAUjWnhCLaHxXBaf64JXPHcn3SjE1/+dU41gZ7a+SpklOOZy44jh+P/YtaJgfWWHd1jRak2ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xdMcHGrZJvq1N3Xs9DS/AuUbrlxyN/JsBYOw/WhJRg=;
 b=UOrm/8bzwY6vzTqms06n9LxCxUm0IvSQYGX2ohMKLoNGTkS8yIBhn99g9T/kEhZUL/+TeOTRi7vRKX1AMwXT2WN7HsbNEGEyEhx/gVMFok24s1PivrEdEISEgjOIYzadq9UtDy7lXf9X4XWgdVFha/4jMUof/EBgmOr+ABUopPGxZtWV0JIF+hfh/WZ3s3593D2PmASjJh5uAnFxm4DpMmWLtSIVDp28OoF3sMeZBaTARFIPKMrLdB5rTK6mc9jZtDdECKJwLxIbWOXJ6jlOs5Izh3WQKQm7sFKmxTRsluEWeIm9X90+3mzzFUWttyG7GIsmZeBWV0DedinpoJ/0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xdMcHGrZJvq1N3Xs9DS/AuUbrlxyN/JsBYOw/WhJRg=;
 b=Vfuabbv9gyNMxOOTQHPlq6zEnEPwT/NoDVlapjk4vEFzTw/JUnh7f1GLHNZaytGKdDZx8OAutG2dw4e6wW7apwMY9kJ2t2NGyQF+yyhzoTnNvYR0kAtBc06IYVVmAPOEqCs4TvGvcFEHnNiKYubHeKcYFue+ifvEXq9OhXGauig=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:46 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:46 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 7/7] swiotlb: fix the slot_addr() overflow
Date: Wed,  8 Jun 2022 17:55:53 -0700
Message-Id: <20220609005553.30954-8-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3528f4e0-24bd-4d9d-6194-08da49b3341f
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB51262F3B4A18265C2FB742C3F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Hw2XOLWs69rmJbKaYgjiBO5Ff1axa/FesU6+5saE+jEdk3I74upd15GtORLYL8fmC50GmuHG9nOetokT4cjgZAgGn1rkVA33D0Mf5/CL90JvOF5E6RQe0ExgKWAqo8uweE60/DNKne5LGZ30/rHKxAWBWfTgVym+o3q64Zp1N8iS4NGMgggat0AWtvPKD4hAkwDjAVAGdFY7TBXmNtKU9RGpDvOQ7Cuc8S9Dxuw6XKrcRpNMg/oOKJ9PRlsVJaC9p1vzOU3VxsR0EmX3+lnFWrmitbTnRYC4Xvy9oSwopXdRdti2DV1VQ88QO9rAUw7ZEr1+X8IOxoIBtfZX/x3z8wPls5hf6CrsvGIBGB+jSbxXQvF+o9/uUUTJpODDlOnpe3tcUq09H5Nvl8UO6O6/HhwFkUgWzm2j32+kcOXTRNTQ7JJZv+71KmNvsS+aUjpy03/IfU+zPFWFp1D6jPZbEygyvIygUTx5nVtQL66Iir/5rPg+COv+6rHy0tSwqqTQmxrtTTD0uSRLLFGLbkTUGz5RLGa90ro+ato+ohXuvOu0FiDKcIvfSJSYkZ64e++x/Uq2RcMvUvKmtGqAIK5TXaJtWYdsWbH8f0W8gj1QbuGspqX0oyVln3auTvRGBxhTE4fNO8ytQqLrrlA2GDRmbGt7HqZVCmzVAAsenohRhczDmkoaRg9ewjasXNESP02CNHhN9TaRwXlkNZ+HBl/YGQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(6666004)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dO7j1OhcZpj0eBaof3FrgXcevtMQyym3E7YKNGKux9JDsaueQyGsMMZvtMVQ?=
 =?us-ascii?Q?aU7V5UaNG28P4P1grx+GwcIR6OTDHrTFqPvn87xipS3mABbVgAzpexuF0Cuo?=
 =?us-ascii?Q?6O9a8qmN0d1UTbMobhkZZaxlkrNzGrVrhMXco28+DS6c9p4M4CVeyiLC8Pnj?=
 =?us-ascii?Q?tsPZ7skYRxxrEzfeH5e5IHBiSXMGJKh8Muu2jjSj01e2YH+1tyq8u7Ci2Cdz?=
 =?us-ascii?Q?k3ISjZeCyA0k4YP/ywgUi2fmGKJFxWQB+jcJUl9gZudTmi6wBBv0A4D+h+ux?=
 =?us-ascii?Q?JR9AlRc4SbGda4kP5Gy1RsBAurPLyQm8IvCRUZLeW37nPezImK0ZDPXd0GgS?=
 =?us-ascii?Q?CKUPPteMHlH4cOxVLHu5UIeBkLdbnJ6CwBtPWyK1US/pm6Bu5Up4+HRm4ZJI?=
 =?us-ascii?Q?hOP0vqMyuY0q9T0WqjOHnNPwXteClHBPxXej2NinuXC4oAd4AKUDHkdDlvJo?=
 =?us-ascii?Q?SXJLpptiUtnv99bdYuJceuCPURjKeoxDIb2zUOvG3zwziLbWgbDONCMciorQ?=
 =?us-ascii?Q?DBxZt0VfT+T0stcAbwoOtdMUlYdOdLPMJoa2WX++yra+/fdSSKUmBPZcdc+1?=
 =?us-ascii?Q?MbIi0aQYSDPBOzTQEBPWbEuhBWDBSGk/uCv/pcjnBuA9FvnVbPdoPtO5ynav?=
 =?us-ascii?Q?lXOpo9GDBeBElYoHEL6lBvp184CH9FubB97hC82DnQdHLery5QAI4iJ6AQO3?=
 =?us-ascii?Q?UdtRAWCVOyMuSEONOPMuZNtHZ2JkCSQtWPsPafi2r1bagIbZMzongwcn0G4z?=
 =?us-ascii?Q?WJM3MJM5Dz3OMC70Bjivn9V0eiapGoytm0z563HChmYEh/mVaalzRr+bBMZj?=
 =?us-ascii?Q?CWdDbZAZjXPqJlY8vXFFjZYVRq0ru/ZS3BY7i2AReDNtcF0BfMgzHFRlOwVU?=
 =?us-ascii?Q?i8a+qeHg0jBS3+8HpXlJe+reA0tOBBn1aoaiKwY3nC64lY1+626KDkWB1w/C?=
 =?us-ascii?Q?FU8ad/7Eu44zwTeRw2OYOOE3yLgvHj8++Q5VstgOPu2+e//pWEFUl/TcVIwX?=
 =?us-ascii?Q?hiKMDf0RGOXPjMfwMyWZXxn9ks3wm8qpAEHV388EfOKabGWnCO7PhWsUKicB?=
 =?us-ascii?Q?8Vo0jNvFRM4lEYA6sKoWdyG6UnSyB4DuBN12s7waou5XGDRh5KSW6Akmuius?=
 =?us-ascii?Q?wo0NGzsGMFHl4UYAZki63ChGSIrWnVjSXyBKmHpMeIGLCaMluxhB4ZdIwmi1?=
 =?us-ascii?Q?Y+ay7ALFja1b7XdncJS+/t6evV/Yoj98/C0yeO21K7k7MQ28gMJsW4Fe1Yvp?=
 =?us-ascii?Q?AsWmRJZ9UJHPA/IQowgSPWHPqVAqUY+Zm4k+WcUUw+4sac7e4oKMfyMouC2n?=
 =?us-ascii?Q?GkiCgY2hMwPVdbnXVgwSHToHHanzkmWvA2AYN5Ffp0MkFEiIrhC6hREgg7SO?=
 =?us-ascii?Q?NEMhsxQqsWw00MnYzlFThWZfkDh6IuESZSACZV+fl6qOWvptaz1pCrjhq8Tb?=
 =?us-ascii?Q?viSLey238jUqMRamaJGvXgUb7VzV6T+R67t7OS3ptLiGzWbYJxqHMFPfTJBa?=
 =?us-ascii?Q?iFyrlHubVuuehP0EKsn/rsAtZDutPjzJrc+95Ly2Oa9MBZNeeJferjb2urGr?=
 =?us-ascii?Q?mG4tQNtBHkCEdIRMoD2CfyMYM5F3FU02bps13LwACyiHw3nVJy6zsG1BGN3V?=
 =?us-ascii?Q?Aiu6gyzI0JyUanedCBbJWCWGUYVcJGrepWi4z/ImP6sx2N2+hjOTJ0wTXDIh?=
 =?us-ascii?Q?YJU2weah4Mdf6YGVAsvS2y2Vyqi/aK8LWcvZE8KL07+X3bdjOXAq07jEanhO?=
 =?us-ascii?Q?f0WS05q6ebjMtvkXLMgE6WkRKs0/boI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3528f4e0-24bd-4d9d-6194-08da49b3341f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:45.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsHhpKgQMAFV5IQe9XonvZ6LuEuKA2pc/dZM/yLoQf3ZVc0AGoosmfav76kRqOvKRnjd5EMw+vsDJQK2bGEACw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: UjsT3auR4N1lgfozhTWirii4iLwJ428y
X-Proofpoint-ORIG-GUID: UjsT3auR4N1lgfozhTWirii4iLwJ428y
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
Cc: jgross@suse.com, sstabellini@kernel.org, mst@redhat.com, konrad.wilk@oracle.com, jasowang@redhat.com, dave.hansen@linux.intel.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the type of swiotlb slot index is a signed integer, the
"((idx) << IO_TLB_SHIFT)" will returns incorrect value. As a result, the
slot_addr() returns a value which is smaller than the expected one.

E.g., the 'tlb_addr' generated in swiotlb_tbl_map_single() may return a
value smaller than the expected one. As a result, the swiotlb_bounce()
will access a wrong swiotlb slot.

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 kernel/dma/swiotlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0dcdd25ea95d..c64e557de55c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -531,7 +531,8 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	}
 }
 
-#define slot_addr(start, idx)	((start) + ((idx) << IO_TLB_SHIFT))
+#define slot_addr(start, idx)	((start) + \
+				(((unsigned long)idx) << IO_TLB_SHIFT))
 
 /*
  * Carefully handle integer overflow which can occur when boundary_mask == ~0UL.
-- 
2.17.1

