Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D27307E94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 20:12:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRVTs317yzDr1d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 06:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fXUhpDX+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRVRk40YmzDrHl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 06:10:42 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SIlrdp178755; Thu, 28 Jan 2021 14:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=AAH4RWau8pNbmU49YGUbY4FFvCzo0Ar79vdi/fV4VP0=;
 b=fXUhpDX+UWkcSx1KfK4h7YIXW6hXMnhEMDSq8pHsBjvT5jxeX8c3sE4qYvJteY5kLnVw
 rLE56ztvS78/wpwevyawkNFkyMMI3HEhzBTpW9D7BO1rGuj1wVWSBD4fyOuKjj04aqSd
 egDLyaBDCtU3SgKXrhn2Vli1uPP3xtlFHafs3m0iV+5i259Rg/3lX6XrXdNsLimby2n+
 PbZvJR8X5glCOuWX7kDs9zG/NJznjk7B3/Z7dPq/zCbJ4XkR8mR2tju4ck/TCxfJelaJ
 av+UMDSFIWYwtE0Z3FpQheTGKU+o4ePD71m9YyaT0tMJTzkdFtwDNe9BdOpBHsNiNwa3 VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqtess9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:07:57 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SJ6jfk076145;
 Thu, 28 Jan 2021 14:07:57 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqtess8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:07:57 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SJ7tT2001518;
 Thu, 28 Jan 2021 19:07:55 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 36a0t2yubs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 19:07:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SJ7sG920316556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 19:07:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38F466A05F;
 Thu, 28 Jan 2021 19:07:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8C8A6A04F;
 Thu, 28 Jan 2021 19:07:53 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.85.183.51])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 19:07:53 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id DE5DD2E2954; Thu, 28 Jan 2021 11:07:50 -0800 (PST)
Date: Thu, 28 Jan 2021 11:07:50 -0800
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH] vio: make remove callback return void
Message-ID: <20210128190750.GA490196@us.ibm.com>
References: <20210127215010.99954-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127215010.99954-1-uwe@kleine-koenig.org>
X-Operating-System: Linux 2.0.32 on an i486
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280087
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Cristobal Forno <cforno12@linux.ibm.com>, sparclinux@vger.kernel.org,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jiri Slaby <jirislaby@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Nayna Jain <nayna@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Michael Cyr <mikecyr@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-block@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 Matt Mackall <mpm@selenic.com>, Jens Axboe <axboe@kernel.dk>,
 Steven Royer <seroyer@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Dany Madden <drt@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Uwe Kleine-K=F6nig [uwe@kleine-koenig.org] wrote:
> The driver core ignores the return value of struct bus_type::remove()
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct vio_driver::remove() return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and makes it
> obvious for future driver authors that returning an error code isn't
> intended.

Slightly off-topic, should ndo_stop() also return a void? Its return value
seems to be mostly ignored and __dev_close_many() has:

                /*
                 *      Call the device specific close. This cannot fail.
                 *      Only if device is UP
                 *
                 *      We allow it to be called even after a DETACH hot-pl=
ug
                 *      event.
                 */
                if (ops->ndo_stop)
                        ops->ndo_stop(dev);
Sukadev
