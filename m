Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5751A9625
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 10:22:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492FhP1lCKzDr2r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492FfV1gskzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 18:20:33 +1000 (AEST)
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIdW9-1jSGKG070P-00EdWd for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr
 2020 10:20:29 +0200
Received: by mail-qk1-f171.google.com with SMTP id o19so9000574qkk.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:20:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuY5QlXFIk4GtKBieGmkiCmxWADjRxcAX24p4bmL8R/he+nxLPo4
 t3J941xxEedNe70CUbkeXzVJ1qSqV9gfnbMkeTQ=
X-Google-Smtp-Source: APiQypKnMsiJ4Mmnsi8g+LtUb5Ci9aCZXZzn/1+vXXpOtQsnTWTgyLcCxEZm3G16DazfzLPj6j4dyGUhDCYzK7WylCI=
X-Received: by 2002:a37:9d08:: with SMTP id g8mr17919769qke.138.1586938827309; 
 Wed, 15 Apr 2020 01:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-5-hch@lst.de>
 <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
 <20200415074514.GA1393@lst.de>
In-Reply-To: <20200415074514.GA1393@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Apr 2020 10:20:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
Message-ID: <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
Subject: Re: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:82XjoGH4DlvhA/1K4HyR1zT8UCB/cUDg1LZcWPy938n1yaztqNQ
 NQOWx/246isPAsP4AVtjoZMT+2FNi+Htuqi1TKud5QWGHUE63Rfnm6Pqat+7D1BKLS+KC+O
 GXglyHeo1yIW5liZllJsk24xjzR88H/sOqGoqIYdL51ZFpGiEUZqIhWtR6DWLlBrTTS5hBP
 fJGmY7hRXM6oHm6Ku29xA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6GGA36HVhTM=:dCfd1TVCe2R7vFaRpIy/6+
 mM6CVG2jYyuSNIo0eHN/Zx9GXqO+bmy7inyy1Nl/2wuM4PKwPvpidDw5ZoxiXFvkfsvsQdVsU
 A23mK5NIwYTmuU/+XjUic/BDFmVXFawaRMk8JGGh0KY2jP2nSkdUwB8hS1MKmLoYcB58+dUjF
 gLlF9PAoXUmigFJSw+vMo9hQ1ydUY0VXZjB0A/P0tC5KvFW5b3foBKN4O1zyDKIE5s5siQd4h
 a6/8Br+NA0/YLs3clPVa2mGvqRT2pMqPXcFWNvfAa5EcGrfMLDZnDyW6KdUqo+PRLvTMLYZFc
 AX8GdyRjVuW32w97pM6nBCehO7xSaKAqOuuYl+nwyuqdCqxCWKAZZfWQiXc9kNhXdy2kDrPdA
 ZBCi4gf1sU6h7nSkz6PWPISgV34mpFIrN1tyIb2UBbE8mnmdt4QJYIeavTDF42yS0Q4w487Hi
 E2C4jgNE7/dod9vxpW2eOh3Bqf6F4bE4tp1r+4TALlRxoPJnd2Ag3xbloCwE/ISWBmJfkODRj
 t+pgqDNdYtJtNkiMg/CT6amD6zMIb5es7kU0jiFbFKp+kpWgHpC3pre/WksLxCO6AD+jppDhX
 PpGGWuL2rAwH4EM8jKNE9bwXaX/RsD/Yz+hIYmbiBcmgfraAYPSd5K5eTYVQmpFVGhV7qnXJH
 q7XV2TOcz2rujuFrvYvMejGn+/wsGQk+g3Fn7zqgA0dhdYbY+ie62vWoCm/txbNQiCRdsb23j
 ULKjAE7TaGLM6nZCe4zt214qy2HGEbUaxkCmDHQJDEbbEQNfIX5qUvaIJUUGv9xgjsHYYVowP
 +vpPBLHsUOxC+H40o/cgDhu31HLosPGcEu8n4IyUF/RyiiMAKo=
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
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 9:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Apr 14, 2020 at 03:15:09PM +0200, Arnd Bergmann wrote:
> > I don't think you are changing the behavior here, but I still wonder if it
> > is in fact correct for x32: is in_x32_syscall() true here when dumping an
> > x32 compat elf process, or should this rather be set according to which
> > binfmt_elf copy is being used?
>
> The infrastructure could enable that, although it would require more
> arch hooks I think.

I was more interested in whether you can tell if it's currently broken
or not. If my feeling is right that the current code does the wrong thing
here, it would be good to at least put a FIXME comment in there.

> I'd rather keep it out of this series and to
> an interested party.  Then again x32 doesn't seem to have a whole lot
> of interested parties..

Fine with me. It's on my mental list of things that we want to kill off
eventually as soon as the remaining users stop replying to questions
about it.

In fact I should really turn that into a properly maintained list in
Documentation/... that contains any options that someone has
asked about removing in the past, along with the reasons for keeping
it around and a time at which we should ask about it again.

      Arnd
