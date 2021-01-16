Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45B2F8CDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 11:39:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHvgn5nTQzDsmW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 21:39:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Osq5c9+/; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHvf3622dzDsmR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 21:38:18 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id i7so7710993pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 02:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Dv7ZtUGF5N76AH1yjyB/TMo+vv8bzhaMc3Fq9dVsxRE=;
 b=Osq5c9+/2WPZg3KAPAK8VrG6lV8UpWky3+vpo4bIrYuOCyc04jjrNzTkUdFJC7s+oc
 OyYpk8xvorFh51DPvrGsBaUF94I4s98FpmGXLTl8Aht5SeQ2hLaXi8Za36WNzrJXNedG
 BKBigJ7PaU8CkT7fOfDOHq99rCSFp/z2Va59PDgcB+WrevHcLyhKc2qlccUtWFK4tLUh
 5bQyO6idm7NSlck4Zk3Q/pNrmFR0iUmvPbqjmRviXJsHl0bdKGXKuxmhNFcMED+pt8N1
 bD0GcQQdTaDJYExa9VYpBqlXK3FU0uVL6nik0sArN6e0tefxMxo/lTzolufxxEyzviTn
 EvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Dv7ZtUGF5N76AH1yjyB/TMo+vv8bzhaMc3Fq9dVsxRE=;
 b=pXdRzInAhf0qzBTzWPXjvg+vI1ISQ9yIk2kSLmbXUTjuAP0+oT38f9yIISCLnnjRVr
 ebc7WQL9sscDYkt+9FAZhFkDMULS5TWvhkMlUl8EalU3tbPlml4kk4z8OJtsdDicK0VE
 awACKh7h0197EYd7+m1IwPGHIek332kmng8+uD/ZcN1dUdkqWEgsOMxaXikIzQL5JeOp
 asEIDkJx34TAwhTYPBh3YLLCts5I7pttkWqD9tYoR9JVlJgqLKFATafDbPNrXQJnYqp2
 zjkCZJtBYTmWFCtFDFJRP+c/VsxpH0qrlnGe71q7MB/TNs9CxQardGJN8vSr6gWMHoHc
 ON0g==
X-Gm-Message-State: AOAM533oj9N6krjVPUVFkD+pmyD+kglJzylWDOxQHcZM1+IydWQQ+bGU
 U0gIMATjfueiPHrIKbLm4RS0dTqm8f4=
X-Google-Smtp-Source: ABdhPJw/arx1cHJ4qBao6kLXDqM4y4YOSqdKGExCN8Evh5w6/aXWgW694RePyU3ekFPBjG+Ty9JZVg==
X-Received: by 2002:a65:6450:: with SMTP id s16mr16796698pgv.71.1610793494788; 
 Sat, 16 Jan 2021 02:38:14 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id a11sm11040894pfr.198.2021.01.16.02.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:38:14 -0800 (PST)
Date: Sat, 16 Jan 2021 20:38:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 01/39] KVM: PPC: Book3S HV: Context tracking exit guest
 context before enabling irqs
To: linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-2-npiggin@gmail.com>
In-Reply-To: <20210115165012.1260253-2-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1610793296.fjhomer31g.astroid@bobo.none>
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of January 16, 2021 2:49 am:
> Interrupts that occur in kernel mode expect that context tracking
> is set to kernel. Enabling local irqs before context tracking
> switches from guest to host means interrupts can come in and trigger
> warnings about wrong context, and possibly worse.

I think this is not actually a fix per se with context as it is today
because the interrupt handlers will save and update the state. It only=20
starts throwing warnings when moving to the more precise tracking
where kernel interrupts always expect context to be in kernel mode.

The patch stands on its own just fine, but I'll reword slightly and
move it in the series to where it's needed.

Thanks,
Nick

>=20
> Cc: kvm-ppc@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6f612d240392..d348e77cee20 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3407,8 +3407,9 @@ static noinline void kvmppc_run_core(struct kvmppc_=
vcore *vc)
> =20
>  	kvmppc_set_host_core(pcpu);
> =20
> +	guest_exit_irqoff();
> +
>  	local_irq_enable();
> -	guest_exit();
> =20
>  	/* Let secondaries go back to the offline loop */
>  	for (i =3D 0; i < controlled_threads; ++i) {
> @@ -4217,8 +4218,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
> =20
>  	kvmppc_set_host_core(pcpu);
> =20
> +	guest_exit_irqoff();
> +
>  	local_irq_enable();
> -	guest_exit();
> =20
>  	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
> =20
> --=20
> 2.23.0
>=20
>=20
