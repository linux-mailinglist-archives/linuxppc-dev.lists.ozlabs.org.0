Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9536C290F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 05:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgdZl3X0Yz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 15:16:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C5Tlzmip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C5Tlzmip;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgdYm5T95z2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 15:15:23 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q189so7860455pga.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679372121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ2j5JN955TIVQ6alJF8oihXVZDZ3XjiZxc6zY7G6i8=;
        b=C5TlzmipNRBOvhfXbntHYNIh7BINmX3doog1Kh/Nt8x0Dzeroj4cWnGwbYiAMag6vT
         3teLzldwQ8d/0arRPh90I2m5w6NtiS67ZdZIZN5aMqhTDdxkDyjocN2l16hdJm4wSe3n
         MrFhtH8LsCkPPEKjeGmnI1zfKMKbGKpFjK30ZiatpDrn3hksUlVeVZF3Cy1/qAyGispK
         mP5Q2gR0ASOAoYtjBWgrQqMGH3FWgB3FQX5KxdwBb8xUfKlfPvYp/g7Am48E1ZUeqp1F
         3WdRQNm/htm105jJwB2cMyXbUpoJoiPIGFDqE8Pyp+JCRFrQT4PsKHuf+BcJqVgjqVma
         fLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679372121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sJ2j5JN955TIVQ6alJF8oihXVZDZ3XjiZxc6zY7G6i8=;
        b=wqo9aISmEwzRSMsdy+FPVlEMQs3Y1vEnDUVzHE7NFQSqh/9jJHXNdj0AMGPl2q5AZW
         MKWM4cdCPNDWjpZRROFVMqnF61KudXZkh5e5NHrwyOn+XfyZ/WeZsUnBnPbqdyevVikH
         gqW5tajBcY9NXdvoPRVwHIbDVNFwSbpCJkx+i+MccHulCPV0uS1hubMjss4FoBR9KN5r
         6jgYBszFSp3r2v8Fn+q20zQ+w1Qe7ZDzGdzhfFoSD5Vab5JUlOYwbn/shAxT+6wYizAw
         JnYknkYFZBdXHzWVuRWRWuwYNdSRrPdd0HS4ijvljk1dnCXipt2KAdwk6xxLJUVM8SNx
         IDMg==
X-Gm-Message-State: AO0yUKVtBYAPgOisMiiWyOuL5tdOjcnLBoiGIFzL+TP+9TpPx96m9YTT
	Dsk/935iHXrHTyOy/QTIVBc=
X-Google-Smtp-Source: AK7set8dpMbVHUo4z+qEAApeMhTR1ArVggBkpk5n/HqWDsBBjRCHMET+H6oD4qp9S/na9AarcUi1ZA==
X-Received: by 2002:aa7:9dc1:0:b0:5a8:4861:af7d with SMTP id g1-20020aa79dc1000000b005a84861af7dmr1259596pfq.20.1679372120677;
        Mon, 20 Mar 2023 21:15:20 -0700 (PDT)
Received: from localhost (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id j26-20020aa78d1a000000b005dfc8a35793sm7113513pfe.38.2023.03.20.21.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 21:15:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 14:15:14 +1000
Message-Id: <CRBRQAXJRZZW.28LH58EV3T8AL@bobo>
Subject: Re: [PATCH v3 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4
 argument
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Kautuk Consul" <kconsul@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Fabiano Rosas" <farosas@linux.ibm.com>, "Sathvika Vasireddy"
 <sv@linux.ibm.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>
X-Mailer: aerc 0.13.0
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-3-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230316051025.1424093-3-kconsul@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> kvmppc_hv_entry is called from only 2 locations within
> book3s_hv_rmhandlers.S. Both of those locations set r4
> as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
> So, shift the r4 load instruction to kvmppc_hv_entry and
> thus modify the calling convention of this function.

Is r4 there only used for CONFIG_KVM_BOOK3S_HV_P8_TIMING? Could put it
under there. Although you then lose the barrier if it's disabled, that
is okay if you're sure that's the only memory operation being ordered.

I'm not sure how much new work we want to put into changing this asm
code, since it's POWER7/8 only. I would love to move this (and the
other) KVM implementations to C like we did with P9. It's a pretty big
job though.

Thanks,
Nick

>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index b81ba4ee0521..b61f0b2c677b 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
>  	RFI_TO_KERNEL
> =20
>  kvmppc_call_hv_entry:
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
> =20
>  	/* Back from guest - restore host state and return to caller */
> @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
>  	mtspr	SPRN_LDBAR, r0
>  	isync
>  63:
> -	/* Order load of vcpu after load of vcore */
> -	lwsync
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
> =20
>  	/* Back from the guest, go back to nap */
> @@ -506,7 +504,6 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> =20
>  	/* Required state:
>  	 *
> -	 * R4 =3D vcpu pointer (or NULL)
>  	 * MSR =3D ~IR|DR
>  	 * R13 =3D PACA
>  	 * R1 =3D host R1
> @@ -524,6 +521,10 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
>  	li	r6, KVM_GUEST_MODE_HOST_HV
>  	stb	r6, HSTATE_IN_GUEST(r13)
> =20
> +	/* Order load of vcpu after load of vcore */
> +	lwsync
> +	ld	r4, HSTATE_KVM_VCPU(r13)
> +
>  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
>  	/* Store initial timestamp */
>  	cmpdi	r4, 0
> --=20
> 2.39.2

