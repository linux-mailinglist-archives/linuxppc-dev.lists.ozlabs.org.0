Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323A4C8005
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zYF0XbYz3bmT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:04:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=avIYh8aQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=avIYh8aQ; 
 dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zXb4XZ5z2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:03:57 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id g39so24260063lfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 17:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
 b=avIYh8aQ2dDobwKAVUmxzj/7dS14/rGtEVGY0pMiaJUsHbP3qIU6kno3XMfBz/RlQM
 DBr9tOtZ8iqO/uKNwSujAwo9mle8zBl2HT1HDuvvvRH+Bqr8BYPzCJojUUOk2VYbR5wW
 hMzIeM3di7snjNNfrAaBZvtX47IfluwYB/RPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
 b=OBO7e0hpgbwG7wVl1AfyuzeS+h24q/L8p4ByOR1yw8YbTL7+kRbU2YYHHjSLsypzzg
 YLYvR8TgALDti8+49k4NsIljp7KMsCn0WKxWO0uksGp7mc7FJKmkuxGIQto46c6l5Lcr
 zqkLS0+NrATHEqjx0oUvdAvrLghJ7z/j4bHaC7MvPvNIri0uoZygwC+xyIE8VlzEvCkB
 Sa0XgEp1xlwkYGeGaVZxHaXPgbIvrZtNIQANHwJbgeurhS0VhJEv2LiEoAekUAKYs0S2
 Iq49CewJCP5alw9NDWa5gaxK7Q4Jnp6Vs6c0bdprejaX06I2+7OZuvHh08QAbwLFdW1n
 yFrQ==
X-Gm-Message-State: AOAM530h587dyyvzQZH2nEA8V2Sn4cWvL87AJM+YbHZMws0uAcUbDHVP
 3F/z6RxcGeMsjDkuusB+k6WMLibvsDSGpjlZnro=
X-Google-Smtp-Source: ABdhPJyYJZqKl/NGGhTFu1HRA2loV9ygcHIKh5+HXMsrzD5vRtJ9PKHadNZL2iMfj8reJEelrFze9A==
X-Received: by 2002:a19:761a:0:b0:43c:79ae:6aef with SMTP id
 c26-20020a19761a000000b0043c79ae6aefmr14728760lff.630.1646096634841; 
 Mon, 28 Feb 2022 17:03:54 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 f7-20020ac24e47000000b00443591e0d63sm1215503lfr.189.2022.02.28.17.03.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 17:03:54 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id g39so24259974lfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 17:03:54 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr14803965lfb.449.1646096282839; Mon, 28
 Feb 2022 16:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:57:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Matthew Wilcox <willy@infradead.org>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 4:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, except that's ugly beyond belief, plus it's literally not what
> we do in the kernel.

(Of course, I probably shouldn't have used 'min()' as an example,
because that is actually one of the few places where we do exactly
that, using our __UNIQUE_ID() macros. Exactly because people _have_
tried to do -Wshadow when doing W=2).

                 Linus
