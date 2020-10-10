Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C943E289CDC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 03:05:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7RZ311JbzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 12:05:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Wf1q2lnu; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7RXX0bN6zDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Oct 2020 12:03:54 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so11256950ljm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Oct 2020 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7OwKgWi2gSxmEp/hYxtSzWSpApJcXjT+OdSqNt7VYU=;
 b=Wf1q2lnubIrbXjk14tkrYxXcbBXmzq9qYbXL1Q2p8EB+0CvkKSqF+3HlgfvaB+X8S6
 SG17cHHpnVFX880L11ZWENbR0ebhET03jaC+x724GDZbfQvjLR0+JYp1fVD8FDqLvksZ
 kRBaHY97weaJ2iFk9krv7PVK7ymwvLjzNkwFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7OwKgWi2gSxmEp/hYxtSzWSpApJcXjT+OdSqNt7VYU=;
 b=QxbxsOwGrQ5iRU7QZOWYf4MwJJnf6Rkb8gVvTBYBToIDxSGDqlLpPhFeOcaUjMdHnO
 di7tPa6aJuvR6Mq02NWRSWalJqF85GiFP30kO2YRFOdxPd4BDukIXq9VYixe/CnvLXk5
 i7ojLMtYhgvYlm10l7OnlcP7K5lGmxZp+mbYfIn938hVOEG53Lr8ZFd6h3pTUWVo7/Ij
 dhSexbSHji7ymvxKOUajqKUo2fy2aU38clrI1dTZwVbQDtJstE0W03yEQIeLBLqj+KHx
 g9ks5b8EABLcDVGvB6/CRHIrrMhxfgfCbLVczsI9jBav6CUWKKlbGk0KYNEhlwKbhlas
 VYPQ==
X-Gm-Message-State: AOAM530+cqzGmF7z+CHAMn4+8G7sdqBv1ZXvaQZGktOjCUO0SVTzRefu
 LwbZS1z5Y5i8Tk7TlWj3lcnrr3hEAv2N7w==
X-Google-Smtp-Source: ABdhPJxH73hZB85UlbN1EIt+oW/yhYMwpaElPUq1acdT+ykiH5vQSJ0er7/ez7h9RjCYyMXdHB03ug==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr6410550ljp.375.1602291830350; 
 Fri, 09 Oct 2020 18:03:50 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m2sm1805211lfl.249.2020.10.09.18.03.47
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 18:03:48 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id c21so11229136ljn.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Oct 2020 18:03:47 -0700 (PDT)
X-Received: by 2002:a2e:2202:: with SMTP id i2mr5735571lji.70.1602291827290;
 Fri, 09 Oct 2020 18:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-6-hch@lst.de>
 <20201001223852.GA855@sol.localdomain>
 <20201001224051.GI3421308@ZenIV.linux.org.uk>
 <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
 <20201009220633.GA1122@sol.localdomain>
In-Reply-To: <20201009220633.GA1122@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 9 Oct 2020 18:03:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whcEzYjkqdpZciHh+iAdUttvfWZYoiHiF67XuTXB1YJLw@mail.gmail.com>
Message-ID: <CAHk-=whcEzYjkqdpZciHh+iAdUttvfWZYoiHiF67XuTXB1YJLw@mail.gmail.com>
Subject: Re: [PATCH 05/14] fs: don't allow kernel reads and writes without
 iter ops
To: Eric Biggers <ebiggers@kernel.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 9, 2020 at 3:06 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> It's a bit unintuitive that ppos=NULL means "use pos 0", not "use file->f_pos".

That's not at all what it means.

A NULL ppos means "this has no position at all", and is what we use
for FMODE_STREAM file descriptors (ie sockets, pipes, etc).

It also means that we don't do the locking for position updates.

The fact that "ki_pos" gets set to zero is just because it needs to be
_something_. It shouldn't actually ever be used for stream devices.

                  Linus
