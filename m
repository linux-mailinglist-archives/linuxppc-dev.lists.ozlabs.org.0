Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E927927604
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:30:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jQYtbrRn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFGFF0DyMz3fRN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jQYtbrRn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFGDX5F5Zz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:29:32 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-75a6c290528so336981a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2024 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720096169; x=1720700969; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNfsnOEtHtVgBniAhgQdMy49K3wiZRS/wOfw9thsZks=;
        b=jQYtbrRnh7mn2exqBg42JPb6+oI4pKlLMr4Lz//HSWGHfT2OcOfTKaqTTV+L5Cb0UG
         8+Z9YSJGQ4OlWX+SayW7tqQlCpMiWeDhV/NPkGMYINX7wxAcB1NmaYoQ7Dg6BBJfGOsj
         +jratNq/CcepDEFTM0MoTu94rTLJZKTfUJkRS4RHqa07bBw5QgjO9dWjeL9Q7PBu1DpD
         ++2ceqeFU7YkomvN+gdPmU1L5XUY6sAmdFtgPkdPdBD7JgS3rnaR+NAKVLtXMD3fk8lI
         NS6SW/uA2EEIvcXKC20VhTq2zylt7bZF4r1Qi8TL5yVH3ipSvjlr5gJdoyAVR6foyEIM
         7XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096169; x=1720700969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNfsnOEtHtVgBniAhgQdMy49K3wiZRS/wOfw9thsZks=;
        b=rEDZOC7+P5MLsQ4fU2NLf3N51QnuIidOLFeGv5ZzEa3cGCK0x3EABfRY+bpx+uwnoD
         /PpNnVpMjPGhq+tGe4ndJgsPd/OgLC+UeMMMr3CIAfpJkR01L80HyTnW1nO/nS0e0dBe
         Y0frsCLyyEevzuAeMBO9Wzjy6gPLxBEfW5WVlsXjij3chwYKGOCvbtMJFTxxQKWZ5Sqp
         IRro7PZ0G0/aNs3Frk8ophAVq+1Q3BYvcqIYB7eG2eNQtSgdx5iw25Rrcvhdx5t/qa0i
         Rkn5motrHMC+qpi2lyQu9rVYuH+0Muk7t5jOtEI35JGRduHmRt+1QqgGCFPL6eybse7u
         o0jg==
X-Gm-Message-State: AOJu0Yw6ywocubFrfV2XrgQIgKnIY+zo2LjE8XCu85/Tfvt7rOIeM9lS
	6wrEzV9sTaqyxr01pCi3bhdHvweWVl2pATkHxkhBazo/NSglYVnuYyg8eA==
X-Google-Smtp-Source: AGHT+IGt0/o2u3yrXRWsUqt7a7Glp/54cozH/TSSBsnH/uI+kft9JtdePRrBcEnY2gsuG47Od5JPcg==
X-Received: by 2002:a05:6a20:a10d:b0:1bd:2703:840 with SMTP id adf61e73a8af0-1c0cc75c736mr1502282637.33.1720096169473;
        Thu, 04 Jul 2024 05:29:29 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a946f01sm1365436a91.11.2024.07.04.05.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 05:29:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 22:29:23 +1000
Message-Id: <D2GR78QR1Y7K.3I08I56HLWKFT@gmail.com>
Subject: Re: [RFC PATCH 1/2] Revert "KVM: PPC: Book3S HV Nested: Stop
 forwarding all HFUs to L1"
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <naveen.n.rao@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240627180342.110238-1-gautam@linux.ibm.com>
 <20240627180342.110238-2-gautam@linux.ibm.com>
In-Reply-To: <20240627180342.110238-2-gautam@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 28, 2024 at 4:03 AM AEST, Gautam Menghani wrote:
> This reverts commit 7c3ded5735141ff4d049747c9f76672a8b737c49.
>
> On PowerNV, when a nested guest tries to use a feature prohibited by
> HFSCR, the nested hypervisor (L1) should get a H_FAC_UNAVAILABLE trap
> and then L1 can emulate the feature. But with the change introduced by
> commit 7c3ded573514 ("KVM: PPC: Book3S HV Nested: Stop forwarding all HFU=
s to L1")
> the L1 ends up getting a H_EMUL_ASSIST because of which, the L1 ends up
> injecting a SIGILL when L2 (nested guest) tries to use doorbells.

Yeah, we struggled to come up with a coherent story for this kind of
compatibility and mismatched feature handling between L0 and L1.

The L1 doorbell emulation shows a legitimate case the L1 wants to see
the HFAC to emulate it and the L0 does not permit the L1 to set it for
the L2.

Actually the L0 could just permit it (even if the L0 wanted to emulate
doorbells for the L1, it could still allow the L2 to run with doorbells
if that's what the L1 asked for). That would also solve this problem,
but there is a potential future hardware change where doorbells will be
able to address any thread in the core even in "LPAR-per-thread" mode
and the hypervisor *must* disable the doorbell HFSCR to the guest if it
runs in KVM style that schedules LPARs on a per-thread basis instead of
per-core. In that case the L0 must not permit the L2 to run with HFSCR
set. So this approach actually works better there.

In other cases where the L0 might deliberately prohibit some facility
in a way that we don't want the L1 to see HFAC. I think we just
cross that bridge when it comes. I'm sure the L0 would really need to
advertise that to the L1 properly via device-tree or similar, and we
could special case the HFAC->HEAI if necessary then.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 31 ++-----------------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index daaf7faf21a5..cea28ac05923 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2052,36 +2052,9 @@ static int kvmppc_handle_nested_exit(struct kvm_vc=
pu *vcpu)
>  		fallthrough; /* go to facility unavailable handler */
>  #endif
> =20
> -	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
> -		u64 cause =3D vcpu->arch.hfscr >> 56;
> -
> -		/*
> -		 * Only pass HFU interrupts to the L1 if the facility is
> -		 * permitted but disabled by the L1's HFSCR, otherwise
> -		 * the interrupt does not make sense to the L1 so turn
> -		 * it into a HEAI.
> -		 */
> -		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
> -				(vcpu->arch.nested_hfscr & (1UL << cause))) {
> -			ppc_inst_t pinst;
> -			vcpu->arch.trap =3D BOOK3S_INTERRUPT_H_EMUL_ASSIST;
> -
> -			/*
> -			 * If the fetch failed, return to guest and
> -			 * try executing it again.
> -			 */
> -			r =3D kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
> -			vcpu->arch.emul_inst =3D ppc_inst_val(pinst);
> -			if (r !=3D EMULATE_DONE)
> -				r =3D RESUME_GUEST;
> -			else
> -				r =3D RESUME_HOST;
> -		} else {
> -			r =3D RESUME_HOST;
> -		}
> -
> +	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
> +		r =3D RESUME_HOST;
>  		break;
> -	}
> =20
>  	case BOOK3S_INTERRUPT_HV_RM_HARD:
>  		vcpu->arch.trap =3D 0;

