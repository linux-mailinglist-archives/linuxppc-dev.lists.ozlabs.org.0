Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3760A3F17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:42:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Krxs1lckzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:42:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Krs71Kq1zDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:38:02 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id r5so3817711qtd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 13:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l2S+wnciTIE2+Vapkd9mAIufXJ8QwtBWmdVgddLBucw=;
 b=qWf3880NM9Pr4ox3FhTl81yMvtO8sTfr9MMn8VjeXVisoSEV9KYPNEdFHRM/SFe2j7
 zSCBJ4nbPxEVBApuPdcrDoHGgHjpFciaKSegV8lrauT1+FtR7X3QRcKBPmaEqzB99RKZ
 6rHKdFGTfLmljPVACEsoNVjy47b3l+WVGa+6WF7qxSKUTs4vvdgAS8D9FOH38yS3eV2U
 +yCoCT57OHKkQ2icNcnQinLc32yJiffKSM4/zfgsf+BFBIrZiDfH0OcaTgt7cd1Kh+qF
 IIIdk7Nef1uEjZp4J7AU5eEsOvndO6cBf2uRmIUWWlwpta8tMshdQACnG5Oj1nU6UtVF
 2pFA==
X-Gm-Message-State: APjAAAW1xM0St+8HM9B1Mnf8FEYppUE0YkhGD97jLbLa4VweBzwcrqKf
 BetfjxY1S8XKkZb63BHB/UlR+lfMDBJ6q7XnC70=
X-Google-Smtp-Source: APXvYqwtNMpNjOd1HtJ8sOpmwxGcNvBnMfM6zhXSKSJK4ULJROOvXNbKx16SmaRfjOCM1TgLQruyn5cyAJe5Ery0vHs=
X-Received: by 2002:aed:2842:: with SMTP id r60mr7893403qtd.142.1567197480529; 
 Fri, 30 Aug 2019 13:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <bb6d25c6baae315d05b571d8c508f0e8fa90027c.1567188299.git.msuchanek@suse.de>
 <20190830194651.31043-1-msuchanek@suse.de>
 <CAK8P3a16=ktJm5B3c5-XS7SqVuHBY5+E2FwVUqbdOdWK-AUgSA@mail.gmail.com>
 <20190830221315.4b3b8a74@kitsune.suse.cz>
In-Reply-To: <20190830221315.4b3b8a74@kitsune.suse.cz>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 22:37:44 +0200
Message-ID: <CAK8P3a1nGnB3GWEAso9MKW5HuxuB9ez46HZgS=GX-odtJuAMWQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "asm-generic: Remove unneeded
 __ARCH_WANT_SYS_LLSEEK macro"
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
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

On Fri, Aug 30, 2019 at 10:13 PM Michal Such=C3=A1nek <msuchanek@suse.de> w=
rote:
> On Fri, 30 Aug 2019 21:54:43 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
> > > index 5bbf587f5bc1..2f3c4bb138c4 100644
> > > --- a/fs/read_write.c
> > > +++ b/fs/read_write.c
> > > @@ -331,7 +331,7 @@ COMPAT_SYSCALL_DEFINE3(lseek, unsigned int, fd, c=
ompat_off_t, offset, unsigned i
> > >  }
> > >  #endif
> > >
> > > -#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> > > +#ifdef __ARCH_WANT_SYS_LLSEEK
> > >  SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high=
,
> > >                 unsigned long, offset_low, loff_t __user *, result,
> > >                 unsigned int, whence)
> >
> > However, only reverting the patch will now break all newly added
> > 32-bit architectures that don't define __ARCH_WANT_SYS_LLSEEK:
> > at least nds32 and riscv32 come to mind, not sure if there is another.
>
> AFAICT nds32 never had the syscall. Its headers were added without
> __ARCH_WANT_SYS_LLSEEK before the define was removed.

nds32 got it from include/asm-generic/unistd.h

        Arnd
