Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E292734AE42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 19:10:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6VPg6Bm2z3c6J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 05:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rZ5aSSs1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=andrii.nakryiko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rZ5aSSs1; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6VPB3s7Pz30CK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 05:09:48 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id o66so6693049ybg.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZhDceGf5EPwxqOmSXw7vSwKwAN2oE3kPh5APLhrkFoc=;
 b=rZ5aSSs1FMJf5GOkwaIlzevMhDtIv7GWGcyp/tMZriePwT5YUyIaPyEGKp2gaPLE2l
 QJNagORWX24s9kDaMB8RWeFqZ5FQpu9tN4mO3Cg3A2kqJfgu7uX822GyYYNo9JvDZjJz
 6JVN6mF8zW4m8a95krBY959jji1or981S1VIn1uGOnvq1aJ58VLwtr9d2MNIQ/k6gJbs
 fFNWCW9ZEtoxN+71hkrz07cWEKdhifXdRVS/QYRojYXy7/stfTVT/8CHCRt/L6htJX8g
 K0as0xRGm/ajFmHbeGvhACS4PRdWsX0Mhr+a6DmJreZzz9nt8AMShYtp6kfrMopsZ1Km
 WaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZhDceGf5EPwxqOmSXw7vSwKwAN2oE3kPh5APLhrkFoc=;
 b=XHmFbHEFUGzFF8wPx4zDDGx6/tRYPE0mziNoeEuLkZ2Q5GzSHf4sVts3Bqa/SBTv4K
 KaMsxYb6/1P7RVb5wAXdDcZ+ELxcW+HoxnhCiL7kFDWsLALx77BByhGO/bLBTB/7XxNq
 lUmyHaLFFAtHmypjE9/adMxTYh3DQFd1NnVNLhEXJZaHa+ePBTPBfYqRqPVBpImiJmlt
 u5N78RHai2lZdeSHQ7VoLPivT5GXNDvmofLTVO6F+OUFrxL5/uNYI7H3ge5GSZK2xY+x
 GRLXqmPBwhOUJxAistuZ1c1DOK62stNaA8cDd9MioU5rDWkA2gWXIfP/enXKefrPjX3B
 Ki7w==
X-Gm-Message-State: AOAM530HE0+S1mGg2LdI94JiNNueyuvdM+lTpYzHQkC8YWQIZNARkcB4
 O3/NH49f2nRD7t1HxWpUpGs3pytcB+QeEaYcIYo=
X-Google-Smtp-Source: ABdhPJwZWcSa7JQvBA9hqNB5lZjLdckzgvKVymMhVosuDluUt0M9JwkAjau2sBLidm357xNSn5TXDUV43T3H05sAiIo=
X-Received: by 2002:a25:ab03:: with SMTP id u3mr15164570ybi.347.1616782181703; 
 Fri, 26 Mar 2021 11:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
 <CAEf4BzZjNK_La1t5FGyie02FCABBieZJod49rW4=WtMs7ELLSw@mail.gmail.com>
 <86028d25-c3fe-3765-f7c3-12448523405a@csgroup.eu>
In-Reply-To: <86028d25-c3fe-3765-f7c3-12448523405a@csgroup.eu>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 26 Mar 2021 11:09:30 -0700
Message-ID: <CAEf4BzaNh2hDmY+9CZWTDOF2gXtPcs9iGYj6PADgH4RuUOPsKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Implement EBPF on powerpc32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 john fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, naveen.n.rao@linux.ibm.com,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin Lau <kafai@fb.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 7:42 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/03/2021 =C3=A0 18:53, Andrii Nakryiko a =C3=A9crit :
> > On Mon, Mar 22, 2021 at 9:37 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> This series implements extended BPF on powerpc32. For the implementati=
on
> >> details, see the patch before the last.
> >>
> >> The following operations are not implemented:
> >>
> >>                  case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /=3D src */
> >>                  case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %=3D src */
> >>                  case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + o=
ff) +=3D src */
> >>
> >> The following operations are only implemented for power of two constan=
ts:
> >>
> >>                  case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %=3D imm */
> >>                  case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /=3D imm */
> >>
> >> Below are the results on a powerpc 885:
> >> - with the patch, with and without bpf_jit_enable
> >> - without the patch, with bpf_jit_enable (ie with CBPF)
> >>
> >> With the patch, with bpf_jit_enable =3D 1 :
> >>
> >> [   60.826529] test_bpf: Summary: 378 PASSED, 0 FAILED, [354/366 JIT'e=
d]
> >> [   60.832505] test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> >>
> >> With the patch, with bpf_jit_enable =3D 0 :
> >>
> >> [   75.186337] test_bpf: Summary: 378 PASSED, 0 FAILED, [0/366 JIT'ed]
> >> [   75.192325] test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> >>
> >> Without the patch, with bpf_jit_enable =3D 1 :
> >>
> >> [  186.112429] test_bpf: Summary: 371 PASSED, 7 FAILED, [119/366 JIT'e=
d]
> >>
> >> Couldn't run test_progs because it doesn't build (clang 11 crashes dur=
ing the build).
> >
> > Can you please try checking out the latest clang from sources and use
> > that one instead?
>
> The crash is fixed, it builds one step more, then fails at:
>
> [root@PC-server-ldb bpf]# make CROSS_COMPILE=3Dppc-linux- ARCH=3Dpowerpc =
V=3D1
> /root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/host-tools/sbin/b=
pftool gen skeleton
> /root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/atomic_bounds.o >
> /root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/atomic_bounds.ske=
l.h
> libbpf: elf: endianness mismatch in atomic_bounds.
> Error: failed to open BPF object file: Endian mismatch
>
> I'm cross-building on x86 for powerpc/32

yeah, I'm not sure selftests/bpf supports cross-compiling. bpftool got
some patches recently to enable cross-compiling, but probably not
selftests/bpf.

>
> [root@PC-server-ldb bpf]# file atomic_bounds.o
> atomic_bounds.o: ELF 64-bit MSB relocatable, eBPF, version 1 (SYSV), with=
 debug_info, not stripped
>
> Christophe
