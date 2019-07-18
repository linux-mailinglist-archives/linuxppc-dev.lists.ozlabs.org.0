Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9B6D685
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 23:34:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qS863nBRzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 07:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qS370b1wzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 07:30:10 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id m14so21632826qka.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 14:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXA3fCzwUc7S8+pRMyyFoXYQ6Lxj2094nm3NP6Me1pg=;
 b=OjVoESVva1CWkevxYVwa6u/4/j30kNx/fTN/uDSc817uL3pGPMpO7FnaJnMS3vHHUw
 DvBCAaxbSMTFGXmII+R1zW2yiIkXHSQLqpaidhK2uqNvay3nj0/djnfpWlEp2LOnAZVh
 wiiBMYFIZ314yoWH/fWdBtO4f9+5vS62ekxGgVt5h4l0szMtWFFZPE3ixds1w4QQMe2u
 knzmrzRy3coJWUF9ccEeJG4NnIXx6f3N3Uf/ZnO4fEmjdpLopmPkwHD8kwKoPGG0/g7A
 6BoQ2hPK9366ESL+rE4rCEq8DFfNl5OpL/stjsoaNkEaEWHKa2cJoNClXB6/IaQ+6Sfv
 9BbA==
X-Gm-Message-State: APjAAAVYuMZM7d4XfUtJM69jPnisD02azV8t700QeYqdulipHS/osOSs
 u18byhh4Q1DgC25wW8/qSSidzuoW8Dng1sDKDVU=
X-Google-Smtp-Source: APXvYqwAnwmqNY3PBxWPuNJix5kLy4PEG765j1QyxyCKOemfTtTG+YSbK8sHn1TSB6/emkF2O/3aVUhdKFw2Cxuzrg4=
X-Received: by 2002:a37:5f45:: with SMTP id t66mr32747316qkb.286.1563485406992; 
 Thu, 18 Jul 2019 14:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-9-cyphar@cyphar.com>
 <CAK8P3a33rGhPDFfRBAQyLTMG_WoEgX_toDgWR2O7rSwxKsZG+w@mail.gmail.com>
 <20190718161231.xcno272nvqpln3wj@yavin>
In-Reply-To: <20190718161231.xcno272nvqpln3wj@yavin>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jul 2019 23:29:50 +0200
Message-ID: <CAK8P3a3MiYK4bJiA3G_m5H-TpfN5__--b+=szsJBhG7_it+NQg@mail.gmail.com>
Subject: Re: [PATCH v9 08/10] open: openat2(2) syscall
To: Aleksa Sarai <cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 6:12 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
> On 2019-07-18, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Jul 6, 2019 at 5:00 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
> >
> > In fact, that seems similar enough to the existing openat() that I think
> > you could also just add the fifth argument to the existing call when
> > a newly defined flag is set, similarly to how we only use the 'mode'
> > argument when O_CREAT or O_TMPFILE are set.
>
> I considered doing this (and even had a preliminary version of it), but
> I discovered that I was not in favour of this idea -- once I started to
> write tests using it -- for a few reasons:
>
>   1. It doesn't really allow for clean extension for a future 6th
>          argument (because you are using up O_* flags to signify "use the
>          next argument", and O_* flags don't give -EINVAL if they're
>          unknown). Now, yes you can do the on-start runtime check that
>          everyone does -- but I've never really liked having to do it.
>
>          Having reserved padding for later extensions (that is actually
>          checked and gives -EINVAL) matches more modern syscall designs.
>
>   2. I really was hoping that the variadic openat(2) could be done away
>      using this union setup (Linus said he didn't like it, and suggested
>          using something like 'struct stat' as an argument for openat(2) --
>          though personally I am not sure I would personally like to use an
>          interface like that).
>
>   3. In order to avoid wasting a syscall argument for mode/mask you need
>          to either have something like your suggested mode_mask (which makes
>          the syscall arguments less consistent) or have some sort of
>          mode-like argument that is treated specially (which is really awful
>          on multiple levels -- this one I also tried and even wrote my
>          original tests using). And in both cases, the shims for
>          open{,at}(2) are somewhat less clean.

These are all good reasons, thanks for providing the background.

> All of that being said, I'd be happy to switch to whatever you think
> makes the most sense. As long as it's possible to get an O_PATH with
> RESOLVE_IN_ROOT set, I'm happy.

I don't feel I should be in charge of making the decision. I'd still
prefer avoiding the indirect argument structure because

4. it's inconsistent with most other syscalls

5. you get the same problem with seccomp and strace that
   clone3() has -- these and others only track the register
   arguments by default.

6. copying the structure adds a small overhead compared to
   passing registers

7. the calling conventions may be inconvenient for  a user space
   library, so you end up with different prototypes for the low-level
   syscall and the libc abstraction.

I don't see any of the above seven points as a showstopper
either way, so I hope someone else has a strong opinion
and can make the decision easier for you.

In the meantime just keep what you have, so you don't have
to change it multiple times.

       Arnd
