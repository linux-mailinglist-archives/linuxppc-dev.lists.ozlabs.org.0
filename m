Return-Path: <linuxppc-dev+bounces-3433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7DB9D220A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 10:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsz3J2JVgz2xLR;
	Tue, 19 Nov 2024 20:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732006812;
	cv=none; b=kDJC+2UCX/vQ1cTTRw1+C2hy6cSNNFXLGfyNr1jO3m5bQ5gVyoD//Do31YfPfxfENRwM0v/EWfKiYb/sYihEMvVxi4gt9wl2TsccKTo8GmxqWrBpRgevDkfKzI/RI9AuO+6ttaLfZNFpeJCgnAUoxQhTcOJrqtIcr7SxJQWxb2j2Oa9SYqr6addhB7h7T4b5f/EsEi8AtAEMz/cM4icGQgw5Vw52SYRLqFT5Q8K2pkoEQqWFSrCbzt/wBEsB5gvXL/Pwh7jH8pnRKui1NtKQx6gYMyTZZJ+SwbgOhEV3aZqBj0ZLQIejKTPV0AacpFKbaagCCres4K5t4AJYAP8SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732006812; c=relaxed/relaxed;
	bh=ut9J7dfNWbIAZvs1QiNuTESwaFmTM/irq+5AWRZgbAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFAyNhdfHMLHTAMgHKxIhlm9F7tKx+jH7Vq9hBhXnw3gBiI8pNli02OwmzVQa0zyhkP3tWAThcZMy9kj+ZKjKrI36KmOrgXgV/oS8QYVJIg2KzTvEN2G7uOC3PrON5UA1UCTUAm4xaTc4XeepY1FlFZetzh7Hg2Lio3LoXEZDmV46gvtdH1liPcEvfEw2w+nNydxFQsawZgBqA8CixDS7efy1N0BYRIIa2i5iQSeXFAsa45ua8faV001+oGhzL2Vmi0qdJ7HL40OXr1t3pIbq1kB1KVtCR9Gn3qb5ZasdxEezppi4Magv8Aovjix0m5+Z1PxD7geP9ixtkDqFIIZCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GlziSZGm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GlziSZGm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsz3G6y6Fz2xKL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 20:00:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32935A42783
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 08:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679C3C4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732006806;
	bh=s8xwzMSQqRRhgWbEzyj1PJULHTCex8PmVGVdqmaYwow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GlziSZGmgL17KEpUWxgzaWOsXBlCH5SlK3CTGZSKb3Kjzg46uJCRjm55rJ5VEKQgX
	 RazWTGA7VUdOd0vadOXm/Ei4Npvau9DSDhZBxgdhcsTEFLqwUSto2eS6g84Kksg8Yf
	 ud9m/WvWYQEu8/yjHjxlYLvAO3qkruoPRf9PbcYkd19M0wRaag7acSN+i8eMkSyOy7
	 3Vm1PyCJE9iHlAr761csU/bDq2lB/s20SLZaAfOcioYyigqdG4wX8ti2HFKy9y2tx0
	 ZPuMpYMyj85QId7YFztdUxnRwiIeYe8nfTuFcnW6ZPUz5ESS7rSRd/iWkIfUjW67Wq
	 gH3SFim+Vt1/Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53a007743e7so4465920e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 01:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXG1njG9pgIlK2Q8qRF0NxUXpIpj0Hk0J6gAYhjUV/ivvlTO112mkdF4JoLMThbD0vC93PRRv/5XSbPHg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+XZxKN5rQf2rb0OpTrzMIMRYpdWawjsOOiUYUPcP4XmFKNLsI
	JmEJsFCmIqcZavc+x6CHnM/an/ZL8ZbKJEvEYzAakucdRhkrYv1BB0vGffkH9KgKjIsFU62Y0hC
	ZEkLvBO36meDRhOYgDiY0wWob7y4=
X-Google-Smtp-Source: AGHT+IGB5F8WlM471SFc1V5UKClWXgSP36FaXp9LSspKRLXsBt4jIufb/Zaq1Z6bYkALOF5/F3wzsN456cYehpKsaQs=
X-Received: by 2002:a05:6512:31ca:b0:539:fb30:1f75 with SMTP id
 2adb3069b0e04-53dab2a659dmr6164698e87.24.1732006804616; Tue, 19 Nov 2024
 01:00:04 -0800 (PST)
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
References: <20241117002244.105200-1-ebiggers@kernel.org>
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 19 Nov 2024 09:59:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
Message-ID: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 17 Nov 2024 at 01:23, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v1
>
> This patchset updates the kernel's CRC-T10DIF library functions to be
> directly optimized for x86, arm, arm64, and powerpc without taking an
> unnecessary and inefficient detour through the crypto API.  It follows
> the same approach that I'm taking for CRC32 in the patchset
> https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org
>
> This patchset also adds a CRC KUnit test suite that covers multiple CRC
> variants, and deletes some older ad-hoc tests that are obsoleted by it.
>
> This patchset has several dependencies including my CRC32 patchset and
> patches queued in several trees for 6.13.  It can be retrieved from git
> using the command given above.  This is targeting 6.14.
>
> Eric Biggers (11):
>   lib/crc-t10dif: stop wrapping the crypto API
>   lib/crc-t10dif: add support for arch overrides
>   crypto: crct10dif - expose arch-optimized lib function
>   x86/crc-t10dif: expose CRC-T10DIF function through lib
>   arm/crc-t10dif: expose CRC-T10DIF function through lib
>   arm64/crc-t10dif: expose CRC-T10DIF function through lib
>   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
>   lib/crc_kunit.c: add KUnit test suite for CRC library functions
>   lib/crc32test: delete obsolete crc32test.c
>   powerpc/crc: delete obsolete crc-vpmsum_test.c
>   MAINTAINERS: add entry for CRC library
>

Nice work. The shash API glue was particularly nasty, so good riddance.

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Happy to take a R: or M: as well, if you need the help.

