Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0284B4067
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxqgz1vrRz3cPX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:38:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oBtEf6nV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oBtEf6nV; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxqgK0611z2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:38:04 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso8631546pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5I8nC1X6jlhl2PasPSucXZyAaPq1qEgjo1yMayCcYyI=;
 b=oBtEf6nVM62VcIYbC3iTtwNIFEv1cM92QUa2CT3M2o9f7xDf5e7hLSvBEkPWO8aVNW
 uj0mrxjwie9Z07FkZ9KNLGpoKhth+3eSc1kDRzowh4vf+xS8rHzxoOlEhr/g58asvXHL
 QbGd1Nv9n2MMOwfzEWrPEwlqjFIVjvb9J2+cUKg7NCa249/D+WiiiBYGZ2X93bxx7291
 l5xXIKVB/Cd7EPrX0yl55o4DBU2rmehDMalvAFJfVFUIiHYtT6Fk3sw0ElIQhZWZTolj
 dp0a+ckbJ3fv15SnU6LmHJleVxcU0C1wuXVr5g+Fku5hxrX+ztr0RHBEaMgp/RKwxSOm
 KhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5I8nC1X6jlhl2PasPSucXZyAaPq1qEgjo1yMayCcYyI=;
 b=g/oEf/lN9pwwPnIllGkPAFsjmD9X6fcE6mAsesslhkk4bsHJ7LoEVhEltEXQ3GabKx
 v9VAPEtJLeVtpSJEN7hscrauzzJ1RGkL/fV3EX9UI9gbrOL30uU75pvMcP7Zki7nCCgu
 dmDJTMM6PTWpfYsSuhLY8uW07pD3cTgnOJP7U6d7rVn3aQ3KQyaucof/3rVkTKLwRIlV
 n3PcN0y/2Eo9WYc0C7gWzz5rH3sM7zYKk/4zTXB64/GUgdOk4QZq5zbDaEkqF8Mrbb0P
 nauHJdQqwS7F0Til14uZQvLEOT25Njzhzn0DfSHgzh+HL0Gfv2UTWK3MfJnKl333E1zT
 mMcg==
X-Gm-Message-State: AOAM532a0DJb1EFWFDMc/Uc1TxWf7+yU/CmATV8Ky7VlpHSAl57zzGIE
 zOlaxBoDK1jBZEq6Zc6KLRc=
X-Google-Smtp-Source: ABdhPJzI102OGHdFya841dqRx0EfT/EgKiZO8+HxUOeR1I/NLDr2k2IQgLXtKchLZ0owt1UnwDgzlg==
X-Received: by 2002:a17:90a:d343:: with SMTP id
 i3mr12625987pjx.104.1644809881604; 
 Sun, 13 Feb 2022 19:38:01 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id mw8sm1856462pjb.8.2022.02.13.19.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:38:01 -0800 (PST)
Date: Mon, 14 Feb 2022 13:37:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 07/10] powerpc/vas: Add paste address mmap fault handler
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <d87bbb6c81e7b6c3d3b2d45f0549f27183172562.camel@linux.ibm.com>
In-Reply-To: <d87bbb6c81e7b6c3d3b2d45f0549f27183172562.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644808853.k17l68pv15.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:59 am:
>=20
> The user space opens VAS windows and issues NX requests by pasting
> CRB on the corresponding paste address mmap. When the system looses

s/loose/lose/g throughout the series.

> credits due to core removal, the kernel has to close the window in
> the hypervisor

By the way what if the kernel does not close the window and we try
to access the memory? The hypervisor will inject faults?

> and make the window inactive by unmapping this paste
> address. Also the OS has to handle NX request page faults if the user
> space issue NX requests.
>=20
> This handler remap the new paste address with the same VMA when the
> window is active again (due to core add with DLPAR). Otherwise
> returns paste failure.

This patch should come before (or combined with) the patch that zaps=20
PTEs. Putting it afterwards is logically backward. Even if you don't
really expect the series to half work in a half bisected state, it
just makes the changes easier to follow.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 60 +++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 2d06bd1b1935..5ceba75c13eb 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -351,6 +351,65 @@ static int coproc_release(struct inode *inode, struc=
t file *fp)
>  	return 0;
>  }
> =20
> +/*
> + * This fault handler is invoked when the VAS/NX generates page fault on
> + * the paste address.

The core generates the page fault here, right? paste destination is=20
translated by the core MMU (the instruction is executed in the core,
afterall).

> Happens if the kernel closes window in hypervisor
> + * (on PowerVM) due to lost credit or the paste address is not mapped.

Call it pseries everywhere if you're talking about the API and Linux
code, rather than some specific quirk or issue of of the PowerVM
implementation.

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
> +		pr_err("%s(): No send window open?\n", __func__);

Probably don't put PR_ERROR logs with question marks in them. The
administrator knows less than you to answer the question.

"Unexpected fault on paste address with TX window closed" etc.

Then you don't need the comment either because the message explains it.

> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	txwin =3D cp_inst->txwin;
> +	/*
> +	 * Fault is coming due to missing from the original mmap.

Rather than a vague comment like this (which we already know a fault=20
comes from a missing or insufficient PTE), you could point to exactly
the code which zaps the PTEs.

> +	 * Can happen only when the window is closed due to lost
> +	 * credit before mmap() or the user space issued NX request
> +	 * without mapping.
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
> +	 * removal with DLPAR). When the window is active again when
> +	 * the credit is available, remap with the new paste address.

Remap also typically means mapping the same physical memory at a=20
different virtual address. So when you say remap with the new paste
address, in Linux mm terms that means you're mapping the same window
at a different virtual address.

But you're faulting a different physical address into the same
virtual.

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

Here a comment about how userspace is supposed to handle the
window-closed condition might be appropriate.

Thanks,
Nick

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
> @@ -417,6 +476,7 @@ static int coproc_mmap(struct file *fp, struct vm_are=
a_struct *vma)
>  			paste_addr, vma->vm_start, rc);
> =20
>  	txwin->task_ref.vma =3D vma;
> +	vma->vm_ops =3D &vas_vm_ops;
> =20
>  out:
>  	mutex_unlock(&txwin->task_ref.mmap_mutex);
> --=20
> 2.27.0
>=20
>=20
>=20
