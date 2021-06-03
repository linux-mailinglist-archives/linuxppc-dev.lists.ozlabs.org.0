Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C239ABBA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 22:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwy6851Dvz30BG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 06:24:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRXM6kOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JRXM6kOE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwy5f5Z4lz2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 06:23:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 153K4ZDs050728; Thu, 3 Jun 2021 16:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=rCseMgZhSbw92ogKzTEwojJ0gggDLv6IW+aCgjOQwGM=;
 b=JRXM6kOEHd30ls4I9p/+2hIBeVvvOJArhDe6oPMdhhKV5Ul1wBEUDGJ9Ek1edMyjYL6g
 daNDz0chZm71pyv5b7/xwJswZTWcd7BhwFbWYW/hjjDh60qABPqGJTV9E1tjPTRWj9qH
 HxQ7Bh/XzJDWyFFG9ARqDsxhp5x/z3sGMFqmzIgoGXXkSY50OeuN5M1HmdRy0ixxK/Hr
 9mzjlZSeNHzNhBNJGizuvR8OS98jVmetAwI2II1UBPDbrV5IBXNMy9ep3+vqSusAJg8T
 TP+008tDFurJqA+QfYx4n7iR+YPqo1zbDH7mxEy4JvftortNC0oXcD2tctX00+VxWCLJ pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38y5gtgttk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 16:23:23 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 153K6BPI058814;
 Thu, 3 Jun 2021 16:23:23 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38y5gtgtt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 16:23:23 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 153KDV9B024707;
 Thu, 3 Jun 2021 20:23:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 38ud89jpcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 20:23:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 153KNLuZ23855472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Jun 2021 20:23:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AE2E124052;
 Thu,  3 Jun 2021 20:23:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60A75124054;
 Thu,  3 Jun 2021 20:23:20 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Jun 2021 20:23:20 +0000 (GMT)
Message-ID: <48dcd2e4002cff8ac927e996252ced76f80411c3.camel@linux.ibm.com>
Subject: Re: [PATCH v4 01/16] powerpc/vas: Move VAS API to book3s common
 platform
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 03 Jun 2021 13:23:18 -0700
In-Reply-To: <1622690127.w2gelsayfa.astroid@bobo.none>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <5933dd793bf0d0d1389877715d936cc321ee86d1.camel@linux.ibm.com>
 <1622690127.w2gelsayfa.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6RTDe3bwp80RABZnOLM_xYnPfve-9uMR
X-Proofpoint-ORIG-GUID: gJRrheZpTidkYKbI2e6JY2CrSpFXOflw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_13:2021-06-03,
 2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030136
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-06-03 at 13:32 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of May 21, 2021 7:28 pm:
> > Using the same /dev/crypto/nx-gzip interface for both powerNV and
> > pseries. So this patch creates platforms/book3s/ and moves VAS API
> > to that directory. The actual functionality is not changed.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h                    |  3 +++
> >  arch/powerpc/platforms/Kconfig                    |  1 +
> >  arch/powerpc/platforms/Makefile                   |  1 +
> >  arch/powerpc/platforms/book3s/Kconfig             | 15
> > +++++++++++++++
> >  arch/powerpc/platforms/book3s/Makefile            |  2 ++
> 
> If Michael is happy with the new directory structure then fine by me.
> 
> >  .../platforms/{powernv => book3s}/vas-api.c       |  2 +-
> >  arch/powerpc/platforms/powernv/Kconfig            | 14 ---------
> > -----
> >  arch/powerpc/platforms/powernv/Makefile           |  2 +-
> >  8 files changed, 24 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/powerpc/platforms/book3s/Kconfig
> >  create mode 100644 arch/powerpc/platforms/book3s/Makefile
> >  rename arch/powerpc/platforms/{powernv => book3s}/vas-api.c (99%)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index e33f80b0ea81..3be76e813e2d 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -162,6 +162,9 @@ int vas_copy_crb(void *crb, int offset);
> >   */
> >  int vas_paste_crb(struct vas_window *win, int offset, bool re);
> >  
> > +void vas_win_paste_addr(struct vas_window *window, u64 *addr,
> > +			int *len);
> > +
> >  /*
> >   * Register / unregister coprocessor type to VAS API which will be
> > exported
> >   * to user space. Applications can use this API to open / close
> > window
> 
> If you do this, then the prototype should be removed from 
> arch/powerpc/platforms/powernv/vas.h

Thanks for your review comments.

vas_win_paste_addr() should be PowerNV specific, so will remove from
include/asm/vas.h


> 
> > diff --git a/arch/powerpc/platforms/Kconfig
> > b/arch/powerpc/platforms/Kconfig
> > index 7a5e8f4541e3..594544a65b02 100644
> > --- a/arch/powerpc/platforms/Kconfig
> > +++ b/arch/powerpc/platforms/Kconfig
> > @@ -20,6 +20,7 @@ source
> > "arch/powerpc/platforms/embedded6xx/Kconfig"
> >  source "arch/powerpc/platforms/44x/Kconfig"
> >  source "arch/powerpc/platforms/40x/Kconfig"
> >  source "arch/powerpc/platforms/amigaone/Kconfig"
> > +source "arch/powerpc/platforms/book3s/Kconfig"
> >  
> >  config KVM_GUEST
> >  	bool "KVM Guest support"
> > diff --git a/arch/powerpc/platforms/Makefile
> > b/arch/powerpc/platforms/Makefile
> > index 143d4417f6cc..0e75d7df387b 100644
> > --- a/arch/powerpc/platforms/Makefile
> > +++ b/arch/powerpc/platforms/Makefile
> > @@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+= cell/
> >  obj-$(CONFIG_PPC_PS3)		+= ps3/
> >  obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
> >  obj-$(CONFIG_AMIGAONE)		+= amigaone/
> > +obj-$(CONFIG_PPC_BOOK3S)	+= book3s/
> > diff --git a/arch/powerpc/platforms/book3s/Kconfig
> > b/arch/powerpc/platforms/book3s/Kconfig
> > new file mode 100644
> > index 000000000000..bed21449e8e5
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/book3s/Kconfig
> > @@ -0,0 +1,15 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +config PPC_VAS
> > +	bool "IBM Virtual Accelerator Switchboard (VAS)"
> > +	depends on (PPC_POWERNV || PPC_PSERIES) && PPC_64K_PAGES
> > +	default y
> > +	help
> > +	  This enables support for IBM Virtual Accelerator Switchboard
> > (VAS).
> > +
> > +	  VAS allows accelerators in co-processors like NX-GZIP and NX-
> > 842
> > +	  to be accessible to kernel subsystems and user processes.
> > +	  VAS adapters are found in POWER9 and later based systems.
> > +	  The user mode NX-GZIP support is added on P9 for powerNV and
> > on
> > +	  P10 for powerVM.
> 
> The changelog has changed. The last sentence is difficult to
> understand 
> (also please consistently capitalise PowerNV and PowerVM). Is it 
> supposed to say that PPC_VAS will provide user-mode NX-GZIP support
> on 
> P9 PowerNV systems and P10 PowerVM systems? If you respin the patch
> for
> the prototype...
> 
>   This enables support for IBM Virtual Accelerator Switchboard (VAS).
> 
>   VAS devices are found in POWER9-based and later systems, they
> provide
>   access to accelerator coprocessors such as NX-GZIP and NX-842. This
>   driver allows the kernel to use NX-GZIP and NX-842 accelerators,
> and
>   user-mode APIs for the NX-GZIP accelerator on POWER9 PowerNV and
>   POWER10 PowerVM platforms. <here is a userspace library you can
> use>
>   etc
> 
> Thanks,
> Nick

