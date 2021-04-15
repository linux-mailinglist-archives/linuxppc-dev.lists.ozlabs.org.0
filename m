Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2414361709
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLyhN75nNz3btM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 11:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aBCM67He;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aBCM67He; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLx0N0DXrz30F9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 09:49:54 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id z13so24854948lfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 16:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93RaKIcPxj4ed/vj3/T6taZCo8gljqrXH2nCGhdkM1Q=;
 b=aBCM67HeOS1RQpmZ9d1xkBbfZ9OjHVKizD6JMJntC1jztjXCaMAD4PxLVP6PE65ty3
 cKPeKzgiEbgw3SQZ8eR83qtBjTP2OYUdbnqkzhUAbE0u+1hOdGsAn8xKem5MzABFlQgD
 mRXyEbRdJWemOBA5ZL1H2F5rm/kMfg/eeqCccq1PGYnduzRrD+ZOmE6Jc8ZifznL8idv
 FrDgLXsLKsMduLqpBFFg7xH0u5XmXHclHLbXV0TX9HDDr95c+SXlKyzlZoT5Ez5tEE8O
 yL7SLoB/UGXylkkP0jVvQUti3azG7QIpldbt+d5lTdgqR0VqbJM4y+Fb3QAjnu0TlNPa
 AWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93RaKIcPxj4ed/vj3/T6taZCo8gljqrXH2nCGhdkM1Q=;
 b=iBMQXpzSoE1jkOwRH/NVfIPW3rrqosItVfwBsnf7i6iUR4uoDuRD6z2Jkut8uCIGCq
 MgzBEXmY0yNaig+2PWg1aS1CkRoWjrewodSoSMi1UgMphBbRzTcMNoYhU2iLa+lHAhJ+
 Mjz++YObL7yeJVIimpK9ioDf59evNB5KWe3K3v1ov8PPkX8uN5FhcRwx81xATpBx37wW
 JxJJA6CdvPtv/sTR8I5wf0ekOUBmPg3BEKI4mphdesI6WQp5HRGTFzjlAlGwEc/EhxOU
 gXpmiNYgaZ4nWjnG2Xs3Usk3+/egUs+hlxbe7NuTOsrE1fj0jgUwoXxMFQO3fW+SEA9n
 ZbFg==
X-Gm-Message-State: AOAM531Se+DrjA9TdFv88SKjPIV5/JmIOYuFPAQcqOmhsjFHMDj46PDi
 JVulxC5wYkjqzlogc40ExdIXyPVNP9RKuTd1Gb0=
X-Google-Smtp-Source: ABdhPJyNhOogFP8g+e8x1hnSTCcEzJfdpg/9ifXfqOKSgpR6Q7EyYPjeRQKWzaeLUb3+uY3vv8XYIkkzgMMMfdz4tQA=
X-Received: by 2002:ac2:4d4d:: with SMTP id 13mr1106974lfp.540.1618530588068; 
 Thu, 15 Apr 2021 16:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
In-Reply-To: <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 15 Apr 2021 16:49:36 -0700
Message-ID: <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Quentin Monnet <quentin@isovalent.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Apr 2021 11:05:49 +1000
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
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 paulburton@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, grantseltzer@gmail.com,
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Luke Nelson <luke.r.nels@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 KP Singh <kpsingh@kernel.org>, iecedge@gmail.com,
 Simon Horman <horms@verge.net.au>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 tsbogend@alpha.franken.de, Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 Wang YanQing <udknight@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>,
 Jianlin Lv <Jianlin.Lv@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 8:41 AM Quentin Monnet <quentin@isovalent.com> wrote:
>
> 2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> > On 4/15/21 11:32 AM, Jianlin Lv wrote:
> >> For debugging JITs, dumping the JITed image to kernel log is discouraged,
> >> "bpftool prog dump jited" is much better way to examine JITed dumps.
> >> This patch get rid of the code related to bpf_jit_enable=2 mode and
> >> update the proc handler of bpf_jit_enable, also added auxiliary
> >> information to explain how to use bpf_jit_disasm tool after this change.
> >>
> >> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
>
> Hello,
>
> For what it's worth, I have already seen people dump the JIT image in
> kernel logs in Qemu VMs running with just a busybox, not for kernel
> development, but in a context where buiding/using bpftool was not
> possible.

If building/using bpftool is not possible then majority of selftests won't
be exercised. I don't think such environment is suitable for any kind
of bpf development. Much so for JIT debugging.
While bpf_jit_enable=2 is nothing but the debugging tool for JIT developers.
I'd rather nuke that code instead of carrying it from kernel to kernel.
