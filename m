Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF18145CFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 21:17:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482xXp5pfyzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 07:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=c6/3aq9H; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482xVr3dkDzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 07:16:04 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id 203so545635lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GLaXGgH4O8WRc84Pr2qZRgc6Y4dR2xbO1cV7z28yhvw=;
 b=c6/3aq9HZcbkVeterj3636njxvpxgw2prgy9shUHvAD8OXcz0f+wkIkYAuQbjGEWBg
 wVKr74EpV63VLAZVJqyVwqQj1WCI2m0sZGTgzXF83HkQ+44OAwRd+/sOaE20vmKvYmlT
 36kGk2sd4GMMWPOxwa4EBhU0TxNUpffdyIDvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GLaXGgH4O8WRc84Pr2qZRgc6Y4dR2xbO1cV7z28yhvw=;
 b=HCKg58KQHNZkqVIQlsMG5Zb7c58HHShspn53TL1MPuipKzvRKf9xG/z5OH75hcfyxu
 KiWnnJQqm8iTO5gdzc7tYGg1rIgjU7pcxTtCYF2fGIhRF3ff9DZ5AiUiTnoWDRaSHTgn
 Z+dcmPRSDSk+InM+5QDNQbdMsrM+q7NuffzSYMf4iFwJVlVGEbP66FFkENa3yGxnAu83
 bfstwgubvd2xmahCLZkGRiy43+nUbEvlYYuqt8r4oOygMnbs/Ip6XTNJO4Slixe18Ywh
 mKIrox8tMjMwj0rdhOhVBmxhNiZIk/M9tgsedebizAND7zoyTTgcUFz2Xoj4EEKsNB/Q
 KuPA==
X-Gm-Message-State: APjAAAWLiyBwTKFvrv3LLeznNGSljSG8fy3tT/C+/ajFcqrt8Gc1EQ4H
 AjpIUYzs5Qa/pKWI+U1Ws0N0bdwG//4=
X-Google-Smtp-Source: APXvYqxzBU+bq7N0UXa/cgeyso8wrb8HoY+V6GdSz4QWMY1EkgJHQhTcZ3SL2fTP8Nirod3X2GIkeQ==
X-Received: by 2002:ac2:5596:: with SMTP id v22mr2690013lfg.200.1579724159544; 
 Wed, 22 Jan 2020 12:15:59 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id v8sm21015819lji.16.2020.01.22.12.15.58
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 12:15:58 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id y4so458763ljj.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 12:15:58 -0800 (PST)
X-Received: by 2002:a05:651c:282:: with SMTP id
 b2mr20649915ljo.41.1579724158165; 
 Wed, 22 Jan 2020 12:15:58 -0800 (PST)
MIME-Version: 1.0
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
 <CAHk-=wgNQ-rWoLg0OCJYYYbKBnRAUK4NPU-OD+vv-6fWnd=8kA@mail.gmail.com>
 <CAHk-=winQ_607Sp09H1w70A_WPmt7ydxrNrwvk=N29S=FpASZw@mail.gmail.com>
In-Reply-To: <CAHk-=winQ_607Sp09H1w70A_WPmt7ydxrNrwvk=N29S=FpASZw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Jan 2020 12:15:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgK1Pbj4DD4OLFuFg1Tgvup85h9W5ZroCOwAE1qCDWuBg@mail.gmail.com>
Message-ID: <CAHk-=wgK1Pbj4DD4OLFuFg1Tgvup85h9W5ZroCOwAE1qCDWuBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 12:00 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> A bit more re-organization also allows us to do the unsafe_put_user()
> unconditionally.

I meant the "user_access_begin()", of course.

Code was right, explanation was wrong.

That said, with this model, we _could_ make the

        unsafe_put_user(offset, &prev->d_off, efault_end);

be unconditional too, since now 'prev' will actually be a valid
pointer - it will match 'dirent' if there was no prev.

But since we want to test whether we had a previous entry anyway (for
the signal handling latency issue), making the write to the previous
d_reclen unconditional (and then overwriting it the next iteration)
doesn't actually buy us anything.

It was the user_access_begin() I'd rather have unconditional, since
otherwise it gets duplicated in two (very slightly) different versions
and we have unnecessary code bloat.

           Linus
