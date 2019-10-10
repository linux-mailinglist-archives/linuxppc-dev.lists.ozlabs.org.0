Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BC8D2F46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 19:09:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pyHx4l2DzDqLN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 04:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="Xol/3a0t"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pyFx2HcKzDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 04:08:00 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id 7so6980157ljw.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqvz+afB1Rg3ieCrlwoBKML7ipcOdiXJ/q/XXxTUovI=;
 b=Xol/3a0t0AtCulvKJeuAKS1uo5PWCjeyeDeHYLSA1FXKSnOkgSTF276gwVNHa4nPiN
 l58RJ3zV8SDjz5HcQUbk/k9PwAg2ytkBSxmhuzf7L/EFmiieyqeQcJuKFBVQbWUjfXE1
 U4t1RhqK0BT10C1Atodrl5m0eWGZPM7fTB2Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqvz+afB1Rg3ieCrlwoBKML7ipcOdiXJ/q/XXxTUovI=;
 b=gmC90GEX42rozQRxxAnTubzFz5Re1v2wtnpa9nkMpGxdi/62bYWIFUQKTOU6nRg/XW
 zuiSh6H6NTPpUaXjxSO0uj4rApm6sV3iyDKDwDFjU0bOMdgs6TtL1+aKpP2fJ/KJvsP4
 q/P50cwX1plDInDmtz3dz+BK+2/8QqDslHcizeTBX6yDwj21WnuLkMIPu/taMzXBKJjg
 Lv0r95vubGQYPoO0/RXNl322zXRe5bpq1DSKpBXdAla1dt7XKk1CaJt14FSSnfPCtNWo
 fe1GyROBU1J8FeOO158KfSla9DdvO1WQ5flzzQNDlRaVlFMB3j4AQ5IyuX7sCOPvn0yt
 QxnQ==
X-Gm-Message-State: APjAAAVHkSqsyzoe/4iVNgYDTPqBPbL+wG16Dlk/wMQy76562KKlKEiY
 TXdv2brZ4EGE3YckcI9Odtd9IHL8GIM=
X-Google-Smtp-Source: APXvYqww/r+vuJfERJc4zeBBjMDscVsdH7+fd6fHsiyHPU6gNhcZPTVr2F5eyOqGUHWVPV1f3nR+Ig==
X-Received: by 2002:a2e:8941:: with SMTP id b1mr4406864ljk.40.1570727274336;
 Thu, 10 Oct 2019 10:07:54 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id t24sm1356631ljc.23.2019.10.10.10.07.51
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2019 10:07:53 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id r22so4976788lfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 10:07:51 -0700 (PDT)
X-Received: by 2002:a19:f709:: with SMTP id z9mr6611392lfe.170.1570727268603; 
 Thu, 10 Oct 2019 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191010054140.8483-1-cyphar@cyphar.com>
 <20191010054140.8483-3-cyphar@cyphar.com>
In-Reply-To: <20191010054140.8483-3-cyphar@cyphar.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 10 Oct 2019 10:07:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
Message-ID: <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/6] namei: LOOKUP_IN_ROOT: chroot-like path resolution
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
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Shuah Khan <shuah@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 GNU C Library <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Containers <containers@lists.linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 9, 2019 at 10:42 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -2277,6 +2277,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
>
>         nd->m_seq = read_seqbegin(&mount_lock);
>
> +       /* LOOKUP_IN_ROOT treats absolute paths as being relative-to-dirfd. */
> +       if (flags & LOOKUP_IN_ROOT)
> +               while (*s == '/')
> +                       s++;
> +
>         /* Figure out the starting path and root (if needed). */
>         if (*s == '/') {
>                 error = nd_jump_root(nd);

Hmm. Wouldn't this make more sense all inside the if (*s =- '/') test?
That way if would be where we check for "should we start at the root",
which seems to make more sense conceptually.

That test for '/' currently has a "} else if (..)", but that's
pointless since it ends with a "return" anyway. So the "else" logic is
just noise.

And if you get rid of the unnecessary else, moving the LOOKUP_IN_ROOT
inside the if-statement works fine.

So this could be something like

    --- a/fs/namei.c
    +++ b/fs/namei.c
    @@ -2194,11 +2196,19 @@ static const char *path_init(struct
nameidata *nd, unsigned flags)

        nd->m_seq = read_seqbegin(&mount_lock);
        if (*s == '/') {
    -           set_root(nd);
    -           if (likely(!nd_jump_root(nd)))
    -                   return s;
    -           return ERR_PTR(-ECHILD);
    -   } else if (nd->dfd == AT_FDCWD) {
    +           /* LOOKUP_IN_ROOT treats absolute paths as being
relative-to-dirfd. */
    +           if (!(flags & LOOKUP_IN_ROOT)) {
    +                   set_root(nd);
    +                   if (likely(!nd_jump_root(nd)))
    +                           return s;
    +                   return ERR_PTR(-ECHILD);
    +           }
    +
    +           /* Skip initial '/' for LOOKUP_IN_ROOT */
    +           do { s++; } while (*s == '/');
    +   }
    +
    +   if (nd->dfd == AT_FDCWD) {
                if (flags & LOOKUP_RCU) {
                        struct fs_struct *fs = current->fs;
                        unsigned seq;

instead. The patch ends up slightly bigger (due to the re-indentation)
but now it handles all the "start at root" in the same place. Doesn't
that make sense?

             Linus
