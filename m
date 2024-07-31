Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0018943417
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:24:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5Vx24jZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYy912s0Nz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 02:24:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5Vx24jZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYy8J6CHQz3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 02:23:42 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a7a8553db90so813460466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722443016; x=1723047816; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=V5Vx24jZheWoC/LyeeQkxM6ju9KUI9WhRntBlcGefmGkyHN44NP/BF52tKIJF6XxaJ
         rz0hO1VV5Bkc0p0lZOFQXHXzDTQbUUWB7RIugQv3dvOlKLBfPNoTEmxfc3a5qgQ3XaN/
         BicZKL79zMQswG+O5LuvCU/jjOS8IyJnk2cs02npp0S5SXJcKjc3vqsADPT43KoWkePz
         OJD2wQYK3mx/C7bhe6CfjeA9vu19KKsxPh1G3JIk+NSx4+9LIO0rT7IRrWRMzTI9/tN/
         SR1KxE0ZVtMbPJYLQGBcHHNygYTZy/qAHMoS3S4QfQ0F1Yh5wUYl7IqrhFiU1ZaRPzFO
         mCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722443016; x=1723047816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=f/OjslPYd4VBDPHGxMPzXzmSxDPeeqCd48dNDulbw7OrST/6S/aeb3RxEwaz3UJh89
         y5bhxfggsO7B3Km9SG0ri55r0O0heWiOjZmEQT7Y45AcmXdIPBCjfTbFgtOnxHJNX5PY
         uwmuQBCjeZRFVo3WgmaCWDdPUL6E1VOg7a9nKLw56gdQWbtlin0iAFEwKJNjkitbzwbo
         nkw2mUBfEaBkCgxYrbkWZmdOkBvszdUk4AhRwcyXJTtQe6ezmT7YYno+aJIlRBz0hdiy
         7PRUzbaDt4zD88johVTunKNKupluO06A74TLrMybUZBogSJ7Av0XWl+XhMgIZ/4pp1GV
         j32A==
X-Forwarded-Encrypted: i=1; AJvYcCVuDSkVOyfZ5bHv5sgOVHUdCDr5RbQtb4lRamh/OUuTCtJdBhXjNhL3Bn7FGtKgCDMQp2HJZRsdLjFWcBGDrAz8ZtWDfCHikwjeLERjxg==
X-Gm-Message-State: AOJu0YznywBxSDD9CQZLS4mxxcc5ij/JBUYfyjxUiIVPra8dCaebsoAx
	y5AiWz8sHwDTqMXmbl17ty1dqzPe+Cf+pMdnPjlA8/59C9Uk5htNU+RUpIf2NcE=
X-Google-Smtp-Source: AGHT+IFaeuLsqXvHIvwNkMOmXQ/kk95KnaHAVzfZZFY2rJSwrdZANzuSfUeE19U50MBeGB1J/TbUHg==
X-Received: by 2002:a17:907:a0d5:b0:a7a:b070:92c6 with SMTP id a640c23a62f3a-a7d40116a4bmr801926666b.50.1722443015967;
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad416basm784769266b.104.2024.07.31.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 614DC5F8CB;
	Wed, 31 Jul 2024 17:23:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
In-Reply-To: <20240726235234.228822-2-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:10 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-2-seanjc@google.com>
Date: Wed, 31 Jul 2024 17:23:34 +0100
Message-ID: <87a5hxfs3d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Put the page reference acquired by gfn_to_pfn_prot() if
> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> can get a page reference to ZONE_DEVICE memory.
>
> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a gues=
t")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/guest.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 11098eb7eb44..e1f0ff08836a 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		page =3D pfn_to_online_page(pfn);
>  		if (!page) {
>  			/* Reject ZONE_DEVICE memory */
> +			kvm_release_pfn_clean(pfn);

I guess this gets renamed later in the series.

However my main comment is does lack of page always mean a ZONE_DEVICE?
Looking at pfn_to_online_page() I see a bunch of other checks first. Why
isn't it that functions responsibility to clean up after itself if its
returning NULLs?

>  			ret =3D -EFAULT;
>  			goto out;
>  		}

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
