Return-Path: <linuxppc-dev+bounces-2619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E975D9B1C9B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2024 10:15:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XbrTD6fkmz2xn3;
	Sun, 27 Oct 2024 20:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730020512;
	cv=none; b=cVaFNRNfD6Cimaa6ESBAMbHGkAau/HaWj7FByOeMSSLjri6vVVwr3Mhsj193cw+KB96twz7Dimo+WbiRgW5wotynqOKCvgZBFSQvH2qnr52xlGZZYdRLwC+Pb9HKiJtcaVNBDwPRYnFOpDLYwsKOhqKRgZwR/OiStxnzgJjWc8MM3VmABxJk6ir/6x9alLkGe4u2O7Z3TkQbEzP1MPu7UcN5s7XPPtIkxfRyXhamKShl6SFh0m0VHX82jFI17tNiYUAWPQVuXsrGp4o4YXmgCds35l4B7AkuDbiig/puXAVq7ufHe3pTOefgzF0y6NUOwZ04pbfWEW1lBbERqhZpow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730020512; c=relaxed/relaxed;
	bh=9S/Ei1sjD+Tn4DmkvNKvtOUThfLms374l9/Y+XjpWCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXZM+YFhbXMZCi5SZbSiRMyU6dCglOK2EURYvpOluM1MqNifhbQe+QBs/+c56GCry0tNlt7oMXMalwh5JcbUSwipvwKg2MZ5PGEB182hl+e+1ccGD5vdR3kT/H6gVEMSDCS6EulOipzWMPNZL8UgDapFG8Tu3Cz5eAKt2Co6HOpHJ2B0NzN54CljYjobQh3yxj7x7ayFgPMcVA+xAK79VUcFMlCEpm0rolRFahIwHty3xL81iLRB9sUJ1tI76h6wv5y2IIpw5uHGOaPaaOs+t9OxXY/M//c5vWIWsEuX4da9ec4Q0H6XCRtFw0iP61i7/PKVbGhux0Kw9Y1rq/bclQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVestXT0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVestXT0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XbrTB6Gtxz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 20:15:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D8045C572C
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 09:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603C7C4CEEA
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730020506;
	bh=k1KsRcgzwFXdAtNAW7/FLWTNb3Q1hSDQbTFJH/oZzh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVestXT0+yhJZgVrcJijfqIAW/B+3ykzbo/hyKArqkTlFYaU6ZbPehpw6Xj2KiVti
	 fHfIfnV5I8PxLAe5DLQSCH4gNM1JKWkC0w+iA+NaU+0ducvrvVegTzFsQFcqnhX9qp
	 3zzwj0ebYagGoW4eUHd8J6h8ZnXnpTVVMtP/nOOMQaYhZazxsmBOLxbPYoEUkj6w7v
	 C2NDvqU3PfYyyVqL2mnreCn/cQRF7smkMkLmF7ZTJKw2g2YyknhTViMNK1nTG5/Qej
	 Diyrsvtuu7PThhvWA4EqCHS0YCLRen4Q4IcK7W+6s9rxVjZQVbmTn0jWxhUE0WbF8T
	 HBGDrNlZL5KyQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f72c913aso4222770e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 02:15:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw5zpHhvGiTAKHfK9drbCJ+MGZfm5jeUWezVomWpFEc1x2P+RFf
	CqhP+uwHkJzGP4twZFJ1JrA3EfRfibNNzq9ycfSLHdHVuQQX0RFvLW4vb0pQ/TBM6/3IilOwRqR
	XB/LH1iwzgLShaOSdf2Ma5+2RCWc=
X-Google-Smtp-Source: AGHT+IGJls0rHOV2LU5nnq3z6pVUca+erZrQxZ96fYuXcWPbiROC4rRHM9ZevPYab7r1XRwF1Pk0540wsseF9JTljFE=
X-Received: by 2002:a05:6512:10c7:b0:539:fcb2:2ff4 with SMTP id
 2adb3069b0e04-53b34b373dcmr1403081e87.53.1730020504955; Sun, 27 Oct 2024
 02:15:04 -0700 (PDT)
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
References: <20241018173632.277333-1-hbathini@linux.ibm.com> <20241018173632.277333-12-hbathini@linux.ibm.com>
In-Reply-To: <20241018173632.277333-12-hbathini@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Oct 2024 18:14:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOPgcPsHJVy7vxfRBX0fowMzOhnZ0RLcoerGMUCGdSGQ@mail.gmail.com>
Message-ID: <CAK7LNAQOPgcPsHJVy7vxfRBX0fowMzOhnZ0RLcoerGMUCGdSGQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/17] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 19, 2024 at 2:37=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
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
> @@ -198,6 +198,11 @@ fi
>
>  ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=3Dinit init/version-t=
imestamp.o
>
> +arch_vmlinux_o=3D""

Nit:  unnecessary double quotes.

arch_vmlinux_o=3D

is enough.


Other than that,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>








--
Best Regards
Masahiro Yamada

