Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF42F7107
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 04:33:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH6Gj1yyGzDsYk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 14:33:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=it/e2ICD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=sNIWHpW0; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH6Ds2y2czDsXY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 14:32:12 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F3KK0t168201;
 Fri, 15 Jan 2021 03:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=FCQ/65N9EuV1za5A2Dfm2755nqXpTVDwH3ZYsZwBNkU=;
 b=it/e2ICDujaoGhI2jcFhK6aCRHSlBCIQpEVx5rTN2GcCxG++Umeh8c6cv8nDjSC2g8O7
 Y7VB21lyNrZEXinE0AMF3VhVQHIYHsqSRqOqxUvPJ0MbJfyGSwknxSKLCWXa8q1SGs26
 /Wu89EEHwbGjTl0NlZJYPbjGPJXgB610T6D3n1fY0I5a8aij6wvj7QIeLAkdVtRey0cb
 9J/OZXtMdaFyO0dDGi7tfynnsN3M3Y93RkbDMU94A+5x/5KQN3Z18/yjLPBUfxZy3h8v
 5Dfmhjw01OEtMLIuwF0oa+OhGYlSOOynZEJa9W5Pgq8LKYEehdJMIH5dYrqsK0axInp3 kQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd035n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 03:31:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F3KuTT174278;
 Fri, 15 Jan 2021 03:31:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by userp3020.oracle.com with ESMTP id 360kfafv7c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 03:31:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C79ZpezSVSendANJC0reFNpYp3YOc0e3LGGYKwuYr27PeNelnewxLqgwugrSG0jjKBAZOEGT9Rj0qQtT0NNaUDO13QjfWp9+ivzCoPaCbzr7PVwx6yV2h3ZsvReIBWr2znlHXhy0Rks/wDg9aKtOj/glitIo3L7hy2YDruNnBrGPwAOtD9Yt3MszU9vVtF2j/pxIVVGSW37ovyt2VtH9tVwZzxi/PaG1ftvwM6cRxEjoUrWjf8iiqST5HCWRv3iXIwT9vbCnZEZv8sklWm/BVipwtWBapRlW2z/pTMg2+VHKh3hDEA8NEKKHIZedbmhrFarkaZL0/FPIWxWGqoGMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCQ/65N9EuV1za5A2Dfm2755nqXpTVDwH3ZYsZwBNkU=;
 b=OZmsl/xACyC//P93uaOJU0ZOpnF77tZje15IXD5OutwMsImPP3m13fYfYGexWR9Ua8p40t4FhhxWO/9qISfD7oE/ArOkcSLFPHgZqrfVzPdUJ0yRHemh3aYde8k+k5oYO3/McoOYMQaG7Zivsxjr6ww/ihbiuMqHmqW7s/hdmNIWaRxwmkbOqKFGXfrzOi+yoXZjkTIbea5lbrOs2QnjK7819jPU+5SVXEWcG9UiW4nMb5AYdQhUjhA6YN5dABeWnCoCrU/mrq39/nvLcrCBdd/LjYiFNBsEJvkUYZ+d8vODU8KtZjFookwDbqivXFaOI+AwhCZ6JwEEvMXlo1hnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCQ/65N9EuV1za5A2Dfm2755nqXpTVDwH3ZYsZwBNkU=;
 b=sNIWHpW0bLQkAECntbBcr4ruCjkuPx27WKgNRbQIlRCHbsBbPmHFZ/O21cjBpmCru10mSftHcd4rN51V8R0ZnSviDQuOq148QZ7hdHCmGIquyHEQ5OqfpMIvqUvRnxw+i+1D4TkZYlBfvn3kB8UH4+lsC7pNtXrt3jLTieG3RvQ=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4648.namprd10.prod.outlook.com (2603:10b6:510:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 03:31:54 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4%5]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 03:31:54 +0000
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v5 00/21] ibmvfc: initial MQ development/enablement
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq17doeswoi.fsf@ca-mkp.ca.oracle.com>
References: <20210114203148.246656-1-tyreld@linux.ibm.com>
Date: Thu, 14 Jan 2021 22:31:51 -0500
In-Reply-To: <20210114203148.246656-1-tyreld@linux.ibm.com> (Tyrel Datwyler's
 message of "Thu, 14 Jan 2021 14:31:27 -0600")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 BYAPR02CA0061.namprd02.prod.outlook.com (2603:10b6:a03:54::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 03:31:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ccde7f0-dbf0-4c88-b1d3-08d8b9061ade
X-MS-TrafficTypeDiagnostic: PH0PR10MB4648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB46484BFD484933B29959E22F8EA70@PH0PR10MB4648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2kDspNriN+cRYsSfleqg7u3hD2dr0w/TrqH2idWLOYX6SNgP4j734MVp+JNuv7Xpn2VXkdS0fyZ92A/wIWfMuw0i5rygI/5uQ0EzFSspq7ojpBRGwRrOJ49Qx4R7dhDZfc3Fe9IjTPy4zi/6r8wpRQ5SyUNhv4pDkri5CsTlIEgorQUjeLC4ahMEkiUQv6fPJKKWBcKuSwknPMxTgTaWhsZ4iZBK/U0YX/60XZ61XLAtkT7nN18p2BZtI7K+rdbX9mHyLmfoOIyP47nrM5f78FG5vNuGnTt8VDY8bEl9xC2UJ9F9xeHkX024r5oWlZBCZ0i2iwkmnhA0bbQ8Mm6y1pyIFrq4SSdxJm54YK9Soq5DIL7Ra/aSvUAsU818UxgdmTEb7BY9cVgTRi7DMLxiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(396003)(366004)(376002)(136003)(66556008)(55016002)(66476007)(8676002)(5660300002)(6916009)(26005)(956004)(7696005)(66946007)(4326008)(478600001)(186003)(36916002)(16526019)(4744005)(8936002)(316002)(2906002)(83380400001)(6666004)(86362001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UdWVj3BHtDztfdtj3FLCqHZji8WbQZVDvQrq+JNc0L9VfAFLDaelJiAXEBWs?=
 =?us-ascii?Q?nNRfZTLaie58hoJNerks0a/JNRWwcyNHJsbIxkxznJmqCM2drv/UBjt9ljN0?=
 =?us-ascii?Q?gAeSRFs4SOxSX2ZlV1Uo7ZbntXeiHcFQN7cFZ3TebN6IC/CdKgw3b+BzbNSd?=
 =?us-ascii?Q?aP7QZc3XA1ADrP6lk/cshaxdLsB5kM2gzUUWScJmbUDFFfEgE/9ew645aFXo?=
 =?us-ascii?Q?PpKxWBQ4Pfv49F3yN+bzAdvjD7WF6JHAg5j9WbUW9JC29835yAhkiNC6YASU?=
 =?us-ascii?Q?tT4JdYVzxaD3Ea+ihOBQOolKSKO74yVAlZBU/+wV/I8Ufj92mkAUWuyRR1bg?=
 =?us-ascii?Q?1kjNWoj7U0KOxuX6yNB3Gbkf2io4rSkgC32vJxc+YQrJ6Z6/hUluQMQ5AWYF?=
 =?us-ascii?Q?94ZNxKt3T1e0N62ZLlwGv1MBPP2mwnLytD5f5Vk2cXdtuqJAFxlKfH2KivW7?=
 =?us-ascii?Q?CtyCl7QopvL8GzXRIQNkI4Vp9BD651Hg+1DGVaxkpYuX0DA0O6iUSO/er6vk?=
 =?us-ascii?Q?JSJZTLdGTYtdEa2uhWhq191c5L7GDcT3lO7YtvN6vY6rWO8FMVcjeG7VVnpM?=
 =?us-ascii?Q?+Fjt1yyYx2+AGksnIsQIuS/77NB9ouj9uLggZ6uxRiX+mkxij+hUjnxYuUOo?=
 =?us-ascii?Q?Ghjg1uSWF79srFa19rC8z0Blyvyd+S2437hjqFfkYVY1GFfy2B2YpOWnG2q9?=
 =?us-ascii?Q?kalJ0OF8662S8VBMFpMSkuwfsnAj8lcl1tM5wPUlTT3jXGUo8uwgfwmOWZj7?=
 =?us-ascii?Q?XvAnW1MY6BBSzCsCHZEqF5on0XkH0ffWU8J4lTCdLpLCGfNsyyTG1Lw0uW2d?=
 =?us-ascii?Q?Xym3PnhalyTOblMKHVjR+zMeJ79k3i3b8qgtWD2udAib5xqZuoFqvaEIoQsd?=
 =?us-ascii?Q?56snNfRb9yEMaD4fLQWejfC11LSr20/4nbkhfernOUQheJAZurdIhYCjOJj4?=
 =?us-ascii?Q?qAdPolpP3//U8u4+VnpTxsy4M8akCpSZg59hwX/1RsM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccde7f0-dbf0-4c88-b1d3-08d8b9061ade
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 03:31:54.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hry5gys37NbPeKD7G+2P1FLMJXsGfV36EnyWsuXyMDwLBkzQa8c/MEc2+Cw8TBlFDfy+AQE/l1eIcN3ubo5opJGCSENTbtaYdlVbkli24ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4648
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150015
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Tyrel,

> Recent updates in pHyp Firmware and VIOS releases provide new
> infrastructure towards enabling Subordinate Command Response Queues
> (Sub-CRQs) such that each Sub-CRQ is a channel backed by an actual
> hardware queue in the FC stack on the partner VIOS. Sub-CRQs are
> registered with the firmware via hypercalls and then negotiated with
> the VIOS via new Management Datagrams (MADs) for channel setup.
>
> This initial implementation adds the necessary Sub-CRQ framework and
> implements the new MADs for negotiating and assigning a set of
> Sub-CRQs to associated VIOS HW backed channels.

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
