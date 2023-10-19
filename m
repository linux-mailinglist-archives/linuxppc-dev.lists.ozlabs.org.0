Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D907CF192
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 09:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SnL9SloN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0Bs3ygYz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 18:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SnL9SloN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB09w5QK3z3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 18:45:07 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4083cd39188so11959105e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 00:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697701501; x=1698306301; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pmXZfNDgHWU97eVG0ao9ZDPxa8/NusQS8x4RuYWhWk=;
        b=SnL9SloNoiYX46m4pk3xvu7h+1A1fakTY5zEZK9XSSOzMBJxSvJtswGKpfkrYMWvN9
         KXpM5lpRFhKxupNcZ9UTYT1USxpz51rdkvwfd1N/xIID44F5y5ZtGapHHbzRXx7wsxKM
         LM9gw7rDsU6aPI456l/wY6uRWl8SefjGOpVtIomtiIdbOsc+zmsbEVTbp8xNcvnO0PLa
         C22BrAgYWntKfcK2/W9WFdb09CkZbTmtj/DGEXayw+l1hEpoN074czq8BN3qpVCLvtzH
         +WaDYKVn2hbs8Mz9OmAP9odkSj8KAJqHSt0FRLrjNMbf4sI0IXSY4oU0pSweEtt4hdAx
         Mxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701501; x=1698306301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pmXZfNDgHWU97eVG0ao9ZDPxa8/NusQS8x4RuYWhWk=;
        b=PE2RiFjTaMMrNjCpiK3HH7CLzvWCUPmdl/0uQ4nmNWn6byU+wXbns2MJ10jX7qcNw6
         9cjVop7qhSAwzpqlrwXYVbviiOMKZ75CcP2dRZ4VPTuzNpozbEoOTIyzKc57EzgYHirB
         A3ECQDcvhUFmyfiyy+Vig/r6tpc1OCZcByD9vre+vLuj6zWE8qnAvYQzjdaZFgR3P7i7
         USHJ3TVs4JaxctEVVVibA2XfbIOySfiLWmTqIDNppCeeyzuiB9MFFs0a74DpmNlHlS7S
         CxlDrgdd1+KTQocYQ5I4IqIegEbTUH+jhWdBQmkSzMTJned2MJKPXdrOn6EV2YvTW0wx
         7YeQ==
X-Gm-Message-State: AOJu0YxgZQvcczzvE3V1r4AiWiuBbl0E7zir0staCRHjjj4bQ1fqkKQm
	LmsWe9fVEuAFP51ZtaiE2w8YpA==
X-Google-Smtp-Source: AGHT+IF7BQxJkgtIKhJz33b7TksgaeCJ/FKlTDLOVy2fY0p9glVw/wOjAaJE92kUJE4r9I59EYQnCA==
X-Received: by 2002:a05:600c:3b95:b0:408:37aa:4766 with SMTP id n21-20020a05600c3b9500b0040837aa4766mr1021340wms.5.1697701501064;
        Thu, 19 Oct 2023 00:45:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c028100b004077219aed5sm3630164wmk.6.2023.10.19.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:45:00 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:44:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 1/8] RISC-V: Add defines for SBI debug console
 extension
Message-ID: <20231019-5e24c756f19e98cd9d3f89bb@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-2-apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 10:45:02AM +0530, Anup Patel wrote:
> We add SBI debug console extension related defines/enum to the
> asm/sbi.h header.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5b4a1bf5f439..12dfda6bb924 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
> +	SBI_EXT_DBCN = 0x4442434E,
>  
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -236,6 +237,12 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>  
> +enum sbi_ext_dbcn_fid {
> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
