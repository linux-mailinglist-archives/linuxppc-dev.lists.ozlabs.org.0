Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C731824083
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 12:22:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=S6NQPc8B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5PLZ5vpgz3cVs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 22:21:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=S6NQPc8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5PKh1VgQz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 22:21:10 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so489075a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 03:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704367267; x=1704972067; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=S6NQPc8BxBT08BWdye3YFMEjFHau7xKyoPp6Fct8yx2QAqXCYE7rZBF2kX5oyD7CUB
         1+i6sKrtNpjiKUGyFUO9vPtIjTwV0Zf5h9z2wA2iLrNwL5Tq9u1GCXVEJ58j8dlnG7ZD
         vb0GFWHpI5kjczbz0a0o/ZYLOm3TcfSzXzYEzlHSjUAAHGGPj9QOCZMCxlAJJZHUQZKF
         2uXH3yiL/pj9F7IKQfl2owTKhFwYbDczLoNM79X1hyulNoAAg0fmafen7lJkS02EzeYU
         0DJ46ojiXdLrw1q3eaLS67DOelHIKIU1mt8kPaLpGB6459gcrRfqCOB5uYI23zlVupym
         i6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704367267; x=1704972067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=Gbo7X/S19VcLLmzo6n7V7yVCrNEktXz+Cjv2Y0Y+0OANiAkNmYwQl5pARQEUIeKrJ7
         jP4ylhkxmeEn9KilCWKrAEIanaMpAHHR8mACH82iJId+Uc9JSmYynVflghss73DS1CYb
         PRh+v/4myUjYNbhPnSKdQpfonaJgNdqKU5yrjEcyomM3DQLjXU53aD2QSV0hPTWvCWgK
         42lStZmUqZIjZ2V2Gvh1SDm/BRMQtbqgwEJ94DkkoT7pU/+yIPrqgKI2ISGC1XRwPQhQ
         lK1RRX9L+T91GQlKgT5vxWORgyGDotpHZz2kcQfsA/8h2VOuLiHthtsdKsUVgyhz10pN
         1hoQ==
X-Gm-Message-State: AOJu0YzyjUEUVxAoCgTQwv3e/n6o+z9MhtSSB+6DSRnTLtlPJJfplXZY
	9sXBk79GsGjz3+58OoPdyo2UPZ7wSTHFcA==
X-Google-Smtp-Source: AGHT+IGEPF95NHKVsnpyIHKUm/KgY8I0kv9v78/s4o+1miuTMPSJaURO0LP/yv/+PD12AbmgBJL1yQ==
X-Received: by 2002:a50:bae9:0:b0:555:65c0:e72b with SMTP id x96-20020a50bae9000000b0055565c0e72bmr319888ede.62.1704367266640;
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7d28e000000b0055306f10c28sm18642880edq.28.2024.01.04.03.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Date: Thu, 4 Jan 2024 12:21:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-6a5a59dde14adcaf3ac22a35@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
 <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org, palmer@dabbelt.com, rdunlap@infradead.org, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> On 04/01/2024 11:52, Andrew Jones wrote:
> > This applies to linux-next, but I forgot to append -next to the PATCH
> > prefix.
> 
> 
> Shoudn't this go to -fixes instead? With a Fixes tag?

I'm not sure how urgent it is since it's a randconfig thing, but if we
think it deserves the -fixes track then I can do that. The Fixes tag isn't
super easy to select since, while it seems like it should be 8132d887a702
("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
("RISC-V: Add initial skeletal KVM support").

I'll leave both the urgency decision and the Fixes tag selection up to
the maintainers. Anup? Paolo?

Thanks,
drew
