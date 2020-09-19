Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB6270F7B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:23:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btwxj3SgbzDqwV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 02:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=QrIUAAqT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtwvY2J6PzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 02:22:01 +1000 (AEST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EC36208C7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600532517;
 bh=tnnKVle7uGlb4ye6ETfPhESD0icbWeK+NnxFIW79sro=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QrIUAAqT1dp8+jrXrF0kfdV5PIOJITY8xSkYh8pnrNFPmM98EPjnnqgiUheWM3Zz4
 0qTg36uFIa2gFwlgsZXnXxJdaWIK0Dls7hdq0zd60qlpvRgxcHCvRNqCi9kc1myB6l
 slKQU2ILvCXePIOP8ZGSdUV9ciTDnkbyjJ8h5bj0=
Received: by mail-wr1-f51.google.com with SMTP id t10so8576434wrv.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 09:21:57 -0700 (PDT)
X-Gm-Message-State: AOAM530MSJpJs604Lcu8bezqDs3gLNcylPriTsFemTRsZ5knhX/+JG3l
 dT+xA7lJZKY4orpt7+XYnjGi3Axepagr3LIg/c9gxA==
X-Google-Smtp-Source: ABdhPJwBFQKjUG5Ajrf8DpZFR91CZN4BHC9/gKbhMJfUTwAnV0GCUbZx28T5SkvcVSnD9FMlBdmx1p4waD7HgdNSIPM=
X-Received: by 2002:a5d:5281:: with SMTP id c1mr43283094wrv.184.1600532515963; 
 Sat, 19 Sep 2020 09:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200918134012.GY3421308@ZenIV.linux.org.uk> <20200918134406.GA17064@lst.de>
 <20200918135822.GZ3421308@ZenIV.linux.org.uk> <20200918151615.GA23432@lst.de>
In-Reply-To: <20200918151615.GA23432@lst.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 19 Sep 2020 09:21:44 -0700
X-Gmail-Original-Message-ID: <CALCETrW=BzodXeTAjSvpCoUQoL+MKaKPEeSTRWnB=-C9jMotbQ@mail.gmail.com>
Message-ID: <CALCETrW=BzodXeTAjSvpCoUQoL+MKaKPEeSTRWnB=-C9jMotbQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-aio@kvack.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-block <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
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

On Fri, Sep 18, 2020 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
> > Said that, why not provide a variant that would take an explicit
> > "is it compat" argument and use it there?  And have the normal
> > one pass in_compat_syscall() to that...
>
> That would help to not introduce a regression with this series yes.
> But it wouldn't fix existing bugs when io_uring is used to access
> read or write methods that use in_compat_syscall().  One example that
> I recently ran into is drivers/scsi/sg.c.

Aside from the potentially nasty use of per-task variables, one thing
I don't like about PF_FORCE_COMPAT is that it's one-way.  If we're
going to have a generic mechanism for this, shouldn't we allow a full
override of the syscall arch instead of just allowing forcing compat
so that a compat syscall can do a non-compat operation?
