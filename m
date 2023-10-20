Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB477D0A56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 10:14:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=O5tRks0h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBcnT42dYz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 19:14:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=O5tRks0h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBcmb0jlLz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 19:13:49 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so80495166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697789623; x=1698394423; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=it5LId2C4H1U91VsyvnGjoaX7yK9lqJY40QPQhvwsSU=;
        b=O5tRks0hcJJEQkStP4hO+jdHDgvPZb+qBETJFLJmClIJn57BLby/sjoEYsz8X9fm0f
         0NdcQ8+9xK0oe1HzSqP93OKwCICpf+0GL1Pc8opk1eJfZJjpQF2TNGXImjdabnrrGUb9
         mhsPa7z+MDYxM4+FHqzRO6/2mVkt5jwbLA3gn+BJ7bAJvJrxHcMkWXWlmYA3rY1hKZXP
         QHHCIUoa3THw4CIHg1Ycx0Ep8L9TIYAfW2nQxWvTy/NRZis2ZmTRu1psVi5Vf7hzPqTa
         8B1hbSaTsxM/+7ranwVVwOi456D52kn23xgog1Mpx/4upJNPoQwGOuDbS+FzD0ciZbnw
         vDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789623; x=1698394423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it5LId2C4H1U91VsyvnGjoaX7yK9lqJY40QPQhvwsSU=;
        b=M3ql6hg2ohrSL0arVbmK+M505QfJZP/ey7Qhahxm3qlFpM4PQKt3PzoaDAA2E1u7ze
         QtuJdadO2rWNQmsVul+hEMNQSTW2rn00+9jgX1bKBUUCETrdKRVbst9NnLYrANKNHvug
         btG2eb5pYdlurb5PLLgTNcMFXUgS15l5iiklhnpBSGgxEALJe/EKGjx7es791UEOMFUo
         L5AblMUlMyxxSoOWkfLIZfdj9sf4a1j4k/RlJVEbC25nMelF8H4mkmLe0xFoURkwE1AR
         fwYdGK8im01sWDAdrXPW1oLVV92cvQTF3Dm/ab3FZ/kQFO4SZJyjZ3p3kMmtrBxJynLY
         5jZg==
X-Gm-Message-State: AOJu0Yx6dxj3JYFsGG5PICFHvTuMj9yUnSSFKwM7QIQi1FlneTjh9p9s
	WPuQqg353SPiTKedYUuVNpWLKA==
X-Google-Smtp-Source: AGHT+IEeFrCSkm3FbczMa45J0DrCEhJJ+FVSEOfJ8fULIE2AW4z8E/7QxxfmoXpEZ0bHuooCq861jg==
X-Received: by 2002:a17:906:ef03:b0:9bd:d961:ddea with SMTP id f3-20020a170906ef0300b009bdd961ddeamr818382ejs.45.1697789623226;
        Fri, 20 Oct 2023 01:13:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b00533dad8a9c5sm980417eds.38.2023.10.20.01.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:13:42 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:13:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 3/9] RISC-V: KVM: Allow some SBI extensions to be
 disabled by default
Message-ID: <20231020-622a7f510c98e8c82135e6fc@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-4-apatel@ventanamicro.com>
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

On Fri, Oct 20, 2023 at 12:51:34PM +0530, Anup Patel wrote:
> Currently, all SBI extensions are enabled by default which is
> problematic for SBI extensions (such as DBCN) which are forwarded
> to the KVM user-space because we might have an older KVM user-space
> which is not aware/ready to handle newer SBI extensions. Ideally,
> the SBI extensions forwarded to the KVM user-space must be
> disabled by default.
> 
> To address above, we allow certain SBI extensions to be disabled
> by default so that KVM user-space must explicitly enable such
> SBI extensions to receive forwarded calls from Guest VCPU.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
>  arch/riscv/kvm/vcpu.c                 |  6 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 57 +++++++++++++--------------
>  3 files changed, 38 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
