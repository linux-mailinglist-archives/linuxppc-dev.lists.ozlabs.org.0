Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2727109F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 23:19:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv3VC07DRzDqx9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 07:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv3RS5rlxzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 07:16:34 +1000 (AEST)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N4vFE-1kRTUe2Ami-010tPA for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep
 2020 23:16:28 +0200
Received: by mail-qk1-f173.google.com with SMTP id q63so10735542qkf.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 14:16:27 -0700 (PDT)
X-Gm-Message-State: AOAM533DijiVL1HXG0cKrf5nYEc+f1/D/h3GR/F7uH/gwUg2y8rSMIAf
 ExJiPJi8tNj0t8bG21yL6T5H5ordba85lNwDHEg=
X-Google-Smtp-Source: ABdhPJzEvevcaGdjT3rDawI+GUfFFyk1d/TYHLiGAQUL5WydIguceSQ8UIqVNU/fh2JOVxE549L743HO0rSqi5ww2Ew=
X-Received: by 2002:a37:5d8:: with SMTP id 207mr40303905qkf.352.1600550186478; 
 Sat, 19 Sep 2020 14:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200918134012.GY3421308@ZenIV.linux.org.uk> <20200918134406.GA17064@lst.de>
 <20200918135822.GZ3421308@ZenIV.linux.org.uk> <20200918151615.GA23432@lst.de>
 <CALCETrW=BzodXeTAjSvpCoUQoL+MKaKPEeSTRWnB=-C9jMotbQ@mail.gmail.com>
In-Reply-To: <CALCETrW=BzodXeTAjSvpCoUQoL+MKaKPEeSTRWnB=-C9jMotbQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 19 Sep 2020 23:16:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
Message-ID: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7YNZh6jw9o2bUNQ+IEwXe8Ck0nW5PhK6LbkP1DBDaZ563yVX7up
 UsiOdnlhI/hVlUCF6Y1ksDv/kI8XXBRnRTjISSbtcP7U7gmTBEVY1Yjb9rGa0d8SWmNJcb/
 zqX1QckNxNF/fZAxgkTGpUbHdgNzlOctpMWzep7zk1HAvQp3iOACmj7anObyxxdWgsZyTaw
 3Asvr7DcZnOwtRzMRR6SA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pYMFcwvvxCE=:QMarAMKzsILIermZEbBc2f
 yOhQ3FUixMs5pF0Dhkq2uUGKq4l+mwaGqRc0nftN7TesF2bBnI12C+CCz2IpcVp2220b8zfMe
 4+t5XknVg6ie2u6/f9YBR9EJp3/2ScPVCIa3/VbMiOogkHZlQbobuBaHXKM7zKNur6SNG5zGN
 bcH4ss38xFxTR+ljqqdcwyLS0Zflbn8wqA5RA+wwAUnHEUUUGoOYTpYOGMqQIrUwnLK3YiMsf
 rWKdYgjSv7G+1dsQ5YHPyoj/IoCUMlI3b4Px84TSzFxhCfMtGLe/vfoU2v5F+L+fzqQ+O0l54
 aWmydZTvceTeIDyiTqisEK3DHolEMhz9yUfaD12NPrmHax8EqDjmzTciQqCkD1DD5VreZoS4R
 cmnRCtQge0mAVmnE/w17CCYlFPtf5awEyS/U/JyY+dkT0dD4+ymsnxp59bKSnS+Cc23V7ExeY
 K9OGwJZjxaJ2eD5ISqmCz4x6HX9KLhdtWm/PpvNw4bJM4+ouZ2rTNiIXP5WAD7cbA/BXxJJbT
 tuiAGRisRYR5NzRCVFFu1zrpBQtXdoZRSf7kOzcKH7f3OnrOeWyxiyT9jflNlXwr/Y0ImCcrf
 B2AL+ZzmJ/o1haovE9rlAyg64+ZHmH8c54Vkj7VxHt8BUxFrsnBv2sNCR23VKzMX2MzAaXSCR
 VXCKAxNAbz0mgpHZjwNff5QW+n3nPwOSlWiqfZqggu6O6DuX0bTMbx4xctHqW4f5G1MT3zAH4
 xsVXaAj1kkPkZUmmaEGXKMQ0PE5xbSSPko2Fq4R0CKYzgAfNSgfc/N2fUSgmlHNY9JTRIZOSk
 3kDkJu9FY17DHLPtO5f9xtS1z5+v+p7iNL8RGWSyUwVNax37/hQWLk1mhQmqwJbSUayLDVZ
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 6:21 PM Andy Lutomirski <luto@kernel.org> wrote:
> On Fri, Sep 18, 2020 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
> > On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
> > > Said that, why not provide a variant that would take an explicit
> > > "is it compat" argument and use it there?  And have the normal
> > > one pass in_compat_syscall() to that...
> >
> > That would help to not introduce a regression with this series yes.
> > But it wouldn't fix existing bugs when io_uring is used to access
> > read or write methods that use in_compat_syscall().  One example that
> > I recently ran into is drivers/scsi/sg.c.

Ah, so reading /dev/input/event* would suffer from the same issue,
and that one would in fact be broken by your patch in the hypothetical
case that someone tried to use io_uring to read /dev/input/event on x32...

For reference, I checked the socket timestamp handling that has a
number of corner cases with time32/time64 formats in compat mode,
but none of those appear to be affected by the problem.

> Aside from the potentially nasty use of per-task variables, one thing
> I don't like about PF_FORCE_COMPAT is that it's one-way.  If we're
> going to have a generic mechanism for this, shouldn't we allow a full
> override of the syscall arch instead of just allowing forcing compat
> so that a compat syscall can do a non-compat operation?

The only reason it's needed here is that the caller is in a kernel
thread rather than a system call. Are there any possible scenarios
where one would actually need the opposite?

       Arnd
