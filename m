Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F787CF19C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 09:46:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=YwXRLKLk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0Cz3DTSz3vYN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 18:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=YwXRLKLk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB0C363Hyz3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 18:46:07 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32dc918d454so1777203f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 00:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697701564; x=1698306364; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeyvUx1rVja27wirLq4XcNrRcR3eqmAH3gyz1hpKoZo=;
        b=YwXRLKLkHKJR6lkhAW4qSdE/LTuHw0DagpD4pL2yneoOiMysR0yfv5vtuYbaHdncE9
         mE5TlpPy5DmunJ23zY4paeUcnoT7+0EaNDaLcXNv8GaO3TUNE/ew7TVhdZUFHa+a3gKa
         JNJUM75p+jRJV5aSvODltVAOev6fShNC6J6YbGnMrKahHn+Glsiwr+Q9ygPh5hCh596h
         2wgdInahu3Pg3f1YsxQVVzgG9GSwLGbmEVOu+AhMnXWF4oRYvXMwvESkcj4dUEJfbfl7
         VNlAvJ8gb7rQv/rpb1jZ2jtLNVpSZW0VXHEAPl7qFwTSUuGLxlFQcQF8wR1lwbsCvzAw
         pk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701564; x=1698306364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeyvUx1rVja27wirLq4XcNrRcR3eqmAH3gyz1hpKoZo=;
        b=TNitX5JEqjajB0mKJSv+LIXSrUdmC+9+CiUGDh5y+AaEh0i5VnjRCYUuki/jwQNK+y
         4fDJ+LSDM/tfq1AdLi99ZcMwQ0axHMuKmgQalTcIQohfJ/TlIsG0I2YV93UNxszR24ZK
         k6YMVG2gsoliRhmIYWm32bwvU9AzqmRR5lyNJOEcGu5IwBkW4secArbxktN4FFLK2Uzf
         a98OvxrSny/oSzr9bKXeXbVxBVE0/th0OF2NluHpr58JZhdYorPGtwjDZlsJASjfZTkg
         vzemf9b29ilsdw6N40cNAAfnzm8wwGqwjquc8jX5d7te/6reNYTY6dLPSoBabEY8xNc6
         MO/w==
X-Gm-Message-State: AOJu0YwkrEo6aocTSnIt5jNDJFlEYwEjcZZFYRDJG0h9F1Fx/2KqhgB0
	4Dd7bck/ezMipkT8Gulzs4QHUw==
X-Google-Smtp-Source: AGHT+IGLUlcDD7K55509EI9MCn7Lj/SluH9GT9R5OrexuSg3htFw/XSGrzpIAwUrw57WzavQkmaRxw==
X-Received: by 2002:a05:6000:1815:b0:32d:82f7:e76 with SMTP id m21-20020a056000181500b0032d82f70e76mr906073wrh.34.1697701563248;
        Thu, 19 Oct 2023 00:46:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q15-20020adff78f000000b0032da6f17ffdsm3846942wrp.38.2023.10.19.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:46:02 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:46:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 2/8] RISC-V: KVM: Change the SBI specification version
 to v2.0
Message-ID: <20231019-d6386d58125da87f5e4c5ff2@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-3-apatel@ventanamicro.com>
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

On Thu, Oct 12, 2023 at 10:45:03AM +0530, Anup Patel wrote:
> We will be implementing SBI DBCN extension for KVM RISC-V so let
> us change the KVM RISC-V SBI specification version to v2.0.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cdcf0ff07be7..8d6d4dce8a5e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,7 +11,7 @@
>  
>  #define KVM_SBI_IMPID 3
>  
> -#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MAJOR 2
>  #define KVM_SBI_VERSION_MINOR 0
>  
>  enum kvm_riscv_sbi_ext_status {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
