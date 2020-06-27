Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B020BE4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 06:33:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v18S1q46zDr7f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 14:33:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=green.hu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MvHmB7Co; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tzKN3kSczDr0m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 13:10:48 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id u8so5383433qvj.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 20:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IWhrpNY7xlqQrJKXws+NUUAMsOukm6peWOP/1HXT+b4=;
 b=MvHmB7CoXy8gFuXApv7yepl4fB6XWMduaQXMKkjexs6EBNoy44PIkasc3jHMBHyJiB
 yxhBEyUIGz1mFKbiIW6Z6EVd1zN/3Om0ihcv2ZANU5T+fKLc38RiOEMGb2NgLL5H2DD8
 OkB0BKIcQ/hDyBhfRFCjDdgXX8QI/AoUglp4db/HlBTqkns/GK0vXrsUHCz9NIsJk+m2
 nZR6Zm85U5R5uVuhs5vdAsSF5PQz1O80d6Jklao8cWiVNAQ2Ra92qBBpXdeW65qnyGC2
 sizqjgIfQkQ+2ORhFs1lzaiFQCzDiaFP4uMUVTuiHqAQXpqsGfwYed6SZTkTzqXki18K
 Lteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IWhrpNY7xlqQrJKXws+NUUAMsOukm6peWOP/1HXT+b4=;
 b=JxOwRFsgbiXshclS6lVlyybIYWf/dAe0OSd4U81+zvbEbHUKEZI2JzGGhsbt0QuxG3
 Yg94Z/nyb5sCx5RcUvGMTTZ9mo+9sIt371ErHuec/dGrtY+sbIVmk6MfH5QqpEKsKzxh
 T3Qqm6+qr0e+mb0UoS1+t+9I4aZS8I5CKF4pTi0dwXl3OXk7caFP/g5zL9Cgq+nBJgvO
 uMgbb3paWmihRvd1Q048ebYyz0if3jF/jJTBuuxneHSbSWKORxcK96l/HwWFNv3DRP0C
 V/et1Q7FXCO6rP51f0hCjHeSq4smBzwXBKLgaZE87m0A/tI8I/nuf0RuqRTx0oE7OoJW
 9IWA==
X-Gm-Message-State: AOAM530G5/txDAmI4SzP+pmLnWZBuX9OyljhGoOgIW/Ma42Ffd/+eFoH
 PfB5FFuBWuVoFSeT+1BqHHXwAWJQhcJCrEyqag0=
X-Google-Smtp-Source: ABdhPJyp9Jehi5+JPZEhH13jMa9eG8B8riQx365j3HWzuOFxMhgSO2ctkHEAU9vFA2IzNhq1RyqN2yxKJtpbp4PLly4=
X-Received: by 2002:a0c:bda0:: with SMTP id n32mr6333372qvg.164.1593227445009; 
 Fri, 26 Jun 2020 20:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Sat, 27 Jun 2020 11:10:05 +0800
Message-ID: <CAEbi=3fbt_3DBEMhWUKY04KNxR=Xv0zesFGrJJDnx5D-8KUaaw@mail.gmail.com>
Subject: Re: [PATCH 17/17] arch: rename copy_thread_tls() back to copy_thread()
To: Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 27 Jun 2020 14:30:05 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, linux-csky@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Brauner <christian.brauner@ubuntu.com> =E6=96=BC 2020=E5=B9=B46=
=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=887:58=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Now that HAVE_COPY_THREAD_TLS has been removed, rename copy_thread_tls()
> back simply copy_thread(). It's a simpler name, and doesn't imply that on=
ly
> tls is copied here. This finishes an outstanding chunk of internal proces=
s
> creation work since we've added clone3().
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Salter <msalter@redhat.com>
> Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Brian Cain <bcain@codeaurora.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Nick Hu <nickhu@andestech.com>
> Cc: Greentime Hu <green.hu@gmail.com>
> Cc: Vincent Chen <deanbo422@gmail.com>
> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-c6x-dev@linux-c6x.org
> Cc: linux-csky@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> ---
>  arch/alpha/kernel/process.c      | 2 +-
>  arch/arc/kernel/process.c        | 2 +-
>  arch/arm/kernel/process.c        | 2 +-
>  arch/arm64/kernel/process.c      | 2 +-
>  arch/c6x/kernel/process.c        | 2 +-
>  arch/csky/kernel/process.c       | 2 +-
>  arch/h8300/kernel/process.c      | 2 +-
>  arch/hexagon/kernel/process.c    | 2 +-
>  arch/ia64/kernel/process.c       | 4 ++--
>  arch/m68k/kernel/process.c       | 2 +-
>  arch/microblaze/kernel/process.c | 2 +-
>  arch/mips/kernel/process.c       | 2 +-
>  arch/nds32/kernel/process.c      | 2 +-
>  arch/nios2/kernel/process.c      | 2 +-
>  arch/openrisc/kernel/process.c   | 4 ++--
>  arch/parisc/kernel/process.c     | 2 +-
>  arch/powerpc/kernel/process.c    | 2 +-
>  arch/riscv/kernel/process.c      | 2 +-
>  arch/s390/kernel/process.c       | 2 +-
>  arch/sh/kernel/process_32.c      | 2 +-
>  arch/sparc/kernel/process.c      | 6 +++---
>  arch/sparc/kernel/process_32.c   | 2 +-
>  arch/sparc/kernel/process_64.c   | 2 +-
>  arch/um/kernel/process.c         | 2 +-
>  arch/unicore32/kernel/process.c  | 2 +-
>  arch/x86/kernel/process.c        | 2 +-
>  arch/x86/kernel/unwind_frame.c   | 2 +-
>  arch/xtensa/kernel/process.c     | 2 +-
>  include/linux/sched/task.h       | 2 +-
>  kernel/fork.c                    | 2 +-
>  30 files changed, 34 insertions(+), 34 deletions(-)
>
> [...]
> diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
> index 7dbb1bf64165..1020e2c6dcd8 100644
> --- a/arch/nds32/kernel/process.c
> +++ b/arch/nds32/kernel/process.c
> @@ -149,7 +149,7 @@ void flush_thread(void)
>  DEFINE_PER_CPU(struct task_struct *, __entry_task);
>
>  asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
> -int copy_thread_tls(unsigned long clone_flags, unsigned long stack_start=
,
> +int copy_thread(unsigned long clone_flags, unsigned long stack_start,
>                     unsigned long stk_sz, struct task_struct *p,
>                     unsigned long tls)
>  {

Hi Christian, Thank you.
Acked-by: Greentime Hu <green.hu@gmail.com>
