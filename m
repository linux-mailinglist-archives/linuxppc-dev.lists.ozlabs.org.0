Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8921362C85
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 03:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMZWZ5FHYz3c68
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 11:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LHOOZCdm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=iecedge@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LHOOZCdm; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMHNq2HNXz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 23:38:50 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 82so30132371yby.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0mHucleBm3GX7Z1SOPiFjIocZZ3cy927o5LfpjbehY0=;
 b=LHOOZCdmhtYRgZeIr5lEhO6KXFFYOEi/8AF39AtF41E0Kj5ox6YUrLbD1vh18P9Lgw
 sAVjw8PPsAkREA+eH+IscJhlq1h6M6yaFa7D2Ul9LpLgbbeOdwpmPXCeDFpcWsTP6nHq
 SCI7Oj+YXaVgCPpr7CLkYRTDlBDXPOunOileWzKluP9csVXr0LkmjxeyoNNj/y0KHa8o
 m1iDnTxmuwSUOqb9QqmuJjAcD1igAGYaIOj4rbRGNsMZcZ9Vp6C8Phtn32KKQWyVGS+x
 HZbKvd+3/cmY7P4s96LQpYPFB1lT9xTMKroDuLgw++dQkCoTbyaprK8bjyaAEOyDTD6R
 ve0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0mHucleBm3GX7Z1SOPiFjIocZZ3cy927o5LfpjbehY0=;
 b=eibYsb4OmT8Y+MGE0bewym3euzEnsg9qzdAqnNWdfXV7dG7LEuc+OriK1auqakMwhT
 TuHWl0fInpd1zsihu80BLsZsO3sL2a2O4C7oW4Oa+ySGjEsRK3d9G/Z5AoCEFFdkZmYo
 Thv2Nk/4onRt1KN/66yC8TV5lNHxBbOoKBZWcOM/XHJ3wF1Fs5Fksy9hJDy83JZRYxv2
 fqRTAyg2ynOySZG4LUhNYfnUPKUa1FDb++OodFeLoD4boFPlHjMtu2EfPSZ7y4k4goLK
 JqMWpLDbg5yJPcKEqNq4PQuQ9DT8QkcCJvFPJbnjK58IAagvFtMRZrKbAk0ig/OaWKX1
 1sNw==
X-Gm-Message-State: AOAM533rz4B2r/QFu4M2QyRFtu0MA3FOggQpTbNyxmJAUWOmbKSqS7m3
 wRkGRbtQhyjVRlBhTMalMYPXnacAc84qKw6ac4g=
X-Google-Smtp-Source: ABdhPJw5sY0mgMHNVNaARBdH4/XL7aCQwPNekTw5pB2njQeJlgreCNQsgFDRpI0R7ZiYJLGMXF7BF2idqTBCgkAwAiE=
X-Received: by 2002:a25:7004:: with SMTP id l4mr12503620ybc.304.1618580325409; 
 Fri, 16 Apr 2021 06:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
In-Reply-To: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
From: Jianlin Lv <iecedge@gmail.com>
Date: Fri, 16 Apr 2021 21:38:33 +0800
Message-ID: <CAFA-uR8H2MMy_vjQ_ZL96ifKcVg2goK3nozOFavN+gnJ+=V6Rw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 17 Apr 2021 11:00:18 +1000
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
Cc: irogers@google.com, Song Liu <songliubraving@fb.com>,
 linux-doc@vger.kernel.org, zlim.lnx@gmail.com, paul.walmsley@sifive.com,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 paulus@samba.org, sandipan@linux.ibm.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, illusionist.neo@gmail.com,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, linux-s390@vger.kernel.org,
 iii@linux.ibm.com, paulburton@kernel.org, corbet@lwn.net,
 mchehab+huawei@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linux@armlinux.org.uk, linux-riscv@lists.infradead.org, borntraeger@de.ibm.com,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, naveen.n.rao@linux.ibm.com,
 Jakub Kicinski <kuba@kernel.org>, tklauser@distanz.ch,
 linux-mips@vger.kernel.org, grantseltzer@gmail.com, xi.wang@gmail.com,
 aou@eecs.berkeley.edu, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com,
 luke.r.nels@gmail.com, LKML <linux-kernel@vger.kernel.org>, hca@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, KP Singh <kpsingh@kernel.org>,
 horms@verge.net.au, bp@alien8.de, Alexander Viro <viro@zeniv.linux.org.uk>,
 Yonghong Song <yhs@fb.com>, tglx@linutronix.de,
 Dmitry Vyukov <dvyukov@google.com>, tsbogend@alpha.franken.de,
 yoshfuji@linux-ipv6.org, Network Development <netdev@vger.kernel.org>,
 dsahern@kernel.org, udknight@gmail.com, Martin KaFai Lau <kafai@fb.com>,
 bjorn@kernel.org, palmer@dabbelt.com, quentin@isovalent.com,
 bpf <bpf@vger.kernel.org>, Jianlin Lv <Jianlin.Lv@arm.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 10:38 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 4/15/21 11:32 AM, Jianlin Lv wrote:
> > For debugging JITs, dumping the JITed image to kernel log is discouraged,
> > "bpftool prog dump jited" is much better way to examine JITed dumps.
> > This patch get rid of the code related to bpf_jit_enable=2 mode and
> > update the proc handler of bpf_jit_enable, also added auxiliary
> > information to explain how to use bpf_jit_disasm tool after this change.
> >
> > Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
> [...]
> > diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> > index 0a7a2870f111..8d36b4658076 100644
> > --- a/arch/x86/net/bpf_jit_comp32.c
> > +++ b/arch/x86/net/bpf_jit_comp32.c
> > @@ -2566,9 +2566,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >               cond_resched();
> >       }
> >
> > -     if (bpf_jit_enable > 1)
> > -             bpf_jit_dump(prog->len, proglen, pass + 1, image);
> > -
> >       if (image) {
> >               bpf_jit_binary_lock_ro(header);
> >               prog->bpf_func = (void *)image;
> > diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> > index c8496c1142c9..990b1720c7a4 100644
> > --- a/net/core/sysctl_net_core.c
> > +++ b/net/core/sysctl_net_core.c
> > @@ -273,16 +273,8 @@ static int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
> >
> >       tmp.data = &jit_enable;
> >       ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> > -     if (write && !ret) {
> > -             if (jit_enable < 2 ||
> > -                 (jit_enable == 2 && bpf_dump_raw_ok(current_cred()))) {
> > -                     *(int *)table->data = jit_enable;
> > -                     if (jit_enable == 2)
> > -                             pr_warn("bpf_jit_enable = 2 was set! NEVER use this in production, only for JIT debugging!\n");
> > -             } else {
> > -                     ret = -EPERM;
> > -             }
> > -     }
> > +     if (write && !ret)
> > +             *(int *)table->data = jit_enable;
> >       return ret;
> >   }
> >
> > @@ -389,7 +381,7 @@ static struct ctl_table net_core_table[] = {
> >               .extra2         = SYSCTL_ONE,
> >   # else
> >               .extra1         = SYSCTL_ZERO,
> > -             .extra2         = &two,
> > +             .extra2         = SYSCTL_ONE,
> >   # endif
> >       },
> >   # ifdef CONFIG_HAVE_EBPF_JIT
> > diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
> > index c8ae95804728..efa4b17ae016 100644
> > --- a/tools/bpf/bpf_jit_disasm.c
> > +++ b/tools/bpf/bpf_jit_disasm.c
> > @@ -7,7 +7,7 @@
> >    *
> >    * To get the disassembly of the JIT code, do the following:
> >    *
> > - *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
> > + *  1) Insert bpf_jit_dump() and recompile the kernel to output JITed image into log
>
> Hmm, if we remove bpf_jit_dump(), the next drive-by cleanup patch will be thrown
> at bpf@vger stating that bpf_jit_dump() has no in-tree users and should be removed.
> Maybe we should be removing bpf_jit_disasm.c along with it as well as bpf_jit_dump()
> itself ... I guess if it's ever needed in those rare occasions for JIT debugging we
> can resurrect it from old kernels just locally. But yeah, bpftool's jit dump should
> suffice for vast majority of use cases.
>
> There was a recent set for ppc32 jit which was merged into ppc tree which will create
> a merge conflict with this one [0]. So we would need a rebase and take it maybe during
> merge win once the ppc32 landed..
>
>    [0] https://lore.kernel.org/bpf/cover.1616430991.git.christophe.leroy@csgroup.eu/
>
> >    *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)
> >    *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
> >    *
> > diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
> > index 40a88df275f9..98c7eec2923f 100644
> > --- a/tools/bpf/bpftool/feature.c
> > +++ b/tools/bpf/bpftool/feature.c
> > @@ -203,9 +203,6 @@ static void probe_jit_enable(void)
> >               case 1:
> >                       printf("JIT compiler is enabled\n");
> >                       break;
> > -             case 2:
> > -                     printf("JIT compiler is enabled with debugging traces in kernel logs\n");
> > -                     break;
>
> This would still need to be there for older kernels ...

I will submit another version after ppc32 landed to remove
bpf_jit_disasm.c and restore bpftool/feature.c

Jianlin


>
> >               case -1:
> >                       printf("Unable to retrieve JIT-compiler status\n");
> >                       break;
> >
>
