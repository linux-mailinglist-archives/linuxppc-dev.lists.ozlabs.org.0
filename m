Return-Path: <linuxppc-dev+bounces-13664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2CC28363
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 17:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czPB31tvnz2yPS;
	Sun,  2 Nov 2025 03:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762016155;
	cv=none; b=lN8RpIbukf1K5GOLbPlgMbC+aB8rMjyYFpOmIjd6sgDQHt6l2KBGQVh1AuLcGTxY2HLkJt4h9Ca4jG4MXnv6JNaKPoNskZ/WZWqxhaNbORz4coNqUhDoXIrUmQrKpU/wy1Umm7i2DlZUW1oN3AcYnWNbL9vh7AiN2HmtQBNvhqb0BW2JDYT6cG3U9I6WXpWlG+k2RzOO+vhSOP1O7kiWC5wzqYcwluRo7kbW2BGqkW6ORVHEarB375zJ1dN2ux4MdMN9vdtohyORF+fywIj3VAZnzMWFUrHYYawDidkcMzlFlHNujH8vLdOmpPv3qlAGsmlQLM3lnd01C3g2wraIig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762016155; c=relaxed/relaxed;
	bh=G0jsLZvsAQ9jUhuq/Qy/GAwPEDahTIIfhybMb8BvNq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fm77qwE9k7LDzgr+R4mcI4fX3IVMVPjY4Sxg1n+FVxOVEd16bh5dmm0SeTtddPgxVO2bQ8GmEr0h0TtJrIl7xbk8oQeGTQrnfyRuSqzN03d3IUQNQ3bAUGDP7gN4Y+cvUb6wT8yWaLphhZzzgiyUs1b3O1BkIENhV7pDLOhydRspqHT2jXiT5AXR9qirg5rrxixFdbMAvfn4v1ZrzYoKyZ0jAimQrWwFTMyF0RnjIkxG8l6wez+VyQABWo/3KVBXFmXbfCxJHjUvQiyuNi5VVqJPIK+ruBbsdqgm/TnEHfjAxG/7t/62cICechJTWOUuiJ7e4Ehed1ENFsyBkUQGOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RF0EYwGk; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RF0EYwGk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czPB212WQz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 03:55:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBD6C441DB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 16:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A10EC2BCB6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016150;
	bh=sP80vbxc0GNP/r5uXwFDomQ23UoJ4yroWxjXP3XmNMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RF0EYwGkYWAviePjW7xN/OJRvwNhbqV1hMMNIs20gYmgWjrUhX3VTiMTlz9ZOCZ5B
	 NXQkgiqk8kYiwPDsvTA0VFMALLKyf5rQdgj/CBG1sTE15ccibfrhS1g63ZlKX1lHKM
	 7UL3/hfHnLT5czan5cp/tcrvWDt4uWQ6UuGsdc+QEdMaz7s1qTGKGYYXQJYBe6vVca
	 z1o0oo3gMr4PFJwzcE+qRl/dEms8SbUHTB8ZwVA2Uf/IDxdQO9JDrNb7/WRWaVtzGH
	 71Lh5gelYwPa5qTi/Hg3BmeOn0k8gVwdT2WJ5JcjHGb8oMfT8U2c1Ut/j9b0mZ+sFJ
	 GEsrrsx0XoT7g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378d50e1c77so28290441fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Nov 2025 09:55:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhzhomNBrwmAOmYg1XabeoBWqK/CjXWqSToN3E+LHtuG+o+dCGzKTZca9babDIBbH5nIy7jjUKylSbj1c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ6DcQMQRnjO/KSPRwO9yMOAce7s2CF0NAjdd00oPyunJznAao
	8T7nD5C6thXNyHlh694gi7XhN3hYx8p+jyrcSlYbgaFVzNYGCXU8/cEq+5b8eK8+LZctuEM8wa2
	IpMYq6lWB60kPim5rhePkNHdYbsYA2+4=
X-Google-Smtp-Source: AGHT+IFzm6byOVEcoCYQ/cLxtsweQADoRZYzXMb1uWfsMHcHS2qxBFBPxKTICmebgyez5+m6RGoVxWrnW9Pxli+8r4A=
X-Received: by 2002:a2e:b8cb:0:b0:37a:2c7d:2d69 with SMTP id
 38308e7fff4ca-37a2c7d3241mr5473091fa.40.1762016148544; Sat, 01 Nov 2025
 09:55:48 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
In-Reply-To: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 1 Nov 2025 17:55:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGy8s7Cc=aycKymv2d5wEZFL5J5_HxWyMb-QYDXkUrU9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnURnp_FaiKs8-FENuEErFxDHIc7i6dKr7lAYFTzEG_ElUiaSBCxPBJiyA
Message-ID: <CAMj1kXGy8s7Cc=aycKymv2d5wEZFL5J5_HxWyMb-QYDXkUrU9Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, llvm@lists.linux.dev, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 1 Nov 2025 at 17:36, Nathan Chancellor <nathan@kernel.org> wrote:
>
> This is a follow up to commit c4781dc3d1cf ("Kbuild: enable
> -fms-extensions") but in a separate change due to being substantially
> different from the initial submission.
>
> There are many places within the kernel that use their own CFLAGS
> instead of the main KBUILD_CFLAGS, meaning code written with the main
> kernel's use of '-fms-extensions' in mind that may be tangentially
> included in these areas will result in "error: declaration does not
> declare anything" messages from the compiler.
>
> Add '-fms-extensions' to all these areas to ensure consistency, along
> with -Wno-microsoft-anon-tag to silence clang's warning about use of the
> extension that the kernel cares about using. parisc does not build with
> clang so it does not need this warning flag. LoongArch does not need it
> either because -W flags from KBUILD_FLAGS are pulled into cflags-vdso.
>
> Reported-by: Christian Brauner <brauner@kernel.org>
> Closes: https://lore.kernel.org/20251030-meerjungfrau-getrocknet-7b46eacc215d@brauner/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I am taking the original '-fms-extensions' change [1] via a shared
> branch in kbuild [2] so I would appreciate acks. I plan to finalize that
> branch so that other maintainers can safely pull it on Thursday.
>
> [1]: https://git.kernel.org/kbuild/c/c4781dc3d1cf0e017e1f290607ddc56cfe187afc
> [2]: https://git.kernel.org/kbuild/l/kbuild-ms-extensions
> ---
>  arch/arm64/kernel/vdso32/Makefile     | 3 ++-
>  arch/loongarch/vdso/Makefile          | 2 +-
>  arch/parisc/boot/compressed/Makefile  | 2 +-
>  arch/powerpc/boot/Makefile            | 3 ++-
>  arch/s390/Makefile                    | 3 ++-
>  arch/s390/purgatory/Makefile          | 3 ++-
>  arch/x86/Makefile                     | 4 +++-
>  arch/x86/boot/compressed/Makefile     | 7 +++++--
>  drivers/firmware/efi/libstub/Makefile | 4 ++--
>  9 files changed, 20 insertions(+), 11 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

