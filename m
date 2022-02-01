Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACF4A5758
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 07:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnwSF2tLhz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:46:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=mcIvSmiu;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PrOTh6rr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=mcIvSmiu; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=PrOTh6rr; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnwRM6sbzz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 17:45:12 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2114xN6x001185; 
 Tue, 1 Feb 2022 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=FVniKTnuRETSiQn4DFkddxSx7h8DfCVcb0Vw1ZPchEc=;
 b=mcIvSmiuKbCdwao1GvQg3eSC4NfIabOncLk6m4lO2fto5CI4QVCBE9F5hmh0BHR26kEm
 LlLbtTdnQ4uDRrffsbE2ouHETocgqA482jTX9aLOr+KkjXaxzKb1XH9YhSjVg5OkWKcD
 dWOz5RIiSMIZZt0d7UAH3KSDoV/U3A2+I3pOrMo/QLtQ9CxNAo4A2Oz5c6XUm12FcmdB
 GevqCqDzuHoqvgvl7ALZ3tJJCQEoKsE2e/3s3EfJiJI5+9XGk7Tb6xypnAavzj21+Pc4
 b3KXPcsykG4mctR5vPOTnBqeLuPaWcMqGeUD0sfZNoW1kGbalZeLw6PBvc6QlwmjVGkW qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxnk2h8s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 06:44:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2116VeW5022226;
 Tue, 1 Feb 2022 06:44:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3030.oracle.com with ESMTP id 3dvumettff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 06:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UELBln/vXKNS1jISQX1czASY4TDx1zsiPwSzokQX9cvMr/p/+lTudrqFEJ1r2lcA39Y8SqPF1hkUBlhVileFRGxsMFCczT6wAc7MOGnHFsLBXUDVH5CKbtk6apstuhjQTSYNMu4Y6YIvmNATOQ/mhd7D1yLxqm965tE9Bk+Go97y1z5ImH5Kb4VXEC7mBI+k3FZ6jo6whhrLGWIZFT+uRoXqwmdcSMv/ST2b4puybf4psvumWxducKgpBnf2hRjMoBmbaCHrxQWlY3WDKvO0NjawnOxO7+L1zG9isdQwf64hMb60+Kcp/duqbR+Rr65hCTUIoYrNEzssmAFHP/McCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVniKTnuRETSiQn4DFkddxSx7h8DfCVcb0Vw1ZPchEc=;
 b=bvy49lC5jASYJDOAjIKrjs7S6HIy7J5es+/m20hOxIrc3pSB60plYgAG4v6RMs+AMDLxDKw59qQHviZzRmtyOApXF+QWSr69lJQThn4hV1HnwBDnzHnazRJluQX/hwN35qQ3HI7nRpwtmn+XM4zzQx8N5hksuaqTKBId/SFhij/DZhJtc8CLEq8av5aWb/OAu5eXaRlT2n3lQE7wtSiin98s62CMKqticCGXiFlbJ/kLVVYCwEAQYw2kpGs4gHUyEZtBwBE5xzx+YaLvKVu/NOZzq0Hb9MmiJS7/F7EOvZX/z4kZ4bfo/XxNMQtim1/1BsuFafjwg8312pGo9zgx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVniKTnuRETSiQn4DFkddxSx7h8DfCVcb0Vw1ZPchEc=;
 b=PrOTh6rrd9ciwKyHFq9UWyq/vDd94uUGF78NxYDqd2ZFOoPbnc8G5ritYQwj7HFWx1gM2y4/XrgT6Atc/ENtf3VD9kYEIT0jsIjzX8ijQLvI5LEQqWc/ywU/dx2PbGu2OZ+2NjIoXOr3faLCudfPzzu1KhUadr+VOtPQ4PBsP44=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB4922.namprd10.prod.outlook.com
 (2603:10b6:610:c6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 06:44:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Tue, 1 Feb 2022
 06:44:49 +0000
Date: Tue, 1 Feb 2022 09:44:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] powerpc: platforms: 52xx: Fix a resource leak in an
 error handling path
Message-ID: <20220201064437.GP1951@kadam>
References: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a2bbd31-476b-4f29-ab72-08d9e54e57c5
X-MS-TrafficTypeDiagnostic: CH0PR10MB4922:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB492253DA568A4FCF7728C7D78E269@CH0PR10MB4922.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfdz6/rQB+1DYiezRlI2o3xv0foYqStkuo2TzDDGIT24Hmi2V5tXOmmtVMN1UMq4Mcv+5JKljvLgvmpdS7T8xpvbuyi+H4ocPA0bMexfY8w+oDbR1cfup3zNuTYADOCad7FG+Srxg/6R36A4KO4ArPWugb9Ez4/z9BIluAq4XWfK4sEN/f7ttyiaRz/wqDWIVgHToV7Ym1k+J0vjkT0RRolJhYWoQLTIuemeGUQvct/eIbW1tyX7POwxxqoKUjfezwqF3aWkKnSEfIQQLHBD/dRJMQteASRRQQVMcegGD5o5LUFJRXsGBLMn0W9HK8RFr0/mu9qhQI0WoVN2HgnZOtEKBEJ9z35X5iyWEMD2wp6y9yOq70MoJ3cI2Cz+yPjnj0tajbjYizjeNBNRtp8Hz0lL4pzDF/uFG3dVOL/G1qLRZtPSrYpMzc8mmDWxRDqJHUzc3Xp6/HxSdKz9SNSJWZthpSRbfuf+8g8LYcJvVs+MhJMZLrBHy0MpLf6EkSNGnyPiQbTmqnI3UVlBre7UOZxobsCrfHh48WC2UeYVBFgYeWvSUqycGu7IUqxVCx4K2xLeuWxMbhAM+5E7S4GAKaxnSMiXWnNnRVeu2aE5m0EKV41mzK3m1xa3LptbjpSfeYkqr2JKkldqba0PNvO9/VEREiPzGEaeMP6xKfJ9Kv3XX4RpiXezd18FoI30P4djUWhfiQ2lgJz1FFvpDWGYYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(6486002)(9686003)(66556008)(4326008)(66946007)(66476007)(8676002)(33716001)(83380400001)(44832011)(4744005)(5660300002)(8936002)(6666004)(33656002)(2906002)(7416002)(508600001)(52116002)(26005)(1076003)(6916009)(54906003)(186003)(316002)(38100700002)(38350700002)(86362001)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zrZjc7wR2/Fq48NV0xxoLjH30x0aRI+OfeQwlQSzTaP0ZZfX6lAQvZ9Iljvy?=
 =?us-ascii?Q?8BoEEmzrAykJ9xL+wmNODwaCPS87TVohf0AzyAVMrU9pe0vAkKr7PaxqF8fp?=
 =?us-ascii?Q?IXvdcRGQ6VTmkNKe8d8zSNiBcBtAamQ2KtOwDWqRKgKN9jy31Bz2is6CMqpj?=
 =?us-ascii?Q?QbprlvppPdYtbF4dSrj282/XIEEFWsK5OsI++3n2qYaLIPuWTKrBVuWg0XyW?=
 =?us-ascii?Q?Bj5rKqBJks+b8x3hsWO0D58b2VJha8ZtUXV+S6qpBRO3oR4iwoIudCk64sXM?=
 =?us-ascii?Q?1qt3vJykJtFNpPBntJgIs5s/OL5Uy/66m3z5k+U0foxP1SwF+/zeDkay3tUP?=
 =?us-ascii?Q?GxGYY8GIgUfvox4GhbmKaUuGabITAXGOT61z9lQyX/+bx2htCcEAiqZVc6zV?=
 =?us-ascii?Q?bPTNdty1eUIYPtKLN3Png7D96Pbh16jNHKAcH1VkTunkBamO4WBwL1+W9a88?=
 =?us-ascii?Q?D48P2JEEuQoI7X5pJgtUdsMwiQDEBHQmTIq26wdUnvI6clB/mjwZODn7Zsqg?=
 =?us-ascii?Q?nNVMMYY9z8QSEI66iQIHtN8CMNCW4j/BtCcIxgaWGg8PHx6ciIQ8rb0UUs5l?=
 =?us-ascii?Q?UfHl3f1dj96xlQvKgDzCc0SrOtc2H5L9w0EGmUAD5sEJ9zoXm/f5o2d1cp2P?=
 =?us-ascii?Q?Q8ePozmrCSCOjnZtdp5dLERXjwlFhJ00R6oo5pon/AcZCkcPrO6x7gx+Faaf?=
 =?us-ascii?Q?vjjG7TEJYIkKm9zh0WDVjFqgYLfX7odxaAY/83A4+Cr2axggxKgcmntG/Su9?=
 =?us-ascii?Q?WOYgenvLpEJhYzG9WGyECqYJkMU5uHuUQzDjSifnFTtfLNGFZbE/yStqkvMU?=
 =?us-ascii?Q?WIF4veBnsrxTY5tOoGiMvBKYY2vlSHlIorAViSEJ2dSv05Pcj0axTuUEHf7u?=
 =?us-ascii?Q?vgnVc4UTwCftyST9t+CNrtxtQdF9KR7rcrKpMk9nL6/h3n9a4RsreDOM4TZx?=
 =?us-ascii?Q?AHhZ/IHg/uDsDeNe1EjSGpZbQ9XaeN/msOlVJF8EBM9CiE0K8YI9gWOEpv9i?=
 =?us-ascii?Q?wkg1twE7ltlOfWoz3XyEAww/EH81qgcLjRRIAX8rGxILjcBuL2i4/URirFWi?=
 =?us-ascii?Q?juL2LNcrqSQzC7hAIKH4rdnaE0nIOzrOqnv7V4aLCJskDl4YKCRLeiVwRfpo?=
 =?us-ascii?Q?59kzyz+E8yTSNlCx2gO+AM7bnjHLjIlZnpjdICm+GRQONEkb8XGGJDlagxst?=
 =?us-ascii?Q?BbTtlanj8mdSD106ujbLzWUYFQMuFGw2mdp887nqD25nQNCPJyQsxjMIIw2H?=
 =?us-ascii?Q?tNRV3KHKODCkwt1hl99yCFqJOlwfX8DJbliYpCkcb/Ai/gnl5v5OqjtyYY1P?=
 =?us-ascii?Q?LYVGQvi+Ud7cmt9Fawp+tA1J7hWHbSUdCVmBWptoxjQv7gq3rnw2RI4rZq95?=
 =?us-ascii?Q?MfJc6p0yi7F8QppBYLW2RhQE2cxMn180+Tb015l3G0xtJsQJD0ZOb/gU1I+3?=
 =?us-ascii?Q?vwFesoNU2Xq+zfWs+LiWm02alu0p0+wX064KLvCgetJpPS05Y+ShHQkwmLku?=
 =?us-ascii?Q?7/Kxz/fratazBlos5J0804zQtcjN5srnFKiz4NjjiqZ7vOlKNM/mLWMHUb3L?=
 =?us-ascii?Q?HZCK7Ly9uEbKypQBED8wpGMSYkedg5Eyyt+Ba4VP4R6qpAEp+SXRr+GrRfo4?=
 =?us-ascii?Q?kY+RhyI4QtzeJzSv43QFtETmzHkACmmxIJ8zBTDL/HRlapJZJmxbUjNy9iK/?=
 =?us-ascii?Q?1H2/P+qxBGwL00UwSZ+8ExOGqDw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2bbd31-476b-4f29-ab72-08d9e54e57c5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 06:44:49.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeZytTrfB/Lnv38iSZldV+5dr4SIU9PsGgyh9olPfAN/kGqVVMfS/QvY55PP6TQepHj1IfRyYXPpdO71rnpsKe0UzIWLP35Cd9ySBn+j6JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4922
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=600 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010033
X-Proofpoint-GUID: 7UkjdGNDPis8no-a5K0G0mCfidI9RzC1
X-Proofpoint-ORIG-GUID: 7UkjdGNDPis8no-a5K0G0mCfidI9RzC1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, John Bonesio <bones@secretlab.ca>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 08:16:04AM +0100, Christophe JAILLET wrote:
> The error handling path of mpc52xx_lpbfifo_probe() and a request_irq() is
> not balanced by a corresponding free_irq().
> 
> Add the missing call, as already done in the remove function.
> 
> Fixes: 3c9059d79f5e ("powerpc/5200: add LocalPlus bus FIFO device driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Another strange thing is that the remove function has:
> 	/* Release the bestcomm transmit task */
> 	free_irq(bcom_get_task_irq(lpbfifo.bcom_tx_task), &lpbfifo);
> but I've not been able to find a corresponding request_irq().
> 
> Is it dead code? Is there something missing in the probe?
> (...Is it working?...)

I think you're right that the tx_task IRQ is never allocated.

I'm pretty sure that if you free a zero IRQ then it's a no-op.  It won't
find the 0 in the radix tree so irq_to_desc() returns NULL and free_irq()
returns early.

regards,
dan carpenter

