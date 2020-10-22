Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A62965C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 22:10:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHJQ12SxwzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 07:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=82.165.159.7; helo=mout-xforward.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout-xforward.kundenserver.de (mout-xforward.kundenserver.de
 [82.165.159.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHJLR3QxhzDqwj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 07:07:26 +1100 (AEDT)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTfgb-1kz10g25ID-00U4JG for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct
 2020 22:07:07 +0200
Received: by mail-qt1-f172.google.com with SMTP id j62so2281734qtd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 13:07:06 -0700 (PDT)
X-Gm-Message-State: AOAM532teITGs9lFdi/4duXZ11WKlkmw+3opCJHsnfNLFXadj7KQomeC
 sSMOyr4W46Sfki7DVLs5iykbUhRUH41GthDYo/E=
X-Google-Smtp-Source: ABdhPJwzGzK/joUQSVeAvrqX5qVjZKbTZlqR4y2OtmQidVm+hBPHFgPJ0w6zcUfZJ+QK7ijfxiYnDR24hCknqBCxhWQ=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr3769485qtv.7.1603397225784;
 Thu, 22 Oct 2020 13:07:05 -0700 (PDT)
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
 <CAKwvOdnhONvrHLAuz_BrAuEpnF5mD9p0YPGJs=NZZ0EZNo7dFQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnhONvrHLAuz_BrAuEpnF5mD9p0YPGJs=NZZ0EZNo7dFQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 22 Oct 2020 22:06:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0xjfj8VPZQ+cweSE7UWtLP5t=a0YJ9m19N4JwftHwfiQ@mail.gmail.com>
Message-ID: <CAK8P3a0xjfj8VPZQ+cweSE7UWtLP5t=a0YJ9m19N4JwftHwfiQ@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4frN1BTHM0u9avIWC6CQ2+ujqsoFkpgXUhcity/JFShG8Oc0tp9
 hB3vOXOuyz5Wfh2YQjsuk16W5ZwUst5WedEHPD4MkRgGDM+w32eR89d8yRVm8+zOZfSJX96
 mVbgfOpFHEL2ZpIcRPRKJZ5yZ73Uffqkb/80Cu8Vzq6A8kimzDJJLd12+Ki6zjgdFu5aFhC
 QQkeqFnsUDoufnvRkZD2g==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:oaAIvt+r6Qk=:dE1HpxQjEH4eD5DIy6KfOWUE
 TnRWD8ZC47P7EYF/CyUaOlf9oVX10yW6ZCBhAwjRPxDGgmJxnbme/5DsYxVWpnMZRtwHC+DWs
 WdRs9FmeqPVkmgERiaWm+8vpKC28NDhcujsToEBdFGMgsyoHfvSdvxgO2PvW/sIdDIgr0ryUB
 hUCNOk41Jl4PYJ/8mwZX7rpm3IfribnGMBpBlfssW0ylWzZdax2v/IoBiaKBgd/wdHGCc5eVH
 uNedE567j/0HHIt92ounaPMo3tY55FQWlxpfpq8vKDbopklUv13bb9X5sh1QKSAXiBKtczE+/
 RgxpwMpa/81vmasu/SprF37kyj9Pkz5SkOb6Np3FLUKnDr9MnalFI9hAqH6Ja80Y0IC3CZbAb
 nTLSeXidmHeotmBGzdcxO7Fi7Bhxtvn44bRyHnvDJv18s3JoRNOS4BVbNt3EleBDVUFGmM13W
 rDuxoPc+Dvt1z5DS3gI5SLkwehlQyWwBzkdFOmpZd0ca7V1D/gZquiAnfO8DwmhqKZQcl/1A=
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

On Thu, Oct 22, 2020 at 9:05 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Oct 22, 2020 at 11:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, Oct 22, 2020 at 7:54 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > > On Thu, Oct 22, 2020 at 9:35 AM David Laight <David.Laight@aculab.com> wrote:
> > > >
> > > > Which makes it a bug in the kernel C syscall wrappers.
> > > > They need to explicitly mask the high bits of 32bit
> > > > arguments on arm64 but not x86-64.
> > >
> > > Why not x86-64? Wouldn't it be *any* LP64 ISA?
> >
> > x86-64 is slightly special because most instructions on a 32-bit
> > argument clear the upper 32 bits, while on most architectures
> > the same instruction would leave the upper bits unchanged.
>
> Oh interesting, depends on the operations too on x86_64 IIUC?

It seems this doesn't impact the calling conventions (see below),
it's just that there are more cases on x86 where the callee doesn't
have to explicitly clear the upper bits because the this is implied.

> > > Attaching a patch that uses the proper width, but I'm pretty sure
> > > there's still a signedness issue .  Greg, would you mind running this
> > > through the wringer?
> >
> > I would not expect this to change anything for the bug that Greg
> > is chasing, unless there is also a bug in clang.
> >
> > In the version before the patch, we get a 64-bit argument from
> > user space, which may consist of the intended value in the lower
> > bits plus garbage in the upper bits. However, vlen only gets
> > passed down  into import_iovec() without any other operations
> > on it, and since import_iovec takes a 32-bit argument, this is
> > where it finally gets narrowed.
>
> Passing an `unsigned long` as an `unsigned int` does no such
> narrowing: https://godbolt.org/z/TvfMxe (same vice-versa, just tail
> calls, no masking instructions).

Sorry I got it wrong, looked up the aarch64 AAPCS now, which
explains

 "Unlike in the 32-bit AAPCS, named integral values must be
  narrowed by the callee rather than the caller."

Also confirmed using https://godbolt.org/z/acPrjj, which
shows more combinations of compilers and architectures
in addition to your example. I had expected arm64 to be
like powerpc64 and arm32 in this case, but it's the reverse.

I also verified that SYSCALL_DEFINEx() is correct on arm64
and saw that as of v4.19 it passes the syscall arguments
through pt_regs, which will do the right thing here regardless
of the argument passing rules. The earlier version also seems
to be working as intended.

         Arnd
