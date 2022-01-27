Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3649DBC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:36:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkspb6Sncz3f6H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aDTBTXhQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aDTBTXhQ; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksmP5KHBz3fQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:34:28 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id c9so1740690plg.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0z6S/QM0Uvi3byPZUvWJmc24ntlSpzOJlQruqXOVpc0=;
 b=aDTBTXhQ5RZXiO1G2Ng3z2p9A30SqfEO9aRYeJLhglNFTqJKHjoIGk0Ps0efTdlsJ0
 x9BbEPCyC8svBSHV4B78BIJOepThLR/jaJ4YyhsM02/3t9qB55qwINmV/aSrBaMC5+XW
 klKheAOzwQO0Ag4DOesqw+zBSTxFjXsnTw+0mYMuqTrHUvZ6GufoZNOH1s1q1UO1gB6v
 7wiyhlSrzDD+ZTXCGw/R2NCNh5PhLopQ1nXiyGHfJEOZqTf21jBIhcr3lWKjaGE3XBZd
 luP6jflZTmJ/CruBxs4Ldv7XDt0hNG6ditdQvqUaLbUIiDSEqu6n4hEZpUi/chvijf60
 /Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0z6S/QM0Uvi3byPZUvWJmc24ntlSpzOJlQruqXOVpc0=;
 b=XFpISnY1WdQ06zEmr+7kTS9OJiETKeH3tzGE63+X5Y3bUIKRtlVw6JtocVCTDf44XB
 BLIEIQ9/25JW0ACb1n2zrZLCrB5a3lC9hSUj1HGFSi8U4GdpDGUq+0kh2bNiVmwzdy88
 kRv9nzQYRj+V5c2FxbmQH8fvhaOejJJclgq6WU9lR9rzPmwpsc4z85ShZEBEpJyv9O/C
 S0bVkvj3qj9KeLp/+JYbQjVtFyTttRIk6NYslETA/iGuPxHa8y+ZmtKYBVx/FmjQOx+T
 cxg5QxMogFkj7sbfB8UYUfG4wKF1oB8Al6XeQ53xObHLKwJqf+/qU+ylgiFvzB6/XFPV
 D8/w==
X-Gm-Message-State: AOAM532DSPT4gdckWxK9vVGEHJzAU2igcdTFEjK9ujkB2dWWRO73875O
 U5sBrI4fyGtMZzrGwHkWQHQ=
X-Google-Smtp-Source: ABdhPJxlLYR/dkdYryTXXfmtY/KdmSWPkXwUUpGTZPpsw/Ji5if50Kapadwj5DU9pXgnpMtLvxwbCw==
X-Received: by 2002:a17:902:6a83:: with SMTP id
 n3mr2036481plk.139.1643268865738; 
 Wed, 26 Jan 2022 23:34:25 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id b20sm4494332pfv.134.2022.01.26.23.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 23:34:25 -0800 (PST)
Date: Thu, 27 Jan 2022 17:34:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 5/5] KVM: PPC: Book3s: mmio: Deliver DSI after
 emulation failure
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220125215655.1026224-1-farosas@linux.ibm.com>
 <20220125215655.1026224-6-farosas@linux.ibm.com>
In-Reply-To: <20220125215655.1026224-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643268801.z8aez7lyue.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of January 26, 2022 7:56 am:
> MMIO emulation can fail if the guest uses an instruction that we are
> not prepared to emulate. Since these instructions can be and most
> likely are valid ones, this is (slightly) closer to an access fault
> than to an illegal instruction, so deliver a Data Storage interrupt
> instead of a Program interrupt.
>=20
> BookE ignores bad faults, so it will keep using a Program interrupt
> because a DSI would cause a fault loop in the guest.
>=20
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Thanks this looks good to me. (And thanks for updating patch 4/5 with
the kvm debug print helper.)

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kvm/emulate_loadstore.c | 10 +++-------
>  arch/powerpc/kvm/powerpc.c           | 22 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emul=
ate_loadstore.c
> index 48272a9b9c30..cfc9114b87d0 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -73,7 +73,6 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  {
>  	u32 inst;
>  	enum emulation_result emulated =3D EMULATE_FAIL;
> -	int advance =3D 1;
>  	struct instruction_op op;
> =20
>  	/* this default type might be overwritten by subcategories */
> @@ -98,6 +97,8 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  		int type =3D op.type & INSTR_TYPE_MASK;
>  		int size =3D GETSIZE(op.type);
> =20
> +		vcpu->mmio_is_write =3D OP_IS_STORE(type);
> +
>  		switch (type) {
>  		case LOAD:  {
>  			int instr_byte_swap =3D op.type & BYTEREV;
> @@ -355,15 +356,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  		}
>  	}
> =20
> -	if (emulated =3D=3D EMULATE_FAIL) {
> -		advance =3D 0;
> -		kvmppc_core_queue_program(vcpu, 0);
> -	}
> -
>  	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
> =20
>  	/* Advance past emulated instruction. */
> -	if (advance)
> +	if (emulated !=3D EMULATE_FAIL)
>  		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
> =20
>  	return emulated;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index acb0d2a4bdb9..82d889db2b6b 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -309,6 +309,28 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>  		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>  		kvm_debug_ratelimited("Guest access to device memory using unsupported=
 instruction (opcode: %#08x)\n",
>  				      last_inst);
> +
> +		/*
> +		 * Injecting a Data Storage here is a bit more
> +		 * accurate since the instruction that caused the
> +		 * access could still be a valid one.
> +		 */
> +		if (!IS_ENABLED(CONFIG_BOOKE)) {
> +			ulong dsisr =3D DSISR_BADACCESS;
> +
> +			if (vcpu->mmio_is_write)
> +				dsisr |=3D DSISR_ISSTORE;
> +
> +			kvmppc_core_queue_data_storage(vcpu, vcpu->arch.vaddr_accessed, dsisr=
);
> +		} else {
> +			/*
> +			 * BookE does not send a SIGBUS on a bad
> +			 * fault, so use a Program interrupt instead
> +			 * to avoid a fault loop.
> +			 */
> +			kvmppc_core_queue_program(vcpu, 0);
> +		}
> +
>  		r =3D RESUME_GUEST;
>  		break;
>  	}
> --=20
> 2.34.1
>=20
>=20
