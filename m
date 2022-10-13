Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB615FDDBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpDf62Hgpz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:56:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KD3n8nzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KD3n8nzh;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpDd84bzCz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:55:39 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so2272924pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Px8/xmLY8CGSJtQzpAEdJQOXhj85fp/+jIIt4DaUo6s=;
        b=KD3n8nzhYrjUxhl1lH3AYpw2Eo4tAf9BtVs+noo6wAbBR11QeyRjioC1Pua4rb/gzs
         QWvKuk6WW44ij0g3ZAuePoVL5neuPpDtZUbw4Tkp1pqI52ST22bjKxelt6eVaj0e32wn
         VND5WpVnoLmeF0xok1R+lAGwVbODhm6UqIKEySJNJb5NTxJXn2w58SyYWfdiTKZD/Z8J
         810QKuCzseltt815yDPPGIqAY6D5zQACN09dKKTmPtF1Ec37RRujzmETFBZtVor3xSww
         CeD0/E2AK0DlqQyuSrOoGlIpssVD5tzvu6oun7s/jSOzbCCnrMDcgzOY4J0BSkr0Gh9u
         nt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Px8/xmLY8CGSJtQzpAEdJQOXhj85fp/+jIIt4DaUo6s=;
        b=q02ZI2E2zTpmH+Gp4hGjtAEpKC8ETFEI0teM03Zwicn6FgpKe8CCuhHFOWVg8UFyab
         /AghjbCdS8cPIj2mlkJQh7s2pDs6yeUcvNdCiVCv2naSvUh2vjq5QWhPoyA39AlS99+8
         mG3IhbA/eXsgQjWPpg1rO43NIo2gQIZ/M9bYIhCIQdiA7CccEPMpbXzU6Ye9fmF/coAR
         Z24raJKS+u7IRi+kq9gXq2Swe3ev9LOo/8QZvvOxXODxY+mRew5TyTTlOx5IBNOAsMgT
         M9+Sv85hf8WGyF9YoF4lLAIkE+haSsEREPt8vw8BmWRESySxYuQ5ULgbEPDcXS5Ay7T4
         SnBQ==
X-Gm-Message-State: ACrzQf1bi+S4kl01wJhlKiWvir4PT+jcGXL2LgxFFt5dTFHtxOA1rLhO
	OmQ8lQR9rvM4Lzvi7bgtBpgy+wSVBD8=
X-Google-Smtp-Source: AMsMyM4ccJtMjr8tL1h4r/58kOFV26b7ay6BQrI3ABMawpIYPaCgGKwkXJzYU4iF+9q+tRagDFxCFA==
X-Received: by 2002:a17:903:283:b0:17f:7596:e328 with SMTP id j3-20020a170903028300b0017f7596e328mr552209plr.56.1665676536506;
        Thu, 13 Oct 2022 08:55:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9-20020a056a00008900b005618189b0ffsm2157772pfj.104.2022.10.13.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:55:35 -0700 (PDT)
Date: Thu, 13 Oct 2022 08:55:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix CONFIG_DTL=n build
Message-ID: <20221013155533.GA731882@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Guenter

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
> -- 
> 2.37.2
> 
