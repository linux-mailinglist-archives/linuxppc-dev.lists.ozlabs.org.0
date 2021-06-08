Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FA39EE45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzfLq1bw0z2yyK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 15:44:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gU5xRTM1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gU5xRTM1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzfLH2mMPz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 15:43:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1585XG3v073391; Tue, 8 Jun 2021 01:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PQPmzEQcdaoBnOuS7ZevmiX8i2v1FJ8/+mtIRXMQ42o=;
 b=gU5xRTM1iA2Bw+LR13YQSweFGyn9tnVZNWpRH1nfJoJuOxtKC1samtxYaOx8LnhS8wQm
 ywLVfOCLVuXxNa4m/5T37355h0C+isZFHegc+e9YkaueX7/CCkYZC/6Vzd4m29kHopER
 elk1DNbfzc3aHjv1BUYeJqgKXqGDwOUQVAPT5eOHWjKdi7bNUP9I4iPyJpNdBGIFptI7
 YXy+/tb+BaVzjZDwTPRx2O0ONnPLSnGCzj4IuLy0PqtyFm6+A4VQdCHh3WGtqJEsvT+V
 URcLSDLjeA7weuoWSnHprFYYuzWCTzZvkrXUrPHgaPoe0j3fsowDzrl6h2WwPbzk22M9 VA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39228drjyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 01:43:38 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1585bsPE027773;
 Tue, 8 Jun 2021 05:43:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3900w8rqcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 05:43:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1585hXoE33620238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 05:43:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB56C42042;
 Tue,  8 Jun 2021 05:43:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 984F94203F;
 Tue,  8 Jun 2021 05:43:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.59.176])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 05:43:32 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2] libnvdimm/pmem: Fix blk_cleanup_disk() usage
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <162310994435.1571616.334551212901820961.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Tue, 8 Jun 2021 11:13:31 +0530
Message-Id: <637B91E6-B4DD-4DF3-BAA2-0C60B6B6B3C5@linux.vnet.ibm.com>
References: <162310861219.1571453.6561642225122047071.stgit@dwillia2-desk3.amr.corp.intel.com>
 <162310994435.1571616.334551212901820961.stgit@dwillia2-desk3.amr.corp.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f1SCacZwDL47-u1DPvXhD6RO1n8SNoVb
X-Proofpoint-ORIG-GUID: f1SCacZwDL47-u1DPvXhD6RO1n8SNoVb
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080035
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
Cc: axboe@kernel.dk, nvdimm@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Fixes: 87eb73b2ca7c ("nvdimm-pmem: convert to blk_alloc_disk/blk_cleanup_=
disk")
> Link: http://lore.kernel.org/r/DFB75BA8-603F-4A35-880B-C5B23EF8FA7D@linux=
.vnet.ibm.com
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---

Thanks Dan. This patch fixes the reported crash for me.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>=20
> Changes in v2 Improve the changelog.
>=20
> drivers/nvdimm/pmem.c |    4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 31f3c4bd6f72..fc6b78dd2d24 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -337,8 +337,9 @@ static void pmem_pagemap_cleanup(struct dev_pagemap *=
pgmap)
> {
> 	struct request_queue *q =3D
> 		container_of(pgmap->ref, struct request_queue, q_usage_counter);

With this change variable =E2=80=98q' is no longer needed and can be remove=
d.

drivers/nvdimm/pmem.c: In function 'pmem_pagemap_cleanup':
drivers/nvdimm/pmem.c:338:24: warning: unused variable 'q' [-Wunused-variab=
le]
  struct request_queue *q =3D=20=20
                                      ^
> +	struct pmem_device *pmem =3D pgmap->owner;
>=20
> -	blk_cleanup_disk(queue_to_disk(q));
> +	blk_cleanup_disk(pmem->disk);
> }
>=20
> static void pmem_release_queue(void *pgmap)
> @@ -427,6 +428,7 @@ static int pmem_attach_disk(struct device *dev,
> 	q =3D disk->queue;
>=20
> 	pmem->disk =3D disk;
> +	pmem->pgmap.owner =3D pmem;
> 	pmem->pfn_flags =3D PFN_DEV;
> 	pmem->pgmap.ref =3D &q->q_usage_counter;
> 	if (is_nd_pfn(dev)) {
>=20

Thanks
-Sachin=
