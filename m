Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5F276065
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 20:47:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxRxy2ZTZzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 04:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 121458 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Sep 2020 04:46:17 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxRw93Rq8zDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 04:46:15 +1000 (AEST)
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N1xdf-1kRSBP0TtZ-012Cwc for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep
 2020 20:46:10 +0200
Received: by mail-qt1-f178.google.com with SMTP id 19so826165qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 11:46:08 -0700 (PDT)
X-Gm-Message-State: AOAM533/+dLYQRhPdzbpOA1gDkD76ogt3CZdVQoh8Vv5L9VqWD4bbvaI
 PpFJ6x4wV7wyiHEqHmZgDen/HNMCef3N619Xl5I=
X-Google-Smtp-Source: ABdhPJwsvaOBWtaZA0D/OVEHB/gCWu247kr3QZZFrdP10NBc4wqx9Hcp+T5ZYDolhQMYUd20W7JjEkRUKsdbgp0ivyQ=
X-Received: by 2002:ac8:64a:: with SMTP id e10mr1527617qth.142.1600886767946; 
 Wed, 23 Sep 2020 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk> <20200923143251.GA14062@lst.de>
 <20200923145901.GN3421308@ZenIV.linux.org.uk>
 <20200923163831.GO3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200923163831.GO3421308@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Sep 2020 20:45:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nkLUOkR+jwz2_2LcYTUTqdVf8JOtZqKWbtEDotNhFZA@mail.gmail.com>
Message-ID: <CAK8P3a3nkLUOkR+jwz2_2LcYTUTqdVf8JOtZqKWbtEDotNhFZA@mail.gmail.com>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xh0linslMPKiIKRuIaKjDJUt6Gm3SobvWFfqLQfb5f6ex5/fnKw
 E1m+6Mvmlrr8BC3Sf+lmzTo61eSFvv0CK45LHYSB3fTzxm21+MGZZMcMljvmBwRegDVzlpB
 D4la0zaezTtHN44hgF1x5RUuD3IkFyFsnO1R+1HZxy+RpiU0q0fxNxIKlCMAe0oKukg9sMG
 qgWPDO9/6hKWIXCk7IxoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gCeoXWWCXmw=:2U3WQbHBie0/QbWFJBfzMd
 5joEh4+syZZBAodwRN4qz+cH4zElo+kTahKHbSNxDxFs3HigVXaLvtiYDp77r8BchDW4AEvhg
 yqyuoNXSJheUbLO7anFnHATQjtRGUfv+PRSayfilxb3gcAD6kSVPE5VhVAoIrp/n6KYbIM4Qt
 QCIydNy0fjVDARlrDzfUF1PhNueK0eC7tVjRPTGfKl3uCu5lQBzV+6RtHHkJFSXp9t1OwMr9S
 sPKs9KWssBR0ySfnDBEtsSx22l68hXte58hy82dgRTJ+GnZm77vsvL1EDp5xdlyMol3XzOIMp
 5m1N2QkVvJjIzGZxq2fLESt57zDkxUjv3xDqhXad1yxAC/QQlGURvKP6dBFZQRAXkMPtkPj0c
 qcgz7v1y2opqSpKxDfL6n5V1X+W9Le/v9qHuuoVOt7uJVgmpFE9Bw6qgZCz0Ou/Gj3Ct1SVVE
 J/ZxYIWrLxkh5daxB2l/4LtMtcXtIHEoeMKyFJ8rAr/yaGeL+BCW5mzyzOzSz3bEhdp0DYo++
 wRbUCo7DX7EB0kRZbMB2wKz6AuqMQh4VyXC6lBrOTGVZewzmAaQjXfRAhjP4qMv12t2vvWJDi
 nBBkqEpXoQzXsKgiHcEfEv/VKBXcvjc/NyGJQhnxoqsyX2boaMtQALwfRTqOOeta5YmCZ1rCa
 Gd6khAHpK5cQ6P5e0k5ee8iEJpKP/p8U7iEgl08+IrdgJW81kWQ4elKfO9ydlB9g0l8I+/PyY
 WnP92fq6SSy592JpSJ7fJ2XqBMTn7D4XXwtZPttMnkfwoxbAdkUvYmUPNrmLK5XueKSRYFt6Z
 9e7GapX2XWse6MCAhl9pz7SDjCmPmBZRwR6I9OUz92dxQ6LXqF0HEOhp+MS1ReTu1UNqvT4
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
 linux-block <linux-block@vger.kernel.org>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 6:38 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I wonder if we should do something like
>
> SYSCALL_DECLARE3(readv, unsigned long, fd, const struct iovec __user *, vec,
>                  unsigned long, vlen);
> in syscalls.h instead, and not under that ifdef.
>
> Let it expand to declaration of sys_...() in generic case and, on x86, into
> __do_sys_...() and __ia32_sys_...()/__x64_sys_...(), with types matching
> what SYSCALL_DEFINE ends up using.
>
> Similar macro would cover compat_sys_...() declarations.  That would
> restore mismatch checking for x86 and friends.  AFAICS, the cost wouldn't
> be terribly high - cpp would have more to chew through in syscalls.h,
> but it shouldn't be all that costly.  Famous last words, of course...
>
> Does anybody see fundamental problems with that?

I've had some ideas along those lines in the past and I think it should work.

As a variation of this, the SYSCALL_DEFINEx() macros could go away
entirely, leaving only the macro instantiations from the header to
require that syntax. It would require first changing the remaining
architectures to build the syscall table from C code instead of
assembler though.

Regardless of that, another advantage of having the SYSCALL_DECLAREx()
would be the ability to include that header file from elsewhere with a different
macro definition to create a machine-readable version of the interface when
combined with the syscall.tbl files. This could be used to create a user
space stub for calling into the low-level syscall regardless of the
libc interfaces,
or for synchronizing the interfaces with strace, qemu-user, or anything that
needs to deal with the low-level interface.

      Arnd
