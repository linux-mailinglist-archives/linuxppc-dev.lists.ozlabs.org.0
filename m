Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96271930EC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 09:30:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DS2EtweV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMv4g3ZRKz3clY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 17:30:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DS2EtweV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMv3z1nJrz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 17:30:07 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fbc0a1494dso22858275ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721028604; x=1721633404; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKQo9FhAVoaowXJ5veaqZ/q1Hr6Iori2+sa1LUwT+cM=;
        b=DS2EtweV7lPeODuJQn4L5wmz2YhJMUUGlWlRPZ4JUEc6GoxLgeuMCAWOzYVWgfFURS
         C3DYdOn+KHcjtlpGkmqUGZatQ6zqe+uBy/OFEKgmivMK0Gr/tFvJC+RG+B8DR5U4urSn
         NL7NXJjmSEmGRW9s1tz3T8qzs3cal59Do+5ytJBIYN/FFwt6ZcTHZAOtJHGKkRA2oM/N
         5g6IvzGMtLVcBtT26In6e+dnHP1cEoRVhIhISVj3Hax9ksIQg+3VIFei3Gpv5xR10p9F
         woi6kbUWU0dYhoX7q4QH4uJ2TJWLifOiLWeAIbQMl08f8Oe2w2PD+ciwOOoW2upL15XP
         84lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028604; x=1721633404;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NKQo9FhAVoaowXJ5veaqZ/q1Hr6Iori2+sa1LUwT+cM=;
        b=X0BzU3yS0ckelx3NZlM8NFQ6i/XqSV2b5bpY14LIbpkThb1RZfheeoJX8qAifX1wON
         gXAEh3kzKYdasOHKzsA4WGO21gaUWc4NHA0FW6MdeBiKh/MgHBc0gpQXqLO+IVb+xK8r
         R/hJFrbERm2PxGSrMgEiwRQGU3+XINhmS6uoM3tS/MSKQ5AvZN/YPJ+cyNmEYAOr4ttJ
         OQmrLgYrhql+Nf0NFQDEoXq2S+38RGLmRKfR7KNWbiC3RFWjE1JuXYBKgg+tF29b6AIj
         sqzfj1LNb2FAQLoNEkNXU6b96jM7qN+Tdrjxz2mMkBFU/O2ed0aYtGsgeoI2meMNt2rN
         d0fg==
X-Forwarded-Encrypted: i=1; AJvYcCUAkkuBp9Vk0wMOz8YACpGVDxFMe8fSdw8E5zCauYQMK0rxxOLy4r0Wb4woo37PyzGj1R2nw9Dq4WnpBC1E3Wgex7Qff8Hn4tHODhs3fA==
X-Gm-Message-State: AOJu0YxEbP1OkpHGbv2G+9R06btg0OzxU7ZWpMsIMoHR8pUutDznTfvz
	sTxZGAXanG0ORJVPqgDifY3vkm25ktzuoLIhJfS0LMid4+14KQWP
X-Google-Smtp-Source: AGHT+IH8nFjkvz8RIHB/6NaJPlNL5ZFJl57TrddGB9e6no/jh+pmO1LMjIcEgSJT25B+vybEayFdXw==
X-Received: by 2002:a17:903:1cc:b0:1fb:8d32:d87b with SMTP id d9443c01a7336-1fbb6d0ae62mr129811745ad.15.1721028604282;
        Mon, 15 Jul 2024 00:30:04 -0700 (PDT)
Received: from localhost ([1.146.120.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc381a1sm34105525ad.202.2024.07.15.00.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 00:30:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jul 2024 17:29:53 +1000
Message-Id: <D2PXPX96JT5D.3BP6QTVVEA3VA@gmail.com>
Subject: Re: [RFC PATCH v4 11/17] kbuild: Add generic hook for architectures
 to use before the final vmlinux link
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720942106.git.naveen@kernel.org>
 <87b71debd931011f8b9204c700b3084a6c3cdab8.1720942106.git.naveen@kernel.org>
In-Reply-To: <87b71debd931011f8b9204c700b3084a6c3cdab8.1720942106.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Jul 14, 2024 at 6:27 PM AEST, Naveen N Rao wrote:
> On powerpc, we would like to be able to make a pass on vmlinux.o and
> generate a new object file to be linked into vmlinux. Add a generic pass
> in Makefile.vmlinux that architectures can use for this purpose.
>
> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
> will be invoked prior to the final vmlinux link step.

Maybe POSTLINK should move to more like this with explicit config
option too rather than just picking up Makefile.postlink...

>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/Kconfig             |  6 ++++++
>  scripts/Makefile.vmlinux |  8 ++++++++
>  scripts/link-vmlinux.sh  | 11 ++++++++---
>  3 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..ef868ff8156a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  config ARCH_NEED_CMPXCHG_1_EMU
>  	bool
> =20
> +config ARCH_WANTS_PRE_LINK_VMLINUX
> +	def_bool n
> +	help
> +	  An architecture can select this if it provides arch/<arch>/tools/Make=
file
> +	  with .arch.vmlinux.o target to be linked into vmlinux.

Someone bikeshedded me before for putting comments for putting comment
for non-user-selectable option in 'help'. Even though heaps of options
are like that here, apparently they preferred # comment above the option
for developer comments. I personally thought this looks nicer but do
Kconfig maintainers prefer #?

> +
>  endmenu
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..6410e0be7f52 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -22,6 +22,14 @@ targets +=3D .vmlinux.export.o
>  vmlinux: .vmlinux.export.o
>  endif
> =20
> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> +targets +=3D .arch.vmlinux.o
> +.arch.vmlinux.o: vmlinux.o FORCE
> +	$(Q)$(MAKE) $(build)=3Darch/$(SRCARCH)/tools .arch.vmlinux.o
> +
> +vmlinux: .arch.vmlinux.o
> +endif

Does .vmlinux.arch.o follow convention better? I guess the btf does
not. So, nevermind.

Could this just be done entirely in link-vmlinux.sh like kallsyms and
btf?

> +
>  ARCH_POSTLINK :=3D $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postli=
nk)
> =20
>  # Final link of vmlinux with optional arch pass after final link
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 518c70b8db50..aafaed1412ea 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -122,7 +122,7 @@ gen_btf()
>  		return 1
>  	fi
> =20
> -	vmlinux_link ${1}
> +	vmlinux_link ${1} ${arch_vmlinux_o}
> =20
>  	info "BTF" ${2}
>  	LLVM_OBJCOPY=3D"${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}

BTF generation needs  the prelink .o?

> @@ -178,7 +178,7 @@ kallsyms_step()
>  	kallsymso=3D${kallsyms_vmlinux}.o
>  	kallsyms_S=3D${kallsyms_vmlinux}.S
> =20
> -	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_=
o}
> +	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_=
o} ${arch_vmlinux_o}
>  	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
>  	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
> =20

> @@ -223,6 +223,11 @@ fi
> =20
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=3Dinit init/version-t=
imestamp.o
> =20
> +arch_vmlinux_o=3D""
> +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> +	arch_vmlinux_o=3D.arch.vmlinux.o
> +fi
> +
>  btf_vmlinux_bin_o=3D""
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>  	btf_vmlinux_bin_o=3D.btf.vmlinux.bin.o
> @@ -273,7 +278,7 @@ if is_enabled CONFIG_KALLSYMS; then
>  	fi
>  fi
> =20
> -vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
> +vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o} ${arch_vmlinux_=
o}
> =20
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then

I guess it looks okay, similar to btf although I'm not a kbuild expert.

Thanks,
Nick
