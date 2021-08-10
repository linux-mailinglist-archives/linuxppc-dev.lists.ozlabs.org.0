Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008723E5495
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 09:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkQ8D6FS0z3bXC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 17:49:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=PM8+zE4L;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=cPXe4IQN;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UeTBm9cz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=PM8+zE4L; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=cPXe4IQN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=UeTBm9cz; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkQ772wkNz30BJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 17:48:33 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A7l56w001869; Tue, 10 Aug 2021 07:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=tVySjMjGVrK8tRyCRnMfiCpKSYCC9qQJSsXv7O1vB4o=;
 b=PM8+zE4LZisDFgCtLLK6WdtGcOdX0LbLCz9Rs6oCsS5Ew3h4HJYv8LYuLcAVP8AMMGr7
 aH+tcw08biFBX/Y5Pb/Gaa3AceMNFtyxMdKsIXWnitP/wEJuSXhOV33xj+26n0H2LFmz
 PLUvOZncLO8SrnWV5t1fgWUe3pPTHyv5sGeD3LoaEurv+3u0gvwh6s+5ImKG7SY0onWG
 8J5IaASuDRhYKfzzz2Xr6s6LzqqnL0EhqYrXjvoddyrhbgG4JUovg4CII5sFjbDldTU8
 DNAtOltR16jLtaR8JmyG2kD0CIeXCqLQ9HSZl3eWfU1oGO2ZZ8vNPjvWSlnJb7hiOhui Bw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=tVySjMjGVrK8tRyCRnMfiCpKSYCC9qQJSsXv7O1vB4o=;
 b=cPXe4IQNQG/FVGRV7clr7M8Xt0x4KvfbwcizsVv7Vr9vxFncNHnQ881wbmcY0vV1Q3wn
 Tpp/rYMRoeyQl1zMXH+IPYZ23YyqKA8E9pA4EOm/7OCI2wZkxzKfoEDvT9+b7wOcTr6y
 o03HKLirh577z9qGCXgndxRmQBhAGKnHFqc4yzTTlFrYc3SBAVmmUllC5EYXwIgBbGkP
 CAwYY0d1s9JINX2rsAWc0508mOumPz/24wl3TmMlPctCsnLcd0xYLIYO8pnFTCcLQGBX
 3fz667Qag7ReseOKxGR1MfUjIw2NVRyb5+eDjJNgJ2EwVCc5z4WoRZJFxPQw0doV80wp tQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aaqmuu9fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 07:48:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17A7kN3P145896;
 Tue, 10 Aug 2021 07:48:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by aserp3020.oracle.com with ESMTP id 3a9vv48x6m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 07:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huoJUkrb7XkQvmvhxU3xPyS2rxKc94M0mWhny79VPcvzAuPKCsD8QxDcBwjBx42hsgMSll3sJqEJmXG8/Tc2kEyi2Y8sWDzluH8hrtP/TCMXR09wSwn7Yl09RUheGZof4hdVywt4jcf4VAxmuEubsAuWSBEBjXLgwPdmxaOHUNEQb/Os5d/feNkWv3bDHFieQdDEzr1NcqDzFYf78+4w4qFb6b5IkOJWFKQ6qvPyPwo8WnE2WEIRa5wNFcjLP6WQqK7zFWvHdLFSuIJ/WDgCKlj3gQQGFn8PxUrcWjddR1ZKQWQNEMI5IKmgD1SpW6Z0/qNcGx2g/iChuFAy80vcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVySjMjGVrK8tRyCRnMfiCpKSYCC9qQJSsXv7O1vB4o=;
 b=kVKAH9fwSzLotjnZJFz1VgAjVVopPrFlYX6q/EFDJhz4BISoZiRT3y8tSbJrI/Bm00zj0SQor6v/MTUrPaNJrOWcwSgju23hcj/dqeY9H34C5kjkP7ktnfqfIrBEu/nzjCFAui9LZwr2T8c1BnnCQ7T/er6PVF0yg5yt9PNm+dssQQm+mBT29vKo63RtgU3iSPOR4+/EEyaWwqOdGjwMUkJAkcKvY21Mj2SnR3GANbWe0iee14EDigMcI1tzgzJh9eFsa32wNy89d+t5aiNQyEhd7Lb9DM0STjjpmqKAr11zxF4NPNzYr5FOF4rlOIyHRW5hr/Jo0p8uZ2QouZgw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVySjMjGVrK8tRyCRnMfiCpKSYCC9qQJSsXv7O1vB4o=;
 b=UeTBm9czzvlqtQn/7Ism4jt2ylykVjXGmivwaYeGdRJutH8RZEUKZRvEz95vaEVDUfBfha07haBvM3yyuPsL5sDj3puk5WpEXQtgtuL3MuDdGoi0jDgLaF6s8OmDI3S1IBcXs45V+98Gq6csi6cWNswQ3rbTNByc0uk3g7BoZZs=
Authentication-Results: inbox.ru; dkim=none (message not signed)
 header.d=none;inbox.ru; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4738.namprd10.prod.outlook.com
 (2603:10b6:303:93::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 07:48:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 07:48:24 +0000
Date: Tue, 10 Aug 2021 10:48:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: fido_max@inbox.ru
Subject: [bug report] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Message-ID: <20210810074807.GA21565@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 07:48:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b84dd15-c941-460f-74f8-08d95bd33b1c
X-MS-TrafficTypeDiagnostic: CO1PR10MB4738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4738CAA9E37864C13E118AF98EF79@CO1PR10MB4738.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEXzO0WnIZjHkoYycjlrTrQg7u9sExov8z2MIGS+fnrdj7QWu/GncCdBYGEEFDK1XX876MxHm1lc08CytN5c0HE466skn+x8BKp/drQPbM5W9dKfGROfXiLp2Vq1knjxk3yAyhHMTzPciAcjzE0MV67ghwcNF8b3Sz7d9uOCdUX+uKq8FFBIHSGsf5TWdCMi8GBnGUiipaEPd7mG3qRSqutOOhcC2+Sr/4PNOt4cx45Phv2sNJZvzKtOLfbtWkh76EydCzcRZ+Bo3bL25qEvpEuy+5nGNFy13m2mvluAN8tenZraZhUigF0ym5VjI/VyYCa5oAN3AQQ0uQSt3Pg2sjU455iXmD3kURDT+dCoPyZETWgHJhu5R9JxSthjpb3bIKiw0532NSHcBcS8ORbeTPHS9ptcRvLRnQX68BJaHNqPM+/9Hkr8lB4LJ8xKz8y0Q/gBx2ufdGXww9HvuUlPt26OQedXa8WLELgiOFDJU11FR7VGOaRH4QVWcxuOrNRylKJJMtXCU9dlhrLLj8eMTtMGX+rV0BBkuoUQE2NG/G92/fgVTpk4F3bky35oc9JDll2tk334yJLKtCkEP45VwkzsoX0F7kF2CL7XJTJJsts6WFPXeytkGBYZ/vhHHbYMD1YG/mhKGJeZAmHY/Bw4EwRIUAP7mQ90B5iMRvnkjysbTEQJu09HmTHySi6qxg2ChyUMLo/S0rbKZWJ5JLIWdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(478600001)(6916009)(66946007)(4326008)(2906002)(52116002)(38100700002)(38350700002)(66476007)(66556008)(55016002)(956004)(6496006)(9576002)(44832011)(9686003)(33716001)(8676002)(33656002)(5660300002)(26005)(6666004)(1076003)(8936002)(316002)(86362001)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LXlTefbMrkSdShhz0+yUOx+zTJE7JqI4EBsi83dBW216qcuo5VQCko7NxYrZ?=
 =?us-ascii?Q?VIY/LFd+lm03kBIaY2HHUfVzANcuL+RIsgYzB5XyH90xw+K4rK60QCbf7XVK?=
 =?us-ascii?Q?bUPsqrZCq7dpA+u7x08xtXyADJTgvqTdthwa3Px3cUF+1EPVGTirn/jdX9kk?=
 =?us-ascii?Q?HFODEqpSsq7OYROJeIMSXzHWtNyenTv8CPvZWmNXdNGQEsuCWZhswMzhF7Y5?=
 =?us-ascii?Q?cjfVD68mWDMIjc6+GOIxB+dezkkRzzHE09StQf5d/nvO7GhZ0AdAlOD2rfFa?=
 =?us-ascii?Q?/x23sU2Z3YMII305deQfVAuw7KvJISPD3mkR5MTreT5T4CTGlqqY9v0jOqi5?=
 =?us-ascii?Q?qPV2zLRMbD077IUfcLDicV7NDUiYlaSfP4YuuBvEyAcVvbydWnfqAkBkyv50?=
 =?us-ascii?Q?WezOfDZJxCU5+bXtSl4cOtdNQi0Zt4Y+tGgA2NgFbV93jES4M7WFu+rNxp3v?=
 =?us-ascii?Q?xVPPUQxTyUa6QEC7aQpDLQKI0l6EpNXVzHXbZbQZ+VBoOdbWvZFKx7MV6cEy?=
 =?us-ascii?Q?lrwICqRc5OTsLlNh5HcjGKl5kBmBlE1wAsrJyooS4OXYy0wA8Xpj7f9YUz1w?=
 =?us-ascii?Q?iGfbbHwvnPHVGy1HiRWGG58YBxrXEzgpedYgoDWJJr04vcKGuYuzSdQFouFg?=
 =?us-ascii?Q?5wmaUoHmWb8JdBU3Cd/tZsiLKu46/eEa9uSggkB3DHfEpqXXJ4j1hgRBkCrL?=
 =?us-ascii?Q?Z0VPGiCSVYEVApgssclw4HFnyXHifSY5ln8St+gDlYLUZzDn0nvUW93gl9zv?=
 =?us-ascii?Q?3A6h39PdbqMU3vWEYoG5P5wKrczSFnlZw7lnmLKwtrhSuIGXXXnAn+rtjrxS?=
 =?us-ascii?Q?9Ue2Y8US60HFrXadzKjlYiqrfUOXPz3bTti3N9appZcZ8evPNIoUQdmn/jse?=
 =?us-ascii?Q?jGGDPVFNIeseJ90wYBJwFolJwudeFe8S5fVRFuUs+9IWbh48L9kuuarAhMi1?=
 =?us-ascii?Q?aZ3WqqAmpS7eQZ9fiCGLyLBE35eoWIcs5Z+QZgUf1qt0x3jW1OiYSeoSzblY?=
 =?us-ascii?Q?WypTrKOUWCXM7HkCn9l1+7kfP5USnGPLp95ISmSCmsTdoICEndOGEiO84N4X?=
 =?us-ascii?Q?id8QVpgkdWws8LKUNtV1dtNl21edmQYIvrHsqxHKY1jUlP+9RVhczvzyd81W?=
 =?us-ascii?Q?AzA1Rr6D/ENwP12Nz59MVtybfjpiQEQ9+5fKQHgeAZ2Jq5ADABhhc/VnX39Y?=
 =?us-ascii?Q?T1YWvnMEK7LuU8qT6WLDsRh+JXWsDZmX7dTzVT+jTzDFvyQopoudflMI3Vp7?=
 =?us-ascii?Q?XT0FcWAA3e00FXDf36oi2916QOFZPmPR05LxQQjh2odsax0tN9Ow/ahHE2lI?=
 =?us-ascii?Q?CLFoSE6pxKhnTrA0NjM/e5nR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b84dd15-c941-460f-74f8-08d95bd33b1c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:48:24.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnBU7VC3nsIji4gFgpli4sAvAyWDIFKk3C5fH1dgvu0n+g2iRpPIKCADePxekEfiZzzbGq7fbQlxOfSXzFoQ3qEek8Njpx84OPbRFa9TEiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4738
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=752 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100048
X-Proofpoint-GUID: N14Q6w26OS1TyAHNdGoZzNffxjtgfBKr
X-Proofpoint-ORIG-GUID: N14Q6w26OS1TyAHNdGoZzNffxjtgfBKr
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Maxim Kochetkov,

The patch be7ecbd240b2: "soc: fsl: qe: convert QE interrupt
controller to platform_device" from Aug 3, 2021, leads to the
following static checker warning:

	drivers/soc/fsl/qe/qe_ic.c:438 qe_ic_init()
	warn: unsigned 'qe_ic->virq_low' is never less than zero.

drivers/soc/fsl/qe/qe_ic.c
    408 static int qe_ic_init(struct platform_device *pdev)
    409 {
    410 	struct device *dev = &pdev->dev;
    411 	void (*low_handler)(struct irq_desc *desc);
    412 	void (*high_handler)(struct irq_desc *desc);
    413 	struct qe_ic *qe_ic;
    414 	struct resource *res;
    415 	struct device_node *node = pdev->dev.of_node;
    416 
    417 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    418 	if (res == NULL) {
    419 		dev_err(dev, "no memory resource defined\n");
    420 		return -ENODEV;
    421 	}
    422 
    423 	qe_ic = devm_kzalloc(dev, sizeof(*qe_ic), GFP_KERNEL);
    424 	if (qe_ic == NULL)
    425 		return -ENOMEM;
    426 
    427 	qe_ic->regs = devm_ioremap(dev, res->start, resource_size(res));
    428 	if (qe_ic->regs == NULL) {
    429 		dev_err(dev, "failed to ioremap() registers\n");
    430 		return -ENODEV;
    431 	}
    432 
    433 	qe_ic->hc_irq = qe_ic_irq_chip;
    434 
    435 	qe_ic->virq_high = platform_get_irq(pdev, 0);
    436 	qe_ic->virq_low = platform_get_irq(pdev, 1);
    437 
--> 438 	if (qe_ic->virq_low < 0) {
    439 		return -ENODEV;
    440 	}

Unsigned can't be less than zero.  It's weird that it doesn't check
qe_ic->virq_high as well.  Also remove the curly braces to make
checkpatch happy?

    441 
    442 	if (qe_ic->virq_high != qe_ic->virq_low) {
    443 		low_handler = qe_ic_cascade_low;
    444 		high_handler = qe_ic_cascade_high;
    445 	} else {
    446 		low_handler = qe_ic_cascade_muxed_mpic;
    447 		high_handler = NULL;
    448 	}
    449 
    450 	qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
    451 					       &qe_ic_host_ops, qe_ic);
    452 	if (qe_ic->irqhost == NULL) {
    453 		dev_err(dev, "failed to add irq domain\n");
    454 		return -ENODEV;
    455 	}
    456 
    457 	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
    458 
    459 	irq_set_handler_data(qe_ic->virq_low, qe_ic);
    460 	irq_set_chained_handler(qe_ic->virq_low, low_handler);
    461 
    462 	if (qe_ic->virq_high && qe_ic->virq_high != qe_ic->virq_low) {
    463 		irq_set_handler_data(qe_ic->virq_high, qe_ic);
    464 		irq_set_chained_handler(qe_ic->virq_high, high_handler);
    465 	}
    466 	return 0;
    467 }

regards,
dan carpenter
