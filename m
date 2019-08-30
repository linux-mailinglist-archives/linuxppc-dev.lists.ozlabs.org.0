Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AFA3EBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:01:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kr2k23GqzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KqvY70WPzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 05:55:03 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id i4so8894852qtj.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 12:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExU5G+PwI9dTS56j9hO/oLGwcWM1/TUToUkPYA9x6Bc=;
 b=ou92BeCcCUVv7PHxNHPM8u0tqrrMXyeS9hRm+vUg+bxAzQTQzuuegEBuaD/61auIf6
 RSfdMeTfQJxttWfDZQyU94JXUHKohkkq6se4Lm1UWxjb71mCvYQzxmb7m3zpqkHsIie+
 cK8Aq+LrHahs3V6UzuS9qjold0Dkn5GWukHkUFlG10faPlq4q9OKS7sxVjQwc5GVxE71
 7Mh9/+kkGGA2gikFgBKbYEvkLSDYzA4x75JL/2lPriltVKJTvmc3USUDdMwo/r5zFurx
 XpD1UkldveFfRxe36WtXaTVYzCFTVN5PdI9OFsAWbXCJLiadCU+amlmlEU3z0dKSBWJ+
 ndWg==
X-Gm-Message-State: APjAAAV8bvIvr3MrARjW6ImnuueVTCwxaI+s94cfJJGh3G0EByeT1JNR
 PTNIhqU1LoUNITeaFnWB673IFOMWxbJQR2s8nZ0=
X-Google-Smtp-Source: APXvYqwZY0gn6CH3cRH9igUuAGm82SVhxnyEC96W1blIExgbWnZWteDT8KBRfurqfy13BwkBPO9mQLpqWeGxo4iJWnI=
X-Received: by 2002:a05:6214:80b:: with SMTP id
 df11mr4657098qvb.45.1567194899620; 
 Fri, 30 Aug 2019 12:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <bb6d25c6baae315d05b571d8c508f0e8fa90027c.1567188299.git.msuchanek@suse.de>
 <20190830194651.31043-1-msuchanek@suse.de>
In-Reply-To: <20190830194651.31043-1-msuchanek@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 21:54:43 +0200
Message-ID: <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
Subject: Re: [PATCH] Revert "asm-generic: Remove unneeded
 __ARCH_WANT_SYS_LLSEEK macro"
To: Michal Suchanek <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, linux-xtensa@linux-xtensa.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2019 at 9:46 PM Michal Suchanek <msuchanek@suse.de> wrote:
>
> This reverts commit caf6f9c8a326cffd1d4b3ff3f1cfba75d159d70b.
>
> Maybe it was needed after all.
>
> When CONFIG_COMPAT is disabled on ppc64 the kernel does not build.
>
> There is resistance to both removing the llseek syscall from the 64bit
> syscall tables and building the llseek interface unconditionally.
>
> Link: https://lore.kernel.org/lkml/20190828151552.GA16855@infradead.org/
> Link: https://lore.kernel.org/lkml/20190829214319.498c7de2@naga/
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

This seems like the right idea in principle.

> index 5bbf587f5bc1..2f3c4bb138c4 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -331,7 +331,7 @@ COMPAT_SYSCALL_DEFINE3(lseek, unsigned int, fd, compat_off_t, offset, unsigned i
>  }
>  #endif
>
> -#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> +#ifdef __ARCH_WANT_SYS_LLSEEK
>  SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high,
>                 unsigned long, offset_low, loff_t __user *, result,
>                 unsigned int, whence)

However, only reverting the patch will now break all newly added
32-bit architectures that don't define __ARCH_WANT_SYS_LLSEEK:
at least nds32 and riscv32 come to mind, not sure if there is another.

I think the easiest way however would be to combine the two checks
above and make it

#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT) ||
defined(__ARCH_WANT_SYS_LLSEEK)

and then only set __ARCH_WANT_SYS_LLSEEK for powerpc.

     Arnd
