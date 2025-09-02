Return-Path: <linuxppc-dev+bounces-11610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13291B3FB06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 11:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGLXY3WhRz2y06;
	Tue,  2 Sep 2025 19:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756806509;
	cv=none; b=G9HDA2ZI1gwnxTOvk8Nsu8oaGAvGKqdAyBcKpe+ByUIdSZjkvkKP53dpOQkuNCCvDjpJi2EUEYcLtmhjATiO1qSarVPcXnr0CxW8vlzpfrpkVu4qs4mKxMaXlrC3tLHq781dwKhaFF7qWZE9oePvjXzNNQeJeX3i6Ac9qx7nyraTETX8/d80dCl3pTiiWAzHBD9/37JXZLmf0wROc4EO2pHWVfTybRFrevqlmBluue1ZeMEG0ZD7VDipzq57M4alyc6aS7QRtCEczqNeW65O5X/14UtOv6t1BuAjJLkvwdBHFlssnTSdKkYv9hZfi4V+e6F4+ba+NHFzml4O7a2LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756806509; c=relaxed/relaxed;
	bh=c+jW/GqtFwFiFp5Y+6835qQrcIVHPv1xtkOrn2cxq3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyGq+f4Ih1ift6yx9CZPS+Uhd5dOKP0IBbQdWcllzojbUfJHVLBGN2vxSj6F088A8QyYu+2900e3eu6tdn77FTE0/ob1yT6I9ishWX5FZW4Vxm3avT0v9qUPWpDywzpBaIPvMpU0SRmHc52wM5Ctpy3Rc0C7AL2JPy6IRjDx4iVIm4Tn53qbVF2zphXiQt1gdlbJy2tbbTi+/e/QPeVZySyMR5gOtWzR8EuAS7fZdhT40YYmDrZols1uWT0rlJzMxmPWMS/xJteiyb1WRZNk3th5xmqkN7FQQSNtr4do0QNcLQ4UBJc2ABN37Auv/+wD0AvsBsxiSWH68Qi3Z4Tw6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PVdLu0g9; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PVdLu0g9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGLXX3XXHz2xK1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 19:48:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 258E144A40
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 09:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01A2C116B1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806506;
	bh=jzNLAHZlBcvJuQ2aYkxoxli/Nilcz4jvKLTl8uTm8/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PVdLu0g9g/zTd5bZFlMjRyZRLtTmjkXNdbsBh70mYvy5dPzg9Q5SbRepk7sswJUdO
	 xi1e1EbIiGhaq43COuGsAjmgkSJIadbAu//mKnTpbEhKxEe89CzxrMlVP6/ysj6jGH
	 KaNh8tBB08QkIi64RKhVVl87ZqKZweDE80CHwoChilP8PKVJqXZdlwAjILttnl4SdO
	 8bQe9lSCh6w0t3n3QtNPnyD2Ii/iIAHjqFFZYya5jNVsuLruOdOoMHlN0+a1uQPIWJ
	 t21FiV0UPgiFoql1PnpKiGfnqC2a+mZgAd8k1Y8P0qlqGuTwYm2MXZvihJSYbjewso
	 OHpYM4cgtuY2w==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso16979775e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 02:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH7LIH1XknBjngO0rNUEWcV6DAZrHrru0sxyxISWFRLcg5Q3K948SQg3RaiXqhEe/X4UkNlDHvEFwhLeU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4XFNpCNynSLKMbead5o8+EJpV/nqaLoDDlBXWYtMC+XRcq7iI
	lCT5HmnTsLJOzJTVrQJCUJ/q4JpCpzXXXvhsgnyANnSYuxysnLNB8xP/vD5b8wrTkT6Fu8bPQvO
	9ORQbiIuWb98rDW+j28AoM61EVWGGm3A=
X-Google-Smtp-Source: AGHT+IH/ikYQ9n6KZhk3vS7BJ424SAfyOcvFX60PB80IL/7yJH7DF0/GxjISiXQ0eBIjWRAfhg1Rx19NBBTMfVab8MA=
X-Received: by 2002:a05:600c:470a:b0:45b:8b34:34a5 with SMTP id
 5b1f17b1804b1-45b8b343742mr61100365e9.23.1756806503824; Tue, 02 Sep 2025
 02:48:23 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 2 Sep 2025 17:48:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQRxjqX-Rhg=15cNtwM8vVkAjAuLx1Q6rx0NqDOYhP8_g@mail.gmail.com>
X-Gm-Features: Ac12FXxfLAsbSEfk-FgUbhEV2UzUOmDZPXqEd1PN-me5Q9FCX6ZXFOyZmMMbhC4
Message-ID: <CAJF2gTQRxjqX-Rhg=15cNtwM8vVkAjAuLx1Q6rx0NqDOYhP8_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
To: schuster.simon@siemens-energy.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Kees Cook <kees@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	John Johansen <john.johansen@canonical.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com, 
	selinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 1, 2025 at 9:10=E2=80=AFPM Simon Schuster via B4 Relay
<devnull+schuster.simon.siemens-energy.com@kernel.org> wrote:
>
> From: Simon Schuster <schuster.simon@siemens-energy.com>
>
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
>
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
>
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---
>  arch/alpha/kernel/process.c      | 2 +-
>  arch/arc/kernel/process.c        | 2 +-
>  arch/arm/kernel/process.c        | 2 +-
>  arch/arm64/kernel/process.c      | 2 +-
>  arch/csky/kernel/process.c       | 2 +-
>  arch/hexagon/kernel/process.c    | 2 +-
>  arch/loongarch/kernel/process.c  | 2 +-
>  arch/m68k/kernel/process.c       | 2 +-
>  arch/microblaze/kernel/process.c | 2 +-
>  arch/mips/kernel/process.c       | 2 +-
>  arch/nios2/kernel/process.c      | 2 +-
>  arch/openrisc/kernel/process.c   | 2 +-
>  arch/parisc/kernel/process.c     | 2 +-
>  arch/powerpc/kernel/process.c    | 2 +-
>  arch/riscv/kernel/process.c      | 2 +-
>  arch/s390/kernel/process.c       | 2 +-
>  arch/sh/kernel/process_32.c      | 2 +-
>  arch/sparc/kernel/process_32.c   | 2 +-
>  arch/sparc/kernel/process_64.c   | 2 +-
>  arch/um/kernel/process.c         | 2 +-
>  arch/x86/include/asm/fpu/sched.h | 2 +-
>  arch/x86/include/asm/shstk.h     | 4 ++--
>  arch/x86/kernel/fpu/core.c       | 2 +-
>  arch/x86/kernel/process.c        | 2 +-
>  arch/x86/kernel/shstk.c          | 2 +-
>  arch/xtensa/kernel/process.c     | 2 +-
>  26 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index 582d96548385..06522451f018 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -231,7 +231,7 @@ flush_thread(void)
>   */
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         extern void ret_from_fork(void);
> diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
> index 186ceab661eb..8166d0908713 100644
> --- a/arch/arc/kernel/process.c
> +++ b/arch/arc/kernel/process.c
> @@ -166,7 +166,7 @@ asmlinkage void ret_from_fork(void);
>   */
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *c_regs;        /* child's pt_regs */
> diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
> index e16ed102960c..d7aa95225c70 100644
> --- a/arch/arm/kernel/process.c
> +++ b/arch/arm/kernel/process.c
> @@ -234,7 +234,7 @@ asmlinkage void ret_from_fork(void) __asm__("ret_from=
_fork");
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long stack_start =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *thread =3D task_thread_info(p);
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 96482a1412c6..fba7ca102a8c 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -409,7 +409,7 @@ asmlinkage void ret_from_fork(void) asm("ret_from_for=
k");
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long stack_start =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *childregs =3D task_pt_regs(p);
> diff --git a/arch/csky/kernel/process.c b/arch/csky/kernel/process.c
> index 0c6e4b17fe00..a7a90340042a 100644
> --- a/arch/csky/kernel/process.c
> +++ b/arch/csky/kernel/process.c
> @@ -32,7 +32,7 @@ void flush_thread(void){}
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
Acked-by: Guo Ren (Alibaba Damo Academy) <guoren@kernel.org>

>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct switch_stack *childstack;
> diff --git a/arch/hexagon/kernel/process.c b/arch/hexagon/kernel/process.=
c
> index 2a77bfd75694..15b4992bfa29 100644
> --- a/arch/hexagon/kernel/process.c
> +++ b/arch/hexagon/kernel/process.c
> @@ -52,7 +52,7 @@ void arch_cpu_idle(void)
>   */
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *ti =3D task_thread_info(p);
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/proc=
ess.c
> index 3582f591bab2..efd9edf65603 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -167,7 +167,7 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>         unsigned long childksp;
>         unsigned long tls =3D args->tls;
>         unsigned long usp =3D args->stack;
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         struct pt_regs *childregs, *regs =3D current_pt_regs();
>
>         childksp =3D (unsigned long)task_stack_page(p) + THREAD_SIZE;
> diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
> index fda7eac23f87..f5a07a70e938 100644
> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -141,7 +141,7 @@ asmlinkage int m68k_clone3(struct pt_regs *regs)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct fork_frame {
> diff --git a/arch/microblaze/kernel/process.c b/arch/microblaze/kernel/pr=
ocess.c
> index 56342e11442d..6cbf642d7b80 100644
> --- a/arch/microblaze/kernel/process.c
> +++ b/arch/microblaze/kernel/process.c
> @@ -54,7 +54,7 @@ void flush_thread(void)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *childregs =3D task_pt_regs(p);
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 02aa6a04a21d..29191fa1801e 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -107,7 +107,7 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src)
>   */
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *ti =3D task_thread_info(p);
> diff --git a/arch/nios2/kernel/process.c b/arch/nios2/kernel/process.c
> index f84021303f6a..151404139085 100644
> --- a/arch/nios2/kernel/process.c
> +++ b/arch/nios2/kernel/process.c
> @@ -101,7 +101,7 @@ void flush_thread(void)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *childregs =3D task_pt_regs(p);
> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/proces=
s.c
> index eef99fee2110..73ffb9fa3118 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -165,7 +165,7 @@ extern asmlinkage void ret_from_fork(void);
>  int
>  copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *userregs;
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index ed93bd8c1545..e64ab5d2a40d 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -201,7 +201,7 @@ arch_initcall(parisc_idle_init);
>  int
>  copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *cregs =3D &(p->thread.regs);
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 855e09886503..eb23966ac0a9 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1805,7 +1805,7 @@ int copy_thread(struct task_struct *p, const struct=
 kernel_clone_args *args)
>                         f =3D ret_from_kernel_user_thread;
>                 } else {
>                         struct pt_regs *regs =3D current_pt_regs();
> -                       unsigned long clone_flags =3D args->flags;
> +                       u64 clone_flags =3D args->flags;
>                         unsigned long usp =3D args->stack;
>
>                         /* Copy registers */
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index a0a40889d79a..31a392993cb4 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -223,7 +223,7 @@ asmlinkage void ret_from_fork_user(struct pt_regs *re=
gs)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *childregs =3D task_pt_regs(p);
> diff --git a/arch/s390/kernel/process.c b/arch/s390/kernel/process.c
> index f55f09cda6f8..b107dbca4ed7 100644
> --- a/arch/s390/kernel/process.c
> +++ b/arch/s390/kernel/process.c
> @@ -106,7 +106,7 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long new_stackp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct fake_frame
> diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
> index 92b6649d4929..62f753a85b89 100644
> --- a/arch/sh/kernel/process_32.c
> +++ b/arch/sh/kernel/process_32.c
> @@ -89,7 +89,7 @@ asmlinkage void ret_from_kernel_thread(void);
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *ti =3D task_thread_info(p);
> diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_3=
2.c
> index 9c7c662cb565..5a28c0e91bf1 100644
> --- a/arch/sparc/kernel/process_32.c
> +++ b/arch/sparc/kernel/process_32.c
> @@ -260,7 +260,7 @@ extern void ret_from_kernel_thread(void);
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long sp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *ti =3D task_thread_info(p);
> diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_6=
4.c
> index 529adfecd58c..25781923788a 100644
> --- a/arch/sparc/kernel/process_64.c
> +++ b/arch/sparc/kernel/process_64.c
> @@ -567,7 +567,7 @@ void fault_in_user_windows(struct pt_regs *regs)
>   */
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long sp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct thread_info *t =3D task_thread_info(p);
> diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
> index 1be644de9e41..9c9c66dc45f0 100644
> --- a/arch/um/kernel/process.c
> +++ b/arch/um/kernel/process.c
> @@ -143,7 +143,7 @@ static void fork_handler(void)
>
>  int copy_thread(struct task_struct * p, const struct kernel_clone_args *=
args)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long sp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         void (*handler)(void);
> diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/=
sched.h
> index c060549c6c94..89004f4ca208 100644
> --- a/arch/x86/include/asm/fpu/sched.h
> +++ b/arch/x86/include/asm/fpu/sched.h
> @@ -11,7 +11,7 @@
>
>  extern void save_fpregs_to_fpstate(struct fpu *fpu);
>  extern void fpu__drop(struct task_struct *tsk);
> -extern int  fpu_clone(struct task_struct *dst, unsigned long clone_flags=
, bool minimal,
> +extern int  fpu_clone(struct task_struct *dst, u64 clone_flags, bool min=
imal,
>                       unsigned long shstk_addr);
>  extern void fpu_flush_thread(void);
>
> diff --git a/arch/x86/include/asm/shstk.h b/arch/x86/include/asm/shstk.h
> index ba6f2fe43848..0f50e0125943 100644
> --- a/arch/x86/include/asm/shstk.h
> +++ b/arch/x86/include/asm/shstk.h
> @@ -16,7 +16,7 @@ struct thread_shstk {
>
>  long shstk_prctl(struct task_struct *task, int option, unsigned long arg=
2);
>  void reset_thread_features(void);
> -unsigned long shstk_alloc_thread_stack(struct task_struct *p, unsigned l=
ong clone_flags,
> +unsigned long shstk_alloc_thread_stack(struct task_struct *p, u64 clone_=
flags,
>                                        unsigned long stack_size);
>  void shstk_free(struct task_struct *p);
>  int setup_signal_shadow_stack(struct ksignal *ksig);
> @@ -28,7 +28,7 @@ static inline long shstk_prctl(struct task_struct *task=
, int option,
>                                unsigned long arg2) { return -EINVAL; }
>  static inline void reset_thread_features(void) {}
>  static inline unsigned long shstk_alloc_thread_stack(struct task_struct =
*p,
> -                                                    unsigned long clone_=
flags,
> +                                                    u64 clone_flags,
>                                                      unsigned long stack_=
size) { return 0; }
>  static inline void shstk_free(struct task_struct *p) {}
>  static inline int setup_signal_shadow_stack(struct ksignal *ksig) { retu=
rn 0; }
> diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
> index aefd412a23dc..1f71cc135e9a 100644
> --- a/arch/x86/kernel/fpu/core.c
> +++ b/arch/x86/kernel/fpu/core.c
> @@ -631,7 +631,7 @@ static int update_fpu_shstk(struct task_struct *dst, =
unsigned long ssp)
>  }
>
>  /* Clone current's FPU state on fork */
> -int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool m=
inimal,
> +int fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
>               unsigned long ssp)
>  {
>         /*
> diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
> index 1b7960cf6eb0..e3a3987b0c4f 100644
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -159,7 +159,7 @@ __visible void ret_from_fork(struct task_struct *prev=
, struct pt_regs *regs,
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long sp =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct inactive_task_frame *frame;
> diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
> index 2ddf23387c7e..5eba6c5a6775 100644
> --- a/arch/x86/kernel/shstk.c
> +++ b/arch/x86/kernel/shstk.c
> @@ -191,7 +191,7 @@ void reset_thread_features(void)
>         current->thread.features_locked =3D 0;
>  }
>
> -unsigned long shstk_alloc_thread_stack(struct task_struct *tsk, unsigned=
 long clone_flags,
> +unsigned long shstk_alloc_thread_stack(struct task_struct *tsk, u64 clon=
e_flags,
>                                        unsigned long stack_size)
>  {
>         struct thread_shstk *shstk =3D &tsk->thread.shstk;
> diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
> index 7bd66677f7b6..94d43f44be13 100644
> --- a/arch/xtensa/kernel/process.c
> +++ b/arch/xtensa/kernel/process.c
> @@ -267,7 +267,7 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src)
>
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *a=
rgs)
>  {
> -       unsigned long clone_flags =3D args->flags;
> +       u64 clone_flags =3D args->flags;
>         unsigned long usp_thread_fn =3D args->stack;
>         unsigned long tls =3D args->tls;
>         struct pt_regs *childregs =3D task_pt_regs(p);
>
> --
> 2.39.5
>
>


--=20
Best Regards
 Guo Ren

