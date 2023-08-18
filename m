Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226B780ED3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:14:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UHUoqQKh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS54g6sqJz3cRc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 01:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UHUoqQKh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS53l2MHrz3cGJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 01:13:22 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IEqorR012483;
	Fri, 18 Aug 2023 15:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=8h4zR/PmlOXLOh62i2/d1IwWmmQUDQiqemDALncI/7I=;
 b=UHUoqQKhmemCloOoIvoSAZ96I3jeaaL+bCp4TUEf8L6M2gUEv03YStrbUxvFw4xQ+N24
 pJXA/tObzOyukRDflSMVmcvVKHaZkO3yqxJXclo2M0zn4jikAA6L2x1UuvNHsjv0/7qj
 YoIoqRR1+uLoOQ4F2NSVtp7+I9wFNwt31R4Yu5a3nP/GGME/Q+nBMEG5xbFw+wejxfAr
 MtHaYtMuKoTFyWoKnbpw3YL+srNtpdzOZWfoQfFv691Vcf/3q5W1vynd0nmq8bhsrxzj
 FAglYZFK+9W/A6Zq4TZ6HTumVwrDTLaXbHr5UStql8muJBm0xlqV8g0/6EfMgGCH8HPd Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sjasygmm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 15:12:59 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IExWX6004564;
	Fri, 18 Aug 2023 15:12:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sjasygmm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 15:12:59 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37IDkkeo007871;
	Fri, 18 Aug 2023 15:12:58 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwkyss4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 15:12:58 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37IFCwxO7143978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Aug 2023 15:12:58 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63C9A5805A;
	Fri, 18 Aug 2023 15:12:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFC9B5805D;
	Fri, 18 Aug 2023 15:12:57 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.60.97])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Aug 2023 15:12:57 +0000 (GMT)
Message-ID: <0d768e42d671b2ff84ff10bc3f84531f15a5c57c.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Hannes Reinecke <hare@suse.de>, linux-block@vger.kernel.org
Date: Fri, 18 Aug 2023 10:12:57 -0500
In-Reply-To: <997311ee-a63b-75ea-dedc-78ed2f90b322@suse.de>
References: <20230721211949.3437598-1-gjoyce@linux.vnet.ibm.com>
	 <20230721211949.3437598-2-gjoyce@linux.vnet.ibm.com>
	 <997311ee-a63b-75ea-dedc-78ed2f90b322@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yNeQjn14sXgQ7XuwyB1a9nMwdPHPfiHA
X-Proofpoint-ORIG-GUID: FLNOAWhQXsVjZYPAQMFl-x8uoNJ_kM2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=944 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180137
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: axboe@kernel.dk, nayna@linux.ibm.com, okozina@redhat.com, dkeefe@redhat.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-08-17 at 07:42 +0200, Hannes Reinecke wrote:
> On 7/21/23 23:19, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Add read and write functions that allow SED Opal keys to stored
> > in a permanent keystore.
> > 
> Probably state that these are dummy functions only.
> 
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > ---
> >   block/Makefile               |  2 +-
> >   block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> >   include/linux/sed-opal-key.h | 15 +++++++++++++++
> >   3 files changed, 40 insertions(+), 1 deletion(-)
> >   create mode 100644 block/sed-opal-key.c
> >   create mode 100644 include/linux/sed-opal-key.h
> > 
> > diff --git a/block/Makefile b/block/Makefile
> > index 46ada9dc8bbf..ea07d80402a6 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
> >   obj-$(CONFIG_BLK_WBT)		+= blk-wbt.o
> >   obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
> >   obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> > -obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
> > +obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o sed-opal-key.o
> >   obj-$(CONFIG_BLK_PM)		+= blk-pm.o
> >   obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-
> > crypto-profile.o \
> >   					   blk-crypto-sysfs.o
> > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > new file mode 100644
> > index 000000000000..16f380164c44
> > --- /dev/null
> > +++ b/block/sed-opal-key.c
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SED key operations.
> > + *
> > + * Copyright (C) 2022 IBM Corporation
> > + *
> > + * These are the accessor functions (read/write) for SED Opal
> > + * keys. Specific keystores can provide overrides.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/errno.h>
> > +#include <linux/sed-opal-key.h>
> > +
> > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> 
> Hmm. We do have security/keys, which is using a 'struct key' for
> their operations.
> Why don't you leverage that structure?
> 
> Cheers,
> 
> Hannes

Thanks for the review Hannes. Are you referring to struct key in
linux/key.h? If so, that may a bit heavy for just specifying key data
and key length.

-Greg

