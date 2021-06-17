Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5123ABF98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5dhf5hBCz3cD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:35:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ILf8K75O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ILf8K75O; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5dhC5NBRz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:35:06 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id t13so6221365pgu.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=klKzIsZunyfSFvK0Q3oWxRgLGpdW2dre0gGgoWo8aag=;
 b=ILf8K75OeJkrt3VCRlrd5S+hY6U3KQLY9j8sEbfcIxuMa2au+D5UE0u/C29LD+CrpC
 Fo6ul5nyyabKRD9F0ZisUFhhM6BhdGHiLHLcGQ9o3TzSnzDGy4ZYPaeqq4jCR9Q07qqW
 4U6mk4d41L7gevmFc0nZcE2m1Tjp8HxC9sul4WMFJZSJeDnQZ7UYWtBGllcn1NCQ0nWz
 qECDbmd7n23ToUrZaizdlZPOwusicblVALptwGIaInW5YWwrR6TL9z8IJJP1hvRpRW13
 st5AiYymZt4//KcdW7Ewzu1TpJCtQ+anNIu3LqTmQJp/OJP8O+hyJQKaicL4hdG0N4Na
 EJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=klKzIsZunyfSFvK0Q3oWxRgLGpdW2dre0gGgoWo8aag=;
 b=jO1E/8/zec4PQJZIci5mF6pPlHh97KYaBcG47ZPZRm9kowEXwDFAFEUylx7uMSWV6R
 A0++ol8pZMfxwjS53XGPiQP1suCBBSPdVfYh+DnOt4RyDfvggHulchoihDvGl/yerxqv
 chzvk1BQ2jN5mZhELiPj7ccv5zOAcuk7b1/9RREywCCxyFRkaJ71Z+kXHHKW9SOFvvMb
 ltRU12ymwuyY/kjWstgokDJx8tIOjEeFfUPCYwQjEsK72lB9RZZL4JFZoMVYZddbt8Zq
 a+6Yk11oB3uzbaN7U9wB9yIY3yzpVQ6ZDvFMbVFVTpmU6bpvpr4QsfCRqOqKJds+3qBG
 h9xA==
X-Gm-Message-State: AOAM531FSyEfMIm97uTlvSRcvyX8L4BQWeeFkjB9BIZlX/Zczs4/lB1l
 fmEW4klQ7WVOp4Z/G2V2NIw=
X-Google-Smtp-Source: ABdhPJwMUH5JT/9BzwKOTv8MZUWS0lw4Jp0+2NN1botOkP0uQehXbemE6D+Rwo7/kynA02C0YJMgIQ==
X-Received: by 2002:a65:6256:: with SMTP id q22mr7171179pgv.391.1623972904141; 
 Thu, 17 Jun 2021 16:35:04 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id f15sm6518262pgg.23.2021.06.17.16.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:35:03 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:34:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 13/17] powerpc/pseries/vas: Setup IRQ and fault handling
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <b8fc66dcb783d06a099a303e5cfc69087bb3357a.camel@linux.ibm.com>
In-Reply-To: <b8fc66dcb783d06a099a303e5cfc69087bb3357a.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623972635.u8jj6g26re.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 6:37 am:
>=20
> NX generates an interrupt when sees a fault on the user space
> buffer and the hypervisor forwards that interrupt to OS. Then
> the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
> to retrieve the fault CRB information.
>=20
> This patch also adds changes to setup and free IRQ per each
> window and also handles the fault by updating the CSB.

In as much as this pretty well corresponds to the PowerNV code AFAIKS,
it looks okay to me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Could you have an irq handler in your ops vector and have=20
the core code set up the irq and call your handler, so the Linux irq
handling is in one place? Not something for this series, I was just
wondering.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 102 +++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index f5a44f2f0e99..3385b5400cc6 100644
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
> @@ -155,6 +156,50 @@ int h_query_vas_capabilities(const u64 hcall, u8 que=
ry_type, u64 result)
>  }
>  EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
> =20
> +/*
> + * hcall to get fault CRB from the hypervisor.
> + */
> +static int h_get_nx_fault(u32 winid, u64 buffer)
> +{
> +	long rc;
> +
> +	rc =3D plpar_hcall_norets(H_GET_NX_FAULT, winid, buffer);
> +
> +	if (rc =3D=3D H_SUCCESS)
> +		return 0;
> +
> +	pr_err("H_GET_NX_FAULT error: %ld, winid %u, buffer 0x%llx\n",
> +		rc, winid, buffer);
> +	return -EIO;
> +
> +}
> +
> +/*
> + * Handle the fault interrupt.
> + * When the fault interrupt is received for each window, query the
> + * hypervisor to get the fault CRB on the specific fault. Then
> + * process the CRB by updating CSB or send signal if the user space
> + * CSB is invalid.
> + * Note: The hypervisor forwards an interrupt for each fault request.
> + *	So one fault CRB to process for each H_GET_NX_FAULT hcall.
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
> @@ -166,10 +211,51 @@ static int allocate_setup_window(struct pseries_vas=
_window *txwin,
>  	rc =3D h_allocate_vas_window(txwin, domain, wintype, DEF_WIN_CREDS);
>  	if (rc)
>  		return rc;
> +	/*
> +	 * On PowerVM, the hypervisor setup and forwards the fault
> +	 * interrupt per window. So the IRQ setup and fault handling
> +	 * will be done for each open window separately.
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
> +	kfree(txwin->name);
> +	irq_dispose_mapping(txwin->fault_virq);
>  }
> =20
>  static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
> @@ -284,6 +370,11 @@ static struct vas_window *vas_allocate_window(int va=
s_id, u64 flags,
>  	return &txwin->vas_win;
> =20
>  out_free:
> +	/*
> +	 * Window is not operational. Free IRQ before closing
> +	 * window so that do not have to hold mutex.
> +	 */
> +	free_irq_setup(txwin);
>  	h_deallocate_vas_window(txwin->vas_win.winid);
>  out:
>  	atomic_dec(&cop_feat_caps->used_lpar_creds);
> @@ -303,7 +394,18 @@ static int deallocate_free_window(struct pseries_vas=
_window *win)
>  {
>  	int rc =3D 0;
> =20
> +	/*
> +	 * The hypervisor waits for all requests including faults
> +	 * are processed before closing the window - Means all
> +	 * credits have to be returned. In the case of fault
> +	 * request, a credit is returned after OS issues
> +	 * H_GET_NX_FAULT hcall.
> +	 * So free IRQ after executing H_DEALLOCATE_VAS_WINDOW
> +	 * hcall.
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
