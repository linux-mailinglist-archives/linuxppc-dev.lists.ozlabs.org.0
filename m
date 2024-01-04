Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAC8245AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 17:03:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q4PD0cGd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5WbH2kW5z3cZq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 03:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q4PD0cGd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5WZN4vYKz3bpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jan 2024 03:02:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=azJ/J7vywXkqTQ9Hi2IirR6RPgqAfj1yxhz8MRLS2x0=; b=q4PD0cGdukmiPEaNlMlJWJF+pT
	ZXVvbKF0lx8N6RKDbdA3XnJFCH57UNSdhZ/kO8Iz0hoRFVNagfGq3512N2nRWB7DjAXdStXkQIQWA
	ncOA4AZhdNj8GPB/A2qakkDxKh6kd0iDbs6UmdffT9uSFK6jyOMkzXooC/E6xuAvuKKbe7Rp3CQTz
	J1I841KAHRyzTq2XKmovhgML0YXdz5QY3zZHBV6z1JGo68+qVuCERlZ6TC/jEWjXTKRPozGsTHkOr
	2gLYqGCPigeu8LwNiVrx9UwGlVUWFnDhAyslZYKq4eBvBb5hXDvGsvbI1KfC4At7taj8HX1V2qE8x
	5swElK2g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQAp-00EbY6-1D;
	Thu, 04 Jan 2024 16:02:23 +0000
Message-ID: <41cdcf9d-d726-4f4f-9616-d67e68a535cb@infradead.org>
Date: Thu, 4 Jan 2024 08:02:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20240104123727.76987-2-ajones@ventanamicro.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240104123727.76987-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, alex@ghiti.fr, anup@brainfault.org, paul.walmsley@sifive.com, npiggin@gmail.com, palmer@dabbelt.com, atishp@atishpatra.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/4/24 04:37, Andrew Jones wrote:
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
> 
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
> 
> v2:
>  - Added Fixes tag and -fixes prefix [Alexandre/Anup]
> 
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_KVM
>  	# https://github.com/ClangBuiltLinux/linux/issues/1881
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>  	select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on HAVE_KVM && RISCV_SBI && MMU
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI

-- 
#Randy
