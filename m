Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682C78A3BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 03:05:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h9r8Xs18;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYsmG5r3Xz3byL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 11:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h9r8Xs18;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYslM5Z11z2yVc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 11:04:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB4FF60F9A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 01:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD08C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 01:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693184650;
	bh=7d6QsySf2gd+L+AO0DGE52ifXzUav4vvh3Pzbz+MguI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h9r8Xs18EEJZy6xGdnpurwAcC4dI8Zo0XkCbPLZsQfEZ8h+twtCBqTaZN+iKLUk/F
	 ZOv1YpC6wlvRCCWCXaGzPtMX/B//7KpYhatc4+ErFMHjQMEznee9wzgYHonoMV0A8b
	 hV7Cih9zxqMGSVPWJf92hQOnVHToGZzWH5KjTLGRDclwMuFLPS7gJYd3voFEElpxhY
	 wQkve6zevEN4Cit56v6svNMujPuQ/xxnYkjcqgKt0CAwBy2ENQf/6YXKuk5h6nOrTU
	 Suvfx/Byjw5Z/LbQFR5+DPpXbv8KS32TrAD8jVFsmU4EOFvxtZnQEIRyCgB6ACgOv/
	 Ri/nBxhUeeqew==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1c50438636fso1859348fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Aug 2023 18:04:10 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx0YiMTOODWvt2uShrdAdrPqb5YvZNmhVSC9tWW7E9RLsQf4gXF
	FVMU4rVm1EaZ3wBfzQL+VR1NtX8htxnPzxrdmdM=
X-Google-Smtp-Source: AGHT+IEak5zcXFSIFNfF8EdO9/s3v9inAZbyIexqYgsn9SCfLTxxBE6ChlOh4wUhzQSAPtM3t40DM0c5ZfD6PzA7Hog=
X-Received: by 2002:a05:6870:b523:b0:1c8:b870:4e55 with SMTP id
 v35-20020a056870b52300b001c8b8704e55mr10551563oap.49.1693184649240; Sun, 27
 Aug 2023 18:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230825194329.gonna.911-kees@kernel.org>
In-Reply-To: <20230825194329.gonna.911-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 28 Aug 2023 10:03:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
Message-ID: <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> Hi,
>
> This is my series to show *.config targets in the "help" target so these
> various topics can be more easily discoverd.
>
> v2:
>  - split .fragment from .config to hide "internal" fragments

Please do not do this churn.


Like Randy, I did not get "why" part quiet well,
but if you are eager about this,
you can show help message only when the following
("# Help:" prefix for example) is found in the first line.


# Help: blah blah
# other comment








>  - fix various typos
>  - avoid duplicate entries
> v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
>
> Thanks!
>
> -Kees
>
> Kees Cook (2):
>   kbuild: Show Kconfig fragments in "help"
>   kbuild: Split internal config targets from .config into .fragment
>
>  Makefile                                      |  1 -
>  arch/arm/configs/dram_0x00000000.config       |  1 +
>  arch/arm/configs/dram_0xc0000000.config       |  1 +
>  arch/arm/configs/dram_0xd0000000.config       |  1 +
>  arch/arm/configs/lpae.config                  |  1 +
>  arch/arm64/configs/virt.config                |  1 +
>  arch/powerpc/Makefile                         | 26 +++++++++----------
>  .../{32-bit.config =3D> 32-bit.fragment}        |  1 +
>  arch/powerpc/configs/64-bit.config            |  1 -
>  arch/powerpc/configs/64-bit.fragment          |  2 ++
>  ...{85xx-32bit.config =3D> 85xx-32bit.fragment} |  1 +
>  ...{85xx-64bit.config =3D> 85xx-64bit.fragment} |  1 +
>  .../{85xx-hw.config =3D> 85xx-hw.fragment}      |  1 +
>  .../{85xx-smp.config =3D> 85xx-smp.fragment}    |  1 +
>  .../{86xx-hw.config =3D> 86xx-hw.fragment}      |  1 +
>  .../{86xx-smp.config =3D> 86xx-smp.fragment}    |  1 +
>  arch/powerpc/configs/altivec.config           |  1 -
>  arch/powerpc/configs/altivec.fragment         |  2 ++
>  arch/powerpc/configs/be.config                |  1 -
>  arch/powerpc/configs/be.fragment              |  2 ++
>  .../{book3s_32.config =3D> book3s_32.fragment}  |  1 +
>  ...enet_base.config =3D> corenet_base.fragment} |  1 +
>  arch/powerpc/configs/debug.config             |  1 +
>  arch/powerpc/configs/disable-werror.config    |  1 +
>  .../configs/{dpaa.config =3D> dpaa.fragment}    |  1 +
>  ...mb-nonhw.config =3D> fsl-emb-nonhw.fragment} |  1 +
>  .../configs/{guest.config =3D> guest.fragment}  |  1 +
>  arch/powerpc/configs/le.config                |  1 -
>  arch/powerpc/configs/le.fragment              |  2 ++
>  ...85xx_base.config =3D> mpc85xx_base.fragment} |  1 +
>  ...86xx_base.config =3D> mpc86xx_base.fragment} |  1 +
>  .../{ppc64le.config =3D> ppc64le.fragment}      |  1 +
>  arch/powerpc/configs/security.config          |  4 ++-
>  arch/riscv/configs/32-bit.config              |  1 +
>  arch/riscv/configs/64-bit.config              |  1 +
>  arch/s390/configs/btf.config                  |  1 +
>  arch/s390/configs/kasan.config                |  1 +
>  arch/x86/Makefile                             |  4 ---
>  arch/x86/configs/tiny.config                  |  2 ++
>  {kernel =3D> arch/x86}/configs/x86_debug.config |  1 +
>  arch/x86/configs/xen.config                   |  2 ++
>  kernel/configs/debug.config                   |  2 ++
>  kernel/configs/kvm_guest.config               |  1 +
>  kernel/configs/nopm.config                    |  2 ++
>  kernel/configs/rust.config                    |  1 +
>  kernel/configs/tiny-base.config               |  1 -
>  kernel/configs/tiny-base.fragment             |  2 ++
>  kernel/configs/tiny.config                    |  2 ++
>  kernel/configs/xen.config                     |  2 ++
>  scripts/Makefile.defconf                      | 12 ++++++---
>  scripts/kconfig/Makefile                      | 16 +++++++++---
>  51 files changed, 87 insertions(+), 32 deletions(-)
>  rename arch/powerpc/configs/{32-bit.config =3D> 32-bit.fragment} (53%)
>  delete mode 100644 arch/powerpc/configs/64-bit.config
>  create mode 100644 arch/powerpc/configs/64-bit.fragment
>  rename arch/powerpc/configs/{85xx-32bit.config =3D> 85xx-32bit.fragment}=
 (76%)
>  rename arch/powerpc/configs/{85xx-64bit.config =3D> 85xx-64bit.fragment}=
 (78%)
>  rename arch/powerpc/configs/{85xx-hw.config =3D> 85xx-hw.fragment} (98%)
>  rename arch/powerpc/configs/{85xx-smp.config =3D> 85xx-smp.fragment} (59=
%)
>  rename arch/powerpc/configs/{86xx-hw.config =3D> 86xx-hw.fragment} (98%)
>  rename arch/powerpc/configs/{86xx-smp.config =3D> 86xx-smp.fragment} (58=
%)
>  delete mode 100644 arch/powerpc/configs/altivec.config
>  create mode 100644 arch/powerpc/configs/altivec.fragment
>  delete mode 100644 arch/powerpc/configs/be.config
>  create mode 100644 arch/powerpc/configs/be.fragment
>  rename arch/powerpc/configs/{book3s_32.config =3D> book3s_32.fragment} (=
52%)
>  rename arch/powerpc/configs/{corenet_base.config =3D> corenet_base.fragm=
ent} (64%)
>  rename arch/powerpc/configs/{dpaa.config =3D> dpaa.fragment} (80%)
>  rename arch/powerpc/configs/{fsl-emb-nonhw.config =3D> fsl-emb-nonhw.fra=
gment} (98%)
>  rename arch/powerpc/configs/{guest.config =3D> guest.fragment} (85%)
>  delete mode 100644 arch/powerpc/configs/le.config
>  create mode 100644 arch/powerpc/configs/le.fragment
>  rename arch/powerpc/configs/{mpc85xx_base.config =3D> mpc85xx_base.fragm=
ent} (94%)
>  rename arch/powerpc/configs/{mpc86xx_base.config =3D> mpc86xx_base.fragm=
ent} (86%)
>  rename arch/powerpc/configs/{ppc64le.config =3D> ppc64le.fragment} (65%)
>  rename {kernel =3D> arch/x86}/configs/x86_debug.config (90%)
>  delete mode 100644 kernel/configs/tiny-base.config
>  create mode 100644 kernel/configs/tiny-base.fragment
>
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada
