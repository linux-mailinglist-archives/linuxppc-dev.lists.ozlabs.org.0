Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB214C6A70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 12:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6dRT6k7Qz3bqJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 22:28:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=npVyRfhl;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jwD8rItk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=npVyRfhl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=jwD8rItk; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6dQh4mDvz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 22:27:39 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SATFmQ026173; 
 Mon, 28 Feb 2022 11:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=rhxKEyaEE27JRn4dwvDu5iYS7zGXGiTNmt/cV7ZpE34=;
 b=npVyRfhl+RwBTCVc51PMb94s3ghOCs3fYMZ7FKUEWg8BaSj1Kio3RvXQmi1K1H0HBimX
 NaiaHZy4tePWNjmtctnAFImRFWLdex2f3sztGDCK8ah3zEB4uR2YQzHPyfMjp+hb/x0q
 ddfKUeShpt/I9jxrpGiLLKoG5vTYgidZNTzQIBwRZPtG2qwfomdbxpl7FBa1c4iMsQl1
 wsNyWaZJQIxsgP96j9EvfzRcv+PY8u2Jj+j0Hga6x6FkPtzxOUaYSizfvTevSMsvpEyb
 LAvPJVWl7cmb6bo7m8d0myeIsOIJq37raOxEmJPqV0Ye8NhJDaoHPS2AEaQzCD8vO+AU oQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efc3abs56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 11:24:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SBCAQv160080;
 Mon, 28 Feb 2022 11:24:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 3ef9avabpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 11:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6GyJ3TLC/IS1iV8dHTgTe5eXJIo/yDKNj5mMpCGGnM/wAjMRv/u17Ng6MK0I2kZVSZmHTVlkJ7MFApPGtoCkmY9Eoh38UR7A2qheJ423X1zt+uZJbys5161EsN6ZWa+BDDVNG15Hb9kfR7kdwcr+AmKuOkQV3TElpmZNRYMFo5eQaMbQBpjpwksAxleceKvn+8RgRiHo/2oiP56nHlVib8NaTdLBReSZeZlXHbOVVigK36+tWoLkBPGZy+fqKlg77NJW0RzWtxmzliCBs/b5QG3eClxiihebKQ511jSS8wH6FK5ViGpSCgljdTHx28K6kGEjG2LwbqaGFuJcE8ZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhxKEyaEE27JRn4dwvDu5iYS7zGXGiTNmt/cV7ZpE34=;
 b=f3tQIbk/1g2mXLDJlyx2otSs85y6PYgnRnZ28v0U/aAZUBqogV3uA2CK1xc1lk65plWm6s9523jdicaYa7IZnheUTzRO6ARYISy5/anjKQagtPOkPir+Ll6iESfdfsdE2LgnZ3UdV84Z22V3eM6UtQDFO/21Brha1lPJGfxv6Og/nDXnUWbTQtumefAIQhOZ5dsEw8w5OOGI8rzqK1C/oCKiC4kWCsbmimsAsFYq+5pOUceSHOKk8Y653YRH7Dz8bJmd1A2G1Mo8JPdu9/s3pk/Q8jT+TC8oRBs4Dz/XEMZpcHBs/VwEzg0ddyPh2VPcZH0x+nU7I7BGqHWUYPGMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhxKEyaEE27JRn4dwvDu5iYS7zGXGiTNmt/cV7ZpE34=;
 b=jwD8rItkCG5FQFx4Gz2BfbkDoWC1ow2QS2tpc2FwkjucbLBuY0btQvRyw9LtrQJWqV1kRbZLfagBgAXAFRDC2UAHU1Q57Ew9xUUZ1DXgGqzN1XZs0zNNXk573fBxawuGhhbHlJ6kG7npWKs6XEMI1iuGa1RauuW+7dJVl6TDf+M=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5201.namprd10.prod.outlook.com
 (2603:10b6:208:332::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:24:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:24:50 +0000
Date: Mon, 28 Feb 2022 14:24:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past the
 loop body
Message-ID: <20220228112413.GA2812@kadam>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-2-jakobkoschel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CT2P275CA0012.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:b::24) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 629f0380-c86e-4dfe-d292-08d9faaceefd
X-MS-TrafficTypeDiagnostic: BLAPR10MB5201:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB52010DFED44C00CD7720DE878E019@BLAPR10MB5201.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNw/ky9RH9bZJgn3aC8I0H+P/C7v6cIGSGKduPX/xbYlJjd7kLPu5CB2hSMSq6Y9gCp7yyzg9mt3pJeZSP5RmC2LFFjo02H3eYC9dqeyoEpdHIVxLxKRIZAbqD5zer9NF233BmfyXRdnvkA14xwcveyGw9L4Ld8g9l4Yxgiq/IxdQi7i9rpfD4VmXO+hK1dxCShVzlhSwwZZvRDnSF0y1V98QdhPKSyiyNhMvepLw2iiCDywwmdG/Qa8IqWLH7ymQXgpM+JN7ZY3wcUV0q321YCQmR6wcqy5tlDeY3UKgFMjMiXrbPL9z4vv9gPYtnTHCfNnoDhW4tCqp+SvBejTsTZQbxnbe5n/w5FxQMN5Tp7aABoLdJkyNhCa04qq/4jgTc+zUI4no9XxoTaYoK0RCRgLn6D2mX7rv7RHPh5NM74T6ohDYASayPuRryoUqPfqlCyVz5iiFHcXrhSl0dg+MMSthMm+MM5cLvnYTvUqfVmBuj97sWP77il2pGOH5V6TVz5n1456UORNcopCvjmAHHB+CMlcvheHlcKfVMkJdmwxgWwMMAB1fXQWhzS+IEt0+i/Pd+L+wJ5n4w1nOHMnuf1vtMDPgAcSrv6Wl4bHPq9660aA7/E+/gY4mAC29f8kdzxh6uZf5XwS8qr6wVi0jneXBUwg3yCBlGv4kNrhwa/Yh9Y7AqCjjkCJF8BiTehyab4wfg78ZszldZZmsRwyPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66946007)(8676002)(4326008)(33656002)(316002)(6916009)(66476007)(66556008)(38100700002)(6666004)(9686003)(6512007)(33716001)(86362001)(83380400001)(186003)(1076003)(26005)(38350700002)(2906002)(6486002)(508600001)(54906003)(52116002)(6506007)(7416002)(7406005)(8936002)(7366002)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vaCJRwWe1gDGfdW3mcs49L447sD52E2tp8PqwvF0QkBSlQLl89S35/Auo0q4?=
 =?us-ascii?Q?LIrms7w+r6OtJGIF+UAPPwR/DzL6ZK1r9yT5ArNjAaWw5epXlEAPUMjwLjWn?=
 =?us-ascii?Q?ZcJHEZbZNb36AVQx0WODFLY9QU/hwZqG41gLx1sByt4nPYUXJx571Nw51eZj?=
 =?us-ascii?Q?J9G+mmRZUFwoQx+NAmAWZo3XGpOG57rL263ntxi9SRGcujYM1PjFf+le/9zc?=
 =?us-ascii?Q?VJAdQPFIo6BhG3wZbWH9dldcdr1wup/y5g8PfYjGBHLRxoffleB/F4bieu/M?=
 =?us-ascii?Q?2QOPJLTXw84y+rarr70IJsG3yVH/tLNA7awJNndyup89TjyTn4AkcXMVOpnM?=
 =?us-ascii?Q?Tgbt6tI7QaTYvdYJeZ3yLR5aodQIezSrHeqk1NuNHemyBAxKKa0TcPWXUoE+?=
 =?us-ascii?Q?8X0au5KpXVQVYP5ZMgw7fB0mFgpEEQgCFrc5jTeODe7XiMnHFY3QJI0FvD1a?=
 =?us-ascii?Q?VtxeMt0kWIqdjDgphYviEQhPMNzZOvdp2c5/pkPi2c72b1Q0MLCP5Vgqmf9d?=
 =?us-ascii?Q?g3xbYoJVvflc0h+X2yIZFF7V2Fod7z/WQRnoyOyIMOt+3LkqvqX7xqkKaVkw?=
 =?us-ascii?Q?httfgMtlqJ70DOxCbWU2HdOuppxdj6ZXvuzzNOXYLE5SNQLICvZJ9PJqj7U5?=
 =?us-ascii?Q?C/uWGFCF+6hcngDl2vXvE588D2RoBjga/lx+H8Z6CzTS6rBxBQ3BzLXRui1w?=
 =?us-ascii?Q?lgN2YNdspbO8ty+/ZVW0LWux49oxuGo3+z43HcIDsPQOSKpymSV8yE6HcIOE?=
 =?us-ascii?Q?X64XjlxpsSwf/t0ljK19F/r1UUtqA4Ji7+1QGLwVuAf4VMGTRCwTQVjaJ/FV?=
 =?us-ascii?Q?lmdmRFbWnxo4fUxYPiG/0Iryv34Pwk2oLTtR2UZzECgeY7KYMDmgaRfksxef?=
 =?us-ascii?Q?cm1+LQv2ZRKDzw3w1Pe+cPdPTKMh66GejAk4IB9koSvAJH2tWINz8OrAuiFN?=
 =?us-ascii?Q?bZe18Fl2P632oOhRotbwI5U36S/aY+iL61sSArTF18Z0BZoR4cDGLh4KWYLQ?=
 =?us-ascii?Q?pTr1BeAojQHjK87PPDhCY+hoIck+XeFP4F7UMUh7AJaH9yAW4vB37ba6q1gm?=
 =?us-ascii?Q?1EfvjQnrR2rz4ozUiZb/eRY1h0Y5oDfD1+KT2NuryIDAeousM5zlb9vChFpT?=
 =?us-ascii?Q?xKdSnCHM+Bke94HBZbHdz8bfh/fVj3RxM5ehVxWQxfAPjwLwZPDx01eIO3Gh?=
 =?us-ascii?Q?5X/m2q8NqSMoQpnYRa12B4YnET/zIrn1+rf8WSknzIhWL61WvxkN2CVh6iOi?=
 =?us-ascii?Q?o4pdTrv0lkPwmxObCDsUpx5fd2/3rd8aTF9vbmgcMwE9l3/wGfvP5YWsdS1r?=
 =?us-ascii?Q?3fPHBrqGb7hNighYuyk0ffwfob9pBTRpSi8P0DY+hkBiP4+ID+9qdwv3qxjA?=
 =?us-ascii?Q?GGjRKx63mdU8Ed1RoR4UFDozooyWz+XuRd4zNnKx31Bumy49OfxMdvNcbmAp?=
 =?us-ascii?Q?Bpxe2hta9C1w3BqGN9bwdl4l2TqJtCRsgHYDJDpW1xLwBsdO3zYy/aqwKBwj?=
 =?us-ascii?Q?2aGnSCmZyNvnJirCYrXC1cIDe9mgXGq7K89NrZj+MC60eQq+NwoDWOYRcOUu?=
 =?us-ascii?Q?YtPEPQfCpe63+IBaUmILgdxb3pPs5tg2VMuiyJC2deMsIGk3zwDPEHXOWvte?=
 =?us-ascii?Q?YnJf3eW5Jdc3nWA2CS3VefwBOghIMRueubexYGj6jv2wVrPNEbgbLxGcu2L6?=
 =?us-ascii?Q?WQqbUQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629f0380-c86e-4dfe-d292-08d9faaceefd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:24:50.4628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzgH/AzxKDJ8PWAa8Fz9LyR9SzH6RKnI+6ZnoRytiG1aweEveJViEFd6cAYZW/2M3NqI0L+uEmlcoL7rnOSdYXSr3OhAcFM011u+cedReU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5201
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10271
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280064
X-Proofpoint-GUID: FP6IbxZDcxUKBWhPNYAzonWFTGVqWuz8
X-Proofpoint-ORIG-GUID: FP6IbxZDcxUKBWhPNYAzonWFTGVqWuz8
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
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 12:08:17PM +0100, Jakob Koschel wrote:
> diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
> index 9040a0561466..0fd0307bc07b 100644
> --- a/drivers/usb/gadget/udc/at91_udc.c
> +++ b/drivers/usb/gadget/udc/at91_udc.c
> @@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, struct at91_ep *ep)
>  	if (list_empty (&ep->queue))
>  		seq_printf(s, "\t(queue empty)\n");
> 
> -	else list_for_each_entry (req, &ep->queue, queue) {
> -		unsigned	length = req->req.actual;
> +	else
> +		list_for_each_entry(req, &ep->queue, queue) {
> +			unsigned int	length = req->req.actual;
> 
> -		seq_printf(s, "\treq %p len %d/%d buf %p\n",
> -				&req->req, length,
> -				req->req.length, req->req.buf);
> -	}
> +			seq_printf(s, "\treq %p len %d/%d buf %p\n",
> +					&req->req, length,
> +					req->req.length, req->req.buf);
> +		}

Don't make unrelated white space changes.  It just makes the patch
harder to review.  As you're writing the patch make note of any
additional changes and do them later in a separate patch.

Also a multi-line indent gets curly braces for readability even though
it's not required by C.  And then both sides would get curly braces.

>  	spin_unlock_irqrestore(&udc->lock, flags);
>  }
> 
> @@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void *unused)
> 
>  	if (udc->enabled && udc->vbus) {
>  		proc_ep_show(s, &udc->ep[0]);
> -		list_for_each_entry (ep, &udc->gadget.ep_list, ep.ep_list) {
> +		list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {

Another unrelated change.

>  			if (ep->ep.desc)
>  				proc_ep_show(s, ep);
>  		}


[ snip ]

> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
> index 7c38057dcb4a..bb59200f1596 100644
> --- a/drivers/usb/gadget/udc/net2272.c
> +++ b/drivers/usb/gadget/udc/net2272.c
> @@ -926,7 +926,8 @@ static int
>  net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  {
>  	struct net2272_ep *ep;
> -	struct net2272_request *req;
> +	struct net2272_request *req = NULL;
> +	struct net2272_request *tmp;
>  	unsigned long flags;
>  	int stopped;
> 
> @@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  	ep->stopped = 1;
> 
>  	/* make sure it's still queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req == _req)
> +	list_for_each_entry(tmp, &ep->queue, queue) {
> +		if (&tmp->req == _req) {
> +			req = tmp;
>  			break;
> +		}
>  	}
> -	if (&req->req != _req) {
> +	if (!req) {
>  		ep->stopped = stopped;
>  		spin_unlock_irqrestore(&ep->dev->lock, flags);
>  		return -EINVAL;
> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
>  		net2272_done(ep, req, -ECONNRESET);
>  	}
> -	req = NULL;

Another unrelated change.  These are all good changes but send them as
separate patches.

>  	ep->stopped = stopped;
> 
>  	spin_unlock_irqrestore(&ep->dev->lock, flags);

regards,
dan carpenter
