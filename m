Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6920A87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 16:58:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454ZLZ4cLLzDqdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 00:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.221.194; helo=mail-vk1-f194.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454ZHr3RdTzDqcN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:56:24 +1000 (AEST)
Received: by mail-vk1-f194.google.com with SMTP id p24so1110169vki.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 07:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05GCtpont9YEywFzf84z1q9MwrqOSiu52jwQOd14/zs=;
 b=L/sSaZEZPYSqFXHzfC9gsrKtD1T+NjUwgVAExGkjfdw4Ko1GVcdQxpWUO1ps3/uwOC
 +RR7PGe7aMQexVDCmY0v2sk6y6kchPx8+Cu9hHdApTtgdkzToRmpSLXhobSkw2/jc6sF
 T6zd7cY5yiFq6o/EkVOxxg9l0OROfuOjOb8UYgxWXMhJiSv33O6WdNbD/EyU8w8I9X+g
 PMa8sPITS5uy+U8hnko1zrYjWiy3qcAU4gFIigqeutEklDpZZ+N1MvNm+qK88+++elpC
 TuXGISrboEChb8LSb639MIsNcun1vZeQwPn5eE9F18+Nx9dQjXfKUkiB5Nj1DFnd+HNT
 /hKw==
X-Gm-Message-State: APjAAAVFSRSGxa9aTrPs7y9wxk4BX9lPoqAnq+flr4DB1Yqk7T0exMnG
 m8Bc1ou6gcXeaX+qhUOXpOQZtKq1EvxZtSMUPUE=
X-Google-Smtp-Source: APXvYqwJkEyDq3zOtk8OfRAodMj5uaJzILWIRnCKOk3dtxYk7GsdMRXLOna8zNuSkRyU4hilGsRAQgTc6aWaoZtw994=
X-Received: by 2002:a1f:c2c1:: with SMTP id s184mr23362067vkf.65.1558018580810; 
 Thu, 16 May 2019 07:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190516135944.7205-1-christian@brauner.io>
In-Reply-To: <20190516135944.7205-1-christian@brauner.io>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 May 2019 16:56:08 +0200
Message-ID: <CAMuHMdVbUJ0+28Lc2wHPah8UUk8Ou9m81KzLvhrcMsJzz2bX2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
To: Christian Brauner <christian@brauner.io>,
 David Howells <dhowells@redhat.com>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, elena.reshetova@intel.com,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Daniel Colascione <dancol@google.com>,
 linux-mips@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, cyphar@cyphar.com,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian, David,

On Thu, May 16, 2019 at 4:00 PM Christian Brauner <christian@brauner.io> wrote:
> This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> process that is created via traditional fork()/clone() calls that is only
> referenced by a PID:
>
> int pidfd = pidfd_open(1234, 0);
> ret = pidfd_send_signal(pidfd, SIGSTOP, NULL, 0);
>
> With the introduction of pidfds through CLONE_PIDFD it is possible to
> created pidfds at process creation time.
> However, a lot of processes get created with traditional PID-based calls
> such as fork() or clone() (without CLONE_PIDFD). For these processes a
> caller can currently not create a pollable pidfd. This is a huge problem
> for Android's low memory killer (LMK) and service managers such as systemd.
> Both are examples of tools that want to make use of pidfds to get reliable
> notification of process exit for non-parents (pidfd polling) and race-free
> signal sending (pidfd_send_signal()). They intend to switch to this API for
> process supervision/management as soon as possible. Having no way to get
> pollable pidfds from PID-only processes is one of the biggest blockers for
> them in adopting this api. With pidfd_open() making it possible to retrieve
> pidfd for PID-based processes we enable them to adopt this api.
>
> In line with Arnd's recent changes to consolidate syscall numbers across
> architectures, I have added the pidfd_open() syscall to all architectures
> at the same time.

> +428    common  pidfd_open                      sys_pidfd_open

This number conflicts with "[PATCH 4/4] uapi: Wire up the mount API
syscalls on non-x86 arches", which is requested to be included before
rc1.

Note that none of this is part of linux-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
