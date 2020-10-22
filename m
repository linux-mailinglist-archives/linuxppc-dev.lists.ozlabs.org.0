Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C832965DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 22:14:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHJV61v7KzDq5f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 07:14:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vObNVdN2; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHJR851tyzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 07:11:32 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so1660026pgg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GumHU2X+g85YksdsSI4rtK9zksU56rVy/CgxVuW0jEM=;
 b=vObNVdN2VFhAojESuCXkrxhn1YIwWVv+1XhIW4tZBL+fxMiFOMf/wpbwdQdbTEuqzU
 didUUL5vkJxiQnySAkNm5bA5dzi4HDPRY/b2q9PCHYr38o1QdWg4eoCCMy0LZ69odEBE
 EeVL+yKYldv1+Aa2ZS3w6i1XFzR6cyTrr6WpyCHfwh/bI39Aml+4GPRR3PK53sN4m6b3
 rUVDazS3OFa6481GJ9+htMab1H1YbLsr5SViapf30nhQCEj8D6AxmtXaycQnaAAFnPK+
 ve/0E2puLZtKaH/rY1wRoNU3uLbs1Hp/JNHjorNUJ0gL9lCRxpciXdv4OO2qkM+X3ZVh
 gy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GumHU2X+g85YksdsSI4rtK9zksU56rVy/CgxVuW0jEM=;
 b=MP+TFMPxRZdXMM6AqpwaUAxq4tH+URtgGo51zwnpZ53w20ZGdbAjCSqZHtezPS/IfN
 3aVBIqO3DY/gLJDgqwTfZgS33iFpYPRNP6S3DF8fWTkwVXpNkIbfVt2m5qqr3QR1Rqdw
 skszQdDco+q94LRu+hhDP1W5/ZfngNnRaVh9ADuVUARiizIHtz/ueAGacy9RGOl5d7N3
 M9CKPXd/+PwaiGxA7VxpF8ZJ9R5n+9QDhD4BtX0nRbdys83qCTsnO/krIiuV1MJdWYvA
 X2gqF/nspnXAStegRkzbg/3iLxjbreC27XYJ5nRdjv9xG3JxYtGld2id3ZpN6Kid+uJM
 LPxQ==
X-Gm-Message-State: AOAM532Y+384JwCOZ/ACJ8ray0a6zlUQqkXXJkybYmNLMYGAbf9yrq38
 FdYQmA72nI30Cli2YKM8TKUKyM8Rr9e8jRwLFKmoRg==
X-Google-Smtp-Source: ABdhPJzJwPfOlPnqmI7/5P7ibjxaxjQ3K/49C5Uiz6yY7FpMEBFECdyjYA4Y8meqnBbTveKDbTZgpESx4RovmeoudXg=
X-Received: by 2002:a17:90a:740a:: with SMTP id
 a10mr3865197pjg.32.1603397486718; 
 Thu, 22 Oct 2020 13:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022132342.GB8781@lst.de>
 <8f1fff0c358b4b669d51cc80098dbba1@AcuMS.aculab.com>
 <CAKwvOdnix6YGFhsmT_mY8ORNPTOsN3HwS33Dr0Ykn-pyJ6e-Bw@mail.gmail.com>
 <CAK8P3a3LjG+ZvmQrkb9zpgov8xBkQQWrkHBPgjfYSqBKGrwT4w@mail.gmail.com>
 <CAKwvOdnhONvrHLAuz_BrAuEpnF5mD9p0YPGJs=NZZ0EZNo7dFQ@mail.gmail.com>
 <20201022192458.GV3576660@ZenIV.linux.org.uk>
In-Reply-To: <20201022192458.GV3576660@ZenIV.linux.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Oct 2020 13:11:14 -0700
Message-ID: <CAKwvOdkLHozVUs85Wx-_qo2OfbdkKwtmaJfQFJfvxi_vpEYxWQ@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Al Viro <viro@zeniv.linux.org.uk>
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
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
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

On Thu, Oct 22, 2020 at 12:25 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, Oct 22, 2020 at 12:04:52PM -0700, Nick Desaulniers wrote:
>
> > Passing an `unsigned long` as an `unsigned int` does no such
> > narrowing: https://godbolt.org/z/TvfMxe (same vice-versa, just tail
> > calls, no masking instructions).
> > So if rw_copy_check_uvector() is inlined into import_iovec() (looking
> > at the mainline@1028ae406999), then children calls of
> > `rw_copy_check_uvector()` will be interpreting the `nr_segs` register
> > unmodified, ie. garbage in the upper 32b.
>
> FWIW,
>
> void f(unsinged long v)
> {
>         if (v != 1)
>                 printf("failed\n");
> }
>
> void g(unsigned int v)
> {
>         f(v);
> }
>
> void h(unsigned long v)
> {
>         g(v);
> }
>
> main()
> {
>         h(0x100000001);
> }

A good/analogous example, but things get weird when the leaf node in
the call chain is inline asm: https://godbolt.org/z/s19TY5

(I'm not sure that's precisely what's going on here; I'll need to dive
more into the calls rw_copy_check_uvector() makes to see if there's
inline asm somewhere, pretty sure calls to get_user with `nr_regs`
exist).

>
> must not produce any output on a host with 32bit int and 64bit long, regardless of
> the inlining, having functions live in different compilation units, etc.
>
> Depending upon the calling conventions, compiler might do truncation in caller or
> in a callee, but it must be done _somewhere_.



-- 
Thanks,
~Nick Desaulniers
