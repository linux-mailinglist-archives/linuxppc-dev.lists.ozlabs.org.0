Return-Path: <linuxppc-dev+bounces-2103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF999A0CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ2Qy3QnVz3bsm;
	Fri, 11 Oct 2024 21:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728641354;
	cv=none; b=HqIXMIwkQ6iu36lwpVZ+xokNP8AFnvWPQsy2pZr2oLpu4PpuX3TjjdAMApBo6iCwSSw5K0QwI3gwzzQ4VEn61rIhKPnaqoJ/w//dk4bwLD+TPidZ985Y8oS/7zb/gwsoRK7GQvgg4ATBBfJgPjENxH8s+KrpeAYR3ebTuM+KjY3uw5UUUbaWeFGjWxizWyPo90kWdBGeSpnJ1GBxLHnJ9RoeMWy0O6raWSRmd9pj+a5faYeyqw+8ly2ga2x42uX6XKVvnI+cUhdxbEftwoy8+G2ap74o/xSnXzQ+4+CphGAB19soGWtLFk7ENo+mP4iZJ4tFEkNw27Rdsgc38ArYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728641354; c=relaxed/relaxed;
	bh=rYX1/0xaAsVY9y/xa8IDQZuNB9RuCS/ODqECEVP3XcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYRwCr64C3jywef8Z71nWh9QZJpEYvnHn//Ur3ZRIRVGlLqHngtKhC3zmwCVsEO2qVho/0Ls8l6pYPiqfDT+1aQ9EykQkhK5I32dDUuzKt6T3SPagtdP9bd3O+NOR8NWBgF7sTZm842VyHl9xnHiW0S/OT4QVVx2J0BACczNgHg7IMCMdBFzQ0CWRXtKAj3JVlSPNqpgYftf9ffpgxKyoPjIg5QHYhSTM/AUvvzbTIuYMRagegJAQxa7PzWvlG3B+4vIy4DKfLBGCae+/OuHkvgzMmwvfrBormDgKw8d83sRrwHXhJSuGGfH1dq6N8p7zstywzmFbc/I7cb4v0X4fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPUwLjE4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPUwLjE4; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPUwLjE4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPUwLjE4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ2Qw6v6vz3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:09:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728641348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYX1/0xaAsVY9y/xa8IDQZuNB9RuCS/ODqECEVP3XcY=;
	b=WPUwLjE4cr6Za6/zA3/AE/EsmyVg0exnhEHgEwbxyJhHmx9XMeQkgi2/SRCI1f9pk92t3M
	xJoYVR9xpB6Kt3f4WzMY2LppumKL699oep46Xq5+KsTfcECnvJsU6Uhzdk/H81liKK2ilj
	IgWB2e+Y8q+cJn3Jda1WexS51y7v3Hg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728641348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYX1/0xaAsVY9y/xa8IDQZuNB9RuCS/ODqECEVP3XcY=;
	b=WPUwLjE4cr6Za6/zA3/AE/EsmyVg0exnhEHgEwbxyJhHmx9XMeQkgi2/SRCI1f9pk92t3M
	xJoYVR9xpB6Kt3f4WzMY2LppumKL699oep46Xq5+KsTfcECnvJsU6Uhzdk/H81liKK2ilj
	IgWB2e+Y8q+cJn3Jda1WexS51y7v3Hg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-UFZiidzgMnedESPNsVmYbA-1; Fri, 11 Oct 2024 06:09:07 -0400
X-MC-Unique: UFZiidzgMnedESPNsVmYbA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5399206172aso1900232e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 03:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641345; x=1729246145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYX1/0xaAsVY9y/xa8IDQZuNB9RuCS/ODqECEVP3XcY=;
        b=rYgCDqARU9tr8mX7vEZfi5IHFPhsFGbcUmSqe27YDJyJKI5a3fj5OsXsBiy0vYjbXm
         Hp0Zw2ZacnU5digye7CZHJwEum/oTwTZdE9S+dhdwsZGa1JNfE73G07s7cJQKk8mYhFG
         22vikOksWxScAerqxggQjY7EGLSo3LAyabFSP+bgL+PGm7kLGfNEJjmOghElMuBCKuIK
         SjkJjVaNjYc+1qeiiKwDTSCDMBP5yn71xqrWJ3aNp6H7lcdcKS/Lz7uG/6sfesayMdbH
         ndiyeredBz2GOe9aaTirk0iNnczNGGOejW0f6S2wIqmpejAGm2nAqG9g7TRtsBeudJFG
         z0+g==
X-Gm-Message-State: AOJu0YwUywqWNiWeju1hq2cYnN4kzw3dd0Qno+iCqjp+dE+HGIV5QXyh
	K1kXKIkFZ3AIONLcA7ggv5o7VjjQUSJxOC5fsF1HzlWloh/tIwikXIJoC34kLzArV+4ERy8FBOm
	3BCmK/dH6Rbo/Eo56n8AxVtfPEOiFM4hxshqiGC4X5K+VKwoEqjdLW8pU2M5Ku7NQYEt+gj+xsJ
	VUfBF4kdc+kDTqP2Cj3BeZxiJWr0pW8w3ENgVjmQ==
X-Received: by 2002:ac2:4c43:0:b0:539:93ef:9ed9 with SMTP id 2adb3069b0e04-539da4f8601mr1065150e87.36.1728641345338;
        Fri, 11 Oct 2024 03:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh9JhMluU61p9DiGJofBd50PyPZtVPQ4h/Gwn/PPd9vgOrL5ypr4hHBgPmFmh0wtP+fgFjDzk950NotpVtb30=
X-Received: by 2002:ac2:4c43:0:b0:539:93ef:9ed9 with SMTP id
 2adb3069b0e04-539da4f8601mr1065125e87.36.1728641344858; Fri, 11 Oct 2024
 03:09:04 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <ZwgYXsCDDwsOBZ4a@linux.ibm.com> <640d6536-e1b3-4ca8-99f8-676e8905cc3e@redhat.com>
 <Zwj4AllH_JjH5xEb@linux.ibm.com>
In-Reply-To: <Zwj4AllH_JjH5xEb@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 11 Oct 2024 12:08:52 +0200
Message-ID: <CABgObfa9AjsDTTKJY5sZLcH0+-7tbpUvMnEiyq_wxhe9-fajzA@mail.gmail.com>
Subject: Re: [RFC] powerpc/kvm: Fix spinlock member access for PREEMPT_RT
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 12:04=E2=80=AFPM Vishal Chourasia <vishalc@linux.ib=
m.com> wrote:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8094a01974cca..568dc856f0dfa 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -168,6 +168,7 @@ config PPC
>         select ARCH_STACKWALK
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC    if PPC_BOOK3S || PPC_8xx
> +       select ARCH_SUPPORTS_RT                 if !PPC || !KVM_BOOK3S_64=
_HV
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF         if PPC64
>         select ARCH_USE_MEMTEST
> I tried rebuilding with the above diff as per your suggestion
> though it works when KVM_BOOK3S_64_HV is set to N, but for
> pseries_le_defconfig, it's set to M, by default, which then requires sett=
ing it
> to N explicitly.

Yes, that was intentional (the "!PPC ||" part is not necessary since
you placed this in "config PPC"). I understand however that it's hard
to discover that you need KVM_BOOK3S_64_HV=3Dn in order to build an RT
kernel.

> Will something like below be a better solution? This will set
> KVM_BOOK3S_64_HV to N if ARCH_SUPPORTS_RT is set.
>
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index dbfdc126bf144..33e0d50b08b14 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -80,7 +80,7 @@ config KVM_BOOK3S_64
>
>  config KVM_BOOK3S_64_HV
>         tristate "KVM for POWER7 and later using hypervisor mode in host"
> -       depends on KVM_BOOK3S_64 && PPC_POWERNV
> +       depends on KVM_BOOK3S_64 && PPC_POWERNV && !ARCH_SUPPORTS_RT
>         select KVM_BOOK3S_HV_POSSIBLE
>         select KVM_GENERIC_MMU_NOTIFIER
>         select CMA

No, that would make it completely impossible to build with KVM enabled.

Paolo


