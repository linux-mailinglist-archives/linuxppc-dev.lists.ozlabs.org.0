Return-Path: <linuxppc-dev+bounces-1891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D487996F8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 17:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNxWC5xtXz30gn;
	Thu, 10 Oct 2024 02:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728487447;
	cv=none; b=cATTS5G9MbjnqUzIegVbQ1jKDwe8dQT1Kj4Q0L0bnnGnLN3L98UguV3x7eb8pQRrrb6roarx9M9wU40fZjV93sYzLO8h1PtuxYOVMxmAdNmOVRVc2RS92JBDIgeRpCpVty/ck+QlC1j9KwK4YNpjbv75Qs75EwansFpyYSPDsbS8F+qkbg5/I/W/iwWubO9TbBh1wXRStAowZbmbm6AkX2wlqRQQga1o1mlW7qYX2Q0aXRJ1ZQ0thBhYLZska+5x94NuS100e3qqzMDcDYUsLRMtn9D2KpwQkZ3VAClFEu79YOSb9ui9EQWfhV8k4/QCvuRMrZVhAQqcRIMtalf0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728487447; c=relaxed/relaxed;
	bh=JOTFog4aDTT1ysqXRYjJQyonjrG0CnkCXTLB5NUoIaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbtY2Pbo1Kna9VeKs7jUF6vnJU2AgGbhefMEM9t9DjOWXE/WVN4tzP96RfmB9F4slEKV25zEftO27tklKTZs36Y1KPYXmThvKoDFCWPg9JblSDhQT6oV78l7PepZDQTnybnRZuApWtrHcGTkJ+R7CC+ntUmj13PL0I+qtZz7kGyIVJ5YZCAui36OF/FtNHpk3ixFENXQ4mOxXIHB/BX2aeOnee5oPZN9fO63DcUpwedLtP1Th9ZOsdsA2XyH9oalxYet9s5FMxDPwLmxH44pbGEt84BY9rAxkvE8QM21gRMpsRPfC5PS6+Tns0WmvGULq152rtQPEruLAQI3wMn5Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hOKOvzKx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hOKOvzKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNxWB3nVBz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 02:24:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98BF25C57FD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC852C4CED2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728487439;
	bh=4AjksnzzW5k8hBBme1kBI/+DD7QGwpafnwlUuyqFM6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hOKOvzKxW6op8p2Rq75UJoop9Pd0jFDZDJXovc+WfjxUYXz+3mIUeE+rqO8deMQol
	 D5Q3zUA2oddqsXKrwAYpUx3bSQVX+ifmZDaQcwFkhqcmlYKbkRvQQSygISBlUEYBiz
	 lwIbYr5wZA0P1+iQQH52qhdR8w68Xqow/FF9F6Ktjv5n+WLCQrdhmpx8dj00R8El+E
	 1s8C+p+0+ykam250o5nlc5/KtVQdMDSoZGcveRbLtfo5TutKX+KDW+EFjRaTtT/sgx
	 YdUBVf2B++TXBgNKhR8m1OEuIQjCyQvBCHF8mhTQDPplS3zIR4l17t7YN6gzrsovb7
	 cxqKuczpR6kxQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-537a399e06dso7352319e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2024 08:23:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YxY9x91h0vvmMRUSMaj8mKb0xLN5E59J0CYL4BMxx7hwvJBY9R0
	bIelr/g4arDvr3jg3m8iAMz9JRa6zuhDUoEJdoOPLRf/F/NkM4QADOFKMH/o90xNWOGH/PW/MSZ
	VbGehsgCf3XE3uom1LTFuv0qnqlo=
X-Google-Smtp-Source: AGHT+IEiWPw+RQ+TnDaHXfM/Mw/zmdX2TI3sj1La8whAJdJcZ29a26S9fWhexgESxPKq+5AXQsmOXW5h7DnougX3kLY=
X-Received: by 2002:a05:6512:1188:b0:539:9d24:9ea with SMTP id
 2adb3069b0e04-539c48d93dfmr1743896e87.34.1728487438407; Wed, 09 Oct 2024
 08:23:58 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com> <20240915205648.830121-12-hbathini@linux.ibm.com>
In-Reply-To: <20240915205648.830121-12-hbathini@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 10 Oct 2024 00:23:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9LPPxVOU55t2C_vkXYXK-8_2bHCVPWVxYdwrSrxCduw@mail.gmail.com>
Message-ID: <CAK7LNAS9LPPxVOU55t2C_vkXYXK-8_2bHCVPWVxYdwrSrxCduw@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Naveen N. Rao" <naveen@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 16, 2024 at 5:58=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> From: Naveen N Rao <naveen@kernel.org>
>
> On powerpc, we would like to be able to make a pass on vmlinux.o and
> generate a new object file to be linked into vmlinux. Add a generic pass
> in Makefile.vmlinux that architectures can use for this purpose.
>
> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
> will be invoked prior to the final vmlinux link step.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> Changes in v5:
> * Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
>
>
>  arch/Kconfig             | 6 ++++++
>  scripts/Makefile.vmlinux | 7 +++++++
>  scripts/link-vmlinux.sh  | 7 ++++++-
>  3 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..ef868ff8156a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  config ARCH_NEED_CMPXCHG_1_EMU
>         bool
>
> +config ARCH_WANTS_PRE_LINK_VMLINUX
> +       def_bool n


Redundant default. This line should be "bool".






> +       help
> +         An architecture can select this if it provides arch/<arch>/tool=
s/Makefile
> +         with .arch.vmlinux.o target to be linked into vmlinux.
> +
>  endmenu
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..edf6fae8d960 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -22,6 +22,13 @@ targets +=3D .vmlinux.export.o
>  vmlinux: .vmlinux.export.o
>  endif
>
> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> +vmlinux: arch/$(SRCARCH)/tools/.vmlinux.arch.o

If you move this to arch/*/tools/, there is no reason
to make it a hidden file.


vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o




> +arch/$(SRCARCH)/tools/.vmlinux.arch.o: vmlinux.o

FORCE is missing.


arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE



> +       $(Q)$(MAKE) $(build)=3Darch/$(SRCARCH)/tools $@
> +endif
> +
>  ARCH_POSTLINK :=3D $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postli=
nk)
>
>  # Final link of vmlinux with optional arch pass after final link
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f7b2503cdba9..b3a940c0e6c2 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -100,7 +100,7 @@ vmlinux_link()
>         ${ld} ${ldflags} -o ${output}                                   \
>                 ${wl}--whole-archive ${objs} ${wl}--no-whole-archive    \
>                 ${wl}--start-group ${libs} ${wl}--end-group             \
> -               ${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
> +               ${kallsymso} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldl=
ibs}
>  }
>
>  # generate .BTF typeinfo from DWARF debuginfo
> @@ -214,6 +214,11 @@ fi
>
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=3Dinit init/version-t=
imestamp.o
>
> +arch_vmlinux_o=3D""
> +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> +       arch_vmlinux_o=3Darch/${SRCARCH}/tools/.vmlinux.arch.o


arch_vmlinux_o=3Darch/${SRCARCH}/tools/vmlinux.arch.o



> +fi
> +
>  btf_vmlinux_bin_o=3D
>  kallsymso=3D
>  strip_debug=3D
> --
> 2.46.0
>


--
Best Regards
Masahiro Yamada

