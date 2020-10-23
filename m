Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B307F297063
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 15:26:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHlPQ2zTPzDr1N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 00:26:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHlLG2VxGzDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 00:23:47 +1100 (AEDT)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdNTs-1jwcI72AQS-00ZR1w for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct
 2020 15:23:39 +0200
Received: by mail-qk1-f178.google.com with SMTP id v200so1064761qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 06:23:39 -0700 (PDT)
X-Gm-Message-State: AOAM533E/2i9EYav8Uu/djZ85udSClUFaeyL+Cu34LYuzrVNp2KWRspb
 t190z5F39Ut0UCTEkogCPHvXWBBt+IJm5DINW9Q=
X-Google-Smtp-Source: ABdhPJzAKbPMxF7ooiXQ26gxpuox22F5n7oyxdC4cJCPLnlgXeaaZ1eghu7n5zxyM2KLIiilzybQNUwLI7s3oU0Z+YY=
X-Received: by 2002:a05:620a:74f:: with SMTP id
 i15mr2224392qki.352.1603459418392; 
 Fri, 23 Oct 2020 06:23:38 -0700 (PDT)
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
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
In-Reply-To: <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Oct 2020 15:23:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1n+b8hOMhNQSDzgic03dyXbmpccfTJ3C1bGKvzsgMXbg@mail.gmail.com>
Message-ID: <CAK8P3a1n+b8hOMhNQSDzgic03dyXbmpccfTJ3C1bGKvzsgMXbg@mail.gmail.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AEzEO3Y8EmDQSJ4CYAcGoHp9foe8FX2aMuiqaoarKgfspwkpUh1
 /sNrtGAh2TVbBibYiotsOibOwfupJdNK0Z3nIFPDdOlrueMOGoHpXnlwswJb6BNJrVFIVjw
 WZZEoxeugSekd+js6XCXKAftGQerpKmv2aEdRt120mHECRCF/QxrvdXBFPHOWind1zMkyin
 t5zD81LOB8I2AaxYSWn2Q==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:3sL3PCNfUpw=:Zn6hJv2gayqYsZbQGWwt//ar
 W9WZO4PhzlnvHpL9Vyx78rGaYa6H6tL1lh0xHckRBmWk9GYUIo8j/dbvEUxZ4grWAJ2wtpWhR
 +Ew4KJvxbNtZjoejeA8Hadq2BWAV68ilnocgt+GKAEGYGaWdo1KUEUXinyrsU3PjnwKZ6ZCSJ
 4+x2mP9gGICOpFMm1fjwElA4vHcoMMUm8TEkGfGNx/dH4l8eNMbbP4oVUOQwfKjHIf1ddyO6B
 98Mo7hoSjHVBpa1wpF0KkUHEmwYE5t7NqTlpETGsnCCzPKKiQaollDUohKFsy5A7sRgGkGoW2
 cG+RJ9G5js+e/dJd9ztpxliY7Q9T3d+x0Kmj3cypR/OM1Y1h5ppfqBitbEiv43fRduWfzCIAt
 y1P73X1OSjlY1XrtjOCJlD3U3M7Ofu7ZIkgvTN32d+cII9N593SLMBYOnwa77bJ16rp/OR8qT
 nig3ydNlqHT8E8LfgGfJ6lxuOJ86tg7qitq2TBi+F4afB2iV+/D6Ic+Qvq7KFvU7hHQtc+Sg=
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
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 23, 2020 at 2:46 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: 22 October 2020 14:51
>
> I've rammed the code into godbolt.
>
> https://godbolt.org/z/9v5PPW
>
> Definitely a clang bug.
>
> Search for [wx]24 in the clang output.
> nr_segs comes in as w2 and the initial bound checks are done on w2.
> w24 is loaded from w2 - I don't believe this changes the high bits.

You believe wrong, "mov w24, w2" is a zero-extending operation.

       Arnd
