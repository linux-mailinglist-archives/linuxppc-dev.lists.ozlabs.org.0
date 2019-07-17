Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 638946BAD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:55:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pZ1g3zD1zDqb1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 20:55:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pV0G3QM2zDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 17:54:21 +1000 (AEST)
Received: by mail-qt1-f194.google.com with SMTP id 44so22329955qtg.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 00:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AEqQoaGTAa0PqZng6tVavUS5clIessMaCOIARWHN9U=;
 b=SJ/PAduo6ICHeMF7a5ghoK44fRAcPtEhmOObTKiScaQMW9t++1ZOiWYzlc+pI9gtQJ
 g03iuoMZrWb8lQziDu1O4nNKo8lRwCAHACEa4aHw0lNQ1Waf525kb7VUybj6d87xqEN5
 WW+2pErDArYUlF1xedKXIxT1qi4N1E5me3pLgymac7i3XYn1O8dcrvIu9kwrUwJVqqx+
 vyuqT+W99QG/qVigA7g0sTi1SUwKiWjBQ8lIBaqXAsiKa7cExmgSwM6cgiHxc5sE5ivZ
 jFbtF6hK76mpSzvffe2P/A8w5nlDjJimUc2UpbxB7Gcrup2PLFjawFrprxGhfvFLnBFn
 fj3g==
X-Gm-Message-State: APjAAAWXVx8yNVdzLqRzednrjttCGSWcMoXhHD08BGbQvvmcuMi6ES4K
 /UXaMGgEO5TTqkb3LSsP/Q682vRJev2/DsB+0Ow=
X-Google-Smtp-Source: APXvYqwA3e0Hb/geagbCcwLScPUnQnKGWvdhC0OOCtTo0z46+Syjmze6aI0tfbRcL9XXOoSGgqg4OC9iYUrp9+KNhcg=
X-Received: by 2002:aed:3e7c:: with SMTP id m57mr26678566qtf.204.1563350058887; 
 Wed, 17 Jul 2019 00:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190717012719.5524-1-palmer@sifive.com>
 <20190717012719.5524-4-palmer@sifive.com>
In-Reply-To: <20190717012719.5524-4-palmer@sifive.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Jul 2019 09:54:02 +0200
Message-ID: <CAK8P3a2SGNJXqbHGFhVoPDZLpPYWGDVJ42D2476DLPU4nvf85g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arch: Register fchmodat4, usually as syscall 434
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 Jul 2019 20:54:01 +1000
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
Cc: Rich Felker <dalias@libc.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Stefan Agner <stefan@agner.ch>,
 linux-mips@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Namhyung Kim <namhyung@kernel.org>, kim.phillips@arm.com,
 Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-ia64@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Hannes Reinecke <hare@suse.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 James Hogan <jhogan@kernel.org>, Firoz Khan <firoz.khan@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Jiri Olsa <jolsa@redhat.com>,
 Tycho Andersen <tycho@tycho.ws>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Richard Henderson <rth@twiddle.net>, Jens Axboe <axboe@kernel.dk>,
 David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2019 at 3:29 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> This registers the new fchmodat4 syscall in most places as nuber 434,
> with alpha being the exception where it's 544.  I found all these sites
> by grepping for fspick, which I assume has found me everything.

434 is now pidfd_open, the next free one is 436.

>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/arm64/include/asm/unistd32.h           | 2 ++

You missed arch/arm64/include/asm/unistd.h, which
contains __NR_compat_syscalls

      Arnd
