Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C97CF1F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 10:04:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=KvIIaMYc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0cM2tpcz3vZK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 19:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=KvIIaMYc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB0bW085Wz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 19:03:49 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso3870947f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 01:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697702626; x=1698307426; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PH3CTrts87/bU27l3EN5JAWxWDeGWRQ9EMGON+8aZg4=;
        b=KvIIaMYcqziiME+IZLIlymZfRpmHsyyHE/5ADtHqkvGsaZ4g3AgQySbZYdTzJGg58o
         2edGb5A+4yMo2uO4HJVS9S/M/GyG1ELzfzO33e6O8o/oWPCbIMGnspVA+LPWlFjjkqw0
         1P0PMRzSqoloO7XropYinGVzuvCAAm/C8Yabmt29hZBtRdAkSZ8LsuuhS8rjEEha50Xh
         gkg7p0GZ3B5qsMq3duhP/9BP9VpeXE9kNnafV30sxWywEixTwskgnJ7CMX/hrIKPISBi
         4SP5NtEt8hmhKzJoXItaGpO0Q20nIvIo+lGXHsan4G9zV6su1DLHeZpNukeD/Hv2USDD
         wlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702626; x=1698307426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PH3CTrts87/bU27l3EN5JAWxWDeGWRQ9EMGON+8aZg4=;
        b=IWH9IgIpyeMt+nK3sTFh5eKy3AdpOJEAh2qNR+SIclOLf/NeeNFFvJF9exM+jUnNOP
         GDN6w7j9fhg4xRBUR4sjkJ0EpqxclZmdbHI6G6eU8UcFRO2VFT3bNI5rGuUT/oV6Ihv+
         VDDprMeAHiGcXJ8qCHly4pw7NqtdjLcZxcVd9E7HmBsydzAXG1CCPaQS6erTcbO6o7eR
         7RGvHFUVggKkeTdAIezH/aMvgB439VnZABt9Ge4dyTpO+PlFTjqAXyxq4Hyq8/E/j156
         gQ37gBMWeTKLDVFPMdHNUrvgesAY5yMfJImvcK+QUqVW2IGGc8y6zJcZw3SbUTHtc33v
         x4eA==
X-Gm-Message-State: AOJu0YxlNMFNUZ4sPy8Yh7YEBpAz11PQHxExamRfwRBQZ6r/Ey0Ndkrl
	cYdaBjSEF6J7yfXY2o/L+UkJdA==
X-Google-Smtp-Source: AGHT+IHYgrLP95m19T8VV4j4IIENiIUl+y5B0n5FUWHPqZ/oM3kMO8SamCcDgZ0NeNrUiRnd8JBlpA==
X-Received: by 2002:a05:6000:11c9:b0:31f:b120:143 with SMTP id i9-20020a05600011c900b0031fb1200143mr887639wrx.59.1697702625844;
        Thu, 19 Oct 2023 01:03:45 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c12-20020adfe70c000000b0031c6e1ea4c7sm3818471wrm.90.2023.10.19.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:03:45 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:03:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 5/8] RISC-V: Add inline version of
 sbi_console_putchar/getchar() functions
Message-ID: <20231019-61b3653a98a1c021623b091e@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-6-apatel@ventanamicro.com>
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

On Thu, Oct 12, 2023 at 10:45:06AM +0530, Anup Patel wrote:
> The functions sbi_console_putchar() and sbi_console_getchar() are
> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> inline version of these functions to avoid "#ifdef" on user side.

nit: Here and in the summary I'd probably use the word "stub" instead of
"inline version".

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 12dfda6bb924..cbcefa344417 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +#else
> +static inline void sbi_console_putchar(int ch) { }
> +static inline int sbi_console_getchar(void) { return -1; }
> +#endif
>  long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
