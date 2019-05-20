Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C923B72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 17:01:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4572CP4hnJzDqDm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 01:01:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45729g4btzzDqDM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:59:35 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id l3so5865184qtj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 07:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iH7q7ju5ViVE2L49uUn5QLFQ5DZ8FjITgD5GKa2X2Zo=;
 b=V84g/UbXl+J7Y0fhdIFzNvGUtTTnD9tZcPClNJm85S7BmWO1YEjpPuM1xjUJ6fGlJ5
 kQrAXD6yyL2ISeesgmUPkwx1Wpq1PJpFLKMxEbMOoGaduop4WXgtU0yAFIlu/gVjjXs+
 Jn5GG9ojkT7STkUwddVc9zQ1Gbz1uoh+kNK7hrQDWX6nuVchLLrigKKcmjEp4JgLu5/K
 nm83liR8EmVlhuTA5x+BntGlA+CFLHkgT/WHu7ULRMyJ27FUAM/i/HpA5ssnBnAUceXu
 fgxR5lNKWe6uxcDccVXz+xpEWtcudUKYkNSbFEUJSvGVF2cAS6QT+k/ifS5acvzRHVY3
 Rh1A==
X-Gm-Message-State: APjAAAWe7VCg98hhMR1jtNXRq1gAW7TD50PFEE7q6kmLpIorsOpF7lJ1
 hLDtX1UKXGcWJ5jBwZl/0L45tCZat6BK6kLSuXY=
X-Google-Smtp-Source: APXvYqwOT7nfn0Ec9lVwVForvy74QSNQH5ELZWBScMVTNkQThEwunqzpps+HxqPvYzZryhqp4taHn31cUSXBj95IN0s=
X-Received: by 2002:ac8:2a05:: with SMTP id k5mr46480681qtk.304.1558364372377; 
 Mon, 20 May 2019 07:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190520134605.29116-1-christian@brauner.io>
 <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
 <20190520144822.xfaifawi65jus6ng@brauner.io>
In-Reply-To: <20190520144822.xfaifawi65jus6ng@brauner.io>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 May 2019 16:59:16 +0200
Message-ID: <CAK8P3a2u2gftAuzTfspAUCvWPPE0YVNOATFPN__tEQoO4GXg-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pid: add pidfd_open()
To: Christian Brauner <christian@brauner.io>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>,
 "Reshetova, Elena" <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Daniel Colascione <dancol@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, cyphar@cyphar.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 4:48 PM Christian Brauner <christian@brauner.io> wrote:
>
> On Mon, May 20, 2019 at 04:37:03PM +0200, Arnd Bergmann wrote:
> > On Mon, May 20, 2019 at 3:46 PM Christian Brauner <christian@brauner.io> wrote:
> > >
> > > In line with Arnd's recent changes to consolidate syscall numbers across
> > > architectures, I have added the pidfd_open() syscall to all architectures
> > > at the same time.
> >
> > Thanks! I've checked that the ones you have added are all
> > done correctly. However, double-checking that you got all of them,
> > I noticed that you missed mips-o32 and mips-n64. With those added:
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Perfect, will plumb mips-o32 and mips-n64 and resend once more with your
> ack added.
> Sidenote: You plan on merging the common syscall tables or will there be
> a script to do this work per-arch in the future?

David Howells also asked about this. I think having a common table will
be best in the long run, patches welcome.

As you noticed, there are still a few minor differences between the files
on mips, arm, x86, alpha and s390, and we are missing the .tbl files
for arm-compat and asm-generic, as well as an architecture independent
script.

Once that is all taken care of, we can move the entries for syscall
403 and higher into a common file, and change the script to pick
up the contents from there in addition to the architecture specific
file.

      Arnd
