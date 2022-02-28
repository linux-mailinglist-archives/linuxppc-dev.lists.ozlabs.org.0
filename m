Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683454C6DF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 14:20:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6gxB3LDnz3bcX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 00:20:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=EnhnqTm4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hs1jQOzg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=EnhnqTm4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=hs1jQOzg; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6gwQ3NKHz2yQK;
 Tue,  1 Mar 2022 00:20:05 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S9tlXj030174; 
 Mon, 28 Feb 2022 13:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=BpCpFRWadI3hcdW4WO/cYAAjPiz3iVG024rjbP9fhjU=;
 b=EnhnqTm4q0MKHVuEI6U1DJ2boZvsKA3UCLT41/j+tiRk5dEgMD/Llvjm87V3MxNffieY
 HkvOxt9Se4EkbSGMXV+7e5wHnJxgIAIpYl0aEZsWRobms+FxjtA5D7arEreNS/9qVWfB
 ZoSMkRDDkS+e23PQYcFfjtEB9O/M30+k/m0F159hNSjU2qPkI3MRiC6/JtOAMHM83S7c
 Vui73gKfPfrs0qC750qmEkLv/Ex+hHiEq00Dw/1kCEnMFe2ZzQt6FpPr9IE3ESL/XPIW
 b8HvfgXKRZXLQBRQofKp6ARLQ9Dp3Z7NsEM0Guz9TjMYh59qrCcoCSQMPvzu3Dt3/eiV 6Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efamcc5ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 13:19:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SCtsAS165736;
 Mon, 28 Feb 2022 13:19:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by userp3030.oracle.com with ESMTP id 3ef9avg2xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 13:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbuQs9i0n96DInX3/LGiPsRvJK7KMUFc8d42jQoJn4T54r89xaCXYE9Fry5o8kD5TqL9iqKYmkQ9PnUEV2PnL81UCG8M6Wg6/HAoUq9MmLg4RvO4O/UzQIr3dPtYzaitTaPQoCNfxGAqF5oKR8LoiwUajHNBOjXjzHZz5lZH+DCI7WlvAuuTnZhgDdnQR3O6ZR3psHyVAI6ULNYtH2OzfHY/Oe9uxEyCSGJToqCB8KYzrHPtgliPjNFp9zOjLdh0T0OxJIWSJtCSxa0HZG/L37i6mj1KNOfUoCW5kzhFfqpO5ZPWm8R5/YMODcX/dMG+gb6yfsFIz0dOUc0+jtTkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpCpFRWadI3hcdW4WO/cYAAjPiz3iVG024rjbP9fhjU=;
 b=b9c5UZVgcH3UVg+V/9l4tpIL1XGV2Af0Jyg2Vi7GsboJNGsOXPqR1ZfJ/bnTaO1xEkPiP21ssQm79t6PuQ0Lw71+CjaoeHREL7YAuvdyNBNBu4s8SibeoxW+2LCDrRzmJhBWlOg6UpdnazDdfNFeKQm/x7ZswT/eGSFn92JGrDKXxyLPWT02iciv1xHIY8TcbvvjgtyRwAMeekj1cLlte5tWV6b0LcQINCcuG3EAGF2jd6VepfXLCWCwAiJ7IYe8s7ZyarMT5nZ2ts03YfKE2nyaQxehCu25wOqnp1nBzg3Fx+ljnV3gwuYW8FJgvXCu+JTFEaCzcqaEkL3psTlkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpCpFRWadI3hcdW4WO/cYAAjPiz3iVG024rjbP9fhjU=;
 b=hs1jQOzgSS9R9uO5OVGNeJK8c//w2LBWBpZDKq/FmikY7dr5bRKkpm6/g7sa5xINqp1HY3K9rRa54D79sxZYgWztI+Zy73apvOpGPDycjZfq6St8wZ/lZsEmUaEVQsP8P8xijwrZ6iI3qD6JgZqCuHALA+bjbC2NC9apxQsevQ8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2572.namprd10.prod.outlook.com
 (2603:10b6:5:b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 13:19:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 13:19:26 +0000
Date: Mon, 28 Feb 2022 16:18:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past the
 loop body
Message-ID: <20220228131844.GD2812@kadam>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
 <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CTXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:100::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8cfe4de-c3f8-4e34-8a93-08d9fabcf163
X-MS-TrafficTypeDiagnostic: DM6PR10MB2572:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB25729C5A6710473BFE9938598E019@DM6PR10MB2572.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/7Gjr4hc9UR3UILFFCevCzRFccoBYUL3t/RwWvXOz3DK+azLgEu94qZg3pCfJZ7vXJypoTb2iBBqvHUSLWbPny1NUYdjnqJjCmNc+kX1m8iMETw2tX2Duanns/sRhTwjF5+FzSi/7iLgvydxCUTKKH3wzTi4EetCYfX5jEKn+XcWom9zySyjobGg/HwhlkMTUgGXAQKr6nHPuKrUbF4oJRbe4+RZog87FC6sg9QDWU9GpMKOqdWgopZdA0qyRp0D5RmlB1UmFbHRTka8sICTUtKVNSe+BNyhh1KofW3EpNC2W6yXIsKt+XZ2meR43B0gs7OIET3gYTp1t6iCUEwN1Cj4YD1U7/MC5pZcYKzoIPRDSj+FGnKvTOdSquJzDVXWmOaoCvVB6T6xRvW4OqAJ+OPKd0Kuvq8J+RQAWlm3J7N1rZEFIEMF8KL5gnPmg6AmYik3JfxsHEm8arbWnfH6jdXJyo1Wzmhyry8fq1sEhdO+cXvJk1Tx24SVxrksJln5ybIhopXHJ5Io6pPZhM8Ywyr6fhk9BScyyJpQh3B32CVyunfsCaCuIAjrMPj1ZDi2ibb5jxRQNof4TqAB9bzjkhrjXkkh3PD8RXcR3J/fXQBTtc9AEhpuVac9YuWLU99Zy8qo1wJjvLX2Q00L2iVtqeXcF2fu7E12Wi/TLz1WaMAN6T0e1h4pwM0GIRw4aQiQjLbbfkkC+JcFfsTPKZBuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(38100700002)(38350700002)(86362001)(9686003)(6512007)(316002)(6506007)(52116002)(26005)(186003)(1076003)(6666004)(54906003)(508600001)(6916009)(6486002)(44832011)(8936002)(7416002)(7406005)(7366002)(5660300002)(33716001)(2906002)(4326008)(8676002)(66946007)(66556008)(66476007)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XA8iGyh6ctCkhMfSlkfeEgOv/3Uj9MpVZhYEQ+jbT3g1fRRLGDSael/lFx1r?=
 =?us-ascii?Q?tBZT/BaSLcLUq30E/u4Q+WjZpdZ1p/Kg+yG+5G/0mWVcacr+63Ukwge9ofl8?=
 =?us-ascii?Q?ecclUH8cz9+0b/oN6g6YSjGHGL5aU0i8lq3aeufaxdWce2sCAxIRBi34ppfu?=
 =?us-ascii?Q?1/aEJEtRM40TsNlF7gWblDnq4kh/3FiW6YT4SY5/RnSTkWo1WUzTvdl5VIsq?=
 =?us-ascii?Q?F2j+ft1yyXj+Pj5t1/6ImQfmK44X2KDv6h40b7u/k1udppLKMl6vbjfKdlmb?=
 =?us-ascii?Q?JmgzcpJWXwtTkWkqOGUnAWgRCryZvpeSx6nl3Aym+TMNI87gDzILT5vsDwZN?=
 =?us-ascii?Q?E+wwcUdPXTnBH23JMSUSVbzrrBR7QgbDoWm7sXGw+LViP2ggH57D+4PDoPD0?=
 =?us-ascii?Q?uu4d4Uiq7BueHnwqcI0FXuWCZSvBDZM56cnUsoobVkDPNirz+gXUQlKgKREi?=
 =?us-ascii?Q?eGzYtiU4RcyMA2enWSu9yNVxgNzAsH4h92A6gRR9Fl59x8mIj2mN3pseONA1?=
 =?us-ascii?Q?jYI07ty3g4jwSMXBeyM8MkCuHWZ8tF12hK3pUy8znhWZOl0GJ4dNHkHqbFsd?=
 =?us-ascii?Q?AWU+Exc6X3ad5eVG1WzuKMozN4TQyWXiTLBM8ElsqiND1frB83zfSLPmb0RV?=
 =?us-ascii?Q?vG6YSf4A6Sd0vn0QTDous9eT4NGvbHVEfJaUs4LHuWAKQOt7q7EYiwyXHsSb?=
 =?us-ascii?Q?ilHtrOp70+Houefscn/JJ8tBzHZmLVOBbnMYM7dg7taj3Mqy9SWbTUEso2Fv?=
 =?us-ascii?Q?HOUfDY3m7Ht8W1ZfN0r/6g2bJ/sUA7YqA2992b7KPx+PS4tXeFc6XFKs7ymN?=
 =?us-ascii?Q?B2fT8khNzLhcgnzNOAYGvBACVztSatg1jhQsbvco+UciFgHITgepubNEiAOk?=
 =?us-ascii?Q?ZLnZZvY4re99d9kEGNel7Ar5kWMSNxLqb93hFr6STooFohKrCJSRSgW5MD3b?=
 =?us-ascii?Q?dtK6P0QgSCILTbWMXfjj8aDpgkWuQdwcOG1+5RYJH8h1bIj1ueCLBdCBMfEA?=
 =?us-ascii?Q?mPmy1jlWtA0ke+63+3gFhOWcPTOKl29UFKWvfTQUPuKt2Sc7dXoEUvupTure?=
 =?us-ascii?Q?tPeMkqqMmdnLFQlz8dRlUlq0Md5Oks6XHhb9ahElB9yd3DKAuDCMcCqMTFAx?=
 =?us-ascii?Q?uKXHGHVUkdYcHFzZvo0kRzvVrTdbNMJLtPfsipJyfvNRRToOybbEJ8FxrAHN?=
 =?us-ascii?Q?Gw3i1CgnlP7TieIgs7vky3J5fRveKQR1jBWJ0gfQk014c8UPFkdLYnR+yQPM?=
 =?us-ascii?Q?vMV8vYh3kq9Z9E/pYYYtqyGBmXheA1RYIFC1ebSVXzqgT2d2JiWu0PvokMXB?=
 =?us-ascii?Q?cQiavwrvLRIvY3JP5q1L3F1bPQlQmPY8aZNnrRWIVtfmKJ0ZGyGeeFxQsAZm?=
 =?us-ascii?Q?ySPFMyhuINNdoyn0nDFVa+aVx5TycWtI/w8n9Duycaf3ZjTFMGIsVxCr00FP?=
 =?us-ascii?Q?oHhNnIA4CVkxhuXL5xpSsKw1+a34EeoF/vIj6dJMAx2jBcGw0z2mXzqsIpzP?=
 =?us-ascii?Q?ldFdm4Fk8wngq5JKeoMnaefDZiWgdpo8cmWg7as6Ad34QhcWpSuJUa8+61/A?=
 =?us-ascii?Q?XnsNquEXMqUFtaKLVfoCRCzi+jaNZ71XgNoOkC6sAi5W1Cb0zmdfVHus5CuM?=
 =?us-ascii?Q?j+k5G8i8m4sNWIFv9VqREoOlB/K3kQMWEyUms1gt1Y8cxSN1KrNdpW/9Yxm4?=
 =?us-ascii?Q?YPXRiA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cfe4de-c3f8-4e34-8a93-08d9fabcf163
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 13:19:26.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43pc79CPg8R2zP2VJ4LtI09T6KvZwz3YFpsJUYrvND6zokSjoBlun3Siw+0lPXveHyUaeHTAe4hI63NGUcTb1Pv7nDh4i36bc95x758oFiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2572
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10271
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=842
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280070
X-Proofpoint-ORIG-GUID: 5JfUEnwyGXyDQ72snBWDP1R4gU5BgE8f
X-Proofpoint-GUID: 5JfUEnwyGXyDQ72snBWDP1R4gU5BgE8f
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 01:03:36PM +0100, Jakob Koschel wrote:
> >> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
> >> 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
> >> 		net2272_done(ep, req, -ECONNRESET);
> >> 	}
> >> -	req = NULL;
> > 
> > Another unrelated change.  These are all good changes but send them as
> > separate patches.
> 
> You are referring to the req = NULL, right?

Yes.

> 
> I've changed the use of 'req' in the same function and assumed that I can
> just remove the unnecessary statement. But if it's better to do separately
> I'll do that.
> 

These are all changes which made me pause during my review to figure out
why they were necessary.  The line between what is a related part of a
patch is a bit vague and some maintainers will ask you to add or subtract
from a patch depending on their individual tastes.  I don't really have
an exact answer, but I felt like this patch needs to be subtracted from.

Especially if there is a whole chunk of the patch which can be removed,
then to me, that obviously should be in a different patch.

regards,
dan carpenter

