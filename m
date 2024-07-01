Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AD891DB75
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 11:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qqv7DPed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCLQm1tfmz3fwm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 19:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qqv7DPed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCLQ4173dz3fmH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 19:31:07 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-706b53ee183so2518634b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 02:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719826265; x=1720431065; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORLsqYDozGGQHazYB1vFAMEwUxePoC0MYlzI3YFADyM=;
        b=Qqv7DPedW+8XYKyRRYkBOkf7OM7v+Arz2jNwOeAZzbU6SRspgUChvsgJrYhWzAhLp0
         YWW1LqL4JRkNJ0UVqH50fnwGeGA0HTgSWBZOAflzYzaa+hf4Xm9vpi6rjPJzl5zkWEH5
         ArcgKHOjGnd6SkKZpNngBd7+QmVZYCYS7NTgvj5bbUfcmVbF9F99PATJ88j94RTPEf3g
         BEVGFNZtrj8m/blk9wkIXB33SNhYVOm+xCctmHoaI/Iz7bE01gp3ITSY+oLv/4SdK7Hz
         DQ8KUXxnWvqYZJo0YASmHVp3m37yvwOpkCafmdCjs2e1PUJ2VyfySbcRi4qnm0/yGMXU
         pSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826265; x=1720431065;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ORLsqYDozGGQHazYB1vFAMEwUxePoC0MYlzI3YFADyM=;
        b=Krs9R70lj1TVqrGvd/WtGs+xqSIurh4a9SZMC8pypChurNPIQ3x7szxVpCvZt0Zfo9
         rtlJeTVXf8UBetdPo0UyeKW+MW4dsvq4nSsPSbCPHT3tS1S/zJka/97Tfc9bnBobv81C
         7bglVXm8il2WR9O7F3yOypSHw9SNvBbV2Cs8QNf5HyM+xxAuDqNPDnagB7pS8FcGwoju
         bDoaKpg9VolrJqZxDzgZxJphAntL1qyivlb3VdTN+Z7d7FS9bdsWydlx6ohRYtYHjCcz
         Mm8YkBC9Jl8gBoLebGNaa5vfTpJ7OSsYsl+ssTn05C7kLuX876VG8HlaJ8bzHDOi59f6
         LdJw==
X-Forwarded-Encrypted: i=1; AJvYcCXZkQuTfZiX4eK3a1Sv6+aIsHnXTvPACGtkuXQlbIPgN4WxS93ZiSWhhtQKabniepNBcy5IdqYVydx4vBIc8zDIdp2OLkbZO3n5wxm/dQ==
X-Gm-Message-State: AOJu0Yyf0aAKLOKrfuFof1iBFcSaNySq/14usoV3U6MtwDhalrm0x7ZZ
	LgYUolqrJmRB15eYFaX0GdKI970VDtpuJSrzjz8AkbA5ukCI0YqY
X-Google-Smtp-Source: AGHT+IHtdZNcHIniXJIYYH2e8PojgzEqciWgh1slaKx0J2rNH4ZsGskgBTwGuCXxoA/fCUlDhB3m8w==
X-Received: by 2002:a05:6a20:cf84:b0:1be:c41d:b6b7 with SMTP id adf61e73a8af0-1bef624385dmr6815619637.19.1719826265398;
        Mon, 01 Jul 2024 02:31:05 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708048942b9sm6014253b3a.190.2024.07.01.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 02:31:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 19:30:56 +1000
Message-Id: <D2E3IZ8IEYRJ.1QO5PIRLRD7Z4@gmail.com>
Subject: Re: [RFC PATCH v3 05/11] kbuild: Add generic hook for architectures
 to use before the final vmlinux link
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <8b296f09aa8a702095f8be04e9f0e167db5b4d77.1718908016.git.naveen@kernel.org>
In-Reply-To: <8b296f09aa8a702095f8be04e9f0e167db5b4d77.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> On powerpc, we would like to be able to make a pass on vmlinux.o and
> generate a new object file to be linked into vmlinux. Add a generic pass
> in Makefile.vmlinux that architectures can use for this purpose.
>
> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
> will be invoked prior to the final vmlinux link step.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/Kconfig             |  3 +++
>  scripts/Makefile.vmlinux |  8 ++++++++
>  scripts/link-vmlinux.sh  | 11 ++++++++---
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..649f0903e7ef 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  config ARCH_NEED_CMPXCHG_1_EMU
>  	bool
> =20
> +config ARCH_WANTS_PRE_LINK_VMLINUX
> +	def_bool n

Could you add a comment above this (that contains basically
the 2nd paragraph of your changelog)?

Thanks,
Nick

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

