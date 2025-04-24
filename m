Return-Path: <linuxppc-dev+bounces-7954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31A1A9A1A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 08:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zjm9f0ctVz2xJ8;
	Thu, 24 Apr 2025 16:22:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745475765;
	cv=none; b=McyhX6l9LVaFfA5uVt9iQf2xZ+pwvEcWzF2oNOrM/Ccqn42T9xtVcl6fqGNfK9oVrfwBWD8HTb8hjATEp+tmU6F/Xx2t7EzDb2jISJ/TfltlpVdVtjz9f7QZ4JlM9zybzKCsLA3H+Um94Rl1dhG1JAJ2Mw3SDmaNewSH5RUMtoAxCLbOnlKQje5AGE4Yyk61Zxpppbuw26nIJNQ7TJxk2pv6+CB2/Fmf/iveIUUnIcnfCQEewkBF02MgoREubkOxnc2YtVABP9+WsPuusillwWTnMJzTSA03NWhj3Nnr5t776XMobvs8dd36u6opRVgoABs20zdGruXIrFdxLR+DmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745475765; c=relaxed/relaxed;
	bh=0af7qNQm3bacrBw+3pGC/CiybC+NXWc29Et+/4lyIIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mX4bej6evE2U/rt0j46fUBsKWcCUkrqlmtqEpzWYslJqOhQ45Yl8z8RwOCrH+8/qYaK8w5GskqQug65OfsvrB34juO5xKpDhRgaEZcE5LBNb5MRVrykgBGF+vC7uY553//fdgpAWjEBcIQW+pC00VKnu0V9br6HI/7UNdae2XKDu7ixdXmxYbk1hYPfika95f2bfkqG+3qmO8J6rFO9MS5hxPVS8MIHgMM+OSN5z2aXMfJqYXjPZR/SL10gN0RR9SDjECc78ZEgX/1Nl0H3dCxyc/TFG19KP9dIGgOrJD21CXU8xuxIvzpu9QRVyYRl7YGVupX0oCh1W85F8jsNmYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WEkJA22n; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WEkJA22n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zjm9d0Kzpz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 16:22:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76F71438C3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 06:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FEBC4CEEB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745475761;
	bh=MnbDTkDjx7fGLQrr6aq33qeElS5aQV1V02HztW2z4QI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WEkJA22ntQFDKP6NBmgNHC998ZAdcFFc8KjA3fV8AaRi3zx9/qLmQgJuirDZzb8eI
	 ZJw8tZUnmW5UW28rFfEP+N9hqx5QdgBv4ajLn4fSo6oboT2e4WY3LF2NU/P3dxzS3E
	 FaPujm+o4r5oegs19uhp88h4cKBoouEgMzhhmKivgcrf13L3+H8HjhFfcseEwjufw4
	 zCf+yNsUK2mKupfN2+Mtpa2w2k+MEYjNZn3V6/4hEQECUo3vNIgh6PCsekVxdk1moR
	 VLxYtsglu8jQZoyvF1RObXavqrS9W/atmcU5jMouGeaG5SLNDiC+cR2K6Fq1yNzsFG
	 VCGEFf+WkKc1w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so7213581fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 23:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCValKv5Bi7seYzUM7ZHTOO/p6FY7gYILq8fX8GsjgnSgj2KKiyGVBINorLBk4mHljJt6pBsIGwfpAdp+L4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyeo7m31pNHAiRIPwUyIRZwQ8/0fmUd4mZkJba9ohMczPIyR4Qh
	jo/FrxcJUJvOwU/Jbss2IqaS2rcf2HCsFQCV9CqJsd69l0gGUpI3fI8iz3udXw1dtVZC46m92SS
	MBQZ0oS1VqGlgE6SQdJhJKE9sgVk=
X-Google-Smtp-Source: AGHT+IEBg0GksqRUxYbq10WiBQxT674qV08e5XaXakQ/0Ux/wZi1/Em/Ff29tbRd93xidxYNQXuF7ob7W4sz3W9cDJE=
X-Received: by 2002:a2e:b8c9:0:b0:30c:3099:13db with SMTP id
 38308e7fff4ca-3179e5ea6f5mr4171351fa.14.1745475759305; Wed, 23 Apr 2025
 23:22:39 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250424002038.179114-1-ebiggers@kernel.org>
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Apr 2025 08:22:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFZ-Wy9Z5Rqe-o6fnKtgm+=JQeFnVMvG=jmKz36=02w6A@mail.gmail.com>
X-Gm-Features: ATxdqUEf-FfEO6d9z_202RUFsmqfhy6LhKcEQhVv3O5CQR6i6602IFM1v6-7V-w
Message-ID: <CAMj1kXFZ-Wy9Z5Rqe-o6fnKtgm+=JQeFnVMvG=jmKz36=02w6A@mail.gmail.com>
Subject: Re: [PATCH 0/7] lib/crc: drop "glue" from filenames
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 24 Apr 2025 at 02:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series fixes an odd naming convention that was unnecessarily
> carried over from the original Crypto API code.
>
> I'm planning to take this via the crc tree.
>
> Eric Biggers (7):
>   arm/crc: drop "glue" from filenames
>   arm64/crc: drop "glue" from filenames
>   powerpc/crc: drop "glue" from filenames
>   powerpc/crc: rename crc32-vpmsum_core.S to crc-vpmsum-template.S
>   s390/crc: drop "glue" from filenames
>   sparc/crc: drop "glue" from filenames
>   x86/crc: drop "glue" from filenames
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/arm/lib/Makefile                                       | 4 ++--
>  arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
>  arch/arm/lib/{crc32-glue.c => crc32.c}                      | 0
>  arch/arm64/lib/Makefile                                     | 4 ++--
>  arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c}          | 0
>  arch/arm64/lib/{crc32.S => crc32-core.S}                    | 0
>  arch/arm64/lib/{crc32-glue.c => crc32.c}                    | 0
>  arch/powerpc/lib/Makefile                                   | 4 ++--
>  arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c}        | 0
>  .../lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S}      | 0
>  arch/powerpc/lib/{crc32-glue.c => crc32.c}                  | 0
>  arch/powerpc/lib/crc32c-vpmsum_asm.S                        | 2 +-
>  arch/powerpc/lib/crct10dif-vpmsum_asm.S                     | 2 +-
>  arch/s390/lib/Makefile                                      | 2 +-
>  arch/s390/lib/{crc32-glue.c => crc32.c}                     | 0
>  arch/sparc/lib/Makefile                                     | 2 +-
>  arch/sparc/lib/{crc32_glue.c => crc32.c}                    | 2 +-
>  arch/x86/lib/Makefile                                       | 6 +++---
>  arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
>  arch/x86/lib/{crc32-glue.c => crc32.c}                      | 0
>  arch/x86/lib/{crc64-glue.c => crc64.c}                      | 0
>  21 files changed, 14 insertions(+), 14 deletions(-)
>  rename arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/arm/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/arm64/lib/{crc32.S => crc32-core.S} (100%)
>  rename arch/arm64/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} (100%)
>  rename arch/powerpc/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/sparc/lib/{crc32_glue.c => crc32.c} (97%)
>  rename arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/x86/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/x86/lib/{crc64-glue.c => crc64.c} (100%)
>
> base-commit: 1ec3d4ff5c77422927896c1f7d0ed01267ec1213
> --
> 2.49.0
>

