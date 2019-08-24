Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 102FF9C007
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 22:20:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46G8lL0BD3zDqv6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 06:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::944; helo=mail-ua1-x944.google.com;
 envelope-from=dancol@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CiJfEFfo"; 
 dkim-atps=neutral
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46G8jD6bBpzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:18:15 +1000 (AEST)
Received: by mail-ua1-x944.google.com with SMTP id k7so4453633uao.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zfEO+Of97f0VCldvVRJl3jzEF01O6soGli/loZclzk=;
 b=CiJfEFfo1GhUFTvULOmIWC5bky0UhNotA9EofhxO4+2Cd9KvnmBRPB6hGuQFhuAXwJ
 Mf7+XdP/Zb4xXtjIaOfMfbMaQpe98nHR1WFAIDUqUl6lSfoh5N6YkchHMEss2Z7wmXRv
 mIN1BXAFZpi+SynQvspsYrZxrH8jV01EUoqVt4oI5oVTwO6tctGVNu+Gx+DZX4YcnnWT
 pUO0Oeafs9qrk8HXoIhQUWukfn1efWZ6t1CZQkpVU6dxRoB/3gD8bO7d0APRfzkEuP01
 6A3Oop2AiXmYSlChvGG9uj5KK5z6ZoLIIlfJYts9owMo4k3T92eSIqfy7wB0W5m6uFPz
 fndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zfEO+Of97f0VCldvVRJl3jzEF01O6soGli/loZclzk=;
 b=F9fY9g6R5VBkBbL6kxBz/emAzf4Yete3xamcR1lds4mGlpXO8L86zMuvJls075kEzX
 h5j5poh2Z7ousvWV238L8BotZlQ4fpkS6wGhw10jkL+Oa8rQj7li1B64DXueggnALgRt
 ZfdyszvqEMfx6GXYMT8ThTrLhCxwfgA39WlaIHgqJkY3ty1RVf0f93DvqpTL4lMwgRDe
 o6B7okasOVH9uSXs/W4vdchqEmPCSVw+Yu4fWaR0WfTuQWZdCTDgmkllx6p881Ka/j0P
 nS3l/sMg9nM7kta5e5wufok4PC1GiQ3vid6LyJATxXZC12cXRD4p9Qk/o7jHKbCZlOtz
 mbsA==
X-Gm-Message-State: APjAAAU+PVT4qeljObTBl40EI1jEcQnDgabGSNY8QRtrcEca409/otcx
 TP72OUohdGJ00ooQzOwuTWC4+82ay1A6sBqGHte3OQ==
X-Google-Smtp-Source: APXvYqxjVPBCRB+CRwr4t5I/R3fEcc9xAf9hOK0mmX0eHtTD2rTNJ8/siW0Z/MdtMGoJdUYWfX/KXqMK5Snr1pytTE0=
X-Received: by 2002:a9f:230c:: with SMTP id 12mr5623819uae.85.1566677889720;
 Sat, 24 Aug 2019 13:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190820033406.29796-1-cyphar@cyphar.com>
 <20190820033406.29796-8-cyphar@cyphar.com>
In-Reply-To: <20190820033406.29796-8-cyphar@cyphar.com>
From: Daniel Colascione <dancol@google.com>
Date: Sat, 24 Aug 2019 13:17:33 -0700
Message-ID: <CAKOZuesfxRBJe314rkTKXtjXdz6ki3uAUBYVbu5Q2rd3=ADphQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v11 7/8] open: openat2(2) syscall
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 8:37 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> The most obvious syscall to add support for the new LOOKUP_* scoping
> flags would be openat(2). However, there are a few reasons why this is
> not the best course of action:
>
>  * The new LOOKUP_* flags are intended to be security features, and
>    openat(2) will silently ignore all unknown flags. This means that
>    users would need to avoid foot-gunning themselves constantly when
>    using this interface if it were part of openat(2). This can be fixed
>    by having userspace libraries handle this for users[1], but should be
>    avoided if possible.
>
>  * Resolution scoping feels like a different operation to the existing
>    O_* flags. And since openat(2) has limited flag space, it seems to be
>    quite wasteful to clutter it with 5 flags that are all
>    resolution-related. Arguably O_NOFOLLOW is also a resolution flag but
>    its entire purpose is to error out if you encounter a trailing
>    symlink -- not to scope resolution.
>
>  * Other systems would be able to reimplement this syscall allowing for
>    cross-OS standardisation rather than being hidden amongst O_* flags
>    which may result in it not being used by all the parties that might
>    want to use it (file servers, web servers, container runtimes, etc).
>
>  * It gives us the opportunity to iterate on the O_PATH interface. In
>    particular, the new @how->upgrade_mask field for fd re-opening is
>    only possible because we have a clean slate without needing to re-use
>    the ACC_MODE flag design nor the existing openat(2) @mode semantics.
>
> To this end, we introduce the openat2(2) syscall. It provides all of the
> features of openat(2) through the @how->flags argument, but also
> also provides a new @how->resolve argument which exposes RESOLVE_* flags
> that map to our new LOOKUP_* flags. It also eliminates the long-standing
> ugliness of variadic-open(2) by embedding it in a struct.
>
> In order to allow for userspace to lock down their usage of file
> descriptor re-opening, openat2(2) has the ability for users to disallow
> certain re-opening modes through @how->upgrade_mask. At the moment,
> there is no UPGRADE_NOEXEC. The open_how struct is padded to 64 bytes
> for future extensions (all of the reserved bits must be zeroed).

Why pad the structure when new functionality (perhaps accommodated via
a larger structure) could be signaled by passing a new flag? Adding
reserved fields to a structure with a size embedded in the ABI makes a
lot of sense --- e.g., pthread_mutex_t can't grow. But this structure
can grow, so the reservation seems needless to me.
