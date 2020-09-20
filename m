Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D72714BB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 15:58:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvTgl14TszDql5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 23:58:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvTcs53FfzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 23:56:11 +1000 (AEST)
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MowSu-1kpU4p1WPu-00qSZq for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep
 2020 15:56:05 +0200
Received: by mail-qk1-f180.google.com with SMTP id t138so12244496qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 06:56:04 -0700 (PDT)
X-Gm-Message-State: AOAM531z/g0BdFRixk857SC5GUSfVu3gfTa/LNQQ6XRKm4ObRbZlpcKh
 W4op0E3Py7VawVZReJ/+V1ijXDMZstPMUrM59tc=
X-Google-Smtp-Source: ABdhPJwjhkL3KLtOGKzNMPo/as4noBlQ9Jb8z4PXaKINeNIOOA3tWOtTq+bHeowiwT9kTTVa6K2ILOsBaWuTHLMSx30=
X-Received: by 2002:a37:a495:: with SMTP id
 n143mr41151530qke.394.1600610163343; 
 Sun, 20 Sep 2020 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200918134012.GY3421308@ZenIV.linux.org.uk> <20200918134406.GA17064@lst.de>
 <20200918135822.GZ3421308@ZenIV.linux.org.uk> <20200918151615.GA23432@lst.de>
 <20200919220920.GI3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200919220920.GI3421308@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Sep 2020 15:55:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3QApj3isPu3TkLahArsfb5jaABb7DJ7EKMxey1T1YPbA@mail.gmail.com>
Message-ID: <CAK8P3a3QApj3isPu3TkLahArsfb5jaABb7DJ7EKMxey1T1YPbA@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hIwIr1JJ6yOCSp8oOy/p434f8n0zpo6W7GSzBYIjHMmV+utLHRU
 GSWoOhl0c7+gIy926b80cYup9N3TuBf3K7vxRLkvSShR9417FdtgPMacytszznFVFx7muTl
 6GMcpRmPY3AFz74ktblKT+bqaAlrOIaHOxPGbtBGFtHvZQ5h7uG5Vqw4hDyWRAFWQ2R90Mo
 CisApVasOxCjvhfejmwpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lZGCWuaVZWI=:vMPkfL03HsFwxo02CyFkmj
 37lmyQKOKCeBlcu3R7JuszPEtUkFmVFyNkzByhfKe7dfi814Kkdrscv0m+qv9Hd24bebg5fsJ
 MpuboD0PXZAVFH54JfPBebRVvqnSvFd4dwJm3LH4i2sCBwzFla80EUFeYYaVvZxXqBlDOl/Wo
 ZNs00civUd4+4n2jYt7ks81nyp2nbzcmRSirhD6kiZGVpNVvW7qw7e9m2SuL9NPFKwWf7EkOn
 L16fS1F4NPiSuEe8XsYZM7jpxpMX/p14cuwCUeXjk8bdm9P64PtOR51LKCipqFyfPOTJVhNXP
 JmRS14iQCZQokI9YDT1etwT4v9bJwbEK4WOtQyexo4niOeQM8n4JxyPmnoP0f27L1povMksNy
 YaFgDj8xlN2zeSk7H9IF5YpnyitSl5aYAS0JKOa6u5AL51I7aLFNZfmvnu0sUKPQzr8BkLNtj
 PXqR6RMN/NlNnY7vObFQ5bswWAlFirbLLnnv/1WRIVWhkmhV04h2kdZvLm3KZWeasGmDTXTmz
 e9EDnmCmXY6vEapUIMg5pFQAkEoWJOuZf+JZqvP+vZmk0wgolCacFFf0dszoHEJleASl568PR
 N92V+QWKdKmhLdldyzjBFUfxcH3gzULgaBiWsozcJCdx9kWGbQEJKGHOHYhaIG0AY8lEpqEor
 x3iUzhezRZhkzZSmiEZjFHfni8JezhyiWAnotM7WL+K+Agjytnr62umFZQ4AE2b7Sy5MNhHF9
 MOed39IXe4+z9n7h/Cr71DgWIYVMNcSwLc6ZXtmBlRj16ckH1aRx8ZoDRQ+h0KTvhs1X92+XU
 SNwegUbNyF+N6NNIO311Rdq30BK3M8uliSUrogcfo8N5Ylw3EI3Z/QFkNpHFWtX600G/wO5
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
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 12:09 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Sep 18, 2020 at 05:16:15PM +0200, Christoph Hellwig wrote:
> > On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
> > > Said that, why not provide a variant that would take an explicit
> > > "is it compat" argument and use it there?  And have the normal
> > > one pass in_compat_syscall() to that...
> >
> > That would help to not introduce a regression with this series yes.
> > But it wouldn't fix existing bugs when io_uring is used to access
> > read or write methods that use in_compat_syscall().  One example that
> > I recently ran into is drivers/scsi/sg.c.
>
> So screw such read/write methods - don't use them with io_uring.
> That, BTW, is one of the reasons I'm sceptical about burying the
> decisions deep into the callchain - we don't _want_ different
> data layouts on read/write depending upon the 32bit vs. 64bit
> caller, let alone the pointer-chasing garbage that is /dev/sg.

Would it be too late to limit what kind of file descriptors we allow
io_uring to read/write on?

If io_uring can get changed to return -EINVAL on trying to
read/write something other than S_IFREG file descriptors,
that particular problem space gets a lot simpler, but this
is of course only possible if nobody actually relies on it yet.

      Arnd
