Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44920EB1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:54:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wnTm3GhqzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:54:20 +1000 (AEST)
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
 header.s=20150623 header.b=ohq8OaI0; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wnS110CBzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:52:48 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id d15so14690969edm.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSu0Ell6P0MrB/9DAeZ/V2BO5gb+7FgIDWCLlMlaRYs=;
 b=ohq8OaI0k2AvszzjZB4BBqCWu+OfyYpDsZhWDlOEvIfKLBxTpuNAs3yIo6dwUSDjCz
 drPEeQf/qaDJSd9w3sQJndOcce3Yp0tBgA7DOvHIme/mb0yw8pbcDlilpq/OIZaRJCs4
 fqYYSneC3SuUKToqogPMSJg0BZLa2vY/47ULwen6yESRrXbgcIXdhUsRghofEv18JWJ2
 wBToktCV1X8nNUmMm9sjvYW9s3oYKGNSvJHt7R63lE79gRYmgC8WvAQnRBhX1N8xp/1h
 84jQ4TleWhRVZOaiXBMN81mNw4hTanSrK3X4QByY760QchmuwKBm3/ERzFEwHpxMkPWw
 NcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSu0Ell6P0MrB/9DAeZ/V2BO5gb+7FgIDWCLlMlaRYs=;
 b=YaXPSWq9CrKaaqbWoWydsxUTfEsN9oQ5YA5DeTbyvru2dizCpETKtPcsjY5GXGyOra
 KiNqoKMlTl5Uq5YNsJgkIbjwSiHGlnloR7PiwWd6X9w9iv+zLlojrLGXaiEHDuNo7O2Y
 Svj/5ilc3cIkk3r0gm8MZ+1+KGQ7gkH/dPSIkCVJDiGi4AhOVidh9pUQuKdtVHDkxMIj
 ua9LNAhCG7g/xSrrnROhkb4QhGhEYSLEJMgKZzsLASZrZRIBvRm+Yq4GbOfypnxWLcQg
 f2qjf+jgp1UpioF+XU+efWWk8Oi3DHaYmRZG3LHZPyio5hhin3iI1hnSIx3IutF2wvvN
 yqKg==
X-Gm-Message-State: AOAM530kEIiEnmtBs7kRV9T6VC3ePQs+JBu5JuPr8wBFnshcYrr+2lgM
 woUA7KKq0SNiSM+/vpQxxa4+MsNc+cfrHbgbfPrtxw==
X-Google-Smtp-Source: ABdhPJxTK5XbT/DoIEjaMHdgVN+m2sGq+xniwDyaWvWCE6GNjQRyUH9oHCWmF4Dkteb1EWY4bbVaEaxayjiZqufomLo=
X-Received: by 2002:aa7:c24d:: with SMTP id y13mr21541325edo.123.1593481965462; 
 Mon, 29 Jun 2020 18:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-8-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200629135722.73558-8-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Jun 2020 18:52:34 -0700
Message-ID: <CAPcyv4giMdgjNVudw1q7p-UpyLMTHTqTad=2Ks8ATNo==edKvQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] powerpc/pmem: Add WARN_ONCE to catch the wrong
 usage of pmem flush functions.
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
> We only support persistent memory on P8 and above. This is enforced by the
> firmware and further checked on virtualzied platform during platform init.
> Add WARN_ONCE in pmem flush routines to catch the wrong usage of these.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cacheflush.h | 2 ++
>  arch/powerpc/lib/pmem.c               | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> index 95782f77d768..1ab0fa660497 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -103,6 +103,8 @@ static inline void  arch_pmem_flush_barrier(void)
>  {
>         if (cpu_has_feature(CPU_FTR_ARCH_207S))
>                 asm volatile(PPC_PHWSYNC ::: "memory");
> +       else
> +               WARN_ONCE(1, "Using pmem flush on older hardware.");

This seems too late to be making this determination. I'd expect the
driver to fail to successfully bind default if this constraint is not
met.
