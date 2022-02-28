Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDC4C7A57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6sQr1xFSz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 07:28:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Y+K+LAch;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Y+K+LAch; 
 dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6sQ753ywz3bT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 07:27:59 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id bq11so19271185edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
 b=Y+K+LAchMzIcesbCiqrzhisJgvbUIKYh3oFG/AlZJTKul1K9rRfHylHsN/EgM8hdwz
 P3hABFpC0Wcw+/0V4cKR5X0P787Wy9QwMeL5ORY50P9+oNZqmMp6NkFq4yV6NAIkP79C
 0bvk8ZnwfFSPqzKfD7Qqea+fs2YLRTaNcLanw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
 b=KgzoK29JSTaTlDd9hle8Dyutd5ir7ZkSVxU5JF3Xj6qdYE084+7kslWOKsdZfV8jUe
 csAVT7eI0U8Wg0eWlJWiwZJZ4s7bEY6TczMKRyFXpaDuhhGetnNHRKFUlU98MkbVtJQh
 RNB2lQBMFBSv6e36pxeCQs/vwa4isfmF1WwgeKNjoQSSf4rbKRPdOcZouNuPTMYcRypO
 J8Uppq34yZ8zK84zVA4yRh6F1FLb9lrUVrClJ4g0pTnRc6O0m2zuqQxCCpDVDpMirXIq
 xqta8Q5Dtnt1wng+qUru4sz3ZAV3gkwtzjAcRy6Fu3XljDxihFToIidIR5VzWBU1vBwi
 uHJw==
X-Gm-Message-State: AOAM531qjKvBJj5f5PrC8ToSjN78/aeeLNzAcgpGtvecNEWy0f4taPg3
 GG1tArQfFF8GHyxpUMDy2noqRmD5/k4d07kHYJg=
X-Google-Smtp-Source: ABdhPJx4vAKpgcEXAu3t5hX/rU0KEwATqxcZJR+FIBLpynncF1qpfudmhm9wsU1el0oViXrBAVZEwQ==
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr21238400eda.203.1646080076022; 
 Mon, 28 Feb 2022 12:27:56 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm4634453ejh.214.2022.02.28.12.27.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:27:55 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id p14so27169628ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:27:55 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr7653619lfm.27.1646078630855; Mon, 28 Feb
 2022 12:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
In-Reply-To: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:03:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 11:56 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do wish we could actually poison the 'pos' value after the loop
> somehow - but clearly the "might be uninitialized" I was hoping for
> isn't the way to do it.

Side note: we do need *some* way to do it.

Because if we make that change, and only set it to another pointer
when not the head, then we very much change the semantics of
"list_for_each_head()". The "list was empty" case would now exit with
'pos' not set at all (or set to NULL if we add that). Or it would be
set to the last entry.

And regardless, that means that all the

        if (pos == head)

kinds of checks after the loop would be fundamentally broken.

Darn. I really hoped for (and naively expected) that we could actually
have the compiler warn about the use-after-loop case. That whole
"compiler will now complain about bad use" was integral to my clever
plan to use the C99 feature of declaring the iterator inside the loop.

But my "clever plan" was apparently some ACME-level Wile E. Coyote sh*t.

Darn.

                   Linus
