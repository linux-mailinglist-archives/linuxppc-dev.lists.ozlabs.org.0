Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C44732960F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 16:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH8t36Q7XzDqpL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 01:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=82.165.159.6; helo=mout-xforward.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout-xforward.kundenserver.de (mout-xforward.kundenserver.de
 [82.165.159.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH8qg333fzDqn5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 01:28:45 +1100 (AEDT)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYcy3-1krxgr31AR-00VhFo for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct
 2020 16:28:38 +0200
Received: by mail-qt1-f180.google.com with SMTP id h12so1161599qtu.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 07:28:37 -0700 (PDT)
X-Gm-Message-State: AOAM530iQ1D5tj1xQUHXmo34wxTI5klBi6F0HyGKue4nmlphEEDErl81
 O3TwkK0rRQD0cxb8FOICCUSvUPeoig6XuFYr41Q=
X-Google-Smtp-Source: ABdhPJy77s7KKjlWYs+GpQ9BVZMwbpfFajbVvneugmSCOs60Axm7zukaXFA8sOvFMoh0YrQxNjUHh2dxLvicpR0yxI8=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr2234550qtv.7.1603376916673;
 Thu, 22 Oct 2020 07:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com>
 <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com> <20201022135036.GA1787470@kroah.com>
In-Reply-To: <20201022135036.GA1787470@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 22 Oct 2020 16:28:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1B7OVdyzW0-97JwzZiwp0D0fnSfyete16QTvPp_1m07A@mail.gmail.com>
Message-ID: <CAK8P3a1B7OVdyzW0-97JwzZiwp0D0fnSfyete16QTvPp_1m07A@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:563Oe+HDI9Flae2NXjN+oZ9qVkvDrQBWUUhzR9O4j3w17QBSSz1
 1ROLh8OVssdksqzhwpW7RpaEYvyclM0Gd//bTgHO4zdilpUyO3QA3VpM7n0fOAuvBaB0ghN
 lATFJJxMAM/nRMhmUhpcUKXrdShJaMWdHchPpfk+Bx0Xp+VfEG8mpUZZ0YEed7MUNr29ztn
 rDdWAs8AVhF66QoWPI87g==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:NwBIcXc/D3I=:rL4MZXiWi7GfTSdyg7P3RD8n
 0Nxk6pKhmvV6mMKLKRf1VuE/PF1xI7EJUX899hxDhilponPSEN+VDMxH23AgU/cAO7V4zcUZt
 KRyTjVSNubgoRJQgXZEXIGk/U/QF7L14kL9L6yoablAmKfh7JfqLGkcBVTOu6KGmr+Vggoa/9
 vRNL/enSJpH8ulb5iPWN4BrQhtcfWNtCw1Cdz7A7xMWJlNAcBc3GaqDLH8hmFQHbb0+zZkcnv
 oi2OO4BWBeaaUt+bzhJWE+Q/9hCqrYGJrRCxXZXDwPmhUAwbuRN5v/T73N83EvrAtPYQwNPP7
 +5NqXqqBOdOQhhfXM7X+sfPqYSqnOqS3RjlVEjHCvwT8+xiuy1e14SV0Y3e8xskwpFZm4EBEp
 zhg6SH5ztb7ibH3O5pNb9NZSZiYo6oVOTjJNL8Y/DKW6biZBlXX8+j9EgaoqtA3EuKKHrUCDY
 BSYBbHdFOLJ8IU6N4dkcxqq55S5kie1OeKp+BO5F8fF+SjnXHPo7l/s8hHaFjEWD1jaZvD6Q=
 =
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
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 3:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Oct 22, 2020 at 02:57:59PM +0200, Greg KH wrote:
> > On Thu, Oct 22, 2020 at 02:42:24PM +0200, David Hildenbrand wrote:

> > >  struct iovec *iovec_from_user(const struct iovec __user *uvec,
> > > -               unsigned long nr_segs, unsigned long fast_segs,
> > > +               unsigned nr_segs, unsigned fast_segs,
> > >                 struct iovec *fast_iov, bool compat)
> > >  {
> > >         struct iovec *iov = fast_iov;
> > > @@ -1738,7 +1738,7 @@ ssize_t __import_iovec(int type, const struct
> > > iovec __user *uvec,
> > >                  struct iov_iter *i, bool compat)
> > >  {
> > >         ssize_t total_len = 0;
> > > -       unsigned long seg;
> > > +       unsigned seg;
> > >         struct iovec *iov;
> > >
> > >         iov = iovec_from_user(uvec, nr_segs, fast_segs, *iovp, compat);
> > >
> >
> > Ah, I tested the other way around, making everything "unsigned long"
> > instead.  Will go try this too, as other tests are still running...
>
> Ok, no, this didn't work either.
>
> Nick, I think I need some compiler help here.  Any ideas?

I don't think the patch above would reliably clear the upper bits if they
contain garbage.

If the integer extension is the problem, the way I'd try it is to make the
function take an 'unsigned long' and then explictly mask the upper
bits with

     seg = lower_32_bits(seg);

Can you attach the iov_iter.s files from the broken build, plus the
one with 'noinline' for comparison? Maybe something can be seen
in there.

       Arnd
