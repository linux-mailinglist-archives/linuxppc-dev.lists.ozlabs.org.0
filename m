Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C0582C239
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 15:53:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jHicdR7y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBPfv45F2z3c0n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 01:53:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jHicdR7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBPf06yytz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 01:52:39 +1100 (AEDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-204301f2934so4093871fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705071150; x=1705675950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO45YkzCWML/dfVASjM1WgREcSCHVv4YlKgRi2In5SM=;
        b=jHicdR7y2P7/VE/Wb1WtHvrY0NmmoJWhWD9gD3hNr9UNMRZN2LSubbKDhV/W/K7I02
         7iKm7pelBLZZ3jQJD4vdzV5Pkz5exs/CL5q7JrjhjGoJNRbI0xsASAfYW4q3J1zgHk3e
         rggmSF1LZ43HLO+lUPgQ3awZ9T8GAEjIj3iUDhxb3GDU3DsvDzx350eNzdVkWr3VVkXY
         26PYai2H5fVGZo3bGvLCr3sVKGHyvul5d1At4JeilycnchZdFb7AkStH/i4DrEmletHl
         oiVGRjex8lb6PQgn4V5f6D1nvCXP4RVi9OjbJv9CnjEWJCGeY4OYP5JcyOOz4cRaLR1U
         r7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071150; x=1705675950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZO45YkzCWML/dfVASjM1WgREcSCHVv4YlKgRi2In5SM=;
        b=Gz9MazJZ8qVOvC/O5rn4uKf5eQOQ5XXY9iEdM0WVh7rGcWe+sRV4Q33XYYDUUnIKJ1
         JcX+6JlP0/m19ur42SMEVtzp28aJypqS9twxCWQ17brX904sSZi2hV4Aixef4qX3GDeb
         wofR3haKUpyzJ/8j6yP0DKylHd+wL+gj5Q96ZWEyAHOW+znrPP0nsvuHNFXtcrfkAiMh
         wlGWafRH0VUzREBC8J6QVk2bwVcumhKMHfCfUvRs6kLlKvIRkYLlnwBxPFT0ucmkkW51
         GmeIeCehYHPCpKJ+CrDErsNEE5bA2LvSlclHSM5W4yXewVoG9jirj7v/7CNd2wX+cwuF
         3vpg==
X-Gm-Message-State: AOJu0YzOQz43IFPCRrTBAd/OoEEtwbpXY70a4YX3QJp4Jnbz71wjNlNA
	P0FcnlUswWwKm1zTS1GgmpfmuILnJ6gZpQMnjmY=
X-Google-Smtp-Source: AGHT+IF3L5IPA3aINLKE1Gh2ONL1jl1iO/jiOLm/9Zoi+Tx7cZA3qsT/gQ+IN9bZafCkSYUcodRd62GQ0tiAxg2qKZk=
X-Received: by 2002:a05:6871:452:b0:206:8691:cc78 with SMTP id
 e18-20020a056871045200b002068691cc78mr1680164oag.34.1705071149757; Fri, 12
 Jan 2024 06:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
In-Reply-To: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jan 2024 09:52:17 -0500
Message-ID: <CADnq5_MVDDR-EvgSEhiw_qPkUDPnV25tjUN0SNYq45Q29BN4EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, ast@kernel.org, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mykolal@fb.com, daniel@iogearbox.net, andrii@kernel.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 9, 2024 at 5:26=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> This series updates all instances of LLVM Phabricator and Bugzilla links
> to point to GitHub commits directly and LLVM's Bugzilla to GitHub issue
> shortlinks respectively.
>
> I split up the Phabricator patch into BPF selftests and the rest of the
> kernel in case the BPF folks want to take it separately from the rest of
> the series, there are obviously no dependency issues in that case. The
> Bugzilla change was mechanical enough and should have no conflicts.
>
> I am aiming this at Andrew and CC'ing other lists, in case maintainers
> want to chime in, but I think this is pretty uncontroversial (famous
> last words...).
>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> Nathan Chancellor (3):
>       selftests/bpf: Update LLVM Phabricator links
>       arch and include: Update LLVM Phabricator links
>       treewide: Update LLVM Bugzilla links
>
>  arch/arm64/Kconfig                                 |  4 +--
>  arch/powerpc/Makefile                              |  4 +--
>  arch/powerpc/kvm/book3s_hv_nested.c                |  2 +-
>  arch/riscv/Kconfig                                 |  2 +-
>  arch/riscv/include/asm/ftrace.h                    |  2 +-
>  arch/s390/include/asm/ftrace.h                     |  2 +-
>  arch/x86/power/Makefile                            |  2 +-
>  crypto/blake2b_generic.c                           |  2 +-
>  drivers/firmware/efi/libstub/Makefile              |  2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  2 +-
>  drivers/media/test-drivers/vicodec/codec-fwht.c    |  2 +-
>  drivers/regulator/Kconfig                          |  2 +-
>  include/asm-generic/vmlinux.lds.h                  |  2 +-
>  include/linux/compiler-clang.h                     |  2 +-
>  lib/Kconfig.kasan                                  |  2 +-
>  lib/raid6/Makefile                                 |  2 +-
>  lib/stackinit_kunit.c                              |  2 +-
>  mm/slab_common.c                                   |  2 +-
>  net/bridge/br_multicast.c                          |  2 +-
>  security/Kconfig                                   |  2 +-
>  tools/testing/selftests/bpf/README.rst             | 32 +++++++++++-----=
------
>  tools/testing/selftests/bpf/prog_tests/xdpwall.c   |  2 +-
>  .../selftests/bpf/progs/test_core_reloc_type_id.c  |  2 +-
>  23 files changed, 40 insertions(+), 40 deletions(-)
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240109-update-llvm-links-d03f9d649e1e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
