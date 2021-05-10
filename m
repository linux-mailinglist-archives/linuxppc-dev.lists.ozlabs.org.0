Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05409377B75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdqBh0w6Lz308S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:20:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VRuWUElf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VRuWUElf; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdqB14CXGz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 15:19:52 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id t1so3596274pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eMGxbNhosL7JGExP8RG+UVOK+2Ce5mvNJK+Y3I/Wl8I=;
 b=VRuWUElfNVltT+hwkKPCv/1z0ZIZL0oGHvw49vWwWJvFSPDyYi/x2qyiJcYuEc4GXL
 NWT499/3Ry3PCPO8P93e+zKlaZCSxPEesZl10hEbqjyUz0s+v4hphVleU4/GwjC96AeC
 k2rTZH5gtTTXB1zA3rD8LuSy+JKryaP+ak/hYgIY22UT1z8m/u2reYF26OKFtpoDkayi
 sVzzMlOi7zVs/yuFgUigk73GCtBroK8p97P/CsJp/OrXgs2CcgCu7CM1osDSQjnG1bhq
 ArQQguL4q02plEVTFPsXDxmSWmjdyY1Q1MwqoD2utQDsKE8m2P8vi/O3EzoqI+1u8vKs
 41XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eMGxbNhosL7JGExP8RG+UVOK+2Ce5mvNJK+Y3I/Wl8I=;
 b=HdZtQ7ZUHNOgSGmS0uATIRRl89v9xMaxuFGSp4FLIEk7/BXP7ljYKnXq98TNssQFq+
 2pu5lF/HgU2ZwIH2rE3Y4y3d7exJf5BlO54J1awjsHdOGS6GwB6okCfx+F+hxc27m27p
 /2gM/f7mJknwbgj8r+ezio2RLUbnfAtCeOjvwVHvV8I3JfyuKF4iJghKkfgMeV7RXJsY
 nB6ABkO3+fJjAgr5TXQ0e8sUo6NdEWAwScflGMjV2Y9RawARhw+0Sm1Tb7ZeOhDPq8+s
 XzW11LYLQSjyjalvWL/VjDJqF8B+BnwzjmePasfMEY+t2DUQx+h9ENElWSy0Bx/6WmVv
 erGw==
X-Gm-Message-State: AOAM533ebmwe24jR5lDKULQtXlTgeWATfatJzDh4sZ4rIzJ0FkIv2gt7
 JnE8Xq+TvW/iepNj9VjTnWE=
X-Google-Smtp-Source: ABdhPJzkwWzD9q1eXXL9hMsCL7dBZ28Ns4cYMVfj5abQhplevxMJvZM2JMGBET7pbx9TmdFgp/HWMQ==
X-Received: by 2002:a63:9350:: with SMTP id w16mr23252826pgm.53.1620623988992; 
 Sun, 09 May 2021 22:19:48 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id u12sm18472978pji.45.2021.05.09.22.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:19:48 -0700 (PDT)
Date: Mon, 10 May 2021 15:19:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V3 02/16] powerpc/vas: Move VAS API to common book3s
 platform
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <163867b893124434dfe3e13c6ba2f081c309e96f.camel@linux.ibm.com>
In-Reply-To: <163867b893124434dfe3e13c6ba2f081c309e96f.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620623481.kmr54zmxzv.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Haren Myneni's message of April 18, 2021 7:02 am:
>=20
> Using the same /dev/crypto/nx-gzip interface for both powerNV and
> pseries.

The pseries NX driver will use the powernv VAS API ?

> So this patch creates platforms/book3s/ and moves VAS API
> to that directory. The actual functionality is not changed.
>=20
> Common interface functions such as open, window open ioctl, mmap
> and close are moved to arch/powerpc/platforms/book3s/vas-api.c
> Added hooks to call platform specific code, but the underline
> powerNV code in these functions is not changed.

Even so, could you do one patch that just moves, and another that
adds the ops struct?

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h                | 22 ++++++-
>  arch/powerpc/platforms/Kconfig                |  1 +
>  arch/powerpc/platforms/Makefile               |  1 +
>  arch/powerpc/platforms/book3s/Kconfig         | 15 +++++
>  arch/powerpc/platforms/book3s/Makefile        |  2 +

The usual place for these would be arch/powerpc/sysdev/vas. E.g., see
arch/powerpc/sysdev/xive.

>  .../platforms/{powernv =3D> book3s}/vas-api.c   | 64 ++++++++++--------
>  arch/powerpc/platforms/powernv/Kconfig        | 14 ----
>  arch/powerpc/platforms/powernv/Makefile       |  2 +-
>  arch/powerpc/platforms/powernv/vas-window.c   | 66 +++++++++++++++++++
>  9 files changed, 143 insertions(+), 44 deletions(-)
>  create mode 100644 arch/powerpc/platforms/book3s/Kconfig
>  create mode 100644 arch/powerpc/platforms/book3s/Makefile
>  rename arch/powerpc/platforms/{powernv =3D> book3s}/vas-api.c (83%)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 41f73fae7ab8..6bbade60d8f4 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,8 @@
> =20
>  #ifndef _ASM_POWERPC_VAS_H
>  #define _ASM_POWERPC_VAS_H
> +#include <uapi/asm/vas-api.h>
> +
> =20
>  struct vas_window;
> =20
> @@ -48,6 +50,16 @@ enum vas_cop_type {
>  	VAS_COP_TYPE_MAX,
>  };
> =20
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
>  /*
>   * Receive window attributes specified by the (in-kernel) owner of windo=
w.
>   */
> @@ -161,6 +173,9 @@ int vas_copy_crb(void *crb, int offset);
>   * assumed to be true for NX windows.
>   */
>  int vas_paste_crb(struct vas_window *win, int offset, bool re);
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> +			     const char *name);
> +void vas_unregister_api_powernv(void);
> =20
>  /*
>   * Register / unregister coprocessor type to VAS API which will be expor=
ted
> @@ -170,8 +185,9 @@ int vas_paste_crb(struct vas_window *win, int offset,=
 bool re);
>   * Only NX GZIP coprocessor type is supported now, but this API can be
>   * used for others in future.
>   */
> -int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> -			     const char *name);
> -void vas_unregister_api_powernv(void);
> +int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> +			    const char *name,
> +			    struct vas_user_win_ops *vops);
> +void vas_unregister_coproc_api(void);
> =20
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kcon=
fig
> index 7a5e8f4541e3..594544a65b02 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
>  source "arch/powerpc/platforms/44x/Kconfig"
>  source "arch/powerpc/platforms/40x/Kconfig"
>  source "arch/powerpc/platforms/amigaone/Kconfig"
> +source "arch/powerpc/platforms/book3s/Kconfig"
> =20
>  config KVM_GUEST
>  	bool "KVM Guest support"
> diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Mak=
efile
> index 143d4417f6cc..0e75d7df387b 100644
> --- a/arch/powerpc/platforms/Makefile
> +++ b/arch/powerpc/platforms/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+=3D cell/
>  obj-$(CONFIG_PPC_PS3)		+=3D ps3/
>  obj-$(CONFIG_EMBEDDED6xx)	+=3D embedded6xx/
>  obj-$(CONFIG_AMIGAONE)		+=3D amigaone/
> +obj-$(CONFIG_PPC_BOOK3S)	+=3D book3s/
> diff --git a/arch/powerpc/platforms/book3s/Kconfig b/arch/powerpc/platfor=
ms/book3s/Kconfig
> new file mode 100644
> index 000000000000..51e14db83a79
> --- /dev/null
> +++ b/arch/powerpc/platforms/book3s/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config PPC_VAS
> +	bool "IBM Virtual Accelerator Switchboard (VAS)"
> +	depends on PPC_POWERNV && PPC_64K_PAGES
> +	default y
> +	help
> +	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
> +
> +	  VAS allows accelerators in co-processors like NX-GZIP and NX-842
> +	  to be accessible to kernel subsystems and user processes.
> +	  VAS adapters are found in POWER9 and later based systems.
> +	  The user mode NX-GZIP support is added on P9 for powerNV and on
> +	  P10 for powerVM.
> +
> +	  If unsure, say "N".
> diff --git a/arch/powerpc/platforms/book3s/Makefile b/arch/powerpc/platfo=
rms/book3s/Makefile
> new file mode 100644
> index 000000000000..e790f1910f61
> --- /dev/null
> +++ b/arch/powerpc/platforms/book3s/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PPC_VAS)	+=3D vas-api.o
> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/plat=
forms/book3s/vas-api.c
> similarity index 83%
> rename from arch/powerpc/platforms/powernv/vas-api.c
> rename to arch/powerpc/platforms/book3s/vas-api.c
> index 72d8ce39e56c..05d7b99acf41 100644
> --- a/arch/powerpc/platforms/powernv/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -4,15 +4,20 @@
>   * Copyright (C) 2019 Haren Myneni, IBM Corp
>   */
> =20
> +#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
>  #include <linux/fs.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> +#include <linux/kthread.h>
> +#include <linux/sched/signal.h>
> +#include <linux/sched/mm.h>
> +#include <linux/mmu_context.h>
>  #include <asm/vas.h>
> +#include <asm/icswx.h>
>  #include <uapi/asm/vas-api.h>
> -#include "vas.h"
> =20
>  /*
>   * The driver creates the device node that can be used as follows:
> @@ -42,6 +47,7 @@ static struct coproc_dev {
>  	dev_t devt;
>  	struct class *class;
>  	enum vas_cop_type cop_type;
> +	struct vas_user_win_ops *vops;
>  } coproc_device;
> =20
>  struct coproc_instance {
> @@ -72,11 +78,10 @@ static int coproc_open(struct inode *inode, struct fi=
le *fp)
>  static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>  {
>  	void __user *uptr =3D (void __user *)arg;
> -	struct vas_tx_win_attr txattr =3D {};
>  	struct vas_tx_win_open_attr uattr;
>  	struct coproc_instance *cp_inst;
>  	struct vas_window *txwin;
> -	int rc, vasid;
> +	int rc;
> =20
>  	cp_inst =3D fp->private_data;
> =20
> @@ -93,27 +98,20 @@ static int coproc_ioc_tx_win_open(struct file *fp, un=
signed long arg)
>  	}
> =20
>  	if (uattr.version !=3D 1) {
> -		pr_err("Invalid version\n");
> +		pr_err("Invalid window open API version\n");
>  		return -EINVAL;
>  	}
> =20
> -	vasid =3D uattr.vas_id;
> -
> -	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
> -
> -	txattr.lpid =3D mfspr(SPRN_LPID);
> -	txattr.pidr =3D mfspr(SPRN_PID);
> -	txattr.user_win =3D true;
> -	txattr.rsvd_txbuf_count =3D false;
> -	txattr.pswid =3D false;
> -
> -	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> -				mfspr(SPRN_PID));
> +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) {
> +		pr_err("VAS API is not registered\n");
> +		return -EACCES;
> +	}
> =20
> -	txwin =3D vas_tx_win_open(vasid, cp_inst->coproc->cop_type, &txattr);
> +	txwin =3D cp_inst->coproc->vops->open_win(&uattr,
> +					cp_inst->coproc->cop_type);
>  	if (IS_ERR(txwin)) {
> -		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
> -					PTR_ERR(txwin));
> +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> +				PTR_ERR(txwin));
>  		return PTR_ERR(txwin);
>  	}
> =20
> @@ -125,9 +123,14 @@ static int coproc_ioc_tx_win_open(struct file *fp, u=
nsigned long arg)
>  static int coproc_release(struct inode *inode, struct file *fp)
>  {
>  	struct coproc_instance *cp_inst =3D fp->private_data;
> +	int rc =3D 0;
> =20
>  	if (cp_inst->txwin) {
> -		vas_win_close(cp_inst->txwin);
> +		if (cp_inst->coproc->vops && cp_inst->coproc->vops->close_win) {
> +			rc =3D cp_inst->coproc->vops->close_win(cp_inst->txwin);
> +			if (rc)
> +				return rc;
> +		}
>  		cp_inst->txwin =3D NULL;
>  	}
> =20
> @@ -168,7 +171,17 @@ static int coproc_mmap(struct file *fp, struct vm_ar=
ea_struct *vma)
>  		return -EINVAL;
>  	}
> =20
> -	vas_win_paste_addr(txwin, &paste_addr, NULL);
> +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->paste_addr) {
> +		pr_err("%s(): VAS API is not registered\n", __func__);
> +		return -EACCES;
> +	}
> +
> +	paste_addr =3D cp_inst->coproc->vops->paste_addr(txwin);
> +	if (!paste_addr) {
> +		pr_err("%s(): Window paste address failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
>  	pfn =3D paste_addr >> PAGE_SHIFT;
> =20
>  	/* flags, page_prot from cxl_mmap(), except we want cachable */
> @@ -207,8 +220,8 @@ static struct file_operations coproc_fops =3D {
>   * Supporting only nx-gzip coprocessor type now, but this API code
>   * extended to other coprocessor types later.
>   */
> -int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> -			     const char *name)
> +int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> +			const char *name, struct vas_user_win_ops *vops)
>  {
>  	int rc =3D -EINVAL;
>  	dev_t devno;
> @@ -230,6 +243,7 @@ int vas_register_api_powernv(struct module *mod, enum=
 vas_cop_type cop_type,
>  	}
>  	coproc_device.class->devnode =3D coproc_devnode;
>  	coproc_device.cop_type =3D cop_type;
> +	coproc_device.vops =3D vops;
> =20
>  	coproc_fops.owner =3D mod;
>  	cdev_init(&coproc_device.cdev, &coproc_fops);
> @@ -262,9 +276,8 @@ int vas_register_api_powernv(struct module *mod, enum=
 vas_cop_type cop_type,
>  	unregister_chrdev_region(coproc_device.devt, 1);
>  	return rc;
>  }
> -EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> =20
> -void vas_unregister_api_powernv(void)
> +void vas_unregister_coproc_api(void)
>  {
>  	dev_t devno;
> =20
> @@ -275,4 +288,3 @@ void vas_unregister_api_powernv(void)
>  	class_destroy(coproc_device.class);
>  	unregister_chrdev_region(coproc_device.devt, 1);
>  }
> -EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platfo=
rms/powernv/Kconfig
> index 619b093a0657..043eefbbdd28 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -33,20 +33,6 @@ config PPC_MEMTRACE
>  	  Enabling this option allows for runtime allocation of memory (RAM)
>  	  for hardware tracing.
> =20
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
>  config SCOM_DEBUGFS
>  	bool "Expose SCOM controllers via debugfs"
>  	depends on DEBUG_FS
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platf=
orms/powernv/Makefile
> index 2eb6ae150d1f..c747a1f1d25b 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+=3D opal-memory-errors.o
>  obj-$(CONFIG_OPAL_PRD)	+=3D opal-prd.o
>  obj-$(CONFIG_PERF_EVENTS) +=3D opal-imc.o
>  obj-$(CONFIG_PPC_MEMTRACE)	+=3D memtrace.o
> -obj-$(CONFIG_PPC_VAS)	+=3D vas.o vas-window.o vas-debug.o vas-fault.o va=
s-api.o
> +obj-$(CONFIG_PPC_VAS)	+=3D vas.o vas-window.o vas-debug.o vas-fault.o
>  obj-$(CONFIG_OCXL_BASE)	+=3D ocxl.o
>  obj-$(CONFIG_SCOM_DEBUGFS) +=3D opal-xscom.o
>  obj-$(CONFIG_PPC_SECURE_BOOT) +=3D opal-secvar.o
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 5f5fe63a3d1c..b973dd574b47 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -16,6 +16,8 @@
>  #include <linux/mmu_context.h>
>  #include <asm/switch_to.h>
>  #include <asm/ppc-opcode.h>
> +#include <asm/vas.h>
> +#include <uapi/asm/vas-api.h>
>  #include "vas.h"
>  #include "copy-paste.h"
> =20
> @@ -1441,3 +1443,67 @@ struct vas_window *vas_pswid_to_window(struct vas_=
instance *vinst,
> =20
>  	return window;
>  }
> +
> +static struct vas_window *vas_user_win_open(struct vas_tx_win_open_attr =
*uattr,
> +				enum vas_cop_type cop_type)
> +{
> +	struct vas_tx_win_attr txattr =3D {};
> +
> +	vas_init_tx_win_attr(&txattr, cop_type);
> +
> +	txattr.lpid =3D mfspr(SPRN_LPID);
> +	txattr.pidr =3D mfspr(SPRN_PID);
> +	txattr.user_win =3D true;
> +	txattr.rsvd_txbuf_count =3D false;
> +	txattr.pswid =3D false;
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
> +	struct vas_window *txwin =3D addr;
> +
> +	vas_win_close(txwin);
> +
> +	return 0;
> +}
> +
> +static struct vas_user_win_ops vops =3D  {
> +	.open_win	=3D	vas_user_win_open,
> +	.paste_addr	=3D	vas_user_win_paste_addr,
> +	.close_win	=3D	vas_user_win_close,
> +};
> +
> +/*
> + * Supporting only nx-gzip coprocessor type now, but this API code
> + * extended to other coprocessor types later.
> + */
> +int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
> +				const char *name)
> +{
> +	int rc;
> +
> +	rc =3D vas_register_coproc_api(mod, cop_type, name, &vops);
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
> --=20
> 2.18.2
>=20
>=20
>=20
