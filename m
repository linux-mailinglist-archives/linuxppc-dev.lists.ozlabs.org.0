Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FC399A46
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 07:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwZhH66y0z309v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 15:48:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UnvI1Q09;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UnvI1Q09; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwZgp2PVBz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 15:48:20 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 mq2-20020a17090b3802b0290162428291f5so3175575pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 22:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=hOp7TXbbzxwcDVaO5twCPbrsbPsqYeAyZBDbH4F+cUA=;
 b=UnvI1Q09TdXGZbuK8RLfB53qwo3E6WQdOZYKJ0M0HHXBJrkw2enL4HzQiDXnaXgrxt
 BK1VRaWLxaqMKhbGEhv2W3NPNYrZ0V9Q8NZLPCVPjMEXmfss3DfTaKvF+877FhS7La5A
 TsH4IUayaV0v8kupwrxq6nBuollykW1j9xZti5DWjvEF7/x2du39gjmMuG9KmeIXE7q6
 jHdVGmMkN9J/qKX3w+JhMl8nzrgoTb2ZrRreil07t4Y7YMwkkEypn4/K4PigNsEIBi+Z
 Xaa5HosqA+x+C35bv9o7AExDQBRED0ubIA6hu+WBLcYySMXIJnocHjtz9f9ROUDeykmB
 AT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hOp7TXbbzxwcDVaO5twCPbrsbPsqYeAyZBDbH4F+cUA=;
 b=icAdEDnlO1jXeZWWlU2XwSRJc0OekrRWF9PGVN24cPNc/uxDJc7kd/gaXJTqpCIu4s
 0qSu1y2+bYfcGuCC+ERkKC8U9VZtvnq2lP/Ps3/Pv9PL9gBP1NGo6/XHupXhMFW1/Kmq
 KOwaGzoFIiavcuKGqbdawQLNF1V688fIjWEp03PAJVxCCyN5A8NEDxdsBHrsXw+p7+cy
 Duj7M+/iDYxgPLLfqEXgfy7zVcDWhb/wn3QdwAaVPIE7K5wVjSw29lkJNlnvqOUjr0BM
 ZnXdl7dWvXvW4FkIiE4bCU+o60bQ1o2FxlgiDbRZ09/mxcc/6o6xWlsjVExVsRmna2kB
 CD9A==
X-Gm-Message-State: AOAM532SwOcTD+/NQKQxHfbxd7ZK4PA/0ofPugGkSmNvTVXWen/lqjNS
 97eGh3jfC2afYrGJL5ibuQM=
X-Google-Smtp-Source: ABdhPJxRYrVxjLMNjIKO3w0ToqQU4v73cKYA8u7ElSTEmcbcbhY25FsehBLB31QlqhRtw+9k/QCCuw==
X-Received: by 2002:a17:902:8695:b029:fd:6105:c936 with SMTP id
 g21-20020a1709028695b02900fd6105c936mr34402638plo.25.1622699296444; 
 Wed, 02 Jun 2021 22:48:16 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h12sm1429148pgn.54.2021.06.02.22.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 22:48:15 -0700 (PDT)
Date: Thu, 03 Jun 2021 15:48:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 12/16] powerpc/pseries/vas: Setup IRQ and fault handling
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <5ac32e4d07bd048e3d687354501d36c334f1c8e0.camel@linux.ibm.com>
In-Reply-To: <5ac32e4d07bd048e3d687354501d36c334f1c8e0.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622697882.lu1gj10oe8.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:39 pm:
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
>  arch/powerpc/platforms/pseries/vas.c | 111 +++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index ef0c455f6e93..31dc17573f50 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -224,6 +224,62 @@ int plpar_vas_query_capabilities(const u64 hcall, u8=
 query_type,
>  }
>  EXPORT_SYMBOL_GPL(plpar_vas_query_capabilities);
> =20
> +/*
> + * HCALL to get fault CRB from pHyp.
> + */
> +static int plpar_get_nx_fault(u32 winid, u64 buffer)
> +{
> +	int64_t rc;
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
> +	case H_STATE:
> +		pr_err("HCALL(%x): No outstanding faults for window ID %u\n",
> +		       H_GET_NX_FAULT, winid);
> +		return -EINVAL;
> +	case H_PRIVILEGE:
> +		pr_err("HCALL(%x): Window(%u): Invalid fault buffer 0x%llx\n",
> +		       H_GET_NX_FAULT, winid, buffer);
> +		return -EACCES;
> +	default:
> +		pr_err("HCALL(%x): Unexpected error %lld for window(%u)\n",
> +		       H_GET_NX_FAULT, rc, winid);
> +		return -EIO;
> +	}
> +}

Out of curiosity, you get one of these errors and it just drops the
interrupt on the floor. Then what happens, I assume everything
stops. Should it put some error in the csb, or signal the process or
something? Or is there nothing very sane that can be done?

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
> +	struct vas_window *txwin =3D data;
> +	struct coprocessor_request_block crb;
> +	struct vas_user_win_ref *tsk_ref;
> +	int rc;
> +
> +	rc =3D plpar_get_nx_fault(txwin->winid, (u64)virt_to_phys(&crb));
> +	if (!rc) {
> +		tsk_ref =3D &txwin->task_ref;
> +		vas_dump_crb(&crb);

This (and existing powernv vas code) is printk()ing a lot of lines per=20
fault. This should be pretty normal operation I think? It should avoid
filling the kernel logs, if so. Particularly if it can be triggered by=20
userspace.

I know it's existing code, so could be fixed separately from the series.


> +		vas_update_csb(&crb, tsk_ref);

> +	}

> +
> +	return IRQ_HANDLED;
> +}
> +
