Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1EF29647D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 20:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHFrK0B6rzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 05:14:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=82.165.159.8; helo=mout-xforward.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout-xforward.kundenserver.de (mout-xforward.kundenserver.de
 [82.165.159.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHFpl2bqKzDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 05:13:16 +1100 (AEDT)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlwBf-1k5Qnv1Nkh-00j5lF for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct
 2020 20:13:08 +0200
Received: by mail-qk1-f181.google.com with SMTP id b69so2548233qkg.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 11:13:07 -0700 (PDT)
X-Gm-Message-State: AOAM530LFv8t9MMZcL+vhYowPZYw3TKcTIaGjqmTfb4ZHAuN35brZSh4
 i6rkitYq+fwQ7Fp6qySJj7GstUQIBV4JwfT7rik=
X-Google-Smtp-Source: ABdhPJzQkCdsAEzOH97JlGBle9/SdVwDzxpXvJqxWrt3Kp+S5wDOXz+F9Pi6NLPQk2A3sIN6d0NiTlYy33fWAPxqKDk=
X-Received: by 2002:a05:620a:215d:: with SMTP id
 m29mr2210077qkm.138.1603390386870; 
 Thu, 22 Oct 2020 11:13:06 -0700 (PDT)
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
In-Reply-To: <CAKwvOdnix6YGFhsmT_mY8ORNPTOsN3HwS33Dr0Ykn-pyJ6e-Bw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 22 Oct 2020 20:12:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3LjG+ZvmQrkb9zpgov8xBkQQWrkHBPgjfYSqBKGrwT4w@mail.gmail.com>
Message-ID: <CAK8P3a3LjG+ZvmQrkb9zpgov8xBkQQWrkHBPgjfYSqBKGrwT4w@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7ZxWSY7OkmAgWFHg0Rd2cL+FNoXmGxBbFdXIs5jxyWHTs9lNcOl
 6M7PONZAeRYoKh9XkSdK9GsHWjfpfqZWR8l/DrtmGAnnPd+PA7uLiBSZOJStH9vJomFRTfH
 +b4tbGCqGAuTA1/kSAN5YEQw4IQbCtbYjpCWDs/MrAu8N6fw3kauWO5F3ruHrZxlf9MxrmL
 pxCK/3tPpTExGFV9LaScw==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:xMhVyNkwr7M=:cta2qAZV7aZ9lAON5JQ8qXFr
 ZQzuQBHl143dmjLMLa/o3FfcIxu0kFypU4OYcgwI6e6jDhPxr+viwrL/hZV2c3Mf87X9r6IlA
 iAc4fAPEds5s83uug/cXJ0yjXrJq5QzWHvNWkr9rpgEh3ngg5pUkIYjq4HNPysQc9D7VB5mfk
 2z6TGHlRyMPv+/E3HW50M/+6+5I6VJn569PAj1i+RLykYjoqixJ9WLQe2TUNKdShydI9s7Rkg
 bm1eIlyvbvWUc1oUb5jbqUbKfrmvfdu2NY+p4/Xnm/cMR7KADyAAcSmdkSPbhf38A0dTJI1V5
 uulgw/WPubohmMKx9i8Yh1R9KWCIxvtRtGLlNUx5QkhUniH8GIdOQu/9zJ9l3is0EapNkHsby
 KhtiSE+ZPNrJBPk0ImF1SnfklLdm2FQWAMv8TAXevKtLtvJHy5KIaOB34hnZVu+nOYk3mt64r
 Jv+Ao0Eu6QXpcY1RbG4wMf75tSCRUKHxoQTARC7k1pRBJ1aMudN48UnOT3jIYTQOxhu9Vso6i
 qcJcnB79Vr44GgMa9UtqqZ/XxKYvyhSpj86KZ1B2Y3zLybVt7rIhgUArWkkL7bg9tVbS5P6aS
 dB9nxxTqSMHEiX7Lu5lJKTY5lpUWclc3FucRUrkvgsp6cMfEvtoeXQ==
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

On Thu, Oct 22, 2020 at 7:54 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Thu, Oct 22, 2020 at 9:35 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > Which makes it a bug in the kernel C syscall wrappers.
> > They need to explicitly mask the high bits of 32bit
> > arguments on arm64 but not x86-64.
>
> Why not x86-64? Wouldn't it be *any* LP64 ISA?

x86-64 is slightly special because most instructions on a 32-bit
argument clear the upper 32 bits, while on most architectures
the same instruction would leave the upper bits unchanged.

> Attaching a patch that uses the proper width, but I'm pretty sure
> there's still a signedness issue .  Greg, would you mind running this
> through the wringer?

I would not expect this to change anything for the bug that Greg
is chasing, unless there is also a bug in clang.

In the version before the patch, we get a 64-bit argument from
user space, which may consist of the intended value in the lower
bits plus garbage in the upper bits. However, vlen only gets
passed down  into import_iovec() without any other operations
on it, and ince import_iovec takes a 32-bit argument, this is
where it finally gets narrowed.

After your patch, the SYSCALL_DEFINE3() does the narrowing
conversion with the same clearing of the upper bits.

If there is a problem somewhere leading up to import_iovec(),
it would have to in some code that expects to get a 32-bit
register argument but gets called with a register that has
garbage in the upper bits /without/ going through a correct
sanitizing function like SYSCALL_DEFINE3().

      Arnd
