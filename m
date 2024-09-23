Return-Path: <linuxppc-dev+bounces-1535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE43983A69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 01:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCHfT0pRFz2xYw;
	Tue, 24 Sep 2024 08:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727096258;
	cv=none; b=VjKjZszYXpt6OiK86TeWRLaKJAqV2nWcqOVm0TUUNjtqymT70Fl+ourQnhkW0fnzohd8zlBTZF97qnsv/p0Tp7HljAFC1otO95vsok/gifo2rpPdS206yoaTHFm3F1H7yXvvGtSFRaI8I4OPPpDKWHxuDkBtN04k/tbLZRXb1v4rnKQmKQiqljUjmSd4g/0Z1r/38DEWWE0V+ToFG2YQJ9OrgVUcAb6r7uHhDCPHiPdYMUmFexruS7qk99p2vCCDoqK/IGdrIG1kbZ5bEGaWChEdij9rvWjGj5T+ONIoIw9WV2yqY1p2Y7ZeFnBTTL1ZEeTIg3hnH1QwsDZoJZ9E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727096258; c=relaxed/relaxed;
	bh=MqL+b1FAcrvUWqURWulPmdkzJdVjg5DPzosrsko/fRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5gvL/eNvYZG4HvDOaMgazSpukUqxAtQscJvGokMAkGSvH+nmf/nD91aBG5UdEftwxi1iMUKbjcEFNmHtzhMa7k//fzr90DbQGMH3SVOOuAYYPa8HnWCOXmRDJg3taw14BItTxXyKCUaH40nSQG8mcC1ESXTjaE2BxUDSKV3i1VfIWg/II2BXg73HB6igb1KiLy7Q7gdvpzY1phIcVrje61wqdpF7dTedmYDhsUi44xn7I6vNs1X6vnG8g2S6jI+fR46Ubccn5kYT5laUXu9fxTUmQxehtpAR1AeQMTwGSiwcHeCDQ9bq7iTyAkGkJNtWJkQ/8Nug9liSQ02A87ePA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FenY2xxi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FenY2xxi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC31Y5ffpz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 22:57:36 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d885019558so2758967a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727096251; x=1727701051; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqL+b1FAcrvUWqURWulPmdkzJdVjg5DPzosrsko/fRk=;
        b=FenY2xxi0EnZSye+vARNmovJ2UdNMerJFS2XXxUmC8O2vXY/xBwri8KAWvu+plH2yh
         Ok4/YRXgLFloOAnpXkBDVdFIZ1XrU6JUp8+6v193ohgTeeFc9zbdySMkQ7ZsRyFqEiC3
         XHXoDvHWb2wq5YKeI95DV5zqBttLpzBN/NB7ltkgANjUO68gC2KU7jqbODFavJ8SKJh1
         KOkN5syhFq37FxRdCDYTXiDf+Wn2vs0LaHctV8ujw9VzgyAkA5NDZEM6NizMVolWWx/K
         kHFvZTAm8SPFLIchq+B9+2XWuOX3xCGBsLkpODnD59KeoE1JDFEFNhODUHW79f2hgs0s
         Qlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727096251; x=1727701051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqL+b1FAcrvUWqURWulPmdkzJdVjg5DPzosrsko/fRk=;
        b=vXdQ9cA+rWS5Bmp+h84hC65shSWkFlPeh8cjqZCDoP4oOSmQT8m/GbAWkdljwSftME
         IP2jMmAYf7M2jeDD0ah950nFokF4Z2ClA3gN8wNZ2igfZS5Phu0rpSXcjqsq2uV8bAjm
         jOpzEHRLrpVMrFw1Jpt22D+4bM1WVL6xElNrjwKASWWZloGqCgN7TlcpoYbybQsDWW2F
         AyFDc77Ba9mJ/2IwY/FSHoodycOWgxBG3eI50GM0tpH0Tjq3NDg6DolR2mnlAnOvFbaL
         cWlUObpgyRh67z08Cm25E4mSwgIwKuOkLNcWNMMstMce/YE8lp3QYojjFB1/aKgKbsxg
         OPHA==
X-Gm-Message-State: AOJu0Yy4qmwuOHhkbBuU97BzotRzCDs/xXU5damEIcx9miOsAwfVrGOi
	VSrRJwiOR97BfBwJ3iBpFdte264OxYtbt+NJagugtP21SDUeH7EA
X-Google-Smtp-Source: AGHT+IEV/bw2rQotOm5i6ahVAaEb6Gjhc+RLQd1rT1eTdwlbMtsSETLnKOeMvwOJoMo79T1SEG/wMw==
X-Received: by 2002:a17:90a:68c3:b0:2d8:8c82:10a with SMTP id 98e67ed59e1d1-2dd80c465f4mr15200818a91.5.1727096251368;
        Mon, 23 Sep 2024 05:57:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ef9858fsm9372570a91.52.2024.09.23.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 05:57:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 23 Sep 2024 05:57:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	linux-kernel@vger.kernel.org, mahesh@linux.ibm.com,
	oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com,
	sbhat@linux.ibm.com
Subject: Re: [PATCH v3] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Message-ID: <c474f56f-af74-479d-9db6-fbbfdb287604@roeck-us.net>
References: <20240909140220.529333-1-nnmlinux@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909140220.529333-1-nnmlinux@linux.ibm.com>

Hi,

On Mon, Sep 09, 2024 at 09:02:20AM -0500, Narayana Murty N wrote:
> VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
> due to missing implementation of err_inject eeh_ops for pseries.
> This patch implements pseries_eeh_err_inject in eeh_ops/pseries
> eeh_ops. Implements support for injecting MMIO load/store error
> for testing from user space.
> 
> The check on PCI error type (bus type) code is moved to platform
> code, since the eeh_pe_inject_err can be allowed to more error
> types depending on platform requirement. Removal of the check for
> 'type' in eeh_pe_inject_err() doesn't impact PowerNV as
> pnv_eeh_err_inject() already has an equivalent check in place.
> 
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> 
> ---
>  arch/powerpc/include/asm/eeh.h               |  2 +-
>  arch/powerpc/kernel/eeh.c                    |  9 +++--
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
>  3 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 91a9fd53254f..317b12fc1fe4 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
>  int eeh_pe_configure(struct eeh_pe *pe);
>  int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>  		      unsigned long addr, unsigned long mask);
> -
> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
>  /**
>   * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
>   *
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index d03f17987fca..49ab11a287a3 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>  	if (!eeh_ops || !eeh_ops->err_inject)
>  		return -ENOENT;
>  
> -	/* Check on PCI error type */
> -	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
> -		return -EINVAL;
> -
>  	/* Check on PCI error function */
>  	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
>  		return -EINVAL;
> @@ -1851,6 +1847,11 @@ static const struct file_operations eeh_dev_break_fops = {
>  	.read   = eeh_debugfs_dev_usage,
>  };
>  
> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
> +{
> +	return eeh_debugfs_break_device(pdev);
> +}
> +

The new function, as the context suggests, is only compiled if CONFIG_DEBUG_FS=y.
However, it is called unconditionally. With CONFIG_DEBUG_FS=n, this results in

powerpc64-linux-ld: arch/powerpc/platforms/pseries/eeh_pseries.o: in function `pseries_eeh_err_inject':
/opt/buildbot/slave/qemu-ppc64/build/arch/powerpc/platforms/pseries/eeh_pseries.c:814:(.text+0x554): undefined reference to `eeh_pe_inject_mmio_error'
make[3]: *** [/opt/buildbot/slave/qemu-ppc64/build/scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[2]: *** [/opt/buildbot/slave/qemu-ppc64/build/Makefile:1157: vmlinux] Error 2

I'll enable CONFIG_DEBUG_FS in my tests and won't report this further,
but you might want to consider fixing the problem at some point.

Guenter

