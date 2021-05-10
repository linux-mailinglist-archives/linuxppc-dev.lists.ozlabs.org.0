Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47CF379523
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 19:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff71P4lVTz2ymF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:13:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+YQWatE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m+YQWatE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff70x0znsz2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 03:13:04 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14AH3OGZ180151; Mon, 10 May 2021 13:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=zwhVAaeZf78SZ5GgoY0wVdmRqB/OnCUU5LMXW2itWfQ=;
 b=m+YQWatEatLyvXANdjbOnB+JOlwHBONilZ0MT2c+h2cMB5lkDnhPW1b1XLOsaprh0GoR
 5XaJMubjPpBiPMj4y0pDa8VO0VmB6OrBMf5fl9ycjf0GTuW8ZMmlxir0Q26JUN64bDKJ
 jfN6ZAuFG3sfUPXv9Yn9v0YsZj93nHYJcsPkdSTO7lfPlAXOh5iP9dzXg4O6TdzyTK4i
 7t3UUagAPHu9/VHvzZziJrvqQwcaLtOsZjshDv56lZX7J6jENZxI2N8agDzep5je7+cy
 yUXY39j6Aez0F7ZRqvlIQhMtH2I9O2/Kq5SCDhzUkIPNV194sQpwaeUzgjtCs7QfzTdP hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38f8vvr9n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 13:12:55 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14AH3acE181313;
 Mon, 10 May 2021 13:12:55 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38f8vvr9me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 13:12:55 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14AHCMhS012660;
 Mon, 10 May 2021 17:12:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 38dj98uqys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 17:12:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AHCr2a30277906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 17:12:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A35BE11207B;
 Mon, 10 May 2021 17:12:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 898B911207A;
 Mon, 10 May 2021 17:12:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 17:12:52 +0000 (GMT)
Message-ID: <6faf272f569f89422009e1852774a5474683c474.camel@linux.ibm.com>
Subject: Re: [PATCH V3 02/16] powerpc/vas: Move VAS API to common book3s
 platform
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 10:12:50 -0700
In-Reply-To: <1620623481.kmr54zmxzv.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <163867b893124434dfe3e13c6ba2f081c309e96f.camel@linux.ibm.com>
 <1620623481.kmr54zmxzv.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fESNmX4oLN9P9xaWfaCbVTMFoaeb5How
X-Proofpoint-GUID: NJlsc52E-6YzDex376NFDBsBqcNZvDq3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_11:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105100114
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

On Mon, 2021-05-10 at 15:19 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:02 am:
> > Using the same /dev/crypto/nx-gzip interface for both powerNV and
> > pseries.
> 
> The pseries NX driver will use the powernv VAS API ?
Yes, both powerNV and pseries drivers use same VAS API.  

> 
> > So this patch creates platforms/book3s/ and moves VAS API
> > to that directory. The actual functionality is not changed.
> > 
> > Common interface functions such as open, window open ioctl, mmap
> > and close are moved to arch/powerpc/platforms/book3s/vas-api.c
> > Added hooks to call platform specific code, but the underline
> > powerNV code in these functions is not changed.
> 
> Even so, could you do one patch that just moves, and another that
> adds the ops struct?

Sure, I will create separate patches. 

> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h                | 22 ++++++-
> >  arch/powerpc/platforms/Kconfig                |  1 +
> >  arch/powerpc/platforms/Makefile               |  1 +
> >  arch/powerpc/platforms/book3s/Kconfig         | 15 +++++
> >  arch/powerpc/platforms/book3s/Makefile        |  2 +
> 
> The usual place for these would be arch/powerpc/sysdev/vas. E.g., see
> arch/powerpc/sysdev/xive.

It was recommended to create book3s and move common vas-api code. 

> 
> >  .../platforms/{powernv => book3s}/vas-api.c   | 64 ++++++++++-----
> > ---
> >  arch/powerpc/platforms/powernv/Kconfig        | 14 ----
> >  arch/powerpc/platforms/powernv/Makefile       |  2 +-
> >  arch/powerpc/platforms/powernv/vas-window.c   | 66
> > +++++++++++++++++++
> >  9 files changed, 143 insertions(+), 44 deletions(-)
> >  create mode 100644 arch/powerpc/platforms/book3s/Kconfig
> >  create mode 100644 arch/powerpc/platforms/book3s/Makefile
> >  rename arch/powerpc/platforms/{powernv => book3s}/vas-api.c (83%)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 41f73fae7ab8..6bbade60d8f4 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,8 @@
> >  
> >  #ifndef _ASM_POWERPC_VAS_H
> >  #define _ASM_POWERPC_VAS_H
> > +#include <uapi/asm/vas-api.h>
> > +
> >  
> >  struct vas_window;
> >  
> > @@ -48,6 +50,16 @@ enum vas_cop_type {
> >  	VAS_COP_TYPE_MAX,
> >  };
> >  
> > +/*
> > + * User space window operations used for powernv and powerVM
> > + */
> > +struct vas_user_win_ops {
> > +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> > +				enum vas_cop_type);
> > +	u64 (*paste_addr)(void *);
> > +	int (*close_win)(void *);
> > +};
> > +
> >  /*
> >   * Receive window attributes specified by the (in-kernel) owner of
> > window.
> >   */
> > @@ -161,6 +173,9 @@ int vas_copy_crb(void *crb, int offset);
> >   * assumed to be true for NX windows.
> >   */
> >  int vas_paste_crb(struct vas_window *win, int offset, bool re);
> > +int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			     const char *name);
> > +void vas_unregister_api_powernv(void);
> >  
> >  /*
> >   * Register / unregister coprocessor type to VAS API which will be
> > exported
> > @@ -170,8 +185,9 @@ int vas_paste_crb(struct vas_window *win, int
> > offset, bool re);
> >   * Only NX GZIP coprocessor type is supported now, but this API
> > can be
> >   * used for others in future.
> >   */
> > -int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > -			     const char *name);
> > -void vas_unregister_api_powernv(void);
> > +int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			    const char *name,
> > +			    struct vas_user_win_ops *vops);
> > +void vas_unregister_coproc_api(void);
> >  
> >  #endif /* __ASM_POWERPC_VAS_H */
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
> > index 000000000000..51e14db83a79
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/book3s/Kconfig
> > @@ -0,0 +1,15 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +config PPC_VAS
> > +	bool "IBM Virtual Accelerator Switchboard (VAS)"
> > +	depends on PPC_POWERNV && PPC_64K_PAGES
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
> > +
> > +	  If unsure, say "N".
> > diff --git a/arch/powerpc/platforms/book3s/Makefile
> > b/arch/powerpc/platforms/book3s/Makefile
> > new file mode 100644
> > index 000000000000..e790f1910f61
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/book3s/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_PPC_VAS)	+= vas-api.o
> > diff --git a/arch/powerpc/platforms/powernv/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > similarity index 83%
> > rename from arch/powerpc/platforms/powernv/vas-api.c
> > rename to arch/powerpc/platforms/book3s/vas-api.c
> > index 72d8ce39e56c..05d7b99acf41 100644
> > --- a/arch/powerpc/platforms/powernv/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -4,15 +4,20 @@
> >   * Copyright (C) 2019 Haren Myneni, IBM Corp
> >   */
> >  
> > +#include <linux/module.h>
> >  #include <linux/kernel.h>
> >  #include <linux/device.h>
> >  #include <linux/cdev.h>
> >  #include <linux/fs.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/kthread.h>
> > +#include <linux/sched/signal.h>
> > +#include <linux/sched/mm.h>
> > +#include <linux/mmu_context.h>
> >  #include <asm/vas.h>
> > +#include <asm/icswx.h>
> >  #include <uapi/asm/vas-api.h>
> > -#include "vas.h"
> >  
> >  /*
> >   * The driver creates the device node that can be used as follows:
> > @@ -42,6 +47,7 @@ static struct coproc_dev {
> >  	dev_t devt;
> >  	struct class *class;
> >  	enum vas_cop_type cop_type;
> > +	struct vas_user_win_ops *vops;
> >  } coproc_device;
> >  
> >  struct coproc_instance {
> > @@ -72,11 +78,10 @@ static int coproc_open(struct inode *inode,
> > struct file *fp)
> >  static int coproc_ioc_tx_win_open(struct file *fp, unsigned long
> > arg)
> >  {
> >  	void __user *uptr = (void __user *)arg;
> > -	struct vas_tx_win_attr txattr = {};
> >  	struct vas_tx_win_open_attr uattr;
> >  	struct coproc_instance *cp_inst;
> >  	struct vas_window *txwin;
> > -	int rc, vasid;
> > +	int rc;
> >  
> >  	cp_inst = fp->private_data;
> >  
> > @@ -93,27 +98,20 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >  	}
> >  
> >  	if (uattr.version != 1) {
> > -		pr_err("Invalid version\n");
> > +		pr_err("Invalid window open API version\n");
> >  		return -EINVAL;
> >  	}
> >  
> > -	vasid = uattr.vas_id;
> > -
> > -	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
> > -
> > -	txattr.lpid = mfspr(SPRN_LPID);
> > -	txattr.pidr = mfspr(SPRN_PID);
> > -	txattr.user_win = true;
> > -	txattr.rsvd_txbuf_count = false;
> > -	txattr.pswid = false;
> > -
> > -	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> > -				mfspr(SPRN_PID));
> > +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) 
> > {
> > +		pr_err("VAS API is not registered\n");
> > +		return -EACCES;
> > +	}
> >  
> > -	txwin = vas_tx_win_open(vasid, cp_inst->coproc->cop_type,
> > &txattr);
> > +	txwin = cp_inst->coproc->vops->open_win(&uattr,
> > +					cp_inst->coproc->cop_type);
> >  	if (IS_ERR(txwin)) {
> > -		pr_err("%s() vas_tx_win_open() failed, %ld\n",
> > __func__,
> > -					PTR_ERR(txwin));
> > +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> > +				PTR_ERR(txwin));
> >  		return PTR_ERR(txwin);
> >  	}
> >  
> > @@ -125,9 +123,14 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >  static int coproc_release(struct inode *inode, struct file *fp)
> >  {
> >  	struct coproc_instance *cp_inst = fp->private_data;
> > +	int rc = 0;
> >  
> >  	if (cp_inst->txwin) {
> > -		vas_win_close(cp_inst->txwin);
> > +		if (cp_inst->coproc->vops && cp_inst->coproc->vops-
> > >close_win) {
> > +			rc = cp_inst->coproc->vops->close_win(cp_inst-
> > >txwin);
> > +			if (rc)
> > +				return rc;
> > +		}
> >  		cp_inst->txwin = NULL;
> >  	}
> >  
> > @@ -168,7 +171,17 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >  		return -EINVAL;
> >  	}
> >  
> > -	vas_win_paste_addr(txwin, &paste_addr, NULL);
> > +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops-
> > >paste_addr) {
> > +		pr_err("%s(): VAS API is not registered\n", __func__);
> > +		return -EACCES;
> > +	}
> > +
> > +	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> > +	if (!paste_addr) {
> > +		pr_err("%s(): Window paste address failed\n",
> > __func__);
> > +		return -EINVAL;
> > +	}
> > +
> >  	pfn = paste_addr >> PAGE_SHIFT;
> >  
> >  	/* flags, page_prot from cxl_mmap(), except we want cachable */
> > @@ -207,8 +220,8 @@ static struct file_operations coproc_fops = {
> >   * Supporting only nx-gzip coprocessor type now, but this API code
> >   * extended to other coprocessor types later.
> >   */
> > -int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > -			     const char *name)
> > +int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			const char *name, struct vas_user_win_ops
> > *vops)
> >  {
> >  	int rc = -EINVAL;
> >  	dev_t devno;
> > @@ -230,6 +243,7 @@ int vas_register_api_powernv(struct module
> > *mod, enum vas_cop_type cop_type,
> >  	}
> >  	coproc_device.class->devnode = coproc_devnode;
> >  	coproc_device.cop_type = cop_type;
> > +	coproc_device.vops = vops;
> >  
> >  	coproc_fops.owner = mod;
> >  	cdev_init(&coproc_device.cdev, &coproc_fops);
> > @@ -262,9 +276,8 @@ int vas_register_api_powernv(struct module
> > *mod, enum vas_cop_type cop_type,
> >  	unregister_chrdev_region(coproc_device.devt, 1);
> >  	return rc;
> >  }
> > -EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> >  
> > -void vas_unregister_api_powernv(void)
> > +void vas_unregister_coproc_api(void)
> >  {
> >  	dev_t devno;
> >  
> > @@ -275,4 +288,3 @@ void vas_unregister_api_powernv(void)
> >  	class_destroy(coproc_device.class);
> >  	unregister_chrdev_region(coproc_device.devt, 1);
> >  }
> > -EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> > diff --git a/arch/powerpc/platforms/powernv/Kconfig
> > b/arch/powerpc/platforms/powernv/Kconfig
> > index 619b093a0657..043eefbbdd28 100644
> > --- a/arch/powerpc/platforms/powernv/Kconfig
> > +++ b/arch/powerpc/platforms/powernv/Kconfig
> > @@ -33,20 +33,6 @@ config PPC_MEMTRACE
> >  	  Enabling this option allows for runtime allocation of memory
> > (RAM)
> >  	  for hardware tracing.
> >  
> > -config PPC_VAS
> > -	bool "IBM Virtual Accelerator Switchboard (VAS)"
> > -	depends on PPC_POWERNV && PPC_64K_PAGES
> > -	default y
> > -	help
> > -	  This enables support for IBM Virtual Accelerator Switchboard
> > (VAS).
> > -
> > -	  VAS allows accelerators in co-processors like NX-GZIP and NX-
> > 842
> > -	  to be accessible to kernel subsystems and user processes.
> > -
> > -	  VAS adapters are found in POWER9 based systems.
> > -
> > -	  If unsure, say N.
> > -
> >  config SCOM_DEBUGFS
> >  	bool "Expose SCOM controllers via debugfs"
> >  	depends on DEBUG_FS
> > diff --git a/arch/powerpc/platforms/powernv/Makefile
> > b/arch/powerpc/platforms/powernv/Makefile
> > index 2eb6ae150d1f..c747a1f1d25b 100644
> > --- a/arch/powerpc/platforms/powernv/Makefile
> > +++ b/arch/powerpc/platforms/powernv/Makefile
> > @@ -18,7 +18,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-
> > errors.o
> >  obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
> >  obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
> >  obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
> > -obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-
> > fault.o vas-api.o
> > +obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-
> > fault.o
> >  obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
> >  obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
> >  obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c
> > b/arch/powerpc/platforms/powernv/vas-window.c
> > index 5f5fe63a3d1c..b973dd574b47 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -16,6 +16,8 @@
> >  #include <linux/mmu_context.h>
> >  #include <asm/switch_to.h>
> >  #include <asm/ppc-opcode.h>
> > +#include <asm/vas.h>
> > +#include <uapi/asm/vas-api.h>
> >  #include "vas.h"
> >  #include "copy-paste.h"
> >  
> > @@ -1441,3 +1443,67 @@ struct vas_window
> > *vas_pswid_to_window(struct vas_instance *vinst,
> >  
> >  	return window;
> >  }
> > +
> > +static struct vas_window *vas_user_win_open(struct
> > vas_tx_win_open_attr *uattr,
> > +				enum vas_cop_type cop_type)
> > +{
> > +	struct vas_tx_win_attr txattr = {};
> > +
> > +	vas_init_tx_win_attr(&txattr, cop_type);
> > +
> > +	txattr.lpid = mfspr(SPRN_LPID);
> > +	txattr.pidr = mfspr(SPRN_PID);
> > +	txattr.user_win = true;
> > +	txattr.rsvd_txbuf_count = false;
> > +	txattr.pswid = false;
> > +
> > +	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> > +				mfspr(SPRN_PID));
> > +
> > +	return vas_tx_win_open(uattr->vas_id, cop_type, &txattr);
> > +}
> > +
> > +static u64 vas_user_win_paste_addr(void *addr)
> > +{
> > +	u64 paste_addr;
> > +
> > +	vas_win_paste_addr((struct vas_window *)addr, &paste_addr,
> > NULL);
> > +
> > +	return paste_addr;
> > +}
> > +
> > +static int vas_user_win_close(void *addr)
> > +{
> > +	struct vas_window *txwin = addr;
> > +
> > +	vas_win_close(txwin);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct vas_user_win_ops vops =  {
> > +	.open_win	=	vas_user_win_open,
> > +	.paste_addr	=	vas_user_win_paste_addr,
> > +	.close_win	=	vas_user_win_close,
> > +};
> > +
> > +/*
> > + * Supporting only nx-gzip coprocessor type now, but this API code
> > + * extended to other coprocessor types later.
> > + */
> > +int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > +				const char *name)
> > +{
> > +	int rc;
> > +
> > +	rc = vas_register_coproc_api(mod, cop_type, name, &vops);
> > +
> > +	return rc;
> > +}
> > +EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> > +
> > +void vas_unregister_api_powernv(void)
> > +{
> > +	vas_unregister_coproc_api();
> > +}
> > +EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> > -- 
> > 2.18.2
> > 
> > 
> > 

