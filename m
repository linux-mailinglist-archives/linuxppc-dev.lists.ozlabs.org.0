Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1261E35B7C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 02:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJV4s0J9Fz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:30:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FV+JHH0+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FV+JHH0+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJV4G4CQSz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 10:29:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C02xhC069654; Sun, 11 Apr 2021 20:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=dzexIvyC1syOFDAOticna4o6jm5Ez8TWR2Mna3z9CEk=;
 b=FV+JHH0+4KEbo2WYf42cHYIgb+RMI0x9I753LLl5bdflPIH3XdUeXYSG7ZkCLdAviJ0V
 /lWEBMH28X+x2ggERPtZYnKw1YETu5xNswk0gTjG7OUHdHUXsVDSChnzfkOM/pumqRlf
 zS4TU82ha0dOrKASO6EJJlJ5mhwqkQuwngkkcfezCnvSJn5QePEEzWlCZyNbhctpR59C
 LwWuehMbNik1pr/iaaY7/dJVutBXC+kfULKX9lpuCDcvDYY81sWpNmLU9EaqMx88PvWl
 e8rSL89DcV12sTu5HVUQ/vMGj+dbt5e9CZFXhEuxcL5JkiU5qvK8ukX3S3d4TEGTZOgS fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37usb9wr83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Apr 2021 20:29:32 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13C0Jk95117221;
 Sun, 11 Apr 2021 20:29:32 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37usb9wr7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Apr 2021 20:29:31 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13C0Hd4R017101;
 Mon, 12 Apr 2021 00:29:30 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 37u3n8y1mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 00:29:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13C0TTgt6685148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 00:29:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB07928065;
 Mon, 12 Apr 2021 00:29:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF6802805A;
 Mon, 12 Apr 2021 00:29:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 00:29:28 +0000 (GMT)
Message-ID: <cdbf2feb45a9649bf74e26554c61ccc77b225c3f.camel@linux.ibm.com>
Subject: Re: [PATCH 02/16] powerpc/vas: Make VAS API powerpc platform
 independent
From: Haren Myneni <haren@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 11 Apr 2021 17:29:26 -0700
In-Reply-To: <1804692b-f9d4-964d-bbe4-cb809dad5ee8@csgroup.eu>
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
 <d416c7c03dfa20211bf84b760ceaeed307364509.camel@linux.ibm.com>
 <1804692b-f9d4-964d-bbe4-cb809dad5ee8@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zM4nkbmmmpTQgTHqeM36b8uTJpRghedn
X-Proofpoint-GUID: fdeeABK1ng4zVvDTFMwMI3F-fNPSzFme
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-11_13:2021-04-09,
 2021-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104110189
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


Christophe,
	Thanks for your comments. Please see below for my responses.

On Sun, 2021-04-11 at 10:49 +0200, Christophe Leroy wrote:
> 
> Le 11/04/2021 à 02:31, Haren Myneni a écrit :
> > Using the same /dev/crypto/nx-gzip interface for both powerNV and
> > pseries. So this patcb moves VAS API to powerpc platform indepedent
> > directory. The actual functionality is not changed in this patch.
> 
> This patch seems to do a lot more than moving VAS API to independent
> directory. A more detailed 
> description would help.

Actually the functionality is not changed in this patch. Moved the
common interface code (needed for both powerNV and powerVM platforms)
to arch/powerpc/kernel and added hooks to invoke powerNV specific
functions (underline code is not changed). I will add some more
description.

> 
> And it is not something defined in the powerpc architecture I think,
> so it should
> remain in some common platform related directory.
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >   arch/powerpc/Kconfig                          | 15 +++++
> >   arch/powerpc/include/asm/vas.h                | 22 ++++++-
> >   arch/powerpc/kernel/Makefile                  |  1 +
> >   .../{platforms/powernv => kernel}/vas-api.c   | 64 ++++++++++--
> > ------
> >   arch/powerpc/platforms/powernv/Kconfig        | 14 ----
> >   arch/powerpc/platforms/powernv/Makefile       |  2 +-
> >   arch/powerpc/platforms/powernv/vas-window.c   | 66
> > +++++++++++++++++++
> >   7 files changed, 140 insertions(+), 44 deletions(-)
> >   rename arch/powerpc/{platforms/powernv => kernel}/vas-api.c (83%)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 386ae12d8523..7aa1fbf7c1dc 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -478,6 +478,21 @@ config PPC_UV
> >   
> >   	  If unsure, say "N".
> >   
> > +config PPC_VAS
> > +	bool "IBM Virtual Accelerator Switchboard (VAS)"
> > +	depends on PPC_POWERNV && PPC_64K_PAGES
> > +	default y
> > +	help
> > +	  This enables support for IBM Virtual Accelerator Switchboard
> > (VAS).
> 
> IIUC is a functionnality in a coprocessor of some IBM processors.
> Something similar in principle to 
> the communication coprocessors we find in Freescale processors.
> 
> It is not a generic functionnality part of the powerpc architecture,
> I don't think this belongs to 
> arch/powerpc/Kconfig
> 
> I think it should go in arch/powerpc/platform/Kconfig
> 
> Or maybe in drivers/soc/ibm/ ?

VAS (Virtual Accelerator Switchboard) is on powerpc chip which allows
userspace / kernel to communicate to accelerators (Right now supports
only Next (NX) accelerator). VAS can also provide other SW
functionalities such as fast thread wakeup, fast memory copy (using
copy/paste instructions). So introduced this VAS API to support any
accelerator and other SW functionalities in future. 

VAS is introduced on P9 and will be available in all future powerpc
chips.

I will move config changes to arch/powerpc/platform/Kconfig but thought
easy to look / manage Kconfig changes if they are in same directory. 

Thanks
Haren
> 
> 
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
> > +
> >   config LD_HEAD_STUB_CATCH
> >   	bool "Reserve 256 bytes to cope with linker stubs in HEAD text"
> > if EXPERT
> >   	depends on PPC64
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 41f73fae7ab8..6bbade60d8f4 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,8 @@
> >   
> >   #ifndef _ASM_POWERPC_VAS_H
> >   #define _ASM_POWERPC_VAS_H
> > +#include <uapi/asm/vas-api.h>
> > +
> >   
> >   struct vas_window;
> >   
> > @@ -48,6 +50,16 @@ enum vas_cop_type {
> >   	VAS_COP_TYPE_MAX,
> >   };
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
> >   /*
> >    * Receive window attributes specified by the (in-kernel) owner
> > of window.
> >    */
> > @@ -161,6 +173,9 @@ int vas_copy_crb(void *crb, int offset);
> >    * assumed to be true for NX windows.
> >    */
> >   int vas_paste_crb(struct vas_window *win, int offset, bool re);
> > +int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			     const char *name);
> > +void vas_unregister_api_powernv(void);
> >   
> >   /*
> >    * Register / unregister coprocessor type to VAS API which will
> > be exported
> > @@ -170,8 +185,9 @@ int vas_paste_crb(struct vas_window *win, int
> > offset, bool re);
> >    * Only NX GZIP coprocessor type is supported now, but this API
> > can be
> >    * used for others in future.
> >    */
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
> >   #endif /* __ASM_POWERPC_VAS_H */
> > diff --git a/arch/powerpc/kernel/Makefile
> > b/arch/powerpc/kernel/Makefile
> > index 6084fa499aa3..205d8f12bd36 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -118,6 +118,7 @@ obj-$(CONFIG_PPC_UDBG_16550)	+=
> > legacy_serial.o udbg_16550.o
> >   obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
> >   obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
> >   obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
> > +obj-$(CONFIG_PPC_VAS)		+= vas-api.o
> >   
> >   pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-
> > bridge.o
> >   obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
> > diff --git a/arch/powerpc/platforms/powernv/vas-api.c
> > b/arch/powerpc/kernel/vas-api.c
> > similarity index 83%
> > rename from arch/powerpc/platforms/powernv/vas-api.c
> > rename to arch/powerpc/kernel/vas-api.c
> > index 72d8ce39e56c..05d7b99acf41 100644
> > --- a/arch/powerpc/platforms/powernv/vas-api.c
> > +++ b/arch/powerpc/kernel/vas-api.c
> > @@ -4,15 +4,20 @@
> >    * Copyright (C) 2019 Haren Myneni, IBM Corp
> >    */
> >   
> > +#include <linux/module.h>
> >   #include <linux/kernel.h>
> >   #include <linux/device.h>
> >   #include <linux/cdev.h>
> >   #include <linux/fs.h>
> >   #include <linux/slab.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/kthread.h>
> > +#include <linux/sched/signal.h>
> > +#include <linux/sched/mm.h>
> > +#include <linux/mmu_context.h>
> >   #include <asm/vas.h>
> > +#include <asm/icswx.h>
> >   #include <uapi/asm/vas-api.h>
> > -#include "vas.h"
> >   
> >   /*
> >    * The driver creates the device node that can be used as
> > follows:
> > @@ -42,6 +47,7 @@ static struct coproc_dev {
> >   	dev_t devt;
> >   	struct class *class;
> >   	enum vas_cop_type cop_type;
> > +	struct vas_user_win_ops *vops;
> >   } coproc_device;
> >   
> >   struct coproc_instance {
> > @@ -72,11 +78,10 @@ static int coproc_open(struct inode *inode,
> > struct file *fp)
> >   static int coproc_ioc_tx_win_open(struct file *fp, unsigned long
> > arg)
> >   {
> >   	void __user *uptr = (void __user *)arg;
> > -	struct vas_tx_win_attr txattr = {};
> >   	struct vas_tx_win_open_attr uattr;
> >   	struct coproc_instance *cp_inst;
> >   	struct vas_window *txwin;
> > -	int rc, vasid;
> > +	int rc;
> >   
> >   	cp_inst = fp->private_data;
> >   
> > @@ -93,27 +98,20 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >   	}
> >   
> >   	if (uattr.version != 1) {
> > -		pr_err("Invalid version\n");
> > +		pr_err("Invalid window open API version\n");
> >   		return -EINVAL;
> >   	}
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
> >   	if (IS_ERR(txwin)) {
> > -		pr_err("%s() vas_tx_win_open() failed, %ld\n",
> > __func__,
> > -					PTR_ERR(txwin));
> > +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> > +				PTR_ERR(txwin));
> >   		return PTR_ERR(txwin);
> >   	}
> >   
> > @@ -125,9 +123,14 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >   static int coproc_release(struct inode *inode, struct file *fp)
> >   {
> >   	struct coproc_instance *cp_inst = fp->private_data;
> > +	int rc = 0;
> >   
> >   	if (cp_inst->txwin) {
> > -		vas_win_close(cp_inst->txwin);
> > +		if (cp_inst->coproc->vops && cp_inst->coproc->vops-
> > >close_win) {
> > +			rc = cp_inst->coproc->vops->close_win(cp_inst-
> > >txwin);
> > +			if (rc)
> > +				return rc;
> > +		}
> >   		cp_inst->txwin = NULL;
> >   	}
> >   
> > @@ -168,7 +171,17 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >   		return -EINVAL;
> >   	}
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
> >   	pfn = paste_addr >> PAGE_SHIFT;
> >   
> >   	/* flags, page_prot from cxl_mmap(), except we want cachable */
> > @@ -207,8 +220,8 @@ static struct file_operations coproc_fops = {
> >    * Supporting only nx-gzip coprocessor type now, but this API
> > code
> >    * extended to other coprocessor types later.
> >    */
> > -int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > -			     const char *name)
> > +int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			const char *name, struct vas_user_win_ops
> > *vops)
> >   {
> >   	int rc = -EINVAL;
> >   	dev_t devno;
> > @@ -230,6 +243,7 @@ int vas_register_api_powernv(struct module
> > *mod, enum vas_cop_type cop_type,
> >   	}
> >   	coproc_device.class->devnode = coproc_devnode;
> >   	coproc_device.cop_type = cop_type;
> > +	coproc_device.vops = vops;
> >   
> >   	coproc_fops.owner = mod;
> >   	cdev_init(&coproc_device.cdev, &coproc_fops);
> > @@ -262,9 +276,8 @@ int vas_register_api_powernv(struct module
> > *mod, enum vas_cop_type cop_type,
> >   	unregister_chrdev_region(coproc_device.devt, 1);
> >   	return rc;
> >   }
> > -EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> >   
> > -void vas_unregister_api_powernv(void)
> > +void vas_unregister_coproc_api(void)
> >   {
> >   	dev_t devno;
> >   
> > @@ -275,4 +288,3 @@ void vas_unregister_api_powernv(void)
> >   	class_destroy(coproc_device.class);
> >   	unregister_chrdev_region(coproc_device.devt, 1);
> >   }
> > -EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> > diff --git a/arch/powerpc/platforms/powernv/Kconfig
> > b/arch/powerpc/platforms/powernv/Kconfig
> > index 619b093a0657..043eefbbdd28 100644
> > --- a/arch/powerpc/platforms/powernv/Kconfig
> > +++ b/arch/powerpc/platforms/powernv/Kconfig
> > @@ -33,20 +33,6 @@ config PPC_MEMTRACE
> >   	  Enabling this option allows for runtime allocation of memory
> > (RAM)
> >   	  for hardware tracing.
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
> >   config SCOM_DEBUGFS
> >   	bool "Expose SCOM controllers via debugfs"
> >   	depends on DEBUG_FS
> > diff --git a/arch/powerpc/platforms/powernv/Makefile
> > b/arch/powerpc/platforms/powernv/Makefile
> > index 2eb6ae150d1f..c747a1f1d25b 100644
> > --- a/arch/powerpc/platforms/powernv/Makefile
> > +++ b/arch/powerpc/platforms/powernv/Makefile
> > @@ -18,7 +18,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-
> > errors.o
> >   obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
> >   obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
> >   obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
> > -obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-
> > fault.o vas-api.o
> > +obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-
> > fault.o
> >   obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
> >   obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
> >   obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c
> > b/arch/powerpc/platforms/powernv/vas-window.c
> > index 5f5fe63a3d1c..b973dd574b47 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -16,6 +16,8 @@
> >   #include <linux/mmu_context.h>
> >   #include <asm/switch_to.h>
> >   #include <asm/ppc-opcode.h>
> > +#include <asm/vas.h>
> > +#include <uapi/asm/vas-api.h>
> >   #include "vas.h"
> >   #include "copy-paste.h"
> >   
> > @@ -1441,3 +1443,67 @@ struct vas_window
> > *vas_pswid_to_window(struct vas_instance *vinst,
> >   
> >   	return window;
> >   }
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
> > 

