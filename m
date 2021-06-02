Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D73988D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 14:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw73s0bTWz308y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 22:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QRLGyPou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QRLGyPou; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw73G5ky5z2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 22:03:38 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152C2cPO189409; Wed, 2 Jun 2021 08:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7wC8Y59HiMIthB9xfz5dL+I0HD65zOwRPB4cvu5JQYY=;
 b=QRLGyPounpLaRIZgsSUK1LazhFSMWWWVFIpjfvUyvXqdSXI7p94FVQMtSFG3bMtHNL86
 rLVrJ3SvpT994x2pe7o0yL3iXXDeNBst8Q4A8KEa89vx85ZQSTDkkYsEjLQaMo+eb8VZ
 +GFr8IfErHwDLNlYl+L0v9/qNIinOxFcyNlMJhpRMjSZcskv/o9bM0Y0jNVwjZETIKG0
 IXpmjsLB5CkqOhxt84ImzKiTyn/t0QZlZGbbzTco4+M0nPgqtd7mDQbl31t9d+7DOxJc
 iYhombbX7dZq4eRMaB6F1ITduKcVH4H0X0f5lSV3QvlOH2CDPoe61GoP3QIOjHTOkYh/ DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38x7kr3h5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 08:03:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152C2cNZ189527;
 Wed, 2 Jun 2021 08:02:59 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38x7kr3h4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 08:02:59 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152BwHfr023191;
 Wed, 2 Jun 2021 12:02:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 38ud87s9cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 12:02:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152C2r4H26280248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 12:02:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0364A405F;
 Wed,  2 Jun 2021 12:02:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 479C3A4040;
 Wed,  2 Jun 2021 12:02:52 +0000 (GMT)
Received: from sig-9-145-17-43.uk.ibm.com (unknown [9.145.17.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 12:02:52 +0000 (GMT)
Message-ID: <e4891689c7651611020bdf3b4db9895819da345a.camel@linux.ibm.com>
Subject: Re: [PATCH 27/30] scm_blk: use blk_mq_alloc_disk and blk_cleanup_disk
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Wed, 02 Jun 2021 14:02:51 +0200
In-Reply-To: <20210602065345.355274-28-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-28-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Pi9MTQ_S8CJ1ewvOnGa4xYgtn5KH1ib
X-Proofpoint-ORIG-GUID: -LAzjZA1VGIxMM3aVX5RPubiT3GLOjUz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_06:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020078
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
 dm-devel@redhat.com, "Md.
 Haris Iqbal" <haris.iqbal@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Tim Waugh <tim@cyberelk.net>,
 linux-s390@vger.kernel.org, Alex Dubov <oakad@yahoo.com>,
 Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-06-02 at 09:53 +0300, Christoph Hellwig wrote:
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
> request_queue allocation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/s390/block/scm_blk.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
> index a4f6f2e62b1d..88cba6212ee2 100644
> --- a/drivers/s390/block/scm_blk.c
> +++ b/drivers/s390/block/scm_blk.c
> @@ -462,12 +462,12 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
>  	if (ret)
>  		goto out;
>  
> -	rq = blk_mq_init_queue(&bdev->tag_set);
> -	if (IS_ERR(rq)) {
> -		ret = PTR_ERR(rq);
> +	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, scmdev);
> +	if (IS_ERR(bdev->gendisk)) {
> +		ret = PTR_ERR(bdev->gendisk);
>  		goto out_tag;
>  	}
> -	bdev->rq = rq;
> +	rq = bdev->rq = bdev->gendisk->queue;
>  	nr_max_blk = min(scmdev->nr_max_block,
>  			 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
>  
> @@ -477,17 +477,11 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
>  	blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
>  	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
>  
> -	bdev->gendisk = alloc_disk(SCM_NR_PARTS);
> -	if (!bdev->gendisk) {
> -		ret = -ENOMEM;
> -		goto out_queue;
> -	}
> -	rq->queuedata = scmdev;
>  	bdev->gendisk->private_data = scmdev;
>  	bdev->gendisk->fops = &scm_blk_devops;
> -	bdev->gendisk->queue = rq;
>  	bdev->gendisk->major = scm_major;
>  	bdev->gendisk->first_minor = devindex * SCM_NR_PARTS;
> +	bdev->gendisk->minors = SCM_NR_PARTS;
>  
>  	len = snprintf(bdev->gendisk->disk_name, DISK_NAME_LEN, "scm");
>  	if (devindex > 25) {
> @@ -504,8 +498,6 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
>  	device_add_disk(&scmdev->dev, bdev->gendisk, NULL);
>  	return 0;
>  
> -out_queue:
> -	blk_cleanup_queue(rq);
>  out_tag:
>  	blk_mq_free_tag_set(&bdev->tag_set);
>  out:
> @@ -516,9 +508,8 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
>  void scm_blk_dev_cleanup(struct scm_blk_dev *bdev)
>  {
>  	del_gendisk(bdev->gendisk);
> -	blk_cleanup_queue(bdev->gendisk->queue);
> +	blk_cleanup_disk(bdev->gendisk);
>  	blk_mq_free_tag_set(&bdev->tag_set);
> -	put_disk(bdev->gendisk);
>  }
>  
>  void scm_blk_set_available(struct scm_blk_dev *bdev)

Not an expert on SCM or this code but I gave this a quick test and it
seems to work fine.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>



