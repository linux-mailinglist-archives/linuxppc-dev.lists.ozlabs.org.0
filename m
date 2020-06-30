Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A520EB00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:39:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wn8w13jfzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tIWvWILl; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wn7G31kczDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:38:18 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id g20so14455912edm.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93WBccPUu2ioEuQh2U0k1LEPpKIIzjUs7yzbc4BAlR0=;
 b=tIWvWILltP5OLWO1yEnYuelKoTVtBMt15QHCaV9NsTuEhz/McXz8h0EYx4YkES3ec+
 DvrcwCBGoiFSJwjLCNVGaVAv0V3CwnNLqQrLzS0giZSkTL+KMSzCrpNy2jD7HMFtjj16
 czDIQESEy50oLl2RJf3bNhMhpQ9ZYHGiawo42NNDG+yMBYqAVmyUayCAqC2ofqf+dsWJ
 pesGY44iqJV+Uk6u2Qvx5iW7RndA/++6fd0zNNe/L1M0eumPNWcGoTdI6th0yosd1ANQ
 UUcANoJ/jX4zRtPvdTdH1KjXEdEYHPW5Y+dWdsmfCE0qLzroE7yzEhpAUnjzXdQ14hDv
 lFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93WBccPUu2ioEuQh2U0k1LEPpKIIzjUs7yzbc4BAlR0=;
 b=hybCo/xziZ4OYcrSx7hFc8v+aF0VTPfDJMwhMr+H7gWiE4SSPv3yT0WISMkf4LMJxa
 60e7th8JLPs7DnT+vWj3E0URqfHv8SwV09xXcQWtVcORv/zecZzMDxi5hVxJgqblCd8T
 EuY761D6aO124WEcNVy8AWHmlZ8wJaOsN1G6n+Vin0jDl1Nq9MyK5OHhZt7bKSzMBJuW
 wfjWXrKeePzzfFaHexDxGkYeGFcahiE/N6KRLqPxBfTbuBUitoPemxC3bGIjRA0FFni+
 ZVXg6qS2Kd9AVbGstFmXYIdeIfeF4bI2W4FpHk5Jtb5e5XtJ+X7XRFwIZopsW0i8ndIH
 OAnA==
X-Gm-Message-State: AOAM532VrsFgGkjN/CmCRBTqTguW/+s/MrjXwHdcM/GY64FUm2PWKhy1
 fEMvPdtvkAA6jecRoBwVF0A/wE5c2vyE4xO02Aa5dQ==
X-Google-Smtp-Source: ABdhPJz3PGEadKCW+KfEBrrRxT0/x9Ul9Ee6SKWlBeVrAe8PQ6lTxFMyy6xXUea7GIsBQT2aTJQ7eBLlC3PyeYQNFqY=
X-Received: by 2002:a05:6402:21c2:: with SMTP id
 bi2mr20337739edb.296.1593481093994; 
 Mon, 29 Jun 2020 18:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-6-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200629135722.73558-6-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Jun 2020 18:38:03 -0700
Message-ID: <CAPcyv4hFfU0r0GmCgV-wKXq+H=GDV-OPsGNPWmFijrdWm58X_A@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] powerpc/pmem/of_pmem: Update of_pmem to use the
 new barrier instruction.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 6:58 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> of_pmem on POWER10 can now use phwsync instead of hwsync to ensure
> all previous writes are architecturally visible for the platform
> buffer flush.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cacheflush.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> index 54764c6e922d..95782f77d768 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -98,6 +98,13 @@ static inline void invalidate_dcache_range(unsigned long start,
>         mb();   /* sync */
>  }
>
> +#define arch_pmem_flush_barrier arch_pmem_flush_barrier
> +static inline void  arch_pmem_flush_barrier(void)
> +{
> +       if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +               asm volatile(PPC_PHWSYNC ::: "memory");

Shouldn't this fallback to a compatible store-fence in an else statement?
