Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5526F388678
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 07:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlLpG2jS0z309g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 15:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rT2R0ZhO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rT2R0ZhO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlLnn2lNJz2yWw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 15:21:32 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J54Iv3034025; Wed, 19 May 2021 01:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=5tT4m8BqaOgTlUX17i6bD4OUl0fgHC5fsgEB2sipC8k=;
 b=rT2R0ZhOwwNyVUH4JEKgyH7jMrYuBo87l3wdJjyID58sFBdYx9MYTkrsEpFYtfsnx/rH
 tw2c6LTf2W37FWmRpz22/0Nz1N1Nc1K31a/j3RYL0Q5ftbF9j3xmeK1RDkT3DII/m+Er
 TmS/kkEQX7bI3QOx5nuDbFXxvr+5CaHdTU0Llewo3CNJglkmJrbytZOybId26oqXZmKv
 h4ww8l6i4G+GujmOKkaXLcKbN7s4eIbzB+Wlif4WhEs+bOhlsXQNREvTJiqJyiN9TqTv
 sGEzyE+6zm3BBE6KrYPHVyDWnXXOF5sASd+5pAuETDhl1sTm0GsoEb9jF5F65yh8JSbT 3w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38mu7fsm14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 01:21:17 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J5IVt2014696;
 Wed, 19 May 2021 05:20:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 38j5x9cg31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 05:20:25 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14J5KOF322479180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 05:20:24 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9063C6A05F;
 Wed, 19 May 2021 05:20:24 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63CF46A05A;
 Wed, 19 May 2021 05:20:23 +0000 (GMT)
Received: from [9.65.90.43] (unknown [9.65.90.43])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 May 2021 05:20:23 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH net-next] ibmveth: fix kobj_to_dev.cocci warnings
From: Lijun Pan <ljp@linux.vnet.ibm.com>
In-Reply-To: <20210519022849.12752-1-yuehaibing@huawei.com>
Date: Wed, 19 May 2021 00:20:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <276F94E7-2DFB-47EF-91F7-6CDA69A4009F@linux.vnet.ibm.com>
References: <20210519022849.12752-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kOdqaP7ZGXu33XGnyGSMNvikZLFvFqgD
X-Proofpoint-ORIG-GUID: kOdqaP7ZGXu33XGnyGSMNvikZLFvFqgD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_01:2021-05-18,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190038
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>, dwilder@us.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On May 18, 2021, at 9:28 PM, YueHaibing <yuehaibing@huawei.com> wrote:
>=20
> Use kobj_to_dev() instead of container_of()
>=20
> Generated by: scripts/coccinelle/api/kobj_to_dev.cocci
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Acked-by: Lijun Pan <lijunp213@gmail.com>


> drivers/net/ethernet/ibm/ibmveth.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c =
b/drivers/net/ethernet/ibm/ibmveth.c
> index 7fea9ae60f13..bc67a7ee872b 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -1799,8 +1799,7 @@ static ssize_t veth_pool_store(struct kobject =
*kobj, struct attribute *attr,
> 	struct ibmveth_buff_pool *pool =3D container_of(kobj,
> 						      struct =
ibmveth_buff_pool,
> 						      kobj);
> -	struct net_device *netdev =3D dev_get_drvdata(
> -	    container_of(kobj->parent, struct device, kobj));
> +	struct net_device *netdev =3D =
dev_get_drvdata(kobj_to_dev(kobj->parent));
> 	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
> 	long value =3D simple_strtol(buf, NULL, 10);
> 	long rc;
> --=20
> 2.17.1
>=20

