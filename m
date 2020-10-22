Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CFB29634A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 19:02:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHDFJ2RZQzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 04:02:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FaZk1syk; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHDCN0b6bzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 04:00:59 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id n16so1269512pgv.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPq1xxojTLCMg9dkpihVuEy7NB86hVAVpi/132X7kAw=;
 b=FaZk1syk0YMG3iZb8SLWxC2V/X6x12JUTFYfL5Y4vorI7cxebKk0A4wGmpbUSoSX7r
 Hs46zZ8QPE3GLHjpbq58EcQYAjpUsLiFd7rIWVJJucFcvXO83HQmjrAvVcsSpWuzKmDn
 Ir7y+Hx076Ra7VE3qkMs0wIP4MuvMyPqFMZD7ErBK/erglmryprKfIJjlK9s4TEK+eV0
 zi9+rcSPkS3oUdnHJUbiyp5gMYyTX6WkcGQdAuWCh4z6o6XxBzLh/IQ3EqBPjn/4zA8/
 /ycOC8rWbYoFZIzXS+kSVT0mB240mCkdd7OfRPndvUPHV4Kpd/AlMGehp4EnqX4ufYBk
 bELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPq1xxojTLCMg9dkpihVuEy7NB86hVAVpi/132X7kAw=;
 b=DhJ23XjiQqqs1VFAqLET82zu7WKlygmfuA78b9m/Z1vKOYrzC34X+3Q6e26SIxzmqm
 nAnjnht98IIrTAv2qt5nyp+lGpDi96fodo8Ka2IJaBp/D9A/C2Ho9bbYNcZbCkb5428t
 mXrxftKfDlS05rMRmFLHKU/u+Hf3tS9+2Uk7fsMNZrKALSZ7wAHLvekd3XhJRUJw0gDR
 nPZizG1+yGBXvybcNWsbmuQuXCnQlPf75XbDgBXelExNl/AvoEwn8G0H5hIiMhXezZ0B
 E2b0GCn7C64iCcAiYHTT/EOwKFCJpv312eFhbCoVrjZXZFXgb0FnW0IKJXpLxOCrtTeZ
 UVYA==
X-Gm-Message-State: AOAM530dUstySHF0uqpuAcyHUcLGIafu2Sv5eoyh0bzoeKFLWdn4CsZK
 3UgjDl/+oO4PEa2BOjEEmadC1jejDr9ZdllJ81GfmQ==
X-Google-Smtp-Source: ABdhPJzMoyVci79YwTV4KRMhMNBvKksmGgmX62puAUjhkzpwpVCVuG2Q30QHXgEacyFzXNHAtggJkv+M7hW6xpUief0=
X-Received: by 2002:a62:6408:0:b029:154:dde2:a5eb with SMTP id
 y8-20020a6264080000b0290154dde2a5ebmr3767384pfb.30.1603386055586; Thu, 22 Oct
 2020 10:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <80a2e5fa-718a-8433-1ab0-dd5b3e3b5416@redhat.com>
 <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
 <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022132342.GB8781@lst.de>
 <8f1fff0c358b4b669d51cc80098dbba1@AcuMS.aculab.com>
 <20201022164040.GV20115@casper.infradead.org>
In-Reply-To: <20201022164040.GV20115@casper.infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Oct 2020 10:00:44 -0700
Message-ID: <CAKwvOdnq-yYLcF_coo=jMV-RH-SkuNp_kMB+KCBF5cz3PwiB8g@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Matthew Wilcox <willy@infradead.org>
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

On Thu, Oct 22, 2020 at 9:40 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Oct 22, 2020 at 04:35:17PM +0000, David Laight wrote:
> > Wait...
> > readv(2) defines:
> >       ssize_t readv(int fd, const struct iovec *iov, int iovcnt);
>
> It doesn't really matter what the manpage says.  What does the AOSP
> libc header say?

Same: https://android.googlesource.com/platform/bionic/+/refs/heads/master/libc/include/sys/uio.h#38

Theoretically someone could bypass libc to make a system call, right?

>
> > But the syscall is defined as:
> >
> > SYSCALL_DEFINE3(readv, unsigned long, fd, const struct iovec __user *, vec,
> >                 unsigned long, vlen)
> > {
> >         return do_readv(fd, vec, vlen, 0);
> > }
>


-- 
Thanks,
~Nick Desaulniers
