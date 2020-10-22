Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0EB296504
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 21:06:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHH0T53crzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 06:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KQqTFOK8; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHGyc4PF5zDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 06:05:07 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id v22so1449309ply.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ob2vCJvO6llStuDKjUpnqeOT2ObygH+mOzcnW04eANY=;
 b=KQqTFOK8RfeQlRsCMQ+rOlUOsaIw3aFT2tl0EvIIitPh93BRypnBq10dbZ1VQInVA9
 YBqadNAg8WpA2s2M51/9SZIy6oP0pnbbWbfMb7wIWJV2snjJBMbyo5oSDcHw4N1zr7/S
 VZLvINfglpSloiYKbOwAZRZgsEq5EwVd6j156C6w/ZUnsQNcPlNYKpHJP5uI2nd5y9vn
 Eb462d8qlKbplpH5u1WCwEWQN9mxoYO0QRuuyd1KRKvAJJWpZKPK5rzGEmieFY4kQrsm
 FHET+zmyltpbQH7fuqtpyH09Ge3zLiQZSD5eVuK163dQLFMNQGhprwY4hoqO0xWMFeFJ
 fZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ob2vCJvO6llStuDKjUpnqeOT2ObygH+mOzcnW04eANY=;
 b=HkqsbYB43Zv4cKrdzf7tNk6Rj4EFeIoAqb5s5PfyFEq44N5dgSQnil53rL7MChVo5h
 grhq53yUOjYPpnK2TYesSsSonDmk63/sF2QzONY80DLtFZn7S4a15FOq9oE5WwQdAAWm
 juZ6WawjhO/T0lLNZpiAyELYxEHDqab8VpW7ppQnqd5mIbngQv9/KjNzgA5j+O4zyTRF
 6dv+Epjdwf40KViTWUUn/2bR4V5dv5J6mtqQivU9leeMg+6YFzBZShK8sqcz4ixPuu0h
 WIWtXzDdClc+iqNpoPTf6nfYGkDdr+587DB0n8W4fcCMdl/o55d1+6iKksYOBzYZ4rAi
 Wc3A==
X-Gm-Message-State: AOAM533DJH5GDT+BtrBstxa2HCmJ/WoLZjrCpCH2uRzYNnCmSWHGxlMZ
 Ejbt4fd57ePFIXDM4CffgT3wH17Xv1yBIeVIA/bWdw==
X-Google-Smtp-Source: ABdhPJywMCKq0vfUuAKWQ9RLmH3NxEeoaMuMMn+wDHsffqxkAqXyKJ4o6MiCnyTmuBnnGxJWFn5poUUGRnshTJa4lRY=
X-Received: by 2002:a17:902:c40b:b029:d3:def2:d90f with SMTP id
 k11-20020a170902c40bb02900d3def2d90fmr3608595plk.29.1603393503931; Thu, 22
 Oct 2020 12:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201021233914.GR3576660@ZenIV.linux.org.uk>
 <20201022082654.GA1477657@kroah.com>
 <80a2e5fa-718a-8433-1ab0-dd5b3e3b5416@redhat.com>
 <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
 <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022132342.GB8781@lst.de>
 <8f1fff0c358b4b669d51cc80098dbba1@AcuMS.aculab.com>
 <CAKwvOdnix6YGFhsmT_mY8ORNPTOsN3HwS33Dr0Ykn-pyJ6e-Bw@mail.gmail.com>
 <CAK8P3a3LjG+ZvmQrkb9zpgov8xBkQQWrkHBPgjfYSqBKGrwT4w@mail.gmail.com>
In-Reply-To: <CAK8P3a3LjG+ZvmQrkb9zpgov8xBkQQWrkHBPgjfYSqBKGrwT4w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Oct 2020 12:04:52 -0700
Message-ID: <CAKwvOdnhONvrHLAuz_BrAuEpnF5mD9p0YPGJs=NZZ0EZNo7dFQ@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 11:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 22, 2020 at 7:54 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > On Thu, Oct 22, 2020 at 9:35 AM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > Which makes it a bug in the kernel C syscall wrappers.
> > > They need to explicitly mask the high bits of 32bit
> > > arguments on arm64 but not x86-64.
> >
> > Why not x86-64? Wouldn't it be *any* LP64 ISA?
>
> x86-64 is slightly special because most instructions on a 32-bit
> argument clear the upper 32 bits, while on most architectures
> the same instruction would leave the upper bits unchanged.

Oh interesting, depends on the operations too on x86_64 IIUC?

>
> > Attaching a patch that uses the proper width, but I'm pretty sure
> > there's still a signedness issue .  Greg, would you mind running this
> > through the wringer?
>
> I would not expect this to change anything for the bug that Greg
> is chasing, unless there is also a bug in clang.
>
> In the version before the patch, we get a 64-bit argument from
> user space, which may consist of the intended value in the lower
> bits plus garbage in the upper bits. However, vlen only gets
> passed down  into import_iovec() without any other operations
> on it, and since import_iovec takes a 32-bit argument, this is
> where it finally gets narrowed.

Passing an `unsigned long` as an `unsigned int` does no such
narrowing: https://godbolt.org/z/TvfMxe (same vice-versa, just tail
calls, no masking instructions).
So if rw_copy_check_uvector() is inlined into import_iovec() (looking
at the mainline@1028ae406999), then children calls of
`rw_copy_check_uvector()` will be interpreting the `nr_segs` register
unmodified, ie. garbage in the upper 32b.

>
> After your patch, the SYSCALL_DEFINE3() does the narrowing
> conversion with the same clearing of the upper bits.
>
> If there is a problem somewhere leading up to import_iovec(),
> it would have to in some code that expects to get a 32-bit
> register argument but gets called with a register that has
> garbage in the upper bits /without/ going through a correct
> sanitizing function like SYSCALL_DEFINE3().
>
>       Arnd



-- 
Thanks,
~Nick Desaulniers
