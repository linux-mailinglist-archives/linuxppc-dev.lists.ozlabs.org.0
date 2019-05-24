Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFF29206
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 09:45:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459JLs1lg9zDqSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 17:45:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.193; helo=mail-qk1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459JKT1nvqzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 17:44:12 +1000 (AEST)
Received: by mail-qk1-f193.google.com with SMTP id p26so3486284qkj.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 00:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2hM4uRH+xcF6VZw3zZp57FHF0UiIEpfXR9WFJl84UE=;
 b=s9lJnTOTXyUNMQ/XxhzxzJ9m/GCdclfw44yJNVgdKYwYrZ2TcCw9PJLTnF2CbBxV0V
 xLmXSuglxzr8X8+9cDEMqUbM8oteC29yW5eyLUyrfPE+GkcZod2fGnOE0Pz14GGRoGdZ
 C2ocuwHVoWT7d7nlnTzx99rtfZSdh4/SQdVSizA9dtaEVme/2gkb7HSTRTSCHF7KNIxd
 uneBaHt4cbATPoGFKNra2EB8U+1jLHiv3+SOgA7OSH4TuBXPpBDWz8ak4pUO/SJk2vzH
 bu+Jv5ewZI1oqrq2lu34pNfErwAO3vPADfb9PyiLs2LYq/cTdRPf1srAZNMRNsBqwiZk
 1fww==
X-Gm-Message-State: APjAAAWtrDUctk+hFdsZ/0Yzj7UWaemHuEPnH7ib4kF2n30TXV5Y689/
 OPFN+M7Vi2J3HKsHvAzbSvtIbUJHkwdWnrfN2hM=
X-Google-Smtp-Source: APXvYqy/WqyRL4BlbMWLM5GdeDgLkBJI6XwCNcVvXGonN+2oV2dtTQWrObje5U17OKbtEn0pWH9nlYsDR25/fOWgBDY=
X-Received: by 2002:ac8:2433:: with SMTP id c48mr70119188qtc.18.1558683849757; 
 Fri, 24 May 2019 00:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190522155259.11174-1-christian@brauner.io>
 <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
 <20190523163345.q5ynd2ytk7nxcvqf@brauner.io>
In-Reply-To: <20190523163345.q5ynd2ytk7nxcvqf@brauner.io>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 May 2019 09:43:53 +0200
Message-ID: <CAK8P3a26uvqmExJZsezhB+cp2ADM0Ai9jVUKWOFM6kg848bCKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] open: add close_range()
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
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Oleg Nesterov <oleg@redhat.com>, David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Todd Kjos <tkjos@android.com>,
 Jann Horn <jannh@google.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 "Dmitry V. Levin" <ldv@altlinux.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Florian Weimer <fweimer@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 6:33 PM Christian Brauner <christian@brauner.io> wrote:
> On Thu, May 23, 2019 at 07:22:17PM +0300, Konstantin Khlebnikov wrote:
> > On 22.05.2019 18:52, Christian Brauner wrote:> This adds the close_range() syscall. It allows to efficiently close a range
> > >   22 files changed, 100 insertions(+), 9 deletions(-)
> > >
> >
> > It would be better to split arch/ wiring into separate patch for better readability.
>
> Ok. You mean only do x86 - seems to be the standard - and then move the
> others into a separate patch? Doesn't seem worth to have a patch
> per-arch, I'd think.

I think I would prefer the first patch to just add the call without wiring it up
anywhere, and a second patch do add it on all architectures including x86.

     Arnd
