Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10B4C0CF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Rq52MjXz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:04:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SFEe18GZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SFEe18GZ; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3RpS267Sz30NP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:03:44 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id x18so14479467pfh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gupKki8ZFXAdVURypM2M8owgaI7l79b9ZDR0Ot9XDYI=;
 b=SFEe18GZmI4nglBdXgOa7qIo30HqS8pHuAY/vKf4VEo7euEC7/NYCnhrxnib1irv57
 EronwtkkrWLP6g445uUnrSbhu000N3yEiXrRAu/J6lO20zUFWxqzC19G7aWu/eETEwUW
 uMjIuokSf62XpVPgIssY2n6SgNEJ5wDQ/Jw6yJAjllVZI2pMLivcPea7sZgSW6TW0o73
 J1jy5GljnF8YzWXZoZDQH1jGA8VLt62Zv3YHSKam8GOetIMFwd8XxTM/tR4Qcf1ZE47r
 qWAj1JSRpT/XXFfWlKlB0au5CKkF4ZILsGVRfZrkKt3w3EnzjxOM82mBbyvdWq3hHjPa
 oU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gupKki8ZFXAdVURypM2M8owgaI7l79b9ZDR0Ot9XDYI=;
 b=e/ekvDdtSF0IfvcYJtLjWDDEIE3l93Ps9/lKXVQilYeYxjKQGchoLmPUkXdRlFLLzQ
 Q2c4Io5uZaw9aZHrpX3P+IdyW2Wlm9hsT7Tx9Bw7n2qPGr62SqM0hDVEgYiyNUwpMGK1
 7I3fLWYS1aCA3Zm6gUHMbQWe/+vfiCpetps4STxc9BJ0shCvlYcsBA+i4OLRLmdjLq7o
 akzpFAR/4ULfS+WLOXbj418MCJoJUfosbDhAyxJ3OM5DCikC7h3zguN7+WRQFL0nZguD
 HROY+e/YrNJ3q/U8dohd56Qn1F90azQ6P2TxC+/SqLRG19dEY60M3tvMKu+axKjct8yb
 zKAA==
X-Gm-Message-State: AOAM531nh0lGi7ZX1BIW+8T2B0ZxpoitgDihKgGvPD36i72CjNhkgklv
 672ZJqmkul0dEeeVp/9nZ/4=
X-Google-Smtp-Source: ABdhPJyGdrsDgvM4PU62KtTBsD/Sb8HitH9OPtGY/9D2WuFdR77CvlQzDCmVj81OZQS2FgLeCE30hg==
X-Received: by 2002:a63:4918:0:b0:34d:e4e5:5b47 with SMTP id
 w24-20020a634918000000b0034de4e55b47mr23052188pga.422.1645599821738; 
 Tue, 22 Feb 2022 23:03:41 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id bd14sm8944029pfb.165.2022.02.22.23.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:03:41 -0800 (PST)
Date: Wed, 23 Feb 2022 17:03:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 3/9] powerpc/vas: Add paste address mmap fault handler
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <8356adc31f70935cb16a80a459b58f792eb48f80.camel@linux.ibm.com>
In-Reply-To: <8356adc31f70935cb16a80a459b58f792eb48f80.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645599802.tiaaw8nvca.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 5:55 am:
>=20
> The user space opens VAS windows and issues NX requests by pasting
> CRB on the corresponding paste address mmap. When the system lost
> credits due to core removal, the kernel has to close the window in
> the hypervisor and make the window inactive by unmapping this paste
> address. Also the OS has to handle NX request page faults if the user
> space issue NX requests.
>=20
> This handler maps the new paste address with the same VMA when the
> window is active again (due to core add with DLPAR). Otherwise
> returns paste failure.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h          | 10 ++++
>  arch/powerpc/platforms/book3s/vas-api.c | 68 +++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 57573d9c1e09..27251af18c65 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -29,6 +29,12 @@
>  #define VAS_THRESH_FIFO_GT_QTR_FULL	2
>  #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
> =20
> +/*
> + * VAS window Linux status bits
> + */
> +#define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
> +					/* vas mmap() */
> +
>  /*
>   * Get/Set bit fields
>   */
> @@ -59,6 +65,9 @@ struct vas_user_win_ref {
>  	struct pid *pid;	/* PID of owner */
>  	struct pid *tgid;	/* Thread group ID of owner */
>  	struct mm_struct *mm;	/* Linux process mm_struct */
> +	struct mutex mmap_mutex;	/* protects paste address mmap() */
> +					/* with DLPAR close/open windows */
> +	struct vm_area_struct *vma;	/* Save VMA and used in DLPAR ops */
>  };
> =20
>  /*
> @@ -67,6 +76,7 @@ struct vas_user_win_ref {
>  struct vas_window {
>  	u32 winid;
>  	u32 wcreds_max;	/* Window credits */
> +	u32 status;	/* Window status used in OS */
>  	enum vas_cop_type cop;
>  	struct vas_user_win_ref task_ref;
>  	char *dbgname;
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 4d82c92ddd52..f359e7b2bf90 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -316,6 +316,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, un=
signed long arg)
>  		return PTR_ERR(txwin);
>  	}
> =20
> +	mutex_init(&txwin->task_ref.mmap_mutex);
>  	cp_inst->txwin =3D txwin;
> =20
>  	return 0;
> @@ -350,6 +351,70 @@ static int coproc_release(struct inode *inode, struc=
t file *fp)
>  	return 0;
>  }
> =20
> +/*
> + * This fault handler is invoked when the core generates page fault on
> + * the paste address. Happens if the kernel closes window in hypervisor
> + * (on pseries) due to lost credit or the paste address is not mapped.
> + */
> +static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma =3D vmf->vma;
> +	struct file *fp =3D vma->vm_file;
> +	struct coproc_instance *cp_inst =3D fp->private_data;
> +	struct vas_window *txwin;
> +	u64 paste_addr;
> +	int ret;
> +
> +	/*
> +	 * window is not opened. Shouldn't expect this error.
> +	 */
> +	if (!cp_inst || !cp_inst->txwin) {
> +		pr_err("%s(): Unexpected fault on paste address with TX window closed\=
n",
> +				__func__);
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	txwin =3D cp_inst->txwin;
> +	/*
> +	 * When the LPAR lost credits due to core removal or during
> +	 * migration, invalidate the existing mapping for the current
> +	 * paste addresses and set windows in-active (zap_page_range in
> +	 * reconfig_close_windows()).
> +	 * New mapping will be done later after migration or new credits
> +	 * available. So continue to receive faults if the user space
> +	 * issue NX request.
> +	 */
> +	if (txwin->task_ref.vma !=3D vmf->vma) {
> +		pr_err("%s(): No previous mapping with paste address\n",
> +			__func__);
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	mutex_lock(&txwin->task_ref.mmap_mutex);
> +	/*
> +	 * The window may be inactive due to lost credit (Ex: core
> +	 * removal with DLPAR). If the window is active again when
> +	 * the credit is available, map the new paste address at the
> +	 * the window virtual address.
> +	 */
> +	if (txwin->status =3D=3D VAS_WIN_ACTIVE) {
> +		paste_addr =3D cp_inst->coproc->vops->paste_addr(txwin);
> +		if (paste_addr) {
> +			ret =3D vmf_insert_pfn(vma, vma->vm_start,
> +					(paste_addr >> PAGE_SHIFT));
> +			mutex_unlock(&txwin->task_ref.mmap_mutex);
> +			return ret;
> +		}
> +	}
> +	mutex_unlock(&txwin->task_ref.mmap_mutex);
> +
> +	return VM_FAULT_SIGBUS;
> +
> +}
> +static const struct vm_operations_struct vas_vm_ops =3D {
> +	.fault =3D vas_mmap_fault,
> +};
> +
>  static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
>  {
>  	struct coproc_instance *cp_inst =3D fp->private_data;
> @@ -398,6 +463,9 @@ static int coproc_mmap(struct file *fp, struct vm_are=
a_struct *vma)
>  	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
>  			paste_addr, vma->vm_start, rc);
> =20
> +	txwin->task_ref.vma =3D vma;
> +	vma->vm_ops =3D &vas_vm_ops;
> +
>  	return rc;
>  }
> =20
> --=20
> 2.27.0
>=20
>=20
>=20
