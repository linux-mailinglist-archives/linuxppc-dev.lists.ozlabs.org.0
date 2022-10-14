Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E595FF2B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 19:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpt693vjXz3dqS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 04:04:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iW0gTTo3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iW0gTTo3;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpt5C6sLYz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 04:03:41 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id b2so5294298plc.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/u+BcJsQz5UUHqlBb7z/S4bVApOvzlbOmzGSb27Ae0Y=;
        b=iW0gTTo31iODL+4G48rpqSkIFmfx2NBDiDJmYA+ed0XQxkAq48SjG3EL9fW1F69kax
         UoYV7DcZrH7bG7qIsb6KTqSE6TJJdAbycfnkeiQ7dIvbQeEPHaIrtrq9AEPz/ItfGxbE
         u5bclBbYtpXnJulyVzF4LwvSCfYzL0vLDPjOlD6GwAY2rV7Oq3vq1TvXJKgNJOOUCnTY
         D1wrh+I8h+7v+FCLNmvBek5bILVoKp7TWLDMRZizYogZ9zIWGblxgs+Jjd75WNp5yOV8
         J9jDpy0qhwlle53vq8PN3xSThenPxPJI/qHm2YfcyjuDZYioqeHiHzIS/QlCviw2LLD6
         NavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u+BcJsQz5UUHqlBb7z/S4bVApOvzlbOmzGSb27Ae0Y=;
        b=QcRiKrhilu4Soe4fhqD1KG38aIqbK/RTJEflovdmMHGFwQHepl0qWczgFenChuRRzM
         Geo2m/1ZZjdfM0YRVJ4nNrib14thlFt0sDv25WnVDPbdNN5e675ncvC2TBOl1pFRllTU
         1DJWlbjn1Fh43Mc5nfsldxBNpKUtJ5R9b8GiwzTed3/Gkyydrt72QjYkVSrHd0xZWcCQ
         7t1MfOMG2OpjKtewTTXaugQyoiZsiXEMUY2k7X3n8gwjhxSSA6fIZeTEWBSfhzDHtbKr
         vlBU62KLo3AvKJSPYDHi6PO4H/cgJ2vvFvqQjtf1aELdFp+rCVKCUak6HRs6wDD7RQZS
         fQTA==
X-Gm-Message-State: ACrzQf1oJ3Z4s1Ru4asr/afBqT3/nsPzJkxAAsUaf2L6tdFxgHtMunMm
	RtWpgOLUMoVGcaK59OmVdw4=
X-Google-Smtp-Source: AMsMyM6EkdAt1ek+JJl/wqF0uzvNbziOOwPqouOzRQ7k1ORMzIRdOjA2+cMiRo/iow2hglPQ78AprQ==
X-Received: by 2002:a17:90a:dc05:b0:20a:d73b:53a3 with SMTP id i5-20020a17090adc0500b0020ad73b53a3mr6996329pjv.67.1665767017088;
        Fri, 14 Oct 2022 10:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b0017f205d91d9sm1988584plh.118.2022.10.14.10.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:03:36 -0700 (PDT)
Date: Fri, 14 Oct 2022 10:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix CONFIG_DTL=n build
Message-ID: <20221014170335.GA380083@roeck-us.net>
References: <20221013073131.1485742-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013073131.1485742-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 05:31:31PM +1000, Nicholas Piggin wrote:
> The recently moved dtl code must be compiled-in if
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y even if CONFIG_DTL=n.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 6ba5aa541aaa0 ("powerpc/pseries: Move dtl scanning and steal time accounting to pseries platform")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/platforms/pseries/Makefile |   3 +-
>  arch/powerpc/platforms/pseries/dtl.c    | 151 +++++++++++++-----------
>  2 files changed, 80 insertions(+), 74 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 14e143b946a3..92310202bdd7 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -7,7 +7,7 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
>  			   setup.o iommu.o event_sources.o ras.o \
>  			   firmware.o power.o dlpar.o mobility.o rng.o \
>  			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> -			   papr_platform_attributes.o
> +			   papr_platform_attributes.o dtl.o
>  obj-$(CONFIG_SMP)	+= smp.o
>  obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
>  obj-$(CONFIG_PSERIES_ENERGY)	+= pseries_energy.o
> @@ -19,7 +19,6 @@ obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
>  obj-$(CONFIG_HVCS)		+= hvcserver.o
>  obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
>  obj-$(CONFIG_CMM)		+= cmm.o
> -obj-$(CONFIG_DTL)		+= dtl.o
>  obj-$(CONFIG_IO_EVENT_IRQ)	+= io_event_irq.o
>  obj-$(CONFIG_LPARCFG)		+= lparcfg.o
>  obj-$(CONFIG_IBMVIO)		+= vio.o
> diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
> index 1b1977bc78e7..3f1cdccebc9c 100644
> --- a/arch/powerpc/platforms/pseries/dtl.c
> +++ b/arch/powerpc/platforms/pseries/dtl.c
> @@ -18,6 +18,7 @@
>  #include <asm/plpar_wrappers.h>
>  #include <asm/machdep.h>
>  
> +#ifdef CONFIG_DTL
>  struct dtl {
>  	struct dtl_entry	*buf;
>  	int			cpu;
> @@ -57,78 +58,6 @@ static DEFINE_PER_CPU(struct dtl_ring, dtl_rings);
>  
>  static atomic_t dtl_count;
>  
> -/*
> - * Scan the dispatch trace log and count up the stolen time.
> - * Should be called with interrupts disabled.
> - */
> -static notrace u64 scan_dispatch_log(u64 stop_tb)
> -{
> -	u64 i = local_paca->dtl_ridx;
> -	struct dtl_entry *dtl = local_paca->dtl_curr;
> -	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
> -	struct lppaca *vpa = local_paca->lppaca_ptr;
> -	u64 tb_delta;
> -	u64 stolen = 0;
> -	u64 dtb;
> -
> -	if (!dtl)
> -		return 0;
> -
> -	if (i == be64_to_cpu(vpa->dtl_idx))
> -		return 0;
> -	while (i < be64_to_cpu(vpa->dtl_idx)) {
> -		dtb = be64_to_cpu(dtl->timebase);
> -		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
> -			be32_to_cpu(dtl->ready_to_enqueue_time);
> -		barrier();
> -		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
> -			/* buffer has overflowed */
> -			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
> -			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
> -			continue;
> -		}
> -		if (dtb > stop_tb)
> -			break;
> -		if (dtl_consumer)
> -			dtl_consumer(dtl, i);
> -		stolen += tb_delta;
> -		++i;
> -		++dtl;
> -		if (dtl == dtl_end)
> -			dtl = local_paca->dispatch_log;
> -	}
> -	local_paca->dtl_ridx = i;
> -	local_paca->dtl_curr = dtl;
> -	return stolen;
> -}
> -
> -/*
> - * Accumulate stolen time by scanning the dispatch trace log.
> - * Called on entry from user mode.
> - */
> -void notrace pseries_accumulate_stolen_time(void)
> -{
> -	u64 sst, ust;
> -	struct cpu_accounting_data *acct = &local_paca->accounting;
> -
> -	sst = scan_dispatch_log(acct->starttime_user);
> -	ust = scan_dispatch_log(acct->starttime);
> -	acct->stime -= sst;
> -	acct->utime -= ust;
> -	acct->steal_time += ust + sst;
> -}
> -
> -u64 pseries_calculate_stolen_time(u64 stop_tb)
> -{
> -	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
> -		return 0;
> -
> -	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
> -		return scan_dispatch_log(stop_tb);
> -
> -	return 0;
> -}
> -
>  /*
>   * The cpu accounting code controls the DTL ring buffer, and we get
>   * given entries as they are processed.
> @@ -436,3 +365,81 @@ static int dtl_init(void)
>  	return 0;
>  }
>  machine_arch_initcall(pseries, dtl_init);
> +#endif /* CONFIG_DTL */
> +
> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> +/*
> + * Scan the dispatch trace log and count up the stolen time.
> + * Should be called with interrupts disabled.
> + */
> +static notrace u64 scan_dispatch_log(u64 stop_tb)
> +{
> +	u64 i = local_paca->dtl_ridx;
> +	struct dtl_entry *dtl = local_paca->dtl_curr;
> +	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
> +	struct lppaca *vpa = local_paca->lppaca_ptr;
> +	u64 tb_delta;
> +	u64 stolen = 0;
> +	u64 dtb;
> +
> +	if (!dtl)
> +		return 0;
> +
> +	if (i == be64_to_cpu(vpa->dtl_idx))
> +		return 0;
> +	while (i < be64_to_cpu(vpa->dtl_idx)) {
> +		dtb = be64_to_cpu(dtl->timebase);
> +		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
> +			be32_to_cpu(dtl->ready_to_enqueue_time);
> +		barrier();
> +		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
> +			/* buffer has overflowed */
> +			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
> +			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
> +			continue;
> +		}
> +		if (dtb > stop_tb)
> +			break;
> +#ifdef CONFIG_DTL
> +		if (dtl_consumer)
> +			dtl_consumer(dtl, i);
> +#endif
> +		stolen += tb_delta;
> +		++i;
> +		++dtl;
> +		if (dtl == dtl_end)
> +			dtl = local_paca->dispatch_log;
> +	}
> +	local_paca->dtl_ridx = i;
> +	local_paca->dtl_curr = dtl;
> +	return stolen;
> +}
> +
> +/*
> + * Accumulate stolen time by scanning the dispatch trace log.
> + * Called on entry from user mode.
> + */
> +void notrace pseries_accumulate_stolen_time(void)
> +{
> +	u64 sst, ust;
> +	struct cpu_accounting_data *acct = &local_paca->accounting;
> +
> +	sst = scan_dispatch_log(acct->starttime_user);
> +	ust = scan_dispatch_log(acct->starttime);
> +	acct->stime -= sst;
> +	acct->utime -= ust;
> +	acct->steal_time += ust + sst;
> +}
> +
> +u64 pseries_calculate_stolen_time(u64 stop_tb)
> +{
> +	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
> +		return 0;
> +
> +	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
> +		return scan_dispatch_log(stop_tb);
> +
> +	return 0;
> +}
> +
> +#endif
