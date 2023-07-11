Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3074F6EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:20:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0nh00Wl4z3c3P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:20:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.174; helo=mail-vk1-f174.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ngC5MnHz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:19:51 +1000 (AEST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-47dcf42d3a0so4890283e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 10:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689095988; x=1691687988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1E8sshrAsRaTXfo6weNCw3VfVLbTLnqtK1Z13Sm9Os=;
        b=jn7JjKTIsdt8EAnyTBLKfo7pz+6ejofTjGIGrjhAB5b32fRAu6/7Oj3GtsXq1HvhED
         qQq8uG7I4DiRURqZSXeHJ5Xe3PbfhoE7IO1gqU/pjn4Iyx1RDVHz1vyqhItGOuRL3KfS
         9CpjYLPaiz0BT+sRk9lk74XCCgfLWA8/VUwD3pea7nvoBC21aFxQVbUNciJQ6KjI4R4G
         Zw5ox22i9WhpaOSg69Cf9Lv78lzhGIoBKrNiOfKFzbRV6DGjsfgamjK/S1HyYGS0UmdK
         QB8pWeOBCsSMccQPClcF0pGs59fYrkx4J2JDgjZQGIokPh2Hdq+U0tQ9wDIByAS+pFIk
         fl7g==
X-Gm-Message-State: ABy/qLYInnyXZAxs5M1tnuGqDiP6XJIFoSQmm1NT7OWYNNuCkWiVictD
	s/xwL22l8n73+GgNtcOEzNqk0nB1sr1EKC0F+M8=
X-Google-Smtp-Source: APBJJlHvjqSOXNmdmDvle0026k90GDtUYnPqvi6JX9yQULKCWL0XAYOjkAe7gIe04qveWs0x8fU9K4aaoqcGOl9T0Z0=
X-Received: by 2002:a05:6122:d15:b0:47a:e101:b25 with SMTP id
 az21-20020a0561220d1500b0047ae1010b25mr6414180vkb.3.1689095987477; Tue, 11
 Jul 2023 10:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
 <22294b3b68050a70eaaa962eff46b8672bc2f7e8.1689092120.git.legion@kernel.org>
In-Reply-To: <22294b3b68050a70eaaa962eff46b8672bc2f7e8.1689092120.git.legion@kernel.org>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 11 Jul 2023 10:19:35 -0700
Message-ID: <CAM9d7chAqGwy0WmR67TucFjRq+Aa7zQnayvwMCqd5-meVHkP5g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] tools headers UAPI: Sync files changed by new
 fchmodat2 syscall
To: Alexey Gladkov <legion@kernel.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@i
 ntel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Jul 11, 2023 at 9:18=E2=80=AFAM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> That add support for this new syscall in tools such as 'perf trace'.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  tools/include/uapi/asm-generic/unistd.h             | 5 ++++-
>  tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
>  tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 ++
>  tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
>  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
>  5 files changed, 12 insertions(+), 1 deletion(-)

It'd be nice if you route this patch separately through the
perf tools tree.  We can add this after the kernel change
is accepted.

Thanks,
Namhyung


>
> diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi=
/asm-generic/unistd.h
> index dd7d8e10f16d..76b5922b0d39 100644
> --- a/tools/include/uapi/asm-generic/unistd.h
> +++ b/tools/include/uapi/asm-generic/unistd.h
> @@ -817,8 +817,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
>  #define __NR_set_mempolicy_home_node 450
>  __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
>
> +#define __NR_fchmodat2 452
> +__SYSCALL(__NR_fchmodat2, sys_fchmodat2)
> +
>  #undef __NR_syscalls
> -#define __NR_syscalls 451
> +#define __NR_syscalls 453
>
>  /*
>   * 32 bit systems traditionally used different
> diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/=
perf/arch/mips/entry/syscalls/syscall_n64.tbl
> index 3f1886ad9d80..434728af4eaa 100644
> --- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> +++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> @@ -365,3 +365,5 @@
>  448    n64     process_mrelease                sys_process_mrelease
>  449    n64     futex_waitv                     sys_futex_waitv
>  450    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> +# 451 reserved for cachestat
> +452    n64     fchmodat2                       sys_fchmodat2
> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/p=
erf/arch/powerpc/entry/syscalls/syscall.tbl
> index a0be127475b1..6b70b6705bd7 100644
> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> @@ -537,3 +537,5 @@
>  448    common  process_mrelease                sys_process_mrelease
>  449    common  futex_waitv                     sys_futex_waitv
>  450    nospu   set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> +# 451 reserved for cachestat
> +452    common  fchmodat2                       sys_fchmodat2
> diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf=
/arch/s390/entry/syscalls/syscall.tbl
> index b68f47541169..0ed90c9535b0 100644
> --- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> @@ -453,3 +453,5 @@
>  448  common    process_mrelease        sys_process_mrelease            s=
ys_process_mrelease
>  449  common    futex_waitv             sys_futex_waitv                 s=
ys_futex_waitv
>  450  common    set_mempolicy_home_node sys_set_mempolicy_home_node     s=
ys_set_mempolicy_home_node
> +# 451 reserved for cachestat
> +452  common    fchmodat2               sys_fchmodat2                   s=
ys_fchmodat2
> diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/pe=
rf/arch/x86/entry/syscalls/syscall_64.tbl
> index c84d12608cd2..a008724a1f48 100644
> --- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> @@ -372,6 +372,8 @@
>  448    common  process_mrelease        sys_process_mrelease
>  449    common  futex_waitv             sys_futex_waitv
>  450    common  set_mempolicy_home_node sys_set_mempolicy_home_node
> +# 451 reserved for cachestat
> +452    common  fchmodat2               sys_fchmodat2
>
>  #
>  # Due to a historical design error, certain syscalls are numbered differ=
ently
> --
> 2.33.8
>
