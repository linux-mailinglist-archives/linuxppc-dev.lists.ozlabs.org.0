Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE320BE4B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 06:31:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v16c3sSfzDr73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 14:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=green.hu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gGSSgpkE; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tzDw0FLlzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 13:06:51 +1000 (AEST)
Received: by mail-qv1-xf42.google.com with SMTP id el4so1313363qvb.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 20:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=gGSSgpkEGydgQhXoMv3qlsLt5mrlAk1v4a9rb3qIZhmM949nYvicKoTtRuPavC2CPS
 4gqA1cK6C7En4OrR24pSzu/xs4Q8Gi1+rCDB936ZFtDq7qeIhGdqLhX3QVnpV1gh8i9r
 Yr+oBV7orOZer/ucN8JKx+INZnGVhvWI3lJGYoToY83TNPCD/UDAOaXkBbXLVet7FzJU
 YdFda7nN//WQKfslSPDlW95hAsPb2mC0SvZh10iM7adIharPZOJYAapANRg5t3Qkk2Sr
 ISnw9Cflf3OgJKj3vsBG2CTZKXRPGRjLof1FkbQqiDaWgHWLcla93tfKhCRAOkB8QJ9C
 IkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=QBYlNEXnS7V4OjBOMe30YbcMtYrufeo8Y26mRU0zhxKCHAS8NBrqVKd6FEuYlRJaOp
 MQM8JB0xbiOuQ4g7TqkAe8sY9kYAsrRT3QPiP0DcS4bmTCgDGXA0zp+L41/eePwoxMte
 2jgGYxWTE6HXGvjF6dqvcLo7XBxpweKimaYGNejubScy1U6GGrnMH0AgR56hqkko6FVm
 ohg2XFqehZuMXdFv4uIm9+gadfpHOxmrY93MlJwO4LkMs6F6WNvCKqeyLHhq2tNHUzDo
 Q5eR53ou1zy84Nsce73R1tscFRkS5+zRGjMsLFE+ccLzeVdFmTrhJgxkVQ8HAO5zSi9g
 en5w==
X-Gm-Message-State: AOAM5305Gq20sypEA73i/Cwl0YsoqWXTEMie0TX9zr8yPjoNwq2CfNHG
 GgTyd6lPcDgOgaKC99XxdzlcNRvaLpDfuHWTIM0=
X-Google-Smtp-Source: ABdhPJxYyEJ7kBLOC8G+2pCCNUUQ5BD2x0Y5L6IFg/2fsP6u4dRXqSou/wb4e51wB+OOq8JrNYw66PMvbKNI3NbZUFA=
X-Received: by 2002:a0c:fe01:: with SMTP id x1mr5934189qvr.246.1593227207936; 
 Fri, 26 Jun 2020 20:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Sat, 27 Jun 2020 11:06:08 +0800
Message-ID: <CAEbi=3f3o5jS7zZDo50Vq857mS9n9kDsxkseGKrWshmmp3q5wA@mail.gmail.com>
Subject: Re: [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Brauner <christian.brauner@ubuntu.com> =E6=96=BC 2020=E5=B9=B46=
=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=887:46=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> All architectures support copy_thread_tls() now, so remove the legacy
> copy_thread() function and the HAVE_COPY_THREAD_TLS config option. Everyo=
ne
> uses the same process creation calling convention based on
> copy_thread_tls() and struct kernel_clone_args. This will make it easier =
to
> maintain the core process creation code under kernel/, simplifies the
> callpaths and makes the identical for all architectures.
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
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
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
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: "Matthew Wilcox
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
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
> [...]
> diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
> index 7b6eaca81cce..e30298e99e1b 100644
> --- a/arch/nds32/Kconfig
> +++ b/arch/nds32/Kconfig
> @@ -48,7 +48,6 @@ config NDS32
>         select HAVE_FUNCTION_GRAPH_TRACER
>         select HAVE_FTRACE_MCOUNT_RECORD
>         select HAVE_DYNAMIC_FTRACE
> -       select HAVE_COPY_THREAD_TLS
>         help
>           Andes(nds32) Linux support.

Hi Christian, Thank you.
Acked-by: Greentime Hu <green.hu@gmail.com>
