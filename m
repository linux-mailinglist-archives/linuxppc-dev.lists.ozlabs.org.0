Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DB3A5BC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 05:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3GbD1Nmhz306M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 13:07:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RPj+Cc42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RPj+Cc42; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3GZm3Rf0z2xv9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 13:07:11 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso9680317pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=1ig0W5ErAmOX/nmik0SSTBz50rf6qjyisJmWjs87mr4=;
 b=RPj+Cc4260mrIswCyREICxJNDiNJzw9egOiy5SgcwYDIBJ8jSFmoC4Sy3nlxAP0fg2
 YcIe4K5P+9ZiqB8Rd3CYTkLa1u/sRv6jupGKSdskDjuv3RTiRbL1+/Y+e1KYDN7OrXUU
 DOQ1XcvKj7thME8ESlzw1VCuBnn+CK6VHcn4gaf7pADIdqNYLRUqez+Qpz4ob9IgSehz
 ZA8UQurA8yqTN0+lCVGAtOGhlucpTiD8dAvyjayUET6dlHPtuTRuNr6lN5G1zxh88WwP
 D/6REdZ/mMWNupPhHI6HVZuhm7ZpFB3elrCHT2ugH1hVZ4Lo0S5Y3WX0hwFNtDz1jIQz
 Jz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1ig0W5ErAmOX/nmik0SSTBz50rf6qjyisJmWjs87mr4=;
 b=sH3d3K58TLYmCIXks1uzQ3l3psRftWNjsO76C+zS0IgENS77Deb7qhGVMBeItJTWva
 R+p2k5by1+RBSqxaYm2u8ZthCwE2jNN2zSaBREZaAhkrm4tu9BOjZcEkaxoFhiv5hB0e
 CmWRUuZbNYiCn24n1/2n57402REQzXeEs8Bu3JWKmkdRhLB4gzu5CoigjHi/hi75YGpJ
 DUS8d9Yk5mPTuWOhVOwI+jiQ1eET8cgZIiQnpZEGcuxkXJPzPJnUrJLafUMecGFX2G41
 NF4jWafYZtohcVjPi0O0cPfx+vqny2zcIdcEVw2UGr8G0QrAFNHokg6lZc+lvjfJ+H9Q
 85lA==
X-Gm-Message-State: AOAM533YKRus20T1hSZibu44H6nJmdNhZDT3JC92sH4NEkTpteiS2/kJ
 NUh4Ovsm+uf/TQIePfKEW5hkFGz4+aI=
X-Google-Smtp-Source: ABdhPJwQvYTeee5gvdUXA2TjuM1OPJRp2BySj3DuO1m46/kji/ZVzDcMdjEMprFENRDzk3I2ZtvyvA==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr21627526pjb.75.1623640027925; 
 Sun, 13 Jun 2021 20:07:07 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id m1sm10288872pgd.78.2021.06.13.20.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 20:07:07 -0700 (PDT)
Date: Mon, 14 Jun 2021 13:07:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 13/17] powerpc/pseries/vas: Setup IRQ and fault handling
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <8a9fe47a17d1f89cc43885d2ef8c2f09e4e90d7a.camel@linux.ibm.com>
In-Reply-To: <8a9fe47a17d1f89cc43885d2ef8c2f09e4e90d7a.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623639403.054wgu233i.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:02 pm:
>=20
> NX generates an interrupt when sees a fault on the user space
> buffer and the hypervisor forwards that interrupt to OS. Then
> the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
> to retrieve the fault CRB information.
>=20
> This patch also adds changes to setup and free IRQ per each
> window and also handles the fault by updating the CSB.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 108 +++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index fe375f7a7029..55185bdd3776 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -11,6 +11,7 @@
>  #include <linux/types.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> +#include <linux/interrupt.h>
>  #include <asm/machdep.h>
>  #include <asm/hvcall.h>
>  #include <asm/plpar_wrappers.h>
> @@ -190,6 +191,58 @@ int h_query_vas_capabilities(const u64 hcall, u8 que=
ry_type, u64 result)
>  }
>  EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
> =20
> +/*
> + * hcall to get fault CRB from pHyp.
> + */
> +static int h_get_nx_fault(u32 winid, u64 buffer)
> +{
> +	long rc;
> +
> +	rc =3D plpar_hcall_norets(H_GET_NX_FAULT, winid, buffer);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		return 0;
> +	case H_PARAMETER:
> +		pr_err("HCALL(%x): Invalid window ID %u\n", H_GET_NX_FAULT,
> +		       winid);
> +		return -EINVAL;
> +	case H_PRIVILEGE:
> +		pr_err("HCALL(%x): Window(%u): Invalid fault buffer 0x%llx\n",
> +		       H_GET_NX_FAULT, winid, buffer);
> +		return -EACCES;
> +	default:
> +		pr_err("HCALL(%x): Failed with error %ld for window(%u)\n",
> +		       H_GET_NX_FAULT, rc, winid);
> +		return -EIO;

3 error messages have 3 different formats for window ID.

I agree with Michael you could just have one error message that reports=20
the return value. Also "H_GET_NX_FAULT: " would be nicer than "HCALL(380): =
"

Check how some other hcall failures are reported, "hcall failed:=20
H_CALL_NAME" seems to have a few takers.

> +	}
> +}
> +
> +/*
> + * Handle the fault interrupt.
> + * When the fault interrupt is received for each window, query pHyp to g=
et
> + * the fault CRB on the specific fault. Then process the CRB by updating
> + * CSB or send signal if the user space CSB is invalid.
> + * Note: pHyp forwards an interrupt for each fault request. So one fault
> + *	CRB to process for each H_GET_NX_FAULT HCALL.
> + */
> +irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
> +{
> +	struct pseries_vas_window *txwin =3D data;
> +	struct coprocessor_request_block crb;
> +	struct vas_user_win_ref *tsk_ref;
> +	int rc;
> +
> +	rc =3D h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
> +	if (!rc) {
> +		tsk_ref =3D &txwin->vas_win.task_ref;
> +		vas_dump_crb(&crb);
> +		vas_update_csb(&crb, tsk_ref);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  /*
>   * Allocate window and setup IRQ mapping.
>   */
> @@ -201,10 +254,51 @@ static int allocate_setup_window(struct pseries_vas=
_window *txwin,
>  	rc =3D h_allocate_vas_window(txwin, domain, wintype, DEF_WIN_CREDS);
>  	if (rc)
>  		return rc;
> +	/*
> +	 * On powerVM, pHyp setup and forwards the fault interrupt per

           The hypervisor forwards the fault interrupt per-window...

> +	 * window. So the IRQ setup and fault handling will be done for
> +	 * each open window separately.
> +	 */
> +	txwin->fault_virq =3D irq_create_mapping(NULL, txwin->fault_irq);
> +	if (!txwin->fault_virq) {
> +		pr_err("Failed irq mapping %d\n", txwin->fault_irq);
> +		rc =3D -EINVAL;
> +		goto out_win;
> +	}
> +
> +	txwin->name =3D kasprintf(GFP_KERNEL, "vas-win-%d",
> +				txwin->vas_win.winid);
> +	if (!txwin->name) {
> +		rc =3D -ENOMEM;
> +		goto out_irq;
> +	}
> +
> +	rc =3D request_threaded_irq(txwin->fault_virq, NULL,
> +				  pseries_vas_fault_thread_fn, IRQF_ONESHOT,
> +				  txwin->name, txwin);
> +	if (rc) {
> +		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with %d\n",
> +		       txwin->vas_win.winid, txwin->fault_virq, rc);
> +		goto out_free;
> +	}
> =20
>  	txwin->vas_win.wcreds_max =3D DEF_WIN_CREDS;
> =20
>  	return 0;
> +out_free:
> +	kfree(txwin->name);
> +out_irq:
> +	irq_dispose_mapping(txwin->fault_virq);
> +out_win:
> +	h_deallocate_vas_window(txwin->vas_win.winid);
> +	return rc;
> +}
> +
> +static inline void free_irq_setup(struct pseries_vas_window *txwin)
> +{
> +	free_irq(txwin->fault_virq, txwin);
> +	irq_dispose_mapping(txwin->fault_virq);
> +	kfree(txwin->name);

Nit, but this freeing is in a different order than the error handling in=20
the function does. I'd just keep it the same unless there is a reason to=20
be different, in which case it could use a comment.

So long as the irq can't somehow fire and try to use txwin->name, you=20
might be okay.

Otherwise I _think_ it's okay, but I don't know the irq APIs well.

Thanks,
Nick

>  }
> =20
>  static struct vas_window *vas_allocate_window(struct vas_tx_win_open_att=
r *uattr,
> @@ -320,6 +414,11 @@ static struct vas_window *vas_allocate_window(struct=
 vas_tx_win_open_attr *uattr
>  	return &txwin->vas_win;
> =20
>  out_free:
> +	/*
> +	 * Window is not operational. Free IRQ before closing
> +	 * window so that do not have to hold mutex.
> +	 */

Why don't you have to hold the mutex in that case?

> +	free_irq_setup(txwin);
>  	h_deallocate_vas_window(txwin->vas_win.winid);
>  out:
>  	atomic_dec(&ct_caps->used_lpar_creds);
> @@ -339,7 +438,16 @@ static int deallocate_free_window(struct pseries_vas=
_window *win)
>  {
>  	int rc =3D 0;
> =20
> +	/*
> +	 * Free IRQ after executing H_DEALLOCATE_VAS_WINDOW HCALL
> +	 * to close the window. pHyp waits for all requests including
> +	 * faults are processed before closing the window - Means all
> +	 * credits are returned. In the case of fault request, credit
> +	 * is returned after OS issues H_GET_NX_FAULT HCALL.
> +	 */
>  	rc =3D h_deallocate_vas_window(win->vas_win.winid);
> +	if (!rc)
> +		free_irq_setup(win);
> =20
>  	return rc;
>  }
> --=20
> 2.18.2
>=20
>=20
>=20
