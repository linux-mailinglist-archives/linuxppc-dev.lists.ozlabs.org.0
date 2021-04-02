Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B69352DC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 18:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBlvl3vPLz3c3Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 03:32:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBlvP0pB4z30Cw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 03:32:14 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B7A4596E4367;
 Fri,  2 Apr 2021 18:32:09 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 18:32:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067e6f1cae-5f2c-4bc2-90d0-d7a5b76f8c0c,
 CED0CE0CC895D647B8CFE0BE9502FE01F599FB05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v5 41/48] KVM: PPC: Book3S HV: Remove unused nested HV
 tests in XICS emulation
To: Nicholas Piggin <npiggin@gmail.com>, <kvm-ppc@vger.kernel.org>
References: <20210401150325.442125-1-npiggin@gmail.com>
 <20210401150325.442125-42-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9a8250f2-72a6-32df-ab01-36f8d16e73df@kaod.org>
Date: Fri, 2 Apr 2021 18:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401150325.442125-42-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b6eb02b3-1bb1-4aed-90df-e58c4d7f10b6
X-Ovh-Tracer-Id: 5118622452932381661
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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

On 4/1/21 5:03 PM, Nicholas Piggin wrote:
> Commit f3c18e9342a44 ("KVM: PPC: Book3S HV: Use XICS hypercalls when
> running as a nested hypervisor") added nested HV tests in XICS
> hypercalls, but not all are required.
> 
> * icp_eoi is only called by kvmppc_deliver_irq_passthru which is only
>   called by kvmppc_check_passthru which is only caled by
>   kvmppc_read_one_intr.
> 
> * kvmppc_read_one_intr is only called by kvmppc_read_intr which is only
>   called by the L0 HV rmhandlers code.
> 
> * kvmhv_rm_send_ipi is called by:
>   - kvmhv_interrupt_vcore which is only called by kvmhv_commence_exit
>     which is only called by the L0 HV rmhandlers code.
>   - icp_send_hcore_msg which is only called by icp_rm_set_vcpu_irq.
>   - icp_rm_set_vcpu_irq which is only called by icp_rm_try_update
>   - icp_rm_set_vcpu_irq is not nested HV safe because it writes to
>     LPCR directly without a kvmhv_on_pseries test. Nested handlers
>     should not in general be using the rm handlers.
> 
> The important test seems to be in kvmppc_ipi_thread, which sends the
> virt-mode H_IPI handler kick to use smp_call_function rather than
> msgsnd.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv_builtin.c | 44 +++++-----------------------
>  arch/powerpc/kvm/book3s_hv_rm_xics.c | 15 ----------
>  2 files changed, 8 insertions(+), 51 deletions(-)

So, now, the L1 is not limited to XICS anymore and we can use the XIVE 
native interrupt mode with an L2 using XICS in KVM or XIVE in QEMU.
Is that correct ?   

It seems you removed all the XICS hcalls under kvmhv_on_pseries().

C.

 
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 8d669a0e15f8..259492bb4153 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -199,15 +199,6 @@ void kvmhv_rm_send_ipi(int cpu)
>  	void __iomem *xics_phys;
>  	unsigned long msg = PPC_DBELL_TYPE(PPC_DBELL_SERVER);
>  
> -	/* For a nested hypervisor, use the XICS via hcall */
> -	if (kvmhv_on_pseries()) {
> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -
> -		plpar_hcall_raw(H_IPI, retbuf, get_hard_smp_processor_id(cpu),
> -				IPI_PRIORITY);
> -		return;
> -	}
> -
>  	/* On POWER9 we can use msgsnd for any destination cpu. */
>  	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>  		msg |= get_hard_smp_processor_id(cpu);
> @@ -420,19 +411,12 @@ static long kvmppc_read_one_intr(bool *again)
>  		return 1;
>  
>  	/* Now read the interrupt from the ICP */
> -	if (kvmhv_on_pseries()) {
> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -
> -		rc = plpar_hcall_raw(H_XIRR, retbuf, 0xFF);
> -		xirr = cpu_to_be32(retbuf[0]);
> -	} else {
> -		xics_phys = local_paca->kvm_hstate.xics_phys;
> -		rc = 0;
> -		if (!xics_phys)
> -			rc = opal_int_get_xirr(&xirr, false);
> -		else
> -			xirr = __raw_rm_readl(xics_phys + XICS_XIRR);
> -	}
> +	xics_phys = local_paca->kvm_hstate.xics_phys;
> +	rc = 0;
> +	if (!xics_phys)
> +		rc = opal_int_get_xirr(&xirr, false);
> +	else
> +		xirr = __raw_rm_readl(xics_phys + XICS_XIRR);
>  	if (rc < 0)
>  		return 1;
>  
> @@ -461,13 +445,7 @@ static long kvmppc_read_one_intr(bool *again)
>  	 */
>  	if (xisr == XICS_IPI) {
>  		rc = 0;
> -		if (kvmhv_on_pseries()) {
> -			unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -
> -			plpar_hcall_raw(H_IPI, retbuf,
> -					hard_smp_processor_id(), 0xff);
> -			plpar_hcall_raw(H_EOI, retbuf, h_xirr);
> -		} else if (xics_phys) {
> +		if (xics_phys) {
>  			__raw_rm_writeb(0xff, xics_phys + XICS_MFRR);
>  			__raw_rm_writel(xirr, xics_phys + XICS_XIRR);
>  		} else {
> @@ -493,13 +471,7 @@ static long kvmppc_read_one_intr(bool *again)
>  			/* We raced with the host,
>  			 * we need to resend that IPI, bummer
>  			 */
> -			if (kvmhv_on_pseries()) {
> -				unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -
> -				plpar_hcall_raw(H_IPI, retbuf,
> -						hard_smp_processor_id(),
> -						IPI_PRIORITY);
> -			} else if (xics_phys)
> +			if (xics_phys)
>  				__raw_rm_writeb(IPI_PRIORITY,
>  						xics_phys + XICS_MFRR);
>  			else
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
> index c2c9c733f359..0a11ec88a0ae 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
> @@ -141,13 +141,6 @@ static void icp_rm_set_vcpu_irq(struct kvm_vcpu *vcpu,
>  		return;
>  	}
>  
> -	if (xive_enabled() && kvmhv_on_pseries()) {
> -		/* No XICS access or hypercalls available, too hard */
> -		this_icp->rm_action |= XICS_RM_KICK_VCPU;
> -		this_icp->rm_kick_target = vcpu;
> -		return;
> -	}
> -
>  	/*
>  	 * Check if the core is loaded,
>  	 * if not, find an available host core to post to wake the VCPU,
> @@ -771,14 +764,6 @@ static void icp_eoi(struct irq_chip *c, u32 hwirq, __be32 xirr, bool *again)
>  	void __iomem *xics_phys;
>  	int64_t rc;
>  
> -	if (kvmhv_on_pseries()) {
> -		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -
> -		iosync();
> -		plpar_hcall_raw(H_EOI, retbuf, hwirq);
> -		return;
> -	}
> -
>  	rc = pnv_opal_pci_msi_eoi(c, hwirq);
>  
>  	if (rc)
> 

