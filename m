Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC087D0A5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 10:15:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=M2QH/SY6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBcq01kXyz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 19:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=M2QH/SY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBcp82CsVz3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 19:15:12 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso681476a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 01:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697789708; x=1698394508; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9mLk3QRlIYO5dYhhdXhtQWG8pCu0/EaP/qTEbU6WOs=;
        b=M2QH/SY6EWZCNfLr55xD06d7pC78iU9a2dgNAdIodGkMsCCnd+QOO8Jtl7Xk3nscdA
         f25hHazJSbLp7cKc7EabpXM/tzPy54Fbn8XL3DTVpxeKwOzhToiD3LZq21qQ2mggRK4J
         kwBjxf+FfJN83RSIGcmMXj9nNf82pjMXScBYcJbOr8uhz4aDg/UQayOyTcKLJAQf0oEk
         Nyh4F9avQ9s5LF7+lnchKHgKytiMihH5fYfNIJXNpXvDPHaKICqHlRYDMoP/ArStstXk
         rA8uB1j8P8RPJ0I6mH3m3QUWDY4/XSfC6CACZLGkLyw3q0bb7W+lnxBKMExoY13ZM1VQ
         53fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789708; x=1698394508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9mLk3QRlIYO5dYhhdXhtQWG8pCu0/EaP/qTEbU6WOs=;
        b=Nbk+qcL67xiAFKC8rzGL/qt91pIIsR8dfQc/0EtUitYQPyoaWCC1eidDNhFgV7mPjV
         Q2ayHUYFvx+N42mUvm9uQKB7BsGXlDOLr6yX5ylDGTBZ05mQGfJIdcbPFFqTEOXCN0tE
         Lmg6hiX14zbUB+SFaA8JtK5jbfeeJFuJOzWnbzwRz506TbgGt+12Jk4rHF/+Ag9TH2J5
         mbKjpLukw4eCt0RqB4PCLNISPzP+FhnnU6Q0gy0q9bsBxjI/CrSIFnY07xlNMj/E2ITM
         R7si8g3dmDikyr9/WtV/mYWwDwuw2nrVx57kigbLlnINkBjgNxswyaUCmzYkYjGwVj1b
         VAQQ==
X-Gm-Message-State: AOJu0Yx3MmdT+luguCow54FV0ndtrLDxuwPRs7iFy6HEGgbv6X4iufoQ
	GSXR+zXsnigns6Sctk0andHTCQ==
X-Google-Smtp-Source: AGHT+IFxDBdUK0jjgrdu/5lSvIddhM3Qd3L9VVDVSECPo1+jfo3eLrczA0b0wVyjpO8bPpxHApIM6Q==
X-Received: by 2002:a17:906:ef0e:b0:9b2:bb02:a543 with SMTP id f14-20020a170906ef0e00b009b2bb02a543mr922414ejs.74.1697789707967;
        Fri, 20 Oct 2023 01:15:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906261900b0099cc36c4681sm994192ejc.157.2023.10.20.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:15:07 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:15:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 5/9] KVM: riscv: selftests: Add SBI DBCN extension to
 get-reg-list test
Message-ID: <20231020-825e5e2e7d355330a93f1194@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-6-apatel@ventanamicro.com>
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

On Fri, Oct 20, 2023 at 12:51:36PM +0530, Anup Patel wrote:
> We have a new SBI debug console (DBCN) extension supported by in-kernel
> KVM so let us add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 234006d035c9..6bedaea95395 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -394,6 +394,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
> @@ -567,6 +568,7 @@ static __u64 base_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
>  };
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
