Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2643363A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 19:12:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HhRx4pR2zDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 03:11:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="WxopflXf"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HhQd0Vd1zDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 03:10:48 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id t28so5836544lje.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+yPhSShogh4P3ENVap3W5oMkAXveVWtK8AHmfJ6K4g=;
 b=WxopflXf16/Ij+BgtcycHtZ4Hmf9aaeOSPmXtzqGSQ8pDwEzPIMOBMYFkAoo4wEYeT
 8VeRq+J0v+JDAfheb+586kInV+Sa1f85J5zB8gURyeRKoOLNnlPfX9pmOGSsXGwefMUi
 0J3B6sJE1Hr8n5WVFsXQ5gn72CRPCxqM1IM0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+yPhSShogh4P3ENVap3W5oMkAXveVWtK8AHmfJ6K4g=;
 b=H+OBrC44emRVyw5sr4voCH8HmIKqPPXZG5GqDoTf+bTF96r28MHLfuo/aiQRq30LaO
 6st1f37u02loUKKjJWlN9uUlk+hNHAMIpSTfMdhyIOzV/g9YmzOJr18iKsEYqdbVt7/O
 JlcRxeo7G9YT1IJkZt9VPeM5WbAvxMArpnjxwS68Jwdvujeqg+O7DZvjWvbZkAypUJ1G
 OqN2mtj5bPtbN/lbZ5fMvbIVvHxw136INjaD2Qh+Q2pzsGO/e1dDXmKrh6O2ZBwOJqx5
 i8TTWBzg2WgEF7zHsOBLZm6pQVc0B/Nj+Zo2vZGTltDk8TOOIKlJF0zAtpbZ6iWQH/lx
 3aQw==
X-Gm-Message-State: APjAAAVXfo4Pq94rESNI2cEsvGgmC0MYwLwPBoRfUy/Pkm1raHkXZ2VN
 qY2xofIPNvkf2/hE6kKH4FMdi2XOaaU=
X-Google-Smtp-Source: APXvYqx7fW8731hZtOFw40tDQ3a1UQhCKhUWSKSjS9j2DuNVLzN0T2SioAQWFuFKWzIYC2ZFb/W44g==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr3198262lji.71.1559581840087; 
 Mon, 03 Jun 2019 10:10:40 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id k12sm3233941lfm.90.2019.06.03.10.10.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:10:39 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id a25so14218878lfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 10:10:39 -0700 (PDT)
X-Received: by 2002:a19:2d41:: with SMTP id t1mr13904609lft.79.1559581346039; 
 Mon, 03 Jun 2019 10:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-4-hch@lst.de>
 <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
 <20190603074121.GA22920@lst.de>
 <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
In-Reply-To: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 3 Jun 2019 10:02:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjU3ycY2FvhKmYmOTi95L0qSi9Hj+yrzWTAWepW-zdBOA@mail.gmail.com>
Message-ID: <CAHk-=wjU3ycY2FvhKmYmOTi95L0qSi9Hj+yrzWTAWepW-zdBOA@mail.gmail.com>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, James Hogan <jhogan@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 3, 2019 at 9:08 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The new code has no test at all for "nr_pages == 0", afaik.

Note that it really is important to check for that, because right now we do

        if (gup_fast_permitted(start, nr_pages)) {
                local_irq_save(flags);
                gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
                local_irq_restore(flags);
        }

and that gup_pgd_range() function *depends* on the range being
non-zero, and does

        pgdp = pgd_offset(current->mm, addr);
        do {
                pgd_t pgd = READ_ONCE(*pgdp);
...
        } while (pgdp++, addr = next, addr != end);

Note how a zero range would turn into an infinite range here.

And the only check for 0 was that

        if (nr_pages <= 0)
                return 0;

in get_user_pages_fast() that you removed.

(Admittedly, it would be much better to have that check in
__get_user_pages_fast() itself, because we do have callers that call
the double-underscore version)

Now, I sincerely hope that we don't have anybody that passes in a zero
nr_pages (or a negative one), but we do actually have a comment saying
it's ok.

Note that the check for "if (end < start)" not only does not check for
0, it also doesn't really check for negative. It checks for
_overflow_. Admittedly most negative values would be expected to
overflow, but it's still a very different issue.

Maybe you added the check for negative somewhere else (in another
patch), but I don't see it.

                Linus
