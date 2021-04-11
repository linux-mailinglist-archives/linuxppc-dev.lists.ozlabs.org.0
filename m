Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158035B27C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ5Cq122Mz3c0t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ5CT49tpz3028
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:49:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJ5CF4hg8zB09Zx;
 Sun, 11 Apr 2021 10:49:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qRepSn6kgGxs; Sun, 11 Apr 2021 10:49:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJ5CF0KSYzB09Zw;
 Sun, 11 Apr 2021 10:49:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F139C8B770;
 Sun, 11 Apr 2021 10:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sru75ARoGJAp; Sun, 11 Apr 2021 10:49:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3577D8B75B;
 Sun, 11 Apr 2021 10:49:31 +0200 (CEST)
Subject: Re: [PATCH 02/16] powerpc/vas: Make VAS API powerpc platform
 independent
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, mpe@ellerman.id.au,
 herbert@gondor.apana.org.au, npiggin@gmail.com
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
 <d416c7c03dfa20211bf84b760ceaeed307364509.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1804692b-f9d4-964d-bbe4-cb809dad5ee8@csgroup.eu>
Date: Sun, 11 Apr 2021 10:49:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d416c7c03dfa20211bf84b760ceaeed307364509.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 11/04/2021 à 02:31, Haren Myneni a écrit :
> 
> Using the same /dev/crypto/nx-gzip interface for both powerNV and
> pseries. So this patcb moves VAS API to powerpc platform indepedent
> directory. The actual functionality is not changed in this patch.

This patch seems to do a lot more than moving VAS API to independent directory. A more detailed 
description would help.

And it is not something defined in the powerpc architecture I think, so it should
remain in some common platform related directory.

> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                          | 15 +++++
>   arch/powerpc/include/asm/vas.h                | 22 ++++++-
>   arch/powerpc/kernel/Makefile                  |  1 +
>   .../{platforms/powernv => kernel}/vas-api.c   | 64 ++++++++++--------
>   arch/powerpc/platforms/powernv/Kconfig        | 14 ----
>   arch/powerpc/platforms/powernv/Makefile       |  2 +-
>   arch/powerpc/platforms/powernv/vas-window.c   | 66 +++++++++++++++++++
>   7 files changed, 140 insertions(+), 44 deletions(-)
>   rename arch/powerpc/{platforms/powernv => kernel}/vas-api.c (83%)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 386ae12d8523..7aa1fbf7c1dc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -478,6 +478,21 @@ config PPC_UV
>   
>   	  If unsure, say "N".
>   
> +config PPC_VAS
> +	bool "IBM Virtual Accelerator Switchboard (VAS)"
> +	depends on PPC_POWERNV && PPC_64K_PAGES
> +	default y
> +	help
> +	  This enables support for IBM Virtual Accelerator Switchboard (VAS).

IIUC is a functionnality in a coprocessor of some IBM processors. Something similar in principle to 
the communication coprocessors we find in Freescale processors.

It is not a generic functionnality part of the powerpc architecture, I don't think this belongs to 
arch/powerpc/Kconfig

I think it should go in arch/powerpc/platform/Kconfig

Or maybe in drivers/soc/ibm/ ?


> +
> +	  VAS allows accelerators in co-processors like NX-GZIP and NX-842
> +	  to be accessible to kernel subsystems and user processes.
> +	  VAS adapters are found in POWER9 and later based systems.
> +	  The user mode NX-GZIP support is added on P9 for powerNV and on
> +	  P10 for powerVM.
> +
> +	  If unsure, say "N".
> +
>   config LD_HEAD_STUB_CATCH
>   	bool "Reserve 256 bytes to cope with linker stubs in HEAD text" if EXPERT
>   	depends on PPC64
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
> index 41f73fae7ab8..6bbade60d8f4 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,8 @@
>   
>   #ifndef _ASM_POWERPC_VAS_H
>   #define _ASM_POWERPC_VAS_H
> +#include <uapi/asm/vas-api.h>
> +
>   
>   struct vas_window;
>   
> @@ -48,6 +50,16 @@ enum vas_cop_type {
>   	VAS_COP_TYPE_MAX,
>   };
>   
> +/*
> + * User space window operations used for powernv and powerVM
> + */
> +struct vas_user_win_ops {
> +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> +				enum vas_cop_type);
> +	u64 (*paste_addr)(void *);
> +	int (*close_win)(void *);
> +};
> +
>   /*
>    * Receive window attributes specified by the (in-kernel) owner of window.
>    */
> @@ -161,6 +173,9 @@ int vas_copy_crb(void *crb, int offset);
>    * assumed to be true for NX windows.
>    */
>   int vas_paste_crb(struct vas_window *win, int offset, bool re);
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
> +			     const char *name);
> +void vas_unregister_api_powernv(void);
>   
>   /*
>    * Register / unregister coprocessor type to VAS API which will be exported
> @@ -170,8 +185,9 @@ int vas_paste_crb(struct vas_window *win, int offset, bool re);
>    * Only NX GZIP coprocessor type is supported now, but this API can be
>    * used for others in future.
>    */
> -int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
> -			     const char *name);
> -void vas_unregister_api_powernv(void);
> +int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
> +			    const char *name,
> +			    struct vas_user_win_ops *vops);
> +void vas_unregister_coproc_api(void);
>   
>   #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 6084fa499aa3..205d8f12bd36 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -118,6 +118,7 @@ obj-$(CONFIG_PPC_UDBG_16550)	+= legacy_serial.o udbg_16550.o
>   obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
>   obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
>   obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
> +obj-$(CONFIG_PPC_VAS)		+= vas-api.o
>   
>   pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-bridge.o
>   obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/kernel/vas-api.c
> similarity index 83%
> rename from arch/powerpc/platforms/powernv/vas-api.c
> rename to arch/powerpc/kernel/vas-api.c
> index 72d8ce39e56c..05d7b99acf41 100644
> --- a/arch/powerpc/platforms/powernv/vas-api.c
> +++ b/arch/powerpc/kernel/vas-api.c
> @@ -4,15 +4,20 @@
>    * Copyright (C) 2019 Haren Myneni, IBM Corp
>    */
>   
> +#include <linux/module.h>
>   #include <linux/kernel.h>
>   #include <linux/device.h>
>   #include <linux/cdev.h>
>   #include <linux/fs.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> +#include <linux/kthread.h>
> +#include <linux/sched/signal.h>
> +#include <linux/sched/mm.h>
> +#include <linux/mmu_context.h>
>   #include <asm/vas.h>
> +#include <asm/icswx.h>
>   #include <uapi/asm/vas-api.h>
> -#include "vas.h"
>   
>   /*
>    * The driver creates the device node that can be used as follows:
> @@ -42,6 +47,7 @@ static struct coproc_dev {
>   	dev_t devt;
>   	struct class *class;
>   	enum vas_cop_type cop_type;
> +	struct vas_user_win_ops *vops;
>   } coproc_device;
>   
>   struct coproc_instance {
> @@ -72,11 +78,10 @@ static int coproc_open(struct inode *inode, struct file *fp)
>   static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>   {
>   	void __user *uptr = (void __user *)arg;
> -	struct vas_tx_win_attr txattr = {};
>   	struct vas_tx_win_open_attr uattr;
>   	struct coproc_instance *cp_inst;
>   	struct vas_window *txwin;
> -	int rc, vasid;
> +	int rc;
>   
>   	cp_inst = fp->private_data;
>   
> @@ -93,27 +98,20 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>   	}
>   
>   	if (uattr.version != 1) {
> -		pr_err("Invalid version\n");
> +		pr_err("Invalid window open API version\n");
>   		return -EINVAL;
>   	}
>   
> -	vasid = uattr.vas_id;
> -
> -	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
> -
> -	txattr.lpid = mfspr(SPRN_LPID);
> -	txattr.pidr = mfspr(SPRN_PID);
> -	txattr.user_win = true;
> -	txattr.rsvd_txbuf_count = false;
> -	txattr.pswid = false;
> -
> -	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> -				mfspr(SPRN_PID));
> +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) {
> +		pr_err("VAS API is not registered\n");
> +		return -EACCES;
> +	}
>   
> -	txwin = vas_tx_win_open(vasid, cp_inst->coproc->cop_type, &txattr);
> +	txwin = cp_inst->coproc->vops->open_win(&uattr,
> +					cp_inst->coproc->cop_type);
>   	if (IS_ERR(txwin)) {
> -		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
> -					PTR_ERR(txwin));
> +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> +				PTR_ERR(txwin));
>   		return PTR_ERR(txwin);
>   	}
>   
> @@ -125,9 +123,14 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>   static int coproc_release(struct inode *inode, struct file *fp)
>   {
>   	struct coproc_instance *cp_inst = fp->private_data;
> +	int rc = 0;
>   
>   	if (cp_inst->txwin) {
> -		vas_win_close(cp_inst->txwin);
> +		if (cp_inst->coproc->vops && cp_inst->coproc->vops->close_win) {
> +			rc = cp_inst->coproc->vops->close_win(cp_inst->txwin);
> +			if (rc)
> +				return rc;
> +		}
>   		cp_inst->txwin = NULL;
>   	}
>   
> @@ -168,7 +171,17 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
>   		return -EINVAL;
>   	}
>   
> -	vas_win_paste_addr(txwin, &paste_addr, NULL);
> +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->paste_addr) {
> +		pr_err("%s(): VAS API is not registered\n", __func__);
> +		return -EACCES;
> +	}
> +
> +	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> +	if (!paste_addr) {
> +		pr_err("%s(): Window paste address failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
>   	pfn = paste_addr >> PAGE_SHIFT;
>   
>   	/* flags, page_prot from cxl_mmap(), except we want cachable */
> @@ -207,8 +220,8 @@ static struct file_operations coproc_fops = {
>    * Supporting only nx-gzip coprocessor type now, but this API code
>    * extended to other coprocessor types later.
>    */
> -int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
> -			     const char *name)
> +int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
> +			const char *name, struct vas_user_win_ops *vops)
>   {
>   	int rc = -EINVAL;
>   	dev_t devno;
> @@ -230,6 +243,7 @@ int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
>   	}
>   	coproc_device.class->devnode = coproc_devnode;
>   	coproc_device.cop_type = cop_type;
> +	coproc_device.vops = vops;
>   
>   	coproc_fops.owner = mod;
>   	cdev_init(&coproc_device.cdev, &coproc_fops);
> @@ -262,9 +276,8 @@ int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
>   	unregister_chrdev_region(coproc_device.devt, 1);
>   	return rc;
>   }
> -EXPORT_SYMBOL_GPL(vas_register_api_powernv);
>   
> -void vas_unregister_api_powernv(void)
> +void vas_unregister_coproc_api(void)
>   {
>   	dev_t devno;
>   
> @@ -275,4 +288,3 @@ void vas_unregister_api_powernv(void)
>   	class_destroy(coproc_device.class);
>   	unregister_chrdev_region(coproc_device.devt, 1);
>   }
> -EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 619b093a0657..043eefbbdd28 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -33,20 +33,6 @@ config PPC_MEMTRACE
>   	  Enabling this option allows for runtime allocation of memory (RAM)
>   	  for hardware tracing.
>   
> -config PPC_VAS
> -	bool "IBM Virtual Accelerator Switchboard (VAS)"
> -	depends on PPC_POWERNV && PPC_64K_PAGES
> -	default y
> -	help
> -	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
> -
> -	  VAS allows accelerators in co-processors like NX-GZIP and NX-842
> -	  to be accessible to kernel subsystems and user processes.
> -
> -	  VAS adapters are found in POWER9 based systems.
> -
> -	  If unsure, say N.
> -
>   config SCOM_DEBUGFS
>   	bool "Expose SCOM controllers via debugfs"
>   	depends on DEBUG_FS
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index 2eb6ae150d1f..c747a1f1d25b 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>   obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>   obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
>   obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
> -obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o vas-api.o
> +obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
>   obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
>   obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
>   obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> index 5f5fe63a3d1c..b973dd574b47 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -16,6 +16,8 @@
>   #include <linux/mmu_context.h>
>   #include <asm/switch_to.h>
>   #include <asm/ppc-opcode.h>
> +#include <asm/vas.h>
> +#include <uapi/asm/vas-api.h>
>   #include "vas.h"
>   #include "copy-paste.h"
>   
> @@ -1441,3 +1443,67 @@ struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
>   
>   	return window;
>   }
> +
> +static struct vas_window *vas_user_win_open(struct vas_tx_win_open_attr *uattr,
> +				enum vas_cop_type cop_type)
> +{
> +	struct vas_tx_win_attr txattr = {};
> +
> +	vas_init_tx_win_attr(&txattr, cop_type);
> +
> +	txattr.lpid = mfspr(SPRN_LPID);
> +	txattr.pidr = mfspr(SPRN_PID);
> +	txattr.user_win = true;
> +	txattr.rsvd_txbuf_count = false;
> +	txattr.pswid = false;
> +
> +	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> +				mfspr(SPRN_PID));
> +
> +	return vas_tx_win_open(uattr->vas_id, cop_type, &txattr);
> +}
> +
> +static u64 vas_user_win_paste_addr(void *addr)
> +{
> +	u64 paste_addr;
> +
> +	vas_win_paste_addr((struct vas_window *)addr, &paste_addr, NULL);
> +
> +	return paste_addr;
> +}
> +
> +static int vas_user_win_close(void *addr)
> +{
> +	struct vas_window *txwin = addr;
> +
> +	vas_win_close(txwin);
> +
> +	return 0;
> +}
> +
> +static struct vas_user_win_ops vops =  {
> +	.open_win	=	vas_user_win_open,
> +	.paste_addr	=	vas_user_win_paste_addr,
> +	.close_win	=	vas_user_win_close,
> +};
> +
> +/*
> + * Supporting only nx-gzip coprocessor type now, but this API code
> + * extended to other coprocessor types later.
> + */
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
> +				const char *name)
> +{
> +	int rc;
> +
> +	rc = vas_register_coproc_api(mod, cop_type, name, &vops);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> +
> +void vas_unregister_api_powernv(void)
> +{
> +	vas_unregister_coproc_api();
> +}
> +EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> 
