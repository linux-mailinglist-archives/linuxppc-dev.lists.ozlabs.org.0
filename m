Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE552901DEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 11:16:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV7ZHMyR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyR4R5Hc1z3cTS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 19:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV7ZHMyR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyR3k20k0z3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 19:15:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE998CE10B2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 09:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C103C4AF50
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718010929;
	bh=N/udf5KjKnp6KkODHaluGHvkP06mQoecLGwDlGaPwdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qV7ZHMyRiOL6cqPpFOQDct9ll9sGO3ONfcPh/E1YfcjM3+w1Emlif3PMJezyEQQXf
	 YNKV9ARiC/Sfo3ibXPeDnil9wTEA3YdI54OWL9BmTyDz+tuNf0bAWpymufGXgEL/T1
	 46YuysrOBWfFmRHj8Sq9enjyEsYnLf4+CR8UYuPxnvuWDHRmOxwWpZ1/frrw6vpcjy
	 hBDDc8KoikGF35suUOV8bWywr5k6Aelkg6x0Z1urKMfa31DbVyd/Gq0OVxqtsVPBxu
	 0VYSifqqLlkgKQEkBQ9a9/j2c1et5NFKHy2G0/xfI9du8HVw1zZJfHuFEUeYbYFrK5
	 lA3TAT4jM38mg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so2317751fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 02:15:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YwnO7oTsKgIttHXOFtMclk9GNe+ZMXZtL/wE93Mm36XrzVpvH8L
	QlwmNLA7wfK6mP5ZHa9BO90PPGILWy/C4iC/zY9J1N5TVOCbZP/XBOhxPFKpmrIlp4kDra+FNE/
	x569kavXGwYeyUDqV+TnP+8UefUI=
X-Google-Smtp-Source: AGHT+IF8kBB5e7uEX/lp0gL8ORoHVw4jAOXzmFAoDzeced7cCK1aaHB7FH4WFgEbVoLQZsy2JFutB8ffiboCMXA/lwM=
X-Received: by 2002:a2e:97d1:0:b0:2ea:ea29:32b5 with SMTP id
 38308e7fff4ca-2eaea293445mr40465811fa.32.1718010927655; Mon, 10 Jun 2024
 02:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718008093.git.naveen@kernel.org> <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
In-Reply-To: <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Jun 2024 18:14:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com>
Message-ID: <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Naveen N Rao <naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2024 at 5:39=E2=80=AFPM Naveen N Rao <naveen@kernel.org> wr=
ote:
>
> On powerpc, we would like to be able to make a pass on vmlinux.o and
> generate a new object file to be linked into vmlinux. Add a generic pass
> in link-vmlinux.sh that architectures can use for this purpose.
> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
> provide arch/<arch>/tools/vmlinux_o.sh, which will be invoked prior to
> the final vmlinux link step.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/Kconfig            |  3 +++
>  scripts/link-vmlinux.sh | 18 +++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..649f0903e7ef 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  config ARCH_NEED_CMPXCHG_1_EMU
>         bool
>
> +config ARCH_WANTS_PRE_LINK_VMLINUX
> +       def_bool n
> +
>  endmenu
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 46ce5d04dbeb..07f70e105d82 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -122,7 +122,7 @@ gen_btf()
>                 return 1
>         fi
>
> -       vmlinux_link ${1}
> +       vmlinux_link ${1} ${arch_vmlinux_o}
>
>         info "BTF" ${2}
>         LLVM_OBJCOPY=3D"${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
> @@ -178,7 +178,7 @@ kallsyms_step()
>         kallsymso=3D${kallsyms_vmlinux}.o
>         kallsyms_S=3D${kallsyms_vmlinux}.S
>
> -       vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinu=
x_bin_o}
> +       vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinu=
x_bin_o} ${arch_vmlinux_o}
>         mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
>         kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
>
> @@ -203,6 +203,7 @@ sorttable()
>
>  cleanup()
>  {
> +       rm -f .arch.vmlinux.*
>         rm -f .btf.*
>         rm -f System.map
>         rm -f vmlinux
> @@ -223,6 +224,17 @@ fi
>
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=3Dinit init/version-t=
imestamp.o
>
> +arch_vmlinux_o=3D""
> +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> +       arch_vmlinux_o=3D.arch.vmlinux.o
> +       info "ARCH" ${arch_vmlinux_o}
> +       if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vmlinux=
_o} ; then
> +               echo >&2 "Failed to generate ${arch_vmlinux_o}"
> +               echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_VMLIN=
UX"
> +               exit 1
> +       fi
> +fi



This is wrong because scripts/link-vmlinux.sh is not triggered
even when source files under arch/powerpc/tools/ are changed.

Presumably, scripts/Makefile.vmlinux will be the right place.





> +
>  btf_vmlinux_bin_o=3D""
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>         btf_vmlinux_bin_o=3D.btf.vmlinux.bin.o
> @@ -273,7 +285,7 @@ if is_enabled CONFIG_KALLSYMS; then
>         fi
>  fi
>
> -vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
> +vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o} ${arch_vmlinux_=
o}
>
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada
