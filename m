Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E377A49A7A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjXqM5TW1z3bZG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Nnsomh0n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Nnsomh0n; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjXpj2lGjz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 14:46:51 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id e9so17237600pgb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 19:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=hdfuq5orHfQ7Meh7Q+w/wb92K0T1OSmlneesQnOCGLw=;
 b=Nnsomh0nAkQP2afbcT4BDzbs69ufgf7PlcxZxx4g02klymZtXja/L+QpVUofugbEQp
 gBOx8DpCL79kV+sR5WzmbtV4epgUl7o8E50Kc4Di4dH+P4yG7P1CNZ9lw9SIWDeBk63l
 Qf5rioNCGCvGN+ZKwUWHoac3tWXkXQTc24//QpGwN0VDr9i6NG8TadMs5pl7XeG6z/z0
 8Iax/ASBBNqSQRKKvD12yOjQNnCPpUplRV8MaTnRSi2A0g67pmpOClOox42JBvu4zCR1
 zEZcoq0/V6Qodq8vm+OPf1Upy7vIiWae4lRm/8Q7nsxLzrhGG2+ZKgqPG81ZV7Fg12fO
 bpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hdfuq5orHfQ7Meh7Q+w/wb92K0T1OSmlneesQnOCGLw=;
 b=cl3EarqAFRN7ydk3TBINe3xi4t1USuQpeS/NJ4sh9CC+qoQTaD2WuhdbFcT2b4UI8G
 ThMWw2Huxv8o3vvWdE+22eoPBhzTfvTcijCDkP+e6ltUVbwlnHqnw+qeJfE5SYvmdh7S
 iPo7Wk6jUOkpet++w7NsWYp26vZuTWhKNkimL1NdASkPuXeInD/wdvU2o7eJU225z/gm
 g6Va7ry3qdcsRd2AUBbY86kAYsbzfoe2MNPEA2bHd/7xRPmz7yBFrtXcz6AUZe67Dsca
 XPVTDTLMnzr4iJp3Ed6ym2SRkpqZFfPO+O1h4DDLAdCVkVaiX/ok1cUL4ytLaoU95SpL
 rbPA==
X-Gm-Message-State: AOAM531/IJnG4sEhuyccH1/4dN61B3YovuJh69COsRMFb/1rCFxucbEZ
 5BhvQkmnCI4jDBSmztwKFhU=
X-Google-Smtp-Source: ABdhPJyD0Y0j9/n4jwFWWa7IXWOdQ4QXp4GO/c7YxFddK/jdTTiCgWbG57eXMt5zGOlBJLgyJSCV0g==
X-Received: by 2002:aa7:9217:0:b0:4bd:140:626c with SMTP id
 23-20020aa79217000000b004bd0140626cmr16173152pfo.7.1643082408401; 
 Mon, 24 Jan 2022 19:46:48 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id f10sm19003263pfe.29.2022.01.24.19.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 19:46:48 -0800 (PST)
Date: Tue, 25 Jan 2022 13:46:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: PPC: Decrement module refcount if init_vm
 fails
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220124220803.1011673-1-farosas@linux.ibm.com>
 <20220124220803.1011673-5-farosas@linux.ibm.com>
In-Reply-To: <20220124220803.1011673-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643082153.tb99kluqtm.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 25, 2022 8:08 am:
> We increment the reference count for KVM-HV/PR before the call to
> kvmppc_core_init_vm. If that function fails we need to decrement the
> refcount.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> Caught this while testing Nick's LPID patches by looking at
> /sys/module/kvm_hv/refcnt

Nice catch. Is this the only change in the series?

You can just use kvm_ops->owner like try_module_get() does I think? Also
try_module_get works on a NULL module same as module_put by the looks,
so you could adjust that in this patch to remove the NULL check so it
is consistent with the put.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick


> ---
>  arch/powerpc/kvm/powerpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..4285d0eac900 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -431,6 +431,8 @@ int kvm_arch_check_processor_compat(void *opaque)
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  {
>  	struct kvmppc_ops *kvm_ops =3D NULL;
> +	int r;
> +
>  	/*
>  	 * if we have both HV and PR enabled, default is HV
>  	 */
> @@ -456,7 +458,10 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long =
type)
>  		return -ENOENT;
> =20
>  	kvm->arch.kvm_ops =3D kvm_ops;
> -	return kvmppc_core_init_vm(kvm);
> +	r =3D kvmppc_core_init_vm(kvm);
> +	if (r)
> +		module_put(kvm->arch.kvm_ops->owner);
> +	return r;
>  err_out:
>  	return -EINVAL;
>  }
> --=20
> 2.34.1
>=20
>=20
