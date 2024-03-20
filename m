Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A388128B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 14:44:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XqhzyKlo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V08vq1BXmz3vWy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 00:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XqhzyKlo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V08v35LDsz30gK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 00:43:41 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-29fb7e52731so2331808a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710942217; x=1711547017; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkcxNUYVeIsC5l1PCS55LiuRgLN92XEeA7AcFx54cFI=;
        b=XqhzyKloexN+J4/p+8igDCox55QTcJ88S/WpmohSFW58DXgOjvLpAR0nHSj1asFoN+
         JNeIotF5E8Ti/rq7ey4x59ga3qJfW94JSCojVTacmDR3CopqyEJgGM1mvqz3Ud+lPOlt
         V1ElEjiUjCsr2JuaSDB5v/YWCap71c30RALDdobXz3CC8GhJA+LqIGIkxj5KLGcPY8En
         LljlqRhV/yQnGqqYmyPgQ77QlIJJa9baapVGJgse8lQKg3Y3SpD7CizizU8HyEfEF5Ko
         GAhLzTS1PWPftmSzDIfnCbv6HzzwFX6tQzaXWaWR74fYd1iYuPoiGMnjsvrttKWo5O8m
         pMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942217; x=1711547017;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkcxNUYVeIsC5l1PCS55LiuRgLN92XEeA7AcFx54cFI=;
        b=CCI0GftNbe0cCD3RDBdfsXMObPlvp+q60sRUt5NOdRRA0p8zLLUiBd/tdJWaRHgggb
         aP2YMiXxnZKMK1QN8NksVOGb7jmg3ViyOCQbpRcKpXGAKs8rrGwIhBWVr5Bl2Tkso5xx
         w6P9O1g7sh0+VblzkqzWAtAHwAy0UIWlVcIbXNvdufj2L4xiOqu6OURHADsS/ln10vIz
         EZ7tlyDdGSlFXsG1xDNwpNMCB0n3hETE7SA0igteJW8B6kYZ7K4peCm4cf0b3hc7J4JT
         BCcjH4sPmjcNLqSoYI+nCG107XNSRH9dwfWlJp9bTMnE4DDmccYhWT7FE6uQkWEzOrGg
         VRyA==
X-Forwarded-Encrypted: i=1; AJvYcCWTU4SrbnzhnUuR7p+UgGdeSEzA0INuTTZ2KUiaYaU3iptYSox99Q5hCingJbs6+GIPtMhnSMyIDef/F3IFC3djAl8ix2s0t02VKYdysg==
X-Gm-Message-State: AOJu0Ywln642t3oUYGJJDCKzfGipVCNiTkTe+igaDZ9teVcYE7g6npX+
	yr7exqWXqyi6DkcLtJYkOzrz6IqpdIX9ooP09B+uf0vOPgQQZx2+
X-Google-Smtp-Source: AGHT+IFW67cPx23ALjOO6pVU1+yxckmTH3qtP1K1gSVYZcIrRRBY4tUMK7k8CT+nxZbQGRKfJtAGRQ==
X-Received: by 2002:a17:90a:a78a:b0:29b:af61:fb34 with SMTP id f10-20020a17090aa78a00b0029baf61fb34mr6607716pjq.34.1710942217140;
        Wed, 20 Mar 2024 06:43:37 -0700 (PDT)
Received: from localhost (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id fy16-20020a17090b021000b0029fc7a754c7sm1588113pjb.25.2024.03.20.06.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 06:43:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Mar 2024 23:43:28 +1000
Message-Id: <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Vaibhav Jain" <vaibhav@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <kvm@vger.kernel.org>, <kvm-ppc@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
In-Reply-To: <20240313072625.76804-1-vaibhav@linux.ibm.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Mar 13, 2024 at 5:26 PM AEST, Vaibhav Jain wrote:
> This reverts commit 180c6b072bf360b686e53d893d8dcf7dbbaec6bb ("KVM: PPC:
> Book3S HV nestedv2: Do not cancel pending decrementer exception") which
> prevented cancelling a pending HDEC exception for nestedv2 KVM guests. It
> was done to avoid overhead of a H_GUEST_GET_STATE hcall to read the 'HDEC
> expiry TB' register which was higher compared to handling extra decrement=
er
> exceptions.
>
> This overhead of reading 'HDEC expiry TB' register has been mitigated
> recently by the L0 hypervisor(PowerVM) by putting the value of this
> register in L2 guest-state output buffer on trap to L1. From there the
> value of this register is cached, made available in kvmhv_run_single_vcpu=
()
> to compare it against host(L1) timebase and cancel the pending hypervisor
> decrementer exception if needed.

Ah, I figured out the problem here. Guest entry never clears the
queued dec, because it's level triggered on the DEC MSB so it
doesn't go away when it's delivered. So upstream code is indeed
buggy and I think I take the blame for suggesting this nestedv2
workaround.

I actually don't think that is necessary though, we could treat it
like other interrupts.  I think that would solve the problem without
having to test dec here.

I am wondering though, what workload slows down that this patch
was needed in the first place. We'd only get here after a cede
returns, then we'd dequeue the dec and stop having to GET_STATE
it here.

Thanks,
Nick

>
> Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending=
 decrementer exception")
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 0b921704da45..e47b954ce266 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4856,7 +4856,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
>  	 * entering a nested guest in which case the decrementer is now owned
>  	 * by L2 and the L1 decrementer is provided in hdec_expires
>  	 */
> -	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
> +	if (kvmppc_core_pending_dec(vcpu) &&
>  			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
>  			 (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL &&
>  			  kvmppc_get_gpr(vcpu, 3) =3D=3D H_ENTER_NESTED)))

