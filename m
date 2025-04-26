Return-Path: <linuxppc-dev+bounces-8023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3BA9D991
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 11:07:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl3lC28B6z2xrL;
	Sat, 26 Apr 2025 19:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745658471;
	cv=none; b=I5ytj5VS5B/jrqQGWfpbAosZ9b16bSyzDknAfEAcpQedzyO5nmqv7nO4tzSl4V2XldfXqtfVuq8yRDbmTiJJXlYYfmywD6ucOpa9L2yXFuODIx8PW7I43oZn2Mm4wmDwUBsd7RVP79McpNuPrf4efXmfdumlxDAyRoO7hrF9Ha/i+7j0YU9bV/3lxRiI+hcViHDoAxbh4Eb5rC2DGaTuu6JihiqiV+lZthSxw9gkvkZHBujilJ+Z2VVo/1awPDOoA2SBwszPhcWRzYt4wWrckjeBZnnftrtGx3IYpKIEE50nOcFjnt56fLP2E1LjjXv8XgzVMI+7dN7KTGdoLyoZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745658471; c=relaxed/relaxed;
	bh=T531Ib4+zriZvU0QZafbnBWnttRxk2oMWt2rRqOFaJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDh/IXYU0qkwaKoJam39xkWBE5cjVLlhwCItACS0qnS7KhiMNzbSDy8FENcS32xjOu2L6J1Hf+w6ty9B1gqf0Xf1yM5AaW0HO/5wVThsw4NeERCQ3qYMmU+xpt36Sd8PODh5+SeHS50J+iKmLkfioMsxDiRed0DUZL7m3c0R8PUff00PVYdBGrnusWbkXYA3JY6CXvNxCVyEMSU73W1TXaGsIUb1SqRuMQUDF58S+jAJ+zejh/UtHr7GeRCQInNcbOLSPIK3/4TjBdCgun0eKQtLiu/25KOPEBS5W0DWI4PhjzuBZ5nLZsoJgkYNvwN79w+/ncTSqG4WooZhzc9Pww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BGvie6s6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BGvie6s6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl3lB3sPTz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 19:07:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA9B61136
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AA7C4AF0C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658467;
	bh=tWnubF9yZCDGQjCpvAPwhcthzUF61M7My64owmsX1wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGvie6s6s+W7PK3hxSq8nPlG8ennMfM3lnISFEQrUyC4UzK78trdr7Q3N4PxZWKGm
	 u3JYC0P0nu2po5zLfchiwxvN07nheJw1c8N3DJ0oYXgLh08sxsGZzR+BZhoCgqYD87
	 kykCpg/vW//2i+YNodprO2sgjUXdo+RjDbir/vOJ6Aq1fSh2X3o5aharuwWiRNr/wQ
	 HJB5V2cdNkHE2Yqtyhq9ZamuUFceakG8CT0ggdIczCuVeA0YaxctVXQcTQcrXHPZbe
	 J0BHWNzQwvXFFybH2feeOqiJZWQXbxgWkrSLrYO/nUzaMAHa5G1KZNn7WjNo2k3f3o
	 Wt/RAbFEwiipw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf1d48843so26554031fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3PXegSaRtGyiKCOwmQcBhqyF9D/4g+ZDeWfRghlDLsRDyImmjMVGGmkAIEinemdZdTTfHP8St8l2IAlI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVojZLOUvo+l6kKM9eQy9Orgt3FKXKuJmEoyKdOGzS6R3DIuah
	FvnXFA3v8f16Mcv558b+vslYzRWX2BkBsb89h/VnoMGI5lICNx3+qBbDhNicdRhGSE9bf+0FJED
	OP4p0Ua2bs4sw+WSllr/BuUVvjbg=
X-Google-Smtp-Source: AGHT+IFQ6d5LkceuPYf/xl1qz8Cz4agL96VnxeacTrxQe8bWMsw0LVAsS8Ui3mFUbafLHpHr7zqezdjks0Oba2s2Raw=
X-Received: by 2002:a2e:a9a8:0:b0:30c:1fc4:418e with SMTP id
 38308e7fff4ca-31907611d52mr17479061fa.26.1745658466100; Sat, 26 Apr 2025
 02:07:46 -0700 (PDT)
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
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-4-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:07:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHd7zDfH3FzrEiEd07SHa9Kg_P0LYaKNZL-WFR1gYwxww@mail.gmail.com>
X-Gm-Features: ATxdqUGuJmhadssxS6Ou5Vd5gSzDagv6eV7-J6URiZ1n5H0_6vtm3_ipq2KqSAM
Message-ID: <CAMj1kXHd7zDfH3FzrEiEd07SHa9Kg_P0LYaKNZL-WFR1gYwxww@mail.gmail.com>
Subject: Re: [PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 26 Apr 2025 at 08:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Since kernel-mode NEON sections are now preemptible on arm64, there is
> no longer any need to limit the length of them.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

