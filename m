Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5139BC72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 18:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxSCY098Zz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=JBjkoq5B;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pSOsq0S6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=JBjkoq5B; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=pSOsq0S6; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxSB92cl2z3bwS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 01:59:12 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154Fwio4026278; Fri, 4 Jun 2021 15:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=5Lwl0zlLLXOjFB6AJtrSZDs8oG/nvzkr5vkS69mpymw=;
 b=JBjkoq5B0+y4xx0mrBmM+YBsWx6GBZiuWTo0t68Rj+0kEx2I0TXAI37v5GAEQpZ7uDR5
 qHRBvZICcT5pPzOv+xMaZyqryXlc469/5dE6IZs17wbYslTmXFa8DF5+IeGgLNYOwpI1
 h7IO4lesHafZAg/rv7SbgkOODi02MpqyoDWSvxcqaD3zuQ+5cefrCWtBgHJWhVKHN/Z2
 +HrK67dMcQXeH3pG/pjCjzMNi8towHjelvS54bqZbTZggBfK8Wh+0mDQ1QJOlN1tEtYg
 3lJQORmNXavjXsqOxPI/PfW+lTBdyoWC8pGYMwLewkIz6fDPMcyJNcoRnk+2TI0P8eNl gg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38y0j7gf19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Jun 2021 15:58:44 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 154Fwg6h009450;
 Fri, 4 Jun 2021 15:58:42 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
 by aserp3030.oracle.com with ESMTP id 38ubnft1gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Jun 2021 15:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5535t2svwIRZCrsY0mAHIfQV+E8ZgO4f294j6NmP/t3r/Rtg8rZ15MuHEKajs4mEHp4IQ8HPAhj+K6rD0gFwCLyX4ehtA5XHP2v8aPdF63+cskd5NT4SxtKWI+IInwJzxbJR6t6PdlVcfuxmJtbsH73PVJE0n7luLIWDYd+tUQfIL7VBVrR9QFOt11+pVbYNEM3PTAHdbhQkqKAcM1OHB5CnRog7TPsTwzR0r0hX4/NzmtC/cOdpilleb6YJST38wWiUCgW3Z3aL6QGt1Mz0KQ7wjHLqdvHLgC2eV0EMI+kfVeFy2lSjh/ZiA7O1k7NkYcy6owMDCa8kXh7jGVwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lwl0zlLLXOjFB6AJtrSZDs8oG/nvzkr5vkS69mpymw=;
 b=GC1lmTOSH/gq572Yg/UfaoxMO6z7nu/6Iqb7W0WMpvLZFY7HHvRfC8IZ9FXGW9FiwMxfH5dszYc6sQcT5LoleHzDxo2FROWDuQne7ChvwaS5og9zlqrs7HIEtBfMBRrvRdVi4XGi5VhE/7yTjc7sl+euCQ3WewNhBzygAOY1mVNAKaq7tMfZ2Sip5TXH7Em8iuadwMonAmykk6140jiTktJspW/kLtti7QdfiqHJqmhuxV1Qcmv2U8In/ndNIt20iJazu8d49UVWVXiVtpTEKzoyZv0aOzW4nvz2/bOrFIqPJrZCeTIVxNuhPuMFdrVV0iMhZ3o394OsFNA8HVJDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lwl0zlLLXOjFB6AJtrSZDs8oG/nvzkr5vkS69mpymw=;
 b=pSOsq0S6c5cQezvKm5Vq28Gylj76mSmfPbHhvVd0wopwS+rBKUMyiMiVH5RGzkPjgNB3hvlzdo1sKKYjfSd9KwsJb6bWLFyzbxipUnvy5nNxuXUa2Uq84TGrm69di22qZFt+8eTOn21DXZaaRT00lU5uUNVhkHqhA+i9maPc2Rw=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by SJ0PR10MB4573.namprd10.prod.outlook.com (2603:10b6:a03:2ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 15:58:40 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4173.027; Fri, 4 Jun 2021
 15:58:40 +0000
Date: Fri, 4 Jun 2021 11:58:34 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com
Subject: Re: simplify gendisk and request_queue allocation for blk-mq based
 drivers
Message-ID: <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
References: <20210602065345.355274-1-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: MN2PR01CA0037.prod.exchangelabs.com (2603:10b6:208:23f::6)
 To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 0xbeefdead.lan (130.44.160.152) by
 MN2PR01CA0037.prod.exchangelabs.com (2603:10b6:208:23f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Fri, 4 Jun 2021 15:58:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dde9b11-53fa-45a5-e4e3-08d927719ed5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB457380B60E35ADDCFC95A572893B9@SJ0PR10MB4573.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHBK1Bd4R0yQf0mbwstUwD7rwPUJpZ9OBXQW78ziXe78KyDV/ay9WxxaENfloeMsvna7ISGWXvd4tGUMEE0hAFJq07vfks3neO5X6BhHhSb03cYDUSZQHXrCquEk5/GydvhOOwJftznFM9p1AJkBu13MtYY7t2/t5i7zm5RMU2KnsH/Uy61Wb7pGr9LfEk5gMIkYWiQijXJz+wDDDH5ZuYuLAl4J0ImmQrPMFSyYuO9OXefsEzSvWPDUhTx2FEbG5DluUitc+JkgRUIVVOyv6oZtmslmx2fEGZ0JH45HZ4yXtoT6ANXJwUndJMqaVwL+NLR5bd/TJjVXjkExroJxC4HW8uy8wLPcnt3WhJhQH4N4lp83G61x7DJHAjxIMHVK/hQtyWrnxDx9SzznUZSxFaGQ4gEWh0NldxkFkjK5Wo2f1ZyCVM2pMEksXUvDJu8jvdpWKvtu72LkdZtNF0d5JLlci6rFbhqGbxSPZta8qUs11ZtiwV577linlXpQy9wl3ZHN6gUpfiOKAU6e9N9/7OwoazJb/xgIbpGCT4hcSSDGE4vXb7tMiPqUFx99nSz5EyohhphRzO5Qp54uBzTdbYYHvurlhAKFZSC2uLQvNrIPOGq2X93TowBkmaVPmGub6LFR8OOOv1TuKZtCkA51M3bogdaVBrVnBelcQEx4rdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(366004)(396003)(39860400002)(7416002)(7406005)(66946007)(83380400001)(8936002)(7696005)(52116002)(6506007)(8676002)(956004)(2906002)(86362001)(8886007)(66556008)(5660300002)(54906003)(110136005)(36756003)(55016002)(9686003)(66476007)(38100700002)(26005)(316002)(16526019)(186003)(4326008)(478600001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gdpQmfl8El8DPe05/ff+wLw1/KXLxBUk84KmbBsgJrrdeHieFn5LEuqnWl++?=
 =?us-ascii?Q?+UjNgTjJDG0Oy6mts17gW1+WMWYc5sUjhoAGzfgwfT7Pzy2441s4sE3MvxSX?=
 =?us-ascii?Q?SRhf4Ec4wl4gNcjirY4ZZx9nyHsKiuVqsZIiIgvOZV6JtJ/wEtmJxOuFg8nP?=
 =?us-ascii?Q?uKjCrwrGeC3048DWWWWuHEDcmJ6ZiYL6rsQKzrsK0nqgY5Rxqs6sQE3dQNq4?=
 =?us-ascii?Q?CfCfYZsdey83ES59nAWpWzHfBPV3sAkiuolib1v8KFoFh4m19r203lwOpa59?=
 =?us-ascii?Q?SySyMhX/1zZ61W8f+1VN6FTD6szZX2+vTot42u9xJ9dDh0U3eNAxd2iYZn0f?=
 =?us-ascii?Q?FnywpHXicqp7wJ4XxEvvbHwQjO+qRq86gUvS750ntuWPrrC2vv5+b6RZzuES?=
 =?us-ascii?Q?UcXB6tmXaG0UH6hWSpBKxi4Qu+znSclq9GPbpnNHb6uGZthjISahfQtta6L8?=
 =?us-ascii?Q?QENMEq/n3Y8O4nxltdvopsJg4mtGH7XLAIw1TfFd6NGnkMGv+e8uEULBYnah?=
 =?us-ascii?Q?sKsuSSKxj9HW9YLP46ZjPemhaoeHbI0bMhjtc8tA5iddmW0Qp0D1sou4oBx1?=
 =?us-ascii?Q?+NWx0/dEti/pL1xCxKtWgaprT2A+vvp2lNH/Zp9EdpD7pqwSsffeQGQGYkmO?=
 =?us-ascii?Q?JCogfOFRqp8ieYxSSlI7BY6O5f4vs0fr+pOs/di4TE/EuWhelL8x8D4VFENg?=
 =?us-ascii?Q?C10k7BLZfSLJXmQkDkwCUju3JpwBTu20ZSobHfpvuiGl7BhkQAfiy8EJMLmD?=
 =?us-ascii?Q?YBoD5fLwHNzfpBW0nr5lCjOi5onruP7ZRKk/3ddsKzuFkx2PjQDOaEprB8od?=
 =?us-ascii?Q?uLw/m7j6Z7YgqwkScdMQliPMFlaMnWQlKN5/c0leXZ3TayPv8hxil1UBekgP?=
 =?us-ascii?Q?Kpp5KY5GxCcyAZW2yfB8Y4ikwdiKii5dj+yOqOBxN/6JyV2pvazcS9Xsq9Dj?=
 =?us-ascii?Q?Y1DsNtmdsClAPVchPB15A2Yp5/fLM2u7cgMhr8thEdLIV5cUr5UwtEJfUi1L?=
 =?us-ascii?Q?a7P8IQ2zF8beqpIVhRJuUz+bgGvmluPArexdyi8MmDeVuKICYzY1ZylKnltR?=
 =?us-ascii?Q?KS+uaVVX48VeH3aI1YK8YVpLFxAFhM5jGoahx7249NVuqHQitDHE/F3P2Kw9?=
 =?us-ascii?Q?P9TIMyUxY0U6UDewE1YgwVRFm6ucT69PcDuUPD/MDYRo6lQAkknDIWsZIohy?=
 =?us-ascii?Q?aHLmwizL1c8bkLjOlhcRtz0fGX76iiZhkvd7mxf0PIgWOyisyqwjfn8xHlDy?=
 =?us-ascii?Q?lya6vxtBHvC7VyelPVIM4UREFQMtr43M9AGA4WFzaF5J8kQ/Jx+YMPS6tsQ2?=
 =?us-ascii?Q?K//cbST/UVancc9qupZ1eFle?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dde9b11-53fa-45a5-e4e3-08d927719ed5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 15:58:40.2289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8PHQ2bjx/5Yak8THiDXWmeuwC57H+V+YorWNg11QCDMPAuKEJyQpKJy+Bs2B5GcI9L15xw+he/zXw8ra7OaWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4573
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10005
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106040115
X-Proofpoint-ORIG-GUID: rc9IytYinERt57ZWbGC4hfNK-9DkWPUs
X-Proofpoint-GUID: rc9IytYinERt57ZWbGC4hfNK-9DkWPUs
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>, linux-s390@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Denis Efremov <efremov@linux.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 02, 2021 at 09:53:15AM +0300, Christoph Hellwig wrote:
> Hi all,

Hi!

You wouldn't have a nice git repo to pull so one can test it easily?

Thank you!

Cc-ing Boris/Juergen - pls see below xen.
> 
> this series is the scond part of cleaning up lifetimes and allocation of
> the gendisk and request_queue structure.  It adds a new interface to
> allocate the disk and queue together for blk based drivers, and uses that
> in all drivers that do not have any caveats in their gendisk and
> request_queue lifetime rules.
> 
> Diffstat:
>  block/blk-mq.c                      |   91 +++++++++++++++-------------------
>  block/blk.h                         |    1 
>  block/elevator.c                    |    2 
>  drivers/block/amiflop.c             |   16 +-----
>  drivers/block/aoe/aoeblk.c          |   33 ++++--------
>  drivers/block/aoe/aoedev.c          |    3 -
>  drivers/block/ataflop.c             |   16 +-----
>  drivers/block/floppy.c              |   20 +------
>  drivers/block/loop.c                |   19 ++-----
>  drivers/block/nbd.c                 |   53 +++++++------------
>  drivers/block/null_blk/main.c       |   11 +---
>  drivers/block/paride/pcd.c          |   19 +++----
>  drivers/block/paride/pd.c           |   30 ++++-------
>  drivers/block/paride/pf.c           |   18 ++----
>  drivers/block/ps3disk.c             |   36 +++++--------
>  drivers/block/rbd.c                 |   52 ++++++-------------
>  drivers/block/rnbd/rnbd-clt.c       |   35 +++----------
>  drivers/block/sunvdc.c              |   47 ++++-------------
>  drivers/block/swim.c                |   34 +++++-------
>  drivers/block/swim3.c               |   33 +++++-------
>  drivers/block/sx8.c                 |   23 ++------
>  drivers/block/virtio_blk.c          |   26 ++-------
>  drivers/block/xen-blkfront.c        |   96 ++++++++++++++----------------------
>  drivers/block/z2ram.c               |   15 +----
>  drivers/cdrom/gdrom.c               |   45 +++++++---------
>  drivers/md/dm-rq.c                  |    9 +--
>  drivers/memstick/core/ms_block.c    |   25 +++------
>  drivers/memstick/core/mspro_block.c |   26 ++++-----
>  drivers/mtd/mtd_blkdevs.c           |   48 ++++++++----------
>  drivers/mtd/ubi/block.c             |   68 ++++++++++---------------
>  drivers/s390/block/scm_blk.c        |   21 ++-----
>  include/linux/blk-mq.h              |   24 ++++++---
>  include/linux/elevator.h            |    1 
>  33 files changed, 386 insertions(+), 610 deletions(-)
