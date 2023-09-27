Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9327B0D68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 22:27:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CcoHPGkO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwp7T57JNz3cVy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 06:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CcoHPGkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwp6X1WCZz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 06:26:27 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RK9sl9005575;
	Wed, 27 Sep 2023 20:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=00x9QscjInEBcSaJ3saG56eGc8yRpmkTLj6TXL4Svks=;
 b=CcoHPGkOy485zvruDrVnTA6Alju+GH6UIPpuCVByGIQLPztJar0Fnn49uWF1bajx9AV5
 05EwSk7K8TXs5/dn5f0XDpLeC53qahdLoVkWg95CAtBlTOKpDj+nMnTuPFjUQBlcCFJo
 fb4taT0Pd5cXKY975nT6LWfdVGVpZjYuLzmA/ISo88q5VtE4otb+Ds5kPNzIRIb9e1kd
 h6Hc0EbY3aiXNBeDiApneUw2/l2qQQQ67ex8LzlVC1Qg7St4hZz7IgH0VU83t87qCxQl
 l1mGEFgRsWDngFv2zHZzM05dMYzruD684vQaCJS6eNo87245bndHAWuuPwrV0F+rrUAJ Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnreuqxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:26:01 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38RK8Jt7032132;
	Wed, 27 Sep 2023 20:26:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnreuqx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:26:00 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38RKHAVR008150;
	Wed, 27 Sep 2023 20:25:59 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taaqypkwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:25:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38RKPwgY65601798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 20:25:58 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B89BF58054;
	Wed, 27 Sep 2023 20:25:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 074165805A;
	Wed, 27 Sep 2023 20:25:58 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.94.59])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Sep 2023 20:25:57 +0000 (GMT)
Message-ID: <d07b66c55e957c78aff8ab9a6170747832cbc8c5.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor
	 <nathan@kernel.org>
Date: Wed, 27 Sep 2023 15:25:57 -0500
In-Reply-To: <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
	 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com>
	 <20230913165612.GA2213586@dev-arch.thelio-3990X>
	 <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S3q3OsuoR1vxmCXFXMuybxCjDfstsuPf
X-Proofpoint-ORIG-GUID: k9mfeBEuyPRugVDDk7vZ4HKMNCbz9h4a
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_12,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270171
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
Cc: axboe@kernel.dk, llvm@lists.linux.dev, nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-09-13 at 13:49 -0700, Nick Desaulniers wrote:
> On Wed, Sep 13, 2023 at 9:56 AM Nathan Chancellor <nathan@kernel.org>
> wrote:
> > Hi Greg,
> > 
> > On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com
> >  wrote:
> > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > 
> > > Add read and write functions that allow SED Opal keys to stored
> > > in a permanent keystore.
> > > 
> > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > ---
> > >  block/Makefile               |  2 +-
> > >  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> > >  include/linux/sed-opal-key.h | 15 +++++++++++++++
> > >  3 files changed, 40 insertions(+), 1 deletion(-)
> > >  create mode 100644 block/sed-opal-key.c
> > >  create mode 100644 include/linux/sed-opal-key.h
> > > 
> > > diff --git a/block/Makefile b/block/Makefile
> > > index 46ada9dc8bbf..ea07d80402a6 100644
> > > --- a/block/Makefile
> > > +++ b/block/Makefile
> > > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED) += blk-zoned.o
> > >  obj-$(CONFIG_BLK_WBT)                += blk-wbt.o
> > >  obj-$(CONFIG_BLK_DEBUG_FS)   += blk-mq-debugfs.o
> > >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> > > -obj-$(CONFIG_BLK_SED_OPAL)   += sed-opal.o
> > > +obj-$(CONFIG_BLK_SED_OPAL)   += sed-opal.o sed-opal-key.o
> > >  obj-$(CONFIG_BLK_PM)         += blk-pm.o
> > >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)  += blk-crypto.o blk-crypto-
> > > profile.o \
> > >                                          blk-crypto-sysfs.o
> > > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > > new file mode 100644
> > > index 000000000000..16f380164c44
> > > --- /dev/null
> > > +++ b/block/sed-opal-key.c
> > > @@ -0,0 +1,24 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * SED key operations.
> > > + *
> > > + * Copyright (C) 2022 IBM Corporation
> > > + *
> > > + * These are the accessor functions (read/write) for SED Opal
> > > + * keys. Specific keystores can provide overrides.
> > > + *
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/sed-opal-key.h>
> > > +
> > > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > > +
> > > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > 
> > This change causes a build failure for certain clang configurations
> > due
> > to an unfortunate issue [1] with recordmcount, clang's integrated
> > assembler, and object files that contain a section with only weak
> > functions/symbols (in this case, the .text section in sed-opal-
> > key.c),
> > resulting in
> > 
> >   Cannot find symbol for section 2: .text.
> >   block/sed-opal-key.o: failed
> > 
> > when building this file.
> 
> The definitions in
> block/sed-opal-key.c
> should be deleted. Instead, in
> include/linux/sed-opal-key.h
> CONFIG_PSERIES_PLPKS_SED should be used to define static inline
> versions when CONFIG_PSERIES_PLPKS_SED is not defined.
> 
> #ifdef CONFIG_PSERIES_PLPKS_SED
> int sed_read_key(char *keyname, char *key, u_int *keylen);
> int sed_write_key(char *keyname, char *key, u_int keylen);
> #else
> static inline
> int sed_read_key(char *keyname, char *key, u_int *keylen) {
>   return -EOPNOTSUPP;
> }
> static inline
> int sed_write_key(char *keyname, char *key, u_int keylen);
>   return -EOPNOTSUPP;
> }
> #endif

This change will certainly work for pseries. The intent of the weak
functions was to allow a different unknown permanent keystore to be the
source for seeding SED Opal keys. It also kept platform specific code
out of the block directory.

I'm happy to switch to the approach above, if losing those two goals
isn't a concern.

> 
> > Is there any real reason to have a separate translation unit for
> > these
> > two functions versus just having them living in sed-opal.c? Those
> > two
> > object files share the same Kconfig dependency. I am happy to send
> > a
> > patch if that is an acceptable approach.
> > 
> > [1]: https://github.com/ClangBuiltLinux/linux/issues/981
> > 
> > Cheers,
> > Nathan
> > 
> 
> 

