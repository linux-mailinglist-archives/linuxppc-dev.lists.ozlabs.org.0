Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DF2DE9D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 20:35:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyJx32WhPzDqXq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 06:35:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=andrii.nakryiko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=smd6OovZ; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyJvN5Lc1zDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 06:33:49 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j17so2915644ybt.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 11:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KNBRvdmn/wyHTPHKsxQKl3rgA8nQ9Ef1h/1/1RSinx0=;
 b=smd6OovZibegU2ze2AZcT6ztlhK9aFY8OGPE8O/x8dVdjACocHuWUkqs1kVbf0FnQs
 DzvRqEM8tsVULNCUN4uUoaAOyX3BYPY34+3XMmvnrENqgg4F5/ki4Ky5kunhE9j7HO+N
 hjNQTLhSg/1zUa3kI52+eBPbOyqaP4wsZnZS/ZaLU/Gwzrc3+ehGPq1gYGlOQJwO3ETG
 cs0hPx1wUbTVkF8mnQ3qfvbr+FdEsnCEsSyJn6mLDxtj4X622XyBpDD/5I/s1Uz9zJx+
 lxfZFmjKUvSOM/Y9ilH6uN1j5N7/kEvYqCrkxQDCYXCxKPxjOrzCsEk0Ton2xc5ss94j
 Nt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KNBRvdmn/wyHTPHKsxQKl3rgA8nQ9Ef1h/1/1RSinx0=;
 b=RouI2xawHtOjwQekXS6TWB8qDczbk3Fzqwk0SNpyH3jETgrJG1ZxSSbK7B4qZZyfk/
 42yKOR0Dd2mJqZuawxCwP86SjFoAeJ92OFz0oxm/EuobWQQpYBdCMwefGlBTLy4rDx6r
 eY90RJCxeONQdTpfapYnP07zWYxO2ldSyic/t5bN3v5BzeLi6M+vGRDWPQAO/AVILoDI
 h0CxBgK5ZC92mqlqkPk9Mm9SJ8Lc+nWcLnqLOslLAxBQ0KLOcqBpZvHMeoFCbqINlIqQ
 wVDiJl0FOs/IesqjgHc4RN++QUQRHUyUraerABRHPQB3QVASIHdV8RsixkdXq94zkPct
 LJDg==
X-Gm-Message-State: AOAM531AaxD+UUfXOev32gYPYywxqytcK+wLWpQIV00hWrzOETvfM4vi
 btcQL54eRGsOMQfGdeYiGkTib0oncIya1ltWnUo=
X-Google-Smtp-Source: ABdhPJxEs172K5VHfcViqfe+yfi8RChWTtiy61V1DgUR9JtIfk5I1OUYbtJ2w0fp6/iN5zKhS4GhnS3HcQ+h5sxyBdU=
X-Received: by 2002:a25:818e:: with SMTP id p14mr7850113ybk.425.1608320025975; 
 Fri, 18 Dec 2020 11:33:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608112796.git.christophe.leroy@csgroup.eu>
 <1fed5e11ba08ee28d12f3f57986e5b143a6aa937.1608112797.git.christophe.leroy@csgroup.eu>
 <20201217061133.lnfnhbzvikgtjb3i@ast-mbp>
 <854404a0-1951-91d9-2ebb-208390a64c77@csgroup.eu>
In-Reply-To: <854404a0-1951-91d9-2ebb-208390a64c77@csgroup.eu>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 18 Dec 2020 11:33:35 -0800
Message-ID: <CAEf4BzbNp0bvTbh4UjHO0KTs3Q83yuBMdh-8wCHCcTrPWnO25Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/7] powerpc/bpf: Implement extended BPF on PPC32
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
Cc: Song Liu <songliubraving@fb.com>, Martin Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 john fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, naveen.n.rao@linux.ibm.com,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 17, 2020 at 1:54 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/12/2020 =C3=A0 07:11, Alexei Starovoitov a =C3=A9crit :
> > On Wed, Dec 16, 2020 at 10:07:37AM +0000, Christophe Leroy wrote:
> >> Implement Extended Berkeley Packet Filter on Powerpc 32
> >>
> >> Test result with test_bpf module:
> >>
> >>      test_bpf: Summary: 378 PASSED, 0 FAILED, [354/366 JIT'ed]
> >
> > nice!
> >
> >> Registers mapping:
> >>
> >>      [BPF_REG_0] =3D r11-r12
> >>      /* function arguments */
> >>      [BPF_REG_1] =3D r3-r4
> >>      [BPF_REG_2] =3D r5-r6
> >>      [BPF_REG_3] =3D r7-r8
> >>      [BPF_REG_4] =3D r9-r10
> >>      [BPF_REG_5] =3D r21-r22 (Args 9 and 10 come in via the stack)
> >>      /* non volatile registers */
> >>      [BPF_REG_6] =3D r23-r24
> >>      [BPF_REG_7] =3D r25-r26
> >>      [BPF_REG_8] =3D r27-r28
> >>      [BPF_REG_9] =3D r29-r30
> >>      /* frame pointer aka BPF_REG_10 */
> >>      [BPF_REG_FP] =3D r31
> >>      /* eBPF jit internal registers */
> >>      [BPF_REG_AX] =3D r19-r20
> >>      [TMP_REG] =3D r18
> >>
> >> As PPC32 doesn't have a redzone in the stack,
> >> use r17 as tail call counter.
> >>
> >> r0 is used as temporary register as much as possible. It is referenced
> >> directly in the code in order to avoid misuse of it, because some
> >> instructions interpret it as value 0 instead of register r0
> >> (ex: addi, addis, stw, lwz, ...)
> >>
> >> The following operations are not implemented:
> >>
> >>              case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /=3D src */
> >>              case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %=3D src */
> >>              case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) =
+=3D src */
> >>
> >> The following operations are only implemented for power of two constan=
ts:
> >>
> >>              case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %=3D imm */
> >>              case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /=3D imm */
> >
> > Those are sensible limitations. MOD and DIV are rare, but XADD is commo=
n.
> > Please consider doing it as a cmpxchg loop in the future.
> >
> > Also please run test_progs. It will give a lot better coverage than tes=
t_bpf.ko
> >
>
> I'm having hard time cross building test_progs:
>
> ~/linux-powerpc/tools/testing/selftests/bpf/$ make CROSS_COMPILE=3Dppc-li=
nux-
> ...
>    GEN
> /home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/build/bpftool/D=
ocumentation/bpf-helpers.7
>    INSTALL  eBPF_helpers-manpage
>    INSTALL  Documentation-man
>    GEN      vmlinux.h
> /bin/sh: /home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/sbin/b=
pftool: cannot execute
> binary file
> make: *** [/home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/incl=
ude/vmlinux.h] Error 126
> make: *** Deleting file `/home/chr/linux-powerpc/tools/testing/selftests/=
bpf/tools/include/vmlinux.h'
>
> Looks like it builds bpftool for powerpc and tries to run it on my x86.
> How should I proceed ?


The best way would be to fix whatever needs to be fixed in
selftests/bpf and/or bpftool Makefiles to support cross-compilation.
There was some work already for bpftool to support that (with building
bpftool-bootstrap separately for a host architecture, etc). Please
check what's broken and let's try to fix it.

>
> Thanks
> Christophe
