Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990B35360D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 02:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCZtF41rFz3bwq
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 10:49:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l/1YNP9t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l/1YNP9t; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCZsp0XQwz2yxc
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Apr 2021 10:48:44 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id t20so4066649plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Apr 2021 17:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5sj9nqmanNLXtOTWzV/X0F+zWCZ8SHkvEivksnNLpW4=;
 b=l/1YNP9tv3kzpV79s6fOxeVnD96Xr8/ky/8M90sQhxBKuL9cryGea4Ks65y2UWImvy
 u6hI+9aUkt3IGWUyGwBEtTI+JDKE2kTzUJqX4dtFH1mnbF6xpLQP2nbaEM3umt+QBccs
 CF5IYYIeuUieDbE05lNnX/ZzIvd3YKJ6fXzzxFz/rWzbD7USqjtzjtJBnBsGbtvf9wtM
 UJtfUX3/0eb7TzgucpIbNVQR6VzMAWLVBnSw8RUyP9awQmK4ZH5E/72orOno8THg0X1K
 bJMtRh21pz0jvcKPVnCaOUixu0ax+m2edALPYyhN0WhCCKIDqpVSIoJSqltNDhfy/mUs
 ZzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5sj9nqmanNLXtOTWzV/X0F+zWCZ8SHkvEivksnNLpW4=;
 b=JvEo1gvBEqq5D+ScmHtGtQOk6lYS3uJxGJ6uisOCvO9IepJshmLMl8K6Se1AN6ZHRC
 j5JmCkVnBDQa0Vz3TgnAnsNeKxX5s04ThIRBWF5FXN30JYo//d34eJoDYhvDMD9FIrXu
 fSvcJmJfdWfytcIajO5a+A8qSAjpj1w/XfXUYUd642nboKrLWf0qNSAWzjxVrVUT5/7G
 Sm/GWDMgUv+klLv2F6pQjbvVFiSpi0YTuqrM8XvcZht2+Pl9bYdUv0D9l4PdsfW8Jt4P
 QbHYB3VF8zEU71WGnjDTwlSJuZ2YS+6hsDvAKb+5UUxEu8ic+bDkHq5DD0cWe4E6+5Qp
 n9bg==
X-Gm-Message-State: AOAM533kiDqiyRrb+Gy6no0Xjw2q0BcYq6vrzyuy/eb2yrzadnx8SroI
 c7ascm0YrslCK8Z/T50IiHs=
X-Google-Smtp-Source: ABdhPJz1BQ6818NuJtxPjChi0IrsYIss9TXGirQfc52qNJhI80xCdas1oC4d5az0lSLOaHWjrJeTag==
X-Received: by 2002:a17:902:7b90:b029:e6:f01d:9db2 with SMTP id
 w16-20020a1709027b90b02900e6f01d9db2mr18377010pll.69.1617497320424; 
 Sat, 03 Apr 2021 17:48:40 -0700 (PDT)
Received: from localhost ([1.132.159.109])
 by smtp.gmail.com with ESMTPSA id t7sm11100865pfg.69.2021.04.03.17.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Apr 2021 17:48:39 -0700 (PDT)
Date: Sun, 04 Apr 2021 10:48:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 41/48] KVM: PPC: Book3S HV: Remove unused nested HV
 tests in XICS emulation
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org
References: <20210401150325.442125-1-npiggin@gmail.com>
 <20210401150325.442125-42-npiggin@gmail.com>
 <9a8250f2-72a6-32df-ab01-36f8d16e73df@kaod.org>
In-Reply-To: <9a8250f2-72a6-32df-ab01-36f8d16e73df@kaod.org>
MIME-Version: 1.0
Message-Id: <1617496786.gl0te7k1yh.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of April 3, 2021 2:32 am:
> On 4/1/21 5:03 PM, Nicholas Piggin wrote:
>> Commit f3c18e9342a44 ("KVM: PPC: Book3S HV: Use XICS hypercalls when
>> running as a nested hypervisor") added nested HV tests in XICS
>> hypercalls, but not all are required.
>>=20
>> * icp_eoi is only called by kvmppc_deliver_irq_passthru which is only
>>   called by kvmppc_check_passthru which is only caled by
>>   kvmppc_read_one_intr.
>>=20
>> * kvmppc_read_one_intr is only called by kvmppc_read_intr which is only
>>   called by the L0 HV rmhandlers code.
>>=20
>> * kvmhv_rm_send_ipi is called by:
>>   - kvmhv_interrupt_vcore which is only called by kvmhv_commence_exit
>>     which is only called by the L0 HV rmhandlers code.
>>   - icp_send_hcore_msg which is only called by icp_rm_set_vcpu_irq.
>>   - icp_rm_set_vcpu_irq which is only called by icp_rm_try_update
>>   - icp_rm_set_vcpu_irq is not nested HV safe because it writes to
>>     LPCR directly without a kvmhv_on_pseries test. Nested handlers
>>     should not in general be using the rm handlers.
>>=20
>> The important test seems to be in kvmppc_ipi_thread, which sends the
>> virt-mode H_IPI handler kick to use smp_call_function rather than
>> msgsnd.
>>=20
>> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_builtin.c | 44 +++++-----------------------
>>  arch/powerpc/kvm/book3s_hv_rm_xics.c | 15 ----------
>>  2 files changed, 8 insertions(+), 51 deletions(-)
>=20
> So, now, the L1 is not limited to XICS anymore and we can use the XIVE=20
> native interrupt mode with an L2 using XICS in KVM or XIVE in QEMU.
> Is that correct ?  =20

The intention was to only remove dead code and no change.
Perhaps I'm missing something or an earlier patch incorrectly made some
of these paths dead but I don't see it.

> It seems you removed all the XICS hcalls under kvmhv_on_pseries().

From what I could work out, kvmhv_on_pseries can never be true for the
ones I removed.

Thanks,
Nick

>=20
> C.
>=20
> =20
>> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/boo=
k3s_hv_builtin.c
>> index 8d669a0e15f8..259492bb4153 100644
>> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
>> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
>> @@ -199,15 +199,6 @@ void kvmhv_rm_send_ipi(int cpu)
>>  	void __iomem *xics_phys;
>>  	unsigned long msg =3D PPC_DBELL_TYPE(PPC_DBELL_SERVER);
>> =20
>> -	/* For a nested hypervisor, use the XICS via hcall */
>> -	if (kvmhv_on_pseries()) {
>> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
>> -
>> -		plpar_hcall_raw(H_IPI, retbuf, get_hard_smp_processor_id(cpu),
>> -				IPI_PRIORITY);
>> -		return;
>> -	}
>> -
>>  	/* On POWER9 we can use msgsnd for any destination cpu. */
>>  	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>>  		msg |=3D get_hard_smp_processor_id(cpu);
>> @@ -420,19 +411,12 @@ static long kvmppc_read_one_intr(bool *again)
>>  		return 1;
>> =20
>>  	/* Now read the interrupt from the ICP */
>> -	if (kvmhv_on_pseries()) {
>> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
>> -
>> -		rc =3D plpar_hcall_raw(H_XIRR, retbuf, 0xFF);
>> -		xirr =3D cpu_to_be32(retbuf[0]);
>> -	} else {
>> -		xics_phys =3D local_paca->kvm_hstate.xics_phys;
>> -		rc =3D 0;
>> -		if (!xics_phys)
>> -			rc =3D opal_int_get_xirr(&xirr, false);
>> -		else
>> -			xirr =3D __raw_rm_readl(xics_phys + XICS_XIRR);
>> -	}
>> +	xics_phys =3D local_paca->kvm_hstate.xics_phys;
>> +	rc =3D 0;
>> +	if (!xics_phys)
>> +		rc =3D opal_int_get_xirr(&xirr, false);
>> +	else
>> +		xirr =3D __raw_rm_readl(xics_phys + XICS_XIRR);
>>  	if (rc < 0)
>>  		return 1;
>> =20
>> @@ -461,13 +445,7 @@ static long kvmppc_read_one_intr(bool *again)
>>  	 */
>>  	if (xisr =3D=3D XICS_IPI) {
>>  		rc =3D 0;
>> -		if (kvmhv_on_pseries()) {
>> -			unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
>> -
>> -			plpar_hcall_raw(H_IPI, retbuf,
>> -					hard_smp_processor_id(), 0xff);
>> -			plpar_hcall_raw(H_EOI, retbuf, h_xirr);
>> -		} else if (xics_phys) {
>> +		if (xics_phys) {
>>  			__raw_rm_writeb(0xff, xics_phys + XICS_MFRR);
>>  			__raw_rm_writel(xirr, xics_phys + XICS_XIRR);
>>  		} else {
>> @@ -493,13 +471,7 @@ static long kvmppc_read_one_intr(bool *again)
>>  			/* We raced with the host,
>>  			 * we need to resend that IPI, bummer
>>  			 */
>> -			if (kvmhv_on_pseries()) {
>> -				unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
>> -
>> -				plpar_hcall_raw(H_IPI, retbuf,
>> -						hard_smp_processor_id(),
>> -						IPI_PRIORITY);
>> -			} else if (xics_phys)
>> +			if (xics_phys)
>>  				__raw_rm_writeb(IPI_PRIORITY,
>>  						xics_phys + XICS_MFRR);
>>  			else
>> diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/boo=
k3s_hv_rm_xics.c
>> index c2c9c733f359..0a11ec88a0ae 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
>> +++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
>> @@ -141,13 +141,6 @@ static void icp_rm_set_vcpu_irq(struct kvm_vcpu *vc=
pu,
>>  		return;
>>  	}
>> =20
>> -	if (xive_enabled() && kvmhv_on_pseries()) {
>> -		/* No XICS access or hypercalls available, too hard */
>> -		this_icp->rm_action |=3D XICS_RM_KICK_VCPU;
>> -		this_icp->rm_kick_target =3D vcpu;
>> -		return;
>> -	}
>> -
>>  	/*
>>  	 * Check if the core is loaded,
>>  	 * if not, find an available host core to post to wake the VCPU,
>> @@ -771,14 +764,6 @@ static void icp_eoi(struct irq_chip *c, u32 hwirq, =
__be32 xirr, bool *again)
>>  	void __iomem *xics_phys;
>>  	int64_t rc;
>> =20
>> -	if (kvmhv_on_pseries()) {
>> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
>> -
>> -		iosync();
>> -		plpar_hcall_raw(H_EOI, retbuf, hwirq);
>> -		return;
>> -	}
>> -
>>  	rc =3D pnv_opal_pci_msi_eoi(c, hwirq);
>> =20
>>  	if (rc)
>>=20
>=20
>=20
