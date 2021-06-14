Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C23A5B8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3FfN6r8Dz308h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uYPIlW0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uYPIlW0z; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Fds3jvwz2ymM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:24:48 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id v12so5744939plo.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/0faS4n6ID+aLmn9NUyqz8ZBZ6+Cykd7weYraVWvCUU=;
 b=uYPIlW0zTczyDrO2jImbin6kYQU6S2kzKZ4/2Xuy6+KGlKB7vWwp+mPs3BkoRo5qP+
 KVpUpO4m73B4XnkSrg0XhtELFUqwE3UKhEHzDgTKfOGftDhp00giQ8YCGCgA3HzBHC/F
 L0EQWnLyVQu+MAcEFBwF9i8tQDB7XeC9GAaKncgZby3962W8F+4JMtbG/94O6u9eK3lA
 7t1l8Li/IhEZr+TT6oBO5fqpVE7MMW0QQILjDGzDaiGONMLjzbF2bNOY8+v/3ozIKboH
 y+hiY3s3X/EsXXt3C2Q2DykUUk0EMbY4Pe51RL35mjh+MDyo7WEri1ebuFYD7nuC7pLZ
 e6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/0faS4n6ID+aLmn9NUyqz8ZBZ6+Cykd7weYraVWvCUU=;
 b=XcOeZrzI0pDxUKmGdXANF6SyEUdgaxjoiw2AP0t9DE0mBAGrKLT99ef46P8rc+y/K0
 dyYNEYhcRiJvdVnlj93JcOnKBwlnVEDuOboogRDHOf18NBDuEpLP9FaFBXfPMO83PgBJ
 qQD3O0stRli6tuq6hz3C1vbtOHI1t9wuvdd3C8HVskdD6m7CejYyYKvUTmTVy55TweZW
 YV6QN9ESPrXQnHqcUPcORg3yrvBXIJHxVgHtQLXV5LC5stvVS0GHN8mSZKvq0SOqmhlS
 QQFhgEaSSVFdHlaciCrTd41ugLbePUoJjGCi2HOSh3/yQkctEE3+YwQ4jOUwESAN4m14
 uN9A==
X-Gm-Message-State: AOAM532S9/q4Iz3UrcCmsBX2vA7a6iVDwQ7R9zfE2YD9etHliZxnjsCU
 YJ/NRfkEa1/Sm042pfGNBds=
X-Google-Smtp-Source: ABdhPJyIZo7Tgodkpi1o5B47flMrhV1fPsd71/FVhn7azXXl5YN2SB2SGfG78p0sDuk66NG+1uqAUA==
X-Received: by 2002:a17:902:a412:b029:11a:a197:e848 with SMTP id
 p18-20020a170902a412b029011aa197e848mr5766899plq.52.1623637484876; 
 Sun, 13 Jun 2021 19:24:44 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n14sm10417653pfa.138.2021.06.13.19.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:24:44 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:24:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 04/17] powerpc/vas: Add platform specific user window
 operations
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <c64fda6e9b684c175cedb3ec448cce7aaf0f4615.camel@linux.ibm.com>
In-Reply-To: <c64fda6e9b684c175cedb3ec448cce7aaf0f4615.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623636838.8tsdy9nisc.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 8:57 pm:
>=20
> PowerNV uses registers to open/close VAS windows, and getting the
> paste address. Whereas the hypervisor calls are used on PowerVM.
>=20
> This patch adds the platform specific user space window operations
> and register with the common VAS user space interface.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h              | 14 +++++-
>  arch/powerpc/platforms/book3s/vas-api.c     | 53 +++++++++++++--------
>  arch/powerpc/platforms/powernv/vas-window.c | 45 ++++++++++++++++-
>  3 files changed, 89 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index bab7891d43f5..85318d7446c7 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,7 @@
> =20
>  #ifndef _ASM_POWERPC_VAS_H
>  #define _ASM_POWERPC_VAS_H
> +#include <uapi/asm/vas-api.h>
> =20
>  struct vas_window;
> =20
> @@ -48,6 +49,16 @@ enum vas_cop_type {
>  	VAS_COP_TYPE_MAX,
>  };
> =20
> +/*
> + * User space window operations used for powernv and powerVM
> + */
> +struct vas_user_win_ops {
> +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> +				enum vas_cop_type);
> +	u64 (*paste_addr)(struct vas_window *);
> +	int (*close_win)(struct vas_window *);
> +};

This looks better, but rather than pull in uapi and the user API=20
structure here, could you just pass in vas_id and flags after the common=20
code does the user copy and verifies the version and other details?

I think it's generally good practice to limit the data that the usre
can influence as much as possible. Sorry for not picking up on that
earlier.

If that's changed, then

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> +
>  /*
>   * Receive window attributes specified by the (in-kernel) owner of windo=
w.
>   */
> @@ -175,7 +186,8 @@ void vas_unregister_api_powernv(void);
>   * used for others in future.
>   */
>  int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> -				const char *name);
> +			    const char *name,
> +			    const struct vas_user_win_ops *vops);
>  void vas_unregister_coproc_api(void);
> =20
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 72c126d87216..7cfc4b435ae8 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -42,6 +42,7 @@ static struct coproc_dev {
>  	dev_t devt;
>  	struct class *class;
>  	enum vas_cop_type cop_type;
> +	const struct vas_user_win_ops *vops;
>  } coproc_device;
> =20
>  struct coproc_instance {
> @@ -72,11 +73,10 @@ static int coproc_open(struct inode *inode, struct fi=
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
> @@ -93,27 +93,20 @@ static int coproc_ioc_tx_win_open(struct file *fp, un=
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
> +						cp_inst->coproc->cop_type);
>  	if (IS_ERR(txwin)) {
> -		pr_err("%s() vas_tx_win_open() failed, %ld\n", __func__,
> -					PTR_ERR(txwin));
> +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> +				PTR_ERR(txwin));
>  		return PTR_ERR(txwin);
>  	}
> =20
> @@ -125,9 +118,15 @@ static int coproc_ioc_tx_win_open(struct file *fp, u=
nsigned long arg)
>  static int coproc_release(struct inode *inode, struct file *fp)
>  {
>  	struct coproc_instance *cp_inst =3D fp->private_data;
> +	int rc;
> =20
>  	if (cp_inst->txwin) {
> -		vas_win_close(cp_inst->txwin);
> +		if (cp_inst->coproc->vops &&
> +			cp_inst->coproc->vops->close_win) {
> +			rc =3D cp_inst->coproc->vops->close_win(cp_inst->txwin);
> +			if (rc)
> +				return rc;
> +		}
>  		cp_inst->txwin =3D NULL;
>  	}
> =20
> @@ -168,7 +167,17 @@ static int coproc_mmap(struct file *fp, struct vm_ar=
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
> @@ -208,7 +217,8 @@ static struct file_operations coproc_fops =3D {
>   * extended to other coprocessor types later.
>   */
>  int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> -				const char *name)
> +			    const char *name,
> +			    const struct vas_user_win_ops *vops)
>  {
>  	int rc =3D -EINVAL;
>  	dev_t devno;
> @@ -230,6 +240,7 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  	}
>  	coproc_device.class->devnode =3D coproc_devnode;
>  	coproc_device.cop_type =3D cop_type;
> +	coproc_device.vops =3D vops;
> =20
>  	coproc_fops.owner =3D mod;
>  	cdev_init(&coproc_device.cdev, &coproc_fops);
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 41712b4b268e..5162e95c4090 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -16,6 +16,7 @@
>  #include <linux/mmu_context.h>
>  #include <asm/switch_to.h>
>  #include <asm/ppc-opcode.h>
> +#include <asm/vas.h>
>  #include "vas.h"
>  #include "copy-paste.h"
> =20
> @@ -1443,6 +1444,48 @@ struct vas_window *vas_pswid_to_window(struct vas_=
instance *vinst,
>  	return window;
>  }
> =20
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
> +static u64 vas_user_win_paste_addr(struct vas_window *win)
> +{
> +	u64 paste_addr;
> +
> +	vas_win_paste_addr(win, &paste_addr, NULL);
> +
> +	return paste_addr;
> +}
> +
> +static int vas_user_win_close(struct vas_window *txwin)
> +{
> +
> +	vas_win_close(txwin);
> +
> +	return 0;
> +}
> +
> +static const struct vas_user_win_ops vops =3D  {
> +	.open_win	=3D	vas_user_win_open,
> +	.paste_addr	=3D	vas_user_win_paste_addr,
> +	.close_win	=3D	vas_user_win_close,
> +};
> +
>  /*
>   * Supporting only nx-gzip coprocessor type now, but this API code
>   * extended to other coprocessor types later.
> @@ -1451,7 +1494,7 @@ int vas_register_api_powernv(struct module *mod, en=
um vas_cop_type cop_type,
>  			     const char *name)
>  {
> =20
> -	return vas_register_coproc_api(mod, cop_type, name);
> +	return vas_register_coproc_api(mod, cop_type, name, &vops);
>  }
>  EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> =20
> --=20
> 2.18.2
>=20
>=20
>=20
