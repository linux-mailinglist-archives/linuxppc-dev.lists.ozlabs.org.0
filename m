Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189F77C8C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pAgTYUwG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ3DH0LRxz3cGL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pAgTYUwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ3CR0rB9z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:42:56 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ccc462deca6so5132096276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692085374; x=1692690174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAQfC8Fk99VKXGvykRcnXCDXuQl6wZXlhTPZ78iPS24=;
        b=pAgTYUwGaIFdx5eLvLdZU3jJRUWKNxuF5n/OPgySmUjGdU8SXpEE6AtbXT2gdwCQP9
         gMe/DNfv/rj1WjMNqp6MkdJmCcdjutwIM/lQMM2c9nEdXHKY9rho8a1CE7L2a9Ky+M7Q
         l37zR8KQ2A9KromftjpezDMFdIBE/9m9flyL+fwp1/+pXK9/gT+AOqAtzu1jN0vULDcU
         t/d7H0rMQOGD/Ex6u9EKrN84uEGcO3aH3i+ZB0rOlgMjRz+YKrb5GDQgdN3etgG9miZd
         x7c/MVPyjI7zikIJ6DBZBaImviz2DEk5gz94lDyXTRHFfZPL1Jra3lj6s99Lb6G4uRhd
         jPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085374; x=1692690174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAQfC8Fk99VKXGvykRcnXCDXuQl6wZXlhTPZ78iPS24=;
        b=K1YrhbWZDqMK3fEeh9rVHPOrdu+WQW2pgIqDO0JtQM6EtuI5w4ctCZe0PENQrgTIyp
         DeydRhFLN0QYV/m8pWOzGaZU2GIogFc4rEanWazFv/xqG0XJWhyrIPorrBfzLFWBXRvt
         IPdGFRMdZlP/IcjE2bVTpm7tszfHwMNRSV1e2Yl+UL2ezEA2keIJ08Uxt+MuP9JQwqiY
         GWOrUU9cfw2U4NIHfK2vW0spJ8HZ1EjD+PvTA5xH2BXwjQRjAvYwzF+AjBPOnPUcg5l5
         WGdCwervara0y6LmtVO+4t9GM116hHDrbQCLSEw6VuOCM/pUwKlXMc15aiQOk7Jg1V4U
         TOHg==
X-Gm-Message-State: AOJu0YwtBGJ19ryyR4vpXaKIGntw3cLhgzc9GdYExn5T4RozxRHdzYhn
	Oc94F26BYqcTGuG4wRhwia+cZ1FMxRfKEG4YZF7CHg==
X-Google-Smtp-Source: AGHT+IFDQ5yjy3RJRehLsSgIxf5pspuHEFGdUfMHD78IpF/c7/o8oIdh4kFoyKOFD7wT8BGLpm7/zzaiE8Xh7Iy0tOI=
X-Received: by 2002:a25:ae52:0:b0:d67:5d71:d817 with SMTP id
 g18-20020a25ae52000000b00d675d71d817mr13014469ybe.61.1692085373841; Tue, 15
 Aug 2023 00:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org> <87y1icdaoq.fsf@mail.lhotse>
In-Reply-To: <87y1icdaoq.fsf@mail.lhotse>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Aug 2023 09:42:42 +0200
Message-ID: <CACRpkdZuLeMKg1vG9+8tcUtWUNN-EowhpPmt6VnGuS+f9ok81g@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 15, 2023 at 9:30=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:

> > -     return ((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));
> > +     return (const void *)((unsigned long)__va(pmd_val(pmd) & ~PMD_MAS=
KED_BITS));
>
> This can also just be:
>
>         return __va(pmd_val(pmd) & ~PMD_MASKED_BITS);
>
> I've squashed that in.

Oh you applied it, then I don't need to send revised versions, thanks Micha=
el!

Yours,
Linus Walleij
