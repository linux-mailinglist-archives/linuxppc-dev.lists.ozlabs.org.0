Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0924CA0CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 10:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7pkG25z5z3bp0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 20:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=IQg4uBej;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=IQg4uBej; 
 dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7pjZ6QH0z2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 20:29:38 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id u11so1387740lju.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XH8CYV/Z50iBLZ27uSo3DlVY0KhJ8ZO+RiecWTcYel0=;
 b=IQg4uBejV+wOE9gbvRPz3nvi4LkiiVw4YSIjC8NPteocLXX0uLpiZyGXJ60leACu72
 E2mMgbaj2BDeYnhoOw0DKPRcT2bjIlB4yRTWQZ65OcYRTHhlWzgeq8LyFprIEpiij6N8
 YNaymndxJaFKphqyYHlKdyPolm4uaJOX+WJuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XH8CYV/Z50iBLZ27uSo3DlVY0KhJ8ZO+RiecWTcYel0=;
 b=w6TJOc12LwUhapWkWwnJugHr645sKNw7D7/sAJ0R0lWpRxPMUGzamr0YswRr0FOR5y
 aFitxkKswxgdbJ8fpeqDSraNW68IxgjITeebHrI9hh/u4EAAN02FgQSqobMSRt0+xT5X
 rV9zLrrCCInRSc6EHXFUCWqVhudo9djirt1ykX/8e9PsCaABGIZCteXM80286wwX/d9g
 pog3pvHRe07NferHWtZZwiWbY3KDr16d1H1Q73Hi4QiuK5RKZ+PMGmFRm5v3XrqsIDLI
 gopbXPwQkYb567yLqhIgfNGPFITRBkRIHrq80A3DjZn4Lvm4ZN9v3md3VHYjzB6904KX
 h/fA==
X-Gm-Message-State: AOAM532FXaDqp5fyWQp628r/8sOsL6HTdQksab8Xb4TlgI9fFwn6LCdL
 pr0LH6yuCsH5hgfTOpJe1rVBhA==
X-Google-Smtp-Source: ABdhPJxPRWTwhfDKGEWi/HTZUmtnN6xoKL1T2KNwEAF9KgB2sMMXSt6lke7BfBVtPRIEaNMyntkyzw==
X-Received: by 2002:a2e:3c0d:0:b0:246:3c52:7ada with SMTP id
 j13-20020a2e3c0d000000b002463c527adamr19885072lja.459.1646213374808; 
 Wed, 02 Mar 2022 01:29:34 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id
 f36-20020a0565123b2400b0043795432e87sm1960430lfv.150.2022.03.02.01.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 01:29:33 -0800 (PST)
Message-ID: <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
Date: Wed, 2 Mar 2022 10:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
 <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
 <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/03/2022 00.55, Linus Torvalds wrote:
> On Tue, Mar 1, 2022 at 3:19 PM David Laight <David.Laight@aculab.com> wrote:
>>

> With the "don't use iterator outside the loop" approach, the exact
> same code works in both the old world order and the new world order,
> and you don't have the semantic confusion. And *if* you try to use the
> iterator outside the loop, you'll _mostly_ (*) get a compiler warning
> about it not being initialized.
> 
>              Linus
> 
> (*) Unless somebody initializes the iterator pointer pointlessly.
> Which clearly does happen. Thus the "mostly". It's not perfect, and
> that's most definitely not nice - but it should at least hopefully
> make it that much harder to mess up.

This won't help the current issue (because it doesn't exist and might
never), but just in case some compiler people are listening, I'd like to
have some sort of way to tell the compiler "treat this variable as
uninitialized from here on". So one could do

#define kfree(p) do { __kfree(p); __magic_uninit(p); } while (0)

with __magic_uninit being a magic no-op that doesn't affect the
semantics of the code, but could be used by the compiler's "[is/may be]
used uninitialized" machinery to flag e.g. double frees on some odd
error path etc. It would probably only work for local automatic
variables, but it should be possible to just ignore the hint if p is
some expression like foo->bar or has side effects. If we had that, the
end-of-loop test could include that to "uninitialize" the iterator.

Maybe sparse/smatch or some other static analyzer could implement such a
magic thing? Maybe it's better as a function attribute
[__attribute__((uninitializes(1)))] to avoid having to macrofy all
functions that release resources.

Rasmus
